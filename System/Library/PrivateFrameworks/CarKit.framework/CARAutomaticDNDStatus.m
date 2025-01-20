@interface CARAutomaticDNDStatus
+ (BOOL)isAutomaticDNDAvailable;
+ (id)_DNDServiceInterface;
- (BOOL)hasAdjustedTriggerMethod;
- (BOOL)hasCompletedFirstRidePreference;
- (BOOL)hasMigratedToDriving;
- (BOOL)hasOptedOutOfAutomaticDND;
- (BOOL)hasStartedFirstRidePreference;
- (BOOL)isAutomaticDNDInternalDNDBuddyPreference;
- (BOOL)isAutomaticDNDInternalExitConfirmationOverrideEnabledPreference;
- (BOOL)isAutomaticDNDInternalForceOverrideEnabledPreference;
- (BOOL)isAutomaticDNDInternalShowGeofencingAlertsEnabledPreference;
- (BOOL)isAutomaticDNDInternalShowUserAlertsEnabledPreference;
- (BOOL)platformSupportsSendingAutoReplies;
- (BOOL)platformSupportsUrgentMessages;
- (BOOL)shouldActivateWithCarPlay;
- (CARAutomaticDNDStatus)init;
- (NSXPCConnection)connection;
- (double)mostRecentTriggerMethodChange;
- (id)disableTimerTimestamp;
- (id)exitConfirmationChangeObserver;
- (id)firstBuddyPresentationFirstMoment;
- (id)statusChangeObserver;
- (unint64_t)automaticDNDTriggeringMethod;
- (unint64_t)cachedAutomaticDNDActiveState;
- (void)_detachObservers;
- (void)_dndStateChanged:(BOOL)a3;
- (void)_exitConfirmationStateChanged:(BOOL)a3;
- (void)_performCARPreferencesBlock:(id)a3 forReading:(BOOL)a4;
- (void)_resetUserDNDSettingsWithReply:(id)a3;
- (void)_setupConnection;
- (void)_xpcFetchWithServiceBlock:(id)a3 errorHandler:(id)a4;
- (void)allowedAutoReplyAudience:(id)a3;
- (void)autoReplyMessageWithReply:(id)a3;
- (void)dealloc;
- (void)disableDNDUntilEndOfDriveWithContext:(id)a3 reply:(id)a4;
- (void)disableDNDUntilEndOfDriveWithReply:(id)a3;
- (void)fetchAutomaticDNDAssertionWithReply:(id)a3;
- (void)fetchAutomaticDNDExitConfirmationWithReply:(id)a3;
- (void)fetchAutomaticDNDTriggerPreferenceWithReply:(id)a3;
- (void)setActivateWithCarPlay:(BOOL)a3;
- (void)setAllowedAutoReplyAudience:(unint64_t)a3 reply:(id)a4;
- (void)setAutoReplyMessage:(id)a3 reply:(id)a4;
- (void)setAutomaticDNDActive:(BOOL)a3 withReply:(id)a4;
- (void)setAutomaticDNDInternalDNDBuddyEnabledPreference:(BOOL)a3;
- (void)setAutomaticDNDInternalExitConfirmationOverrideEnabledPreference:(BOOL)a3;
- (void)setAutomaticDNDInternalForceOverrideEnabledPreference:(BOOL)a3;
- (void)setAutomaticDNDInternalShowGeofencingAlertsEnabledPreference:(BOOL)a3;
- (void)setAutomaticDNDInternalShowUserAlertsEnabledPreference:(BOOL)a3;
- (void)setAutomaticDNDTriggerPreference:(unint64_t)a3 withReply:(id)a4;
- (void)setAutomaticDNDTriggeringMethod:(unint64_t)a3;
- (void)setCompletedFirstRidePreference:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setDisableTimerTimestamp:(id)a3;
- (void)setExitConfirmationChangeObserver:(id)a3;
- (void)setFirstBuddyPresentationFirstMoment:(id)a3;
- (void)setHasAdjustedTriggerMethod:(BOOL)a3;
- (void)setHasMigratedToDriving:(BOOL)a3;
- (void)setMostRecentTriggerMethodChange:(double)a3;
- (void)setOptedOutOfAutomaticDND:(BOOL)a3;
- (void)setStartedFirstRidePreference:(BOOL)a3;
- (void)setStatusChangeObserver:(id)a3;
@end

@implementation CARAutomaticDNDStatus

- (CARAutomaticDNDStatus)init
{
  v6.receiver = self;
  v6.super_class = (Class)CARAutomaticDNDStatus;
  v2 = [(CARAutomaticDNDStatus *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_cachedAutomaticDNDActiveState = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_CARDNDEnabledCallback, (CFStringRef)CARAutomaticDNDEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_CARDNDDisabledCallback, (CFStringRef)CARAutomaticDNDDisabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_CARDNDExitConfirmationEnabledCallback, (CFStringRef)CARAutomaticDNDExitConfirmationEnabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_CARDNDExitConfirmationDisabledCallback, (CFStringRef)CARAutomaticDNDExitConfirmationDisabledNotification, 0, (CFNotificationSuspensionBehavior)1028);
    [(CARAutomaticDNDStatus *)v3 _setupConnection];
  }
  return v3;
}

+ (id)_DNDServiceInterface
{
  if (_DNDServiceInterface_onceToken != -1) {
    dispatch_once(&_DNDServiceInterface_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)_DNDServiceInterface___interface;
  return v2;
}

uint64_t __45__CARAutomaticDNDStatus__DNDServiceInterface__block_invoke()
{
  _DNDServiceInterface___interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0327420];
  return MEMORY[0x1F41817F8]();
}

- (void)_setupConnection
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.carkit.dnd.service" options:4096];
  v4 = [(id)objc_opt_class() _DNDServiceInterface];
  [v3 setRemoteObjectInterface:v4];

  v5 = CarDNDWDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_DEFAULT, "Connecting to CarKit DND service.", v6, 2u);
  }

  [v3 resume];
  [(CARAutomaticDNDStatus *)self setConnection:v3];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)CARAutomaticDNDStatus;
  [(CARAutomaticDNDStatus *)&v4 dealloc];
}

- (void)fetchAutomaticDNDAssertionWithReply:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__CARAutomaticDNDStatus_fetchAutomaticDNDAssertionWithReply___block_invoke;
  v8[3] = &unk_1E5E3B198;
  v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__CARAutomaticDNDStatus_fetchAutomaticDNDAssertionWithReply___block_invoke_116;
  v6[3] = &unk_1E5E3A910;
  id v7 = v9;
  id v5 = v9;
  [(CARAutomaticDNDStatus *)self _xpcFetchWithServiceBlock:v8 errorHandler:v6];
}

void __61__CARAutomaticDNDStatus_fetchAutomaticDNDAssertionWithReply___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__CARAutomaticDNDStatus_fetchAutomaticDNDAssertionWithReply___block_invoke_2;
  v4[3] = &unk_1E5E3B170;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 isCarPlayAutomaticDNDActiveWithReply:v4];
}

uint64_t __61__CARAutomaticDNDStatus_fetchAutomaticDNDAssertionWithReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = CarDNDWDLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [NSNumber numberWithBool:a2];
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1ABB00000, v4, OS_LOG_TYPE_DEFAULT, "Fetched Driving state %@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = 1;
  if (a2) {
    uint64_t v6 = 2;
  }
  *(void *)(*(void *)(a1 + 32) + 8) = v6;
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

uint64_t __61__CARAutomaticDNDStatus_fetchAutomaticDNDAssertionWithReply___block_invoke_116(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

+ (BOOL)isAutomaticDNDAvailable
{
  if (isAutomaticDNDAvailable_onceToken != -1) {
    dispatch_once(&isAutomaticDNDAvailable_onceToken, &__block_literal_global_119);
  }
  return isAutomaticDNDAvailable___isAvailable;
}

void __48__CARAutomaticDNDStatus_isAutomaticDNDAvailable__block_invoke()
{
  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    isAutomaticDNDAvailable___isAvailable = CFEqual(v0, @"iPhone") != 0;
    CFRelease(v1);
  }
}

- (void)_xpcFetchWithServiceBlock:(id)a3 errorHandler:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a3;
  id v7 = a4;
  if ([(id)objc_opt_class() isAutomaticDNDAvailable])
  {
    int v8 = [(CARAutomaticDNDStatus *)self connection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__CARAutomaticDNDStatus__xpcFetchWithServiceBlock_errorHandler___block_invoke_2;
    v14[3] = &unk_1E5E3A910;
    id v9 = &v15;
    id v15 = v7;
    uint64_t v10 = [v8 remoteObjectProxyWithErrorHandler:v14];

    if (v6)
    {
      v11 = CarDNDWDLogging();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB00000, v11, OS_LOG_TYPE_DEFAULT, "Connecting to CarKit Driving service.", buf, 2u);
      }

      v6[2](v6, v10);
    }
    goto LABEL_10;
  }
  v12 = CarDNDWDLogging();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB00000, v12, OS_LOG_TYPE_DEFAULT, "DND While Driving is not available on this device.", buf, 2u);
  }

  if (v7)
  {
    uint64_t v10 = [(CARAutomaticDNDStatus *)self connection];
    v13 = [v10 _queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__CARAutomaticDNDStatus__xpcFetchWithServiceBlock_errorHandler___block_invoke;
    block[3] = &unk_1E5E3B1C0;
    id v9 = &v17;
    id v17 = v7;
    dispatch_async(v13, block);

LABEL_10:
  }
}

uint64_t __64__CARAutomaticDNDStatus__xpcFetchWithServiceBlock_errorHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__CARAutomaticDNDStatus__xpcFetchWithServiceBlock_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = CarDNDWDLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1ABB00000, v4, OS_LOG_TYPE_DEFAULT, "CarKit Driving service error: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)_resetUserDNDSettingsWithReply:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__CARAutomaticDNDStatus__resetUserDNDSettingsWithReply___block_invoke;
  v8[3] = &unk_1E5E3B1E8;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__CARAutomaticDNDStatus__resetUserDNDSettingsWithReply___block_invoke_2;
  v6[3] = &unk_1E5E3A910;
  id v7 = v9;
  id v5 = v9;
  [(CARAutomaticDNDStatus *)self _xpcFetchWithServiceBlock:v8 errorHandler:v6];
}

uint64_t __56__CARAutomaticDNDStatus__resetUserDNDSettingsWithReply___block_invoke(uint64_t a1, void *a2)
{
  return [a2 resetAutomaticDNDPreferencesWithReply:*(void *)(a1 + 32)];
}

uint64_t __56__CARAutomaticDNDStatus__resetUserDNDSettingsWithReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)setAutomaticDNDActive:(BOOL)a3 withReply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__CARAutomaticDNDStatus_setAutomaticDNDActive_withReply___block_invoke;
  v10[3] = &unk_1E5E3B210;
  BOOL v12 = a3;
  id v11 = v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__CARAutomaticDNDStatus_setAutomaticDNDActive_withReply___block_invoke_2;
  v8[3] = &unk_1E5E3A910;
  id v9 = v11;
  id v7 = v11;
  [(CARAutomaticDNDStatus *)self _xpcFetchWithServiceBlock:v10 errorHandler:v8];
}

uint64_t __57__CARAutomaticDNDStatus_setAutomaticDNDActive_withReply___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCarPlayAutomaticDNDActive:*(unsigned __int8 *)(a1 + 40) withReply:*(void *)(a1 + 32)];
}

uint64_t __57__CARAutomaticDNDStatus_setAutomaticDNDActive_withReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)fetchAutomaticDNDExitConfirmationWithReply:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__CARAutomaticDNDStatus_fetchAutomaticDNDExitConfirmationWithReply___block_invoke;
  v8[3] = &unk_1E5E3B1E8;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__CARAutomaticDNDStatus_fetchAutomaticDNDExitConfirmationWithReply___block_invoke_2;
  v6[3] = &unk_1E5E3A910;
  id v7 = v9;
  id v5 = v9;
  [(CARAutomaticDNDStatus *)self _xpcFetchWithServiceBlock:v8 errorHandler:v6];
}

uint64_t __68__CARAutomaticDNDStatus_fetchAutomaticDNDExitConfirmationWithReply___block_invoke(uint64_t a1, void *a2)
{
  return [a2 shouldDisplayExitConfirmationWithReply:*(void *)(a1 + 32)];
}

uint64_t __68__CARAutomaticDNDStatus_fetchAutomaticDNDExitConfirmationWithReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)allowedAutoReplyAudience:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__CARAutomaticDNDStatus_allowedAutoReplyAudience___block_invoke;
  v8[3] = &unk_1E5E3B1E8;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__CARAutomaticDNDStatus_allowedAutoReplyAudience___block_invoke_2;
  v6[3] = &unk_1E5E3A910;
  id v7 = v9;
  id v5 = v9;
  [(CARAutomaticDNDStatus *)self _xpcFetchWithServiceBlock:v8 errorHandler:v6];
}

uint64_t __50__CARAutomaticDNDStatus_allowedAutoReplyAudience___block_invoke(uint64_t a1, void *a2)
{
  return [a2 allowedAutoReplyAudienceWithReply:*(void *)(a1 + 32)];
}

uint64_t __50__CARAutomaticDNDStatus_allowedAutoReplyAudience___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)setAllowedAutoReplyAudience:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__CARAutomaticDNDStatus_setAllowedAutoReplyAudience_reply___block_invoke;
  v10[3] = &unk_1E5E3B238;
  unint64_t v12 = a3;
  id v11 = v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__CARAutomaticDNDStatus_setAllowedAutoReplyAudience_reply___block_invoke_2;
  v8[3] = &unk_1E5E3A910;
  id v9 = v11;
  id v7 = v11;
  [(CARAutomaticDNDStatus *)self _xpcFetchWithServiceBlock:v10 errorHandler:v8];
}

uint64_t __59__CARAutomaticDNDStatus_setAllowedAutoReplyAudience_reply___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAllowedAutoReplyAudience:*(void *)(a1 + 40) reply:*(void *)(a1 + 32)];
}

uint64_t __59__CARAutomaticDNDStatus_setAllowedAutoReplyAudience_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)autoReplyMessageWithReply:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__CARAutomaticDNDStatus_autoReplyMessageWithReply___block_invoke;
  v8[3] = &unk_1E5E3B1E8;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__CARAutomaticDNDStatus_autoReplyMessageWithReply___block_invoke_3;
  v6[3] = &unk_1E5E3A910;
  id v7 = v9;
  id v5 = v9;
  [(CARAutomaticDNDStatus *)self _xpcFetchWithServiceBlock:v8 errorHandler:v6];
}

void __51__CARAutomaticDNDStatus_autoReplyMessageWithReply___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__CARAutomaticDNDStatus_autoReplyMessageWithReply___block_invoke_2;
  v3[3] = &unk_1E5E3B260;
  id v4 = *(id *)(a1 + 32);
  [a2 autoReplyMessageWithReply:v3];
}

uint64_t __51__CARAutomaticDNDStatus_autoReplyMessageWithReply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __51__CARAutomaticDNDStatus_autoReplyMessageWithReply___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)setAutoReplyMessage:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__CARAutomaticDNDStatus_setAutoReplyMessage_reply___block_invoke;
  v12[3] = &unk_1E5E3B198;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__CARAutomaticDNDStatus_setAutoReplyMessage_reply___block_invoke_3;
  v10[3] = &unk_1E5E3A910;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(CARAutomaticDNDStatus *)self _xpcFetchWithServiceBlock:v12 errorHandler:v10];
}

void __51__CARAutomaticDNDStatus_setAutoReplyMessage_reply___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__CARAutomaticDNDStatus_setAutoReplyMessage_reply___block_invoke_2;
  v4[3] = &unk_1E5E3B038;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 setAutoReplyMessage:v3 reply:v4];
}

uint64_t __51__CARAutomaticDNDStatus_setAutoReplyMessage_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __51__CARAutomaticDNDStatus_setAutoReplyMessage_reply___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (BOOL)platformSupportsSendingAutoReplies
{
  v2 = (const void *)MGCopyAnswer();
  BOOL v3 = CFEqual(v2, @"iPhone") != 0;
  CFRelease(v2);
  return v3;
}

- (BOOL)platformSupportsUrgentMessages
{
  v2 = (const void *)MGCopyAnswer();
  BOOL v3 = CFEqual(v2, @"iPhone") != 0;
  CFRelease(v2);
  return v3;
}

- (void)fetchAutomaticDNDTriggerPreferenceWithReply:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__CARAutomaticDNDStatus_fetchAutomaticDNDTriggerPreferenceWithReply___block_invoke;
  v8[3] = &unk_1E5E3B1E8;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__CARAutomaticDNDStatus_fetchAutomaticDNDTriggerPreferenceWithReply___block_invoke_2;
  v6[3] = &unk_1E5E3A910;
  id v7 = v9;
  id v5 = v9;
  [(CARAutomaticDNDStatus *)self _xpcFetchWithServiceBlock:v8 errorHandler:v6];
}

uint64_t __69__CARAutomaticDNDStatus_fetchAutomaticDNDTriggerPreferenceWithReply___block_invoke(uint64_t a1, void *a2)
{
  return [a2 fetchDNDTriggerModeWithReply:*(void *)(a1 + 32)];
}

uint64_t __69__CARAutomaticDNDStatus_fetchAutomaticDNDTriggerPreferenceWithReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)setAutomaticDNDTriggerPreference:(unint64_t)a3 withReply:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__CARAutomaticDNDStatus_setAutomaticDNDTriggerPreference_withReply___block_invoke;
  v10[3] = &unk_1E5E3B238;
  unint64_t v12 = a3;
  id v11 = v6;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__CARAutomaticDNDStatus_setAutomaticDNDTriggerPreference_withReply___block_invoke_2;
  v8[3] = &unk_1E5E3A910;
  id v9 = v11;
  id v7 = v11;
  [(CARAutomaticDNDStatus *)self _xpcFetchWithServiceBlock:v10 errorHandler:v8];
}

uint64_t __68__CARAutomaticDNDStatus_setAutomaticDNDTriggerPreference_withReply___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDNDTriggerMode:*(void *)(a1 + 40) withReply:*(void *)(a1 + 32)];
}

uint64_t __68__CARAutomaticDNDStatus_setAutomaticDNDTriggerPreference_withReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)disableDNDUntilEndOfDriveWithContext:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__CARAutomaticDNDStatus_disableDNDUntilEndOfDriveWithContext_reply___block_invoke;
  v12[3] = &unk_1E5E3B198;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__CARAutomaticDNDStatus_disableDNDUntilEndOfDriveWithContext_reply___block_invoke_2;
  v10[3] = &unk_1E5E3A910;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(CARAutomaticDNDStatus *)self _xpcFetchWithServiceBlock:v12 errorHandler:v10];
}

uint64_t __68__CARAutomaticDNDStatus_disableDNDUntilEndOfDriveWithContext_reply___block_invoke(uint64_t a1, void *a2)
{
  return [a2 disableDNDUntilEndOfDriveWithContext:*(void *)(a1 + 32) reply:*(void *)(a1 + 40)];
}

uint64_t __68__CARAutomaticDNDStatus_disableDNDUntilEndOfDriveWithContext_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)disableDNDUntilEndOfDriveWithReply:(id)a3
{
}

- (void)setAutomaticDNDInternalExitConfirmationOverrideEnabledPreference:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = @"CARDNDMiniInternalExitConfirmationOverride";
  id v5 = CarDNDWDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [NSNumber numberWithBool:v3];
    int v8 = 138412802;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v8, 0x20u);
  }
  id v7 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    id v7 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
  }
  CFPreferencesSetAppValue(v4, *v7, CRPreferencesAutomaticDNDDomain);
}

- (BOOL)isAutomaticDNDInternalExitConfirmationOverrideEnabledPreference
{
  v2 = (void *)CFPreferencesCopyAppValue(@"CARDNDMiniInternalExitConfirmationOverride", CRPreferencesAutomaticDNDDomain);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setAutomaticDNDInternalForceOverrideEnabledPreference:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = @"CARDNDMiniInternalForceOverride";
  id v5 = CarDNDWDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [NSNumber numberWithBool:v3];
    int v8 = 138412802;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v8, 0x20u);
  }
  id v7 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    id v7 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
  }
  CFPreferencesSetAppValue(v4, *v7, CRPreferencesAutomaticDNDDomain);
}

- (BOOL)isAutomaticDNDInternalForceOverrideEnabledPreference
{
  v2 = (void *)CFPreferencesCopyAppValue(@"CARDNDMiniInternalForceOverride", CRPreferencesAutomaticDNDDomain);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setCompletedFirstRidePreference:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = @"CARDNDMiniHasCompletedFirstRide";
  id v5 = CarDNDWDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [NSNumber numberWithBool:v3];
    int v8 = 138412802;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v8, 0x20u);
  }
  id v7 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    id v7 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
  }
  CFPreferencesSetAppValue(v4, *v7, CRPreferencesAutomaticDNDDomain);
}

- (BOOL)hasCompletedFirstRidePreference
{
  v2 = (void *)CFPreferencesCopyAppValue(@"CARDNDMiniHasCompletedFirstRide", CRPreferencesAutomaticDNDDomain);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setStartedFirstRidePreference:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = @"CARDNDMiniHasStartedFirstRide";
  id v5 = CarDNDWDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [NSNumber numberWithBool:v3];
    int v8 = 138412802;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v8, 0x20u);
  }
  id v7 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    id v7 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
  }
  CFPreferencesSetAppValue(v4, *v7, CRPreferencesAutomaticDNDDomain);
}

- (BOOL)hasStartedFirstRidePreference
{
  v2 = (void *)CFPreferencesCopyAppValue(@"CARDNDMiniHasStartedFirstRide", CRPreferencesAutomaticDNDDomain);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setAutomaticDNDTriggeringMethod:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(CARAutomaticDNDStatus *)self automaticDNDTriggeringMethod] != a3)
  {
    id v5 = @"CARDNDAutomaticTriggeringMethod";
    id v6 = [NSNumber numberWithInteger:a3];
    id v7 = CarDNDWDLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412802;
      __int16 v10 = v5;
      __int16 v11 = 2112;
      __int16 v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = CRPreferencesAutomaticDNDDomain;
      _os_log_impl(&dword_1ABB00000, v7, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v9, 0x20u);
    }

    CFPreferencesSetAppValue(v5, v6, CRPreferencesAutomaticDNDDomain);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    -[CARAutomaticDNDStatus setMostRecentTriggerMethodChange:](self, "setMostRecentTriggerMethodChange:");
    [(CARAutomaticDNDStatus *)self setHasAdjustedTriggerMethod:1];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)CARAutomaticDNDTriggeringPreferenceChangedNotification, 0, 0, 1u);
  }
}

- (unint64_t)automaticDNDTriggeringMethod
{
  v2 = (void *)CFPreferencesCopyAppValue(@"CARDNDAutomaticTriggeringMethod", CRPreferencesAutomaticDNDDomain);
  unint64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setAutomaticDNDInternalShowGeofencingAlertsEnabledPreference:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = @"CARDNDMiniInternalShowGeofencingAlerts";
  id v5 = CarDNDWDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [NSNumber numberWithBool:v3];
    int v8 = 138412802;
    int v9 = v4;
    __int16 v10 = 2112;
    __int16 v11 = v6;
    __int16 v12 = 2112;
    __int16 v13 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v8, 0x20u);
  }
  id v7 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    id v7 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
  }
  CFPreferencesSetAppValue(v4, *v7, CRPreferencesAutomaticDNDDomain);
}

- (BOOL)isAutomaticDNDInternalShowGeofencingAlertsEnabledPreference
{
  v2 = (void *)CFPreferencesCopyAppValue(@"CARDNDMiniInternalShowGeofencingAlerts", CRPreferencesAutomaticDNDDomain);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setAutomaticDNDInternalShowUserAlertsEnabledPreference:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = @"CARDNDMiniInternalShowInternalAlerts";
  id v5 = CarDNDWDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [NSNumber numberWithBool:v3];
    int v8 = 138412802;
    int v9 = v4;
    __int16 v10 = 2112;
    __int16 v11 = v6;
    __int16 v12 = 2112;
    __int16 v13 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v8, 0x20u);
  }
  id v7 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    id v7 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
  }
  CFPreferencesSetAppValue(v4, *v7, CRPreferencesAutomaticDNDDomain);
}

- (BOOL)isAutomaticDNDInternalShowUserAlertsEnabledPreference
{
  v2 = (void *)CFPreferencesCopyAppValue(@"CARDNDMiniInternalShowInternalAlerts", CRPreferencesAutomaticDNDDomain);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setAutomaticDNDInternalDNDBuddyEnabledPreference:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = @"CARDNDInternalDNDBuddyDisplay";
  id v5 = CarDNDWDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [NSNumber numberWithBool:v3];
    int v8 = 138412802;
    int v9 = v4;
    __int16 v10 = 2112;
    __int16 v11 = v6;
    __int16 v12 = 2112;
    __int16 v13 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v8, 0x20u);
  }
  id v7 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    id v7 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
  }
  CFPreferencesSetAppValue(v4, *v7, CRPreferencesAutomaticDNDDomain);
}

- (BOOL)isAutomaticDNDInternalDNDBuddyPreference
{
  v2 = (void *)CFPreferencesCopyAppValue(@"CARDNDInternalDNDBuddyDisplay", CRPreferencesAutomaticDNDDomain);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setOptedOutOfAutomaticDND:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = @"CARDNDMiniUserOptedOutInBuddy";
  id v5 = CarDNDWDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [NSNumber numberWithBool:v3];
    int v8 = 138412802;
    int v9 = v4;
    __int16 v10 = 2112;
    __int16 v11 = v6;
    __int16 v12 = 2112;
    __int16 v13 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v8, 0x20u);
  }
  id v7 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    id v7 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
  }
  CFPreferencesSetAppValue(v4, *v7, CRPreferencesAutomaticDNDDomain);
}

- (BOOL)hasOptedOutOfAutomaticDND
{
  v2 = (void *)CFPreferencesCopyAppValue(@"CARDNDMiniUserOptedOutInBuddy", CRPreferencesAutomaticDNDDomain);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setHasAdjustedTriggerMethod:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = @"CARDNDUserHasAdjustedTriggerMethod";
  id v5 = CarDNDWDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [NSNumber numberWithBool:v3];
    int v8 = 138412802;
    int v9 = v4;
    __int16 v10 = 2112;
    __int16 v11 = v6;
    __int16 v12 = 2112;
    __int16 v13 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v8, 0x20u);
  }
  id v7 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    id v7 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
  }
  CFPreferencesSetAppValue(v4, *v7, CRPreferencesAutomaticDNDDomain);
}

- (BOOL)hasAdjustedTriggerMethod
{
  v2 = (void *)CFPreferencesCopyAppValue(@"CARDNDUserHasAdjustedTriggerMethod", CRPreferencesAutomaticDNDDomain);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasMigratedToDriving
{
  v2 = (void *)CFPreferencesCopyAppValue(@"CARHasMigratedToDriving", CRPreferencesAutomaticDNDDomain);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setHasMigratedToDriving:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = @"CARHasMigratedToDriving";
  id v5 = CarDNDWDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [NSNumber numberWithBool:v3];
    int v8 = 138412802;
    int v9 = v4;
    __int16 v10 = 2112;
    __int16 v11 = v6;
    __int16 v12 = 2112;
    __int16 v13 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v8, 0x20u);
  }
  id v7 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    id v7 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
  }
  CFPreferencesSetAppValue(v4, *v7, CRPreferencesAutomaticDNDDomain);
}

- (void)setActivateWithCarPlay:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(CARAutomaticDNDStatus *)self shouldActivateWithCarPlay] != a3)
  {
    id v4 = @"CARDNDActivateWithCarPlay";
    id v5 = CarDNDWDLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [NSNumber numberWithBool:v3];
      int v9 = 138412802;
      __int16 v10 = v4;
      __int16 v11 = 2112;
      __int16 v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = CRPreferencesAutomaticDNDDomain;
      _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v9, 0x20u);
    }
    id v7 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
    if (!v3) {
      id v7 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
    }
    CFPreferencesSetAppValue(v4, *v7, CRPreferencesAutomaticDNDDomain);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)CARAutomaticDNDCarPlayActivationChangedNotification, 0, 0, 1u);
  }
}

- (BOOL)shouldActivateWithCarPlay
{
  v2 = (void *)CFPreferencesCopyAppValue(@"CARDNDActivateWithCarPlay", CRPreferencesAutomaticDNDDomain);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (double)mostRecentTriggerMethodChange
{
  v2 = (void *)CFPreferencesCopyAppValue(@"CARDNDTriggerPreferenceChangedTimestamp", CRPreferencesAutomaticDNDDomain);
  uint64_t v3 = [v2 integerValue];

  return (double)v3;
}

- (void)setMostRecentTriggerMethodChange:(double)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (uint64_t)a3;
  id v4 = @"CARDNDTriggerPreferenceChangedTimestamp";
  id v5 = [NSNumber numberWithInteger:v3];
  id v6 = CarDNDWDLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412802;
    int v8 = v4;
    __int16 v9 = 2112;
    __int16 v10 = v5;
    __int16 v11 = 2112;
    __int16 v12 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1ABB00000, v6, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v7, 0x20u);
  }

  CFPreferencesSetAppValue(v4, v5, CRPreferencesAutomaticDNDDomain);
}

- (void)setFirstBuddyPresentationFirstMoment:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v5 = [v4 startOfDayForDate:v3];

    [(__CFString *)v5 timeIntervalSinceReferenceDate];
    uint64_t v7 = (uint64_t)v6;
    int v8 = @"CARDNDFirstBuddyDateFirstMoment";
    __int16 v9 = [NSNumber numberWithInteger:v7];
    __int16 v10 = CarDNDWDLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412802;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = CRPreferencesAutomaticDNDDomain;
      _os_log_impl(&dword_1ABB00000, v10, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v12, 0x20u);
    }

    CFPreferencesSetAppValue(v8, v9, CRPreferencesAutomaticDNDDomain);
  }
  else
  {
    id v5 = @"CARDNDFirstBuddyDateFirstMoment";
    int v8 = [NSNumber numberWithInteger:0];
    __int16 v11 = CarDNDWDLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412802;
      uint64_t v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      id v17 = CRPreferencesAutomaticDNDDomain;
      _os_log_impl(&dword_1ABB00000, v11, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v12, 0x20u);
    }

    CFPreferencesSetAppValue(v5, v8, CRPreferencesAutomaticDNDDomain);
  }
}

- (id)firstBuddyPresentationFirstMoment
{
  v2 = (void *)CFPreferencesCopyAppValue(@"CARDNDFirstBuddyDateFirstMoment", CRPreferencesAutomaticDNDDomain);
  uint64_t v3 = [v2 integerValue];

  if (v3 < 1)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v3];
  }
  return v4;
}

- (void)setDisableTimerTimestamp:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [a3 timeIntervalSinceReferenceDate];
    uint64_t v4 = (uint64_t)v3;
    id v5 = @"CARDNDDisableTimerTimestamp";
    double v6 = NSNumber;
    uint64_t v7 = v4;
  }
  else
  {
    id v5 = @"CARDNDDisableTimerTimestamp";
    double v6 = NSNumber;
    uint64_t v7 = 0;
  }
  int v8 = [v6 numberWithInteger:v7];
  __int16 v9 = CarDNDWDLogging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412802;
    __int16 v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = CRPreferencesAutomaticDNDDomain;
    _os_log_impl(&dword_1ABB00000, v9, OS_LOG_TYPE_INFO, "Setting %@ to %@ in %@.", (uint8_t *)&v10, 0x20u);
  }

  CFPreferencesSetAppValue(@"CARDNDDisableTimerTimestamp", v8, CRPreferencesAutomaticDNDDomain);
}

- (id)disableTimerTimestamp
{
  v2 = (void *)CFPreferencesCopyAppValue(@"CARDNDDisableTimerTimestamp", CRPreferencesAutomaticDNDDomain);
  uint64_t v3 = [v2 integerValue];

  if (v3 < 1)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v3];
  }
  return v4;
}

- (void)_performCARPreferencesBlock:(id)a3 forReading:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (void (**)(void))a3;
  double v6 = v5;
  if (v4)
  {
    if (!CFPreferencesAppSynchronize(CRPreferencesAutomaticDNDDomain))
    {
      uint64_t v7 = CarDNDWDLogging();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[CARAutomaticDNDStatus _performCARPreferencesBlock:forReading:](v7);
      }
    }
    v6[2](v6);
  }
  else
  {
    v5[2](v5);
    if (!CFPreferencesAppSynchronize(CRPreferencesAutomaticDNDDomain))
    {
      int v8 = CarDNDWDLogging();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[CARAutomaticDNDStatus _performCARPreferencesBlock:forReading:](v8);
      }
    }
  }
}

- (void)_detachObservers
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
}

- (void)_dndStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = CarDNDWDLogging();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      unint64_t v7 = 2;
      _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_DEFAULT, "Received car DND state ON.", buf, 2u);
    }
    else
    {
      unint64_t v7 = 2;
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_DEFAULT, "Received car DND state OFF.", v10, 2u);
    }
    unint64_t v7 = 1;
  }

  self->_cachedAutomaticDNDActiveState = v7;
  int v8 = [(CARAutomaticDNDStatus *)self statusChangeObserver];

  if (v8)
  {
    __int16 v9 = [(CARAutomaticDNDStatus *)self statusChangeObserver];
    v9[2](v9, v3);
  }
}

- (void)_exitConfirmationStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = CarDNDWDLogging();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v6) {
      goto LABEL_7;
    }
    __int16 v12 = 0;
    unint64_t v7 = "Received exit confirmation observer ON.";
    int v8 = (uint8_t *)&v12;
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    __int16 v11 = 0;
    unint64_t v7 = "Received exit confirmation observer OFF.";
    int v8 = (uint8_t *)&v11;
  }
  _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
LABEL_7:

  __int16 v9 = [(CARAutomaticDNDStatus *)self exitConfirmationChangeObserver];

  if (v9)
  {
    int v10 = [(CARAutomaticDNDStatus *)self exitConfirmationChangeObserver];
    v10[2](v10, v3);
  }
}

- (unint64_t)cachedAutomaticDNDActiveState
{
  return self->_cachedAutomaticDNDActiveState;
}

- (id)statusChangeObserver
{
  return self->_statusChangeObserver;
}

- (void)setStatusChangeObserver:(id)a3
{
}

- (id)exitConfirmationChangeObserver
{
  return self->_exitConfirmationChangeObserver;
}

- (void)setExitConfirmationChangeObserver:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_exitConfirmationChangeObserver, 0);
  objc_storeStrong(&self->_statusChangeObserver, 0);
}

- (void)_performCARPreferencesBlock:(os_log_t)log forReading:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1ABB00000, log, OS_LOG_TYPE_FAULT, "Failed synchronizing for reading.", v1, 2u);
}

- (void)_performCARPreferencesBlock:(os_log_t)log forReading:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1ABB00000, log, OS_LOG_TYPE_FAULT, "Failed synchronizing for writing.", v1, 2u);
}

@end