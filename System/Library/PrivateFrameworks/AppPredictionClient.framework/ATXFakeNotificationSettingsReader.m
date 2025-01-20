@interface ATXFakeNotificationSettingsReader
- (ATXFakeNotificationSettingsReader)init;
- (BOOL)appIsOnAllowList:(id)a3 dndModeUUID:(id)a4;
- (BOOL)appIsOnAllowList:(id)a3 mode:(unint64_t)a4;
- (BOOL)appIsOnDenyList:(id)a3 dndModeUUID:(id)a4;
- (BOOL)contactIsOnAllowList:(id)a3 dndModeUUID:(id)a4;
- (BOOL)contactIsOnAllowList:(id)a3 mode:(unint64_t)a4;
- (BOOL)contactIsOnDenyList:(id)a3 dndModeUUID:(id)a4;
- (BOOL)digestSetupComplete;
- (BOOL)doesAppAllowMessageBreakthrough:(id)a3;
- (BOOL)doesAppSendNotificationsToDigest:(id)a3;
- (id)allConfiguredDigestApps;
- (id)modeConfiguration:(id)a3;
- (id)notificationDigestDeliveryTimes;
- (id)numConfiguredModes;
- (unint64_t)applicationConfigurationTypeForDNDModeUUID:(id)a3 success:(BOOL *)a4;
- (unint64_t)senderConfigurationTypeForDNDModeUUID:(id)a3 success:(BOOL *)a4;
- (void)setDefaultNotificationDigestDeliveryTimes:(id)a3;
- (void)setDefaultReturnValueForAppIsAllowed:(BOOL)a3;
- (void)setDefaultReturnValueForContactIsAllowed:(BOOL)a3;
- (void)setDoMessagesBreakthrough:(id)a3 doesBreakthrough:(BOOL)a4;
- (void)setDoesSendToDigest:(id)a3 doesSend:(BOOL)a4;
- (void)setIsAllowedForEntity:(id)a3 isAllowed:(BOOL)a4;
@end

@implementation ATXFakeNotificationSettingsReader

- (ATXFakeNotificationSettingsReader)init
{
  v12.receiver = self;
  v12.super_class = (Class)ATXFakeNotificationSettingsReader;
  v2 = [(ATXFakeNotificationSettingsReader *)&v12 init];
  v3 = v2;
  if (v2)
  {
    digestDeliveryTimes = v2->_digestDeliveryTimes;
    v2->_digestDeliveryTimes = (NSArray *)MEMORY[0x1E4F1CBF0];

    uint64_t v5 = objc_opt_new();
    entityToIsAllowed = v3->_entityToIsAllowed;
    v3->_entityToIsAllowed = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    sendToDigest = v3->_sendToDigest;
    v3->_sendToDigest = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    messagesBreakthrough = v3->_messagesBreakthrough;
    v3->_messagesBreakthrough = (NSMutableDictionary *)v9;
  }
  return v3;
}

- (void)setDefaultReturnValueForAppIsAllowed:(BOOL)a3
{
  self->_defaultIsAppAllowed = a3;
}

- (void)setDefaultReturnValueForContactIsAllowed:(BOOL)a3
{
  self->_defaultIsContactAllowed = a3;
}

- (void)setIsAllowedForEntity:(id)a3 isAllowed:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithBool:v4];
  [(NSMutableDictionary *)self->_entityToIsAllowed setObject:v8 forKeyedSubscript:v7];
}

- (void)setDefaultNotificationDigestDeliveryTimes:(id)a3
{
}

- (void)setDoesSendToDigest:(id)a3 doesSend:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithBool:v4];
  [(NSMutableDictionary *)self->_sendToDigest setObject:v8 forKeyedSubscript:v7];
}

- (void)setDoMessagesBreakthrough:(id)a3 doesBreakthrough:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithBool:v4];
  [(NSMutableDictionary *)self->_messagesBreakthrough setObject:v8 forKeyedSubscript:v7];
}

- (BOOL)appIsOnAllowList:(id)a3 mode:(unint64_t)a4
{
  uint64_t v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_entityToIsAllowed, "objectForKeyedSubscript:", a3, a4);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [NSNumber numberWithBool:self->_defaultIsAppAllowed];
  }
  id v8 = v7;

  char v9 = [v8 BOOLValue];
  return v9;
}

- (BOOL)contactIsOnAllowList:(id)a3 mode:(unint64_t)a4
{
  uint64_t v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_entityToIsAllowed, "objectForKeyedSubscript:", a3, a4);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [NSNumber numberWithBool:self->_defaultIsContactAllowed];
  }
  id v8 = v7;

  char v9 = [v8 BOOLValue];
  return v9;
}

- (BOOL)appIsOnAllowList:(id)a3 dndModeUUID:(id)a4
{
  uint64_t v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_entityToIsAllowed, "objectForKeyedSubscript:", a3, a4);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [NSNumber numberWithBool:self->_defaultIsAppAllowed];
  }
  id v8 = v7;

  char v9 = [v8 BOOLValue];
  return v9;
}

- (BOOL)contactIsOnAllowList:(id)a3 dndModeUUID:(id)a4
{
  uint64_t v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_entityToIsAllowed, "objectForKeyedSubscript:", a3, a4);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [NSNumber numberWithBool:self->_defaultIsContactAllowed];
  }
  id v8 = v7;

  char v9 = [v8 BOOLValue];
  return v9;
}

- (BOOL)appIsOnDenyList:(id)a3 dndModeUUID:(id)a4
{
  return 0;
}

- (BOOL)contactIsOnDenyList:(id)a3 dndModeUUID:(id)a4
{
  return 0;
}

- (id)notificationDigestDeliveryTimes
{
  return self->_digestDeliveryTimes;
}

- (BOOL)digestSetupComplete
{
  return 0;
}

- (BOOL)doesAppSendNotificationsToDigest:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_sendToDigest objectForKeyedSubscript:a3];
  BOOL v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)doesAppAllowMessageBreakthrough:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_messagesBreakthrough objectForKeyedSubscript:a3];
  BOOL v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (id)allConfiguredDigestApps
{
  v2 = objc_opt_new();

  return v2;
}

- (id)numConfiguredModes
{
  return &unk_1EFDF4140;
}

- (id)modeConfiguration:(id)a3
{
  return 0;
}

- (unint64_t)applicationConfigurationTypeForDNDModeUUID:(id)a3 success:(BOOL *)a4
{
  return 0;
}

- (unint64_t)senderConfigurationTypeForDNDModeUUID:(id)a3 success:(BOOL *)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesBreakthrough, 0);
  objc_storeStrong((id *)&self->_sendToDigest, 0);
  objc_storeStrong((id *)&self->_entityToIsAllowed, 0);

  objc_storeStrong((id *)&self->_digestDeliveryTimes, 0);
}

@end