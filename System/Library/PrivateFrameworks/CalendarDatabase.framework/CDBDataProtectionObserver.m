@interface CDBDataProtectionObserver
+ (NSString)stateChangedNotificationName;
- (BOOL)dataIsAccessible;
- (CDBDataProtectionObserver)init;
- (CalDeviceLockObserver)deviceLockObserver;
- (id)stateChangedCallback;
- (void)_deviceLockStateChanged;
- (void)setDeviceLockObserver:(id)a3;
- (void)setStateChangedCallback:(id)a3;
@end

@implementation CDBDataProtectionObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceLockObserver, 0);
  objc_storeStrong(&self->_stateChangedCallback, 0);
}

- (CDBDataProtectionObserver)init
{
  v12.receiver = self;
  v12.super_class = (Class)CDBDataProtectionObserver;
  v2 = [(CDBDataProtectionObserver *)&v12 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    id v3 = objc_alloc(MEMORY[0x1E4F576F0]);
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    v8 = __33__CDBDataProtectionObserver_init__block_invoke;
    v9 = &unk_1E5D60EE8;
    objc_copyWeak(&v10, &location);
    v4 = (void *)[v3 initWithStateChangedCallback:&v6];
    -[CDBDataProtectionObserver setDeviceLockObserver:](v2, "setDeviceLockObserver:", v4, v6, v7, v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setDeviceLockObserver:(id)a3
{
}

- (void)setStateChangedCallback:(id)a3
{
}

+ (NSString)stateChangedNotificationName
{
  return (NSString *)[MEMORY[0x1E4F576F0] stateChangedNotificationName];
}

- (BOOL)dataIsAccessible
{
  v2 = [(CDBDataProtectionObserver *)self deviceLockObserver];
  char v3 = [v2 hasBeenUnlockedSinceBoot];

  return v3;
}

- (CalDeviceLockObserver)deviceLockObserver
{
  return self->_deviceLockObserver;
}

void __33__CDBDataProtectionObserver_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _deviceLockStateChanged];
}

- (void)_deviceLockStateChanged
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v3 = (void *)CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    [(CDBDataProtectionObserver *)self dataIsAccessible];
    v5 = CalBooleanAsString();
    int v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1A8E81000, v4, OS_LOG_TYPE_DEBUG, "Device lock state changed.  New 'dataIsAccessible' state: [%@].", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = [(CDBDataProtectionObserver *)self stateChangedCallback];
  uint64_t v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }
}

- (id)stateChangedCallback
{
  return self->_stateChangedCallback;
}

@end