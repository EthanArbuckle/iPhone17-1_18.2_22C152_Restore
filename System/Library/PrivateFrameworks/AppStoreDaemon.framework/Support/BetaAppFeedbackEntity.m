@interface BetaAppFeedbackEntity
+ (id)databaseTable;
@end

@implementation BetaAppFeedbackEntity

+ (id)databaseTable
{
  return @"beta_app_feedback";
}

@end