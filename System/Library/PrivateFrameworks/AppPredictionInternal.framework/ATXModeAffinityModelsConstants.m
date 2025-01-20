@interface ATXModeAffinityModelsConstants
- (ATXModeAffinityModelsConstants)init;
- (double)scalingFactorForModeGlobalPriors;
- (int)numOfDaysToComputeEntityOccurenceFeatures;
- (int)numOfDaysToComputeEntityOccurenceFeaturesForContacts;
@end

@implementation ATXModeAffinityModelsConstants

- (ATXModeAffinityModelsConstants)init
{
  v10.receiver = self;
  v10.super_class = (Class)ATXModeAffinityModelsConstants;
  v2 = [(ATXModeAffinityModelsConstants *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F4B180] sharedInstance];
    modeEntityTrialClientWrapper = v2->_modeEntityTrialClientWrapper;
    v2->_modeEntityTrialClientWrapper = (ATXModeEntityTrialClientWrapper *)v3;

    v5 = [(ATXModeEntityTrialClientWrapper *)v2->_modeEntityTrialClientWrapper modeAffinityModelsConstants];
    uint64_t v6 = [v5 count];

    if (v6) {
      [(ATXModeEntityTrialClientWrapper *)v2->_modeEntityTrialClientWrapper modeAffinityModelsConstants];
    }
    else {
    uint64_t v7 = [MEMORY[0x1E4F4AF08] dictionaryForResource:@"ATXModeAffinityModelsConstants" ofType:@"plist" specifiedABGroup:0];
    }
    modeAffinityModelsConstants = v2->_modeAffinityModelsConstants;
    v2->_modeAffinityModelsConstants = (NSDictionary *)v7;
  }
  return v2;
}

- (int)numOfDaysToComputeEntityOccurenceFeatures
{
  v2 = [(NSDictionary *)self->_modeAffinityModelsConstants objectForKeyedSubscript:@"numOfDaysToComputeEntityOccurenceFeatures"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 14;
  }

  return v4;
}

- (int)numOfDaysToComputeEntityOccurenceFeaturesForContacts
{
  v2 = [(NSDictionary *)self->_modeAffinityModelsConstants objectForKeyedSubscript:@"numOfDaysToComputeEntityOccurenceFeaturesForContacts"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 28;
  }

  return v4;
}

- (double)scalingFactorForModeGlobalPriors
{
  v2 = [(NSDictionary *)self->_modeAffinityModelsConstants objectForKeyedSubscript:@"scalingFactorForModeGlobalPriors"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 10.0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeEntityTrialClientWrapper, 0);
  objc_storeStrong((id *)&self->_modeAffinityModelsConstants, 0);
}

@end