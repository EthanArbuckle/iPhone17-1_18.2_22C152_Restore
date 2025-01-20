@interface CHSpotlightSearchQueryUtilities
+ (BOOL)shouldReindexCallsDueToDeferredReindexing;
+ (BOOL)shouldReindexCallsDueToVersionMismatch;
+ (NSString)searchStringForFacetimeAudioCalls;
+ (NSString)searchStringForFacetimeVideoCalls;
+ (id)lastFourDigitsFrom:(int64_t)a3;
+ (id)searchQueryWithSearchString:(id)a3;
+ (id)searchStringForCallsMatchingHandles:(id)a3 orContactIdentifier:(id)a4;
+ (id)userDefaults;
+ (unint64_t)callsDeferredReindexingReason;
+ (void)logEventReindexingFinishedForReason:(unint64_t)a3 timeTaken:(double)a4;
+ (void)logEventReindexingRequestedForReason:(unint64_t)a3;
+ (void)setCallsNeedsDeferredReindexingForReason:(unint64_t)a3;
@end

@implementation CHSpotlightSearchQueryUtilities

+ (id)searchStringForCallsMatchingHandles:(id)a3 orContactIdentifier:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    v7 = [NSString stringWithFormat:@"%@=='*%@*'c", *MEMORY[0x1E4F234A0], v6];
    v8 = [v7 stringByAppendingString:@" || "];

    v9 = [NSString stringWithFormat:@"%@=='*%@*'c", *MEMORY[0x1E4F22B10], v6];
    v10 = [v8 stringByAppendingString:v9];
  }
  else
  {
    v10 = &stru_1F129F488;
  }
  if ([v5 count])
  {
    id v22 = v6;
    id v23 = v5;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      uint64_t v15 = *MEMORY[0x1E4F231E8];
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          if ([(__CFString *)v10 length])
          {
            uint64_t v18 = [(__CFString *)v10 stringByAppendingString:@" || "];

            v10 = (__CFString *)v18;
          }
          v19 = v10;
          v20 = [NSString stringWithFormat:@"%@=='*%@*'c", v15, v17];
          v10 = [(__CFString *)v10 stringByAppendingString:v20];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }

    id v6 = v22;
    id v5 = v23;
  }

  return v10;
}

+ (NSString)searchStringForFacetimeAudioCalls
{
  return (NSString *)[NSString stringWithFormat:@"%@==%@ && %@==%@", *MEMORY[0x1E4F23238], @"FaceTime", *MEMORY[0x1E4F23228], @"Audio"];
}

+ (NSString)searchStringForFacetimeVideoCalls
{
  return (NSString *)[NSString stringWithFormat:@"%@==%@ && %@==%@", *MEMORY[0x1E4F23238], @"FaceTime", *MEMORY[0x1E4F23228], @"Video"];
}

+ (id)searchQueryWithSearchString:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  v11[0] = @"com.apple.mobilephone";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v4 setBundleIDs:v5];

  id v6 = [NSString stringWithFormat:@"%@ == %@", *MEMORY[0x1E4F22C60], @"kSpotlightItemTypeCall"];
  v10 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  [v4 setFilterQueries:v7];

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v3 queryContext:v4];
  return v8;
}

+ (id)lastFourDigitsFrom:(int64_t)a3
{
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", a3);
  unint64_t v4 = [v3 length];
  if (v4 < 5)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v3 substringFromIndex:v4 - 4];
  }
  id v6 = v5;

  return v6;
}

+ (BOOL)shouldReindexCallsDueToVersionMismatch
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [a1 userDefaults];
  uint64_t v3 = [v2 integerForKey:@"kCHSpotlightIndexVersion"];
  unint64_t v4 = ch_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218240;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = 9;
    _os_log_impl(&dword_1B8E4A000, v4, OS_LOG_TYPE_DEFAULT, "Current spotlight index version for calls: %ld, expected index version: %ld", (uint8_t *)&v6, 0x16u);
  }

  return v3 != 9;
}

+ (BOOL)shouldReindexCallsDueToDeferredReindexing
{
  return [a1 callsDeferredReindexingReason] != 0;
}

+ (unint64_t)callsDeferredReindexingReason
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [a1 userDefaults];
  unint64_t v3 = [v2 integerForKey:@"CHSpotlightReindexingReasonKey"];
  unint64_t v4 = ch_framework_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    unint64_t v7 = v3;
    _os_log_impl(&dword_1B8E4A000, v4, OS_LOG_TYPE_DEFAULT, "CHSpotlightSearchQueryUtilities: callsDeferredReindexingReason: %ld", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

+ (void)setCallsNeedsDeferredReindexingForReason:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 userDefaults];
  uint64_t v6 = [v5 integerForKey:@"CHSpotlightReindexingReasonKey"];
  if ((v6 & a3) == 0)
  {
    [v5 setInteger:v6 | a3 forKey:@"CHSpotlightReindexingReasonKey"];
    [a1 logEventReindexingRequestedForReason:a3];
    unint64_t v7 = ch_framework_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1B8E4A000, v7, OS_LOG_TYPE_DEFAULT, "CHSpotlightSearchQueryUtilities: setNeedsDeferredReindexingForReason:%@", (uint8_t *)&v9, 0xCu);
    }
  }
}

+ (void)logEventReindexingRequestedForReason:(unint64_t)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = @"spotlightReindexingDataSource";
  v16[1] = @"spotlightReindexingReason";
  v17[0] = &unk_1F12ABB80;
  unint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  v17[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  uint64_t v6 = (void *)[v5 mutableCopy];

  unint64_t v7 = [a1 userDefaults];
  uint64_t v8 = [v7 objectForKey:@"CHLastReindexCompletionDate"];

  if (v8)
  {
    int v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v11 = [v9 components:32 fromDate:v8 toDate:v10 options:0];
    uint64_t v12 = [v11 hour];

    uint64_t v13 = [NSNumber numberWithInteger:v12];
    [v6 setObject:v13 forKeyedSubscript:@"spotlightReindexingLastReindexTimeDelta"];
  }
  uint64_t v15 = v6;
  id v14 = v6;
  AnalyticsSendEventLazy();
}

id __72__CHSpotlightSearchQueryUtilities_logEventReindexingRequestedForReason___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)logEventReindexingFinishedForReason:(unint64_t)a3 timeTaken:(double)a4
{
  v20[3] = *MEMORY[0x1E4F143B8];
  v20[0] = &unk_1F12ABB80;
  v19[0] = @"spotlightReindexingDataSource";
  v19[1] = @"spotlightReindexingReason";
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  v20[1] = v6;
  v19[2] = @"spotlightReindexingLatency";
  unint64_t v7 = [NSNumber numberWithDouble:a4];
  v20[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  int v9 = (void *)[v8 mutableCopy];

  uint64_t v10 = [a1 userDefaults];
  uint64_t v11 = [v10 objectForKey:@"CHLastReindexCompletionDate"];

  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    id v14 = [v12 components:32 fromDate:v11 toDate:v13 options:0];
    uint64_t v15 = [v14 hour];

    v16 = [NSNumber numberWithInteger:v15];
    [v9 setObject:v16 forKeyedSubscript:@"spotlightReindexingLastReindexTimeDelta"];
  }
  uint64_t v18 = v9;
  id v17 = v9;
  AnalyticsSendEventLazy();
}

id __81__CHSpotlightSearchQueryUtilities_logEventReindexingFinishedForReason_timeTaken___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)userDefaults
{
  if (userDefaults_onceToken != -1) {
    dispatch_once(&userDefaults_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)userDefaults_sUserDefaults;
  return v2;
}

void __47__CHSpotlightSearchQueryUtilities_userDefaults__block_invoke()
{
  id v5 = kSyncHelperServiceIdentifier;
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 bundleIdentifier];
  int v2 = [v1 isEqualToString:v5];

  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  else
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v5];
  }
  unint64_t v4 = (void *)userDefaults_sUserDefaults;
  userDefaults_sUserDefaults = v3;
}

@end