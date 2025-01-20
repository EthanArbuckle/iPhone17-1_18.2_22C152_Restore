@interface MTLCompilePerformanceStatisticsEnabled
@end

@implementation MTLCompilePerformanceStatisticsEnabled

void ___MTLCompilePerformanceStatisticsEnabled_block_invoke()
{
  getCompileStatsJSONPath();
  if (logCompileTimeStatsMode(void)::onceToken != -1)
  {
    dispatch_once(&logCompileTimeStatsMode(void)::onceToken, &__block_literal_global_1646);
  }
}

@end