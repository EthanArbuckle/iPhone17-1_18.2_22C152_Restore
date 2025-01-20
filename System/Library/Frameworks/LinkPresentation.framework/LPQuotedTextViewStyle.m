@interface LPQuotedTextViewStyle
- (BOOL)showCharacterLimitIndicator;
- (BOOL)showQuoteIndicator;
- (LPQuotedTextViewStyle)initWithPlatform:(int64_t)a3 sizeClass:(unint64_t)a4 fontScalingFactor:(double)a5;
- (LPTextViewStyle)characterLimitIndicatorStyle;
- (UIFont)longPullQuoteFont;
- (id)adjustedForString:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)maximumLinesToConsiderShort;
- (void)setLongPullQuoteFont:(id)a3;
- (void)setMaximumLinesToConsiderShort:(unsigned int)a3;
- (void)setShowCharacterLimitIndicator:(BOOL)a3;
- (void)setShowQuoteIndicator:(BOOL)a3;
@end

@implementation LPQuotedTextViewStyle

- (LPQuotedTextViewStyle)initWithPlatform:(int64_t)a3 sizeClass:(unint64_t)a4 fontScalingFactor:(double)a5
{
  v38[1] = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)LPQuotedTextViewStyle;
  v8 = -[LPTextViewStyle initWithPlatform:fontScalingFactor:](&v34, sel_initWithPlatform_fontScalingFactor_);
  if (v8)
  {
    v9 = [MEMORY[0x1E4FB1618] labelColor];
    [(LPTextViewStyle *)v8 setColor:v9];

    [(LPTextViewStyle *)v8 setMaximumLines:0];
    [(LPTextViewStyle *)v8 setMaximumCharacters:500];
    if (+[LPTestingOverrides forceMonospaceFonts])
    {
      uint64_t v10 = [MEMORY[0x1E4FB1798] monospacedSystemFontOfSize:17.0 weight:*MEMORY[0x1E4FB29D8]];
    }
    else if (unint64_t)a3 <= 6 && ((0x77u >> a3))
    {
      uint64_t v10 = fontWithTraits(**((void ***)&unk_1E5B064D0 + a3), dword_1A3711AF0[a3], a4);
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4FB1798] systemFontOfSize:17.0 weight:*MEMORY[0x1E4FB29D8]];
    }
    v11 = (void *)v10;
    [(LPTextViewStyle *)v8 setFont:v10];

    v12 = [[LPPointUnit alloc] initWithValue:15.0];
    v13 = [(LPTextViewStyle *)v8 padding];
    [v13 setTop:v12];

    v14 = [[LPPointUnit alloc] initWithValue:12.0];
    v15 = [(LPTextViewStyle *)v8 padding];
    [v15 setBottom:v14];

    v16 = outerHorizontalTextMargin((id)a3);
    v17 = [(LPTextViewStyle *)v8 padding];
    [v17 setLeading:v16];

    v18 = outerHorizontalTextMargin((id)a3);
    v19 = [(LPTextViewStyle *)v8 padding];
    [v19 setTrailing:v18];

    if (+[LPTestingOverrides forceMonospaceFonts])
    {
      uint64_t v20 = [MEMORY[0x1E4FB1798] monospacedSystemFontOfSize:13.0 weight:*MEMORY[0x1E4FB29D8]];
    }
    else if (unint64_t)a3 <= 6 && ((0x77u >> a3))
    {
      uint64_t v20 = fontWithTraits(**((void ***)&unk_1E5B06508 + a3), dword_1A3711AF0[a3], a4);
    }
    else
    {
      uint64_t v20 = [MEMORY[0x1E4FB1798] systemFontOfSize:13.0 weight:*MEMORY[0x1E4FB29D8]];
    }
    longPullQuoteFont = v8->_longPullQuoteFont;
    v8->_longPullQuoteFont = (UIFont *)v20;

    v8->_maximumLinesToConsiderShort = 3;
    v8->_showQuoteIndicator = 1;
    v8->_showCharacterLimitIndicator = 1;
    v22 = [[LPTextViewStyle alloc] initWithPlatform:a3 fontScalingFactor:a5];
    characterLimitIndicatorStyle = v8->_characterLimitIndicatorStyle;
    v8->_characterLimitIndicatorStyle = v22;

    if (+[LPTestingOverrides forceMonospaceFonts])
    {
      uint64_t v24 = [MEMORY[0x1E4FB1798] monospacedSystemFontOfSize:13.0 weight:*MEMORY[0x1E4FB29C0]];
    }
    else
    {
      if ((unint64_t)a3 > 6) {
        goto LABEL_24;
      }
      if (((1 << a3) & 0x73) != 0)
      {
        uint64_t v37 = *MEMORY[0x1E4FB2880];
        uint64_t v35 = *MEMORY[0x1E4FB29E0];
        v26 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB29C0]];
        v36 = v26;
        v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        v38[0] = v27;
        v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
        v25 = fontWithTraitsAndAttributes((void *)*MEMORY[0x1E4FB28F0], 0, v28, a4);

        goto LABEL_20;
      }
      if (a3 == 2)
      {
        uint64_t v24 = fontWithTraits((void *)*MEMORY[0x1E4FB2900], 0x8000, a4);
      }
      else
      {
LABEL_24:
        uint64_t v24 = [MEMORY[0x1E4FB1798] systemFontOfSize:13.0 weight:*MEMORY[0x1E4FB29C0]];
      }
    }
    v25 = (void *)v24;
LABEL_20:
    [(LPTextViewStyle *)v8->_characterLimitIndicatorStyle setFont:v25];

    v29 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(LPTextViewStyle *)v8->_characterLimitIndicatorStyle setColor:v29];

    v30 = [[LPPointUnit alloc] initWithValue:15.0];
    v31 = [(LPTextViewStyle *)v8->_characterLimitIndicatorStyle padding];
    [v31 setTop:v30];

    v32 = v8;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)LPQuotedTextViewStyle;
  v4 = [(LPTextViewStyle *)&v8 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 17, self->_longPullQuoteFont);
    *((_DWORD *)v5 + 33) = self->_maximumLinesToConsiderShort;
    *((unsigned char *)v5 + 128) = self->_showQuoteIndicator;
    *((unsigned char *)v5 + 129) = self->_showCharacterLimitIndicator;
    objc_storeStrong(v5 + 18, self->_characterLimitIndicatorStyle);
    v6 = v5;
  }

  return v5;
}

- (id)adjustedForString:(id)a3
{
  id v4 = a3;
  id v5 = [(LPQuotedTextViewStyle *)self copyWithZone:0];
  [v5 _adjustForString:v4];

  return v5;
}

- (UIFont)longPullQuoteFont
{
  return self->_longPullQuoteFont;
}

- (void)setLongPullQuoteFont:(id)a3
{
}

- (unsigned)maximumLinesToConsiderShort
{
  return self->_maximumLinesToConsiderShort;
}

- (void)setMaximumLinesToConsiderShort:(unsigned int)a3
{
  self->_maximumLinesToConsiderShort = a3;
}

- (BOOL)showQuoteIndicator
{
  return self->_showQuoteIndicator;
}

- (void)setShowQuoteIndicator:(BOOL)a3
{
  self->_showQuoteIndicator = a3;
}

- (BOOL)showCharacterLimitIndicator
{
  return self->_showCharacterLimitIndicator;
}

- (void)setShowCharacterLimitIndicator:(BOOL)a3
{
  self->_showCharacterLimitIndicator = a3;
}

- (LPTextViewStyle)characterLimitIndicatorStyle
{
  return self->_characterLimitIndicatorStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characterLimitIndicatorStyle, 0);

  objc_storeStrong((id *)&self->_longPullQuoteFont, 0);
}

@end