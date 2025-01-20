@interface CFXEffectHostAppDelegate
+ (id)sharedInstance;
- (BOOL)wantsDynamicLineSpacingForDiacritics;
- (BOOL)wantsExtraLineSpacingForDiacritics;
- (BOOL)wantsToAdjustTextBoundsHeightUsingCapHeight;
- (BOOL)wantsToAssertThatLoadedSceneHasAnimateFlagDisabled;
- (BOOL)wantsToAssertThatTopLevelGroupSpansEntireScene;
- (BOOL)wantsToCacheTopLevelGroupRender;
- (BOOL)wantsToComputeTypographicHeightWithoutLastLineLeading;
- (BOOL)wantsToDownscaleGlyphsToOutputSize;
- (BOOL)wantsToIgnoreTextBoundsOfNewlinesOfTranscriptions;
- (BOOL)wantsToIgnoreTextBoundsOfTransparentObjects;
- (BOOL)wantsToImproveQualityOfDraftQualityText;
- (BOOL)wantsToIncludeSubstituteFontNameInAttributedString;
- (BOOL)wantsToIncludeTrackingValueInAttributedString;
- (BOOL)wantsToLimitLinesOfText;
- (BOOL)wantsToScaleEmojiToCapHeight;
- (BOOL)wantsToSetTranscriptionsUsingArray;
- (BOOL)wantsToSkipSuggestedLineBreaksInParagraphLayout;
- (BOOL)wantsToUseBinarySearchForScalingToBothMargins;
- (BOOL)wantsToUseCachedTextureForText;
- (PVHostApplicationDelegate)colorSpaceDelegate;
- (id)effectTemplatesBundle;
- (id)effectTemplatesDirectoryName;
- (id)preferredDisplayColorSpace;
- (id)preferredExportColorSpace;
- (unsigned)getMaxGlyphResolution;
- (unsigned)getNumberOfLinesToLimitTextTo;
- (void)setColorSpaceDelegate:(id)a3;
@end

@implementation CFXEffectHostAppDelegate

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_33);
  }
  v2 = (void *)sharedInstance_s_instance;
  return v2;
}

uint64_t __42__CFXEffectHostAppDelegate_sharedInstance__block_invoke()
{
  sharedInstance_s_instance = objc_alloc_init(CFXEffectHostAppDelegate);
  return MEMORY[0x270F9A758]();
}

- (id)effectTemplatesDirectoryName
{
  return @"iOSTemplates.localized";
}

- (id)effectTemplatesBundle
{
  return (id)[MEMORY[0x263F086E0] jfxBundle];
}

- (BOOL)wantsExtraLineSpacingForDiacritics
{
  return 0;
}

- (BOOL)wantsDynamicLineSpacingForDiacritics
{
  return 0;
}

- (BOOL)wantsToScaleEmojiToCapHeight
{
  return 0;
}

- (BOOL)wantsToSkipSuggestedLineBreaksInParagraphLayout
{
  return 0;
}

- (BOOL)wantsToUseBinarySearchForScalingToBothMargins
{
  return 1;
}

- (BOOL)wantsToLimitLinesOfText
{
  return 0;
}

- (unsigned)getNumberOfLinesToLimitTextTo
{
  return 0;
}

- (BOOL)wantsToImproveQualityOfDraftQualityText
{
  return 1;
}

- (BOOL)wantsToDownscaleGlyphsToOutputSize
{
  return 0;
}

- (BOOL)wantsToSetTranscriptionsUsingArray
{
  return 1;
}

- (BOOL)wantsToIgnoreTextBoundsOfTransparentObjects
{
  return 1;
}

- (BOOL)wantsToIgnoreTextBoundsOfNewlinesOfTranscriptions
{
  return 1;
}

- (BOOL)wantsToUseCachedTextureForText
{
  return 1;
}

- (BOOL)wantsToIncludeSubstituteFontNameInAttributedString
{
  return 1;
}

- (BOOL)wantsToIncludeTrackingValueInAttributedString
{
  return 1;
}

- (BOOL)wantsToComputeTypographicHeightWithoutLastLineLeading
{
  return 1;
}

- (BOOL)wantsToAdjustTextBoundsHeightUsingCapHeight
{
  return 1;
}

- (BOOL)wantsToCacheTopLevelGroupRender
{
  return 1;
}

- (BOOL)wantsToAssertThatLoadedSceneHasAnimateFlagDisabled
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 objectForKey:@"JFX_EnableAssertionThatLoadedSceneHasAnimateFlagDisabled"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)wantsToAssertThatTopLevelGroupSpansEntireScene
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 objectForKey:@"JFX_EnableAssertionThatTopLevelGroupSpansEntireScene"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (unsigned)getMaxGlyphResolution
{
  return 512;
}

- (id)preferredDisplayColorSpace
{
  v2 = [(CFXEffectHostAppDelegate *)self colorSpaceDelegate];
  if (objc_opt_respondsToSelector())
  {
    v3 = [v2 preferredDisplayColorSpace];
  }
  else
  {
    char v4 = (void *)MEMORY[0x263F61230];
    v5 = +[JFXVideoCameraController sharedInstance];
    v3 = objc_msgSend(v4, "jfx_getColorSpaceFromCaptureColorSpace:", objc_msgSend(v5, "cameraColorSpace"));
  }
  v6 = [MEMORY[0x263F1C5C0] currentDevice];
  v7 = objc_msgSend(v6, "jfx_recommendedDisplayColorSpaceForColorSpace:", v3);

  return v7;
}

- (id)preferredExportColorSpace
{
  v3 = [MEMORY[0x263F61230] rec709GammaColorSpace];
  char v4 = [(CFXEffectHostAppDelegate *)self colorSpaceDelegate];
  if (objc_opt_respondsToSelector())
  {
    v5 = [v4 preferredExportColorSpace];
    v6 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v7 = objc_msgSend(v6, "jfx_recommendedDisplayColorSpaceForColorSpace:", v5);

    v3 = (void *)v7;
  }

  return v3;
}

- (PVHostApplicationDelegate)colorSpaceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_colorSpaceDelegate);
  return (PVHostApplicationDelegate *)WeakRetained;
}

- (void)setColorSpaceDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end