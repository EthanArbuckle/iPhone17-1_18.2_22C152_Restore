@interface IMDualSIMUtilitiesManager
+ (IMDualSIMUtilitiesManager)sharedManager;
+ (id)_localizedShortNameForSIMID:(id)a3;
+ (id)_updateConversationListSIMShortNamesDictionary;
- (IMDualSIMUtilitiesManager)init;
- (NSDictionary)conversationListSIMShortNameDictionary;
- (id)activeSIMIDs;
- (id)shortNameForSIMLabel:(id)a3;
- (void)_handleSIMSubscriptionsUpdate;
- (void)setConversationListSIMShortNameDictionary:(id)a3;
@end

@implementation IMDualSIMUtilitiesManager

- (IMDualSIMUtilitiesManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)IMDualSIMUtilitiesManager;
  v2 = [(IMDualSIMUtilitiesManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[IMDualSIMUtilitiesManager _updateConversationListSIMShortNamesDictionary];
    conversationListSIMShortNameDictionary = v2->_conversationListSIMShortNameDictionary;
    v2->_conversationListSIMShortNameDictionary = (NSDictionary *)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1A07E368C, @"__kIMSIMSubscriptionsChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (id)activeSIMIDs
{
  return [(NSDictionary *)self->_conversationListSIMShortNameDictionary allKeys];
}

+ (IMDualSIMUtilitiesManager)sharedManager
{
  if (qword_1EB4A61D8 != -1) {
    dispatch_once(&qword_1EB4A61D8, &unk_1EF2BF380);
  }
  v2 = (void *)qword_1EB4A5E10;

  return (IMDualSIMUtilitiesManager *)v2;
}

+ (id)_updateConversationListSIMShortNamesDictionary
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = +[IMCTSubscriptionUtilities sharedInstance];
  v4 = [v3 ctSubscriptionInfo];
  v5 = [v4 subscriptions];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "labelID", (void)v15);
        v12 = +[IMDualSIMUtilitiesManager _localizedShortNameForSIMID:v11];
        if (v12) {
          [v2 setObject:v12 forKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13 = (void *)[v2 copy];

  return v13;
}

- (id)shortNameForSIMLabel:(id)a3
{
  return [(NSDictionary *)self->_conversationListSIMShortNameDictionary objectForKey:a3];
}

- (void)_handleSIMSubscriptionsUpdate
{
  uint64_t v3 = +[IMDualSIMUtilitiesManager _updateConversationListSIMShortNamesDictionary];
  conversationListSIMShortNameDictionary = self->_conversationListSIMShortNameDictionary;
  self->_conversationListSIMShortNameDictionary = v3;

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_msgSend(v5, "__mainThreadPostNotificationName:object:", @"__kIMSIMShortNameChanged", 0);
}

+ (id)_localizedShortNameForSIMID:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v3];
  id v5 = [MEMORY[0x1E4FADA90] sharedInstance];
  id v6 = [v5 providerManager];

  uint64_t v7 = [v6 telephonyProvider];
  uint64_t v8 = [v7 senderIdentityForAccountUUID:v4];

  uint64_t v9 = [v8 localizedShortName];
  if (!v9)
  {
    v10 = IMLogHandleForCategory("IMDualSIMUtilitiesManager");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1A09EFC30((uint64_t)v3, (uint64_t)v4, v10);
    }

    v11 = IMLogHandleForCategory("IMDualSIMUtilitiesManager");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1A09EFBB8((uint64_t)v8, v11);
    }
  }

  return v9;
}

- (NSDictionary)conversationListSIMShortNameDictionary
{
  return self->_conversationListSIMShortNameDictionary;
}

- (void)setConversationListSIMShortNameDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end