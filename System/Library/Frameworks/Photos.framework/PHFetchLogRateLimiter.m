@interface PHFetchLogRateLimiter
+ (PHFetchLogRateLimiter)sharedRateLimiter;
- (PHFetchLogRateLimiter)init;
- (unsigned)rateLimitedLogForDefaultLog;
- (unsigned)rateLimitedLogForErrorLog;
- (unsigned)rateLimitedLogForFaultLog;
- (unsigned)rateLimitedLogLevelForLogForLevel:(unsigned __int8)a3;
@end

@implementation PHFetchLogRateLimiter

- (unsigned)rateLimitedLogLevelForLogForLevel:(unsigned __int8)a3
{
  if (a3 == 16) {
    return [(PHFetchLogRateLimiter *)self rateLimitedLogForErrorLog];
  }
  if (a3 == 17) {
    return [(PHFetchLogRateLimiter *)self rateLimitedLogForFaultLog];
  }
  return a3;
}

+ (PHFetchLogRateLimiter)sharedRateLimiter
{
  pl_dispatch_once();
  v2 = (void *)sharedRateLimiter_pl_once_object_17;

  return (PHFetchLogRateLimiter *)v2;
}

- (unsigned)rateLimitedLogForFaultLog
{
  if ([(PFTokenBucket *)self->_faultTokenBucket removeToken]) {
    return 17;
  }

  return [(PHFetchLogRateLimiter *)self rateLimitedLogForErrorLog];
}

void __42__PHFetchLogRateLimiter_sharedRateLimiter__block_invoke()
{
  v0 = objc_alloc_init(PHFetchLogRateLimiter);
  v1 = (void *)sharedRateLimiter_pl_once_object_17;
  sharedRateLimiter_pl_once_object_17 = (uint64_t)v0;
}

- (PHFetchLogRateLimiter)init
{
  v11.receiver = self;
  v11.super_class = (Class)PHFetchLogRateLimiter;
  v2 = [(PHFetchLogRateLimiter *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F8A230]) initWithName:@"fetch log fault" capacity:5 refillPeriod:300];
    faultTokenBucket = v2->_faultTokenBucket;
    v2->_faultTokenBucket = (PFTokenBucket *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F8A230]) initWithName:@"fetch log error" capacity:20 refillPeriod:60];
    errorTokenBucket = v2->_errorTokenBucket;
    v2->_errorTokenBucket = (PFTokenBucket *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F8A230]) initWithName:@"fetch log default" capacity:40 refillRate:1];
    defaultTokenBucket = v2->_defaultTokenBucket;
    v2->_defaultTokenBucket = (PFTokenBucket *)v7;

    v9 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTokenBucket, 0);
  objc_storeStrong((id *)&self->_errorTokenBucket, 0);

  objc_storeStrong((id *)&self->_faultTokenBucket, 0);
}

- (unsigned)rateLimitedLogForDefaultLog
{
  return [(PFTokenBucket *)self->_defaultTokenBucket removeToken] ^ 1;
}

- (unsigned)rateLimitedLogForErrorLog
{
  if ([(PFTokenBucket *)self->_errorTokenBucket removeToken]) {
    return 16;
  }

  return [(PHFetchLogRateLimiter *)self rateLimitedLogForDefaultLog];
}

@end