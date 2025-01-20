@interface ATXNotificationSettingsReader
- (ATXNotificationSettingsReader)init;
- (ATXNotificationSettingsReader)initWithModeConfigurationClient:(id)a3 notificationSettingsCenter:(id)a4;
- (BOOL)appIsOnAllowList:(id)a3 dndModeUUID:(id)a4;
- (BOOL)appIsOnDenyList:(id)a3 dndModeUUID:(id)a4;
- (BOOL)contactIsOnAllowList:(id)a3 dndModeUUID:(id)a4;
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
@end

@implementation ATXNotificationSettingsReader

- (ATXNotificationSettingsReader)init
{
  v3 = +[ATXDNDModeConfigurationClient sharedInstance];
  v4 = [MEMORY[0x1E4FB3840] currentNotificationSettingsCenter];
  v5 = [(ATXNotificationSettingsReader *)self initWithModeConfigurationClient:v3 notificationSettingsCenter:v4];

  return v5;
}

- (ATXNotificationSettingsReader)initWithModeConfigurationClient:(id)a3 notificationSettingsCenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXNotificationSettingsReader;
  v9 = [(ATXNotificationSettingsReader *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modeConfigClient, a3);
    objc_storeStrong((id *)&v10->_notificationSettingsCenter, a4);
  }

  return v10;
}

- (BOOL)appIsOnAllowList:(id)a3 dndModeUUID:(id)a4
{
  id v6 = a3;
  id v7 = [(ATXNotificationSettingsReader *)self modeConfiguration:a4];
  id v8 = v7;
  if (v7)
  {
    v9 = [v7 configuration];
    BOOL v10 = [v9 exceptionForApplication:v6] == 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)appIsOnDenyList:(id)a3 dndModeUUID:(id)a4
{
  id v6 = a3;
  id v7 = [(ATXNotificationSettingsReader *)self modeConfiguration:a4];
  id v8 = v7;
  if (v7)
  {
    v9 = [v7 configuration];
    BOOL v10 = [v9 exceptionForApplication:v6] == 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)contactIsOnAllowList:(id)a3 dndModeUUID:(id)a4
{
  id v6 = a3;
  id v7 = [(ATXNotificationSettingsReader *)self modeConfiguration:a4];
  if (v7)
  {
    id v8 = objc_opt_new();
    [v8 setContactIdentifier:v6];
    v9 = [v7 configuration];
    BOOL v10 = [v9 exceptionForContactHandle:v8] == 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)contactIsOnDenyList:(id)a3 dndModeUUID:(id)a4
{
  id v6 = a3;
  id v7 = [(ATXNotificationSettingsReader *)self modeConfiguration:a4];
  if (v7)
  {
    id v8 = objc_opt_new();
    [v8 setContactIdentifier:v6];
    v9 = [v7 configuration];
    BOOL v10 = [v9 exceptionForContactHandle:v8] == 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)modeConfiguration:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(ATXDNDModeConfigurationClient *)self->_modeConfigClient modeConfigurationForDNDModeWithUUID:v4];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v8 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[ATXNotificationSettingsReader modeConfiguration:]((uint64_t)v4, v8);
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (unint64_t)applicationConfigurationTypeForDNDModeUUID:(id)a3 success:(BOOL *)a4
{
  v5 = [(ATXNotificationSettingsReader *)self modeConfiguration:a3];
  id v6 = v5;
  if (v5)
  {
    *a4 = 1;
    id v7 = [v5 configuration];
    unint64_t v8 = [v7 applicationConfigurationType];
  }
  else
  {
    *a4 = 0;
    unint64_t v8 = 2;
  }

  return v8;
}

- (unint64_t)senderConfigurationTypeForDNDModeUUID:(id)a3 success:(BOOL *)a4
{
  v5 = [(ATXNotificationSettingsReader *)self modeConfiguration:a3];
  id v6 = v5;
  if (v5)
  {
    *a4 = 1;
    id v7 = [v5 configuration];
    unint64_t v8 = [v7 senderConfigurationType];
  }
  else
  {
    *a4 = 0;
    unint64_t v8 = 2;
  }

  return v8;
}

- (id)notificationDigestDeliveryTimes
{
  v2 = [(UNNotificationSettingsCenter *)self->_notificationSettingsCenter notificationSystemSettings];
  if ([v2 scheduledDeliverySetting] == 2)
  {
    v3 = [v2 scheduledDeliveryTimes];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (BOOL)digestSetupComplete
{
  v2 = [(UNNotificationSettingsCenter *)self->_notificationSettingsCenter notificationSystemSettings];
  BOOL v3 = [v2 scheduledDeliverySetting] == 2;

  return v3;
}

- (BOOL)doesAppSendNotificationsToDigest:(id)a3
{
  BOOL v3 = [(UNNotificationSettingsCenter *)self->_notificationSettingsCenter notificationSourceWithIdentifier:a3];
  id v4 = [v3 sourceSettings];
  v5 = [v4 notificationSettings];

  LOBYTE(v4) = [v5 scheduledDeliverySetting] == 2;
  return (char)v4;
}

- (BOOL)doesAppAllowMessageBreakthrough:(id)a3
{
  BOOL v3 = [(UNNotificationSettingsCenter *)self->_notificationSettingsCenter notificationSourceWithIdentifier:a3];
  id v4 = [v3 sourceSettings];
  v5 = [v4 notificationSettings];

  LOBYTE(v4) = [v5 directMessagesSetting] == 2;
  return (char)v4;
}

- (id)allConfiguredDigestApps
{
  v2 = [(UNNotificationSettingsCenter *)self->_notificationSettingsCenter allNotificationSources];
  BOOL v3 = objc_msgSend(v2, "_pas_filteredSetWithTest:", &__block_literal_global_35);
  id v4 = objc_msgSend(v3, "_pas_mappedSetWithTransform:", &__block_literal_global_9);

  return v4;
}

BOOL __56__ATXNotificationSettingsReader_allConfiguredDigestApps__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isHiddenFromSettings])
  {
    BOOL v3 = 0;
  }
  else
  {
    id v4 = [v2 sourceSettings];
    v5 = [v4 notificationSettings];
    BOOL v3 = [v5 scheduledDeliverySetting] == 2;
  }
  return v3;
}

uint64_t __56__ATXNotificationSettingsReader_allConfiguredDigestApps__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 sourceIdentifier];
}

- (id)numConfiguredModes
{
  id v2 = [(ATXDNDModeConfigurationClient *)self->_modeConfigClient configuredModes];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "count"));
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationSettingsCenter, 0);

  objc_storeStrong((id *)&self->_modeConfigClient, 0);
}

- (void)modeConfiguration:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  v5 = "-[ATXNotificationSettingsReader modeConfiguration:]";
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "Unable to retrieve mode configuration for DNDMode UUID: %@. Returning nil in %s", (uint8_t *)&v2, 0x16u);
}

@end