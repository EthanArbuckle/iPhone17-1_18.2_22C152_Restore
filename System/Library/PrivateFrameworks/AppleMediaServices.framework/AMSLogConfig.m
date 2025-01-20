@interface AMSLogConfig
+ (BOOL)_debugLogsEnabled:(id)a3;
+ (id)sharedAccountsAuthenticationPluginConfig;
+ (id)sharedAccountsConfig;
+ (id)sharedAccountsCookiesConfig;
+ (id)sharedAccountsDaemonConfig;
+ (id)sharedAccountsLogoutConfig;
+ (id)sharedAccountsMigrationConfig;
+ (id)sharedAccountsMigrationConfigOversize;
+ (id)sharedAccountsMultiUserConfig;
+ (id)sharedAccountsNotificationPluginConfig;
+ (id)sharedAccountsOversizeConfig;
+ (id)sharedAccountsStorefrontConfig;
+ (id)sharedAccountsSyncPluginConfig;
+ (id)sharedActionConfig;
+ (id)sharedAnisetteConfig;
+ (id)sharedAttestationConfig;
+ (id)sharedBagCacheConfig;
+ (id)sharedBagConfig;
+ (id)sharedBiometricsConfig;
+ (id)sharedConfig;
+ (id)sharedConfigOversize;
+ (id)sharedDataMigrationConfig;
+ (id)sharedDeviceOffersConfig;
+ (id)sharedEngagementConfig;
+ (id)sharedFollowUpConfig;
+ (id)sharedFraudReportConfig;
+ (id)sharedKeychainConfig;
+ (id)sharedMarketingItemConfig;
+ (id)sharedMediaConfig;
+ (id)sharedMediaServiceOwnerConfig;
+ (id)sharedMessagingUIConfig;
+ (id)sharedMetricsConfig;
+ (id)sharedPrivacyConfig;
+ (id)sharedPromiseConfig;
+ (id)sharedPurchaseConfig;
+ (id)sharedPushNotificationConfig;
+ (id)sharedRatingsProviderConfig;
+ (id)sharedRegulatoryEligibilityConfig;
+ (id)sharedServerDataCacheConfig;
+ (id)sharedTreatmentsConfig;
+ (id)sharedURLLoadingConfig;
+ (id)sharedUserNotificationConfig;
+ (id)sharedWebUIConfig;
+ (id)sharedWebUIPageConfig;
- (AMSLogConfig)initWithCategory:(id)a3 backingLog:(id)a4;
- (BOOL)debugLogsEnabled;
- (BOOL)isEqual:(id)a3;
- (NSString)category;
- (NSString)subsystem;
- (OS_os_log)OSLogObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setCategory:(id)a3;
- (void)setOSLogObject:(id)a3;
- (void)setSubsystem:(id)a3;
@end

@implementation AMSLogConfig

+ (id)sharedFraudReportConfig
{
  if (qword_1EB38DC70 != -1) {
    dispatch_once(&qword_1EB38DC70, &__block_literal_global_85_0);
  }
  v2 = (void *)qword_1EB38DC78;
  return v2;
}

+ (id)sharedPromiseConfig
{
  if (qword_1EB38DBC0 != -1) {
    dispatch_once(&qword_1EB38DBC0, &__block_literal_global_63_0);
  }
  v2 = (void *)qword_1EB38DBC8;
  return v2;
}

+ (id)sharedTreatmentsConfig
{
  if (qword_1EB38DC20 != -1) {
    dispatch_once(&qword_1EB38DC20, &__block_literal_global_75_1);
  }
  v2 = (void *)qword_1EB38DC28;
  return v2;
}

+ (id)sharedAccountsConfig
{
  if (qword_1EB38DA10 != -1) {
    dispatch_once(&qword_1EB38DA10, &__block_literal_global_9);
  }
  v2 = (void *)qword_1EB38DA18;
  return v2;
}

+ (id)sharedConfig
{
  if (_MergedGlobals_118 != -1) {
    dispatch_once(&_MergedGlobals_118, &__block_literal_global_69);
  }
  v2 = (void *)qword_1EB38D9D8;
  return v2;
}

- (BOOL)debugLogsEnabled
{
  v2 = [(AMSLogConfig *)self OSLogObject];
  BOOL v3 = +[AMSLogConfig _debugLogsEnabled:v2];

  return v3;
}

- (OS_os_log)OSLogObject
{
  return self->_OSLogObject;
}

+ (BOOL)_debugLogsEnabled:(id)a3
{
  return os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_DEBUG);
}

+ (id)sharedAccountsCookiesConfig
{
  if (qword_1EB38DA20 != -1) {
    dispatch_once(&qword_1EB38DA20, &__block_literal_global_11_0);
  }
  v2 = (void *)qword_1EB38DA28;
  return v2;
}

- (AMSLogConfig)initWithCategory:(id)a3 backingLog:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AMSLogConfig;
  v8 = [(AMSLogConfig *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(AMSLogConfig *)v8 setSubsystem:@"com.apple.AppleMediaServices"];
    [(AMSLogConfig *)v9 setCategory:v6];
    [(AMSLogConfig *)v9 setOSLogObject:v7];
  }

  return v9;
}

- (void)setSubsystem:(id)a3
{
}

- (void)setOSLogObject:(id)a3
{
}

- (void)setCategory:(id)a3
{
}

+ (id)sharedEngagementConfig
{
  if (qword_1EB38DB30 != -1) {
    dispatch_once(&qword_1EB38DB30, &__block_literal_global_45_1);
  }
  v2 = (void *)qword_1EB38DB38;
  return v2;
}

+ (id)sharedMetricsConfig
{
  if (qword_1EB38DBA0 != -1) {
    dispatch_once(&qword_1EB38DBA0, &__block_literal_global_59);
  }
  v2 = (void *)qword_1EB38DBA8;
  return v2;
}

+ (id)sharedPrivacyConfig
{
  if (qword_1EB38DBB0 != -1) {
    dispatch_once(&qword_1EB38DBB0, &__block_literal_global_61_0);
  }
  v2 = (void *)qword_1EB38DBB8;
  return v2;
}

+ (id)sharedConfigOversize
{
  if (qword_1EB38D9E0 != -1) {
    dispatch_once(&qword_1EB38D9E0, &__block_literal_global_3_3);
  }
  v2 = (void *)qword_1EB38D9E8;
  return v2;
}

+ (id)sharedURLLoadingConfig
{
  if (qword_1EB38DC30 != -1) {
    dispatch_once(&qword_1EB38DC30, &__block_literal_global_77);
  }
  v2 = (void *)qword_1EB38DC38;
  return v2;
}

+ (id)sharedBagConfig
{
  if (qword_1EB38DB00 != -1) {
    dispatch_once(&qword_1EB38DB00, &__block_literal_global_39);
  }
  v2 = (void *)qword_1EB38DB08;
  return v2;
}

+ (id)sharedMediaConfig
{
  if (qword_1EB38DB70 != -1) {
    dispatch_once(&qword_1EB38DB70, &__block_literal_global_53);
  }
  v2 = (void *)qword_1EB38DB78;
  return v2;
}

+ (id)sharedAccountsMultiUserConfig
{
  if (qword_1EB38DA80 != -1) {
    dispatch_once(&qword_1EB38DA80, &__block_literal_global_23_0);
  }
  v2 = (void *)qword_1EB38DA88;
  return v2;
}

+ (id)sharedAccountsDaemonConfig
{
  if (qword_1EB38DA00 != -1) {
    dispatch_once(&qword_1EB38DA00, &__block_literal_global_7);
  }
  v2 = (void *)qword_1EB38DA08;
  return v2;
}

+ (id)sharedMessagingUIConfig
{
  if (qword_1EB38DB90 != -1) {
    dispatch_once(&qword_1EB38DB90, &__block_literal_global_57_0);
  }
  v2 = (void *)qword_1EB38DB98;
  return v2;
}

uint64_t __44__AMSLogConfig_sharedPushNotificationConfig__block_invoke()
{
  qword_1EB38DBE8 = +[AMSLogBridge amsLogConfigWithCategory:40];
  return MEMORY[0x1F41817F8]();
}

uint64_t __35__AMSLogConfig_sharedPromiseConfig__block_invoke()
{
  qword_1EB38DBC8 = +[AMSLogBridge amsLogConfigWithCategory:38];
  return MEMORY[0x1F41817F8]();
}

uint64_t __45__AMSLogConfig_sharedAccountsMultiUserConfig__block_invoke()
{
  qword_1EB38DA88 = +[AMSLogBridge amsLogConfigWithCategory:8];
  return MEMORY[0x1F41817F8]();
}

uint64_t __41__AMSLogConfig_sharedMarketingItemConfig__block_invoke()
{
  qword_1EB38DB68 = +[AMSLogBridge amsLogConfigWithCategory:30];
  return MEMORY[0x1F41817F8]();
}

uint64_t __56__AMSLogConfig_sharedAccountsAuthenticationPluginConfig__block_invoke()
{
  qword_1EB38D9F8 = +[AMSLogBridge amsLogConfigWithCategory:1];
  return MEMORY[0x1F41817F8]();
}

uint64_t __39__AMSLogConfig_sharedMessagingUIConfig__block_invoke()
{
  qword_1EB38DB98 = +[AMSLogBridge amsLogConfigWithCategory:34];
  return MEMORY[0x1F41817F8]();
}

uint64_t __39__AMSLogConfig_sharedFraudReportConfig__block_invoke()
{
  qword_1EB38DC78 = +[AMSLogBridge amsLogConfigWithCategory:52];
  return MEMORY[0x1F41817F8]();
}

uint64_t __35__AMSLogConfig_sharedPrivacyConfig__block_invoke()
{
  qword_1EB38DBB8 = +[AMSLogBridge amsLogConfigWithCategory:37];
  return MEMORY[0x1F41817F8]();
}

uint64_t __33__AMSLogConfig_sharedMediaConfig__block_invoke()
{
  qword_1EB38DB78 = +[AMSLogBridge amsLogConfigWithCategory:31];
  return MEMORY[0x1F41817F8]();
}

uint64_t __35__AMSLogConfig_sharedMetricsConfig__block_invoke()
{
  qword_1EB38DBA8 = +[AMSLogBridge amsLogConfigWithCategory:35];
  return MEMORY[0x1F41817F8]();
}

uint64_t __38__AMSLogConfig_sharedTreatmentsConfig__block_invoke()
{
  qword_1EB38DC28 = +[AMSLogBridge amsLogConfigWithCategory:47];
  return MEMORY[0x1F41817F8]();
}

uint64_t __38__AMSLogConfig_sharedEngagementConfig__block_invoke()
{
  qword_1EB38DB38 = +[AMSLogBridge amsLogConfigWithCategory:25];
  return MEMORY[0x1F41817F8]();
}

uint64_t __38__AMSLogConfig_sharedURLLoadingConfig__block_invoke()
{
  qword_1EB38DC38 = +[AMSLogBridge amsLogConfigWithCategory:48];
  return MEMORY[0x1F41817F8]();
}

uint64_t __36__AMSLogConfig_sharedConfigOversize__block_invoke()
{
  qword_1EB38D9E8 = +[AMSLogBridge amsLogConfigWithCategory:36];
  return MEMORY[0x1F41817F8]();
}

uint64_t __31__AMSLogConfig_sharedBagConfig__block_invoke()
{
  qword_1EB38DB08 = +[AMSLogBridge amsLogConfigWithCategory:17];
  return MEMORY[0x1F41817F8]();
}

uint64_t __43__AMSLogConfig_sharedAccountsCookiesConfig__block_invoke()
{
  qword_1EB38DA28 = +[AMSLogBridge amsLogConfigWithCategory:2];
  return MEMORY[0x1F41817F8]();
}

uint64_t __42__AMSLogConfig_sharedAccountsDaemonConfig__block_invoke()
{
  qword_1EB38DA08 = +[AMSLogBridge amsLogConfigWithCategory:3];
  return MEMORY[0x1F41817F8]();
}

uint64_t __34__AMSLogConfig_sharedActionConfig__block_invoke()
{
  qword_1EB38DAD8 = +[AMSLogBridge amsLogConfigWithCategory:13];
  return MEMORY[0x1F41817F8]();
}

uint64_t __36__AMSLogConfig_sharedAccountsConfig__block_invoke()
{
  qword_1EB38DA18 = +[AMSLogBridge amsLogConfigWithCategory:0];
  return MEMORY[0x1F41817F8]();
}

uint64_t __28__AMSLogConfig_sharedConfig__block_invoke()
{
  qword_1EB38D9D8 = +[AMSLogBridge amsLogConfigWithCategory:28];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedActionConfig
{
  if (qword_1EB38DAD0 != -1) {
    dispatch_once(&qword_1EB38DAD0, &__block_literal_global_33_0);
  }
  v2 = (void *)qword_1EB38DAD8;
  return v2;
}

+ (id)sharedMarketingItemConfig
{
  if (qword_1EB38DB60 != -1) {
    dispatch_once(&qword_1EB38DB60, &__block_literal_global_51);
  }
  v2 = (void *)qword_1EB38DB68;
  return v2;
}

+ (id)sharedPushNotificationConfig
{
  if (qword_1EB38DBE0 != -1) {
    dispatch_once(&qword_1EB38DBE0, &__block_literal_global_67);
  }
  v2 = (void *)qword_1EB38DBE8;
  return v2;
}

+ (id)sharedAccountsAuthenticationPluginConfig
{
  if (qword_1EB38D9F0 != -1) {
    dispatch_once(&qword_1EB38D9F0, &__block_literal_global_5_0);
  }
  v2 = (void *)qword_1EB38D9F8;
  return v2;
}

+ (id)sharedDataMigrationConfig
{
  if (qword_1EB38DA30 != -1) {
    dispatch_once(&qword_1EB38DA30, &__block_literal_global_13_1);
  }
  v2 = (void *)qword_1EB38DA38;
  return v2;
}

uint64_t __41__AMSLogConfig_sharedDataMigrationConfig__block_invoke()
{
  qword_1EB38DA38 = +[AMSLogBridge amsLogConfigWithCategory:22];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedDeviceOffersConfig
{
  if (qword_1EB38DA40 != -1) {
    dispatch_once(&qword_1EB38DA40, &__block_literal_global_15_2);
  }
  v2 = (void *)qword_1EB38DA48;
  return v2;
}

uint64_t __40__AMSLogConfig_sharedDeviceOffersConfig__block_invoke()
{
  qword_1EB38DA48 = +[AMSLogBridge amsLogConfigWithCategory:24];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedAccountsLogoutConfig
{
  if (qword_1EB38DA50 != -1) {
    dispatch_once(&qword_1EB38DA50, &__block_literal_global_17_2);
  }
  v2 = (void *)qword_1EB38DA58;
  return v2;
}

uint64_t __42__AMSLogConfig_sharedAccountsLogoutConfig__block_invoke()
{
  qword_1EB38DA58 = +[AMSLogBridge amsLogConfigWithCategory:5];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedAccountsMigrationConfig
{
  if (qword_1EB38DA60 != -1) {
    dispatch_once(&qword_1EB38DA60, &__block_literal_global_19_1);
  }
  v2 = (void *)qword_1EB38DA68;
  return v2;
}

uint64_t __45__AMSLogConfig_sharedAccountsMigrationConfig__block_invoke()
{
  qword_1EB38DA68 = +[AMSLogBridge amsLogConfigWithCategory:6];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedAccountsMigrationConfigOversize
{
  if (qword_1EB38DA70 != -1) {
    dispatch_once(&qword_1EB38DA70, &__block_literal_global_21_2);
  }
  v2 = (void *)qword_1EB38DA78;
  return v2;
}

uint64_t __53__AMSLogConfig_sharedAccountsMigrationConfigOversize__block_invoke()
{
  qword_1EB38DA78 = +[AMSLogBridge amsLogConfigWithCategory:7];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedAccountsNotificationPluginConfig
{
  if (qword_1EB38DA90 != -1) {
    dispatch_once(&qword_1EB38DA90, &__block_literal_global_25_0);
  }
  v2 = (void *)qword_1EB38DA98;
  return v2;
}

uint64_t __54__AMSLogConfig_sharedAccountsNotificationPluginConfig__block_invoke()
{
  qword_1EB38DA98 = +[AMSLogBridge amsLogConfigWithCategory:9];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedAccountsOversizeConfig
{
  if (qword_1EB38DAA0 != -1) {
    dispatch_once(&qword_1EB38DAA0, &__block_literal_global_27_1);
  }
  v2 = (void *)qword_1EB38DAA8;
  return v2;
}

uint64_t __44__AMSLogConfig_sharedAccountsOversizeConfig__block_invoke()
{
  qword_1EB38DAA8 = +[AMSLogBridge amsLogConfigWithCategory:10];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedAccountsStorefrontConfig
{
  if (qword_1EB38DAB0 != -1) {
    dispatch_once(&qword_1EB38DAB0, &__block_literal_global_29_1);
  }
  v2 = (void *)qword_1EB38DAB8;
  return v2;
}

uint64_t __46__AMSLogConfig_sharedAccountsStorefrontConfig__block_invoke()
{
  qword_1EB38DAB8 = +[AMSLogBridge amsLogConfigWithCategory:11];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedAccountsSyncPluginConfig
{
  if (qword_1EB38DAC0 != -1) {
    dispatch_once(&qword_1EB38DAC0, &__block_literal_global_31_0);
  }
  v2 = (void *)qword_1EB38DAC8;
  return v2;
}

uint64_t __46__AMSLogConfig_sharedAccountsSyncPluginConfig__block_invoke()
{
  qword_1EB38DAC8 = +[AMSLogBridge amsLogConfigWithCategory:12];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedAnisetteConfig
{
  if (qword_1EB38DAE0 != -1) {
    dispatch_once(&qword_1EB38DAE0, &__block_literal_global_35);
  }
  v2 = (void *)qword_1EB38DAE8;
  return v2;
}

uint64_t __36__AMSLogConfig_sharedAnisetteConfig__block_invoke()
{
  qword_1EB38DAE8 = +[AMSLogBridge amsLogConfigWithCategory:15];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedAttestationConfig
{
  if (qword_1EB38DAF0 != -1) {
    dispatch_once(&qword_1EB38DAF0, &__block_literal_global_37);
  }
  v2 = (void *)qword_1EB38DAF8;
  return v2;
}

uint64_t __39__AMSLogConfig_sharedAttestationConfig__block_invoke()
{
  qword_1EB38DAF8 = +[AMSLogBridge amsLogConfigWithCategory:16];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedBagCacheConfig
{
  if (qword_1EB38DB10 != -1) {
    dispatch_once(&qword_1EB38DB10, &__block_literal_global_41);
  }
  v2 = (void *)qword_1EB38DB18;
  return v2;
}

uint64_t __36__AMSLogConfig_sharedBagCacheConfig__block_invoke()
{
  qword_1EB38DB18 = +[AMSLogBridge amsLogConfigWithCategory:18];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedBiometricsConfig
{
  if (qword_1EB38DB20 != -1) {
    dispatch_once(&qword_1EB38DB20, &__block_literal_global_43);
  }
  v2 = (void *)qword_1EB38DB28;
  return v2;
}

uint64_t __38__AMSLogConfig_sharedBiometricsConfig__block_invoke()
{
  qword_1EB38DB28 = +[AMSLogBridge amsLogConfigWithCategory:19];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedFollowUpConfig
{
  if (qword_1EB38DB40 != -1) {
    dispatch_once(&qword_1EB38DB40, &__block_literal_global_47);
  }
  v2 = (void *)qword_1EB38DB48;
  return v2;
}

uint64_t __36__AMSLogConfig_sharedFollowUpConfig__block_invoke()
{
  qword_1EB38DB48 = +[AMSLogBridge amsLogConfigWithCategory:26];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedKeychainConfig
{
  if (qword_1EB38DB50 != -1) {
    dispatch_once(&qword_1EB38DB50, &__block_literal_global_49_0);
  }
  v2 = (void *)qword_1EB38DB58;
  return v2;
}

uint64_t __36__AMSLogConfig_sharedKeychainConfig__block_invoke()
{
  qword_1EB38DB58 = +[AMSLogBridge amsLogConfigWithCategory:29];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedMediaServiceOwnerConfig
{
  if (qword_1EB38DB80 != -1) {
    dispatch_once(&qword_1EB38DB80, &__block_literal_global_55_1);
  }
  v2 = (void *)qword_1EB38DB88;
  return v2;
}

uint64_t __45__AMSLogConfig_sharedMediaServiceOwnerConfig__block_invoke()
{
  qword_1EB38DB88 = +[AMSLogBridge amsLogConfigWithCategory:33];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedPurchaseConfig
{
  if (qword_1EB38DBD0 != -1) {
    dispatch_once(&qword_1EB38DBD0, &__block_literal_global_65_0);
  }
  v2 = (void *)qword_1EB38DBD8;
  return v2;
}

uint64_t __36__AMSLogConfig_sharedPurchaseConfig__block_invoke()
{
  qword_1EB38DBD8 = +[AMSLogBridge amsLogConfigWithCategory:39];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedRatingsProviderConfig
{
  if (qword_1EB38DBF0 != -1) {
    dispatch_once(&qword_1EB38DBF0, &__block_literal_global_69_0);
  }
  v2 = (void *)qword_1EB38DBF8;
  return v2;
}

uint64_t __43__AMSLogConfig_sharedRatingsProviderConfig__block_invoke()
{
  qword_1EB38DBF8 = +[AMSLogBridge amsLogConfigWithCategory:41];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedRegulatoryEligibilityConfig
{
  if (qword_1EB38DC00 != -1) {
    dispatch_once(&qword_1EB38DC00, &__block_literal_global_71);
  }
  v2 = (void *)qword_1EB38DC08;
  return v2;
}

uint64_t __49__AMSLogConfig_sharedRegulatoryEligibilityConfig__block_invoke()
{
  qword_1EB38DC08 = +[AMSLogBridge amsLogConfigWithCategory:42];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedServerDataCacheConfig
{
  if (qword_1EB38DC10 != -1) {
    dispatch_once(&qword_1EB38DC10, &__block_literal_global_73);
  }
  v2 = (void *)qword_1EB38DC18;
  return v2;
}

uint64_t __43__AMSLogConfig_sharedServerDataCacheConfig__block_invoke()
{
  qword_1EB38DC18 = +[AMSLogBridge amsLogConfigWithCategory:44];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedUserNotificationConfig
{
  if (qword_1EB38DC40 != -1) {
    dispatch_once(&qword_1EB38DC40, &__block_literal_global_79);
  }
  v2 = (void *)qword_1EB38DC48;
  return v2;
}

uint64_t __44__AMSLogConfig_sharedUserNotificationConfig__block_invoke()
{
  qword_1EB38DC48 = +[AMSLogBridge amsLogConfigWithCategory:49];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedWebUIConfig
{
  if (qword_1EB38DC50 != -1) {
    dispatch_once(&qword_1EB38DC50, &__block_literal_global_81_0);
  }
  v2 = (void *)qword_1EB38DC58;
  return v2;
}

uint64_t __33__AMSLogConfig_sharedWebUIConfig__block_invoke()
{
  qword_1EB38DC58 = +[AMSLogBridge amsLogConfigWithCategory:50];
  return MEMORY[0x1F41817F8]();
}

+ (id)sharedWebUIPageConfig
{
  if (qword_1EB38DC60 != -1) {
    dispatch_once(&qword_1EB38DC60, &__block_literal_global_83_1);
  }
  v2 = (void *)qword_1EB38DC68;
  return v2;
}

uint64_t __37__AMSLogConfig_sharedWebUIPageConfig__block_invoke()
{
  qword_1EB38DC68 = +[AMSLogBridge amsLogConfigWithCategory:51];
  return MEMORY[0x1F41817F8]();
}

- (id)description
{
  BOOL v3 = (void *)MEMORY[0x1E4F28E78];
  v9.receiver = self;
  v9.super_class = (Class)AMSLogConfig;
  v4 = [(AMSLogConfig *)&v9 description];
  v5 = [v3 stringWithFormat:@"%@: {\n", v4];

  id v6 = [(AMSLogConfig *)self category];
  [v5 appendFormat:@"  category: %@\n", v6];

  id v7 = [(AMSLogConfig *)self subsystem];
  [v5 appendFormat:@"  subsystem: %@\n", v7];

  [v5 appendString:@"}"];
  return v5;
}

- (unint64_t)hash
{
  BOOL v3 = [(AMSLogConfig *)self category];
  uint64_t v4 = [v3 hash];
  v5 = [(AMSLogConfig *)self subsystem];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (AMSLogConfig *)a3;
  if (self == v5)
  {
    char v7 = 1;
    goto LABEL_18;
  }
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v8 = [(AMSLogConfig *)self category];
    if (v8 || ([(AMSLogConfig *)v5 category], (BOOL v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_super v9 = [(AMSLogConfig *)self category];
      v10 = [(AMSLogConfig *)v5 category];
      int v11 = [v9 isEqual:v10];

      if (v8)
      {

        if (!v11) {
          goto LABEL_3;
        }
      }
      else
      {

        if ((v11 & 1) == 0) {
          goto LABEL_3;
        }
      }
    }
    v12 = [(AMSLogConfig *)self subsystem];
    if (v12 || ([(AMSLogConfig *)v5 subsystem], (BOOL v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = [(AMSLogConfig *)self subsystem];
      v14 = [(AMSLogConfig *)v5 subsystem];
      int v15 = [v13 isEqual:v14] ^ 1;

      if (v12)
      {
LABEL_17:

        char v7 = v15 ^ 1;
        goto LABEL_18;
      }
    }
    else
    {
      LOBYTE(v15) = 0;
    }

    goto LABEL_17;
  }
LABEL_3:
  char v7 = 0;
LABEL_18:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[AMSLogConfig allocWithZone:](AMSLogConfig, "allocWithZone:") init];
  uint64_t v6 = [(AMSLogConfig *)self category];
  uint64_t v7 = [v6 copyWithZone:a3];
  category = v5->_category;
  v5->_category = (NSString *)v7;

  objc_super v9 = [(AMSLogConfig *)self subsystem];
  uint64_t v10 = [v9 copyWithZone:a3];
  subsystem = v5->_subsystem;
  v5->_subsystem = (NSString *)v10;

  uint64_t v12 = [(AMSLogConfig *)self OSLogObject];
  OSLogObject = v5->_OSLogObject;
  v5->_OSLogObject = (OS_os_log *)v12;

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = [+[AMSMutableLogConfig allocWithZone:](AMSMutableLogConfig, "allocWithZone:") init];
  uint64_t v6 = [(AMSLogConfig *)self category];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  [(AMSLogConfig *)v5 setCategory:v7];

  v8 = [(AMSLogConfig *)self subsystem];
  objc_super v9 = (void *)[v8 copyWithZone:a3];
  [(AMSLogConfig *)v5 setSubsystem:v9];

  uint64_t v10 = [(AMSLogConfig *)self OSLogObject];
  [(AMSLogConfig *)v5 setOSLogObject:v10];

  return v5;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subsystem, 0);
  objc_storeStrong((id *)&self->_OSLogObject, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end