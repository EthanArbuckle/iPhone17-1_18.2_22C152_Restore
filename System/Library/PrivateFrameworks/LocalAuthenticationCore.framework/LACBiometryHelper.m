@interface LACBiometryHelper
+ (id)faceIdInstance;
+ (id)sharedInstance;
+ (id)touchIdInstance;
- (BKDevice)device;
- (BOOL)_isEnrolled:(id)a3 adminOnly:(BOOL)a4 hardwareMustBeAvailable:(BOOL)a5 error:(id *)a6;
- (BOOL)_shouldCacheIdentities;
- (BOOL)_shouldRetryAvailableDevices;
- (BOOL)deviceHasBiometryWithError:(id *)a3;
- (BOOL)isAnyUserEnrolledWithAdminRole:(BOOL)a3 error:(id *)a4;
- (BOOL)isAnyUserEnrolledWithError:(id *)a3;
- (BOOL)isBiometryOnForApplePay:(id)a3;
- (BOOL)isBiometryOnForUnlock:(id)a3;
- (BOOL)isEnrolled:(id)a3 error:(id *)a4;
- (BOOL)isEnrolledWithoutHardware:(id)a3 error:(id *)a4;
- (BOOL)isIdentificationEnabled:(id)a3;
- (BOOL)isLockedOutForUser:(id)a3 adminOnly:(BOOL)a4 request:(id)a5 error:(id *)a6;
- (BOOL)isLockedOutForUser:(id)a3 request:(id)a4 error:(id *)a5;
- (BOOL)isNotLockedOutForAnyUserWithAdminRole:(BOOL)a3 request:(id)a4 error:(id *)a5;
- (BOOL)isPeriocularMatchingEnabledForUser:(id)a3;
- (BOOL)userPresent:(BOOL *)a3 error:(id *)a4;
- (LACBiometryDelegate)delegate;
- (LACBiometryHelper)initWithBiometryType:(int64_t)a3;
- (NSDictionary)adminIdentities;
- (NSDictionary)identities;
- (NSError)fault;
- (NSError)permanentError;
- (OS_dispatch_queue)workQueue;
- (id)_biolockoutStateForUser:(id)a3 request:(id)a4 error:(id *)a5;
- (id)_dumpEnvironmentForUser:(id)a3;
- (id)_errorDisconnected:(BOOL)a3 notEnrolled:(BOOL)a4;
- (id)_identitiesForUser:(id)a3 adminOnly:(BOOL)a4;
- (id)_lockoutErrorForExtendedState:(int64_t)a3 userId:(id)a4;
- (id)_protectedConfigurationForUser:(id)a3;
- (id)biometryDatabaseHashForUser:(id)a3 error:(id *)a4;
- (id)biometryLostErrorForUser:(id)a3 request:(id)a4;
- (id)catacombUUID:(id)a3;
- (id)dumpStatus;
- (id)lockoutErrorForState:(int64_t)a3 userId:(id)a4;
- (int64_t)biometryType;
- (int64_t)deviceType;
- (void)_clearHashes;
- (void)_handleAccessoriesChangedNotification;
- (void)_handleEnrollmentChangedNotification;
- (void)_handleLockoutStateChangedNotification;
- (void)_refreshIdentitiesDueToAccessoryChange:(BOOL)a3;
- (void)_setup;
- (void)_setupDeviceWithDescriptor:(id)a3;
- (void)_setupWithFault:(id)a3;
- (void)_setupWithPermanentError:(id)a3;
- (void)_shouldRetryAvailableDevices;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)resetBiometry;
- (void)setDelegate:(id)a3;
@end

@implementation LACBiometryHelper

- (int64_t)biometryType
{
  return self->_biometryType;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;
  return v2;
}

- (BOOL)_isEnrolled:(id)a3 adminOnly:(BOOL)a4 hardwareMustBeAvailable:(BOOL)a5 error:(id *)a6
{
  id v9 = a3;
  id v21 = 0;
  BOOL v10 = [(LACBiometryHelper *)self deviceHasBiometryWithError:&v21];
  id v11 = v21;
  if (v10)
  {
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __73__LACBiometryHelper__isEnrolled_adminOnly_hardwareMustBeAvailable_error___block_invoke;
    v17 = &unk_2653B6110;
    v18 = self;
    id v19 = v9;
    BOOL v20 = a4;
    int v12 = ((uint64_t (*)(uint64_t *))__73__LACBiometryHelper__isEnrolled_adminOnly_hardwareMustBeAvailable_error___block_invoke)(&v14);
    if (!v11)
    {
      -[LACBiometryHelper _errorDisconnected:notEnrolled:](self, "_errorDisconnected:notEnrolled:", 0, v12 ^ 1u, v14, v15);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  if (a6) {
    *a6 = v11;
  }

  return v11 == 0;
}

- (BOOL)deviceHasBiometryWithError:(id *)a3
{
  v5 = [(LACBiometryHelper *)self permanentError];

  if (v5)
  {
    uint64_t v6 = [(LACBiometryHelper *)self permanentError];
  }
  else
  {
    v7 = [(LACBiometryHelper *)self fault];

    if (!v7)
    {
      id v9 = 0;
      if (!a3) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    fault = self->_fault;
    self->_fault = 0;

    [(LACBiometryHelper *)self _setup];
    uint64_t v6 = [(LACBiometryHelper *)self fault];
  }
  id v9 = (void *)v6;
  if (a3) {
LABEL_6:
  }
    *a3 = v9;
LABEL_7:

  return v9 == 0;
}

- (NSError)permanentError
{
  return self->_permanentError;
}

- (NSError)fault
{
  return self->_fault;
}

BOOL __73__LACBiometryHelper__isEnrolled_adminOnly_hardwareMustBeAvailable_error___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _identitiesForUser:*(void *)(a1 + 40) adminOnly:*(unsigned __int8 *)(a1 + 48)];
  v2 = v1;
  if (v1) {
    BOOL v3 = [v1 count] != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)_identitiesForUser:(id)a3 adminOnly:(BOOL)a4
{
  id v6 = a3;
  v7 = LACLogBiometry();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[LACBiometryHelper _identitiesForUser:adminOnly:]();
  }

  if (!self->_identities || ![(LACBiometryHelper *)self _shouldCacheIdentities]) {
    [(LACBiometryHelper *)self _refreshIdentitiesDueToAccessoryChange:0];
  }
  v8 = objc_opt_new();
  identities = self->_identities;
  if (v6)
  {
    uint64_t v10 = [(NSDictionary *)identities objectForKeyedSubscript:v6];
    id v11 = (void *)v10;
    if (v10) {
      uint64_t v12 = v10;
    }
    else {
      uint64_t v12 = MEMORY[0x263EFFA68];
    }
    [v8 setObject:v12 forKeyedSubscript:v6];
  }
  else
  {
    id v11 = v8;
    v8 = (void *)[(NSDictionary *)identities mutableCopy];
  }

  v13 = [MEMORY[0x263EFF980] array];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __50__LACBiometryHelper__identitiesForUser_adminOnly___block_invoke;
  v16[3] = &unk_2653B61A8;
  BOOL v18 = a4;
  id v14 = v13;
  id v17 = v14;
  [v8 enumerateKeysAndObjectsUsingBlock:v16];

  return v14;
}

- (BOOL)_shouldCacheIdentities
{
  return 1;
}

- (id)_errorDisconnected:(BOOL)a3 notEnrolled:(BOOL)a4
{
  if (a4)
  {
    v5 = +[LACError errorWithCode:-7 debugDescription:@"No identities are enrolled."];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)isEnrolled:(id)a3 error:(id *)a4
{
  return [(LACBiometryHelper *)self _isEnrolled:a3 adminOnly:0 hardwareMustBeAvailable:1 error:a4];
}

void __50__LACBiometryHelper__identitiesForUser_adminOnly___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (!*(unsigned char *)(a1 + 40)
    || (+[LACADMUser findUserByID:searchParent:](LACADMUser, "findUserByID:searchParent:", [v8 unsignedIntegerValue], 0), id v6 = objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "isAdministrator"), v6, v7))
  {
    [*(id *)(a1 + 32) addObjectsFromArray:v5];
  }
}

uint64_t __35__LACBiometryHelper_sharedInstance__block_invoke()
{
  if (+[LACMobileGestalt deviceHasFaceID]) {
    +[LACBiometryHelper faceIdInstance];
  }
  else {
  sharedInstance_sharedInstance_0 = +[LACBiometryHelper touchIdInstance];
  }
  return MEMORY[0x270F9A758]();
}

+ (id)touchIdInstance
{
  if (touchIdInstance_onceToken != -1) {
    dispatch_once(&touchIdInstance_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)touchIdInstance_touchIdInstance;
  return v2;
}

uint64_t __36__LACBiometryHelper_touchIdInstance__block_invoke()
{
  touchIdInstance_touchIdInstance = [[LACBiometryHelper alloc] initWithBiometryType:1];
  return MEMORY[0x270F9A758]();
}

+ (id)faceIdInstance
{
  if (faceIdInstance_onceToken != -1) {
    dispatch_once(&faceIdInstance_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)faceIdInstance_faceIdInstance;
  return v2;
}

uint64_t __35__LACBiometryHelper_faceIdInstance__block_invoke()
{
  faceIdInstance_faceIdInstance = [[LACBiometryHelper alloc] initWithBiometryType:2];
  return MEMORY[0x270F9A758]();
}

- (LACBiometryHelper)initWithBiometryType:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)LACBiometryHelper;
  uint64_t v4 = [(LACBiometryHelper *)&v9 init];
  id v5 = v4;
  if (v4)
  {
    v4->_deviceType = a3;
    uint64_t v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v6;

    [(LACBiometryHelper *)v5 _setup];
  }
  return v5;
}

- (void)_setup
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (+[LACMobileGestalt isSharedIPad])
  {
    id v16 = +[LACError errorWithCode:-6 debugDescription:@"Biometry not supported in Shared iPad mode"];
    [(LACBiometryHelper *)self _setupWithPermanentError:v16];
  }
  else
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    BOOL v3 = (void *)getBKDeviceManagerClass_softClass;
    uint64_t v24 = getBKDeviceManagerClass_softClass;
    if (!getBKDeviceManagerClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v27 = __getBKDeviceManagerClass_block_invoke;
      v28 = &unk_2653B5600;
      v29 = &v21;
      BiometricKitLibraryCore();
      Class Class = objc_getClass("BKDeviceManager");
      *(void *)(v29[1] + 24) = Class;
      getBKDeviceManagerClass_softClass Class = *(void *)(v29[1] + 24);
      BOOL v3 = (void *)v22[3];
    }
    id v5 = v3;
    _Block_object_dispose(&v21, 8);
    if (v5)
    {
      uint64_t v6 = [v5 availableDevices];
      if (v6)
      {
        int v7 = LACLogBiometry();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v6;
          _os_log_impl(&dword_254F14000, v7, OS_LOG_TYPE_DEFAULT, "Available devices: %@", (uint8_t *)&buf, 0xCu);
        }

        if ([v6 count]
          || ![(LACBiometryHelper *)self _shouldRetryAvailableDevices])
        {
          long long v19 = 0u;
          long long v20 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          id v9 = v6;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v18;
            while (2)
            {
              for (uint64_t i = 0; i != v10; ++i)
              {
                if (*(void *)v18 != v11) {
                  objc_enumerationMutation(v9);
                }
                v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
                uint64_t v14 = [v13 type];
                if (v14 == [(LACBiometryHelper *)self deviceType])
                {
                  [(LACBiometryHelper *)self _setupDeviceWithDescriptor:v13];

                  goto LABEL_26;
                }
              }
              uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }

          uint64_t v15 = +[LACError errorWithCode:-6 debugDescription:@"Biometry is not available on this device."];
          [(LACBiometryHelper *)self _setupWithPermanentError:v15];
        }
        else
        {
          id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Unexpected failure to enumerate device of type %d", -[LACBiometryHelper deviceType](self, "deviceType"));
          [(LACBiometryHelper *)self _setupWithFault:v8];
        }
      }
      else
      {
        [(LACBiometryHelper *)self _setupWithFault:@"Failed to enumerate biometric devices"];
      }
LABEL_26:
    }
    else
    {
      [(LACBiometryHelper *)self _setupWithFault:@"Failed to acquire device manager class"];
    }
  }
}

- (BOOL)_shouldRetryAvailableDevices
{
  int64_t v3 = [(LACBiometryHelper *)self deviceType];
  if (v3 == 2)
  {
    return +[LACMobileGestalt deviceHasFaceID];
  }
  else if (v3 == 1)
  {
    return +[LACMobileGestalt deviceHasTouchID];
  }
  else
  {
    id v5 = LACLogBiometry();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(LACBiometryHelper *)self _shouldRetryAvailableDevices];
    }

    return 0;
  }
}

- (void)_setupWithFault:(id)a3
{
  id v4 = a3;
  id v5 = +[LACError errorWithCode:-1000 debugDescription:v4];
  fault = self->_fault;
  self->_fault = v5;

  int v7 = LACLogBiometry();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    -[LACBiometryHelper _setupWithFault:]();
  }
}

- (void)_setupWithPermanentError:(id)a3
{
}

- (void)_setupDeviceWithDescriptor:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2050000000;
  id v5 = (void *)getBKDeviceClass_softClass;
  uint64_t v27 = getBKDeviceClass_softClass;
  if (!getBKDeviceClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v29 = __getBKDeviceClass_block_invoke;
    uint64_t v30 = &unk_2653B5600;
    v31 = &v24;
    BiometricKitLibraryCore();
    Class Class = objc_getClass("BKDevice");
    *(void *)(v31[1] + 24) = Class;
    getBKDeviceClass_softClass Class = *(void *)(v31[1] + 24);
    id v5 = (void *)v25[3];
  }
  id v7 = v5;
  _Block_object_dispose(&v24, 8);
  if (v7)
  {
    id v23 = 0;
    id v8 = [v7 deviceWithDescriptor:v4 error:&v23];
    id v9 = v23;
    device = self->_device;
    self->_device = v8;

    uint64_t v11 = self->_device;
    if (v11)
    {
      uint64_t v12 = [(BKDevice *)v11 descriptor];
      uint64_t v13 = [v12 type];

      if (v13 == 1)
      {
        uint64_t v14 = &LACBiometryTypeTouchID;
LABEL_11:
        self->_biometryType = *v14;
        id v16 = (NSMutableDictionary *)objc_opt_new();
        databaseHashesByUserId = self->_databaseHashesByUserId;
        self->_databaseHashesByUserId = v16;

        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)BiometricKitNotificationCallback, @"com.apple.BiometricKit.enrollmentChanged", 0, (CFNotificationSuspensionBehavior)0);
        long long v19 = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(v19, self, (CFNotificationCallback)BiometricKitNotificationCallback, @"com.apple.BiometricKit.generalLockoutStateChanged", 0, (CFNotificationSuspensionBehavior)0);
        uint64_t v15 = LACLogBiometry();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          long long v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "type"));
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v20;
          _os_log_impl(&dword_254F14000, v15, OS_LOG_TYPE_DEFAULT, "Device created successfully with type: %@", (uint8_t *)&buf, 0xCu);
        }
        goto LABEL_14;
      }
      if (v13 == 2)
      {
        uint64_t v14 = &LACBiometryTypeFaceID;
        goto LABEL_11;
      }
      uint64_t v21 = NSString;
      uint64_t v15 = [(BKDevice *)self->_device descriptor];
      v22 = objc_msgSend(v21, "stringWithFormat:", @"Unknown device type: %d", -[NSObject type](v15, "type"));
      [(LACBiometryHelper *)self _setupWithFault:v22];
    }
    else
    {
      uint64_t v15 = [NSString stringWithFormat:@"Failed to create device with %@: %@", v4, v9];
      [(LACBiometryHelper *)self _setupWithFault:v15];
    }
LABEL_14:

    goto LABEL_15;
  }
  [(LACBiometryHelper *)self _setupWithFault:@"Failed to acquire device class"];
LABEL_15:
}

- (void)dealloc
{
  if (self->_device)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.BiometricKit.enrollmentChanged", 0);
    id v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v4, self, @"com.apple.BiometricKit.generalLockoutStateChanged", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)LACBiometryHelper;
  [(LACBiometryHelper *)&v5 dealloc];
}

- (OS_dispatch_queue)workQueue
{
  return +[LACConcurrencyUtilities daemonQueue];
}

- (NSDictionary)adminIdentities
{
  if ([(NSDictionary *)self->_identities count])
  {
    int64_t v3 = objc_opt_new();
    identities = self->_identities;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __36__LACBiometryHelper_adminIdentities__block_invoke;
    v9[3] = &unk_2653B60E8;
    id v10 = v3;
    id v5 = v3;
    [(NSDictionary *)identities enumerateKeysAndObjectsUsingBlock:v9];
    if ([v5 count]) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  return (NSDictionary *)v7;
}

void __36__LACBiometryHelper_adminIdentities__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = +[LACADMUser findUserByID:searchParent:](LACADMUser, "findUserByID:searchParent:", [v8 unsignedIntegerValue], 0);
  int v7 = [v6 isAdministrator];

  if (v7) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v8];
  }
}

- (BOOL)isAnyUserEnrolledWithError:(id *)a3
{
  return [(LACBiometryHelper *)self _isEnrolled:0 adminOnly:0 hardwareMustBeAvailable:1 error:a3];
}

- (BOOL)isEnrolledWithoutHardware:(id)a3 error:(id *)a4
{
  return [(LACBiometryHelper *)self _isEnrolled:a3 adminOnly:0 hardwareMustBeAvailable:0 error:a4];
}

- (BOOL)isAnyUserEnrolledWithAdminRole:(BOOL)a3 error:(id *)a4
{
  return [(LACBiometryHelper *)self _isEnrolled:0 adminOnly:a3 hardwareMustBeAvailable:1 error:a4];
}

- (id)lockoutErrorForState:(int64_t)a3 userId:(id)a4
{
  if ((unint64_t)(a3 - 1) > 7) {
    +[LACError errorWithCode:-8 subcode:-1 debugDescription:@"Unknown lockout state"];
  }
  else {
  id v4 = [(LACBiometryHelper *)self _lockoutErrorForExtendedState:qword_254FD0310[a3 - 1] userId:a4];
  }
  return v4;
}

uint64_t __49__LACBiometryHelper_lockoutErrorForState_userId___block_invoke(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 7) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return qword_254FD0310[v1];
  }
}

- (id)_biolockoutStateForUser:(id)a3 request:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (![(LACBiometryHelper *)self deviceHasBiometryWithError:a5]) {
    goto LABEL_11;
  }
  biolockoutStateCache = self->_biolockoutStateCache;
  if (!biolockoutStateCache)
  {
    objc_initWeak(&location, self);
    uint64_t v11 = [LACCacheSync alloc];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __59__LACBiometryHelper__biolockoutStateForUser_request_error___block_invoke;
    v20[3] = &unk_2653B6158;
    objc_copyWeak(&v21, &location);
    v20[4] = self;
    uint64_t v12 = [(LACCacheSync *)v11 initWithTimeout:v20 block:0.5];
    uint64_t v13 = self->_biolockoutStateCache;
    self->_biolockoutStateCache = v12;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    biolockoutStateCache = self->_biolockoutStateCache;
  }
  uint64_t v14 = [(LACCacheSync *)biolockoutStateCache valueWithParameter:v8 error:a5];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = [v14 integerValue];
    if (![v9 isPurposeUnlock]) {
      v16 &= 0xFFFFFFFFFFFFFF6FLL;
    }
    if ([v9 isPurposeApplePay]) {
      unint64_t v17 = v16;
    }
    else {
      unint64_t v17 = v16 & 0xFFFFFFFFFFFFFFDFLL;
    }
    long long v18 = [NSNumber numberWithInteger:v17];
  }
  else
  {
LABEL_11:
    long long v18 = 0;
  }

  return v18;
}

id __59__LACBiometryHelper__biolockoutStateForUser_request_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v10 = 0;
    int v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "extendedBioLockoutState:forUser:error:", &v10, objc_msgSend(*(id *)(a1 + 32), "_uidFromUserId:", v5), a3);
    id v8 = 0;
    if (v7)
    {
      id v8 = [NSNumber numberWithInteger:v10];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_lockoutErrorForExtendedState:(int64_t)a3 userId:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a3)
  {
    if (a3)
    {
      uint64_t v11 = @"Biometry is not available before first unlock.";
      id v8 = &LACErrorSubcodeBeforeFirstUnlock;
    }
    else if ((a3 & 2) != 0)
    {
      uint64_t v11 = @"Biometry is not available in passcode lockout.";
      id v8 = &LACErrorSubcodePasscodeLockout;
    }
    else if ((a3 & 8) != 0)
    {
      uint64_t v11 = @"Identification lockout";
      id v8 = &LACErrorSubcodeIdentificationLockout;
    }
    else if ((a3 & 4) != 0)
    {
      uint64_t v11 = @"Biometry is locked out.";
      id v8 = &LACErrorSubcodeBioLockout;
    }
    else if ((a3 & 0x90) != 0)
    {
      BOOL v7 = [(LACBiometryHelper *)self isBiometryOnForUnlock:v6];
      id v8 = (uint64_t *)&LACErrorSubcodeDisabledForUnlock;
      id v9 = &LACErrorSubcodeTokenDropped;
      if ((a3 & 0x80) == 0) {
        id v9 = &LACErrorSubcodeTokenExpired;
      }
      uint64_t v10 = @"Token for device unlock has been dropped.";
      if ((a3 & 0x80) == 0) {
        uint64_t v10 = @"Token for device unlock has expired.";
      }
      if (v7)
      {
        id v8 = v9;
        uint64_t v11 = v10;
      }
      else
      {
        uint64_t v11 = @"Biometry is disabled for unlock.";
      }
    }
    else
    {
      id v8 = (uint64_t *)&LACErrorSubcodeDisabledForApplePay;
      uint64_t v12 = &LACErrorSubcodeFaceIDInterlocked;
      if ((a3 & 0x40) == 0) {
        uint64_t v12 = &LACErrorSubcodeUnknown;
      }
      uint64_t v13 = @"Face ID interlocked";
      if ((a3 & 0x40) == 0) {
        uint64_t v13 = @"Unknown lockout state";
      }
      if ((a3 & 0x20) != 0)
      {
        uint64_t v11 = @"Biometry is disabled for ApplePay";
      }
      else
      {
        id v8 = v12;
        uint64_t v11 = v13;
      }
    }
  }
  else
  {
    uint64_t v11 = 0;
    id v8 = &LACErrorSubcodeNone;
  }
  if (*v8)
  {
    uint64_t v14 = +[LACError errorWithCode:-8 subcode:*v8 debugDescription:v11];
    uint64_t v15 = LACLogBiometry();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v17[0] = 67109378;
      v17[1] = a3;
      __int16 v18 = 2114;
      long long v19 = v14;
      _os_log_impl(&dword_254F14000, v15, OS_LOG_TYPE_INFO, "lockoutErrorForExtendedState:%d returned %{public}@", (uint8_t *)v17, 0x12u);
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)biometryLostErrorForUser:(id)a3 request:(id)a4
{
  id v10 = 0;
  BOOL v4 = [(LACBiometryHelper *)self isLockedOutForUser:a3 request:a4 error:&v10];
  id v5 = v10;
  id v6 = v5;
  if (v4)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[LACError errorWithCode:-4 subcode:18 debugDescription:@"Biometry lost."];
  }
  id v8 = v7;

  return v8;
}

- (BOOL)isNotLockedOutForAnyUserWithAdminRole:(BOOL)a3 request:(id)a4 error:(id *)a5
{
  return [(LACBiometryHelper *)self isLockedOutForUser:0 adminOnly:a3 request:a4 error:a5];
}

- (BOOL)isLockedOutForUser:(id)a3 request:(id)a4 error:(id *)a5
{
  return [(LACBiometryHelper *)self isLockedOutForUser:a3 adminOnly:0 request:a4 error:a5];
}

- (BOOL)isLockedOutForUser:(id)a3 adminOnly:(BOOL)a4 request:(id)a5 error:(id *)a6
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = LACLogBiometry();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[LACBiometryHelper isLockedOutForUser:adminOnly:request:error:]();
  }

  if ([(LACBiometryHelper *)self deviceHasBiometryWithError:a6])
  {
    uint64_t v42 = 0;
    v43[0] = &v42;
    v43[1] = 0x3032000000;
    v43[2] = __Block_byref_object_copy__1;
    v43[3] = __Block_byref_object_dispose__1;
    id v44 = 0;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__1;
    v40 = __Block_byref_object_dispose__1;
    id v41 = 0;
    if (v10)
    {
      id obj = 0;
      uint64_t v13 = [(LACBiometryHelper *)self _biolockoutStateForUser:v10 request:v11 error:&obj];
      objc_storeStrong(&v44, obj);
      uint64_t v14 = (void *)v37[5];
      v37[5] = v13;
    }
    else
    {
      identities = self->_identities;
      if (!identities)
      {
        [(LACBiometryHelper *)self _refreshIdentitiesDueToAccessoryChange:0];
        identities = self->_identities;
      }
      uint64_t v14 = [(NSDictionary *)identities allKeys];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __64__LACBiometryHelper_isLockedOutForUser_adminOnly_request_error___block_invoke;
      v30[3] = &unk_2653B6180;
      BOOL v34 = a4;
      v30[4] = self;
      id v31 = v11;
      uint64_t v32 = &v42;
      v33 = &v36;
      [v14 enumerateObjectsUsingBlock:v30];
    }
    unint64_t v17 = (void *)v37[5];
    if (v17)
    {
      uint64_t v18 = -[LACBiometryHelper _lockoutErrorForExtendedState:userId:](self, "_lockoutErrorForExtendedState:userId:", [v17 integerValue], v10);
      long long v19 = *(NSObject **)(v43[0] + 40);
      *(void *)(v43[0] + 40) = v18;
    }
    else
    {
      long long v19 = LACLogBiometry();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[LACBiometryHelper isLockedOutForUser:adminOnly:request:error:]((uint64_t)v43, v19, v20, v21, v22, v23, v24, v25);
      }
    }

    if (a6) {
      *a6 = *(id *)(v43[0] + 40);
    }
    if (*(void *)(v43[0] + 40))
    {
      uint64_t v26 = LACLogBiometry();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = *(void *)(v43[0] + 40);
        int v28 = [v11 purpose];
        *(_DWORD *)long long buf = 138543874;
        id v46 = v10;
        __int16 v47 = 2114;
        uint64_t v48 = v27;
        __int16 v49 = 1024;
        int v50 = v28;
        _os_log_impl(&dword_254F14000, v26, OS_LOG_TYPE_DEFAULT, "User %{public}@ is locked out: %{public}@, purpose:%d", buf, 0x1Cu);
      }

      BOOL v15 = *(void *)(v43[0] + 40) != 0;
    }
    else
    {
      BOOL v15 = 0;
    }
    _Block_object_dispose(&v36, 8);

    _Block_object_dispose(&v42, 8);
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

void __64__LACBiometryHelper_isLockedOutForUser_adminOnly_request_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6 = a2;
  id v7 = v6;
  if (!*(unsigned char *)(a1 + 64)
    || (+[LACADMUser findUserByID:searchParent:](LACADMUser, "findUserByID:searchParent:", [v6 unsignedIntegerValue], 0), v8 = objc_claimAutoreleasedReturnValue(), int v9 = objc_msgSend(v8, "isAdministrator"), v8, v9))
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v12 + 40);
    uint64_t v13 = [v10 _biolockoutStateForUser:v7 request:v11 error:&obj];
    objc_storeStrong((id *)(v12 + 40), obj);
    if (v13)
    {
      if (([v13 intValue] & 4) == 0 && (objc_msgSend(v13, "intValue") & 8) == 0)
      {
        uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
LABEL_8:
        objc_storeStrong((id *)(v14 + 40), v13);
        *a4 = [v13 integerValue] == 0;
        goto LABEL_9;
      }
      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
      if (!*(void *)(v14 + 40)) {
        goto LABEL_8;
      }
    }
LABEL_9:
  }
}

- (id)biometryDatabaseHashForUser:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![(LACBiometryHelper *)self deviceHasBiometryWithError:a4])
  {
    id v10 = 0;
    goto LABEL_9;
  }
  uint64_t v7 = [(LACBiometryHelper *)self _uidFromUserId:v6];
  databaseHashesByUserId = self->_databaseHashesByUserId;
  int v9 = [NSNumber numberWithUnsignedInt:v7];
  id v10 = [(NSMutableDictionary *)databaseHashesByUserId objectForKeyedSubscript:v9];

  if (v10)
  {
    if (!a4) {
      goto LABEL_9;
    }
LABEL_8:
    *a4 = 0;
    goto LABEL_9;
  }
  id v10 = [(BKDevice *)self->_device identitiesDatabaseHashForUser:[(LACBiometryHelper *)self _uidFromUserId:v6] error:a4];
  if (v10)
  {
    uint64_t v11 = self->_databaseHashesByUserId;
    uint64_t v12 = [NSNumber numberWithUnsignedInt:v7];
    [(NSMutableDictionary *)v11 setObject:v10 forKey:v12];

    if (a4) {
      goto LABEL_8;
    }
  }
LABEL_9:

  return v10;
}

- (void)_clearHashes
{
}

- (id)catacombUUID:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = 0;
  if ([(LACBiometryHelper *)self deviceHasBiometryWithError:0])
  {
    device = self->_device;
    id v11 = 0;
    uint64_t v7 = [(BKDevice *)device identitiesDatabaseUUIDForUser:[(LACBiometryHelper *)self _uidFromUserId:v4] error:&v11];
    id v8 = v11;
    if (v7)
    {
      v12[0] = 0;
      v12[1] = 0;
      [v7 getUUIDBytes:v12];
      id v5 = [MEMORY[0x263EFF8F8] dataWithBytes:v12 length:16];
    }
    else
    {
      int v9 = LACLogBiometry();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[LACBiometryHelper catacombUUID:]();
      }

      id v5 = 0;
    }
  }
  return v5;
}

- (BOOL)userPresent:(BOOL *)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (![(LACBiometryHelper *)self deviceHasBiometryWithError:a4]) {
    return 0;
  }
  device = self->_device;
  id v20 = 0;
  id v8 = [(BKDevice *)device createPresenceDetectOperationWithError:&v20];
  id v9 = v20;
  if (!v8)
  {
LABEL_7:
    if (v9) {
      goto LABEL_8;
    }
LABEL_19:
    uint64_t v13 = 0;
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  [v8 setPriority:50];
  id v19 = v9;
  int v10 = [v8 startWithError:&v19];
  id v11 = v19;

  if (v10)
  {
    id v18 = v11;
    uint64_t v12 = [v8 userPresentWithError:&v18];
    id v9 = v18;

    [v8 cancel];
    if (v12) {
      *a3 = [v12 BOOLValue];
    }

    goto LABEL_7;
  }
  id v9 = v11;
  if (!v11) {
    goto LABEL_19;
  }
LABEL_8:
  uint64_t v13 = +[LACError errorWithCode:-1000 underlyingError:v9 debugDescription:@"Failed to determine user presence status."];

  if (a4) {
LABEL_9:
  }
    *a4 = v13;
LABEL_10:
  uint64_t v14 = LACLogBiometry();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v15 = v13;
    if (!v13)
    {
      BOOL v15 = [NSNumber numberWithBool:*a3];
    }
    *(_DWORD *)long long buf = 138543362;
    uint64_t v22 = v15;
    _os_log_impl(&dword_254F14000, v14, OS_LOG_TYPE_DEFAULT, "User present: %{public}@", buf, 0xCu);
    if (!v13) {
  }
    }
  BOOL v16 = v13 == 0;

  return v16;
}

- (id)_protectedConfigurationForUser:(id)a3
{
  id v4 = a3;
  id v5 = 0;
  if ([(LACBiometryHelper *)self deviceHasBiometryWithError:0])
  {
    device = self->_device;
    id v10 = 0;
    id v5 = [(BKDevice *)device effectiveProtectedConfigurationForUser:[(LACBiometryHelper *)self _uidFromUserId:v4] error:&v10];
    id v7 = v10;
    if (!v5)
    {
      id v8 = LACLogBiometry();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[LACBiometryHelper _protectedConfigurationForUser:]();
      }
    }
  }

  return v5;
}

- (BOOL)isBiometryOnForApplePay:(id)a3
{
  int64_t v3 = [(LACBiometryHelper *)self _protectedConfigurationForUser:a3];
  id v4 = [v3 applePayEnabled];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)isBiometryOnForUnlock:(id)a3
{
  int64_t v3 = [(LACBiometryHelper *)self _protectedConfigurationForUser:a3];
  id v4 = [v3 unlockEnabled];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)isIdentificationEnabled:(id)a3
{
  int64_t v3 = [(LACBiometryHelper *)self _protectedConfigurationForUser:a3];
  id v4 = [v3 identificationEnabled];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)isPeriocularMatchingEnabledForUser:(id)a3
{
  int64_t v3 = [(LACBiometryHelper *)self _protectedConfigurationForUser:a3];
  id v4 = [v3 periocularFaceIDMatchEnabled];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)_refreshIdentitiesDueToAccessoryChange:(BOOL)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  device = self->_device;
  if (device)
  {
    BOOL v5 = a3;
    id v43 = 0;
    id v6 = [(BKDevice *)device identitiesWithError:&v43];
    id v7 = v43;
    id v8 = v7;
    identities = self->_identities;
    if (!v6)
    {
      self->_identities = 0;

      p_super = LACLogBiometry();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        -[LACBiometryHelper _refreshIdentitiesDueToAccessoryChange:]();
      }
      goto LABEL_26;
    }
    id location = (id *)&self->_identities;
    v35 = self;
    BOOL v33 = v5;
    id v37 = v7;
    uint64_t v36 = identities;
    id v10 = objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v38 = v6;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v40 != v14) {
            objc_enumerationMutation(v11);
          }
          BOOL v16 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          unint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v16, "userID"));
          id v18 = [v10 objectForKeyedSubscript:v17];
          id v19 = v18;
          if (v18) {
            id v20 = v18;
          }
          else {
            id v20 = (id)objc_opt_new();
          }
          uint64_t v21 = v20;

          [v21 addObject:v16];
          uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v16, "userID"));
          [v10 setObject:v21 forKey:v22];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v13);
    }

    objc_storeStrong(location, v10);
    p_super = &v36->super;
    if ([(LACBiometryHelper *)v35 _shouldCacheIdentities]
      || ([*location isEqualToDictionary:v36] & 1) == 0)
    {
      uint64_t v24 = LACLogBiometry();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = *location;
        *(_DWORD *)long long buf = 138543618;
        v45 = v36;
        __int16 v46 = 2114;
        id v47 = v25;
        _os_log_impl(&dword_254F14000, v24, OS_LOG_TYPE_DEFAULT, "Identities updated from %{public}@ to %{public}@", buf, 0x16u);
      }
    }
    uint64_t v26 = [(LACBiometryHelper *)v35 delegate];
    uint64_t v27 = [v26 currentMatchingOperationUserId];

    id v6 = v38;
    if (v27)
    {
      if ([v27 intValue] == -1)
      {
        if ([v10 count]) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t v28 = [(NSDictionary *)v36 objectForKeyedSubscript:v27];
        if (!v28) {
          goto LABEL_23;
        }
        v29 = (void *)v28;
        uint64_t v30 = [v10 objectForKeyedSubscript:v27];

        if (v30) {
          goto LABEL_23;
        }
      }
      id v31 = [(LACBiometryHelper *)v35 delegate];
      uint64_t v32 = [(LACBiometryHelper *)v35 _errorDisconnected:v33 notEnrolled:1];
      [v31 unEnrolledWithError:v32];
    }
LABEL_23:
    [(LACBiometryHelper *)v35 _clearHashes];

    id v8 = v37;
LABEL_26:
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_handleEnrollmentChangedNotification
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int64_t v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = [(NSHashTable *)self->_observers allObjects];
  BOOL v5 = [v3 arrayWithArray:v4];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 biometryEnrolledStateDidChangeForHelper:self];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_handleLockoutStateChangedNotification
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int64_t v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = [(NSHashTable *)self->_observers allObjects];
  BOOL v5 = [v3 arrayWithArray:v4];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 biometryLockoutStateDidChangeForHelper:self];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_handleAccessoriesChangedNotification
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int64_t v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = [(NSHashTable *)self->_observers allObjects];
  BOOL v5 = [v3 arrayWithArray:v4];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 biometryAccessoriesDidChangeForHelper:self];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)resetBiometry
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "dropAllUnlockTokens failed: %{public}@", v2, v3, v4, v5, v6);
}

- (id)dumpStatus
{
  v26[1] = *MEMORY[0x263EF8340];
  id v25 = @"biometryType";
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[LACBiometryHelper biometryType](self, "biometryType"));
  v26[0] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];

  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v4];
  id v23 = 0;
  BOOL v6 = [(LACBiometryHelper *)self isAnyUserEnrolledWithError:&v23];
  id v7 = v23;
  if (v6)
  {
    id v17 = v7;
    id v18 = v4;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v8 = [(NSDictionary *)self->_identities allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          long long v14 = [(LACBiometryHelper *)self _dumpEnvironmentForUser:v13];
          BOOL v15 = [NSString stringWithFormat:@"user %@", v13];
          [v5 setObject:v14 forKey:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v10);
    }

    id v7 = v17;
    uint64_t v4 = v18;
  }

  return v5;
}

- (id)_dumpEnvironmentForUser:(id)a3
{
  v27[8] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v26[0] = @"catacombUUID";
  long long v21 = [(LACBiometryHelper *)self catacombUUID:v4];
  uint64_t v5 = [v21 description];
  BOOL v6 = (void *)v5;
  id v7 = @"nil";
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  v27[0] = v7;
  v26[1] = @"biometryDbHash";
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __45__LACBiometryHelper__dumpEnvironmentForUser___block_invoke;
  v24[3] = &unk_2653B61D0;
  v24[4] = self;
  id v8 = v4;
  id v25 = v8;
  long long v20 = __45__LACBiometryHelper__dumpEnvironmentForUser___block_invoke((uint64_t)v24);
  v27[1] = v20;
  v26[2] = @"identities";
  uint64_t v9 = NSNumber;
  uint64_t v10 = [(NSDictionary *)self->_identities objectForKeyedSubscript:v8];
  uint64_t v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  v27[2] = v11;
  void v26[3] = @"lockoutState";
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __45__LACBiometryHelper__dumpEnvironmentForUser___block_invoke_2;
  v22[3] = &unk_2653B61F8;
  v22[4] = self;
  id v23 = v8;
  id v12 = v8;
  uint64_t v13 = __45__LACBiometryHelper__dumpEnvironmentForUser___block_invoke_2((uint64_t)v22);
  v27[3] = v13;
  v26[4] = @"unlock";
  long long v14 = objc_msgSend(NSNumber, "numberWithBool:", -[LACBiometryHelper isBiometryOnForUnlock:](self, "isBiometryOnForUnlock:", v12));
  v27[4] = v14;
  v26[5] = @"ApplePay";
  BOOL v15 = objc_msgSend(NSNumber, "numberWithBool:", -[LACBiometryHelper isBiometryOnForApplePay:](self, "isBiometryOnForApplePay:", v12));
  v27[5] = v15;
  v26[6] = @"periocular";
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", -[LACBiometryHelper isPeriocularMatchingEnabledForUser:](self, "isPeriocularMatchingEnabledForUser:", v12));
  v27[6] = v16;
  v26[7] = @"identification";
  id v17 = objc_msgSend(NSNumber, "numberWithBool:", -[LACBiometryHelper isIdentificationEnabled:](self, "isIdentificationEnabled:", v12));
  v27[7] = v17;
  id v18 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:8];

  return v18;
}

id __45__LACBiometryHelper__dumpEnvironmentForUser___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v10 = 0;
  uint64_t v3 = [v2 biometryDatabaseHashForUser:v1 error:&v10];
  id v4 = v10;
  uint64_t v5 = [v3 description];
  BOOL v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v4 description];
  }
  id v8 = v7;

  return v8;
}

id __45__LACBiometryHelper__dumpEnvironmentForUser___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = 0;
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v2 = [*(id *)(a1 + 32) _uidFromUserId:*(void *)(a1 + 40)];
  id v8 = 0;
  char v3 = [v1 extendedBioLockoutState:&v9 forUser:v2 error:&v8];
  id v4 = v8;
  uint64_t v5 = v4;
  if (v3) {
    [NSNumber numberWithInteger:v9];
  }
  else {
  BOOL v6 = [v4 description];
  }

  return v6;
}

- (NSDictionary)identities
{
  return self->_identities;
}

- (BKDevice)device
{
  return self->_device;
}

- (LACBiometryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (LACBiometryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_permanentError, 0);
  objc_storeStrong((id *)&self->_fault, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_biolockoutStateCache, 0);
  objc_storeStrong((id *)&self->_databaseHashesByUserId, 0);
}

- (void)_shouldRetryAvailableDevices
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = 67109120;
  v3[1] = [a1 deviceType];
  _os_log_fault_impl(&dword_254F14000, a2, OS_LOG_TYPE_FAULT, "Unexpected biometry type: %d", (uint8_t *)v3, 8u);
}

- (void)_setupWithFault:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_2();
  _os_log_fault_impl(&dword_254F14000, v0, OS_LOG_TYPE_FAULT, "%{public}@", v1, 0xCu);
}

- (void)isLockedOutForUser:(uint64_t)a3 adminOnly:(uint64_t)a4 request:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)isLockedOutForUser:adminOnly:request:error:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_254F14000, v0, OS_LOG_TYPE_DEBUG, "isLockedOutForUser() - UID: %{public}@, request: %{public}@.", v1, 0x16u);
}

- (void)catacombUUID:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "Failed to determine catacomb UUID: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_protectedConfigurationForUser:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_254F14000, v0, OS_LOG_TYPE_ERROR, "Failed to get protected configuration for user %{public}@: %{public}@", v1, 0x16u);
}

- (void)_identitiesForUser:adminOnly:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_2();
  __int16 v3 = 1026;
  int v4 = v0;
  _os_log_debug_impl(&dword_254F14000, v1, OS_LOG_TYPE_DEBUG, "_identitiesForUser() - UID: %{public}@ adminOnly: %{public}d", v2, 0x12u);
}

- (void)_refreshIdentitiesDueToAccessoryChange:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_254F14000, v0, v1, "Failed to read identities: %@", v2, v3, v4, v5, v6);
}

@end