@interface ASVUserDefaults
+ (BOOL)allowCheckoutNonSecureHTML;
+ (BOOL)debug3DPreserveWorldTransform;
+ (BOOL)debugSaveThumbnailImageToDisk;
+ (BOOL)enableVariantsFeature;
+ (BOOL)forceDisableArKitVerticalRejection;
+ (BOOL)forceDisableExtendedDynamicRangeOutput;
+ (BOOL)forceDisableRayTracedAmbientOcclusion;
+ (BOOL)forceDisableRealWorldOcclusion;
+ (BOOL)forceDisableRealWorldPhysics;
+ (BOOL)forceDisableShadowMaps;
+ (BOOL)forceShowAnimationScrubber;
+ (BOOL)forceUseLegacyHitTestAPI;
+ (BOOL)forceUseLegacySceneImportPipeline;
+ (BOOL)forceUseOldProcessLoadedEntities;
+ (BOOL)forceUseSceneReconstructionMeshForOrientation;
+ (BOOL)shouldRevertToOldHapticsBehavior;
+ (BOOL)triggerAffordanceShouldReshowAfterArReset;
+ (BOOL)useEntityLoadFor3DLoading;
+ (BOOL)wants2DOverlayControlsHidden;
+ (BOOL)wantsAnimationDisabled;
+ (BOOL)wantsDebugActionsButton;
+ (BOOL)wantsDebugPhysicsEnabled;
+ (BOOL)wantsDebugSceneUnderstandingEnabled;
+ (BOOL)wantsDebugVisualizationEnabled;
+ (BOOL)wantsMeshMemoryEstimateEnabled;
+ (BOOL)wantsObjectFitToScreen;
+ (BOOL)wantsObjectPlacedWithoutPlane;
+ (BOOL)wantsOpenInObjectMode;
+ (BOOL)wantsParentToCameraInARAndEnableProbes;
+ (BOOL)wantsPeopleOcclusionDisabled;
+ (BOOL)wantsRayTracedAmbientOcclusionEnabled;
+ (BOOL)wantsShowLastPlacementResultTypeStatus;
+ (BOOL)wantsStatisticsShown;
+ (BOOL)wantsStatusBarHidden;
+ (BOOL)wantsStatusPillHidden;
+ (BOOL)wantsTTRButton;
+ (BOOL)wantsTrackedRaycastStatus;
+ (double)triggerAffordanceShowDuration;
+ (float)objectFitToScreenPercentage;
+ (float)sceneIBLARIntensity;
+ (id)checkoutFragment;
+ (id)defaultPlanePosition;
+ (id)inlineFramePreferenceString;
+ (id)overrideCameraStateSerializedString;
+ (id)overrideURLForSafariInline;
+ (id)preferencesValueforKey:(__CFString *)a3;
+ (id)preferencesValueforKey:(__CFString *)a3 domain:(__CFString *)a4;
+ (int)inlinePreviewMemoryReserve;
+ (int)maxInlinePreviewCount;
+ (int)overrideMaxTextureSize;
+ (int64_t)artificialLoadingDelay;
+ (int64_t)overridePreferredIblVersionKey;
+ (void)setPreferencesValue:(id)a3 forKey:(__CFString *)a4;
+ (void)setPreferencesValueForKey:(__CFString *)a3 value:(__CFString *)a4;
@end

@implementation ASVUserDefaults

+ (int64_t)artificialLoadingDelay
{
  uint64_t v2 = [a1 preferencesValueforKey:@"ArtificialLoadingDelay" domain:@"com.apple.AssetViewer"];
  if (v2) {
    v3 = (void *)v2;
  }
  else {
    v3 = &unk_1F3DEEC10;
  }
  int64_t v4 = [v3 longValue];

  return v4;
}

+ (BOOL)wantsAnimationDisabled
{
  uint64_t v2 = [a1 preferencesValueforKey:@"DisableAnimation" domain:@"com.apple.AssetViewer"];
  if (v2) {
    v3 = (void *)v2;
  }
  else {
    v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)wantsStatusBarHidden
{
  uint64_t v2 = [a1 preferencesValueforKey:@"HideStatusBar" domain:@"com.apple.AssetViewer"];
  if (v2) {
    v3 = (void *)v2;
  }
  else {
    v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)wants2DOverlayControlsHidden
{
  uint64_t v2 = [a1 preferencesValueforKey:@"Hide2DOverlayControls" domain:@"com.apple.AssetViewer"];
  if (v2) {
    v3 = (void *)v2;
  }
  else {
    v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)wantsObjectPlacedWithoutPlane
{
  uint64_t v2 = [a1 preferencesValueforKey:@"PlaceObjectWithoutPlane" domain:@"com.apple.AssetViewer"];
  if (v2) {
    v3 = (void *)v2;
  }
  else {
    v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (id)defaultPlanePosition
{
  uint64_t v2 = [a1 preferencesValueforKey:@"DefaultPlanePosition" domain:@"com.apple.AssetViewer"];
  if (!v2) {
    uint64_t v2 = &stru_1F3DDEEE8;
  }
  return v2;
}

+ (BOOL)wantsOpenInObjectMode
{
  uint64_t v2 = [a1 preferencesValueforKey:@"OpenInObjectMode" domain:@"com.apple.AssetViewer"];
  if (v2) {
    v3 = (void *)v2;
  }
  else {
    v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)wantsParentToCameraInARAndEnableProbes
{
  uint64_t v2 = [a1 preferencesValueforKey:@"ParentToCameraInARAndEnableProbes" domain:@"com.apple.AssetViewer"];
  if (v2) {
    v3 = (void *)v2;
  }
  else {
    v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (id)checkoutFragment
{
  uint64_t v2 = [a1 preferencesValueforKey:@"CheckoutFragment" domain:@"com.apple.AssetViewer"];
  if (!v2) {
    uint64_t v2 = &stru_1F3DDEEE8;
  }
  return v2;
}

+ (BOOL)allowCheckoutNonSecureHTML
{
  uint64_t v2 = [a1 preferencesValueforKey:@"CheckoutAllowNonSecureHTML" domain:@"com.apple.AssetViewer"];
  if (v2) {
    v3 = (void *)v2;
  }
  else {
    v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)wantsPeopleOcclusionDisabled
{
  uint64_t v2 = [a1 preferencesValueforKey:@"DisablePeopleOcclusion" domain:@"com.apple.AssetViewer"];
  if (v2) {
    v3 = (void *)v2;
  }
  else {
    v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)wantsTrackedRaycastStatus
{
  uint64_t v2 = [a1 preferencesValueforKey:@"ShowTrackedRaycastStatus" domain:@"com.apple.AssetViewer"];
  if (v2) {
    v3 = (void *)v2;
  }
  else {
    v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)wantsShowLastPlacementResultTypeStatus
{
  uint64_t v2 = [a1 preferencesValueforKey:@"ShowLastPlacementResultTypeStatus" domain:@"com.apple.AssetViewer"];
  if (v2) {
    v3 = (void *)v2;
  }
  else {
    v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)wantsObjectFitToScreen
{
  uint64_t v2 = [a1 preferencesValueforKey:@"FitObjectToScreen" domain:@"com.apple.AssetViewer"];
  if (v2) {
    v3 = (void *)v2;
  }
  else {
    v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (float)objectFitToScreenPercentage
{
  uint64_t v2 = [a1 preferencesValueforKey:@"ObjectFitToScreenPercentage" domain:@"com.apple.AssetViewer"];
  if (v2) {
    v3 = (void *)v2;
  }
  else {
    v3 = &unk_1F3DEEC70;
  }
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

+ (BOOL)wantsRayTracedAmbientOcclusionEnabled
{
  uint64_t v2 = [a1 preferencesValueforKey:@"EnableRayTracedAmbientOcclusion" domain:@"com.apple.AssetViewer"];
  if (v2) {
    v3 = (void *)v2;
  }
  else {
    v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)wantsDebugActionsButton
{
  uint64_t v2 = [a1 preferencesValueforKey:@"EnableDebugActionsButton" domain:@"com.apple.AssetViewer"];
  char v3 = [v2 BOOLValue];

  return v3;
}

+ (BOOL)wantsTTRButton
{
  uint64_t v2 = [a1 preferencesValueforKey:@"EnableTTRButton" domain:@"com.apple.AssetViewer"];
  char v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [NSNumber numberWithUnsignedChar:IsAppleInternalBuild()];
  }
  float v5 = v4;

  char v6 = [v5 BOOLValue];
  return v6;
}

+ (BOOL)forceDisableRayTracedAmbientOcclusion
{
  uint64_t v2 = [a1 preferencesValueforKey:@"ForceDisableRayTracedAmbientOcclusion" domain:@"com.apple.AssetViewer"];
  if (v2) {
    char v3 = (void *)v2;
  }
  else {
    char v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)wantsDebugVisualizationEnabled
{
  uint64_t v2 = [a1 preferencesValueforKey:@"EnableDebugVisualization" domain:@"com.apple.AssetViewer"];
  if (v2) {
    char v3 = (void *)v2;
  }
  else {
    char v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)wantsDebugPhysicsEnabled
{
  uint64_t v2 = [a1 preferencesValueforKey:@"EnableDebugPhysics" domain:@"com.apple.AssetViewer"];
  if (v2) {
    char v3 = (void *)v2;
  }
  else {
    char v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)wantsStatisticsShown
{
  uint64_t v2 = [a1 preferencesValueforKey:@"ShowStatistics" domain:@"com.apple.AssetViewer"];
  if (v2) {
    char v3 = (void *)v2;
  }
  else {
    char v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)wantsStatusPillHidden
{
  uint64_t v2 = [a1 preferencesValueforKey:@"WantsStatusPillHidden" domain:@"com.apple.AssetViewer"];
  char v3 = (void *)v2;
  char v4 = (void *)MEMORY[0x1E4F1CC28];
  if (v2) {
    char v4 = (void *)v2;
  }
  id v5 = v4;

  char v6 = [v5 BOOLValue];
  return v6;
}

+ (double)triggerAffordanceShowDuration
{
  uint64_t v2 = [a1 preferencesValueforKey:@"TriggerAffordanceShowDuration" domain:@"com.apple.AssetViewer"];
  char v3 = (void *)v2;
  char v4 = &unk_1F3DEEC28;
  if (v2) {
    char v4 = (void *)v2;
  }
  id v5 = v4;

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

+ (BOOL)triggerAffordanceShouldReshowAfterArReset
{
  uint64_t v2 = [a1 preferencesValueforKey:@"TriggerAffordanceShouldReshowAfterArReset" domain:@"com.apple.AssetViewer"];
  char v3 = (void *)v2;
  char v4 = (void *)MEMORY[0x1E4F1CC38];
  if (v2) {
    char v4 = (void *)v2;
  }
  id v5 = v4;

  char v6 = [v5 BOOLValue];
  return v6;
}

+ (BOOL)forceShowAnimationScrubber
{
  uint64_t v2 = [a1 preferencesValueforKey:@"ForceShowAnimationScrubber" domain:@"com.apple.AssetViewer"];
  char v3 = (void *)v2;
  char v4 = (void *)MEMORY[0x1E4F1CC28];
  if (v2) {
    char v4 = (void *)v2;
  }
  id v5 = v4;

  char v6 = [v5 BOOLValue];
  return v6;
}

+ (id)overrideCameraStateSerializedString
{
  return (id)[a1 preferencesValueforKey:@"OverrideCameraState" domain:@"com.apple.AssetViewer"];
}

+ (BOOL)forceUseLegacySceneImportPipeline
{
  uint64_t v2 = [a1 preferencesValueforKey:@"ForceUseLegacySceneImportPipeline" domain:@"com.apple.AssetViewer"];
  char v3 = (void *)v2;
  char v4 = (void *)MEMORY[0x1E4F1CC28];
  if (v2) {
    char v4 = (void *)v2;
  }
  id v5 = v4;

  char v6 = [v5 BOOLValue];
  return v6;
}

+ (BOOL)enableVariantsFeature
{
  uint64_t v2 = [a1 preferencesValueforKey:@"enableVariantsFeature" domain:@"com.apple.AssetViewer"];
  char v3 = (void *)v2;
  char v4 = (void *)MEMORY[0x1E4F1CC38];
  if (v2) {
    char v4 = (void *)v2;
  }
  id v5 = v4;

  char v6 = [v5 BOOLValue];
  return v6;
}

+ (BOOL)useEntityLoadFor3DLoading
{
  uint64_t v2 = [a1 preferencesValueforKey:@"useEntityLoadFor3DLoading" domain:@"com.apple.AssetViewer"];
  char v3 = (void *)v2;
  char v4 = (void *)MEMORY[0x1E4F1CC28];
  if (v2) {
    char v4 = (void *)v2;
  }
  id v5 = v4;

  char v6 = [v5 BOOLValue];
  return v6;
}

+ (BOOL)forceUseOldProcessLoadedEntities
{
  uint64_t v2 = [a1 preferencesValueforKey:@"ForceUseOldProcessLoadedEntities" domain:@"com.apple.AssetViewer"];
  char v3 = (void *)v2;
  char v4 = (void *)MEMORY[0x1E4F1CC28];
  if (v2) {
    char v4 = (void *)v2;
  }
  id v5 = v4;

  char v6 = [v5 BOOLValue];
  return v6;
}

+ (int)overrideMaxTextureSize
{
  uint64_t v2 = [a1 preferencesValueforKey:@"ASVOverrideMaxTextureSize" domain:@"com.apple.AssetViewer"];
  char v3 = (void *)v2;
  char v4 = &unk_1F3DEEC10;
  if (v2) {
    char v4 = (void *)v2;
  }
  id v5 = v4;

  int v6 = [v5 intValue];
  return v6;
}

+ (BOOL)wantsMeshMemoryEstimateEnabled
{
  uint64_t v2 = [a1 preferencesValueforKey:@"EnableMeshMemoryEstimate" domain:@"com.apple.AssetViewer"];
  char v3 = (void *)v2;
  char v4 = (void *)MEMORY[0x1E4F1CC28];
  if (v2) {
    char v4 = (void *)v2;
  }
  id v5 = v4;

  char v6 = [v5 BOOLValue];
  return v6;
}

+ (BOOL)wantsDebugSceneUnderstandingEnabled
{
  uint64_t v2 = [a1 preferencesValueforKey:@"EnableDebugSceneUnderstanding" domain:@"com.apple.AssetViewer"];
  if (v2) {
    char v3 = (void *)v2;
  }
  else {
    char v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)forceDisableRealWorldOcclusion
{
  uint64_t v2 = [a1 preferencesValueforKey:@"ForceDisableRealWorldOcclusion" domain:@"com.apple.AssetViewer"];
  if (v2) {
    char v3 = (void *)v2;
  }
  else {
    char v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)forceDisableRealWorldPhysics
{
  uint64_t v2 = [a1 preferencesValueforKey:@"ForceDisableRealWorldPhysics" domain:@"com.apple.AssetViewer"];
  if (v2) {
    char v3 = (void *)v2;
  }
  else {
    char v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)forceUseLegacyHitTestAPI
{
  uint64_t v2 = [a1 preferencesValueforKey:@"ForceLegacyHitTestAPI" domain:@"com.apple.AssetViewer"];
  if (v2) {
    char v3 = (void *)v2;
  }
  else {
    char v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)forceUseSceneReconstructionMeshForOrientation
{
  uint64_t v2 = [a1 preferencesValueforKey:@"ForceUseSceneReconstructionMeshForOrientation" domain:@"com.apple.AssetViewer"];
  if (v2) {
    char v3 = (void *)v2;
  }
  else {
    char v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)forceDisableShadowMaps
{
  uint64_t v2 = [a1 preferencesValueforKey:@"ForceDisableShadowMaps" domain:@"com.apple.AssetViewer"];
  if (v2) {
    char v3 = (void *)v2;
  }
  else {
    char v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)forceDisableArKitVerticalRejection
{
  uint64_t v2 = [a1 preferencesValueforKey:@"ForceDisableArKitVerticalRejection" domain:@"com.apple.AssetViewer"];
  if (v2) {
    char v3 = (void *)v2;
  }
  else {
    char v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)shouldRevertToOldHapticsBehavior
{
  uint64_t v2 = [a1 preferencesValueforKey:@"RevertToOldHapticsBehavior" domain:@"com.apple.AssetViewer"];
  char v3 = (void *)v2;
  char v4 = (void *)MEMORY[0x1E4F1CC28];
  if (v2) {
    char v4 = (void *)v2;
  }
  id v5 = v4;

  char v6 = [v5 BOOLValue];
  return v6;
}

+ (float)sceneIBLARIntensity
{
  uint64_t v2 = [a1 preferencesValueforKey:@"SceneIBLARIntensity" domain:@"com.apple.AssetViewer"];
  if (v2) {
    char v3 = (void *)v2;
  }
  else {
    char v3 = &unk_1F3DEEC10;
  }
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

+ (int64_t)overridePreferredIblVersionKey
{
  uint64_t v2 = [a1 preferencesValueforKey:@"OverridePreferredIblVersionKey" domain:@"com.apple.AssetViewer"];
  if (v2) {
    char v3 = (void *)v2;
  }
  else {
    char v3 = &unk_1F3DEEC10;
  }
  int64_t v4 = [v3 integerValue];

  return v4;
}

+ (BOOL)debugSaveThumbnailImageToDisk
{
  uint64_t v2 = [a1 preferencesValueforKey:@"DebugSaveThumbnailImageToDisk" domain:@"com.apple.AssetViewer"];
  if (v2) {
    char v3 = (void *)v2;
  }
  else {
    char v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)debug3DPreserveWorldTransform
{
  uint64_t v2 = [a1 preferencesValueforKey:@"debugPreserveWorldTransform" domain:@"com.apple.AssetViewer"];
  if (v2) {
    char v3 = (void *)v2;
  }
  else {
    char v3 = (void *)MEMORY[0x1E4F1CC38];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)forceDisableExtendedDynamicRangeOutput
{
  uint64_t v2 = [a1 preferencesValueforKey:@"ForceDisableExtendedDynamicRangeOutput" domain:@"com.apple.AssetViewer"];
  if (v2) {
    char v3 = (void *)v2;
  }
  else {
    char v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (id)overrideURLForSafariInline
{
  uint64_t v2 = [a1 preferencesValueforKey:@"SafariInlinePreviewURL" domain:@"com.apple.AssetViewer"];
  if (v2
    && ([MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet],
        char v3 = objc_claimAutoreleasedReturnValue(),
        [v2 stringByTrimmingCharactersInSet:v3],
        char v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 length],
        v4,
        v3,
        v5))
  {
    id v6 = v2;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)inlineFramePreferenceString
{
  return (id)[a1 preferencesValueforKey:@"InlineFramePreference" domain:@"com.apple.AssetViewer"];
}

+ (int)maxInlinePreviewCount
{
  uint64_t v2 = [a1 preferencesValueforKey:@"ASVInlineMaxCount" domain:@"com.apple.AssetViewer"];
  char v3 = (void *)v2;
  char v4 = &unk_1F3DEEC40;
  if (v2) {
    char v4 = (void *)v2;
  }
  id v5 = v4;

  int v6 = [v5 intValue];
  return v6;
}

+ (int)inlinePreviewMemoryReserve
{
  uint64_t v2 = [a1 preferencesValueforKey:@"ASVinlinePreviewMemoryReserve" domain:@"com.apple.AssetViewer"];
  char v3 = (void *)v2;
  char v4 = &unk_1F3DEEC58;
  if (v2) {
    char v4 = (void *)v2;
  }
  id v5 = v4;

  int v6 = [v5 intValue];
  return v6;
}

+ (id)preferencesValueforKey:(__CFString *)a3 domain:(__CFString *)a4
{
  CFPreferencesAppSynchronize(a4);
  int v6 = (void *)CFPreferencesCopyAppValue(a3, a4);
  return v6;
}

+ (void)setPreferencesValueForKey:(__CFString *)a3 value:(__CFString *)a4
{
  CFPreferencesSetAppValue(a3, a4, @"com.apple.AssetViewer");
  CFPreferencesAppSynchronize(@"com.apple.AssetViewer");
}

+ (void)setPreferencesValue:(id)a3 forKey:(__CFString *)a4
{
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSetValue(a4, a3, @"com.apple.AssetViewer", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFPreferencesSynchronize(@"com.apple.AssetViewer", v4, v5);
}

+ (id)preferencesValueforKey:(__CFString *)a3
{
  return +[ASVUserDefaults preferencesValueforKey:a3 domain:@"com.apple.AssetViewer"];
}

@end