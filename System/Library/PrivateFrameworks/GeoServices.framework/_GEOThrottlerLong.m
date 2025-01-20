@interface _GEOThrottlerLong
+ (BOOL)stateIsExpired:(id)a3;
- (BOOL)addRequestTimestamp;
- (BOOL)isExpired;
- (NSString)description;
- (NSString)keyPath;
- (_GEOThrottlerLong)initWithKeyPath:(id)a3 requestCount:(unint64_t)a4 interval:(double)a5 savedState:(id)a6;
- (double)expiresAt;
- (double)timeUntilReset;
- (double)timeWindow;
- (id)captureState;
- (id)userInfoForError;
- (unint64_t)remainingEntries;
- (unsigned)maxReqCount;
- (void)loadState:(id)a3;
@end

@implementation _GEOThrottlerLong

- (void).cxx_destruct
{
}

- (unint64_t)remainingEntries
{
  GEOGetMonotonicTime();
  unsigned int maxRequestCount = self->_maxRequestCount;
  if (v3 - self->_lastResetTime <= self->_timeWindow) {
    maxRequestCount -= self->_currentRequestCount;
  }
  return maxRequestCount;
}

- (BOOL)addRequestTimestamp
{
  if (!self->_maxRequestCount) {
    return 1;
  }
  GEOGetMonotonicTime();
  if (v3 - self->_lastResetTime > self->_timeWindow)
  {
    self->_lastResetTime = v3;
    unsigned int v4 = 1;
LABEL_8:
    self->_unsigned int currentRequestCount = v4;
    BOOL result = 1;
    goto LABEL_9;
  }
  unsigned int currentRequestCount = self->_currentRequestCount;
  if (self->_maxRequestCount != currentRequestCount)
  {
    unsigned int v4 = currentRequestCount + 1;
    goto LABEL_8;
  }
  BOOL result = 0;
LABEL_9:
  self->_lastUseTime = v3;
  return result;
}

- (double)timeUntilReset
{
  GEOGetMonotonicTime();
  double v4 = v3 - self->_lastResetTime;
  double timeWindow = self->_timeWindow;
  double v6 = timeWindow - v4;
  BOOL v7 = v4 < timeWindow;
  double result = 0.0;
  if (v7) {
    return v6;
  }
  return result;
}

- (id)captureState
{
  v11[4] = *MEMORY[0x1E4F143B8];
  if (self->_timeWindow < 600.0
    || ([(_GEOThrottlerLong *)self timeUntilReset], v3 <= 0.0)
    || [(_GEOThrottlerLong *)self isExpired])
  {
    double v4 = 0;
  }
  else
  {
    v11[0] = &unk_1ED73DDB0;
    v10[0] = @"type";
    v10[1] = @"lastReset";
    double v6 = [NSNumber numberWithDouble:self->_lastResetTime];
    v11[1] = v6;
    v10[2] = @"currentCount";
    BOOL v7 = [NSNumber numberWithUnsignedInt:self->_currentRequestCount];
    v11[2] = v7;
    v10[3] = @"expires";
    v8 = NSNumber;
    [(_GEOThrottlerLong *)self expiresAt];
    v9 = objc_msgSend(v8, "numberWithDouble:");
    v11[3] = v9;
    double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
  }

  return v4;
}

- (BOOL)isExpired
{
  GEOGetMonotonicTime();
  double v4 = v3;
  [(_GEOThrottlerLong *)self expiresAt];
  return v4 > v5;
}

- (double)expiresAt
{
  return self->_lastUseTime + self->_timeWindow * 1.5;
}

- (_GEOThrottlerLong)initWithKeyPath:(id)a3 requestCount:(unint64_t)a4 interval:(double)a5 savedState:(id)a6
{
  unsigned int v8 = a4;
  id v10 = a3;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_GEOThrottlerLong;
  v12 = [(_GEOThrottlerLong *)&v17 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    keyPath = v12->_keyPath;
    v12->_keyPath = (NSString *)v13;

    v12->_unsigned int maxRequestCount = v8;
    v12->_double timeWindow = a5;
    v12->_unsigned int currentRequestCount = 0;
    GEOGetMonotonicTime();
    v12->_lastResetTime = v15;
    [(_GEOThrottlerLong *)v12 loadState:v11];
  }

  return v12;
}

- (void)loadState:(id)a3
{
  id v9 = a3;
  if (([(id)objc_opt_class() stateIsExpired:v9] & 1) == 0)
  {
    double v4 = [v9 objectForKeyedSubscript:@"currentCount"];
    double v5 = [v9 objectForKeyedSubscript:@"lastReset"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v6 = [v4 unsignedIntValue];
        unsigned int maxRequestCount = self->_maxRequestCount;
        if (v6 < maxRequestCount) {
          unsigned int maxRequestCount = [v4 unsignedIntValue];
        }
        self->_unsigned int currentRequestCount = maxRequestCount;
        [v5 doubleValue];
        self->_lastResetTime = v8;
      }
    }
  }
}

+ (BOOL)stateIsExpired:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v4 = [v3 objectForKeyedSubscript:@"expires"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = [v3 objectForKeyedSubscript:@"lastReset"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        GEOGetMonotonicTime();
        double v7 = v6;
        [v4 doubleValue];
        double v9 = v8;
        [v5 doubleValue];
        BOOL v11 = v7 < v10 || v7 > v9;
      }
      else
      {
        BOOL v11 = 1;
      }
    }
    else
    {
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (unsigned)maxReqCount
{
  return self->_maxRequestCount;
}

- (id)userInfoForError
{
  v10[5] = *MEMORY[0x1E4F143B8];
  v9[0] = @"maxRequests";
  id v3 = [NSNumber numberWithUnsignedInt:self->_maxRequestCount];
  v10[0] = v3;
  v9[1] = @"windowSize";
  double v4 = [NSNumber numberWithDouble:self->_timeWindow];
  v10[1] = v4;
  v9[2] = @"timeUntilReset";
  double v5 = NSNumber;
  [(_GEOThrottlerLong *)self timeUntilReset];
  double v6 = objc_msgSend(v5, "numberWithDouble:");
  v10[2] = v6;
  v10[3] = @"long";
  v9[3] = @"intervalType";
  v9[4] = @"throttler.keyPath";
  void v10[4] = self->_keyPath;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v7;
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" interval: %fs", *(void *)&self->_timeWindow);
  objc_msgSend(v3, "appendFormat:", @" max count: %d", self->_maxRequestCount);
  GEOGetMonotonicTime();
  objc_msgSend(v3, "appendFormat:", @" age: %fs", v4 - self->_lastResetTime);
  objc_msgSend(v3, "appendFormat:", @" count: %d", self->_currentRequestCount);

  return (NSString *)v3;
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