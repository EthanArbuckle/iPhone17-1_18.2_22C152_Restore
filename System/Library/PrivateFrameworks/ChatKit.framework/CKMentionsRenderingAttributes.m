@interface CKMentionsRenderingAttributes
+ (id)newWithValuesFromRippler:(id)a3 timeIndex:(unint64_t)a4 glyphIndex:(unint64_t)a5 glyphCount:(unint64_t)a6;
- (CKMentionsRenderingAttributes)initWithColor:(id)a3 shadowColor:(id)a4 scale:(double)a5;
- (CKMentionsRenderingAttributes)initWithValuesFromRippler:(id)a3 timeIndex:(unint64_t)a4 glyphIndex:(unint64_t)a5 glyphCount:(unint64_t)a6;
- (UIColor)color;
- (UIColor)shadowColor;
- (double)scale;
- (void)_applyInContext:(CGContext *)a3 fontPointSize:(double)a4 getAdjustedFontSize:(double *)a5;
- (void)setColor:(id)a3;
- (void)setScale:(double)a3;
- (void)setShadowColor:(id)a3;
@end

@implementation CKMentionsRenderingAttributes

- (void)_applyInContext:(CGContext *)a3 fontPointSize:(double)a4 getAdjustedFontSize:(double *)a5
{
  [(CKMentionsRenderingAttributes *)self scale];
  double v10 = v9 * a4;
  CGContextSetFontSize(a3, v10);
  id v11 = [(CKMentionsRenderingAttributes *)self color];
  ColorSpace = CGColorGetColorSpace((CGColorRef)[v11 CGColor]);
  CGContextSetStrokeColorSpace(a3, ColorSpace);
  CGContextSetFillColorSpace(a3, ColorSpace);
  id v13 = v11;
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v13 CGColor]);
  id v14 = v13;
  CGContextSetFillColorWithColor(a3, (CGColorRef)[v14 CGColor]);
  if (a5) {
    *a5 = v10;
  }
}

- (CKMentionsRenderingAttributes)initWithColor:(id)a3 shadowColor:(id)a4 scale:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CKMentionsRenderingAttributes;
  double v10 = [(CKMentionsRenderingAttributes *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    color = v10->_color;
    v10->_color = (UIColor *)v11;

    uint64_t v13 = [v9 copy];
    shadowColor = v10->_shadowColor;
    v10->_shadowColor = (UIColor *)v13;

    v10->_scale = a5;
  }

  return v10;
}

- (CKMentionsRenderingAttributes)initWithValuesFromRippler:(id)a3 timeIndex:(unint64_t)a4 glyphIndex:(unint64_t)a5 glyphCount:(unint64_t)a6
{
  id v10 = a3;
  uint64_t v11 = [v10 currentColorForGlyphIndex:a5 numberOfGlyphs:a6 timeIndex:a4];
  v12 = [v10 currentShadowColorForGlyphIndex:a5 numberOfGlyphs:a6 timeIndex:a4];
  [v10 currentScaleForGlyphIndex:a5 numberOfGlyphs:a6 timeIndex:a4];
  double v14 = v13;

  v15 = [(CKMentionsRenderingAttributes *)self initWithColor:v11 shadowColor:v12 scale:v14];
  return v15;
}

+ (id)newWithValuesFromRippler:(id)a3 timeIndex:(unint64_t)a4 glyphIndex:(unint64_t)a5 glyphCount:(unint64_t)a6
{
  id v10 = a3;
  uint64_t v11 = (void *)[objc_alloc((Class)a1) initWithValuesFromRippler:v10 timeIndex:a4 glyphIndex:a5 glyphCount:a6];

  return v11;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

@end