@interface BRKUserNotificationManager
+ (id)sharedInstance;
- (BRKUserNotificationManager)init;
- (NSXPCConnection)applicationConnection;
- (NSXPCListenerEndpoint)endpoint;
- (id)categoryForIdentifier:(id)a3;
- (id)getListenerEndpoint;
- (id)postNotification:(id)a3 destinations:(unint64_t)a4;
- (id)postNotification:(id)a3 trigger:(id)a4 responseHandler:(id)a5 destinations:(unint64_t)a6;
- (void)_deliveredNotificationIdentifiersWithCategoryIdentifier:(id)a3 completionHandler:(id)a4;
- (void)_pendingNotificationIdentifiersWithCategoryIdentifier:(id)a3 completionHandler:(id)a4;
- (void)addCategories:(id)a3;
- (void)debugPendingNotificationRequests;
- (void)handleNotificationResponse:(id)a3;
- (void)hasPendingLocationNotification:(id)a3;
- (void)isNotificationPendingOrDeliveredWithCategoryIdentifier:(id)a3 completionHandler:(id)a4;
- (void)promptNotificationAuthorizationRequest:(id)a3;
- (void)removeAllDeliveredNotifications;
- (void)removeAllPendingNotifications;
- (void)removeNotification:(id)a3;
- (void)removeNotificationsWithCategoryIdentifier:(id)a3;
- (void)setApplicationConnection:(id)a3;
- (void)setEndpoint:(id)a3;
@end

@implementation BRKUserNotificationManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_Manager;
  return v2;
}

uint64_t __44__BRKUserNotificationManager_sharedInstance__block_invoke()
{
  sharedInstance_Manager = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (BRKUserNotificationManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)BRKUserNotificationManager;
  v2 = [(BRKUserNotificationManager *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    responseHandlers = v2->_responseHandlers;
    v2->_responseHandlers = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    categories = v2->_categories;
    v2->_categories = (NSMutableDictionary *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:@"com.apple.brook.BrookUI"];
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (UNUserNotificationCenter *)v7;
  }
  return v2;
}

- (id)getListenerEndpoint
{
  return [(NSXPCListener *)self->_listener endpoint];
}

- (void)addCategories:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        categories = self->_categories;
        v11 = [v9 identifier];
        [(NSMutableDictionary *)categories setObject:v9 forKeyedSubscript:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  v12 = [MEMORY[0x263EFF9C0] set];
  v13 = self->_categories;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __44__BRKUserNotificationManager_addCategories___block_invoke;
  v15[3] = &unk_264DB63A8;
  id v16 = v12;
  id v14 = v12;
  [(NSMutableDictionary *)v13 enumerateKeysAndObjectsUsingBlock:v15];
  [(UNUserNotificationCenter *)self->_notificationCenter setNotificationCategories:v14];
}

uint64_t __44__BRKUserNotificationManager_addCategories___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (id)categoryForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_categories objectForKeyedSubscript:a3];
}

- (void)promptNotificationAuthorizationRequest:(id)a3
{
  id v4 = a3;
  notificationCenter = self->_notificationCenter;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__BRKUserNotificationManager_promptNotificationAuthorizationRequest___block_invoke;
  v9[3] = &unk_264DB6418;
  v9[4] = self;
  [(UNUserNotificationCenter *)notificationCenter getNotificationSettingsWithCompletionHandler:v9];
  if (v4)
  {
    dispatch_time_t v6 = dispatch_time(0, 30000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__BRKUserNotificationManager_promptNotificationAuthorizationRequest___block_invoke_83;
    block[3] = &unk_264DB6468;
    block[4] = self;
    id v8 = v4;
    dispatch_after(v6, MEMORY[0x263EF83A0], block);
  }
}

void __69__BRKUserNotificationManager_promptNotificationAuthorizationRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 authorizationStatus])
  {
    id v4 = BRKLoggingObjectForDomain(4);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = @"Authorization status for UNUserNotificationCenter has already been determined - no prompt will be shown.";
      _os_log_impl(&dword_2399EB000, v4, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    uint64_t v5 = [v3 authorizationStatus];
    dispatch_time_t v6 = BRKLoggingObjectForDomain(4);
    uint64_t v7 = v6;
    if (v5 == 2)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v12 = @"Brook is authorized to present user notifications.";
        id v8 = v7;
        os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
        _os_log_impl(&dword_2399EB000, v8, v9, "%@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = @"Warning! Brook does not have authorization to present user notifications!";
      id v8 = v7;
      os_log_type_t v9 = OS_LOG_TYPE_INFO;
      goto LABEL_10;
    }

    goto LABEL_12;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__BRKUserNotificationManager_promptNotificationAuthorizationRequest___block_invoke_2;
  block[3] = &unk_264DB63F0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
LABEL_12:
}

uint64_t __69__BRKUserNotificationManager_promptNotificationAuthorizationRequest___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) requestAuthorizationWithOptions:6 completionHandler:&__block_literal_global_72];
}

void __69__BRKUserNotificationManager_promptNotificationAuthorizationRequest___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = BRKLoggingObjectForDomain(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a2;
    _os_log_impl(&dword_2399EB000, v5, OS_LOG_TYPE_DEFAULT, "Result of User Notification authorization request: %d", (uint8_t *)v7, 8u);
  }

  if (v4)
  {
    dispatch_time_t v6 = BRKLoggingObjectForDomain(4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __69__BRKUserNotificationManager_promptNotificationAuthorizationRequest___block_invoke_3_cold_1((uint64_t)v4, v6);
    }
  }
}

void __69__BRKUserNotificationManager_promptNotificationAuthorizationRequest___block_invoke_83(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = BRKLoggingObjectForDomain(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = @"Dispatching notification request after authorization prompt delay.";
    _os_log_impl(&dword_2399EB000, v2, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  id v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__BRKUserNotificationManager_promptNotificationAuthorizationRequest___block_invoke_87;
  v5[3] = &unk_264DB6440;
  id v6 = v3;
  [v4 addNotificationRequest:v6 withCompletionHandler:v5];
}

void __69__BRKUserNotificationManager_promptNotificationAuthorizationRequest___block_invoke_87(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = BRKLoggingObjectForDomain(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_2399EB000, v4, OS_LOG_TYPE_DEFAULT, "Send notification request %@ %@", (uint8_t *)&v6, 0x16u);
  }
}

- (id)postNotification:(id)a3 destinations:(unint64_t)a4
{
  return [(BRKUserNotificationManager *)self postNotification:a3 trigger:0 responseHandler:0 destinations:a4];
}

- (id)postNotification:(id)a3 trigger:(id)a4 responseHandler:(id)a5 destinations:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)[a3 mutableCopy];
  uint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v14 = BRKLocalizedUserNotificationString(@"NOTIFICATION_TITLE", MEMORY[0x263EFFA68], v13);
  [v12 setHeader:v14];

  v15 = [MEMORY[0x263F1DF68] soundWithAlertType:16];
  [v12 setSound:v15];

  if (v10)
  {
    id v16 = @"722C7B89-67AA-432A-93BC-290F8B20A125";
  }
  else
  {
    long long v17 = [MEMORY[0x263F08C38] UUID];
    id v16 = [v17 UUIDString];
  }
  long long v18 = [MEMORY[0x263F1DF48] requestWithIdentifier:v16 content:v12 trigger:v10 destinations:a6];
  if (v11)
  {
    long long v19 = (void *)MEMORY[0x23ECAA650](v11);
    [(NSMutableDictionary *)self->_responseHandlers setObject:v19 forKeyedSubscript:v16];
  }
  notificationCenter = self->_notificationCenter;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __84__BRKUserNotificationManager_postNotification_trigger_responseHandler_destinations___block_invoke;
  v23[3] = &unk_264DB6490;
  v23[4] = self;
  id v24 = v18;
  id v21 = v18;
  [(UNUserNotificationCenter *)notificationCenter getNotificationSettingsWithCompletionHandler:v23];

  return v16;
}

void __84__BRKUserNotificationManager_postNotification_trigger_responseHandler_destinations___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 authorizationStatus];
  id v4 = *(void **)(a1 + 32);
  if (v3 == 2)
  {
    uint64_t v5 = (void *)v4[1];
    int v6 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __84__BRKUserNotificationManager_postNotification_trigger_responseHandler_destinations___block_invoke_2;
    v8[3] = &unk_264DB6440;
    id v9 = v6;
    [v5 addNotificationRequest:v9 withCompletionHandler:v8];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    [v4 promptNotificationAuthorizationRequest:v7];
  }
}

void __84__BRKUserNotificationManager_postNotification_trigger_responseHandler_destinations___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = BRKLoggingObjectForDomain(4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_2399EB000, v4, OS_LOG_TYPE_DEFAULT, "Send notification request %@ %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)isNotificationPendingOrDeliveredWithCategoryIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __103__BRKUserNotificationManager_isNotificationPendingOrDeliveredWithCategoryIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_264DB64E0;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(BRKUserNotificationManager *)self _pendingNotificationIdentifiersWithCategoryIdentifier:v8 completionHandler:v10];
}

void __103__BRKUserNotificationManager_isNotificationPendingOrDeliveredWithCategoryIdentifier_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = [a2 count];
  id v4 = (void *)a1[6];
  if (v3 && v4)
  {
    uint64_t v5 = (void (*)(void))v4[2];
    v5();
  }
  else
  {
    id v7 = (void *)a1[4];
    uint64_t v6 = a1[5];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __103__BRKUserNotificationManager_isNotificationPendingOrDeliveredWithCategoryIdentifier_completionHandler___block_invoke_2;
    v8[3] = &unk_264DB64B8;
    id v9 = v4;
    [v7 _deliveredNotificationIdentifiersWithCategoryIdentifier:v6 completionHandler:v8];
  }
}

uint64_t __103__BRKUserNotificationManager_isNotificationPendingOrDeliveredWithCategoryIdentifier_completionHandler___block_invoke_2(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2)
  {
    BOOL v3 = [a2 count] != 0;
    id v4 = *(uint64_t (**)(uint64_t, BOOL))(v2 + 16);
    return v4(v2, v3);
  }
  return result;
}

- (void)removeNotificationsWithCategoryIdentifier:(id)a3
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__BRKUserNotificationManager_removeNotificationsWithCategoryIdentifier___block_invoke;
  v6[3] = &unk_264DB6508;
  v6[4] = self;
  id v4 = a3;
  [(BRKUserNotificationManager *)self _pendingNotificationIdentifiersWithCategoryIdentifier:v4 completionHandler:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __72__BRKUserNotificationManager_removeNotificationsWithCategoryIdentifier___block_invoke_2;
  v5[3] = &unk_264DB6508;
  void v5[4] = self;
  [(BRKUserNotificationManager *)self _deliveredNotificationIdentifiersWithCategoryIdentifier:v4 completionHandler:v5];
}

uint64_t __72__BRKUserNotificationManager_removeNotificationsWithCategoryIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removePendingNotificationRequestsWithIdentifiers:a2];
}

uint64_t __72__BRKUserNotificationManager_removeNotificationsWithCategoryIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeDeliveredNotificationsWithIdentifiers:a2];
}

- (void)removeNotification:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    notificationCenter = self->_notificationCenter;
    v10[0] = v4;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    [(UNUserNotificationCenter *)notificationCenter removePendingNotificationRequestsWithIdentifiers:v6];

    id v7 = self->_notificationCenter;
    id v9 = v4;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
    [(UNUserNotificationCenter *)v7 removeDeliveredNotificationsWithIdentifiers:v8];
  }
}

- (void)removeAllDeliveredNotifications
{
}

- (void)removeAllPendingNotifications
{
}

- (void)hasPendingLocationNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = BRKLoggingObjectForDomain(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[BRKUserNotificationManager hasPendingLocationNotification:]";
    _os_log_impl(&dword_2399EB000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  notificationCenter = self->_notificationCenter;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__BRKUserNotificationManager_hasPendingLocationNotification___block_invoke;
  v8[3] = &unk_264DB6530;
  p_long long buf = &buf;
  id v7 = v4;
  id v9 = v7;
  [(UNUserNotificationCenter *)notificationCenter getPendingNotificationRequestsWithCompletionHandler:v8];

  _Block_object_dispose(&buf, 8);
}

void __61__BRKUserNotificationManager_hasPendingLocationNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v11 + 1) + 8 * v7) content];
        id v9 = [v8 categoryIdentifier];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= [v9 isEqualToString:@"com.apple.brook.home"];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }
  uint64_t v10 = BRKLoggingObjectForDomain(4);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v16 = "-[BRKUserNotificationManager hasPendingLocationNotification:]_block_invoke";
    _os_log_impl(&dword_2399EB000, v10, OS_LOG_TYPE_DEFAULT, "%s completionHandler", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)debugPendingNotificationRequests
{
  id v3 = BRKLoggingObjectForDomain(13);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_2399EB000, v3, OS_LOG_TYPE_DEFAULT, "pending requests", v4, 2u);
  }

  [(UNUserNotificationCenter *)self->_notificationCenter getPendingNotificationRequestsWithCompletionHandler:&__block_literal_global_103];
}

void __62__BRKUserNotificationManager_debugPendingNotificationRequests__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        id v8 = BRKLoggingObjectForDomain(13);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v14 = v7;
          _os_log_impl(&dword_2399EB000, v8, OS_LOG_TYPE_DEFAULT, "\t%@", buf, 0xCu);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)handleNotificationResponse:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 notification];
  uint64_t v6 = [v5 request];
  uint64_t v7 = [v6 identifier];

  id v8 = BRKLoggingObjectForDomain(4);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    long long v17 = "-[BRKUserNotificationManager handleNotificationResponse:]";
    __int16 v18 = 2112;
    long long v19 = v7;
    _os_log_impl(&dword_2399EB000, v8, OS_LOG_TYPE_DEFAULT, "%s retrieving completion handler for notification response identifier: %@", buf, 0x16u);
  }

  long long v9 = [(NSMutableDictionary *)self->_responseHandlers objectForKeyedSubscript:v7];
  if (v9)
  {
    long long v10 = BRKLoggingObjectForDomain(4);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      long long v17 = "-[BRKUserNotificationManager handleNotificationResponse:]";
      _os_log_impl(&dword_2399EB000, v10, OS_LOG_TYPE_DEFAULT, "%s dispatching call to completion handler with notification response on main thread", buf, 0xCu);
    }

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__BRKUserNotificationManager_handleNotificationResponse___block_invoke;
    v11[3] = &unk_264DB6578;
    id v15 = v9;
    id v12 = v4;
    long long v13 = self;
    id v14 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v11);
  }
}

uint64_t __57__BRKUserNotificationManager_handleNotificationResponse___block_invoke(void *a1)
{
  (*(void (**)(void))(a1[7] + 16))();
  uint64_t v2 = a1[6];
  uint64_t v3 = *(void **)(a1[5] + 16);
  return [v3 setObject:0 forKeyedSubscript:v2];
}

- (void)_pendingNotificationIdentifiersWithCategoryIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF980] array];
  notificationCenter = self->_notificationCenter;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __102__BRKUserNotificationManager__pendingNotificationIdentifiersWithCategoryIdentifier_completionHandler___block_invoke;
  v13[3] = &unk_264DB65A0;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  [(UNUserNotificationCenter *)notificationCenter getPendingNotificationRequestsWithCompletionHandler:v13];
}

void __102__BRKUserNotificationManager__pendingNotificationIdentifiersWithCategoryIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = a2;
  uint64_t v2 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v24;
    do
    {
      uint64_t v5 = 0;
      uint64_t v20 = v3;
      do
      {
        if (*(void *)v24 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v23 + 1) + 8 * v5);
        uint64_t v7 = [v6 request];
        if (v7)
        {
          id v8 = (void *)v7;
          long long v9 = [v6 request];
          uint64_t v10 = [v9 content];
          if (v10)
          {
            id v11 = (void *)v10;
            [v6 request];
            long long v13 = v12 = v4;
            id v14 = [v13 content];
            id v15 = [v14 categoryIdentifier];
            int v16 = [v15 isEqualToString:*(void *)(a1 + 32)];

            uint64_t v4 = v12;
            uint64_t v3 = v20;

            if (!v16) {
              goto LABEL_11;
            }
            long long v17 = *(void **)(a1 + 40);
            id v8 = [v6 request];
            long long v9 = [v8 identifier];
            [v17 addObject:v9];
          }
        }
LABEL_11:
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v3);
  }
  uint64_t v18 = *(void *)(a1 + 48);
  if (v18)
  {
    long long v19 = (void *)[*(id *)(a1 + 40) copy];
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
  }
}

- (void)_deliveredNotificationIdentifiersWithCategoryIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF980] array];
  notificationCenter = self->_notificationCenter;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __104__BRKUserNotificationManager__deliveredNotificationIdentifiersWithCategoryIdentifier_completionHandler___block_invoke;
  v13[3] = &unk_264DB65A0;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  [(UNUserNotificationCenter *)notificationCenter getDeliveredNotificationsWithCompletionHandler:v13];
}

void __104__BRKUserNotificationManager__deliveredNotificationIdentifiersWithCategoryIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = a2;
  uint64_t v2 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v24;
    do
    {
      uint64_t v5 = 0;
      uint64_t v20 = v3;
      do
      {
        if (*(void *)v24 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v23 + 1) + 8 * v5);
        uint64_t v7 = [v6 request];
        if (v7)
        {
          id v8 = (void *)v7;
          long long v9 = [v6 request];
          uint64_t v10 = [v9 content];
          if (v10)
          {
            id v11 = (void *)v10;
            [v6 request];
            long long v13 = v12 = v4;
            id v14 = [v13 content];
            id v15 = [v14 categoryIdentifier];
            int v16 = [v15 isEqualToString:*(void *)(a1 + 32)];

            uint64_t v4 = v12;
            uint64_t v3 = v20;

            if (!v16) {
              goto LABEL_11;
            }
            long long v17 = *(void **)(a1 + 40);
            id v8 = [v6 request];
            long long v9 = [v8 identifier];
            [v17 addObject:v9];
          }
        }
LABEL_11:
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v3);
  }
  uint64_t v18 = *(void *)(a1 + 48);
  if (v18)
  {
    long long v19 = (void *)[*(id *)(a1 + 40) copy];
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
  }
}

- (NSXPCConnection)applicationConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationConnection);
  return (NSXPCConnection *)WeakRetained;
}

- (void)setApplicationConnection:(id)a3
{
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_destroyWeak((id *)&self->_applicationConnection);
  objc_storeStrong((id *)&self->_applicationObject, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_responseHandlers, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

void __69__BRKUserNotificationManager_promptNotificationAuthorizationRequest___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2399EB000, a2, OS_LOG_TYPE_ERROR, "Request for user notification authorization resulted in the following error: %@", (uint8_t *)&v2, 0xCu);
}

@end