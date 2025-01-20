@interface DRSDampeningConfiguration
+ (id)RMEIssueCategoryConfiguration;
+ (id)_entityName;
+ (id)abcDefaultConfiguration;
+ (id)appIntentsServicesSlowActivityConfiguration;
+ (id)caHitchesConfiguration;
+ (id)coreAudioOverloadConfiguration;
+ (id)defaultSignatureDampeningConfiguration;
+ (id)drmResourceUsageConfiguration;
+ (id)drmRogueTaskConfiguration;
+ (id)hangTracerNonWatchOSCustomerConfiguration;
+ (id)hangTracerNonWatchOSInternalDownsamplingConfiguration;
+ (id)hangTracerNonWatchOSInternalNoDownsamplingConfiguration;
+ (id)hangTracerNonWatchOSSeedConfiguration;
+ (id)hangTracerWatchOSInternalOrSeedDownsamplingConfiguration;
+ (id)hangTracerWatchOSInternalOrSeedNoDownsamplingConfiguration;
+ (id)libtraceLoggingSampleConfiguration;
+ (id)libtraceQuarantineConfiguration;
+ (id)mailIssueCategoryConfiguration;
+ (id)memoryToolsDefaultConfiguration;
+ (id)memoryToolsInternalMemgraphOverTimeConfiguration;
+ (id)nandAutoGBBSweepConfiguration;
+ (id)nandDefaultConfiguration;
+ (id)newsConfiguration;
+ (id)ppsArchiveConfiguration;
+ (id)ppsBGArchiveConfiguration;
+ (id)ppsCEArchiveConfiguration;
+ (id)ppsSafeguardArchiveConfiguration;
+ (id)ppsUpgradeArchiveConfiguration;
+ (id)ppsXCArchiveConfiguration;
+ (id)rapidMicroDiagnosticsConfiguration;
+ (id)sentryAppLaunchConfiguration;
+ (id)softwareUpdateLogoutInterruptedConfiguration;
+ (id)spindumpMacOSSlowHIDConfiguration_Internal;
+ (id)spindumpMacOSSlowHIDConfiguration_SeedRC;
+ (id)spindumpWorkflowResponsivenessConfiguration_External;
+ (id)spindumpWorkflowResponsivenessConfiguration_Internal;
+ (id)spotlightInternalWatchdogConfiguration;
+ (id)sqlQueryPerformanceConfiguration;
+ (id)watchdogdDefaultConfiguration;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDampeningConfiguration:(id)a3;
- (DRSDampeningConfiguration)initWithHysteresis:(double)a3 cap:(unint64_t)a4 acceptanceRate:(double)a5;
- (DRSDampeningConfiguration)initWithPlistDict:(id)a3;
- (double)acceptanceRate;
- (double)hysteresis;
- (id)_ON_MOC_QUEUE_moRepresentationInContext:(id)a3 identifier:(id)a4;
- (id)_initWithMO_ON_MOC_QUEUE:(id)a3;
- (id)debugDescription;
- (id)jsonCompatibleDictRepresentation;
- (unint64_t)countCap;
- (void)setAcceptanceRate:(double)a3;
- (void)setCountCap:(unint64_t)a3;
- (void)setHysteresis:(double)a3;
@end

@implementation DRSDampeningConfiguration

- (id)debugDescription
{
  id v3 = [NSString alloc];
  [(DRSDampeningConfiguration *)self hysteresis];
  uint64_t v5 = v4;
  unint64_t v6 = [(DRSDampeningConfiguration *)self countCap];
  [(DRSDampeningConfiguration *)self acceptanceRate];
  v8 = objc_msgSend(v3, "initWithFormat:", @"Hysteresis window: %.1fs\nCap: %lu\nAcceptance rate: %.3f\n", v5, v6, v7);

  return v8;
}

+ (id)_entityName
{
  return @"DRSDampeningConfigurationMO";
}

- (DRSDampeningConfiguration)initWithPlistDict:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __47__DRSDampeningConfiguration_initWithPlistDict___block_invoke;
  v24[3] = &unk_263FCA728;
  v24[4] = &v25;
  [v4 enumerateKeysAndObjectsUsingBlock:v24];
  if (*((unsigned char *)v26 + 24))
  {
    uint64_t v5 = DPLogHandle_DampeningManagerError();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidDampeningConfigurationPlist", "Found unexpected object types in plist dictionary", v23, 2u);
    }
    unint64_t v6 = 0;
  }
  else
  {
    uint64_t v7 = [v4 objectForKeyedSubscript:kDRSDMHysteresisKey];
    v8 = (void *)v7;
    v9 = &unk_26BE05868;
    if (v7) {
      v9 = (void *)v7;
    }
    uint64_t v5 = v9;

    uint64_t v10 = [v4 objectForKeyedSubscript:kDRSDMCountCapKey];
    v11 = (void *)v10;
    v12 = &unk_26BE05838;
    if (v10) {
      v12 = (void *)v10;
    }
    id v13 = v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:kDRSDMAcceptanceRateKey];
    v15 = (void *)v14;
    v16 = &unk_26BE05878;
    if (v14) {
      v16 = (void *)v14;
    }
    id v17 = v16;

    [v5 floatValue];
    float v19 = v18;
    uint64_t v20 = [v13 unsignedIntegerValue];
    [v17 doubleValue];
    self = [(DRSDampeningConfiguration *)self initWithHysteresis:v20 cap:v19 acceptanceRate:v21];

    unint64_t v6 = self;
  }

  _Block_object_dispose(&v25, 8);
  return v6;
}

void __47__DRSDampeningConfiguration_initWithPlistDict___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  id v7 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (DRSDampeningConfiguration)initWithHysteresis:(double)a3 cap:(unint64_t)a4 acceptanceRate:(double)a5
{
  unint64_t v6 = self;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a3 < 0.0)
  {
    id v7 = DPLogHandle_DampeningManagerError();
    if (os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 134217984;
      double v17 = a3;
      v8 = "Invalid hysteresis window of %f";
LABEL_10:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DampeningConfigurationFailure", v8, buf, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (a5 < 0.0 || a5 > 1.0)
  {
    id v7 = DPLogHandle_DampeningManagerError();
    if (os_signpost_enabled(v7))
    {
      *(_DWORD *)buf = 134217984;
      double v17 = a5;
      v8 = "Invalid acceptance rate of %f";
      goto LABEL_10;
    }
LABEL_11:

    v11 = 0;
    goto LABEL_15;
  }
  v15.receiver = self;
  v15.super_class = (Class)DRSDampeningConfiguration;
  id v13 = [(DRSDampeningConfiguration *)&v15 init];
  if (v13)
  {
    v13->_countCap = a4;
    v13->_hysteresis = a3;
    v13->_acceptanceRate = a5;
  }
  unint64_t v6 = v13;
  v11 = v6;
LABEL_15:

  return v11;
}

- (id)_initWithMO_ON_MOC_QUEUE:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [v4 hysteresis];
    double v6 = v5;
    uint64_t v7 = [v4 countCap];
    [v4 acceptanceRate];
    double v9 = v8;

    self = [(DRSDampeningConfiguration *)self initWithHysteresis:v7 cap:v6 acceptanceRate:v9];
    uint64_t v10 = self;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_ON_MOC_QUEUE_moRepresentationInContext:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [[DRSDampeningConfigurationMO alloc] initWithContext:v7];

  [(DRSDampeningConfiguration *)self hysteresis];
  -[DRSDampeningConfigurationMO setHysteresis:](v8, "setHysteresis:");
  [(DRSDampeningConfigurationMO *)v8 setCountCap:[(DRSDampeningConfiguration *)self countCap]];
  [(DRSDampeningConfiguration *)self acceptanceRate];
  -[DRSDampeningConfigurationMO setAcceptanceRate:](v8, "setAcceptanceRate:");
  [(DRSDampeningConfigurationMO *)v8 setIdentifier:v6];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DRSDampeningConfiguration *)a3;
  double v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(DRSDampeningConfiguration *)self isEqualToDampeningConfiguration:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToDampeningConfiguration:(id)a3
{
  id v4 = a3;
  if (v4
    && (-[DRSDampeningConfiguration hysteresis](self, "hysteresis"), double v6 = v5, [v4 hysteresis], v6 == v7)
    && (unint64_t v8 = -[DRSDampeningConfiguration countCap](self, "countCap"), v8 == [v4 countCap]))
  {
    [(DRSDampeningConfiguration *)self acceptanceRate];
    double v10 = v9;
    [v4 acceptanceRate];
    BOOL v12 = v10 == v11;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (id)defaultSignatureDampeningConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:0 cap:150.0 acceptanceRate:0.5];

  return v2;
}

- (id)jsonCompatibleDictRepresentation
{
  v12[3] = *MEMORY[0x263EF8340];
  v11[0] = kDRSDMHysteresisKey;
  id v3 = NSNumber;
  [(DRSDampeningConfiguration *)self hysteresis];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  v12[0] = v4;
  v11[1] = kDRSDMCountCapKey;
  unint64_t v5 = [(DRSDampeningConfiguration *)self countCap];
  if (v5 == 0x7FFFFFFF)
  {
    double v6 = @"<No cap>";
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DRSDampeningConfiguration countCap](self, "countCap"));
    double v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = kDRSDMAcceptanceRateKey;
  double v7 = NSNumber;
  [(DRSDampeningConfiguration *)self acceptanceRate];
  unint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
  v12[2] = v8;
  double v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  if (v5 != 0x7FFFFFFF) {

  }
  return v9;
}

+ (id)nandDefaultConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:12 cap:300.0 acceptanceRate:1.0];

  return v2;
}

+ (id)memoryToolsDefaultConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:5 cap:1.0 acceptanceRate:1.0];

  return v2;
}

+ (id)memoryToolsInternalMemgraphOverTimeConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:50 cap:1.0 acceptanceRate:1.0];

  return v2;
}

+ (id)hangTracerNonWatchOSInternalNoDownsamplingConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:4 cap:0.0 acceptanceRate:1.0];

  return v2;
}

+ (id)hangTracerNonWatchOSInternalDownsamplingConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:4 cap:0.0 acceptanceRate:0.5];

  return v2;
}

+ (id)hangTracerNonWatchOSSeedConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:3 cap:0.0 acceptanceRate:1.0];

  return v2;
}

+ (id)hangTracerNonWatchOSCustomerConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:3 cap:0.0 acceptanceRate:0.75];

  return v2;
}

+ (id)hangTracerWatchOSInternalOrSeedNoDownsamplingConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:2 cap:0.0 acceptanceRate:1.0];

  return v2;
}

+ (id)hangTracerWatchOSInternalOrSeedDownsamplingConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:2 cap:0.0 acceptanceRate:0.25];

  return v2;
}

+ (id)sentryAppLaunchConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:12 cap:3600.0 acceptanceRate:1.0];

  return v2;
}

+ (id)coreAudioOverloadConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:20 cap:1800.0 acceptanceRate:1.0];

  return v2;
}

+ (id)spindumpMacOSSlowHIDConfiguration_Internal
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:10 cap:6480.0 acceptanceRate:1.0];

  return v2;
}

+ (id)spindumpMacOSSlowHIDConfiguration_SeedRC
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:3 cap:21600.0 acceptanceRate:1.0];

  return v2;
}

+ (id)spindumpWorkflowResponsivenessConfiguration_Internal
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:10 cap:1800.0 acceptanceRate:1.0];

  return v2;
}

+ (id)spindumpWorkflowResponsivenessConfiguration_External
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:3 cap:1800.0 acceptanceRate:1.0];

  return v2;
}

+ (id)drmResourceUsageConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:1 cap:86400.0 acceptanceRate:1.0];

  return v2;
}

+ (id)drmRogueTaskConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:1 cap:0.0 acceptanceRate:1.0];

  return v2;
}

+ (id)caHitchesConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:12 cap:3600.0 acceptanceRate:1.0];

  return v2;
}

+ (id)watchdogdDefaultConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:1 cap:86400.0 acceptanceRate:1.0];

  return v2;
}

+ (id)ppsArchiveConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:2 cap:39600.0 acceptanceRate:1.0];

  return v2;
}

+ (id)ppsCEArchiveConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:2 cap:39600.0 acceptanceRate:1.0];

  return v2;
}

+ (id)ppsXCArchiveConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:2 cap:39600.0 acceptanceRate:1.0];

  return v2;
}

+ (id)rapidMicroDiagnosticsConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:2 cap:43200.0 acceptanceRate:1.0];

  return v2;
}

+ (id)ppsSafeguardArchiveConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:2 cap:39600.0 acceptanceRate:1.0];

  return v2;
}

+ (id)ppsBGArchiveConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:2 cap:39600.0 acceptanceRate:1.0];

  return v2;
}

+ (id)ppsUpgradeArchiveConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:2 cap:39600.0 acceptanceRate:1.0];

  return v2;
}

+ (id)nandAutoGBBSweepConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:10 cap:0.0 acceptanceRate:1.0];

  return v2;
}

+ (id)mailIssueCategoryConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:5 cap:600.0 acceptanceRate:1.0];

  return v2;
}

+ (id)sqlQueryPerformanceConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:2 cap:43200.0 acceptanceRate:1.0];

  return v2;
}

+ (id)RMEIssueCategoryConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:12 cap:600.0 acceptanceRate:1.0];

  return v2;
}

+ (id)abcDefaultConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:50 cap:0.0 acceptanceRate:1.0];

  return v2;
}

+ (id)newsConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:1 cap:0.0 acceptanceRate:1.0];

  return v2;
}

+ (id)libtraceQuarantineConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:10 cap:0.0 acceptanceRate:1.0];

  return v2;
}

+ (id)libtraceLoggingSampleConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:2 cap:43200.0 acceptanceRate:1.0];

  return v2;
}

+ (id)spotlightInternalWatchdogConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:10 cap:0.0 acceptanceRate:1.0];

  return v2;
}

+ (id)softwareUpdateLogoutInterruptedConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:3 cap:3600.0 acceptanceRate:1.0];

  return v2;
}

+ (id)appIntentsServicesSlowActivityConfiguration
{
  v2 = [[DRSDampeningConfiguration alloc] initWithHysteresis:10 cap:3600.0 acceptanceRate:1.0];

  return v2;
}

- (double)hysteresis
{
  return self->_hysteresis;
}

- (void)setHysteresis:(double)a3
{
  self->_hysteresis = a3;
}

- (unint64_t)countCap
{
  return self->_countCap;
}

- (void)setCountCap:(unint64_t)a3
{
  self->_countCap = a3;
}

- (double)acceptanceRate
{
  return self->_acceptanceRate;
}

- (void)setAcceptanceRate:(double)a3
{
  self->_acceptanceRate = a3;
}

@end