@interface HFCameraUtilities
+ (BOOL)_shouldUseTwentyFourHourTime;
+ (BOOL)disableFullQualityVideoCaching;
+ (BOOL)eventSpansMultipleDays:(id)a3;
+ (BOOL)forceDisplayMultiCameraUpgradeBanner;
+ (BOOL)forceDisplayOfDismissedCameraUpgradeBanner;
+ (BOOL)forceDisplaySingleCameraUpgradeBanner;
+ (BOOL)hasAcceptedCameraFeedbackEmployeeConsent;
+ (BOOL)internalCameraFeedbackSupported;
+ (BOOL)isDateToday:(id)a3;
+ (BOOL)isDateYesterday:(id)a3;
+ (BOOL)isMP4FileAtURL:(id)a3;
+ (BOOL)isTimelapseVideoFileAtURL:(id)a3;
+ (BOOL)isVideoFileWithStrippedAudioAtURL:(id)a3;
+ (BOOL)markCachedVideoAsGreenInTimeline;
+ (BOOL)shouldCacheScrubberTimeScale;
+ (BOOL)shouldDisableHeroFrameDownloads;
+ (BOOL)shouldDisplayInternalUpgradeViews;
+ (BOOL)shouldDisplayInternalViews;
+ (BOOL)shouldPurgePosterFrameCache;
+ (BOOL)shouldPurgeVideoFileCache;
+ (BOOL)treatAllClipsAsUnanalyzed;
+ (double)cachedScrubberTimeScale;
+ (double)durationOfRecordingAtURL:(id)a3;
+ (double)elapsedTimeSinceMidnightForEvent:(id)a3;
+ (id)_fullTimeStringFromDate:(id)a3 shouldUseTwentyFourHourTime:(BOOL)a4;
+ (id)_shortTimeStringFromDate:(id)a3 shouldUseTwentyFourHourTime:(BOOL)a4;
+ (id)attributedFullTimeStringFromDate:(id)a3;
+ (id)attributedShortTimeStringFromDate:(id)a3;
+ (id)attributedStringFromDateString:(id)a3;
+ (id)attributedStringFromTwentyFourHourDateString:(id)a3;
+ (id)cameraFeedbackQueryString;
+ (id)cameraRecordingEventDateOfOccurenceComparator;
+ (id)dayStringFromDate:(id)a3;
+ (id)fullTimeStringFromDate:(id)a3;
+ (id)liveStringFromDate:(id)a3;
+ (id)localizerKeyDayNameFromDate:(id)a3;
+ (id)overrideVideoCacheDurationLimit;
+ (id)overrideVideoDiskCacheLimit;
+ (id)percentageOfDurationUntilNextDayForEvent:(id)a3;
+ (id)shortTimeStringFromDate:(id)a3;
+ (id)twelveHourTimeStringFromDate:(id)a3;
+ (id)twentyFourHourLiveStringFromDate:(id)a3;
+ (id)twentyFourHourTimeStringFromDate:(id)a3;
+ (id)videoCachesDirectoryURL;
+ (id)videoDestinationURLForCameraClip:(id)a3;
+ (id)videoDestinationURLForCameraClip:(id)a3 strippedAudio:(BOOL)a4;
+ (int64_t)compareCreationDateOfFileAtURL:(id)a3 toDaysFromNow:(int64_t)a4;
+ (void)acceptEmployeeCameraFeedbackConsent;
+ (void)cacheScrubberTimeScale:(double)a3;
+ (void)toggleDisplayOfInternalUpgradeViews:(BOOL)a3;
@end

@implementation HFCameraUtilities

+ (BOOL)forceDisplayOfDismissedCameraUpgradeBanner
{
  BOOL v2 = +[HFUtilities isInternalInstall];
  if (v2)
  {
    v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v4 = [v3 valueForKey:@"HFForceDisplayOfDismissedCameraUpgradeBanner"];
    char v5 = [v4 BOOLValue];

    LOBYTE(v2) = v5;
  }
  return v2;
}

+ (BOOL)eventSpansMultipleDays:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a3;
  char v5 = objc_msgSend(v3, "hf_sharedCalendar");
  v6 = [v5 timeZone];
  v7 = [v4 dateOfOccurrence];
  v8 = [v5 componentsInTimeZone:v6 fromDate:v7];

  v9 = [v5 timeZone];
  v10 = objc_msgSend(v4, "hf_endDate");

  v11 = [v5 componentsInTimeZone:v9 fromDate:v10];

  BOOL v13 = 0;
  if ([v8 isValidDate])
  {
    if ([v11 isValidDate])
    {
      uint64_t v12 = [v8 day];
      if (v12 != [v11 day]) {
        BOOL v13 = 1;
      }
    }
  }

  return v13;
}

+ (id)percentageOfDurationUntilNextDayForEvent:(id)a3
{
  id v4 = a3;
  if ([a1 eventSpansMultipleDays:v4])
  {
    char v5 = [v4 dateOfOccurrence];
    v6 = objc_msgSend(v5, "hf_startOfNextDay");
    v7 = [v4 dateOfOccurrence];
    [v6 timeIntervalSinceDate:v7];
    double v9 = v8;

    v10 = NSNumber;
    objc_msgSend(v4, "hf_duration");
    double v12 = v9 / v11;
    *(float *)&double v12 = v12;
    BOOL v13 = [v10 numberWithFloat:v12];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (double)elapsedTimeSinceMidnightForEvent:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a3;
  char v5 = objc_msgSend(v3, "hf_sharedCalendar");
  v6 = [v4 dateOfOccurrence];
  v7 = [v5 nextDateAfterDate:v6 matchingHour:0 minute:0 second:0 options:6];

  double v8 = [v4 dateOfOccurrence];

  [v8 timeIntervalSinceDate:v7];
  double v10 = v9;

  return v10;
}

+ (BOOL)shouldPurgePosterFrameCache
{
  BOOL v2 = +[HFUtilities isInternalInstall];
  if (v2) {
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(@"HFPurgePosterFrameCacheOnLoadKey", @"com.apple.Home", 0) != 0;
  }
  return v2;
}

+ (BOOL)shouldPurgeVideoFileCache
{
  BOOL v2 = +[HFUtilities isInternalInstall];
  if (v2) {
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(@"HFPurgeVideoFileCacheOnLoadKey", @"com.apple.Home", 0) != 0;
  }
  return v2;
}

+ (BOOL)shouldDisableHeroFrameDownloads
{
  BOOL v2 = +[HFUtilities isInternalInstall];
  if (v2) {
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(@"HFDisableHeroFrameDownloadsKey", @"com.apple.Home", 0) != 0;
  }
  return v2;
}

+ (BOOL)shouldDisplayInternalViews
{
  BOOL v2 = +[HFUtilities isInternalInstall];
  if (v2) {
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(@"HFEnableCameraInternalViewsKey", @"com.apple.Home", 0) != 0;
  }
  return v2;
}

+ (BOOL)shouldCacheScrubberTimeScale
{
  BOOL v2 = +[HFUtilities isInternalInstall];
  if (v2) {
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(@"HFShouldCacheScrubberTimeScaleKey", @"com.apple.Home", 0) != 0;
  }
  return v2;
}

+ (void)cacheScrubberTimeScale:(double)a3
{
  if (+[HFUtilities isInternalInstall])
  {
    id v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
    *(float *)&double v4 = a3;
    [v5 setFloat:@"HFCachedScrubberTimeScaleKey" forKey:v4];
  }
}

+ (double)cachedScrubberTimeScale
{
  double v2 = 0.0;
  if (+[HFUtilities isInternalInstall])
  {
    v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    double v4 = [v3 valueForKey:@"HFCachedScrubberTimeScaleKey"];
    [v4 floatValue];
    double v2 = v5;
  }
  return v2;
}

+ (BOOL)treatAllClipsAsUnanalyzed
{
  BOOL v2 = +[HFUtilities isInternalInstall];
  if (v2) {
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(@"HFTreatAllClipsAsUnanalyzed", @"com.apple.Home", 0) != 0;
  }
  return v2;
}

+ (BOOL)markCachedVideoAsGreenInTimeline
{
  BOOL v2 = +[HFUtilities isInternalInstall];
  if (v2) {
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(@"HFMarkCachedVideoAsGreenInTimeline", @"com.apple.Home", 0) != 0;
  }
  return v2;
}

+ (BOOL)disableFullQualityVideoCaching
{
  BOOL v2 = +[HFUtilities isInternalInstall];
  if (v2) {
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(@"HFDisableFullQualityVideoCaching", @"com.apple.Home", 0) != 0;
  }
  return v2;
}

+ (id)overrideVideoDiskCacheLimit
{
  if (+[HFUtilities isInternalInstall])
  {
    BOOL v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v3 = [v2 valueForKey:@"HFPreferencesOverrideVideoDiskCacheLimit"];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)overrideVideoCacheDurationLimit
{
  if (+[HFUtilities isInternalInstall])
  {
    BOOL v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v3 = [v2 valueForKey:@"HFPreferencesOverrideVideoCacheDurationLimit"];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (BOOL)forceDisplaySingleCameraUpgradeBanner
{
  BOOL v2 = +[HFUtilities isInternalInstall];
  if (v2)
  {
    v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    double v4 = [v3 valueForKey:@"HFForceDisplaySingleCameraUpgradeBanner"];
    char v5 = [v4 BOOLValue];

    LOBYTE(v2) = v5;
  }
  return v2;
}

+ (BOOL)forceDisplayMultiCameraUpgradeBanner
{
  BOOL v2 = +[HFUtilities isInternalInstall];
  if (v2)
  {
    v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    double v4 = [v3 valueForKey:@"HFForceDisplayMultiCameraUpgradeBanner"];
    char v5 = [v4 BOOLValue];

    LOBYTE(v2) = v5;
  }
  return v2;
}

+ (id)twentyFourHourTimeStringFromDate:(id)a3
{
  uint64_t v3 = qword_26AB2FC68;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_26AB2FC68, &__block_literal_global_203);
  }
  char v5 = [(id)_MergedGlobals_309 stringFromDate:v4];

  return v5;
}

uint64_t __54__HFCameraUtilities_twentyFourHourTimeStringFromDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)_MergedGlobals_309;
  _MergedGlobals_309 = (uint64_t)v0;

  BOOL v2 = (void *)_MergedGlobals_309;
  return [v2 setDateFormat:@"HH:mm:ss"];
}

+ (id)twelveHourTimeStringFromDate:(id)a3
{
  uint64_t v3 = qword_26AB2FC78;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_26AB2FC78, &__block_literal_global_34_6);
  }
  char v5 = [(id)qword_26AB2FC70 stringFromDate:v4];

  return v5;
}

uint64_t __50__HFCameraUtilities_twelveHourTimeStringFromDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)qword_26AB2FC70;
  qword_26AB2FC70 = (uint64_t)v0;

  BOOL v2 = (void *)qword_26AB2FC70;
  return [v2 setTimeStyle:2];
}

+ (id)dayStringFromDate:(id)a3
{
  id v4 = a3;
  if (qword_26AB2FC88 != -1) {
    dispatch_once(&qword_26AB2FC88, &__block_literal_global_36_7);
  }
  if ([a1 isDateToday:v4]) {
    _HFLocalizedStringWithDefaultValue(@"HFCameraToday", @"HFCameraToday", 1);
  }
  else {
  char v5 = [(id)qword_26AB2FC80 stringFromDate:v4];
  }
  v6 = [v5 capitalizedString];

  return v6;
}

uint64_t __39__HFCameraUtilities_dayStringFromDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)qword_26AB2FC80;
  qword_26AB2FC80 = (uint64_t)v0;

  BOOL v2 = (void *)qword_26AB2FC80;
  return [v2 setDateFormat:@"EEEE"];
}

+ (BOOL)isDateToday:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a3;
  char v5 = objc_msgSend(v3, "hf_sharedCalendar");
  v6 = [MEMORY[0x263EFF910] date];
  char v7 = [v5 isDate:v4 inSameDayAsDate:v6];

  return v7;
}

+ (BOOL)isDateYesterday:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a3;
  char v5 = objc_msgSend(v3, "hf_sharedCalendar");
  char v6 = [v5 isDateInYesterday:v4];

  return v6;
}

+ (id)liveStringFromDate:(id)a3
{
  uint64_t v3 = qword_26AB2FC98;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_26AB2FC98, &__block_literal_global_44_2);
  }
  char v5 = [(id)qword_26AB2FC90 stringFromDate:v4];

  return v5;
}

uint64_t __40__HFCameraUtilities_liveStringFromDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)qword_26AB2FC90;
  qword_26AB2FC90 = (uint64_t)v0;

  BOOL v2 = (void *)qword_26AB2FC90;
  return [v2 setTimeStyle:1];
}

+ (id)twentyFourHourLiveStringFromDate:(id)a3
{
  uint64_t v3 = qword_26AB2FCA8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_26AB2FCA8, &__block_literal_global_46_4);
  }
  char v5 = [(id)qword_26AB2FCA0 stringFromDate:v4];

  return v5;
}

uint64_t __54__HFCameraUtilities_twentyFourHourLiveStringFromDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)qword_26AB2FCA0;
  qword_26AB2FCA0 = (uint64_t)v0;

  BOOL v2 = (void *)qword_26AB2FCA0;
  return [v2 setDateFormat:@"HH:mm"];
}

+ (id)attributedStringFromTwentyFourHourDateString:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (attributedStringFromTwentyFourHourDateString__onceToken == -1)
  {
    if (v3)
    {
LABEL_3:
      id v5 = objc_alloc(MEMORY[0x263F089B8]);
      char v6 = [NSString stringWithFormat:@"%@", v4];
      char v7 = (void *)[v5 initWithString:v6];

      goto LABEL_8;
    }
  }
  else
  {
    dispatch_once(&attributedStringFromTwentyFourHourDateString__onceToken, &__block_literal_global_51_3);
    if (v4) {
      goto LABEL_3;
    }
  }
  double v8 = HFLogForCategory(0xEuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = 0;
    _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "Unable to parse proper twenty-four hour components from string:%@.", buf, 0xCu);
  }

  char v7 = 0;
LABEL_8:

  return v7;
}

uint64_t __66__HFCameraUtilities_attributedStringFromTwentyFourHourDateString___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F1C658] monospacedDigitSystemFontOfSize:18.0 weight:*MEMORY[0x263F1D340]];
  uint64_t v1 = attributedStringFromTwentyFourHourDateString__font;
  attributedStringFromTwentyFourHourDateString__font = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)attributedStringFromDateString:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (qword_26AB2FCC0 != -1) {
    dispatch_once(&qword_26AB2FCC0, &__block_literal_global_59_4);
  }
  id v4 = [v3 componentsSeparatedByString:@" "];
  if ([v4 count] == 2)
  {
    id v5 = objc_alloc(MEMORY[0x263F089B8]);
    char v6 = NSString;
    char v7 = [v4 objectAtIndexedSubscript:0];
    double v8 = [v4 objectAtIndexedSubscript:1];
    double v9 = [v6 stringWithFormat:@"%@ %@", v7, v8];
    double v10 = (void *)[v5 initWithString:v9];

    uint64_t v11 = [v10 string];
    uint64_t v12 = [v4 objectAtIndexedSubscript:1];
    uint64_t v13 = [v11 rangeOfString:v12];
    uint64_t v15 = v14;

    uint64_t v16 = *MEMORY[0x263F1C238];
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x263F1C238], qword_26AB2FCB0, 0, v13);
    objc_msgSend(v10, "addAttribute:value:range:", v16, qword_26AB2FCB8, v13, v15);
  }
  else
  {
    v17 = HFLogForCategory(0xEuLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v3;
      _os_log_error_impl(&dword_20B986000, v17, OS_LOG_TYPE_ERROR, "Unable to parse proper twelve hour components from string:%@. Displaying full string without small caps.", buf, 0xCu);
    }

    double v10 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v3];
    uint64_t v18 = *MEMORY[0x263F1C238];
    uint64_t v19 = qword_26AB2FCB0;
    v20 = [v10 string];
    uint64_t v21 = [v20 rangeOfString:v3];
    objc_msgSend(v10, "addAttribute:value:range:", v18, v19, v21, v22);
  }
  return v10;
}

void __52__HFCameraUtilities_attributedStringFromDateString___block_invoke()
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F1C658] monospacedDigitSystemFontOfSize:18.0 weight:*MEMORY[0x263F1D340]];
  uint64_t v1 = (void *)qword_26AB2FCB0;
  qword_26AB2FCB0 = v0;

  uint64_t v13 = *MEMORY[0x263F1D1E8];
  uint64_t v2 = *MEMORY[0x263F1D218];
  v10[0] = *MEMORY[0x263F1D220];
  v10[1] = v2;
  v11[0] = &unk_26C0F7968;
  v11[1] = &unk_26C0F7980;
  id v3 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  uint64_t v12 = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
  v14[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];

  char v6 = [(id)qword_26AB2FCB0 fontDescriptor];
  char v7 = [v6 fontDescriptorByAddingAttributes:v5];

  uint64_t v8 = [MEMORY[0x263F1C658] fontWithDescriptor:v7 size:18.0];
  double v9 = (void *)qword_26AB2FCB8;
  qword_26AB2FCB8 = v8;
}

+ (BOOL)_shouldUseTwentyFourHourTime
{
  uint64_t v2 = (void *)MEMORY[0x263F08790];
  id v3 = [MEMORY[0x263EFF960] currentLocale];
  id v4 = [v2 dateFormatFromTemplate:@"j" options:0 locale:v3];

  LOBYTE(v3) = [v4 containsString:@"a"] ^ 1;
  return (char)v3;
}

+ (id)_fullTimeStringFromDate:(id)a3 shouldUseTwentyFourHourTime:(BOOL)a4
{
  if (a4) {
    [a1 twentyFourHourTimeStringFromDate:a3];
  }
  else {
  id v4 = [a1 twelveHourTimeStringFromDate:a3];
  }
  return v4;
}

+ (id)fullTimeStringFromDate:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_fullTimeStringFromDate:shouldUseTwentyFourHourTime:", v4, objc_msgSend(a1, "_shouldUseTwentyFourHourTime"));

  return v5;
}

+ (id)attributedFullTimeStringFromDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _shouldUseTwentyFourHourTime];
  char v6 = [a1 _fullTimeStringFromDate:v4 shouldUseTwentyFourHourTime:v5];

  if (v5) {
    [a1 attributedStringFromTwentyFourHourDateString:v6];
  }
  else {
  char v7 = [a1 attributedStringFromDateString:v6];
  }

  return v7;
}

+ (id)_shortTimeStringFromDate:(id)a3 shouldUseTwentyFourHourTime:(BOOL)a4
{
  if (a4) {
    [a1 twentyFourHourLiveStringFromDate:a3];
  }
  else {
  id v4 = [a1 liveStringFromDate:a3];
  }
  return v4;
}

+ (id)shortTimeStringFromDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "_shortTimeStringFromDate:shouldUseTwentyFourHourTime:", v4, objc_msgSend(a1, "_shouldUseTwentyFourHourTime"));

  return v5;
}

+ (id)attributedShortTimeStringFromDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _shouldUseTwentyFourHourTime];
  char v6 = [a1 _shortTimeStringFromDate:v4 shouldUseTwentyFourHourTime:v5];

  if (v5) {
    [a1 attributedStringFromTwentyFourHourDateString:v6];
  }
  else {
  char v7 = [a1 attributedStringFromDateString:v6];
  }

  return v7;
}

+ (id)localizerKeyDayNameFromDate:(id)a3
{
  id v5 = a3;
  char v6 = v5;
  if (qword_26AB2FCD0 == -1)
  {
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&qword_26AB2FCD0, &__block_literal_global_79_0);
    if (v6) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
  [v11 handleFailureInMethod:a2, a1, @"HFCameraUtilities.m", 362, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

LABEL_3:
  char v7 = objc_msgSend(MEMORY[0x263EFF910], "hf_sharedCalendar");
  uint64_t v8 = [v7 component:512 fromDate:v6];

  double v9 = [(id)qword_26AB2FCC8 objectAtIndexedSubscript:v8 - 1];

  return v9;
}

void __49__HFCameraUtilities_localizerKeyDayNameFromDate___block_invoke()
{
  uint64_t v0 = (void *)qword_26AB2FCC8;
  qword_26AB2FCC8 = (uint64_t)&unk_26C0F82D8;
}

+ (BOOL)shouldDisplayInternalUpgradeViews
{
  BOOL v2 = +[HFUtilities isInternalInstall];
  if (v2)
  {
    id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v4 = [v3 valueForKey:@"HFShouldDisplayInternalUpgradeViews"];
    char v5 = [v4 BOOLValue];

    LOBYTE(v2) = v5;
  }
  return v2;
}

+ (void)toggleDisplayOfInternalUpgradeViews:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[HFUtilities isInternalInstall])
  {
    id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v4 setBool:v3 forKey:@"HFShouldDisplayInternalUpgradeViews"];
  }
}

+ (BOOL)internalCameraFeedbackSupported
{
  if (+[HFUtilities isPressDemoModeEnabled]) {
    return 0;
  }
  return +[HFUtilities isInternalInstall];
}

+ (BOOL)hasAcceptedCameraFeedbackEmployeeConsent
{
  BOOL v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v3 = [v2 valueForKey:@"HFEmployeeAcceptedCameraFeedbackConsent_2020"];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (void)acceptEmployeeCameraFeedbackConsent
{
  if (([a1 hasAcceptedCameraFeedbackEmployeeConsent] & 1) == 0)
  {
    BOOL v2 = HFLogForCategory(0x14uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "User has accepted the employee consent.", v4, 2u);
    }

    BOOL v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v3 setBool:1 forKey:@"HFEmployeeAcceptedCameraFeedbackConsent_2020"];
  }
}

+ (id)cameraFeedbackQueryString
{
  return @"&feedback=1";
}

+ (double)durationOfRecordingAtURL:(id)a3
{
  id v3 = a3;
  BOOL v4 = [MEMORY[0x263F08850] defaultManager];
  char v5 = [v3 path];
  int v6 = [v4 fileExistsAtPath:v5];

  double Seconds = 0.0;
  if (v6)
  {
    uint64_t v8 = [MEMORY[0x263EFA470] assetWithURL:v3];
    double v9 = v8;
    if (v8) {
      [v8 duration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);
  }
  return Seconds;
}

+ (id)videoCachesDirectoryURL
{
  BOOL v2 = +[HFUtilities cachesDirectoryURL];
  id v3 = [v2 URLByAppendingPathComponent:@"Video" isDirectory:1];

  return v3;
}

+ (id)videoDestinationURLForCameraClip:(id)a3
{
  return (id)[a1 videoDestinationURLForCameraClip:a3 strippedAudio:0];
}

+ (id)videoDestinationURLForCameraClip:(id)a3 strippedAudio:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v7 = [v6 uniqueIdentifier];
  uint64_t v8 = [v7 UUIDString];

  uint64_t v9 = [v6 quality];
  if (v9 == 1)
  {
    uint64_t v10 = [v8 stringByAppendingString:@"-timelapse"];

    uint64_t v8 = (void *)v10;
  }
  if (v4)
  {
    uint64_t v11 = [v8 stringByAppendingString:@"-noaac"];

    uint64_t v8 = (void *)v11;
  }
  uint64_t v12 = [v8 stringByAppendingPathExtension:@"mp4"];

  uint64_t v13 = NSURL;
  uint64_t v14 = [a1 videoCachesDirectoryURL];
  uint64_t v15 = [v13 URLWithString:v12 relativeToURL:v14];

  return v15;
}

+ (BOOL)isTimelapseVideoFileAtURL:(id)a3
{
  id v3 = [a3 lastPathComponent];
  BOOL v4 = [v3 stringByDeletingPathExtension];
  char v5 = [v4 hasSuffix:@"-timelapse"];

  return v5;
}

+ (BOOL)isVideoFileWithStrippedAudioAtURL:(id)a3
{
  id v3 = [a3 lastPathComponent];
  BOOL v4 = [v3 stringByDeletingPathExtension];
  char v5 = [v4 hasSuffix:@"-noaac"];

  return v5;
}

+ (int64_t)compareCreationDateOfFileAtURL:(id)a3 toDaysFromNow:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v17 = 0;
  uint64_t v6 = *MEMORY[0x263EFF610];
  id v16 = 0;
  int v7 = [v5 getResourceValue:&v17 forKey:v6 error:&v16];
  id v8 = v17;
  id v9 = v16;
  if (v7)
  {
    uint64_t v10 = (void *)MEMORY[0x263EFF910];
    uint64_t v11 = [MEMORY[0x263EFF910] now];
    uint64_t v12 = objc_msgSend(v10, "hf_dateByAddingDays:toDate:", a4, v11);

    int64_t v13 = [v8 compare:v12];
  }
  else
  {
    uint64_t v12 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = [v5 path];
      *(_DWORD *)buf = 136315650;
      uint64_t v19 = "+[HFCameraUtilities compareCreationDateOfFileAtURL:toDaysFromNow:]";
      __int16 v20 = 2112;
      id v21 = v9;
      __int16 v22 = 2112;
      v23 = v15;
      _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, "%s: %@; %@", buf, 0x20u);
    }
    int64_t v13 = 0;
  }

  return v13;
}

+ (BOOL)isMP4FileAtURL:(id)a3
{
  id v3 = [a3 pathExtension];
  BOOL v4 = [v3 caseInsensitiveCompare:@"mp4"] == 0;

  return v4;
}

+ (id)cameraRecordingEventDateOfOccurenceComparator
{
  return &__block_literal_global_122_2;
}

uint64_t __66__HFCameraUtilities_cameraRecordingEventDateOfOccurenceComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 dateOfOccurrence];
  uint64_t v6 = [v4 dateOfOccurrence];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

@end