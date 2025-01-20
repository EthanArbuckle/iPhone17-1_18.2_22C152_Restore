@interface LPTextViewStyle
- (LPAppearanceDependentValue)shadow;
- (LPGlyphStyle)leadingGlyph;
- (LPGlyphStyle)trailingGlyph;
- (LPPadding)padding;
- (LPPointUnit)firstLineLeading;
- (LPPointUnit)lastLineDescent;
- (LPPointUnit)paragraphSpacing;
- (LPTextViewStyle)initWithPlatform:(int64_t)a3 fontScalingFactor:(double)a4;
- (NSString)compositingFilter;
- (UIColor)color;
- (UIFont)font;
- (double)fontScalingFactor;
- (float)hyphenationFactor;
- (id)adjustedForString:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)maximumLineCountScalingBehavior;
- (int64_t)textAlignment;
- (unsigned)maximumCharacters;
- (unsigned)maximumLines;
- (unsigned)maximumLinesWithMedia;
- (void)_adjustForString:(id)a3;
- (void)setColor:(id)a3;
- (void)setCompositingFilter:(id)a3;
- (void)setFirstLineLeading:(id)a3;
- (void)setFont:(id)a3;
- (void)setFontScalingFactor:(double)a3;
- (void)setHyphenationFactor:(float)a3;
- (void)setLastLineDescent:(id)a3;
- (void)setLeadingGlyph:(id)a3;
- (void)setMaximumCharacters:(unsigned int)a3;
- (void)setMaximumLineCountScalingBehavior:(int64_t)a3;
- (void)setMaximumLines:(unsigned int)a3;
- (void)setMaximumLinesWithMedia:(unsigned int)a3;
- (void)setParagraphSpacing:(id)a3;
- (void)setShadow:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTrailingGlyph:(id)a3;
@end

@implementation LPTextViewStyle

- (LPTextViewStyle)initWithPlatform:(int64_t)a3 fontScalingFactor:(double)a4
{
  v22.receiver = self;
  v22.super_class = (Class)LPTextViewStyle;
  v6 = [(LPTextViewStyle *)&v22 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] labelColor];
    color = v6->_color;
    v6->_color = (UIColor *)v7;

    uint64_t v9 = [MEMORY[0x1E4FB1798] systemFontOfSize:12.0 weight:*MEMORY[0x1E4FB29C8]];
    font = v6->_font;
    v6->_font = (UIFont *)v9;

    if (a3 == 2) {
      int v11 = 4;
    }
    else {
      int v11 = 3;
    }
    v6->_hyphenationFactor = 0.0;
    v6->_maximumLines = v11;
    v6->_maximumLinesWithMedia = 7;
    v6->_textAlignment = 0;
    uint64_t v12 = +[LPPointUnit zero];
    firstLineLeading = v6->_firstLineLeading;
    v6->_firstLineLeading = (LPPointUnit *)v12;

    uint64_t v14 = +[LPPointUnit zero];
    lastLineDescent = v6->_lastLineDescent;
    v6->_lastLineDescent = (LPPointUnit *)v14;

    v16 = objc_alloc_init(LPPadding);
    padding = v6->_padding;
    v6->_padding = v16;

    uint64_t v18 = +[LPPointUnit zero];
    paragraphSpacing = v6->_paragraphSpacing;
    v6->_paragraphSpacing = (LPPointUnit *)v18;

    v6->_maximumLineCountScalingBehavior = 2;
    v6->_fontScalingFactor = a4;
    v20 = v6;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 24), self->_color);
    objc_storeStrong((id *)(v5 + 32), self->_font);
    *(float *)(v5 + 8) = self->_hyphenationFactor;
    *(_DWORD *)(v5 + 12) = self->_maximumLines;
    *(_DWORD *)(v5 + 16) = self->_maximumLinesWithMedia;
    *(void *)(v5 + 48) = self->_textAlignment;
    objc_storeStrong((id *)(v5 + 56), self->_firstLineLeading);
    objc_storeStrong((id *)(v5 + 64), self->_lastLineDescent);
    objc_storeStrong((id *)(v5 + 72), self->_leadingGlyph);
    objc_storeStrong((id *)(v5 + 80), self->_trailingGlyph);
    uint64_t v6 = [(LPPadding *)self->_padding copy];
    uint64_t v7 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v6;

    objc_storeStrong((id *)(v5 + 96), self->_paragraphSpacing);
    *(void *)(v5 + 112) = self->_maximumLineCountScalingBehavior;
    objc_storeStrong((id *)(v5 + 40), self->_compositingFilter);
    *(double *)(v5 + 120) = self->_fontScalingFactor;
    objc_storeStrong((id *)(v5 + 104), self->_shadow);
    id v8 = (id)v5;
  }

  return (id)v5;
}

- (unsigned)maximumLines
{
  int64_t maximumLineCountScalingBehavior = self->_maximumLineCountScalingBehavior;
  switch(maximumLineCountScalingBehavior)
  {
    case 2:
      LODWORD(v3) = self->_maximumLines;
      double v5 = (double)v3;
      double fontScalingFactor = self->_fontScalingFactor;
      return vcvtpd_u64_f64(fmax(fontScalingFactor, 1.0) * v5);
    case 1:
      LODWORD(v3) = self->_maximumLines;
      double v5 = (double)v3;
      double v7 = self->_fontScalingFactor;
      if (dynamicTypeLeadingScalingFactorLargeToXXXL_onceToken != -1)
      {
        double v9 = self->_fontScalingFactor;
        double v10 = v5;
        dispatch_once(&dynamicTypeLeadingScalingFactorLargeToXXXL_onceToken, &__block_literal_global_1236);
        double v7 = v9;
        double v5 = v10;
      }
      double fontScalingFactor = v7 / *(double *)&dynamicTypeLeadingScalingFactorLargeToXXXL_scalingFactor;
      return vcvtpd_u64_f64(fmax(fontScalingFactor, 1.0) * v5);
    case 0:
      return self->_maximumLines;
  }
  return v2;
}

- (void)_adjustForString:(id)a3
{
  id v5 = a3;
  if (objc_msgSend(v5, "_lp_stringType") == 1) {
    [(LPTextViewStyle *)self setMaximumLines:1];
  }
  if (+[LPSettings showDebugIndicators]
    && objc_msgSend(v5, "_lp_stringType") == 1)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1618] systemPurpleColor];
    [(LPTextViewStyle *)self setColor:v4];
  }
}

- (id)adjustedForString:(id)a3
{
  id v4 = a3;
  id v5 = [(LPTextViewStyle *)self copyWithZone:0];
  [v5 _adjustForString:v4];

  return v5;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (NSString)compositingFilter
{
  return self->_compositingFilter;
}

- (void)setCompositingFilter:(id)a3
{
}

- (float)hyphenationFactor
{
  return self->_hyphenationFactor;
}

- (void)setHyphenationFactor:(float)a3
{
  self->_hyphenationFactor = a3;
}

- (void)setMaximumLines:(unsigned int)a3
{
  self->_maximumLines = a3;
}

- (unsigned)maximumLinesWithMedia
{
  return self->_maximumLinesWithMedia;
}

- (void)setMaximumLinesWithMedia:(unsigned int)a3
{
  self->_maximumLinesWithMedia = a3;
}

- (unsigned)maximumCharacters
{
  return self->_maximumCharacters;
}

- (void)setMaximumCharacters:(unsigned int)a3
{
  self->_maximumCharacters = a3;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (LPPointUnit)firstLineLeading
{
  return self->_firstLineLeading;
}

- (void)setFirstLineLeading:(id)a3
{
}

- (LPPointUnit)lastLineDescent
{
  return self->_lastLineDescent;
}

- (void)setLastLineDescent:(id)a3
{
}

- (LPGlyphStyle)leadingGlyph
{
  return self->_leadingGlyph;
}

- (void)setLeadingGlyph:(id)a3
{
}

- (LPGlyphStyle)trailingGlyph
{
  return self->_trailingGlyph;
}

- (void)setTrailingGlyph:(id)a3
{
}

- (LPPadding)padding
{
  return self->_padding;
}

- (LPPointUnit)paragraphSpacing
{
  return self->_paragraphSpacing;
}

- (void)setParagraphSpacing:(id)a3
{
}

- (LPAppearanceDependentValue)shadow
{
  return self->_shadow;
}

- (void)setShadow:(id)a3
{
}

- (int64_t)maximumLineCountScalingBehavior
{
  return self->_maximumLineCountScalingBehavior;
}

- (void)setMaximumLineCountScalingBehavior:(int64_t)a3
{
  self->_int64_t maximumLineCountScalingBehavior = a3;
}

- (double)fontScalingFactor
{
  return self->_fontScalingFactor;
}

- (void)setFontScalingFactor:(double)a3
{
  self->_double fontScalingFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_paragraphSpacing, 0);
  objc_storeStrong((id *)&self->_padding, 0);
  objc_storeStrong((id *)&self->_trailingGlyph, 0);
  objc_storeStrong((id *)&self->_leadingGlyph, 0);
  objc_storeStrong((id *)&self->_lastLineDescent, 0);
  objc_storeStrong((id *)&self->_firstLineLeading, 0);
  objc_storeStrong((id *)&self->_compositingFilter, 0);
  objc_storeStrong((id *)&self->_font, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

@end