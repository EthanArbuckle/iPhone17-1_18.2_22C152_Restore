@interface HMDHomeWalletDataSource
- (BOOL)isResidentCapable;
- (BOOL)registerForPasscodeChangeNotificationWithQueue:(id)a3 callback:(id)a4;
- (HMDHomeWalletDataSource)init;
- (double)accessoryWriteRetryInterval;
- (id)numberValueFromNoBackupStoreWithKey:(id)a3;
- (int)passCodeChangeNotificationToken;
- (int64_t)accessoryWriteMaxRetryCount;
- (int64_t)walletKeyColor;
- (void)canNotifyAboutExpressModeWithCompletion:(id)a3;
- (void)dealloc;
- (void)persistNumberValueToNoBackupStore:(id)a3 withKey:(id)a4;
- (void)setPassCodeChangeNotificationToken:(int)a3;
- (void)showExpressEnabledUserNotificationForWalletKeyWithPassUniqueID:(id)a3 completion:(id)a4;
@end

@implementation HMDHomeWalletDataSource

- (void)setPassCodeChangeNotificationToken:(int)a3
{
  self->_passCodeChangeNotificationToken = a3;
}

- (int)passCodeChangeNotificationToken
{
  return self->_passCodeChangeNotificationToken;
}

- (void)canNotifyAboutExpressModeWithCompletion:(id)a3
{
}

- (void)showExpressEnabledUserNotificationForWalletKeyWithPassUniqueID:(id)a3 completion:(id)a4
{
  v5 = (void *)MEMORY[0x263F087E8];
  id v6 = a4;
  id v7 = [v5 hmErrorWithCode:48];
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (id)numberValueFromNoBackupStoreWithKey:(id)a3
{
  v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.homed.notbackedup");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)persistNumberValueToNoBackupStore:(id)a3 withKey:(id)a4
{
}

- (BOOL)registerForPasscodeChangeNotificationWithQueue:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int out_token = -1;
  objc_initWeak(&location, self);
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __83__HMDHomeWalletDataSource_registerForPasscodeChangeNotificationWithQueue_callback___block_invoke;
  v14 = &unk_264A21B40;
  objc_copyWeak(&v16, &location);
  id v8 = v7;
  id v15 = v8;
  uint32_t v9 = notify_register_dispatch("com.apple.managedconfiguration.passcodechanged", &out_token, v6, &v11);
  if (!v9) {
    -[HMDHomeWalletDataSource setPassCodeChangeNotificationToken:](self, "setPassCodeChangeNotificationToken:", out_token, v11, v12, v13, v14);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v9 == 0;
}

void __83__HMDHomeWalletDataSource_registerForPasscodeChangeNotificationWithQueue_callback___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    BOOL v5 = [WeakRetained passCodeChangeNotificationToken] == a2;
    id WeakRetained = v6;
    if (v5)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      id WeakRetained = v6;
    }
  }
}

- (int64_t)walletKeyColor
{
  v2 = [MEMORY[0x263F42608] sharedPreferences];
  v3 = [v2 preferenceForKey:@"walletKeyColor"];
  v4 = [v3 numberValue];

  uint64_t v5 = [v4 integerValue];
  int64_t v6 = v5;
  if (v5 > 14935010)
  {
    BOOL v7 = v5 == 14935011;
    uint64_t v8 = 15521450;
  }
  else
  {
    BOOL v7 = v5 == 0;
    uint64_t v8 = 14341582;
  }
  if (!v7 && v5 != v8) {
    int64_t v6 = *MEMORY[0x263F0CF48];
  }

  return v6;
}

- (double)accessoryWriteRetryInterval
{
  v2 = [MEMORY[0x263F42608] sharedPreferences];
  v3 = [v2 preferenceForKey:@"walletKeyAccessoryWriteRetryInterval"];
  v4 = [v3 numberValue];
  double v5 = (double)[v4 integerValue];

  return v5;
}

- (int64_t)accessoryWriteMaxRetryCount
{
  v2 = [MEMORY[0x263F42608] sharedPreferences];
  v3 = [v2 preferenceForKey:@"walletKeyAccessoryWriteMaxRetryCount"];
  v4 = [v3 numberValue];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (BOOL)isResidentCapable
{
  v2 = +[HMDDeviceCapabilities deviceCapabilities];
  char v3 = [v2 isResidentCapable];

  return v3;
}

- (void)dealloc
{
  int passCodeChangeNotificationToken = self->_passCodeChangeNotificationToken;
  if (passCodeChangeNotificationToken != -1) {
    notify_cancel(passCodeChangeNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)HMDHomeWalletDataSource;
  [(HMDHomeWalletDataSource *)&v4 dealloc];
}

- (HMDHomeWalletDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDHomeWalletDataSource;
  result = [(HMDHomeWalletDataSource *)&v3 init];
  if (result) {
    result->_int passCodeChangeNotificationToken = -1;
  }
  return result;
}

@end