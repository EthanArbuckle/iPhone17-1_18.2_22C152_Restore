@interface ATXInformationEngineGuardedData
@end

@implementation ATXInformationEngineGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->scheduledPredictionRefreshDate, 0);
  objc_storeStrong((id *)&self->cachedSuggestions, 0);
}

@end