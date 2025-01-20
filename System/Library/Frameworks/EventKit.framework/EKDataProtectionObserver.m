@interface EKDataProtectionObserver
+ (NSString)stateChangedNotificationName;
- (BOOL)dataIsAccessible;
- (CDBDataProtectionObserver)dataProtectionObserver;
- (EKDataProtectionObserver)init;
- (id)stateChangedCallback;
- (void)_dataProtectionStateChanged;
- (void)setDataProtectionObserver:(id)a3;
- (void)setStateChangedCallback:(id)a3;
@end

@implementation EKDataProtectionObserver

- (BOOL)dataIsAccessible
{
  v2 = [(EKDataProtectionObserver *)self dataProtectionObserver];
  char v3 = [v2 dataIsAccessible];

  return v3;
}

+ (NSString)stateChangedNotificationName
{
  return (NSString *)[MEMORY[0x1E4F57430] stateChangedNotificationName];
}

- (EKDataProtectionObserver)init
{
  v9.receiver = self;
  v9.super_class = (Class)EKDataProtectionObserver;
  v2 = [(EKDataProtectionObserver *)&v9 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    id v3 = objc_alloc_init(MEMORY[0x1E4F57430]);
    [(EKDataProtectionObserver *)v2 setDataProtectionObserver:v3];

    uint64_t v6 = MEMORY[0x1E4F143A8];
    objc_copyWeak(&v7, &location);
    v4 = [(EKDataProtectionObserver *)v2 dataProtectionObserver];
    [v4 setStateChangedCallback:&v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (CDBDataProtectionObserver)dataProtectionObserver
{
  return self->_dataProtectionObserver;
}

- (void)setStateChangedCallback:(id)a3
{
}

- (void)setDataProtectionObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProtectionObserver, 0);

  objc_storeStrong(&self->_stateChangedCallback, 0);
}

void __32__EKDataProtectionObserver_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dataProtectionStateChanged];
}

- (void)_dataProtectionStateChanged
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = NSNumber;
  v4 = a1;
  v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(a2, "dataIsAccessible"));
  int v6 = 138412290;
  id v7 = v5;
  _os_log_debug_impl(&dword_1A4E47000, v4, OS_LOG_TYPE_DEBUG, "Data protection state changed.  New 'dataIsAccessible' state: [%@].", (uint8_t *)&v6, 0xCu);
}

- (id)stateChangedCallback
{
  return self->_stateChangedCallback;
}

@end