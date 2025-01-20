@interface HFCharacteristicNotificationManager
+ (HFCharacteristicNotificationStateContaining)notificationsStateContainer;
+ (id)sharedManager;
+ (void)setOverrideNotificationsStateContainer:(id)a3;
- (BOOL)cacheUpToDateWithNotificationsEnabledForCharacteristic:(id)a3 inHome:(id)a4;
- (BOOL)notificationsEnabled;
- (BOOL)notificationsEnabledForCharacteristic:(id)a3 inHome:(id)a4;
- (BOOL)notificationsReasonsExist;
- (HFCharacteristicNotificationManager)init;
- (HMHome)notificationsEnabledHome;
- (NSDate)lastNotificationsEnableRequestDate;
- (NSMutableSet)notificationsEnabledReasons;
- (id)lastNotificationsEnableRequestDateForCharacteristic:(id)a3 forHome:(id)a4;
- (void)_updateNotificationsEnabled;
- (void)_updateNotificationsEnabledWithNumberOfAppleMediaAccessories:(unint64_t)a3;
- (void)disableNotificationsForSelectedHomeWithReason:(id)a3;
- (void)enableNotificationsForSelectedHomeWithReason:(id)a3;
- (void)enableNotificationsForSelectedHomeWithReason:(id)a3 numberOfAppleMediaAccessories:(unint64_t)a4;
- (void)setLastNotificationsEnableRequestDate:(id)a3;
- (void)setNotificationsEnabledHome:(id)a3;
@end

@implementation HFCharacteristicNotificationManager

- (id)lastNotificationsEnableRequestDateForCharacteristic:(id)a3 forHome:(id)a4
{
  id v5 = a4;
  v6 = [(HFCharacteristicNotificationManager *)self notificationsEnabledHome];
  v7 = [v6 uniqueIdentifier];
  v8 = [v5 uniqueIdentifier];

  LODWORD(v5) = [v7 isEqual:v8];
  if (v5)
  {
    v9 = [(HFCharacteristicNotificationManager *)self lastNotificationsEnableRequestDate];
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (HMHome)notificationsEnabledHome
{
  return self->_notificationsEnabledHome;
}

- (NSDate)lastNotificationsEnableRequestDate
{
  return self->_lastNotificationsEnableRequestDate;
}

+ (HFCharacteristicNotificationStateContaining)notificationsStateContainer
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (_notificationsStateContainer)
  {
    id v3 = (id)_notificationsStateContainer;
  }
  else
  {
    id v3 = [v2 sharedManager];
  }
  v4 = v3;
  objc_sync_exit(v2);

  return (HFCharacteristicNotificationStateContaining *)v4;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__HFCharacteristicNotificationManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_26AB2F968 != -1) {
    dispatch_once(&qword_26AB2F968, block);
  }
  id v2 = (void *)_MergedGlobals_291;
  return v2;
}

- (void)enableNotificationsForSelectedHomeWithReason:(id)a3
{
}

- (void)enableNotificationsForSelectedHomeWithReason:(id)a3 numberOfAppleMediaAccessories:(unint64_t)a4
{
  id v11 = a3;
  if (!v11)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HFCharacteristicNotificationManager.m", 62, @"Invalid parameter not satisfying: %@", @"reason != nil" object file lineNumber description];
  }
  v7 = [(HFCharacteristicNotificationManager *)self notificationsEnabledReasons];
  int v8 = [v7 containsObject:v11];

  if (v8) {
    NSLog(&cfstr_AttemptToEnabl.isa, v11);
  }
  v9 = [(HFCharacteristicNotificationManager *)self notificationsEnabledReasons];
  [v9 addObject:v11];

  [(HFCharacteristicNotificationManager *)self _updateNotificationsEnabledWithNumberOfAppleMediaAccessories:a4];
}

- (void)_updateNotificationsEnabledWithNumberOfAppleMediaAccessories:(unint64_t)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = +[HFHomeKitDispatcher sharedDispatcher];
  v6 = [v5 home];

  uint64_t v7 = [(HFCharacteristicNotificationManager *)self notificationsEnabledHome];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(HFCharacteristicNotificationManager *)self notificationsEnabledHome];
    char v10 = [v6 isEqual:v9];

    if ((v10 & 1) == 0)
    {
      id v11 = HFLogForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [(HFCharacteristicNotificationManager *)self notificationsEnabledHome];
        *(_DWORD *)buf = 138412546;
        v38 = v12;
        __int16 v39 = 2112;
        v40 = v6;
        _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Asking HomeKit to disable notifications for home <%@> because the selected home changed to <%@>", buf, 0x16u);
      }
      v13 = [(HFCharacteristicNotificationManager *)self notificationsEnabledHome];
      [v13 enableNotifications:0 completionHandler:&__block_literal_global_173];

      [(HFCharacteristicNotificationManager *)self setNotificationsEnabledHome:0];
      [(HFCharacteristicNotificationManager *)self setLastNotificationsEnableRequestDate:0];
    }
  }
  v14 = [(HFCharacteristicNotificationManager *)self notificationsEnabledHome];
  if (v14)
  {

    goto LABEL_8;
  }
  v22 = [(HFCharacteristicNotificationManager *)self notificationsEnabledReasons];
  uint64_t v23 = [v22 count];

  if (!v23 || !v6)
  {
LABEL_8:
    uint64_t v15 = [(HFCharacteristicNotificationManager *)self notificationsEnabledHome];
    if (v15)
    {
      v16 = (void *)v15;
      v17 = [(HFCharacteristicNotificationManager *)self notificationsEnabledReasons];
      uint64_t v18 = [v17 count];

      if (!v18)
      {
        v19 = HFLogForCategory(0);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = [(HFCharacteristicNotificationManager *)self notificationsEnabledHome];
          *(_DWORD *)buf = 138412290;
          v38 = v20;
          _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, "Asking HomeKit to disable notifications for home <%@> because the last enabledReason was removed", buf, 0xCu);
        }
        v21 = [(HFCharacteristicNotificationManager *)self notificationsEnabledHome];
        [v21 enableNotifications:0 includeAppleMediaAccessoryNotifications:1 completionHandler:&__block_literal_global_32_2];

        [(HFCharacteristicNotificationManager *)self setNotificationsEnabledHome:0];
        [(HFCharacteristicNotificationManager *)self setLastNotificationsEnableRequestDate:0];
      }
    }
    goto LABEL_21;
  }
  v24 = [(HFCharacteristicNotificationManager *)self notificationsEnabledReasons];
  int v25 = [v24 containsObject:@"HUCCNotificationsEnabledReasonForeground"];

  if (a3) {
    uint64_t v26 = 1;
  }
  else {
    uint64_t v26 = v25 ^ 1u;
  }
  v27 = HFLogForCategory(0);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = [(HFCharacteristicNotificationManager *)self notificationsEnabledReasons];
    v29 = [NSNumber numberWithUnsignedInteger:a3];
    *(_DWORD *)buf = 138413058;
    v38 = v6;
    __int16 v39 = 2112;
    v40 = v28;
    __int16 v41 = 1024;
    int v42 = v26;
    __int16 v43 = 2112;
    v44 = v29;
    _os_log_impl(&dword_20B986000, v27, OS_LOG_TYPE_DEFAULT, "Asking HomeKit to enable notifications for home <%@> for reason: %@ enableNotificationsForAppleMediaAccessories = %{BOOL}d, numberOfAppleMediaAccessories = %@", buf, 0x26u);
  }
  uint64_t v31 = MEMORY[0x263EF8330];
  uint64_t v32 = 3221225472;
  v33 = __100__HFCharacteristicNotificationManager__updateNotificationsEnabledWithNumberOfAppleMediaAccessories___block_invoke_25;
  v34 = &unk_26408C8C8;
  id v30 = v6;
  id v35 = v30;
  v36 = self;
  [v30 enableNotifications:1 includeAppleMediaAccessoryNotifications:v26 completionHandler:&v31];
  -[HFCharacteristicNotificationManager setNotificationsEnabledHome:](self, "setNotificationsEnabledHome:", v30, v31, v32, v33, v34);

LABEL_21:
}

- (NSMutableSet)notificationsEnabledReasons
{
  return self->_notificationsEnabledReasons;
}

- (void)setNotificationsEnabledHome:(id)a3
{
}

uint64_t __52__HFCharacteristicNotificationManager_sharedManager__block_invoke(uint64_t a1)
{
  _MergedGlobals_291 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (HFCharacteristicNotificationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)HFCharacteristicNotificationManager;
  id v2 = [(HFCharacteristicNotificationManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9C0] set];
    notificationsEnabledReasons = v2->_notificationsEnabledReasons;
    v2->_notificationsEnabledReasons = (NSMutableSet *)v3;

    id v5 = +[HFHomeKitDispatcher sharedDispatcher];
    [v5 addHomeManagerObserver:v2];

    v6 = +[HFHomeKitDispatcher sharedDispatcher];
    [v6 addHomeObserver:v2];
  }
  return v2;
}

void __100__HFCharacteristicNotificationManager__updateNotificationsEnabledWithNumberOfAppleMediaAccessories___block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = HFLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Enabled notifications call for home <%@> finished with error: %@", (uint8_t *)&v8, 0x16u);
  }

  v6 = [MEMORY[0x263EFF910] date];
  [*(id *)(a1 + 40) setLastNotificationsEnableRequestDate:v6];

  uint64_t v7 = +[HFErrorHandler sharedHandler];
  [v7 logError:v3 operationDescription:@"enableHomeNotifications"];

  if (v3) {
    [*(id *)(a1 + 40) setNotificationsEnabledHome:0];
  }
}

- (void)setLastNotificationsEnableRequestDate:(id)a3
{
}

- (void)disableNotificationsForSelectedHomeWithReason:(id)a3
{
  uint64_t v5 = (__CFString *)a3;
  v14 = v5;
  if (!v5)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HFCharacteristicNotificationManager.m", 76, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    uint64_t v5 = 0;
  }
  if ([(__CFString *)v5 isEqualToString:@"HCSNotificationsEnabledReasonBackground"])
  {
    v6 = HCSNotificationsEnabledReasonForeground;
LABEL_7:
    uint64_t v7 = *v6;
    goto LABEL_10;
  }
  if ([(__CFString *)v14 isEqualToString:@"HOAppDelegateNotificationsEnabledReasonBackground"])
  {
    v6 = HOAppDelegateNotificationsEnabledReasonForeground;
    goto LABEL_7;
  }
  int v8 = [(__CFString *)v14 isEqualToString:@"HUCCNotificationsEnabledReasonBackground "];
  uint64_t v7 = @"HUCCNotificationsEnabledReasonForeground";
  if (!v8) {
    uint64_t v7 = v14;
  }
LABEL_10:
  uint64_t v9 = v7;
  __int16 v10 = [(HFCharacteristicNotificationManager *)self notificationsEnabledReasons];
  char v11 = [v10 containsObject:v9];

  if ((v11 & 1) == 0) {
    NSLog(&cfstr_AttemptToDisab.isa, v14);
  }
  uint64_t v12 = [(HFCharacteristicNotificationManager *)self notificationsEnabledReasons];
  [v12 removeObject:v9];

  [(HFCharacteristicNotificationManager *)self _updateNotificationsEnabled];
}

- (BOOL)notificationsEnabled
{
  id v2 = [(HFCharacteristicNotificationManager *)self notificationsEnabledHome];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)notificationsReasonsExist
{
  id v2 = [(HFCharacteristicNotificationManager *)self notificationsEnabledReasons];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)notificationsEnabledForCharacteristic:(id)a3 inHome:(id)a4
{
  id v5 = a4;
  v6 = [(HFCharacteristicNotificationManager *)self notificationsEnabledHome];
  uint64_t v7 = [v6 uniqueIdentifier];
  int v8 = [v5 uniqueIdentifier];

  LODWORD(v5) = [v7 isEqual:v8];
  if (!v5) {
    return 0;
  }
  return [(HFCharacteristicNotificationManager *)self notificationsEnabled];
}

- (BOOL)cacheUpToDateWithNotificationsEnabledForCharacteristic:(id)a3 inHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HFCharacteristicNotificationManager *)self notificationsEnabledHome];
  uint64_t v9 = [v8 uniqueIdentifier];
  __int16 v10 = [v7 uniqueIdentifier];

  LODWORD(v7) = [v9 isEqual:v10];
  if (v7)
  {
    char v11 = [(HFCharacteristicNotificationManager *)self lastNotificationsEnableRequestDate];
    uint64_t v12 = [v6 valueUpdatedTime];
    v13 = [v11 laterDate:v12];
    BOOL v14 = v13 != v11;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

+ (void)setOverrideNotificationsStateContainer:(id)a3
{
  id v4 = a3;
  id obj = a1;
  objc_sync_enter(obj);
  id v5 = (void *)_notificationsStateContainer;
  _notificationsStateContainer = (uint64_t)v4;

  objc_sync_exit(obj);
}

- (void)_updateNotificationsEnabled
{
}

void __100__HFCharacteristicNotificationManager__updateNotificationsEnabledWithNumberOfAppleMediaAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HFErrorHandler sharedHandler];
  [v3 logError:v2 operationDescription:@"disableHomeNotificationsForChangeHomes"];
}

void __100__HFCharacteristicNotificationManager__updateNotificationsEnabledWithNumberOfAppleMediaAccessories___block_invoke_30(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HFErrorHandler sharedHandler];
  [v3 logError:v2 operationDescription:@"disableHomeNotifications"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationsEnabledHome, 0);
  objc_storeStrong((id *)&self->_notificationsEnabledReasons, 0);
  objc_storeStrong((id *)&self->_lastNotificationsEnableRequestDate, 0);
}

@end