@interface MKInfoCardThemeManager
+ (id)currentTheme;
+ (id)themeWithThemeType:(unint64_t)a3;
+ (unint64_t)themeType;
+ (void)setTheme:(unint64_t)a3;
+ (void)setTintColorProvider:(id)a3;
- (BOOL)_isInSpotlightContext;
- (BOOL)isDarkTheme;
- (BOOL)useSmallFont;
- (MKInfoCardThemeManager)init;
- (NSString)javaScriptName;
- (UIColor)buttonHighlightedColor;
- (UIColor)buttonNormalColor;
- (UIColor)cardBackgroundColor;
- (UIColor)disabledActionRowBackgroundColor;
- (UIColor)disabledActionRowTextColor;
- (UIColor)headerPrimaryButtonHighlightedColor;
- (UIColor)headerPrimaryButtonNormalColor;
- (UIColor)highlightedTintColor;
- (UIColor)lightTextColor;
- (UIColor)normalActionRowBackgroundColor;
- (UIColor)normalActionRowBackgroundPressedColor;
- (UIColor)normalBackgroundColor;
- (UIColor)ratingBarBackgroundColor;
- (UIColor)ratingBarEndColor;
- (UIColor)ratingBarStartColor;
- (UIColor)rowColor;
- (UIColor)selectedRowColor;
- (UIColor)separatorLineColor;
- (UIColor)tertiaryTextColor;
- (UIColor)textColor;
- (UIColor)tintColor;
- (UIColor)transitChevronBackgroundColor;
- (UIColor)transitDelayedTextColor;
- (UIColor)transitIncidentBackgroundColor;
- (UIColor)transitOntimeTextColor;
- (id)_initWithThemeType:(unint64_t)a3;
- (unint64_t)_currentSystemTheme;
- (unint64_t)themeType;
- (void)_setTheme:(unint64_t)a3;
- (void)_setTintColorProvider:(id)a3;
- (void)setUseSmallFont:(BOOL)a3;
@end

@implementation MKInfoCardThemeManager

void __38__MKInfoCardThemeManager_currentTheme__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _initWithThemeType:0];
  v2 = (void *)qword_1EB3161F8;
  qword_1EB3161F8 = v1;
}

- (id)_initWithThemeType:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKInfoCardThemeManager;
  v4 = [(MKInfoCardThemeManager *)&v7 init];
  v5 = v4;
  if (v4)
  {
    if (!a3) {
      a3 = [(MKInfoCardThemeManager *)v4 _currentSystemTheme];
    }
    [(MKInfoCardThemeManager *)v5 _setTheme:a3];
  }
  return v5;
}

- (void)_setTheme:(unint64_t)a3
{
  v39[25] = *MEMORY[0x1E4F143B8];
  if ([(MKInfoCardThemeManager *)self themeType] != a3)
  {
    self->_themeType = a3;
    if (a3 == 2)
    {
      v36[0] = @"textColor";
      v35 = [MEMORY[0x1E4F428B8] labelColor];
      v37[0] = v35;
      v36[1] = @"lightTextColor";
      v34 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
      v37[1] = v34;
      v36[2] = @"tertiaryTextColor";
      v33 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
      v37[2] = v33;
      v36[3] = @"separatorLineColor";
      v32 = [MEMORY[0x1E4F428B8] quaternaryLabelColor];
      v37[3] = v32;
      v36[4] = @"selectedRowColor";
      v31 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.100000001];
      v37[4] = v31;
      v36[5] = @"tintColor";
      v30 = [MEMORY[0x1E4F428B8] redColor];
      v37[5] = v30;
      v36[6] = @"highlightedTintColor";
      v29 = [(MKInfoCardThemeManager *)self tintColor];
      v28 = [v29 colorWithAlphaComponent:0.25];
      v37[6] = v28;
      v36[7] = @"rowColor";
      v27 = [MEMORY[0x1E4F428B8] clearColor];
      v37[7] = v27;
      v36[8] = @"disabledActionRowTextColor";
      v26 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.200000003];
      v37[8] = v26;
      v36[9] = @"disabledActionRowBackgroundColor";
      v25 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.0500000007];
      v37[9] = v25;
      v36[10] = @"normalActionRowBackgroundColor";
      v24 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.0599999987];
      v37[10] = v24;
      v36[11] = @"normalActionRowBackgroundPressedColor";
      v23 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.180000007];
      v37[11] = v23;
      v36[12] = @"headerPrimaryButtonNormalColor";
      v22 = [MEMORY[0x1E4F428B8] redColor];
      v37[12] = v22;
      v36[13] = @"headerPrimaryButtonHighlightedColor";
      v21 = [MEMORY[0x1E4F428B8] colorWithRed:0.286274523 green:0.749019623 blue:0.937254906 alpha:1.0];
      v37[13] = v21;
      v36[14] = @"buttonNormalColor";
      v20 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.899999976];
      v37[14] = v20;
      v36[15] = @"buttonHighlightedColor";
      v19 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.400000006];
      v37[15] = v19;
      v36[16] = @"transitOntimeTextColor";
      v5 = [MEMORY[0x1E4F428B8] systemGreenColor];
      v37[16] = v5;
      v36[17] = @"transitDelayedTextColor";
      v6 = [MEMORY[0x1E4F428B8] systemRedColor];
      v37[17] = v6;
      v36[18] = @"transitChevronBackgroundColor";
      objc_super v7 = [MEMORY[0x1E4F428B8] colorWithRed:0.949019611 green:0.956862748 blue:0.988235295 alpha:0.140000001];
      v37[18] = v7;
      v36[19] = @"normalBackgroundColor";
      v8 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.100000001];
      v37[19] = v8;
      v36[20] = @"ratingBarStartColor";
      v9 = [MEMORY[0x1E4F428B8] colorWithRed:0.556862772 green:0.556862772 blue:0.576470613 alpha:1.0];
      v37[20] = v9;
      v36[21] = @"ratingBarEndColor";
      v10 = [MEMORY[0x1E4F428B8] labelColor];
      v37[21] = v10;
      v36[22] = @"ratingBarBackgroundColor";
      v11 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.0500000007];
      v37[22] = v11;
      v36[23] = @"transitIncidentBackgroundColor";
      v12 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.100000001];
      v37[23] = v12;
      v36[24] = @"mapsui_cardBackgroundColor";
      v13 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:1.0];
      v37[24] = v13;
      v14 = (void *)MEMORY[0x1E4F1C9E8];
      v15 = v37;
      v16 = v36;
    }
    else
    {
      if (a3 != 1) {
        return;
      }
      v38[0] = @"textColor";
      v35 = [MEMORY[0x1E4F428B8] labelColor];
      v39[0] = v35;
      v38[1] = @"lightTextColor";
      v34 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
      v39[1] = v34;
      v38[2] = @"tertiaryTextColor";
      v33 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
      v39[2] = v33;
      v38[3] = @"separatorLineColor";
      v32 = [MEMORY[0x1E4F428B8] quaternaryLabelColor];
      v39[3] = v32;
      v38[4] = @"tintColor";
      v31 = [MEMORY[0x1E4F428B8] redColor];
      v39[4] = v31;
      v38[5] = @"highlightedTintColor";
      v30 = [(MKInfoCardThemeManager *)self tintColor];
      v29 = [v30 colorWithAlphaComponent:0.25];
      v39[5] = v29;
      v38[6] = @"rowColor";
      v28 = [MEMORY[0x1E4F428B8] clearColor];
      v39[6] = v28;
      v38[7] = @"selectedRowColor";
      v27 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.0599999987];
      v39[7] = v27;
      v38[8] = @"disabledActionRowTextColor";
      v26 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.200000003];
      v39[8] = v26;
      v38[9] = @"disabledActionRowBackgroundColor";
      v25 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.0399999991];
      v39[9] = v25;
      v38[10] = @"normalActionRowBackgroundColor";
      v24 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.0599999987];
      v39[10] = v24;
      v38[11] = @"normalActionRowBackgroundPressedColor";
      v23 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.100000001];
      v39[11] = v23;
      v38[12] = @"headerPrimaryButtonNormalColor";
      v22 = [MEMORY[0x1E4F428B8] redColor];
      v39[12] = v22;
      v38[13] = @"headerPrimaryButtonHighlightedColor";
      v21 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.419607848 blue:0.87843138 alpha:1.0];
      v39[13] = v21;
      v38[14] = @"buttonNormalColor";
      v20 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.899999976];
      v39[14] = v20;
      v38[15] = @"buttonHighlightedColor";
      v19 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.400000006];
      v39[15] = v19;
      v38[16] = @"transitOntimeTextColor";
      v5 = [MEMORY[0x1E4F428B8] systemGreenColor];
      v39[16] = v5;
      v38[17] = @"transitDelayedTextColor";
      v6 = [MEMORY[0x1E4F428B8] systemRedColor];
      v39[17] = v6;
      v38[18] = @"transitChevronBackgroundColor";
      objc_super v7 = [MEMORY[0x1E4F428B8] colorWithRed:0.0392156877 green:0.0392156877 blue:0.470588237 alpha:0.0500000007];
      v39[18] = v7;
      v38[19] = @"normalBackgroundColor";
      v8 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.100000001];
      v39[19] = v8;
      v38[20] = @"ratingBarStartColor";
      v9 = [MEMORY[0x1E4F428B8] colorWithRed:0.556862772 green:0.556862772 blue:0.576470613 alpha:1.0];
      v39[20] = v9;
      v38[21] = @"ratingBarEndColor";
      v10 = [MEMORY[0x1E4F428B8] labelColor];
      v39[21] = v10;
      v38[22] = @"ratingBarBackgroundColor";
      v11 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.0500000007];
      v39[22] = v11;
      v38[23] = @"transitIncidentBackgroundColor";
      v12 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:1.0];
      v39[23] = v12;
      v38[24] = @"mapsui_cardBackgroundColor";
      v13 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:1.0];
      v39[24] = v13;
      v14 = (void *)MEMORY[0x1E4F1C9E8];
      v15 = v39;
      v16 = v38;
    }
    v17 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:25];
    colors = self->_colors;
    self->_colors = v17;
  }
}

- (UIColor)tintColor
{
  tintColorProvider = (void (**)(id, SEL))self->_tintColorProvider;
  if (tintColorProvider)
  {
    v4 = tintColorProvider[2](tintColorProvider, a2);
  }
  else
  {
    if (self->_themeType == 2)
    {
      double v5 = 0.109803922;
      double v6 = 0.686274529;
      double v7 = 0.925490201;
    }
    else
    {
      double v6 = 0.478431374;
      double v5 = 0.0;
      double v7 = 1.0;
    }
    v4 = [MEMORY[0x1E4F428B8] colorWithRed:v5 green:v6 blue:v7 alpha:1.0];
  }

  return (UIColor *)v4;
}

- (unint64_t)themeType
{
  return self->_themeType;
}

- (unint64_t)_currentSystemTheme
{
  return 1;
}

+ (void)setTintColorProvider:(id)a3
{
  id v4 = a3;
  id v5 = [a1 currentTheme];
  [v5 _setTintColorProvider:v4];
}

- (void)_setTintColorProvider:(id)a3
{
  id v4 = (void *)[a3 copy];
  id tintColorProvider = self->_tintColorProvider;
  self->_id tintColorProvider = v4;
}

+ (id)currentTheme
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MKInfoCardThemeManager_currentTheme__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB316200 != -1) {
    dispatch_once(&qword_1EB316200, block);
  }
  v2 = (void *)qword_1EB3161F8;

  return v2;
}

- (BOOL)_isInSpotlightContext
{
  if (qword_1EB3161F0 != -1) {
    dispatch_once(&qword_1EB3161F0, &__block_literal_global_98);
  }
  return _MergedGlobals_173;
}

void __47__MKInfoCardThemeManager__isInSpotlightContext__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v1 bundleIdentifier];
  _MergedGlobals_173 = [v0 isEqualToString:@"com.apple.Spotlight"];
}

+ (id)themeWithThemeType:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) _initWithThemeType:a3];

  return v3;
}

+ (void)setTheme:(unint64_t)a3
{
  id v4 = [a1 currentTheme];
  if (v4)
  {
    v4[8] = 1;
    id v5 = v4;
    [v4 _setTheme:a3];
    id v4 = v5;
  }
}

+ (unint64_t)themeType
{
  v2 = [a1 currentTheme];
  unint64_t v3 = [v2 themeType];

  return v3;
}

- (MKInfoCardThemeManager)init
{
  return 0;
}

- (BOOL)isDarkTheme
{
  return self->_themeType == 2;
}

- (UIColor)textColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"textColor"];
}

- (UIColor)lightTextColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"lightTextColor"];
}

- (UIColor)tertiaryTextColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"tertiaryTextColor"];
}

- (UIColor)highlightedTintColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"highlightedTintColor"];
}

- (UIColor)separatorLineColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"separatorLineColor"];
}

- (UIColor)rowColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"rowColor"];
}

- (UIColor)selectedRowColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"selectedRowColor"];
}

- (UIColor)disabledActionRowTextColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"disabledActionRowTextColor"];
}

- (UIColor)normalActionRowBackgroundColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"normalActionRowBackgroundColor"];
}

- (UIColor)disabledActionRowBackgroundColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"disabledActionRowBackgroundColor"];
}

- (UIColor)normalActionRowBackgroundPressedColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"normalActionRowBackgroundPressedColor"];
}

- (UIColor)headerPrimaryButtonNormalColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"headerPrimaryButtonNormalColor"];
}

- (UIColor)headerPrimaryButtonHighlightedColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"headerPrimaryButtonHighlightedColor"];
}

- (UIColor)buttonNormalColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"buttonNormalColor"];
}

- (UIColor)buttonHighlightedColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"buttonHighlightedColor"];
}

- (UIColor)transitOntimeTextColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"transitOntimeTextColor"];
}

- (UIColor)transitDelayedTextColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"transitDelayedTextColor"];
}

- (UIColor)transitChevronBackgroundColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"transitChevronBackgroundColor"];
}

- (UIColor)normalBackgroundColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"normalBackgroundColor"];
}

- (UIColor)ratingBarStartColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"ratingBarStartColor"];
}

- (UIColor)ratingBarEndColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"ratingBarEndColor"];
}

- (UIColor)ratingBarBackgroundColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"ratingBarBackgroundColor"];
}

- (UIColor)transitIncidentBackgroundColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"transitIncidentBackgroundColor"];
}

- (UIColor)cardBackgroundColor
{
  return (UIColor *)[(NSDictionary *)self->_colors objectForKeyedSubscript:@"mapsui_cardBackgroundColor"];
}

- (NSString)javaScriptName
{
  unint64_t themeType = self->_themeType;
  unint64_t v3 = @"invalid";
  if (themeType == 1) {
    unint64_t v3 = @"light";
  }
  if (themeType == 2) {
    return (NSString *)@"dark";
  }
  else {
    return &v3->isa;
  }
}

- (BOOL)useSmallFont
{
  return self->_useSmallFont;
}

- (void)setUseSmallFont:(BOOL)a3
{
  self->_useSmallFont = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tintColorProvider, 0);

  objc_storeStrong((id *)&self->_colors, 0);
}

@end