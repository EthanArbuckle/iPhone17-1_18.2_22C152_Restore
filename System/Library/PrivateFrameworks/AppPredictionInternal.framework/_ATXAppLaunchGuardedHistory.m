@interface _ATXAppLaunchGuardedHistory
@end

@implementation _ATXAppLaunchGuardedHistory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heroPoiManager, 0);
  objc_storeStrong((id *)&self->_contextBuilder, 0);
  objc_storeStrong((id *)&self->_appLaunchSequenceManager, 0);
  objc_storeStrong((id *)&self->_appLaunchHistogramManager, 0);
  objc_storeStrong((id *)&self->_appInfoManager, 0);
  objc_storeStrong((id *)&self->_appDailyDose, 0);
  objc_storeStrong((id *)&self->_duetHelper, 0);
  objc_storeStrong((id *)&self->_deltaLog, 0);
}

@end