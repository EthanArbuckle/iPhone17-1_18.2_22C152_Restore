@interface CMContinuityCaptureUserOnboarding
+ (id)sharedInstance;
+ (id)stateToString:(int64_t)a3;
+ (void)invalidate;
- (BOOL)invalidated;
- (BOOL)logTryItNowAnalytics;
- (CMContinuityCaptureUserOnboarding)initWithQueue:(id)a3;
- (id)description;
- (int64_t)state;
- (void)setLogTryItNowAnalytics:(BOOL)a3;
@end

@implementation CMContinuityCaptureUserOnboarding

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)_userOnboarding;
  return v2;
}

void __51__CMContinuityCaptureUserOnboarding_sharedInstance__block_invoke()
{
  v0 = [CMContinuityCaptureUserOnboarding alloc];
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.continuitycapture.useronboarding", v4);
  uint64_t v2 = [(CMContinuityCaptureUserOnboarding *)v0 initWithQueue:v1];
  v3 = (void *)_userOnboarding;
  _userOnboarding = v2;
}

- (CMContinuityCaptureUserOnboarding)initWithQueue:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CMContinuityCaptureUserOnboarding;
  v3 = [(CMContinuityCaptureUserOnboarding *)&v7 init];
  v4 = v3;
  if (v3)
  {
    [(CMContinuityCaptureUserOnboarding *)v3 willChangeValueForKey:@"state"];
    v4->_state = 3;
    [(CMContinuityCaptureUserOnboarding *)v4 didChangeValueForKey:@"state"];
    v5 = v4;
  }

  return v4;
}

- (BOOL)logTryItNowAnalytics
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL logTryItNowAnalytics = v2->_logTryItNowAnalytics;
  objc_sync_exit(v2);

  return logTryItNowAnalytics;
}

- (void)setLogTryItNowAnalytics:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL logTryItNowAnalytics = a3;
  objc_sync_exit(obj);
}

+ (void)invalidate
{
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  if (_userOnboarding && ([(id)_userOnboarding invalidated] & 1) == 0) {
    [(id)_userOnboarding _invalidate];
  }
  objc_sync_exit(obj);
}

+ (id)stateToString:(int64_t)a3
{
  if ((unint64_t)a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unexpected onboarding state %d", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_264C994D8[a3];
  }
  return v3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@: [%p]", v5, self];

  return v6;
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientProcessPIDByBundleIDWithStreamIntent, 0);
  objc_storeStrong((id *)&self->_pairedActiveProcessPIDsByBundleID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end