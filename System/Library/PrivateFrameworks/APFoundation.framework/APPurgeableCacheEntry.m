@interface APPurgeableCacheEntry
- (APPurgeableCacheEntry)initWithObject:(id)a3;
- (APPurgeableCacheObjectP)object;
- (double)timestamp;
- (void)setObject:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation APPurgeableCacheEntry

- (APPurgeableCacheEntry)initWithObject:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APPurgeableCacheEntry;
  v6 = [(APPurgeableCacheEntry *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_object, a3);
    v8 = [MEMORY[0x1E4F1C9C8] date];
    [v8 timeIntervalSinceReferenceDate];
    v7->_timestamp = v9;
  }
  return v7;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (APPurgeableCacheObjectP)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end