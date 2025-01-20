@interface GKTextStyle
+ (double)scaledValueFromHISpecLeading:(double)a3 forFontTextStyle:(id)a4;
+ (double)standardFontSize;
+ (double)standardLeadingForFontTextStyle:(id)a3;
+ (id)attributedString:(id)a3 byReplayingFromBaseStyle:(id)a4 systemContentSizeDidChange:(BOOL)a5;
+ (id)textStyle;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsParagraphStyle;
- (BOOL)overrideUIKitFontSize;
- (GKColorPalette)palette;
- (GKTextStyle)init;
- (GKTextStyle)styleWithName:(id)a3 fallback:(id)a4 layoutMode:(int)a5;
- (NSString)UIKitFontTextStyleName;
- (NSString)fontName;
- (SEL)fontNameRebaseSelector;
- (SEL)fontSizeRebaseSelector;
- (UIColor)color;
- (double)fontSize;
- (double)m34;
- (double)minimumLineHeight;
- (double)zPosition;
- (id)achievementLeaderboardPointsText;
- (id)achievementLeaderboardRank;
- (id)achievementValueText;
- (id)alignment:(int64_t)a3 lineBreakMode:(int64_t)a4;
- (id)attributes;
- (id)bannerMessage;
- (id)bannerShortTitle;
- (id)bannerTitle;
- (id)baseFontRebaseSelector;
- (id)body;
- (id)bold;
- (id)buttonTitle;
- (id)buyButtonTitle;
- (id)callout;
- (id)caption;
- (id)caption1;
- (id)caption2;
- (id)cellActionItem;
- (id)centered;
- (id)challengeText;
- (id)challengeTitleText;
- (id)composeFields;
- (id)composeMessage;
- (id)copy;
- (id)copyWithBaseClass:(Class)a3;
- (id)description;
- (id)detailSecondaryHeaderText;
- (id)emphasized;
- (id)emphasizedOnDarkBackground;
- (id)footnote;
- (id)friendCaptionColor;
- (id)friendColor;
- (id)gameDetailNameText;
- (id)header0;
- (id)header1;
- (id)header2;
- (id)header3;
- (id)header4;
- (id)headerViewSubText1;
- (id)headline;
- (id)info;
- (id)initEmpty;
- (id)leaderboardRankLarge;
- (id)leaderboardRankMedium;
- (id)leaderboardRankSmall;
- (id)light;
- (id)lineBreakMode:(int64_t)a3;
- (id)lineHeight:(double)a3;
- (id)localPlayerColor;
- (id)medium;
- (id)multiplayerAddText;
- (id)multiplayerFooterText;
- (id)multiplayerHeaderText;
- (id)multiplayerNameText;
- (id)multiplayerStatusText;
- (id)regular;
- (id)remoteUIDetailLabel:(int)a3;
- (id)remoteUIEditField:(int)a3;
- (id)remoteUIEditLabel:(int)a3;
- (id)remoteUILabel:(int)a3;
- (id)remoteUINickNameField:(int)a3;
- (id)remoteUINickNameLabel:(int)a3;
- (id)remoteUISectionFooter:(int)a3;
- (id)remoteUISectionHeader:(int)a3;
- (id)remoteUISelectField:(int)a3;
- (id)remoteUISelectLabel:(int)a3;
- (id)remoteUITableFooterButton:(int)a3;
- (id)remoteUITableHeaderButton:(int)a3;
- (id)remoteUITableHeaderLabel:(int)a3;
- (id)remoteUITableHeaderSubLabel:(int)a3;
- (id)removeButtonTitle;
- (id)replayOnBaseStyle:(id)a3 systemContentSizeDidChange:(BOOL)a4;
- (id)resolveFontAndLineSpacing:(double *)a3;
- (id)roundButtonTitle;
- (id)scaled:(double)a3;
- (id)scaledForM34:(double)a3 zPosition:(double)a4;
- (id)sectionCaption;
- (id)sectionCaptionSmall;
- (id)sectionHeader;
- (id)selectedBuyButtonTitle;
- (id)settingsBoldButton;
- (id)settingsButton;
- (id)settingsFooter;
- (id)settingsHeader;
- (id)settingsLabel;
- (id)settingsLinkText;
- (id)small;
- (id)smallInfo;
- (id)strong;
- (id)tabIconCaption;
- (id)tableCellSubtitle;
- (id)tableCellTitle;
- (id)tableFooterStyle;
- (id)thin;
- (id)thinNumberText;
- (id)viewBackground;
- (int64_t)lineBreakMode;
- (int64_t)textAlignment;
- (unint64_t)hash;
- (void)applyScaleForMesh;
- (void)applyToEditField:(id)a3;
- (void)applyToLabel:(id)a3;
- (void)setColor:(id)a3;
- (void)setFontName:(id)a3;
- (void)setFontName:(id)a3 kitTextStyleName:(id)a4 leadingOverrideFromHISpec:(double)a5 shouldOverrideSize:(BOOL)a6 rebaseSelector:(SEL)a7;
- (void)setFontName:(id)a3 kitTextStyleName:(id)a4 shouldOverrideSize:(BOOL)a5 rebaseSelector:(SEL)a6;
- (void)setFontName:(id)a3 rebaseSelector:(SEL)a4;
- (void)setFontNameRebaseSelector:(SEL)a3;
- (void)setFontSize:(double)a3 rebaseSelector:(SEL)a4;
- (void)setFontSizeRebaseSelector:(SEL)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setM34:(double)a3;
- (void)setMinimumLineHeight:(double)a3;
- (void)setNeedsParagraphStyle:(BOOL)a3;
- (void)setOverrideUIKitFontSize:(BOOL)a3;
- (void)setPalette:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setUIKitFontTextStyleName:(id)a3;
- (void)setZPosition:(double)a3;
@end

@implementation GKTextStyle

+ (id)textStyle
{
  if (textStyle_onceToken != -1) {
    dispatch_once(&textStyle_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)textStyle_sBaseTextStyle;
  return v2;
}

uint64_t __24__GKTextStyle_textStyle__block_invoke()
{
  v0 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  if (v1 == 1
    || (([MEMORY[0x263F1C920] mainScreen],
         v2 = objc_claimAutoreleasedReturnValue(),
         [v2 bounds],
         double v4 = v3,
         double v6 = v5,
         v2,
         v6 <= v4)
      ? (double v7 = v4)
      : (double v7 = v6),
        v7 <= 480.0))
  {
    v8 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    if (v9 != 1)
    {
      v10 = [MEMORY[0x263F1C920] mainScreen];
      [v10 bounds];
    }
  }
  textStyle_sBaseTextStyle = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x270F9A758]();
}

+ (id)attributedString:(id)a3 byReplayingFromBaseStyle:(id)a4 systemContentSizeDidChange:(BOOL)a5
{
  id v7 = a4;
  v8 = (objc_class *)MEMORY[0x263F089B8];
  id v9 = a3;
  v10 = (void *)[[v8 alloc] initWithAttributedString:v9];
  uint64_t v11 = [v9 length];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __84__GKTextStyle_attributedString_byReplayingFromBaseStyle_systemContentSizeDidChange___block_invoke;
  v17[3] = &unk_26478A560;
  id v18 = v7;
  BOOL v20 = a5;
  id v12 = v10;
  id v19 = v12;
  id v13 = v7;
  objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", 0, v11, 0, v17);

  v14 = v19;
  id v15 = v12;

  return v15;
}

void __84__GKTextStyle_attributedString_byReplayingFromBaseStyle_systemContentSizeDidChange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  v8 = [v7 objectForKeyedSubscript:@"GKRecorderAttribute"];
  id v9 = v8;
  if (v8)
  {
    v10 = [v8 replayOnBaseStyle:*(void *)(a1 + 32) systemContentSizeDidChange:*(unsigned __int8 *)(a1 + 48)];
    uint64_t v11 = [v7 objectForKeyedSubscript:*MEMORY[0x263F1C238]];
    uint64_t v19 = 0;
    id v12 = [v10 resolveFontAndLineSpacing:&v19];
    id v13 = v12;
    if (v10 != v9
      || *(unsigned char *)(a1 + 48)
      || ([v12 pointSize], double v15 = v14, objc_msgSend(v11, "pointSize"), v15 != v16))
    {
      v17 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v7];
      id v18 = [v10 attributes];
      [v17 addEntriesFromDictionary:v18];

      objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v17, a3, a4);
    }
  }
}

+ (double)standardFontSize
{
  v2 = NSString;
  double v3 = [NSString stringWithFormat:@"%@ needs to implement me!", a1];
  double v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTextStyle.m"];
  id v5 = [v4 lastPathComponent];
  double v6 = [v2 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v3, "+[GKTextStyle standardFontSize]", objc_msgSend(v5, "UTF8String"), 165];

  [MEMORY[0x263EFF940] raise:@"GameKit Exception", @"%@", v6 format];
  return -1.0;
}

- (GKTextStyle)init
{
  v12.receiver = self;
  v12.super_class = (Class)GKTextStyle;
  v2 = [(GKTextStyle *)&v12 init];
  if (v2)
  {
    double v3 = +[GKColorPalette sharedPalette];
    fontName = v2->_fontName;
    v2->_fontName = (NSString *)@"GKMagicSystemFont";

    [(id)objc_opt_class() standardFontSize];
    v2->_fontSize = v5;
    if (sel_baseFontRebaseSelector)
    {
      double v6 = sel_baseFontRebaseSelector;
      id v7 = sel_baseFontRebaseSelector;
    }
    else
    {
      double v6 = 0;
      id v7 = 0;
    }
    v2->_fontSizeRebaseSelector = v6;
    v2->_fontNameRebaseSelector = v7;
    uint64_t v8 = [(GKColorPalette *)v3 standardTextColor];
    color = v2->_color;
    v2->_color = (UIColor *)v8;

    palette = v2->_palette;
    v2->_palette = v3;

    *(int64x2_t *)&v2->_textAlignment = vdupq_n_s64(4uLL);
    v2->_needsParagraphStyle = 0;
  }
  return v2;
}

- (id)initEmpty
{
  v3.receiver = self;
  v3.super_class = (Class)GKTextStyle;
  return [(GKTextStyle *)&v3 init];
}

- (id)replayOnBaseStyle:(id)a3 systemContentSizeDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = self;
  if ([v6 isMemberOfClass:objc_opt_class()] && !v4) {
    goto LABEL_12;
  }
  uint64_t v8 = [(GKTextStyle *)v7 fontSizeRebaseSelector];
  uint64_t v9 = [(GKTextStyle *)v7 fontNameRebaseSelector];
  if (!(v8 | v9)) {
    goto LABEL_12;
  }
  uint64_t v10 = v9;
  id v11 = [(GKTextStyle *)v7 copyWithBaseClass:objc_opt_class()];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __60__GKTextStyle_replayOnBaseStyle_systemContentSizeDidChange___block_invoke;
  v25[3] = &unk_26478A588;
  id v12 = v11;
  id v26 = v12;
  id v13 = (void (**)(void, void))MEMORY[0x22A644A10](v25);
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  v22 = __60__GKTextStyle_replayOnBaseStyle_systemContentSizeDidChange___block_invoke_2;
  v23 = &unk_26478A588;
  id v14 = v12;
  id v24 = v14;
  double v15 = (void (**)(void, void))MEMORY[0x22A644A10](&v20);
  if (v8 == v10)
  {
    v17 = objc_msgSend(v14, "_gkInvokeSelector:", v8, v20, v21, v22, v23);
    ((void (**)(void, void *))v15)[2](v15, v17);
  }
  else
  {
    if (v10)
    {
      double v16 = objc_msgSend(v14, "_gkInvokeSelector:", v10, v20, v21, v22, v23);
      ((void (**)(void, void *))v15)[2](v15, v16);
    }
    if (!v8) {
      goto LABEL_11;
    }
    v17 = [v14 _gkInvokeSelector:v8];
  }
  ((void (**)(void, void *))v13)[2](v13, v17);

LABEL_11:
  objc_msgSend(v14, "applyScaleForMesh", v20, v21, v22, v23);
  id v18 = (GKTextStyle *)v14;

  id v7 = v18;
LABEL_12:

  return v7;
}

double __60__GKTextStyle_replayOnBaseStyle_systemContentSizeDidChange___block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 72);
  *(double *)(*(void *)(a1 + 32) + 72) = result;
  return result;
}

void __60__GKTextStyle_replayOnBaseStyle_systemContentSizeDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = a2;
  id v3 = *(id *)(*(void *)(a1 + 32) + 56);
  BOOL v4 = (void *)v9[7];
  id v5 = v4;
  if (v3 != v5) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), v4);
  }
  id v6 = *(id *)(*(void *)(a1 + 32) + 64);
  id v7 = (void *)v9[8];
  id v8 = v7;
  if (v6 != v8) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), v7);
  }
  *(void *)(*(void *)(a1 + 32) + 8) = v9[1];
  *(unsigned char *)(*(void *)(a1 + 32) + 17) = *((unsigned char *)v9 + 17);
}

- (id)copy
{
  uint64_t v3 = objc_opt_class();
  return [(GKTextStyle *)self copyWithBaseClass:v3];
}

- (id)copyWithBaseClass:(Class)a3
{
  uint64_t v4 = [[a3 alloc] initEmpty];
  if (v4)
  {
    uint64_t v5 = [(NSString *)self->_fontName copy];
    id v6 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v5;

    uint64_t v7 = [(NSString *)self->_UIKitFontTextStyleName copy];
    id v8 = *(void **)(v4 + 64);
    *(void *)(v4 + 64) = v7;

    SEL fontSizeRebaseSelector = self->_fontSizeRebaseSelector;
    *(double *)(v4 + 8) = self->_UIKitFontLeading;
    *(unsigned char *)(v4 + 17) = self->_overrideUIKitFontSize;
    *(double *)(v4 + 72) = self->_fontSize;
    *(void *)(v4 + 104) = fontSizeRebaseSelector;
    objc_storeStrong((id *)(v4 + 24), self->_color);
    objc_storeStrong((id *)(v4 + 48), self->_palette);
    *(double *)(v4 + 88) = self->_m34;
    *(double *)(v4 + 96) = self->_zPosition;
    *(void *)(v4 + 32) = self->_textAlignment;
    *(void *)(v4 + 40) = self->_lineBreakMode;
    *(unsigned char *)(v4 + 16) = self->_needsParagraphStyle;
    *(double *)(v4 + 80) = self->_minimumLineHeight;
  }
  return (id)v4;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x263F089D8] string];
  [v3 appendFormat:@"<%@ %p", objc_opt_class(), self];
  SEL fontSizeRebaseSelector = self->_fontSizeRebaseSelector;
  double fontSize = self->_fontSize;
  if (fontSizeRebaseSelector)
  {
    id v6 = NSStringFromSelector(fontSizeRebaseSelector);
    [v3 appendFormat:@"> %.1fpt sel:%@ font:%@", *(void *)&fontSize, v6, self->_fontName];
  }
  else
  {
    [v3 appendFormat:@"> %.1fpt sel:%@ font:%@", *(void *)&fontSize, @"<n/a>", self->_fontName];
  }
  double zPosition = self->_zPosition;
  if (zPosition != 0.0) {
    [v3 appendFormat:@" z:%.2f m34:%g 1/m34:%.0f", *(void *)&zPosition, *(void *)&self->_m34, 1.0 / self->_m34];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (GKTextStyle *)a3;
  if (v5 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      uint64_t v7 = [(GKTextStyle *)v6 fontName];
      if (![v7 isEqual:self->_fontName])
      {
        BOOL v11 = 0;
LABEL_18:

        goto LABEL_19;
      }
      id v8 = [(GKTextStyle *)v6 color];
      color = self->_color;
      if (v8 == color
        || ([(GKTextStyle *)v6 color],
            uint64_t v3 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:self->_color]))
      {
        if ([(GKTextStyle *)v6 fontSizeRebaseSelector] == self->_fontSizeRebaseSelector
          && [(GKTextStyle *)v6 textAlignment] == self->_textAlignment
          && [(GKTextStyle *)v6 lineBreakMode] == self->_lineBreakMode)
        {
          [(GKTextStyle *)v6 minimumLineHeight];
          BOOL v10 = v12 == self->_minimumLineHeight;
          BOOL v11 = v10;
        }
        else
        {
          BOOL v10 = 0;
          BOOL v11 = 0;
        }
        if (v8 == color) {
          goto LABEL_17;
        }
      }
      else
      {
        BOOL v10 = 0;
      }

      BOOL v11 = v10;
LABEL_17:

      goto LABEL_18;
    }
    BOOL v11 = 0;
  }
LABEL_19:

  return v11;
}

- (unint64_t)hash
{
  return (unint64_t)self->_fontSize | (unint64_t)self->_fontName;
}

+ (double)standardLeadingForFontTextStyle:(id)a3
{
  uint64_t v3 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  [v3 leading];
  double v5 = GKRoundToScreenScale(v4);

  return v5;
}

+ (double)scaledValueFromHISpecLeading:(double)a3 forFontTextStyle:(id)a4
{
  double v5 = [MEMORY[0x263F1C658] preferredFontForTextStyle:a4];
  [v5 _scaledValueForValue:a3];
  double v7 = GKRoundToScreenScale(v6);

  return v7;
}

- (id)resolveFontAndLineSpacing:(double *)a3
{
  double v5 = self->_fontName;
  if (a3) {
    *a3 = 0.0;
  }
  double v6 = self->_UIKitFontTextStyleName;
  if (v6)
  {
    double v7 = [MEMORY[0x263F1C658] preferredFontForTextStyle:v6];
    id v8 = v7;
    if (self->_overrideUIKitFontSize)
    {
      uint64_t v9 = [v7 fontWithSize:self->_fontSize];

      id v8 = (void *)v9;
    }
    if (a3 && self->_UIKitFontLeading != 0.0)
    {
      objc_msgSend(v8, "_scaledValueForValue:");
      *a3 = GKRoundToScreenScale(v10);
    }
  }
  else
  {
    if (v5 == @"GKMagicSystemFont")
    {
      uint64_t v12 = [MEMORY[0x263F1C658] systemFontOfSize:self->_fontSize];
    }
    else if (v5 == @"GKMagicBoldSystemFont" || v5 == @"GKMagicMediumSystemFontName")
    {
      uint64_t v12 = [MEMORY[0x263F1C658] boldSystemFontOfSize:self->_fontSize];
    }
    else if (v5 == @"GKMagicLightSystemFont")
    {
      uint64_t v12 = [MEMORY[0x263F1C658] _lightSystemFontOfSize:self->_fontSize];
    }
    else
    {
      double fontSize = self->_fontSize;
      if (v5 == @"GKMagicThinSystemFont") {
        [MEMORY[0x263F1C658] _thinSystemFontOfSize:fontSize];
      }
      else {
      uint64_t v12 = [MEMORY[0x263F1C658] fontWithName:v5 size:fontSize];
      }
    }
    id v8 = (void *)v12;
  }

  return v8;
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    self->_needsParagraphStyle = 1;
  }
}

- (void)setLineBreakMode:(int64_t)a3
{
  if (self->_lineBreakMode != a3)
  {
    self->_lineBreakMode = a3;
    self->_needsParagraphStyle = 1;
  }
}

- (void)setMinimumLineHeight:(double)a3
{
  if (self->_minimumLineHeight != a3)
  {
    self->_minimumLineHeight = a3;
    self->_needsParagraphStyle = 1;
  }
}

- (void)setFontSize:(double)a3 rebaseSelector:(SEL)a4
{
  self->_double fontSize = a3;
  if (a4) {
    double v4 = a4;
  }
  else {
    double v4 = 0;
  }
  self->_SEL fontSizeRebaseSelector = v4;
}

- (void)setFontName:(id)a3 rebaseSelector:(SEL)a4
{
}

- (void)setFontName:(id)a3 kitTextStyleName:(id)a4 shouldOverrideSize:(BOOL)a5 rebaseSelector:(SEL)a6
{
}

- (void)setFontName:(id)a3 kitTextStyleName:(id)a4 leadingOverrideFromHISpec:(double)a5 shouldOverrideSize:(BOOL)a6 rebaseSelector:(SEL)a7
{
  double v15 = (NSString *)a3;
  id v13 = (NSString *)a4;
  if (self->_fontName != v15) {
    objc_storeStrong((id *)&self->_fontName, a3);
  }
  if (self->_UIKitFontTextStyleName != v13) {
    objc_storeStrong((id *)&self->_UIKitFontTextStyleName, a4);
  }
  self->_UIKitFontLeading = a5;
  self->_overrideUIKitFontSize = a6;
  if (a7) {
    id v14 = a7;
  }
  else {
    id v14 = 0;
  }
  self->_fontNameRebaseSelector = v14;
}

- (id)attributes
{
  v22[3] = *MEMORY[0x263EF8340];
  double v18 = 0.0;
  uint64_t v3 = [(GKTextStyle *)self resolveFontAndLineSpacing:&v18];
  if (!v3)
  {
    double v4 = NSString;
    double v5 = [NSString stringWithFormat:@"unknown font:%@", self->_fontName];
    double v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTextStyle.m"];
    id v7 = [v6 lastPathComponent];
    id v8 = [v4 stringWithFormat:@"%@ (font != nil)\n[%s (%s:%d)]", v5, "-[GKTextStyle attributes]", objc_msgSend(v7, "UTF8String"), 489];

    [MEMORY[0x263EFF940] raise:@"GameKit Exception", @"%@", v8 format];
  }
  if (self->_needsParagraphStyle || v18 != 0.0)
  {
    id v12 = objc_alloc_init(MEMORY[0x263F1C350]);
    [v12 setAlignment:self->_textAlignment];
    [v12 setLineBreakMode:self->_lineBreakMode];
    LODWORD(v13) = *(_DWORD *)"333?";
    [v12 setHyphenationFactor:v13];
    if (self->_UIKitFontLeading <= 0.0)
    {
      if (self->_minimumLineHeight > 0.0) {
        objc_msgSend(v12, "setMinimumLineHeight:");
      }
    }
    else
    {
      [v12 setMinimumLineHeight:v18];
      [v12 setMaximumLineHeight:v18];
    }
    uint64_t v14 = *MEMORY[0x263F1C240];
    v19[0] = *MEMORY[0x263F1C238];
    v19[1] = v14;
    color = self->_color;
    v20[0] = v3;
    v20[1] = color;
    uint64_t v16 = *MEMORY[0x263F1C268];
    v19[2] = @"GKRecorderAttribute";
    v19[3] = v16;
    v20[2] = self;
    v20[3] = v12;
    BOOL v11 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
  }
  else
  {
    uint64_t v9 = *MEMORY[0x263F1C240];
    v21[0] = *MEMORY[0x263F1C238];
    v21[1] = v9;
    double v10 = self->_color;
    v22[0] = v3;
    v22[1] = v10;
    v21[2] = @"GKRecorderAttribute";
    v22[2] = self;
    BOOL v11 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 3, v18);
  }

  return v11;
}

- (void)applyToLabel:(id)a3
{
  double v7 = 0.0;
  id v4 = a3;
  double v5 = [(GKTextStyle *)self resolveFontAndLineSpacing:&v7];
  [v4 setFont:v5];
  double v6 = [(GKTextStyle *)self color];
  [v4 setTextColor:v6];

  objc_msgSend(v4, "setLineBreakMode:", -[GKTextStyle lineBreakMode](self, "lineBreakMode"));
  objc_msgSend(v4, "setTextAlignment:", -[GKTextStyle textAlignment](self, "textAlignment"));
  [v4 setLineSpacing:(uint64_t)v7];
}

- (void)applyToEditField:(id)a3
{
  id v6 = a3;
  id v4 = [(GKTextStyle *)self resolveFontAndLineSpacing:0];
  [v6 setFont:v4];

  double v5 = [(GKTextStyle *)self color];
  [v6 setTextColor:v5];

  objc_msgSend(v6, "setTextAlignment:", -[GKTextStyle textAlignment](self, "textAlignment"));
}

- (id)baseFontRebaseSelector
{
  id v3 = [(GKTextStyle *)self copy];
  [v3 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  [(id)objc_opt_class() standardFontSize];
  objc_msgSend(v3, "setFontSize:rebaseSelector:", a2);
  return v3;
}

- (id)header0
{
  id v4 = [(GKTextStyle *)self copy];
  double v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 emphasizedTextColor];
  [v4 setColor:v6];

  [v4 setFontName:@"GKMagicBoldSystemFont" rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:32.0];
  return v4;
}

- (id)header1
{
  v2 = NSString;
  id v3 = [NSString stringWithFormat:@"%@ needs to implement me!", self];
  id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTextStyle.m"];
  id v5 = [v4 lastPathComponent];
  id v6 = [v2 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v3, "-[GKTextStyle header1]", objc_msgSend(v5, "UTF8String"), 572];

  [MEMORY[0x263EFF940] raise:@"GameKit Exception", @"%@", v6 format];
  return 0;
}

- (id)header2
{
  v2 = NSString;
  id v3 = [NSString stringWithFormat:@"%@ needs to implement me!", self];
  id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTextStyle.m"];
  id v5 = [v4 lastPathComponent];
  id v6 = [v2 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v3, "-[GKTextStyle header2]", objc_msgSend(v5, "UTF8String"), 578];

  [MEMORY[0x263EFF940] raise:@"GameKit Exception", @"%@", v6 format];
  return 0;
}

- (id)header3
{
  id v4 = [(GKTextStyle *)self copy];
  id v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 emphasizedTextColor];
  [v4 setColor:v6];

  [v4 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:18.0];
  return v4;
}

- (id)header4
{
  id v4 = [(GKTextStyle *)self copy];
  id v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 emphasizedTextColor];
  [v4 setColor:v6];

  [v4 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:14.0];
  return v4;
}

- (id)headline
{
  id v4 = [(GKTextStyle *)self copy];
  id v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 emphasizedTextColor];
  [v4 setColor:v6];

  [v4 setTextAlignment:4];
  [v4 setFontName:@"GKMagicBoldSystemFont" kitTextStyleName:*MEMORY[0x263F1D298] shouldOverrideSize:0 rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:18.0];
  return v4;
}

- (id)body
{
  id v4 = [(GKTextStyle *)self copy];
  id v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 emphasizedTextColor];
  [v4 setColor:v6];

  [v4 setTextAlignment:4];
  [v4 setFontName:@"GKMagicSystemFont" kitTextStyleName:*MEMORY[0x263F1D260] shouldOverrideSize:0 rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:17.0];
  return v4;
}

- (id)footnote
{
  id v3 = [(GKTextStyle *)self copy];
  [v3 setTextAlignment:4];
  [v3 setFontName:@"GKMagicSystemFont" kitTextStyleName:*MEMORY[0x263F1D280] shouldOverrideSize:0 rebaseSelector:a2];
  [v3 setFontSize:a2 rebaseSelector:15.0];
  return v3;
}

- (id)callout
{
  id v3 = [(GKTextStyle *)self copy];
  [v3 setTextAlignment:4];
  [v3 setFontName:@"GKMagicSystemFont" kitTextStyleName:*MEMORY[0x263F1D268] shouldOverrideSize:0 rebaseSelector:a2];
  return v3;
}

- (id)caption1
{
  id v4 = [(GKTextStyle *)self copy];
  id v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 standardTextColor];
  [v4 setColor:v6];

  [v4 setTextAlignment:4];
  [v4 setFontName:@"GKMagicSystemFont" kitTextStyleName:*MEMORY[0x263F1D270] shouldOverrideSize:0 rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:13.0];
  return v4;
}

- (id)caption2
{
  id v4 = [(GKTextStyle *)self copy];
  id v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 standardTextColor];
  [v4 setColor:v6];

  [v4 setTextAlignment:4];
  [v4 setFontName:@"GKMagicSystemFont" kitTextStyleName:*MEMORY[0x263F1D278] shouldOverrideSize:0 rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:11.0];
  return v4;
}

- (id)bannerTitle
{
  id v4 = [(GKTextStyle *)self copy];
  id v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 emphasizedTextOnDarkBackgroundColor];
  [v4 setColor:v6];

  [v4 setTextAlignment:4];
  [v4 setLineBreakMode:4];
  [v4 setFontName:@"GKMagicBoldSystemFont" rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:17.0];
  return v4;
}

- (id)bannerShortTitle
{
  id v4 = [(GKTextStyle *)self copy];
  id v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 emphasizedTextOnDarkBackgroundColor];
  [v4 setColor:v6];

  [v4 setTextAlignment:4];
  [v4 setLineBreakMode:4];
  [v4 setFontName:@"GKMagicBoldSystemFont" rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:15.0];
  return v4;
}

- (id)bannerMessage
{
  id v3 = [(GKTextStyle *)self header4];
  id v4 = [(GKTextStyle *)self palette];
  id v5 = [v4 emphasizedTextOnDarkBackgroundColor];
  [v3 setColor:v5];

  [v3 setTextAlignment:4];
  [v3 setLineBreakMode:4];
  return v3;
}

- (id)caption
{
  id v4 = [(GKTextStyle *)self copy];
  [v4 setTextAlignment:4];
  id v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 friendRequestCaptionTintColor];
  [v4 setColor:v6];

  [v4 setFontSize:a2 rebaseSelector:12.0];
  return v4;
}

- (id)roundButtonTitle
{
  id v4 = [(GKTextStyle *)self copy];
  [v4 setTextAlignment:1];
  [v4 setLineBreakMode:0];
  id v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 systemInteractionColor];
  [v4 setColor:v6];

  [v4 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:11.0];
  return v4;
}

- (id)buyButtonTitle
{
  id v4 = [(GKTextStyle *)self copy];
  [v4 setTextAlignment:1];
  [v4 setLineBreakMode:0];
  id v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 systemInteractionColor];
  [v4 setColor:v6];

  [v4 setFontName:@"GKMagicSystemFont" kitTextStyleName:*MEMORY[0x263F1D2C0] leadingOverrideFromHISpec:0 shouldOverrideSize:a2 rebaseSelector:0.0];
  [v4 setFontSize:a2 rebaseSelector:14.0];
  return v4;
}

- (id)selectedBuyButtonTitle
{
  id v4 = [(GKTextStyle *)self copy];
  [v4 setTextAlignment:1];
  [v4 setLineBreakMode:0];
  id v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 textOnDarkBackgroundColor];
  [v4 setColor:v6];

  [v4 setFontName:@"GKMagicSystemFont" kitTextStyleName:*MEMORY[0x263F1D2C0] leadingOverrideFromHISpec:0 shouldOverrideSize:a2 rebaseSelector:0.0];
  [v4 setFontSize:a2 rebaseSelector:14.0];
  return v4;
}

- (id)small
{
  id v4 = [(GKTextStyle *)self copy];
  id v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 emphasizedTextColor];
  [v4 setColor:v6];

  [v4 setFontSize:a2 rebaseSelector:9.0];
  return v4;
}

- (id)info
{
  id v3 = [(GKTextStyle *)self copy];
  id v4 = [(GKTextStyle *)self palette];
  id v5 = [v4 standardTextColor];
  [v3 setColor:v5];

  return v3;
}

- (id)smallInfo
{
  v2 = NSString;
  id v3 = [NSString stringWithFormat:@"%@ needs to implement me!", self];
  id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTextStyle.m"];
  id v5 = [v4 lastPathComponent];
  id v6 = [v2 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v3, "-[GKTextStyle smallInfo]", objc_msgSend(v5, "UTF8String"), 807];

  [MEMORY[0x263EFF940] raise:@"GameKit Exception", @"%@", v6 format];
  return 0;
}

- (id)viewBackground
{
  id v3 = [(GKTextStyle *)self copy];
  id v4 = [(GKTextStyle *)self palette];
  id v5 = [v4 viewBackgroundColor];
  [v3 setColor:v5];

  return v3;
}

- (id)emphasized
{
  id v3 = [(GKTextStyle *)self copy];
  id v4 = [(GKTextStyle *)self palette];
  id v5 = [v4 emphasizedTextColor];
  [v3 setColor:v5];

  return v3;
}

- (id)emphasizedOnDarkBackground
{
  id v3 = [(GKTextStyle *)self copy];
  id v4 = [(GKTextStyle *)self palette];
  id v5 = [v4 emphasizedTextOnDarkBackgroundColor];
  [v3 setColor:v5];

  return v3;
}

- (void)applyScaleForMesh
{
  double zPosition = self->_zPosition;
  if (zPosition != 0.0)
  {
    double m34 = self->_m34;
    double v4 = 1.0 / m34;
    BOOL v5 = m34 == 0.0;
    double v6 = -400.0;
    if (!v5) {
      double v6 = v4;
    }
    double v7 = fabs(self->_fontSize * (zPosition + v6) / v6);
    if (self->_fontSizeRebaseSelector) {
      SEL fontSizeRebaseSelector = self->_fontSizeRebaseSelector;
    }
    else {
      SEL fontSizeRebaseSelector = 0;
    }
    [(GKTextStyle *)self setFontSize:fontSizeRebaseSelector rebaseSelector:v7];
  }
}

- (id)scaledForM34:(double)a3 zPosition:(double)a4
{
  id v6 = [(GKTextStyle *)self copy];
  [v6 setM34:a3];
  [v6 setZPosition:a4];
  [v6 applyScaleForMesh];
  return v6;
}

- (id)scaled:(double)a3
{
  id v5 = [(GKTextStyle *)self copy];
  id v6 = v5;
  if (self->_fontSizeRebaseSelector) {
    SEL fontSizeRebaseSelector = self->_fontSizeRebaseSelector;
  }
  else {
    SEL fontSizeRebaseSelector = 0;
  }
  [v5 setFontSize:fontSizeRebaseSelector rebaseSelector:self->_fontSize * a3];
  return v6;
}

- (id)localPlayerColor
{
  id v3 = [(GKTextStyle *)self copy];
  double v4 = [(GKTextStyle *)self palette];
  id v5 = [v4 localPlayerTintColor];
  [v3 setColor:v5];

  return v3;
}

- (id)friendColor
{
  id v3 = [(GKTextStyle *)self copy];
  double v4 = [(GKTextStyle *)self palette];
  id v5 = [v4 friendTintColor];
  [v3 setColor:v5];

  return v3;
}

- (id)friendCaptionColor
{
  id v3 = [(GKTextStyle *)self copy];
  double v4 = [(GKTextStyle *)self palette];
  id v5 = [v4 friendRequestCaptionTintColor];
  [v3 setColor:v5];

  return v3;
}

- (id)bold
{
  id v3 = [(GKTextStyle *)self copy];
  [v3 setFontName:@"GKMagicBoldSystemFont" rebaseSelector:a2];
  return v3;
}

- (id)strong
{
  id v3 = [(GKTextStyle *)self copy];
  [v3 setFontName:@"GKMagicBoldSystemFont" rebaseSelector:a2];
  return v3;
}

- (id)thin
{
  id v3 = [(GKTextStyle *)self copy];
  [v3 setFontName:@"GKMagicLightSystemFont" rebaseSelector:a2];
  return v3;
}

- (id)regular
{
  id v3 = [(GKTextStyle *)self copy];
  [v3 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  return v3;
}

- (id)light
{
  id v3 = [(GKTextStyle *)self copy];
  [v3 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  return v3;
}

- (id)medium
{
  id v3 = [(GKTextStyle *)self copy];
  [v3 setFontName:@"GKMagicMediumSystemFontName" rebaseSelector:a2];
  return v3;
}

- (id)centered
{
  id v2 = [(GKTextStyle *)self copy];
  [v2 setTextAlignment:1];
  return v2;
}

- (id)composeFields
{
  id v3 = [(GKTextStyle *)self copy];
  [v3 setFontName:@"GKMagicSystemFont" kitTextStyleName:*MEMORY[0x263F1D2C0] shouldOverrideSize:0 rebaseSelector:a2];
  [v3 setFontSize:a2 rebaseSelector:14.0];
  return v3;
}

- (id)composeMessage
{
  id v3 = [(GKTextStyle *)self copy];
  [v3 setFontName:@"GKMagicSystemFont" kitTextStyleName:*MEMORY[0x263F1D260] shouldOverrideSize:0 rebaseSelector:a2];
  [v3 setFontSize:a2 rebaseSelector:17.0];
  return v3;
}

- (id)headerViewSubText1
{
  id v3 = [(GKTextStyle *)self copy];
  [v3 setFontName:@"GKMagicSystemFont" kitTextStyleName:*MEMORY[0x263F1D280] shouldOverrideSize:0 rebaseSelector:a2];
  [v3 setFontSize:a2 rebaseSelector:15.0];
  return v3;
}

- (id)multiplayerNameText
{
  id v4 = [(GKTextStyle *)self copy];
  [v4 setFontName:@"GKMagicBoldSystemFont" kitTextStyleName:*MEMORY[0x263F1D2C0] shouldOverrideSize:0 rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:15.0];
  [v4 setTextAlignment:1];
  id v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 emphasizedTextColor];
  [v4 setColor:v6];

  return v4;
}

- (id)multiplayerAddText
{
  id v4 = [(GKTextStyle *)self copy];
  [v4 setFontName:@"GKMagicSystemFont" kitTextStyleName:*MEMORY[0x263F1D2C0] shouldOverrideSize:0 rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:15.0];
  [v4 setTextAlignment:1];
  id v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 systemInteractionColor];
  [v4 setColor:v6];

  return v4;
}

- (id)multiplayerStatusText
{
  id v4 = [(GKTextStyle *)self copy];
  [v4 setFontName:@"GKMagicSystemFont" kitTextStyleName:*MEMORY[0x263F1D280] shouldOverrideSize:1 rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:11.0];
  [v4 setTextAlignment:1];
  id v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 standardTextColor];
  [v4 setColor:v6];

  return v4;
}

- (id)multiplayerHeaderText
{
  id v4 = [(GKTextStyle *)self copy];
  [v4 setFontName:@"GKMagicSystemFont" kitTextStyleName:*MEMORY[0x263F1D280] shouldOverrideSize:0 rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:17.0];
  [v4 setTextAlignment:1];
  id v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 standardTextColor];
  [v4 setColor:v6];

  return v4;
}

- (id)multiplayerFooterText
{
  id v4 = [(GKTextStyle *)self copy];
  [v4 setFontName:@"GKMagicSystemFont" kitTextStyleName:*MEMORY[0x263F1D280] shouldOverrideSize:0 rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:17.0];
  id v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 standardTextColor];
  [v4 setColor:v6];

  return v4;
}

- (id)thinNumberText
{
  id v2 = NSString;
  id v3 = [NSString stringWithFormat:@"%@ needs to implement me!", self];
  id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTextStyle.m"];
  id v5 = [v4 lastPathComponent];
  id v6 = [v2 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v3, "-[GKTextStyle thinNumberText]", objc_msgSend(v5, "UTF8String"), 1058];

  [MEMORY[0x263EFF940] raise:@"GameKit Exception", @"%@", v6 format];
  return 0;
}

- (id)gameDetailNameText
{
  id v2 = NSString;
  id v3 = [NSString stringWithFormat:@"%@ needs to implement me!", self];
  id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTextStyle.m"];
  id v5 = [v4 lastPathComponent];
  id v6 = [v2 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v3, "-[GKTextStyle gameDetailNameText]", objc_msgSend(v5, "UTF8String"), 1064];

  [MEMORY[0x263EFF940] raise:@"GameKit Exception", @"%@", v6 format];
  return 0;
}

- (id)detailSecondaryHeaderText
{
  id v2 = NSString;
  id v3 = [NSString stringWithFormat:@"%@ needs to implement me!", self];
  id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTextStyle.m"];
  id v5 = [v4 lastPathComponent];
  id v6 = [v2 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v3, "-[GKTextStyle detailSecondaryHeaderText]", objc_msgSend(v5, "UTF8String"), 1070];

  [MEMORY[0x263EFF940] raise:@"GameKit Exception", @"%@", v6 format];
  return 0;
}

- (id)leaderboardRankSmall
{
  id v3 = [(GKTextStyle *)self copy];
  [v3 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  [v3 setFontSize:a2 rebaseSelector:14.0];
  return v3;
}

- (id)leaderboardRankMedium
{
  id v3 = [(GKTextStyle *)self copy];
  [v3 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  [v3 setFontSize:a2 rebaseSelector:22.0];
  return v3;
}

- (id)leaderboardRankLarge
{
  id v3 = [(GKTextStyle *)self copy];
  [v3 setFontName:@"GKMagicLightSystemFont" rebaseSelector:a2];
  [v3 setFontSize:a2 rebaseSelector:34.0];
  return v3;
}

- (id)achievementLeaderboardRank
{
  id v4 = [(GKTextStyle *)self copy];
  [v4 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:18.0];
  id v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 emphasizedTextColor];
  [v4 setColor:v6];

  return v4;
}

- (id)achievementLeaderboardPointsText
{
  id v3 = [(GKTextStyle *)self copy];
  [v3 setFontName:@"GKMagicBoldSystemFont" kitTextStyleName:*MEMORY[0x263F1D278] shouldOverrideSize:0 rebaseSelector:a2];
  [v3 setFontSize:a2 rebaseSelector:10.0];
  return v3;
}

- (id)achievementValueText
{
  id v4 = [(GKTextStyle *)self copy];
  [v4 setFontName:@"GKMagicSystemFont" kitTextStyleName:*MEMORY[0x263F1D260] shouldOverrideSize:0 rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:19.0];
  id v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 emphasizedTextColor];
  [v4 setColor:v6];

  return v4;
}

- (id)sectionHeader
{
  id v4 = [(GKTextStyle *)self copy];
  id v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 emphasizedTextColor];
  [v4 setColor:v6];

  [v4 setFontName:@"GKMagicSystemFont" kitTextStyleName:*MEMORY[0x263F1D2C0] shouldOverrideSize:0 rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:15.0];
  return v4;
}

- (id)sectionCaption
{
  id v3 = [(GKTextStyle *)self copy];
  [v3 setFontName:@"GKMagicSystemFont" kitTextStyleName:*MEMORY[0x263F1D278] shouldOverrideSize:0 rebaseSelector:a2];
  [v3 setFontSize:a2 rebaseSelector:11.0];
  return v3;
}

- (id)sectionCaptionSmall
{
  id v2 = NSString;
  id v3 = [NSString stringWithFormat:@"%@ needs to implement me!", self];
  id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTextStyle.m"];
  id v5 = [v4 lastPathComponent];
  id v6 = [v2 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v3, "-[GKTextStyle sectionCaptionSmall]", objc_msgSend(v5, "UTF8String"), 1163];

  [MEMORY[0x263EFF940] raise:@"GameKit Exception", @"%@", v6 format];
  return 0;
}

- (id)cellActionItem
{
  id v2 = NSString;
  id v3 = [NSString stringWithFormat:@"%@ needs to implement me!", self];
  id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKTextStyle.m"];
  id v5 = [v4 lastPathComponent];
  id v6 = [v2 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v3, "-[GKTextStyle cellActionItem]", objc_msgSend(v5, "UTF8String"), 1169];

  [MEMORY[0x263EFF940] raise:@"GameKit Exception", @"%@", v6 format];
  return 0;
}

- (id)challengeText
{
  id v3 = [(GKTextStyle *)self copy];
  [v3 setFontName:@"GKMagicSystemFont" kitTextStyleName:*MEMORY[0x263F1D260] shouldOverrideSize:1 rebaseSelector:a2];
  id v4 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 != 1 || ((double v6 = 25.0, *MEMORY[0x263F402F8]) ? (v7 = _GKIsRemoteUIUsingPadIdiom == 0) : (v7 = 0), v7))
  {
    id v8 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    double v6 = 16.2;
    if (!v9)
    {
      double v10 = [MEMORY[0x263F1C920] mainScreen];
      [v10 bounds];
      double v12 = v11;
      double v14 = v13;

      BOOL v15 = v12 < 414.0 || v14 < 736.0;
      if (!v15 || (v14 >= 414.0 ? (BOOL v16 = v12 < 736.0) : (BOOL v16 = 1), !v16)) {
        double v6 = 25.0;
      }
    }
  }
  [v3 setFontSize:a2 rebaseSelector:v6];
  return v3;
}

- (id)challengeTitleText
{
  id v3 = [(GKTextStyle *)self copy];
  [v3 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  id v4 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 1 && (!*MEMORY[0x263F402F8] || _GKIsRemoteUIUsingPadIdiom != 0)) {
    goto LABEL_17;
  }
  BOOL v7 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  double v9 = 30.0;
  if (!v8)
  {
    double v10 = [MEMORY[0x263F1C920] mainScreen];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;

    BOOL v15 = v12 < 414.0 || v14 < 736.0;
    if (!v15 || (v14 >= 414.0 ? (BOOL v16 = v12 < 736.0) : (BOOL v16 = 1), !v16)) {
LABEL_17:
    }
      double v9 = 45.0;
  }
  [v3 setFontSize:a2 rebaseSelector:v9];
  return v3;
}

- (id)buttonTitle
{
  id v3 = [(GKTextStyle *)self copy];
  id v4 = [(GKTextStyle *)self palette];
  uint64_t v5 = [v4 systemInteractionColor];
  [v3 setColor:v5];

  return v3;
}

- (id)tableCellTitle
{
  id v4 = [(GKTextStyle *)self copy];
  uint64_t v5 = [(GKTextStyle *)self palette];
  double v6 = [v5 emphasizedTextColor];
  [v4 setColor:v6];

  BOOL v7 = [(GKTextStyle *)self fontName];
  [v4 setFontName:v7 kitTextStyleName:*MEMORY[0x263F1D260] shouldOverrideSize:0 rebaseSelector:a2];

  [v4 setFontSize:a2 rebaseSelector:18.0];
  [v4 setTextAlignment:4];
  return v4;
}

- (id)tableCellSubtitle
{
  id v4 = [(GKTextStyle *)self copy];
  uint64_t v5 = [(GKTextStyle *)self palette];
  double v6 = [v5 standardTextColor];
  [v4 setColor:v6];

  BOOL v7 = [(GKTextStyle *)self fontName];
  [v4 setFontName:v7 kitTextStyleName:*MEMORY[0x263F1D278] shouldOverrideSize:0 rebaseSelector:a2];

  [v4 setFontSize:a2 rebaseSelector:12.0];
  [v4 setTextAlignment:4];
  return v4;
}

- (id)tableFooterStyle
{
  id v4 = [(GKTextStyle *)self copy];
  uint64_t v5 = [(GKTextStyle *)self palette];
  double v6 = [v5 standardTextColor];
  [v4 setColor:v6];

  [v4 setFontSize:a2 rebaseSelector:18.0];
  [v4 setTextAlignment:4];
  return v4;
}

- (id)tabIconCaption
{
  id v4 = [(GKTextStyle *)self copy];
  uint64_t v5 = [(GKTextStyle *)self palette];
  double v6 = [v5 emphasizedTextColor];
  [v4 setColor:v6];

  [v4 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:12.0];
  return v4;
}

- (id)removeButtonTitle
{
  id v3 = [(GKTextStyle *)self copy];
  id v4 = [(GKTextStyle *)self palette];
  uint64_t v5 = [v4 removeItemTextColor];
  [v3 setColor:v5];

  [v3 setTextAlignment:2];
  return v3;
}

- (id)alignment:(int64_t)a3 lineBreakMode:(int64_t)a4
{
  id v6 = [(GKTextStyle *)self copy];
  [v6 setTextAlignment:a3];
  [v6 setLineBreakMode:a4];
  return v6;
}

- (id)lineBreakMode:(int64_t)a3
{
  id v4 = [(GKTextStyle *)self copy];
  [v4 setLineBreakMode:a3];
  return v4;
}

- (id)lineHeight:(double)a3
{
  id v4 = [(GKTextStyle *)self copy];
  [v4 setMinimumLineHeight:a3];
  return v4;
}

- (id)remoteUISectionHeader:(int)a3
{
  id v5 = [(GKTextStyle *)self copy];
  id v6 = [(GKTextStyle *)self palette];
  BOOL v7 = [v6 emphasizedTextColor];
  [v5 setColor:v7];

  [v5 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  [v5 setFontSize:a2 rebaseSelector:14.0];
  return v5;
}

- (id)remoteUISectionFooter:(int)a3
{
  id v6 = [(GKTextStyle *)self copy];
  BOOL v7 = [(GKTextStyle *)self palette];
  uint64_t v8 = [v7 emphasizedTextColor];
  [v6 setColor:v8];

  [v6 setTextAlignment:4];
  double v9 = 20.0;
  double v10 = 17.0;
  double v11 = @"GKMagicLightSystemFont";
  if (a3 == 2)
  {
    double v11 = @"GKMagicSystemFont";
    double v10 = 21.0;
    double v9 = 30.0;
  }
  if (a3) {
    double v12 = v11;
  }
  else {
    double v12 = @"GKMagicSystemFont";
  }
  if (a3) {
    double v13 = v10;
  }
  else {
    double v13 = 14.0;
  }
  if (a3) {
    double v14 = v9;
  }
  else {
    double v14 = 21.0;
  }
  objc_msgSend(v6, "setFontName:rebaseSelector:", v12, a2, 21.0, 14.0, v9, v10, 30.0);
  [v6 setFontSize:a2 rebaseSelector:v13];
  [v6 setMinimumLineHeight:v14];
  return v6;
}

- (id)remoteUILabel:(int)a3
{
  id v6 = [(GKTextStyle *)self copy];
  BOOL v7 = [(GKTextStyle *)self palette];
  uint64_t v8 = [v7 emphasizedTextColor];
  [v6 setColor:v8];

  [v6 setFontName:@"GKMagicBoldSystemFont" rebaseSelector:a2];
  double v9 = 18.0;
  if (a3 == 2) {
    double v9 = 23.0;
  }
  [v6 setFontSize:a2 rebaseSelector:v9];
  return v6;
}

- (id)remoteUIDetailLabel:(int)a3
{
  id v5 = [(GKTextStyle *)self copy];
  id v6 = [(GKTextStyle *)self palette];
  BOOL v7 = [v6 standardTextColor];
  [v5 setColor:v7];

  [v5 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  [v5 setFontSize:a2 rebaseSelector:12.0];
  return v5;
}

- (id)remoteUITableHeaderLabel:(int)a3
{
  id v6 = [(GKTextStyle *)self copy];
  BOOL v7 = [(GKTextStyle *)self palette];
  uint64_t v8 = [v7 emphasizedTextColor];
  [v6 setColor:v8];

  if (a3 == 2)
  {
    [v6 setFontName:@"GKMagicLightSystemFont" rebaseSelector:a2];
    [v6 setFontSize:a2 rebaseSelector:60.0];
    [v6 setMinimumLineHeight:71.0];
  }
  else
  {
    [v6 setFontName:@"GKMagicLightSystemFont" rebaseSelector:a2];
    if (a3) {
      double v9 = 35.0;
    }
    else {
      double v9 = 31.0;
    }
    [v6 setFontSize:a2 rebaseSelector:v9];
  }
  [v6 setTextAlignment:1];
  [v6 setLineBreakMode:0];
  return v6;
}

- (id)remoteUITableHeaderSubLabel:(int)a3
{
  id v6 = [(GKTextStyle *)self copy];
  BOOL v7 = [(GKTextStyle *)self palette];
  uint64_t v8 = [v7 emphasizedTextColor];
  [v6 setColor:v8];

  [v6 setTextAlignment:1];
  [v6 setLineBreakMode:0];
  double v9 = @"GKMagicLightSystemFont";
  double v10 = 17.0;
  double v11 = 16.0;
  if (a3 == 2)
  {
    double v9 = @"GKMagicSystemFont";
    double v10 = 21.0;
  }
  else
  {
    double v11 = 11.0;
  }
  if (a3) {
    double v12 = v9;
  }
  else {
    double v12 = @"GKMagicSystemFont";
  }
  if (a3) {
    double v13 = v10;
  }
  else {
    double v13 = 14.0;
  }
  if (a3) {
    double v14 = v11;
  }
  else {
    double v14 = 11.0;
  }
  objc_msgSend(v6, "setFontName:rebaseSelector:", v12, a2, 11.0, 14.0, v10, v11, 21.0);
  [v6 setFontSize:a2 rebaseSelector:v13];
  [v6 setMinimumLineHeight:v14];
  return v6;
}

- (id)remoteUITableFooterButton:(int)a3
{
  id v6 = [(GKTextStyle *)self copy];
  BOOL v7 = [(GKTextStyle *)self palette];
  uint64_t v8 = [v7 systemInteractionColor];
  [v6 setColor:v8];

  [v6 setTextAlignment:1];
  [v6 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  double v9 = 23.0;
  if (a3 == 2) {
    double v9 = 30.0;
  }
  [v6 setFontSize:a2 rebaseSelector:v9];
  return v6;
}

- (id)remoteUITableHeaderButton:(int)a3
{
  id v5 = [(GKTextStyle *)self copy];
  id v6 = [(GKTextStyle *)self palette];
  BOOL v7 = [v6 systemInteractionColor];
  [v5 setColor:v7];

  [v5 setTextAlignment:1];
  [v5 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  [v5 setFontSize:a2 rebaseSelector:14.0];
  return v5;
}

- (id)remoteUIEditField:(int)a3
{
  id v5 = [(GKTextStyle *)self copy];
  id v6 = [(GKTextStyle *)self palette];
  BOOL v7 = [v6 emphasizedTextColor];
  [v5 setColor:v7];

  [v5 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  [v5 setFontSize:a2 rebaseSelector:14.0];
  [v5 setTextAlignment:4];
  return v5;
}

- (id)remoteUIEditLabel:(int)a3
{
  id v5 = [(GKTextStyle *)self copy];
  id v6 = [(GKTextStyle *)self palette];
  BOOL v7 = [v6 emphasizedTextColor];
  [v5 setColor:v7];

  [v5 setFontName:@"GKMagicBoldSystemFont" rebaseSelector:a2];
  [v5 setFontSize:a2 rebaseSelector:13.0];
  [v5 setTextAlignment:4];
  return v5;
}

- (id)remoteUISelectLabel:(int)a3
{
  id v5 = [(GKTextStyle *)self copy];
  id v6 = [(GKTextStyle *)self palette];
  BOOL v7 = [v6 emphasizedTextColor];
  [v5 setColor:v7];

  [v5 setFontName:@"GKMagicBoldSystemFont" rebaseSelector:a2];
  [v5 setFontSize:a2 rebaseSelector:13.0];
  [v5 setTextAlignment:4];
  return v5;
}

- (id)remoteUISelectField:(int)a3
{
  id v5 = [(GKTextStyle *)self copy];
  id v6 = [(GKTextStyle *)self palette];
  BOOL v7 = [v6 standardTextColor];
  [v5 setColor:v7];

  [v5 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  [v5 setFontSize:a2 rebaseSelector:14.0];
  [v5 setTextAlignment:4];
  return v5;
}

- (id)remoteUINickNameField:(int)a3
{
  id v6 = [(GKTextStyle *)self copy];
  BOOL v7 = [(GKTextStyle *)self palette];
  uint64_t v8 = [v7 emphasizedTextColor];
  [v6 setColor:v8];

  if (a3 == 2) {
    double v9 = 22.0;
  }
  else {
    double v9 = 14.0;
  }
  [v6 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  [v6 setFontSize:a2 rebaseSelector:v9];
  [v6 setTextAlignment:4];
  return v6;
}

- (id)remoteUINickNameLabel:(int)a3
{
  id v6 = [(GKTextStyle *)self copy];
  BOOL v7 = [(GKTextStyle *)self palette];
  uint64_t v8 = [v7 emphasizedTextColor];
  [v6 setColor:v8];

  double v9 = 14.0;
  if (a3 == 2) {
    double v9 = 18.0;
  }
  if (a3) {
    double v10 = v9;
  }
  else {
    double v10 = 13.0;
  }
  objc_msgSend(v6, "setFontName:rebaseSelector:", @"GKMagicBoldSystemFont", a2, v9);
  [v6 setFontSize:a2 rebaseSelector:v10];
  [v6 setTextAlignment:4];
  return v6;
}

- (id)settingsLinkText
{
  id v3 = [(GKTextStyle *)self copy];
  id v4 = [MEMORY[0x263F1C550] systemBlueColor];
  [v3 setColor:v4];

  [v3 setTextAlignment:4];
  [v3 setFontSize:a2 rebaseSelector:14.0];
  return v3;
}

- (id)settingsButton
{
  id v3 = [(GKTextStyle *)self copy];
  id v4 = [MEMORY[0x263F1C550] systemBlueColor];
  [v3 setColor:v4];

  [v3 setTextAlignment:4];
  [v3 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  [v3 setFontSize:a2 rebaseSelector:17.0];
  return v3;
}

- (id)settingsBoldButton
{
  id v3 = [(GKTextStyle *)self copy];
  id v4 = [MEMORY[0x263F1C550] systemBlueColor];
  [v3 setColor:v4];

  [v3 setTextAlignment:4];
  [v3 setFontName:@"GKMagicBoldSystemFont" rebaseSelector:a2];
  [v3 setFontSize:a2 rebaseSelector:17.0];
  return v3;
}

- (id)settingsLabel
{
  id v4 = [(GKTextStyle *)self copy];
  id v5 = [(GKTextStyle *)self palette];
  id v6 = [v5 emphasizedTextColor];
  [v4 setColor:v6];

  [v4 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:17.0];
  return v4;
}

- (id)settingsHeader
{
  id v3 = [(GKTextStyle *)self copy];
  id v4 = [MEMORY[0x263F1C550] secondaryLabelColor];
  [v3 setColor:v4];

  [v3 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  [v3 setFontSize:a2 rebaseSelector:14.0];
  return v3;
}

- (id)settingsFooter
{
  id v3 = [(GKTextStyle *)self copy];
  id v4 = [MEMORY[0x263F1C550] tertiaryLabelColor];
  [v3 setColor:v4];

  [v3 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  [v3 setFontSize:a2 rebaseSelector:14.0];
  return v3;
}

- (GKTextStyle)styleWithName:(id)a3 fallback:(id)a4 layoutMode:(int)a5
{
  uint64_t v8 = (NSString *)a4;
  double v9 = (NSString *)a3;
  SEL v10 = NSSelectorFromString(v9);
  double v11 = [(NSString *)v9 stringByAppendingString:@":"];

  double v12 = NSSelectorFromString(v11);
  if (objc_opt_respondsToSelector()) {
    goto LABEL_2;
  }
  if (objc_opt_respondsToSelector()) {
    goto LABEL_4;
  }
  if (v8)
  {
    SEL v10 = NSSelectorFromString(v8);
    BOOL v16 = [(NSString *)v8 stringByAppendingString:@":"];
    double v12 = NSSelectorFromString(v16);

    if (objc_opt_respondsToSelector())
    {
LABEL_2:
      uint64_t v13 = [(GKTextStyle *)self _gkInvokeSelector:v10];
LABEL_5:
      double v14 = (void *)v13;
      goto LABEL_6;
    }
    if (objc_opt_respondsToSelector())
    {
LABEL_4:
      uint64_t v13 = objc_msgSend(self, v12, a5);
      goto LABEL_5;
    }
  }
  double v14 = 0;
LABEL_6:

  return (GKTextStyle *)v14;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (int64_t)lineBreakMode
{
  return self->_lineBreakMode;
}

- (GKColorPalette)palette
{
  return self->_palette;
}

- (void)setPalette:(id)a3
{
}

- (NSString)fontName
{
  return self->_fontName;
}

- (void)setFontName:(id)a3
{
}

- (NSString)UIKitFontTextStyleName
{
  return self->_UIKitFontTextStyleName;
}

- (void)setUIKitFontTextStyleName:(id)a3
{
}

- (double)fontSize
{
  return self->_fontSize;
}

- (double)minimumLineHeight
{
  return self->_minimumLineHeight;
}

- (double)m34
{
  return self->_m34;
}

- (void)setM34:(double)a3
{
  self->_double m34 = a3;
}

- (double)zPosition
{
  return self->_zPosition;
}

- (void)setZPosition:(double)a3
{
  self->_double zPosition = a3;
}

- (BOOL)needsParagraphStyle
{
  return self->_needsParagraphStyle;
}

- (void)setNeedsParagraphStyle:(BOOL)a3
{
  self->_needsParagraphStyle = a3;
}

- (BOOL)overrideUIKitFontSize
{
  return self->_overrideUIKitFontSize;
}

- (void)setOverrideUIKitFontSize:(BOOL)a3
{
  self->_overrideUIKitFontSize = a3;
}

- (SEL)fontSizeRebaseSelector
{
  if (self->_fontSizeRebaseSelector) {
    return self->_fontSizeRebaseSelector;
  }
  else {
    return 0;
  }
}

- (void)setFontSizeRebaseSelector:(SEL)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = 0;
  }
  self->_SEL fontSizeRebaseSelector = v3;
}

- (SEL)fontNameRebaseSelector
{
  if (self->_fontNameRebaseSelector) {
    return self->_fontNameRebaseSelector;
  }
  else {
    return 0;
  }
}

- (void)setFontNameRebaseSelector:(SEL)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = 0;
  }
  self->_fontNameRebaseSelector = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UIKitFontTextStyleName, 0);
  objc_storeStrong((id *)&self->_fontName, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end