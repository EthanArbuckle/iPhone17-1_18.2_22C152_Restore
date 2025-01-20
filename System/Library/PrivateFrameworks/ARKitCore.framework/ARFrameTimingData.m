@interface ARFrameTimingData
- (ARFrameTimingData)init;
- (NSDictionary)timestamps;
- (double)videoLatency;
- (void)addTimestamp:(double)a3 forDataOfClass:(Class)a4;
- (void)setVideoLatency:(double)a3;
@end

@implementation ARFrameTimingData

- (ARFrameTimingData)init
{
  v6.receiver = self;
  v6.super_class = (Class)ARFrameTimingData;
  v2 = [(ARFrameTimingData *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    timestampsByDataClassKey = v2->_timestampsByDataClassKey;
    v2->_timestampsByDataClassKey = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (NSDictionary)timestamps
{
  return (NSDictionary *)self->_timestampsByDataClassKey;
}

- (void)addTimestamp:(double)a3 forDataOfClass:(Class)a4
{
  NSStringFromClass(a4);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  int v6 = [v13 hasPrefix:@"AR"];
  int v7 = [v13 hasSuffix:@"Data"];
  uint64_t v8 = [v13 length];
  uint64_t v9 = v8 - 4;
  if (!v7) {
    uint64_t v9 = v8;
  }
  if (v6) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 0;
  }
  v11 = objc_msgSend(v13, "substringWithRange:", v10, v9 - v10);
  v12 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)self->_timestampsByDataClassKey setObject:v12 forKeyedSubscript:v11];
}

- (double)videoLatency
{
  return self->_videoLatency;
}

- (void)setVideoLatency:(double)a3
{
  self->_videoLatency = a3;
}

- (void).cxx_destruct
{
}

@end