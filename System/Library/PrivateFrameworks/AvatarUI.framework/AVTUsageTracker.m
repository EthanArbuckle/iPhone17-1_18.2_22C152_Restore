@interface AVTUsageTracker
+ (id)currentSession;
+ (void)trackCountOfMemojiInStore:(id)a3;
+ (void)trackCountOfMemojiInStore:(id)a3 withCoreAnalyticsClient:(id)a4;
+ (void)trackStickerSentFromHostBundleIdentifier:(id)a3;
+ (void)trackStickerSentFromHostBundleIdentifier:(id)a3 withCoreAnalyticsClient:(id)a4;
@end

@implementation AVTUsageTracker

+ (id)currentSession
{
  v2 = +[AVTUIEnvironment defaultEnvironment];
  v3 = [v2 usageTrackingSession];

  return v3;
}

+ (void)trackStickerSentFromHostBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(AVTCoreAnalyticsClient);
  [a1 trackStickerSentFromHostBundleIdentifier:v4 withCoreAnalyticsClient:v5];
}

+ (void)trackStickerSentFromHostBundleIdentifier:(id)a3 withCoreAnalyticsClient:(id)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = +[AVTUsageTrackingSession allowListAppNameFromBundleID:a3];
  v7 = [NSString stringWithFormat:@"%@StickerSentInApp", @"com.apple.Animoji.Analytics.StickersApp."];
  v9 = @"appName";
  v10[0] = v6;
  v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 sendEventForKey:v7 payload:v8];
}

+ (void)trackCountOfMemojiInStore:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(AVTCoreAnalyticsClient);
  [a1 trackCountOfMemojiInStore:v4 withCoreAnalyticsClient:v5];
}

+ (void)trackCountOfMemojiInStore:(id)a3 withCoreAnalyticsClient:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263F29718];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 requestForCustomAvatars];
  v9 = [v7 avatarsForFetchRequest:v8 error:0];

  uint64_t v10 = [v9 count];
  v11 = [NSString stringWithFormat:@"%@FeatureAdoption", @"com.apple.Memoji.Analytics."];
  v14 = @"memojiCount";
  v12 = [NSNumber numberWithUnsignedInteger:v10];
  v15[0] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  [v6 sendEventForKey:v11 payload:v13];
}

@end