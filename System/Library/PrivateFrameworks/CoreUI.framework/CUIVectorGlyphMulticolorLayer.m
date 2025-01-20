@interface CUIVectorGlyphMulticolorLayer
- (BOOL)needsWideGamut;
- (CGImage)createImageUsingScaleFactor:(double)a3 targetSize:(CGSize)a4 variableMinValue:(double)a5 variableMaxValue:(double)a6 colorResolver:(id)a7;
- (NSString)fillColorName;
- (NSString)strokeColorName;
- (id)debugDescription;
- (id)fillColor;
- (id)fillImage;
- (id)strokeColor;
- (void)_readCSSAttributes:(CGSVGAttributeMap *)a3 styleAttributes:(CGSVGAttributeMap *)a4;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3 scaleFactor:(double)a4 targetSize:(CGSize)a5 variableMinValue:(double)a6 variableMaxValue:(double)a7 colorResolver:(id)a8;
@end

@implementation CUIVectorGlyphMulticolorLayer

- (void)drawInContext:(CGContext *)a3 scaleFactor:(double)a4 targetSize:(CGSize)a5 variableMinValue:(double)a6 variableMaxValue:(double)a7 colorResolver:(id)a8
{
  double height = a5.height;
  double width = a5.width;
  if ([(NSArray *)[(CUIVectorGlyphLayer *)self sublayers] count]
    || [(CUIVectorGlyphLayer *)self referenceShape])
  {
    id v16 = [(CUIVectorGlyphMulticolorLayer *)self fillColor];
    if (a8)
    {
      uint64_t v17 = (*((uint64_t (**)(id, NSString *, id))a8 + 2))(a8, [(CUIVectorGlyphMulticolorLayer *)self fillColorName], v16);
      if (v17) {
        id v16 = (id)v17;
      }
    }
    if (self->_fillImage) {
      CGContextBeginTransparencyLayer(a3, 0);
    }
    v19.receiver = self;
    v19.super_class = (Class)CUIVectorGlyphMulticolorLayer;
    -[CUIVectorGlyphLayer drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:onFillColor:offFillColor:](&v19, sel_drawInContext_scaleFactor_targetSize_variableMinValue_variableMaxValue_onFillColor_offFillColor_, a3, v16, 0, a4, width, height, a6, a7);
    if (self->_fillImage)
    {
      CGContextSaveGState(a3);
      CGContextSetBlendMode(a3, kCGBlendModeSourceIn);
      v20.origin.x = 0.0;
      v20.origin.y = 0.0;
      v20.size.double width = width * a4;
      v20.size.double height = height * a4;
      CGContextDrawImage(a3, v20, (CGImageRef)self->_fillImage);
      CGContextRestoreGState(a3);
      CGContextEndTransparencyLayer(a3);
    }
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __118__CUIVectorGlyphMulticolorLayer_drawInContext_scaleFactor_targetSize_variableMinValue_variableMaxValue_colorResolver___block_invoke;
    v18[3] = &unk_1E5A51238;
    v18[4] = a8;
    -[CUIVectorGlyhLayerDelegate _legacy_drawMulticolorLayerNamed:inContext:scaleFactor:targetSize:colorResolver:]([(CUIVectorGlyphLayer *)self delegate], "_legacy_drawMulticolorLayerNamed:inContext:scaleFactor:targetSize:colorResolver:", [(CUIVectorGlyphLayer *)self name], a3, v18, a4, width, height);
  }
}

- (id)fillColor
{
  return self->_fillColor;
}

- (NSString)fillColorName
{
  return self->_fillColorName;
}

- (void)_readCSSAttributes:(CGSVGAttributeMap *)a3 styleAttributes:(CGSVGAttributeMap *)a4
{
  v15.receiver = self;
  v15.super_class = (Class)CUIVectorGlyphMulticolorLayer;
  -[CUIVectorGlyphLayer _readCSSAttributes:styleAttributes:](&v15, sel__readCSSAttributes_styleAttributes_, a3);
  v6 = (CGColor *)[(id)objc_opt_class() _fillColorFromStyle:a4];
  v7 = (CGColor *)[(id)objc_opt_class() _strokeColorFromStyle:a4];
  id v8 = objc_msgSend((id)objc_opt_class(), "_colorNameForRenderingStyle:", -[CUIVectorGlyphLayer name](self, "name"));
  v9 = v8;
  if (!v6)
  {
    if ([v8 isEqualToString:@"white"]) {
      uint64_t SRGBWhite = _CUIColorGetSRGBWhite();
    }
    else {
      uint64_t SRGBWhite = _CUIColorGetSRGBBlack();
    }
    v6 = (CGColor *)SRGBWhite;
  }
  id v11 = [(CUIVectorGlyhLayerDelegate *)[(CUIVectorGlyphLayer *)self delegate] _symbolDefaults];
  if (objc_msgSend(objc_msgSend(v11, "objectForKeyedSubscript:", CUIVectorGlyphDefaultsKeyFillImageNames), "containsObject:", v9)&& (v12 = (CGImage *)-[CUIVectorGlyhLayerDelegate fillImageWithName:](-[CUIVectorGlyphLayer delegate](self, "delegate"), "fillImageWithName:", v9)) != 0)
  {
    v13 = CGImageRetain(v12);
    v14 = &OBJC_IVAR___CUIVectorGlyphMulticolorLayer__fillImage;
  }
  else
  {
    self->_fillColor = CGColorCreateCopy(v6);
    self->_fillColorName = (NSString *)[v9 copy];
    self->_strokeColor = CGColorCreateCopy(v7);
    v13 = (objc_class *)[v9 copy];
    v14 = &OBJC_IVAR___CUIVectorGlyphMulticolorLayer__strokeColorName;
  }
  *(Class *)((char *)&self->super.super.isa + *v14) = v13;
}

- (id)fillImage
{
  return self->_fillImage;
}

- (void)dealloc
{
  fillColor = (CGColor *)self->_fillColor;
  if (fillColor) {
    CGColorRelease(fillColor);
  }
  strokeColor = (CGColor *)self->_strokeColor;
  if (strokeColor) {
    CGColorRelease(strokeColor);
  }
  fillImage = (CGImage *)self->_fillImage;
  if (fillImage) {
    CGImageRelease(fillImage);
  }
  v6.receiver = self;
  v6.super_class = (Class)CUIVectorGlyphMulticolorLayer;
  [(CUIVectorGlyphLayer *)&v6 dealloc];
}

- (id)debugDescription
{
  v10.receiver = self;
  v10.super_class = (Class)CUIVectorGlyphMulticolorLayer;
  id v3 = [(CUIVectorGlyphLayer *)&v10 debugDescription];
  v4 = [(CUIVectorGlyphMulticolorLayer *)self fillColorName];
  v5 = @"<unspecified>";
  if (v4) {
    objc_super v6 = (__CFString *)v4;
  }
  else {
    objc_super v6 = @"<unspecified>";
  }
  id v7 = [(CUIVectorGlyphMulticolorLayer *)self fillColor];
  id v8 = [(CUIVectorGlyphMulticolorLayer *)self strokeColorName];
  if (v8) {
    v5 = (__CFString *)v8;
  }
  return [v3 stringByAppendingFormat:@" fill color name=%@ fill color=%@ stroke color name=%@ stroke color=%@", v6, v7, v5, -[CUIVectorGlyphMulticolorLayer strokeColor](self, "strokeColor")];
}

- (BOOL)needsWideGamut
{
  v2 = [(CUIVectorGlyphMulticolorLayer *)self fillColor];
  if (v2)
  {
    ColorSpace = CGColorGetColorSpace(v2);
    LOBYTE(v2) = CGColorSpaceIsWideGamutRGB(ColorSpace);
  }
  return (char)v2;
}

uint64_t __118__CUIVectorGlyphMulticolorLayer_drawInContext_scaleFactor_targetSize_variableMinValue_variableMaxValue_colorResolver___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CGImage)createImageUsingScaleFactor:(double)a3 targetSize:(CGSize)a4 variableMinValue:(double)a5 variableMaxValue:(double)a6 colorResolver:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  double v14 = a4.width * a3;
  double v15 = a4.height * a3;
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  objc_super v19 = CUICGBitmapContextCreate(vcvtpd_u64_f64(v14), vcvtpd_u64_f64(v15), 8uLL, 0, SRGB, 8193, v17, v18);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  CGRect v20 = [(CUIVectorGlyphLayer *)self sublayers];
  id v21 = [(NSArray *)v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      v24 = 0;
      do
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * (void)v24), "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:colorResolver:", v19, a7, a3, width, height, a5, a6);
        v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      id v22 = [(NSArray *)v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v22);
  }
  Image = CGBitmapContextCreateImage(v19);
  CGContextRelease(v19);
  return Image;
}

- (NSString)strokeColorName
{
  return self->_strokeColorName;
}

- (id)strokeColor
{
  return self->_strokeColor;
}

@end