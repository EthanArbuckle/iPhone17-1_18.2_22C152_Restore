@interface HPSAppleConnectController
+ (id)sharedInstance;
- (BOOL)isCarryOrLiveOnUser;
- (BOOL)isEnabled;
- (HPSAppleConnectController)init;
- (NSString)accountID;
- (NSString)password;
- (void)_readCachedCredentials;
- (void)_saveCredentials;
- (void)clearCredentialsSyncToKeychain:(BOOL)a3;
- (void)dealloc;
- (void)setAccountID:(id)a3;
- (void)setAccountID:(id)a3 password:(id)a4 syncToKeychain:(BOOL)a5;
- (void)setPassword:(id)a3;
- (void)tokenWithError:(id)a3;
- (void)validateWithCompletionHandler:(id)a3;
@end

@implementation HPSAppleConnectController

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__HPSAppleConnectController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken[0] != -1) {
    dispatch_once(sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __43__HPSAppleConnectController_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x270F9A758]();
}

- (HPSAppleConnectController)init
{
  v6.receiver = self;
  v6.super_class = (Class)HPSAppleConnectController;
  v2 = [(HPSAppleConnectController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(HPSAppleConnectController *)v2 _readCachedCredentials];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_settingsChanged, @"com.apple.hps.appleconnect.didchange", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v3;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.hps.appleconnect.didchange", 0);
  v4.receiver = self;
  v4.super_class = (Class)HPSAppleConnectController;
  [(HPSAppleConnectController *)&v4 dealloc];
}

- (BOOL)isEnabled
{
  v3 = [(HPSAppleConnectController *)self accountID];
  if ([v3 length])
  {
    objc_super v4 = [(HPSAppleConnectController *)self password];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)setAccountID:(id)a3 password:(id)a4 syncToKeychain:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a4;
  v8 = (void *)MEMORY[0x263EFF960];
  id v9 = a3;
  v10 = [v8 currentLocale];
  v11 = [v9 lowercaseStringWithLocale:v10];

  v12 = [(HPSAppleConnectController *)self accountID];
  if ([v11 isEqualToString:v12])
  {
    v13 = [(HPSAppleConnectController *)self password];
    char v14 = [v15 isEqualToString:v13];

    if (v14) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  [(HPSAppleConnectController *)self setAccountID:v11];
  [(HPSAppleConnectController *)self setPassword:v15];
  if (v5) {
    [(HPSAppleConnectController *)self _saveCredentials];
  }
LABEL_7:
}

- (void)clearCredentialsSyncToKeychain:(BOOL)a3
{
  BOOL v3 = a3;
  [(HPSAppleConnectController *)self setAccountID:0];
  [(HPSAppleConnectController *)self setPassword:0];
  if (v3)
  {
    [(HPSAppleConnectController *)self _saveCredentials];
  }
}

- (BOOL)isCarryOrLiveOnUser
{
  BOOL v3 = [(HPSAppleConnectController *)self isEnabled];
  objc_super v4 = [(HPSAppleConnectController *)self accountID];
  BOOL v5 = [(HPSAppleConnectController *)self password];
  if (v3)
  {
    if ([v4 length]) {
      LOBYTE(v3) = [v5 length] != 0;
    }
    else {
      LOBYTE(v3) = 0;
    }
  }

  return v3;
}

- (void)validateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__HPSAppleConnectController_validateWithCompletionHandler___block_invoke;
  v6[3] = &unk_264E89718;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __59__HPSAppleConnectController_validateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) accountID];
  if (![v2 length])
  {

    goto LABEL_5;
  }
  BOOL v3 = [*(id *)(a1 + 32) password];
  uint64_t v4 = [v3 length];

  if (!v4)
  {
LABEL_5:
    objc_super v6 = [MEMORY[0x263F087E8] errorWithDomain:@"HPSAppleConnectControllerErrorDomain" code:-1100 userInfo:0];
    goto LABEL_9;
  }
  [*(id *)(a1 + 32) accountID];
  [*(id *)(a1 + 32) password];
  int v5 = ACMobileShimCopyTicket();
  id v7 = HPSLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = 0;
    _os_log_impl(&dword_23D144000, v7, OS_LOG_TYPE_DEFAULT, "AppleConnect credentials invalid: status:%d error:%@", buf, 0x12u);
  }

  objc_super v6 = [MEMORY[0x263F087E8] errorWithDomain:@"HPSAppleConnectControllerErrorDomain" code:-1101 userInfo:0];

LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)tokenWithError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__HPSAppleConnectController_tokenWithError___block_invoke;
  v6[3] = &unk_264E89718;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __44__HPSAppleConnectController_tokenWithError___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v9 = 0;
  v2 = [*(id *)(a1 + 32) accountID];
  BOOL v3 = [*(id *)(a1 + 32) password];
  int v4 = ACMobileShimCopyTicket();
  id v5 = HPSLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = (uint64_t)v9;
    _os_log_impl(&dword_23D144000, v5, OS_LOG_TYPE_DEFAULT, "copyTicket returned %d %@", buf, 0x12u);
  }

  objc_super v6 = HPSLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __44__HPSAppleConnectController_tokenWithError___block_invoke_cold_1((uint64_t *)&v9, v4, v6);
  }

  id v7 = v9;
  if (v9)
  {
    v8 = [MEMORY[0x263F087E8] errorWithDomain:@"HPSAppleConnectControllerErrorDomain" code:-1101 userInfo:v9];
  }
  else
  {
    v8 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_readCachedCredentials
{
}

- (void)_saveCredentials
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23D144000, v0, v1, "Failed to add AppleConnect data [%d]", v2, v3, v4, v5, v6);
}

- (void)setAccountID:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  accountID = obj->_accountID;
  obj->_accountID = v4;

  objc_sync_exit(obj);
}

- (void)setPassword:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  password = obj->_password;
  obj->_password = v4;

  objc_sync_exit(obj);
}

- (NSString)accountID
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_accountID;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)password
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_password;
  objc_sync_exit(v2);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

void __44__HPSAppleConnectController_tokenWithError___block_invoke_cold_1(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  v4[0] = 67109378;
  v4[1] = a2;
  __int16 v5 = 2112;
  uint64_t v6 = v3;
  _os_log_error_impl(&dword_23D144000, log, OS_LOG_TYPE_ERROR, "AppleConnect credentials invalid: status:%d error:%@", (uint8_t *)v4, 0x12u);
}

@end