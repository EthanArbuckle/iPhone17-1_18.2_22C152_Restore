@interface HLPAnalyticsEventController
+ (id)sharedInstance;
- (NSDictionary)requiredKeys;
- (NSMutableDictionary)countersByKey;
- (NSString)identifier;
- (NSString)version;
- (id)counterForKey:(id)a3;
- (void)configureWithHelpBookID:(id)a3 version:(id)a4;
- (void)incrementCounterForKey:(id)a3;
- (void)logAnalyticsEvent:(id)a3;
- (void)setCountersByKey:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation HLPAnalyticsEventController

+ (id)sharedInstance
{
  if (sharedInstance_predicate_3 != -1) {
    dispatch_once(&sharedInstance_predicate_3, &__block_literal_global_7);
  }
  v2 = (void *)gHLPAnalyticsController;
  return v2;
}

uint64_t __45__HLPAnalyticsEventController_sharedInstance__block_invoke()
{
  gHLPAnalyticsController = objc_alloc_init(HLPAnalyticsEventController);
  return MEMORY[0x270F9A758]();
}

- (void)configureWithHelpBookID:(id)a3 version:(id)a4
{
  v22[4] = *MEMORY[0x263EF8340];
  objc_storeStrong((id *)&self->_identifier, a3);
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 stringByReplacingOccurrencesOfString:@"." withString:@"_"];

  version = self->_version;
  self->_version = v9;

  v11 = [MEMORY[0x263F086E0] mainBundle];
  v12 = [v11 bundleIdentifier];

  v13 = [MEMORY[0x263F086E0] mainBundle];
  v14 = [v13 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];

  v15 = @"undefined";
  v21[0] = @"book_ID";
  v21[1] = @"book_version";
  identifier = (__CFString *)self->_identifier;
  v17 = (__CFString *)self->_version;
  if (!identifier) {
    identifier = @"undefined";
  }
  if (!v17) {
    v17 = @"undefined";
  }
  v22[0] = identifier;
  v22[1] = v17;
  v21[2] = @"product";
  v21[3] = @"product_version";
  if (v12) {
    v18 = v12;
  }
  else {
    v18 = @"undefined";
  }
  if (v14) {
    v15 = v14;
  }
  v22[2] = v18;
  v22[3] = v15;
  v19 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
  requiredKeys = self->_requiredKeys;
  self->_requiredKeys = v19;
}

- (void)logAnalyticsEvent:(id)a3
{
  id v3 = a3;
  v4 = NSString;
  v5 = [v3 eventName];
  v6 = [v4 stringWithFormat:@"%@.%@", @"com.apple.HelpKit", v5];

  id v8 = v3;
  id v7 = v3;
  AnalyticsSendEventLazy();
}

uint64_t __49__HLPAnalyticsEventController_logAnalyticsEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) caRepresentation];
}

- (void)incrementCounterForKey:(id)a3
{
  id v4 = a3;
  v5 = [(HLPAnalyticsEventController *)self countersByKey];

  if (!v5)
  {
    v6 = [MEMORY[0x263EFF9A0] dictionary];
    [(HLPAnalyticsEventController *)self setCountersByKey:v6];
  }
  id v7 = [(HLPAnalyticsEventController *)self counterForKey:v4];
  objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "intValue") + 1);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = [(HLPAnalyticsEventController *)self countersByKey];
  [v8 setObject:v9 forKeyedSubscript:v4];
}

- (id)counterForKey:(id)a3
{
  id v4 = a3;
  v5 = [(HLPAnalyticsEventController *)self countersByKey];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = &unk_26D2A8538;
  }

  return v7;
}

- (NSDictionary)requiredKeys
{
  return self->_requiredKeys;
}

- (NSMutableDictionary)countersByKey
{
  return self->_countersByKey;
}

- (void)setCountersByKey:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_countersByKey, 0);
  objc_storeStrong((id *)&self->_requiredKeys, 0);
}

@end