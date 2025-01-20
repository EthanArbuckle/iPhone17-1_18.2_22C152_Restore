@interface APDeviceLockedTask
+ (BOOL)deviceUnlockedSinceBoot;
- (APDeviceLockedTask)initWithHandler:(id)a3;
- (id)taskHandler;
- (void)_registerForLockStateNotification;
@end

@implementation APDeviceLockedTask

+ (BOOL)deviceUnlockedSinceBoot
{
  return MKBDeviceUnlockedSinceBoot() != 0;
}

- (APDeviceLockedTask)initWithHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APDeviceLockedTask;
  v5 = [(APDeviceLockedTask *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id taskHandler = v5->_taskHandler;
    v5->_id taskHandler = v6;

    [(APDeviceLockedTask *)v5 _registerForLockStateNotification];
  }

  return v5;
}

- (void)_registerForLockStateNotification
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D70D3F20;
  aBlock[3] = &unk_1E6A6B950;
  aBlock[4] = self;
  objc_copyWeak(&v13, &location);
  v3 = _Block_copy(aBlock);
  id v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v5 = dispatch_queue_create("com.apple.ap.unlocknotification", v4);

  if (notify_register_dispatch((const char *)*MEMORY[0x1E4FA77B8], &dword_1EB789428, v5, v3))
  {
    v6 = APLogForCategory(0x11uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_opt_class();
      *(_DWORD *)buf = 138477827;
      v16 = v7;
      id v8 = v7;
      _os_log_impl(&dword_1D70B2000, v6, OS_LOG_TYPE_ERROR, "[%{private}@]: Failed to register for springboard lock state events", buf, 0xCu);
    }
    dword_1EB789428 = -1;
  }
  else
  {
    objc_super v9 = APLogForCategory(0x11uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      *(_DWORD *)buf = 138477827;
      v16 = v10;
      id v11 = v10;
      _os_log_impl(&dword_1D70B2000, v9, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Registered for springboard lock state events.", buf, 0xCu);
    }
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (id)taskHandler
{
  return self->_taskHandler;
}

- (void).cxx_destruct
{
}

@end