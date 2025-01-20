@interface ATXIntentGlobals
+ (id)sharedInstance;
- (ATXIntentGlobals)init;
- (BOOL)onlyAcceptBecomeCurrentNSUAs;
- (BOOL)onlyUseEligibleForPrediction;
- (id)approvedSiriKitIntents;
@end

@implementation ATXIntentGlobals

- (ATXIntentGlobals)init
{
  v9.receiver = self;
  v9.super_class = (Class)ATXIntentGlobals;
  v2 = [(ATXIntentGlobals *)&v9 init];
  if (v2)
  {
    v3 = [ATXAssetsABHelper alloc];
    v4 = +[ATXABHelper abGroupOverride];
    v5 = [(ATXAssetsABHelper *)v3 initWithAssetsForResource:@"_ATXGlobals" ofType:@"plplist" specifiedABGroup:v4];

    uint64_t v6 = [(ATXAssetsABHelper *)v5 abGroupContents];
    parameters = v2->_parameters;
    v2->_parameters = (NSDictionary *)v6;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_7 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_7, &__block_literal_global_43);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_8;

  return v2;
}

void __34__ATXIntentGlobals_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_8;
  sharedInstance__pasExprOnceResult_8 = v1;
}

- (id)approvedSiriKitIntents
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"ApprovedSiriKitIntents"];
  v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (BOOL)onlyAcceptBecomeCurrentNSUAs
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"OnlyAcceptBecomeCurrentNSUAs"];
  v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)onlyUseEligibleForPrediction
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"OnlyUseEligibleForPrediction"];
  v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end