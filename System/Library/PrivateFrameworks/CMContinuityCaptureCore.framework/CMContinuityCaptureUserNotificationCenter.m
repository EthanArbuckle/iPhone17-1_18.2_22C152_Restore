@interface CMContinuityCaptureUserNotificationCenter
+ (id)sharedInstance;
+ (void)invalidate;
- (CMContinuityCaptureUserNotificationCenter)initWithQueue:(id)a3;
- (id)description;
@end

@implementation CMContinuityCaptureUserNotificationCenter

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_9);
  }
  v2 = (void *)_notificationCenter;
  return v2;
}

void __59__CMContinuityCaptureUserNotificationCenter_sharedInstance__block_invoke()
{
  v0 = [CMContinuityCaptureiOSNotificationCenter alloc];
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.continuitycapture.usernotification", v4);
  uint64_t v2 = [(CMContinuityCaptureiOSNotificationCenter *)v0 initWithQueue:v1];
  v3 = (void *)_notificationCenter;
  _notificationCenter = v2;
}

+ (void)invalidate
{
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  if (_notificationCenter) {
    [(id)_notificationCenter invalidate];
  }
  objc_sync_exit(obj);
}

- (CMContinuityCaptureUserNotificationCenter)initWithQueue:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CMContinuityCaptureUserNotificationCenter;
  v3 = [(CMContinuityCaptureUserNotificationCenter *)&v7 init];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@: [%p]", v5, self];

  return v6;
}

@end