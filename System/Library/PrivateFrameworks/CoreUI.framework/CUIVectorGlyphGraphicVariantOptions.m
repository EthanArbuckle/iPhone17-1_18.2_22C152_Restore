@interface CUIVectorGlyphGraphicVariantOptions
+ (double)defaultSymbolPointSizeRatio;
- (BOOL)_areValid;
- (BOOL)isEqual:(id)a3;
- (CGSize)imageOffset;
- (CUIVectorGlyphGraphicVariantOptions)init;
- (NSArray)fillColors;
- (double)borderWidth;
- (double)roundedRectCornerRadius;
- (id)borderColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)monochromeForegroundColor;
- (int64_t)contentEffect;
- (int64_t)fill;
- (int64_t)imageAlignment;
- (int64_t)imageCentering;
- (int64_t)imageScaling;
- (int64_t)shape;
- (int64_t)shapeEffect;
- (unint64_t)hash;
- (void)dealloc;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setContentEffect:(int64_t)a3;
- (void)setFill:(int64_t)a3;
- (void)setFillColors:(id)a3;
- (void)setImageAlignment:(int64_t)a3;
- (void)setImageCentering:(int64_t)a3;
- (void)setImageOffset:(CGSize)a3;
- (void)setImageScaling:(int64_t)a3;
- (void)setMonochromeForegroundColor:(id)a3;
- (void)setRoundedRectCornerRadius:(double)a3;
- (void)setShape:(int64_t)a3;
- (void)setShapeEffect:(int64_t)a3;
@end

@implementation CUIVectorGlyphGraphicVariantOptions

+ (double)defaultSymbolPointSizeRatio
{
  +[CUIVectorGlyphMutator transformForGlyphSize:2];
  return v2 * 1.2;
}

- (CUIVectorGlyphGraphicVariantOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUIVectorGlyphGraphicVariantOptions;
  double v2 = [(CUIVectorGlyphGraphicVariantOptions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->roundedRectCornerRadius = 0.225;
    v2->imageScaling = 3;
    CGColorRef ConstantColor = CGColorGetConstantColor(kCGColorBlack);
    v3->borderColor = ConstantColor;
    CFRetain(ConstantColor);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[CUIVectorGlyphGraphicVariantOptions allocWithZone:a3] init];
  v4->shape = self->shape;
  v4->fill = self->fill;
  v4->contentEffect = self->contentEffect;
  v4->fillColors = (NSArray *)[(NSArray *)self->fillColors copy];
  monochromeForegroundColor = (CGColor *)self->monochromeForegroundColor;
  if (monochromeForegroundColor) {
    monochromeForegroundColor = CGColorCreateCopy(monochromeForegroundColor);
  }
  v4->monochromeForegroundColor = monochromeForegroundColor;
  v4->roundedRectCornerRadius = self->roundedRectCornerRadius;
  v4->imageScaling = self->imageScaling;
  v4->imageAlignment = self->imageAlignment;
  v4->imageOffset = self->imageOffset;
  v4->shapeEffect = self->shapeEffect;
  v4->borderWidth = self->borderWidth;
  borderColor = (CGColor *)self->borderColor;
  if (borderColor) {
    borderColor = CGColorCreateCopy(borderColor);
  }
  v4->borderColor = borderColor;
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIVectorGlyphGraphicVariantOptions;
  [(CUIVectorGlyphGraphicVariantOptions *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v16) = 1;
    return v16;
  }
  uint64_t v29 = v10;
  uint64_t v30 = v9;
  uint64_t v31 = v6;
  uint64_t v32 = v5;
  uint64_t v33 = v4;
  uint64_t v34 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_20;
  }
  id shape = self->shape;
  if (shape != [a3 shape]) {
    goto LABEL_20;
  }
  id fill = self->fill;
  if (fill != [a3 fill]) {
    goto LABEL_20;
  }
  id contentEffect = self->contentEffect;
  if (contentEffect != [a3 contentEffect]) {
    goto LABEL_20;
  }
  unsigned int v16 = -[NSArray isEqual:](self->fillColors, "isEqual:", [a3 fillColors]);
  if (!v16) {
    return v16;
  }
  monochromeForegroundColor = (CGColor *)self->monochromeForegroundColor;
  if (monochromeForegroundColor) {
    goto LABEL_10;
  }
  if ([a3 monochromeForegroundColor])
  {
    monochromeForegroundColor = (CGColor *)self->monochromeForegroundColor;
LABEL_10:
    unsigned int v16 = CGColorEqualToColor(monochromeForegroundColor, (CGColorRef)objc_msgSend(a3, "monochromeForegroundColor", v10, v9, v6, v32, v33, v34, v7, v8));
    if (!v16) {
      return v16;
    }
  }
  double roundedRectCornerRadius = self->roundedRectCornerRadius;
  objc_msgSend(a3, "roundedRectCornerRadius", v29, v30, v31, v32, v33, v34);
  if (roundedRectCornerRadius != v19) {
    goto LABEL_20;
  }
  id imageCentering = self->imageCentering;
  if (imageCentering != [a3 imageCentering]) {
    goto LABEL_20;
  }
  id imageScaling = self->imageScaling;
  if (imageScaling != [a3 imageScaling]) {
    goto LABEL_20;
  }
  id imageAlignment = self->imageAlignment;
  if (imageAlignment != [a3 imageAlignment]) {
    goto LABEL_20;
  }
  [a3 imageOffset];
  LOBYTE(v16) = 0;
  if (self->imageOffset.width != v24 || self->imageOffset.height != v23) {
    return v16;
  }
  id shapeEffect = self->shapeEffect;
  if (shapeEffect != [a3 shapeEffect])
  {
LABEL_20:
    LOBYTE(v16) = 0;
    return v16;
  }
  unsigned int v16 = CGColorEqualToColor((CGColorRef)self->borderColor, (CGColorRef)[a3 borderColor]);
  if (v16)
  {
    double borderWidth = self->borderWidth;
    [a3 borderWidth];
    LOBYTE(v16) = vabdd_f64(borderWidth, v27) < 0.0004;
  }
  return v16;
}

- (BOOL)_areValid
{
  double width = self->imageOffset.width;
  BOOL v3 = width >= -0.5 && width <= 0.5;
  BOOL v6 = 0;
  if (v3)
  {
    double height = self->imageOffset.height;
    if (height >= -0.5 && height <= 0.5) {
      BOOL v6 = 1;
    }
  }
  double roundedRectCornerRadius = self->roundedRectCornerRadius;
  BOOL v8 = roundedRectCornerRadius >= 0.0;
  if (roundedRectCornerRadius > 0.5) {
    BOOL v8 = 0;
  }
  return v6 && v8;
}

- (unint64_t)hash
{
  uint64_t v3 = (self->fill << (self->fill & 7)) + 83 * (self->shape << (self->shape & 7)) + 6889;
  if ([(NSArray *)self->fillColors count])
  {
    CFHashCode v4 = CFHash([(NSArray *)self->fillColors firstObject]);
    uint64_t v3 = (v4 << (CFHash([(NSArray *)self->fillColors firstObject]) & 7)) + 83 * v3;
  }
  if ([(NSArray *)self->fillColors count] >= 2)
  {
    CFHashCode v5 = CFHash([(NSArray *)self->fillColors lastObject]);
    uint64_t v3 = (v5 << (CFHash([(NSArray *)self->fillColors lastObject]) & 7)) + 83 * v3;
  }
  id monochromeForegroundColor = self->monochromeForegroundColor;
  uint64_t v7 = (self->contentEffect << (self->contentEffect & 7)) + 83 * v3;
  if (monochromeForegroundColor)
  {
    CFHashCode v8 = CFHash(monochromeForegroundColor);
    uint64_t v7 = (v8 << (CFHash(self->monochromeForegroundColor) & 7)) + 83 * v7;
  }
  unint64_t v9 = (unint64_t)(self->imageOffset.width * 1000.0);
  unint64_t v10 = ((unint64_t)(self->borderWidth * 1000.0) << ((unint64_t)(self->borderWidth * 1000.0) & 7))
      + 83
      * ((self->shapeEffect << (self->shapeEffect & 7))
       + 83
       * (((unint64_t)(self->imageOffset.height * 1000.0) << ((unint64_t)(self->imageOffset.height * 1000.0) & 7))
        + 83
        * ((v9 << (v9 & 7))
         + 83
         * ((self->imageAlignment << (self->imageAlignment & 7))
          + 83
          * ((self->imageScaling << (self->imageScaling & 7))
           + 83
           * ((self->imageCentering << (self->imageCentering & 7))
            + 83
            * (((unint64_t)(self->roundedRectCornerRadius * 1000.0) << ((unint64_t)(self->roundedRectCornerRadius
                                                                                                * 1000.0) & 7))
             + 83 * v7)))))));
  id borderColor = self->borderColor;
  if (borderColor)
  {
    CFHashCode v12 = CFHash(borderColor);
    return (v12 << (CFHash(self->borderColor) & 7)) + 83 * v10;
  }
  return v10;
}

- (int64_t)shape
{
  return self->shape;
}

- (void)setShape:(int64_t)a3
{
  self->id shape = a3;
}

- (int64_t)fill
{
  return self->fill;
}

- (void)setFill:(int64_t)a3
{
  self->id fill = a3;
}

- (NSArray)fillColors
{
  return self->fillColors;
}

- (void)setFillColors:(id)a3
{
}

- (int64_t)contentEffect
{
  return self->contentEffect;
}

- (void)setContentEffect:(int64_t)a3
{
  self->id contentEffect = a3;
}

- (id)monochromeForegroundColor
{
  return self->monochromeForegroundColor;
}

- (void)setMonochromeForegroundColor:(id)a3
{
}

- (double)roundedRectCornerRadius
{
  return self->roundedRectCornerRadius;
}

- (void)setRoundedRectCornerRadius:(double)a3
{
  self->double roundedRectCornerRadius = a3;
}

- (int64_t)imageCentering
{
  return self->imageCentering;
}

- (void)setImageCentering:(int64_t)a3
{
  self->id imageCentering = a3;
}

- (int64_t)imageScaling
{
  return self->imageScaling;
}

- (void)setImageScaling:(int64_t)a3
{
  self->id imageScaling = a3;
}

- (int64_t)imageAlignment
{
  return self->imageAlignment;
}

- (void)setImageAlignment:(int64_t)a3
{
  self->id imageAlignment = a3;
}

- (CGSize)imageOffset
{
  double width = self->imageOffset.width;
  double height = self->imageOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageOffset:(CGSize)a3
{
  self->imageOffset = a3;
}

- (int64_t)shapeEffect
{
  return self->shapeEffect;
}

- (void)setShapeEffect:(int64_t)a3
{
  self->id shapeEffect = a3;
}

- (id)borderColor
{
  return self->borderColor;
}

- (void)setBorderColor:(id)a3
{
}

- (double)borderWidth
{
  return self->borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->double borderWidth = a3;
}

@end