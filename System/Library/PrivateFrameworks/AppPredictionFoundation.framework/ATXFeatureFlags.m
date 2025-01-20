@interface ATXFeatureFlags
+ (BOOL)isBreakthroughDataCollectionEnabled;
+ (BOOL)isContextualEngineEnabled;
+ (BOOL)isDigitalBalanceEnabled;
+ (BOOL)isFocusUserSetupPredictionEnabled;
+ (BOOL)isNotificationCategorizationEnabled;
+ (BOOL)isRecentAppsHeuristicEnabled;
+ (BOOL)isSportsEnabled;
+ (BOOL)isTimelineEnabled;
+ (BOOL)isZKWHideContextsEnabled;
@end

@implementation ATXFeatureFlags

+ (BOOL)isContextualEngineEnabled
{
  return MEMORY[0x1F40C9FB0]("duetexpertd", "contextualengine");
}

+ (BOOL)isZKWHideContextsEnabled
{
  return MEMORY[0x1F40C9FB0]("duetexpertd", "zkw_hide_contexts");
}

+ (BOOL)isTimelineEnabled
{
  return MEMORY[0x1F40C9FB0]("duetexpertd", "timeline");
}

+ (BOOL)isSportsEnabled
{
  return MEMORY[0x1F40C9FB0]("duetexpertd", "sports");
}

+ (BOOL)isFocusUserSetupPredictionEnabled
{
  return MEMORY[0x1F40C9FB0]("duetexpertd", "focusUserSetupPrediction");
}

+ (BOOL)isDigitalBalanceEnabled
{
  return MEMORY[0x1F40C9FB0]("duetexpertd", "digitalBalance");
}

+ (BOOL)isNotificationCategorizationEnabled
{
  return MEMORY[0x1F40C9FB0]("duetexpertd", "notificationCategorization");
}

+ (BOOL)isBreakthroughDataCollectionEnabled
{
  return MEMORY[0x1F40C9FB0]("duetexpertd", "breakthroughDataCollection");
}

+ (BOOL)isRecentAppsHeuristicEnabled
{
  return MEMORY[0x1F40C9FB0]("duetexpertd", "recentAppsHeuristic");
}

@end