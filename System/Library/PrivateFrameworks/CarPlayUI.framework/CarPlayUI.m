id CarPlayUIGeneralLogging()
{
  void *v0;
  uint64_t vars8;

  if (CarPlayUIGeneralLogging_onceToken != -1) {
    dispatch_once(&CarPlayUIGeneralLogging_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)CarPlayUIGeneralLogging_facility;
  return v0;
}

uint64_t __CarPlayUIGeneralLogging_block_invoke()
{
  CarPlayUIGeneralLogging_facility = (uint64_t)os_log_create("com.apple.carplayui", "General");
  return MEMORY[0x270F9A758]();
}

id CPUIChevronRightGlyph()
{
  v0 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83580] variant:1024];
  v1 = [MEMORY[0x263F82818] configurationWithFont:v0 scale:1];
  v2 = [MEMORY[0x263F827E8] systemImageNamed:@"chevron.forward" withConfiguration:v1];

  return v2;
}

id CPUIMessageComposeGlyph(void *a1, double a2)
{
  return _CPUIGlyphFactoryWithTraitCollection(@"square.and.pencil", 6, a1, a2);
}

id CPUIImageUpIndicatorGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(@"chevron.up", 6, a1, 20.0);
}

id CPUIImageDownIndicatorGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(@"chevron.down", 6, a1, 20.0);
}

id CPUIImageMinimizeGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(@"chevron.down.circle.fill", 4, a1, 18.0);
}

id CPUIImageMaximizeGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(@"chevron.up.circle.fill", 4, a1, 18.0);
}

id CPUIImageCancelGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(@"xmark.circle.fill", 4, a1, 18.0);
}

id CPUIImageZoomInGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(@"plus", 5, a1, 18.0);
}

id CPUIImageZoomOutGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(@"minus", 5, a1, 18.0);
}

id CPUIImagePanGlyph(void *a1)
{
  v1 = (void *)MEMORY[0x263F827E8];
  id v2 = a1;
  v3 = CPUIFrameworkBundle();
  v4 = [v1 imageNamed:@"CarPan" inBundle:v3 compatibleWithTraitCollection:v2];

  v5 = [v4 imageWithRenderingMode:2];

  return v5;
}

id CPUIImageRecenterGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(@"location.fill", 4, a1, 16.0);
}

id CPUIImageStarRatingEmpty(void *a1, int a2)
{
  double v2 = 18.0;
  if (a2) {
    double v2 = 9.0;
  }
  return _CPUIGlyphFactoryWithTraitCollection(@"star", 5, a1, v2);
}

id CPUIImageStarRatingHalf(void *a1, int a2)
{
  double v2 = 18.0;
  if (a2) {
    double v2 = 9.0;
  }
  return _CPUIGlyphFactoryWithTraitCollection(@"star.leadinghalf.fill", 5, a1, v2);
}

id CPUIImageStarRatingFull(void *a1, int a2)
{
  double v2 = 18.0;
  if (a2) {
    double v2 = 9.0;
  }
  return _CPUIGlyphFactoryWithTraitCollection(@"star.fill", 5, a1, v2);
}

id CPUIFilteredString(void *a1)
{
  v1 = (void *)MEMORY[0x263F08708];
  id v2 = a1;
  v3 = [v1 newlineCharacterSet];
  v4 = [v2 componentsSeparatedByCharactersInSet:v3];

  v5 = [v4 componentsJoinedByString:&stru_26DC16290];

  return v5;
}

__CFString *CPUILocalizedExplicitLabelString()
{
  v0 = [MEMORY[0x263F890A0] defaultManager];
  v1 = [v0 ageVerificationState];
  uint64_t v2 = [v1 treatment];

  if (v2 == 1) {
    return @"⓳";
  }
  else {
    return @"🅴";
  }
}

id CPUILocalizedExplicitImageForTraitCollection(void *a1)
{
  v1 = (void *)MEMORY[0x263F890A0];
  id v2 = a1;
  v3 = [v1 defaultManager];
  v4 = [v3 ageVerificationState];
  uint64_t v5 = [v4 treatment];

  if (v5 == 1) {
    v6 = @"ExplicitGlyph19";
  }
  else {
    v6 = @"ExplicitGlyph";
  }
  v7 = CPUIImageNamedWithTraitCollection(v6, v2);

  return v7;
}

id CPUITableCellExplicitLabel()
{
  id v0 = objc_alloc_init(MEMORY[0x263F828E0]);
  v1 = [MEMORY[0x263F81708] systemFontOfSize:15.0 weight:*MEMORY[0x263F81838]];
  [v0 setFont:v1];

  id v2 = CPUILocalizedExplicitLabelString();
  [v0 setText:v2];

  v3 = [MEMORY[0x263F825C8] _carSystemSecondaryColor];
  [v0 setTextColor:v3];

  v4 = [MEMORY[0x263F825C8] _carSystemFocusSecondaryColor];
  [v0 setHighlightedTextColor:v4];

  [v0 sizeToFit];
  return v0;
}

id CPUIFormattedNumberString(void *a1)
{
  uint64_t v1 = CPUIFormattedNumberString_sOnceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&CPUIFormattedNumberString_sOnceToken, &__block_literal_global_2);
  }
  v3 = [(id)CPUIFormattedNumberString_sNumberFormatter stringFromNumber:v2];

  return v3;
}

uint64_t __CPUIFormattedNumberString_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  uint64_t v1 = (void *)CPUIFormattedNumberString_sNumberFormatter;
  CPUIFormattedNumberString_sNumberFormatter = (uint64_t)v0;

  [(id)CPUIFormattedNumberString_sNumberFormatter setNumberStyle:1];
  [(id)CPUIFormattedNumberString_sNumberFormatter setUsesSignificantDigits:0];
  [(id)CPUIFormattedNumberString_sNumberFormatter setMaximumFractionDigits:2];
  id v2 = (void *)CPUIFormattedNumberString_sNumberFormatter;
  return [v2 setUsesGroupingSeparator:1];
}

uint64_t CPUITimeDurationForSeconds(float a1)
{
  if (CPUITimeDurationForSeconds_sOnceToken != -1) {
    dispatch_once(&CPUITimeDurationForSeconds_sOnceToken, &__block_literal_global_20);
  }
  id v2 = (void *)CPUITimeDurationForSeconds_sTimeFormatter;
  return [v2 stringFromSeconds:a1];
}

uint64_t __CPUITimeDurationForSeconds_block_invoke()
{
  CPUITimeDurationForSeconds_sTimeFormatter = (uint64_t)objc_alloc_init(MEMORY[0x263EFA8B8]);
  return MEMORY[0x270F9A758]();
}

id CPUIFormattedPlaybackRateString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToNumber:&unk_26DC1F2B0])
  {
    id v2 = @"PLAYBACK_RATE_SPEED_HALF";
LABEL_15:
    v3 = CPUILocalizedStringForKey(v2);
    goto LABEL_16;
  }
  if ([v1 isEqualToNumber:&unk_26DC1F2C0])
  {
    id v2 = @"PLAYBACK_RATE_SPEED_THREE_QUARTERS";
    goto LABEL_15;
  }
  if ([v1 isEqualToNumber:&unk_26DC1F0E8])
  {
    id v2 = @"PLAYBACK_RATE_SPEED_ONE";
    goto LABEL_15;
  }
  if ([v1 isEqualToNumber:&unk_26DC1F2D0])
  {
    id v2 = @"PLAYBACK_RATE_SPEED_ONE_AND_QUARTER";
    goto LABEL_15;
  }
  if ([v1 isEqualToNumber:&unk_26DC1F2E0])
  {
    id v2 = @"PLAYBACK_RATE_SPEED_ONE_AND_HALF";
    goto LABEL_15;
  }
  if ([v1 isEqualToNumber:&unk_26DC1F2F0])
  {
    id v2 = @"PLAYBACK_RATE_SPEED_ONE_AND_THREE_QUARTERS";
    goto LABEL_15;
  }
  if ([v1 isEqualToNumber:&unk_26DC1F100])
  {
    id v2 = @"PLAYBACK_RATE_SPEED_TWO";
    goto LABEL_15;
  }
  uint64_t v5 = NSString;
  v6 = CPUILocalizedStringForKey(@"PLAYBACK_RATE_%@");
  v7 = CPUIFormattedNumberString(v1);
  v3 = objc_msgSend(v5, "stringWithFormat:", v6, v7);

LABEL_16:
  return v3;
}

id CPUIAccessiblePlaybackRateString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToNumber:&unk_26DC1F2B0])
  {
    id v2 = @"ACCESSIBLE_PLAYBACK_RATE_SPEED_HALF";
LABEL_15:
    v3 = CPUILocalizedStringForKey(v2);
    goto LABEL_16;
  }
  if ([v1 isEqualToNumber:&unk_26DC1F2C0])
  {
    id v2 = @"ACCESSIBLE_PLAYBACK_RATE_SPEED_THREE_QUARTERS";
    goto LABEL_15;
  }
  if ([v1 isEqualToNumber:&unk_26DC1F0E8])
  {
    id v2 = @"ACCESSIBLE_PLAYBACK_RATE_SPEED_ONE";
    goto LABEL_15;
  }
  if ([v1 isEqualToNumber:&unk_26DC1F2D0])
  {
    id v2 = @"ACCESSIBLE_PLAYBACK_RATE_SPEED_ONE_AND_QUARTER";
    goto LABEL_15;
  }
  if ([v1 isEqualToNumber:&unk_26DC1F2E0])
  {
    id v2 = @"ACCESSIBLE_PLAYBACK_RATE_SPEED_ONE_AND_HALF";
    goto LABEL_15;
  }
  if ([v1 isEqualToNumber:&unk_26DC1F2F0])
  {
    id v2 = @"ACCESSIBLE_PLAYBACK_RATE_SPEED_ONE_AND_THREE_QUARTERS";
    goto LABEL_15;
  }
  if ([v1 isEqualToNumber:&unk_26DC1F100])
  {
    id v2 = @"ACCESSIBLE_PLAYBACK_RATE_SPEED_TWO";
    goto LABEL_15;
  }
  uint64_t v5 = NSString;
  v6 = CPUILocalizedStringForKey(@"ACCESSIBLE_PLAYBACK_RATE_%@");
  v7 = CPUIFormattedNumberString(v1);
  v3 = objc_msgSend(v5, "stringWithFormat:", v6, v7);

LABEL_16:
  return v3;
}

id _CPUIGlyphFactoryWithTraitCollection(void *a1, uint64_t a2, void *a3, double a4)
{
  v7 = (void *)MEMORY[0x263F82818];
  id v8 = a3;
  id v9 = a1;
  v10 = [v7 configurationWithPointSize:a2 weight:a4];
  v11 = [MEMORY[0x263F827E8] systemImageNamed:v9 compatibleWithTraitCollection:v8];

  v12 = [v11 imageWithSymbolConfiguration:v10];

  return v12;
}

id _CPUISiriGlyph(uint64_t a1)
{
  id v1 = objc_msgSend(MEMORY[0x263F82818], "configurationWithPointSize:weight:", a1);
  id v2 = [MEMORY[0x263F827E8] _systemImageNamed:@"siri" withConfiguration:v1];

  return v2;
}

id CPUIPlaybackProgressCompleteGlyphWithSize(void *a1, double a2)
{
  return _CPUIGlyphFactoryWithTraitCollection(@"checkmark.circle", 6, a1, a2);
}

id CPUIShuffleGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(@"shuffle", 4, a1, 16.0);
}

id CPUIEllipsisGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(@"ellipsis", 4, a1, 16.0);
}

id CPUIAddGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(@"plus", 4, a1, 16.0);
}

id CPUIRepeatGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(@"repeat", 4, a1, 16.0);
}

id CPUIRepeatOneGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(@"repeat.1", 4, a1, 16.0);
}

id CPUIPauseGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(@"pause.fill", 4, a1, 26.0);
}

id CPUIBackGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(@"backward.fill", 4, a1, 20.0);
}

id CPUIForwardGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(@"forward.fill", 4, a1, 20.0);
}

id CPUIQuestionmarkGlyph(void *a1)
{
  return _CPUIGlyphFactoryWithTraitCollection(@"questionmark.app.dashed", 4, a1, 16.0);
}

uint64_t CPUIDeviceSupportsSoundRecognition()
{
  if (CPUIDeviceSupportsSoundRecognition_onceToken != -1) {
    dispatch_once(&CPUIDeviceSupportsSoundRecognition_onceToken, &__block_literal_global_118);
  }
  return CPUIDeviceSupportsSoundRecognition_supportsSoundRecognition;
}

void __CPUIDeviceSupportsSoundRecognition_block_invoke()
{
  id v0 = [MEMORY[0x263F21DA8] sharedInstance];
  CPUIDeviceSupportsSoundRecognition_supportsSoundRecognition = [v0 supportsVirtualAudioDevice];
}

id CPUIImageForTransportButton(unint64_t a1, void *a2, void *a3, double a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a1 > 6)
  {
    id v9 = 0;
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v9 = off_26482D3B8[a1];
  if (v7)
  {
LABEL_5:
    id v9 = [(__CFString *)v9 stringByAppendingFormat:@".%@", v7];
  }
LABEL_6:
  v10 = _CPUIGlyphFactoryWithTraitCollection(v9, 4, v8, a4);

  return v10;
}

id CPUIHighlightedImageForTransportButton(unint64_t a1, void *a2, void *a3, double a4)
{
  id v7 = (void *)MEMORY[0x263F825C8];
  id v8 = a3;
  id v9 = a2;
  v10 = [v7 labelColor];
  v11 = [v10 colorWithAlphaComponent:0.2];

  v12 = CPUIImageForTransportButton(a1, v9, v8, a4);

  v13 = [v12 flattenedImageWithColor:v11];

  return v13;
}

uint64_t CPUIPlaceholderTypeForBundleIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:CPUINewsBundleIdentifier])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:CPUIAudiobooksBundleIdentifier])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:CPUIPodcastsBundleIdentifier])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:CPUIClassicalBundleIdentifier])
  {
    uint64_t v2 = 5;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *CPUIImageNameForPlaceholderType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8) {
    return @"PlaceholderMusic";
  }
  else {
    return off_26482D3F0[a1 - 1];
  }
}

id CPUIImageForPlaceholderTypeWithTraitCollection(uint64_t a1, void *a2)
{
  if ((unint64_t)(a1 - 1) > 8) {
    uint64_t v2 = @"PlaceholderMusic";
  }
  else {
    uint64_t v2 = off_26482D3F0[a1 - 1];
  }
  return CPUIImageNamedWithTraitCollection(v2, a2);
}

uint64_t _touchesContainDirectTouch(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v7;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v1);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * i), "type", (void)v6))
        {
          uint64_t v2 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

id CPUIImageByScalingImageToSize(void *a1, double a2, double a3)
{
  id v5 = a1;
  [v5 size];
  if (v6 <= a2 && ([v5 size], v7 <= a3))
  {
    id v14 = v5;
  }
  else
  {
    [v5 size];
    double v9 = a2 / v8;
    [v5 size];
    if (v9 >= a3 / v10) {
      double v9 = a3 / v10;
    }
    [v5 size];
    double v12 = v11 * v9;
    [v5 size];
    objc_msgSend(v5, "_imageWithSize:", v12, v13 * v9);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  return v15;
}

id CPUIFrameworkBundle()
{
  id v0 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  id v1 = [v0 objectAtIndex:0];

  uint64_t v2 = [(id)GSSystemRootDirectory() stringByAppendingPathComponent:v1];
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"PrivateFrameworks/CarPlayUI.framework"];

  v4 = [MEMORY[0x263F086E0] bundleWithPath:v3];

  return v4;
}

id CPUIImageNamedWithTraitCollection(void *a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x263F827E8];
  id v4 = a2;
  id v5 = a1;
  double v6 = CPUIFrameworkBundle();
  double v7 = [v3 imageNamed:v5 inBundle:v6 compatibleWithTraitCollection:v4];

  return v7;
}

unint64_t CPUITraitCollectionSupportsFocus(void *a1)
{
  id v1 = a1;
  if ([v1 primaryInteractionModel] == 8) {
    unint64_t v2 = 1;
  }
  else {
    unint64_t v2 = ((unint64_t)[v1 interactionModel] >> 1) & 1;
  }

  return v2;
}

id CPUILocalizedStringForKey(void *a1)
{
  id v1 = a1;
  unint64_t v2 = CPUIFrameworkBundle();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:&stru_26DC16290 table:@"Localizable"];

  return v3;
}

double CPUIRectByApplyingUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
{
  *(double *)&v18[16] = a7;
  *(double *)&v18[24] = a8;
  *(double *)v18 = a5;
  *(double *)&v18[8] = a6;
  *(void *)&double v12 = (unint64_t)CGRectIntegral(*(CGRect *)&a1);
  double v13 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v14 = [v13 userInterfaceLayoutDirection];

  if (v14 == 1)
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)v18);
    v19.origin.x = a1;
    v19.origin.y = a2;
    v19.size.width = a3;
    v19.size.height = a4;
    double v16 = MaxX - CGRectGetMinX(v19);
    v20.origin.x = a1;
    v20.origin.y = a2;
    v20.size.width = a3;
    v20.size.height = a4;
    double v12 = v16 - CGRectGetWidth(v20);
    v21.origin.x = a1;
    v21.origin.y = a2;
    v21.size.width = a3;
    v21.size.height = a4;
    CGRectGetMinY(v21);
    v22.origin.x = a1;
    v22.origin.y = a2;
    v22.size.width = a3;
    v22.size.height = a4;
    CGRectGetWidth(v22);
    v23.origin.x = a1;
    v23.origin.y = a2;
    v23.size.width = a3;
    v23.size.height = a4;
    CGRectGetHeight(v23);
  }
  return v12;
}

__CFString *CPUIDescriptionForUserInterfaceStyle(unint64_t a1)
{
  if (a1 > 2) {
    return @"invalid style";
  }
  else {
    return off_26482D438[a1];
  }
}

BOOL __CPUITouchesContainsTouchType_block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

id CPUINowPlayingLayoutForSafeAreaFrameScaleArtwork(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6, double a7, double a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  double v18 = a9;
  double v19 = a8;
  double v20 = a7;
  double v21 = a6;
  if (a1)
  {
    CGRectGetWidth(*(CGRect *)&a2);
    v33.origin.x = a2;
    v33.origin.y = a3;
    v33.size.width = a4;
    v33.size.height = a5;
    CGRectGetHeight(v33);
    double v18 = a9;
    double v19 = a8;
    double v20 = a7;
    double v21 = a6;
  }
  v29 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSafeArea:frame:displayScale:showsArtwork:", a1, a2, a3, a4, a5, v21, v20, v19, v18, a17);
  return v29;
}

void sub_227AE18A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL _nonCapturedPressType_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 type] != 3
    && [v2 type] != 2
    && [v2 type]
    && [v2 type] != 1;

  return v3;
}

BOOL __CPUITouchesContainsTouchType_block_invoke_0(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

double UIEdgeInsetsFromRectWithRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v10 = *MEMORY[0x263F834E8];
  CGFloat v11 = *MEMORY[0x263F001A8];
  CGFloat v12 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat v14 = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat v13 = *(double *)(MEMORY[0x263F001A8] + 24);
  v30.origin.x = *(CGFloat *)MEMORY[0x263F001A8];
  v30.origin.y = v12;
  v30.size.width = v14;
  v30.size.height = v13;
  if (CGRectEqualToRect(*(CGRect *)&a1, v30)) {
    return v10;
  }
  v23.size.height = a8;
  v23.origin.x = a5;
  v23.origin.y = a6;
  v23.size.width = a7;
  v31.origin.x = v11;
  v31.origin.y = v12;
  v31.size.width = v14;
  v31.size.height = v13;
  double MinY = v10;
  if (!CGRectEqualToRect(v23, v31))
  {
    v24.origin.x = a1;
    v24.origin.y = a2;
    v24.size.width = a3;
    v24.size.height = a4;
    double MinY = CGRectGetMinY(v24);
    v25.origin.x = a1;
    v25.origin.y = a2;
    v25.size.width = a3;
    v25.size.height = a4;
    CGRectGetMinX(v25);
    v26.origin.x = a5;
    v26.origin.y = a6;
    v26.size.width = a7;
    v26.size.height = a8;
    CGRectGetHeight(v26);
    v27.origin.x = a1;
    v27.origin.y = a2;
    v27.size.width = a3;
    v27.size.height = a4;
    CGRectGetMaxY(v27);
    v28.origin.x = a5;
    v28.origin.y = a6;
    v28.size.width = a7;
    v28.size.height = a8;
    CGRectGetWidth(v28);
    v29.origin.x = a1;
    v29.origin.y = a2;
    v29.size.width = a3;
    v29.size.height = a4;
    CGRectGetMaxX(v29);
  }
  return MinY;
}

uint64_t GridView.SquareGrid.Cell.init(viewModel:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  outlined init with take of GridView.Base.ViewModel(a1, a2, type metadata accessor for GridView.Base.ViewModel);
  uint64_t v3 = type metadata accessor for GridView.Base.ViewModel(0);
  id v4 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
  return v4(a2, 0, 1, v3);
}

uint64_t GridView.SquareGrid.Cell.body.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for GridView.SquareGrid.Cell();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  double v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  outlined init with copy of GridView.SquareGrid.Cell(v1, (uint64_t)&v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], (uint64_t (*)(void))type metadata accessor for GridView.SquareGrid.Cell);
  unint64_t v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v10 = swift_allocObject();
  outlined init with take of GridView.Base.ViewModel((uint64_t)&v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v10 + v9, (uint64_t (*)(void))type metadata accessor for GridView.SquareGrid.Cell);
  uint64_t v13 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?);
  lazy protocol witness table accessor for type _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>? and conformance <A> A?(&lazy protocol witness table cache variable for type _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>? and conformance <A> A?, &demangling cache variable for type metadata for _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?, (void (*)(void))lazy protocol witness table accessor for type _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0> and conformance <> _ConditionalContent<A, B>);
  Button.init(action:label:)();
  uint64_t KeyPath = swift_getKeyPath();
  char v15 = 0;
  lazy protocol witness table accessor for type Button<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?> and conformance Button<A>(&lazy protocol witness table cache variable for type Button<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?> and conformance Button<A>, &demangling cache variable for type metadata for Button<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>);
  lazy protocol witness table accessor for type GridView.SquareGrid.Cell.ButtonStyle and conformance GridView.SquareGrid.Cell.ButtonStyle();
  View.buttonStyle<A>(_:)();
  swift_release();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t type metadata accessor for GridView.SquareGrid.Cell()
{
  uint64_t result = type metadata singleton initialization cache for GridView.SquareGrid.Cell;
  if (!type metadata singleton initialization cache for GridView.SquareGrid.Cell) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t closure #1 in GridView.SquareGrid.Cell.body.getter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel?);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>(a1, (uint64_t)v4, &demangling cache variable for type metadata for GridView.Base.ViewModel?);
  uint64_t v5 = type metadata accessor for GridView.Base.ViewModel(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5) == 1) {
    return outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v4, &demangling cache variable for type metadata for GridView.Base.ViewModel?);
  }
  uint64_t v7 = *(void (**)(uint64_t))&v4[*(int *)(v5 + 28)];
  swift_retain();
  uint64_t v8 = outlined destroy of GridView.Base.ViewModel.ImageConfiguration.Image((uint64_t)v4, type metadata accessor for GridView.Base.ViewModel);
  v7(v8);
  return swift_release();
}

void outlined consume of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(void *a1, uint64_t a2, char a3)
{
  if (a3 == 1)
  {
    swift_bridgeObjectRelease();
  }
  else if (!a3)
  {
  }
}

uint64_t closure #2 in GridView.SquareGrid.Cell.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v72 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Artwork?);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = &v54[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = type metadata accessor for ArtworkImage();
  uint64_t v60 = *(void *)(v5 - 8);
  uint64_t v61 = v5;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v59 = &v54[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0);
  uint64_t v65 = *(void *)(v69 - 8);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v58 = &v54[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v7);
  v63 = &v54[-v9];
  uint64_t v64 = type metadata accessor for Artwork();
  uint64_t v62 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  v67 = &v54[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>.Storage);
  MEMORY[0x270FA5388](v66);
  CGFloat v12 = (uint64_t *)&v54[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>);
  uint64_t v70 = *(void *)(v13 - 8);
  uint64_t v71 = v13;
  MEMORY[0x270FA5388](v13);
  v68 = &v54[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
  MEMORY[0x270FA5388](v15 - 8);
  v17 = &v54[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel?);
  MEMORY[0x270FA5388](v18 - 8);
  double v20 = &v54[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v21 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  CGRect v24 = (id *)&v54[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  CGRect v27 = &v54[-v26];
  MEMORY[0x270FA5388](v25);
  CGRect v29 = &v54[-v28];
  outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>(a1, (uint64_t)v20, &demangling cache variable for type metadata for GridView.Base.ViewModel?);
  uint64_t v30 = type metadata accessor for GridView.Base.ViewModel(0);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 48))(v20, 1, v30) == 1)
  {
    outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v20, &demangling cache variable for type metadata for GridView.Base.ViewModel?);
    uint64_t v31 = 1;
    uint64_t v32 = v72;
  }
  else
  {
    outlined init with copy of GridView.SquareGrid.Cell((uint64_t)&v20[*(int *)(v30 + 24)], (uint64_t)v17, type metadata accessor for GridView.Base.ViewModel.ImageConfiguration);
    outlined destroy of GridView.Base.ViewModel.ImageConfiguration.Image((uint64_t)v20, type metadata accessor for GridView.Base.ViewModel);
    outlined init with take of GridView.Base.ViewModel((uint64_t)v17, (uint64_t)v27, type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image);
    outlined init with take of GridView.Base.ViewModel((uint64_t)v27, (uint64_t)v29, type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image);
    outlined init with copy of GridView.SquareGrid.Cell((uint64_t)v29, (uint64_t)v24, type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      CGRect v33 = (char *)v24
          + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                   + 48);
      v34 = *(void **)v33;
      uint64_t v35 = *((void *)v33 + 1);
      uint64_t v36 = v62;
      int v37 = v33[16];
      v38 = v67;
      v39 = v24;
      uint64_t v40 = v64;
      (*(void (**)(unsigned char *, id *, uint64_t))(v62 + 32))(v67, v39, v64);
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v36 + 16))(v4, v38, v40);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v36 + 56))(v4, 0, 1, v40);
      v41 = v59;
      ArtworkImage.init(_:)();
      uint64_t v42 = swift_allocObject();
      uint64_t v56 = v35;
      v57 = v34;
      *(void *)(v42 + 16) = v34;
      *(void *)(v42 + 24) = v35;
      int v55 = v37;
      *(unsigned char *)(v42 + 32) = v37;
      outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?(v34, v35, v37);
      uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.Placeholder?);
      uint64_t v44 = lazy protocol witness table accessor for type _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>? and conformance <A> A?((unint64_t *)&lazy protocol witness table cache variable for type GridView.Base.Placeholder? and conformance <A> A?, &demangling cache variable for type metadata for GridView.Base.Placeholder?, (void (*)(void))lazy protocol witness table accessor for type GridView.Base.Placeholder and conformance GridView.Base.Placeholder);
      v45 = v58;
      ArtworkImage.artworkPlaceholder<A>(_:)();
      swift_release();
      (*(void (**)(unsigned char *, uint64_t))(v60 + 8))(v41, v61);
      uint64_t v46 = v65;
      v47 = v63;
      uint64_t v48 = v69;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v65 + 32))(v63, v45, v69);
      (*(void (**)(uint64_t *, unsigned char *, uint64_t))(v46 + 16))(v12, v47, v48);
      swift_storeEnumTagMultiPayload();
      uint64_t v73 = v43;
      uint64_t v74 = v44;
      swift_getOpaqueTypeConformance2();
      uint64_t v49 = (uint64_t)v68;
      _ConditionalContent<>.init(storage:)();
      outlined consume of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?(v57, v56, v55);
      (*(void (**)(unsigned char *, uint64_t))(v46 + 8))(v47, v48);
      (*(void (**)(unsigned char *, uint64_t))(v36 + 8))(v67, v40);
    }
    else
    {
      id v50 = *v24;
      uint64_t *v12 = Image.init(uiImage:)();
      swift_storeEnumTagMultiPayload();
      swift_retain();
      uint64_t v51 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for GridView.Base.Placeholder?);
      uint64_t v52 = lazy protocol witness table accessor for type _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>? and conformance <A> A?((unint64_t *)&lazy protocol witness table cache variable for type GridView.Base.Placeholder? and conformance <A> A?, &demangling cache variable for type metadata for GridView.Base.Placeholder?, (void (*)(void))lazy protocol witness table accessor for type GridView.Base.Placeholder and conformance GridView.Base.Placeholder);
      uint64_t v73 = v51;
      uint64_t v74 = v52;
      swift_getOpaqueTypeConformance2();
      uint64_t v49 = (uint64_t)v68;
      _ConditionalContent<>.init(storage:)();
      swift_release();
    }
    outlined destroy of GridView.Base.ViewModel.ImageConfiguration.Image((uint64_t)v29, type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image);
    uint64_t v32 = v72;
    outlined init with take of ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>(v49, v72, &demangling cache variable for type metadata for _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>);
    uint64_t v31 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v70 + 56))(v32, v31, 1, v71);
}

uint64_t partial apply for closure #2 in GridView.SquareGrid.Cell.body.getter@<X0>(uint64_t a1@<X8>)
{
  return closure #2 in GridView.SquareGrid.Cell.body.getter(*(void *)(v1 + 16), a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0> and conformance <> _ConditionalContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0> and conformance <> _ConditionalContent<A, B>;
  if (!lazy protocol witness table cache variable for type _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0> and conformance <> _ConditionalContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for GridView.Base.Placeholder?);
    lazy protocol witness table accessor for type _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>? and conformance <A> A?((unint64_t *)&lazy protocol witness table cache variable for type GridView.Base.Placeholder? and conformance <A> A?, &demangling cache variable for type metadata for GridView.Base.Placeholder?, (void (*)(void))lazy protocol witness table accessor for type GridView.Base.Placeholder and conformance GridView.Base.Placeholder);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0> and conformance <> _ConditionalContent<A, B>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>? and conformance <A> A?(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GridView.Base.Placeholder and conformance GridView.Base.Placeholder()
{
  unint64_t result = lazy protocol witness table cache variable for type GridView.Base.Placeholder and conformance GridView.Base.Placeholder;
  if (!lazy protocol witness table cache variable for type GridView.Base.Placeholder and conformance GridView.Base.Placeholder)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GridView.Base.Placeholder and conformance GridView.Base.Placeholder);
  }
  return result;
}

uint64_t GridView.SquareGrid.Cell.ButtonStyle.makeBody(configuration:)@<X0>(uint64_t a1@<X1>, int a2@<W2>, uint64_t a3@<X8>)
{
  int v48 = a2;
  uint64_t v49 = a1;
  uint64_t v50 = a3;
  uint64_t v42 = type metadata accessor for RoundedRectangle();
  MEMORY[0x270FA5388](v42);
  uint64_t v4 = (uint64_t *)((char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = type metadata accessor for ButtonStyleConfiguration.Label();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>);
  MEMORY[0x270FA5388](v41);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>);
  MEMORY[0x270FA5388](v43);
  CGFloat v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>);
  MEMORY[0x270FA5388](v44);
  uint64_t v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>, _OverlayModifier<ModifiedContent<StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>, _AnimationModifier<Bool>>>>);
  MEMORY[0x270FA5388](v45);
  uint64_t v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>, _OverlayModifier<ModifiedContent<StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>, _AnimationModifier<Bool>>>>, _ScaleEffect>);
  MEMORY[0x270FA5388](v46);
  uint64_t v47 = (uint64_t)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  ButtonStyleConfiguration.label.getter();
  if (one-time initialization token for radius != -1) {
    swift_once();
  }
  uint64_t v18 = static GridView.SquareGrid.Cell.Specs.Corner.radius;
  if (one-time initialization token for style != -1) {
    swift_once();
  }
  uint64_t v19 = type metadata accessor for RoundedCornerStyle();
  uint64_t v20 = __swift_project_value_buffer(v19, (uint64_t)static GridView.SquareGrid.Cell.Specs.Corner.style);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))((char *)v4 + *(int *)(v42 + 20), v20, v19);
  uint64_t *v4 = v18;
  v4[1] = v18;
  uint64_t v21 = (uint64_t)&v10[*(int *)(v41 + 36)];
  outlined init with copy of GridView.SquareGrid.Cell((uint64_t)v4, v21, MEMORY[0x263F19048]);
  *(_WORD *)(v21
           + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ClipEffect<RoundedRectangle>)
                    + 36)) = 256;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v10, v8, v5);
  outlined destroy of GridView.Base.ViewModel.ImageConfiguration.Image((uint64_t)v4, MEMORY[0x263F19048]);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (ButtonStyleConfiguration.isPressed.getter()) {
    double v22 = 0.75;
  }
  else {
    double v22 = 1.0;
  }
  outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v10, (uint64_t)v12, &demangling cache variable for type metadata for ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>);
  *(double *)&v12[*(int *)(v43 + 36)] = v22;
  outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v10, &demangling cache variable for type metadata for ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>);
  if (one-time initialization token for color != -1) {
    swift_once();
  }
  uint64_t v23 = static GridView.SquareGrid.Cell.Specs.Shadow.color;
  if (one-time initialization token for blur != -1) {
    swift_once();
  }
  uint64_t v24 = static GridView.SquareGrid.Cell.Specs.Shadow.blur;
  if (one-time initialization token for yOffset != -1) {
    swift_once();
  }
  char v25 = v48 & 1;
  uint64_t v26 = static GridView.SquareGrid.Cell.Specs.Shadow.yOffset;
  outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v12, (uint64_t)v14, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>);
  CGRect v27 = (uint64_t *)&v14[*(int *)(v44 + 36)];
  *CGRect v27 = v23;
  v27[1] = v24;
  v27[2] = 0;
  v27[3] = v26;
  swift_retain();
  outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v12, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>);
  uint64_t v28 = static Alignment.center.getter();
  uint64_t v30 = v29;
  uint64_t v31 = (uint64_t)&v16[*(int *)(v45 + 36)];
  closure #1 in GridView.SquareGrid.Cell.ButtonStyle.makeBody(configuration:)(v49, v25, v31);
  uint64_t v32 = (uint64_t *)(v31
                  + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _OverlayModifier<ModifiedContent<StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>, _AnimationModifier<Bool>>>)
                           + 36));
  *uint64_t v32 = v28;
  v32[1] = v30;
  outlined init with take of ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>((uint64_t)v14, (uint64_t)v16, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>);
  if (ButtonStyleConfiguration.isPressed.getter()) {
    double v33 = 0.9;
  }
  else {
    double v33 = 1.0;
  }
  static UnitPoint.center.getter();
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v38 = v47;
  outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v16, v47, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>, _OverlayModifier<ModifiedContent<StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>, _AnimationModifier<Bool>>>>);
  uint64_t v39 = v38 + *(int *)(v46 + 36);
  *(double *)uint64_t v39 = v33;
  *(double *)(v39 + 8) = v33;
  *(void *)(v39 + 16) = v35;
  *(void *)(v39 + 24) = v37;
  outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v16, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>, _OverlayModifier<ModifiedContent<StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>, _AnimationModifier<Bool>>>>);
  return outlined init with take of ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>(v38, v50, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>, _OverlayModifier<ModifiedContent<StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>, _AnimationModifier<Bool>>>>, _ScaleEffect>);
}

uint64_t closure #1 in GridView.SquareGrid.Cell.ButtonStyle.makeBody(configuration:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v35 = a3;
  uint64_t v5 = type metadata accessor for RoundedRectangle();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (uint64_t *)((char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = type metadata accessor for RoundedRectangle._Inset();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>, _AnimationModifier<Bool>>);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for radius != -1) {
    swift_once();
  }
  char v17 = a2 & 1;
  uint64_t v18 = static GridView.SquareGrid.Cell.Specs.Corner.radius;
  if (one-time initialization token for style != -1) {
    swift_once();
  }
  uint64_t v19 = type metadata accessor for RoundedCornerStyle();
  uint64_t v20 = __swift_project_value_buffer(v19, (uint64_t)static GridView.SquareGrid.Cell.Specs.Corner.style);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))((char *)v7 + *(int *)(v5 + 20), v20, v19);
  uint64_t *v7 = v18;
  v7[1] = v18;
  if (one-time initialization token for inset != -1) {
    swift_once();
  }
  uint64_t v21 = static GridView.SquareGrid.Cell.Specs.Focus.inset;
  outlined init with copy of GridView.SquareGrid.Cell((uint64_t)v7, (uint64_t)v10, MEMORY[0x263F19048]);
  *(void *)&v10[*(int *)(v8 + 20)] = v21;
  outlined destroy of GridView.Base.ViewModel.ImageConfiguration.Image((uint64_t)v7, MEMORY[0x263F19048]);
  outlined copy of Environment<Bool>.Content(a1, v17);
  char v22 = specialized Environment.wrappedValue.getter(a1, v17);
  outlined consume of Environment<Bool>.Content(a1, v17);
  if (v22)
  {
    if (one-time initialization token for color != -1) {
      swift_once();
    }
    uint64_t v23 = static GridView.SquareGrid.Cell.Specs.Focus.color;
    swift_retain();
  }
  else
  {
    uint64_t v23 = static Color.clear.getter();
  }
  if (one-time initialization token for thickness != -1) {
    swift_once();
  }
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
  outlined init with copy of GridView.SquareGrid.Cell((uint64_t)v10, (uint64_t)v13, MEMORY[0x263F19028]);
  uint64_t v24 = &v13[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _StrokedShape<RoundedRectangle._Inset>)
                    + 36)];
  long long v25 = v37;
  *(_OWORD *)uint64_t v24 = v36;
  *((_OWORD *)v24 + 1) = v25;
  *((void *)v24 + 4) = v38;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ShapeView<_StrokedShape<RoundedRectangle._Inset>, Color>);
  *(void *)&v13[*(int *)(v26 + 52)] = v23;
  *(_WORD *)&v13[*(int *)(v26 + 56)] = 256;
  uint64_t v27 = static Alignment.center.getter();
  uint64_t v29 = v28;
  uint64_t v30 = (uint64_t *)&v13[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<_ShapeView<_StrokedShape<RoundedRectangle._Inset>, Color>, _BackgroundModifier<EmptyView>>)
                               + 36)];
  *uint64_t v30 = v27;
  v30[1] = v29;
  outlined destroy of GridView.Base.ViewModel.ImageConfiguration.Image((uint64_t)v10, MEMORY[0x263F19028]);
  uint64_t v31 = static Animation.spring(response:dampingFraction:blendDuration:)();
  outlined copy of Environment<Bool>.Content(a1, v17);
  char v32 = specialized Environment.wrappedValue.getter(a1, v17);
  outlined consume of Environment<Bool>.Content(a1, v17);
  outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v13, (uint64_t)v16, &demangling cache variable for type metadata for StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>);
  double v33 = &v16[*(int *)(v14 + 36)];
  *(void *)double v33 = v31;
  v33[8] = v32 & 1;
  outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v13, &demangling cache variable for type metadata for StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>);
  return outlined init with take of ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>((uint64_t)v16, v35, &demangling cache variable for type metadata for ModifiedContent<StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>, _AnimationModifier<Bool>>);
}

uint64_t specialized Environment.wrappedValue.getter(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = static os_log_type_t.fault.getter();
  uint64_t v9 = static Log.runtimeIssuesLog.getter();
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v13 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(1819242306, 0xE400000000000000, &v13);
    _os_log_impl(&dword_227AC2000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A684B80](v11, -1, -1);
    MEMORY[0x22A684B80](v10, -1, -1);
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath();
  outlined consume of Environment<Bool>.Content(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t protocol witness for ButtonStyle.makeBody(configuration:) in conformance GridView.SquareGrid.Cell.ButtonStyle@<X0>(uint64_t a1@<X8>)
{
  return GridView.SquareGrid.Cell.ButtonStyle.makeBody(configuration:)(*(void *)v1, *(unsigned __int8 *)(v1 + 8), a1);
}

void one-time initialization function for radius()
{
  static GridView.SquareGrid.Cell.Specs.Corner.radius = 0x4024000000000000;
}

{
  static GridView.Pins.Cell.Specs.Corner.radius = 0x4024000000000000;
}

{
  static GridView.Pins.Cell.Specs.Image.Shadow.radius = 0x4022000000000000;
}

uint64_t one-time initialization function for style()
{
  uint64_t v0 = type metadata accessor for RoundedCornerStyle();
  __swift_allocate_value_buffer(v0, static GridView.SquareGrid.Cell.Specs.Corner.style);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)static GridView.SquareGrid.Cell.Specs.Corner.style);
  uint64_t v2 = *MEMORY[0x263F19860];
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t vars8;

  uint64_t v0 = type metadata accessor for RoundedCornerStyle();
  __swift_allocate_value_buffer(v0, static GridView.Pins.Cell.Specs.Corner.style);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)static GridView.Pins.Cell.Specs.Corner.style);
  uint64_t v2 = *MEMORY[0x263F19860];
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

void one-time initialization function for blur()
{
  static GridView.SquareGrid.Cell.Specs.Shadow.blur = 0x4022000000000000;
}

void one-time initialization function for yOffset()
{
  static GridView.SquareGrid.Cell.Specs.Shadow.yOffset = 0x4014000000000000;
}

{
  static GridView.Pins.Cell.Specs.Image.Shadow.yOffset = 0x4014000000000000;
}

uint64_t one-time initialization function for color()
{
  static Color.black.getter();
  uint64_t v0 = Color.opacity(_:)();
  uint64_t result = swift_release();
  static GridView.SquareGrid.Cell.Specs.Shadow.color = v0;
  return result;
}

{
  id v0;
  uint64_t result;

  uint64_t v0 = objc_msgSend(self, sel__carSystemFocusColor);
  uint64_t result = MEMORY[0x22A684050](v0);
  static GridView.SquareGrid.Cell.Specs.Focus.color = result;
  return result;
}

{
  id v0;
  uint64_t result;

  uint64_t v0 = objc_msgSend(self, sel__carSystemFocusColor);
  uint64_t result = MEMORY[0x22A684050](v0);
  static GridView.Pins.Cell.Specs.Highlight.color = result;
  return result;
}

void one-time initialization function for inset()
{
  static GridView.SquareGrid.Cell.Specs.Focus.inset = 0xC008000000000000;
}

void one-time initialization function for thickness()
{
  static GridView.SquareGrid.Cell.Specs.Focus.thickness = 0x4008000000000000;
}

uint64_t protocol witness for GridView.Base.Cell.init(viewModel:) in conformance GridView.SquareGrid.Cell@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  outlined init with take of GridView.Base.ViewModel(a1, a2, type metadata accessor for GridView.Base.ViewModel);
  uint64_t v3 = type metadata accessor for GridView.Base.ViewModel(0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
  return v4(a2, 0, 1, v3);
}

uint64_t protocol witness for static View._makeView(view:inputs:) in conformance GridView.SquareGrid.Cell()
{
  return MEMORY[0x270F032C0]();
}

uint64_t protocol witness for static View._makeViewList(view:inputs:) in conformance GridView.SquareGrid.Cell()
{
  return MEMORY[0x270F032D0]();
}

uint64_t protocol witness for static View._viewListCount(inputs:) in conformance GridView.SquareGrid.Cell()
{
  return static View._viewListCount(inputs:)();
}

uint64_t protocol witness for View.body.getter in conformance GridView.SquareGrid.Cell(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(a1 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](a1 - 8);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  os_log_type_t v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  outlined init with copy of GridView.SquareGrid.Cell(v2, (uint64_t)&v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], (uint64_t (*)(void))type metadata accessor for GridView.SquareGrid.Cell);
  unint64_t v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v10 = swift_allocObject();
  outlined init with take of GridView.Base.ViewModel((uint64_t)&v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v10 + v9, (uint64_t (*)(void))type metadata accessor for GridView.SquareGrid.Cell);
  uint64_t v13 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?);
  lazy protocol witness table accessor for type _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>? and conformance <A> A?(&lazy protocol witness table cache variable for type _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>? and conformance <A> A?, &demangling cache variable for type metadata for _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?, (void (*)(void))lazy protocol witness table accessor for type _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0> and conformance <> _ConditionalContent<A, B>);
  Button.init(action:label:)();
  uint64_t KeyPath = swift_getKeyPath();
  char v15 = 0;
  lazy protocol witness table accessor for type Button<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?> and conformance Button<A>(&lazy protocol witness table cache variable for type Button<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?> and conformance Button<A>, &demangling cache variable for type metadata for Button<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>);
  lazy protocol witness table accessor for type GridView.SquareGrid.Cell.ButtonStyle and conformance GridView.SquareGrid.Cell.ButtonStyle();
  View.buttonStyle<A>(_:)();
  swift_release();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t key path getter for EnvironmentValues.isFocused : EnvironmentValues@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.isFocused.getter();
  *a1 = result & 1;
  return result;
}

unint64_t lazy protocol witness table accessor for type GridView.SquareGrid.Cell.ButtonStyle and conformance GridView.SquareGrid.Cell.ButtonStyle()
{
  unint64_t result = lazy protocol witness table cache variable for type GridView.SquareGrid.Cell.ButtonStyle and conformance GridView.SquareGrid.Cell.ButtonStyle;
  if (!lazy protocol witness table cache variable for type GridView.SquareGrid.Cell.ButtonStyle and conformance GridView.SquareGrid.Cell.ButtonStyle)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GridView.SquareGrid.Cell.ButtonStyle and conformance GridView.SquareGrid.Cell.ButtonStyle);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for GridView.SquareGrid.Cell(uint64_t a1)
{
  uint64_t result = lazy protocol witness table accessor for type GridView.SquareGrid.Cell and conformance GridView.SquareGrid.Cell(&lazy protocol witness table cache variable for type GridView.SquareGrid.Cell and conformance GridView.SquareGrid.Cell, (void (*)(uint64_t))type metadata accessor for GridView.SquareGrid.Cell);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in GridView.SquareGrid.Cell()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for GridView.SquareGrid.Cell(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel?)
                 - 8);
  int v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = type metadata accessor for GridView.Base.ViewModel(0);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      uint64_t v11 = a2[3];
      a1[2] = a2[2];
      a1[3] = v11;
      uint64_t v12 = *(int *)(v7 + 24);
      uint64_t v13 = (void **)((char *)a1 + v12);
      unsigned __int8 v14 = (void **)((char *)a2 + v12);
      type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v15 = type metadata accessor for Artwork();
        (*(void (**)(void **, void **, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
        uint64_t v16 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                     + 48);
        char v17 = (char *)v13 + v16;
        uint64_t v18 = (char *)v14 + v16;
        int v19 = v18[16];
        if (v19 == 255)
        {
          *(_OWORD *)char v17 = *(_OWORD *)v18;
          v17[16] = v18[16];
        }
        else
        {
          uint64_t v20 = *(void *)v18;
          uint64_t v21 = *((void *)v18 + 1);
          outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)v18, v21, v19);
          *(void *)char v17 = v20;
          *((void *)v17 + 1) = v21;
          v17[16] = v19;
        }
      }
      else
      {
        char v22 = *v14;
        char *v13 = *v14;
        id v23 = v22;
      }
      swift_storeEnumTagMultiPayload();
      uint64_t v24 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
      *((unsigned char *)v13 + *(int *)(v24 + 20)) = *((unsigned char *)v14 + *(int *)(v24 + 20));
      uint64_t v25 = *(int *)(v7 + 28);
      uint64_t v26 = (uint64_t *)((char *)a1 + v25);
      uint64_t v27 = (uint64_t *)((char *)a2 + v25);
      uint64_t v28 = v27[1];
      *uint64_t v26 = *v27;
      v26[1] = v28;
      uint64_t v29 = *(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56);
      swift_retain();
      v29(a1, 0, 1, v7);
    }
  }
  return a1;
}

id outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(id result, uint64_t a2, char a3)
{
  if (a3 == 1) {
    return (id)swift_bridgeObjectRetain();
  }
  if (!a3) {
    return result;
  }
  return result;
}

uint64_t destroy for GridView.SquareGrid.Cell(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GridView.Base.ViewModel(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2);
  if (!result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v4 = (id *)(a1 + *(int *)(v2 + 24));
    type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v5 = type metadata accessor for Artwork();
      (*(void (**)(id *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
      uint64_t v6 = (char *)v4
         + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                  + 48);
      int v7 = v6[16];
      if (v7 != 255) {
        outlined consume of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(void **)v6, *((void *)v6 + 1), v7);
      }
    }
    else
    {
    }
    return swift_release();
  }
  return result;
}

void *initializeWithCopy for GridView.SquareGrid.Cell(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for GridView.Base.ViewModel(0);
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel?);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = *(int *)(v4 + 24);
    uint64_t v10 = (void **)((char *)a1 + v9);
    uint64_t v11 = (void **)((char *)a2 + v9);
    type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = type metadata accessor for Artwork();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
      uint64_t v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                   + 48);
      unsigned __int8 v14 = (char *)v10 + v13;
      uint64_t v15 = (char *)v11 + v13;
      int v16 = v15[16];
      if (v16 == 255)
      {
        *(_OWORD *)unsigned __int8 v14 = *(_OWORD *)v15;
        v14[16] = v15[16];
      }
      else
      {
        uint64_t v17 = *(void *)v15;
        uint64_t v18 = *((void *)v15 + 1);
        outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)v15, v18, v16);
        *(void *)unsigned __int8 v14 = v17;
        *((void *)v14 + 1) = v18;
        v14[16] = v16;
      }
    }
    else
    {
      int v19 = *v11;
      char *v10 = *v11;
      id v20 = v19;
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v21 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
    *((unsigned char *)v10 + *(int *)(v21 + 20)) = *((unsigned char *)v11 + *(int *)(v21 + 20));
    uint64_t v22 = *(int *)(v4 + 28);
    id v23 = (void *)((char *)a1 + v22);
    uint64_t v24 = (void *)((char *)a2 + v22);
    uint64_t v25 = v24[1];
    *id v23 = *v24;
    v23[1] = v25;
    uint64_t v26 = *(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56);
    swift_retain();
    v26(a1, 0, 1, v4);
  }
  return a1;
}

void *assignWithCopy for GridView.SquareGrid.Cell(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for GridView.Base.ViewModel(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (v7)
  {
    if (!v8)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      a1[3] = a2[3];
      uint64_t v9 = *(int *)(v4 + 24);
      uint64_t v10 = (void **)((char *)a1 + v9);
      uint64_t v11 = (void **)((char *)a2 + v9);
      type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v12 = type metadata accessor for Artwork();
        (*(void (**)(void **, void **, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
        uint64_t v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                     + 48);
        unsigned __int8 v14 = (char *)v10 + v13;
        uint64_t v15 = (char *)v11 + v13;
        int v16 = v15[16];
        if (v16 == 255)
        {
          long long v32 = *(_OWORD *)v15;
          v14[16] = v15[16];
          *(_OWORD *)unsigned __int8 v14 = v32;
        }
        else
        {
          uint64_t v17 = *(void *)v15;
          uint64_t v18 = *((void *)v15 + 1);
          outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)v15, v18, v16);
          *(void *)unsigned __int8 v14 = v17;
          *((void *)v14 + 1) = v18;
          v14[16] = v16;
        }
      }
      else
      {
        uint64_t v30 = *v11;
        char *v10 = *v11;
        id v31 = v30;
      }
      swift_storeEnumTagMultiPayload();
      uint64_t v33 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
      *((unsigned char *)v10 + *(int *)(v33 + 20)) = *((unsigned char *)v11 + *(int *)(v33 + 20));
      uint64_t v34 = *(int *)(v4 + 28);
      uint64_t v35 = (void *)((char *)a1 + v34);
      long long v36 = (void *)((char *)a2 + v34);
      uint64_t v37 = v36[1];
      *uint64_t v35 = *v36;
      v35[1] = v37;
      uint64_t v38 = *(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56);
      swift_retain();
      v38(a1, 0, 1, v4);
      return a1;
    }
LABEL_8:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel?);
    memcpy(a1, a2, *(void *)(*(void *)(v19 - 8) + 64));
    return a1;
  }
  if (v8)
  {
    outlined destroy of GridView.Base.ViewModel.ImageConfiguration.Image((uint64_t)a1, type metadata accessor for GridView.Base.ViewModel);
    goto LABEL_8;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = *(int *)(v4 + 24);
  uint64_t v21 = (void **)((char *)a1 + v20);
  uint64_t v22 = (void **)((char *)a2 + v20);
  if (a1 != a2)
  {
    outlined destroy of GridView.Base.ViewModel.ImageConfiguration.Image((uint64_t)a1 + v20, type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image);
    type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v23 = type metadata accessor for Artwork();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
      uint64_t v24 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                   + 48);
      uint64_t v25 = (char *)v21 + v24;
      uint64_t v26 = (char *)v22 + v24;
      int v27 = v26[16];
      if (v27 == 255)
      {
        long long v41 = *(_OWORD *)v26;
        v25[16] = v26[16];
        *(_OWORD *)uint64_t v25 = v41;
      }
      else
      {
        uint64_t v28 = *(void *)v26;
        uint64_t v29 = *((void *)v26 + 1);
        outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)v26, v29, v26[16]);
        *(void *)uint64_t v25 = v28;
        *((void *)v25 + 1) = v29;
        v25[16] = v27;
      }
    }
    else
    {
      uint64_t v39 = *v22;
      *uint64_t v21 = *v22;
      id v40 = v39;
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v42 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
  *((unsigned char *)v21 + *(int *)(v42 + 20)) = *((unsigned char *)v22 + *(int *)(v42 + 20));
  uint64_t v43 = *(int *)(v4 + 28);
  uint64_t v44 = (void *)((char *)a1 + v43);
  uint64_t v45 = (void *)((char *)a2 + v43);
  uint64_t v46 = v45[1];
  *uint64_t v44 = *v45;
  v44[1] = v46;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *initializeWithTake for GridView.SquareGrid.Cell(_OWORD *a1, _OWORD *a2)
{
  uint64_t v4 = type metadata accessor for GridView.Base.ViewModel(0);
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel?);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    long long v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(v4 + 24);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = type metadata accessor for Artwork();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      uint64_t v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                   + 48);
      unsigned __int8 v14 = &v9[v13];
      uint64_t v15 = &v10[v13];
      *(_OWORD *)unsigned __int8 v14 = *(_OWORD *)v15;
      v14[16] = v15[16];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
    uint64_t v16 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
    v9[*(int *)(v16 + 20)] = v10[*(int *)(v16 + 20)];
    *(_OWORD *)((char *)a1 + *(int *)(v4 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(v4 + 28));
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *assignWithTake for GridView.SquareGrid.Cell(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for GridView.Base.ViewModel(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (v7)
  {
    if (!v8)
    {
      long long v9 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_OWORD *)a1 + 1) = v9;
      uint64_t v10 = *(int *)(v4 + 24);
      uint64_t v11 = (char *)a1 + v10;
      uint64_t v12 = (char *)a2 + v10;
      uint64_t v13 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v14 = type metadata accessor for Artwork();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
        uint64_t v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                     + 48);
        uint64_t v16 = &v11[v15];
        uint64_t v17 = &v12[v15];
        *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
        v16[16] = v17[16];
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
      }
      uint64_t v29 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
      v11[*(int *)(v29 + 20)] = v12[*(int *)(v29 + 20)];
      *(_OWORD *)((char *)a1 + *(int *)(v4 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(v4 + 28));
      (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
      return a1;
    }
LABEL_7:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel?);
    memcpy(a1, a2, *(void *)(*(void *)(v18 - 8) + 64));
    return a1;
  }
  if (v8)
  {
    outlined destroy of GridView.Base.ViewModel.ImageConfiguration.Image((uint64_t)a1, type metadata accessor for GridView.Base.ViewModel);
    goto LABEL_7;
  }
  uint64_t v19 = a2[1];
  *a1 = *a2;
  a1[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = a2[3];
  a1[2] = a2[2];
  a1[3] = v20;
  swift_bridgeObjectRelease();
  uint64_t v21 = *(int *)(v4 + 24);
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  if (a1 != a2)
  {
    outlined destroy of GridView.Base.ViewModel.ImageConfiguration.Image((uint64_t)a1 + v21, type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image);
    uint64_t v24 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v25 = type metadata accessor for Artwork();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32))(v22, v23, v25);
      uint64_t v26 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                   + 48);
      int v27 = &v22[v26];
      uint64_t v28 = &v23[v26];
      *(_OWORD *)int v27 = *(_OWORD *)v28;
      v27[16] = v28[16];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
    }
  }
  uint64_t v30 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
  v22[*(int *)(v30 + 20)] = v23[*(int *)(v30 + 20)];
  *(_OWORD *)((char *)a1 + *(int *)(v4 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(v4 + 28));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for GridView.SquareGrid.Cell(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_227AEE138);
}

uint64_t sub_227AEE138(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel?);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for GridView.SquareGrid.Cell(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_227AEE1BC);
}

uint64_t sub_227AEE1BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel?);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

void type metadata completion function for GridView.SquareGrid.Cell()
{
  type metadata accessor for GridView.Base.ViewModel?();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for GridView.Base.ViewModel?()
{
  if (!lazy cache variable for type metadata for GridView.Base.ViewModel?)
  {
    type metadata accessor for GridView.Base.ViewModel(255);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for GridView.Base.ViewModel?);
    }
  }
}

uint64_t sub_227AEE314()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Button<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>);
  lazy protocol witness table accessor for type Button<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?> and conformance Button<A>(&lazy protocol witness table cache variable for type Button<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?> and conformance Button<A>, &demangling cache variable for type metadata for Button<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>);
  lazy protocol witness table accessor for type GridView.SquareGrid.Cell.ButtonStyle and conformance GridView.SquareGrid.Cell.ButtonStyle();
  return swift_getOpaqueTypeConformance2();
}

void type metadata accessor for CPUINowPlayingPlaceholderType(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for UIEdgeInsets(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for UIEdgeInsets(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for UIEdgeInsets(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CGSize(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CGSize(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CPUINowPlayingPlaceholderType(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for GridView.SquareGrid.Cell.ButtonStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  outlined copy of Environment<Bool>.Content(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

uint64_t outlined copy of Environment<Bool>.Content(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t destroy for GridView.SquareGrid.Cell.ButtonStyle(uint64_t a1)
{
  return outlined consume of Environment<Bool>.Content(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t outlined consume of Environment<Bool>.Content(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t assignWithCopy for GridView.SquareGrid.Cell.ButtonStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  outlined copy of Environment<Bool>.Content(*(void *)a2, v4);
  uint64_t v5 = *(void *)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  outlined consume of Environment<Bool>.Content(v5, v6);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for GridView.SquareGrid.Cell.ButtonStyle(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  uint64_t v5 = *(void *)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  outlined consume of Environment<Bool>.Content(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for GridView.SquareGrid.Cell.ButtonStyle(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for GridView.SquareGrid.Cell.ButtonStyle(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GridView.SquareGrid.Cell.ButtonStyle()
{
  return &type metadata for GridView.SquareGrid.Cell.ButtonStyle;
}

uint64_t associated type witness table accessor for ButtonStyle.Body : View in GridView.SquareGrid.Cell.ButtonStyle()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t outlined destroy of GridView.Base.ViewModel.ImageConfiguration.Image(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = _StringObject.sharedUTF8.getter();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      uint64_t result = _StringGuts.copyUTF8(into:)();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = *(void *)(type metadata accessor for GridView.SquareGrid.Cell() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = type metadata accessor for GridView.Base.ViewModel(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v0 + v3, 1, v5))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v6 = (id *)(v0 + v3 + *(int *)(v5 + 24));
    type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for Artwork();
      (*(void (**)(id *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
      int64_t v8 = (char *)v6
         + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                  + 48);
      int v9 = v8[16];
      if (v9 != 255) {
        outlined consume of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(void **)v8, *((void *)v8 + 1), v9);
      }
    }
    else
    {
    }
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t partial apply for closure #1 in GridView.SquareGrid.Cell.body.getter()
{
  uint64_t v1 = *(void *)(type metadata accessor for GridView.SquareGrid.Cell() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return closure #1 in GridView.SquareGrid.Cell.body.getter(v2);
}

uint64_t outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined init with take of GridView.Base.ViewModel(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with copy of GridView.SquareGrid.Cell(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_227AEF078()
{
  int v1 = *(unsigned __int8 *)(v0 + 32);
  if (v1 != 255) {
    outlined consume of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(void **)(v0 + 16), *(void *)(v0 + 24), v1);
  }
  return MEMORY[0x270FA0238](v0, 33, 7);
}

id partial apply for closure #1 in closure #2 in GridView.SquareGrid.Cell.body.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void **)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(unsigned __int8 *)(v1 + 32);
  if (v5 == 255)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = swift_retain();
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    uint64_t v9 = v5;
  }
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v9;
  a1[3] = v6;
  return outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?(v3, v4, v5);
}

id outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?(id result, uint64_t a2, char a3)
{
  if (a3 != -1) {
    return outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(result, a2, a3);
  }
  return result;
}

void outlined consume of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?(void *a1, uint64_t a2, char a3)
{
  if (a3 != -1) {
    outlined consume of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(a1, a2, a3);
  }
}

uint64_t outlined init with take of ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_227AEF1D4()
{
  return lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>, _OverlayModifier<ModifiedContent<StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>, _AnimationModifier<Bool>>>>, _ScaleEffect> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>, _OverlayModifier<ModifiedContent<StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>, _AnimationModifier<Bool>>>>, _ScaleEffect> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>, _OverlayModifier<ModifiedContent<StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>, _AnimationModifier<Bool>>>>, _ScaleEffect>, (void (*)(void))lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>, _OverlayModifier<ModifiedContent<StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>, _AnimationModifier<Bool>>>> and conformance <> ModifiedContent<A, B>);
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>, _OverlayModifier<ModifiedContent<StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>, _AnimationModifier<Bool>>>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>, _OverlayModifier<ModifiedContent<StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>, _AnimationModifier<Bool>>>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>, _OverlayModifier<ModifiedContent<StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>, _AnimationModifier<Bool>>>> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>, _OverlayModifier<ModifiedContent<StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>, _AnimationModifier<Bool>>>>);
    lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>, _OverlayModifier<ModifiedContent<StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>, _AnimationModifier<Bool>>>>, _ScaleEffect> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>, (void (*)(void))lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect> and conformance <> ModifiedContent<A, B>);
    lazy protocol witness table accessor for type Button<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?> and conformance Button<A>(&lazy protocol witness table cache variable for type _OverlayModifier<ModifiedContent<StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>, _AnimationModifier<Bool>>> and conformance _OverlayModifier<A>, &demangling cache variable for type metadata for _OverlayModifier<ModifiedContent<StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>, _AnimationModifier<Bool>>>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>, _OverlayModifier<ModifiedContent<StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>, _AnimationModifier<Bool>>>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>, _OverlayModifier<ModifiedContent<StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>, _AnimationModifier<Bool>>>>, _ScaleEffect> and conformance <> ModifiedContent<A, B>(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect> and conformance <> ModifiedContent<A, B>()
{
  return lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>, _OverlayModifier<ModifiedContent<StrokeShapeView<RoundedRectangle._Inset, Color, EmptyView>, _AnimationModifier<Bool>>>>, _ScaleEffect> and conformance <> ModifiedContent<A, B>(&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect> and conformance <> ModifiedContent<A, B>, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, (void (*)(void))lazy protocol witness table accessor for type ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>);
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>);
    lazy protocol witness table accessor for type GridView.SquareGrid.Cell and conformance GridView.SquareGrid.Cell(&lazy protocol witness table cache variable for type ButtonStyleConfiguration.Label and conformance ButtonStyleConfiguration.Label, MEMORY[0x263F1A0D0]);
    lazy protocol witness table accessor for type Button<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?> and conformance Button<A>(&lazy protocol witness table cache variable for type _ClipEffect<RoundedRectangle> and conformance _ClipEffect<A>, &demangling cache variable for type metadata for _ClipEffect<RoundedRectangle>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type GridView.SquareGrid.Cell and conformance GridView.SquareGrid.Cell(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type Button<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?> and conformance Button<A>(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

double static GridView.Layout<>.pins.getter@<D0>(uint64_t a1@<X8>)
{
  double result = 8.0;
  *(_OWORD *)a1 = xmmword_227B01700;
  *(_OWORD *)(a1 + 16) = xmmword_227B01710;
  *(void *)(a1 + 32) = 0;
  return result;
}

double GridView.Pins.Layout.itemSpacing.getter()
{
  return *(double *)v0;
}

double GridView.Pins.Layout.contentInsets.getter()
{
  return *(double *)(v0 + 8);
}

Swift::UInt __swiftcall GridView.Pins.Layout.numberOfViewsPerLine(for:itemsCount:)(CGSize a1, Swift::UInt itemsCount)
{
  if (a1.width <= 420.0)
  {
    if (itemsCount <= 1) {
      return 1;
    }
    else {
      return 2;
    }
  }
  else if (itemsCount <= 1)
  {
    return 1;
  }
  else if (itemsCount - 2 >= 3)
  {
    if (itemsCount <= 4) {
      __break(1u);
    }
    else {
      return 3;
    }
  }
  else
  {
    return qword_227B01740[itemsCount - 2];
  }
  return itemsCount;
}

CGSize __swiftcall GridView.Pins.Layout.sizeForViews(for:itemsCount:)(CGSize a1, Swift::UInt itemsCount)
{
  double v3 = *v2;
  if (a1.width <= 420.0)
  {
    double v5 = (a1.width - v3) * 0.5;
    double v4 = a1.width + v3 * -0.0;
    double v6 = 44.0;
    if (itemsCount > 1)
    {
      double v6 = 44.0;
      double v4 = v5;
    }
  }
  else
  {
    if (itemsCount <= 1)
    {
      double v4 = a1.width + v3 * -0.0;
    }
    else if (itemsCount == 2 || itemsCount == 4)
    {
      double v4 = (a1.width - v3) * 0.5;
    }
    else
    {
      double v4 = (a1.width - (v3 + v3)) / 3.0;
    }
    double v6 = 52.0;
  }
  result.height = v6;
  result.width = v4;
  return result;
}

CGSize __swiftcall GridView.Pins.Layout.sizeThatFits(_:itemsCount:)(CGSize _, Swift::UInt itemsCount)
{
  double width = _.width;
  double v5 = *(double *)v2;
  long long v11 = *(_OWORD *)(v2 + 8);
  long long v12 = *(_OWORD *)(v2 + 24);
  CGSize v7 = GridView.Pins.Layout.sizeForViews(for:itemsCount:)((CGSize)__PAIR128__(*(void *)(v2 + 8), *(unint64_t *)&_.width), itemsCount);
  double height = v7.height;
  if (width <= 420.0)
  {
    double v8 = 1.0;
    if (itemsCount > 1) {
      double v8 = 2.0;
    }
  }
  else
  {
    double v8 = 1.0;
    if (itemsCount > 1)
    {
      if (itemsCount - 2 > 2)
      {
        double v8 = 3.0;
        if (itemsCount <= 4)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
      else
      {
        double v8 = dbl_227B01758[itemsCount - 2];
      }
    }
  }
  double v9 = fmax(ceil((double)itemsCount / v8), 1.0);
  double height = *(double *)&v12 + *(double *)&v11 + v7.height * v9 + v5 * (v9 + -1.0);
  double v8 = width;
LABEL_10:
  result.double height = height;
  result.double width = v8;
  return result;
}

double protocol witness for GridView.Layout.itemSpacing.getter in conformance GridView.Pins.Layout()
{
  return *(double *)v0;
}

double protocol witness for GridView.Layout.contentInsets.getter in conformance GridView.Pins.Layout()
{
  return *(double *)(v0 + 8);
}

Swift::UInt protocol witness for GridView.Layout.numberOfViewsPerLine(for:itemsCount:) in conformance GridView.Pins.Layout(Swift::UInt a1, double a2, double a3)
{
  return GridView.Pins.Layout.numberOfViewsPerLine(for:itemsCount:)((CGSize)__PAIR128__(*(unint64_t *)&a3, *(unint64_t *)&a2), a1);
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for GridView.Pins.Layout(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for GridView.Pins.Layout(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 40) = v3;
  return result;
}

ValueMetadata *type metadata accessor for GridView.Pins.Layout()
{
  return &type metadata for GridView.Pins.Layout;
}

uint64_t GridView.Pins.Cell.init(viewModel:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _s9CarPlayUI8GridViewC4BaseO0E5ModelVWObTm_0(a1, a2, type metadata accessor for GridView.Base.ViewModel);
  uint64_t v3 = type metadata accessor for GridView.Base.ViewModel(0);
  double v4 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
  return v4(a2, 0, 1, v3);
}

uint64_t GridView.Pins.Cell.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  v19[1] = a1;
  v19[0] = type metadata accessor for GridView.Pins.Cell.ButtonStyle(0);
  uint64_t v3 = MEMORY[0x270FA5388](v19[0]);
  double v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  CGSize v7 = (char *)v19 - v6;
  uint64_t v8 = type metadata accessor for GridView.Pins.Cell(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Button<GridView.Pins.Cell.Content>);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of GridView.Pins.Cell(v1, (uint64_t)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for GridView.Pins.Cell);
  unint64_t v15 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v16 = swift_allocObject();
  _s9CarPlayUI8GridViewC4BaseO0E5ModelVWObTm_0((uint64_t)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15, type metadata accessor for GridView.Pins.Cell);
  v19[4] = v2;
  type metadata accessor for GridView.Pins.Cell.Content(0);
  lazy protocol witness table accessor for type GridView.Pins.Cell.Content and conformance GridView.Pins.Cell.Content(&lazy protocol witness table cache variable for type GridView.Pins.Cell.Content and conformance GridView.Pins.Cell.Content, (void (*)(uint64_t))type metadata accessor for GridView.Pins.Cell.Content);
  Button.init(action:label:)();
  *(void *)double v5 = swift_getKeyPath();
  v5[8] = 0;
  uint64_t v17 = (uint64_t *)&v5[*(int *)(v19[0] + 20)];
  uint64_t *v17 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  swift_storeEnumTagMultiPayload();
  _s9CarPlayUI8GridViewC4BaseO0E5ModelVWObTm_0((uint64_t)v5, (uint64_t)v7, type metadata accessor for GridView.Pins.Cell.ButtonStyle);
  lazy protocol witness table accessor for type Button<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?> and conformance Button<A>(&lazy protocol witness table cache variable for type Button<GridView.Pins.Cell.Content> and conformance Button<A>, &demangling cache variable for type metadata for Button<GridView.Pins.Cell.Content>);
  lazy protocol witness table accessor for type GridView.Pins.Cell.Content and conformance GridView.Pins.Cell.Content(&lazy protocol witness table cache variable for type GridView.Pins.Cell.ButtonStyle and conformance GridView.Pins.Cell.ButtonStyle, (void (*)(uint64_t))type metadata accessor for GridView.Pins.Cell.ButtonStyle);
  View.buttonStyle<A>(_:)();
  outlined destroy of GridView.Pins.Cell.ButtonStyle((uint64_t)v7, type metadata accessor for GridView.Pins.Cell.ButtonStyle);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t type metadata accessor for GridView.Pins.Cell.ButtonStyle(uint64_t a1)
{
  return type metadata accessor for GridView.Pins.Cell.ButtonStyle(a1, (uint64_t *)&type metadata singleton initialization cache for GridView.Pins.Cell.ButtonStyle);
}

uint64_t type metadata accessor for GridView.Pins.Cell(uint64_t a1)
{
  return type metadata accessor for GridView.Pins.Cell.ButtonStyle(a1, (uint64_t *)&type metadata singleton initialization cache for GridView.Pins.Cell);
}

uint64_t closure #1 in GridView.Pins.Cell.body.getter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel?);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>(a1, (uint64_t)v4, &demangling cache variable for type metadata for GridView.Base.ViewModel?);
  uint64_t v5 = type metadata accessor for GridView.Base.ViewModel(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5) == 1) {
    return outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v4, &demangling cache variable for type metadata for GridView.Base.ViewModel?);
  }
  CGSize v7 = *(void (**)(uint64_t))&v4[*(int *)(v5 + 28)];
  swift_retain();
  uint64_t v8 = outlined destroy of GridView.Pins.Cell.ButtonStyle((uint64_t)v4, type metadata accessor for GridView.Base.ViewModel);
  v7(v8);
  return swift_release();
}

uint64_t sub_227AEFD80()
{
  uint64_t v1 = *(void *)(type metadata accessor for GridView.Pins.Cell(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = type metadata accessor for GridView.Base.ViewModel(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v0 + v3, 1, v5))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v6 = (id *)(v0 + v3 + *(int *)(v5 + 24));
    type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for Artwork();
      (*(void (**)(id *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
      uint64_t v8 = (char *)v6
         + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                  + 48);
      int v9 = v8[16];
      if (v9 != 255) {
        outlined consume of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(void **)v8, *((void *)v8 + 1), v9);
      }
    }
    else
    {
    }
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t _s9CarPlayUI8GridViewC4BaseO0E5ModelVWObTm_0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t partial apply for closure #1 in GridView.Pins.Cell.body.getter()
{
  uint64_t v1 = *(void *)(type metadata accessor for GridView.Pins.Cell(0) - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return closure #1 in GridView.Pins.Cell.body.getter(v2);
}

uint64_t closure #2 in GridView.Pins.Cell.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel.ImageConfiguration?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v25 = (uint64_t)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel?);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v25 - v9;
  uint64_t v11 = (int *)type metadata accessor for GridView.Pins.Cell.Content(0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (uint64_t *)((char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = a1;
  outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>(a1, (uint64_t)v10, &demangling cache variable for type metadata for GridView.Base.ViewModel?);
  uint64_t v15 = type metadata accessor for GridView.Base.ViewModel(0);
  uint64_t v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
  if (v16(v10, 1, v15) == 1)
  {
    outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v10, &demangling cache variable for type metadata for GridView.Base.ViewModel?);
    uint64_t v17 = 0;
    unint64_t v18 = 0xE000000000000000;
  }
  else
  {
    uint64_t v17 = *((void *)v10 + 2);
    unint64_t v18 = *((void *)v10 + 3);
    swift_bridgeObjectRetain();
    outlined destroy of GridView.Pins.Cell.ButtonStyle((uint64_t)v10, type metadata accessor for GridView.Base.ViewModel);
  }
  outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>(v14, (uint64_t)v8, &demangling cache variable for type metadata for GridView.Base.ViewModel?);
  if (v16(v8, 1, v15) == 1)
  {
    outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v8, &demangling cache variable for type metadata for GridView.Base.ViewModel?);
    uint64_t v19 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
    uint64_t v20 = v25;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v25, 1, 1, v19);
  }
  else
  {
    uint64_t v20 = v25;
    outlined init with copy of GridView.Pins.Cell((uint64_t)&v8[*(int *)(v15 + 24)], v25, type metadata accessor for GridView.Base.ViewModel.ImageConfiguration);
    outlined destroy of GridView.Pins.Cell.ButtonStyle((uint64_t)v8, type metadata accessor for GridView.Base.ViewModel);
    uint64_t v21 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v20, 0, 1, v21);
  }
  void *v13 = v17;
  v13[1] = v18;
  outlined init with take of ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>(v20, (uint64_t)v13 + v11[5], &demangling cache variable for type metadata for GridView.Base.ViewModel.ImageConfiguration?);
  uint64_t v22 = (char *)v13 + v11[6];
  *(void *)uint64_t v22 = swift_getKeyPath();
  v22[8] = 0;
  uint64_t v23 = (char *)v13 + v11[7];
  *(void *)uint64_t v23 = swift_getKeyPath();
  v23[8] = 0;
  return _s9CarPlayUI8GridViewC4BaseO0E5ModelVWObTm_0((uint64_t)v13, v26, type metadata accessor for GridView.Pins.Cell.Content);
}

uint64_t partial apply for closure #2 in GridView.Pins.Cell.body.getter@<X0>(uint64_t a1@<X8>)
{
  return closure #2 in GridView.Pins.Cell.body.getter(*(void *)(v1 + 16), a1);
}

uint64_t type metadata accessor for GridView.Pins.Cell.Content(uint64_t a1)
{
  return type metadata accessor for GridView.Pins.Cell.ButtonStyle(a1, (uint64_t *)&type metadata singleton initialization cache for GridView.Pins.Cell.Content);
}

uint64_t type metadata accessor for GridView.Pins.Cell.ButtonStyle(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t GridView.Pins.Cell.Content.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>, _PaddingLayout>, ModifiedContent<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>)>>);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>, _PaddingLayout>, ModifiedContent<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>)>>, _FlexFrameLayout>);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel.ImageConfiguration?);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for GridView.Pins.Cell.Content(0);
  outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>(v2 + *(int *)(v13 + 20), (uint64_t)v12, &demangling cache variable for type metadata for GridView.Base.ViewModel.ImageConfiguration?);
  uint64_t v14 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v12, 1, v14) == 1)
  {
    outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v12, &demangling cache variable for type metadata for GridView.Base.ViewModel.ImageConfiguration?);
LABEL_4:
    uint64_t v34 = MEMORY[0x263F1BA90];
    unint64_t v35 = lazy protocol witness table accessor for type Rectangle and conformance Rectangle();
    goto LABEL_9;
  }
  int v15 = v12[*(int *)(v14 + 20)];
  outlined destroy of GridView.Pins.Cell.ButtonStyle((uint64_t)v12, type metadata accessor for GridView.Base.ViewModel.ImageConfiguration);
  if (v15 == 2) {
    goto LABEL_4;
  }
  if (v15)
  {
    uint64_t v30 = MEMORY[0x263F1B638];
    unint64_t v31 = lazy protocol witness table accessor for type Circle and conformance Circle();
  }
  else
  {
    uint64_t v16 = type metadata accessor for RoundedRectangle();
    uint64_t v30 = v16;
    unint64_t v31 = lazy protocol witness table accessor for type GridView.Pins.Cell.Content and conformance GridView.Pins.Cell.Content(&lazy protocol witness table cache variable for type RoundedRectangle and conformance RoundedRectangle, MEMORY[0x263F19048]);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v29);
    unint64_t v18 = (char *)boxed_opaque_existential_1 + *(int *)(v16 + 20);
    uint64_t v19 = *MEMORY[0x263F19860];
    uint64_t v20 = type metadata accessor for RoundedCornerStyle();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104))(v18, v19, v20);
    __asm { FMOV            V0.2D, #5.0 }
    *(_OWORD *)boxed_opaque_existential_1 = _Q0;
  }
  outlined init with take of InsettableShape(&v29, (uint64_t)v32);
  outlined init with take of InsettableShape(v32, (uint64_t)v33);
LABEL_9:
  outlined init with copy of InsettableShape((uint64_t)v33, (uint64_t)v32);
  *(void *)uint64_t v6 = static VerticalAlignment.center.getter();
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _VariadicView.Tree<_HStackLayout, TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>, _PaddingLayout>, ModifiedContent<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>)>>);
  closure #1 in GridView.Pins.Cell.Content.body.getter(v2, v32, (uint64_t)&v6[*(int *)(v26 + 44)]);
  static Alignment.center.getter();
  specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v9, 0.0, 1, 0.0, 1);
  outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v6, &demangling cache variable for type metadata for HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>, _PaddingLayout>, ModifiedContent<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>)>>);
  outlined init with take of ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>((uint64_t)v9, a1, &demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>, _PaddingLayout>, ModifiedContent<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>)>>, _FlexFrameLayout>);
  outlined destroy of AnyInsettableShape((uint64_t)v32);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v33);
}

uint64_t closure #1 in GridView.Pins.Cell.Content.body.getter@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v108 = a3;
  *(void *)&long long v105 = type metadata accessor for GridView.Pins.Cell.Content(0);
  MEMORY[0x270FA5388](v105);
  uint64_t v106 = (uint64_t)&v95 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v95 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v95 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>);
  uint64_t v14 = v13 - 8;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v95 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v98 = (uint64_t)&v95 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>);
  MEMORY[0x270FA5388](v97);
  uint64_t v20 = (char *)&v95 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>);
  MEMORY[0x270FA5388](v99);
  v102 = (char *)&v95 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>, _PaddingLayout>);
  uint64_t v22 = MEMORY[0x270FA5388](v101);
  uint64_t v107 = (uint64_t)&v95 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v100 = (uint64_t)&v95 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v109 = (uint64_t)&v95 - v26;
  v104 = (void *)a1;
  closure #1 in closure #1 in GridView.Pins.Cell.Content.body.getter(a1, (uint64_t)v8);
  outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v8, (uint64_t)v12, &demangling cache variable for type metadata for Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>);
  int v27 = &v12[*(int *)(v10 + 44)];
  *(void *)int v27 = 0x3FF0000000000000;
  *((_WORD *)v27 + 4) = 256;
  outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v8, &demangling cache variable for type metadata for Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>);
  uint64_t v28 = static Alignment.center.getter();
  uint64_t v95 = v29;
  uint64_t v96 = v28;
  uint64_t v30 = (uint64_t)&v16[*(int *)(v14 + 44)];
  uint64_t v31 = a2[3];
  v103 = a2;
  __swift_project_boxed_opaque_existential_1(a2, v31);
  *((void *)&v111 + 1) = swift_getAssociatedTypeWitness();
  *(void *)&long long v112 = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v110);
  dispatch thunk of InsettableShape.inset(by:)();
  outlined init with copy of AnyInsettableShape((uint64_t)&v110, (uint64_t)v123);
  BYTE8(v124) = 0;
  outlined destroy of AnyInsettableShape((uint64_t)&v110);
  if (one-time initialization token for color != -1) {
    swift_once();
  }
  uint64_t v32 = static GridView.Pins.Cell.Specs.Image.InnerStroke.color;
  outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v123, v30, &demangling cache variable for type metadata for _ShapeSubtraction<Rectangle, AnyInsettableShape>);
  *(void *)(v30 + 48) = v32;
  *(_WORD *)(v30 + 56) = 256;
  swift_retain();
  outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v123, &demangling cache variable for type metadata for _ShapeSubtraction<Rectangle, AnyInsettableShape>);
  uint64_t v33 = v95;
  *(void *)(v30 + 64) = v96;
  *(void *)(v30 + 72) = v33;
  outlined init with take of ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>((uint64_t)v12, (uint64_t)v16, &demangling cache variable for type metadata for ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>);
  uint64_t v34 = v98;
  outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v16, v98, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>);
  outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v16, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>);
  uint64_t v35 = (uint64_t)&v20[*(int *)(v97 + 36)];
  outlined init with copy of AnyInsettableShape((uint64_t)v103, v35);
  *(_WORD *)(v35 + 40) = 256;
  outlined init with take of ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>(v34, (uint64_t)v20, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>);
  if (one-time initialization token for color != -1) {
    swift_once();
  }
  uint64_t v36 = static GridView.Pins.Cell.Specs.Image.Shadow.color;
  uint64_t v37 = (uint64_t)v102;
  if (one-time initialization token for radius != -1) {
    swift_once();
  }
  uint64_t v38 = static GridView.Pins.Cell.Specs.Image.Shadow.radius;
  if (one-time initialization token for yOffset != -1) {
    swift_once();
  }
  uint64_t v39 = static GridView.Pins.Cell.Specs.Image.Shadow.yOffset;
  outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v20, v37, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>);
  id v40 = (uint64_t *)(v37 + *(int *)(v99 + 36));
  *id v40 = v36;
  v40[1] = v38;
  v40[2] = 0;
  v40[3] = v39;
  swift_retain();
  outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v20, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>);
  if (one-time initialization token for padding != -1) {
    swift_once();
  }
  char v41 = static Edge.Set.all.getter();
  EdgeInsets.init(_all:)();
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  uint64_t v49 = v48;
  uint64_t v50 = v100;
  outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>(v37, v100, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>);
  uint64_t v51 = v50 + *(int *)(v101 + 36);
  *(unsigned char *)uint64_t v51 = v41;
  *(void *)(v51 + 8) = v43;
  *(void *)(v51 + 16) = v45;
  *(void *)(v51 + 24) = v47;
  *(void *)(v51 + 32) = v49;
  *(unsigned char *)(v51 + 40) = 0;
  outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>(v37, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>);
  outlined init with take of ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>(v50, v109, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>, _PaddingLayout>);
  uint64_t v52 = v104;
  uint64_t v53 = v104[1];
  *(void *)&v123[0] = *v104;
  *((void *)&v123[0] + 1) = v53;
  lazy protocol witness table accessor for type String and conformance String();
  swift_bridgeObjectRetain();
  uint64_t v54 = Text.init<A>(_:)();
  uint64_t v56 = v55;
  char v58 = v57;
  v103 = (void *)v59;
  uint64_t v60 = v105;
  uint64_t v61 = (char *)v52 + *(int *)(v105 + 24);
  uint64_t v62 = *(void *)v61;
  char v63 = v61[8];
  outlined copy of Environment<Bool>.Content(*(void *)v61, v63);
  char v64 = specialized Environment.wrappedValue.getter(v62, v63);
  outlined consume of Environment<Bool>.Content(v62, v63);
  uint64_t v65 = (uint64_t)v52;
  uint64_t v66 = v106;
  outlined init with copy of GridView.Pins.Cell(v65, v106, type metadata accessor for GridView.Pins.Cell.Content);
  if (v64)
  {
    outlined destroy of GridView.Pins.Cell.ButtonStyle(v66, type metadata accessor for GridView.Pins.Cell.Content);
    v67 = &selRef__carSystemFocusLabelColor;
  }
  else
  {
    uint64_t v68 = v66 + *(int *)(v60 + 28);
    uint64_t v69 = *(void *)v68;
    char v70 = *(unsigned char *)(v68 + 8);
    outlined copy of Environment<Bool>.Content(*(void *)v68, v70);
    char v71 = specialized Environment.wrappedValue.getter(v69, v70);
    outlined consume of Environment<Bool>.Content(v69, v70);
    outlined destroy of GridView.Pins.Cell.ButtonStyle(v66, type metadata accessor for GridView.Pins.Cell.Content);
    if (v71) {
      v67 = &selRef__carSystemFocusLabelColor;
    }
    else {
      v67 = &selRef_labelColor;
    }
  }
  id v72 = [self *v67];
  *(void *)&v123[0] = MEMORY[0x22A684050](v72);
  uint64_t v73 = Text.foregroundStyle<A>(_:)();
  uint64_t v106 = v74;
  char v76 = v75;
  uint64_t v78 = v77;
  outlined consume of Text.Storage(v54, v56, v58 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  if (one-time initialization token for padding != -1) {
    swift_once();
  }
  char v79 = v76 & 1;
  long long v105 = static GridView.Pins.Cell.Specs.Text.padding;
  uint64_t v80 = qword_2681B98B0;
  uint64_t v81 = unk_2681B98B8;
  char v82 = static Edge.Set.all.getter();
  uint64_t v83 = v106;
  uint64_t v147 = v73;
  uint64_t v148 = v106;
  char v149 = v79;
  uint64_t v150 = v78;
  char v151 = v82;
  long long v152 = v105;
  uint64_t v153 = v80;
  uint64_t v154 = v81;
  char v155 = 0;
  static Alignment.leading.getter();
  specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, &v135, 0.0, 1, INFINITY, 0);
  outlined consume of Text.Storage(v73, v83, v79);
  swift_bridgeObjectRelease();
  uint64_t v84 = v109;
  uint64_t v85 = v107;
  outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>(v109, v107, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>, _PaddingLayout>);
  uint64_t v86 = v108;
  outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>(v85, v108, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>, _PaddingLayout>);
  uint64_t v87 = v86
      + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>, _PaddingLayout>, ModifiedContent<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>))
               + 48);
  long long v118 = v143;
  long long v119 = v144;
  long long v120 = v145;
  long long v121 = v146;
  long long v114 = v139;
  long long v115 = v140;
  long long v116 = v141;
  long long v117 = v142;
  long long v110 = v135;
  long long v111 = v136;
  long long v112 = v137;
  long long v113 = v138;
  uint64_t v122 = 0x3FF0000000000000;
  *(void *)(v87 + 192) = 0x3FF0000000000000;
  long long v88 = v121;
  *(_OWORD *)(v87 + 160) = v120;
  *(_OWORD *)(v87 + 176) = v88;
  long long v89 = v117;
  *(_OWORD *)(v87 + 96) = v116;
  *(_OWORD *)(v87 + 112) = v89;
  long long v90 = v119;
  *(_OWORD *)(v87 + 128) = v118;
  *(_OWORD *)(v87 + 144) = v90;
  long long v91 = v113;
  *(_OWORD *)(v87 + 32) = v112;
  *(_OWORD *)(v87 + 48) = v91;
  long long v92 = v115;
  *(_OWORD *)(v87 + 64) = v114;
  *(_OWORD *)(v87 + 80) = v92;
  long long v93 = v111;
  *(_OWORD *)uint64_t v87 = v110;
  *(_OWORD *)(v87 + 16) = v93;
  outlined retain of ModifiedContent<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>((uint64_t)&v110);
  outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>(v84, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>, _PaddingLayout>);
  long long v130 = v143;
  long long v131 = v144;
  long long v132 = v145;
  long long v133 = v146;
  long long v126 = v139;
  long long v127 = v140;
  long long v128 = v141;
  long long v129 = v142;
  v123[0] = v135;
  v123[1] = v136;
  long long v124 = v137;
  long long v125 = v138;
  uint64_t v134 = 0x3FF0000000000000;
  outlined release of ModifiedContent<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>((uint64_t)v123);
  return outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>(v85, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>, _PaddingLayout>);
}

uint64_t closure #1 in closure #1 in GridView.Pins.Cell.Content.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v69 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Artwork?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = &v52[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = type metadata accessor for ArtworkImage();
  uint64_t v58 = *(void *)(v6 - 8);
  uint64_t v59 = v6;
  MEMORY[0x270FA5388](v6);
  char v57 = &v52[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0);
  uint64_t v62 = *(void *)(v67 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v67);
  uint64_t v56 = &v52[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v8);
  uint64_t v61 = &v52[-v10];
  uint64_t v65 = type metadata accessor for Artwork();
  uint64_t v60 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  char v64 = &v52[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>.Storage);
  MEMORY[0x270FA5388](v63);
  uint64_t v13 = (uint64_t *)&v52[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>);
  uint64_t v14 = *(void *)(v68 - 8);
  MEMORY[0x270FA5388](v68);
  uint64_t v66 = &v52[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel.ImageConfiguration?);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = &v52[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v19 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  uint64_t v22 = (id *)&v52[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = &v52[-v24];
  MEMORY[0x270FA5388](v23);
  int v27 = &v52[-v26];
  uint64_t v28 = type metadata accessor for GridView.Pins.Cell.Content(0);
  outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>(a1 + *(int *)(v28 + 20), (uint64_t)v18, &demangling cache variable for type metadata for GridView.Base.ViewModel.ImageConfiguration?);
  uint64_t v29 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v29 - 8) + 48))(v18, 1, v29) == 1)
  {
    outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v18, &demangling cache variable for type metadata for GridView.Base.ViewModel.ImageConfiguration?);
    uint64_t v30 = 1;
    uint64_t v31 = v69;
  }
  else
  {
    outlined init with copy of GridView.Pins.Cell((uint64_t)v18, (uint64_t)v25, type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image);
    outlined destroy of GridView.Pins.Cell.ButtonStyle((uint64_t)v18, type metadata accessor for GridView.Base.ViewModel.ImageConfiguration);
    _s9CarPlayUI8GridViewC4BaseO0E5ModelVWObTm_0((uint64_t)v25, (uint64_t)v27, type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image);
    outlined init with copy of GridView.Pins.Cell((uint64_t)v27, (uint64_t)v22, type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v32 = (char *)v22
          + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                   + 48);
      uint64_t v33 = *((void *)v32 + 1);
      uint64_t v55 = *(void **)v32;
      uint64_t v34 = v60;
      int v35 = v32[16];
      uint64_t v37 = v64;
      uint64_t v36 = v65;
      (*(void (**)(unsigned char *, id *, uint64_t))(v60 + 32))(v64, v22, v65);
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v34 + 16))(v5, v37, v36);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v34 + 56))(v5, 0, 1, v36);
      uint64_t v38 = v57;
      ArtworkImage.init(_:)();
      uint64_t v39 = swift_allocObject();
      id v40 = v55;
      *(void *)(v39 + 16) = v55;
      *(void *)(v39 + 24) = v33;
      uint64_t v54 = v33;
      int v53 = v35;
      *(unsigned char *)(v39 + 32) = v35;
      outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?(v40, v33, v35);
      uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.Placeholder?);
      unint64_t v42 = lazy protocol witness table accessor for type GridView.Base.Placeholder? and conformance <A> A?();
      uint64_t v43 = v56;
      ArtworkImage.artworkPlaceholder<A>(_:)();
      swift_release();
      (*(void (**)(unsigned char *, uint64_t))(v58 + 8))(v38, v59);
      uint64_t v45 = v61;
      uint64_t v44 = v62;
      uint64_t v46 = v67;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v62 + 32))(v61, v43, v67);
      (*(void (**)(uint64_t *, unsigned char *, uint64_t))(v44 + 16))(v13, v45, v46);
      swift_storeEnumTagMultiPayload();
      uint64_t v70 = v41;
      unint64_t v71 = v42;
      swift_getOpaqueTypeConformance2();
      uint64_t v47 = (uint64_t)v66;
      _ConditionalContent<>.init(storage:)();
      outlined consume of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?(v55, v54, v53);
      (*(void (**)(unsigned char *, uint64_t))(v44 + 8))(v45, v46);
      (*(void (**)(unsigned char *, uint64_t))(v34 + 8))(v64, v65);
    }
    else
    {
      id v48 = *v22;
      uint64_t *v13 = Image.init(uiImage:)();
      swift_storeEnumTagMultiPayload();
      swift_retain();
      uint64_t v49 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for GridView.Base.Placeholder?);
      unint64_t v50 = lazy protocol witness table accessor for type GridView.Base.Placeholder? and conformance <A> A?();
      uint64_t v70 = v49;
      unint64_t v71 = v50;
      swift_getOpaqueTypeConformance2();
      uint64_t v47 = (uint64_t)v66;
      _ConditionalContent<>.init(storage:)();
      swift_release();
    }
    outlined destroy of GridView.Pins.Cell.ButtonStyle((uint64_t)v27, type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image);
    uint64_t v31 = v69;
    outlined init with take of ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>(v47, v69, &demangling cache variable for type metadata for _ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>);
    uint64_t v30 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v31, v30, 1, v68);
}

__n128 specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    uint64_t v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>(v13, a9, &demangling cache variable for type metadata for HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>, _PaddingLayout>, ModifiedContent<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>)>>);
  uint64_t v24 = (_OWORD *)(a9
                 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>, _PaddingLayout>, ModifiedContent<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>)>>, _FlexFrameLayout>)
                          + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *uint64_t v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t specialized View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    uint64_t v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  long long v24 = v13[3];
  a9[2] = v13[2];
  a9[3] = v24;
  *(_OWORD *)((char *)a9 + 57) = *(_OWORD *)((char *)v13 + 57);
  long long v25 = v13[1];
  *a9 = *v13;
  a9[1] = v25;
  a9[9] = v31;
  a9[10] = v32;
  a9[11] = v33;
  a9[5] = v27;
  a9[6] = v28;
  a9[7] = v29;
  a9[8] = v30;
  return outlined retain of ModifiedContent<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>((uint64_t)v13);
}

uint64_t EnvironmentValues.isHighlighted.getter()
{
  lazy protocol witness table accessor for type IsHighlightedKey and conformance IsHighlightedKey();
  EnvironmentValues.subscript.getter();
  return v1;
}

uint64_t GridView.Pins.Cell.ButtonStyle.makeBody(configuration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v49 = a2;
  uint64_t v47 = type metadata accessor for RoundedRectangle();
  MEMORY[0x270FA5388](v47);
  id v48 = (uint64_t *)((char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v41 = type metadata accessor for ButtonStyleConfiguration();
  uint64_t v4 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  id v40 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ButtonStyleConfiguration.Label();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>>);
  MEMORY[0x270FA5388](v43);
  uint64_t v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>>, _CompositingGroupEffect>);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v46 = (uint64_t)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>>, _CompositingGroupEffect>, _ClipEffect<RoundedRectangle>>);
  MEMORY[0x270FA5388](v44);
  uint64_t v45 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  ButtonStyleConfiguration.label.getter();
  uint64_t KeyPath = swift_getKeyPath();
  char v20 = ButtonStyleConfiguration.isPressed.getter();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v9, v6);
  uint64_t v21 = &v13[*(int *)(v11 + 44)];
  *(void *)uint64_t v21 = KeyPath;
  v21[8] = v20 & 1;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v22 = *(void *)v42;
  LOBYTE(v9) = *(unsigned char *)(v42 + 8);
  outlined copy of Environment<Bool>.Content(*(void *)v42, (char)v9);
  LOBYTE(v11) = specialized Environment.wrappedValue.getter(v22, (char)v9);
  uint64_t v23 = v22;
  char v24 = (char)v9;
  long long v26 = v40;
  uint64_t v25 = v41;
  outlined consume of Environment<Bool>.Content(v23, v24);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v26, a1, v25);
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v26, v25);
LABEL_4:
    if (one-time initialization token for color != -1) {
      swift_once();
    }
    long long v28 = &static GridView.Pins.Cell.Specs.Highlight.color;
    goto LABEL_10;
  }
  char v27 = ButtonStyleConfiguration.isPressed.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v26, v25);
  if (v27) {
    goto LABEL_4;
  }
  if (one-time initialization token for color != -1) {
    swift_once();
  }
  long long v28 = &static GridView.Pins.Cell.Specs.Background.color;
LABEL_10:
  uint64_t v29 = *v28;
  swift_retain();
  char v30 = static Edge.Set.all.getter();
  outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v13, (uint64_t)v15, &demangling cache variable for type metadata for ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>);
  long long v31 = &v15[*(int *)(v43 + 36)];
  *(void *)long long v31 = v29;
  v31[8] = v30;
  outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v13, &demangling cache variable for type metadata for ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>);
  uint64_t v32 = v46;
  outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v15, v46, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>>);
  outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>((uint64_t)v15, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>>);
  if (one-time initialization token for radius != -1) {
    swift_once();
  }
  uint64_t v33 = static GridView.Pins.Cell.Specs.Corner.radius;
  if (one-time initialization token for style != -1) {
    swift_once();
  }
  uint64_t v34 = type metadata accessor for RoundedCornerStyle();
  uint64_t v35 = __swift_project_value_buffer(v34, (uint64_t)static GridView.Pins.Cell.Specs.Corner.style);
  uint64_t v36 = v48;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v34 - 8) + 16))((char *)v48 + *(int *)(v47 + 20), v35, v34);
  *uint64_t v36 = v33;
  v36[1] = v33;
  uint64_t v37 = (uint64_t)v45;
  uint64_t v38 = (uint64_t)&v45[*(int *)(v44 + 36)];
  outlined init with copy of GridView.Pins.Cell((uint64_t)v36, v38, MEMORY[0x263F19048]);
  *(_WORD *)(v38
           + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ClipEffect<RoundedRectangle>)
                    + 36)) = 256;
  outlined init with copy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>(v32, v37, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>>, _CompositingGroupEffect>);
  outlined destroy of GridView.Pins.Cell.ButtonStyle((uint64_t)v36, MEMORY[0x263F19048]);
  outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>(v32, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>>, _CompositingGroupEffect>);
  return outlined init with take of ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>, _OpacityEffect>, _ShadowEffect>(v37, v49, &demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>>, _CompositingGroupEffect>, _ClipEffect<RoundedRectangle>>);
}

id one-time initialization function for color()
{
  id result = objc_msgSend(self, sel_tableCellPlainBackgroundColor);
  if (result)
  {
    id result = (id)MEMORY[0x22A684050]();
    static GridView.Pins.Cell.Specs.Background.color = (uint64_t)result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void one-time initialization function for padding()
{
  static GridView.Pins.Cell.Specs.Image.padding = 0x4020000000000000;
}

{
  static GridView.Pins.Cell.Specs.Text.padding = 0uLL;
  qword_2681B98B0 = 0;
  unk_2681B98B8 = 0x4028000000000000;
}

uint64_t one-time initialization function for color(uint64_t a1)
{
  return one-time initialization function for color(a1, MEMORY[0x263F1B3E8], &static GridView.Pins.Cell.Specs.Image.InnerStroke.color);
}

{
  return one-time initialization function for color(a1, MEMORY[0x263F1B3C0], &static GridView.Pins.Cell.Specs.Image.Shadow.color);
}

uint64_t one-time initialization function for color(uint64_t a1, void (*a2)(void), uint64_t *a3)
{
  a2();
  uint64_t v4 = Color.opacity(_:)();
  uint64_t result = swift_release();
  *a3 = v4;
  return result;
}

uint64_t protocol witness for GridView.Base.Cell.init(viewModel:) in conformance GridView.Pins.Cell@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _s9CarPlayUI8GridViewC4BaseO0E5ModelVWObTm_0(a1, a2, type metadata accessor for GridView.Base.ViewModel);
  uint64_t v3 = type metadata accessor for GridView.Base.ViewModel(0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
  return v4(a2, 0, 1, v3);
}

uint64_t protocol witness for InsettableShape.inset(by:) in conformance AnyInsettableShape@<X0>(uint64_t *a1@<X8>)
{
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  a1[3] = swift_getAssociatedTypeWitness();
  a1[4] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(a1);
  return dispatch thunk of InsettableShape.inset(by:)();
}

double protocol witness for Shape.path(in:) in conformance AnyInsettableShape@<D0>(uint64_t a1@<X8>)
{
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  dispatch thunk of Shape.path(in:)();
  double result = *(double *)&v4;
  *(_OWORD *)a1 = v4;
  *(_OWORD *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  return result;
}

uint64_t protocol witness for static Shape.role.getter in conformance AnyInsettableShape()
{
  return MEMORY[0x270F047E8]();
}

uint64_t protocol witness for Shape.layoutDirectionBehavior.getter in conformance AnyInsettableShape()
{
  return MEMORY[0x270F047D8]();
}

uint64_t protocol witness for Shape.sizeThatFits(_:) in conformance AnyInsettableShape()
{
  return MEMORY[0x270F047C8]();
}

void (*protocol witness for Animatable.animatableData.modify in conformance AnyInsettableShape(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = Animatable<>.animatableData.modify();
  return protocol witness for Animatable.animatableData.modify in conformance AnyInsettableShape;
}

void protocol witness for Animatable.animatableData.modify in conformance AnyInsettableShape(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t protocol witness for static Animatable._makeAnimatable(value:inputs:) in conformance AnyInsettableShape()
{
  return MEMORY[0x270EFEBB8]();
}

uint64_t protocol witness for static View._makeView(view:inputs:) in conformance AnyInsettableShape(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = lazy protocol witness table accessor for type AnyInsettableShape and conformance AnyInsettableShape();
  return MEMORY[0x270F04808](a1, a2, a3, v6);
}

uint64_t protocol witness for static View._makeViewList(view:inputs:) in conformance AnyInsettableShape(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = lazy protocol witness table accessor for type AnyInsettableShape and conformance AnyInsettableShape();
  return MEMORY[0x270F047D0](a1, a2, a3, v6);
}

uint64_t protocol witness for View.body.getter in conformance AnyInsettableShape(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AnyInsettableShape and conformance AnyInsettableShape();
  return MEMORY[0x270F047E0](a1, v2);
}

void protocol witness for static EnvironmentKey.defaultValue.getter in conformance IsHighlightedKey(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t protocol witness for static EnvironmentKey._valuesEqual(_:_:) in conformance IsHighlightedKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, MEMORY[0x263F8D510]);
}

uint64_t sub_227AF2910()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t key path setter for EnvironmentValues.colorScheme : EnvironmentValues(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ColorScheme();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.colorScheme.setter();
}

uint64_t lazy protocol witness table accessor for type GridView.Pins.Cell.Content and conformance GridView.Pins.Cell.Content(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for GridView.Pins.Cell(uint64_t a1)
{
  uint64_t result = lazy protocol witness table accessor for type GridView.Pins.Cell.Content and conformance GridView.Pins.Cell.Content(&lazy protocol witness table cache variable for type GridView.Pins.Cell and conformance GridView.Pins.Cell, (void (*)(uint64_t))type metadata accessor for GridView.Pins.Cell);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in GridView.Pins.Cell()
{
  return swift_getOpaqueTypeConformance2();
}

void *assignWithCopy for GridView.Pins.Cell(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for GridView.Base.ViewModel(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (v7)
  {
    if (!v8)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      a1[3] = a2[3];
      uint64_t v9 = *(int *)(v4 + 24);
      uint64_t v10 = (void **)((char *)a1 + v9);
      uint64_t v11 = (void **)((char *)a2 + v9);
      type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v12 = type metadata accessor for Artwork();
        (*(void (**)(void **, void **, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
        uint64_t v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                     + 48);
        uint64_t v14 = (char *)v10 + v13;
        uint64_t v15 = (char *)v11 + v13;
        int v16 = v15[16];
        if (v16 == 255)
        {
          long long v32 = *(_OWORD *)v15;
          v14[16] = v15[16];
          *(_OWORD *)uint64_t v14 = v32;
        }
        else
        {
          uint64_t v17 = *(void *)v15;
          uint64_t v18 = *((void *)v15 + 1);
          outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)v15, v18, v16);
          *(void *)uint64_t v14 = v17;
          *((void *)v14 + 1) = v18;
          v14[16] = v16;
        }
      }
      else
      {
        char v30 = *v11;
        char *v10 = *v11;
        id v31 = v30;
      }
      swift_storeEnumTagMultiPayload();
      uint64_t v33 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
      *((unsigned char *)v10 + *(int *)(v33 + 20)) = *((unsigned char *)v11 + *(int *)(v33 + 20));
      uint64_t v34 = *(int *)(v4 + 28);
      uint64_t v35 = (void *)((char *)a1 + v34);
      uint64_t v36 = (void *)((char *)a2 + v34);
      uint64_t v37 = v36[1];
      *uint64_t v35 = *v36;
      v35[1] = v37;
      uint64_t v38 = *(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56);
      swift_retain();
      v38(a1, 0, 1, v4);
      return a1;
    }
LABEL_8:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel?);
    memcpy(a1, a2, *(void *)(*(void *)(v19 - 8) + 64));
    return a1;
  }
  if (v8)
  {
    outlined destroy of GridView.Pins.Cell.ButtonStyle((uint64_t)a1, type metadata accessor for GridView.Base.ViewModel);
    goto LABEL_8;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = *(int *)(v4 + 24);
  uint64_t v21 = (void **)((char *)a1 + v20);
  uint64_t v22 = (void **)((char *)a2 + v20);
  if (a1 != a2)
  {
    outlined destroy of GridView.Pins.Cell.ButtonStyle((uint64_t)a1 + v20, type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image);
    type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v23 = type metadata accessor for Artwork();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
      uint64_t v24 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                   + 48);
      uint64_t v25 = (char *)v21 + v24;
      long long v26 = (char *)v22 + v24;
      int v27 = v26[16];
      if (v27 == 255)
      {
        long long v41 = *(_OWORD *)v26;
        v25[16] = v26[16];
        *(_OWORD *)uint64_t v25 = v41;
      }
      else
      {
        uint64_t v28 = *(void *)v26;
        uint64_t v29 = *((void *)v26 + 1);
        outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)v26, v29, v26[16]);
        *(void *)uint64_t v25 = v28;
        *((void *)v25 + 1) = v29;
        v25[16] = v27;
      }
    }
    else
    {
      uint64_t v39 = *v22;
      *uint64_t v21 = *v22;
      id v40 = v39;
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v42 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
  *((unsigned char *)v21 + *(int *)(v42 + 20)) = *((unsigned char *)v22 + *(int *)(v42 + 20));
  uint64_t v43 = *(int *)(v4 + 28);
  uint64_t v44 = (void *)((char *)a1 + v43);
  uint64_t v45 = (void *)((char *)a2 + v43);
  uint64_t v46 = v45[1];
  *uint64_t v44 = *v45;
  v44[1] = v46;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t outlined destroy of GridView.Pins.Cell.ButtonStyle(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *assignWithTake for GridView.Pins.Cell(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for GridView.Base.ViewModel(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (v7)
  {
    if (!v8)
    {
      long long v9 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_OWORD *)a1 + 1) = v9;
      uint64_t v10 = *(int *)(v4 + 24);
      uint64_t v11 = (char *)a1 + v10;
      uint64_t v12 = (char *)a2 + v10;
      uint64_t v13 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v14 = type metadata accessor for Artwork();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
        uint64_t v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                     + 48);
        int v16 = &v11[v15];
        uint64_t v17 = &v12[v15];
        *(_OWORD *)int v16 = *(_OWORD *)v17;
        v16[16] = v17[16];
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
      }
      uint64_t v29 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
      v11[*(int *)(v29 + 20)] = v12[*(int *)(v29 + 20)];
      *(_OWORD *)((char *)a1 + *(int *)(v4 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(v4 + 28));
      (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
      return a1;
    }
LABEL_7:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel?);
    memcpy(a1, a2, *(void *)(*(void *)(v18 - 8) + 64));
    return a1;
  }
  if (v8)
  {
    outlined destroy of GridView.Pins.Cell.ButtonStyle((uint64_t)a1, type metadata accessor for GridView.Base.ViewModel);
    goto LABEL_7;
  }
  uint64_t v19 = a2[1];
  *a1 = *a2;
  a1[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = a2[3];
  a1[2] = a2[2];
  a1[3] = v20;
  swift_bridgeObjectRelease();
  uint64_t v21 = *(int *)(v4 + 24);
  uint64_t v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  if (a1 != a2)
  {
    outlined destroy of GridView.Pins.Cell.ButtonStyle((uint64_t)a1 + v21, type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image);
    uint64_t v24 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v25 = type metadata accessor for Artwork();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 32))(v22, v23, v25);
      uint64_t v26 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                   + 48);
      int v27 = &v22[v26];
      uint64_t v28 = &v23[v26];
      *(_OWORD *)int v27 = *(_OWORD *)v28;
      v27[16] = v28[16];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
    }
  }
  uint64_t v30 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
  v22[*(int *)(v30 + 20)] = v23[*(int *)(v30 + 20)];
  *(_OWORD *)((char *)a1 + *(int *)(v4 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(v4 + 28));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for GridView.Pins.Cell(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_227AF32B0);
}

uint64_t sub_227AF32B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel?);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for GridView.Pins.Cell(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_227AF3334);
}

uint64_t sub_227AF3334(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel?);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

void type metadata completion function for GridView.Pins.Cell()
{
  type metadata accessor for GridView.Base.ViewModel?(319, (unint64_t *)&lazy cache variable for type metadata for GridView.Base.ViewModel?, type metadata accessor for GridView.Base.ViewModel, MEMORY[0x263F8D8F0]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_227AF3464()
{
  lazy protocol witness table accessor for type Button<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?> and conformance Button<A>(&lazy protocol witness table cache variable for type Button<GridView.Pins.Cell.Content> and conformance Button<A>, &demangling cache variable for type metadata for Button<GridView.Pins.Cell.Content>);
  lazy protocol witness table accessor for type GridView.Pins.Cell.Content and conformance GridView.Pins.Cell.Content(&lazy protocol witness table cache variable for type GridView.Pins.Cell.ButtonStyle and conformance GridView.Pins.Cell.ButtonStyle, (void (*)(uint64_t))type metadata accessor for GridView.Pins.Cell.ButtonStyle);
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for GridView.Pins.Cell.Content(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    long long v9 = (void **)((char *)a1 + v8);
    uint64_t v10 = (void **)((char *)a2 + v8);
    uint64_t v11 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel.ImageConfiguration?);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v16 = type metadata accessor for Artwork();
        (*(void (**)(void **, void **, uint64_t))(*(void *)(v16 - 8) + 16))(v9, v10, v16);
        uint64_t v17 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                     + 48);
        uint64_t v18 = (char *)v9 + v17;
        uint64_t v19 = (char *)v10 + v17;
        int v20 = v19[16];
        if (v20 == 255)
        {
          *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
          v18[16] = v19[16];
        }
        else
        {
          uint64_t v35 = *(void *)v19;
          uint64_t v21 = *((void *)v19 + 1);
          outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)v19, v21, v20);
          *(void *)uint64_t v18 = v35;
          *((void *)v18 + 1) = v21;
          v18[16] = v20;
        }
      }
      else
      {
        uint64_t v22 = *v10;
        *long long v9 = *v10;
        id v23 = v22;
      }
      swift_storeEnumTagMultiPayload();
      *((unsigned char *)v9 + *(int *)(v11 + 20)) = *((unsigned char *)v10 + *(int *)(v11 + 20));
      (*(void (**)(void **, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v24 = a3[6];
    uint64_t v25 = (char *)v4 + v24;
    uint64_t v26 = (char *)a2 + v24;
    uint64_t v27 = *(void *)v26;
    char v28 = v26[8];
    outlined copy of Environment<Bool>.Content(*(void *)v26, v28);
    *(void *)uint64_t v25 = v27;
    v25[8] = v28;
    uint64_t v29 = a3[7];
    uint64_t v30 = (char *)v4 + v29;
    id v31 = (char *)a2 + v29;
    uint64_t v32 = *(void *)v31;
    char v33 = v31[8];
    outlined copy of Environment<Bool>.Content(*(void *)v31, v33);
    *(void *)uint64_t v30 = v32;
    v30[8] = v33;
  }
  return v4;
}

uint64_t destroy for GridView.Pins.Cell.Content(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = (id *)(a1 + a2[5]);
  uint64_t v5 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
  if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5))
  {
    type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for Artwork();
      (*(void (**)(id *, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);
      uint64_t v7 = (char *)v4
         + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                  + 48);
      int v8 = v7[16];
      if (v8 != 255) {
        outlined consume of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(void **)v7, *((void *)v7 + 1), v8);
      }
    }
    else
    {
    }
  }
  outlined consume of Environment<Bool>.Content(*(void *)(a1 + a2[6]), *(unsigned char *)(a1 + a2[6] + 8));
  uint64_t v9 = a1 + a2[7];
  uint64_t v10 = *(void *)v9;
  char v11 = *(unsigned char *)(v9 + 8);
  return outlined consume of Environment<Bool>.Content(v10, v11);
}

void *initializeWithCopy for GridView.Pins.Cell.Content(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  int v8 = (void **)((char *)a1 + v7);
  uint64_t v9 = (void **)((char *)a2 + v7);
  uint64_t v10 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel.ImageConfiguration?);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = type metadata accessor for Artwork();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v14 - 8) + 16))(v8, v9, v14);
      uint64_t v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                   + 48);
      uint64_t v16 = (char *)v8 + v15;
      uint64_t v17 = (char *)v9 + v15;
      int v18 = v17[16];
      if (v18 == 255)
      {
        *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
        v16[16] = v17[16];
      }
      else
      {
        uint64_t v33 = *(void *)v17;
        uint64_t v19 = *((void *)v17 + 1);
        outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)v17, v19, v18);
        *(void *)uint64_t v16 = v33;
        *((void *)v16 + 1) = v19;
        v16[16] = v18;
      }
    }
    else
    {
      int v20 = *v9;
      *int v8 = *v9;
      id v21 = v20;
    }
    swift_storeEnumTagMultiPayload();
    *((unsigned char *)v8 + *(int *)(v10 + 20)) = *((unsigned char *)v9 + *(int *)(v10 + 20));
    (*(void (**)(void **, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v22 = a3[6];
  id v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  uint64_t v25 = *(void *)v24;
  char v26 = v24[8];
  outlined copy of Environment<Bool>.Content(*(void *)v24, v26);
  *(void *)id v23 = v25;
  v23[8] = v26;
  uint64_t v27 = a3[7];
  char v28 = (char *)a1 + v27;
  uint64_t v29 = (char *)a2 + v27;
  uint64_t v30 = *(void *)v29;
  char v31 = v29[8];
  outlined copy of Environment<Bool>.Content(*(void *)v29, v31);
  *(void *)char v28 = v30;
  v28[8] = v31;
  return a1;
}

void *assignWithCopy for GridView.Pins.Cell.Content(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (void **)((char *)a1 + v6);
  int v8 = (void **)((char *)a2 + v6);
  uint64_t v9 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v14 = type metadata accessor for Artwork();
        (*(void (**)(void **, void **, uint64_t))(*(void *)(v14 - 8) + 16))(v7, v8, v14);
        uint64_t v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                     + 48);
        uint64_t v16 = (char *)v7 + v15;
        uint64_t v17 = (char *)v8 + v15;
        int v18 = v17[16];
        if (v18 == 255)
        {
          long long v30 = *(_OWORD *)v17;
          v16[16] = v17[16];
          *(_OWORD *)uint64_t v16 = v30;
        }
        else
        {
          uint64_t v49 = *(void *)v17;
          uint64_t v19 = *((void *)v17 + 1);
          outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)v17, v19, v18);
          *(void *)uint64_t v16 = v49;
          *((void *)v16 + 1) = v19;
          v16[16] = v18;
        }
      }
      else
      {
        char v28 = *v8;
        char *v7 = *v8;
        id v29 = v28;
      }
      swift_storeEnumTagMultiPayload();
      *((unsigned char *)v7 + *(int *)(v9 + 20)) = *((unsigned char *)v8 + *(int *)(v9 + 20));
      (*(void (**)(void **, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_20;
    }
LABEL_8:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel.ImageConfiguration?);
    memcpy(v7, v8, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_20;
  }
  if (v13)
  {
    outlined destroy of GridView.Pins.Cell.ButtonStyle((uint64_t)v7, type metadata accessor for GridView.Base.ViewModel.ImageConfiguration);
    goto LABEL_8;
  }
  if (a1 != a2)
  {
    outlined destroy of GridView.Pins.Cell.ButtonStyle((uint64_t)v7, type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image);
    type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v21 = type metadata accessor for Artwork();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v21 - 8) + 16))(v7, v8, v21);
      uint64_t v22 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                   + 48);
      id v23 = (char *)v7 + v22;
      uint64_t v24 = (char *)v8 + v22;
      int v25 = v24[16];
      if (v25 == 255)
      {
        long long v33 = *(_OWORD *)v24;
        v23[16] = v24[16];
        *(_OWORD *)id v23 = v33;
      }
      else
      {
        uint64_t v26 = *(void *)v24;
        uint64_t v27 = *((void *)v24 + 1);
        outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)v24, v27, v25);
        *(void *)id v23 = v26;
        *((void *)v23 + 1) = v27;
        v23[16] = v25;
      }
    }
    else
    {
      char v31 = *v8;
      char *v7 = *v8;
      id v32 = v31;
    }
    swift_storeEnumTagMultiPayload();
  }
  *((unsigned char *)v7 + *(int *)(v9 + 20)) = *((unsigned char *)v8 + *(int *)(v9 + 20));
LABEL_20:
  uint64_t v34 = a3[6];
  uint64_t v35 = (char *)a1 + v34;
  uint64_t v36 = (char *)a2 + v34;
  uint64_t v37 = *(void *)v36;
  char v38 = v36[8];
  outlined copy of Environment<Bool>.Content(*(void *)v36, v38);
  uint64_t v39 = *(void *)v35;
  char v40 = v35[8];
  *(void *)uint64_t v35 = v37;
  v35[8] = v38;
  outlined consume of Environment<Bool>.Content(v39, v40);
  uint64_t v41 = a3[7];
  uint64_t v42 = (char *)a1 + v41;
  uint64_t v43 = (char *)a2 + v41;
  uint64_t v44 = *(void *)v43;
  char v45 = v43[8];
  outlined copy of Environment<Bool>.Content(*(void *)v43, v45);
  uint64_t v46 = *(void *)v42;
  char v47 = v42[8];
  *(void *)uint64_t v42 = v44;
  v42[8] = v45;
  outlined consume of Environment<Bool>.Content(v46, v47);
  return a1;
}

_OWORD *initializeWithTake for GridView.Pins.Cell.Content(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  int v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel.ImageConfiguration?);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    uint64_t v12 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = type metadata accessor for Artwork();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v7, v8, v13);
      uint64_t v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                   + 48);
      uint64_t v15 = &v7[v14];
      uint64_t v16 = &v8[v14];
      *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
      v15[16] = v16[16];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
    }
    v7[*(int *)(v9 + 20)] = v8[*(int *)(v9 + 20)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v17 = a3[6];
  uint64_t v18 = a3[7];
  uint64_t v19 = (char *)a1 + v17;
  uint64_t v20 = (char *)a2 + v17;
  *(void *)uint64_t v19 = *(void *)v20;
  v19[8] = v20[8];
  uint64_t v21 = (char *)a1 + v18;
  uint64_t v22 = (char *)a2 + v18;
  *(void *)uint64_t v21 = *(void *)v22;
  v21[8] = v22[8];
  return a1;
}

void *assignWithTake for GridView.Pins.Cell.Content(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  int v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      uint64_t v15 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v16 = type metadata accessor for Artwork();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v8, v9, v16);
        uint64_t v17 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                     + 48);
        uint64_t v18 = &v8[v17];
        uint64_t v19 = &v9[v17];
        *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
        v18[16] = v19[16];
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
      }
      v8[*(int *)(v10 + 20)] = v9[*(int *)(v10 + 20)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_15;
    }
LABEL_7:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel.ImageConfiguration?);
    memcpy(v8, v9, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_15;
  }
  if (v14)
  {
    outlined destroy of GridView.Pins.Cell.ButtonStyle((uint64_t)v8, type metadata accessor for GridView.Base.ViewModel.ImageConfiguration);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    outlined destroy of GridView.Pins.Cell.ButtonStyle((uint64_t)v8, type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image);
    uint64_t v21 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v22 = type metadata accessor for Artwork();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 32))(v8, v9, v22);
      uint64_t v23 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                   + 48);
      uint64_t v24 = &v8[v23];
      int v25 = &v9[v23];
      *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
      v24[16] = v25[16];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v21 - 8) + 64));
    }
  }
  v8[*(int *)(v10 + 20)] = v9[*(int *)(v10 + 20)];
LABEL_15:
  uint64_t v26 = a3[6];
  uint64_t v27 = (char *)a1 + v26;
  char v28 = (char *)a2 + v26;
  uint64_t v29 = *(void *)v28;
  LOBYTE(v28) = v28[8];
  uint64_t v30 = *(void *)v27;
  char v31 = v27[8];
  *(void *)uint64_t v27 = v29;
  v27[8] = (char)v28;
  outlined consume of Environment<Bool>.Content(v30, v31);
  uint64_t v32 = a3[7];
  long long v33 = (char *)a1 + v32;
  uint64_t v34 = (char *)a2 + v32;
  uint64_t v35 = *(void *)v34;
  LOBYTE(v34) = v34[8];
  uint64_t v36 = *(void *)v33;
  char v37 = v33[8];
  *(void *)long long v33 = v35;
  v33[8] = (char)v34;
  outlined consume of Environment<Bool>.Content(v36, v37);
  return a1;
}

uint64_t getEnumTagSinglePayload for GridView.Pins.Cell.Content(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_227AF44B0);
}

uint64_t sub_227AF44B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel.ImageConfiguration?);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for GridView.Pins.Cell.Content(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_227AF4578);
}

uint64_t sub_227AF4578(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for GridView.Base.ViewModel.ImageConfiguration?);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void type metadata completion function for GridView.Pins.Cell.Content()
{
  type metadata accessor for GridView.Base.ViewModel?(319, &lazy cache variable for type metadata for GridView.Base.ViewModel.ImageConfiguration?, type metadata accessor for GridView.Base.ViewModel.ImageConfiguration, MEMORY[0x263F8D8F0]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unint64_t initializeBufferWithCopyOfBuffer for GridView.Pins.Cell.ButtonStyle(unint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v13 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    char v8 = *(unsigned char *)(a2 + 8);
    outlined copy of Environment<Bool>.Content(*(void *)a2, v8);
    *(void *)a1 = v7;
    *(unsigned char *)(a1 + 8) = v8;
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (void *)(a1 + v9);
    uint64_t v11 = (void *)(a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      void *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for GridView.Pins.Cell.ButtonStyle(uint64_t a1, uint64_t a2)
{
  outlined consume of Environment<Bool>.Content(*(void *)a1, *(unsigned char *)(a1 + 8));
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for ColorScheme();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

uint64_t initializeWithCopy for GridView.Pins.Cell.ButtonStyle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  outlined copy of Environment<Bool>.Content(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = type metadata accessor for ColorScheme();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  else
  {
    *uint64_t v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for GridView.Pins.Cell.ButtonStyle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  outlined copy of Environment<Bool>.Content(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  outlined consume of Environment<Bool>.Content(v8, v9);
  if (a1 != a2)
  {
    uint64_t v10 = *(int *)(a3 + 20);
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (void *)(a2 + v10);
    outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>(a1 + v10, &demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      void *v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for GridView.Pins.Cell.ButtonStyle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = type metadata accessor for ColorScheme();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t assignWithTake for GridView.Pins.Cell.ButtonStyle(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  outlined consume of Environment<Bool>.Content(v8, v9);
  if ((uint64_t *)a1 != a2)
  {
    uint64_t v10 = *(int *)(a3 + 20);
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (char *)a2 + v10;
    outlined destroy of ModifiedContent<ButtonStyleConfiguration.Label, _ClipEffect<RoundedRectangle>>(a1 + v10, &demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>.Content);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for GridView.Pins.Cell.ButtonStyle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_227AF4CE0);
}

uint64_t sub_227AF4CE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 254)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 8);
    if (v4 > 1) {
      return (v4 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>);
    char v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for GridView.Pins.Cell.ButtonStyle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_227AF4DA0);
}

uint64_t sub_227AF4DA0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 254)
  {
    *(unsigned char *)(result + 8) = -(char)a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Environment<ColorScheme>);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void type metadata completion function for GridView.Pins.Cell.ButtonStyle()
{
  type metadata accessor for GridView.Base.ViewModel?(319, &lazy cache variable for type metadata for Environment<ColorScheme>.Content, MEMORY[0x263F18520], MEMORY[0x263F185C8]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for GridView.Base.ViewModel?(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t associated type witness table accessor for ButtonStyle.Body : View in GridView.Pins.Cell.ButtonStyle()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t associated type witness table accessor for View.Body : View in GridView.Pins.Cell.Content()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t lazy protocol witness table accessor for type Rectangle and conformance Rectangle()
{
  unint64_t result = lazy protocol witness table cache variable for type Rectangle and conformance Rectangle;
  if (!lazy protocol witness table cache variable for type Rectangle and conformance Rectangle)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Rectangle and conformance Rectangle);
  }
  return result;
}

uint64_t outlined init with copy of InsettableShape(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t outlined destroy of AnyInsettableShape(uint64_t a1)
{
  return a1;
}

unint64_t lazy protocol witness table accessor for type Circle and conformance Circle()
{
  unint64_t result = lazy protocol witness table cache variable for type Circle and conformance Circle;
  if (!lazy protocol witness table cache variable for type Circle and conformance Circle)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Circle and conformance Circle);
  }
  return result;
}

uint64_t outlined init with take of InsettableShape(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  unsigned __int8 v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t outlined init with copy of AnyInsettableShape(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t outlined init with copy of GridView.Pins.Cell(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined consume of Text.Storage(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t outlined copy of Text.Storage(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t outlined release of ModifiedContent<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>(uint64_t a1)
{
  return a1;
}

uint64_t outlined retain of ModifiedContent<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>(uint64_t a1)
{
  return a1;
}

uint64_t sub_227AF535C()
{
  int v1 = *(unsigned __int8 *)(v0 + 32);
  if (v1 != 255) {
    outlined consume of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(void **)(v0 + 16), *(void *)(v0 + 24), v1);
  }
  return MEMORY[0x270FA0238](v0, 33, 7);
}

unint64_t lazy protocol witness table accessor for type GridView.Base.Placeholder? and conformance <A> A?()
{
  unint64_t result = lazy protocol witness table cache variable for type GridView.Base.Placeholder? and conformance <A> A?;
  if (!lazy protocol witness table cache variable for type GridView.Base.Placeholder? and conformance <A> A?)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for GridView.Base.Placeholder?);
    lazy protocol witness table accessor for type GridView.Base.Placeholder and conformance GridView.Base.Placeholder();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GridView.Base.Placeholder? and conformance <A> A?);
  }
  return result;
}

uint64_t sub_227AF5414@<X0>(unsigned char *a1@<X8>)
{
  lazy protocol witness table accessor for type IsHighlightedKey and conformance IsHighlightedKey();
  uint64_t result = EnvironmentValues.subscript.getter();
  *a1 = v3;
  return result;
}

uint64_t sub_227AF5464()
{
  return EnvironmentValues.subscript.setter();
}

unint64_t lazy protocol witness table accessor for type IsHighlightedKey and conformance IsHighlightedKey()
{
  unint64_t result = lazy protocol witness table cache variable for type IsHighlightedKey and conformance IsHighlightedKey;
  if (!lazy protocol witness table cache variable for type IsHighlightedKey and conformance IsHighlightedKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type IsHighlightedKey and conformance IsHighlightedKey);
  }
  return result;
}

void *type metadata accessor for IsHighlightedKey()
{
  return &unk_26DC15660;
}

uint64_t initializeWithCopy for AnyInsettableShape(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for AnyInsettableShape(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        uint64_t *v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          uint64_t *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t assignWithTake for AnyInsettableShape(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for AnyInsettableShape(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AnyInsettableShape(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void *type metadata accessor for AnyInsettableShape()
{
  return &unk_26DC156D8;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>, _PaddingLayout>, ModifiedContent<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>)>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>, _PaddingLayout>, ModifiedContent<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>)>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>, _PaddingLayout>, ModifiedContent<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>)>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>, _PaddingLayout>, ModifiedContent<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>)>>, _FlexFrameLayout>);
    lazy protocol witness table accessor for type Button<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?> and conformance Button<A>(&lazy protocol witness table cache variable for type HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>, _PaddingLayout>, ModifiedContent<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>)>> and conformance HStack<A>, &demangling cache variable for type metadata for HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>, _PaddingLayout>, ModifiedContent<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>)>>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<HStack<TupleView<(ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<Group<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?>, _AspectRatioLayout>, _OverlayModifier<_ShapeView<_ShapeSubtraction<Rectangle, AnyInsettableShape>, Color>>>, _CompositingGroupEffect>, _ClipEffect<AnyInsettableShape>>, _ShadowEffect>, _PaddingLayout>, ModifiedContent<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _FlexFrameLayout>, _TraitWritingModifier<LayoutPriorityTraitKey>>)>>, _FlexFrameLayout> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>>, _CompositingGroupEffect>, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>>, _CompositingGroupEffect>, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>>, _CompositingGroupEffect>, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>>, _CompositingGroupEffect>, _ClipEffect<RoundedRectangle>>);
    lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>>, _CompositingGroupEffect> and conformance <> ModifiedContent<A, B>();
    lazy protocol witness table accessor for type Button<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?> and conformance Button<A>(&lazy protocol witness table cache variable for type _ClipEffect<RoundedRectangle> and conformance _ClipEffect<A>, &demangling cache variable for type metadata for _ClipEffect<RoundedRectangle>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>>, _CompositingGroupEffect>, _ClipEffect<RoundedRectangle>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>>, _CompositingGroupEffect> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>>, _CompositingGroupEffect> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>>, _CompositingGroupEffect> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>>, _CompositingGroupEffect>);
    lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>> and conformance <> ModifiedContent<A, B>();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>>, _CompositingGroupEffect> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>>);
    lazy protocol witness table accessor for type ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>> and conformance <> ModifiedContent<A, B>();
    lazy protocol witness table accessor for type Button<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?> and conformance Button<A>(&lazy protocol witness table cache variable for type _BackgroundStyleModifier<Color> and conformance _BackgroundStyleModifier<A>, &demangling cache variable for type metadata for _BackgroundStyleModifier<Color>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>, _BackgroundStyleModifier<Color>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>>);
    lazy protocol witness table accessor for type GridView.Pins.Cell.Content and conformance GridView.Pins.Cell.Content(&lazy protocol witness table cache variable for type ButtonStyleConfiguration.Label and conformance ButtonStyleConfiguration.Label, MEMORY[0x263F1A0D0]);
    lazy protocol witness table accessor for type Button<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?> and conformance Button<A>(&lazy protocol witness table cache variable for type _EnvironmentKeyWritingModifier<Bool> and conformance _EnvironmentKeyWritingModifier<A>, &demangling cache variable for type metadata for _EnvironmentKeyWritingModifier<Bool>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<ButtonStyleConfiguration.Label, _EnvironmentKeyWritingModifier<Bool>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

uint64_t associated type witness table accessor for View.Body : View in AnyInsettableShape()
{
  return lazy protocol witness table accessor for type Button<_ConditionalContent<Image, <<opaque return type of ArtworkImage.artworkPlaceholder<A>(_:)>>.0>?> and conformance Button<A>(&lazy protocol witness table cache variable for type _ShapeView<AnyInsettableShape, ForegroundStyle> and conformance _ShapeView<A, B>, &demangling cache variable for type metadata for _ShapeView<AnyInsettableShape, ForegroundStyle>);
}

unint64_t lazy protocol witness table accessor for type EmptyAnimatableData and conformance EmptyAnimatableData()
{
  unint64_t result = lazy protocol witness table cache variable for type EmptyAnimatableData and conformance EmptyAnimatableData;
  if (!lazy protocol witness table cache variable for type EmptyAnimatableData and conformance EmptyAnimatableData)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EmptyAnimatableData and conformance EmptyAnimatableData);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AnyInsettableShape and conformance AnyInsettableShape()
{
  unint64_t result = lazy protocol witness table cache variable for type AnyInsettableShape and conformance AnyInsettableShape;
  if (!lazy protocol witness table cache variable for type AnyInsettableShape and conformance AnyInsettableShape)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnyInsettableShape and conformance AnyInsettableShape);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AnyInsettableShape and conformance AnyInsettableShape;
  if (!lazy protocol witness table cache variable for type AnyInsettableShape and conformance AnyInsettableShape)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnyInsettableShape and conformance AnyInsettableShape);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AnyInsettableShape and conformance AnyInsettableShape;
  if (!lazy protocol witness table cache variable for type AnyInsettableShape and conformance AnyInsettableShape)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnyInsettableShape and conformance AnyInsettableShape);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AnyInsettableShape and conformance AnyInsettableShape;
  if (!lazy protocol witness table cache variable for type AnyInsettableShape and conformance AnyInsettableShape)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnyInsettableShape and conformance AnyInsettableShape);
  }
  return result;
}

ValueMetadata *type metadata accessor for GridView.SquareGrid()
{
  return &type metadata for GridView.SquareGrid;
}

ValueMetadata *type metadata accessor for GridView.Pins()
{
  return &type metadata for GridView.Pins;
}

uint64_t key path setter for GridView.layout : GridView(uint64_t a1, void *a2)
{
  outlined init with copy of InsettableShape(a1, (uint64_t)v5);
  long long v3 = (uint64_t *)(*a2 + OBJC_IVAR____TtC9CarPlayUI8GridView_layout);
  swift_beginAccess();
  __swift_assign_boxed_opaque_existential_1(v3, v5);
  swift_endAccess();
  GridView.updateLayout(animated:)(0);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
}

uint64_t GridView.layout.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC9CarPlayUI8GridView_layout;
  swift_beginAccess();
  return outlined init with copy of InsettableShape(v3, a1);
}

uint64_t GridView.layout.setter(uint64_t *a1)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC9CarPlayUI8GridView_layout);
  swift_beginAccess();
  __swift_assign_boxed_opaque_existential_1(v3, a1);
  swift_endAccess();
  GridView.updateLayout(animated:)(0);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

void (*GridView.layout.modify(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return GridView.layout.modify;
}

void GridView.layout.modify(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    GridView.updateLayout(animated:)(0);
  }
}

uint64_t GridView.dataSource.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9CarPlayUI8GridView_dataSource;
  swift_beginAccess();
  return MEMORY[0x22A684C00](v1);
}

uint64_t GridView.dataSource.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC9CarPlayUI8GridView_dataSource;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x22A684C00](v4);
  *(void *)(v4 + 8) = a2;
  uint64_t v6 = swift_unknownObjectWeakAssign();
  uint64_t v7 = MEMORY[0x22A684C00](v6);
  if (v7)
  {
    uint64_t v8 = v7;
    swift_unknownObjectRelease();
    if (v5) {
      BOOL v9 = v8 == v5;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (v5)
  {
LABEL_9:
    GridView.reloadData()();
LABEL_10:
    swift_unknownObjectRelease();
  }
  return swift_unknownObjectRelease();
}

void (*GridView.dataSource.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  uint64_t v4 = v1 + OBJC_IVAR____TtC9CarPlayUI8GridView_dataSource;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x22A684C00](v4);
  uint64_t v6 = *(void *)(v4 + 8);
  v3[3] = v5;
  v3[4] = v6;
  return GridView.dataSource.modify;
}

void GridView.dataSource.modify(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (*a1)[3];
  uint64_t v4 = v2[4];
  if (a2)
  {
    uint64_t v5 = swift_unknownObjectRetain();
    GridView.dataSource.setter(v5, v4);
    swift_unknownObjectRelease();
  }
  else
  {
    GridView.dataSource.setter(v3, v2[4]);
  }
  free(v2);
}

Swift::Void __swiftcall GridView.reloadData()()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC9CarPlayUI8GridView_cells);
  swift_beginAccess();
  uint64_t v2 = v1[2];
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = v1[1];
    uint64_t v5 = v4 + 32;
    uint64_t v6 = *(void *)(v4 + 16);
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    uint64_t v7 = 0;
    while (v6 != v7)
    {
      outlined init with copy of AnyHashable(v5, (uint64_t)v14);
      uint64_t v8 = *(void **)(v2 + 8 * v7 + 32);
      v11[0] = v14[0];
      v11[1] = v14[1];
      uint64_t v12 = v15;
      uint64_t v13 = v8;
      objc_msgSend(v8, sel_removeFromSuperview);
      outlined destroy of (key: AnyHashable, value: UIView)((uint64_t)v11);
      v5 += 40;
      if (v3 == ++v7)
      {
        swift_release_n();
        swift_release_n();
        swift_release_n();
        goto LABEL_6;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_6:
    uint64_t *v1 = specialized OrderedDictionary.init<A>(uniqueKeysWithValues:)(MEMORY[0x263F8EE78]);
    v1[1] = v9;
    v1[2] = v10;
    swift_release();
    swift_release();
    swift_release();
    GridView.updateData()();
  }
}

Swift::Void __swiftcall GridView.updateData()()
{
  uint64_t v1 = v0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC9CarPlayUI8GridView_dataSource];
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x22A684C00](v2);
  if (v3)
  {
    uint64_t v4 = (char **)v3;
    uint64_t v5 = *((void *)v2 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    uint64_t v110 = ObjectType;
    uint64_t v111 = v5;
    uint64_t v8 = v7(ObjectType, v5);
    uint64_t v9 = (uint64_t)&v1[OBJC_IVAR____TtC9CarPlayUI8GridView_layout];
    swift_beginAccess();
    outlined init with copy of InsettableShape(v9, (uint64_t)&v116);
    uint64_t v10 = *((void *)&v117 + 1);
    uint64_t v11 = v118;
    __swift_project_boxed_opaque_existential_1(&v116, *((uint64_t *)&v117 + 1));
    objc_msgSend(v1, sel_frame);
    double v14 = (*(double (**)(uint64_t, uint64_t, uint64_t, double, double))(v11 + 32))(v8, v10, v11, v12, v13);
    double v16 = v15;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v116);
    uint64_t v106 = (char **)v9;
    outlined init with copy of InsettableShape(v9, (uint64_t)&v116);
    uint64_t v17 = *((void *)&v117 + 1);
    uint64_t v18 = v118;
    __swift_project_boxed_opaque_existential_1(&v116, *((uint64_t *)&v117 + 1));
    uint64_t v100 = v1;
    objc_msgSend(v1, sel_frame);
    unint64_t v107 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, double, double))(v18 + 24))(v8, v17, v18, v19, v20);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v116);
    unint64_t v21 = MEMORY[0x263F8EE78];
    uint64_t v22 = (void *)MEMORY[0x263F8EE78];
    if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0) {
      goto LABEL_67;
    }
    while (1)
    {
      uint64_t v126 = 0;
      unint64_t v127 = v21;
      long long v125 = v22;
      uint64_t v108 = v4;
      if (v8) {
        break;
      }
LABEL_52:
      long long v90 = &v100[OBJC_IVAR____TtC9CarPlayUI8GridView_cells];
      swift_beginAccess();
      uint64_t v91 = *((void *)v90 + 1);
      uint64_t v111 = *(void *)v90;
      uint64_t v92 = *((void *)v90 + 2);
      uint64_t v93 = *(void *)(v92 + 16);
      if (!v93)
      {
LABEL_57:
        unint64_t v97 = v127;
        uint64_t v98 = v125;
        *(void *)long long v90 = v126;
        *((void *)v90 + 1) = v97;
        *((void *)v90 + 2) = v98;
        swift_retain();
        swift_retain();
        swift_release();
        swift_release();
        swift_unknownObjectRelease();
        swift_release();
        swift_release();
        swift_release();
        return;
      }
      uint64_t v94 = v91 + 32;
      uint64_t v8 = *(void *)(v91 + 16);
      swift_retain_n();
      swift_retain_n();
      swift_retain_n();
      uint64_t v95 = 0;
      uint64_t v4 = &selRef_attributionView;
      while (v8 != v95)
      {
        outlined init with copy of AnyHashable(v94, (uint64_t)&v116);
        uint64_t v96 = *(void **)(v92 + 8 * v95 + 32);
        long long v112 = v116;
        long long v113 = v117;
        uint64_t v114 = v118;
        long long v115 = v96;
        objc_msgSend(v96, sel_removeFromSuperview);
        outlined destroy of (key: AnyHashable, value: UIView)((uint64_t)&v112);
        v94 += 40;
        unint64_t v21 = ++v95;
        if (v93 == v95)
        {
          swift_release_n();
          swift_release_n();
          swift_release_n();
          uint64_t v111 = *(void *)v90;
          goto LABEL_57;
        }
      }
      __break(1u);
LABEL_60:
      __break(1u);
LABEL_61:
      __break(1u);
LABEL_62:
      __break(1u);
LABEL_63:
      __break(1u);
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
LABEL_67:
      uint64_t v22 = specialized _copyCollectionToContiguousArray<A>(_:)(MEMORY[0x263F8EE78]);
    }
    if (!v107)
    {
      __break(1u);
      return;
    }
    uint64_t v23 = v111;
    v104 = *(void (**)(unint64_t, uint64_t, uint64_t))(v111 + 32);
    uint64_t v105 = v111 + 32;
    double v24 = (double)v107;
    int v25 = (uint64_t *)&v100[OBJC_IVAR____TtC9CarPlayUI8GridView_cells];
    swift_beginAccess();
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    uint64_t v101 = v8;
    uint64_t v102 = AssociatedConformanceWitness;
    unint64_t v27 = 0;
    uint64_t v109 = v25;
    v99[1] = v25 + 2;
    v99[2] = v23 + 40;
    while (1)
    {
      *((void *)&v117 + 1) = AssociatedTypeWitness;
      uint64_t v118 = v102;
      __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v116);
      uint64_t v30 = v4;
      v104(v27, v110, v111);
      __swift_project_boxed_opaque_existential_1(&v116, *((uint64_t *)&v117 + 1));
      uint64_t v31 = swift_getAssociatedTypeWitness();
      *((void *)&v113 + 1) = v31;
      uint64_t v114 = swift_getAssociatedConformanceWitness();
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v112);
      dispatch thunk of Identifiable.id.getter();
      uint64_t v4 = v106;
      outlined init with copy of InsettableShape((uint64_t)v106, (uint64_t)v122);
      uint64_t v33 = v123;
      uint64_t v34 = v124;
      __swift_project_boxed_opaque_existential_1(v122, v123);
      double v35 = (*(double (**)(uint64_t, uint64_t))(v34 + 16))(v33, v34);
      outlined init with copy of InsettableShape((uint64_t)v4, (uint64_t)v119);
      uint64_t v36 = v120;
      uint64_t v8 = v121;
      unint64_t v21 = (unint64_t)__swift_project_boxed_opaque_existential_1(v119, v120);
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v36, v8);
      double v38 = floor((double)v27 / v24);
      if ((~*(void *)&v38 & 0x7FF0000000000000) == 0) {
        goto LABEL_60;
      }
      if (v38 <= -1.0) {
        goto LABEL_61;
      }
      if (v38 >= 1.84467441e19) {
        goto LABEL_62;
      }
      double v39 = (v14 + v37) * (double)(v27 % v107);
      double v40 = v35 + (v16 + v37) * (double)(unint64_t)v38;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v119);
      uint64_t v41 = __swift_destroy_boxed_opaque_existential_0((uint64_t)v122);
      MEMORY[0x270FA5388](v41);
      (*(void (**)(char *, uint64_t *, uint64_t))(v43 + 16))((char *)v99 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0), boxed_opaque_existential_1, v31);
      AnyHashable.init<A>(_:)();
      uint64_t v44 = v109;
      uint64_t v45 = *v109;
      uint64_t v46 = v109[1];
      uint64_t v47 = v109[2];
      swift_retain();
      swift_retain();
      swift_retain();
      id v48 = (void *)specialized OrderedDictionary.subscript.getter((uint64_t)v122, v45, v46, v47);
      swift_release();
      swift_release();
      swift_release();
      outlined destroy of AnyHashable((uint64_t)v122);
      if (v48) {
        break;
      }
      uint64_t v4 = v30;
      id v48 = (void *)(*(uint64_t (**)(unint64_t, uint64_t))(v111 + 40))(v27, v110);
      objc_msgSend(v48, sel_setFrame_, v39, v40, v14, v16);
      objc_msgSend(v100, sel_addSubview_, v48);
      uint64_t v61 = __swift_project_boxed_opaque_existential_1(&v112, *((uint64_t *)&v113 + 1));
      MEMORY[0x270FA5388](v61);
      (*(void (**)(char *))(v63 + 16))((char *)v99 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0));
      AnyHashable.init<A>(_:)();
      uint64_t v65 = v126;
      unint64_t v64 = v127;
      uint64_t v66 = v127 + 32;
      uint64_t v67 = *(void *)(v127 + 16);
      if (!v126)
      {
        id v72 = v48;
        swift_retain();
        if (v67)
        {
          unint64_t v21 = 0;
          while (1)
          {
            outlined init with copy of AnyHashable(v66, (uint64_t)v119);
            char v73 = MEMORY[0x22A684220](v119, v122);
            outlined destroy of AnyHashable((uint64_t)v119);
            if (v73) {
              break;
            }
            ++v21;
            v66 += 40;
            if (v67 == v21) {
              goto LABEL_39;
            }
          }
          swift_release();
          goto LABEL_47;
        }
        goto LABEL_39;
      }
      id v68 = v48;
      swift_retain();
      swift_retain();
      unint64_t v21 = specialized _HashTable.UnsafeHandle._find<A>(_:in:)((uint64_t)v122, v64 + 32, v67, (Swift::Int *)(v65 + 16), v65 + 32);
      char v70 = v69;
      swift_release();
      swift_release();
      if ((v70 & 1) == 0)
      {
        uint64_t v4 = v108;
LABEL_47:
        uint64_t v8 = v101;
        uint64_t v87 = v125;
        id v89 = v48;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          specialized _ContiguousArrayBuffer._consumeAndCreateNew()();
        }
        if ((v21 & 0x8000000000000000) != 0) {
          goto LABEL_65;
        }
        if (v21 >= v87[2]) {
          goto LABEL_66;
        }
        goto LABEL_51;
      }
LABEL_6:
      uint64_t v4 = v108;
LABEL_7:
      uint64_t v8 = v101;
      id v28 = v48;
      specialized OrderedSet._appendNew(_:in:)((uint64_t)v122);
      id v29 = v28;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
LABEL_8:
      unint64_t v21 = (unint64_t)&v125;
      specialized ContiguousArray._endMutation()();
      outlined destroy of AnyHashable((uint64_t)v122);

      ++v27;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v112);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v116);
      if (v27 == v8) {
        goto LABEL_52;
      }
    }
    objc_msgSend(v48, sel_setFrame_, v39, v40, v14, v16);
    uint64_t v49 = __swift_project_boxed_opaque_existential_1(&v112, *((uint64_t *)&v113 + 1));
    MEMORY[0x270FA5388](v49);
    (*(void (**)(char *))(v51 + 16))((char *)v99 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0));
    AnyHashable.init<A>(_:)();
    swift_beginAccess();
    uint64_t v53 = *v44;
    uint64_t v52 = v44[1];
    uint64_t v54 = v52 + 32;
    uint64_t v55 = *(void *)(v52 + 16);
    if (*v44)
    {
      swift_retain();
      swift_retain();
      uint64_t v4 = v108;
      Swift::Int v56 = specialized _HashTable.UnsafeHandle._find<A>(_:in:)((uint64_t)v122, v52 + 32, v55, (Swift::Int *)(v53 + 16), v53 + 32);
      char v58 = v57;
      uint64_t v60 = v59;
      swift_release();
      swift_release();
      if ((v58 & 1) == 0)
      {
LABEL_31:
        specialized OrderedSet._removeExistingMember(at:in:)(v56, v60, (uint64_t)v119);
        outlined destroy of AnyHashable((uint64_t)v119);
        uint64_t v74 = (void *)specialized ContiguousArray.remove(at:)(v56);
        outlined destroy of AnyHashable((uint64_t)v122);

        goto LABEL_32;
      }
    }
    else
    {
      uint64_t v4 = v30;
      swift_retain();
      if (v55)
      {
        Swift::Int v56 = 0;
        while (1)
        {
          outlined init with copy of AnyHashable(v54, (uint64_t)v119);
          char v71 = MEMORY[0x22A684220](v119, v122);
          outlined destroy of AnyHashable((uint64_t)v119);
          if (v71) {
            break;
          }
          ++v56;
          v54 += 40;
          if (v55 == v56) {
            goto LABEL_23;
          }
        }
        swift_release();
        uint64_t v60 = 0;
        goto LABEL_31;
      }
LABEL_23:
      swift_release();
    }
    outlined destroy of AnyHashable((uint64_t)v122);
LABEL_32:
    swift_endAccess();
    char v75 = __swift_project_boxed_opaque_existential_1(&v112, *((uint64_t *)&v113 + 1));
    MEMORY[0x270FA5388](v75);
    (*(void (**)(char *))(v77 + 16))((char *)v99 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0));
    AnyHashable.init<A>(_:)();
    uint64_t v79 = v126;
    unint64_t v78 = v127;
    uint64_t v80 = v127 + 32;
    uint64_t v81 = *(void *)(v127 + 16);
    if (!v126)
    {
      swift_retain();
      id v85 = v48;
      if (v81)
      {
        unint64_t v21 = 0;
        while (1)
        {
          outlined init with copy of AnyHashable(v80, (uint64_t)v119);
          char v86 = MEMORY[0x22A684220](v119, v122);
          outlined destroy of AnyHashable((uint64_t)v119);
          if (v86) {
            break;
          }
          ++v21;
          v80 += 40;
          if (v81 == v21) {
            goto LABEL_39;
          }
        }
        swift_release();
LABEL_41:
        uint64_t v8 = v101;
        uint64_t v87 = v125;
        id v88 = v48;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          specialized _ContiguousArrayBuffer._consumeAndCreateNew()();
        }
        if ((v21 & 0x8000000000000000) != 0) {
          goto LABEL_63;
        }
        if (v21 >= v87[2]) {
          goto LABEL_64;
        }
LABEL_51:
        objc_storeStrong((id *)&v87[v21 + 4], v48);
        goto LABEL_8;
      }
LABEL_39:
      swift_release();
      goto LABEL_7;
    }
    swift_retain();
    swift_retain();
    id v82 = v48;
    unint64_t v21 = specialized _HashTable.UnsafeHandle._find<A>(_:in:)((uint64_t)v122, v78 + 32, v81, (Swift::Int *)(v79 + 16), v79 + 32);
    char v84 = v83;
    swift_release();
    swift_release();
    if ((v84 & 1) == 0)
    {
      uint64_t v4 = v108;
      goto LABEL_41;
    }
    goto LABEL_6;
  }
}

uint64_t specialized OrderedDictionary.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a3 + 32;
  uint64_t v7 = *(void *)(a3 + 16);
  if (!a2)
  {
    if (v7)
    {
      unint64_t v10 = 0;
      while (1)
      {
        outlined init with copy of AnyHashable(v6, (uint64_t)v17);
        char v16 = MEMORY[0x22A684220](v17, a1);
        uint64_t result = outlined destroy of AnyHashable((uint64_t)v17);
        if (v16) {
          break;
        }
        ++v10;
        v6 += 40;
        if (v7 == v10) {
          return 0;
        }
      }
      goto LABEL_4;
    }
    return 0;
  }
  uint64_t v8 = (Swift::Int *)(a2 + 16);
  uint64_t v9 = a2 + 32;
  swift_retain();
  unint64_t v10 = specialized _HashTable.UnsafeHandle._find<A>(_:in:)(a1, v6, v7, v8, v9);
  char v12 = v11;
  uint64_t result = swift_release();
  if (v12) {
    return 0;
  }
  if ((v10 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
LABEL_4:
  if (v10 < *(void *)(a4 + 16))
  {
    double v14 = *(void **)(a4 + 8 * v10 + 32);
    id v15 = v14;
    return (uint64_t)v14;
  }
LABEL_13:
  __break(1u);
  return result;
}

Swift::Void __swiftcall GridView.updateLayout(animated:)(Swift::Bool animated)
{
  uint64_t v2 = v1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = &v1[OBJC_IVAR____TtC9CarPlayUI8GridView_cells];
  swift_beginAccess();
  uint64_t v6 = *(void *)(*((void *)v5 + 2) + 16);
  uint64_t v7 = (uint64_t)v2 + OBJC_IVAR____TtC9CarPlayUI8GridView_layout;
  swift_beginAccess();
  outlined init with copy of InsettableShape(v7, (uint64_t)v23);
  uint64_t v8 = v24;
  uint64_t v9 = v25;
  __swift_project_boxed_opaque_existential_1(v23, v24);
  objc_msgSend(v2, sel_bounds);
  double v12 = (*(double (**)(uint64_t, uint64_t, uint64_t, double, double))(v9 + 32))(v6, v8, v9, v10, v11);
  double v14 = v13;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
  outlined init with copy of InsettableShape(v7, (uint64_t)v23);
  uint64_t v15 = v24;
  uint64_t v16 = v25;
  __swift_project_boxed_opaque_existential_1(v23, v24);
  objc_msgSend(v2, sel_bounds);
  unint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, double, double))(v16 + 24))(v6, v15, v16, v17, v18);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
  double v20 = (double *)swift_allocObject();
  *((void *)v20 + 2) = v2;
  v20[3] = v12;
  v20[4] = v14;
  *((void *)v20 + 5) = v19;
  *((void *)v20 + 6) = ObjectType;
  if (animated)
  {
    type metadata accessor for UIView();
    id v21 = v2;
    uint64_t v22 = static Animation.spring(response:dampingFraction:blendDuration:)();
    MEMORY[0x270FA5388](v22);
    static UIView.animate(_:changes:completion:)();
    swift_release();
  }
  else
  {
    specialized closure #1 in GridView.updateLayout(animated:)((uint64_t)v2, v19, v12, v14);
  }
  swift_release();
}

Swift::Void __swiftcall GridView.layoutSubviews()()
{
  v1.receiver = v0;
  v1.super_class = (Class)type metadata accessor for GridView();
  objc_msgSendSuper2(&v1, sel_layoutSubviews);
  GridView.updateLayout(animated:)(0);
}

CGSize __swiftcall GridView.sizeThatFits(_:)(CGSize a1)
{
  double height = a1.height;
  double width = a1.width;
  uint64_t v4 = v1 + OBJC_IVAR____TtC9CarPlayUI8GridView_dataSource;
  swift_beginAccess();
  if (MEMORY[0x22A684C00](v4))
  {
    uint64_t v5 = *(void *)(v4 + 8);
    uint64_t v6 = v1 + OBJC_IVAR____TtC9CarPlayUI8GridView_layout;
    swift_beginAccess();
    outlined init with copy of InsettableShape(v6, (uint64_t)v17);
    uint64_t v7 = v18;
    uint64_t v8 = v19;
    __swift_project_boxed_opaque_existential_1(v17, v18);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 24))(ObjectType, v5);
    double v11 = (*(double (**)(uint64_t, uint64_t, uint64_t, double, double))(v8 + 40))(v10, v7, v8, width, height);
    double v13 = v12;
    swift_unknownObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
  }
  else
  {
    double v11 = 0.0;
    double v13 = 0.0;
  }
  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

id GridView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

id GridView.init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = (uint64_t *)&v4[OBJC_IVAR____TtC9CarPlayUI8GridView_layout];
  v9[3] = (uint64_t)&type metadata for GridView.SquareGrid.Layout;
  v9[4] = (uint64_t)&protocol witness table for GridView.SquareGrid.Layout;
  uint64_t v10 = swift_allocObject();
  *id v9 = v10;
  __asm { FMOV            V0.2D, #10.0 }
  *(_OWORD *)(v10 + 16) = _Q0;
  *(_OWORD *)(v10 + 32) = xmmword_227B01710;
  *(void *)(v10 + 48) = 0;
  *(void *)&v4[OBJC_IVAR____TtC9CarPlayUI8GridView_dataSource + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v16 = (uint64_t *)&v4[OBJC_IVAR____TtC9CarPlayUI8GridView_cells];
  double v17 = v4;
  *uint64_t v16 = specialized OrderedDictionary.init<A>(uniqueKeysWithValues:)(MEMORY[0x263F8EE78]);
  v16[1] = v18;
  v16[2] = v19;

  v21.receiver = v17;
  v21.super_class = (Class)type metadata accessor for GridView();
  return objc_msgSendSuper2(&v21, sel_initWithFrame_, a1, a2, a3, a4);
}

id GridView.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id GridView.init(coder:)(void *a1)
{
  id v3 = (uint64_t *)&v1[OBJC_IVAR____TtC9CarPlayUI8GridView_layout];
  v3[3] = (uint64_t)&type metadata for GridView.SquareGrid.Layout;
  v3[4] = (uint64_t)&protocol witness table for GridView.SquareGrid.Layout;
  uint64_t v4 = swift_allocObject();
  uint64_t *v3 = v4;
  __asm { FMOV            V0.2D, #10.0 }
  *(_OWORD *)(v4 + 16) = _Q0;
  *(_OWORD *)(v4 + 32) = xmmword_227B01710;
  *(void *)(v4 + 48) = 0;
  *(void *)&v1[OBJC_IVAR____TtC9CarPlayUI8GridView_dataSource + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v10 = (uint64_t *)&v1[OBJC_IVAR____TtC9CarPlayUI8GridView_cells];
  double v11 = v1;
  uint64_t *v10 = specialized OrderedDictionary.init<A>(uniqueKeysWithValues:)(MEMORY[0x263F8EE78]);
  v10[1] = v12;
  v10[2] = v13;

  v16.receiver = v11;
  v16.super_class = (Class)type metadata accessor for GridView();
  id v14 = objc_msgSendSuper2(&v16, sel_initWithCoder_, a1);

  return v14;
}

id GridView.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GridView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      id v3 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
      id v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    specialized Array._copyContents(initializing:)((uint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v3;
}

uint64_t specialized OrderedSet._appendNew(_:in:)(uint64_t a1)
{
  uint64_t v2 = v1;
  outlined init with copy of AnyHashable(a1, (uint64_t)v15);
  uint64_t v5 = v1[1];
  id v3 = v1 + 1;
  uint64_t v4 = v5;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v3 = v5;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v4 + 16) + 1, 1);
    uint64_t v4 = *v3;
  }
  unint64_t v8 = *(void *)(v4 + 16);
  unint64_t v7 = *(void *)(v4 + 24);
  if (v8 >= v7 >> 1)
  {
    uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1);
    uint64_t v4 = *v3;
  }
  *(void *)(v4 + 16) = v8 + 1;
  unint64_t v9 = v4 + 40 * v8;
  long long v10 = v15[0];
  long long v11 = v15[1];
  *(void *)(v9 + 64) = v16;
  *(_OWORD *)(v9 + 32) = v10;
  *(_OWORD *)(v9 + 48) = v11;
  v2[1] = v4;
  uint64_t v12 = *(void *)(v4 + 16);
  uint64_t v13 = *v2;
  if (*v2)
  {
    swift_beginAccess();
    if (MEMORY[0x22A683DC0](*(void *)(v13 + 16) & 0x3FLL) >= v12)
    {
      uint64_t result = swift_isUniquelyReferenced_native();
      uint64_t v14 = *v2;
      if (!result)
      {
        if (!v14)
        {
LABEL_16:
          __break(1u);
          return result;
        }
        uint64_t v14 = _HashTable.copy()();
        uint64_t result = swift_release();
        uint64_t *v2 = v14;
      }
      if (v14) {
        return _HashTable.UnsafeHandle.subscript.setter();
      }
      __break(1u);
      goto LABEL_16;
    }
  }
  else if ((unint64_t)v12 < 0x10)
  {
    return result;
  }
  return specialized OrderedSet._regenerateHashTable()();
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  uint64_t *v3 = result;
  return result;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AnyHashable>);
    long long v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    long long v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[40 * v8]) {
      memmove(v12, v13, 40 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t specialized OrderedSet._regenerateHashTable()()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  if (*v0)
  {
    swift_beginAccess();
    uint64_t v3 = *(void *)(v1 + 24) & 0x3FLL;
    unint64_t v4 = *(void *)(v2 + 16);
    if (v3) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v3 = 0;
    unint64_t v4 = *(void *)(v2 + 16);
  }
  if (v4 < 0x10)
  {
    uint64_t v5 = 0;
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v6 = MEMORY[0x22A683DF0](v4);
  if (v3 <= v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v3;
  }
  uint64_t v5 = specialized static _HashTable.create<A>(uncheckedUniqueElements:scale:reservedScale:)(v2, v7, 0, v3);
LABEL_11:
  uint64_t result = swift_release();
  uint64_t *v0 = v5;
  return result;
}

uint64_t specialized static _HashTable.create<A>(uncheckedUniqueElements:scale:reservedScale:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8 = MEMORY[0x22A683DF0](*(void *)(a1 + 16));
  uint64_t v9 = 0;
  if (a3) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = a2;
  }
  if (v10 <= v8) {
    uint64_t v10 = v8;
  }
  if (v10 <= a4) {
    uint64_t v11 = a4;
  }
  else {
    uint64_t v11 = v10;
  }
  if (v11 >= 5)
  {
    uint64_t v9 = MEMORY[0x22A683E00]();
    specialized closure #1 in static _HashTable.create<A>(uncheckedUniqueElements:scale:reservedScale:)(v9 + 16, v9 + 32, a1);
  }
  return v9;
}

Swift::Int specialized closure #1 in static _HashTable.create<A>(uncheckedUniqueElements:scale:reservedScale:)(Swift::Int result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  if (v3)
  {
    unint64_t v4 = (Swift::Int *)result;
    uint64_t v5 = 0;
    while (1)
    {
      uint64_t result = AnyHashable._rawHashValue(seed:)(*v4);
      if (__OFSUB__(1 << *v4, 1)) {
        break;
      }
      if (_HashTable.UnsafeHandle._startIterator(bucket:)())
      {
        while (1)
          _HashTable.BucketIterator.advance()();
      }
      uint64_t result = _HashTable.BucketIterator.currentValue.setter();
      if (++v5 == v3) {
        return result;
      }
    }
    __break(1u);
  }
  return result;
}

Swift::Int specialized _HashTable.UnsafeHandle._find<A>(_:in:)(uint64_t a1, uint64_t a2, uint64_t a3, Swift::Int *a4, uint64_t a5)
{
  Swift::Int result = AnyHashable._rawHashValue(seed:)(*a4);
  uint64_t v10 = 1 << *a4;
  BOOL v11 = __OFSUB__(v10, 1);
  uint64_t v12 = v10 - 1;
  if (v11)
  {
    __break(1u);
  }
  else
  {
    *(void *)&long long v28 = a4;
    *((void *)&v28 + 1) = a5;
    *(void *)&long long v29 = v12 & result;
    *((void *)&v29 + 1) = _HashTable.UnsafeHandle._startIterator(bucket:)();
    *(void *)&long long v30 = v13;
    *((void *)&v30 + 1) = v14;
    char v31 = 0;
    uint64_t v15 = _HashTable.BucketIterator.currentValue.getter();
    long long v20 = v28;
    long long v21 = v29;
    long long v22 = v30;
    char v23 = 0;
    if ((v16 & 1) == 0)
    {
      do
      {
        outlined init with copy of AnyHashable(a2 + 40 * v15, (uint64_t)v19);
        char v17 = MEMORY[0x22A684220](v19, a1);
        outlined destroy of AnyHashable((uint64_t)v19);
        if (v17) {
          break;
        }
        _HashTable.BucketIterator.advance()();
        long long v24 = v20;
        long long v25 = v21;
        long long v26 = v22;
        char v27 = v23;
        uint64_t v15 = _HashTable.BucketIterator.currentValue.getter();
      }
      while ((v18 & 1) == 0);
    }
    return v15;
  }
  return result;
}

uint64_t specialized OrderedSet._reserveCapacity(_:persistent:)(uint64_t result, char a2)
{
  if (result < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v3 = v2;
  int64_t v5 = result;
  uint64_t v8 = v2[1];
  uint64_t v6 = v2 + 1;
  uint64_t v7 = v8;
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v6 = v8;
  if (isUniquelyReferenced_nonNull_native && (unint64_t)v5 <= *(void *)(v7 + 24) >> 1)
  {
    uint64_t v10 = *v3;
    if (*v3) {
      goto LABEL_5;
    }
  }
  else
  {
    if (*(void *)(v7 + 16) <= v5) {
      int64_t v15 = v5;
    }
    else {
      int64_t v15 = *(void *)(v7 + 16);
    }
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v15, 0);
    uint64_t v7 = *v6;
    uint64_t v10 = *v3;
    if (*v3)
    {
LABEL_5:
      swift_beginAccess();
      uint64_t v11 = *(void *)(v10 + 16) & 0x3FLL;
      uint64_t v12 = MEMORY[0x22A683DF0](v5);
      uint64_t v13 = v12;
      if (a2)
      {
        uint64_t v14 = v12;
        if (v11 >= v12) {
          goto LABEL_20;
        }
      }
      else
      {
        swift_beginAccess();
        uint64_t v14 = *(void *)(v10 + 24) & 0x3FLL;
        if (v11 >= v13) {
          goto LABEL_20;
        }
      }
LABEL_16:
      if (v14 <= v13) {
        uint64_t v17 = v13;
      }
      else {
        uint64_t v17 = v14;
      }
      goto LABEL_30;
    }
  }
  uint64_t v16 = MEMORY[0x22A683DF0](v5);
  uint64_t v13 = v16;
  uint64_t v11 = 0;
  if (a2) {
    uint64_t v14 = v16;
  }
  else {
    uint64_t v14 = 0;
  }
  if (v16 > 0) {
    goto LABEL_16;
  }
LABEL_20:
  if (v14 <= v13) {
    uint64_t v18 = v13;
  }
  else {
    uint64_t v18 = v14;
  }
  Swift::Int result = MEMORY[0x22A683DF0](*(void *)(v7 + 16));
  if (result <= v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = result;
  }
  if (v19 < v11)
  {
    if (v14 <= v19) {
      uint64_t v17 = v19;
    }
    else {
      uint64_t v17 = v14;
    }
LABEL_30:
    uint64_t v20 = specialized static _HashTable.create<A>(uncheckedUniqueElements:scale:reservedScale:)(v7, v17, 0, v14);
    Swift::Int result = swift_release();
    uint64_t *v3 = v20;
    return result;
  }
  if (!v10 || (Swift::Int result = swift_isUniquelyReferenced_native(), result))
  {
    uint64_t v21 = *v3;
    if (*v3) {
      goto LABEL_35;
    }
LABEL_39:
    if (!v14) {
      return result;
    }
    __break(1u);
    goto LABEL_41;
  }
  Swift::Int result = *v3;
  if (!*v3)
  {
LABEL_42:
    __break(1u);
    return result;
  }
  uint64_t v21 = _HashTable.copy()();
  Swift::Int result = swift_release();
  uint64_t *v3 = v21;
  if (!v21) {
    goto LABEL_39;
  }
LABEL_35:
  Swift::Int result = swift_beginAccess();
  if ((*(void *)(v21 + 24) & 0x3FLL) != v14) {
    *(void *)(v21 + 24) = *(void *)(v21 + 24) & 0xFFFFFFFFFFFFFFC0 | v14 & 0x3F;
  }
  return result;
}

unint64_t specialized OrderedSet._removeExistingMember(at:in:)@<X0>(int64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *(void *)(v3[1] + 16);
  uint64_t v7 = *v3;
  if (!*v3)
  {
    if (!v6) {
      goto LABEL_16;
    }
    return specialized ContiguousArray.remove(at:)(a1, a3);
  }
  swift_beginAccess();
  if ((*(void *)(v7 + 16) & 0x3FLL) == (*(void *)(v7 + 24) & 0x3FLL))
  {
    if (!v6) {
      goto LABEL_16;
    }
  }
  else if (v6 <= static _HashTable.minimumCapacity(forScale:)())
  {
LABEL_16:
    specialized ContiguousArray.remove(at:)(a1, a3);
    return specialized OrderedSet._regenerateHashTable()();
  }
  unint64_t result = swift_isUniquelyReferenced_native();
  uint64_t v10 = *v3;
  if (!result)
  {
    if (!v10) {
      goto LABEL_20;
    }
    uint64_t v10 = _HashTable.copy()();
    unint64_t result = swift_release();
    uint64_t *v3 = v10;
  }
  if (v10)
  {
    swift_retain();
    unint64_t result = specialized _HashTable.UnsafeHandle.delete(bucket:hashValueGenerator:)(a2, (Swift::Int *)(v10 + 16), v10 + 32, (uint64_t)v3);
    if (__OFADD__(a1, 1))
    {
      __break(1u);
    }
    else if (a1 + 1 >= a1)
    {
      uint64_t v11 = v3[1];
      swift_retain();
      specialized _HashTable.UnsafeHandle.adjustContents<A>(preparingForRemovalOf:in:)(a1, a1 + 1, v11, (Swift::Int *)(v10 + 16), v10 + 32);
      swift_release();
      swift_release();
      return specialized ContiguousArray.remove(at:)(a1, a3);
    }
    __break(1u);
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t specialized ContiguousArray.remove(at:)(unint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v1 = v3;
  if ((result & 1) == 0) {
    specialized _ContiguousArrayBuffer._consumeAndCreateNew()();
  }
  unint64_t v5 = *(void *)(v3 + 16);
  if (v5 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v6 = v5 - 1;
    uint64_t v7 = v3 + 8 * a1;
    uint64_t v8 = *(void *)(v7 + 32);
    memmove((void *)(v7 + 32), (const void *)(v7 + 40), 8 * (v5 - 1 - a1));
    *(void *)(v3 + 16) = v6;
    specialized ContiguousArray._endMutation()();
    return v8;
  }
  return result;
}

uint64_t specialized ContiguousArray.remove(at:)@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *v2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)specialized _ContiguousArrayBuffer._consumeAndCreateNew()(v5);
    uint64_t v5 = result;
  }
  unint64_t v7 = *(void *)(v5 + 16);
  if (v7 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v8 = v7 - 1;
    uint64_t v9 = v5 + 40 * a1;
    long long v10 = *(_OWORD *)(v9 + 48);
    *(_OWORD *)a2 = *(_OWORD *)(v9 + 32);
    *(_OWORD *)(a2 + 16) = v10;
    *(void *)(a2 + 32) = *(void *)(v9 + 64);
    uint64_t result = (uint64_t)memmove((void *)(v9 + 32), (const void *)(v9 + 72), 40 * (v8 - a1));
    *(void *)(v5 + 16) = v8;
    uint64_t *v2 = v5;
  }
  return result;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void specialized _ContiguousArrayBuffer._consumeAndCreateNew()()
{
}

unint64_t specialized _HashTable.UnsafeHandle.delete(bucket:hashValueGenerator:)(uint64_t a1, Swift::Int *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a1;
  *(void *)&long long v25 = a2;
  *((void *)&v25 + 1) = a3;
  uint64_t v26 = a1;
  uint64_t v27 = _HashTable.UnsafeHandle._startIterator(bucket:)();
  uint64_t v28 = v7;
  uint64_t v29 = v8;
  char v30 = 0;
  _HashTable.BucketIterator.advance()();
  uint64_t v9 = v27;
  if (v27)
  {
    char v10 = v30;
    uint64_t v12 = v28;
    uint64_t v11 = v29;
    uint64_t v13 = v26;
    uint64_t v14 = _HashTable.UnsafeHandle.firstOccupiedBucketInChain(with:)();
    long long v15 = v25;
    uint64_t v16 = v14;
    while (1)
    {
      long long v31 = v15;
      uint64_t v32 = v13;
      uint64_t v33 = v9;
      uint64_t v34 = v12;
      uint64_t v35 = v11;
      char v36 = v10 & 1;
      unint64_t result = _HashTable.BucketIterator.currentValue.getter();
      if (v18)
      {
LABEL_21:
        __break(1u);
        return result;
      }
      if ((result & 0x8000000000000000) != 0)
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
        goto LABEL_21;
      }
      uint64_t v19 = *(void *)(a4 + 8);
      if (result >= *(void *)(v19 + 16)) {
        goto LABEL_19;
      }
      Swift::Int v20 = *a2;
      outlined init with copy of AnyHashable(v19 + 40 * result + 32, (uint64_t)v24);
      Swift::Int v21 = AnyHashable._rawHashValue(seed:)(v20);
      unint64_t result = outlined destroy of AnyHashable((uint64_t)v24);
      uint64_t v22 = 1 << *a2;
      if (__OFSUB__(v22, 1)) {
        goto LABEL_20;
      }
      uint64_t v23 = (v22 - 1) & v21;
      if (v6 >= v16)
      {
        if (v23 < v16) {
          goto LABEL_3;
        }
      }
      else if (v23 >= v16)
      {
        goto LABEL_13;
      }
      if (v6 >= v23)
      {
LABEL_13:
        _HashTable.BucketIterator.currentValue.getter();
        _HashTable.UnsafeHandle.subscript.setter();
        uint64_t v6 = v13;
      }
LABEL_3:
      _HashTable.BucketIterator.advance()();
      long long v15 = v25;
      uint64_t v13 = v26;
      uint64_t v9 = v27;
      uint64_t v12 = v28;
      uint64_t v11 = v29;
      char v10 = v30;
      if (!v27) {
        return _HashTable.UnsafeHandle.subscript.setter();
      }
    }
  }
  return _HashTable.UnsafeHandle.subscript.setter();
}

void specialized _HashTable.UnsafeHandle.adjustContents<A>(preparingForRemovalOf:in:)(uint64_t a1, uint64_t a2, uint64_t a3, Swift::Int *a4, uint64_t a5)
{
  uint64_t v6 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  if (v6 >= 1)
  {
    unint64_t v11 = *(void *)(a3 + 16);
    uint64_t v12 = v11 - v6;
    if ((uint64_t)v11 < v6) {
      ++v12;
    }
    if (a1 < v12 >> 1)
    {
      if (MEMORY[0x22A683DC0](*a4 & 0x3F) / 3 > a1)
      {
        if (a1 < 0)
        {
LABEL_64:
          __break(1u);
          goto LABEL_65;
        }
        if (v11 < a1)
        {
LABEL_65:
          __break(1u);
          goto LABEL_66;
        }
        if (a1)
        {
          swift_retain();
          uint64_t v13 = 0;
          while (1)
          {
            outlined init with copy of AnyHashable(a3 + 32 + 40 * v13, (uint64_t)v51);
            Swift::Int v14 = AnyHashable._rawHashValue(seed:)(*a4);
            uint64_t v15 = 1 << *a4;
            BOOL v16 = __OFSUB__(v15, 1);
            uint64_t v17 = v15 - 1;
            if (v16) {
              break;
            }
            Swift::Int v18 = v17 & v14;
            uint64_t v19 = _HashTable.UnsafeHandle._startIterator(bucket:)();
            *(void *)&long long v52 = a4;
            *((void *)&v52 + 1) = a5;
            Swift::Int v53 = v18;
            *(void *)&long long v54 = v19;
            *((void *)&v54 + 1) = v20;
            uint64_t v55 = v21;
            char v56 = 0;
            if (v19)
            {
              char v22 = 0;
              uint64_t v23 = a4;
              uint64_t v24 = a5;
              do
              {
                *(void *)&long long v57 = v23;
                *((void *)&v57 + 1) = v24;
                Swift::Int v58 = v18;
                *(void *)&long long v59 = v19;
                *((void *)&v59 + 1) = v20;
                uint64_t v60 = v21;
                char v61 = v22 & 1;
                uint64_t v25 = _HashTable.BucketIterator.currentValue.getter();
                if ((v26 & 1) == 0 && v25 == v13) {
                  break;
                }
                _HashTable.BucketIterator.advance()();
                uint64_t v24 = *((void *)&v52 + 1);
                uint64_t v23 = (Swift::Int *)v52;
                Swift::Int v18 = v53;
                uint64_t v20 = *((void *)&v54 + 1);
                uint64_t v19 = v54;
                uint64_t v21 = v55;
                char v22 = v56;
              }
              while ((void)v54);
            }
            if (__OFADD__(v13, v6)) {
              goto LABEL_56;
            }
            ++v13;
            _HashTable.BucketIterator.currentValue.setter();
            outlined destroy of AnyHashable((uint64_t)v51);
            if (v13 == a1)
            {
              swift_release();
              goto LABEL_20;
            }
          }
          __break(1u);
LABEL_56:
          __break(1u);
          goto LABEL_57;
        }
        goto LABEL_20;
      }
      *(void *)&long long v52 = a4;
      *((void *)&v52 + 1) = a5;
      Swift::Int v53 = 0;
      *(void *)&long long v54 = _HashTable.UnsafeHandle._startIterator(bucket:)();
      *((void *)&v54 + 1) = v43;
      uint64_t v55 = v44;
      char v56 = 0;
      long long v57 = v52;
      long long v59 = v54;
      Swift::Int v58 = 0;
      uint64_t v60 = v55;
      char v61 = v56;
      uint64_t v45 = _HashTable.BucketIterator.currentValue.getter();
      if ((v46 & 1) != 0 || v45 >= a1)
      {
LABEL_43:
        _HashTable.BucketIterator.advance()();
LABEL_20:
        uint64_t v27 = a4[1];
        if (__OFSUB__(v27 >> 6, v6))
        {
LABEL_62:
          __break(1u);
          goto LABEL_63;
        }
        uint64_t v28 = 1 << *a4;
        BOOL v16 = __OFSUB__(v28, 1);
        uint64_t v29 = v28 - 1;
        if (v16)
        {
LABEL_63:
          __break(1u);
          goto LABEL_64;
        }
        uint64_t v30 = (v29 & (((v27 >> 6) - v6) >> 63)) + (v27 >> 6) - v6;
        if (v30 < v29) {
          uint64_t v29 = 0;
        }
        a4[1] = a4[1] & 0x3F | ((v30 - v29) << 6);
        return;
      }
      if (!__OFADD__(v45, v6))
      {
        _HashTable.BucketIterator.currentValue.setter();
        goto LABEL_43;
      }
      __break(1u);
LABEL_49:
      *(void *)&long long v52 = a4;
      *((void *)&v52 + 1) = a5;
      Swift::Int v53 = 0;
      *(void *)&long long v54 = _HashTable.UnsafeHandle._startIterator(bucket:)();
      *((void *)&v54 + 1) = v47;
      uint64_t v55 = v48;
      char v56 = 0;
      long long v57 = v52;
      long long v59 = v54;
      Swift::Int v58 = 0;
      uint64_t v60 = v55;
      char v61 = v56;
      uint64_t v49 = _HashTable.BucketIterator.currentValue.getter();
      if ((v50 & 1) == 0 && v49 >= v5)
      {
        if (__OFSUB__(v49, v6))
        {
LABEL_57:
          __break(1u);
LABEL_58:
          __break(1u);
LABEL_59:
          __break(1u);
          goto LABEL_60;
        }
        _HashTable.BucketIterator.currentValue.setter();
      }
      _HashTable.BucketIterator.advance()();
      return;
    }
    uint64_t v5 = a2;
    if (__OFSUB__(v11, a2))
    {
LABEL_61:
      __break(1u);
      goto LABEL_62;
    }
    if ((uint64_t)(v11 - a2) >= MEMORY[0x22A683DC0](*a4 & 0x3F) / 3) {
      goto LABEL_49;
    }
    if ((uint64_t)v11 < v5)
    {
LABEL_66:
      __break(1u);
      goto LABEL_67;
    }
    if (v5 < 0)
    {
LABEL_67:
      __break(1u);
      goto LABEL_68;
    }
    if (v11 != v5)
    {
      if (v11 <= v5)
      {
LABEL_68:
        __break(1u);
        return;
      }
      swift_retain();
      while (1)
      {
        outlined init with copy of AnyHashable(a3 + 32 + 40 * v5, (uint64_t)v51);
        Swift::Int v31 = AnyHashable._rawHashValue(seed:)(*a4);
        uint64_t v32 = 1 << *a4;
        BOOL v16 = __OFSUB__(v32, 1);
        uint64_t v33 = v32 - 1;
        if (v16) {
          goto LABEL_58;
        }
        Swift::Int v34 = v33 & v31;
        uint64_t v35 = _HashTable.UnsafeHandle._startIterator(bucket:)();
        *(void *)&long long v52 = a4;
        *((void *)&v52 + 1) = a5;
        Swift::Int v53 = v34;
        *(void *)&long long v54 = v35;
        *((void *)&v54 + 1) = v36;
        uint64_t v55 = v37;
        char v56 = 0;
        if (v35)
        {
          char v38 = 0;
          double v39 = a4;
          uint64_t v40 = a5;
          do
          {
            *(void *)&long long v57 = v39;
            *((void *)&v57 + 1) = v40;
            Swift::Int v58 = v34;
            *(void *)&long long v59 = v35;
            *((void *)&v59 + 1) = v36;
            uint64_t v60 = v37;
            char v61 = v38 & 1;
            uint64_t v41 = _HashTable.BucketIterator.currentValue.getter();
            if ((v42 & 1) == 0 && v41 == v5) {
              break;
            }
            _HashTable.BucketIterator.advance()();
            uint64_t v40 = *((void *)&v52 + 1);
            double v39 = (Swift::Int *)v52;
            Swift::Int v34 = v53;
            uint64_t v36 = *((void *)&v54 + 1);
            uint64_t v35 = v54;
            uint64_t v37 = v55;
            char v38 = v56;
          }
          while ((void)v54);
        }
        if (__OFSUB__(v5, v6)) {
          goto LABEL_59;
        }
        ++v5;
        _HashTable.BucketIterator.currentValue.setter();
        outlined destroy of AnyHashable((uint64_t)v51);
        if (v5 == v11)
        {
          swift_release();
          return;
        }
      }
    }
  }
}

void (*specialized protocol witness for Collection.subscript.read in conformance [A](void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = specialized Array.subscript.read(v6, a2, a3);
  return protocol witness for Collection.subscript.read in conformance [A]specialized ;
}

void protocol witness for Collection.subscript.read in conformance [A]specialized (void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*specialized Array.subscript.read(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x22A684260](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return Array.subscript.readspecialized ;
  }
  __break(1u);
  return result;
}

void Array.subscript.readspecialized (id *a1)
{
}

uint64_t specialized Array._copyContents(initializing:)(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    unint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
      unint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          lazy protocol witness table accessor for type [UIView] and conformance [A]();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UIView]);
            char v10 = specialized protocol witness for Collection.subscript.read in conformance [A](v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        type metadata accessor for UIView();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t specialized closure #1 in GridView.updateLayout(animated:)(uint64_t a1, unint64_t a2, double a3, double a4)
{
  uint64_t v8 = a1 + OBJC_IVAR____TtC9CarPlayUI8GridView_cells;
  swift_beginAccess();
  uint64_t v9 = *(void *)(v8 + 8);
  uint64_t v10 = *(void *)(v8 + 16);
  uint64_t v11 = a1 + OBJC_IVAR____TtC9CarPlayUI8GridView_layout;
  uint64_t v28 = *(void *)(v10 + 16);
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t result = swift_beginAccess();
  unint64_t v13 = 0;
  uint64_t v27 = v9;
  uint64_t v26 = v9 + 32;
  while (1)
  {
    if ((uint64_t)v13 >= v28)
    {
      uint64_t v37 = 0;
      memset(v36, 0, sizeof(v36));
    }
    else
    {
      if (v13 >= *(void *)(v27 + 16)) {
        goto LABEL_20;
      }
      uint64_t result = outlined init with copy of AnyHashable(v26 + 40 * v13, (uint64_t)&v33);
      if (v13 >= *(void *)(v10 + 16)) {
        goto LABEL_21;
      }
      Swift::Int v14 = *(void **)(v10 + 32 + 8 * v13);
      long long v30 = v33;
      long long v31 = v34;
      uint64_t v32 = v35;
      *(_OWORD *)((char *)v36 + 8) = v33;
      *(_OWORD *)((char *)&v36[1] + 8) = v34;
      *((void *)&v36[2] + 1) = v35;
      *(void *)&v36[0] = v13;
      uint64_t v37 = v14;
      id v15 = v14;
      ++v13;
    }
    uint64_t result = outlined init with take of (offset: Int, element: (key: AnyHashable, value: UIView))?((uint64_t)v36, (uint64_t)&v38);
    if (!*((void *)&v40 + 1))
    {
      swift_release();
      swift_release();
      return swift_release();
    }
    unint64_t v16 = v38;
    uint64_t v17 = (void *)*((void *)&v41 + 1);
    v36[0] = v39;
    v36[1] = v40;
    v36[2] = v41;
    if ((v38 & 0x8000000000000000) != 0) {
      break;
    }
    outlined init with copy of InsettableShape(v11, (uint64_t)&v33);
    uint64_t v18 = *((void *)&v34 + 1);
    uint64_t v19 = v35;
    __swift_project_boxed_opaque_existential_1(&v33, *((uint64_t *)&v34 + 1));
    double v20 = (*(double (**)(uint64_t, uint64_t))(v19 + 16))(v18, v19);
    outlined init with copy of InsettableShape(v11, (uint64_t)&v29);
    long long v21 = v31;
    __swift_project_boxed_opaque_existential_1(&v29, v31);
    uint64_t result = (*(uint64_t (**)(void, void))(*((void *)&v21 + 1) + 8))(v21, *((void *)&v21 + 1));
    if (!a2) {
      goto LABEL_16;
    }
    double v23 = floor((double)v16 / (double)a2);
    if ((~*(void *)&v23 & 0x7FF0000000000000) == 0) {
      goto LABEL_17;
    }
    if (v23 <= -1.0) {
      goto LABEL_18;
    }
    if (v23 >= 1.84467441e19) {
      goto LABEL_19;
    }
    double v24 = (v22 + a3) * (double)(v16 % a2);
    double v25 = v20 + (v22 + a4) * (double)(unint64_t)v23;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v29);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v33);
    objc_msgSend(v17, sel_setFrame_, v24, v25, a3, a4);

    uint64_t result = outlined destroy of AnyHashable((uint64_t)v36);
  }
  __break(1u);
LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  __break(1u);
  return result;
}

uint64_t specialized OrderedDictionary.init<A>(uniqueKeysWithValues:)(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8EE78];
  uint64_t v3 = (void *)MEMORY[0x263F8EE78];
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0) {
    uint64_t v3 = specialized _copyCollectionToContiguousArray<A>(_:)(MEMORY[0x263F8EE78]);
  }
  uint64_t v19 = 0;
  uint64_t v20 = v2;
  uint64_t v18 = v3;
  uint64_t v4 = *(void *)(a1 + 16);
  specialized OrderedSet._reserveCapacity(_:persistent:)(v4, 0);
  specialized ContiguousArray.reserveCapacity(_:)();
  if (!v4) {
    return v19;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = 0;
  while (1)
  {
    outlined init with copy of (AnyHashable, UIView)(a1 + 32 + 48 * v5, (uint64_t)v16);
    uint64_t v15 = v17;
    v14[0] = v16[0];
    v14[1] = v16[1];
    uint64_t v9 = v19;
    uint64_t v10 = v20 + 32;
    uint64_t v11 = *(void *)(v20 + 16);
    if (!v19) {
      break;
    }
    swift_retain();
    specialized _HashTable.UnsafeHandle._find<A>(_:in:)((uint64_t)v14, v10, v11, (Swift::Int *)(v9 + 16), v9 + 32);
    char v7 = v6;
    uint64_t result = swift_release();
    if ((v7 & 1) == 0) {
      goto LABEL_14;
    }
LABEL_6:
    ++v5;
    specialized OrderedSet._appendNew(_:in:)((uint64_t)v14);
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized ContiguousArray._endMutation()();
    outlined destroy of AnyHashable((uint64_t)v14);
    if (v5 == v4)
    {
      swift_bridgeObjectRelease();
      return v19;
    }
  }
  if (!v11) {
    goto LABEL_6;
  }
  while (1)
  {
    outlined init with copy of AnyHashable(v10, (uint64_t)v13);
    char v12 = MEMORY[0x22A684220](v13, v14);
    uint64_t result = outlined destroy of AnyHashable((uint64_t)v13);
    if (v12) {
      break;
    }
    v10 += 40;
    if (!--v11) {
      goto LABEL_6;
    }
  }
LABEL_14:
  __break(1u);
  return result;
}

uint64_t outlined init with copy of AnyHashable(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t outlined destroy of (key: AnyHashable, value: UIView)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: AnyHashable, value: UIView));
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined destroy of AnyHashable(uint64_t a1)
{
  return a1;
}

uint64_t sub_227AF94A0()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for closure #1 in GridView.updateLayout(animated:)()
{
  return specialized closure #1 in GridView.updateLayout(animated:)(*(void *)(v0 + 16), *(void *)(v0 + 40), *(double *)(v0 + 24), *(double *)(v0 + 32));
}

unint64_t type metadata accessor for UIView()
{
  unint64_t result = lazy cache variable for type metadata for UIView;
  if (!lazy cache variable for type metadata for UIView)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for UIView);
  }
  return result;
}

uint64_t partial apply for closure #2 in GridView.updateLayout(animated:)()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t type metadata accessor for GridView()
{
  return self;
}

uint64_t sub_227AF9574()
{
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_227AF9584@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC9CarPlayUI8GridView_layout;
  swift_beginAccess();
  return outlined init with copy of InsettableShape(v3, a2);
}

uint64_t sub_227AF95E0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC9CarPlayUI8GridView_dataSource;
  swift_beginAccess();
  uint64_t result = MEMORY[0x22A684C00](v3);
  uint64_t v5 = *(void *)(v3 + 8);
  *a2 = result;
  a2[1] = v5;
  return result;
}

uint64_t sub_227AF963C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t v2 = swift_unknownObjectRetain();
  return GridView.dataSource.setter(v2, v1);
}

uint64_t method lookup function for GridView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GridView);
}

uint64_t dispatch thunk of GridView.layout.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of GridView.layout.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of GridView.layout.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of GridView.dataSource.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of GridView.dataSource.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of GridView.dataSource.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of GridView.reloadData()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of GridView.updateData()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of GridView.updateLayout(animated:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t outlined destroy of weak GridView.DataSource?(uint64_t a1)
{
  return a1;
}

uint64_t outlined init with take of (offset: Int, element: (key: AnyHashable, value: UIView))?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (offset: Int, element: (key: AnyHashable, value: UIView))?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t lazy protocol witness table accessor for type [UIView] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [UIView] and conformance [A];
  if (!lazy protocol witness table cache variable for type [UIView] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UIView]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [UIView] and conformance [A]);
  }
  return result;
}

uint64_t outlined init with copy of (AnyHashable, UIView)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (AnyHashable, UIView));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

double static GridView.Layout<>.squareGrid.getter@<D0>(uint64_t a1@<X8>)
{
  double result = 0.0;
  __asm { FMOV            V1.2D, #10.0 }
  *(_OWORD *)a1 = _Q1;
  *(_OWORD *)(a1 + 16) = xmmword_227B01710;
  *(void *)(a1 + 32) = 0;
  return result;
}

double GridView.SquareGrid.Layout.itemSpacing.getter()
{
  return *(double *)v0;
}

double GridView.SquareGrid.Layout.contentInsets.getter()
{
  return *(double *)(v0 + 8);
}

Swift::UInt __swiftcall GridView.SquareGrid.Layout.numberOfViewsPerLine(for:itemsCount:)(CGSize a1, Swift::UInt itemsCount)
{
  Swift::UInt v2 = 4;
  uint64_t v3 = 5;
  if (itemsCount > 0xA) {
    uint64_t v3 = 6;
  }
  if (itemsCount >= 9) {
    Swift::UInt v2 = v3;
  }
  Swift::UInt v4 = 9;
  if (itemsCount > 9) {
    Swift::UInt v4 = 6;
  }
  if (a1.width > 420.0) {
    return v4;
  }
  else {
    return v2;
  }
}

CGSize __swiftcall GridView.SquareGrid.Layout.sizeForViews(for:itemsCount:)(CGSize a1, Swift::UInt itemsCount)
{
  if (a1.width <= 420.0)
  {
    double v3 = 4.0;
    double v5 = 5.0;
    if (itemsCount > 0xA) {
      double v5 = 6.0;
    }
    if (itemsCount > 8) {
      double v3 = v5;
    }
  }
  else
  {
    double v3 = 6.0;
    if (itemsCount <= 9)
    {
      Swift::UInt v4 = 6;
      if (itemsCount > 6) {
        Swift::UInt v4 = itemsCount;
      }
      double v3 = (double)v4;
    }
  }
  double v6 = (a1.width - *v2 * (v3 + -1.0)) / v3;
  double v7 = v6;
  result.double height = v7;
  result.double width = v6;
  return result;
}

CGSize __swiftcall GridView.SquareGrid.Layout.sizeThatFits(_:itemsCount:)(CGSize _, Swift::UInt itemsCount)
{
  double v3 = *v2;
  if (_.width <= 420.0)
  {
    double v8 = 5.0;
    if (itemsCount > 0xA) {
      double v8 = 6.0;
    }
    double v6 = 4.0;
    if (itemsCount > 8) {
      double v6 = v8;
    }
    double v7 = (_.width - (v6 + -1.0) * v3) / v6;
  }
  else
  {
    Swift::UInt v4 = 6;
    if (itemsCount > 6) {
      Swift::UInt v4 = itemsCount;
    }
    double v5 = (double)v4;
    double v6 = 6.0;
    if (itemsCount > 9) {
      double v5 = 6.0;
    }
    double v7 = (_.width - (v5 + -1.0) * v3) / v5;
    if (itemsCount <= 9) {
      double v6 = 9.0;
    }
  }
  double v9 = fmax(ceil((double)itemsCount / v6), 1.0);
  double v10 = v2[3] + v2[1] + v7 * v9 + v3 * (v9 + -1.0);
  _.double height = v10;
  return _;
}

Swift::UInt protocol witness for GridView.Layout.numberOfViewsPerLine(for:itemsCount:) in conformance GridView.SquareGrid.Layout(Swift::UInt a1, double a2, double a3)
{
  return GridView.SquareGrid.Layout.numberOfViewsPerLine(for:itemsCount:)((CGSize)__PAIR128__(*(unint64_t *)&a3, *(unint64_t *)&a2), a1);
}

ValueMetadata *type metadata accessor for GridView.SquareGrid.Layout()
{
  return &type metadata for GridView.SquareGrid.Layout;
}

uint64_t dispatch thunk of GridView.DataSource.numberOfViews()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of GridView.DataSource.model(atIndex:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of GridView.DataSource.view(atIndex:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of GridView.Layout.itemSpacing.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of GridView.Layout.contentInsets.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of GridView.Layout.numberOfViewsPerLine(for:itemsCount:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of GridView.Layout.sizeForViews(for:itemsCount:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of GridView.Layout.sizeThatFits(_:itemsCount:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t GridView.Base.ViewModel.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GridView.Base.ViewModel.init(id:title:imageConfiguration:action:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  *a8 = a1;
  a8[1] = a2;
  a8[2] = a3;
  a8[3] = a4;
  uint64_t v12 = type metadata accessor for GridView.Base.ViewModel(0);
  uint64_t result = outlined init with take of GridView.Base.ViewModel.ImageConfiguration(a5, (uint64_t)a8 + *(int *)(v12 + 24), type metadata accessor for GridView.Base.ViewModel.ImageConfiguration);
  Swift::Int v14 = (void *)((char *)a8 + *(int *)(v12 + 28));
  *Swift::Int v14 = a6;
  v14[1] = a7;
  return result;
}

uint64_t type metadata accessor for GridView.Base.ViewModel(uint64_t a1)
{
  return type metadata accessor for GridView.Pins.Cell.ButtonStyle(a1, (uint64_t *)&type metadata singleton initialization cache for GridView.Base.ViewModel);
}

uint64_t type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(uint64_t a1)
{
  return type metadata accessor for GridView.Pins.Cell.ButtonStyle(a1, (uint64_t *)&type metadata singleton initialization cache for GridView.Base.ViewModel.ImageConfiguration);
}

uint64_t GridView.Base.ViewModel.ImageConfiguration.init(image:shape:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  char v4 = *a2;
  outlined init with take of GridView.Base.ViewModel.ImageConfiguration(a1, a3, type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image);
  uint64_t result = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
  *(unsigned char *)(a3 + *(int *)(result + 20)) = v4;
  return result;
}

uint64_t outlined init with take of GridView.Base.ViewModel.ImageConfiguration(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(uint64_t a1)
{
  return type metadata accessor for GridView.Pins.Cell.ButtonStyle(a1, (uint64_t *)&type metadata singleton initialization cache for GridView.Base.ViewModel.ImageConfiguration.Image);
}

BOOL static GridView.Base.ViewModel.ImageConfiguration.Shape.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void GridView.Base.ViewModel.ImageConfiguration.Shape.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int GridView.Base.ViewModel.ImageConfiguration.Shape.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance GridView.Base.ViewModel.ImageConfiguration.Shape(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GridView.Base.ViewModel.ImageConfiguration.Shape()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance GridView.Base.ViewModel.ImageConfiguration.Shape()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GridView.Base.ViewModel.ImageConfiguration.Shape()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for Identifiable.id.getter in conformance GridView.Base.ViewModel@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t GridView.Base.BaseDataSource.viewModels.getter()
{
  specialized GridView.Base.BaseDataSource.viewModels.getter();
  return swift_bridgeObjectRetain();
}

uint64_t GridView.Base.BaseDataSource.viewModels.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*GridView.Base.BaseDataSource.viewModels.modify())()
{
  return GridView.Base.BaseDataSource.viewModels.modify;
}

uint64_t GridView.Base.BaseDataSource.__allocating_init(viewModels:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t GridView.Base.BaseDataSource.init(viewModels:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

Swift::UInt __swiftcall GridView.Base.BaseDataSource.numberOfViews()()
{
  swift_beginAccess();
  return *(void *)(*(void *)(v0 + 16) + 16);
}

uint64_t GridView.Base.BaseDataSource.model(atIndex:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v3 = result;
    uint64_t result = swift_beginAccess();
    uint64_t v5 = *(void *)(v2 + 16);
    if (*(void *)(v5 + 16) > v3)
    {
      uint64_t v6 = *(void *)(type metadata accessor for GridView.Base.ViewModel(0) - 8);
      return outlined init with copy of GridView.Base.ViewModel(v5+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(void *)(v6 + 72) * v3, a2);
    }
  }
  __break(1u);
  return result;
}

void __swiftcall GridView.Base.BaseDataSource.view(atIndex:)(UIView *__return_ptr retstr, Swift::UInt atIndex)
{
  uint64_t v4 = *v2;
  uint64_t v5 = type metadata accessor for GridView.Base.ViewModel(0);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  double v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)(v4 + 80);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = *(void *)(v4 + 88);
  type metadata accessor for _UIHostingView();
  GridView.Base.BaseDataSource.model(atIndex:)(atIndex, (uint64_t)v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, v9, v10);
  _UIHostingView.__allocating_init(rootView:)();
}

uint64_t GridView.Base.BaseDataSource.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t GridView.Base.BaseDataSource.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

void (*protocol witness for GridView.Base.DataSource.viewModels.modify in conformance GridView.Base.BaseDataSource<A>(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = GridView.Base.BaseDataSource.viewModels.modify();
  return protocol witness for Animatable.animatableData.modify in conformance AnyInsettableShape;
}

double closure #1 in GridView.Base.Placeholder.body.getter@<D0>(void *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = type metadata accessor for Image.ResizingMode();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    id v21 = a1;
    uint64_t v50 = Image.init(uiImage:)();
    *(void *)long long v59 = v50;
    memset(&v59[8], 0, 73);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>);
    lazy protocol witness table accessor for type ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>> and conformance <> ModifiedContent<A, B>();
    _ConditionalContent<>.init(storage:)();
    uint64_t v51 = a5;
    uint64_t v22 = *((void *)&v53 + 1);
    uint64_t v23 = v54;
    uint64_t v48 = *((void *)&v52 + 1);
    uint64_t v49 = a2;
    long long v24 = v56;
    char v25 = v57;
    v58[0] = v52;
    uint64_t v43 = v52;
    uint64_t v44 = *((void *)&v55 + 1);
    uint64_t v46 = *((void *)&v54 + 1);
    uint64_t v47 = v53;
    v58[1] = v53;
    v58[2] = v54;
    uint64_t v45 = v55;
    v58[3] = v55;
    v58[4] = v56;
    LOWORD(v58[5]) = v57;
    outlined copy of _ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>>.Storage(v52, *((uint64_t *)&v52 + 1), v53, *((uint64_t *)&v53 + 1), v54, *((uint64_t *)&v54 + 1), v55, *((uint64_t *)&v55 + 1), v56, *((uint64_t *)&v56 + 1), v57);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>>);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Image?);
    lazy protocol witness table accessor for type _ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>> and conformance <> _ConditionalContent<A, B>();
    lazy protocol witness table accessor for type Image? and conformance <A> A?();
    _ConditionalContent<>.init(storage:)();
    outlined consume of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(a1, v49, 0);
    a5 = v51;
    outlined consume of _ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>>.Storage(v43, v48, v47, v22, v23, v46, v45, v44, v24, *((uint64_t *)&v24 + 1), v25);
    swift_release();
    goto LABEL_10;
  }
  if (a3 != 1)
  {
    if (a2)
    {
      id v26 = objc_msgSend(self, sel_mainBundle);
      id v27 = objc_msgSend(v26, sel_bundleIdentifier);

      if (!v27)
      {
LABEL_9:
        *(void *)&v58[0] = v27;
        *(_OWORD *)((char *)v58 + 8) = 0u;
        *(_OWORD *)((char *)&v58[1] + 8) = 0u;
        *(_OWORD *)((char *)&v58[2] + 8) = 0u;
        *(_OWORD *)((char *)&v58[3] + 8) = 0u;
        *(_OWORD *)((char *)&v58[4] + 1) = 0u;
        BYTE1(v58[5]) = 1;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>>);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Image?);
        lazy protocol witness table accessor for type _ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>> and conformance <> _ConditionalContent<A, B>();
        lazy protocol witness table accessor for type Image? and conformance <A> A?();
        _ConditionalContent<>.init(storage:)();
        goto LABEL_10;
      }
      uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v30 = v29;

      swift_bridgeObjectRetain();
      long long v31 = (void *)MEMORY[0x22A6841B0](v28, v30);
      uint64_t v32 = CPUIPlaceholderTypeForBundleIdentifier(v31);
      swift_bridgeObjectRelease_n();

      a1 = (void *)v32;
    }
    long long v33 = CPUIImageNameForPlaceholderType((uint64_t)a1);
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    id v34 = CPUIFrameworkBundle();
    Image.init(_:bundle:)();
    (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F1B4B8], v10);
    id v27 = (id)Image.resizable(capInsets:resizingMode:)();
    swift_release();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    goto LABEL_9;
  }
  outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(a1, a2, 1);
  swift_retain();
  uint64_t v14 = static Alignment.center.getter();
  uint64_t v50 = v15;
  swift_bridgeObjectRetain();
  Image.init(systemName:)();
  unint64_t v16 = a1;
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F1B4B8], v10);
  uint64_t v17 = Image.resizable(capInsets:resizingMode:)();
  uint64_t v51 = a5;
  uint64_t v18 = v17;
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  unsigned __int8 v19 = static Edge.Set.all.getter();
  uint64_t v20 = static HierarchicalShapeStyle.secondary.getter();
  outlined consume of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(v16, a2, 1);
  *(void *)long long v59 = a4;
  *(void *)&v59[8] = v18;
  memset(&v59[24], 0, 32);
  *(void *)&v59[16] = v19;
  *(void *)&v59[56] = (v20 << 32) | 1;
  *(void *)&v59[64] = v14;
  *(void *)&v59[72] = v50;
  v59[80] = 1;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>);
  lazy protocol witness table accessor for type ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>> and conformance <> ModifiedContent<A, B>();
  _ConditionalContent<>.init(storage:)();
  v58[0] = v52;
  v58[1] = v53;
  v58[2] = v54;
  v58[3] = v55;
  v58[4] = v56;
  LOWORD(v58[5]) = v57;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>>);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Image?);
  lazy protocol witness table accessor for type _ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>> and conformance <> _ConditionalContent<A, B>();
  lazy protocol witness table accessor for type Image? and conformance <A> A?();
  _ConditionalContent<>.init(storage:)();
  a5 = v51;
  swift_release();
  swift_release();
LABEL_10:
  double result = *(double *)v59;
  long long v36 = *(_OWORD *)&v59[16];
  long long v37 = *(_OWORD *)&v59[32];
  long long v38 = *(_OWORD *)&v59[48];
  long long v39 = *(_OWORD *)&v59[64];
  char v40 = v59[80];
  char v41 = v60;
  *(_OWORD *)a5 = *(_OWORD *)v59;
  *(_OWORD *)(a5 + 16) = v36;
  *(_OWORD *)(a5 + 32) = v37;
  *(_OWORD *)(a5 + 48) = v38;
  *(_OWORD *)(a5 + 64) = v39;
  *(unsigned char *)(a5 + 80) = v40;
  *(unsigned char *)(a5 + 81) = v41;
  return result;
}

double protocol witness for View.body.getter in conformance GridView.Base.Placeholder@<D0>(uint64_t a1@<X8>)
{
  closure #1 in GridView.Base.Placeholder.body.getter(*(void **)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)v10);
  char v3 = v11;
  char v4 = v12;
  double result = *(double *)v10;
  long long v6 = v10[1];
  long long v7 = v10[2];
  long long v8 = v10[3];
  long long v9 = v10[4];
  *(_OWORD *)a1 = v10[0];
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = v7;
  *(_OWORD *)(a1 + 48) = v8;
  *(_OWORD *)(a1 + 64) = v9;
  *(unsigned char *)(a1 + 80) = v3;
  *(unsigned char *)(a1 + 81) = v4;
  return result;
}

uint64_t specialized GridView.Base.BaseDataSource.viewModels.getter()
{
  swift_beginAccess();
  return *(void *)(v0 + 16);
}

uint64_t outlined init with copy of GridView.Base.ViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GridView.Base.ViewModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t lazy protocol witness table accessor for type GridView.Base.ViewModel.ImageConfiguration.Shape and conformance GridView.Base.ViewModel.ImageConfiguration.Shape()
{
  unint64_t result = lazy protocol witness table cache variable for type GridView.Base.ViewModel.ImageConfiguration.Shape and conformance GridView.Base.ViewModel.ImageConfiguration.Shape;
  if (!lazy protocol witness table cache variable for type GridView.Base.ViewModel.ImageConfiguration.Shape and conformance GridView.Base.ViewModel.ImageConfiguration.Shape)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GridView.Base.ViewModel.ImageConfiguration.Shape and conformance GridView.Base.ViewModel.ImageConfiguration.Shape);
  }
  return result;
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in GridView.Base.ViewModel()
{
  return MEMORY[0x263F8D320];
}

uint64_t instantiation function for generic protocol witness table for GridView.Base.BaseDataSource<A>(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type GridView.Base.ViewModel and conformance GridView.Base.ViewModel()
{
  unint64_t result = lazy protocol witness table cache variable for type GridView.Base.ViewModel and conformance GridView.Base.ViewModel;
  if (!lazy protocol witness table cache variable for type GridView.Base.ViewModel and conformance GridView.Base.ViewModel)
  {
    type metadata accessor for GridView.Base.ViewModel(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GridView.Base.ViewModel and conformance GridView.Base.ViewModel);
  }
  return result;
}

uint64_t sub_227AFAB30@<X0>(uint64_t *a1@<X8>)
{
  *a1 = specialized GridView.Base.BaseDataSource.viewModels.getter();
  return swift_bridgeObjectRetain();
}

uint64_t sub_227AFAB6C()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return GridView.Base.BaseDataSource.viewModels.setter(v0);
}

uint64_t sub_227AFAB98()
{
  return 16;
}

__n128 sub_227AFABA4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

ValueMetadata *type metadata accessor for GridView.Base()
{
  return &type metadata for GridView.Base;
}

uint64_t *initializeBufferWithCopyOfBuffer for GridView.Base.ViewModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    uint64_t *v4 = *a2;
    uint64_t v4 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (void **)((char *)a1 + v9);
    char v11 = (void **)((char *)a2 + v9);
    type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = type metadata accessor for Artwork();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
      uint64_t v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                   + 48);
      uint64_t v14 = (char *)v10 + v13;
      uint64_t v15 = (char *)v11 + v13;
      int v16 = v15[16];
      if (v16 == 255)
      {
        *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
        v14[16] = v15[16];
      }
      else
      {
        uint64_t v17 = *(void *)v15;
        uint64_t v18 = *((void *)v15 + 1);
        outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)v15, v18, v15[16]);
        *(void *)uint64_t v14 = v17;
        *((void *)v14 + 1) = v18;
        v14[16] = v16;
      }
    }
    else
    {
      uint64_t v20 = *v11;
      char *v10 = *v11;
      id v21 = v20;
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v22 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
    *((unsigned char *)v10 + *(int *)(v22 + 20)) = *((unsigned char *)v11 + *(int *)(v22 + 20));
    uint64_t v23 = *(int *)(a3 + 28);
    long long v24 = (uint64_t *)((char *)v4 + v23);
    char v25 = (uint64_t *)((char *)a2 + v23);
    uint64_t v26 = v25[1];
    *long long v24 = *v25;
    v24[1] = v26;
  }
  swift_retain();
  return v4;
}

uint64_t destroy for GridView.Base.ViewModel(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (id *)(a1 + *(int *)(a2 + 24));
  type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for Artwork();
    (*(void (**)(id *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
    long long v6 = (char *)v4
       + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                + 48);
    int v7 = v6[16];
    if (v7 != 255) {
      outlined consume of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(void **)v6, *((void *)v6 + 1), v7);
    }
  }
  else
  {
  }
  return swift_release();
}

void *initializeWithCopy for GridView.Base.ViewModel(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void **)((char *)a1 + v8);
  uint64_t v10 = (void **)((char *)a2 + v8);
  type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = type metadata accessor for Artwork();
    (*(void (**)(void **, void **, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                 + 48);
    uint64_t v13 = (char *)v9 + v12;
    uint64_t v14 = (char *)v10 + v12;
    int v15 = v14[16];
    if (v15 == 255)
    {
      *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
      v13[16] = v14[16];
    }
    else
    {
      uint64_t v16 = *(void *)v14;
      uint64_t v17 = *((void *)v14 + 1);
      outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)v14, v17, v14[16]);
      *(void *)uint64_t v13 = v16;
      *((void *)v13 + 1) = v17;
      v13[16] = v15;
    }
  }
  else
  {
    uint64_t v18 = *v10;
    *uint64_t v9 = *v10;
    id v19 = v18;
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v20 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
  *((unsigned char *)v9 + *(int *)(v20 + 20)) = *((unsigned char *)v10 + *(int *)(v20 + 20));
  uint64_t v21 = *(int *)(a3 + 28);
  uint64_t v22 = (void *)((char *)a1 + v21);
  uint64_t v23 = (void *)((char *)a2 + v21);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  swift_retain();
  return a1;
}

void *assignWithCopy for GridView.Base.ViewModel(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (void **)((char *)a1 + v6);
  uint64_t v8 = (void **)((char *)a2 + v6);
  if (a1 != a2)
  {
    outlined destroy of GridView.Base.ViewModel.ImageConfiguration.Image((uint64_t)a1 + v6);
    type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = type metadata accessor for Artwork();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      uint64_t v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                   + 48);
      uint64_t v11 = (char *)v7 + v10;
      uint64_t v12 = (char *)v8 + v10;
      int v13 = v12[16];
      if (v13 == 255)
      {
        long long v18 = *(_OWORD *)v12;
        v11[16] = v12[16];
        *(_OWORD *)uint64_t v11 = v18;
      }
      else
      {
        uint64_t v14 = *(void *)v12;
        uint64_t v15 = *((void *)v12 + 1);
        outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)v12, v15, v12[16]);
        *(void *)uint64_t v11 = v14;
        *((void *)v11 + 1) = v15;
        v11[16] = v13;
      }
    }
    else
    {
      uint64_t v16 = *v8;
      char *v7 = *v8;
      id v17 = v16;
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v19 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
  *((unsigned char *)v7 + *(int *)(v19 + 20)) = *((unsigned char *)v8 + *(int *)(v19 + 20));
  uint64_t v20 = *(int *)(a3 + 28);
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  uint64_t v23 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v23;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t outlined destroy of GridView.Base.ViewModel.ImageConfiguration.Image(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *initializeWithTake for GridView.Base.ViewModel(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = type metadata accessor for Artwork();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
    uint64_t v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                 + 48);
    int v13 = &v8[v12];
    uint64_t v14 = &v9[v12];
    *(_OWORD *)int v13 = *(_OWORD *)v14;
    v13[16] = v14[16];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  uint64_t v15 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
  v8[*(int *)(v15 + 20)] = v9[*(int *)(v15 + 20)];
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 28));
  return a1;
}

void *assignWithTake for GridView.Base.ViewModel(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  if (a1 != a2)
  {
    outlined destroy of GridView.Base.ViewModel.ImageConfiguration.Image((uint64_t)a1 + v8);
    uint64_t v11 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = type metadata accessor for Artwork();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      uint64_t v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                   + 48);
      uint64_t v14 = &v9[v13];
      uint64_t v15 = &v10[v13];
      *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
      v14[16] = v15[16];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v16 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
  v9[*(int *)(v16 + 20)] = v10[*(int *)(v16 + 20)];
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 28));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for GridView.Base.ViewModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_227AFB498);
}

uint64_t sub_227AFB498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for GridView.Base.ViewModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_227AFB55C);
}

uint64_t sub_227AFB55C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata completion function for GridView.Base.ViewModel()
{
  uint64_t result = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for GridView.Base.ViewModel.ImageConfiguration(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *(void *)a1 = *a2;
    a1 = &v14[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for Artwork();
      (*(void (**)(char *, char **, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                  + 48);
      uint64_t v9 = &a1[v8];
      uint64_t v10 = (char *)a2 + v8;
      int v11 = v10[16];
      if (v11 == 255)
      {
        *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
        v9[16] = v10[16];
      }
      else
      {
        uint64_t v12 = *(void *)v10;
        uint64_t v13 = *((void *)v10 + 1);
        outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)v10, v13, v10[16]);
        *(void *)uint64_t v9 = v12;
        *((void *)v9 + 1) = v13;
        v9[16] = v11;
      }
    }
    else
    {
      uint64_t v15 = *a2;
      *(void *)a1 = *a2;
      uint64_t v16 = v15;
    }
    swift_storeEnumTagMultiPayload();
    a1[*(int *)(a3 + 20)] = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

void destroy for GridView.Base.ViewModel.ImageConfiguration(void **a1)
{
  type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = type metadata accessor for Artwork();
    (*(void (**)(void **, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
    char v3 = (char *)a1
       + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                + 48);
    int v4 = v3[16];
    if (v4 != 255)
    {
      int v5 = *(void **)v3;
      uint64_t v6 = *((void *)v3 + 1);
      outlined consume of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(v5, v6, v4);
    }
  }
  else
  {
    uint64_t v7 = *a1;
  }
}

void **initializeWithCopy for GridView.Base.ViewModel.ImageConfiguration(void **a1, void **a2, uint64_t a3)
{
  type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for Artwork();
    (*(void (**)(void **, void **, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                + 48);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    int v10 = v9[16];
    if (v10 == 255)
    {
      *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
      v8[16] = v9[16];
    }
    else
    {
      uint64_t v11 = *(void *)v9;
      uint64_t v12 = *((void *)v9 + 1);
      outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)v9, v12, v9[16]);
      *(void *)uint64_t v8 = v11;
      *((void *)v8 + 1) = v12;
      v8[16] = v10;
    }
  }
  else
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    id v14 = v13;
  }
  swift_storeEnumTagMultiPayload();
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void **assignWithCopy for GridView.Base.ViewModel.ImageConfiguration(void **a1, void **a2, uint64_t a3)
{
  if (a1 != a2)
  {
    outlined destroy of GridView.Base.ViewModel.ImageConfiguration.Image((uint64_t)a1);
    type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for Artwork();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                  + 48);
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      int v10 = v9[16];
      if (v10 == 255)
      {
        long long v15 = *(_OWORD *)v9;
        v8[16] = v9[16];
        *(_OWORD *)uint64_t v8 = v15;
      }
      else
      {
        uint64_t v11 = *(void *)v9;
        uint64_t v12 = *((void *)v9 + 1);
        outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)v9, v12, v9[16]);
        *(void *)uint64_t v8 = v11;
        *((void *)v8 + 1) = v12;
        v8[16] = v10;
      }
    }
    else
    {
      uint64_t v13 = *a2;
      *a1 = *a2;
      id v14 = v13;
    }
    swift_storeEnumTagMultiPayload();
  }
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

char *initializeWithTake for GridView.Base.ViewModel.ImageConfiguration(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for Artwork();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                + 48);
    uint64_t v9 = &a1[v8];
    int v10 = &a2[v8];
    *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
    v9[16] = v10[16];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  return a1;
}

char *assignWithTake for GridView.Base.ViewModel.ImageConfiguration(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    outlined destroy of GridView.Base.ViewModel.ImageConfiguration.Image((uint64_t)a1);
    uint64_t v6 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for Artwork();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                  + 48);
      uint64_t v9 = &a1[v8];
      int v10 = &a2[v8];
      *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
      v9[16] = v10[16];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  return a1;
}

uint64_t getEnumTagSinglePayload for GridView.Base.ViewModel.ImageConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_227AFBD68);
}

uint64_t sub_227AFBD68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    if (*(unsigned __int8 *)(a1 + *(int *)(a3 + 20)) <= 2u) {
      int v10 = 2;
    }
    else {
      int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    }
    unsigned int v11 = v10 - 2;
    if (*(unsigned __int8 *)(a1 + *(int *)(a3 + 20)) >= 2u) {
      return v11;
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for GridView.Base.ViewModel.ImageConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_227AFBE44);
}

uint64_t sub_227AFBE44(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 2;
  }
  return result;
}

uint64_t type metadata completion function for GridView.Base.ViewModel.ImageConfiguration()
{
  uint64_t result = type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for GridView.Base.ViewModel.ImageConfiguration.Image(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *(void *)a1 = *a2;
    a1 = &v13[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for Artwork();
      (*(void (**)(char *, char **, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                  + 48);
      uint64_t v8 = &a1[v7];
      uint64_t v9 = (char *)a2 + v7;
      int v10 = v9[16];
      if (v10 == 255)
      {
        *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
        v8[16] = v9[16];
      }
      else
      {
        uint64_t v11 = *(void *)v9;
        uint64_t v12 = *((void *)v9 + 1);
        outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)v9, v12, v9[16]);
        *(void *)uint64_t v8 = v11;
        *((void *)v8 + 1) = v12;
        v8[16] = v10;
      }
    }
    else
    {
      id v14 = *a2;
      *(void *)a1 = *a2;
      long long v15 = v14;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void destroy for GridView.Base.ViewModel.ImageConfiguration.Image(void **a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = type metadata accessor for Artwork();
    (*(void (**)(void **, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
    char v3 = (char *)a1
       + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                + 48);
    int v4 = v3[16];
    if (v4 != 255)
    {
      int v5 = *(void **)v3;
      uint64_t v6 = *((void *)v3 + 1);
      outlined consume of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(v5, v6, v4);
    }
  }
  else
  {
    uint64_t v7 = *a1;
  }
}

void **initializeWithCopy for GridView.Base.ViewModel.ImageConfiguration.Image(void **a1, void **a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = type metadata accessor for Artwork();
    (*(void (**)(void **, void **, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    uint64_t v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                + 48);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    int v8 = v7[16];
    if (v8 == 255)
    {
      *(_OWORD *)uint64_t v6 = *(_OWORD *)v7;
      v6[16] = v7[16];
    }
    else
    {
      uint64_t v9 = *(void *)v7;
      uint64_t v10 = *((void *)v7 + 1);
      outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)v7, v10, v7[16]);
      *(void *)uint64_t v6 = v9;
      *((void *)v6 + 1) = v10;
      v6[16] = v8;
    }
  }
  else
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    id v12 = v11;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void **assignWithCopy for GridView.Base.ViewModel.ImageConfiguration.Image(void **a1, void **a2)
{
  if (a1 != a2)
  {
    outlined destroy of GridView.Base.ViewModel.ImageConfiguration.Image((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = type metadata accessor for Artwork();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
      uint64_t v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                  + 48);
      uint64_t v6 = (char *)a1 + v5;
      uint64_t v7 = (char *)a2 + v5;
      int v8 = v7[16];
      if (v8 == 255)
      {
        long long v13 = *(_OWORD *)v7;
        v6[16] = v7[16];
        *(_OWORD *)uint64_t v6 = v13;
      }
      else
      {
        uint64_t v9 = *(void *)v7;
        uint64_t v10 = *((void *)v7 + 1);
        outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)v7, v10, v7[16]);
        *(void *)uint64_t v6 = v9;
        *((void *)v6 + 1) = v10;
        v6[16] = v8;
      }
    }
    else
    {
      uint64_t v11 = *a2;
      *a1 = *a2;
      id v12 = v11;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *initializeWithTake for GridView.Base.ViewModel.ImageConfiguration.Image(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for Artwork();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                + 48);
    int v8 = &a1[v7];
    uint64_t v9 = &a2[v7];
    *(_OWORD *)int v8 = *(_OWORD *)v9;
    v8[16] = v9[16];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

char *assignWithTake for GridView.Base.ViewModel.ImageConfiguration.Image(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    outlined destroy of GridView.Base.ViewModel.ImageConfiguration.Image((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for Artwork();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Artwork, GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder?))
                  + 48);
      int v8 = &a1[v7];
      uint64_t v9 = &a2[v7];
      *(_OWORD *)int v8 = *(_OWORD *)v9;
      v8[16] = v9[16];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for GridView.Base.ViewModel.ImageConfiguration.Image(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for GridView.Base.ViewModel.ImageConfiguration.Image(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t destructiveInjectEnumTag for GridView.Base.ViewModel.ImageConfiguration.Image()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t type metadata completion function for GridView.Base.ViewModel.ImageConfiguration.Image()
{
  v2[4] = MEMORY[0x263F8CF48] + 64;
  uint64_t result = type metadata accessor for Artwork();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v2[5] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void destroy for GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)a2, v4, v5);
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  outlined consume of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  outlined consume of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t destructiveInjectEnumTag for GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder()
{
  return &type metadata for GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GridView.Base.ViewModel.ImageConfiguration.Shape(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for GridView.Base.ViewModel.ImageConfiguration.Shape(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x227AFC9DCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for GridView.Base.ViewModel.ImageConfiguration.Shape(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for GridView.Base.ViewModel.ImageConfiguration.Shape(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for GridView.Base.ViewModel.ImageConfiguration.Shape()
{
  return &type metadata for GridView.Base.ViewModel.ImageConfiguration.Shape;
}

uint64_t dispatch thunk of GridView.Base.DataSource.viewModels.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of GridView.Base.DataSource.viewModels.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of GridView.Base.DataSource.viewModels.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t type metadata instantiation function for GridView.Base.BaseDataSource()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t type metadata completion function for GridView.Base.BaseDataSource()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for GridView.Base.BaseDataSource()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for GridView.Base.BaseDataSource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GridView.Base.BaseDataSource);
}

uint64_t dispatch thunk of GridView.Base.BaseDataSource.viewModels.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of GridView.Base.BaseDataSource.viewModels.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of GridView.Base.BaseDataSource.viewModels.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of GridView.Base.BaseDataSource.__allocating_init(viewModels:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of GridView.Base.BaseDataSource.numberOfViews()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of GridView.Base.BaseDataSource.model(atIndex:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of GridView.Base.BaseDataSource.view(atIndex:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of GridView.Base.Cell.init(viewModel:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t destroy for GridView.Base.Placeholder(uint64_t a1)
{
  outlined consume of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(void **)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  return swift_release();
}

uint64_t initializeWithCopy for GridView.Base.Placeholder(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  char v6 = *(unsigned char *)(a2 + 16);
  outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)a2, v5, v6);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for GridView.Base.Placeholder(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  char v6 = *(unsigned char *)(a2 + 16);
  outlined copy of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(*(id *)a2, v5, v6);
  BOOL v7 = *(void **)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  char v9 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v6;
  outlined consume of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(v7, v8, v9);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for GridView.Base.Placeholder(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void **)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v7 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v4;
  outlined consume of GridView.Base.ViewModel.ImageConfiguration.Image.Placeholder(v5, v6, v7);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for GridView.Base.Placeholder(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GridView.Base.Placeholder(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GridView.Base.Placeholder()
{
  return &type metadata for GridView.Base.Placeholder;
}

uint64_t associated type witness table accessor for View.Body : View in GridView.Base.Placeholder()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t lazy protocol witness table accessor for type _ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>> and conformance <> _ConditionalContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type _ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>> and conformance <> _ConditionalContent<A, B>;
  if (!lazy protocol witness table cache variable for type _ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>> and conformance <> _ConditionalContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>>);
    lazy protocol witness table accessor for type ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>> and conformance <> ModifiedContent<A, B>();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>> and conformance <> _ConditionalContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>> and conformance <> ModifiedContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>> and conformance <> ModifiedContent<A, B>;
  if (!lazy protocol witness table cache variable for type ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>> and conformance <> ModifiedContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>);
    lazy protocol witness table accessor for type _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>> and conformance _OverlayModifier<A>();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>> and conformance <> ModifiedContent<A, B>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>> and conformance _OverlayModifier<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>> and conformance _OverlayModifier<A>;
  if (!lazy protocol witness table cache variable for type _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>> and conformance _OverlayModifier<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>> and conformance _OverlayModifier<A>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Image? and conformance <A> A?()
{
  unint64_t result = lazy protocol witness table cache variable for type Image? and conformance <A> A?;
  if (!lazy protocol witness table cache variable for type Image? and conformance <A> A?)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Image?);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Image? and conformance <A> A?);
  }
  return result;
}

uint64_t outlined copy of _ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>>.Storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a11) {
    swift_retain();
  }
  return swift_retain();
}

uint64_t outlined consume of _ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>>.Storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t result = swift_release();
  if (a11)
  {
    return swift_release();
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

unint64_t lazy protocol witness table accessor for type Group<_ConditionalContent<_ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>>, Image?>> and conformance <A> Group<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type Group<_ConditionalContent<_ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>>, Image?>> and conformance <A> Group<A>;
  if (!lazy protocol witness table cache variable for type Group<_ConditionalContent<_ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>>, Image?>> and conformance <A> Group<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Group<_ConditionalContent<_ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>>, Image?>>);
    lazy protocol witness table accessor for type _ConditionalContent<_ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>>, Image?> and conformance <> _ConditionalContent<A, B>();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Group<_ConditionalContent<_ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>>, Image?>> and conformance <A> Group<A>);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type _ConditionalContent<_ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>>, Image?> and conformance <> _ConditionalContent<A, B>()
{
  unint64_t result = lazy protocol witness table cache variable for type _ConditionalContent<_ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>>, Image?> and conformance <> _ConditionalContent<A, B>;
  if (!lazy protocol witness table cache variable for type _ConditionalContent<_ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>>, Image?> and conformance <> _ConditionalContent<A, B>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&demangling cache variable for type metadata for _ConditionalContent<_ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>>, Image?>);
    lazy protocol witness table accessor for type _ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>> and conformance <> _ConditionalContent<A, B>();
    lazy protocol witness table accessor for type Image? and conformance <A> A?();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _ConditionalContent<_ConditionalContent<Image, ModifiedContent<Color, _OverlayModifier<ModifiedContent<ModifiedContent<Image, _PaddingLayout>, _ForegroundStyleModifier<HierarchicalShapeStyle>>>>>, Image?> and conformance <> _ConditionalContent<A, B>);
  }
  return result;
}

uint64_t ResourceBundleClass.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t ArtworkImage.artworkPlaceholder<A>(_:)()
{
  return MEMORY[0x270F877D0]();
}

uint64_t ArtworkImage.init(_:)()
{
  return MEMORY[0x270F87808]();
}

uint64_t type metadata accessor for ArtworkImage()
{
  return MEMORY[0x270F08290]();
}

uint64_t _HashTable.UnsafeHandle._startIterator(bucket:)()
{
  return MEMORY[0x270F18140]();
}

uint64_t _HashTable.UnsafeHandle.firstOccupiedBucketInChain(with:)()
{
  return MEMORY[0x270F18148]();
}

uint64_t _HashTable.UnsafeHandle.subscript.setter()
{
  return MEMORY[0x270F18150]();
}

uint64_t _HashTable.BucketIterator.currentValue.getter()
{
  return MEMORY[0x270F18158]();
}

uint64_t _HashTable.BucketIterator.currentValue.setter()
{
  return MEMORY[0x270F18160]();
}

Swift::Void __swiftcall _HashTable.BucketIterator.advance()()
{
}

uint64_t static _HashTable.maximumCapacity(forScale:)()
{
  return MEMORY[0x270F18170]();
}

uint64_t static _HashTable.minimumCapacity(forScale:)()
{
  return MEMORY[0x270F18178]();
}

uint64_t _HashTable.copy()()
{
  return MEMORY[0x270F18180]();
}

uint64_t static _HashTable.scale(forCapacity:)()
{
  return MEMORY[0x270F18188]();
}

uint64_t _HashTable.init(scale:reservedScale:)()
{
  return MEMORY[0x270F18190]();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t Animatable<>.animatableData.modify()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t EdgeInsets.init(_all:)()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t type metadata accessor for ColorScheme()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)()
{
  return MEMORY[0x270EFF128]();
}

uint64_t _UIHostingView.__allocating_init(rootView:)()
{
  return MEMORY[0x270EFFD80]();
}

uint64_t type metadata accessor for _UIHostingView()
{
  return MEMORY[0x270EFFDB0]();
}

uint64_t dispatch thunk of InsettableShape.inset(by:)()
{
  return MEMORY[0x270F00048]();
}

uint64_t type metadata accessor for RoundedRectangle._Inset()
{
  return MEMORY[0x270F00590]();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return MEMORY[0x270F00598]();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return MEMORY[0x270F00688]();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return MEMORY[0x270F008D0]();
}

uint64_t EnvironmentValues.colorScheme.setter()
{
  return MEMORY[0x270F008D8]();
}

uint64_t EnvironmentValues.isFocused.getter()
{
  return MEMORY[0x270F00E70]();
}

uint64_t EnvironmentValues.init()()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t EnvironmentValues.subscript.getter()
{
  return MEMORY[0x270F00F10]();
}

uint64_t EnvironmentValues.subscript.setter()
{
  return MEMORY[0x270F00F20]();
}

uint64_t static VerticalAlignment.center.getter()
{
  return MEMORY[0x270F01070]();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return MEMORY[0x270F01358]();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return MEMORY[0x270F01800]();
}

uint64_t static HierarchicalShapeStyle.secondary.getter()
{
  return MEMORY[0x270F01D38]();
}

uint64_t type metadata accessor for ButtonStyleConfiguration.Label()
{
  return MEMORY[0x270F020E8]();
}

uint64_t ButtonStyleConfiguration.label.getter()
{
  return MEMORY[0x270F020F0]();
}

uint64_t ButtonStyleConfiguration.isPressed.getter()
{
  return MEMORY[0x270F02100]();
}

uint64_t type metadata accessor for ButtonStyleConfiguration()
{
  return MEMORY[0x270F02118]();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return MEMORY[0x270F029E0]();
}

uint64_t static Edge.Set.all.getter()
{
  return MEMORY[0x270F02A30]();
}

uint64_t Text.foregroundStyle<A>(_:)()
{
  return MEMORY[0x270F03010]();
}

uint64_t Text.init<A>(_:)()
{
  return MEMORY[0x270F03250]();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return MEMORY[0x270F03448]();
}

uint64_t static View._viewListCount(inputs:)()
{
  return MEMORY[0x270F036C0]();
}

uint64_t Color.init(uiColor:)()
{
  return MEMORY[0x270F04378]();
}

uint64_t static Color.black.getter()
{
  return MEMORY[0x270F04460]();
}

uint64_t static Color.clear.getter()
{
  return MEMORY[0x270F04478]();
}

uint64_t Color.opacity(_:)()
{
  return MEMORY[0x270F044E8]();
}

uint64_t Image.init(uiImage:)()
{
  return MEMORY[0x270F04630]();
}

uint64_t Image.init(systemName:)()
{
  return MEMORY[0x270F04650]();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return MEMORY[0x270F04690]();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return MEMORY[0x270F04718]();
}

uint64_t Image.init(_:bundle:)()
{
  return MEMORY[0x270F04738]();
}

uint64_t dispatch thunk of Shape.path(in:)()
{
  return MEMORY[0x270F047B0]();
}

uint64_t Button.init(action:label:)()
{
  return MEMORY[0x270F048B0]();
}

uint64_t static Alignment.center.getter()
{
  return MEMORY[0x270F05078]();
}

uint64_t static Alignment.leading.getter()
{
  return MEMORY[0x270F05088]();
}

uint64_t static Animation.spring(response:dampingFraction:blendDuration:)()
{
  return MEMORY[0x270F05120]();
}

uint64_t static UnitPoint.center.getter()
{
  return MEMORY[0x270F053C8]();
}

uint64_t type metadata accessor for Artwork()
{
  return MEMORY[0x270EF6E78]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t static UIView.animate(_:changes:completion:)()
{
  return MEMORY[0x270F05428]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x270F9E8C0](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t dispatch thunk of Identifiable.id.getter()
{
  return MEMORY[0x270F9E9D0]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x270F306A0]();
}

uint64_t MPURectByApplyingUserInterfaceLayoutDirectionInRect()
{
  return MEMORY[0x270F494F8]();
}

uint64_t MRMediaRemoteSetWantsNowPlayingNotifications()
{
  return MEMORY[0x270F4A090]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F82BC8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t UIImageGetUnreadIndicator()
{
  return MEMORY[0x270F82DC0]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x270F82E90]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F82EB8]();
}

uint64_t _AXSCarPlayEnhanceTextLegibilityEnabled()
{
  return MEMORY[0x270F90658]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x270FA04B0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}