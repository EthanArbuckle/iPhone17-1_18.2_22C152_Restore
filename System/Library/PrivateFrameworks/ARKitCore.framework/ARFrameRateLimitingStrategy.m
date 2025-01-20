@interface ARFrameRateLimitingStrategy
- (ARFrameRateLimitingStrategy)initWithFrameRate:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldProcessData:(id)a3;
- (BOOL)shouldRequestResultDataAtTimestamp:(double)a3 context:(id)a4;
- (NSString)description;
@end

@implementation ARFrameRateLimitingStrategy

- (ARFrameRateLimitingStrategy)initWithFrameRate:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ARFrameRateLimitingStrategy;
  v4 = [(ARFrameRateLimitingStrategy *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_frameRate = a3;
    v6 = [[ARCircularArray alloc] initWithCapacity:5];
    mostRecentTimestamps = v5->_mostRecentTimestamps;
    v5->_mostRecentTimestamps = v6;

    v5->_mostRecentTimestampsLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (BOOL)shouldProcessData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    p_mostRecentTimestampsLock = &self->_mostRecentTimestampsLock;
    os_unfair_lock_lock(&self->_mostRecentTimestampsLock);
    objc_opt_class();
    objc_opt_isKindOfClass();
    [v4 timestamp];
    double v7 = v6;
    v8 = [(ARCircularArray *)self->_mostRecentTimestamps lastObject];
    if (v8)
    {
      int64_t frameRate = self->_frameRate;
      if (!frameRate)
      {
LABEL_14:
        BOOL v15 = 0;
        goto LABEL_15;
      }
      if (frameRate < 0) {
        goto LABEL_7;
      }
      mostRecentTimestamps = self->_mostRecentTimestamps;
      v11 = [NSNumber numberWithDouble:v7];
      LOBYTE(mostRecentTimestamps) = [(ARCircularArray *)mostRecentTimestamps containsObject:v11];

      if (mostRecentTimestamps) {
        goto LABEL_7;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v8 doubleValue];
        if (v7 - v16 <= 1.0 / (double)self->_frameRate) {
          goto LABEL_14;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_14;
        }
        v17 = self->_mostRecentTimestamps;
        v18 = [NSNumber numberWithDouble:v7];
        LODWORD(v17) = [(ARCircularArray *)v17 containsObject:v18];

        if (!v17) {
          goto LABEL_14;
        }
      }
    }
LABEL_7:
    v12 = self->_mostRecentTimestamps;
    v13 = [NSNumber numberWithDouble:v7];
    id v14 = [(ARCircularArray *)v12 addObject:v13];

    BOOL v15 = 1;
LABEL_15:

    os_unfair_lock_unlock(p_mostRecentTimestampsLock);
    goto LABEL_16;
  }
  BOOL v15 = 1;
LABEL_16:

  return v15;
}

- (BOOL)shouldRequestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v5 = a4;
  p_mostRecentTimestampsLock = &self->_mostRecentTimestampsLock;
  os_unfair_lock_lock(&self->_mostRecentTimestampsLock);
  mostRecentTimestamps = self->_mostRecentTimestamps;
  v8 = NSNumber;
  objc_super v9 = [v5 imageData];
  [v9 timestamp];
  v10 = objc_msgSend(v8, "numberWithDouble:");
  LOBYTE(mostRecentTimestamps) = [(ARCircularArray *)mostRecentTimestamps containsObject:v10];

  os_unfair_lock_unlock(p_mostRecentTimestampsLock);
  return (char)mostRecentTimestamps;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_frameRate == v4[1];

  return v5;
}

- (NSString)description
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_mostRecentTimestampsLock = &self->_mostRecentTimestampsLock;
  os_unfair_lock_lock(&self->_mostRecentTimestampsLock);
  id v4 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v5 = self->_mostRecentTimestamps;
  uint64_t v6 = [(ARCircularArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_super v9 = [*(id *)(*((void *)&v17 + 1) + 8 * i) description];
        [v4 addObject:v9];
      }
      uint64_t v6 = [(ARCircularArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  v10 = NSString;
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  int64_t frameRate = self->_frameRate;
  id v14 = [v4 componentsJoinedByString:@", "];
  BOOL v15 = [v10 stringWithFormat:@"<%@(%p) framerate=%li timestamps=[%@]>", v12, self, frameRate, v14, (void)v17];

  os_unfair_lock_unlock(p_mostRecentTimestampsLock);
  return (NSString *)v15;
}

- (void).cxx_destruct
{
}

@end