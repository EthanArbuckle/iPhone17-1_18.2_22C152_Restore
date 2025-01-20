@interface CUIVectorGlyphHierarchicalLayer
- (CGImage)createImageUsingScaleFactor:(double)a3 targetSize:(CGSize)a4 variableMinValue:(double)a5 variableMaxValue:(double)a6 hierarchicalColorResolver:(id)CopyWithAlpha;
- (CGImage)createImageUsingScaleFactor:(double)a3 targetSize:(CGSize)a4 variableMinValue:(double)a5 variableMaxValue:(double)a6 paletteColorResolver:(id)CopyWithAlpha;
- (id)debugDescription;
- (unint64_t)hierarchyLevel;
- (void)_readCSSAttributes:(CGSVGAttributeMap *)a3 styleAttributes:(CGSVGAttributeMap *)a4;
- (void)drawInContext:(CGContext *)a3 scaleFactor:(double)a4 targetSize:(CGSize)a5 variableMinValue:(double)a6 variableMaxValue:(double)a7 hierarchicalColorResolver:(id)a8;
- (void)drawInContext:(CGContext *)a3 scaleFactor:(double)a4 targetSize:(CGSize)a5 variableMinValue:(double)a6 variableMaxValue:(double)a7 paletteColorResolver:(id)a8;
@end

@implementation CUIVectorGlyphHierarchicalLayer

- (void)drawInContext:(CGContext *)a3 scaleFactor:(double)a4 targetSize:(CGSize)a5 variableMinValue:(double)a6 variableMaxValue:(double)a7 hierarchicalColorResolver:(id)a8
{
  double height = a5.height;
  double width = a5.width;
  unsigned int v16 = [(CUIVectorGlyphLayer *)self isEraserLayer];
  [(CUIVectorGlyphLayer *)self opacity];
  double v18 = v17;
  unint64_t v19 = [(CUIVectorGlyphLayer *)self index];
  unint64_t v20 = [(CUIVectorGlyphHierarchicalLayer *)self hierarchyLevel];
  SRGBBlack = (CGColor *)_CUIColorGetSRGBBlack();
  if (v16 && v18 < 2.22044605e-16)
  {
    SRGBBlack = (CGColor *)_CUIColorGetSRGBClear();
    CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha(SRGBBlack, 0.7);
    CFAutorelease(CopyWithAlpha);
  }
  else if (a8)
  {
    SRGBBlack = (CGColor *)(*((uint64_t (**)(id, unint64_t, unint64_t))a8 + 2))(a8, v19, v20);
    CGColorRef CopyWithAlpha = (CGColorRef)(*((uint64_t (**)(id, unint64_t, uint64_t))a8 + 2))(a8, v19, 2);
  }
  else
  {
    CGColorRef CopyWithAlpha = 0;
  }
  if ([(NSArray *)[(CUIVectorGlyphLayer *)self sublayers] count]
    || [(CUIVectorGlyphLayer *)self referenceShape])
  {
    v24.receiver = self;
    v24.super_class = (Class)CUIVectorGlyphHierarchicalLayer;
    -[CUIVectorGlyphLayer drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:onFillColor:offFillColor:](&v24, sel_drawInContext_scaleFactor_targetSize_variableMinValue_variableMaxValue_onFillColor_offFillColor_, a3, SRGBBlack, CopyWithAlpha, a4, width, height, a6, a7);
  }
  else
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = __132__CUIVectorGlyphHierarchicalLayer_drawInContext_scaleFactor_targetSize_variableMinValue_variableMaxValue_hierarchicalColorResolver___block_invoke;
    v23[3] = &unk_1E5A51238;
    v23[4] = a8;
    -[CUIVectorGlyhLayerDelegate _legacy_drawHierarchicalLayerNamed:inContext:scaleFactor:targetSize:colorResolver:]([(CUIVectorGlyphLayer *)self delegate], "_legacy_drawHierarchicalLayerNamed:inContext:scaleFactor:targetSize:colorResolver:", [(CUIVectorGlyphLayer *)self name], a3, v23, a4, width, height);
  }
}

- (void)drawInContext:(CGContext *)a3 scaleFactor:(double)a4 targetSize:(CGSize)a5 variableMinValue:(double)a6 variableMaxValue:(double)a7 paletteColorResolver:(id)a8
{
  double height = a5.height;
  double width = a5.width;
  unsigned int v16 = [(CUIVectorGlyphLayer *)self isEraserLayer];
  [(CUIVectorGlyphLayer *)self opacity];
  double v18 = v17;
  unint64_t v19 = [(CUIVectorGlyphLayer *)self index];
  unint64_t v20 = [(CUIVectorGlyphHierarchicalLayer *)self hierarchyLevel];
  SRGBBlack = (CGColor *)_CUIColorGetSRGBBlack();
  if (v16 && v18 < 2.22044605e-16)
  {
    SRGBClear = (CGColor *)_CUIColorGetSRGBClear();
    SRGBBlack = SRGBClear;
    double v23 = 0.7;
  }
  else
  {
    if (!a8)
    {
      CGColorRef CopyWithAlpha = 0;
      goto LABEL_7;
    }
    SRGBBlack = (CGColor *)(*((uint64_t (**)(id, unint64_t, unint64_t))a8 + 2))(a8, v19, v20);
    double v23 = CGColorGetAlpha(SRGBBlack) * 0.3;
    SRGBClear = SRGBBlack;
  }
  CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha(SRGBClear, v23);
  CFAutorelease(CopyWithAlpha);
LABEL_7:
  if ([(NSArray *)[(CUIVectorGlyphLayer *)self sublayers] count]
    || [(CUIVectorGlyphLayer *)self referenceShape])
  {
    v26.receiver = self;
    v26.super_class = (Class)CUIVectorGlyphHierarchicalLayer;
    -[CUIVectorGlyphLayer drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:onFillColor:offFillColor:](&v26, sel_drawInContext_scaleFactor_targetSize_variableMinValue_variableMaxValue_onFillColor_offFillColor_, a3, SRGBBlack, CopyWithAlpha, a4, width, height, a6, a7);
  }
  else
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __127__CUIVectorGlyphHierarchicalLayer_drawInContext_scaleFactor_targetSize_variableMinValue_variableMaxValue_paletteColorResolver___block_invoke;
    v25[3] = &unk_1E5A51238;
    v25[4] = a8;
    -[CUIVectorGlyhLayerDelegate _legacy_drawHierarchicalLayerNamed:inContext:scaleFactor:targetSize:colorResolver:]([(CUIVectorGlyphLayer *)self delegate], "_legacy_drawHierarchicalLayerNamed:inContext:scaleFactor:targetSize:colorResolver:", [(CUIVectorGlyphLayer *)self name], a3, v25, a4, width, height);
  }
}

- (unint64_t)hierarchyLevel
{
  return self->_hierarchyLevel;
}

- (void)_readCSSAttributes:(CGSVGAttributeMap *)a3 styleAttributes:(CGSVGAttributeMap *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CUIVectorGlyphHierarchicalLayer;
  [(CUIVectorGlyphLayer *)&v8 _readCSSAttributes:a3 styleAttributes:a4];
  id v5 = objc_msgSend((id)objc_opt_class(), "_colorNameForRenderingStyle:", -[CUIVectorGlyphLayer name](self, "name"));
  id v6 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "_layerHierarchyStyleNames"), "indexOfObject:", v5);
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = (unint64_t)v6;
  }
  self->_hierarchyLevel = v7;
}

- (id)debugDescription
{
  v3.receiver = self;
  v3.super_class = (Class)CUIVectorGlyphHierarchicalLayer;
  return objc_msgSend(-[CUIVectorGlyphLayer debugDescription](&v3, sel_debugDescription), "stringByAppendingFormat:", @" hierarchy level=%ld", -[CUIVectorGlyphHierarchicalLayer hierarchyLevel](self, "hierarchyLevel"));
}

uint64_t __132__CUIVectorGlyphHierarchicalLayer_drawInContext_scaleFactor_targetSize_variableMinValue_variableMaxValue_hierarchicalColorResolver___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CGImage)createImageUsingScaleFactor:(double)a3 targetSize:(CGSize)a4 variableMinValue:(double)a5 variableMaxValue:(double)a6 hierarchicalColorResolver:(id)CopyWithAlpha
{
  double height = a4.height;
  double width = a4.width;
  double v14 = a4.width * a3;
  double v15 = a4.height * a3;
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  unint64_t v19 = CUICGBitmapContextCreate(vcvtpd_u64_f64(v14), vcvtpd_u64_f64(v15), 8uLL, 0, SRGB, 8193, v17, v18);
  unsigned int v20 = [(CUIVectorGlyphLayer *)self isEraserLayer];
  [(CUIVectorGlyphLayer *)self opacity];
  double v22 = v21;
  unint64_t v23 = [(CUIVectorGlyphLayer *)self index];
  unint64_t v24 = [(CUIVectorGlyphHierarchicalLayer *)self hierarchyLevel];
  SRGBBlack = (CGColor *)_CUIColorGetSRGBBlack();
  if (v20 && v22 < 2.22044605e-16)
  {
    SRGBBlack = (CGColor *)_CUIColorGetSRGBClear();
    CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha(SRGBBlack, 0.7);
    CFAutorelease(CopyWithAlpha);
  }
  else if (CopyWithAlpha)
  {
    SRGBBlack = (CGColor *)(*((uint64_t (**)(id, unint64_t, unint64_t))CopyWithAlpha + 2))(CopyWithAlpha, v23, v24);
    CGColorRef CopyWithAlpha = (id)(*((uint64_t (**)(id, unint64_t, uint64_t))CopyWithAlpha + 2))(CopyWithAlpha, v23, 2);
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  objc_super v26 = [(CUIVectorGlyphLayer *)self sublayers];
  id v27 = [(NSArray *)v26 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v34;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v26);
        }
        objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:onFillColor:offFillColor:", v19, SRGBBlack, CopyWithAlpha, a3, width, height, a5, a6);
      }
      id v28 = [(NSArray *)v26 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v28);
  }
  Image = CGBitmapContextCreateImage(v19);
  CGContextRelease(v19);
  return Image;
}

uint64_t __127__CUIVectorGlyphHierarchicalLayer_drawInContext_scaleFactor_targetSize_variableMinValue_variableMaxValue_paletteColorResolver___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CGImage)createImageUsingScaleFactor:(double)a3 targetSize:(CGSize)a4 variableMinValue:(double)a5 variableMaxValue:(double)a6 paletteColorResolver:(id)CopyWithAlpha
{
  double height = a4.height;
  double width = a4.width;
  double v14 = a4.width * a3;
  double v15 = a4.height * a3;
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  unint64_t v19 = CUICGBitmapContextCreate(vcvtpd_u64_f64(v14), vcvtpd_u64_f64(v15), 8uLL, 0, SRGB, 8193, v17, v18);
  unsigned int v20 = [(CUIVectorGlyphLayer *)self isEraserLayer];
  [(CUIVectorGlyphLayer *)self opacity];
  double v22 = v21;
  unint64_t v23 = [(CUIVectorGlyphLayer *)self index];
  unint64_t v24 = [(CUIVectorGlyphHierarchicalLayer *)self hierarchyLevel];
  SRGBBlack = (CGColor *)_CUIColorGetSRGBBlack();
  if (v20 && v22 < 2.22044605e-16)
  {
    SRGBClear = (CGColor *)_CUIColorGetSRGBClear();
    SRGBBlack = SRGBClear;
    double v27 = 0.7;
  }
  else
  {
    if (!CopyWithAlpha) {
      goto LABEL_7;
    }
    SRGBBlack = (CGColor *)(*((uint64_t (**)(id, unint64_t, unint64_t))CopyWithAlpha + 2))(CopyWithAlpha, v23, v24);
    double v27 = CGColorGetAlpha(SRGBBlack) * 0.3;
    SRGBClear = SRGBBlack;
  }
  CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha(SRGBClear, v27);
  CFAutorelease(CopyWithAlpha);
LABEL_7:
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v28 = [(CUIVectorGlyphLayer *)self sublayers];
  id v29 = [(NSArray *)v28 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v36;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(v28);
        }
        objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:onFillColor:offFillColor:", v19, SRGBBlack, CopyWithAlpha, a3, width, height, a5, a6);
      }
      id v30 = [(NSArray *)v28 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v30);
  }
  Image = CGBitmapContextCreateImage(v19);
  CGContextRelease(v19);
  return Image;
}

@end