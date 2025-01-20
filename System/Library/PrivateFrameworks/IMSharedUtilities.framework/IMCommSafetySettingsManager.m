@interface IMCommSafetySettingsManager
+ (id)sharedManager;
- (BOOL)_hasOverriddenEnablementGroup;
- (BOOL)_shouldUseScreenTimeAndFamilyCircle;
- (BOOL)checkSensitivePhotosAnalyticsEnabled;
- (BOOL)checksForSensitivityOnNicknameReceive;
- (BOOL)checksForSensitivityOnSend;
- (BOOL)childIsYoungAgeGroup;
- (BOOL)hasConnected;
- (BOOL)isFeatureEnabled;
- (BOOL)shouldNotifyParentAboutSensitivePhotos;
- (IMCommSafetySettingsManager)init;
- (NSMutableArray)parents;
- (OS_dispatch_queue)connectionQueue;
- (id)enablementSubscription;
- (int64_t)_fetchEnablementGroup;
- (int64_t)_overriddenEnablementGroup;
- (int64_t)enablementGroup;
- (int64_t)protectedChildAge;
- (void)_configureUserSafetySettingsListener;
- (void)_connectToFamilyCircle:(id)a3;
- (void)_updateSettings;
- (void)dealloc;
- (void)setCheckSensitivePhotosAnalyticsEnabled:(BOOL)a3;
- (void)setChildIsYoungAgeGroup:(BOOL)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setEnablementGroup:(int64_t)a3;
- (void)setEnablementSubscription:(id)a3;
- (void)setHasConnected:(BOOL)a3;
- (void)setParents:(id)a3;
- (void)setProtectedChildAge:(int64_t)a3;
- (void)setShouldNotifyParentAboutSensitivePhotos:(BOOL)a3;
- (void)systemDidLeaveFirstDataProtectionLock;
@end

@implementation IMCommSafetySettingsManager

- (void)setEnablementSubscription:(id)a3
{
}

- (IMCommSafetySettingsManager)init
{
  v22.receiver = self;
  v22.super_class = (Class)IMCommSafetySettingsManager;
  v2 = [(IMCommSafetySettingsManager *)&v22 init];
  if (!v2) {
    goto LABEL_14;
  }
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "Initializing", buf, 2u);
    }
  }
  v2->_notificationToken = -1;
  v2->_protectedChildAge = -1;
  v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  parents = v2->_parents;
  v2->_parents = v4;

  v2->_hasConnected = 0;
  v2->_enablementGroup = 3;
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.private.IMCommSafetySettingsManager.connection", 0);
  connectionQueue = v2->_connectionQueue;
  v2->_connectionQueue = (OS_dispatch_queue *)v6;

  v8 = +[IMUnlockMonitor sharedInstance];
  [v8 addListener:v2];

  if (![(IMCommSafetySettingsManager *)v2 _shouldUseScreenTimeAndFamilyCircle])
  {
LABEL_13:
    [(IMCommSafetySettingsManager *)v2 _configureUserSafetySettingsListener];
LABEL_14:
    v14 = v2;
    goto LABEL_15;
  }
  id location = 0;
  objc_initWeak(&location, v2);
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  v9 = (const char **)qword_1EB4A6148;
  uint64_t v31 = qword_1EB4A6148;
  if (!qword_1EB4A6148)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = sub_1A0865108;
    v26 = &unk_1E5A10130;
    v27 = &v28;
    v10 = (void *)sub_1A07911C0();
    v11 = dlsym(v10, "STSettingsDidChangeNotification");
    *(void *)(v27[1] + 24) = v11;
    qword_1EB4A6148 = *(void *)(v27[1] + 24);
    v9 = (const char **)v29[3];
  }
  _Block_object_dispose(&v28, 8);
  if (v9)
  {
    v12 = *v9;
    v13 = v2->_connectionQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = sub_1A0864454;
    handler[3] = &unk_1E5A12960;
    objc_copyWeak(&v20, &location);
    if (notify_register_dispatch(v12, &v2->_notificationToken, v13, handler))
    {
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
      v14 = 0;
LABEL_15:

      return v14;
    }
    v15 = v2->_connectionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A0790F40;
    block[3] = &unk_1E5A10008;
    objc_copyWeak(&v18, &location);
    dispatch_async(v15, block);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    goto LABEL_13;
  }
  dlerror();
  result = (IMCommSafetySettingsManager *)abort_report_np();
  __break(1u);
  return result;
}

- (void)_updateSettings
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = +[IMUnlockMonitor sharedInstance];
  int v4 = [v3 isUnderFirstDataProtectionLock];

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Not updating settings as we are under first unlock.", (uint8_t *)&v30, 2u);
      }
    }
  }
  else
  {
    dispatch_assert_queue_not_V2(MEMORY[0x1E4F14428]);
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    dispatch_queue_t v6 = (void *)qword_1EB4A6140;
    uint64_t v29 = qword_1EB4A6140;
    if (!qword_1EB4A6140)
    {
      *(void *)&long long v30 = MEMORY[0x1E4F143A8];
      *((void *)&v30 + 1) = 3221225472;
      uint64_t v31 = sub_1A078D8AC;
      v32 = &unk_1E5A10130;
      v33 = &v26;
      sub_1A078D8AC((uint64_t)&v30);
      dispatch_queue_t v6 = (void *)v27[3];
    }
    v7 = v6;
    _Block_object_dispose(&v26, 8);
    id v8 = objc_alloc_init(v7);
    id v25 = 0;
    v9 = [v8 currentConfigurationWithError:&v25];
    id v10 = v25;
    v11 = v10;
    if (!v9 || v10)
    {
      if (IMOSLoggingEnabled())
      {
        v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          LODWORD(v30) = 138412290;
          *(void *)((char *)&v30 + 4) = v11;
          _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "IMCommSafetySettingsManager: Error fetching CommSafety configuration from ScreenTime: %@", (uint8_t *)&v30, 0xCu);
        }
      }
    }
    else
    {
      char v12 = [v9 isCommunicationSafetyNotificationEnabled];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = sub_1A0790668;
      v22[3] = &unk_1E5A149C8;
      v22[4] = self;
      id v23 = v9;
      char v24 = v12;
      v13 = (void *)MEMORY[0x1E4F14428];
      dispatch_async(MEMORY[0x1E4F14428], v22);
    }
    v15 = +[IMDefaults sharedInstance];
    v16 = [v15 getValueFromDomain:@"com.apple.messages" forKey:@"kCommSafetyRefreshInterval"];

    uint64_t v17 = [v16 longLongValue];
    uint64_t v18 = 240;
    if (v17) {
      uint64_t v18 = v17;
    }
    dispatch_time_t v19 = dispatch_time(0, (uint64_t)(float)((float)((float)v18 * 60.0) * 1000000000.0));
    connectionQueue = self->_connectionQueue;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_1A0864E7C;
    v21[3] = &unk_1E5A11D40;
    v21[4] = self;
    dispatch_after(v19, connectionQueue, v21);
  }
}

- (BOOL)_shouldUseScreenTimeAndFamilyCircle
{
  return 1;
}

- (int64_t)_fetchEnablementGroup
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4FB3920] isCommunicationSafetyEnabled])
  {
    int64_t v2 = 1;
  }
  else if ([MEMORY[0x1E4FB3920] isNudityDetectionEnabled])
  {
    int64_t v2 = 2;
  }
  else
  {
    int64_t v2 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 134217984;
      int64_t v6 = v2;
      _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "Fetched CommSafety enablement group: %ld", (uint8_t *)&v5, 0xCu);
    }
  }
  return v2;
}

- (void)_connectToFamilyCircle:(id)a3
{
  id v4 = a3;
  int v5 = +[IMUnlockMonitor sharedInstance];
  int v6 = [v5 isUnderFirstDataProtectionLock];

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Not connecting to FamilyCircle as we are under first unlock.", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v18 = 0;
    dispatch_time_t v19 = &v18;
    uint64_t v20 = 0x2050000000;
    id v8 = (void *)qword_1EB4A6138;
    uint64_t v21 = qword_1EB4A6138;
    if (!qword_1EB4A6138)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v15 = sub_1A078D904;
      v16 = &unk_1E5A10130;
      uint64_t v17 = &v18;
      sub_1A078D904((uint64_t)buf);
      id v8 = (void *)v19[3];
    }
    v9 = v8;
    _Block_object_dispose(&v18, 8);
    id v10 = objc_alloc_init(v9);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1A079014C;
    v11[3] = &unk_1E5A149F0;
    v11[4] = self;
    id v12 = v4;
    [v10 startRequestWithCompletionHandler:v11];
  }
}

- (void)_configureUserSafetySettingsListener
{
  if (objc_opt_respondsToSelector())
  {
    id location = 0;
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x1E4FB3920];
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    uint64_t v7 = sub_1A0864A60;
    id v8 = &unk_1E5A149A0;
    objc_copyWeak(&v9, &location);
    id v4 = [v3 subscribeForAnalysisEnabledChanges:&v5];
    -[IMCommSafetySettingsManager setEnablementSubscription:](self, "setEnablementSubscription:", v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

+ (id)sharedManager
{
  if (qword_1EB4A6208 != -1) {
    dispatch_once(&qword_1EB4A6208, &unk_1EF2BFBA0);
  }
  int64_t v2 = (void *)qword_1EB4A6220;

  return v2;
}

- (void)dealloc
{
  int notificationToken = self->_notificationToken;
  if (notificationToken != -1) {
    notify_cancel(notificationToken);
  }
  id v4 = [(IMCommSafetySettingsManager *)self enablementSubscription];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(IMCommSafetySettingsManager *)self enablementSubscription];
    [v6 cancel];
  }
  v7.receiver = self;
  v7.super_class = (Class)IMCommSafetySettingsManager;
  [(IMCommSafetySettingsManager *)&v7 dealloc];
}

- (BOOL)checkSensitivePhotosAnalyticsEnabled
{
  if ([(IMCommSafetySettingsManager *)self hasConnected])
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    connectionQueue = self->_connectionQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1A0864628;
    v8[3] = &unk_1E5A14950;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(connectionQueue, v8);
    char v4 = *((unsigned char *)v10 + 24);
    _Block_object_dispose(&v9, 8);
    return v4;
  }
  else
  {
    uint64_t v6 = +[IMDefaults sharedInstance];
    char v7 = [v6 getBoolFromDomain:@"com.apple.messages.commsafety" forKey:@"CheckSensitivePhotosAnalytics" defaultValue:0];

    return v7;
  }
}

- (BOOL)childIsYoungAgeGroup
{
  if ([(IMCommSafetySettingsManager *)self hasConnected])
  {
    int64_t protectedChildAge = self->_protectedChildAge;
    if (protectedChildAge < 0)
    {
      dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
      *(void *)buf = 0;
      uint64_t v20 = buf;
      uint64_t v21 = 0x2020000000;
      char v22 = 0;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = sub_1A0864A4C;
      v16[3] = &unk_1E5A14978;
      uint64_t v18 = buf;
      char v7 = v10;
      uint64_t v17 = v7;
      [(IMCommSafetySettingsManager *)self _connectToFamilyCircle:v16];
      dispatch_time_t v11 = dispatch_time(0, 100000000);
      if (dispatch_semaphore_wait(v7, v11) || !v20[24])
      {
        if (IMOSLoggingEnabled())
        {
          char v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Failed to identify child's age, proceed with default value", v15, 2u);
          }
        }
        _Block_object_dispose(buf, 8);
        goto LABEL_14;
      }

      _Block_object_dispose(buf, 8);
      int64_t protectedChildAge = self->_protectedChildAge;
    }
    char v4 = +[IMDefaults sharedInstance];
    char v5 = [NSNumber numberWithBool:protectedChildAge < 13];
    [v4 setValue:v5 forDomain:@"com.apple.messages.commsafety" forKey:@"IsYoungAgeGroup"];

    int v6 = IMOSLoggingEnabled();
    if (protectedChildAge <= 12)
    {
      if (!v6)
      {
LABEL_15:
        LOBYTE(v6) = 1;
        return v6;
      }
      char v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Child identified as in young age group", buf, 2u);
      }
LABEL_14:

      goto LABEL_15;
    }
    if (v6)
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "Child in older age group", buf, 2u);
      }

      LOBYTE(v6) = 0;
    }
  }
  else
  {
    id v8 = +[IMDefaults sharedInstance];
    char v9 = [v8 getBoolFromDomain:@"com.apple.messages.commsafety" forKey:@"IsYoungAgeGroup" defaultValue:0];

    LOBYTE(v6) = v9;
  }
  return v6;
}

- (BOOL)checksForSensitivityOnNicknameReceive
{
  return ([MEMORY[0x1E4FB3920] isNudityDetectionEnabledForService:@"messages"] & 1) != 0
      || ([MEMORY[0x1E4FB3920] isNudityDetectionEnabledForService:@"contacts"] & 1) != 0
      || [(IMCommSafetySettingsManager *)self enablementGroup] == 1;
}

- (int64_t)enablementGroup
{
  if ([(IMCommSafetySettingsManager *)self _hasOverriddenEnablementGroup])
  {
    return MEMORY[0x1F4181798](self, sel__overriddenEnablementGroup);
  }
  else
  {
    int64_t result = self->_enablementGroup;
    if (result == 3)
    {
      int64_t result = [(IMCommSafetySettingsManager *)self _fetchEnablementGroup];
      self->_enablementGroup = result;
    }
  }
  return result;
}

- (BOOL)isFeatureEnabled
{
  int64_t v3 = [(IMCommSafetySettingsManager *)self enablementGroup];
  if (v3 != 1) {
    LOBYTE(v3) = [(IMCommSafetySettingsManager *)self enablementGroup] == 2;
  }
  return v3;
}

- (BOOL)checksForSensitivityOnSend
{
  BOOL v3 = [(IMCommSafetySettingsManager *)self isFeatureEnabled];
  if (v3) {
    LOBYTE(v3) = [(IMCommSafetySettingsManager *)self enablementGroup] == 1;
  }
  return v3;
}

- (BOOL)_hasOverriddenEnablementGroup
{
  if (qword_1E94FF260 != -1) {
    dispatch_once(&qword_1E94FF260, &unk_1EF2C06C0);
  }
  return byte_1E94FFC40;
}

- (int64_t)_overriddenEnablementGroup
{
  if (qword_1E94FFC50 != -1) {
    dispatch_once(&qword_1E94FFC50, &unk_1EF2BE578);
  }
  return qword_1E94FFC48;
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  if ([(IMCommSafetySettingsManager *)self _shouldUseScreenTimeAndFamilyCircle])
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "System did leave first unlock, updating ST settings", buf, 2u);
      }
    }
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    connectionQueue = self->_connectionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A0864FDC;
    block[3] = &unk_1E5A10008;
    objc_copyWeak(&v6, (id *)buf);
    dispatch_async(connectionQueue, block);
    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }
}

- (void)setEnablementGroup:(int64_t)a3
{
  self->_enablementGroup = a3;
}

- (void)setCheckSensitivePhotosAnalyticsEnabled:(BOOL)a3
{
  self->_checkSensitivePhotosAnalyticsEnabled = a3;
}

- (BOOL)shouldNotifyParentAboutSensitivePhotos
{
  return self->_shouldNotifyParentAboutSensitivePhotos;
}

- (void)setShouldNotifyParentAboutSensitivePhotos:(BOOL)a3
{
  self->_shouldNotifyParentAboutSensitivePhotos = a3;
}

- (void)setChildIsYoungAgeGroup:(BOOL)a3
{
  self->_childIsYoungAgeGroup = a3;
}

- (NSMutableArray)parents
{
  return self->_parents;
}

- (void)setParents:(id)a3
{
}

- (id)enablementSubscription
{
  return self->_enablementSubscription;
}

- (int64_t)protectedChildAge
{
  return self->_protectedChildAge;
}

- (void)setProtectedChildAge:(int64_t)a3
{
  self->_int64_t protectedChildAge = a3;
}

- (BOOL)hasConnected
{
  return self->_hasConnected;
}

- (void)setHasConnected:(BOOL)a3
{
  self->_hasConnected = a3;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong(&self->_enablementSubscription, 0);

  objc_storeStrong((id *)&self->_parents, 0);
}

@end