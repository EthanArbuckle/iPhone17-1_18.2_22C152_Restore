@interface _EMKGlyphRenderingAttributes
- (UIColor)color;
- (UIColor)shadowColor;
- (_EMKGlyphRenderingAttributes)initWithColor:(id)a3 shadowColor:(id)a4 scale:(double)a5;
- (_EMKGlyphRenderingAttributes)initWithValuesFromRippler:(id)a3 timeIndex:(unint64_t)a4 glyphIndex:(unint64_t)a5 numberOfGlyphs:(unint64_t)a6;
- (double)scale;
- (id)shadowIfNeededForFontPointSize:(double)a3;
- (void)_applyInContext:(CGContext *)a3 fontPointSize:(double)a4;
- (void)setColor:(id)a3;
- (void)setScale:(double)a3;
- (void)setShadowColor:(id)a3;
@end

@implementation _EMKGlyphRenderingAttributes

- (_EMKGlyphRenderingAttributes)initWithColor:(id)a3 shadowColor:(id)a4 scale:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_EMKGlyphRenderingAttributes;
  v10 = [(_EMKGlyphRenderingAttributes *)&v16 init];
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

- (_EMKGlyphRenderingAttributes)initWithValuesFromRippler:(id)a3 timeIndex:(unint64_t)a4 glyphIndex:(unint64_t)a5 numberOfGlyphs:(unint64_t)a6
{
  id v10 = a3;
  uint64_t v11 = [v10 currentColorForGlyphIndex:a5 numberOfGlyphs:a6 timeIndex:a4];
  v12 = [v10 currentShadowColorForGlyphIndex:a5 numberOfGlyphs:a6 timeIndex:a4];
  [v10 currentScaleForGlyphIndex:a5 numberOfGlyphs:a6 timeIndex:a4];
  double v14 = v13;

  v15 = [(_EMKGlyphRenderingAttributes *)self initWithColor:v11 shadowColor:v12 scale:v14];
  return v15;
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

- (void)_applyInContext:(CGContext *)a3 fontPointSize:(double)a4
{
  v7 = [(_EMKGlyphRenderingAttributes *)self color];
  [(_EMKGlyphRenderingAttributes *)self scale];
  CGFloat v9 = v8 * a4;
  CGContextSetFontSize(a3, v9);
  id v10 = v7;
  ColorSpace = CGColorGetColorSpace((CGColorRef)[v10 CGColor]);
  CGContextSetStrokeColorSpace(a3, ColorSpace);
  CGContextSetFillColorSpace(a3, ColorSpace);
  id v12 = v10;
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v12 CGColor]);
  id v14 = v12;
  CGContextSetFillColorWithColor(a3, (CGColorRef)[v14 CGColor]);
  double v13 = [(_EMKGlyphRenderingAttributes *)self shadowIfNeededForFontPointSize:v9];
  objc_msgSend(v13, "applyToGraphicsContext_emk:", a3);
}

- (id)shadowIfNeededForFontPointSize:(double)a3
{
  if (a3 >= 22.0)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB0858]);
    objc_msgSend(v4, "setShadowOffset:", 0.25, 0.0);
    [v4 setShadowBlurRadius:0.0];
    v5 = [(_EMKGlyphRenderingAttributes *)self shadowColor];
    [v4 setShadowColor:v5];
  }
  return v4;
}

@end