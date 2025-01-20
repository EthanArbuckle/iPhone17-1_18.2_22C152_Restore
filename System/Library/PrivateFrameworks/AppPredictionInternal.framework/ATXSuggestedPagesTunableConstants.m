@interface ATXSuggestedPagesTunableConstants
- (ATXSuggestedPagesTunableConstants)init;
- (double)maxRatioOfAppleAppsForFirstPageSorting;
- (double)minScoreForModeAffinityContactsWidgetSuggestions;
- (double)suggestedPagesModeAffinityAppDataSourceScoreThreshold;
- (int)faceComplicationsSignificantHomeAccessoryEventCount;
- (int)faceComplicationsSignificantRemindersEventCount;
- (int)faceComplicationsSignificantStocksEventCount;
- (int)maxSuggestedPages;
- (int)maxWidgetsInStack;
- (int)numberOfContactsForMediumWidget;
- (int)numberOfContactsForSmallWidget;
- (int)stackHeuristicsSignificantHomeAccessoryEventCount;
@end

@implementation ATXSuggestedPagesTunableConstants

- (ATXSuggestedPagesTunableConstants)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXSuggestedPagesTunableConstants;
  v2 = [(ATXSuggestedPagesTunableConstants *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F4AF08] dictionaryForResource:@"ATXSuggestedPagesTunableConstants" ofType:@"plist" specifiedABGroup:0];
    suggestedPagesTunableConstants = v2->_suggestedPagesTunableConstants;
    v2->_suggestedPagesTunableConstants = (NSDictionary *)v3;
  }
  return v2;
}

- (double)maxRatioOfAppleAppsForFirstPageSorting
{
  v2 = [(NSDictionary *)self->_suggestedPagesTunableConstants objectForKeyedSubscript:@"maxRatioOfAppleAppsForFirstPageSorting"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (int)numberOfContactsForMediumWidget
{
  v2 = [(NSDictionary *)self->_suggestedPagesTunableConstants objectForKeyedSubscript:@"numberOfContactsForMediumWidget"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (int)numberOfContactsForSmallWidget
{
  v2 = [(NSDictionary *)self->_suggestedPagesTunableConstants objectForKeyedSubscript:@"numberOfContactsForSmallWidget"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (double)minScoreForModeAffinityContactsWidgetSuggestions
{
  v2 = [(NSDictionary *)self->_suggestedPagesTunableConstants objectForKeyedSubscript:@"minScoreForModeAffinityContactsWidgetSuggestions"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (int)maxSuggestedPages
{
  v2 = [(NSDictionary *)self->_suggestedPagesTunableConstants objectForKeyedSubscript:@"maxSuggestedPages"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (int)maxWidgetsInStack
{
  v2 = [(NSDictionary *)self->_suggestedPagesTunableConstants objectForKeyedSubscript:@"maxWidgetsInStack"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (double)suggestedPagesModeAffinityAppDataSourceScoreThreshold
{
  v2 = [(NSDictionary *)self->_suggestedPagesTunableConstants objectForKeyedSubscript:@"suggestedPagesModeAffinityAppDataSourceScoreThreshold"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (int)stackHeuristicsSignificantHomeAccessoryEventCount
{
  v2 = [(NSDictionary *)self->_suggestedPagesTunableConstants objectForKeyedSubscript:@"stackHeuristicsSignificantHomeAccessoryEventCount"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (int)faceComplicationsSignificantHomeAccessoryEventCount
{
  v2 = [(NSDictionary *)self->_suggestedPagesTunableConstants objectForKeyedSubscript:@"faceComplicationsSignificantHomeAccessoryEventCount"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (int)faceComplicationsSignificantStocksEventCount
{
  v2 = [(NSDictionary *)self->_suggestedPagesTunableConstants objectForKeyedSubscript:@"faceComplicationsSignificantStocksEventCount"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (int)faceComplicationsSignificantRemindersEventCount
{
  v2 = [(NSDictionary *)self->_suggestedPagesTunableConstants objectForKeyedSubscript:@"faceComplicationsSignificantRemindersEventCount"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end