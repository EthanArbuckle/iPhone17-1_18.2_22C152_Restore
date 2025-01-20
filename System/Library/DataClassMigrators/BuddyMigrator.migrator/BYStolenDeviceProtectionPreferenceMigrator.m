@interface BYStolenDeviceProtectionPreferenceMigrator
- (BYPreferencesController)sourcePreferences;
- (BYPreferencesController)targetPreferences;
- (BYStolenDeviceProtectionPreferenceMigrator)initWithMigrationContext:(int64_t)a3 sourcePreferences:(id)a4 targetPreferences:(id)a5;
- (int64_t)migrationContext;
- (void)_clearPreferenceKeyFromSourcePreferences;
- (void)_migratePreferenceKeyIfNeeded;
- (void)migratePreferenceWithSDPEnabledState:(BOOL)a3;
- (void)setMigrationContext:(int64_t)a3;
- (void)setSourcePreferences:(id)a3;
- (void)setTargetPreferences:(id)a3;
@end

@implementation BYStolenDeviceProtectionPreferenceMigrator

- (BYStolenDeviceProtectionPreferenceMigrator)initWithMigrationContext:(int64_t)a3 sourcePreferences:(id)a4 targetPreferences:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BYStolenDeviceProtectionPreferenceMigrator;
  v11 = [(BYStolenDeviceProtectionPreferenceMigrator *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_migrationContext = a3;
    objc_storeStrong((id *)&v11->_sourcePreferences, a4);
    objc_storeStrong((id *)&v12->_targetPreferences, a5);
  }

  return v12;
}

- (void)migratePreferenceWithSDPEnabledState:(BOOL)a3
{
  BOOL v3 = a3;
  if ((unint64_t)[(BYStolenDeviceProtectionPreferenceMigrator *)self migrationContext] > 1) {
    objc_exception_throw(@"Neither postRestoreFromBackup or postSoftwareUpdate are set");
  }
  if (v3) {
    [(BYStolenDeviceProtectionPreferenceMigrator *)self _migratePreferenceKeyIfNeeded];
  }
  else {
    [(BYStolenDeviceProtectionPreferenceMigrator *)self _clearPreferenceKeyFromSourcePreferences];
  }
  if (self->_didMigrate || self->_didClear)
  {
    v5 = _BYLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL didMigrate = self->_didMigrate;
      BOOL didClear = self->_didClear;
      v8[0] = 67109632;
      v8[1] = didMigrate;
      __int16 v9 = 1024;
      BOOL v10 = didClear;
      __int16 v11 = 1024;
      BOOL v12 = v3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "SDP preferences updated. didMigrate: %d, didClear: %d. SDP State: %d", (uint8_t *)v8, 0x14u);
    }
  }
  else
  {
    v5 = _BYLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1635C(v5);
    }
  }
}

- (void)_migratePreferenceKeyIfNeeded
{
  BOOL v3 = [(BYStolenDeviceProtectionPreferenceMigrator *)self targetPreferences];
  id v8 = [v3 objectForKey:@"StolenDeviceProtectionPresented"];

  if (!v8)
  {
    v4 = [(BYStolenDeviceProtectionPreferenceMigrator *)self sourcePreferences];
    v5 = [v4 objectForKey:@"StolenDeviceProtectionPresented"];

    if (v5)
    {
      self->_BOOL didMigrate = 1;
      v6 = [(BYStolenDeviceProtectionPreferenceMigrator *)self targetPreferences];
      [v6 setObject:v5 forKey:@"StolenDeviceProtectionPresented"];

      v7 = [(BYStolenDeviceProtectionPreferenceMigrator *)self targetPreferences];
      [v7 persist];
    }
  }
  [(BYStolenDeviceProtectionPreferenceMigrator *)self _clearPreferenceKeyFromSourcePreferences];
}

- (void)_clearPreferenceKeyFromSourcePreferences
{
  BOOL v3 = [(BYStolenDeviceProtectionPreferenceMigrator *)self sourcePreferences];
  v4 = [v3 objectForKey:@"StolenDeviceProtectionPresented"];

  if (v4)
  {
    self->_BOOL didClear = 1;
    v5 = [(BYStolenDeviceProtectionPreferenceMigrator *)self sourcePreferences];
    [v5 removeObjectForKey:@"StolenDeviceProtectionPresented" onlyFromMemory:0];

    id v6 = [(BYStolenDeviceProtectionPreferenceMigrator *)self sourcePreferences];
    [v6 persist];
  }
}

- (int64_t)migrationContext
{
  return self->_migrationContext;
}

- (void)setMigrationContext:(int64_t)a3
{
  self->_migrationContext = a3;
}

- (BYPreferencesController)sourcePreferences
{
  return self->_sourcePreferences;
}

- (void)setSourcePreferences:(id)a3
{
}

- (BYPreferencesController)targetPreferences
{
  return self->_targetPreferences;
}

- (void)setTargetPreferences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetPreferences, 0);

  objc_storeStrong((id *)&self->_sourcePreferences, 0);
}

@end