@interface WBSAnalyticsLogger(_SFWebClipsAnalyticsLogger)
- (void)_performWebClipsBehaviorReport;
- (void)_webClipsAnalyticsLogger_updatePeriodicCoreAnalyticsLastReportTime;
- (void)schedulePeriodicWebClipsReport;
@end

@implementation WBSAnalyticsLogger(_SFWebClipsAnalyticsLogger)

- (void)_webClipsAnalyticsLogger_updatePeriodicCoreAnalyticsLastReportTime
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v0 setDouble:@"LastWebAppReportTime" forKey:CFAbsoluteTimeGetCurrent()];
}

- (void)_performWebClipsBehaviorReport
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v0 = [MEMORY[0x1E4FB1F10] clipsIncludingWebClips:1 includingAppClips:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v1 = [v0 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    int v3 = 0;
    int v4 = 0;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v0);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        v8 = [v7 applicationBundleIdentifier];

        if (!v8)
        {
          if ([v7 fullScreen]) {
            ++v4;
          }
          else {
            ++v3;
          }
        }
      }
      uint64_t v2 = [v0 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v2);
  }
  else
  {
    int v3 = 0;
    int v4 = 0;
  }
  v9 = [MEMORY[0x1E4F98948] sharedLogger];
  [v9 reportNumberOfWebApps:v4 andBookmarks:v3];
}

- (void)schedulePeriodicWebClipsReport
{
  dispatch_time_t WeeklyAnalyticsReportForKey = WBSTimeUntilNextWeeklyAnalyticsReportForKey();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__WBSAnalyticsLogger__SFWebClipsAnalyticsLogger__schedulePeriodicWebClipsReport__block_invoke;
  block[3] = &unk_1E5C724D8;
  block[4] = a1;
  dispatch_after(WeeklyAnalyticsReportForKey, MEMORY[0x1E4F14428], block);
}

@end