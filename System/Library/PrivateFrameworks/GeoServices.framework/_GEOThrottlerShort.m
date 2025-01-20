@interface _GEOThrottlerShort
+ (BOOL)stateIsExpired:(id)a3;
- (BOOL)addRequestTimestamp;
- (BOOL)isExpired;
- (NSString)description;
- (NSString)keyPath;
- (_GEOThrottlerShort)initWithKeyPath:(id)a3 requestCount:(unint64_t)a4 interval:(double)a5 savedState:(id)a6;
- (double)timeUntilReset;
- (double)timeWindow;
- (id).cxx_construct;
- (id)captureState;
- (id)userInfoForError;
- (unint64_t)remainingEntries;
- (unsigned)maxReqCount;
@end

@implementation _GEOThrottlerShort

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

- (unint64_t)remainingEntries
{
  if (self->_lastRequestTimes.__end_ == self->_lastRequestTimes.__begin_) {
    return -1;
  }
  GEOGetMonotonicTime();
  begin = self->_lastRequestTimes.__begin_;
  end = self->_lastRequestTimes.__end_;
  if (begin == end) {
    return 0;
  }
  unint64_t result = 0;
  double v7 = (double)(uint64_t)v3;
  do
  {
    uint64_t v8 = *(void *)begin;
    begin = (Timestamp *)((char *)begin + 8);
    if (self->_timeWindow <= v7 - (double)v8) {
      ++result;
    }
  }
  while (begin != end);
  return result;
}

- (BOOL)addRequestTimestamp
{
  if (self->_lastRequestTimes.__end_ == self->_lastRequestTimes.__begin_) {
    return 1;
  }
  GEOGetMonotonicTime();
  uint64_t currentIndex = self->_currentIndex;
  begin = self->_lastRequestTimes.__begin_;
  if ((double)(uint64_t)v3 - (double)*((uint64_t *)begin + currentIndex) >= self->_timeWindow)
  {
    *((void *)begin + currentIndex) = (uint64_t)v3;
    self->_uint64_t currentIndex = (currentIndex + 1)
                        % (unint64_t)((self->_lastRequestTimes.__end_ - begin) >> 3);
    return 1;
  }
  return 0;
}

- (double)timeUntilReset
{
  if (self->_lastRequestTimes.__end_ == self->_lastRequestTimes.__begin_) {
    return 0.0;
  }
  GEOGetMonotonicTime();
  double v4 = (double)(uint64_t)v3 - (double)*((uint64_t *)self->_lastRequestTimes.__begin_ + self->_currentIndex);
  double timeWindow = self->_timeWindow;
  double v6 = timeWindow - v4;
  BOOL v7 = v4 < timeWindow;
  double result = 0.0;
  if (v7) {
    return v6;
  }
  return result;
}

- (BOOL)isExpired
{
  begin = self->_lastRequestTimes.__begin_;
  uint64_t v3 = self->_lastRequestTimes.__end_ - begin;
  if (!v3) {
    return 1;
  }
  uint64_t v5 = v3 >> 3;
  uint64_t currentIndex = self->_currentIndex;
  if (!currentIndex) {
    uint64_t currentIndex = v5;
  }
  uint64_t v7 = currentIndex;
  while (1)
  {
    --v7;
    uint64_t v8 = *((void *)begin + v7);
    if (v8) {
      break;
    }
    if (!v7) {
      uint64_t v7 = v5;
    }
    if (v7 == currentIndex)
    {
      uint64_t v8 = 0x8000000000000000;
      break;
    }
  }
  GEOGetMonotonicTime();
  return v9 - (double)v8 > self->_timeWindow * 1.5;
}

- (id)captureState
{
  return 0;
}

- (_GEOThrottlerShort)initWithKeyPath:(id)a3 requestCount:(unint64_t)a4 interval:(double)a5 savedState:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v28.receiver = self;
  v28.super_class = (Class)_GEOThrottlerShort;
  v12 = [(_GEOThrottlerShort *)&v28 init];
  if (!v12) {
    goto LABEL_20;
  }
  uint64_t v13 = [v10 copy];
  keyPath = v12->_keyPath;
  v12->_keyPath = (NSString *)v13;

  v12->_double timeWindow = a5;
  begin = v12->_lastRequestTimes.__begin_;
  end = v12->_lastRequestTimes.__end_;
  int64_t v17 = end - begin;
  unint64_t v18 = (end - begin) >> 3;
  if (a4 <= v18)
  {
    if (a4 >= v18) {
      goto LABEL_20;
    }
    v26 = (Timestamp *)((char *)begin + 8 * a4);
LABEL_17:
    v12->_lastRequestTimes.__end_ = v26;
    goto LABEL_20;
  }
  value = v12->_lastRequestTimes.__end_cap_.__value_;
  if (a4 - v18 <= (value - end) >> 3)
  {
    memset_pattern16(v12->_lastRequestTimes.__end_, &unk_18A639AB0, ((8 * a4 - v17 - 8) & 0xFFFFFFFFFFFFFFF8) + 8);
    v26 = (Timestamp *)((char *)end + 8 * (a4 - v18));
    goto LABEL_17;
  }
  if (a4 >> 61) {
    std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v20 = value - begin;
  unint64_t v21 = v20 >> 2;
  if (v20 >> 2 <= a4) {
    unint64_t v21 = a4;
  }
  if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v22 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v22 = v21;
  }
  if (v22 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  v23 = (char *)operator new(8 * v22);
  v24 = (Timestamp *)&v23[8 * v18];
  memset_pattern16(v24, &unk_18A639AB0, ((8 * a4 - v17 - 8) & 0xFFFFFFFFFFFFFFF8) + 8);
  while (end != begin)
  {
    uint64_t v25 = *((void *)end - 1);
    end = (Timestamp *)((char *)end - 8);
    *((void *)v24 - 1) = v25;
    v24 = (Timestamp *)((char *)v24 - 8);
  }
  v12->_lastRequestTimes.__begin_ = v24;
  v12->_lastRequestTimes.__end_ = (Timestamp *)&v23[8 * a4];
  v12->_lastRequestTimes.__end_cap_.__value_ = (Timestamp *)&v23[8 * v22];
  if (begin) {
    operator delete(begin);
  }
LABEL_20:

  return v12;
}

- (void).cxx_destruct
{
  begin = self->_lastRequestTimes.__begin_;
  if (begin)
  {
    self->_lastRequestTimes.__end_ = begin;
    operator delete(begin);
  }

  objc_storeStrong((id *)&self->_keyPath, 0);
}

- (unsigned)maxReqCount
{
  return (unint64_t)(self->_lastRequestTimes.__end_ - self->_lastRequestTimes.__begin_) >> 3;
}

- (id)userInfoForError
{
  v10[5] = *MEMORY[0x1E4F143B8];
  v9[0] = @"maxRequests";
  uint64_t v3 = [NSNumber numberWithUnsignedLong:(self->_lastRequestTimes.__end_ - self->_lastRequestTimes.__begin_) >> 3];
  v10[0] = v3;
  v9[1] = @"windowSize";
  double v4 = [NSNumber numberWithDouble:self->_timeWindow];
  v10[1] = v4;
  v9[2] = @"timeUntilReset";
  uint64_t v5 = NSNumber;
  [(_GEOThrottlerShort *)self timeUntilReset];
  double v6 = objc_msgSend(v5, "numberWithDouble:");
  v10[2] = v6;
  v10[3] = @"short";
  v9[3] = @"intervalType";
  v9[4] = @"throttler.keyPath";
  v10[4] = self->_keyPath;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v7;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" interval: %fs", *(void *)&self->_timeWindow);
  double v4 = [MEMORY[0x1E4F1CA48] array];
  GEOGetMonotonicTime();
  begin = self->_lastRequestTimes.__begin_;
  end = self->_lastRequestTimes.__end_;
  if (end != begin)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    unint64_t v10 = (end - begin) >> 3;
    double v11 = (double)(uint64_t)v5;
    do
    {
      uint64_t v12 = *((void *)begin + (v8 + v10 + self->_currentIndex) % v10);
      if (v12)
      {
        uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%fs", (double)v12 - v11);
        [v4 addObject:v13];

        begin = self->_lastRequestTimes.__begin_;
        end = self->_lastRequestTimes.__end_;
      }
      ++v9;
      unint64_t v10 = (end - begin) >> 3;
      --v8;
    }
    while (v9 < v10);
  }
  [v3 appendString:@" ages: {"];
  v14 = [v4 componentsJoinedByString:@", "];
  [v3 appendString:v14];

  [v3 appendString:@"}"];

  return (NSString *)v3;
}

+ (BOOL)stateIsExpired:(id)a3
{
  return 1;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (double)timeWindow
{
  return self->_timeWindow;
}

@end