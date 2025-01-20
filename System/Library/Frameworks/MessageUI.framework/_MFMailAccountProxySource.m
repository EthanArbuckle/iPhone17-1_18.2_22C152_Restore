@interface _MFMailAccountProxySource
- (_MFMailAccountProxySource)init;
- (id)accountProxiesOriginatingBundleID:(id)a3 sourceAccountManagement:(int)a4;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_deregisterForNotifications_nts;
- (void)_registerForNotifications_nts;
- (void)_resetAccountsChanged:(BOOL)a3;
- (void)dealloc;
@end

@implementation _MFMailAccountProxySource

- (_MFMailAccountProxySource)init
{
  v6.receiver = self;
  v6.super_class = (Class)_MFMailAccountProxySource;
  v2 = [(_MFMailAccountProxySource *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v2->_lock;
    v2->_lock = v3;
  }
  return v2;
}

- (void)dealloc
{
  [(NSLock *)self->_lock lock];
  [(_MFMailAccountProxySource *)self _deregisterForNotifications_nts];
  accountProxies = self->_accountProxies;
  self->_accountProxies = 0;

  [(NSLock *)self->_lock unlock];
  v4.receiver = self;
  v4.super_class = (Class)_MFMailAccountProxySource;
  [(_MFMailAccountProxySource *)&v4 dealloc];
}

- (id)accountProxiesOriginatingBundleID:(id)a3 sourceAccountManagement:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  [(NSLock *)self->_lock lock];
  if (!self->_accountProxies || self->_lastSourceAccountManagementQueried != v4)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", *MEMORY[0x1E4F73AC8], *MEMORY[0x1E4F73AF8], *MEMORY[0x1E4F73B38], *MEMORY[0x1E4F73AD8], *MEMORY[0x1E4F73AE0], *MEMORY[0x1E4F73AE8], *MEMORY[0x1E4F73AF0], *MEMORY[0x1E4F73AD0], *MEMORY[0x1E4F73B08], *MEMORY[0x1E4F73B00], *MEMORY[0x1E4F73B20], *MEMORY[0x1E4F73B18], *MEMORY[0x1E4F73B30], *MEMORY[0x1E4F73B28], *MEMORY[0x1E4F73B10], 0);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    v10 = (void *)MEMORY[0x1E4F73B40];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __87___MFMailAccountProxySource_accountProxiesOriginatingBundleID_sourceAccountManagement___block_invoke;
    v17[3] = &unk_1E5F7B1B8;
    v11 = (NSArray *)v8;
    v18 = v11;
    dispatch_semaphore_t v19 = v9;
    v12 = v9;
    [v10 accountValuesForKeys:v7 originatingBundleID:v6 sourceAccountManagement:v4 launchMobileMail:1 completionBlock:v17];
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    accountProxies = self->_accountProxies;
    self->_accountProxies = v11;
    v14 = v11;

    self->_lastSourceAccountManagementQueried = v4;
  }
  [(_MFMailAccountProxySource *)self _registerForNotifications_nts];
  [(NSLock *)self->_lock unlock];
  v15 = self->_accountProxies;

  return v15;
}

- (void)_resetAccountsChanged:(BOOL)a3
{
  [(NSLock *)self->_lock lock];
  [(_MFMailAccountProxySource *)self _deregisterForNotifications_nts];
  accountProxies = self->_accountProxies;
  self->_accountProxies = 0;

  [(NSLock *)self->_lock unlock];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"MFMailComposeControllerShouldReloadAccounts" object:0 userInfo:0];
}

- (void)_registerForNotifications_nts
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F77E40];
  int v3 = 136315394;
  uint64_t v4 = v2;
  __int16 v5 = 1024;
  int v6 = a1;
  _os_log_error_impl(&dword_1AF945000, a2, OS_LOG_TYPE_ERROR, "Failed to register for %s notifications: %u", (uint8_t *)&v3, 0x12u);
}

- (void)_deregisterForNotifications_nts
{
  if (self->_registeredForNotifications)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4F77B10], 0);
    notify_cancel(self->_notifyToken);
    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x1E4FB2640] object:0];

    self->_registeredForNotifications = 0;
  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountProxies, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end