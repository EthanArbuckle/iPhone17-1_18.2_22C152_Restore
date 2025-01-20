@interface CSProminentTimeView
+ (id)_lightVariantForBaseFont:(id)a3 size:(double)a4;
+ (id)_prominentFontFromBaseFont:(id)a3 usingLightVariant:(BOOL)a4 usingLandscapeVariant:(BOOL)a5;
+ (unint64_t)elementType;
- (BOOL)animatesTimeChanges;
- (BOOL)fourDigitTime;
- (BOOL)isVisible;
- (BOOL)usesLandscapeTimeFontVariant;
- (BOOL)usesLightTimeFontVariant;
- (CSProminentTimeView)initWithDate:(id)a3 baseFont:(id)a4 textColor:(id)a5;
- (CSProminentTimeView)initWithDate:(id)a3 font:(id)a4 textColor:(id)a5;
- (NSDateFormatter)timeFormatter;
- (UIFont)baseFont;
- (id)_correctedDateFormat;
- (id)_localeAccountingForNumberingSystem:(BOOL)a3;
- (id)_timeString;
- (int64_t)numberingSystem;
- (void)_updateTimeFormatter;
- (void)_updateTimeFormatterNumberingSystem;
- (void)_updateTimeString;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAnimatesTimeChanges:(BOOL)a3;
- (void)setBaseFont:(id)a3;
- (void)setDate:(id)a3;
- (void)setFourDigitTime:(BOOL)a3;
- (void)setNumberingSystem:(int64_t)a3;
- (void)setTimeFormatter:(id)a3;
- (void)setUsesLandscapeTimeFontVariant:(BOOL)a3;
- (void)setUsesLightTimeFontVariant:(BOOL)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation CSProminentTimeView

- (void)setDate:(id)a3
{
  id v4 = a3;
  v5 = [(CSProminentTextElementView *)self date];
  v7.receiver = self;
  v7.super_class = (Class)CSProminentTimeView;
  [(CSProminentTextElementView *)&v7 setDate:v4];
  char v6 = BSEqualObjects();

  if ((v6 & 1) == 0) {
    [(CSProminentTimeView *)self _updateTimeString];
  }
}

- (BOOL)fourDigitTime
{
  return self->_fourDigitTime;
}

- (void)_updateTimeString
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (CSTimeNumberingSystemTypeRequiresLanguageTagging([(CSProminentTimeView *)self numberingSystem])
    && ([(CSProminentTextElementView *)self textLabel],
        v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = objc_opt_respondsToSelector(),
        v3,
        (v4 & 1) != 0))
  {
    v5 = CSTimeNumberingSystemTypeLanguageTag([(CSProminentTimeView *)self numberingSystem]);
    uint64_t v13 = *MEMORY[0x1E4F284F8];
    v14[0] = v5;
    char v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
    v8 = [(CSProminentTimeView *)self _timeString];
    v9 = (void *)[v7 initWithString:v8 attributes:v6];

    v10 = [(CSProminentTextElementView *)self textLabel];
    [v10 setAttributedText:v9];
  }
  else
  {
    v5 = [(CSProminentTextElementView *)self textLabel];
    char v6 = [(CSProminentTimeView *)self _timeString];
    [v5 setText:v6];
  }

  v11 = [(CSProminentTimeView *)self _timeString];
  BOOL v12 = (unint64_t)[v11 length] > 4;

  [(CSProminentTimeView *)self setFourDigitTime:v12];
  [(CSProminentTimeView *)self setNeedsLayout];
}

- (id)_timeString
{
  v3 = [(CSProminentTextElementView *)self date];
  if (v3)
  {
    char v4 = [(NSDateFormatter *)self->_timeFormatter stringFromDate:v3];
  }
  else
  {
    char v4 = &stru_1F047CE98;
  }

  return v4;
}

- (void)setFourDigitTime:(BOOL)a3
{
  self->_fourDigitTime = a3;
}

- (int64_t)numberingSystem
{
  return self->_numberingSystem;
}

- (CSProminentTimeView)initWithDate:(id)a3 font:(id)a4 textColor:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)CSProminentTimeView;
  v5 = [(CSProminentTextElementView *)&v13 initWithDate:a3 font:a4 textColor:a5];
  char v6 = v5;
  if (v5)
  {
    [(CSProminentTimeView *)v5 _updateTimeFormatter];
    id v7 = [(CSProminentTextElementView *)v6 textLabel];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = [(CSProminentTextElementView *)v6 textLabel];
      [v9 setAdjustsFontSizeToFitWidth:1];
    }
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v6 selector:sel_currentLocaleDidChange_ name:*MEMORY[0x1E4F1C370] object:0];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v6 selector:sel__updateTimeString name:*MEMORY[0x1E4F1C4F8] object:0];
  }
  return v6;
}

- (CSProminentTimeView)initWithDate:(id)a3 baseFont:(id)a4 textColor:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  BOOL v12 = [(id)objc_opt_class() _prominentFontFromBaseFont:v9 usingLightVariant:self->_usesLightTimeFontVariant usingLandscapeVariant:0];
  objc_super v13 = [(CSProminentTimeView *)self initWithDate:v11 font:v12 textColor:v10];

  if (v13) {
    objc_storeStrong((id *)&v13->_baseFont, a4);
  }

  return v13;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CSProminentTimeView;
  [(CSProminentTimeView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)CSProminentTimeView;
  [(CSProminentTextElementView *)&v21 layoutSubviews];
  v3 = [(CSProminentTextElementView *)self textLabel];
  uint64_t v4 = [v3 textAlignment];

  if (v4 == 1)
  {
    [(CSProminentTimeView *)self bounds];
    double v6 = v5;
    double v8 = v7;
    id v9 = [(id)objc_opt_class() _prominentFontFromBaseFont:self->_baseFont usingLightVariant:0 usingLandscapeVariant:self->_usesLandscapeTimeFontVariant];
    id v10 = [(CSProminentTextElementView *)self textLabel];
    id v11 = [v10 text];
    uint64_t v22 = *MEMORY[0x1E4FB06F8];
    v23[0] = v9;
    BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", 0, v12, 0, v6, v8);
    double v14 = v13;

    if (v14 > v6) {
      double v14 = v6;
    }
    v15 = [(CSProminentTimeView *)self traitCollection];
    [v15 displayScale];

    BSPointRoundForScale();
    double v17 = v16;
    double v19 = v18;
    v20 = [(CSProminentTextElementView *)self textLabel];
    objc_msgSend(v20, "setFrame:", v17, v19, v14, v8);
  }
}

+ (unint64_t)elementType
{
  return 1;
}

- (void)setUsesLightTimeFontVariant:(BOOL)a3
{
  if ((BSEqualBools() & 1) == 0)
  {
    self->_usesLightTimeFontVariant = a3;
    id v5 = [(id)objc_opt_class() _prominentFontFromBaseFont:self->_baseFont usingLightVariant:self->_usesLightTimeFontVariant usingLandscapeVariant:self->_usesLandscapeTimeFontVariant];
    [(CSProminentTextElementView *)self setPrimaryFont:v5];
  }
}

- (void)setUsesLandscapeTimeFontVariant:(BOOL)a3
{
  LODWORD(v3) = a3;
  id v5 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  int v6 = [v5 deviceClass];

  if (v6 == 2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = v3;
  }
  if ((BSEqualBools() & 1) == 0)
  {
    self->_usesLandscapeTimeFontVariant = v3;
    id v7 = [(id)objc_opt_class() _prominentFontFromBaseFont:self->_baseFont usingLightVariant:self->_usesLightTimeFontVariant usingLandscapeVariant:v3];
    [(CSProminentTextElementView *)self setPrimaryFont:v7];
  }
}

- (BOOL)animatesTimeChanges
{
  uint64_t v3 = [(CSProminentTextElementView *)self textLabel];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(CSProminentTextElementView *)self textLabel];
  char v6 = [v5 animatesChanges];

  return v6;
}

- (void)setAnimatesTimeChanges:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CSProminentTextElementView *)self textLabel];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CSProminentTextElementView *)self textLabel];
    [v7 setAnimatesChanges:v3];
  }
}

- (BOOL)isVisible
{
  BOOL v3 = [(CSProminentTextElementView *)self textLabel];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(CSProminentTextElementView *)self textLabel];
  char v6 = [v5 isVisible];

  return v6;
}

- (void)setVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CSProminentTextElementView *)self textLabel];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CSProminentTextElementView *)self textLabel];
    [v7 setVisible:v3];
  }
}

- (void)setBaseFont:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_baseFont, a3);
    id v5 = [(id)objc_opt_class() _prominentFontFromBaseFont:v6 usingLightVariant:self->_usesLightTimeFontVariant usingLandscapeVariant:self->_usesLandscapeTimeFontVariant];
    [(CSProminentTextElementView *)self setPrimaryFont:v5];
  }
}

- (void)setNumberingSystem:(int64_t)a3
{
  if (self->_numberingSystem != a3)
  {
    self->_numberingSystem = a3;
    [(CSProminentTimeView *)self _updateTimeFormatterNumberingSystem];
  }
}

- (void)_updateTimeFormatterNumberingSystem
{
  timeFormatter = self->_timeFormatter;
  char v4 = [(CSProminentTimeView *)self _localeAccountingForNumberingSystem:1];
  [(NSDateFormatter *)timeFormatter setLocale:v4];

  id v5 = self->_timeFormatter;
  id v6 = [(CSProminentTimeView *)self _correctedDateFormat];
  [(NSDateFormatter *)v5 setDateFormat:v6];

  [(CSProminentTimeView *)self _updateTimeString];
}

- (void)_updateTimeFormatter
{
  BOOL v3 = [MEMORY[0x1E4F4F708] sharedInstance];
  [v3 resetFormattersIfNecessary];

  id v8 = [(CSProminentTimeView *)self _localeAccountingForNumberingSystem:1];
  char v4 = [MEMORY[0x1E4F4F708] formatterForDateAsTimeNoAMPMWithLocale:v8];
  timeFormatter = self->_timeFormatter;
  self->_timeFormatter = v4;

  id v6 = self->_timeFormatter;
  id v7 = [(CSProminentTimeView *)self _correctedDateFormat];
  [(NSDateFormatter *)v6 setDateFormat:v7];

  [(CSProminentTimeView *)self _updateTimeString];
}

- (id)_correctedDateFormat
{
  v2 = [(CSProminentTimeView *)self _localeAccountingForNumberingSystem:0];
  BOOL v3 = [MEMORY[0x1E4F4F708] formatterForDateAsTimeNoAMPMWithLocale:v2];
  char v4 = [v3 dateFormat];

  return v4;
}

- (id)_localeAccountingForNumberingSystem:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  uint64_t v6 = CSTimeNumberingSystemTypeToString([(CSProminentTimeView *)self numberingSystem]);
  id v7 = (void *)v6;
  if (v3 && v6)
  {
    id v8 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v9 = [v8 localeIdentifier];

    id v10 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v9];
    id v11 = (void *)[v10 mutableCopy];

    [v11 setObject:v7 forKey:@"numbers"];
    BOOL v12 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v11];
    uint64_t v13 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v12];

    id v5 = (void *)v13;
  }

  return v5;
}

+ (id)_prominentFontFromBaseFont:(id)a3 usingLightVariant:(BOOL)a4 usingLandscapeVariant:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4FB08E0] systemFontOfSize:0.0];
  }
  id v11 = v10;
  +[CSProminentLayoutController fontSizeForElementType:isLandscapeVariant:](CSProminentLayoutController, "fontSizeForElementType:isLandscapeVariant:", [a1 elementType], v5);
  double v13 = v12;
  if (v6)
  {
    double v14 = [a1 _lightVariantForBaseFont:v11 size:v12];
  }
  else
  {
    v15 = [v11 fontDescriptor];
    double v14 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v15 size:v13];
  }

  return v14;
}

+ (id)_lightVariantForBaseFont:(id)a3 size:(double)a4
{
  id v5 = a3;
  if (objc_msgSend(v5, "cs_supportsVariantWeights"))
  {
    uint64_t v6 = objc_msgSend(v5, "cs_variantWeightRange");
    uint64_t v8 = (uint64_t)((double)(unint64_t)(v7 - v6) * 0.1);
    uint64_t v9 = objc_msgSend(v5, "cs_variantWeight");
    if (v9 - v8 <= v6) {
      uint64_t v10 = v6;
    }
    else {
      uint64_t v10 = v9 - v8;
    }
    id v11 = objc_msgSend(v5, "cs_fontWithVariantWeight:", v10);
    double v12 = [v11 fontWithSize:a4];
  }
  else
  {
    double v12 = [v5 fontWithSize:a4];
  }

  return v12;
}

- (BOOL)usesLightTimeFontVariant
{
  return self->_usesLightTimeFontVariant;
}

- (BOOL)usesLandscapeTimeFontVariant
{
  return self->_usesLandscapeTimeFontVariant;
}

- (UIFont)baseFont
{
  return self->_baseFont;
}

- (NSDateFormatter)timeFormatter
{
  return self->_timeFormatter;
}

- (void)setTimeFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeFormatter, 0);

  objc_storeStrong((id *)&self->_baseFont, 0);
}

@end