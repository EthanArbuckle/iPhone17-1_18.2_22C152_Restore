@interface AVTUsageTrackingSession
+ (id)allowListAppNameFromBundleID:(id)a3;
+ (id)colorPresetDescriptionForAvatarConfiguration:(id)a3;
+ (id)configurationDistanceClassifierWithMetric:(id)a3;
+ (id)defaultRecordTransformerForCoreModel:(id)a3;
+ (id)defaultTimeProvider;
+ (id)dpKeyBasePrefix;
+ (id)keyBasePrefixForBundleIdentifier:(id)a3;
+ (id)likenessComparator;
+ (id)makeDPKey:(id)a3;
+ (id)makeKeyAnalyticsCompliant:(id)a3;
+ (id)payloadForAvatarRecord:(id)a3;
+ (id)payloadForAvatarRecordIdentifier:(id)a3;
+ (void)getPresetDescription:(id *)a3 usedCategoriesDescription:(id *)a4 forAvatarConfiguration:(id)a5 defaultConfiguration:(id)a6;
- (AVTAvatarConfiguration)defaultConfiguration;
- (AVTAvatarConfigurationMetric)metric;
- (AVTAvatarRecord)avatarRecord;
- (AVTAvatarStoreInternal)avatarStore;
- (AVTCoreAnalyticsClient)ntsCAClient;
- (AVTDifferentialPrivacyRecorder)ntsDPRecorder;
- (AVTUILogger)logger;
- (AVTUsageTrackingRecordTimedEvent)faceTrackingEvent;
- (AVTUsageTrackingSession)initWithCoreAnalyticsClient:(id)a3 dpRecorder:(id)a4 serialQueueProvider:(id)a5 recordTransformer:(id)a6 avatarRecord:(id)a7 defaultConfiguration:(id)a8 timeProvider:(id)a9 configurationMetric:(id)a10 logger:(id)a11 keyBasePrefix:(id)a12 bundleAppName:(id)a13;
- (AVTUsageTrackingSession)initWithSerialQueueProvider:(id)a3 recordTransformer:(id)a4 logger:(id)a5;
- (BOOL)expandedMode;
- (BOOL)recordedVideo;
- (NSDate)editorEnterDate;
- (NSString)bundleAppName;
- (NSString)keyBasePrefix;
- (OS_dispatch_queue)workQueue;
- (id)makeCrossAppEventKeyForAction:(id)a3;
- (id)makeEventKeyForAction:(id)a3;
- (id)payloadForCrossAppEvent;
- (id)recordTransformer;
- (id)timeProvider;
- (void)beginWithStore:(id)a3;
- (void)didChangeCurrentAvatarInCarousel:(id)a3;
- (void)didChangeCurrentAvatarInStickers:(id)a3;
- (void)didCreateAvatar:(id)a3;
- (void)didDeleteAvatar:(id)a3;
- (void)didDiscardVideoWithDuration:(double)a3;
- (void)didDuplicateAvatar:(id)a3;
- (void)didEditAvatar:(id)a3;
- (void)didEnterEditor;
- (void)didLeaveEditor;
- (void)didOpenStickersAppFromRecents;
- (void)didPauseFaceTracking;
- (void)didRecordVideo;
- (void)didReplayVideo;
- (void)didResumeFaceTracking;
- (void)didSelectStickerFromStickersApp:(id)a3 withAvatar:(id)a4;
- (void)didSelectStickerFromStickersApp:(id)a3 withAvatar:(id)a4 bundleIdentifier:(id)a5;
- (void)didSendImageWithAvatar:(id)a3;
- (void)didSendStickerWithAvatar:(id)a3;
- (void)didSendVideoWithAvatar:(id)a3 duration:(double)a4;
- (void)didShowExpandedMode;
- (void)didStartFaceTrackingInCarouselWithAvatar:(id)a3;
- (void)didStopFaceTrackingInCarousel;
- (void)didTapStickerFromRecents:(id)a3 withAvatarIdentifier:(id)a4;
- (void)end;
- (void)nts_loadDefaultConfigurationIfNeeded;
- (void)nts_reportAvatarComplexity:(id)a3 withClient:(id)a4;
- (void)nts_reportAvatarCountWithClient:(id)a3;
- (void)nts_reportAvatarDescription:(id)a3 dpRecorder:(id)a4;
- (void)nts_reportAvatarLikenessClustersWithClient:(id)a3;
- (void)nts_reportEditorTimeWithExitTime:(id)a3 client:(id)a4;
- (void)nts_reportExpandedModeWithClient:(id)a3;
- (void)nts_reportFaceTrackingTimeWithEndTime:(id)a3 client:(id)a4;
- (void)performClientWork:(id)a3;
- (void)sendCrossAppsEventForAction:(id)a3;
- (void)sendEventForAction:(id)a3;
- (void)sentStickerFromStickersApp:(id)a3 withAvatarRecord:(id)a4 action:(id)a5 appName:(id)a6;
- (void)setAvatarStore:(id)a3;
- (void)setEditorEnterDate:(id)a3;
- (void)setExpandedMode:(BOOL)a3;
- (void)setFaceTrackingEvent:(id)a3;
- (void)setRecordedVideo:(BOOL)a3;
@end

@implementation AVTUsageTrackingSession

+ (id)defaultRecordTransformerForCoreModel:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__AVTUsageTrackingSession_defaultRecordTransformerForCoreModel___block_invoke;
  v7[3] = &unk_263FF1DF8;
  id v8 = v3;
  id v4 = v3;
  v5 = (void *)MEMORY[0x210530210](v7);

  return v5;
}

id __64__AVTUsageTrackingSession_defaultRecordTransformerForCoreModel___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[AVTAvatarConfiguration configurationForRecord:a2 coreModel:*(void *)(a1 + 32)];
}

+ (id)defaultTimeProvider
{
  return &__block_literal_global_16;
}

uint64_t __46__AVTUsageTrackingSession_defaultTimeProvider__block_invoke()
{
  return [MEMORY[0x263EFF910] date];
}

+ (id)payloadForAvatarRecord:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 isEditable])
  {
    v9 = @"recordType";
    v10[0] = @"memoji";
    id v4 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    v7[0] = @"recordType";
    v7[1] = @"animojiName";
    v8[0] = @"animoji";
    v5 = [v3 identifier];
    v8[1] = v5;
    id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  }
  return v4;
}

+ (id)payloadForAvatarRecordIdentifier:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F29640] animojiNames];
  char v5 = [v4 containsObject:v3];

  if (v5)
  {
    v12[0] = @"recordType";
    v12[1] = @"animojiName";
    v13[0] = @"animoji";
    v13[1] = v3;
    v6 = NSDictionary;
    v7 = v13;
    id v8 = (__CFString **)v12;
    uint64_t v9 = 2;
  }
  else
  {
    v14 = @"recordType";
    v15[0] = @"memoji";
    v6 = NSDictionary;
    v7 = v15;
    id v8 = &v14;
    uint64_t v9 = 1;
  }
  v10 = [v6 dictionaryWithObjects:v7 forKeys:v8 count:v9];

  return v10;
}

+ (void)getPresetDescription:(id *)a3 usedCategoriesDescription:(id *)a4 forAvatarConfiguration:(id)a5 defaultConfiguration:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  v11 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  v12 = [v9 presetConfigurationPresets];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __118__AVTUsageTrackingSession_getPresetDescription_usedCategoriesDescription_forAvatarConfiguration_defaultConfiguration___block_invoke;
  v18 = &unk_263FF1E40;
  id v13 = v10;
  v22 = &v23;
  id v19 = v13;
  id v20 = &unk_26BF4D600;
  id v14 = v11;
  id v21 = v14;
  [v12 enumerateObjectsUsingBlock:&v15];

  *a3 = (id)objc_msgSend(v14, "copy", v15, v16, v17, v18);
  *a4 = [NSNumber numberWithUnsignedLongLong:v24[3]];

  _Block_object_dispose(&v23, 8);
}

void __118__AVTUsageTrackingSession_getPresetDescription_usedCategoriesDescription_forAvatarConfiguration_defaultConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v23 = a2;
  id v3 = *(void **)(a1 + 32);
  [v23 settingKind];
  char v5 = [v3 presetForCategory:v4];
  uint64_t v6 = [v5 identifier];

  v7 = [v23 preset];
  uint64_t v8 = [v7 identifier];
  if (!(v8 | v6)) {
    goto LABEL_4;
  }
  id v9 = (void *)v8;
  id v10 = [v23 preset];
  v11 = [v10 identifier];
  if ([v11 isEqual:v6])
  {

LABEL_4:
    int v12 = 0;
    id v13 = v23;
    goto LABEL_5;
  }
  char v21 = [v23 isDefaultPreset];

  id v13 = v23;
  if (v21)
  {
    int v12 = 0;
  }
  else
  {
    [v23 settingKind];
    id v13 = v23;
    int v12 = 1;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= 1 << v22;
  }
LABEL_5:
  id v14 = *(void **)(a1 + 40);
  uint64_t v15 = NSNumber;
  [v13 settingKind];
  v17 = [v15 numberWithInteger:v16];
  LODWORD(v14) = [v14 containsObject:v17];

  if (v14)
  {
    [v23 settingKind];
    v18 = AVTPresetCategoryToString();
    if (v12)
    {
      id v19 = [v23 preset];
      id v20 = [v19 identifier];
    }
    else
    {
      id v20 = @"none";
    }
    [*(id *)(a1 + 48) setObject:v20 forKeyedSubscript:v18];
  }
}

+ (id)colorPresetDescriptionForAvatarConfiguration:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  char v5 = [v3 dictionary];
  uint64_t v6 = [v4 colorConfigurationPresets];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __72__AVTUsageTrackingSession_colorPresetDescriptionForAvatarConfiguration___block_invoke;
  v10[3] = &unk_263FF1E68;
  id v11 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v10];

  uint64_t v8 = (void *)[v7 copy];
  return v8;
}

void __72__AVTUsageTrackingSession_colorPresetDescriptionForAvatarConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v18 = a2;
  id v3 = [v18 preset];
  id v4 = [v3 color];
  char v5 = [v4 identifier];
  if ([v5 isEqual:@"none"])
  {
  }
  else
  {
    char v6 = [v18 isDefaultPreset];

    if (v6) {
      goto LABEL_11;
    }
    uint64_t v7 = [v18 settingKind];
    uint64_t v8 = @"c";
    if (v7 == 3) {
      uint64_t v8 = @"ct";
    }
    if (v7 == 2) {
      id v9 = @"cs";
    }
    else {
      id v9 = v8;
    }
    [v18 settingKind];
    uint64_t v11 = v10;
    int v12 = [v18 preset];
    id v13 = [v12 color];
    id v14 = [v13 identifier];
    id v3 = [(__CFString *)v9 stringByAppendingFormat:@"%ld_%@", v11, v14];

    uint64_t v15 = NSNumber;
    uint64_t v16 = [v18 preset];
    v17 = [v16 colorPreset];
    [v17 variation];
    id v4 = objc_msgSend(v15, "numberWithFloat:");

    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
  }

LABEL_11:
}

+ (id)dpKeyBasePrefix
{
  return @"com.apple.avatar.";
}

+ (id)keyBasePrefixForBundleIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.Jellyfish.Animoji"])
  {
    id v4 = @"com.apple.Animoji.Analytics.AnimojiApp.";
  }
  else if (([v3 isEqualToString:@"com.apple.Animoji.StickersApp.MessagesExtension"] & 1) != 0 {
         || ([v3 isEqualToString:@"com.apple.Stickers.UserGenerated.MessagesExtension"] & 1) != 0
  }
         || ([v3 isEqualToString:@"com.apple.iMessageAppsViewService"] & 1) != 0)
  {
    id v4 = @"com.apple.Animoji.Analytics.StickersApp.";
  }
  else if ([v3 isEqualToString:@"com.apple.camera.CameraMessagesApp"])
  {
    id v4 = @"com.apple.Animoji.Analytics.FunCamApp.";
  }
  else
  {
    id v4 = @"com.apple.Animoji.Analytics.AnyApp.";
  }

  return v4;
}

+ (id)allowListAppNameFromBundleID:(id)a3
{
  id v3 = a3;
  if (allowListAppNameFromBundleID__onceToken != -1) {
    dispatch_once(&allowListAppNameFromBundleID__onceToken, &__block_literal_global_122);
  }
  id v4 = [(id)allowListAppNameFromBundleID__bundleIDMapping objectForKeyedSubscript:v3];
  char v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(id)allowListAppNameFromBundleID__bundleIDMapping objectForKeyedSubscript:@"*"];
  }
  uint64_t v7 = v6;

  return v7;
}

void __56__AVTUsageTrackingSession_allowListAppNameFromBundleID___block_invoke()
{
  v0 = (void *)allowListAppNameFromBundleID__bundleIDMapping;
  allowListAppNameFromBundleID__bundleIDMapping = (uint64_t)&unk_26BF4D670;
}

+ (id)makeKeyAnalyticsCompliant:(id)a3
{
  return (id)[a3 stringByReplacingOccurrencesOfString:@" " withString:@"_"];
}

+ (id)makeDPKey:(id)a3
{
  id v4 = a3;
  char v5 = [a1 dpKeyBasePrefix];
  id v6 = [v5 stringByAppendingString:v4];

  return v6;
}

+ (id)configurationDistanceClassifierWithMetric:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __69__AVTUsageTrackingSession_configurationDistanceClassifierWithMetric___block_invoke;
  v7[3] = &unk_263FF1E90;
  id v8 = v3;
  id v4 = v3;
  char v5 = (void *)MEMORY[0x210530210](v7);

  return v5;
}

uint64_t __69__AVTUsageTrackingSession_configurationDistanceClassifierWithMetric___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [*(id *)(a1 + 32) distanceFromConfiguration:a2 toConfiguration:a3];
  char v5 = NSNumber;
  uint64_t v6 = [*(id *)(a1 + 32) gapFromDistance:v4];
  return [v5 numberWithInteger:v6];
}

+ (id)likenessComparator
{
  return &__block_literal_global_262;
}

uint64_t __45__AVTUsageTrackingSession_likenessComparator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (AVTUsageTrackingSession)initWithSerialQueueProvider:(id)a3 recordTransformer:(id)a4 logger:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_alloc_init(AVTCoreAnalyticsClient);
  char v21 = objc_alloc_init(AVTDifferentialPrivacyRecorder);
  id v20 = [MEMORY[0x263F29728] defaultAvatarRecord];
  id v18 = +[AVTAvatarConfigurationMetric defaultMetric];
  int v12 = [MEMORY[0x263F086E0] mainBundle];
  id v13 = [v12 bundleIdentifier];

  id v14 = [(id)objc_opt_class() keyBasePrefixForBundleIdentifier:v13];
  uint64_t v15 = [(id)objc_opt_class() allowListAppNameFromBundleID:v13];
  uint64_t v16 = [(id)objc_opt_class() defaultTimeProvider];
  id v19 = [(AVTUsageTrackingSession *)self initWithCoreAnalyticsClient:v11 dpRecorder:v21 serialQueueProvider:v10 recordTransformer:v9 avatarRecord:v20 defaultConfiguration:0 timeProvider:v16 configurationMetric:v18 logger:v8 keyBasePrefix:v14 bundleAppName:v15];

  return v19;
}

- (AVTUsageTrackingSession)initWithCoreAnalyticsClient:(id)a3 dpRecorder:(id)a4 serialQueueProvider:(id)a5 recordTransformer:(id)a6 avatarRecord:(id)a7 defaultConfiguration:(id)a8 timeProvider:(id)a9 configurationMetric:(id)a10 logger:(id)a11 keyBasePrefix:(id)a12 bundleAppName:(id)a13
{
  id v39 = a3;
  id v34 = a4;
  id v38 = a4;
  id v18 = (void (**)(id, const char *))a5;
  id v40 = a6;
  id v19 = a8;
  id v37 = a7;
  id v36 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  id v24 = a13;
  v41.receiver = self;
  v41.super_class = (Class)AVTUsageTrackingSession;
  uint64_t v25 = [(AVTUsageTrackingSession *)&v41 init];
  if (v25)
  {
    uint64_t v26 = v18[2](v18, "com.apple.AvatarUI.AVTUsageTrackingSession.workQueue");
    workQueue = v25->_workQueue;
    v25->_workQueue = (OS_dispatch_queue *)v26;

    objc_storeStrong((id *)&v25->_ntsCAClient, a3);
    objc_storeStrong((id *)&v25->_ntsDPRecorder, v34);
    uint64_t v28 = [v40 copy];
    id recordTransformer = v25->_recordTransformer;
    v25->_id recordTransformer = (id)v28;

    uint64_t v30 = [v20 copy];
    id timeProvider = v25->_timeProvider;
    v25->_id timeProvider = (id)v30;

    objc_storeStrong((id *)&v25->_defaultConfiguration, v19);
    objc_storeStrong((id *)&v25->_avatarRecord, a7);
    objc_storeStrong((id *)&v25->_metric, a10);
    objc_storeStrong((id *)&v25->_logger, a11);
    objc_storeStrong((id *)&v25->_keyBasePrefix, a12);
    objc_storeStrong((id *)&v25->_bundleAppName, a13);
  }

  return v25;
}

- (void)performClientWork:(id)a3
{
  id v4 = a3;
  char v5 = [(AVTUsageTrackingSession *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __45__AVTUsageTrackingSession_performClientWork___block_invoke;
  v7[3] = &unk_263FF02C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __45__AVTUsageTrackingSession_performClientWork___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) ntsCAClient];
  id v3 = [*(id *)(a1 + 32) ntsDPRecorder];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (id)makeEventKeyForAction:(id)a3
{
  id v4 = a3;
  char v5 = [(AVTUsageTrackingSession *)self keyBasePrefix];
  id v6 = [v5 stringByAppendingString:v4];

  uint64_t v7 = [(id)objc_opt_class() makeKeyAnalyticsCompliant:v6];

  return v7;
}

- (id)makeCrossAppEventKeyForAction:(id)a3
{
  id v3 = [@"com.apple.Animoji.Analytics.AnyApp." stringByAppendingString:a3];
  id v4 = [(id)objc_opt_class() makeKeyAnalyticsCompliant:v3];

  return v4;
}

- (void)sendEventForAction:(id)a3
{
  id v4 = [(AVTUsageTrackingSession *)self makeEventKeyForAction:a3];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__AVTUsageTrackingSession_sendEventForAction___block_invoke;
  v6[3] = &unk_263FF1ED8;
  id v7 = v4;
  id v5 = v4;
  [(AVTUsageTrackingSession *)self performClientWork:v6];
}

uint64_t __46__AVTUsageTrackingSession_sendEventForAction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sendEventForKey:*(void *)(a1 + 32) payload:0];
}

- (id)payloadForCrossAppEvent
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = @"appName";
  uint64_t v2 = [(AVTUsageTrackingSession *)self bundleAppName];
  v6[0] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (void)sendCrossAppsEventForAction:(id)a3
{
  id v4 = [(AVTUsageTrackingSession *)self makeCrossAppEventKeyForAction:a3];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __55__AVTUsageTrackingSession_sendCrossAppsEventForAction___block_invoke;
  v6[3] = &unk_263FF1F00;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(AVTUsageTrackingSession *)self performClientWork:v6];
}

void __55__AVTUsageTrackingSession_sendCrossAppsEventForAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 payloadForCrossAppEvent];
  [v4 sendEventForKey:v2 payload:v5];
}

- (void)didSendVideoWithAvatar:(id)a3 duration:(double)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __59__AVTUsageTrackingSession_didSendVideoWithAvatar_duration___block_invoke;
  v8[3] = &unk_263FF1F28;
  v8[4] = self;
  id v9 = v6;
  double v10 = a4;
  id v7 = v6;
  [(AVTUsageTrackingSession *)self performClientWork:v8];
  [(AVTUsageTrackingSession *)self didResumeFaceTracking];
}

void __59__AVTUsageTrackingSession_didSendVideoWithAvatar_duration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 setRecordedVideo:0];
  id v7 = [*(id *)(a1 + 32) makeEventKeyForAction:@"VideoSent"];
  id v8 = [(id)objc_opt_class() payloadForAvatarRecord:*(void *)(a1 + 40)];
  id v9 = (void *)[v8 mutableCopy];

  double v10 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  [v9 setObject:v10 forKeyedSubscript:@"duration"];

  [v6 sendEventForKey:v7 payload:v9];
  if ([*(id *)(a1 + 40) isEditable]) {
    objc_msgSend(*(id *)(a1 + 32), "nts_reportAvatarDescription:dpRecorder:", *(void *)(a1 + 40), v11);
  }
}

- (void)didDiscardVideoWithDuration:(double)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__AVTUsageTrackingSession_didDiscardVideoWithDuration___block_invoke;
  v4[3] = &unk_263FF1F50;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  [(AVTUsageTrackingSession *)self performClientWork:v4];
  [(AVTUsageTrackingSession *)self didResumeFaceTracking];
}

void __55__AVTUsageTrackingSession_didDiscardVideoWithDuration___block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setRecordedVideo:0];
  id v5 = [*(id *)(a1 + 32) makeEventKeyForAction:@"VideoDiscarded"];
  id v8 = @"duration";
  id v6 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v9[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v4 sendEventForKey:v5 payload:v7];
}

- (void)didReplayVideo
{
}

- (void)didSendImageWithAvatar:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __50__AVTUsageTrackingSession_didSendImageWithAvatar___block_invoke;
  v6[3] = &unk_263FF1F00;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AVTUsageTrackingSession *)self performClientWork:v6];
}

void __50__AVTUsageTrackingSession_didSendImageWithAvatar___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 makeEventKeyForAction:@"StickerSent"];
  id v8 = [(id)objc_opt_class() payloadForAvatarRecord:*(void *)(a1 + 40)];
  id v9 = (void *)[v8 mutableCopy];

  [v9 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"peeled"];
  [v6 sendEventForKey:v7 payload:v9];

  if ([*(id *)(a1 + 40) isEditable]) {
    objc_msgSend(*(id *)(a1 + 32), "nts_reportAvatarDescription:dpRecorder:", *(void *)(a1 + 40), v10);
  }
}

- (void)didSendStickerWithAvatar:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __52__AVTUsageTrackingSession_didSendStickerWithAvatar___block_invoke;
  v6[3] = &unk_263FF1F00;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AVTUsageTrackingSession *)self performClientWork:v6];
}

void __52__AVTUsageTrackingSession_didSendStickerWithAvatar___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 makeEventKeyForAction:@"StickerSent"];
  id v8 = [(id)objc_opt_class() payloadForAvatarRecord:*(void *)(a1 + 40)];
  id v9 = (void *)[v8 mutableCopy];

  [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"peeled"];
  [v6 sendEventForKey:v7 payload:v9];

  if ([*(id *)(a1 + 40) isEditable]) {
    objc_msgSend(*(id *)(a1 + 32), "nts_reportAvatarDescription:dpRecorder:", *(void *)(a1 + 40), v10);
  }
}

- (void)didDeleteAvatar:(id)a3
{
  if ([a3 isEditable])
  {
    [(AVTUsageTrackingSession *)self sendCrossAppsEventForAction:@"MemojiDeleted"];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __43__AVTUsageTrackingSession_didDeleteAvatar___block_invoke;
    v4[3] = &unk_263FF1ED8;
    v4[4] = self;
    [(AVTUsageTrackingSession *)self performClientWork:v4];
  }
}

uint64_t __43__AVTUsageTrackingSession_didDeleteAvatar___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_reportAvatarLikenessClustersWithClient:", a2);
}

- (void)didCreateAvatar:(id)a3
{
  id v4 = a3;
  if ([v4 isEditable])
  {
    [(AVTUsageTrackingSession *)self sendCrossAppsEventForAction:@"MemojiCreated"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v4 format];
    }
    id v5 = v4;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    void v6[2] = __43__AVTUsageTrackingSession_didCreateAvatar___block_invoke;
    v6[3] = &unk_263FF1F00;
    void v6[4] = self;
    id v7 = v5;
    [(AVTUsageTrackingSession *)self performClientWork:v6];
  }
}

void __43__AVTUsageTrackingSession_didCreateAvatar___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a2;
  objc_msgSend(v5, "nts_reportAvatarDescription:dpRecorder:", v6, a3);
  objc_msgSend(*(id *)(a1 + 32), "nts_reportAvatarComplexity:withClient:", *(void *)(a1 + 40), v7);
  objc_msgSend(*(id *)(a1 + 32), "nts_reportAvatarLikenessClustersWithClient:", v7);
}

- (void)didEditAvatar:(id)a3
{
  id v4 = a3;
  if ([v4 isEditable])
  {
    [(AVTUsageTrackingSession *)self sendCrossAppsEventForAction:@"MemojiEdited"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v4 format];
    }
    id v5 = v4;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    void v6[2] = __41__AVTUsageTrackingSession_didEditAvatar___block_invoke;
    v6[3] = &unk_263FF1F00;
    void v6[4] = self;
    id v7 = v5;
    [(AVTUsageTrackingSession *)self performClientWork:v6];
  }
}

void __41__AVTUsageTrackingSession_didEditAvatar___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a2;
  objc_msgSend(v5, "nts_reportAvatarDescription:dpRecorder:", v6, a3);
  objc_msgSend(*(id *)(a1 + 32), "nts_reportAvatarComplexity:withClient:", *(void *)(a1 + 40), v7);
  objc_msgSend(*(id *)(a1 + 32), "nts_reportAvatarLikenessClustersWithClient:", v7);
}

- (void)didDuplicateAvatar:(id)a3
{
  if ([a3 isEditable])
  {
    [(AVTUsageTrackingSession *)self sendCrossAppsEventForAction:@"MemojiDuplicated"];
  }
}

- (void)didShowExpandedMode
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __46__AVTUsageTrackingSession_didShowExpandedMode__block_invoke;
  v2[3] = &unk_263FF1ED8;
  v2[4] = self;
  [(AVTUsageTrackingSession *)self performClientWork:v2];
}

uint64_t __46__AVTUsageTrackingSession_didShowExpandedMode__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setExpandedMode:1];
}

- (void)didRecordVideo
{
  [(AVTUsageTrackingSession *)self didPauseFaceTracking];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__AVTUsageTrackingSession_didRecordVideo__block_invoke;
  v3[3] = &unk_263FF1ED8;
  v3[4] = self;
  [(AVTUsageTrackingSession *)self performClientWork:v3];
}

uint64_t __41__AVTUsageTrackingSession_didRecordVideo__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRecordedVideo:1];
}

- (void)didEnterEditor
{
  id v3 = [(AVTUsageTrackingSession *)self timeProvider];
  id v4 = v3[2]();

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __41__AVTUsageTrackingSession_didEnterEditor__block_invoke;
  v6[3] = &unk_263FF1F00;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AVTUsageTrackingSession *)self performClientWork:v6];
}

uint64_t __41__AVTUsageTrackingSession_didEnterEditor__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEditorEnterDate:*(void *)(a1 + 40)];
}

- (void)didLeaveEditor
{
  id v3 = [(AVTUsageTrackingSession *)self timeProvider];
  id v4 = v3[2]();

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __41__AVTUsageTrackingSession_didLeaveEditor__block_invoke;
  v6[3] = &unk_263FF1F00;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AVTUsageTrackingSession *)self performClientWork:v6];
}

void __41__AVTUsageTrackingSession_didLeaveEditor__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) editorEnterDate];

  if (v3) {
    objc_msgSend(*(id *)(a1 + 32), "nts_reportEditorTimeWithExitTime:client:", *(void *)(a1 + 40), v4);
  }
}

- (void)didStartFaceTrackingInCarouselWithAvatar:(id)a3
{
  id v4 = a3;
  id v5 = [AVTUsageTrackingRecordTimedEvent alloc];
  uint64_t v6 = [(AVTUsageTrackingSession *)self timeProvider];
  id v7 = v6[2]();
  id v8 = [(AVTUsageTrackingRecordTimedEvent *)v5 initWithStartTime:v7 record:v4];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __68__AVTUsageTrackingSession_didStartFaceTrackingInCarouselWithAvatar___block_invoke;
  v10[3] = &unk_263FF1F00;
  void v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(AVTUsageTrackingSession *)self performClientWork:v10];
}

uint64_t __68__AVTUsageTrackingSession_didStartFaceTrackingInCarouselWithAvatar___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFaceTrackingEvent:*(void *)(a1 + 40)];
}

- (void)didChangeCurrentAvatarInCarousel:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTUsageTrackingSession *)self timeProvider];
  uint64_t v6 = v5[2]();

  id v7 = [[AVTUsageTrackingRecordTimedEvent alloc] initWithStartTime:v6 record:v4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __60__AVTUsageTrackingSession_didChangeCurrentAvatarInCarousel___block_invoke;
  v10[3] = &unk_263FF1F78;
  void v10[4] = self;
  id v11 = v6;
  int v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(AVTUsageTrackingSession *)self performClientWork:v10];
}

void __60__AVTUsageTrackingSession_didChangeCurrentAvatarInCarousel___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) faceTrackingEvent];

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "nts_reportFaceTrackingTimeWithEndTime:client:", *(void *)(a1 + 40), v6);
    [*(id *)(a1 + 32) setFaceTrackingEvent:*(void *)(a1 + 48)];
    if ([*(id *)(a1 + 32) recordedVideo])
    {
      id v4 = [*(id *)(a1 + 32) faceTrackingEvent];
      [v4 pauseAtTime:*(void *)(a1 + 40)];
    }
  }
  if ([*(id *)(a1 + 32) recordedVideo])
  {
    id v5 = [*(id *)(a1 + 32) makeEventKeyForAction:@"SwitchVideoAvatar"];
    [v6 sendEventForKey:v5 payload:0];
  }
}

- (void)didStopFaceTrackingInCarousel
{
  id v3 = [(AVTUsageTrackingSession *)self timeProvider];
  id v4 = v3[2]();

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __56__AVTUsageTrackingSession_didStopFaceTrackingInCarousel__block_invoke;
  v6[3] = &unk_263FF1F00;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AVTUsageTrackingSession *)self performClientWork:v6];
}

void __56__AVTUsageTrackingSession_didStopFaceTrackingInCarousel__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) faceTrackingEvent];

  if (v3) {
    objc_msgSend(*(id *)(a1 + 32), "nts_reportFaceTrackingTimeWithEndTime:client:", *(void *)(a1 + 40), v4);
  }
}

- (void)didPauseFaceTracking
{
  id v3 = [(AVTUsageTrackingSession *)self timeProvider];
  id v4 = v3[2]();

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __47__AVTUsageTrackingSession_didPauseFaceTracking__block_invoke;
  v6[3] = &unk_263FF1F00;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AVTUsageTrackingSession *)self performClientWork:v6];
}

void __47__AVTUsageTrackingSession_didPauseFaceTracking__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) faceTrackingEvent];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) faceTrackingEvent];
    [v3 pauseAtTime:*(void *)(a1 + 40)];
  }
}

- (void)didResumeFaceTracking
{
  id v3 = [(AVTUsageTrackingSession *)self timeProvider];
  id v4 = v3[2]();

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __48__AVTUsageTrackingSession_didResumeFaceTracking__block_invoke;
  v6[3] = &unk_263FF1F00;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AVTUsageTrackingSession *)self performClientWork:v6];
}

void __48__AVTUsageTrackingSession_didResumeFaceTracking__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) faceTrackingEvent];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) faceTrackingEvent];
    [v3 resumeAtTime:*(void *)(a1 + 40)];
  }
}

- (void)didSelectStickerFromStickersApp:(id)a3 withAvatar:(id)a4
{
  id v6 = (void *)MEMORY[0x263F086E0];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 mainBundle];
  id v10 = [v9 bundleIdentifier];

  [(AVTUsageTrackingSession *)self didSelectStickerFromStickersApp:v8 withAvatar:v7 bundleIdentifier:v10];
}

- (void)didSelectStickerFromStickersApp:(id)a3 withAvatar:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(id)objc_opt_class() allowListAppNameFromBundleID:v8];

  [(AVTUsageTrackingSession *)self sentStickerFromStickersApp:v10 withAvatarRecord:v9 action:@"StickerSent" appName:v11];
}

- (void)didChangeCurrentAvatarInStickers:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__AVTUsageTrackingSession_didChangeCurrentAvatarInStickers___block_invoke;
  v3[3] = &unk_263FF1ED8;
  v3[4] = self;
  [(AVTUsageTrackingSession *)self performClientWork:v3];
}

void __60__AVTUsageTrackingSession_didChangeCurrentAvatarInStickers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 makeEventKeyForAction:@"SwitchStickersAvatar"];
  [v3 sendEventForKey:v4 payload:0];
}

- (void)didTapStickerFromRecents:(id)a3 withAvatarIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __73__AVTUsageTrackingSession_didTapStickerFromRecents_withAvatarIdentifier___block_invoke;
  v10[3] = &unk_263FF1F78;
  void v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(AVTUsageTrackingSession *)self performClientWork:v10];
}

void __73__AVTUsageTrackingSession_didTapStickerFromRecents_withAvatarIdentifier___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v7 = [v3 makeEventKeyForAction:@"StickerRecentSent"];
  id v5 = [(id)objc_opt_class() payloadForAvatarRecordIdentifier:a1[5]];
  id v6 = (void *)[v5 mutableCopy];

  [v6 setObject:a1[6] forKeyedSubscript:@"sticker"];
  [v4 sendEventForKey:v7 payload:v6];
}

- (void)didOpenStickersAppFromRecents
{
}

- (void)sentStickerFromStickersApp:(id)a3 withAvatarRecord:(id)a4 action:(id)a5 appName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __86__AVTUsageTrackingSession_sentStickerFromStickersApp_withAvatarRecord_action_appName___block_invoke;
  v18[3] = &unk_263FF1FA0;
  v18[4] = self;
  id v19 = v12;
  id v20 = v11;
  id v21 = v10;
  id v22 = v13;
  id v14 = v13;
  id v15 = v10;
  id v16 = v11;
  id v17 = v12;
  [(AVTUsageTrackingSession *)self performClientWork:v18];
}

void __86__AVTUsageTrackingSession_sentStickerFromStickersApp_withAvatarRecord_action_appName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a2;
  id v8 = [v5 makeEventKeyForAction:v6];
  id v9 = [(id)objc_opt_class() payloadForAvatarRecord:*(void *)(a1 + 48)];
  id v10 = (void *)[v9 mutableCopy];

  [v10 setObject:*(void *)(a1 + 56) forKeyedSubscript:@"sticker"];
  [v10 setObject:*(void *)(a1 + 64) forKeyedSubscript:@"appName"];
  [v7 sendEventForKey:v8 payload:v10];

  if ([*(id *)(a1 + 48) isEditable]) {
    objc_msgSend(*(id *)(a1 + 32), "nts_reportAvatarDescription:dpRecorder:", *(void *)(a1 + 48), v11);
  }
}

- (void)beginWithStore:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __42__AVTUsageTrackingSession_beginWithStore___block_invoke;
  v6[3] = &unk_263FF1F00;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(AVTUsageTrackingSession *)self performClientWork:v6];
}

uint64_t __42__AVTUsageTrackingSession_beginWithStore___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) conformsToProtocol:&unk_26BF84E80] & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object protocol for %@", *(void *)(a1 + 32) format];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 setAvatarStore:v3];
}

- (void)end
{
  uint64_t v3 = [(AVTUsageTrackingSession *)self timeProvider];
  id v4 = v3[2]();

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __30__AVTUsageTrackingSession_end__block_invoke;
  v6[3] = &unk_263FF1F00;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AVTUsageTrackingSession *)self performClientWork:v6];
}

void __30__AVTUsageTrackingSession_end__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) avatarStore];

  if (!v3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Session not started with a store"];
  }
  [*(id *)(a1 + 32) setRecordedVideo:0];
  objc_msgSend(*(id *)(a1 + 32), "nts_reportAvatarCountWithClient:", v6);
  objc_msgSend(*(id *)(a1 + 32), "nts_reportExpandedModeWithClient:", v6);
  id v4 = [*(id *)(a1 + 32) editorEnterDate];

  if (v4) {
    objc_msgSend(*(id *)(a1 + 32), "nts_reportEditorTimeWithExitTime:client:", *(void *)(a1 + 40), v6);
  }
  id v5 = [*(id *)(a1 + 32) faceTrackingEvent];

  if (v5) {
    objc_msgSend(*(id *)(a1 + 32), "nts_reportFaceTrackingTimeWithEndTime:client:", *(void *)(a1 + 40), v6);
  }
}

- (void)nts_loadDefaultConfigurationIfNeeded
{
  avatarRecord = [(AVTUsageTrackingSession *)self defaultConfiguration];
  if (!avatarRecord)
  {
    id v4 = [(AVTUsageTrackingSession *)self avatarRecord];

    if (!v4) {
      return;
    }
    id v5 = [(AVTUsageTrackingSession *)self recordTransformer];
    id v6 = [(AVTUsageTrackingSession *)self avatarRecord];
    ((void (**)(void, void *))v5)[2](v5, v6);
    id v7 = (AVTAvatarConfiguration *)objc_claimAutoreleasedReturnValue();
    defaultConfiguration = self->_defaultConfiguration;
    self->_defaultConfiguration = v7;

    avatarRecord = self->_avatarRecord;
    self->_avatarRecord = 0;
  }
}

- (void)nts_reportEditorTimeWithExitTime:(id)a3 client:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AVTUsageTrackingSession *)self editorEnterDate];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  [(AVTUsageTrackingSession *)self setEditorEnterDate:0];
  id v14 = [(AVTUsageTrackingSession *)self makeCrossAppEventKeyForAction:@"EditorTime"];
  id v11 = [(AVTUsageTrackingSession *)self payloadForCrossAppEvent];
  id v12 = (void *)[v11 mutableCopy];

  id v13 = [NSNumber numberWithDouble:v10];
  [v12 setObject:v13 forKeyedSubscript:@"time"];

  [v6 sendEventForKey:v14 payload:v12];
}

- (void)nts_reportFaceTrackingTimeWithEndTime:(id)a3 client:(id)a4
{
  id v18 = a4;
  id v6 = a3;
  id v7 = [(AVTUsageTrackingSession *)self faceTrackingEvent];
  [v7 totalElapsedTimeAtTime:v6];
  double v9 = v8;

  double v10 = [(AVTUsageTrackingSession *)self faceTrackingEvent];
  id v11 = [v10 record];

  [(AVTUsageTrackingSession *)self setFaceTrackingEvent:0];
  id v12 = [(AVTUsageTrackingSession *)self makeEventKeyForAction:@"FaceTrackingTime"];
  id v13 = [(id)objc_opt_class() payloadForAvatarRecord:v11];
  id v14 = (void *)[v13 mutableCopy];

  id v15 = [NSNumber numberWithDouble:v9];
  [v14 setObject:v15 forKeyedSubscript:@"time"];

  [v18 sendEventForKey:v12 payload:v14];
  if (v9 > 30.0)
  {
    id v16 = [(AVTUsageTrackingSession *)self makeEventKeyForAction:@"FaceTrackingMoreThan30s"];
    id v17 = [(id)objc_opt_class() payloadForAvatarRecord:v11];
    [v18 sendEventForKey:v16 payload:v17];
  }
}

- (void)nts_reportAvatarCountWithClient:(id)a3
{
  id v13 = a3;
  id v4 = [(AVTUsageTrackingSession *)self avatarStore];
  id v5 = [MEMORY[0x263F29718] requestForCustomAvatars];
  id v6 = [v4 avatarsForFetchRequest:v5 error:0];

  if (v6)
  {
    uint64_t v7 = [v6 count];
    double v8 = [(AVTUsageTrackingSession *)self logger];
    [v8 logUsageTrackingRecordCount:v7];

    double v9 = [(AVTUsageTrackingSession *)self makeCrossAppEventKeyForAction:@"MemojiCount"];
    double v10 = [(AVTUsageTrackingSession *)self payloadForCrossAppEvent];
    id v11 = (void *)[v10 mutableCopy];

    id v12 = [NSNumber numberWithUnsignedInteger:v7];
    [v11 setObject:v12 forKeyedSubscript:@"memojiCount"];

    [v13 sendEventForKey:v9 payload:v11];
  }
}

- (void)nts_reportAvatarDescription:(id)a3 dpRecorder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v6 format];
  }
  id v8 = v6;
  double v9 = [(AVTUsageTrackingSession *)self recordTransformer];
  double v10 = ((void (**)(void, id))v9)[2](v9, v8);

  [(AVTUsageTrackingSession *)self nts_loadDefaultConfigurationIfNeeded];
  id v11 = objc_opt_class();
  id v21 = 0;
  id v22 = 0;
  id v12 = [(AVTUsageTrackingSession *)self defaultConfiguration];
  [v11 getPresetDescription:&v22 usedCategoriesDescription:&v21 forAvatarConfiguration:v10 defaultConfiguration:v12];
  id v13 = v22;
  id v14 = v21;
  id v15 = v13;

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __66__AVTUsageTrackingSession_nts_reportAvatarDescription_dpRecorder___block_invoke;
  v19[3] = &unk_263FF1FC8;
  v19[4] = self;
  id v20 = v7;
  id v16 = v7;
  [v15 enumerateKeysAndObjectsUsingBlock:v19];
  id v17 = [v14 stringValue];
  id v18 = [(id)objc_opt_class() makeDPKey:@"MemojiCategoryUsed"];
  [v16 recordString:v17 forKey:v18];
}

void __66__AVTUsageTrackingSession_nts_reportAvatarDescription_dpRecorder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_opt_class();
  id v8 = [@"MemojiAssetUsed." stringByAppendingString:v6];

  id v9 = [v7 makeDPKey:v8];

  [*(id *)(a1 + 40) recordString:v5 forKey:v9];
}

- (void)nts_reportAvatarLikenessClustersWithClient:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self;
  id v6 = [(AVTUsageTrackingSession *)self avatarStore];
  id v7 = [MEMORY[0x263F29718] requestForCustomAvatars];
  id v8 = [v6 avatarsForFetchRequest:v7 error:0];

  if ([v8 count])
  {
    id v37 = v4;
    id v9 = [MEMORY[0x263EFF980] array];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v36 = v8;
    id obj = v8;
    uint64_t v10 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v42 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          id v15 = (void *)MEMORY[0x21052FFD0]();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v14 format];
          }
          id v16 = v14;
          id v17 = [(AVTUsageTrackingSession *)v5 recordTransformer];
          id v18 = ((void (**)(void, id))v17)[2](v17, v16);

          [v9 addObject:v18];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v11);
    }

    id v19 = v5;
    id v20 = objc_opt_class();
    id v21 = [(AVTUsageTrackingSession *)v5 metric];
    id v22 = [v20 configurationDistanceClassifierWithMetric:v21];

    id v23 = [(id)objc_opt_class() likenessComparator];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __70__AVTUsageTrackingSession_nts_reportAvatarLikenessClustersWithClient___block_invoke;
    v39[3] = &unk_263FF1FF0;
    id v40 = obj;
    id v24 = (double (**)(void, void))MEMORY[0x210530210](v39);
    uint64_t v25 = +[AVTArrayPairClassification clustersForObjectsInArray:v9 withClassifier:v22 likenessThreshold:&unk_26BF4D430 likenessComparator:v23];
    uint64_t v26 = +[AVTArrayPairClassification clustersForObjectsInArray:v9 withClassifier:v22 likenessThreshold:&unk_26BF4D448 likenessComparator:v23];
    v27 = [(AVTUsageTrackingSession *)v19 logger];
    objc_msgSend(v27, "logUsageTrackingSmallDifferencesClusterCount:", objc_msgSend(v25, "count"));

    uint64_t v28 = [(AVTUsageTrackingSession *)v19 logger];
    objc_msgSend(v28, "logUsageTrackingBigDifferencesClusterCount:", objc_msgSend(v26, "count"));

    double v29 = ((double (**)(void, void *))v24)[2](v24, v25);
    double v30 = ((double (**)(void, void *))v24)[2](v24, v26);
    v31 = [(AVTUsageTrackingSession *)v19 makeCrossAppEventKeyForAction:@"MemojiDifferences"];
    v32 = [(AVTUsageTrackingSession *)v19 payloadForCrossAppEvent];
    v33 = (void *)[v32 mutableCopy];

    id v34 = [NSNumber numberWithDouble:v29];
    [v33 setObject:v34 forKeyedSubscript:@"smallDifferenceRatio"];

    v35 = [NSNumber numberWithDouble:v30];
    [v33 setObject:v35 forKeyedSubscript:@"bigDifferenceRatio"];

    id v4 = v37;
    [v37 sendEventForKey:v31 payload:v33];

    id v8 = v36;
  }
}

double __70__AVTUsageTrackingSession_nts_reportAvatarLikenessClustersWithClient___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 count]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Can't have 0 cluster if we have records"];
  }
  double v4 = (double)(unint64_t)[v3 count] + -1.0;
  double v5 = 1.0 - v4 / (double)(unint64_t)[*(id *)(a1 + 32) count];

  return v5;
}

- (void)nts_reportAvatarComplexity:(id)a3 withClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AVTUsageTrackingSession *)self nts_loadDefaultConfigurationIfNeeded];
  id v8 = [(AVTUsageTrackingSession *)self recordTransformer];
  ((void (**)(void, id))v8)[2](v8, v7);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = [(AVTUsageTrackingSession *)self metric];
  uint64_t v10 = [(AVTUsageTrackingSession *)self defaultConfiguration];
  uint64_t v11 = [v9 distanceFromConfiguration:v10 toConfiguration:v18];

  uint64_t v12 = [(AVTUsageTrackingSession *)self metric];
  uint64_t v13 = [v12 differenceCountFromDistance:v11];

  id v14 = [(AVTUsageTrackingSession *)self makeCrossAppEventKeyForAction:@"MemojiComplexity"];
  id v15 = [(AVTUsageTrackingSession *)self payloadForCrossAppEvent];
  id v16 = (void *)[v15 mutableCopy];

  id v17 = [NSNumber numberWithUnsignedInteger:v13];
  [v16 setObject:v17 forKeyedSubscript:@"complexity"];

  [v6 sendEventForKey:v14 payload:v16];
}

- (void)nts_reportExpandedModeWithClient:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(AVTUsageTrackingSession *)self makeEventKeyForAction:@"SessionEnded"];
  id v8 = @"expandedUsed";
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[AVTUsageTrackingSession expandedMode](self, "expandedMode"));
  v9[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v4 sendEventForKey:v5 payload:v7];
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTCoreAnalyticsClient)ntsCAClient
{
  return self->_ntsCAClient;
}

- (NSString)keyBasePrefix
{
  return self->_keyBasePrefix;
}

- (NSString)bundleAppName
{
  return self->_bundleAppName;
}

- (AVTDifferentialPrivacyRecorder)ntsDPRecorder
{
  return self->_ntsDPRecorder;
}

- (AVTAvatarConfigurationMetric)metric
{
  return self->_metric;
}

- (id)recordTransformer
{
  return self->_recordTransformer;
}

- (AVTAvatarConfiguration)defaultConfiguration
{
  return self->_defaultConfiguration;
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (id)timeProvider
{
  return self->_timeProvider;
}

- (BOOL)expandedMode
{
  return self->_expandedMode;
}

- (void)setExpandedMode:(BOOL)a3
{
  self->_expandedMode = a3;
}

- (BOOL)recordedVideo
{
  return self->_recordedVideo;
}

- (void)setRecordedVideo:(BOOL)a3
{
  self->_recordedVideo = a3;
}

- (NSDate)editorEnterDate
{
  return self->_editorEnterDate;
}

- (void)setEditorEnterDate:(id)a3
{
}

- (AVTUsageTrackingRecordTimedEvent)faceTrackingEvent
{
  return self->_faceTrackingEvent;
}

- (void)setFaceTrackingEvent:(id)a3
{
}

- (AVTAvatarStoreInternal)avatarStore
{
  return self->_avatarStore;
}

- (void)setAvatarStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_storeStrong((id *)&self->_faceTrackingEvent, 0);
  objc_storeStrong((id *)&self->_editorEnterDate, 0);
  objc_storeStrong(&self->_timeProvider, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_defaultConfiguration, 0);
  objc_storeStrong(&self->_recordTransformer, 0);
  objc_storeStrong((id *)&self->_metric, 0);
  objc_storeStrong((id *)&self->_ntsDPRecorder, 0);
  objc_storeStrong((id *)&self->_bundleAppName, 0);
  objc_storeStrong((id *)&self->_keyBasePrefix, 0);
  objc_storeStrong((id *)&self->_ntsCAClient, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end