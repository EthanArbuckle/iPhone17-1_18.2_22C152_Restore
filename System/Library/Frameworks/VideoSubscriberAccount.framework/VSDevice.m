@interface VSDevice
+ (BOOL)_getMobileGestaltBoolean:(__CFString *)a3 withCopyAnswer:(void *)a4;
+ (BOOL)_runningACustomerBuildWithCopyAnswer:(void *)a3;
+ (BOOL)_runningAnInternalBuildWithCopyAnswer:(void *)a3;
+ (id)currentDevice;
+ (unint64_t)_deviceTypeWithCopyAnswer:(void *)a3;
- (BOOL)isRunningACustomerBuild;
- (BOOL)isRunningAnInternalBuild;
- (BOOL)setIgnoreSetTopBoxProfile:(BOOL)a3;
- (NSMutableSet)observers;
- (NSOperationQueue)privateQueue;
- (NSOperationQueue)propertyFetchQueue;
- (NSString)bincompatOS;
- (NSString)bincompatPlatform;
- (NSString)deviceNameString;
- (NSString)productVersionString;
- (NSString)serialNumberString;
- (OS_dispatch_queue)notificationQueue;
- (VSDevice)init;
- (VSManagedProfileConnection)profileConnection;
- (VSPreferences)preferences;
- (VSRemoteNotifier)developerSettingsRemoteNotifier;
- (VSRemoteNotifier)setTopBoxStateRemoteNotifier;
- (id)_stringForKey:(__CFString *)a3 copyAnswer:(void *)a4;
- (id)accountDeletionConfirmationMessageForIdentityProviderDisplayName:(id)a3;
- (id)developerIdentityProviderDeletionConfirmationMessage;
- (id)name;
- (id)newDeveloperSettingsFetchOperationBlock;
- (id)productVersion;
- (id)serialNumber;
- (id)stringForAMSDeviceFamilies;
- (id)stringForAMSPlatform;
- (id)stringForAMSPlatformAttributes;
- (unint64_t)deviceType;
- (void)cloudConfigurationDidChange;
- (void)copyAnswer;
- (void)dealloc;
- (void)fetchDeviceManagedSetTopBoxProfileWithCompletion:(id)a3;
- (void)fetchSetTopBoxProfileWithCompletion:(id)a3;
- (void)refreshSetTopBoxProfile:(id)a3;
- (void)registerObserver:(id)a3;
- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4;
- (void)setCopyAnswer:(void *)a3;
- (void)setDeveloperSettingsRemoteNotifier:(id)a3;
- (void)setDeviceNameString:(id)a3;
- (void)setNewDeveloperSettingsFetchOperationBlock:(id)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setProductVersionString:(id)a3;
- (void)setProfileConnection:(id)a3;
- (void)setPropertyFetchQueue:(id)a3;
- (void)setSerialNumberString:(id)a3;
- (void)setSetTopBoxStateRemoteNotifier:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation VSDevice

+ (id)currentDevice
{
  if (currentDevice___vs_lazy_init_predicate != -1) {
    dispatch_once(&currentDevice___vs_lazy_init_predicate, &__block_literal_global_48);
  }
  v2 = (void *)currentDevice___vs_lazy_init_variable;

  return v2;
}

uint64_t __25__VSDevice_currentDevice__block_invoke()
{
  currentDevice___vs_lazy_init_variable = objc_alloc_init(VSDevice);

  return MEMORY[0x1F41817F8]();
}

- (VSDevice)init
{
  v22.receiver = self;
  v22.super_class = (Class)VSDevice;
  v2 = [(VSDevice *)&v22 init];
  v3 = v2;
  if (v2)
  {
    v2->_copyAnswer = (void *)MEMORY[0x1E4FBA068];
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    privateQueue = v3->_privateQueue;
    v3->_privateQueue = v4;

    [(NSOperationQueue *)v3->_privateQueue setName:@"VSDevice"];
    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    propertyFetchQueue = v3->_propertyFetchQueue;
    v3->_propertyFetchQueue = v6;

    [(NSOperationQueue *)v3->_propertyFetchQueue setName:@"VSDevice - PropertyFetch"];
    [(NSOperationQueue *)v3->_propertyFetchQueue setMaxConcurrentOperationCount:1];
    dispatch_queue_t v8 = dispatch_queue_create(0, 0);
    notificationQueue = v3->_notificationQueue;
    v3->_notificationQueue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    observers = v3->_observers;
    v3->_observers = v10;

    v12 = objc_alloc_init(VSPreferences);
    preferences = v3->_preferences;
    v3->_preferences = v12;

    uint64_t v14 = +[VSManagedProfileConnection sharedConnection];
    profileConnection = v3->_profileConnection;
    v3->_profileConnection = (VSManagedProfileConnection *)v14;

    [(VSManagedProfileConnection *)v3->_profileConnection registerObserver:v3];
    id newDeveloperSettingsFetchOperationBlock = v3->_newDeveloperSettingsFetchOperationBlock;
    v3->_id newDeveloperSettingsFetchOperationBlock = &__block_literal_global_55;

    v17 = [[VSRemoteNotifier alloc] initWithNotificationName:@"VSSetTopBoxStateChangedNotification"];
    setTopBoxStateRemoteNotifier = v3->_setTopBoxStateRemoteNotifier;
    v3->_setTopBoxStateRemoteNotifier = v17;

    v19 = [[VSRemoteNotifier alloc] initWithNotificationName:@"VSDeveloperServiceSettingsDidChangeNotification"];
    developerSettingsRemoteNotifier = v3->_developerSettingsRemoteNotifier;
    v3->_developerSettingsRemoteNotifier = v19;

    [(VSRemoteNotifier *)v3->_developerSettingsRemoteNotifier setDelegate:v3];
  }
  return v3;
}

VSDeveloperSettingsFetchOperation *__16__VSDevice_init__block_invoke()
{
  v0 = objc_alloc_init(VSDeveloperSettingsFetchOperation);

  return v0;
}

- (void)setProfileConnection:(id)a3
{
  v4 = (VSManagedProfileConnection *)a3;
  [(VSManagedProfileConnection *)self->_profileConnection unregisterObserver:self];
  profileConnection = self->_profileConnection;
  self->_profileConnection = v4;
  v6 = v4;

  [(VSManagedProfileConnection *)self->_profileConnection registerObserver:self];
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  v5 = [(VSDevice *)self notificationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__VSDevice_registerObserver___block_invoke;
  v7[3] = &unk_1E6BD2C38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __29__VSDevice_registerObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  v5 = [(VSDevice *)self notificationQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__VSDevice_unregisterObserver___block_invoke;
  v7[3] = &unk_1E6BD2C38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __31__VSDevice_unregisterObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = [(VSDevice *)self profileConnection];
  [v4 unregisterObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)VSDevice;
  [(VSDevice *)&v5 dealloc];
}

- (id)developerIdentityProviderDeletionConfirmationMessage
{
  switch([(VSDevice *)self deviceType])
  {
    case 0uLL:
    case 5uLL:
      id v2 = objc_msgSend(MEMORY[0x1E4F28B50], "vs_frameworkBundle");
      v3 = v2;
      id v4 = @"DEVELOPER_DELETION_CONFIRMATION_QUESTION_GENERIC";
      goto LABEL_7;
    case 1uLL:
      id v2 = objc_msgSend(MEMORY[0x1E4F28B50], "vs_frameworkBundle");
      v3 = v2;
      id v4 = @"DEVELOPER_DELETION_CONFIRMATION_QUESTION_PHONE";
      goto LABEL_7;
    case 2uLL:
      id v2 = objc_msgSend(MEMORY[0x1E4F28B50], "vs_frameworkBundle");
      v3 = v2;
      id v4 = @"DEVELOPER_DELETION_CONFIRMATION_QUESTION_PAD";
      goto LABEL_7;
    case 3uLL:
      id v2 = objc_msgSend(MEMORY[0x1E4F28B50], "vs_frameworkBundle");
      v3 = v2;
      id v4 = @"DEVELOPER_DELETION_CONFIRMATION_QUESTION_POD";
      goto LABEL_7;
    case 4uLL:
      id v2 = objc_msgSend(MEMORY[0x1E4F28B50], "vs_frameworkBundle");
      v3 = v2;
      id v4 = @"DEVELOPER_DELETION_CONFIRMATION_QUESTION_TV";
LABEL_7:
      objc_super v5 = [v2 localizedStringForKey:v4 value:0 table:0];

      if (!v5) {
        goto LABEL_8;
      }
      goto LABEL_9;
    default:
LABEL_8:
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The question parameter must not be nil."];
      objc_super v5 = 0;
LABEL_9:
      return v5;
  }
}

- (id)accountDeletionConfirmationMessageForIdentityProviderDisplayName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  unint64_t v6 = [(VSDevice *)self deviceType];
  if (v5)
  {
    if (v6 >= 4)
    {
      if (v6 == 4)
      {
        uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28B50], "vs_frameworkBundle");
        v7 = [v14 localizedStringForKey:@"DELETE_ACCOUNT_CONFIRMATION_MESSAGE_FORMAT_TV" value:0 table:0];

        uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", v7, v4);
LABEL_6:
        v9 = (void *)v8;

        if (v9) {
          goto LABEL_8;
        }
        goto LABEL_7;
      }
      if (v6 != 5)
      {
LABEL_7:
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The message parameter must not be nil."];
        v9 = 0;
LABEL_8:
        if (v9) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
    }
    v7 = objc_msgSend(MEMORY[0x1E4F28B50], "vs_frameworkBundle");
    uint64_t v8 = [v7 localizedStringForKey:@"DELETE_ACCOUNT_CONFIRMATION_MESSAGE_FORMAT_GENERIC" value:0 table:0];
    goto LABEL_6;
  }
  if (v6 < 4) {
    goto LABEL_11;
  }
  if (v6 == 4)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F28B50], "vs_frameworkBundle");
    v11 = v10;
    v12 = @"DELETE_ACCOUNT_CONFIRMATION_MESSAGE_TV";
LABEL_12:
    v9 = [v10 localizedStringForKey:v12 value:0 table:0];

    if (v9) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (v6 == 5)
  {
LABEL_11:
    v10 = objc_msgSend(MEMORY[0x1E4F28B50], "vs_frameworkBundle");
    v11 = v10;
    v12 = @"DELETE_ACCOUNT_CONFIRMATION_MESSAGE_GENERIC";
    goto LABEL_12;
  }
LABEL_16:
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The message parameter must not be nil."];
  v9 = 0;
LABEL_17:

  return v9;
}

- (void)fetchSetTopBoxProfileWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VSDevice *)self newDeveloperSettingsFetchOperationBlock];
  unint64_t v6 = v5[2]();

  v7 = (void *)MEMORY[0x1E4F28B48];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__VSDevice_fetchSetTopBoxProfileWithCompletion___block_invoke;
  v13[3] = &unk_1E6BD2CD8;
  id v14 = v6;
  v15 = self;
  id v16 = v4;
  id v8 = v4;
  id v9 = v6;
  v10 = [v7 blockOperationWithBlock:v13];
  [v10 addDependency:v9];
  v11 = [(VSDevice *)self privateQueue];
  [v11 addOperation:v9];

  v12 = [(VSDevice *)self privateQueue];
  [v12 addOperation:v10];
}

void __48__VSDevice_fetchSetTopBoxProfileWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) result];
  v3 = [v2 forceUnwrapObject];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__VSDevice_fetchSetTopBoxProfileWithCompletion___block_invoke_2;
  v7[3] = &unk_1E6BD4460;
  id v4 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v4;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__VSDevice_fetchSetTopBoxProfileWithCompletion___block_invoke_3;
  v5[3] = &unk_1E6BD2DA0;
  id v6 = *(id *)(a1 + 48);
  [v3 unwrapObject:v7 error:v5];
}

void __48__VSDevice_fetchSetTopBoxProfileWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v16 = a2;
  v3 = [*(id *)(a1 + 32) preferences];
  char v4 = [v3 ignoreSetTopBoxProfile];

  uint64_t v5 = [*(id *)(a1 + 32) profileConnection];
  id v6 = [v5 providerUniqueID];

  if (([v16 isInSetTopBoxMode] & 1) != 0 || v6)
  {
    uint64_t v7 = [v16 isInSetTopBoxMode];
    if (!v7)
    {
      if (v4)
      {
        v10 = 0;
        v11 = 0;
        id v9 = &stru_1F34B2EC8;
      }
      else
      {
        if (!v6) {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The providerIDOrNil parameter must not be nil."];
        }
        id v9 = v6;
        v12 = [*(id *)(a1 + 32) profileConnection];
        v11 = [v12 userToken];

        v13 = [*(id *)(a1 + 32) preferences];
        v10 = [v13 setTopBoxActivationTime];
      }
      goto LABEL_18;
    }
    id v8 = [v16 setTopBoxIdentityProviderID];

    if (!v8) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [settings setTopBoxIdentityProviderID] parameter must not be nil."];
    }
    id v9 = [v16 setTopBoxIdentityProviderID];
    if ([v16 setTopBoxUseDeviceProfile])
    {
      if (v4)
      {
        v10 = 0;
        v11 = 0;
LABEL_18:
        if ([(__CFString *)v9 length])
        {
          v15 = [[VSSetTopBoxProfile alloc] initWithProviderID:v9 userToken:v11 activationTime:v10 isDeveloper:v7];
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
        else
        {
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }

        goto LABEL_22;
      }
      id v14 = [*(id *)(a1 + 32) profileConnection];
      v11 = [v14 userToken];
    }
    else
    {
      v11 = [v16 setTopBoxUserToken];
    }
    v10 = 0;
    goto LABEL_18;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_22:
}

uint64_t __48__VSDevice_fetchSetTopBoxProfileWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchDeviceManagedSetTopBoxProfileWithCompletion:(id)a3
{
  id v16 = (void (**)(id, VSSetTopBoxProfile *))a3;
  char v4 = [(VSDevice *)self profileConnection];
  uint64_t v5 = [v4 providerUniqueID];

  if (v5
    && ([(VSDevice *)self preferences],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 ignoreSetTopBoxProfile],
        v6,
        (v7 & 1) == 0))
  {
    id v8 = v5;
    id v9 = [(VSDevice *)self profileConnection];
    v10 = [v9 userToken];

    if (!v10) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [[self profileConnection] userToken] parameter must not be nil."];
    }
    v11 = [(VSDevice *)self profileConnection];
    v12 = [v11 userToken];

    v13 = objc_alloc_init(VSSetTopBoxProfile);
    [(VSSetTopBoxProfile *)v13 setProviderID:v8];

    [(VSSetTopBoxProfile *)v13 setUserToken:v12];
    [(VSSetTopBoxProfile *)v13 setIsDeveloper:0];
    id v14 = [(VSDevice *)self preferences];
    v15 = [v14 setTopBoxActivationTime];
    [(VSSetTopBoxProfile *)v13 setActivationTime:v15];

    v16[2](v16, v13);
  }
  else
  {
    v16[2](v16, 0);
  }
}

+ (BOOL)_runningAnInternalBuildWithCopyAnswer:(void *)a3
{
  return [a1 _getMobileGestaltBoolean:@"InternalBuild" withCopyAnswer:a3];
}

- (BOOL)isRunningAnInternalBuild
{
  v3 = objc_opt_class();
  char v4 = [(VSDevice *)self copyAnswer];

  return [v3 _runningAnInternalBuildWithCopyAnswer:v4];
}

+ (BOOL)_runningACustomerBuildWithCopyAnswer:(void *)a3
{
  if (!a3) {
    return 1;
  }
  v3 = (const void *)((uint64_t (*)(__CFString *, void))a3)(@"ReleaseType", 0);
  if (!v3) {
    return 1;
  }
  CFRelease(v3);
  return 0;
}

- (BOOL)isRunningACustomerBuild
{
  v3 = objc_opt_class();
  char v4 = [(VSDevice *)self copyAnswer];

  return [v3 _runningACustomerBuildWithCopyAnswer:v4];
}

+ (BOOL)_getMobileGestaltBoolean:(__CFString *)a3 withCopyAnswer:(void *)a4
{
  if (!a4) {
    return 0;
  }
  CFBooleanRef v4 = (const __CFBoolean *)((uint64_t (*)(__CFString *, void))a4)(a3, 0);
  if (!v4) {
    return 0;
  }
  CFBooleanRef v5 = v4;
  CFTypeID v6 = CFGetTypeID(v4);
  BOOL v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue(v5) != 0;
  CFRelease(v5);
  return v7;
}

+ (unint64_t)_deviceTypeWithCopyAnswer:(void *)a3
{
  if (!a3) {
    return 0;
  }
  v3 = (const void *)((uint64_t (*)(__CFString *, void))a3)(@"DeviceClass", 0);
  if (!v3) {
    return 0;
  }
  CFBooleanRef v4 = v3;
  CFTypeID v5 = CFGetTypeID(v3);
  if (v5 == CFStringGetTypeID())
  {
    if (CFEqual(v4, @"iPhone"))
    {
      unint64_t v6 = 1;
    }
    else if (CFEqual(v4, @"iPod"))
    {
      unint64_t v6 = 3;
    }
    else if (CFEqual(v4, @"iPad"))
    {
      unint64_t v6 = 2;
    }
    else if (CFEqual(v4, @"AppleTV"))
    {
      unint64_t v6 = 4;
    }
    else if (CFEqual(v4, @"RealityDevice"))
    {
      unint64_t v6 = 5;
    }
    else
    {
      unint64_t v6 = 0;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  CFRelease(v4);
  return v6;
}

- (unint64_t)deviceType
{
  v3 = objc_opt_class();
  CFBooleanRef v4 = [(VSDevice *)self copyAnswer];

  return [v3 _deviceTypeWithCopyAnswer:v4];
}

- (BOOL)setIgnoreSetTopBoxProfile:(BOOL)a3
{
  BOOL v3 = a3;
  CFTypeID v5 = [(VSDevice *)self preferences];
  [v5 setIgnoreSetTopBoxProfile:v3];
  int v6 = [v5 ignoreSetTopBoxProfile] ^ v3;
  if (v6 == 1)
  {
    VSDefaultLogObject();
    BOOL v7 = (VSDeveloperServiceConnection *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1DA674000, &v7->super, OS_LOG_TYPE_DEFAULT, "IgnoreSetTopBoxProfile default value does not match written value.", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    BOOL v7 = objc_alloc_init(VSDeveloperServiceConnection);
    id v8 = [(VSDeveloperServiceConnection *)v7 serviceWithErrorHandler:&__block_literal_global_137];
    objc_initWeak(buf, v8);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_138;
    id v14 = &unk_1E6BD44B0;
    objc_copyWeak(&v16, buf);
    v15 = self;
    [v8 fetchDeveloperSettingsWithCompletionHandler:&v11];
    id v9 = [(VSDevice *)self setTopBoxStateRemoteNotifier];
    [v9 postNotification];

    objc_destroyWeak(&v16);
    objc_destroyWeak(buf);
  }
  return v6 ^ 1;
}

void __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_138(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_2;
  v4[3] = &unk_1E6BD4488;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4[4] = *(void *)(a1 + 32);
  [v3 unwrapObject:v4 error:&__block_literal_global_145];
  objc_destroyWeak(&v5);
}

void __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 setTopBoxUseDeviceProfile])
  {
    uint64_t v4 = (void *)[v3 copy];
    [v4 setSetTopBoxUseDeviceProfile:0];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v6 = WeakRetained;
    if (WeakRetained)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_3;
      v7[3] = &unk_1E6BD28D8;
      v7[4] = *(void *)(a1 + 32);
      [WeakRetained updateDeveloperSettings:v4 completionHandler:v7];
    }
  }
}

uint64_t __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_3(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_4;
  v3[3] = &unk_1E6BD3B58;
  v3[4] = *(void *)(a1 + 32);
  return [a2 unwrapObject:v3 error:&__block_literal_global_141];
}

uint64_t __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_4(uint64_t a1)
{
  id v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1DA674000, v2, OS_LOG_TYPE_DEFAULT, "Successfully updated developer settings after profile statae change.", v4, 2u);
  }

  return [*(id *)(a1 + 32) cloudConfigurationDidChange];
}

void __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_139(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_139_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_143(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_143_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)refreshSetTopBoxProfile:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[VSManagedProfileConnection sharedConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__VSDevice_refreshSetTopBoxProfile___block_invoke;
  v6[3] = &unk_1E6BD2DA0;
  id v7 = v3;
  id v5 = v3;
  [v4 refreshProfileWithCompletion:v6];
}

uint64_t __36__VSDevice_refreshSetTopBoxProfile___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)productVersion
{
  id v3 = [(VSDevice *)self productVersionString];

  if (!v3)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __26__VSDevice_productVersion__block_invoke;
    v8[3] = &unk_1E6BD29A8;
    v8[4] = self;
    uint64_t v4 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v8];
    id v5 = [(VSDevice *)self propertyFetchQueue];
    [v5 addOperation:v4];

    [v4 waitUntilFinished];
  }
  uint64_t v6 = [(VSDevice *)self productVersionString];

  return v6;
}

void __26__VSDevice_productVersion__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) productVersionString];

  if (!v2)
  {
    id v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "_stringForKey:copyAnswer:", @"ProductVersion", objc_msgSend(v3, "copyAnswer"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v3 setProductVersionString:v4];
  }
}

- (id)serialNumber
{
  id v3 = [(VSDevice *)self serialNumberString];

  if (!v3)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __24__VSDevice_serialNumber__block_invoke;
    v8[3] = &unk_1E6BD29A8;
    v8[4] = self;
    id v4 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v8];
    id v5 = [(VSDevice *)self propertyFetchQueue];
    [v5 addOperation:v4];

    [v4 waitUntilFinished];
  }
  uint64_t v6 = [(VSDevice *)self serialNumberString];

  return v6;
}

void __24__VSDevice_serialNumber__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serialNumberString];

  if (!v2)
  {
    id v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "_stringForKey:copyAnswer:", @"SerialNumber", objc_msgSend(v3, "copyAnswer"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v3 setSerialNumberString:v4];
  }
}

- (id)name
{
  id v3 = [(VSDevice *)self deviceNameString];

  if (!v3)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __16__VSDevice_name__block_invoke;
    v8[3] = &unk_1E6BD29A8;
    v8[4] = self;
    id v4 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v8];
    id v5 = [(VSDevice *)self propertyFetchQueue];
    [v5 addOperation:v4];

    [v4 waitUntilFinished];
  }
  uint64_t v6 = [(VSDevice *)self deviceNameString];

  return v6;
}

void __16__VSDevice_name__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) deviceNameString];

  if (!v2)
  {
    id v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "_stringForKey:copyAnswer:", @"UserAssignedDeviceName", objc_msgSend(v3, "copyAnswer"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v3 setDeviceNameString:v4];
  }
}

- (id)_stringForKey:(__CFString *)a3 copyAnswer:(void *)a4
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__14;
  v24 = __Block_byref_object_dispose__14;
  id v25 = 0;
  id v7 = objc_alloc_init(VSWaitGroup);
  [(VSWaitGroup *)v7 enter];
  uint64_t v8 = [(VSDevice *)self privateQueue];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __37__VSDevice__stringForKey_copyAnswer___block_invoke;
  v15 = &unk_1E6BD44D8;
  v18 = a4;
  v19 = a3;
  v17 = &v20;
  uint64_t v9 = v7;
  id v16 = v9;
  [v8 addOperationWithBlock:&v12];

  [(VSWaitGroup *)v9 wait];
  id v10 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v10;
}

uint64_t __37__VSDevice__stringForKey_copyAnswer___block_invoke(void *a1)
{
  id v2 = (uint64_t (*)(void, void))a1[6];
  if (v2)
  {
    id v3 = (const void *)v2(a1[7], 0);
    if (v3)
    {
      id v4 = v3;
      CFTypeID v5 = CFGetTypeID(v3);
      if (v5 == CFStringGetTypeID())
      {
        uint64_t v6 = *(void *)(a1[5] + 8);
        id v7 = *(void **)(v6 + 40);
        *(void *)(v6 + 40) = v4;
      }
    }
  }
  uint64_t v8 = (void *)a1[4];

  return [v8 leave];
}

- (void)cloudConfigurationDidChange
{
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA674000, v3, OS_LOG_TYPE_DEFAULT, "Received cloud configuration did change notification.", buf, 2u);
  }

  id v4 = [(VSDevice *)self setTopBoxStateRemoteNotifier];
  [v4 postNotification];

  CFTypeID v5 = [(VSDevice *)self notificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__VSDevice_cloudConfigurationDidChange__block_invoke;
  block[3] = &unk_1E6BD29A8;
  block[4] = self;
  dispatch_async(v5, block);
}

void __39__VSDevice_cloudConfigurationDidChange__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 deviceSetTopBoxProfileChanged:*(void *)(a1 + 32)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)stringForAMSPlatform
{
  unint64_t v2 = [(VSDevice *)self deviceType];
  if (v2 > 5) {
    return @"ipad";
  }
  else {
    return off_1E6BD44F8[v2];
  }
}

- (id)stringForAMSPlatformAttributes
{
  unint64_t v2 = [(VSDevice *)self deviceType];
  if (v2 > 5) {
    return @"appletvos";
  }
  else {
    return off_1E6BD4528[v2];
  }
}

- (id)stringForAMSDeviceFamilies
{
  unint64_t v2 = [(VSDevice *)self deviceType];
  if (v2 > 4) {
    return @"xros";
  }
  else {
    return off_1E6BD4558[v2];
  }
}

- (NSString)bincompatOS
{
  if ([(VSDevice *)self deviceType] == 5) {
    return (NSString *)@"ios";
  }
  else {
    return 0;
  }
}

- (NSString)bincompatPlatform
{
  if ([(VSDevice *)self deviceType] == 5) {
    return (NSString *)@"ipad";
  }
  else {
    return 0;
  }
}

- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4
{
  id v5 = a3;
  id v6 = [(VSDevice *)self developerSettingsRemoteNotifier];

  if (v6 == v5)
  {
    [(VSDevice *)self cloudConfigurationDidChange];
  }
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSString)productVersionString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProductVersionString:(id)a3
{
}

- (NSString)serialNumberString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSerialNumberString:(id)a3
{
}

- (NSString)deviceNameString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeviceNameString:(id)a3
{
}

- (NSOperationQueue)propertyFetchQueue
{
  return self->_propertyFetchQueue;
}

- (void)setPropertyFetchQueue:(id)a3
{
}

- (void)copyAnswer
{
  return self->_copyAnswer;
}

- (void)setCopyAnswer:(void *)a3
{
  self->_copyAnswer = a3;
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (id)newDeveloperSettingsFetchOperationBlock
{
  return self->_newDeveloperSettingsFetchOperationBlock;
}

- (void)setNewDeveloperSettingsFetchOperationBlock:(id)a3
{
}

- (VSManagedProfileConnection)profileConnection
{
  return self->_profileConnection;
}

- (VSRemoteNotifier)setTopBoxStateRemoteNotifier
{
  return self->_setTopBoxStateRemoteNotifier;
}

- (void)setSetTopBoxStateRemoteNotifier:(id)a3
{
}

- (VSRemoteNotifier)developerSettingsRemoteNotifier
{
  return self->_developerSettingsRemoteNotifier;
}

- (void)setDeveloperSettingsRemoteNotifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_developerSettingsRemoteNotifier, 0);
  objc_storeStrong((id *)&self->_setTopBoxStateRemoteNotifier, 0);
  objc_storeStrong((id *)&self->_profileConnection, 0);
  objc_storeStrong(&self->_newDeveloperSettingsFetchOperationBlock, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_propertyFetchQueue, 0);
  objc_storeStrong((id *)&self->_deviceNameString, 0);
  objc_storeStrong((id *)&self->_serialNumberString, 0);
  objc_storeStrong((id *)&self->_productVersionString, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

void __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_139_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __38__VSDevice_setIgnoreSetTopBoxProfile___block_invoke_143_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end