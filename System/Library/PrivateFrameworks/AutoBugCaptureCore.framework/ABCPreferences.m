@interface ABCPreferences
+ (id)initialValuesDictionary;
- (ABCPreferences)init;
- (BOOL)ABCUserConsent;
- (BOOL)abcUIUserConsent;
- (BOOL)apns_dev_environment;
- (BOOL)apns_enable;
- (BOOL)arbitrator_disable_dampening;
- (BOOL)autoFeedbackAssistantEnable;
- (BOOL)case_summary_enable;
- (BOOL)cloudkit_enable;
- (BOOL)cloudkit_prefers_anonymous;
- (BOOL)cloudkit_sandbox_environment;
- (BOOL)diagnostic_pipeline_submission;
- (BOOL)diagnosticsAndUsageEnabled;
- (BOOL)disable_api_rate_limit;
- (BOOL)disable_autobugcapture;
- (BOOL)disable_internal_build;
- (BOOL)dut_flag;
- (BOOL)enable_cloudkit;
- (BOOL)has_apple_email;
- (BOOL)ignore_automated_device_group;
- (BOOL)is_automated_device_group;
- (BOOL)optin_autobugcapture;
- (NSNumber)carrier_seed_flag;
- (NSNumber)npi_flag;
- (NSNumber)seed_flag;
- (NSNumber)vendor_flag;
- (NSString)cloudkit_container_identifier;
- (NSString)cloudkit_inverness_service;
- (NSString)database_container_path;
- (NSUserDefaults)automatedDeviceGroupDefaults;
- (double)api_limit_window;
- (double)api_rate_limit;
- (double)diagnostic_pipeline_submission_rate;
- (int64_t)arbitrator_daily_count_limit;
- (unint64_t)arbitrator_dampened_ips_limit;
- (unint64_t)case_summary_maximum_per_submission;
- (unint64_t)case_summary_submitted_retention_days;
- (unint64_t)case_summary_unsubmitted_retention_days;
- (unint64_t)cloudkit_upload_connection_timeout;
- (unint64_t)cloudkit_upload_expiration_timeout;
- (unint64_t)cloudkit_upload_max_fallback_log_count;
- (unint64_t)dampening_restriction_factor;
- (unint64_t)max_upload_retries;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)processInstalledVisibleProfileIdentifiers:(id)a3;
- (void)setABCUIUserConsent:(BOOL)a3;
- (void)setABCUserConsent:(BOOL)a3;
- (void)setAbcUIUserConsent:(BOOL)a3;
- (void)setApi_limit_window:(double)a3;
- (void)setApi_rate_limit:(double)a3;
- (void)setApns_dev_environment:(BOOL)a3;
- (void)setApns_enable:(BOOL)a3;
- (void)setArbitrator_daily_count_limit:(int64_t)a3;
- (void)setArbitrator_dampened_ips_limit:(unint64_t)a3;
- (void)setArbitrator_disable_dampening:(BOOL)a3;
- (void)setAutoFeedbackAssistantEnable:(BOOL)a3;
- (void)setAutomatedDeviceGroupDefaults:(id)a3;
- (void)setCarrier_seed_flag:(id)a3;
- (void)setCase_summary_enable:(BOOL)a3;
- (void)setCase_summary_maximum_per_submission:(unint64_t)a3;
- (void)setCase_summary_submitted_retention_days:(unint64_t)a3;
- (void)setCase_summary_unsubmitted_retention_days:(unint64_t)a3;
- (void)setCloudkit_container_identifier:(id)a3;
- (void)setCloudkit_enable:(BOOL)a3;
- (void)setCloudkit_inverness_service:(id)a3;
- (void)setCloudkit_prefers_anonymous:(BOOL)a3;
- (void)setCloudkit_sandbox_environment:(BOOL)a3;
- (void)setCloudkit_upload_connection_timeout:(unint64_t)a3;
- (void)setCloudkit_upload_expiration_timeout:(unint64_t)a3;
- (void)setCloudkit_upload_max_fallback_log_count:(unint64_t)a3;
- (void)setDampening_restriction_factor:(unint64_t)a3;
- (void)setDatabase_container_path:(id)a3;
- (void)setDiagnostic_pipeline_submission:(BOOL)a3;
- (void)setDiagnostic_pipeline_submission_rate:(double)a3;
- (void)setDiagnosticsAndUsageEnabled:(BOOL)a3;
- (void)setDisable_api_rate_limit:(BOOL)a3;
- (void)setDisable_autobugcapture:(BOOL)a3;
- (void)setDisable_internal_build:(BOOL)a3;
- (void)setDut_flag:(BOOL)a3;
- (void)setEnable_cloudkit:(BOOL *)a3;
- (void)setIgnore_automated_device_group:(BOOL)a3;
- (void)setMax_upload_retries:(unint64_t)a3;
- (void)setNpi_flag:(id)a3;
- (void)setOptin_autobugcapture:(BOOL)a3;
- (void)setSeed_flag:(id)a3;
- (void)setVendor_flag:(id)a3;
@end

@implementation ABCPreferences

- (BOOL)optin_autobugcapture
{
  return self->_optin_autobugcapture;
}

- (ABCPreferences)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)ABCPreferences;
  v2 = [(ABCPreferences *)&v12 init];
  if (v2)
  {
    v3 = +[ManagedConfigurationUtils sharedInstance];
    [v3 addObserver:v2 forKeyPath:@"diagnosticsAndUsageEnabled" options:1 context:0];
    -[ABCPreferences setDiagnosticsAndUsageEnabled:](v2, "setDiagnosticsAndUsageEnabled:", [v3 diagnosticsAndUsageEnabled]);
    if (!v2->_observedAutoBugCaptureUIPreference)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_settingsChanged, @"com.apple.autobugcapture.UserConsentYES", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v5 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v5, v2, (CFNotificationCallback)_settingsChanged, @"com.apple.autobugcapture.UserConsentNO", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v2->_observedAutoBugCaptureUIPreference = 1;
    }
    v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v7 = +[ABCPreferences initialValuesDictionary];
    [v6 registerDefaults:v7];
    [v6 addObserver:v2 forKeyPath:@"disable_internal_build" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"carrier_seed_flag" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"seed_flag" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"vendor_flag" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"disable_autobugcapture" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"optin_autobugcapture" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"dut_flag" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"npi_flag" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"arbitrator_disable_dampening" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"arbitrator_daily_count_limit" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"ABCUserConsent" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"apns_enable" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"apns_dev_environment" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"max_upload_retries" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"arbitrator_dampened_ips_limit" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"dampening_restriction_factor" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"disable_api_rate_limit" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"api_rate_limit" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"api_limit_window" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"database_container_path" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"ignore_automated_device_group" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"autoFeedbackAssistantEnable" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"cloudkit_enable" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"cloudkit_sandbox_environment" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"cloudkit_upload_expiration_timeout" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"cloudkit_upload_connection_timeout" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"cloudkit_upload_max_fallback_log_count" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"cloudkit_container_identifier" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"cloudkit_inverness_service" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"cloudkit_prefers_anonymous" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"case_summary_maximum_per_submission" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"case_summary_submitted_retention_days" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"case_summary_unsubmitted_retention_days" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"case_summary_enable" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"diagnostic_pipeline_submission" options:5 context:0];
    [v6 addObserver:v2 forKeyPath:@"diagnostic_pipeline_submission_rate" options:5 context:0];
    v8 = configurationLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [(ABCPreferences *)v2 autoFeedbackAssistantEnable];
      v10 = "off";
      if (v9) {
        v10 = "on";
      }
      *(_DWORD *)buf = 136446210;
      v14 = v10;
      _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEFAULT, "autoFeedbackAssistantEnable setting is %{public}s", buf, 0xCu);
    }
  }
  return v2;
}

- (void)setDiagnosticsAndUsageEnabled:(BOOL)a3
{
  self->_diagnosticsAndUsageEnabled = a3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v13 = v10;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;
  uint64_t v15 = configurationLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    unint64_t v95 = (unint64_t)v8;
    __int16 v96 = 2112;
    unint64_t v97 = (unint64_t)v9;
    _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_INFO, "%@ preference notification. change: %@ ", buf, 0x16u);
  }

  if ([v8 isEqualToString:@"disable_internal_build"])
  {
    if (v12)
    {
      -[ABCPreferences setDisable_internal_build:](self, "setDisable_internal_build:", [v12 BOOLValue]);
      v16 = configurationLogHandle();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_41:

        goto LABEL_72;
      }
      if ([(ABCPreferences *)self disable_internal_build]) {
        v17 = "YES";
      }
      else {
        v17 = "NO";
      }
      BOOL v18 = [(ABCPreferences *)self disable_internal_build];
      *(_DWORD *)buf = 136315394;
      unint64_t v95 = (unint64_t)v17;
      __int16 v96 = 2048;
      unint64_t v97 = v18;
      v19 = "disable_internal_build override is %s (%ld)";
      v20 = v16;
      uint32_t v21 = 22;
LABEL_16:
      _os_log_impl(&dword_209DBA000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
      goto LABEL_41;
    }
    [(ABCPreferences *)self setDisable_internal_build:0];
    v29 = configurationLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v30 = "disable_internal_build configured as default: NO";
LABEL_69:
      v39 = v29;
      os_log_type_t v40 = OS_LOG_TYPE_INFO;
      uint32_t v41 = 2;
LABEL_70:
      _os_log_impl(&dword_209DBA000, v39, v40, v30, buf, v41);
      goto LABEL_71;
    }
    goto LABEL_71;
  }
  if ([v8 isEqualToString:@"carrier_seed_flag"])
  {
    if (!v12)
    {
      [(ABCPreferences *)self setCarrier_seed_flag:0];
      v29 = configurationLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v30 = "carrier_seed_flag override not configured";
        goto LABEL_69;
      }
LABEL_71:

      goto LABEL_72;
    }
    [(ABCPreferences *)self setCarrier_seed_flag:v12];
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    v22 = [(ABCPreferences *)self carrier_seed_flag];
    if ([v22 BOOLValue]) {
      v23 = "YES";
    }
    else {
      v23 = "NO";
    }
    v24 = [(ABCPreferences *)self carrier_seed_flag];
    int v25 = [v24 BOOLValue];
    *(_DWORD *)buf = 136315394;
    unint64_t v95 = (unint64_t)v23;
    __int16 v96 = 1024;
    LODWORD(v97) = v25;
    v26 = "carrier_seed_flag override is %s (%d)";
LABEL_40:
    _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_DEFAULT, v26, buf, 0x12u);

    goto LABEL_41;
  }
  if ([v8 isEqualToString:@"seed_flag"])
  {
    if (!v12)
    {
      [(ABCPreferences *)self setSeed_flag:0];
      v29 = configurationLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v30 = "seed_flag override not configured";
        goto LABEL_69;
      }
      goto LABEL_71;
    }
    [(ABCPreferences *)self setSeed_flag:v12];
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    v22 = [(ABCPreferences *)self seed_flag];
    if ([v22 BOOLValue]) {
      v27 = "YES";
    }
    else {
      v27 = "NO";
    }
    v24 = [(ABCPreferences *)self seed_flag];
    int v28 = [v24 BOOLValue];
    *(_DWORD *)buf = 136315394;
    unint64_t v95 = (unint64_t)v27;
    __int16 v96 = 1024;
    LODWORD(v97) = v28;
    v26 = "seed_flag override is %s (%d)";
    goto LABEL_40;
  }
  if ([v8 isEqualToString:@"vendor_flag"])
  {
    if (!v12)
    {
      [(ABCPreferences *)self setVendor_flag:0];
      v29 = configurationLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v30 = "vendor_flag override not configured";
        goto LABEL_69;
      }
      goto LABEL_71;
    }
    [(ABCPreferences *)self setVendor_flag:v12];
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    v22 = [(ABCPreferences *)self vendor_flag];
    if ([v22 BOOLValue]) {
      v31 = "YES";
    }
    else {
      v31 = "NO";
    }
    v24 = [(ABCPreferences *)self vendor_flag];
    int v32 = [v24 BOOLValue];
    *(_DWORD *)buf = 136315394;
    unint64_t v95 = (unint64_t)v31;
    __int16 v96 = 1024;
    LODWORD(v97) = v32;
    v26 = "vendor_flag override is %s (%d)";
    goto LABEL_40;
  }
  if ([v8 isEqualToString:@"database_container_path"])
  {
    if (!v14)
    {
      [(ABCPreferences *)self setDatabase_container_path:0];
      v29 = configurationLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v30 = "database_container_path override not configured";
        goto LABEL_69;
      }
      goto LABEL_71;
    }
    [(ABCPreferences *)self setDatabase_container_path:v14];
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    v33 = [(ABCPreferences *)self database_container_path];
    *(_DWORD *)buf = 138412290;
    unint64_t v95 = (unint64_t)v33;
    v34 = "database_container_path override is %@";
LABEL_48:
    _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_DEFAULT, v34, buf, 0xCu);

    goto LABEL_41;
  }
  if ([v8 isEqualToString:@"disable_autobugcapture"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setDisable_autobugcapture:](self, "setDisable_autobugcapture:", [v12 BOOLValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    if ([(ABCPreferences *)self disable_autobugcapture]) {
      v35 = "YES";
    }
    else {
      v35 = "NO";
    }
    BOOL v36 = [(ABCPreferences *)self disable_autobugcapture];
    *(_DWORD *)buf = 136315394;
    unint64_t v95 = (unint64_t)v35;
    __int16 v96 = 1024;
    LODWORD(v97) = v36;
    v19 = "disable_autobugcapture configuration is %s (%d)";
LABEL_80:
    v20 = v16;
    uint32_t v21 = 18;
    goto LABEL_16;
  }
  if ([v8 isEqualToString:@"optin_autobugcapture"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setOptin_autobugcapture:](self, "setOptin_autobugcapture:", [v12 BOOLValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    if ([(ABCPreferences *)self optin_autobugcapture]) {
      v37 = "YES";
    }
    else {
      v37 = "NO";
    }
    BOOL v38 = [(ABCPreferences *)self optin_autobugcapture];
    *(_DWORD *)buf = 136315394;
    unint64_t v95 = (unint64_t)v37;
    __int16 v96 = 1024;
    LODWORD(v97) = v38;
    v19 = "optin_autobugcapture configuration is %s (%d)";
    goto LABEL_80;
  }
  if ([v8 isEqualToString:@"dut_flag"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setDut_flag:](self, "setDut_flag:", [v12 BOOLValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    if ([(ABCPreferences *)self dut_flag]) {
      v42 = "YES";
    }
    else {
      v42 = "NO";
    }
    BOOL v43 = [(ABCPreferences *)self dut_flag];
    *(_DWORD *)buf = 136315394;
    unint64_t v95 = (unint64_t)v42;
    __int16 v96 = 1024;
    LODWORD(v97) = v43;
    v19 = "dut_flag configuration is %s (%d)";
    goto LABEL_80;
  }
  if ([v8 isEqualToString:@"npi_flag"])
  {
    if (!v12)
    {
      [(ABCPreferences *)self setNpi_flag:0];
      v29 = configurationLogHandle();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO)) {
        goto LABEL_71;
      }
      *(_WORD *)buf = 0;
      v30 = "npi_flag override not configured";
      goto LABEL_69;
    }
    [(ABCPreferences *)self setNpi_flag:v12];
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    v22 = [(ABCPreferences *)self npi_flag];
    if ([v22 BOOLValue]) {
      v44 = "YES";
    }
    else {
      v44 = "NO";
    }
    v24 = [(ABCPreferences *)self npi_flag];
    int v45 = [v24 BOOLValue];
    *(_DWORD *)buf = 136315394;
    unint64_t v95 = (unint64_t)v44;
    __int16 v96 = 1024;
    LODWORD(v97) = v45;
    v26 = "npi_flag override is %s (%d)";
    goto LABEL_40;
  }
  if ([v8 isEqualToString:@"arbitrator_disable_dampening"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setArbitrator_disable_dampening:](self, "setArbitrator_disable_dampening:", [v12 BOOLValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    if ([(ABCPreferences *)self arbitrator_disable_dampening]) {
      v46 = "YES";
    }
    else {
      v46 = "NO";
    }
    BOOL v47 = [(ABCPreferences *)self arbitrator_disable_dampening];
    *(_DWORD *)buf = 136315394;
    unint64_t v95 = (unint64_t)v46;
    __int16 v96 = 1024;
    LODWORD(v97) = v47;
    v19 = "arbitrator_disable_dampening override is %s (%d)";
    goto LABEL_80;
  }
  if ([v8 isEqualToString:@"arbitrator_daily_count_limit"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setArbitrator_daily_count_limit:](self, "setArbitrator_daily_count_limit:", [v12 integerValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    int64_t v48 = [(ABCPreferences *)self arbitrator_daily_count_limit];
    *(_DWORD *)buf = 134217984;
    unint64_t v95 = v48;
    v19 = "arbitrator_daily_count_limit configuration is %ld";
LABEL_99:
    v20 = v16;
    uint32_t v21 = 12;
    goto LABEL_16;
  }
  if ([v8 isEqualToString:@"apns_enable"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setApns_enable:](self, "setApns_enable:", [v12 BOOLValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    if ([(ABCPreferences *)self apns_enable]) {
      v49 = "YES";
    }
    else {
      v49 = "NO";
    }
    BOOL v50 = [(ABCPreferences *)self apns_enable];
    *(_DWORD *)buf = 136315394;
    unint64_t v95 = (unint64_t)v49;
    __int16 v96 = 1024;
    LODWORD(v97) = v50;
    v19 = "apns_enable configuration is %s (%d)";
    goto LABEL_80;
  }
  if ([v8 isEqualToString:@"apns_dev_environment"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setApns_dev_environment:](self, "setApns_dev_environment:", [v12 BOOLValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    if ([(ABCPreferences *)self apns_dev_environment]) {
      v51 = "YES";
    }
    else {
      v51 = "NO";
    }
    BOOL v52 = [(ABCPreferences *)self apns_dev_environment];
    *(_DWORD *)buf = 136315394;
    unint64_t v95 = (unint64_t)v51;
    __int16 v96 = 1024;
    LODWORD(v97) = v52;
    v19 = "apns_dev_environment configuration is %s (%d)";
    goto LABEL_80;
  }
  if ([v8 isEqualToString:@"max_upload_retries"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setMax_upload_retries:](self, "setMax_upload_retries:", [v12 unsignedIntegerValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    unint64_t v53 = [(ABCPreferences *)self max_upload_retries];
    *(_DWORD *)buf = 134217984;
    unint64_t v95 = v53;
    v19 = "max_upload_retries configuration is %ld";
    goto LABEL_99;
  }
  if ([v8 isEqualToString:@"arbitrator_dampened_ips_limit"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setArbitrator_dampened_ips_limit:](self, "setArbitrator_dampened_ips_limit:", [v12 unsignedIntegerValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    unint64_t v54 = [(ABCPreferences *)self arbitrator_dampened_ips_limit];
    *(_DWORD *)buf = 134217984;
    unint64_t v95 = v54;
    v19 = "arbitrator_dampened_ips_limit configuration is %ld";
    goto LABEL_99;
  }
  if ([v8 isEqualToString:@"ABCUserConsent"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setABCUserConsent:](self, "setABCUserConsent:", [v12 unsignedIntegerValue] != 0);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    BOOL v55 = [(ABCPreferences *)self ABCUserConsent];
    *(_DWORD *)buf = 134217984;
    unint64_t v95 = v55;
    v19 = "ABCUserConsent configuration is %ld";
    goto LABEL_99;
  }
  if ([v8 isEqualToString:@"dampening_restriction_factor"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setDampening_restriction_factor:](self, "setDampening_restriction_factor:", [v12 unsignedIntegerValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    unint64_t v56 = [(ABCPreferences *)self dampening_restriction_factor];
    *(_DWORD *)buf = 134217984;
    unint64_t v95 = v56;
    v19 = "dampening_restriction_factor configuration is %ld";
    goto LABEL_99;
  }
  if ([v8 isEqualToString:@"disable_api_rate_limit"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setDisable_api_rate_limit:](self, "setDisable_api_rate_limit:", [v12 BOOLValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    if ([(ABCPreferences *)self disable_api_rate_limit]) {
      v57 = "YES";
    }
    else {
      v57 = "NO";
    }
    BOOL v58 = [(ABCPreferences *)self disable_api_rate_limit];
    *(_DWORD *)buf = 136315394;
    unint64_t v95 = (unint64_t)v57;
    __int16 v96 = 1024;
    LODWORD(v97) = v58;
    v19 = "disable_api_rate_limit override is %s (%d)";
    goto LABEL_80;
  }
  if ([v8 isEqualToString:@"api_rate_limit"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    [v12 doubleValue];
    -[ABCPreferences setApi_rate_limit:](self, "setApi_rate_limit:");
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    [(ABCPreferences *)self api_rate_limit];
    *(_DWORD *)buf = 134217984;
    unint64_t v95 = v59;
    v19 = "api_rate_limit configuration is %.1lf";
    goto LABEL_99;
  }
  if ([v8 isEqualToString:@"api_limit_window"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    [v12 doubleValue];
    -[ABCPreferences setApi_limit_window:](self, "setApi_limit_window:");
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    [(ABCPreferences *)self api_limit_window];
    *(_DWORD *)buf = 134217984;
    unint64_t v95 = v60;
    v19 = "api_limit_window configuration is %.1lf";
    goto LABEL_99;
  }
  if ([v8 isEqualToString:@"ignore_automated_device_group"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setIgnore_automated_device_group:](self, "setIgnore_automated_device_group:", [v12 BOOLValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    if ([(ABCPreferences *)self ignore_automated_device_group]) {
      v61 = "YES";
    }
    else {
      v61 = "NO";
    }
    BOOL v62 = [(ABCPreferences *)self ignore_automated_device_group];
    *(_DWORD *)buf = 136315394;
    unint64_t v95 = (unint64_t)v61;
    __int16 v96 = 1024;
    LODWORD(v97) = v62;
    v19 = "ignore_automated_device_group override is %s (%d)";
    goto LABEL_80;
  }
  if ([v8 isEqualToString:@"cloudkit_enable"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setCloudkit_enable:](self, "setCloudkit_enable:", [v12 BOOLValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    if ([(ABCPreferences *)self cloudkit_enable]) {
      v63 = "YES";
    }
    else {
      v63 = "NO";
    }
    BOOL v64 = [(ABCPreferences *)self cloudkit_enable];
    *(_DWORD *)buf = 136315394;
    unint64_t v95 = (unint64_t)v63;
    __int16 v96 = 1024;
    LODWORD(v97) = v64;
    v19 = "cloudkit_enable configuration is %s (%d)";
    goto LABEL_80;
  }
  if ([v8 isEqualToString:@"cloudkit_sandbox_environment"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setCloudkit_sandbox_environment:](self, "setCloudkit_sandbox_environment:", [v12 BOOLValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    if ([(ABCPreferences *)self cloudkit_sandbox_environment]) {
      v65 = "YES";
    }
    else {
      v65 = "NO";
    }
    BOOL v66 = [(ABCPreferences *)self cloudkit_sandbox_environment];
    *(_DWORD *)buf = 136315394;
    unint64_t v95 = (unint64_t)v65;
    __int16 v96 = 1024;
    LODWORD(v97) = v66;
    v19 = "cloudkit_sandbox_environment override is %s (%d)";
    goto LABEL_80;
  }
  if ([v8 isEqualToString:@"cloudkit_container_identifier"])
  {
    if (!v14) {
      goto LABEL_72;
    }
    [(ABCPreferences *)self setCloudkit_container_identifier:v14];
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    v33 = [(ABCPreferences *)self cloudkit_container_identifier];
    *(_DWORD *)buf = 138412290;
    unint64_t v95 = (unint64_t)v33;
    v34 = "cloudkit_container_identifier configuration is %@";
    goto LABEL_48;
  }
  if ([v8 isEqualToString:@"cloudkit_inverness_service"])
  {
    if (!v14) {
      goto LABEL_72;
    }
    [(ABCPreferences *)self setCloudkit_inverness_service:v14];
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    v33 = [(ABCPreferences *)self cloudkit_inverness_service];
    *(_DWORD *)buf = 138412290;
    unint64_t v95 = (unint64_t)v33;
    v34 = "cloudkit_inverness_service configuration is %@";
    goto LABEL_48;
  }
  if ([v8 isEqualToString:@"cloudkit_upload_expiration_timeout"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setCloudkit_upload_expiration_timeout:](self, "setCloudkit_upload_expiration_timeout:", [v12 unsignedIntegerValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    unint64_t v67 = [(ABCPreferences *)self cloudkit_upload_expiration_timeout];
    *(_DWORD *)buf = 134217984;
    unint64_t v95 = v67;
    v19 = "cloudkit_upload_expiration_timeout configuration is %ld";
    goto LABEL_99;
  }
  if ([v8 isEqualToString:@"cloudkit_upload_connection_timeout"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setCloudkit_upload_connection_timeout:](self, "setCloudkit_upload_connection_timeout:", [v12 unsignedIntegerValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    unint64_t v68 = [(ABCPreferences *)self cloudkit_upload_connection_timeout];
    *(_DWORD *)buf = 134217984;
    unint64_t v95 = v68;
    v19 = "cloudkit_upload_connection_timeout configuration is %ld";
    goto LABEL_99;
  }
  if ([v8 isEqualToString:@"cloudkit_upload_max_fallback_log_count"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setCloudkit_upload_max_fallback_log_count:](self, "setCloudkit_upload_max_fallback_log_count:", [v12 unsignedIntegerValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    unint64_t v69 = [(ABCPreferences *)self cloudkit_upload_max_fallback_log_count];
    *(_DWORD *)buf = 134217984;
    unint64_t v95 = v69;
    v19 = "cloudkit_upload_max_fallback_log_count configuration is %ld";
    goto LABEL_99;
  }
  if ([v8 isEqualToString:@"cloudkit_prefers_anonymous"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setCloudkit_prefers_anonymous:](self, "setCloudkit_prefers_anonymous:", [v12 BOOLValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    if ([(ABCPreferences *)self cloudkit_prefers_anonymous]) {
      v70 = "YES";
    }
    else {
      v70 = "NO";
    }
    BOOL v71 = [(ABCPreferences *)self cloudkit_prefers_anonymous];
    *(_DWORD *)buf = 136315394;
    unint64_t v95 = (unint64_t)v70;
    __int16 v96 = 1024;
    LODWORD(v97) = v71;
    v19 = "cloudkit_prefers_anonymous configuration is %s (%d)";
    goto LABEL_80;
  }
  if ([v8 isEqualToString:@"case_summary_maximum_per_submission"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setCase_summary_maximum_per_submission:](self, "setCase_summary_maximum_per_submission:", [v12 unsignedIntegerValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    unint64_t v72 = [(ABCPreferences *)self case_summary_maximum_per_submission];
    *(_DWORD *)buf = 134217984;
    unint64_t v95 = v72;
    v19 = "case_summary_maximum_per_submission configuration is %ld";
    goto LABEL_99;
  }
  if ([v8 isEqualToString:@"case_summary_submitted_retention_days"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setCase_summary_submitted_retention_days:](self, "setCase_summary_submitted_retention_days:", [v12 unsignedIntegerValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    unint64_t v73 = [(ABCPreferences *)self case_summary_submitted_retention_days];
    *(_DWORD *)buf = 134217984;
    unint64_t v95 = v73;
    v19 = "case_summary_submitted_retention_days configuration is %ld";
    goto LABEL_99;
  }
  if ([v8 isEqualToString:@"case_summary_unsubmitted_retention_days"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setCase_summary_unsubmitted_retention_days:](self, "setCase_summary_unsubmitted_retention_days:", [v12 unsignedIntegerValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    unint64_t v74 = [(ABCPreferences *)self case_summary_unsubmitted_retention_days];
    *(_DWORD *)buf = 134217984;
    unint64_t v95 = v74;
    v19 = "case_summary_unsubmitted_retention_days configuration is %ld";
    goto LABEL_99;
  }
  if ([v8 isEqualToString:@"case_summary_enable"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setCase_summary_enable:](self, "setCase_summary_enable:", [v12 BOOLValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    if ([(ABCPreferences *)self case_summary_enable]) {
      v75 = "YES";
    }
    else {
      v75 = "NO";
    }
    BOOL v76 = [(ABCPreferences *)self case_summary_enable];
    *(_DWORD *)buf = 136315394;
    unint64_t v95 = (unint64_t)v75;
    __int16 v96 = 1024;
    LODWORD(v97) = v76;
    v19 = "case_summary_enable configuration is %s (%d)";
    goto LABEL_80;
  }
  if ([v8 isEqualToString:@"diagnostic_pipeline_submission"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    -[ABCPreferences setDiagnostic_pipeline_submission:](self, "setDiagnostic_pipeline_submission:", [v12 BOOLValue]);
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    if ([(ABCPreferences *)self diagnostic_pipeline_submission]) {
      v77 = "YES";
    }
    else {
      v77 = "NO";
    }
    BOOL v78 = [(ABCPreferences *)self diagnostic_pipeline_submission];
    *(_DWORD *)buf = 136315394;
    unint64_t v95 = (unint64_t)v77;
    __int16 v96 = 1024;
    LODWORD(v97) = v78;
    v19 = "diagnostic_pipeline_submission configuration is %s (%d)";
    goto LABEL_80;
  }
  if ([v8 isEqualToString:@"diagnostic_pipeline_submission_rate"])
  {
    if (!v12) {
      goto LABEL_72;
    }
    [v12 doubleValue];
    -[ABCPreferences setDiagnostic_pipeline_submission_rate:](self, "setDiagnostic_pipeline_submission_rate:");
    v16 = configurationLogHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    [(ABCPreferences *)self diagnostic_pipeline_submission_rate];
    *(_DWORD *)buf = 134217984;
    unint64_t v95 = v79;
    v19 = "diagnostic_pipeline_submission_rate configuration is %.3lf";
    goto LABEL_99;
  }
  if ([v8 isEqualToString:@"autoFeedbackAssistantEnable"])
  {
    if (v12)
    {
      -[ABCPreferences setAutoFeedbackAssistantEnable:](self, "setAutoFeedbackAssistantEnable:", [v12 BOOLValue]);
      v80 = configurationLogHandle();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        if ([(ABCPreferences *)self autoFeedbackAssistantEnable]) {
          v81 = "YES";
        }
        else {
          v81 = "NO";
        }
        BOOL v82 = [(ABCPreferences *)self autoFeedbackAssistantEnable];
        *(_DWORD *)buf = 136315394;
        unint64_t v95 = (unint64_t)v81;
        __int16 v96 = 1024;
        LODWORD(v97) = v82;
        _os_log_impl(&dword_209DBA000, v80, OS_LOG_TYPE_DEFAULT, "autoFeedbackAssistantEnable configuration is %s (%d)", buf, 0x12u);
      }

      if ([(ABCPreferences *)self autoFeedbackAssistantEnable]
        && !self->_observingInstalledProfiles)
      {
        v83 = +[ManagedConfigurationUtils sharedInstance];
        [v83 addObserver:self forKeyPath:@"installedVisibleProfileIdentifiers" options:1 context:0];

        v84 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
        checkProfilesTimer = self->_checkProfilesTimer;
        self->_checkProfilesTimer = v84;

        v86 = self->_checkProfilesTimer;
        dispatch_time_t v87 = dispatch_time(0, 120000000000);
        dispatch_source_set_timer(v86, v87, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
        v88 = self->_checkProfilesTimer;
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __65__ABCPreferences_observeValueForKeyPath_ofObject_change_context___block_invoke;
        handler[3] = &unk_263FC2DC0;
        handler[4] = self;
        dispatch_source_set_event_handler(v88, handler);
        dispatch_resume((dispatch_object_t)self->_checkProfilesTimer);
        self->_observingInstalledProfiles = 1;
      }
    }
  }
  else
  {
    if ([v8 isEqualToString:@"diagnosticsAndUsageEnabled"])
    {
      if (!v12) {
        goto LABEL_72;
      }
      -[ABCPreferences setDiagnosticsAndUsageEnabled:](self, "setDiagnosticsAndUsageEnabled:", [v12 BOOLValue]);
      v16 = configurationLogHandle();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_41;
      }
      if ([(ABCPreferences *)self diagnosticsAndUsageEnabled]) {
        v89 = "YES";
      }
      else {
        v89 = "NO";
      }
      BOOL v90 = [(ABCPreferences *)self diagnosticsAndUsageEnabled];
      *(_DWORD *)buf = 136315394;
      unint64_t v95 = (unint64_t)v89;
      __int16 v96 = 1024;
      LODWORD(v97) = v90;
      v19 = "diagnosticsAndUsageEnabled configuration is %s (%d)";
      goto LABEL_80;
    }
    if (![v8 isEqualToString:@"installedVisibleProfileIdentifiers"])
    {
      v29 = configurationLogHandle();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_71;
      }
      *(_DWORD *)buf = 138412546;
      unint64_t v95 = (unint64_t)v9;
      __int16 v96 = 2112;
      unint64_t v97 = (unint64_t)v8;
      v30 = "Received an unexpected symptomsd-diag preference change: %@ for %@";
      v39 = v29;
      os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
      uint32_t v41 = 22;
      goto LABEL_70;
    }
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v91 = self->_checkProfilesTimer;
        if (v91)
        {
          dispatch_source_cancel(v91);
          v92 = self->_checkProfilesTimer;
          self->_checkProfilesTimer = 0;
        }
        [(ABCPreferences *)self processInstalledVisibleProfileIdentifiers:v10];
      }
    }
  }
LABEL_72:
}

+ (id)initialValuesDictionary
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v2 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"ABCUserConsent"];
  [v2 setObject:&unk_26BDF5948 forKeyedSubscript:@"disable_autobugcapture"];
  [v2 setObject:&unk_26BDF5948 forKeyedSubscript:@"optin_autobugcapture"];
  [v2 setObject:&unk_26BDF5948 forKeyedSubscript:@"dut_flag"];
  [v2 setObject:&unk_26BDF5948 forKeyedSubscript:@"arbitrator_disable_dampening"];
  [v2 setObject:&unk_26BDF5960 forKeyedSubscript:@"arbitrator_daily_count_limit"];
  [v2 setObject:&unk_26BDF5948 forKeyedSubscript:@"apns_enable"];
  [v2 setObject:&unk_26BDF5948 forKeyedSubscript:@"apns_dev_environment"];
  [v2 setObject:&unk_26BDF5978 forKeyedSubscript:@"max_upload_retries"];
  [v2 setObject:&unk_26BDF5990 forKeyedSubscript:@"arbitrator_dampened_ips_limit"];
  [v2 setObject:&unk_26BDF59A8 forKeyedSubscript:@"dampening_restriction_factor"];
  [v2 setObject:&unk_26BDF5948 forKeyedSubscript:@"disable_api_rate_limit"];
  [v2 setObject:&unk_26BDF59C0 forKeyedSubscript:@"api_rate_limit"];
  [v2 setObject:&unk_26BDF59D8 forKeyedSubscript:@"api_limit_window"];
  [v2 setObject:&unk_26BDF5948 forKeyedSubscript:@"ignore_automated_device_group"];
  [v2 setObject:&unk_26BDF5948 forKeyedSubscript:@"cloudkit_enable"];
  [v2 setObject:&unk_26BDF59F0 forKeyedSubscript:@"case_summary_enable"];
  [v2 setObject:&unk_26BDF5948 forKeyedSubscript:@"cloudkit_sandbox_environment"];
  [v2 setObject:&unk_26BDF5A08 forKeyedSubscript:@"cloudkit_upload_expiration_timeout"];
  [v2 setObject:&unk_26BDF5A20 forKeyedSubscript:@"cloudkit_upload_connection_timeout"];
  [v2 setObject:&unk_26BDF5978 forKeyedSubscript:@"cloudkit_upload_max_fallback_log_count"];
  [v2 setObject:@"com.apple.autobugcapture.devicediagnostics" forKeyedSubscript:@"cloudkit_container_identifier"];
  [v2 setObject:@"AbcDecision" forKeyedSubscript:@"cloudkit_inverness_service"];
  [v2 setObject:&unk_26BDF59F0 forKeyedSubscript:@"cloudkit_prefers_anonymous"];
  [v2 setObject:&unk_26BDF5948 forKeyedSubscript:@"autoFeedbackAssistantEnable"];
  [v2 setObject:&unk_26BDF5A38 forKeyedSubscript:@"case_summary_maximum_per_submission"];
  [v2 setObject:&unk_26BDF5A50 forKeyedSubscript:@"case_summary_submitted_retention_days"];
  [v2 setObject:&unk_26BDF5A68 forKeyedSubscript:@"case_summary_unsubmitted_retention_days"];
  [v2 setObject:&unk_26BDF59F0 forKeyedSubscript:@"diagnostic_pipeline_submission"];
  [v2 setObject:&unk_26BDF5F30 forKeyedSubscript:@"diagnostic_pipeline_submission_rate"];

  return v2;
}

- (BOOL)is_automated_device_group
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (os_variant_has_internal_diagnostics())
  {
    if (is_automated_device_group_foundAutomatedDeviceGroup)
    {
      id v2 = configurationLogHandle();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v12) = 0;
        v3 = "Automated device group set. Skipping further OSAnalytics queries";
        v4 = v2;
        uint32_t v5 = 2;
LABEL_8:
        _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_DEBUG, v3, (uint8_t *)&v12, v5);
      }
    }
    else
    {
      v6 = [MEMORY[0x263EFF910] date];
      [v6 timeIntervalSinceReferenceDate];
      double v8 = v7;

      if (v8 - *(double *)&is_automated_device_group_lastQueryTimestamp >= *(double *)&is_automated_device_group_queryHysteresis)
      {
        id v2 = objc_msgSend(MEMORY[0x263F38728], "automatedDeviceGroup", v8 - *(double *)&is_automated_device_group_lastQueryTimestamp);
        id v9 = configurationLogHandle();
        v10 = v9;
        if (v2)
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            int v12 = 138412290;
            uint64_t v13 = (uint64_t)v2;
            _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEFAULT, "AutomatedDeviceGroup is configured as: '%@'", (uint8_t *)&v12, 0xCu);
          }

          is_automated_device_group_foundAutomatedDeviceGroup = 1;
        }
        else
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            LOWORD(v12) = 0;
            _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_INFO, "This device is not in an automated test group", (uint8_t *)&v12, 2u);
          }

          is_automated_device_group_foundAutomatedDeviceGroup = 0;
          is_automated_device_group_queryHysteresis = fmin(*(double *)&is_automated_device_group_queryHysteresis+ *(double *)&is_automated_device_group_queryHysteresis, 3600.0);
        }
        is_automated_device_group_lastQueryTimestamp = *(void *)&v8;
        goto LABEL_17;
      }
      id v2 = configurationLogHandle();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        int v12 = 134217984;
        uint64_t v13 = is_automated_device_group_lastQueryTimestamp;
        v3 = "Skipping this OSAnalytics query (last queried 'automatedDeviceGroup' at %.3lf)";
        v4 = v2;
        uint32_t v5 = 12;
        goto LABEL_8;
      }
    }
LABEL_17:
  }
  return is_automated_device_group_foundAutomatedDeviceGroup;
}

- (BOOL)has_apple_email
{
  if (os_variant_has_internal_diagnostics() && has_apple_email_onceToken != -1) {
    dispatch_once(&has_apple_email_onceToken, &__block_literal_global_10);
  }
  return has_apple_email_foundAppleEmailAccount;
}

void __33__ABCPreferences_has_apple_email__block_invoke()
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F38728] sharedInstance];
  v1 = [v0 internalKey];

  id v2 = configurationLogHandle();
  v3 = v2;
  if (!v1)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      double v7 = "Unable to fetch the internal key from OSASystemConfiguration";
      double v8 = v3;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      goto LABEL_13;
    }
LABEL_14:

    has_apple_email_foundAppleEmailAccount = 0;
    goto LABEL_15;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138477827;
    uint64_t v14 = v1;
    _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEFAULT, "InternalKey is configured as: '%{private}@'", (uint8_t *)&v13, 0xCu);
  }

  unint64_t v4 = [v1 rangeOfString:@"@apple.com"];
  if (v4 < 2 || v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = configurationLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      double v7 = "Did not find an email address as part of the internal key";
      double v8 = v3;
      os_log_type_t v9 = OS_LOG_TYPE_INFO;
LABEL_13:
      _os_log_impl(&dword_209DBA000, v8, v9, v7, (uint8_t *)&v13, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  v10 = [v1 substringToIndex:v4 + v5];
  v11 = configurationLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v13 = 138477827;
    uint64_t v14 = v10;
    _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_INFO, "Found Apple email configured as: '%{private}@'", (uint8_t *)&v13, 0xCu);
  }

  has_apple_email_foundAppleEmailAccount = 1;
LABEL_15:
}

void __65__ABCPreferences_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = +[ManagedConfigurationUtils sharedInstance];
  unint64_t v4 = [v3 installedVisibleProfileIdentifiers];
  [v2 processInstalledVisibleProfileIdentifiers:v4];

  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = 0;
}

- (void)processInstalledVisibleProfileIdentifiers:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  char v4 = [a3 containsObject:@"com.apple.basebandlogging"];
  if (self->_autoFeedbackAssistantEnable && (v4 & 1) == 0)
  {
    uint64_t v5 = configurationLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      os_log_type_t v9 = "autoFeedbackAssistantEnable";
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_INFO, "Disabling the %s Preference", (uint8_t *)&v8, 0xCu);
    }

    v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v6 setBool:0 forKey:@"autoFeedbackAssistantEnable"];

    if (self->_observingInstalledProfiles)
    {
      double v7 = +[ManagedConfigurationUtils sharedInstance];
      [v7 removeObserver:self forKeyPath:@"installedVisibleProfileIdentifiers"];

      self->_observingInstalledProfiles = 0;
    }
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"disable_internal_build"];
  [v3 removeObserver:self forKeyPath:@"carrier_seed_flag"];
  [v3 removeObserver:self forKeyPath:@"seed_flag"];
  [v3 removeObserver:self forKeyPath:@"vendor_flag"];
  [v3 removeObserver:self forKeyPath:@"disable_autobugcapture"];
  [v3 removeObserver:self forKeyPath:@"optin_autobugcapture"];
  [v3 removeObserver:self forKeyPath:@"dut_flag"];
  [v3 removeObserver:self forKeyPath:@"npi_flag"];
  [v3 removeObserver:self forKeyPath:@"arbitrator_disable_dampening"];
  [v3 removeObserver:self forKeyPath:@"arbitrator_daily_count_limit"];
  [v3 removeObserver:self forKeyPath:@"ABCUserConsent"];
  [v3 removeObserver:self forKeyPath:@"apns_enable"];
  [v3 removeObserver:self forKeyPath:@"apns_dev_environment"];
  [v3 removeObserver:self forKeyPath:@"max_upload_retries"];
  [v3 removeObserver:self forKeyPath:@"arbitrator_dampened_ips_limit"];
  [v3 removeObserver:self forKeyPath:@"dampening_restriction_factor"];
  [v3 removeObserver:self forKeyPath:@"disable_api_rate_limit"];
  [v3 removeObserver:self forKeyPath:@"api_rate_limit"];
  [v3 removeObserver:self forKeyPath:@"api_limit_window"];
  [v3 removeObserver:self forKeyPath:@"database_container_path"];
  [v3 removeObserver:self forKeyPath:@"ignore_automated_device_group"];
  [v3 removeObserver:self forKeyPath:@"autoFeedbackAssistantEnable"];
  [v3 removeObserver:self forKeyPath:@"cloudkit_enable"];
  [v3 removeObserver:self forKeyPath:@"cloudkit_sandbox_environment"];
  [v3 removeObserver:self forKeyPath:@"cloudkit_upload_expiration_timeout"];
  [v3 removeObserver:self forKeyPath:@"cloudkit_upload_connection_timeout"];
  [v3 removeObserver:self forKeyPath:@"cloudkit_upload_max_fallback_log_count"];
  [v3 removeObserver:self forKeyPath:@"cloudkit_container_identifier"];
  [v3 removeObserver:self forKeyPath:@"cloudkit_inverness_service"];
  [v3 removeObserver:self forKeyPath:@"cloudkit_prefers_anonymous"];
  [v3 removeObserver:self forKeyPath:@"case_summary_maximum_per_submission"];
  [v3 removeObserver:self forKeyPath:@"case_summary_submitted_retention_days"];
  [v3 removeObserver:self forKeyPath:@"case_summary_unsubmitted_retention_days"];
  [v3 removeObserver:self forKeyPath:@"case_summary_enable"];
  [v3 removeObserver:self forKeyPath:@"diagnostic_pipeline_submission"];
  [v3 removeObserver:self forKeyPath:@"diagnostic_pipeline_submission_rate"];
  if (self->_observedAutoBugCaptureUIPreference)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.autobugcapture.UserConsentYES", 0);
    uint64_t v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v5, self, @"com.apple.autobugcapture.UserConsentNO", 0);
    self->_observedAutoBugCaptureUIPreference = 0;
  }
  v6 = +[ManagedConfigurationUtils sharedInstance];
  [v6 removeObserver:self forKeyPath:@"diagnosticsAndUsageEnabled"];
  if (self->_observingInstalledProfiles) {
    [v6 removeObserver:self forKeyPath:@"installedVisibleProfileIdentifiers"];
  }
  checkProfilesTimer = self->_checkProfilesTimer;
  if (checkProfilesTimer) {
    dispatch_source_cancel(checkProfilesTimer);
  }

  v8.receiver = self;
  v8.super_class = (Class)ABCPreferences;
  [(ABCPreferences *)&v8 dealloc];
}

- (void)setABCUIUserConsent:(BOOL)a3
{
  if (self->_abcUIUserConsent != a3)
  {
    [(ABCPreferences *)self willChangeValueForKey:@"abcUIUserConsent"];
    self->_BOOL abcUIUserConsent = a3;
    [(ABCPreferences *)self didChangeValueForKey:@"abcUIUserConsent"];
    BOOL abcUIUserConsent = self->_abcUIUserConsent;
    [(ABCPreferences *)self setABCUserConsent:abcUIUserConsent];
  }
}

- (void)setABCUserConsent:(BOOL)a3
{
  if (self->_ABCUserConsent != a3)
  {
    [(ABCPreferences *)self willChangeValueForKey:@"ABCUserConsent"];
    self->_ABCUserConsent = a3;
    [(ABCPreferences *)self didChangeValueForKey:@"ABCUserConsent"];
  }
}

- (BOOL)diagnosticsAndUsageEnabled
{
  return self->_diagnosticsAndUsageEnabled;
}

- (BOOL)autoFeedbackAssistantEnable
{
  return self->_autoFeedbackAssistantEnable;
}

- (void)setAutoFeedbackAssistantEnable:(BOOL)a3
{
  self->_autoFeedbackAssistantEnable = a3;
}

- (BOOL)disable_internal_build
{
  return self->_disable_internal_build;
}

- (void)setDisable_internal_build:(BOOL)a3
{
  self->_disable_internal_build = a3;
}

- (NSNumber)carrier_seed_flag
{
  return self->_carrier_seed_flag;
}

- (void)setCarrier_seed_flag:(id)a3
{
}

- (NSNumber)seed_flag
{
  return self->_seed_flag;
}

- (void)setSeed_flag:(id)a3
{
}

- (NSNumber)vendor_flag
{
  return self->_vendor_flag;
}

- (void)setVendor_flag:(id)a3
{
}

- (NSString)database_container_path
{
  return self->_database_container_path;
}

- (void)setDatabase_container_path:(id)a3
{
}

- (NSNumber)npi_flag
{
  return self->_npi_flag;
}

- (void)setNpi_flag:(id)a3
{
}

- (void)setOptin_autobugcapture:(BOOL)a3
{
  self->_optin_autobugcapture = a3;
}

- (BOOL)disable_autobugcapture
{
  return self->_disable_autobugcapture;
}

- (void)setDisable_autobugcapture:(BOOL)a3
{
  self->_disable_autobugcapture = a3;
}

- (BOOL)dut_flag
{
  return self->_dut_flag;
}

- (void)setDut_flag:(BOOL)a3
{
  self->_dut_flag = a3;
}

- (BOOL)ignore_automated_device_group
{
  return self->_ignore_automated_device_group;
}

- (void)setIgnore_automated_device_group:(BOOL)a3
{
  self->_ignore_automated_device_group = a3;
}

- (BOOL)apns_enable
{
  return self->_apns_enable;
}

- (void)setApns_enable:(BOOL)a3
{
  self->_apns_enable = a3;
}

- (BOOL)apns_dev_environment
{
  return self->_apns_dev_environment;
}

- (void)setApns_dev_environment:(BOOL)a3
{
  self->_apns_dev_environment = a3;
}

- (BOOL)arbitrator_disable_dampening
{
  return self->_arbitrator_disable_dampening;
}

- (void)setArbitrator_disable_dampening:(BOOL)a3
{
  self->_arbitrator_disable_dampening = a3;
}

- (BOOL)disable_api_rate_limit
{
  return self->_disable_api_rate_limit;
}

- (void)setDisable_api_rate_limit:(BOOL)a3
{
  self->_disable_api_rate_limit = a3;
}

- (BOOL)cloudkit_enable
{
  return self->_cloudkit_enable;
}

- (void)setCloudkit_enable:(BOOL)a3
{
  self->_cloudkit_enable = a3;
}

- (BOOL)ABCUserConsent
{
  return self->_ABCUserConsent;
}

- (BOOL)abcUIUserConsent
{
  return self->_abcUIUserConsent;
}

- (void)setAbcUIUserConsent:(BOOL)a3
{
  self->_BOOL abcUIUserConsent = a3;
}

- (int64_t)arbitrator_daily_count_limit
{
  return self->_arbitrator_daily_count_limit;
}

- (void)setArbitrator_daily_count_limit:(int64_t)a3
{
  self->_arbitrator_daily_count_limit = a3;
}

- (unint64_t)max_upload_retries
{
  return self->_max_upload_retries;
}

- (void)setMax_upload_retries:(unint64_t)a3
{
  self->_max_upload_retries = a3;
}

- (unint64_t)arbitrator_dampened_ips_limit
{
  return self->_arbitrator_dampened_ips_limit;
}

- (void)setArbitrator_dampened_ips_limit:(unint64_t)a3
{
  self->_arbitrator_dampened_ips_limit = a3;
}

- (unint64_t)dampening_restriction_factor
{
  return self->_dampening_restriction_factor;
}

- (void)setDampening_restriction_factor:(unint64_t)a3
{
  self->_dampening_restriction_factor = a3;
}

- (double)api_rate_limit
{
  return self->_api_rate_limit;
}

- (void)setApi_rate_limit:(double)a3
{
  self->_api_rate_limit = a3;
}

- (double)api_limit_window
{
  return self->_api_limit_window;
}

- (void)setApi_limit_window:(double)a3
{
  self->_api_limit_window = a3;
}

- (BOOL)cloudkit_sandbox_environment
{
  return self->_cloudkit_sandbox_environment;
}

- (void)setCloudkit_sandbox_environment:(BOOL)a3
{
  self->_cloudkit_sandbox_environment = a3;
}

- (unint64_t)cloudkit_upload_expiration_timeout
{
  return self->_cloudkit_upload_expiration_timeout;
}

- (void)setCloudkit_upload_expiration_timeout:(unint64_t)a3
{
  self->_cloudkit_upload_expiration_timeout = a3;
}

- (unint64_t)cloudkit_upload_connection_timeout
{
  return self->_cloudkit_upload_connection_timeout;
}

- (void)setCloudkit_upload_connection_timeout:(unint64_t)a3
{
  self->_cloudkit_upload_connection_timeout = a3;
}

- (unint64_t)cloudkit_upload_max_fallback_log_count
{
  return self->_cloudkit_upload_max_fallback_log_count;
}

- (void)setCloudkit_upload_max_fallback_log_count:(unint64_t)a3
{
  self->_cloudkit_upload_max_fallback_log_count = a3;
}

- (NSString)cloudkit_container_identifier
{
  return self->_cloudkit_container_identifier;
}

- (void)setCloudkit_container_identifier:(id)a3
{
}

- (NSString)cloudkit_inverness_service
{
  return self->_cloudkit_inverness_service;
}

- (void)setCloudkit_inverness_service:(id)a3
{
}

- (BOOL)cloudkit_prefers_anonymous
{
  return self->_cloudkit_prefers_anonymous;
}

- (void)setCloudkit_prefers_anonymous:(BOOL)a3
{
  self->_cloudkit_prefers_anonymous = a3;
}

- (unint64_t)case_summary_maximum_per_submission
{
  return self->_case_summary_maximum_per_submission;
}

- (void)setCase_summary_maximum_per_submission:(unint64_t)a3
{
  self->_case_summary_maximum_per_submission = a3;
}

- (unint64_t)case_summary_submitted_retention_days
{
  return self->_case_summary_submitted_retention_days;
}

- (void)setCase_summary_submitted_retention_days:(unint64_t)a3
{
  self->_case_summary_submitted_retention_days = a3;
}

- (unint64_t)case_summary_unsubmitted_retention_days
{
  return self->_case_summary_unsubmitted_retention_days;
}

- (void)setCase_summary_unsubmitted_retention_days:(unint64_t)a3
{
  self->_case_summary_unsubmitted_retention_days = a3;
}

- (BOOL)case_summary_enable
{
  return self->_case_summary_enable;
}

- (void)setCase_summary_enable:(BOOL)a3
{
  self->_case_summary_enable = a3;
}

- (BOOL)diagnostic_pipeline_submission
{
  return self->_diagnostic_pipeline_submission;
}

- (void)setDiagnostic_pipeline_submission:(BOOL)a3
{
  self->_diagnostic_pipeline_submission = a3;
}

- (double)diagnostic_pipeline_submission_rate
{
  return self->_diagnostic_pipeline_submission_rate;
}

- (void)setDiagnostic_pipeline_submission_rate:(double)a3
{
  self->_diagnostic_pipeline_submission_rate = a3;
}

- (BOOL)enable_cloudkit
{
  return self->_enable_cloudkit;
}

- (void)setEnable_cloudkit:(BOOL *)a3
{
  self->_enable_cloudkit = a3;
}

- (NSUserDefaults)automatedDeviceGroupDefaults
{
  return self->_automatedDeviceGroupDefaults;
}

- (void)setAutomatedDeviceGroupDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automatedDeviceGroupDefaults, 0);
  objc_storeStrong((id *)&self->_cloudkit_inverness_service, 0);
  objc_storeStrong((id *)&self->_cloudkit_container_identifier, 0);
  objc_storeStrong((id *)&self->_npi_flag, 0);
  objc_storeStrong((id *)&self->_database_container_path, 0);
  objc_storeStrong((id *)&self->_vendor_flag, 0);
  objc_storeStrong((id *)&self->_seed_flag, 0);
  objc_storeStrong((id *)&self->_carrier_seed_flag, 0);

  objc_storeStrong((id *)&self->_checkProfilesTimer, 0);
}

@end