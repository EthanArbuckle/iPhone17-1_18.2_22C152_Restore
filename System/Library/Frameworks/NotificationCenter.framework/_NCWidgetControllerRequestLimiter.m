@interface _NCWidgetControllerRequestLimiter
+ (id)sharedInstance;
- (BOOL)isRequestPermitted;
@end

@implementation _NCWidgetControllerRequestLimiter

- (BOOL)isRequestPermitted
{
  v3 = [MEMORY[0x263EFF910] date];
  p_lastRequestDate = &self->_lastRequestDate;
  lastRequestDate = self->_lastRequestDate;
  if (!lastRequestDate)
  {
    objc_storeStrong((id *)&self->_lastRequestDate, v3);
    lastRequestDate = *p_lastRequestDate;
  }
  [(NSDate *)v3 timeIntervalSinceDate:lastRequestDate];
  if (v6 <= 1.0)
  {
    int64_t requestCount = self->_requestCount;
    self->_int64_t requestCount = requestCount + 1;
    BOOL isThrottled = self->_isThrottled;
    BOOL v11 = self->_isThrottled;
    uint64_t v12 = 10;
    if (self->_isThrottled) {
      uint64_t v12 = 2;
    }
    BOOL v8 = requestCount < v12;
    if (requestCount >= v12) {
      BOOL v11 = 1;
    }
    self->_BOOL isThrottled = v11;
    if (!isThrottled && requestCount >= v12)
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      NSLog(&cfstr_TooManyRequest.isa, v14);

      BOOL v8 = 0;
    }
  }
  else
  {
    self->_int64_t requestCount = 0;
    if (v6 > 5.0 && self->_isThrottled) {
      self->_BOOL isThrottled = 0;
    }
    BOOL v8 = 1;
  }
  v15 = *p_lastRequestDate;
  *p_lastRequestDate = v3;

  return v8;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51___NCWidgetControllerRequestLimiter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance___sharedInstance;

  return v2;
}

- (void).cxx_destruct
{
}

@end