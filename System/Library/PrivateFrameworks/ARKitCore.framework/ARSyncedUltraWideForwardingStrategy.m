@interface ARSyncedUltraWideForwardingStrategy
+ (BOOL)frameRateLimitAllowsProcessingThisData:(id)a3 mostRecentTimestamps:(id)a4 maxFrameRate:(int64_t)a5;
- (ARSyncedUltraWideForwardingStrategy)initWithMaxFrameRate:(int64_t)a3;
- (BOOL)shouldProcessData:(id)a3;
- (BOOL)shouldRequestResultDataAtTimestamp:(double)a3 context:(id)a4;
- (NSString)description;
@end

@implementation ARSyncedUltraWideForwardingStrategy

- (ARSyncedUltraWideForwardingStrategy)initWithMaxFrameRate:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ARSyncedUltraWideForwardingStrategy;
  v4 = [(ARSyncedUltraWideForwardingStrategy *)&v8 init];
  if (v4)
  {
    v5 = [[ARCircularArray alloc] initWithCapacity:5];
    mostRecentTimestamps = v4->_mostRecentTimestamps;
    v4->_mostRecentTimestamps = v5;

    v4->_mostRecentTimestampsLock._os_unfair_lock_opaque = 0;
    v4->_maxFrameRate = a3;
  }
  return v4;
}

- (BOOL)shouldProcessData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v10 = 1;
      goto LABEL_14;
    }
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v4;
  v7 = v6;
  if (isKindOfClass)
  {
    objc_super v8 = [v6 latestUltraWideImage];

    if (v8)
    {
      p_mostRecentTimestampsLock = &self->_mostRecentTimestampsLock;
      os_unfair_lock_lock(&self->_mostRecentTimestampsLock);
      BOOL v10 = +[ARSyncedUltraWideForwardingStrategy frameRateLimitAllowsProcessingThisData:v7 mostRecentTimestamps:self->_mostRecentTimestamps maxFrameRate:self->_maxFrameRate];
      if (v10) {
        goto LABEL_9;
      }
      goto LABEL_10;
    }
LABEL_11:
    BOOL v10 = 0;
    goto LABEL_12;
  }
  v11 = [v6 latestResizedUltraWideImageData];

  if (!v11) {
    goto LABEL_11;
  }
  p_mostRecentTimestampsLock = &self->_mostRecentTimestampsLock;
  os_unfair_lock_lock(&self->_mostRecentTimestampsLock);
  BOOL v10 = +[ARSyncedUltraWideForwardingStrategy frameRateLimitAllowsProcessingThisData:v7 mostRecentTimestamps:self->_mostRecentTimestamps maxFrameRate:self->_maxFrameRate];
  if (v10)
  {
LABEL_9:
    mostRecentTimestamps = self->_mostRecentTimestamps;
    v13 = NSNumber;
    [v7 timestamp];
    v14 = objc_msgSend(v13, "numberWithDouble:");
    id v15 = [(ARCircularArray *)mostRecentTimestamps addObject:v14];
  }
LABEL_10:
  os_unfair_lock_unlock(p_mostRecentTimestampsLock);
LABEL_12:

LABEL_14:
  return v10;
}

+ (BOOL)frameRateLimitAllowsProcessingThisData:(id)a3 mostRecentTimestamps:(id)a4 maxFrameRate:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      LOBYTE(a5) = 1;
      goto LABEL_10;
    }
  }
  objc_opt_class();
  objc_opt_isKindOfClass();
  [v7 timestamp];
  double v10 = v9;
  uint64_t v11 = [v8 lastObject];
  v12 = (void *)v11;
  if (a5 < 0)
  {
LABEL_7:
    LOBYTE(a5) = 1;
    goto LABEL_8;
  }
  if (a5)
  {
    if (v11)
    {
      v13 = [NSNumber numberWithDouble:v10];
      char v14 = [v8 containsObject:v13];

      if ((v14 & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v12 doubleValue];
          LOBYTE(a5) = v10 - v16 > 1.0 / (double)a5;
          goto LABEL_8;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v17 = [NSNumber numberWithDouble:v10];
          LOBYTE(a5) = [v8 containsObject:v17];

          goto LABEL_8;
        }
      }
    }
    goto LABEL_7;
  }
LABEL_8:

LABEL_10:
  return a5;
}

- (BOOL)shouldRequestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v5 = a4;
  p_mostRecentTimestampsLock = &self->_mostRecentTimestampsLock;
  os_unfair_lock_lock(&self->_mostRecentTimestampsLock);
  mostRecentTimestamps = self->_mostRecentTimestamps;
  id v8 = NSNumber;
  double v9 = [v5 imageData];
  [v9 timestamp];
  double v10 = objc_msgSend(v8, "numberWithDouble:");
  LOBYTE(mostRecentTimestamps) = [(ARCircularArray *)mostRecentTimestamps containsObject:v10];

  os_unfair_lock_unlock(p_mostRecentTimestampsLock);
  return (char)mostRecentTimestamps;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@(%p)>", v5, self];

  return (NSString *)v6;
}

- (void).cxx_destruct
{
}

@end