@interface IPInternationalAnalytics
+ (void)reportGeneralStatistics;
+ (void)reportPerAppLanguageStatistics;
+ (void)reportStatistics;
@end

@implementation IPInternationalAnalytics

+ (void)reportStatistics
{
  [a1 reportGeneralStatistics];
  [a1 reportPerAppLanguageStatistics];
}

+ (void)reportGeneralStatistics
{
  v36[10] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA20] _globalPreferredLanguages];
  if ([v2 count])
  {
    v31 = [v2 objectAtIndexedSubscript:0];
  }
  else
  {
    v31 = 0;
  }
  if ((unint64_t)[v2 count] < 2)
  {
    v34 = 0;
  }
  else
  {
    v34 = [v2 objectAtIndexedSubscript:1];
  }
  if ((unint64_t)[v2 count] < 3)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [v2 objectAtIndexedSubscript:2];
  }
  v4 = +[IntlUtility perAppLanguageSelectionBundleIdentifiers];
  v32 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v5 = [MEMORY[0x1E4F292A8] _currentGlobalUserInflection];
  v33 = v2;
  v30 = v5;
  if (v5) {
    uint64_t v6 = [v5 isIdentity] ^ 1;
  }
  else {
    uint64_t v6 = 0;
  }
  v35[0] = @"deviceLanguage";
  v29 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
  v36[0] = v29;
  v35[1] = @"deviceRegion";
  v28 = [MEMORY[0x1E4F1CA20] preferredLocale];
  uint64_t v7 = [v28 countryCode];
  v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = @"Not Specified";
  }
  v36[1] = v9;
  v35[2] = @"perAppLanguageUsageCount";
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v27 = (void *)v10;
  if (v31) {
    v11 = v31;
  }
  else {
    v11 = @"Not Specified";
  }
  v36[2] = v10;
  v36[3] = v11;
  v35[3] = @"preferredLanguage1";
  v35[4] = @"preferredLanguage2";
  v12 = v34;
  if (!v34) {
    v12 = @"Not Specified";
  }
  v13 = (void *)v3;
  if (v3) {
    v14 = (__CFString *)v3;
  }
  else {
    v14 = @"Not Specified";
  }
  v36[4] = v12;
  v36[5] = v14;
  v35[5] = @"preferredLanguage3";
  v35[6] = @"hasInflectionSet";
  v15 = [NSNumber numberWithBool:v6];
  v36[6] = v15;
  v35[7] = 0x1F19D6DD0;
  uint64_t v16 = [MEMORY[0x1E4F1CA20] _preferredTemperatureUnit];
  v17 = (void *)v16;
  if (v16) {
    v18 = (__CFString *)v16;
  }
  else {
    v18 = @"Not Specified";
  }
  v36[7] = v18;
  v35[8] = 0x1F19D5690;
  uint64_t v19 = objc_msgSend(v32, "objectForKey:inDomain:");
  v20 = (void *)v19;
  if (v19) {
    v21 = (__CFString *)v19;
  }
  else {
    v21 = @"Not Specified";
  }
  v36[8] = v21;
  v35[9] = 0x1F19D56B0;
  uint64_t v22 = objc_msgSend(v32, "objectForKey:inDomain:");
  v23 = (void *)v22;
  if (v22) {
    v24 = (__CFString *)v22;
  }
  else {
    v24 = @"Not Specified";
  }
  v36[9] = v24;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:10];
  v26 = (void *)[v25 mutableCopy];

  AnalyticsSendEvent();
}

+ (void)reportPerAppLanguageStatistics
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = +[IntlUtility perAppLanguageSelectionBundleIdentifiers];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v8 = +[IntlUtility preferredLanguageForBundleID:v7];
        v9 = (void *)v8;
        if (v8)
        {
          v20[0] = @"bundleIdentifier";
          v20[1] = @"languageIdentifier";
          v21[0] = v7;
          v21[1] = v8;
          v20[2] = @"deviceLanguage";
          uint64_t v10 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
          v21[2] = v10;
          v20[3] = @"deviceRegion";
          v11 = [MEMORY[0x1E4F1CA20] preferredLocale];
          uint64_t v12 = [v11 countryCode];
          v13 = (void *)v12;
          v14 = @"Not Specified";
          if (v12) {
            v14 = (__CFString *)v12;
          }
          v21[3] = v14;
          v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
          AnalyticsSendEvent();
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v4);
  }
}

@end