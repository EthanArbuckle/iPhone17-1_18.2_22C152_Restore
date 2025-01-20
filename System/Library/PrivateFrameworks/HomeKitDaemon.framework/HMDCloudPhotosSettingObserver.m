@interface HMDCloudPhotosSettingObserver
+ (HMDCloudPhotosSettingObserver)sharedInstance;
+ (id)logCategory;
- (BOOL)isCloudPhotosEnabled;
- (BOOL)isCloudPhotosEnabledOnAccount;
- (BOOL)isSupported;
- (HMDACAccount)account;
- (HMDCloudPhotosSettingObserver)init;
- (HMDCloudPhotosSettingObserver)initWithAccount:(id)a3 notificationCenter:(id)a4 isSupported:(BOOL)a5;
- (NSNotificationCenter)notificationCenter;
- (void)configure;
- (void)handleAccountStoreDidChangeNotification:(id)a3;
- (void)setCloudPhotosEnabled:(BOOL)a3;
@end

@implementation HMDCloudPhotosSettingObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (BOOL)isSupported
{
  return self->_supported;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 24, 1);
}

- (HMDACAccount)account
{
  return (HMDACAccount *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCloudPhotosEnabled:(BOOL)a3
{
  self->_cloudPhotosEnabled = a3;
}

- (BOOL)isCloudPhotosEnabled
{
  return self->_cloudPhotosEnabled;
}

- (BOOL)isCloudPhotosEnabledOnAccount
{
  v2 = [(HMDCloudPhotosSettingObserver *)self account];
  char v3 = [v2 isEnabledForDataclass:*MEMORY[0x263EFAC58]];

  return v3;
}

- (void)handleAccountStoreDidChangeNotification:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v17 = 138543362;
    v18 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Received account change notification", (uint8_t *)&v17, 0xCu);
  }
  uint64_t v9 = [(HMDCloudPhotosSettingObserver *)v6 isCloudPhotosEnabledOnAccount];
  if (v9 != [(HMDCloudPhotosSettingObserver *)v6 isCloudPhotosEnabled])
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    v11 = v6;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      [(HMDCloudPhotosSettingObserver *)v11 isCloudPhotosEnabled];
      v14 = HMFBooleanToString();
      v15 = HMFBooleanToString();
      int v17 = 138543874;
      v18 = v13;
      __int16 v19 = 2112;
      v20 = v14;
      __int16 v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating cloudPhotosEnabled from %@ to %@", (uint8_t *)&v17, 0x20u);
    }
    [(HMDCloudPhotosSettingObserver *)v11 setCloudPhotosEnabled:v9];
    v16 = [(HMDCloudPhotosSettingObserver *)v11 notificationCenter];
    [v16 postNotificationName:@"HMDCloudPhotoSettingChangedNotification" object:v11];
  }
}

- (void)configure
{
  if ([(HMDCloudPhotosSettingObserver *)self isSupported])
  {
    char v3 = [(HMDCloudPhotosSettingObserver *)self notificationCenter];
    [v3 addObserver:self selector:sel_handleAccountStoreDidChangeNotification_ name:*MEMORY[0x263EFB060] object:0];

    BOOL v4 = [(HMDCloudPhotosSettingObserver *)self isCloudPhotosEnabledOnAccount];
    [(HMDCloudPhotosSettingObserver *)self setCloudPhotosEnabled:v4];
  }
}

- (HMDCloudPhotosSettingObserver)initWithAccount:(id)a3 notificationCenter:(id)a4 isSupported:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDCloudPhotosSettingObserver;
  v11 = [(HMDCloudPhotosSettingObserver *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_account, a3);
    objc_storeStrong((id *)&v12->_notificationCenter, a4);
    v12->_supported = a5;
  }

  return v12;
}

- (HMDCloudPhotosSettingObserver)init
{
  char v3 = +[HMDAppleAccountManager sharedManager];
  BOOL v4 = [v3 accountStore];
  v5 = objc_msgSend(v4, "aa_primaryAppleAccount");
  v6 = [MEMORY[0x263F08A00] defaultCenter];
  v7 = [(HMDCloudPhotosSettingObserver *)self initWithAccount:v5 notificationCenter:v6 isSupported:!isHomePod()];

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_145968 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_145968, &__block_literal_global_7);
  }
  v2 = (void *)logCategory__hmf_once_v3_145969;
  return v2;
}

void __44__HMDCloudPhotosSettingObserver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v3_145969;
  logCategory__hmf_once_v3_145969 = v0;
}

+ (HMDCloudPhotosSettingObserver)sharedInstance
{
  if (sharedInstance_onceToken_145973 != -1) {
    dispatch_once(&sharedInstance_onceToken_145973, &__block_literal_global_145974);
  }
  v2 = (void *)sharedInstance_cloudPhotoSettingObserver;
  return (HMDCloudPhotosSettingObserver *)v2;
}

uint64_t __47__HMDCloudPhotosSettingObserver_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_alloc_init(HMDCloudPhotosSettingObserver);
  v1 = (void *)sharedInstance_cloudPhotoSettingObserver;
  sharedInstance_cloudPhotoSettingObserver = (uint64_t)v0;

  v2 = (void *)sharedInstance_cloudPhotoSettingObserver;
  return [v2 configure];
}

@end