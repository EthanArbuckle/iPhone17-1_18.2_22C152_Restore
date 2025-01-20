@interface MOVStreamSampleTimeList
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeAtIndex:(SEL)a3;
- ($69C59A32909E13F94AB58097350E6BB9)timeRangeFrom:(SEL)a3 to:(unint64_t)a4;
- (MOVStreamSampleTimeList)init;
- (MOVStreamSampleTimeList)initWithTimes:(const void *)a3;
- (NSArray)cached_cmtimes;
- (NSArray)cached_times;
- (NSArray)cmtimes;
- (NSArray)times;
- (NSString)name;
- (_NSRange)frameRangeFrom:(id *)a3 to:(id *)a4;
- (id).cxx_construct;
- (id)description;
- (unint64_t)count;
- (void)setName:(id)a3;
@end

@implementation MOVStreamSampleTimeList

- (MOVStreamSampleTimeList)initWithTimes:(const void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MOVStreamSampleTimeList;
  v4 = [(MOVStreamSampleTimeList *)&v8 init];
  p_times = (char *)&v4->_times;
  if (v4) {
    BOOL v6 = p_times == a3;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    std::vector<CMTime>::__assign_with_size[abi:ne180100]<CMTime*,CMTime*>(p_times, *(char **)a3, *((void *)a3 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3));
  }
  return v4;
}

- (MOVStreamSampleTimeList)init
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = +[MIOLog defaultLog];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    int v7 = 138543362;
    objc_super v8 = v5;
    _os_log_impl(&dword_21B5ED000, v3, OS_LOG_TYPE_ERROR, "❌ ERROR: Do not call -[%{public}@ init].", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:4];
  begin = self->_times.__begin_;
  end = self->_times.__end_;
  if (begin == end)
  {
    uint64_t v9 = self->_times.__begin_;
  }
  else
  {
    unint64_t v6 = 1;
    do
    {
      if (v6 != 1)
      {
        [v3 appendString:@", "];
        if (v6 > 4) {
          break;
        }
      }
      CMTimeEpoch v7 = *((void *)begin + 2);
      *(_OWORD *)&time.value = *(_OWORD *)begin;
      time.epoch = v7;
      objc_super v8 = [NSNumber numberWithDouble:CMTimeGetSeconds(&time)];
      [v3 appendFormat:@"%@", v8];

      begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24);
      ++v6;
    }
    while (begin != end);
    begin = self->_times.__begin_;
    uint64_t v9 = self->_times.__end_;
  }
  v10 = [(MOVStreamSampleTimeList *)self name];
  if ([v10 length])
  {
    v11 = NSString;
    v12 = [(MOVStreamSampleTimeList *)self name];
    [v11 stringWithFormat:@" name=%@", v12];
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = &stru_26CB6A778;
  }
  unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((v9 - begin) >> 3);

  v15 = NSString;
  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  v18 = [NSNumber numberWithUnsignedLong:v14];
  v19 = (void *)[v3 copy];
  if (v14 < 5)
  {
    v21 = [v15 stringWithFormat:@"<%@: %p%@ sampleCount=%@ samples=[%@]>", v17, self, v13, v18, v19];
  }
  else
  {
    v20 = [NSNumber numberWithUnsignedLong:v14 - 4];
    v21 = [v15 stringWithFormat:@"<%@: %p%@ sampleCount=%@ samples=[%@... and %@ more]>", v17, self, v13, v18, v19, v20];
  }

  return v21;
}

- (_NSRange)frameRangeFrom:(id *)a3 to:(id *)a4
{
  begin = self->_times.__begin_;
  end = self->_times.__end_;
  if (end == begin)
  {
    v13 = self->_times.__begin_;
  }
  else
  {
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
    do
    {
      v10 = (char *)begin + 24 * (v9 >> 1);
      long long v11 = *(_OWORD *)v10;
      time1.epoch = *((void *)v10 + 2);
      *(_OWORD *)&time1.value = v11;
      $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = *a3;
      int32_t v12 = CMTimeCompare(&time1, (CMTime *)&v20);
      if (v12 < 0) {
        v9 += ~(v9 >> 1);
      }
      else {
        v9 >>= 1;
      }
      if (v12 < 0) {
        begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v10 + 24);
      }
    }
    while (v9);
    end = begin;
    begin = self->_times.__begin_;
    v13 = self->_times.__end_;
  }
  if (v13 == end) {
    unint64_t v14 = 0;
  }
  else {
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
  }
  if (v13 != begin)
  {
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((v13 - begin) >> 3);
    do
    {
      v16 = (char *)begin + 24 * (v15 >> 1);
      CMTime time1 = (CMTime)*a4;
      CMTimeEpoch v17 = *((void *)v16 + 2);
      *(_OWORD *)&v20.var0 = *(_OWORD *)v16;
      v20.var3 = v17;
      if (CMTimeCompare(&time1, (CMTime *)&v20) < 0)
      {
        v15 >>= 1;
      }
      else
      {
        begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v16 + 24);
        v15 += ~(v15 >> 1);
      }
    }
    while (v15);
    v13 = begin;
    begin = self->_times.__end_;
  }
  if (begin == v13) {
    NSUInteger v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    NSUInteger v18 = 0xAAAAAAAAAAAAAAABLL * ((v13 - end) >> 3);
  }
  NSUInteger v19 = v14;
  result.length = v18;
  result.location = v19;
  return result;
}

- ($69C59A32909E13F94AB58097350E6BB9)timeRangeFrom:(SEL)a3 to:(unint64_t)a4
{
  uint64_t v6 = MEMORY[0x263F010C8];
  long long v7 = *(_OWORD *)(MEMORY[0x263F010C8] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x263F010C8];
  *(_OWORD *)&retstr->var0.var3 = v7;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v6 + 32);
  uint64_t v8 = *(void *)&self->var0.var1;
  unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((self->var0.var3 - v8) >> 3);
  if (v9 > a4)
  {
    if (v9 <= a5) {
      unint64_t v10 = v9 - 1;
    }
    else {
      unint64_t v10 = a5;
    }
    long long v11 = (long long *)(v8 + 24 * a4);
    long long v12 = *v11;
    start.epoch = *((void *)v11 + 2);
    *(_OWORD *)&start.value = v12;
    v13 = (long long *)(v8 + 24 * v10);
    long long v14 = *v13;
    v16.epoch = *((void *)v13 + 2);
    *(_OWORD *)&v16.value = v14;
    self = ($69C59A32909E13F94AB58097350E6BB9 *)CMTimeRangeFromTimeToTime(&v18, &start, &v16);
    long long v15 = *(_OWORD *)&v18.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v18.start.value;
    *(_OWORD *)&retstr->var0.var3 = v15;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&v18.duration.timescale;
  }
  return self;
}

- (NSArray)times
{
  cached_times = self->_cached_times;
  if (!cached_times)
  {
    v4 = [MEMORY[0x263EFF980] arrayWithCapacity:0xAAAAAAAAAAAAAAABLL * ((self->_times.__end_ - self->_times.__begin_) >> 3)];
    begin = self->_times.__begin_;
    for (i = self->_times.__end_; begin != i; begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24))
    {
      long long v7 = *(_OWORD *)begin;
      v12.epoch = *((void *)begin + 2);
      *(_OWORD *)&v12.value = v7;
      uint64_t v8 = [NSNumber numberWithDouble:CMTimeGetSeconds(&v12)];
      [v4 addObject:v8];
    }
    unint64_t v9 = (NSArray *)[v4 copy];
    unint64_t v10 = self->_cached_times;
    self->_cached_times = v9;

    cached_times = self->_cached_times;
  }

  return cached_times;
}

- (NSArray)cmtimes
{
  cached_cmtimes = self->_cached_cmtimes;
  if (!cached_cmtimes)
  {
    v4 = [MEMORY[0x263EFF980] arrayWithCapacity:0xAAAAAAAAAAAAAAABLL * ((self->_times.__end_ - self->_times.__begin_) >> 3)];
    begin = self->_times.__begin_;
    for (i = self->_times.__end_; begin != i; begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24))
    {
      long long v7 = [MEMORY[0x263F08D40] value:begin withObjCType:"{?=qiIq}"];
      if (v7) {
        [v4 addObject:v7];
      }
    }
    uint64_t v8 = (NSArray *)[v4 copy];
    unint64_t v9 = self->_cached_cmtimes;
    self->_cached_cmtimes = v8;

    cached_cmtimes = self->_cached_cmtimes;
  }

  return cached_cmtimes;
}

- (unint64_t)count
{
  return 0xAAAAAAAAAAAAAAABLL * ((self->_times.__end_ - self->_times.__begin_) >> 3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeAtIndex:(SEL)a3
{
  uint64_t v4 = *(void *)&self->var1;
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((self->var3 - v4) >> 3);
  uint64_t v6 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v4 + 24 * a4);
  if (v5 <= a4) {
    long long v7 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)MEMORY[0x263F01098];
  }
  else {
    long long v7 = v6;
  }
  *retstr = *v7;
  return self;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSArray)cached_times
{
  return self->_cached_times;
}

- (NSArray)cached_cmtimes
{
  return self->_cached_cmtimes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cached_cmtimes, 0);
  objc_storeStrong((id *)&self->_cached_times, 0);
  objc_storeStrong((id *)&self->_name, 0);
  begin = self->_times.__begin_;
  if (begin)
  {
    self->_times.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end