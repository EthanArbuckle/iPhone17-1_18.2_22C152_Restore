@interface BCSNotificationManager
+ (id)sharedManager;
- (BCSNotificationManager)init;
- (id)_notificationWithIdentifier:(id)a3;
- (id)_userNotificationCenterForCodeType:(int64_t)a3;
- (void)_addRequestForNotification:(id)a3 codeType:(int64_t)a4;
- (void)_configureUserNotificationCenter;
- (void)didReceiveNotificationResponse:(id)a3;
- (void)invalidate;
- (void)scheduleNotification:(id)a3 codeType:(int64_t)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)withdrawNotificationsWithProcessID:(int)a3 codeType:(int64_t)a4;
@end

@implementation BCSNotificationManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__BCSNotificationManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_sharedManager;
  return v2;
}

uint64_t __39__BCSNotificationManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedManager = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (BCSNotificationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)BCSNotificationManager;
  v2 = [(BCSNotificationManager *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(BCSNotificationManager *)v2 _configureUserNotificationCenter];
    uint64_t v4 = [MEMORY[0x263EFF9C0] set];
    notifications = v3->_notifications;
    v3->_notifications = (NSMutableSet *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)_configureUserNotificationCenter
{
  v3 = (UNUserNotificationCenter *)[objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.barcodesupport.qrcode"];
  qrCodeUserNotificationCenter = self->_qrCodeUserNotificationCenter;
  self->_qrCodeUserNotificationCenter = v3;

  [(UNUserNotificationCenter *)self->_qrCodeUserNotificationCenter setDelegate:self];
  [(UNUserNotificationCenter *)self->_qrCodeUserNotificationCenter setWantsNotificationResponsesDelivered];
  v5 = (UNUserNotificationCenter *)[objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.barcodesupport.nfc"];
  nfcUserNotificationCenter = self->_nfcUserNotificationCenter;
  self->_nfcUserNotificationCenter = v5;

  [(UNUserNotificationCenter *)self->_nfcUserNotificationCenter setDelegate:self];
  v7 = self->_nfcUserNotificationCenter;
  [(UNUserNotificationCenter *)v7 setWantsNotificationResponsesDelivered];
}

- (void)invalidate
{
  [(UNUserNotificationCenter *)self->_qrCodeUserNotificationCenter removeAllPendingNotificationRequests];
  qrCodeUserNotificationCenter = self->_qrCodeUserNotificationCenter;
  self->_qrCodeUserNotificationCenter = 0;

  [(UNUserNotificationCenter *)self->_nfcUserNotificationCenter removeAllPendingNotificationRequests];
  nfcUserNotificationCenter = self->_nfcUserNotificationCenter;
  self->_nfcUserNotificationCenter = 0;
}

- (id)_userNotificationCenterForCodeType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 2) {
    a2 = (SEL)*(id *)((char *)&self->super.isa + qword_223045510[a3 - 1]);
  }
  return (id)(id)a2;
}

- (void)scheduleNotification:(id)a3 codeType:(int64_t)a4
{
  id v7 = a3;
  if ([v7 shouldSkipBanner])
  {
    v6 = [v7 identifier];
    [v7 handleActionWithIdentifier:v6 notificationResponseOriginID:&stru_26D608FC8];
  }
  else
  {
    [(BCSNotificationManager *)self _addRequestForNotification:v7 codeType:a4];
  }
}

- (void)_addRequestForNotification:(id)a3 codeType:(int64_t)a4
{
  id v8 = a3;
  v6 = [v8 request];
  if (v6)
  {
    id v7 = [(BCSNotificationManager *)self _userNotificationCenterForCodeType:a4];
    [v7 addNotificationRequest:v6 withCompletionHandler:&__block_literal_global_4];

    [(NSMutableSet *)self->_notifications addObject:v8];
  }
}

void __62__BCSNotificationManager__addRequestForNotification_codeType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __62__BCSNotificationManager__addRequestForNotification_codeType___block_invoke_cold_1(v2);
  }
}

- (id)_notificationWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_notifications;
  id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "identifier", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)withdrawNotificationsWithProcessID:(int)a3 codeType:(int64_t)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = self->_notifications;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v13 requestingProcessID] == a3)
        {
          long long v14 = [v13 identifier];
          [v7 addObject:v14];

          [v6 addObject:v13];
        }
      }
      uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }

  long long v15 = [(BCSNotificationManager *)self _userNotificationCenterForCodeType:a4];
  [v15 removePendingNotificationRequestsWithIdentifiers:v7];
  [v15 removeDeliveredNotificationsWithIdentifiers:v7];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v16 = v6;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        [(NSMutableSet *)self->_notifications removeObject:*(void *)(*((void *)&v22 + 1) + 8 * j)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v18);
  }
}

- (void)didReceiveNotificationResponse:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 actionIdentifier];
  id v6 = [v4 notification];
  uint64_t v7 = [v6 request];
  id v8 = [v7 identifier];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v12 = 138543618;
    long long v13 = v5;
    __int16 v14 = 2114;
    long long v15 = v8;
    _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSNotificationManager: did receive notification response with action identifier %{public}@ and request identifier %{public}@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v9 = [(BCSNotificationManager *)self _notificationWithIdentifier:v8];
  if (v9) {
    [(NSMutableSet *)self->_notifications removeObject:v9];
  }
  if (([v5 isEqualToString:*MEMORY[0x263F1E0D0]] & 1) == 0)
  {
    if ([v5 isEqualToString:*MEMORY[0x263F1E0C8]])
    {
      id v10 = v8;

      v5 = v10;
    }
    if ([v9 shouldHandleBulletinActionWithIdentifier:v5])
    {
      uint64_t v11 = [v4 originIdentifier];
      [v9 handleActionWithIdentifier:v5 notificationResponseOriginID:v11];
    }
    [v9 didHandleBulletinActionWithIdentifier:v5];
  }
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v7 = (void (**)(void))a5;
  [(BCSNotificationManager *)self didReceiveNotificationResponse:a4];
  v7[2]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifications, 0);
  objc_storeStrong((id *)&self->_nfcUserNotificationCenter, 0);
  objc_storeStrong((id *)&self->_qrCodeUserNotificationCenter, 0);
}

void __62__BCSNotificationManager__addRequestForNotification_codeType___block_invoke_cold_1(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  int v2 = 138543362;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSNotificationManager: error adding notification request: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end