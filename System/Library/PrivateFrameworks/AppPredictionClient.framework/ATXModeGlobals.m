@interface ATXModeGlobals
+ (id)sharedInstance;
- (ATXModeGlobals)init;
- (ATXModeGlobals)initWithAssetClass:(Class)a3;
- (BOOL)isAutomationTriggerSuggestionsForFocusEnabled;
- (BOOL)isSetupSuggestionsForFocusEnabled;
- (int)currentLocationUpdateInterval;
- (int)frequentLOIMinimumVisits;
- (int)homeLOISearchRadius;
- (int)locationOfInterestSearchRadius;
- (int)locationOfInterestUpdateInterval;
- (int)predictedExitTimesUpdateInterval;
- (int)predictedLocationsOfInterestUpdateInterval;
- (int)previousLOIExpirationTime;
- (int)workLOISearchRadius;
@end

@implementation ATXModeGlobals

- (ATXModeGlobals)initWithAssetClass:(Class)a3
{
  v12.receiver = self;
  v12.super_class = (Class)ATXModeGlobals;
  v4 = [(ATXModeGlobals *)&v12 init];
  if (v4)
  {
    v5 = [ATXAssetsABHelper alloc];
    if (a3)
    {
      NSStringFromClass(a3);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = @"_ATXGlobals";
    }
    v7 = +[ATXABHelper abGroupOverride];
    v8 = [(ATXAssetsABHelper *)v5 initWithAssetsForResource:v6 ofType:@"plplist" specifiedABGroup:v7];

    if (a3) {
    uint64_t v9 = [(ATXAssetsABHelper *)v8 abGroupContents];
    }
    parameters = v4->_parameters;
    v4->_parameters = (NSDictionary *)v9;
  }
  return v4;
}

- (ATXModeGlobals)init
{
  return [(ATXModeGlobals *)self initWithAssetClass:0];
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_1 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_1, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_2;

  return v2;
}

void __32__ATXModeGlobals_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1AD0D3C30]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_2;
  sharedInstance__pasExprOnceResult_2 = v1;
}

- (int)locationOfInterestSearchRadius
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"LocationOfInterestSearchRadius"];
  v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 400;
  }

  return v4;
}

- (int)homeLOISearchRadius
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"HomeLOISearchRadius"];
  v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 400;
  }

  return v4;
}

- (int)workLOISearchRadius
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"WorkLOISearchRadius"];
  v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 800;
  }

  return v4;
}

- (int)previousLOIExpirationTime
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"PreviousLOIExpirationTime"];
  v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 7200;
  }

  return v4;
}

- (int)frequentLOIMinimumVisits
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"FrequentLOIMinimumVisits"];
  v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 25;
  }

  return v4;
}

- (int)currentLocationUpdateInterval
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"CurrentLocationUpdateInterval"];
  v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 900;
  }

  return v4;
}

- (int)locationOfInterestUpdateInterval
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"LocationOfInterestUpdateInterval"];
  v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 30;
  }

  return v4;
}

- (int)predictedLocationsOfInterestUpdateInterval
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"PredictedLocationsOfInterestUpdateInterval"];
  v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 300;
  }

  return v4;
}

- (int)predictedExitTimesUpdateInterval
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"PredictedExitTimesUpdateInterval"];
  v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 300;
  }

  return v4;
}

- (BOOL)isAutomationTriggerSuggestionsForFocusEnabled
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"IsAutomationTriggerSuggestionsForFocusEnabled"];
  v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)isSetupSuggestionsForFocusEnabled
{
  v2 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"IsSetupSuggestionsForFocusEnabled"];
  v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end