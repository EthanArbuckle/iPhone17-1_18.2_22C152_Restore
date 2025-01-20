@interface ATXModeEntityTrialClientWrapperGuardedData
@end

@implementation ATXModeEntityTrialClientWrapperGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->modeAffinityModelsConstants, 0);
  objc_storeStrong((id *)&self->modeAffinityAppCategoryScores, 0);
  objc_storeStrong((id *)&self->notificationModeEntityModelWeights, 0);

  objc_storeStrong((id *)&self->widgetModeEntityModelWeights, 0);
}

@end