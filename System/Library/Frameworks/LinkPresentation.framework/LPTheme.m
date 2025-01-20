@interface LPTheme
+ (LPTheme)themeWithStyle:(int64_t)a3 icon:(id)a4 platform:(int64_t)a5 sizeClass:(unint64_t)a6 sizeClassParameters:(id)a7 hasButton:(BOOL)a8 preferredContentSizeCategory:(id)a9;
+ (double)badgeIconSizeInPoints;
+ (double)disabledButtonOpacity;
+ (double)largestIconSizeInPoints;
+ (double)placeholderIconSizeInPoints;
+ (id)defaultBackgroundColorForPlatform:(int64_t)a3;
+ (id)iconPlatterCornerRadius;
+ (id)iconPlatterPaddingForReason:(int64_t)a3;
+ (id)primaryLabelColor;
+ (id)regularTheme;
+ (id)secondaryLabelColor;
+ (int64_t)platformForView:(id)a3;
+ (void)addClient:(id)a3;
+ (void)invalidateThemeCache;
+ (void)removeClient:(id)a3;
- (LPAppearanceDependentValue)highlightCompositingFilter;
- (LPCaptionBarStyle)captionBar;
- (LPCaptionBarStyle)mediaBottomCaptionBar;
- (LPCaptionBarStyle)mediaTopCaptionBar;
- (LPContactsBadgeStyle)contactsBadgeStyle;
- (LPImageViewStyle)backgroundImage;
- (LPImageViewStyle)mediaImage;
- (LPImageViewStyle)placeholderImage;
- (LPIndeterminateProgressSpinnerStyle)progressSpinner;
- (LPPointUnit)cornerRadius;
- (LPPointUnit)maximumWidth;
- (LPQuotedTextViewStyle)quotedText;
- (LPTapToLoadViewStyle)tapToLoad;
- (LPTheme)initWithStyle:(int64_t)a3 icon:(id)a4 platform:(int64_t)a5 sizeClass:(unint64_t)a6 sizeClassParameters:(id)a7 hasButton:(BOOL)a8 preferredContentSizeCategory:(id)a9;
- (LPVisualMediaViewStyle)mediaVideo;
- (UIColor)backgroundColor;
- (UIColor)highlightColor;
- (UIColor)mediaBackgroundColor;
- (UIFont)domainNameIndicatorFont;
- (UIFont)domainNameIndicatorIconFont;
- (double)widthFractionForTallMedia;
- (id)CSSTextForProperty:(id)a3 withValue:(id)a4;
- (id)CSSTextForThemeProperty:(id)a3;
- (id)valueForThemeProperty:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (int64_t)backgroundMaterial;
- (void)_adjustForAppleMusicCollaborativePlaylistStyle;
- (void)_adjustForEnrichedBusinessChatStyle;
- (void)_adjustForStyleWithFullWidthBottomButton;
- (void)adjustForStyle;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundMaterial:(int64_t)a3;
- (void)setCornerRadius:(id)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlightCompositingFilter:(id)a3;
- (void)setMaximumWidth:(id)a3;
- (void)setMediaBackgroundColor:(id)a3;
- (void)setWidthFractionForTallMedia:(double)a3;
@end

@implementation LPTheme

+ (id)regularTheme
{
  return (id)[a1 themeWithStyle:0 icon:0 platform:0 sizeClass:0 sizeClassParameters:0 hasButton:0 preferredContentSizeCategory:*MEMORY[0x1E4FB27D0]];
}

+ (double)badgeIconSizeInPoints
{
  return 16.0;
}

+ (double)largestIconSizeInPoints
{
  return 40.0;
}

+ (double)placeholderIconSizeInPoints
{
  return 50.0;
}

+ (double)disabledButtonOpacity
{
  return 0.4;
}

+ (id)primaryLabelColor
{
  return (id)[MEMORY[0x1E4FB1618] labelColor];
}

+ (id)secondaryLabelColor
{
  return (id)[MEMORY[0x1E4FB1618] secondaryLabelColor];
}

+ (LPTheme)themeWithStyle:(int64_t)a3 icon:(id)a4 platform:(int64_t)a5 sizeClass:(unint64_t)a6 sizeClassParameters:(id)a7 hasButton:(BOOL)a8 preferredContentSizeCategory:(id)a9
{
  BOOL v29 = a8;
  id v13 = a4;
  id v28 = a7;
  id v27 = a9;
  v14 = themeCache();
  id v15 = v13;
  id v16 = v28;
  id v17 = v27;
  v18 = NSString;
  unsigned int v19 = [v15 _isFallbackIcon];
  v20 = [v16 _cacheKey];
  v21 = [v18 stringWithFormat:@"%ld-%d-%ld-%ld-%@-%d-%@", a3, v19, a5, a6, v20, v29, v17];

  v22 = [v14 objectForKey:v21];
  if (!v22)
  {
    if ((unint64_t)[v14 count] >= 4)
    {
      v23 = [v14 allKeys];
      v24 = [v23 firstObject];
      [v14 removeObjectForKey:v24];
    }
    v22 = [[LPTheme alloc] initWithStyle:a3 icon:v15 platform:a5 sizeClass:a6 sizeClassParameters:v16 hasButton:v29 preferredContentSizeCategory:v17];
    [v14 setObject:v22 forKey:v21];
  }
  v25 = v22;

  return v25;
}

- (LPTheme)initWithStyle:(int64_t)a3 icon:(id)a4 platform:(int64_t)a5 sizeClass:(unint64_t)a6 sizeClassParameters:(id)a7 hasButton:(BOOL)a8 preferredContentSizeCategory:(id)a9
{
  v109[1] = *MEMORY[0x1E4F143B8];
  id v98 = a4;
  id v15 = a7;
  id v99 = a9;
  v104.receiver = self;
  v104.super_class = (Class)LPTheme;
  id v16 = [(LPTheme *)&v104 init];
  id v17 = v16;
  if (!v16) {
    goto LABEL_26;
  }
  v16->_style = a3;
  v16->_uint64_t sizeClass = a6;
  objc_storeStrong((id *)&v16->_sizeClassParameters, a7);
  v17->_platform = a5;
  v17->_isFallbackIcon = [v98 _isFallbackIcon];
  v17->_hasButton = a8;
  uint64_t v18 = [v99 copy];
  preferredContentSizeCategory = v17->_preferredContentSizeCategory;
  v17->_preferredContentSizeCategory = (NSString *)v18;

  uint64_t sizeClass = v17->_sizeClass;
  v21 = v17->_preferredContentSizeCategory;
  v22 = maximumContentSizeCategory(sizeClass);
  if (UIContentSizeCategoryCompareToCategory(v21, (UIContentSizeCategory)v22) == NSOrderedDescending)
  {
    v23 = v22;

    v21 = v23;
  }
  v24 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyle();
  v25 = CTFontCreateWithFontDescriptorAndOptions(v24, 0.0, 0, 0);
  CFRelease(v24);
  v26 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyle();
  id v27 = CTFontCreateWithFontDescriptorAndOptions(v26, 0.0, 0, 0);
  CFRelease(v26);
  double Size = CTFontGetSize(v25);
  double v29 = CTFontGetSize(v27);
  CFRelease(v25);
  CFRelease(v27);

  v17->_leadingScalingFactor = Size / v29;
  if (a5 == 6)
  {
    v30 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] compatibleWithTraitCollection:0];
    [v30 pointSize];
    v17->_leadingScalingFactor = v31 / 17.0 * v17->_leadingScalingFactor;
  }
  uint64_t v32 = objc_msgSend(MEMORY[0x1E4FB1618], "_lp_colorWithDynamicProvider:", &__block_literal_global_17);
  highlightColor = v17->_highlightColor;
  v17->_highlightColor = (UIColor *)v32;

  v34 = [[LPAppearanceDependentValue alloc] initWithProvider:&__block_literal_global_1040];
  highlightCompositingFilter = v17->_highlightCompositingFilter;
  v17->_highlightCompositingFilter = v34;

  v36 = self;
  v105 = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v105 count:1];
  [(LPAppearanceDependentValue *)v17->_highlightCompositingFilter setDependentTraits:v37];

  v38 = [[LPCaptionBarStyle alloc] initWithPlatform:a5 sizeClass:a6 sizeClassParameters:v15 fontScalingFactor:v17->_leadingScalingFactor];
  captionBar = v17->_captionBar;
  v17->_captionBar = v38;

  v40 = [[LPCollaborationFooterStyle alloc] initWithPlatform:a5 sizeClass:a6 fontScalingFactor:v17->_leadingScalingFactor];
  [(LPCaptionBarStyle *)v17->_captionBar setCollaborationFooter:v40];

  v41 = [[LPQuotedTextViewStyle alloc] initWithPlatform:a5 sizeClass:a6 fontScalingFactor:v17->_leadingScalingFactor];
  quotedText = v17->_quotedText;
  v17->_quotedText = v41;

  uint64_t v43 = defaultBackgroundColor(a5);
  backgroundColor = v17->_backgroundColor;
  v17->_backgroundColor = (UIColor *)v43;

  uint64_t v45 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_1252];
  mediaBackgroundColor = v17->_mediaBackgroundColor;
  v17->_mediaBackgroundColor = (UIColor *)v45;

  if ((unint64_t)a5 > 6) {
    uint64_t v47 = 6;
  }
  else {
    uint64_t v47 = qword_1A3711BB8[a5];
  }
  v17->_backgroundMaterial = v47;
  v48 = [[LPPointUnit alloc] initWithValue:350.0];
  maximumWidth = v17->_maximumWidth;
  v17->_maximumWidth = v48;

  v17->_widthFractionForTallMedia = 0.76;
  v50 = objc_alloc_init(LPImageViewStyle);
  mediaImage = v17->_mediaImage;
  v17->_mediaImage = v50;

  [(LPImageViewStyle *)v17->_mediaImage setScalingMode:2];
  [(LPImageViewStyle *)v17->_mediaImage setFilter:2];
  double v52 = 0.03;
  if (a5 == 2) {
    double v52 = 0.0;
  }
  [(LPImageViewStyle *)v17->_mediaImage setDarkeningAmount:v52];
  v53 = [[LPVisualMediaViewStyle alloc] initWithPlatform:a5];
  mediaVideo = v17->_mediaVideo;
  v17->_mediaVideo = v53;

  v97 = [MEMORY[0x1E4FB1618] whiteColor];
  v55 = [[LPCaptionBarStyle alloc] initWithPlatform:a5 sizeClass:a6 sizeClassParameters:v15 fontScalingFactor:v17->_leadingScalingFactor];
  mediaTopCaptionBar = v17->_mediaTopCaptionBar;
  v17->_mediaTopCaptionBar = v55;

  v57 = [(LPCaptionBarStyle *)v17->_mediaTopCaptionBar textStack];
  v102[0] = MEMORY[0x1E4F143A8];
  v102[1] = 3221225472;
  v102[2] = __108__LPTheme_initWithStyle_icon_platform_sizeClass_sizeClassParameters_hasButton_preferredContentSizeCategory___block_invoke_3;
  v102[3] = &unk_1E5B06400;
  id v58 = v97;
  id v103 = v58;
  [v57 applyToAllTextViewStyles:v102];

  v59 = [[LPCaptionBarStyle alloc] initWithPlatform:a5 sizeClass:a6 sizeClassParameters:v15 fontScalingFactor:v17->_leadingScalingFactor];
  mediaBottomCaptionBar = v17->_mediaBottomCaptionBar;
  v17->_mediaBottomCaptionBar = v59;

  v61 = [(LPCaptionBarStyle *)v17->_mediaBottomCaptionBar textStack];
  v100[0] = MEMORY[0x1E4F143A8];
  v100[1] = 3221225472;
  v100[2] = __108__LPTheme_initWithStyle_icon_platform_sizeClass_sizeClassParameters_hasButton_preferredContentSizeCategory___block_invoke_4;
  v100[3] = &unk_1E5B06400;
  id v62 = v58;
  id v101 = v62;
  [v61 applyToAllTextViewStyles:v100];

  v63 = objc_alloc_init(LPImageViewStyle);
  placeholderImage = v17->_placeholderImage;
  v17->_placeholderImage = v63;

  v65 = -[LPSize initWithSize:]([LPSize alloc], "initWithSize:", 320.0, 180.0);
  [(LPImageViewStyle *)v17->_placeholderImage setFixedSize:v65];

  +[LPTheme placeholderIconSizeInPoints];
  v67 = [[LPPointUnit alloc] initWithValue:v66];
  [(LPImageViewStyle *)v17->_placeholderImage setFixedFallbackImageSize:v67];

  [(LPImageViewStyle *)v17->_placeholderImage setFixedFallbackImageWeight:&unk_1EF712768];
  [(LPImageViewStyle *)v17->_placeholderImage setScalingMode:3];
  v68 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
  [(LPImageViewStyle *)v17->_placeholderImage setMaskColor:v68];

  if (+[LPTestingOverrides forceMonospaceFonts])
  {
    uint64_t v69 = [MEMORY[0x1E4FB1798] monospacedSystemFontOfSize:12.0 weight:*MEMORY[0x1E4FB29A8]];
  }
  else
  {
    uint64_t v108 = *MEMORY[0x1E4FB2880];
    uint64_t v106 = *MEMORY[0x1E4FB29E0];
    v70 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB29D0]];
    v107 = v70;
    v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v107 forKeys:&v106 count:1];
    v109[0] = v71;
    v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v109 forKeys:&v108 count:1];
    uint64_t v69 = fontWithTraitsAndAttributes((void *)*MEMORY[0x1E4FB28D8], 0, v72, a6);
  }
  domainNameIndicatorFont = v17->_domainNameIndicatorFont;
  v17->_domainNameIndicatorFont = (UIFont *)v69;

  uint64_t v74 = objc_msgSend(MEMORY[0x1E4FB1798], "systemFontOfSize:weight:", fmax(v17->_leadingScalingFactor, 1.0) * 17.0, *MEMORY[0x1E4FB29C8]);
  domainNameIndicatorIconFont = v17->_domainNameIndicatorIconFont;
  v17->_domainNameIndicatorIconFont = (UIFont *)v74;

  v76 = objc_alloc_init(LPImageViewStyle);
  backgroundImage = v17->_backgroundImage;
  v17->_backgroundImage = v76;

  [(LPImageViewStyle *)v17->_backgroundImage setScalingMode:2];
  v78 = [[LPContactsBadgeStyle alloc] initWithPlatform:a5];
  contactsBadgeStyle = v17->_contactsBadgeStyle;
  v17->_contactsBadgeStyle = v78;

  v80 = [[LPIndeterminateProgressSpinnerStyle alloc] initWithPlatform:a5 sizeClass:a6 fontScalingFactor:v17->_leadingScalingFactor];
  progressSpinner = v17->_progressSpinner;
  v17->_progressSpinner = v80;

  if ((unint64_t)a5 < 5) {
    goto LABEL_15;
  }
  if (a5 == 5)
  {
    if (a6 == 1)
    {
      v83 = (void *)defaultCornerRadius_tinyVisionSize;
      if (defaultCornerRadius_tinyVisionSize) {
        goto LABEL_18;
      }
      v84 = [[LPPointUnit alloc] initWithValue:12.0];
      v85 = &defaultCornerRadius_tinyVisionSize;
    }
    else
    {
      v83 = (void *)defaultCornerRadius_visionSize;
      if (defaultCornerRadius_visionSize) {
        goto LABEL_18;
      }
      v84 = [[LPPointUnit alloc] initWithValue:22.0];
      v85 = &defaultCornerRadius_visionSize;
    }
    goto LABEL_17;
  }
  if (a5 == 6)
  {
LABEL_15:
    v83 = (void *)defaultCornerRadius_normalSize;
    if (defaultCornerRadius_normalSize)
    {
LABEL_18:
      v82 = v83;
      goto LABEL_19;
    }
    v84 = [[LPPointUnit alloc] initWithValue:10.0];
    v85 = &defaultCornerRadius_normalSize;
LABEL_17:
    v86 = (void *)*v85;
    uint64_t *v85 = (uint64_t)v84;

    v83 = (void *)*v85;
    goto LABEL_18;
  }
LABEL_19:
  cornerRadius = v17->_cornerRadius;
  v17->_cornerRadius = v82;

  [(LPTheme *)v17 adjustForStyle];
  v88 = [(LPCaptionBarStyle *)v17->_captionBar textStack];
  v89 = [v88 captionTextPadding];

  if (v89 && [v15 alignTextAndMediaHorizontalEdges])
  {
    v90 = +[LPPointUnit zero];
    [v89 setLeading:v90];

    v91 = +[LPPointUnit zero];
    [v89 setTrailing:v91];
  }
  v92 = [(LPTextViewStyle *)v17->_quotedText padding];
  if (v92 && [v15 alignTextAndMediaHorizontalEdges])
  {
    v93 = +[LPPointUnit zero];
    [v92 setLeading:v93];

    v94 = +[LPPointUnit zero];
    [v92 setTrailing:v94];
  }
  v95 = v17;

LABEL_26:
  return v17;
}

id __108__LPTheme_initWithStyle_icon_platform_sizeClass_sizeClassParameters_hasButton_preferredContentSizeCategory___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", (double)objc_msgSend(v2, "_lp_prefersDarkInterface"), 0.1);

  return v3;
}

id __108__LPTheme_initWithStyle_icon_platform_sizeClass_sizeClassParameters_hasButton_preferredContentSizeCategory___block_invoke_2(uint64_t a1, void *a2)
{
  int v2 = objc_msgSend(a2, "_lp_prefersDarkInterface");
  v3 = (void **)MEMORY[0x1E4F3A2E8];
  if (!v2) {
    v3 = (void **)MEMORY[0x1E4F3A2E0];
  }
  v4 = *v3;

  return v4;
}

void __108__LPTheme_initWithStyle_icon_platform_sizeClass_sizeClassParameters_hasButton_preferredContentSizeCategory___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setColor:*(void *)(a1 + 32)];
  [v3 setMaximumLines:1];
}

void __108__LPTheme_initWithStyle_icon_platform_sizeClass_sizeClassParameters_hasButton_preferredContentSizeCategory___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setColor:*(void *)(a1 + 32)];
  [v3 setMaximumLines:1];
}

- (void)_adjustForStyleWithFullWidthBottomButton
{
  id v15 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
  id v3 = [(LPCaptionBarStyle *)self->_captionBar button];
  [v3 setMenuBackgroundColor:v15];

  id v16 = [MEMORY[0x1E4FB1618] labelColor];
  v4 = [(LPCaptionBarStyle *)self->_captionBar button];
  [v4 setForegroundColor:v16];

  fontWithTraits((void *)*MEMORY[0x1E4FB28D8], 2, self->_sizeClass);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [(LPCaptionBarStyle *)self->_captionBar button];
  [v5 setMenuFont:v17];

  id v18 = [(LPCaptionBarStyle *)self->_captionBar button];
  [v18 setPrefersBehavioralStylePad:1];

  [(LPCaptionBarStyle *)self->_captionBar setUsesOutOfLineButton:1];
  [(LPCaptionBarStyle *)self->_captionBar setButtonIgnoresTextSafeAreaInsets:1];
  [(LPCaptionBarStyle *)self->_captionBar setAddFullWidthLineForButton:1];
  outerHorizontalTextMargin(self->_platform);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [(LPCaptionBarStyle *)self->_captionBar button];
  v7 = [v6 margin];
  [v7 setLeading:v19];

  v8 = [(LPCaptionBarStyle *)self->_captionBar button];
  v9 = [v8 margin];
  [v9 setTrailing:v19];

  v10 = [(LPCaptionBarStyle *)self->_captionBar button];
  v11 = [v10 margin];
  [v11 setBottom:v19];

  v12 = +[LPPointUnit zero];
  id v13 = [(LPCaptionBarStyle *)self->_captionBar button];
  v14 = [v13 margin];
  [v14 setTop:v12];
}

- (void)_adjustForEnrichedBusinessChatStyle
{
  [(LPTheme *)self _adjustForStyleWithFullWidthBottomButton];
  id v3 = [(LPCaptionBarStyle *)self->_captionBar button];
  [v3 setBehavior:1];
}

- (void)_adjustForAppleMusicCollaborativePlaylistStyle
{
  [(LPTheme *)self _adjustForStyleWithFullWidthBottomButton];
  id v29 = [MEMORY[0x1E4FB1618] labelColor];
  id v3 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
  v4 = [v3 options];
  [v4 setColor:v29];

  id v30 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v5 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
  v6 = [v5 handle];
  [v6 setColor:v30];

  id v31 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
  [v31 setUseFullWidth:1];

  id v32 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
  [v32 setUseSafeAreaInsetWithPadding:1];

  outerHorizontalTextMargin(self->_platform);
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  v7 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
  v8 = [v7 margin];
  [v8 setLeading:v33];

  v9 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
  v10 = [v9 margin];
  [v10 setTrailing:v33];

  v11 = +[LPPointUnit zero];
  v12 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
  id v13 = [v12 margin];
  [v13 setTop:v11];

  v14 = +[LPPointUnit zero];
  id v15 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
  id v16 = [v15 margin];
  [v16 setBottom:v14];

  id v17 = +[LPPointUnit zero];
  id v18 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
  id v19 = [v18 padding];
  [v19 setTop:v17];

  v20 = [[LPPointUnit alloc] initWithValue:10.0];
  v21 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
  v22 = [v21 padding];
  [v22 setBottom:v20];

  v23 = [[LPPointUnit alloc] initWithValue:4.0];
  v24 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
  v25 = [v24 separatorMargin];
  [v25 setBottom:v23];

  v26 = +[LPPointUnit zero];
  id v27 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
  id v28 = [v27 separatorMargin];
  [v28 setTop:v26];
}

- (void)adjustForStyle
{
  v1122[1] = *MEMORY[0x1E4F143B8];
  v4 = (LPPointUnit *)sizeClassAllowsMedia(self->_sizeClass);
  p_quotedText = (LPSize *)v4;
  unint64_t sizeClass = self->_sizeClass;
  switch(sizeClass)
  {
    case 1uLL:
      if (![(LPLinkRendererSizeClassParameters *)self->_sizeClassParameters needsSpaceAffordanceForDeleteButton])
      {
        v7 = +[LPPointUnit zero];
        [(LPCaptionBarStyle *)self->_captionBar setMinimumWidth:v7];
      }
      unint64_t platform = self->_platform;
      BOOL v9 = platform > 6;
      uint64_t v10 = (1 << platform) & 0x75;
      if (v9 || v10 == 0)
      {
        v12 = &tinyIconSize_macSize;
        id v13 = (void *)tinyIconSize_macSize;
        if (tinyIconSize_macSize) {
          goto LABEL_142;
        }
        double v14 = 16.0;
      }
      else
      {
        v12 = &tinyIconSize_iOSSize;
        id v13 = (void *)tinyIconSize_iOSSize;
        if (tinyIconSize_iOSSize)
        {
LABEL_142:
          id v475 = v13;
          v476 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          [v476 setFixedFallbackImageSize:v475];

          v477 = [LPSize alloc];
          v478 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          v479 = [v478 fixedFallbackImageSize];
          v480 = [(LPSize *)v477 initWithSquarePoints:v479];
          v481 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          [v481 setFixedSize:v480];

          v482 = [[LPPointUnit alloc] initWithValue:6.0];
          v483 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          v484 = [v483 margin];
          [v484 setLeading:v482];

          v485 = +[LPPointUnit zero];
          v486 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          v487 = [v486 margin];
          [v487 setTrailing:v485];

          v488 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          v489 = [v488 margin];
          [v489 setTop:v482];

          v490 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          v491 = [v490 margin];
          [v491 setBottom:v482];

          v492 = [[LPPointUnit alloc] initWithValue:5.0];
          v493 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          [v493 setCornerRadius:v492];

          if (self->_isFallbackIcon)
          {
            v494 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
            [v494 setFilter:11];

            v495 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
            v496 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
            [v496 setMaskColor:v495];

            v497 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
            [v497 setScalingMode:3];

            v498 = [[LPPointUnit alloc] initWithValue:-3.0];
            v499 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
            v500 = [v499 padding];
            [v500 setTop:v498];

            v501 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
            v502 = [v501 padding];
            [v502 setLeading:v498];

            v503 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
            v504 = [v503 padding];
            [v504 setBottom:v498];

            v505 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
            v506 = [v505 padding];
            [v506 setTrailing:v498];
          }
          v507 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          v508 = [v507 captionTextPadding];
          [v508 setLeading:v482];

          v509 = [[LPPointUnit alloc] initWithValue:8.0];
          v510 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          v511 = [v510 captionTextPadding];
          [v511 setTrailing:v509];

          v512 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          v1118[0] = MEMORY[0x1E4F143A8];
          v1118[1] = 3221225472;
          v1118[2] = __25__LPTheme_adjustForStyle__block_invoke;
          v1118[3] = &unk_1E5B06400;
          v1118[4] = self;
          [v512 applyToAllTextViewStyles:v1118];

          v513 = +[LPPointUnit zero];
          v514 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          [v514 setFirstLineLeading:v513];

          v515 = +[LPPointUnit zero];
          v516 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          [v516 setLastLineDescent:v515];

          v517 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          [v517 setShouldAlignToBaselines:0];

          int64_t style = self->_style;
          if (style == 12)
          {
            v519 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
            [v519 setFilter:5];

            int64_t style = self->_style;
          }
          if (style == 18)
          {
            v520 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
            [v520 setFilter:6];
          }
          return;
        }
        double v14 = 24.0;
      }
      id v15 = [[LPPointUnit alloc] initWithValue:v14];
      id v16 = (void *)*v12;
      uint64_t *v12 = (uint64_t)v15;

      id v13 = (void *)*v12;
      goto LABEL_142;
    case 2uLL:
      if ([(LPLinkRendererSizeClassParameters *)self->_sizeClassParameters disableTextWrapping]
        || self->_platform != 2
        && UIContentSizeCategoryCompareToCategory(self->_preferredContentSizeCategory, (UIContentSizeCategory)*MEMORY[0x1E4FB27B8]) == NSOrderedAscending)
      {
        int v17 = 0;
        BOOL v18 = self->_platform == 1;
      }
      else
      {
        int v17 = 1;
        BOOL v18 = 1;
      }
      v107 = [MEMORY[0x1E4FB1618] clearColor];
      backgroundColor = self->_backgroundColor;
      self->_backgroundColor = v107;

      v109 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      v110 = [v109 topCaption];
      v1116[0] = MEMORY[0x1E4F143A8];
      v1116[1] = 3221225472;
      v1116[2] = __25__LPTheme_adjustForStyle__block_invoke_2;
      v1116[3] = &__block_descriptor_33_e25_v16__0__LPTextViewStyle_8l;
      BOOL v1117 = v18;
      [v110 applyToAllTextViewStyles:v1116];

      v111 = +[LPPointUnit zero];
      v112 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      [v112 setFirstLineLeading:v111];

      v113 = +[LPPointUnit zero];
      v114 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      [v114 setLastLineDescent:v113];

      if (v18) {
        unsigned int v115 = 3;
      }
      else {
        unsigned int v115 = 2;
      }
      if (v17) {
        uint64_t v116 = 4;
      }
      else {
        uint64_t v116 = v115;
      }
      v117 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      [v117 setMaximumNumberOfLines:v116];

      unint64_t v118 = self->_platform;
      if (v118 > 6) {
        goto LABEL_151;
      }
      if (((1 << v118) & 0x59) != 0)
      {
        v119 = [[LPPointUnit alloc] initWithValue:17.0];
        v120 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v121 = [v120 captionTextPadding];
        [v121 setTop:v119];

        v122 = [[LPPointUnit alloc] initWithValue:18.0];
        v123 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v124 = [v123 captionTextPadding];
        [v124 setBottom:v122];
      }
      else if (v118 == 2)
      {
        v521 = pt(3.0);
        v522 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v523 = [v522 captionTextPadding];
        [v523 setTop:v521];

        pt(4.0);
        v122 = (LPPointUnit *)objc_claimAutoreleasedReturnValue();
        v123 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v124 = [v123 captionTextPadding];
        [v124 setBottom:v122];
      }
      else
      {
        if (v118 != 5) {
          goto LABEL_151;
        }
        v125 = [[LPPointUnit alloc] initWithValue:22.0];
        v126 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v127 = [v126 captionTextPadding];
        [v127 setTop:v125];

        v122 = [[LPPointUnit alloc] initWithValue:22.0];
        v123 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v124 = [v123 captionTextPadding];
        [v124 setBottom:v122];
      }

LABEL_151:
      v524 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      v525 = [v524 bottomCaption];
      v1114[0] = MEMORY[0x1E4F143A8];
      v1114[1] = 3221225472;
      v1114[2] = __25__LPTheme_adjustForStyle__block_invoke_3;
      v1114[3] = &__block_descriptor_33_e25_v16__0__LPTextViewStyle_8l;
      char v1115 = v17;
      [v525 applyToAllTextViewStyles:v1114];

      if (self->_platform == 2)
      {
        v527 = cardHeadingIconSize(2uLL, v526);
        v528 = [LPSize alloc];
        v529 = [v527 height];
        [v529 value];
        v531 = -[LPSize initWithSize:](v528, "initWithSize:", 0.0, v530);
        v532 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v532 setMinimumSize:v531];

        v533 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v533 setFixedSize:v527];
      }
      else
      {
        v534 = [[LPSize alloc] initWithSquareSize:28.0];
        v535 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v535 setMinimumSize:v534];

        v537 = cardHeadingIconSize(self->_platform, v536);
        v538 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v538 setFixedSize:v537];

        v527 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v527 setRequireFixedSize:1];
      }

      int v539 = stylePrefersSmallerCornerRadiusInCardHeading(self->_style);
      v540 = [LPPointUnit alloc];
      double v541 = 4.0;
      if (v539) {
        double v541 = 3.0;
      }
      v542 = [(LPPointUnit *)v540 initWithValue:v541];
      v543 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
      [v543 setCornerRadius:v542];

      if (self->_platform != 5)
      {
        v544 = +[LPShadowStyle cardHeadingIconShadow];
        v545 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v545 setShadow:v544];
      }
      v546 = [[LPPointUnit alloc] initWithValue:17.0];
      v547 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
      [v547 setFixedFallbackImageSize:v546];

      if ([(LPLinkRendererSizeClassParameters *)self->_sizeClassParameters onlyShowIcon])
      {
        v548 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v548 setRequireFixedSize:0];

        v549 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v549 setScalesToFitParent:1];
      }
      v550 = +[LPPointUnit zero];
      v551 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
      v552 = [v551 margin];
      [v552 setLeading:v550];

      v553 = cardHeadingVerticalIconMargin((void *)self->_platform, self->_sizeClassParameters);
      v554 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
      v555 = [v554 margin];
      [v555 setTop:v553];

      v556 = cardHeadingVerticalIconMargin((void *)self->_platform, self->_sizeClassParameters);
      v557 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
      v558 = [v557 margin];
      [v558 setBottom:v556];

      v559 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
      [v559 setFilter:13];

      applyCommonCardHeadingCaptionBarProperties(self->_captionBar, self->_platform, self->_style, self->_sizeClass, self->_isFallbackIcon);
      v560 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
      [v560 setShowSeparator:0];

      int64_t v561 = self->_platform;
      if (v561 == 5)
      {
        v562 = +[LPPointUnit zero];
        v563 = [(LPCaptionBarStyle *)self->_captionBar button];
        v564 = [v563 margin];
        [v564 setBottom:v562];

        v565 = +[LPPointUnit zero];
        v566 = [(LPCaptionBarStyle *)self->_captionBar button];
        v567 = [v566 margin];
        [v567 setTop:v565];

        v568 = +[LPPointUnit zero];
        v569 = [(LPCaptionBarStyle *)self->_captionBar button];
        v570 = [v569 margin];
        [v570 setTrailing:v568];

        v571 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
        [v571 setIgnoreSafeAreaInset:1];

        int64_t v561 = self->_platform;
      }
      if (v561 == 1)
      {
        if (self->_hasButton)
        {
          v572 = +[LPPointUnit zero];
          v573 = [(LPCaptionBarStyle *)self->_captionBar button];
          v574 = [v573 margin];
          [v574 setLeading:v572];

          v575 = +[LPPointUnit zero];
          v576 = [(LPCaptionBarStyle *)self->_captionBar button];
          v577 = [v576 margin];
          [v577 setBottom:v575];

          v578 = [[LPPointUnit alloc] initWithValue:12.0];
          v579 = [(LPCaptionBarStyle *)self->_captionBar button];
          v580 = [v579 margin];
          [v580 setTop:v578];

          v581 = +[LPPointUnit zero];
          v582 = [(LPCaptionBarStyle *)self->_captionBar button];
          v583 = [v582 margin];
          [v583 setTrailing:v581];

          [(LPCaptionBarStyle *)self->_captionBar setUsesOutOfLineButton:1];
          [(LPCaptionBarStyle *)self->_captionBar setAddFullWidthLineForButton:1];
          [(LPCaptionBarStyle *)self->_captionBar setButtonIgnoresTextSafeAreaInsets:1];
          v584 = [[LPPointUnit alloc] initWithValue:4.0];
        }
        else
        {
          v584 = [[LPPointUnit alloc] initWithValue:12.0];
        }
        v585 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
        v586 = [v585 margin];
        [v586 setTop:v584];

        v587 = +[LPPointUnit zero];
        v588 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
        v589 = [v588 margin];
        [v589 setBottom:v587];

        v591 = [[LPPointUnit alloc] initWithValue:2.0];
        v592 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
        v593 = [v592 padding];
        [v593 setTop:v591];

        v594 = [[LPPointUnit alloc] initWithValue:0.5];
        v595 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
        v596 = [v595 padding];
        [v596 setBottom:v594];

        v597 = [[LPPointUnit alloc] initWithValue:6.0];
        v598 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
        v599 = [v598 padding];
        [v599 setLeading:v597];

        v600 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
        v601 = [v600 padding];
        v602 = [v601 leading];
        v603 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
        v604 = [v603 padding];
        [v604 setTrailing:v602];

        v605 = [[LPPointUnit alloc] initWithValue:5.0];
        v606 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
        [v606 setCornerRadius:v605];
      }
      else
      {
        v590 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
        [v590 setUseFullWidth:0];
      }
      return;
    case 6uLL:
      id v19 = [MEMORY[0x1E4FB1618] clearColor];
      v20 = self->_backgroundColor;
      self->_backgroundColor = v19;

      v21 = [[LPSize alloc] initWithSquareSize:26.0];
      v22 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
      [v22 setFixedSize:v21];

      v23 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
      [v23 setOpacity:0.5];

      v24 = [[LPPointUnit alloc] initWithValue:8.0];
      v25 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
      [v25 setCornerRadius:v24];

      v26 = [[LPPointUnit alloc] initWithValue:6.0];
      id v27 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
      id v28 = [v27 margin];
      [v28 setTop:v26];

      id v29 = [[LPPointUnit alloc] initWithValue:6.0];
      id v30 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
      id v31 = [v30 margin];
      [v31 setLeading:v29];

      id v32 = [[LPPointUnit alloc] initWithValue:6.0];
      id v33 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      v34 = [v33 captionTextPadding];
      [v34 setLeading:v32];

      v35 = [[LPPointUnit alloc] initWithValue:14.0];
      v36 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      v37 = [v36 captionTextPadding];
      [v37 setTrailing:v35];

      v38 = [[LPPointUnit alloc] initWithValue:7.0];
      v39 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      v40 = [v39 captionTextPadding];
      [v40 setTop:v38];

      v41 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      v42 = [v41 captionTextPadding];
      uint64_t v43 = [v42 top];
      v44 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      uint64_t v45 = [v44 captionTextPadding];
      [v45 setBottom:v43];

      v46 = +[LPPointUnit zero];
      uint64_t v47 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      [v47 setFirstLineLeading:v46];

      v48 = +[LPPointUnit zero];
      v49 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      [v49 setLastLineDescent:v48];

      v50 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      [v50 setShouldAlignToBaselines:0];

      v51 = [MEMORY[0x1E4FB1618] labelColor];
      double v52 = [v51 colorWithAlphaComponent:0.5];

      v53 = [MEMORY[0x1E4FB1618] labelColor];
      v54 = [v53 colorWithAlphaComponent:0.25];

      v55 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      v56 = [v55 aboveTopCaption];
      v1112[0] = MEMORY[0x1E4F143A8];
      v1112[1] = 3221225472;
      v1112[2] = __25__LPTheme_adjustForStyle__block_invoke_4;
      v1112[3] = &unk_1E5B06400;
      id v57 = v52;
      id v1113 = v57;
      [v56 applyToAllTextViewStyles:v1112];

      id v58 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      v59 = [v58 topCaption];
      v1110[0] = MEMORY[0x1E4F143A8];
      v1110[1] = 3221225472;
      v1110[2] = __25__LPTheme_adjustForStyle__block_invoke_5;
      v1110[3] = &unk_1E5B06400;
      id v60 = v57;
      id v1111 = v60;
      [v59 applyToAllTextViewStyles:v1110];

      v61 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      id v62 = [v61 bottomCaption];
      v1108[0] = MEMORY[0x1E4F143A8];
      v1108[1] = 3221225472;
      v1108[2] = __25__LPTheme_adjustForStyle__block_invoke_6;
      v1108[3] = &unk_1E5B06400;
      id v63 = v54;
      id v1109 = v63;
      [v62 applyToAllTextViewStyles:v1108];

      v64 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      v65 = [v64 belowBottomCaption];
      v1106[0] = MEMORY[0x1E4F143A8];
      v1106[1] = 3221225472;
      v1106[2] = __25__LPTheme_adjustForStyle__block_invoke_7;
      v1106[3] = &unk_1E5B06400;
      id v66 = v63;
      id v1107 = v66;
      [v65 applyToAllTextViewStyles:v1106];

      v67 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      [v67 applyToAllTextViewStyles:&__block_literal_global_1053];

      if (self->_isFallbackIcon)
      {
        v68 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        applyFallbackIconProperties(v68, self->_platform, self->_style, self->_sizeClass);
      }
      return;
    case 7uLL:
      v71 = [MEMORY[0x1E4FB1618] clearColor];
      v72 = self->_backgroundColor;
      self->_backgroundColor = v71;

      v73 = [[LPSize alloc] initWithSquareSize:26.0];
      uint64_t v74 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
      [v74 setFixedSize:v73];

      v75 = [[LPPointUnit alloc] initWithValue:8.0];
      v76 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
      [v76 setCornerRadius:v75];

      v77 = [[LPPointUnit alloc] initWithValue:4.0];
      v78 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
      v79 = [v78 margin];
      [v79 setTop:v77];

      v80 = [[LPPointUnit alloc] initWithValue:4.0];
      v81 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
      v82 = [v81 margin];
      [v82 setLeading:v80];

      v83 = [[LPPointUnit alloc] initWithValue:6.0];
      v84 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      v85 = [v84 captionTextPadding];
      [v85 setLeading:v83];

      v86 = [[LPPointUnit alloc] initWithValue:4.0];
      v87 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      v88 = [v87 captionTextPadding];
      [v88 setTrailing:v86];

      v89 = [[LPPointUnit alloc] initWithValue:5.0];
      v90 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      v91 = [v90 captionTextPadding];
      [v91 setTop:v89];

      v92 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      v93 = [v92 captionTextPadding];
      v94 = [v93 top];
      v95 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      v96 = [v95 captionTextPadding];
      [v96 setBottom:v94];

      v97 = +[LPPointUnit zero];
      id v98 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      [v98 setFirstLineLeading:v97];

      id v99 = +[LPPointUnit zero];
      v100 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      [v100 setLastLineDescent:v99];

      id v101 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      [v101 setShouldAlignToBaselines:0];

      v102 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      [v102 applyToAllTextViewStyles:&__block_literal_global_1055];

      id v103 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      objc_super v104 = [v103 topCaption];
      [v104 applyToAllTextViewStyles:&__block_literal_global_1057];

      v105 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      uint64_t v106 = [v105 bottomCaption];
      [v106 applyToAllTextViewStyles:&__block_literal_global_1059];

      if (self->_isFallbackIcon)
      {
        id v1098 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        applyFallbackIconProperties(v1098, self->_platform, self->_style, self->_sizeClass);
      }
      return;
    default:
      unint64_t v69 = self->_style;
      if (v69 != 3) {
        goto LABEL_53;
      }
      unint64_t v2 = self->_platform;
      if (+[LPTestingOverrides forceMonospaceFonts])
      {
        uint64_t v70 = [MEMORY[0x1E4FB1798] monospacedSystemFontOfSize:11.0 weight:*MEMORY[0x1E4FB29D8]];
        goto LABEL_41;
      }
      if (v2 > 6) {
        goto LABEL_399;
      }
      if (((1 << v2) & 0x53) != 0)
      {
        uint64_t v70 = fontWithTraits((void *)*MEMORY[0x1E4FB28D0], 0, sizeClass);
      }
      else if (v2 == 2)
      {
        uint64_t v70 = fontWithTraits((void *)*MEMORY[0x1E4FB2900], 0x8000, sizeClass);
      }
      else if (v2 == 5)
      {
        uint64_t v70 = fontWithTraits((void *)*MEMORY[0x1E4FB28C8], 0, sizeClass);
      }
      else
      {
LABEL_399:
        uint64_t v70 = [MEMORY[0x1E4FB1798] systemFontOfSize:11.0 weight:*MEMORY[0x1E4FB29D8]];
      }
LABEL_41:
      v128 = (LPPointUnit *)v70;
      [(LPTextViewStyle *)self->_quotedText setFont:v70];

      [(LPQuotedTextViewStyle *)self->_quotedText setMaximumLinesToConsiderShort:0];
      [(LPTextViewStyle *)self->_quotedText setMaximumCharacters:0];
      if (self->_platform == 2) {
        uint64_t v129 = 7;
      }
      else {
        uint64_t v129 = 30;
      }
      [(LPTextViewStyle *)self->_quotedText setMaximumLines:v129];
      [(LPTextViewStyle *)self->_quotedText setMaximumLinesWithMedia:7];
      [(LPLinkRendererSizeClassParameters *)self->_sizeClassParameters minimumMediaCornerRadius];
      double v131 = v130;
      if (v130 == 0.0)
      {
        unint64_t v132 = self->_platform;
        if (v132 <= 6) {
          v128 = [[LPPointUnit alloc] initWithValue:dbl_1A3711BF0[v132]];
        }
        v133 = [(LPTextViewStyle *)self->_quotedText padding];
        [v133 setTop:v128];

        v134 = +[LPPointUnit zero];
        unint64_t v2 = [(LPTextViewStyle *)self->_quotedText padding];
        [(id)v2 setBottom:v134];
      }
      [(LPQuotedTextViewStyle *)self->_quotedText setShowQuoteIndicator:0];
      [(LPQuotedTextViewStyle *)self->_quotedText setShowCharacterLimitIndicator:0];
      v135 = [MEMORY[0x1E4FB1618] clearColor];
      mediaBackgroundColor = self->_mediaBackgroundColor;
      self->_mediaBackgroundColor = v135;

      if (self->_sizeClass != 8)
      {
        if (v131 == 0.0)
        {
          v137 = pt(self->_leadingScalingFactor * 24.0);
          v138 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          [v138 setFirstLineLeading:v137];

          v139 = pt(self->_leadingScalingFactor * 13.0);
          v140 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          [v140 setLastLineDescent:v139];

          v141 = tweetTextToIconPadding((LPPointUnit *)self->_platform);
          v142 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          v143 = [v142 captionTextPadding];
          [v143 setLeading:v141];

          v144 = tweetTextOuterPadding((LPPointUnit *)self->_platform);
          v145 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          v146 = [v145 captionTextPadding];
          [v146 setTrailing:v144];
        }
        v147 = outerHorizontalTextMargin(self->_platform);
        v148 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        v149 = [v148 margin];
        [v149 setLeading:v147];

        v150 = +[LPPointUnit zero];
        v151 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        v152 = [v151 margin];
        [v152 setTrailing:v150];

        v153 = [[LPSize alloc] initWithSquareSize:25.0];
        unint64_t v2 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [(id)v2 setFixedSize:v153];
      }
      unint64_t v69 = self->_style;
LABEL_53:
      if (v69 == 2)
      {
        if (![(LPLinkRendererSizeClassParameters *)self->_sizeClassParameters needsSpaceAffordanceForDeleteButton])
        {
          v154 = +[LPPointUnit zero];
          [(LPCaptionBarStyle *)self->_captionBar setMinimumWidth:v154];
        }
        v155 = [[LPSize alloc] initWithSquareSize:32.0];
        v156 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v156 setFixedSize:v155];

        v157 = +[LPPointUnit zero];
        v158 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        v159 = [v158 margin];
        [v159 setTop:v157];

        v160 = +[LPPointUnit zero];
        v161 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        v162 = [v161 margin];
        [v162 setBottom:v160];

        v163 = [[LPPointUnit alloc] initWithValue:24.0];
        v164 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v164 setFixedFallbackImageSize:v163];

        v165 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        v166 = [v165 fixedSize];
        v167 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
        [v167 setFixedSize:v166];

        v168 = +[LPPointUnit zero];
        v169 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
        v170 = [v169 margin];
        [v170 setTop:v168];

        v171 = +[LPPointUnit zero];
        v172 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
        v173 = [v172 margin];
        [v173 setBottom:v171];

        v174 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        v175 = [v174 fixedFallbackImageSize];
        v176 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
        [v176 setFixedFallbackImageSize:v175];

        v177 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        v178 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v1104[0] = MEMORY[0x1E4F143A8];
        v1104[1] = 3221225472;
        v1104[2] = __25__LPTheme_adjustForStyle__block_invoke_12;
        v1104[3] = &unk_1E5B06400;
        unint64_t v2 = v177;
        id v1105 = (id)v2;
        [(LPPointUnit *)v178 applyToAllTextViewStyles:v1104];

        unint64_t v179 = self->_platform;
        if (v179 <= 6) {
          v178 = [[LPPointUnit alloc] initWithValue:self->_leadingScalingFactor * dbl_1A3711C28[v179]];
        }
        v180 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        [v180 setFirstLineLeading:v178];

        unint64_t v181 = self->_platform;
        if (v181 <= 6) {
          v178 = [[LPPointUnit alloc] initWithValue:self->_leadingScalingFactor * dbl_1A3711C60[v181]];
        }
        v182 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        [v182 setLastLineDescent:v178];

        unint64_t v69 = self->_style;
      }
      if (v69 == 15)
      {
        v183 = [[LPTapToLoadViewStyle alloc] initWithPlatform:self->_platform sizeClass:self->_sizeClass fontScalingFactor:self->_leadingScalingFactor];
        tapToLoad = self->_tapToLoad;
        self->_tapToLoad = v183;

        if (![(LPLinkRendererSizeClassParameters *)self->_sizeClassParameters needsSpaceAffordanceForDeleteButton])
        {
          v185 = +[LPPointUnit zero];
          [(LPCaptionBarStyle *)self->_captionBar setMinimumWidth:v185];
        }
        v186 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        unint64_t v2 = [v186 topCaption];
        v187 = [(id)v2 leading];
        [v187 setMaximumLines:1];

        unint64_t v69 = self->_style;
      }
      if (v69 == 4)
      {
        if (![(LPLinkRendererSizeClassParameters *)self->_sizeClassParameters needsSpaceAffordanceForDeleteButton])
        {
          v188 = +[LPPointUnit zero];
          [(LPCaptionBarStyle *)self->_captionBar setMinimumWidth:v188];
        }
        id v189 = [[LPGlyphStyle alloc] initSearchGlyph];
        v190 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v191 = [v190 topCaption];
        v192 = [v191 leading];
        [v192 setLeadingGlyph:v189];

        v193 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v194 = [v193 topCaption];
        v195 = [v194 leading];
        [v195 setMaximumLines:1];

        v196 = [[LPSize alloc] initWithSquareSize:24.0];
        unint64_t v2 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
        [(id)v2 setFixedSize:v196];

        unint64_t v69 = self->_style;
      }
      if (v69 <= 0x2A && ((1 << v69) & 0x40000480020) != 0)
      {
        if (rowConfigurationForSizeClass(self->_sizeClass) == 3)
        {
          BOOL v197 = sizeClassRequiresTrailingIcon(self->_sizeClass);
          captionBar = self->_captionBar;
          if (v197) {
            [(LPCaptionBarStyle *)captionBar trailingIcon];
          }
          else {
          id v199 = [(LPCaptionBarStyle *)captionBar leadingIcon];
          }

          unint64_t v200 = self->_platform;
          double v201 = 0.0;
          if (v200 <= 6) {
            double v201 = dbl_1A3711C98[v200];
          }
          v202 = [[LPSize alloc] initWithSquareSize:v201];
          [v199 setFixedSize:v202];

          v203 = [[LPPointUnit alloc] initWithValue:4.0];
          [v199 setCornerRadius:v203];

          v204 = [[LPPointUnit alloc] initWithValue:12.0];
          v205 = [v199 margin];
          [v205 setTop:v204];

          v206 = [[LPPointUnit alloc] initWithValue:12.0];
          v207 = [v199 margin];
          [v207 setBottom:v206];

          if (![(LPLinkRendererSizeClassParameters *)self->_sizeClassParameters needsSpaceAffordanceForDeleteButton])
          {
            unint64_t v208 = self->_platform;
            if (v208 <= 6) {
              v206 = [[LPPointUnit alloc] initWithValue:dbl_1A3711CD0[v208]];
            }
            [(LPCaptionBarStyle *)self->_captionBar setMinimumWidth:v206];
          }
        }
        v209 = [MEMORY[0x1E4FB1618] labelColor];
        unint64_t v2 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v210 = [(id)v2 bottomCaption];
        v211 = [v210 leading];
        [v211 setColor:v209];

        unint64_t v69 = self->_style;
        if (v69 == 42)
        {
          uint64_t v1121 = *MEMORY[0x1E4FB2880];
          uint64_t v1119 = *MEMORY[0x1E4FB29E0];
          v212 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB29A8]];
          v1120 = v212;
          v213 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v1120 forKeys:&v1119 count:1];
          v1122[0] = v213;
          v214 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v1122 forKeys:&v1121 count:1];
          v215 = fontWithTraitsAndAttributes((void *)*MEMORY[0x1E4FB2998], 32770, v214, self->_sizeClass);
          [(LPTextViewStyle *)self->_quotedText setFont:v215];

          [(LPQuotedTextViewStyle *)self->_quotedText setMaximumLinesToConsiderShort:0];
          [(LPTextViewStyle *)self->_quotedText setMaximumCharacters:0];
          [(LPQuotedTextViewStyle *)self->_quotedText setShowQuoteIndicator:0];
          [(LPQuotedTextViewStyle *)self->_quotedText setShowCharacterLimitIndicator:0];
          v216 = [[LPPointUnit alloc] initWithValue:6.0];
          [(LPTextViewStyle *)self->_quotedText setParagraphSpacing:v216];

          [(LPTextViewStyle *)self->_quotedText setMaximumLines:20];
          v217 = [MEMORY[0x1E4FB1618] whiteColor];
          [(LPTextViewStyle *)self->_quotedText setColor:v217];

          v218 = [[LPPointUnit alloc] initWithValue:15.0];
          v219 = [(LPTextViewStyle *)self->_quotedText padding];
          [v219 setTop:v218];

          v220 = [(LPTextViewStyle *)self->_quotedText padding];
          v221 = [v220 top];
          v222 = [(LPTextViewStyle *)self->_quotedText padding];
          [v222 setBottom:v221];

          v223 = [[LPPointUnit alloc] initWithValue:16.0];
          v224 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          v225 = [v224 captionTextPadding];
          [v225 setLeading:v223];

          v226 = [[LPPointUnit alloc] initWithValue:self->_leadingScalingFactor * 46.0];
          v227 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          v228 = [v227 captionTextPadding];
          [v228 setTrailing:v226];

          v229 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          v230 = [v229 captionTextPadding];
          v231 = [v230 leading];
          v232 = [(LPTextViewStyle *)self->_quotedText padding];
          [v232 setLeading:v231];

          v233 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          v234 = [v233 captionTextPadding];
          v235 = [v234 trailing];
          v236 = [(LPTextViewStyle *)self->_quotedText padding];
          [v236 setTrailing:v235];

          v237 = fontWithTraits((void *)*MEMORY[0x1E4FB28E0], 0, self->_sizeClass);
          v238 = [(LPCaptionBarStyle *)self->_mediaBottomCaptionBar textStack];
          v239 = [v238 topCaption];
          v240 = [v239 trailing];
          [v240 setFont:v237];

          v241 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.45];
          v242 = [(LPCaptionBarStyle *)self->_mediaBottomCaptionBar textStack];
          v243 = [v242 topCaption];
          v244 = [v243 trailing];
          [v244 setColor:v241];

          v245 = [(LPCaptionBarStyle *)self->_mediaBottomCaptionBar textStack];
          v246 = [v245 topCaption];
          v247 = [v246 trailing];
          uint64_t v248 = *MEMORY[0x1E4F3A2E8];
          [v247 setCompositingFilter:*MEMORY[0x1E4F3A2E8]];

          v249 = [[LPPointUnit alloc] initWithValue:16.0];
          v250 = [(LPCaptionBarStyle *)self->_mediaBottomCaptionBar textStack];
          v251 = [v250 captionTextPadding];
          [v251 setTrailing:v249];

          v252 = [[LPPointUnit alloc] initWithValue:14.0];
          v253 = [(LPCaptionBarStyle *)self->_mediaBottomCaptionBar textStack];
          [v253 setLastLineDescent:v252];

          v254 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          [v254 applyToAllTextViewStyles:&__block_literal_global_1065];

          v255 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.5];
          v256 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          v257 = [v256 belowBottomCaption];
          v258 = [v257 leading];
          [v258 setColor:v255];

          unint64_t v2 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          v259 = [(id)v2 belowBottomCaption];
          v260 = [v259 leading];
          [v260 setCompositingFilter:v248];

          v261 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
          [(LPCaptionBarStyle *)self->_captionBar setBackgroundColor:v261];

          v262 = [MEMORY[0x1E4FB1618] clearColor];
          v263 = self->_mediaBackgroundColor;
          self->_mediaBackgroundColor = v262;

          unint64_t v69 = self->_style;
        }
      }
      if (v69 > 0x38 || ((1 << v69) & 0x100000000300240) == 0) {
        goto LABEL_95;
      }
      v264 = [MEMORY[0x1E4FB1618] labelColor];
      unint64_t v2 = [(LPCaptionBarStyle *)self->_captionBar textStack];
      v265 = [(id)v2 bottomCaption];
      v266 = [v265 leading];
      [v266 setColor:v264];

      if (!sizeClassAllowsInsetMedia(self->_sizeClass) || (sizeClassUsesVisualRefresh(self->_sizeClass) & 1) != 0) {
        goto LABEL_94;
      }
      v267 = [[LPSize alloc] initWithSquareSize:172.0];
      [(LPImageViewStyle *)self->_mediaImage setFixedSize:v267];

      p_mediaImage = &self->_mediaImage;
      [(LPImageViewStyle *)self->_mediaImage setFilter:13];
      [(LPImageViewStyle *)self->_mediaImage setScalingMode:2];
      unint64_t v269 = self->_platform;
      if (v269 < 5) {
        goto LABEL_89;
      }
      if (v269 == 5)
      {
        v270 = &musicAlbumCornerRadius_visionSize;
        v271 = (void *)musicAlbumCornerRadius_visionSize;
        if (musicAlbumCornerRadius_visionSize) {
          goto LABEL_92;
        }
        double v272 = 7.0;
        goto LABEL_91;
      }
      if (v269 == 6)
      {
LABEL_89:
        v270 = &musicAlbumCornerRadius_normalSize;
        v271 = (void *)musicAlbumCornerRadius_normalSize;
        if (musicAlbumCornerRadius_normalSize)
        {
LABEL_92:
          p_mediaImage = v271;
          goto LABEL_93;
        }
        double v272 = 4.0;
LABEL_91:
        v273 = [[LPPointUnit alloc] initWithValue:v272];
        v274 = (void *)*v270;
        uint64_t *v270 = (uint64_t)v273;

        v271 = (void *)*v270;
        goto LABEL_92;
      }
LABEL_93:
      [(LPImageViewStyle *)self->_mediaImage setCornerRadius:p_mediaImage];

      v275 = outerHorizontalTextMargin(self->_platform);
      v276 = [(LPImageViewStyle *)self->_mediaImage padding];
      [v276 setLeading:v275];

      v277 = outerHorizontalTextMargin(self->_platform);
      v278 = [(LPImageViewStyle *)self->_mediaImage padding];
      [v278 setTrailing:v277];

      v279 = outerHorizontalTextMargin(self->_platform);
      unint64_t v2 = [(LPImageViewStyle *)self->_mediaImage padding];
      [(id)v2 setTop:v279];

LABEL_94:
      v280 = [MEMORY[0x1E4FB1618] clearColor];
      [(LPImageViewStyle *)self->_mediaImage setBackgroundColor:v280];

      v281 = [MEMORY[0x1E4FB1618] clearColor];
      v282 = self->_mediaBackgroundColor;
      self->_mediaBackgroundColor = v281;

      unint64_t v69 = self->_style;
LABEL_95:
      if ((v69 == 40 || v69 == 7) && p_quotedText)
      {
        v283 = [LPSize alloc];
        unint64_t v284 = self->_platform;
        if (v284 >= 5)
        {
          if (v284 == 5)
          {
            v285 = &musicArtistDiameter_visionSize;
            v286 = (void *)musicArtistDiameter_visionSize;
            if (musicArtistDiameter_visionSize) {
              goto LABEL_102;
            }
            double v287 = 163.0;
            goto LABEL_101;
          }
          if (v284 != 6) {
            goto LABEL_103;
          }
        }
        v285 = &musicArtistDiameter_normalSize;
        v286 = (void *)musicArtistDiameter_normalSize;
        if (musicArtistDiameter_normalSize)
        {
LABEL_102:
          unint64_t v2 = v286;
LABEL_103:
          v290 = [(LPSize *)v283 initWithSquarePoints:v2];
          [(LPImageViewStyle *)self->_mediaImage setFixedSize:v290];

          [(LPImageViewStyle *)self->_mediaImage setFilter:12];
          [(LPImageViewStyle *)self->_mediaImage setScalingMode:2];
          v292 = musicArtistOuterPadding((void *)self->_platform, v291);
          v293 = [(LPImageViewStyle *)self->_mediaImage padding];
          [v293 setLeading:v292];

          v295 = musicArtistOuterPadding((void *)self->_platform, v294);
          v296 = [(LPImageViewStyle *)self->_mediaImage padding];
          [v296 setTrailing:v295];

          v298 = musicArtistOuterPadding((void *)self->_platform, v297);
          v299 = [(LPImageViewStyle *)self->_mediaImage padding];
          [v299 setTop:v298];

          v300 = [MEMORY[0x1E4FB1618] clearColor];
          [(LPImageViewStyle *)self->_mediaImage setBackgroundColor:v300];

          v301 = [MEMORY[0x1E4FB1618] clearColor];
          v302 = self->_mediaBackgroundColor;
          self->_mediaBackgroundColor = v301;

          v303 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          v304 = [v303 topCaption];
          v305 = [v304 leading];
          [v305 setTextAlignment:2];

          v306 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          v307 = [v306 bottomCaption];
          v308 = [v307 leading];
          [v308 setTextAlignment:2];

          v309 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          v310 = [v309 belowBottomCaption];
          v311 = [v310 leading];
          [v311 setTextAlignment:2];

          unint64_t v69 = self->_style;
          goto LABEL_104;
        }
        double v287 = 172.0;
LABEL_101:
        v288 = [[LPPointUnit alloc] initWithValue:v287];
        v289 = (void *)*v285;
        uint64_t *v285 = (uint64_t)v288;

        v286 = (void *)*v285;
        goto LABEL_102;
      }
LABEL_104:
      if (v69 <= 0x38 && ((1 << v69) & 0x100000000000300) != 0)
      {
        v312 = [MEMORY[0x1E4FB1618] labelColor];
        v313 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v314 = [v313 bottomCaption];
        v315 = [v314 leading];
        [v315 setColor:v312];

        unint64_t v69 = self->_style;
      }
      if (v69 == 17)
      {
        v316 = [[LPSize alloc] initWithSquareSize:18.0];
        v317 = [(LPCaptionBarStyle *)self->_mediaTopCaptionBar leadingIcon];
        [v317 setFixedSize:v316];

        v318 = [[LPPointUnit alloc] initWithValue:8.0];
        v319 = [(LPCaptionBarStyle *)self->_mediaTopCaptionBar leadingIcon];
        v320 = [v319 margin];
        [v320 setLeading:v318];

        v321 = [[LPPointUnit alloc] initWithValue:8.0];
        v322 = [(LPCaptionBarStyle *)self->_mediaTopCaptionBar leadingIcon];
        v323 = [v322 margin];
        [v323 setTop:v321];

        v324 = [(LPCaptionBarStyle *)self->_mediaTopCaptionBar leadingIcon];
        [v324 setFilter:3];

        v325 = [[LPPointUnit alloc] initWithValue:5.0];
        v326 = [(LPCaptionBarStyle *)self->_mediaTopCaptionBar leadingIcon];
        [v326 setCornerRadius:v325];

        unint64_t v69 = self->_style;
      }
      if (v69 == 24)
      {
        v327 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v328 = [v327 topCaption];
        v329 = [v328 leading];
        [v329 setMaximumLines:0];

        v330 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v331 = [v330 bottomCaption];
        v332 = [v331 leading];
        [v332 setMaximumLines:0];

        v333 = bottomCaptionFont(self->_platform, self->_sizeClass);
        v334 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v335 = [v334 topCaption];
        v336 = [v335 leading];
        [v336 setFont:v333];

        v337 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        v338 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v339 = [v338 topCaption];
        v340 = [v339 leading];
        [v340 setColor:v337];

        v341 = topCaptionFont(self->_platform, self->_sizeClass);
        v342 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v343 = [v342 bottomCaption];
        v344 = [v343 leading];
        [v344 setFont:v341];

        v345 = [MEMORY[0x1E4FB1618] labelColor];
        v346 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v347 = [v346 bottomCaption];
        v348 = [v347 leading];
        [v348 setColor:v345];

        unint64_t v69 = self->_style;
      }
      if (v69 == 27)
      {
        v349 = [(LPCaptionBarStyle *)self->_mediaBottomCaptionBar textStack];
        v350 = [v349 topCaption];
        v351 = [v350 leading];
        [v351 setMaximumLines:0];

        v352 = [(LPCaptionBarStyle *)self->_mediaBottomCaptionBar textStack];
        v353 = [v352 bottomCaption];
        v354 = [v353 leading];
        [v354 setMaximumLines:0];

        v355 = topCaptionFont(self->_platform, self->_sizeClass);
        v356 = [(LPCaptionBarStyle *)self->_mediaBottomCaptionBar textStack];
        v357 = [v356 bottomCaption];
        v358 = [v357 leading];
        [v358 setFont:v355];

        v359 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
        [v359 setFilter:1];

        v360 = (void *)businessChatApplePayIconSize_normalSize;
        if (!businessChatApplePayIconSize_normalSize)
        {
          v361 = -[LPSize initWithSize:]([LPSize alloc], "initWithSize:", 60.0, 30.0);
          v362 = (void *)businessChatApplePayIconSize_normalSize;
          businessChatApplePayIconSize_normaldouble Size = (uint64_t)v361;

          v360 = (void *)businessChatApplePayIconSize_normalSize;
        }
        id v363 = v360;
        v364 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
        [v364 setFixedSize:v363];

        v365 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
        [v365 setVerticalAlignment:1];

        v366 = [[LPPointUnit alloc] initWithValue:8.0];
        v367 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
        v368 = [v367 margin];
        [v368 setTop:v366];

        v369 = [[LPPointUnit alloc] initWithValue:263.0];
        maximumWidth = self->_maximumWidth;
        self->_maximumWidth = v369;

        v371 = [[LPPointUnit alloc] initWithValue:222.0];
        [(LPCaptionBarStyle *)self->_captionBar setMinimumWidth:v371];

        unint64_t v69 = self->_style;
      }
      if (v69 == 30)
      {
        v372 = [(LPCaptionBarStyle *)self->_mediaBottomCaptionBar textStack];
        v373 = [v372 topCaption];
        v374 = [v373 leading];
        [v374 setMaximumLines:0];

        v375 = [(LPCaptionBarStyle *)self->_mediaBottomCaptionBar textStack];
        v376 = [v375 bottomCaption];
        v377 = [v376 leading];
        [v377 setMaximumLines:0];

        v378 = topCaptionFont(self->_platform, self->_sizeClass);
        v379 = [(LPCaptionBarStyle *)self->_mediaBottomCaptionBar textStack];
        v380 = [v379 bottomCaption];
        v381 = [v380 leading];
        [v381 setFont:v378];

        v382 = [[LPPointUnit alloc] initWithValue:263.0];
        v383 = self->_maximumWidth;
        self->_maximumWidth = v382;

        v384 = [[LPPointUnit alloc] initWithValue:222.0];
        [(LPCaptionBarStyle *)self->_captionBar setMinimumWidth:v384];

        unint64_t v69 = self->_style;
      }
      if (v69 == 29)
      {
        v385 = [(LPCaptionBarStyle *)self->_mediaBottomCaptionBar textStack];
        v386 = [v385 topCaption];
        v387 = [v386 leading];
        [v387 setMaximumLines:0];

        v388 = [(LPCaptionBarStyle *)self->_mediaBottomCaptionBar textStack];
        v389 = [v388 bottomCaption];
        v390 = [v389 leading];
        [v390 setMaximumLines:0];

        v391 = topCaptionFont(self->_platform, self->_sizeClass);
        v392 = [(LPCaptionBarStyle *)self->_mediaBottomCaptionBar textStack];
        v393 = [v392 bottomCaption];
        v394 = [v393 leading];
        [v394 setFont:v391];

        v395 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
        [v395 setFilter:3];

        v396 = [[LPPointUnit alloc] initWithValue:10.0];
        v397 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
        [v397 setCornerRadius:v396];

        v398 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v398 setFilter:3];

        v399 = [[LPPointUnit alloc] initWithValue:10.0];
        v400 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v400 setCornerRadius:v399];

        v401 = businessChatImageSmallSize();
        v402 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
        [v402 setFixedSize:v401];

        v403 = businessChatImageSmallSize();
        v404 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v404 setFixedSize:v403];

        v405 = [[LPPointUnit alloc] initWithValue:10.0];
        v406 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
        v407 = [v406 margin];
        [v407 setTop:v405];

        v408 = [[LPPointUnit alloc] initWithValue:10.0];
        v409 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
        v410 = [v409 margin];
        [v410 setBottom:v408];

        v411 = [[LPPointUnit alloc] initWithValue:10.0];
        v412 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        v413 = [v412 margin];
        [v413 setTop:v411];

        v414 = [[LPPointUnit alloc] initWithValue:10.0];
        v415 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        v416 = [v415 margin];
        [v416 setBottom:v414];

        v417 = [[LPPointUnit alloc] initWithValue:263.0];
        v418 = self->_maximumWidth;
        self->_maximumWidth = v417;

        v419 = [[LPPointUnit alloc] initWithValue:222.0];
        [(LPCaptionBarStyle *)self->_captionBar setMinimumWidth:v419];

        unint64_t v69 = self->_style;
      }
      if (v69 == 28)
      {
        v420 = [(LPCaptionBarStyle *)self->_mediaBottomCaptionBar textStack];
        v421 = [v420 topCaption];
        v422 = [v421 leading];
        [v422 setMaximumLines:0];

        v423 = [(LPCaptionBarStyle *)self->_mediaBottomCaptionBar textStack];
        v424 = [v423 bottomCaption];
        v425 = [v424 leading];
        [v425 setMaximumLines:0];

        v426 = topCaptionFont(self->_platform, self->_sizeClass);
        v427 = [(LPCaptionBarStyle *)self->_mediaBottomCaptionBar textStack];
        v428 = [v427 bottomCaption];
        v429 = [v428 leading];
        [v429 setFont:v426];

        v430 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
        [v430 setFilter:3];

        v431 = [[LPPointUnit alloc] initWithValue:10.0];
        v432 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
        [v432 setCornerRadius:v431];

        v433 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v433 setFilter:3];

        v434 = [[LPPointUnit alloc] initWithValue:10.0];
        v435 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v435 setCornerRadius:v434];

        v436 = businessChatImageIconSize();
        v437 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
        [v437 setFixedSize:v436];

        v438 = businessChatImageIconSize();
        v439 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v439 setFixedSize:v438];

        v440 = [[LPPointUnit alloc] initWithValue:10.0];
        v441 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
        v442 = [v441 margin];
        [v442 setTop:v440];

        v443 = [[LPPointUnit alloc] initWithValue:10.0];
        v444 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
        v445 = [v444 margin];
        [v445 setBottom:v443];

        v446 = [[LPPointUnit alloc] initWithValue:10.0];
        v447 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        v448 = [v447 margin];
        [v448 setTop:v446];

        v449 = [[LPPointUnit alloc] initWithValue:10.0];
        v450 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        v451 = [v450 margin];
        [v451 setBottom:v449];

        v452 = [[LPPointUnit alloc] initWithValue:263.0];
        v453 = self->_maximumWidth;
        self->_maximumWidth = v452;

        v454 = [[LPPointUnit alloc] initWithValue:222.0];
        [(LPCaptionBarStyle *)self->_captionBar setMinimumWidth:v454];

        unint64_t v69 = self->_style;
      }
      if (v69 == 12)
      {
        v455 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v455 setFilter:5];

        unint64_t v69 = self->_style;
      }
      if (v69 == 18)
      {
        v456 = iMessageAppLinkIconSize(self->_platform);
        v457 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v457 setFixedSize:v456];

        v458 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v458 setFilter:6];

        unint64_t v69 = self->_style;
      }
      if (v69 == 46 || v69 == 16)
      {
        BOOL v459 = sizeClassRequiresTrailingIcon(self->_sizeClass);
        v460 = self->_captionBar;
        if (v459) {
          [(LPCaptionBarStyle *)v460 trailingIcon];
        }
        else {
        id v461 = [(LPCaptionBarStyle *)v460 leadingIcon];
        }

        v462 = [[LPPointUnit alloc] initWithValue:9.0];
        v463 = [v461 margin];
        [v463 setLeading:v462];

        v464 = [v461 margin];
        [v464 setTop:v462];

        id v465 = [v461 margin];
        [v465 setBottom:v462];

        unint64_t v466 = self->_platform;
        if (self->_style == 46)
        {
          switch(v466)
          {
            case 0uLL:
            case 1uLL:
            case 4uLL:
            case 6uLL:
              v467 = (void *)faceTimeIconSize_normalSize;
              if (faceTimeIconSize_normalSize) {
                goto LABEL_187;
              }
              v468 = [[LPSize alloc] initWithSquareSize:30.0];
              v469 = &faceTimeIconSize_normalSize;
              break;
            case 2uLL:
              v467 = (void *)faceTimeIconSize_watchSize;
              if (faceTimeIconSize_watchSize) {
                goto LABEL_187;
              }
              v468 = [[LPSize alloc] initWithSquareSize:22.0];
              v469 = &faceTimeIconSize_watchSize;
              break;
            case 3uLL:
              v467 = (void *)faceTimeIconSize_htmlSize;
              if (faceTimeIconSize_htmlSize) {
                goto LABEL_187;
              }
              v468 = -[LPSize initWithSize:]([LPSize alloc], "initWithSize:", 30.0, 20.0);
              v469 = &faceTimeIconSize_htmlSize;
              break;
            case 5uLL:
              v467 = (void *)faceTimeIconSize_visionSize;
              if (faceTimeIconSize_visionSize) {
                goto LABEL_187;
              }
              v468 = -[LPSize initWithSize:]([LPSize alloc], "initWithSize:", 44.0, 56.0);
              v469 = &faceTimeIconSize_visionSize;
              break;
            default:
              goto LABEL_188;
          }
          v607 = (void *)*v469;
          uint64_t *v469 = (uint64_t)v468;

          v467 = (void *)*v469;
LABEL_187:
          id v465 = v467;
LABEL_188:
          [v461 setFixedSize:v465];

          if (self->_platform == 5)
          {
            [v461 setFixedFallbackImageWeight:&unk_1EF712780];
            [v461 setFixedFallbackImageFontTextStyle:*MEMORY[0x1E4FB2998]];
          }
          goto LABEL_190;
        }
        if (v466 > 6)
        {
LABEL_140:
          [v461 setFixedSize:v465];

LABEL_190:
          if (!sizeClassRequiresTrailingIcon(self->_sizeClass))
          {
            v608 = [[LPPointUnit alloc] initWithValue:8.0];
            v609 = [(LPCaptionBarStyle *)self->_captionBar textStack];
            v610 = [v609 captionTextPadding];
            [v610 setLeading:v608];
          }
          if (self->_style != 46 || (sizeClassAllowsPillButton(self->_sizeClass) & 1) == 0)
          {
            v611 = [(LPCaptionBarStyle *)self->_captionBar textStack];
            v612 = [v611 topCaption];
            v613 = [v612 leading];
            [v613 setMaximumLines:1];
          }
          unint64_t v69 = self->_style;
          goto LABEL_196;
        }
        if (v466 == 2)
        {
          v470 = &iCloudDocumentShareIconSize_watchSize;
          v471 = (void *)iCloudDocumentShareIconSize_watchSize;
          if (iCloudDocumentShareIconSize_watchSize) {
            goto LABEL_139;
          }
          double v472 = 22.0;
        }
        else
        {
          v470 = &iCloudDocumentShareIconSize_normalSize;
          v471 = (void *)iCloudDocumentShareIconSize_normalSize;
          if (iCloudDocumentShareIconSize_normalSize)
          {
LABEL_139:
            id v465 = v471;
            goto LABEL_140;
          }
          double v472 = 30.0;
        }
        v473 = [[LPSize alloc] initWithSquareSize:v472];
        v474 = (void *)*v470;
        uint64_t *v470 = (uint64_t)v473;

        v471 = (void *)*v470;
        goto LABEL_139;
      }
LABEL_196:
      if (v69 == 26)
      {
        BOOL v614 = sizeClassRequiresTrailingIcon(self->_sizeClass);
        v615 = self->_captionBar;
        if (v614) {
          [(LPCaptionBarStyle *)v615 trailingIcon];
        }
        else {
        id v616 = [(LPCaptionBarStyle *)v615 leadingIcon];
        }

        [v616 setFilter:6];
        v617 = iMessageAppLinkIconSize(self->_platform);
        [v616 setFixedSize:v617];

        v618 = [(LPCaptionBarStyle *)self->_mediaTopCaptionBar leadingIcon];
        [v618 setFilter:6];

        v619 = iMessageAppLinkIconSize(self->_platform);
        v620 = [(LPCaptionBarStyle *)self->_mediaTopCaptionBar leadingIcon];
        [v620 setFixedSize:v619];

        unint64_t v69 = self->_style;
      }
      if (v69 == 31)
      {
        v621 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v622 = [v621 topCaption];
        v623 = [v622 leading];
        [v623 setMaximumLines:10];

        v624 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v625 = [v624 bottomCaption];
        v626 = [v625 leading];
        [v626 setMaximumLines:10];

        v627 = [[LPPointUnit alloc] initWithValue:17.0];
        v628 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v628 setFixedFallbackImageSize:v627];

        v629 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        v630 = [v629 fixedFallbackImageSize];
        v631 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
        [v631 setFixedFallbackImageSize:v630];

        unint64_t v69 = self->_style;
      }
      if (v69 == 32)
      {
        id v632 = [[LPGlyphStyle alloc] initSearchGlyph];
        v633 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v634 = [v633 topCaption];
        v635 = [v634 leading];
        [v635 setLeadingGlyph:v632];

        v636 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v637 = [v636 topCaption];
        v638 = [v637 leading];
        [v638 setMaximumLines:10];

        unint64_t v69 = self->_style;
      }
      if (v69 == 33)
      {
        BOOL v639 = sizeClassRequiresTrailingIcon(self->_sizeClass);
        v640 = self->_captionBar;
        if (v639) {
          [(LPCaptionBarStyle *)v640 trailingIcon];
        }
        else {
        id v641 = [(LPCaptionBarStyle *)v640 leadingIcon];
        }

        [v641 setFilter:1];
        unint64_t v69 = self->_style;
      }
      if (v69 == 36)
      {
        int64_t v642 = self->_platform;
        unint64_t v643 = self->_sizeClass;
        if (+[LPTestingOverrides forceMonospaceFonts])
        {
          uint64_t v644 = [MEMORY[0x1E4FB1798] monospacedSystemFontOfSize:24.0 weight:*MEMORY[0x1E4FB29A8]];
        }
        else
        {
          switch(v642)
          {
            case 0:
            case 2:
            case 6:
              uint64_t v644 = fontWithTraits((void *)*MEMORY[0x1E4FB2990], 32770, v643);
              break;
            case 5:
              uint64_t v644 = fontWithTraits((void *)*MEMORY[0x1E4FB2990], 2, v643);
              break;
            default:
              uint64_t v644 = [MEMORY[0x1E4FB1798] systemFontOfSize:24.0 weight:*MEMORY[0x1E4FB29A8]];
              break;
          }
        }
        v645 = (void *)v644;
        v646 = [(LPCaptionBarStyle *)self->_mediaTopCaptionBar textStack];
        v647 = [v646 topCaption];
        v648 = [v647 leading];
        [v648 setFont:v645];

        unint64_t v649 = self->_platform;
        unint64_t v650 = self->_sizeClass;
        if (+[LPTestingOverrides forceMonospaceFonts])
        {
          uint64_t v651 = [MEMORY[0x1E4FB1798] monospacedSystemFontOfSize:12.0 weight:*MEMORY[0x1E4FB29A8]];
        }
        else if (v649 <= 6 && ((1 << v649) & 0x65) != 0)
        {
          uint64_t v651 = fontWithTraits((void *)*MEMORY[0x1E4FB2950], 0, v650);
        }
        else
        {
          uint64_t v651 = [MEMORY[0x1E4FB1798] systemFontOfSize:12.0 weight:*MEMORY[0x1E4FB29A8]];
        }
        v652 = (void *)v651;
        v653 = [(LPCaptionBarStyle *)self->_mediaTopCaptionBar textStack];
        v654 = [v653 bottomCaption];
        v655 = [v654 leading];
        [v655 setFont:v652];

        v656 = [[LPPointUnit alloc] initWithValue:30.0];
        v657 = [(LPCaptionBarStyle *)self->_mediaTopCaptionBar textStack];
        [v657 setFirstLineLeading:v656];

        v658 = [[LPPointUnit alloc] initWithValue:18.0];
        v659 = [(LPCaptionBarStyle *)self->_mediaTopCaptionBar textStack];
        v660 = [v659 bottomCaption];
        v661 = [v660 leading];
        [v661 setFirstLineLeading:v658];

        unint64_t v69 = self->_style;
      }
      if (v69 <= 0x39 && ((1 << v69) & 0x200000000006000) != 0)
      {
        v662 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v663 = [v662 topCaption];
        v664 = [v663 leading];
        v665 = [v664 color];
        v666 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v667 = [v666 bottomCaption];
        v668 = [v667 leading];
        [v668 setColor:v665];

        unint64_t v69 = self->_style;
      }
      if (p_quotedText)
      {
        if (v69 - 13 > 1) {
          goto LABEL_234;
        }
        v669 = [MEMORY[0x1E4FB1618] clearColor];
        v670 = self->_mediaBackgroundColor;
        self->_mediaBackgroundColor = v669;

        v671 = [[LPPointUnit alloc] initWithValue:-10.0];
        v672 = [(LPImageViewStyle *)self->_mediaImage padding];
        [v672 setBottom:v671];

        p_quotedText = [[LPSize alloc] initWithSquareSize:300.0];
        [(LPImageViewStyle *)self->_mediaImage setFixedSize:p_quotedText];

        v4 = (LPPointUnit *)[(LPImageViewStyle *)self->_mediaImage setScalingMode:1];
        unint64_t v69 = self->_style;
      }
      if (v69 == 13)
      {
        p_quotedText = [[LPPointUnit alloc] initWithValue:20.0];
        v673 = [(LPImageViewStyle *)self->_mediaImage padding];
        [v673 setTop:p_quotedText];

        unint64_t v69 = self->_style;
      }
      if (v69 == 14)
      {
        p_quotedText = [[LPPointUnit alloc] initWithValue:10.0];
        v674 = [(LPImageViewStyle *)self->_mediaImage padding];
        [v674 setTop:p_quotedText];

        unint64_t v69 = self->_style;
      }
LABEL_234:
      if (v69 == 41)
      {
        [(LPQuotedTextViewStyle *)self->_quotedText setShowQuoteIndicator:0];
        p_quotedText = [[LPSize alloc] initWithSquareSize:40.0];
        v675 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v675 setFixedSize:p_quotedText];

        unint64_t v69 = self->_style;
      }
      if (v69 == 53 || v69 == 44)
      {
        v676 = [MEMORY[0x1E4FB1618] blackColor];
        v677 = [(LPCaptionBarStyle *)self->_captionBar button];
        [v677 setBackgroundColor:v676];

        p_quotedText = [[LPPointUnit alloc] initWithValue:8.0];
        v678 = [(LPCaptionBarStyle *)self->_captionBar button];
        [v678 setImagePadding:p_quotedText];

        unint64_t v69 = self->_style;
      }
      if (v69 == 56)
      {
        v4 = (LPPointUnit *)[(LPTheme *)self _adjustForAppleMusicCollaborativePlaylistStyle];
        unint64_t v69 = self->_style;
      }
      if (v69 == 58)
      {
        v4 = (LPPointUnit *)[(LPTheme *)self _adjustForEnrichedBusinessChatStyle];
        unint64_t v69 = self->_style;
      }
      if (v69 == 46)
      {
        v679 = +[LPResources faceTimeBackgroundColor];
        v680 = self->_backgroundColor;
        self->_backgroundColor = v679;

        self->_backgroundMaterial = 9;
        v681 = [MEMORY[0x1E4FB1618] whiteColor];
        v682 = [(LPCaptionBarStyle *)self->_captionBar button];
        [v682 setBackgroundColor:v681];

        v683 = +[LPResources faceTimeBackgroundColor];
        v684 = [(LPCaptionBarStyle *)self->_captionBar button];
        [v684 setForegroundColor:v683];

        p_quotedText = [MEMORY[0x1E4FB1618] whiteColor];
        v685 = [(LPSize *)p_quotedText colorWithAlphaComponent:0.6];
        [(LPImageViewStyle *)self->_placeholderImage setMaskColor:v685];

        unint64_t v69 = self->_style;
      }
      if (v69 == 50)
      {
        p_quotedText = [[LPSize alloc] initWithSquareSize:60.0];
        [(LPImageViewStyle *)self->_mediaImage setMaximumSize:p_quotedText];
        [(LPImageViewStyle *)self->_mediaImage setFixedSize:p_quotedText];
        [(LPImageViewStyle *)self->_mediaImage setScalingMode:1];
        v686 = [[LPPointUnit alloc] initWithValue:14.0];
        v687 = [(LPImageViewStyle *)self->_mediaImage padding];
        [v687 setTop:v686];

        v688 = [[LPPointUnit alloc] initWithValue:14.0];
        v689 = [(LPImageViewStyle *)self->_mediaImage padding];
        [v689 setBottom:v688];

        [(LPImageViewStyle *)self->_mediaImage setFilter:5];
        unint64_t v69 = self->_style;
      }
      if (v69 == 48)
      {
        p_quotedText = [[LPSize alloc] initWithSquareSize:60.0];
        [(LPImageViewStyle *)self->_mediaImage setMaximumSize:p_quotedText];
        [(LPImageViewStyle *)self->_mediaImage setFixedSize:p_quotedText];
        [(LPImageViewStyle *)self->_mediaImage setScalingMode:1];
        v690 = [[LPPointUnit alloc] initWithValue:10.0];
        v691 = [(LPImageViewStyle *)self->_mediaImage padding];
        [v691 setTop:v690];

        v692 = [[LPPointUnit alloc] initWithValue:10.0];
        v693 = [(LPImageViewStyle *)self->_mediaImage padding];
        [v693 setBottom:v692];

        [(LPImageViewStyle *)self->_mediaImage setDarkeningAmount:0.0];
        unint64_t v69 = self->_style;
      }
      if (v69 == 51)
      {
        v694 = [MEMORY[0x1E4FB1618] labelColor];
        v695 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v696 = [v695 bottomCaption];
        v697 = [v696 leading];
        [v697 setColor:v694];

        p_quotedText = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        v698 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v699 = [v698 belowBottomCaption];
        v700 = [v699 leading];
        [v700 setColor:p_quotedText];

        unint64_t v69 = self->_style;
      }
      if (v69 == 47 && !self->_sizeClass)
      {
        unint64_t v701 = self->_platform;
        if (v701 <= 6) {
          p_quotedText = [[LPSize alloc] initWithSquareSize:dbl_1A3711D08[v701]];
        }
        v702 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v702 setFixedSize:p_quotedText];

        v703 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v703 setRequireFixedSize:0];

        v704 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v704 setScalingMode:1];

        v705 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v705 setFilter:13];

        v706 = [[LPPointUnit alloc] initWithValue:4.0];
        v707 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v707 setCornerRadius:v706];

        v708 = +[LPShadowStyle collaborationPreviewShadow];
        v709 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v709 setShadow:v708];

        v710 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v710 setCanAdjustVerticalPaddingForFixedSize:1];

        v711 = [[LPPointUnit alloc] initWithValue:0.5];
        v712 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v712 setBorderWidth:v711];

        v713 = [MEMORY[0x1E4FB1618] blackColor];
        v714 = [v713 colorWithAlphaComponent:0.3];
        v715 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v715 setBorderColor:v714];

        if (self->_platform != 5)
        {
          pt(275.0);
          p_quotedText = (LPSize *)objc_claimAutoreleasedReturnValue();
          [(LPCaptionBarStyle *)self->_captionBar setMinimumWidth:p_quotedText];

          unint64_t v719 = self->_platform;
          if (v719 > 6) {
            goto LABEL_264;
          }
          if (((1 << v719) & 0x5B) != 0)
          {
            v716 = &sharedObjectAutomaticIconOuterMargin_normalSize;
            v717 = (void *)sharedObjectAutomaticIconOuterMargin_normalSize;
            if (!sharedObjectAutomaticIconOuterMargin_normalSize)
            {
              double v718 = 12.0;
              goto LABEL_262;
            }
LABEL_263:
            p_quotedText = v717;
LABEL_264:
            v722 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
            v723 = [v722 margin];
            [v723 setLeading:p_quotedText];

            v724 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
            v725 = [v724 margin];
            [v725 setTop:p_quotedText];

            v726 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
            v727 = [v726 margin];
            [v727 setBottom:p_quotedText];

            if (self->_platform == 2) {
              v728 = [[LPSize alloc] initWithSquareSize:15.0];
            }
            else {
              v728 = [[LPSize alloc] initWithSquareSize:20.0];
            }
            v729 = [(LPCaptionBarStyle *)self->_captionBar leadingIconBadge];
            [v729 setFixedSize:v728];

            if (self->_platform == 5)
            {
              v730 = +[LPPointUnit zero];
              v731 = [(LPCaptionBarStyle *)self->_captionBar textStack];
              v732 = [v731 captionTextPadding];
              [v732 setLeading:v730];

              v733 = +[LPPointUnit zero];
              v734 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
              v735 = [v734 padding];
              [v735 setTrailing:v733];

              v736 = pt(12.0);
              v737 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
              v738 = [v737 margin];
              [v738 setTrailing:v736];
            }
            v739 = [(LPCaptionBarStyle *)self->_captionBar leadingIconBadge];
            v740 = [v739 fixedSize];
            v741 = [(LPCaptionBarStyle *)self->_captionBar trailingIconBadge];
            [v741 setFixedSize:v740];

            v742 = [(LPCaptionBarStyle *)self->_captionBar leadingIconBadge];
            v743 = [v742 fixedSize];
            v744 = [v743 width];
            [v744 value];
            double v746 = v745;
            v747 = [(LPCaptionBarStyle *)self->_captionBar leadingIconBadge];
            [v747 setOffset:v746 * 0.5 + -2.0];

            v748 = [(LPCaptionBarStyle *)self->_captionBar leadingIconBadge];
            [v748 offset];
            double v750 = v749;
            v751 = [(LPCaptionBarStyle *)self->_captionBar trailingIconBadge];
            [v751 setOffset:v750];

            v752 = fallbackIconSize(self->_platform);
            v753 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
            [v753 setFixedFallbackImageSize:v752];

            if (self->_hasButton)
            {
              v754 = [[LPPointUnit alloc] initWithValue:1.0];
              v755 = [(LPCaptionBarStyle *)self->_captionBar button];
              v756 = [v755 margin];
              [v756 setTop:v754];

              if (self->_platform == 5)
              {
                v757 = pt(12.0);
                v758 = [(LPCaptionBarStyle *)self->_captionBar button];
                v759 = [v758 margin];
                [v759 setLeading:v757];

                pt(20.0);
              }
              else
              {
                pt(16.0);
              v760 = };
              v761 = [(LPCaptionBarStyle *)self->_captionBar button];
              v762 = [v761 margin];
              [v762 setTrailing:v760];

              v763 = [[LPPointUnit alloc] initWithValue:12.0];
              v764 = [(LPCaptionBarStyle *)self->_captionBar button];
              v765 = [v764 margin];
              [v765 setBottom:v763];

              v766 = [[LPPointUnit alloc] initWithValue:3.0];
              v767 = [(LPCaptionBarStyle *)self->_captionBar button];
              [v767 setAdditionalVerticalPadding:v766];

              [(LPCaptionBarStyle *)self->_captionBar setUsesOutOfLineButton:1];
              [(LPCaptionBarStyle *)self->_captionBar setCanAddLineForButton:1];
              [(LPCaptionBarStyle *)self->_captionBar setButtonRespectsTextStackPadding:1];
              [(LPCaptionBarStyle *)self->_captionBar setPositionButtonRelativeToTextStack:1];
              [(LPCaptionBarStyle *)self->_captionBar setAlignButtonWithCaptionTextLeadingEdge:1];
              [(LPCaptionBarStyle *)self->_captionBar setExpandButtonToCaptionEdge:1];
              [(LPCaptionBarStyle *)self->_captionBar setButtonIgnoresTextSafeAreaInsets:1];
              v768 = [[LPPointUnit alloc] initWithValue:12.0];
              v769 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
              v770 = [v769 margin];
              [v770 setTop:v768];
            }
            v771 = +[LPPointUnit zero];
            v772 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
            v773 = [v772 margin];
            [v773 setBottom:v771];

            v774 = [[LPPointUnit alloc] initWithValue:8.0];
            v775 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
            v776 = [v775 padding];
            [v776 setBottom:v774];

            v777 = [[LPPointUnit alloc] initWithValue:9.0];
            v778 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
            v779 = [v778 separatorMargin];
            [v779 setBottom:v777];

            v780 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
            [v780 setUseFullWidthDuringSizing:0];

            v781 = [MEMORY[0x1E4FB1618] labelColor];
            v782 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
            v783 = [v782 options];
            [v783 setColor:v781];

            int64_t v784 = self->_platform;
            if (v784 == 5)
            {
              v785 = pt(11.0);
              v786 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
              [v786 setCornerRadius:v785];

              int64_t v784 = self->_platform;
            }
            v787 = [LPPointUnit alloc];
            double v788 = 25.0;
            if (v784 == 2) {
              double v788 = 20.0;
            }
            v789 = [(LPPointUnit *)v787 initWithValue:v788];
            v790 = [(LPCaptionBarStyle *)self->_captionBar textStack];
            [v790 setFirstLineLeading:v789];

            v791 = [[LPPointUnit alloc] initWithValue:11.0];
            v792 = [(LPCaptionBarStyle *)self->_captionBar textStack];
            [v792 setLastLineDescent:v791];

            goto LABEL_279;
          }
          if (v719 == 2)
          {
            v716 = &sharedObjectAutomaticIconOuterMargin_watchSize;
            v717 = (void *)sharedObjectAutomaticIconOuterMargin_watchSize;
            if (sharedObjectAutomaticIconOuterMargin_watchSize) {
              goto LABEL_263;
            }
            double v718 = 10.0;
            goto LABEL_262;
          }
        }
        v716 = &sharedObjectAutomaticIconOuterMargin_visionSize;
        v717 = (void *)sharedObjectAutomaticIconOuterMargin_visionSize;
        if (!sharedObjectAutomaticIconOuterMargin_visionSize)
        {
          double v718 = 14.0;
LABEL_262:
          v720 = [[LPPointUnit alloc] initWithValue:v718];
          v721 = (void *)*v716;
          uint64_t *v716 = (uint64_t)v720;

          v717 = (void *)*v716;
          goto LABEL_263;
        }
        goto LABEL_263;
      }
LABEL_279:
      if (self->_isFallbackIcon)
      {
        v793 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        applyFallbackIconProperties(v793, self->_platform, self->_style, self->_sizeClass);

        p_quotedText = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
        applyFallbackIconProperties(p_quotedText, self->_platform, self->_style, self->_sizeClass);
      }
      unint64_t v794 = self->_sizeClass;
      if (v794 == 5)
      {
        if (self->_platform == 5)
        {
          v795 = [[LPPointUnit alloc] initWithValue:11.0];
          cornerRadius = self->_cornerRadius;
          self->_cornerRadius = v795;
        }
        v797 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        [v797 applyToAllTextViewStyles:&__block_literal_global_1070];

        p_quotedText = (LPSize *)&self->_quotedText;
        [(LPQuotedTextViewStyle *)self->_quotedText setShowQuoteIndicator:0];
        v4 = (LPPointUnit *)[(LPQuotedTextViewStyle *)self->_quotedText setShowCharacterLimitIndicator:0];
        unint64_t v794 = self->_sizeClass;
      }
      if (v794 == 8)
      {
        unint64_t v798 = self->_platform;
        if (v798 > 6)
        {
LABEL_294:
          v803 = self->_cornerRadius;
          self->_cornerRadius = v4;

          unint64_t v804 = self->_platform;
          if (v804 > 6)
          {
LABEL_302:
            v810 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
            [v810 setFixedSize:p_quotedText];

            unint64_t v811 = self->_platform;
            if (v811 > 6) {
              goto LABEL_310;
            }
            if (((1 << v811) & 0x65) != 0)
            {
              v812 = &smallDetailedIconCornerRadius_normalSize;
              v813 = (void *)smallDetailedIconCornerRadius_normalSize;
              if (!smallDetailedIconCornerRadius_normalSize)
              {
                double v814 = 6.0;
LABEL_308:
                v815 = [[LPPointUnit alloc] initWithValue:v814];
                v816 = (void *)*v812;
                uint64_t *v812 = (uint64_t)v815;

                v813 = (void *)*v812;
              }
            }
            else
            {
              v812 = &smallDetailedIconCornerRadius_macSize;
              v813 = (void *)smallDetailedIconCornerRadius_macSize;
              if (!smallDetailedIconCornerRadius_macSize)
              {
                double v814 = 2.0;
                goto LABEL_308;
              }
            }
            p_quotedText = v813;
LABEL_310:
            v817 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
            [v817 setCornerRadius:p_quotedText];

            uint64_t v818 = adjustForStyle_smallDetailedIconMargin;
            if (!adjustForStyle_smallDetailedIconMargin)
            {
              v819 = [[LPPointUnit alloc] initWithValue:12.0];
              v820 = (void *)adjustForStyle_smallDetailedIconMargin;
              adjustForStyle_smallDetailedIconMargin = (uint64_t)v819;

              uint64_t v818 = adjustForStyle_smallDetailedIconMargin;
            }
            v821 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
            v822 = [v821 margin];
            [v822 setTrailing:v818];

            uint64_t v823 = adjustForStyle_smallDetailedIconMargin;
            v824 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
            v825 = [v824 margin];
            [v825 setTop:v823];

            uint64_t v826 = adjustForStyle_smallDetailedIconMargin;
            v827 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
            v828 = [v827 margin];
            [v828 setBottom:v826];

            v829 = [(LPCaptionBarStyle *)self->_captionBar trailingIcon];
            v830 = [v829 fixedSize];
            v831 = [(LPCaptionBarStyle *)self->_captionBar playButton];
            [v831 setSize:v830];

            v832 = [[LPPointUnit alloc] initWithValue:20.0];
            v833 = [(LPCaptionBarStyle *)self->_captionBar playButton];
            [v833 setGlyphSize:v832];

            uint64_t v834 = adjustForStyle_smallDetailedIconMargin;
            v835 = [(LPCaptionBarStyle *)self->_captionBar playButtonPadding];
            [v835 setTrailing:v834];

            uint64_t v836 = adjustForStyle_smallDetailedIconMargin;
            v837 = [(LPCaptionBarStyle *)self->_captionBar playButtonPadding];
            [v837 setTop:v836];

            uint64_t v838 = adjustForStyle_smallDetailedIconMargin;
            v839 = [(LPCaptionBarStyle *)self->_captionBar playButtonPadding];
            [v839 setBottom:v838];

            v840 = [(LPCaptionBarStyle *)self->_captionBar textStack];
            [v840 setMaximumNumberOfLines:3];

            [(LPCaptionBarStyle *)self->_captionBar setMinimumNumberOfLinesToVerticallyCenter:3];
            unint64_t v794 = self->_sizeClass;
            goto LABEL_313;
          }
          if (((1 << v804) & 0x65) != 0)
          {
            v805 = &smallDetailedIconSize_normalSize;
            v806 = (void *)smallDetailedIconSize_normalSize;
            if (!smallDetailedIconSize_normalSize)
            {
              double v807 = 48.0;
LABEL_300:
              v808 = [[LPSize alloc] initWithSquareSize:v807];
              v809 = (void *)*v805;
              uint64_t *v805 = (uint64_t)v808;

              v806 = (void *)*v805;
            }
          }
          else
          {
            v805 = &smallDetailedIconSize_macSize;
            v806 = (void *)smallDetailedIconSize_macSize;
            if (!smallDetailedIconSize_macSize)
            {
              double v807 = 42.0;
              goto LABEL_300;
            }
          }
          p_quotedText = v806;
          goto LABEL_302;
        }
        if (((1 << v798) & 0x65) != 0)
        {
          p_quotedText = (LPSize *)&smallDetailedCornerRadius_normalSize;
          Class v799 = (Class)smallDetailedCornerRadius_normalSize;
          if (!smallDetailedCornerRadius_normalSize)
          {
            double v800 = 16.0;
LABEL_292:
            v801 = [[LPPointUnit alloc] initWithValue:v800];
            Class isa = p_quotedText->super.isa;
            p_quotedText->super.Class isa = (Class)v801;

            Class v799 = p_quotedText->super.isa;
          }
        }
        else
        {
          p_quotedText = (LPSize *)&smallDetailedCornerRadius_macSize;
          Class v799 = (Class)smallDetailedCornerRadius_macSize;
          if (!smallDetailedCornerRadius_macSize)
          {
            double v800 = 12.0;
            goto LABEL_292;
          }
        }
        v4 = v799;
        goto LABEL_294;
      }
LABEL_313:
      if (v794 - 10 <= 2)
      {
        v841 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v841 setFilter:13];

        v842 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v842 setScalingMode:2];

        v843 = [[LPPointUnit alloc] initWithValue:5.0];
        v844 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v844 setCornerRadius:v843];

        v845 = +[LPPointUnit zero];
        v846 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        v847 = [v846 margin];
        [v847 setTrailing:v845];

        if (self->_platform == 5)
        {
          v848 = -[LPSize initWithSize:]([LPSize alloc], "initWithSize:", 0.0, 44.0);
          v849 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          [v849 setMinimumSize:v848];
        }
        v850 = +[LPPointUnit zero];
        v851 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        [v851 setFirstLineLeading:v850];

        v852 = +[LPPointUnit zero];
        v853 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        [v853 setLastLineDescent:v852];

        v854 = mediumOrLargeHorizontalFillColor(self->_platform);
        v855 = [(LPCaptionBarStyle *)self->_captionBar button];
        [v855 setBackgroundColor:v854];

        mediumOrLargeHorizontalForegroundColor(self->_platform);
        v856 = (LPPointUnit *)objc_claimAutoreleasedReturnValue();
        v857 = [(LPCaptionBarStyle *)self->_captionBar button];
        [v857 setForegroundColor:v856];

        unint64_t v858 = self->_platform;
        if (v858 <= 6) {
          v856 = [[LPPointUnit alloc] initWithValue:dbl_1A3711D40[v858]];
        }
        [(LPContactsBadgeStyle *)self->_contactsBadgeStyle setSize:v856];

        [(LPContactsBadgeStyle *)self->_contactsBadgeStyle setMargin:0.0];
        [(LPContactsBadgeStyle *)self->_contactsBadgeStyle setUseShadow:0];
        [(LPContactsBadgeStyle *)self->_contactsBadgeStyle setLocation:1];
        if (self->_isFallbackIcon)
        {
          v859 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          [v859 setFilter:11];

          v860 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          [v860 setScalingMode:3];
        }
      }
      unint64_t v861 = self->_sizeClass;
      if ((v861 & 0xFFFFFFFFFFFFFFFELL) == 0xA)
      {
        if (self->_platform == 5)
        {
          v862 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
          v863 = self->_backgroundColor;
          self->_backgroundColor = v862;

          unint64_t v861 = self->_sizeClass;
        }
        if (v861 == 10)
        {
          v864 = [[LPPointUnit alloc] initWithValue:10.0];
          v865 = [(LPCaptionBarStyle *)self->_captionBar button];
          v866 = [v865 margin];
          [v866 setTrailing:v864];

          v867 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          [v867 setScalesToFitParent:1];

          if ([(LPLinkRendererSizeClassParameters *)self->_sizeClassParameters preserveIconAspectRatioAndAlignmentWhenScaling])
          {
            v868 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
            [v868 setScalingMode:1];

            v869 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
            [v869 setPreservesEdgeAlignmentWhenScaling:1];
          }
          v870 = fallbackIconSize(self->_platform);
          v871 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          [v871 setFixedFallbackImageSize:v870];

          uint64_t v872 = adjustForStyle_leadingOuterMargin;
          if (!adjustForStyle_leadingOuterMargin)
          {
            v873 = [[LPPointUnit alloc] initWithValue:16.0];
            v874 = (void *)adjustForStyle_leadingOuterMargin;
            adjustForStyle_leadingOuterMargin = (uint64_t)v873;

            uint64_t v872 = adjustForStyle_leadingOuterMargin;
          }
          v875 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          v876 = [v875 margin];
          [v876 setLeading:v872];

          uint64_t v877 = adjustForStyle_leadingOuterMargin;
          v878 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          v879 = [v878 margin];
          [v879 setTop:v877];

          uint64_t v880 = adjustForStyle_leadingOuterMargin;
          v881 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          v882 = [v881 margin];
          [v882 setBottom:v880];

          v883 = outerHorizontalTextMargin(self->_platform);
          v884 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          v885 = [v884 captionTextPadding];
          [v885 setLeading:v883];

          uint64_t v886 = adjustForStyle_leadingOuterMargin;
          v887 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          v888 = [v887 captionTextPadding];
          [v888 setTop:v886];

          v889 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          [v889 setMaximumNumberOfLines:0];

          [(LPCaptionBarStyle *)self->_captionBar setMinimumNumberOfLinesToVerticallyCenter:0xFFFFFFFFLL];
          [(LPCaptionBarStyle *)self->_captionBar setUsesOutOfLineButton:1];
          if (self->_isFallbackIcon)
          {
            v890 = mediumOrLargeHorizontalForegroundColor(self->_platform);
            v891 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
            [v891 setMaskColor:v890];

            v892 = mediumOrLargeHorizontalFillColor(self->_platform);
            v893 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
            [v893 setBackgroundColor:v892];
          }
          unint64_t v861 = self->_sizeClass;
        }
      }
      if (v861 == 11)
      {
        v914 = [[LPPointUnit alloc] initWithValue:10.0];
        v915 = [(LPCaptionBarStyle *)self->_captionBar button];
        v916 = [v915 margin];
        [v916 setTrailing:v914];

        v917 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v917 setScalesToFitParent:1];

        if (self->_platform == 5) {
          double v918 = 56.0;
        }
        else {
          double v918 = 42.0;
        }
        v919 = [[LPSize alloc] initWithSquareSize:v918];
        v920 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v920 setFixedSize:v919];

        v921 = [[LPPointUnit alloc] initWithValue:v918];
        v922 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v922 setFixedFallbackImageSize:v921];

        v923 = fontWithTraits((void *)*MEMORY[0x1E4FB28C8], 0, self->_sizeClass);
        v924 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v924 setFixedFallbackImageFont:v923];

        v925 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v925 setFixedFallbackImageScale:&unk_1EF712798];

        if (self->_platform == 5)
        {
          [(LPContactsBadgeStyle *)self->_contactsBadgeStyle setIconOffset:-8.0];
          v926 = [[LPPointUnit alloc] initWithValue:6.0];
          v927 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          [v927 setCornerRadius:v926];

          v928 = [[LPPointUnit alloc] initWithValue:16.0];
          v929 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          v930 = [v929 margin];
          [v930 setLeading:v928];

          v931 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          v932 = [v931 margin];
          [v932 setTop:v928];

          v933 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          v934 = [v933 margin];
          [v934 setBottom:v928];

          v935 = [[LPPointUnit alloc] initWithValue:12.0];
          v936 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          v937 = [v936 captionTextPadding];
          [v937 setLeading:v935];
        }
        else
        {
          v938 = [[LPPointUnit alloc] initWithValue:14.0];
          v939 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          v940 = [v939 margin];
          [v940 setLeading:v938];

          v941 = [[LPPointUnit alloc] initWithValue:9.0];
          v942 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          v943 = [v942 margin];
          [v943 setTop:v941];

          v944 = [[LPPointUnit alloc] initWithValue:9.0];
          v945 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          v946 = [v945 margin];
          [v946 setBottom:v944];

          v928 = [[LPPointUnit alloc] initWithValue:10.0];
          v935 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          v936 = [(LPPointUnit *)v935 captionTextPadding];
          [v936 setLeading:v928];
        }

        v947 = [[LPPointUnit alloc] initWithValue:13.0];
        v948 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v949 = [v948 captionTextPadding];
        [v949 setTop:v947];

        v950 = [[LPPointUnit alloc] initWithValue:13.0];
        v951 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v952 = [v951 captionTextPadding];
        [v952 setBottom:v950];

        v953 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        [v953 setMaximumNumberOfLines:2];

        v954 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        [v954 setShouldAlignToBaselines:0];

        v955 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        [v955 applyToAllTextViewStyles:&__block_literal_global_1080];

        if (self->_isFallbackIcon)
        {
          v956 = [MEMORY[0x1E4FB1618] whiteColor];
          v957 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          [v957 setMaskColor:v956];

          v958 = mediumOrLargeHorizontalFillColor(self->_platform);
          v959 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          [v959 setBackgroundColor:v958];
        }
      }
      else if (v861 == 12)
      {
        v894 = [MEMORY[0x1E4FB1618] clearColor];
        v895 = self->_backgroundColor;
        self->_backgroundColor = v894;

        v896 = [[LPPointUnit alloc] initWithValue:428.0];
        v897 = self->_maximumWidth;
        self->_maximumWidth = v896;

        v898 = fallbackIconSize(self->_platform);
        v899 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v899 setFixedFallbackImageSize:v898];

        v900 = +[LPPointUnit zero];
        v901 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        v902 = [v901 margin];
        [v902 setLeading:v900];

        v903 = cardHeadingVerticalIconMargin((void *)self->_platform, self->_sizeClassParameters);
        v904 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        v905 = [v904 margin];
        [v905 setTop:v903];

        v906 = cardHeadingVerticalIconMargin((void *)self->_platform, self->_sizeClassParameters);
        v907 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        v908 = [v907 margin];
        [v908 setBottom:v906];

        v909 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v909 setRequireFixedSize:1];

        v910 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        [v910 setVerticalAlignment:1];

        BOOL v911 = [(LPLinkRendererSizeClassParameters *)self->_sizeClassParameters alignButtonWithCaptionTextLeadingEdge];
        int64_t v913 = self->_platform;
        if (v911)
        {
          if (v913 == 5)
          {
            largeCardHeadingIconSize(5, v912);
            v973 = (LPSize *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v973 = [[LPSize alloc] initWithSquareSize:60.0];
          }
          v974 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          [v974 setFixedSize:v973];

          if (!self->_isFallbackIcon)
          {
            v975 = pt(4.0);
            v976 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
            [v976 setCornerRadius:v975];

            if (self->_platform != 5)
            {
              v977 = +[LPShadowStyle collaborationPreviewShadow];
              v978 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
              [v978 setShadow:v977];
            }
            unint64_t v979 = self->_style;
            if (v979 <= 0x2F && ((1 << v979) & 0x800200010000) != 0)
            {
              v980 = pt(0.5);
              v981 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
              [v981 setBorderWidth:v980];

              v982 = [MEMORY[0x1E4FB1618] blackColor];
              v983 = [v982 colorWithAlphaComponent:0.3];
              v984 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
              [v984 setBorderColor:v983];
            }
          }
          if (self->_hasButton)
          {
            [(LPCaptionBarStyle *)self->_captionBar setButtonRespectsTextStackPadding:1];
            v985 = [[LPPointUnit alloc] initWithValue:191.0];
            v986 = [(LPCaptionBarStyle *)self->_captionBar button];
            [v986 setMenuMinimumWidth:v985];

            v987 = [[LPPointUnit alloc] initWithValue:1.0];
            v988 = [(LPCaptionBarStyle *)self->_captionBar button];
            [v988 setAdditionalVerticalPadding:v987];

            v989 = [(LPCaptionBarStyle *)self->_captionBar button];
            [v989 setShowsChevronForSingleAction:1];

            v990 = self->_captionBar;
            if (self->_platform == 5)
            {
              v991 = [(LPCaptionBarStyle *)v990 button];
              [v991 setUseSegmentedControl:1];

              v992 = pt(11.0);
              v993 = [(LPCaptionBarStyle *)self->_captionBar button];
              v994 = [v993 padding];
              [v994 setTop:v992];

              v995 = +[LPPointUnit zero];
              v996 = [(LPCaptionBarStyle *)self->_captionBar button];
              v997 = [v996 margin];
              [v997 setTrailing:v995];

              v998 = +[LPPointUnit zero];
              v999 = [(LPCaptionBarStyle *)self->_captionBar button];
              v1000 = [v999 margin];
              [v1000 setLeading:v998];

              [(LPCaptionBarStyle *)self->_captionBar setAddFullWidthLineForButton:1];
              [(LPCaptionBarStyle *)self->_captionBar setUsesOutOfLineButton:1];
              [(LPCaptionBarStyle *)self->_captionBar setButtonIgnoresTextSafeAreaInsets:1];
            }
            else
            {
              [(LPCaptionBarStyle *)v990 setPositionButtonRelativeToTextStack:1];
            }
          }
          if (self->_platform == 5)
          {
            v1009 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
            [v1009 setUseFullWidth:1];

            v1010 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
            v1011 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
            [v1011 setBackgroundColor:v1010];

            v1012 = pt(14.0);
            v1013 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
            v1014 = [v1013 margin];
            [v1014 setTop:v1012];

            v1015 = +[LPPointUnit zero];
            v1016 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
            v1017 = [v1016 margin];
            [v1017 setBottom:v1015];

            v1018 = pt(14.0);
            v1019 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
            [v1019 setCornerRadius:v1018];

            v1020 = pt(23.0);
            v1021 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
            v1022 = [v1021 padding];
            [v1022 setBottom:v1020];

            v1023 = pt(27.0);
            v1024 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
            v1025 = [v1024 padding];
            [v1025 setLeading:v1023];

            v1026 = pt(27.0);
            v1027 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
            v1028 = [v1027 padding];
            [v1028 setTrailing:v1026];

            [(LPCaptionBarStyle *)self->_captionBar setMinimumNumberOfLinesToVerticallyCenter:1];
            v1007 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
            [v1007 setVerticalAlignment:3];
LABEL_370:

            applyCommonCardHeadingCaptionBarProperties(self->_captionBar, self->_platform, self->_style, self->_sizeClass, self->_isFallbackIcon);
            if (!adjustForStyle_outerMargin)
            {
              v1029 = [[LPPointUnit alloc] initWithValue:16.0];
              v1030 = (void *)adjustForStyle_outerMargin;
              adjustForStyle_outerMargin = (uint64_t)v1029;
            }
            if (self->_hasButton)
            {
              if (![(LPCaptionBarStyle *)self->_captionBar addFullWidthLineForButton])
              {
                uint64_t v1031 = adjustForStyle_outerMargin;
                v1032 = [(LPCaptionBarStyle *)self->_captionBar button];
                v1033 = [v1032 margin];
                [v1033 setLeading:v1031];
              }
              if ([(LPLinkRendererSizeClassParameters *)self->_sizeClassParameters alignButtonWithCaptionTextLeadingEdge])
              {
                v1034 = +[LPPointUnit zero];
              }
              else
              {
                v1034 = [[LPPointUnit alloc] initWithValue:10.0];
              }
              v1035 = v1034;
              v1036 = [(LPCaptionBarStyle *)self->_captionBar button];
              v1037 = [v1036 margin];
              [v1037 setTop:v1035];

              v1038 = +[LPPointUnit zero];
              v1039 = [(LPCaptionBarStyle *)self->_captionBar button];
              v1040 = [v1039 margin];
              [v1040 setTrailing:v1038];

              v1041 = [MEMORY[0x1E4FB1618] clearColor];
              v1042 = [(LPCaptionBarStyle *)self->_captionBar button];
              [v1042 setMenuBackgroundColor:v1041];

              v1043 = +[LPPointUnit zero];
              v1044 = [(LPCaptionBarStyle *)self->_captionBar button];
              [v1044 setHeight:v1043];

              v1045 = [(LPCaptionBarStyle *)self->_captionBar button];
              [v1045 setIgnoresInvertColors:1];

              v1046 = [(LPCaptionBarStyle *)self->_captionBar button];
              [v1046 setEnableUserInteractionForDecorativeButton:0];

              if (self->_platform == 5)
              {
                v1047 = +[LPPointUnit zero];
                v1048 = [(LPCaptionBarStyle *)self->_captionBar button];
                v1049 = [v1048 margin];
                [v1049 setTop:v1047];

                v1050 = +[LPPointUnit zero];
                v1051 = [(LPCaptionBarStyle *)self->_captionBar button];
                v1052 = [v1051 margin];
                [v1052 setBottom:v1050];
              }
              else
              {
                uint64_t v1053 = adjustForStyle_outerMargin;
                v1050 = [(LPCaptionBarStyle *)self->_captionBar button];
                v1051 = [v1050 margin];
                [v1051 setBottom:v1053];
              }
            }
            if (self->_platform == 5)
            {
              v1054 = +[LPPointUnit zero];
              v1055 = [(LPCaptionBarStyle *)self->_captionBar textStack];
              v1056 = [v1055 captionTextPadding];
              [v1056 setTop:v1054];

              v1057 = +[LPPointUnit zero];
              v1058 = [(LPCaptionBarStyle *)self->_captionBar textStack];
              v1059 = [v1058 captionTextPadding];
              [v1059 setBottom:v1057];

              v1060 = +[LPPointUnit zero];
              v1061 = [(LPCaptionBarStyle *)self->_captionBar textStack];
              [v1061 setLastLineDescent:v1060];
            }
            else
            {
              uint64_t v1062 = adjustForStyle_outerMargin;
              v1060 = [(LPCaptionBarStyle *)self->_captionBar textStack];
              v1061 = [v1060 captionTextPadding];
              [v1061 setTop:v1062];
            }

            v1063 = [(LPCaptionBarStyle *)self->_captionBar textStack];
            [v1063 applyToAllTextViewStyles:&__block_literal_global_1073];

            v1064 = [MEMORY[0x1E4FB1618] labelColor];
            v1065 = [(LPCaptionBarStyle *)self->_captionBar textStack];
            v1066 = [v1065 topCaption];
            v1067 = [v1066 leading];
            [v1067 setColor:v1064];

            v1068 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
            v1069 = [(LPCaptionBarStyle *)self->_captionBar textStack];
            v1070 = [v1069 bottomCaption];
            v1071 = [v1070 leading];
            [v1071 setColor:v1068];

            v1072 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
            v1073 = [(LPCaptionBarStyle *)self->_captionBar textStack];
            v1074 = [v1073 belowBottomCaption];
            v1075 = [v1074 leading];
            [v1075 setColor:v1072];

            LOBYTE(v1074) = UIContentSizeCategoryCompareToCategory(self->_preferredContentSizeCategory, (UIContentSizeCategory)*MEMORY[0x1E4FB27C0]) != NSOrderedAscending;
            v1076 = [(LPCaptionBarStyle *)self->_captionBar textStack];
            v1102[0] = MEMORY[0x1E4F143A8];
            v1102[1] = 3221225472;
            v1102[2] = __25__LPTheme_adjustForStyle__block_invoke_3_1074;
            v1102[3] = &__block_descriptor_33_e25_v16__0__LPTextViewStyle_8l;
            char v1103 = (char)v1074;
            [v1076 applyToAllTextViewStyles:v1102];

            v1077 = [(LPCaptionBarStyle *)self->_captionBar textStack];
            v1078 = [v1077 topCaption];
            v1100[0] = MEMORY[0x1E4F143A8];
            v1100[1] = 3221225472;
            v1100[2] = __25__LPTheme_adjustForStyle__block_invoke_4_1075;
            v1100[3] = &__block_descriptor_33_e25_v16__0__LPTextViewStyle_8l;
            char v1101 = (char)v1074;
            [v1078 applyToAllTextViewStyles:v1100];

            if (self->_hasButton)
            {
              if (self->_platform != 5
                || ![(LPLinkRendererSizeClassParameters *)self->_sizeClassParameters alignButtonWithCaptionTextLeadingEdge])
              {
                [(LPCaptionBarStyle *)self->_captionBar setMinimumNumberOfLinesToVerticallyCenter:0xFFFFFFFFLL];
              }
              [(LPCaptionBarStyle *)self->_captionBar setUsesOutOfLineButton:1];
              [(LPCaptionBarStyle *)self->_captionBar setCanAddLineForButton:1];
              [(LPCaptionBarStyle *)self->_captionBar setButtonIgnoresTextSafeAreaInsets:1];
              if ([(LPLinkRendererSizeClassParameters *)self->_sizeClassParameters alignButtonWithCaptionTextLeadingEdge])
              {
                [(LPCaptionBarStyle *)self->_captionBar setAlignButtonWithCaptionTextLeadingEdge:1];
              }
            }
            v1079 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
            [v1079 setShowSeparator:0];

            if (self->_platform == 5)
            {
              v1080 = [[LPPointUnit alloc] initWithValue:11.0];
              v1081 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
              v1082 = [v1081 margin];
              [v1082 setTop:v1080];

              v1083 = [[LPPointUnit alloc] initWithValue:22.0];
              v1084 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
              v1085 = [v1084 margin];
              [v1085 setBottom:v1083];

              v1086 = [[LPPointUnit alloc] initWithValue:22.0];
              v1087 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
              v1088 = [v1087 padding];
              [v1088 setTop:v1086];

              v1089 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
              [v1089 setIgnoreSafeAreaInset:1];
            }
            else
            {
              v1090 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
              [v1090 setUseFullWidth:0];

              v1091 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
              [v1091 setUseInlineIndicator:1];

              v1092 = [[LPPointUnit alloc] initWithValue:10.0];
              v1093 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
              v1094 = [v1093 margin];
              [v1094 setTop:v1092];

              v1095 = [[LPPointUnit alloc] initWithValue:13.0];
              v1096 = [(LPCaptionBarStyle *)self->_captionBar collaborationFooter];
              v1097 = [v1096 margin];
              [v1097 setBottom:v1095];
            }
            return;
          }
          v1007 = pt(11.0);
          v1008 = [(LPCaptionBarStyle *)self->_captionBar textStack];
          [v1008 setLastLineDescent:v1007];
        }
        else
        {
          if (v913 == 5)
          {
            cardHeadingIconSize(5uLL, v912);
            id v972 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v1001 = (void *)largeCardHeadingReducedIconSize_normalSize;
            if (!largeCardHeadingReducedIconSize_normalSize)
            {
              v1002 = [[LPSize alloc] initWithSquareSize:72.0];
              v1003 = (void *)largeCardHeadingReducedIconSize_normalSize;
              largeCardHeadingReducedIconSize_normaldouble Size = (uint64_t)v1002;

              v1001 = (void *)largeCardHeadingReducedIconSize_normalSize;
            }
            id v972 = v1001;
          }
          v1004 = v972;
          v1005 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          [v1005 setMinimumSize:v1004];

          v1007 = largeCardHeadingIconSize(self->_platform, v1006);
          v1008 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
          [v1008 setFixedSize:v1007];
        }

        goto LABEL_370;
      }
      v1099[0] = MEMORY[0x1E4F143A8];
      v1099[1] = 3221225472;
      v1099[2] = __25__LPTheme_adjustForStyle__block_invoke_2_1081;
      v1099[3] = &unk_1E5B06488;
      v1099[4] = self;
      if (__25__LPTheme_adjustForStyle__block_invoke_2_1081((uint64_t)v1099))
      {
        v960 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        v961 = [v960 margin];
        v962 = [v961 leading];
        [v962 value];
        double v964 = v963;
        v965 = [(LPCaptionBarStyle *)self->_captionBar textStack];
        v966 = [v965 captionTextPadding];
        v967 = [v966 leading];
        [v967 value];
        v969 = [[LPPointUnit alloc] initWithValue:v964 - v968];
        v970 = [(LPCaptionBarStyle *)self->_captionBar leadingIcon];
        v971 = [v970 margin];
        [v971 setTrailing:v969];
      }
      return;
  }
}

void __25__LPTheme_adjustForStyle__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [v7 setMaximumLines:1];
  id v3 = [MEMORY[0x1E4FB1618] labelColor];
  [v7 setColor:v3];

  unint64_t v4 = *(void *)(*(void *)(a1 + 32) + 32);
  if (v4 <= 6 && ((0x75u >> v4) & 1) != 0)
  {
    uint64_t v5 = fontWithTraits(**((void ***)&unk_1E5B06540 + v4), 0, 1);
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4FB1798] systemFontOfSize:11.0 weight:*MEMORY[0x1E4FB29C8]];
  }
  v6 = (void *)v5;
  [v7 setFont:v5];
}

void __25__LPTheme_adjustForStyle__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  LODWORD(v4) = 1036831949;
  if (!*(unsigned char *)(a1 + 32)) {
    *(float *)&double v4 = 0.0;
  }
  id v7 = v3;
  [v3 setHyphenationFactor:v4];
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  [v7 setMaximumLines:v5];
  v6 = +[LPPointUnit zero];
  [v7 setFirstLineLeading:v6];

  [v7 setMaximumLineCountScalingBehavior:0];
}

void __25__LPTheme_adjustForStyle__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  id v6 = v3;
  [v3 setMaximumLines:v4];
  uint64_t v5 = +[LPPointUnit zero];
  [v6 setFirstLineLeading:v5];

  [v6 setMaximumLineCountScalingBehavior:0];
}

uint64_t __25__LPTheme_adjustForStyle__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setColor:*(void *)(a1 + 32)];
}

uint64_t __25__LPTheme_adjustForStyle__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 setColor:*(void *)(a1 + 32)];
}

uint64_t __25__LPTheme_adjustForStyle__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 setColor:*(void *)(a1 + 32)];
}

uint64_t __25__LPTheme_adjustForStyle__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 setColor:*(void *)(a1 + 32)];
}

void __25__LPTheme_adjustForStyle__block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setMaximumLines:1];
  unint64_t v2 = +[LPPointUnit zero];
  [v3 setFirstLineLeading:v2];

  [v3 setMaximumLineCountScalingBehavior:0];
}

void __25__LPTheme_adjustForStyle__block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setMaximumLines:1];
  unint64_t v2 = +[LPPointUnit zero];
  [v3 setFirstLineLeading:v2];

  [v3 setMaximumLineCountScalingBehavior:0];
}

void __25__LPTheme_adjustForStyle__block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (+[LPTestingOverrides forceMonospaceFonts]) {
    [MEMORY[0x1E4FB1798] monospacedSystemFontOfSize:11.0 weight:*MEMORY[0x1E4FB29C0]];
  }
  else {
  unint64_t v2 = fontWithTraits((void *)*MEMORY[0x1E4FB28F0], 32770, 7);
  }
  [v3 setFont:v2];
}

void __25__LPTheme_adjustForStyle__block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (+[LPTestingOverrides forceMonospaceFonts]) {
    [MEMORY[0x1E4FB1798] monospacedSystemFontOfSize:11.0 weight:*MEMORY[0x1E4FB29C0]];
  }
  else {
  unint64_t v2 = fontWithTraits((void *)*MEMORY[0x1E4FB28F0], 0x8000, 7);
  }
  [v3 setFont:v2];
}

void __25__LPTheme_adjustForStyle__block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setMaximumLines:1];
  [v3 setColor:*(void *)(a1 + 32)];
}

void __25__LPTheme_adjustForStyle__block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v2 = [MEMORY[0x1E4FB1618] whiteColor];
  [v3 setColor:v2];
}

void __25__LPTheme_adjustForStyle__block_invoke_1068(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setMaximumLines:1];
  [v2 setMaximumLineCountScalingBehavior:1];
}

void __25__LPTheme_adjustForStyle__block_invoke_2_1071(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = +[LPPointUnit zero];
  [v3 setFirstLineLeading:v2];
}

void __25__LPTheme_adjustForStyle__block_invoke_3_1074(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  id v5 = v3;
  [v3 setMaximumLines:v4];
  [v5 setMaximumLineCountScalingBehavior:0];
}

uint64_t __25__LPTheme_adjustForStyle__block_invoke_4_1075(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = 1036831949;
  if (!*(unsigned char *)(a1 + 32)) {
    *(float *)&a3 = 0.0;
  }
  return [a2 setHyphenationFactor:a3];
}

void __25__LPTheme_adjustForStyle__block_invoke_1078(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = +[LPPointUnit zero];
  [v3 setFirstLineLeading:v2];
}

uint64_t __25__LPTheme_adjustForStyle__block_invoke_2_1081(uint64_t a1)
{
  uint64_t result = stylePrefersLeadingIcon(*(void *)(*(void *)(a1 + 32) + 8));
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 8);
    return v4 != 3 && (v4 != 47 || *(void *)(v3 + 32) != 5);
  }
  return result;
}

+ (void)addClient:(id)a3
{
  id v4 = a3;
  uint64_t v3 = +[LPThemeParametersObserver shared];
  [v3 addClient:v4];
}

+ (void)removeClient:(id)a3
{
  id v4 = a3;
  uint64_t v3 = +[LPThemeParametersObserver shared];
  [v3 removeClient:v4];
}

+ (int64_t)platformForView:(id)a3
{
  return 0;
}

- (id)valueForUndefinedKey:(id)a3
{
  return 0;
}

- (id)valueForThemeProperty:(id)a3
{
  id v4 = [a3 stringByReplacingOccurrencesOfString:@"-" withString:@"."];
  id v5 = [(LPTheme *)self valueForKeyPath:v4];

  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)CSSTextForThemeProperty:(id)a3
{
  id v4 = a3;
  id v5 = [(LPTheme *)self valueForThemeProperty:v4];
  if (v5)
  {
    id v6 = [(LPTheme *)self CSSTextForProperty:v4 withValue:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)CSSTextForProperty:(id)a3 withValue:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v12 = v5;
    id v7 = objc_msgSend(v6, "_lp_CSSText");
    v13[0] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  }
  else
  {
    id v10 = v5;
    id v11 = v6;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  }

  return v8;
}

+ (id)iconPlatterPaddingForReason:(int64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v3 = [LPPointUnit alloc];
    double v4 = 20.0;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    uint64_t v3 = [LPPointUnit alloc];
    double v4 = 26.0;
LABEL_5:
    id v5 = [(LPPointUnit *)v3 initWithValue:v4];
    goto LABEL_7;
  }
  id v5 = +[LPPointUnit zero];
LABEL_7:

  return v5;
}

+ (id)iconPlatterCornerRadius
{
  id v2 = [[LPPointUnit alloc] initWithValue:1.5];

  return v2;
}

+ (id)defaultBackgroundColorForPlatform:(int64_t)a3
{
  return defaultBackgroundColor(a3);
}

- (LPPointUnit)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
}

- (LPAppearanceDependentValue)highlightCompositingFilter
{
  return self->_highlightCompositingFilter;
}

- (void)setHighlightCompositingFilter:(id)a3
{
}

- (int64_t)backgroundMaterial
{
  return self->_backgroundMaterial;
}

- (void)setBackgroundMaterial:(int64_t)a3
{
  self->_backgroundMaterial = a3;
}

- (LPCaptionBarStyle)captionBar
{
  return self->_captionBar;
}

- (LPQuotedTextViewStyle)quotedText
{
  return self->_quotedText;
}

- (LPImageViewStyle)mediaImage
{
  return self->_mediaImage;
}

- (LPImageViewStyle)placeholderImage
{
  return self->_placeholderImage;
}

- (LPVisualMediaViewStyle)mediaVideo
{
  return self->_mediaVideo;
}

- (UIColor)mediaBackgroundColor
{
  return self->_mediaBackgroundColor;
}

- (void)setMediaBackgroundColor:(id)a3
{
}

- (LPCaptionBarStyle)mediaTopCaptionBar
{
  return self->_mediaTopCaptionBar;
}

- (LPCaptionBarStyle)mediaBottomCaptionBar
{
  return self->_mediaBottomCaptionBar;
}

- (LPTapToLoadViewStyle)tapToLoad
{
  return self->_tapToLoad;
}

- (UIFont)domainNameIndicatorFont
{
  return self->_domainNameIndicatorFont;
}

- (UIFont)domainNameIndicatorIconFont
{
  return self->_domainNameIndicatorIconFont;
}

- (LPImageViewStyle)backgroundImage
{
  return self->_backgroundImage;
}

- (LPContactsBadgeStyle)contactsBadgeStyle
{
  return self->_contactsBadgeStyle;
}

- (LPIndeterminateProgressSpinnerStyle)progressSpinner
{
  return self->_progressSpinner;
}

- (LPPointUnit)maximumWidth
{
  return self->_maximumWidth;
}

- (void)setMaximumWidth:(id)a3
{
}

- (double)widthFractionForTallMedia
{
  return self->_widthFractionForTallMedia;
}

- (void)setWidthFractionForTallMedia:(double)a3
{
  self->_widthFractionForTallMedia = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumWidth, 0);
  objc_storeStrong((id *)&self->_progressSpinner, 0);
  objc_storeStrong((id *)&self->_contactsBadgeStyle, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_domainNameIndicatorIconFont, 0);
  objc_storeStrong((id *)&self->_domainNameIndicatorFont, 0);
  objc_storeStrong((id *)&self->_tapToLoad, 0);
  objc_storeStrong((id *)&self->_mediaBottomCaptionBar, 0);
  objc_storeStrong((id *)&self->_mediaTopCaptionBar, 0);
  objc_storeStrong((id *)&self->_mediaBackgroundColor, 0);
  objc_storeStrong((id *)&self->_mediaVideo, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_mediaImage, 0);
  objc_storeStrong((id *)&self->_quotedText, 0);
  objc_storeStrong((id *)&self->_captionBar, 0);
  objc_storeStrong((id *)&self->_highlightCompositingFilter, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_cornerRadius, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);

  objc_storeStrong((id *)&self->_sizeClassParameters, 0);
}

+ (void)invalidateThemeCache
{
  id v2 = +[LPThemeParametersObserver shared];
  [v2 didChangeThemeParameters];
}

@end