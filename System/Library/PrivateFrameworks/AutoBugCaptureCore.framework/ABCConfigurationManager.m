@interface ABCConfigurationManager
+ (id)autoBugCapturePrefix;
+ (id)defaultLibraryDirectory;
- (ABCConfigurationManager)init;
- (ABCPreferences)preferences;
- (BOOL)apnsEnabled;
- (BOOL)apnsSandboxEnvironment;
- (BOOL)apns_dev_environment;
- (BOOL)apns_enable;
- (BOOL)arbitratorDisableDampening;
- (BOOL)autoBugCaptureAvailable;
- (BOOL)autoBugCaptureEnabled;
- (BOOL)autoBugCaptureRegularPayloads;
- (BOOL)autoBugCaptureSensitivePayloads;
- (BOOL)autoBugCaptureSignature;
- (BOOL)autoBugCaptureSupportedHardware;
- (BOOL)autoBugCaptureUploadPreapproved;
- (BOOL)autoFeedbackAssistantEnable;
- (BOOL)caseSummaryEnabled;
- (BOOL)cloudKitEnabled;
- (BOOL)cloudKitPrefersAnonymous;
- (BOOL)cloudKitSandboxEnvironment;
- (BOOL)disableAPIRateLimit;
- (BOOL)hasAppleEmail;
- (BOOL)isAutomatedDeviceGroup;
- (BOOL)isCarryDevice;
- (BOOL)isDeviceUnderTest;
- (BOOL)submitToDiagnosticPipeline;
- (NSDictionary)previousConfiguration;
- (NSNumber)carrier_seed_flag;
- (NSNumber)disable_internal_build;
- (NSNumber)npi_flag;
- (NSNumber)seed_flag;
- (NSNumber)vendor_flag;
- (NSString)cloudKitContainerIdentifier;
- (NSString)cloudKitInvernessService;
- (NSString)databaseContainerPath;
- (NSString)logArchivePath;
- (double)apiLimitWindow;
- (double)apiRateLimit;
- (double)cloudKitTimeoutIntervalForRequest;
- (double)cloudKitTimeoutIntervalForResource;
- (double)diagnosticPipelineSubmissionRate;
- (id)currentDiagnosticActions;
- (id)defaultDiagnosticActions;
- (id)getAutoBugCaptureConfiguration;
- (id)loadEmbeddedConfigurationPlist:(const char *)a3;
- (int)autoBugCaptureFeatures;
- (unint64_t)arbitratorDailyCountLimit;
- (unint64_t)cloudKitFallbackMaximumLogCount;
- (unint64_t)dampenedIPSLimit;
- (unint64_t)dampeningRestrictionFactor;
- (unint64_t)maxCaseSummaryPerSubmission;
- (unint64_t)maxUploadRetryCount;
- (unint64_t)submittedCaseSummaryRetentionDays;
- (unint64_t)unsubmittedCaseSummaryRetentionDays;
- (unsigned)logArchiveGID;
- (unsigned)logArchiveUID;
- (void)dealloc;
- (void)initializeOverrides;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setApns_dev_environment:(BOOL)a3;
- (void)setApns_enable:(BOOL)a3;
- (void)setCarrier_seed_flag:(id)a3;
- (void)setDisable_internal_build:(id)a3;
- (void)setNpi_flag:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setPreviousConfiguration:(id)a3;
- (void)setSeed_flag:(id)a3;
- (void)setVendor_flag:(id)a3;
@end

@implementation ABCConfigurationManager

- (BOOL)autoBugCaptureAvailable
{
  char v3 = [(ABCConfigurationManager *)self autoBugCaptureFeatures];
  if (v3) {
    char v4 = ![(ABCConfigurationManager *)self autoBugCaptureSupportedHardware];
  }
  else {
    char v4 = 1;
  }
  BOOL v5 = [(ABCPreferences *)self->_preferences disable_autobugcapture];
  BOOL v6 = [(ABCPreferences *)self->_preferences optin_autobugcapture];
  BOOL v7 = (v3 & 0x20) == 0 || v6;
  if (v5) {
    BOOL v7 = 0;
  }
  return (v4 & 1) == 0 && v7;
}

- (ABCConfigurationManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)ABCConfigurationManager;
  v2 = [(ABCConfigurationManager *)&v6 init];
  if (v2)
  {
    char v3 = objc_alloc_init(ABCPreferences);
    preferences = v2->_preferences;
    v2->_preferences = v3;

    [(ABCPreferences *)v2->_preferences addObserver:v2 forKeyPath:@"disable_internal_build" options:1 context:0];
    [(ABCPreferences *)v2->_preferences addObserver:v2 forKeyPath:@"carrier_seed_flag" options:1 context:0];
    [(ABCPreferences *)v2->_preferences addObserver:v2 forKeyPath:@"seed_flag" options:1 context:0];
    [(ABCPreferences *)v2->_preferences addObserver:v2 forKeyPath:@"vendor_flag" options:1 context:0];
    [(ABCPreferences *)v2->_preferences addObserver:v2 forKeyPath:@"npi_flag" options:1 context:0];
    [(ABCPreferences *)v2->_preferences addObserver:v2 forKeyPath:@"optin_autobugcapture" options:1 context:0];
    [(ABCPreferences *)v2->_preferences addObserver:v2 forKeyPath:@"disable_autobugcapture" options:1 context:0];
    [(ABCPreferences *)v2->_preferences addObserver:v2 forKeyPath:@"ABCUserConsent" options:1 context:0];
    [(ABCPreferences *)v2->_preferences addObserver:v2 forKeyPath:@"diagnosticsAndUsageEnabled" options:1 context:0];
    [(ABCPreferences *)v2->_preferences addObserver:v2 forKeyPath:@"apns_enable" options:1 context:0];
    [(ABCPreferences *)v2->_preferences addObserver:v2 forKeyPath:@"apns_dev_environment" options:1 context:0];
    [(ABCPreferences *)v2->_preferences addObserver:v2 forKeyPath:@"is_automated_device_group" options:1 context:0];
    [(ABCPreferences *)v2->_preferences addObserver:v2 forKeyPath:@"ignore_automated_device_group" options:1 context:0];
    [(ABCPreferences *)v2->_preferences addObserver:v2 forKeyPath:@"autoFeedbackAssistantEnable" options:1 context:0];
    [(ABCConfigurationManager *)v2 initializeOverrides];
  }
  return v2;
}

+ (id)defaultLibraryDirectory
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  char v3 = [v2 firstObject];
  uint64_t v4 = [v3 length];
  BOOL v5 = configurationLogHandle();
  objc_super v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_INFO, "Found usable Library directory at %@", (uint8_t *)&v9, 0xCu);
    }

    id v7 = v3;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      v10 = v2;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_ERROR, "Search for usable Library directory returned empty result: %@", (uint8_t *)&v9, 0xCu);
    }

    id v7 = 0;
  }

  return v7;
}

+ (id)autoBugCapturePrefix
{
  return @"AutoBugCapture";
}

- (void)dealloc
{
  [(ABCPreferences *)self->_preferences removeObserver:self forKeyPath:@"disable_internal_build"];
  [(ABCPreferences *)self->_preferences removeObserver:self forKeyPath:@"carrier_seed_flag"];
  [(ABCPreferences *)self->_preferences removeObserver:self forKeyPath:@"seed_flag"];
  [(ABCPreferences *)self->_preferences removeObserver:self forKeyPath:@"vendor_flag"];
  [(ABCPreferences *)self->_preferences removeObserver:self forKeyPath:@"npi_flag"];
  [(ABCPreferences *)self->_preferences removeObserver:self forKeyPath:@"optin_autobugcapture"];
  [(ABCPreferences *)self->_preferences removeObserver:self forKeyPath:@"disable_autobugcapture"];
  [(ABCPreferences *)self->_preferences removeObserver:self forKeyPath:@"ABCUserConsent"];
  [(ABCPreferences *)self->_preferences removeObserver:self forKeyPath:@"diagnosticsAndUsageEnabled"];
  [(ABCPreferences *)self->_preferences removeObserver:self forKeyPath:@"apns_enable"];
  [(ABCPreferences *)self->_preferences removeObserver:self forKeyPath:@"apns_dev_environment"];
  [(ABCPreferences *)self->_preferences removeObserver:self forKeyPath:@"is_automated_device_group"];
  [(ABCPreferences *)self->_preferences removeObserver:self forKeyPath:@"ignore_automated_device_group"];
  [(ABCPreferences *)self->_preferences removeObserver:self forKeyPath:@"autoFeedbackAssistantEnable"];
  preferences = self->_preferences;
  self->_preferences = 0;

  v4.receiver = self;
  v4.super_class = (Class)ABCConfigurationManager;
  [(ABCConfigurationManager *)&v4 dealloc];
}

- (id)getAutoBugCaptureConfiguration
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unsigned int outCount = 0;
  char v3 = protocol_copyPropertyList((Protocol *)&unk_26BDF9B40, &outCount);
  if (v3)
  {
    objc_super v4 = v3;
    BOOL v5 = [MEMORY[0x263EFF9A0] dictionary];
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; ++i)
      {
        id v7 = [NSString stringWithUTF8String:property_getName(v4[i])];
        v8 = [(ABCConfigurationManager *)self valueForKey:v7];
        [v5 setObject:v8 forKeyedSubscript:v7];
      }
    }
    int v9 = configurationLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEBUG, "configuration dictionary: %@", buf, 0xCu);
    }

    free(v4);
  }
  else
  {
    v10 = configurationLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_ERROR, "ConfigurationProperties is nil!!!!", buf, 2u);
    }

    BOOL v5 = 0;
  }

  return v5;
}

- (void)initializeOverrides
{
  id v12 = +[SystemProperties sharedInstance];
  if ([(ABCPreferences *)self->_preferences disable_internal_build])
  {
    char v3 = objc_msgSend(NSNumber, "numberWithBool:", -[ABCPreferences disable_internal_build](self->_preferences, "disable_internal_build"));
  }
  else
  {
    char v3 = 0;
  }
  [(ABCConfigurationManager *)self setDisable_internal_build:v3];
  objc_msgSend(v12, "setInternalBuildDisabledByOverride:", objc_msgSend(v3, "BOOLValue"));
  objc_super v4 = [(ABCPreferences *)self->_preferences carrier_seed_flag];
  [(ABCConfigurationManager *)self setCarrier_seed_flag:v4];

  BOOL v5 = [(ABCPreferences *)self->_preferences carrier_seed_flag];
  [v12 setCarrierSeedBuildOverride:v5];

  objc_super v6 = [(ABCPreferences *)self->_preferences seed_flag];
  [(ABCConfigurationManager *)self setSeed_flag:v6];

  id v7 = [(ABCPreferences *)self->_preferences seed_flag];
  [v12 setSeedBuildOverride:v7];

  v8 = [(ABCPreferences *)self->_preferences vendor_flag];
  [(ABCConfigurationManager *)self setVendor_flag:v8];

  int v9 = [(ABCPreferences *)self->_preferences vendor_flag];
  [v12 setVendorBuildOverride:v9];

  v10 = [(ABCPreferences *)self->_preferences npi_flag];
  [(ABCConfigurationManager *)self setNpi_flag:v10];

  uint64_t v11 = [(ABCPreferences *)self->_preferences npi_flag];
  [v12 setNpiDeviceOverride:v11];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = [a5 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;
  id v12 = +[SystemProperties sharedInstance];
  if ([v8 isEqualToString:@"disable_internal_build"])
  {
    [(ABCConfigurationManager *)self setDisable_internal_build:v11];
    objc_msgSend(v12, "setInternalBuildDisabledByOverride:", objc_msgSend(v11, "BOOLValue"));
    goto LABEL_21;
  }
  if ([v8 isEqualToString:@"carrier_seed_flag"])
  {
    [(ABCConfigurationManager *)self setCarrier_seed_flag:v11];
    [v12 setCarrierSeedBuildOverride:v11];
    goto LABEL_21;
  }
  if ([v8 isEqualToString:@"seed_flag"])
  {
    [(ABCConfigurationManager *)self setSeed_flag:v11];
    [v12 setSeedBuildOverride:v11];
LABEL_21:
    [(ABCConfigurationManager *)self autoBugCaptureEnabled];
    v13 = [(ABCConfigurationManager *)self getAutoBugCaptureConfiguration];
    if (v13)
    {
      previousConfiguration = self->_previousConfiguration;
      p_previousConfiguration = &self->_previousConfiguration;
      if (![(NSDictionary *)previousConfiguration isEqualToDictionary:v13])
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.autobugcapture.configurationchanged", 0, 0, 4u);
        objc_storeStrong((id *)p_previousConfiguration, v13);
        v17 = configurationLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412290;
          v19 = v13;
          _os_log_impl(&dword_209DBA000, v17, OS_LOG_TYPE_DEFAULT, "ABC Configuration dictionary changed: %@", (uint8_t *)&v18, 0xCu);
        }
      }
    }

    goto LABEL_27;
  }
  if ([v8 isEqualToString:@"vendor_flag"])
  {
    [(ABCConfigurationManager *)self setVendor_flag:v11];
    [v12 setVendorBuildOverride:v11];
  }
  else if ([v8 isEqualToString:@"npi_flag"])
  {
    [(ABCConfigurationManager *)self setNpi_flag:v11];
    [v12 setNpiDeviceOverride:v11];
  }
  if (([v8 isEqualToString:@"optin_autobugcapture"] & 1) != 0
    || ([v8 isEqualToString:@"disable_autobugcapture"] & 1) != 0
    || ([v8 isEqualToString:@"ABCUserConsent"] & 1) != 0
    || ([v8 isEqualToString:@"diagnosticsAndUsageEnabled"] & 1) != 0
    || ([v8 isEqualToString:@"is_automated_device_group"] & 1) != 0
    || ([v8 isEqualToString:@"ignore_automated_device_group"] & 1) != 0
    || [v8 isEqualToString:@"autoFeedbackAssistantEnable"])
  {
    goto LABEL_21;
  }
LABEL_27:
}

- (BOOL)autoBugCaptureSupportedHardware
{
  return 1;
}

- (BOOL)autoBugCaptureSignature
{
  return ([(ABCConfigurationManager *)self autoBugCaptureFeatures] >> 1) & 1;
}

- (BOOL)autoBugCaptureRegularPayloads
{
  return ([(ABCConfigurationManager *)self autoBugCaptureFeatures] >> 2) & 1;
}

- (BOOL)autoBugCaptureSensitivePayloads
{
  return ([(ABCConfigurationManager *)self autoBugCaptureFeatures] >> 3) & 1;
}

- (BOOL)autoBugCaptureUploadPreapproved
{
  return ([(ABCConfigurationManager *)self autoBugCaptureFeatures] >> 4) & 1;
}

- (int)autoBugCaptureFeatures
{
  v2 = +[SystemProperties sharedInstance];
  if ([v2 internalBuild] & 1) != 0 || (objc_msgSend(v2, "carrierSeedBuild"))
  {
    int v3 = 15;
  }
  else if ([v2 customerSeedBuild])
  {
    int v3 = 7;
  }
  else if ([v2 vendorBuild])
  {
    int v3 = 3;
  }
  else
  {
    int v3 = 0;
  }

  return v3;
}

- (BOOL)autoBugCaptureEnabled
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  BOOL v3 = [(ABCConfigurationManager *)self autoBugCaptureAvailable];
  BOOL v4 = [(ABCPreferences *)self->_preferences diagnosticsAndUsageEnabled];
  BOOL v5 = [(ABCPreferences *)self->_preferences ABCUserConsent];
  BOOL v6 = [(ABCPreferences *)self->_preferences is_automated_device_group];
  BOOL v7 = [(ABCPreferences *)self->_preferences ignore_automated_device_group];
  int v8 = !v6 || v7;
  if (!v5) {
    int v8 = 0;
  }
  if (!v4) {
    int v8 = 0;
  }
  if (v3) {
    int v9 = v8;
  }
  else {
    int v9 = 0;
  }
  if (autoBugCaptureEnabled__logPrintCount && autoBugCaptureEnabled__prevEnabledValue == v9)
  {
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * autoBugCaptureEnabled__logPrintCount, 2) <= 0xCCCCCCCCCCCCCCCuLL)
    {
      uint64_t v15 = configurationLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        if (v9) {
          v16 = "ON";
        }
        else {
          v16 = "OFF";
        }
        if (v7) {
          v17 = "(ignored)";
        }
        else {
          v17 = "";
        }
        if (v3) {
          int v18 = "";
        }
        else {
          int v18 = "not ";
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v20 = v16;
        __int16 v21 = 1024;
        BOOL v22 = v4;
        __int16 v23 = 1024;
        BOOL v24 = v5;
        __int16 v25 = 1024;
        BOOL v26 = v6;
        __int16 v27 = 2080;
        v28 = v17;
        __int16 v29 = 2080;
        v30 = v18;
        __int16 v31 = 1024;
        int v32 = [(ABCConfigurationManager *)self autoBugCaptureFeatures];
        _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_INFO, "AutoBugCapture is %s - DNU:%d, user consent:%d, automated device group:%d%s, ABC:%savailable, ABC features:%d", buf, 0x38u);
      }
    }
  }
  else
  {
    id v11 = configurationLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = "OFF";
      if (v9) {
        id v12 = "ON";
      }
      if (v7) {
        v13 = "(ignored)";
      }
      else {
        v13 = "";
      }
      if (v3) {
        v14 = "";
      }
      else {
        v14 = "not ";
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v20 = v12;
      __int16 v21 = 1024;
      BOOL v22 = v4;
      __int16 v23 = 1024;
      BOOL v24 = v5;
      __int16 v25 = 1024;
      BOOL v26 = v6;
      __int16 v27 = 2080;
      v28 = v13;
      __int16 v29 = 2080;
      v30 = v14;
      __int16 v31 = 1024;
      int v32 = [(ABCConfigurationManager *)self autoBugCaptureFeatures];
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_DEFAULT, "AutoBugCapture is %s - DNU:%d, user consent:%d, automated device group:%d%s, ABC:%savailable, ABC features:%d", buf, 0x38u);
    }

    autoBugCaptureEnabled__prevEnabledValue = v9;
  }
  ++autoBugCaptureEnabled__logPrintCount;
  if (self->_autoBugCaptureEnabled != v9)
  {
    [(ABCConfigurationManager *)self willChangeValueForKey:@"autoBugCaptureEnabled"];
    self->_autoBugCaptureEnabled = v9;
    [(ABCConfigurationManager *)self didChangeValueForKey:@"autoBugCaptureEnabled"];
    LOBYTE(v9) = self->_autoBugCaptureEnabled;
  }
  return v9;
}

- (NSString)logArchivePath
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (![(id)logArchivePath_logArchivePath length])
  {
    v2 = +[ABCConfigurationManager defaultLibraryDirectory];
    if ([v2 length])
    {
      uint64_t v3 = [v2 stringByAppendingPathComponent:@"Logs/AutoBugCapture"];
      BOOL v4 = (void *)logArchivePath_logArchivePath;
      logArchivePath_logArchivePath = v3;

      BOOL v5 = configurationLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        uint64_t v9 = logArchivePath_logArchivePath;
        _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "Configured logArchivePath to be %@", (uint8_t *)&v8, 0xCu);
      }
    }
  }
  BOOL v6 = (void *)logArchivePath_logArchivePath;

  return (NSString *)v6;
}

- (unsigned)logArchiveUID
{
  unsigned int result = logArchiveUID_logArchiveUID;
  if (!logArchiveUID_logArchiveUID)
  {
    unsigned int result = getuid();
    logArchiveUID_logArchiveUID = result;
  }
  return result;
}

- (unsigned)logArchiveGID
{
  unsigned int result = logArchiveGID_logArchiveGID;
  if (!logArchiveGID_logArchiveGID)
  {
    uint64_t v3 = getgrnam("_analyticsusers");
    if (v3)
    {
      logArchiveGID_logArchiveGID = v3->gr_gid;
    }
    else
    {
      logArchiveGID_logArchiveGID = getgid();
      BOOL v4 = configurationLogHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)BOOL v5 = 0;
        _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_ERROR, "Failed to get _analyticsusers gid, using current user", v5, 2u);
      }
    }
    endgrent();
    return logArchiveGID_logArchiveGID;
  }
  return result;
}

- (NSString)databaseContainerPath
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ABCPreferences *)self->_preferences database_container_path];
  if ([v3 length])
  {
    BOOL v4 = [(ABCPreferences *)self->_preferences database_container_path];
    int v5 = [v4 isAbsolutePath];

    if (v5)
    {
      uint64_t v6 = [(ABCPreferences *)self->_preferences database_container_path];
      BOOL v7 = (void *)databaseContainerPath_dbContainerPath;
      databaseContainerPath_dbContainerPath = v6;

      int v8 = configurationLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        uint64_t v16 = databaseContainerPath_dbContainerPath;
        _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEFAULT, "Database directory overridden with: %@", (uint8_t *)&v15, 0xCu);
      }
      goto LABEL_11;
    }
  }
  else
  {
  }
  if (databaseContainerPath_dbContainerPath) {
    goto LABEL_12;
  }
  int v8 = +[ABCConfigurationManager defaultLibraryDirectory];
  if ([v8 length])
  {
    uint64_t v9 = +[ABCConfigurationManager autoBugCapturePrefix];
    uint64_t v10 = [v8 stringByAppendingPathComponent:v9];
    id v11 = (void *)databaseContainerPath_dbContainerPath;
    databaseContainerPath_dbContainerPath = v10;

    id v12 = configurationLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      uint64_t v16 = databaseContainerPath_dbContainerPath;
      _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEFAULT, "Using default database directory: %@", (uint8_t *)&v15, 0xCu);
    }
  }
LABEL_11:

LABEL_12:
  v13 = (void *)databaseContainerPath_dbContainerPath;

  return (NSString *)v13;
}

- (unint64_t)dampenedIPSLimit
{
  return [(ABCPreferences *)self->_preferences arbitrator_dampened_ips_limit];
}

- (unint64_t)maxUploadRetryCount
{
  return [(ABCPreferences *)self->_preferences max_upload_retries];
}

- (unint64_t)arbitratorDailyCountLimit
{
  return [(ABCPreferences *)self->_preferences arbitrator_daily_count_limit];
}

- (BOOL)arbitratorDisableDampening
{
  return [(ABCPreferences *)self->_preferences arbitrator_disable_dampening];
}

- (BOOL)isDeviceUnderTest
{
  return [(ABCPreferences *)self->_preferences dut_flag];
}

- (BOOL)isAutomatedDeviceGroup
{
  return [(ABCPreferences *)self->_preferences is_automated_device_group];
}

- (BOOL)hasAppleEmail
{
  return [(ABCPreferences *)self->_preferences has_apple_email];
}

- (BOOL)isCarryDevice
{
  return [(ABCPreferences *)self->_preferences is_carry_device];
}

- (unint64_t)dampeningRestrictionFactor
{
  return [(ABCPreferences *)self->_preferences dampening_restriction_factor];
}

- (BOOL)disableAPIRateLimit
{
  return [(ABCPreferences *)self->_preferences disable_api_rate_limit];
}

- (double)apiRateLimit
{
  [(ABCPreferences *)self->_preferences api_rate_limit];
  return result;
}

- (BOOL)apnsEnabled
{
  return [(ABCPreferences *)self->_preferences apns_enable];
}

- (BOOL)apnsSandboxEnvironment
{
  return [(ABCPreferences *)self->_preferences apns_dev_environment];
}

- (double)apiLimitWindow
{
  [(ABCPreferences *)self->_preferences api_limit_window];
  return result;
}

- (BOOL)cloudKitEnabled
{
  BOOL v2 = [(ABCPreferences *)self->_preferences cloudkit_enable];
  uint64_t v3 = +[SystemProperties sharedInstance];
  if (([v3 vendorBuild] & 1) != 0
    || [v3 customerBuild] && (objc_msgSend(v3, "seedBuild") & 1) == 0)
  {
    BOOL v2 = 0;
  }

  return v2;
}

- (BOOL)cloudKitSandboxEnvironment
{
  return [(ABCPreferences *)self->_preferences cloudkit_sandbox_environment];
}

- (NSString)cloudKitContainerIdentifier
{
  return [(ABCPreferences *)self->_preferences cloudkit_container_identifier];
}

- (NSString)cloudKitInvernessService
{
  return [(ABCPreferences *)self->_preferences cloudkit_inverness_service];
}

- (BOOL)cloudKitPrefersAnonymous
{
  BOOL v2 = [(ABCPreferences *)self->_preferences cloudkit_prefers_anonymous];
  uint64_t v3 = +[SystemProperties sharedInstance];
  if (([v3 vendorBuild] & 1) != 0 || objc_msgSend(v3, "customerBuild")) {
    BOOL v2 = 1;
  }

  return v2;
}

- (double)cloudKitTimeoutIntervalForResource
{
  return (double)[(ABCPreferences *)self->_preferences cloudkit_upload_expiration_timeout];
}

- (double)cloudKitTimeoutIntervalForRequest
{
  return (double)[(ABCPreferences *)self->_preferences cloudkit_upload_connection_timeout];
}

- (unint64_t)cloudKitFallbackMaximumLogCount
{
  return [(ABCPreferences *)self->_preferences cloudkit_upload_max_fallback_log_count];
}

- (BOOL)autoFeedbackAssistantEnable
{
  return [(ABCPreferences *)self->_preferences autoFeedbackAssistantEnable];
}

- (unint64_t)maxCaseSummaryPerSubmission
{
  return [(ABCPreferences *)self->_preferences case_summary_maximum_per_submission];
}

- (unint64_t)submittedCaseSummaryRetentionDays
{
  return [(ABCPreferences *)self->_preferences case_summary_submitted_retention_days];
}

- (unint64_t)unsubmittedCaseSummaryRetentionDays
{
  return [(ABCPreferences *)self->_preferences case_summary_unsubmitted_retention_days];
}

- (BOOL)caseSummaryEnabled
{
  return [(ABCPreferences *)self->_preferences case_summary_enable];
}

- (BOOL)submitToDiagnosticPipeline
{
  return [(ABCPreferences *)self->_preferences diagnostic_pipeline_submission];
}

- (double)diagnosticPipelineSubmissionRate
{
  [(ABCPreferences *)self->_preferences diagnostic_pipeline_submission_rate];
  return result;
}

- (id)loadEmbeddedConfigurationPlist:(const char *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v3 = load_embedded_xml_plist(a3);
  BOOL v4 = [v3 objectForKeyedSubscript:@"CONFIG_IDENTIFIER"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v6 = configurationLogHandle();
  BOOL v7 = v6;
  if (isKindOfClass)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      uint64_t v26 = (uint64_t)v4;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_INFO, "Embedded configuration identifier: %@", (uint8_t *)&v25, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    int v25 = 138412546;
    uint64_t v26 = (uint64_t)v9;
    __int16 v27 = 2112;
    v28 = v4;
    _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, "Found unexpected class %@ (%@) for configuration identifier - expected NSString", (uint8_t *)&v25, 0x16u);
  }
  uint64_t v10 = [v3 objectForKeyedSubscript:@"CONFIG_VERSION"];
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();
  id v12 = configurationLogHandle();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [v10 longValue];
      int v25 = 134217984;
      uint64_t v26 = v14;
      _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_INFO, "Embedded configuration version: %ld", (uint8_t *)&v25, 0xCu);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    int v25 = 138412546;
    uint64_t v26 = (uint64_t)v16;
    __int16 v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_ERROR, "Found unexpected class %@ (%@) for configuration version - expected NSNumber", (uint8_t *)&v25, 0x16u);
  }
  uint64_t v17 = [v3 objectForKeyedSubscript:@"CONFIG_CONTENT"];
  objc_opt_class();
  char v18 = objc_opt_isKindOfClass();
  v19 = configurationLogHandle();
  uint64_t v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      uint64_t v26 = (uint64_t)v17;
      _os_log_impl(&dword_209DBA000, v20, OS_LOG_TYPE_INFO, "Embedded configuration content: %@", (uint8_t *)&v25, 0xCu);
    }

    id v21 = v17;
  }
  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      BOOL v22 = (objc_class *)objc_opt_class();
      __int16 v23 = NSStringFromClass(v22);
      int v25 = 138412546;
      uint64_t v26 = (uint64_t)v23;
      __int16 v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_209DBA000, v20, OS_LOG_TYPE_ERROR, "Found unexpected class %@ (%@) for configuration content - expected NSDictionary", (uint8_t *)&v25, 0x16u);
    }
    id v21 = 0;
  }

  return v21;
}

- (id)defaultDiagnosticActions
{
  return [(ABCConfigurationManager *)self loadEmbeddedConfigurationPlist:"diag_actions"];
}

- (id)currentDiagnosticActions
{
  return 0;
}

- (ABCPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
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

- (NSNumber)disable_internal_build
{
  return self->_disable_internal_build;
}

- (void)setDisable_internal_build:(id)a3
{
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

- (NSNumber)npi_flag
{
  return self->_npi_flag;
}

- (void)setNpi_flag:(id)a3
{
}

- (NSDictionary)previousConfiguration
{
  return self->_previousConfiguration;
}

- (void)setPreviousConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousConfiguration, 0);
  objc_storeStrong((id *)&self->_npi_flag, 0);
  objc_storeStrong((id *)&self->_vendor_flag, 0);
  objc_storeStrong((id *)&self->_seed_flag, 0);
  objc_storeStrong((id *)&self->_carrier_seed_flag, 0);
  objc_storeStrong((id *)&self->_disable_internal_build, 0);

  objc_storeStrong((id *)&self->_preferences, 0);
}

@end