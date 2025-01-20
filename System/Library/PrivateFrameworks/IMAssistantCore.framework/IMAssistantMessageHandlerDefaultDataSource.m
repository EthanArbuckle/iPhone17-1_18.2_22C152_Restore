@interface IMAssistantMessageHandlerDefaultDataSource
+ (id)sharedInstance;
- (BOOL)didRegisterForContactStoreChangeNotifications;
- (BOOL)isInternationalSpamFilteringEnabled;
- (BOOL)screentimeAllowedToShowChat:(id)a3 error:(id *)a4;
- (BOOL)screentimeAllowedToShowConversationWithHandleIDs:(id)a3 error:(id *)a4;
- (CNContactStore)contactStore;
- (IMAssistantAccountDataSource)accountDataSource;
- (IMAssistantChatDataSource)chatDataSource;
- (IMAssistantCommSafetyManager)commSafetyDataSource;
- (IMAssistantContactsDataSource)contactsDataSource;
- (IMAssistantCoreTelephonySubscriptionsDataSource)coreTelephonySubscriptionsDataSource;
- (IMAssistantFileManager)fileManagerDataSource;
- (IMFileTransferCenter)fileTransferCenterDataSource;
- (IMLocationManager)locationManagerDataSource;
- (NSCache)contactIdentifierToUnifiedContactIdentifierCache;
- (NSCache)handleToContactIdentifierCache;
- (NSCache)spiHandleToPersonCache;
- (void)contactStoreDidChange:(id)a3;
- (void)registerForContactStoreChangeNotificationsIfNecessary;
- (void)setContactStore:(id)a3;
- (void)setDidRegisterForContactStoreChangeNotifications:(BOOL)a3;
@end

@implementation IMAssistantMessageHandlerDefaultDataSource

- (IMAssistantChatDataSource)chatDataSource
{
  return (IMAssistantChatDataSource *)MEMORY[0x270F9A6D0](MEMORY[0x263F4A540], sel_sharedRegistry);
}

- (IMAssistantContactsDataSource)contactsDataSource
{
  if (!self->_contactStore)
  {
    v3 = (CNContactStore *)objc_alloc_init(MEMORY[0x263EFEA58]);
    contactStore = self->_contactStore;
    self->_contactStore = v3;

    if (!self->_contactStore)
    {
      if (IMOSLoggingEnabled())
      {
        v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_22C1AD000, v5, OS_LOG_TYPE_INFO, "Failed to allocate contact store", v8, 2u);
        }
      }
    }
  }
  v6 = self->_contactStore;

  return (IMAssistantContactsDataSource *)v6;
}

- (IMAssistantAccountDataSource)accountDataSource
{
  return (IMAssistantAccountDataSource *)+[IMAssistantAccountDefaultDataSource sharedInstance];
}

- (IMAssistantCoreTelephonySubscriptionsDataSource)coreTelephonySubscriptionsDataSource
{
  return (IMAssistantCoreTelephonySubscriptionsDataSource *)+[IMAssistantCoreTelephonySubscriptionsDefaultDataSource sharedInstance];
}

- (IMLocationManager)locationManagerDataSource
{
  return (IMLocationManager *)[MEMORY[0x263F4A5A0] sharedInstance];
}

- (IMAssistantFileManager)fileManagerDataSource
{
  return (IMAssistantFileManager *)[MEMORY[0x263F08850] defaultManager];
}

- (IMFileTransferCenter)fileTransferCenterDataSource
{
  return (IMFileTransferCenter *)[MEMORY[0x263F4A578] sharedInstance];
}

- (IMAssistantCommSafetyManager)commSafetyDataSource
{
  v2 = [IMAssistantCommSafetyManager alloc];
  v3 = [MEMORY[0x263F4AF50] sharedManager];
  v4 = [MEMORY[0x263F4AF58] sharedManager];
  v5 = [(IMAssistantCommSafetyManager *)v2 initWithCommSafetyRequestsManager:v3 commSafetySettingsManager:v4];

  return v5;
}

- (NSCache)handleToContactIdentifierCache
{
  if (qword_2684A5598 != -1) {
    dispatch_once(&qword_2684A5598, &unk_26DF9B718);
  }
  [(IMAssistantMessageHandlerDefaultDataSource *)self registerForContactStoreChangeNotificationsIfNecessary];
  v3 = (void *)qword_2684A5590;

  return (NSCache *)v3;
}

- (NSCache)spiHandleToPersonCache
{
  if (qword_2684A55A8 != -1) {
    dispatch_once(&qword_2684A55A8, &unk_26DF9B738);
  }
  [(IMAssistantMessageHandlerDefaultDataSource *)self registerForContactStoreChangeNotificationsIfNecessary];
  v3 = (void *)qword_2684A55A0;

  return (NSCache *)v3;
}

- (NSCache)contactIdentifierToUnifiedContactIdentifierCache
{
  if (qword_2684A55B8 != -1) {
    dispatch_once(&qword_2684A55B8, &unk_26DF9B758);
  }
  [(IMAssistantMessageHandlerDefaultDataSource *)self registerForContactStoreChangeNotificationsIfNecessary];
  v3 = (void *)qword_2684A55B0;

  return (NSCache *)v3;
}

- (void)contactStoreDidChange:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_22C1AD000, v5, OS_LOG_TYPE_INFO, "Contact store change notification received.", v9, 2u);
    }
  }
  v6 = [(IMAssistantMessageHandlerDefaultDataSource *)self handleToContactIdentifierCache];
  [v6 removeAllObjects];

  v7 = [(IMAssistantMessageHandlerDefaultDataSource *)self spiHandleToPersonCache];
  [v7 removeAllObjects];

  v8 = [(IMAssistantMessageHandlerDefaultDataSource *)self contactIdentifierToUnifiedContactIdentifierCache];
  [v8 removeAllObjects];
}

- (void)registerForContactStoreChangeNotificationsIfNecessary
{
  if (!self->_didRegisterForContactStoreChangeNotifications)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel_contactStoreDidChange_ name:*MEMORY[0x263EFE118] object:0];

    self->_didRegisterForContactStoreChangeNotifications = 1;
  }
}

- (BOOL)isInternationalSpamFilteringEnabled
{
  return [MEMORY[0x263F4B0A0] isInternationalSpamFilteringEnabled];
}

- (BOOL)screentimeAllowedToShowChat:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = _IMAssistantCoreGeneralSignpostLogHandle();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  v8 = _IMAssistantCoreGeneralSignpostLogHandle();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "screentimeAllowedToShowChat", (const char *)&unk_22C1E071B, buf, 2u);
  }

  char v10 = [v5 allowedByScreenTime];
  BOOL v11 = v10;
  if (a4 && (v10 & 1) == 0)
  {
    int v12 = [v5 allowedToShowConversationSync];
    v13 = (void *)MEMORY[0x263F102D8];
    if (!v12) {
      v13 = (void *)MEMORY[0x263F102C8];
    }
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"__kIMAssistantMessageHandlerErrorDomain" code:*v13 userInfo:0];
  }
  v14 = _IMAssistantCoreGeneralSignpostLogHandle();
  v15 = v14;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v15, OS_SIGNPOST_INTERVAL_END, v7, "screentimeAllowedToShowChat", (const char *)&unk_22C1E071B, v17, 2u);
  }

  return v11;
}

- (BOOL)screentimeAllowedToShowConversationWithHandleIDs:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = _IMAssistantCoreGeneralSignpostLogHandle();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  v8 = _IMAssistantCoreGeneralSignpostLogHandle();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "screentimeAllowedToShowConversationWithHandleIDs", (const char *)&unk_22C1E071B, buf, 2u);
  }

  if ([MEMORY[0x263F4A570] isContactLimitsFeatureEnabled])
  {
    char v10 = [MEMORY[0x263F4A570] sharedInstance];
    id v19 = 0;
    char v11 = [v10 allowedToShowConversationWithHandleIDs:v5 sync:1 context:&v19];
    id v12 = v19;

    if (a4 && (v11 & 1) == 0)
    {
      int v13 = [v12 applicationCurrentlyLimited];
      v14 = (void *)MEMORY[0x263F102C8];
      if (!v13) {
        v14 = (void *)MEMORY[0x263F102D8];
      }
      [MEMORY[0x263F087E8] errorWithDomain:@"__kIMAssistantMessageHandlerErrorDomain" code:*v14 userInfo:0];
      char v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v12 = 0;
    char v11 = 1;
  }
  v15 = _IMAssistantCoreGeneralSignpostLogHandle();
  v16 = v15;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v16, OS_SIGNPOST_INTERVAL_END, v7, "screentimeAllowedToShowConversationWithHandleIDs", (const char *)&unk_22C1E071B, v18, 2u);
  }

  return v11;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22C1CD9D8;
  block[3] = &unk_264912A68;
  block[4] = a1;
  if (qword_2684A55C8 != -1) {
    dispatch_once(&qword_2684A55C8, block);
  }
  v2 = (void *)qword_2684A55C0;

  return v2;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (BOOL)didRegisterForContactStoreChangeNotifications
{
  return self->_didRegisterForContactStoreChangeNotifications;
}

- (void)setDidRegisterForContactStoreChangeNotifications:(BOOL)a3
{
  self->_didRegisterForContactStoreChangeNotifications = a3;
}

- (void).cxx_destruct
{
}

@end