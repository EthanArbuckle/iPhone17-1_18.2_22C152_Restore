@interface NPSDomainAccessor(DNDSLegacySettingsSyncManager)
- (id)dnds_bypassSettings;
- (id)dnds_scheduleSettingsWithLastUpdated:()DNDSLegacySettingsSyncManager;
- (void)dnds_setBypassSettings:()DNDSLegacySettingsSyncManager;
- (void)dnds_setScheduleSettings:()DNDSLegacySettingsSyncManager;
@end

@implementation NPSDomainAccessor(DNDSLegacySettingsSyncManager)

- (id)dnds_bypassSettings
{
  char v5 = 0;
  uint64_t v1 = [a1 integerForKey:@"dndPrivilegedSenderTypes" keyExistsAndHasValidFormat:&v5];
  if (v5)
  {
    v2 = +[DNDSBypassSettingsRecord recordForLegacyPrivilegedSenderType:v1 legacyAddressBookID:0xFFFFFFFFLL];
    v3 = [MEMORY[0x1E4F5F5A8] settingsForRecord:v2];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)dnds_setBypassSettings:()DNDSLegacySettingsSyncManager
{
  id v6 = [a3 makeRecord];
  uint64_t v4 = [v6 legacyPrivilegedSenderType];
  if (v4 == 2) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = v4;
  }
  [a1 setInteger:v5 forKey:@"dndPrivilegedSenderTypes"];
}

- (id)dnds_scheduleSettingsWithLastUpdated:()DNDSLegacySettingsSyncManager
{
  id v4 = a3;
  uint64_t v5 = [a1 objectForKey:@"dndEffectiveOverrides"];
  if (v5)
  {
    id v17 = 0;
    id v6 = objc_msgSend(MEMORY[0x1E4F28DC0], "dnds_secureLegacyUnarchiverForReadingFromData:error:", v5, &v17);
    id v7 = v17;
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v11 = [v6 decodeObjectOfClasses:v10 forKey:*MEMORY[0x1E4F284E8]];

    v12 = [v11 firstObject];
    if (v12)
    {
      v13 = +[DNDSScheduleSettingsRecord recordForLegacyBehaviorOverride:v12 lastUpdated:v4];
      v14 = +[DNDSScheduleSettings settingsForRecord:v13];
    }
    else
    {
      v15 = DNDSLogLegacySettingsSync;
      if (os_log_type_enabled((os_log_t)DNDSLogLegacySettingsSync, OS_LOG_TYPE_ERROR)) {
        -[NPSDomainAccessor(DNDSLegacySettingsSyncManager) dnds_scheduleSettingsWithLastUpdated:]((uint64_t)v7, v15);
      }
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)dnds_setScheduleSettings:()DNDSLegacySettingsSyncManager
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 makeRecord];
  uint64_t v5 = [v4 legacyBehaviorOverride];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28DB0], "dnds_secureLegacyArchiver");
    v12[0] = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v6 encodeObject:v7 forKey:*MEMORY[0x1E4F284E8]];

    v8 = [v6 encodedData];
    if (v8)
    {
      [a1 setObject:v8 forKey:@"dndEffectiveOverrides"];
    }
    else
    {
      v10 = DNDSLogLegacySettingsSync;
      if (os_log_type_enabled((os_log_t)DNDSLogLegacySettingsSync, OS_LOG_TYPE_ERROR)) {
        -[NPSDomainAccessor(DNDSLegacySettingsSyncManager) dnds_setScheduleSettings:](v10);
      }
    }
  }
  else
  {
    uint64_t v9 = DNDSLogLegacySettingsSync;
    if (os_log_type_enabled((os_log_t)DNDSLogLegacySettingsSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring schedule settings with no override", v11, 2u);
    }
  }
}

- (void)dnds_scheduleSettingsWithLastUpdated:()DNDSLegacySettingsSyncManager .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3052000, a2, OS_LOG_TYPE_ERROR, "Error decoding behavior overrides: error=%{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)dnds_setScheduleSettings:()DNDSLegacySettingsSyncManager .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D3052000, log, OS_LOG_TYPE_ERROR, "Error encoding behavior overrides", v1, 2u);
}

@end