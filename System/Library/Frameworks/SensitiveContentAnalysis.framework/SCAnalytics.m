@interface SCAnalytics
+ (id)sharedInstance;
- (BMSource)biomeMASSource;
- (BMStream)biomeMASStream;
- (BOOL)collectMediaAnalysisServiceEvent:(int)a3 :(BOOL)a4;
- (NSString)clientBundleID;
- (SCAnalytics)init;
- (int)ageGroup;
- (int)biomeAgeGroup;
- (void)setAgeGroup:(int)a3;
- (void)setBiomeMASSource:(id)a3;
- (void)setBiomeMASStream:(id)a3;
- (void)setClientBundleID:(id)a3;
@end

@implementation SCAnalytics

- (SCAnalytics)init
{
  v13.receiver = self;
  v13.super_class = (Class)SCAnalytics;
  v2 = [(SCAnalytics *)&v13 init];
  if (v2)
  {
    v3 = BiomeLibrary();
    v4 = [v3 SensitiveContentAnalysis];
    uint64_t v5 = [v4 MediaAnalysis];
    biomeMASStream = v2->_biomeMASStream;
    v2->_biomeMASStream = (BMStream *)v5;

    uint64_t v7 = [(BMStream *)v2->_biomeMASStream source];
    biomeMASSource = v2->_biomeMASSource;
    v2->_biomeMASSource = (BMSource *)v7;

    v9 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v10 = [v9 bundleIdentifier];
    clientBundleID = v2->_clientBundleID;
    v2->_clientBundleID = (NSString *)v10;

    v2->_ageGroup = [(SCAnalytics *)v2 biomeAgeGroup];
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_creation != -1) {
    dispatch_once(&sharedInstance_creation, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sInstance;

  return v2;
}

uint64_t __29__SCAnalytics_sharedInstance__block_invoke()
{
  sharedInstance_sInstance = objc_alloc_init(SCAnalytics);

  return MEMORY[0x270F9A758]();
}

- (BOOL)collectMediaAnalysisServiceEvent:(int)a3 :(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  char v7 = SCIsAnalyticsEnabled();
  if (v7)
  {
    if (v4)
    {
      id v8 = objc_alloc(MEMORY[0x263F2A388]);
      uint64_t ageGroup = self->_ageGroup;
      clientBundleID = self->_clientBundleID;
      uint64_t v11 = v5;
      uint64_t v12 = 1;
LABEL_9:
      v14 = (void *)[v8 initWithContentType:v11 ageGroup:ageGroup isSensitive:v12 clientBundleID:clientBundleID trackingVersion:@"1"];
      v15 = [(SCAnalytics *)self biomeMASSource];
      [v15 sendEvent:v14];

      return v7;
    }
    if ((double)arc4random() / 4294967300.0 < 0.05)
    {
      id v8 = objc_alloc(MEMORY[0x263F2A388]);
      uint64_t ageGroup = self->_ageGroup;
      clientBundleID = self->_clientBundleID;
      uint64_t v11 = v5;
      uint64_t v12 = 2;
      goto LABEL_9;
    }
  }
  else
  {
    objc_super v13 = +[SCLog client];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[SCAnalytics collectMediaAnalysisServiceEvent::](v13);
    }
  }
  return v7;
}

- (int)biomeAgeGroup
{
  v2 = +[SCManagedSettingsReader currentScanningPolicy];
  unint64_t v3 = [v2 policy];

  if (v3 < 2) {
    return 3;
  }
  uint64_t v5 = +[SCManagedSettingsReader currentInterventionType];
  if ([v5 isEqualToString:*MEMORY[0x263F53E88]]) {
    int v4 = 2;
  }
  else {
    int v4 = 1;
  }

  return v4;
}

- (BMStream)biomeMASStream
{
  return self->_biomeMASStream;
}

- (void)setBiomeMASStream:(id)a3
{
}

- (BMSource)biomeMASSource
{
  return self->_biomeMASSource;
}

- (void)setBiomeMASSource:(id)a3
{
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
}

- (int)ageGroup
{
  return self->_ageGroup;
}

- (void)setAgeGroup:(int)a3
{
  self->_uint64_t ageGroup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_biomeMASSource, 0);

  objc_storeStrong((id *)&self->_biomeMASStream, 0);
}

- (void)collectMediaAnalysisServiceEvent:(os_log_t)log :.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2451C6000, log, OS_LOG_TYPE_DEBUG, "SCAnalytics: No consent for analytics: MAS", v1, 2u);
}

@end