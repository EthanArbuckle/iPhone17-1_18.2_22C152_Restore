@interface CLKTextProviderStyle
+ (id)otherAttributesWithParagraphStyle:(id)a3;
+ (id)otherAttributesWithParagraphStyle:(id)a3 kerning:(double)a4;
+ (id)styleWithFont:(id)a3 smallCapsBaseFont:(id)a4 uppercase:(BOOL)a5 otherAttributes:(id)a6;
+ (id)styleWithFont:(id)a3 smallCapsBaseFont:(id)a4 uppercase:(BOOL)a5 otherAttributes:(id)a6 minimumScaleFactor:(double)a7;
+ (id)styleWithFont:(id)a3 smallCapsBaseFont:(id)a4 uppercase:(BOOL)a5 otherAttributes:(id)a6 minimumScaleFactor:(double)a7 shouldEmbedTintColor:(BOOL)a8;
+ (id)styleWithFont:(id)a3 smallCapsBaseFont:(id)a4 uppercase:(BOOL)a5 otherAttributes:(id)a6 minimumScaleFactor:(double)a7 shouldEmbedTintColor:(BOOL)a8 shouldStyleForTritium:(BOOL)a9;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldEmbedTintColors;
- (BOOL)shouldStyleForTritium;
- (BOOL)uppercase;
- (CLKFont)font;
- (CLKFont)monospacedDigitsFont;
- (CLKFont)smallCapsBaseFont;
- (NSDictionary)otherAttributes;
- (double)minimumScaleFactor;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setFont:(id)a3;
- (void)setMinimumScaleFactor:(double)a3;
- (void)setMonospacedDigitsFont:(id)a3;
- (void)setOtherAttributes:(id)a3;
- (void)setShouldEmbedTintColors:(BOOL)a3;
- (void)setShouldStyleForTritium:(BOOL)a3;
- (void)setSmallCapsBaseFont:(id)a3;
- (void)setUppercase:(BOOL)a3;
@end

@implementation CLKTextProviderStyle

+ (id)styleWithFont:(id)a3 smallCapsBaseFont:(id)a4 uppercase:(BOOL)a5 otherAttributes:(id)a6 minimumScaleFactor:(double)a7 shouldEmbedTintColor:(BOOL)a8 shouldStyleForTritium:(BOOL)a9
{
  BOOL v9 = a9;
  v10 = [a1 styleWithFont:a3 smallCapsBaseFont:a4 uppercase:a5 otherAttributes:a6 minimumScaleFactor:a8 shouldEmbedTintColor:a7];
  [v10 setShouldStyleForTritium:v9];

  return v10;
}

+ (id)styleWithFont:(id)a3 smallCapsBaseFont:(id)a4 uppercase:(BOOL)a5 otherAttributes:(id)a6 minimumScaleFactor:(double)a7 shouldEmbedTintColor:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v10 = a5;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_opt_new();
  [v16 setFont:v15];

  [v16 setSmallCapsBaseFont:v14];
  [v16 setUppercase:v10];
  [v16 setOtherAttributes:v13];

  [v16 setMinimumScaleFactor:a7];
  [v16 setShouldEmbedTintColors:v8];

  return v16;
}

+ (id)styleWithFont:(id)a3 smallCapsBaseFont:(id)a4 uppercase:(BOOL)a5 otherAttributes:(id)a6 minimumScaleFactor:(double)a7
{
  return (id)[a1 styleWithFont:a3 smallCapsBaseFont:a4 uppercase:a5 otherAttributes:a6 minimumScaleFactor:0 shouldEmbedTintColor:a7];
}

+ (id)styleWithFont:(id)a3 smallCapsBaseFont:(id)a4 uppercase:(BOOL)a5 otherAttributes:(id)a6
{
  return (id)[a1 styleWithFont:a3 smallCapsBaseFont:a4 uppercase:a5 otherAttributes:a6 minimumScaleFactor:0 shouldEmbedTintColor:0.0];
}

+ (id)otherAttributesWithParagraphStyle:(id)a3 kerning:(double)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x263F822A8]];

  double v7 = -a4;
  if (a4 >= 0.0) {
    double v7 = a4;
  }
  if (v7 > 0.00000011920929)
  {
    BOOL v8 = [NSNumber numberWithDouble:a4];
    [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x263F82288]];
  }

  return v6;
}

+ (id)otherAttributesWithParagraphStyle:(id)a3
{
  return (id)[a1 otherAttributesWithParagraphStyle:a3 kerning:0.0];
}

- (CLKFont)smallCapsBaseFont
{
  smallCapsBaseFont = self->_smallCapsBaseFont;
  if (!smallCapsBaseFont) {
    smallCapsBaseFont = self->_font;
  }
  return smallCapsBaseFont;
}

- (CLKFont)monospacedDigitsFont
{
  monospacedDigitsFont = self->_monospacedDigitsFont;
  if (!monospacedDigitsFont) {
    monospacedDigitsFont = self->_font;
  }
  return monospacedDigitsFont;
}

- (unint64_t)hash
{
  uint64_t v3 = [(CLKFont *)self->_font hash];
  uint64_t v4 = [(CLKFont *)self->_smallCapsBaseFont hash] ^ v3;
  uint64_t v5 = v4 ^ [(NSDictionary *)self->_otherAttributes hash];
  v6 = [NSNumber numberWithDouble:self->_minimumScaleFactor];
  uint64_t v7 = v5 ^ [v6 hash];
  BOOL v8 = [NSNumber numberWithBool:self->_shouldEmbedTintColors];
  unint64_t v9 = v7 ^ [v8 hash] ^ (self->_uppercase + (unint64_t)self->_shouldStyleForTritium);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CLKTextProviderStyle *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  if (v4 == self)
  {
    BOOL v5 = 1;
    goto LABEL_11;
  }
  if ([(CLKFont *)v4->_font isEqual:self->_font]
    && CLKEqualObjects(v4->_smallCapsBaseFont, self->_smallCapsBaseFont)
    && v4->_shouldStyleForTritium == self->_shouldStyleForTritium
    && v4->_uppercase == self->_uppercase
    && CLKEqualObjects(v4->_otherAttributes, self->_otherAttributes)
    && CLKFloatEqualsFloat(v4->_minimumScaleFactor, self->_minimumScaleFactor))
  {
    BOOL v5 = v4->_shouldEmbedTintColors == self->_shouldEmbedTintColors;
  }
  else
  {
LABEL_10:
    BOOL v5 = 0;
  }
LABEL_11:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[CLKTextProviderStyle allocWithZone:a3] init];
  uint64_t v5 = [(CLKFont *)self->_font copy];
  font = v4->_font;
  v4->_font = (CLKFont *)v5;

  uint64_t v7 = [(CLKFont *)self->_smallCapsBaseFont copy];
  smallCapsBaseFont = v4->_smallCapsBaseFont;
  v4->_smallCapsBaseFont = (CLKFont *)v7;

  v4->_uppercase = self->_uppercase;
  uint64_t v9 = [(NSDictionary *)self->_otherAttributes copy];
  otherAttributes = v4->_otherAttributes;
  v4->_otherAttributes = (NSDictionary *)v9;

  v4->_minimumScaleFactor = self->_minimumScaleFactor;
  v4->_shouldEmbedTintColors = self->_shouldEmbedTintColors;
  v4->_shouldStyleForTritium = self->_shouldStyleForTritium;
  return v4;
}

- (CLKFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (void)setMonospacedDigitsFont:(id)a3
{
}

- (void)setSmallCapsBaseFont:(id)a3
{
}

- (BOOL)uppercase
{
  return self->_uppercase;
}

- (void)setUppercase:(BOOL)a3
{
  self->_uppercase = a3;
}

- (NSDictionary)otherAttributes
{
  return self->_otherAttributes;
}

- (void)setOtherAttributes:(id)a3
{
}

- (double)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (void)setMinimumScaleFactor:(double)a3
{
  self->_minimumScaleFactor = a3;
}

- (BOOL)shouldEmbedTintColors
{
  return self->_shouldEmbedTintColors;
}

- (void)setShouldEmbedTintColors:(BOOL)a3
{
  self->_shouldEmbedTintColors = a3;
}

- (BOOL)shouldStyleForTritium
{
  return self->_shouldStyleForTritium;
}

- (void)setShouldStyleForTritium:(BOOL)a3
{
  self->_shouldStyleForTritium = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherAttributes, 0);
  objc_storeStrong((id *)&self->_smallCapsBaseFont, 0);
  objc_storeStrong((id *)&self->_monospacedDigitsFont, 0);

  objc_storeStrong((id *)&self->_font, 0);
}

@end