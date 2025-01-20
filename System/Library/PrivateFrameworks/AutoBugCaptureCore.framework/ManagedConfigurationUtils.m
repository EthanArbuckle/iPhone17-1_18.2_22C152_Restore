@interface ManagedConfigurationUtils
+ (id)sharedInstance;
- (BOOL)diagnosticsAndUsageEnabled;
- (ManagedConfigurationUtils)init;
- (NSArray)installedVisibleProfileIdentifiers;
- (void)dealloc;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setDiagnosticsAndUsageEnabled:(BOOL)a3;
- (void)setInstalledVisibleProfileIdentifiers:(id)a3;
@end

@implementation ManagedConfigurationUtils

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v5 = objc_msgSend(a3, "effectiveBoolValueForSetting:", @"allowDiagnosticSubmission", a4);
  v6 = symptomsLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = @"OFF";
    if (v5 == 1) {
      v7 = @"ON";
    }
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "MCProfile Settings Changed, we must check the value for allowDiagnosticSubmission. It's %@", (uint8_t *)&v8, 0xCu);
  }

  if ((v5 == 1) != [(ManagedConfigurationUtils *)self diagnosticsAndUsageEnabled]) {
    [(ManagedConfigurationUtils *)self setDiagnosticsAndUsageEnabled:v5 == 1];
  }
}

- (BOOL)diagnosticsAndUsageEnabled
{
  return self->_diagnosticsAndUsageEnabled;
}

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1) {
    dispatch_once(&sharedInstance_pred, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

uint64_t __43__ManagedConfigurationUtils_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(ManagedConfigurationUtils);

  return MEMORY[0x270F9A758]();
}

- (ManagedConfigurationUtils)init
{
  v10.receiver = self;
  v10.super_class = (Class)ManagedConfigurationUtils;
  v2 = [(ManagedConfigurationUtils *)&v10 init];
  if (v2)
  {
    v3 = dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 4);
    v2->_managedConfigurationDylibHandle = v3;
    if (v3)
    {
      Class Class = objc_getClass("MCProfileConnection");
      sMCProfileConnectionClass Class = (uint64_t)Class;
      if (Class)
      {
        int v5 = [(objc_class *)Class sharedConnection];
        [v5 addObserver:v2];
        v6 = [v5 installedProfileIdentifiersWithFilterFlags:1];
        [(ManagedConfigurationUtils *)v2 setInstalledVisibleProfileIdentifiers:v6];

        [(ManagedConfigurationUtils *)v2 setDiagnosticsAndUsageEnabled:[v5 effectiveBoolValueForSetting:@"allowDiagnosticSubmission"] == 1];
LABEL_10:

        return v2;
      }
      int v5 = symptomsLogHandle();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      *(_WORD *)v9 = 0;
      v7 = "Couldn't load MCProfileConnection";
    }
    else
    {
      int v5 = symptomsLogHandle();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      *(_WORD *)v9 = 0;
      v7 = "Couldn't load ManagedConfiguration framework";
    }
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_ERROR, v7, v9, 2u);
    goto LABEL_10;
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(id)sMCProfileConnectionClass sharedConnection];
  [v3 removeObserver:self];

  managedConfigurationDylibHandle = self->_managedConfigurationDylibHandle;
  if (managedConfigurationDylibHandle) {
    dlclose(managedConfigurationDylibHandle);
  }
  v5.receiver = self;
  v5.super_class = (Class)ManagedConfigurationUtils;
  [(ManagedConfigurationUtils *)&v5 dealloc];
}

- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  objc_super v5 = objc_msgSend(a3, "installedProfileIdentifiersWithFilterFlags:", 1, a4);
  v6 = symptomsLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEBUG, "Received ProfileListChangedNotification with installed visible profiles: %@", (uint8_t *)&v10, 0xCu);
  }

  v7 = [(ManagedConfigurationUtils *)self installedVisibleProfileIdentifiers];
  char v8 = [v7 isEqualToArray:v5];

  if ((v8 & 1) == 0)
  {
    v9 = (void *)[v5 copy];
    [(ManagedConfigurationUtils *)self setInstalledVisibleProfileIdentifiers:v9];
  }
}

- (void)setDiagnosticsAndUsageEnabled:(BOOL)a3
{
  self->_diagnosticsAndUsageEnabled = a3;
}

- (NSArray)installedVisibleProfileIdentifiers
{
  return self->_installedVisibleProfileIdentifiers;
}

- (void)setInstalledVisibleProfileIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end