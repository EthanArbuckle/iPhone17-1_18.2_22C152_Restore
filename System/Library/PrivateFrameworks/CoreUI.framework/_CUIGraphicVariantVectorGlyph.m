@interface _CUIGraphicVariantVectorGlyph
- (BOOL)_containsWideGamutColor;
- (CGGradient)_createBackgroundGradientWithColors:(id)a3 useSCurve:(BOOL)a4 height:(double)a5;
- (CGGradient)_createSCurveGradientWithStartColor:(CGColor *)a3 endColor:(CGColor *)a4 height:(double)a5;
- (CGImage)_createBackgroundImageOfSize:(CGSize)a3 scale:(double)a4;
- (CGImage)_createGraphicVariantImageAtScale:(double)a3 backgroundImage:(CGImage *)a4 symbolImage:(CGImage *)a5 destinationRect:(CGRect)a6 disableColorFill:(BOOL)a7 outputScale:(double)a8;
- (CGImage)image;
- (CGImage)imageWithColorResolver:(id)a3;
- (CGImage)imageWithHierarchyColorResolver:(id)a3;
- (CGImage)imageWithPaletteColorResolver:(id)a3;
- (CGImage)imageWithPaletteColors:(id)a3;
- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4;
- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withColorResolver:(id)a5;
- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withHierarchyColorResolver:(id)a5;
- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withPaletteColorResolver:(id)a5;
- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withPaletteColors:(id)a5;
- (CGPath)CGPath;
- (CGPath)_createBackgroundShapeInRect:(CGRect)a3 scale:(double)a4;
- (CGRect)_backgroundShapeBoundsForTargetSize:(CGSize)a3 scale:(double)a4;
- (CGRect)_defaultScaledContentRectForBackgroundSize:(CGSize)a3 safeContentArea:(CGRect)a4;
- (CGRect)_interiorAlignmentRectUnroundedForTargetSize:(CGSize)a3;
- (CGRect)_safeContentAreaBounds;
- (CGRect)_safeContentAreaBoundsForBackgroundSize:(CGSize)a3;
- (CGRect)_scaledContentRectForBackgroundSize:(CGSize)a3 baseContentRect:(CGRect)a4 snappingScale:(double)a5;
- (CGRect)alignmentRect;
- (CGRect)alignmentRectForTargetSize:(CGSize)a3 scale:(double)a4;
- (CGRect)alignmentRectUnrounded;
- (CGRect)contentBounds;
- (CGRect)contentBoundsUnrounded;
- (CGRect)interiorAlignmentRect;
- (CGRect)interiorAlignmentRectForTargetSize:(CGSize)a3 scale:(double)a4;
- (CGRect)interiorAlignmentRectUnrounded;
- (CGSize)_sizeOfBackgroundShape;
- (CUIVectorGlyphGraphicVariantOptions)options;
- (double)baselineOffset;
- (double)baselineOffsetUnrounded;
- (id)_createContentEffectsForTargetSize:(CGSize)a3 scale:(double *)a4;
- (id)_createShapeEffectsForTargetSize:(CGSize)a3 scale:(double *)a4;
- (id)_initWithBaseGlyph:(id)a3 options:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)graphicVariantWithOptions:(id)a3;
- (int64_t)_effectiveCenteringStyle;
- (unint64_t)numberOfHierarchyLayers;
- (unint64_t)numberOfMulticolorLayers;
- (void)_drawBackgroundShapeInContext:(CGContext *)a3 targetSize:(CGSize)a4 scale:(double)a5;
- (void)dealloc;
- (void)drawHierarchyLayerAtIndex:(unint64_t)a3 inContext:(CGContext *)a4 withColorResolver:(id)a5;
- (void)drawInContext:(CGContext *)a3;
- (void)drawInContext:(CGContext *)a3 withPaletteColors:(id)a4;
- (void)drawMulticolorLayerAtIndex:(unint64_t)a3 inContext:(CGContext *)a4 withColorResolver:(id)a5;
- (void)drawPaletteLayerAtIndex:(unint64_t)a3 inContext:(CGContext *)a4 withColorResolver:(id)a5;
- (void)setOptions:(id)a3;
@end

@implementation _CUIGraphicVariantVectorGlyph

- (id)_initWithBaseGlyph:(id)a3 options:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  v6 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:](&v8, sel_initWithName_usingRenditionKey_fromTheme_, [a3 name], objc_msgSend(a3, "renditionKey"), objc_msgSend(a3, "storageRef"));
  if (v6)
  {
    -[CUINamedVectorGlyph _setUltralightInterpolationSource:](v6, "_setUltralightInterpolationSource:", [a3 _ultralightInterpolationSource]);
    -[CUINamedVectorGlyph _setBlackInterpolationSource:](v6, "_setBlackInterpolationSource:", [a3 _blackInterpolationSource]);
    [a3 pointSize];
    -[CUINamedVectorGlyph _setPointSize:](v6, "_setPointSize:");
    [a3 scale];
    -[CUINamedVectorGlyph _setScale:](v6, "_setScale:");
    -[CUINamedVectorGlyph _setCatalog:](v6, "_setCatalog:", [a3 _catalog]);
    [a3 fontMatchingScaleFactor];
    -[CUINamedVectorGlyph setFontMatchingScaleFactor:](v6, "setFontMatchingScaleFactor:");
    [a3 glyphContinuousWeight];
    -[CUINamedVectorGlyph _setGlyphWeight:](v6, "_setGlyphWeight:");
    [a3 glyphContinuousSize];
    -[CUINamedVectorGlyph _setGlyphSize:](v6, "_setGlyphSize:");
    -[CUINamedVectorGlyph _setFlippable:](v6, "_setFlippable:", [a3 isFlippable]);
    -[CUINamedVectorGlyph _setLayoutDirection:](v6, "_setLayoutDirection:", [a3 layoutDirection]);
    -[CUINamedVectorGlyph _setCanUsePathConcatenation:](v6, "_setCanUsePathConcatenation:", [a3 _canUsePathConcatenation]);
    -[CUINamedVectorGlyph _setImage:](v6, "_setImage:", [a3 _cgImageRef]);
    [a3 variableMinValue];
    -[CUINamedVectorGlyph setVariableMinValue:](v6, "setVariableMinValue:");
    [a3 variableMaxValue];
    -[CUINamedVectorGlyph setVariableMaxValue:](v6, "setVariableMaxValue:");
    [(_CUIGraphicVariantVectorGlyph *)v6 setOptions:a4];
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [(CUIVectorGlyphGraphicVariantOptions *)[(_CUIGraphicVariantVectorGlyph *)self options] copy];
  id v6 = [+[_CUIGraphicVariantVectorGlyph allocWithZone:a3] _initWithBaseGlyph:self options:v5];

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  [(CUINamedVectorGlyph *)&v3 dealloc];
}

- (id)graphicVariantWithOptions:(id)a3
{
  if (objc_msgSend(a3, "isEqual:", -[_CUIGraphicVariantVectorGlyph options](self, "options")))
  {
    id v5 = self;
    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_CUIGraphicVariantVectorGlyph;
    return [(CUINamedVectorGlyph *)&v7 graphicVariantWithOptions:a3];
  }
}

- (double)baselineOffsetUnrounded
{
  [(_CUIGraphicVariantVectorGlyph *)self _sizeOfBackgroundShape];
  double v4 = v3 * 0.295410156;
  [(CUINamedVectorGlyph *)self glyphContinuousSize];
  +[CUIVectorGlyphMutator transformForGlyphContinuousSize:](CUIVectorGlyphMutator, "transformForGlyphContinuousSize:");
  double v6 = v5;
  [(CUINamedVectorGlyph *)self referencePointSize];
  return v4 - v6 * v7;
}

- (double)baselineOffset
{
  [(_CUIGraphicVariantVectorGlyph *)self baselineOffsetUnrounded];
  double v4 = v3;
  [(CUINamedVectorGlyph *)self scale];
  return round(v4 * v5) / v5;
}

- (CGRect)alignmentRect
{
  [(_CUIGraphicVariantVectorGlyph *)self alignmentRectUnrounded];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CUINamedVectorGlyph *)self scale];
  double v12 = round(v11 * v6) / v11;
  double v13 = ceil(v11 * v8) / v11;
  double v14 = ceil(v11 * v10) / v11;
  double v15 = round(v11 * v4) / v11;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v15;
  return result;
}

- (CGRect)alignmentRectUnrounded
{
  [(_CUIGraphicVariantVectorGlyph *)self _sizeOfBackgroundShape];
  -[_CUIGraphicVariantVectorGlyph alignmentRectForTargetSize:scale:](self, "alignmentRectForTargetSize:scale:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)alignmentRectForTargetSize:(CGSize)a3 scale:(double)a4
{
  [(_CUIGraphicVariantVectorGlyph *)self _backgroundShapeBoundsForTargetSize:a3.width scale:a3.height];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGAffineTransformMakeScale(&v13, a4, a4);
  v14.origin.x = v6;
  v14.origin.y = v8;
  v14.size.width = v10;
  v14.size.height = v12;
  return CGRectApplyAffineTransform(v14, &v13);
}

- (CGRect)contentBoundsUnrounded
{
  [(_CUIGraphicVariantVectorGlyph *)self _sizeOfBackgroundShape];
  double v3 = v2 + 0.13671875;
  double v5 = v4 + 0.13671875;
  double v6 = 0.0;
  double v7 = 0.0;
  result.size.height = v5;
  result.size.width = v3;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)contentBounds
{
  [(_CUIGraphicVariantVectorGlyph *)self contentBoundsUnrounded];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CUINamedVectorGlyph *)self scale];
  double v12 = ceil(v11 * v8) / v11;
  double v13 = ceil(v11 * v10) / v11;
  double v14 = v4;
  double v15 = v6;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)interiorAlignmentRect
{
  [(_CUIGraphicVariantVectorGlyph *)self interiorAlignmentRectUnrounded];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CUINamedVectorGlyph *)self scale];
  double v12 = round(v11 * v6) / v11;
  double v13 = ceil(v11 * v8) / v11;
  double v14 = ceil(v11 * v10) / v11;
  double v15 = round(v11 * v4) / v11;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v15;
  return result;
}

- (CGRect)interiorAlignmentRectUnrounded
{
  [(_CUIGraphicVariantVectorGlyph *)self _sizeOfBackgroundShape];
  -[_CUIGraphicVariantVectorGlyph interiorAlignmentRectForTargetSize:scale:](self, "interiorAlignmentRectForTargetSize:scale:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_interiorAlignmentRectUnroundedForTargetSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[_CUIGraphicVariantVectorGlyph _safeContentAreaBoundsForBackgroundSize:](self, "_safeContentAreaBoundsForBackgroundSize:");
  -[_CUIGraphicVariantVectorGlyph _defaultScaledContentRectForBackgroundSize:safeContentArea:](self, "_defaultScaledContentRectForBackgroundSize:safeContentArea:", width, height, v6, v7, v8, v9);
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)interiorAlignmentRectForTargetSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  -[_CUIGraphicVariantVectorGlyph _interiorAlignmentRectUnroundedForTargetSize:](self, "_interiorAlignmentRectUnroundedForTargetSize:");
  BOOL v12 = width * a4 < 56.0 || height * a4 < 56.0;
  if (v12 || (v11 * a4 >= 32.0 ? (BOOL v13 = v10 * a4 < 32.0) : (BOOL v13 = 1), v14 = a4, v13)) {
    double v14 = 0.0;
  }
  -[_CUIGraphicVariantVectorGlyph _scaledContentRectForBackgroundSize:baseContentRect:snappingScale:](self, "_scaledContentRectForBackgroundSize:baseContentRect:snappingScale:", width, height, v8, v9, v10, v11, v14);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGAffineTransformMakeScale(&v23, a4, a4);
  v24.origin.x = v16;
  v24.origin.y = v18;
  v24.size.double width = v20;
  v24.size.double height = v22;
  return CGRectApplyAffineTransform(v24, &v23);
}

- (BOOL)_containsWideGamutColor
{
  v11.receiver = self;
  v11.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  unsigned __int8 v3 = [(CUINamedVectorGlyph *)&v11 _containsWideGamutColor];
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __56___CUIGraphicVariantVectorGlyph__containsWideGamutColor__block_invoke;
  v6[3] = &unk_1E5A51178;
  v6[4] = &v7;
  [(NSArray *)[(CUIVectorGlyphGraphicVariantOptions *)[(_CUIGraphicVariantVectorGlyph *)self options] fillColors] enumerateObjectsUsingBlock:v6];
  BOOL v4 = (v3 & 1) != 0 || *((unsigned char *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (CGPath)CGPath
{
  v40.receiver = self;
  v40.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  unsigned __int8 v3 = [(CUINamedVectorGlyph *)&v40 CGPath];
  if (!v3) {
    return 0;
  }
  BOOL v4 = v3;
  [(CUINamedVectorGlyph *)self scale];
  double v6 = v5;
  [(_CUIGraphicVariantVectorGlyph *)self _sizeOfBackgroundShape];
  double v7 = 0.0;
  char v10 = -[_CUIGraphicVariantVectorGlyph _createBackgroundShapeInRect:scale:](self, "_createBackgroundShapeInRect:scale:", 0.0, 0.0, v8, v9, v6);
  Mutable = CGPathCreateMutable();
  CGPathAddPath(Mutable, 0, v10);
  v39.receiver = self;
  v39.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  [(CUINamedVectorGlyph *)&v39 alignmentRectUnrounded];
  double v13 = v12;
  double v15 = v14;
  v38.receiver = self;
  v38.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  [(CUINamedVectorGlyph *)&v38 contentBoundsUnrounded];
  double v17 = v16;
  CGFloat v19 = v18;
  if ((id)[(_CUIGraphicVariantVectorGlyph *)self _effectiveCenteringStyle] == (id)1)
  {
    double v7 = v17 - v13;
    v37.receiver = self;
    v37.super_class = (Class)_CUIGraphicVariantVectorGlyph;
    [(CUINamedVectorGlyph *)&v37 baselineOffsetUnrounded];
    CGFloat v21 = v20;
    v36 = self;
    CGFloat v22 = (objc_super *)&v36;
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)_CUIGraphicVariantVectorGlyph;
    [(CUINamedVectorGlyph *)&v35 baselineOffsetUnrounded];
    CGFloat v21 = v23;
    v34.receiver = self;
    CGFloat v22 = &v34;
    CGFloat v19 = v15;
  }
  v22->super_class = (Class)_CUIGraphicVariantVectorGlyph;
  [(objc_super *)v22 capHeightUnrounded];
  CGFloat v25 = v24;
  CGAffineTransformMakeScale(&v33, v6, v6);
  v41.origin.double x = v7;
  v41.origin.double y = v21;
  v41.size.double width = v19;
  v41.size.double height = v25;
  CGRect v42 = CGRectApplyAffineTransform(v41, &v33);
  double x = v42.origin.x;
  double y = v42.origin.y;
  double width = v42.size.width;
  double height = v42.size.height;
  BoundingBodouble x = CGPathGetBoundingBox(v10);
  CGFloat v30 = BoundingBox.size.width * 0.5 - (x + width * 0.5);
  CGRect v44 = CGPathGetBoundingBox(v10);
  memset(&v32, 0, sizeof(v32));
  CGAffineTransformMakeTranslation(&v32, v30, v44.size.height * 0.5 - (y + height * 0.5));
  CGPathAddPath(Mutable, &v32, v4);
  CGPathRelease(v10);
  CFAutorelease(Mutable);
  return Mutable;
}

- (CGImage)image
{
  [(CUINamedVectorGlyph *)self scale];
  double v4 = v3;
  [(_CUIGraphicVariantVectorGlyph *)self _sizeOfBackgroundShape];
  double v7 = -[_CUIGraphicVariantVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:](self, "rasterizeImageUsingScaleFactor:forTargetSize:", v4, v5, v6);
  return (CGImage *)CFAutorelease(v7);
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v8 = -[_CUIGraphicVariantVectorGlyph _createBackgroundImageOfSize:scale:](self, "_createBackgroundImageOfSize:scale:", a4.width, a4.height, a3);
  -[_CUIGraphicVariantVectorGlyph _interiorAlignmentRectUnroundedForTargetSize:](self, "_interiorAlignmentRectUnroundedForTargetSize:", width, height);
  BOOL v13 = width * a3 < 56.0 || height * a3 < 56.0;
  if (v13 || (v12 * a3 >= 32.0 ? (BOOL v14 = v11 * a3 < 32.0) : (BOOL v14 = 1), v14))
  {
    double v16 = 0.0;
    int v15 = 1;
  }
  else
  {
    int v15 = 0;
    double v16 = a3;
  }
  -[_CUIGraphicVariantVectorGlyph _scaledContentRectForBackgroundSize:baseContentRect:snappingScale:](self, "_scaledContentRectForBackgroundSize:baseContentRect:snappingScale:", width, height, v9, v10, v11, v12, v16);
  double v20 = v19;
  double v22 = v21;
  double v23 = v17;
  double v24 = v18;
  if (v15) {
    double v25 = a3 + a3;
  }
  else {
    double v25 = a3;
  }
  v29.receiver = self;
  v29.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  v26 = -[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:](&v29, sel_rasterizeImageUsingScaleFactor_forTargetSize_, v25, v17, v18);
  v27 = -[_CUIGraphicVariantVectorGlyph _createGraphicVariantImageAtScale:backgroundImage:symbolImage:destinationRect:disableColorFill:outputScale:](self, "_createGraphicVariantImageAtScale:backgroundImage:symbolImage:destinationRect:disableColorFill:outputScale:", v8, v26, 0, v25, v20, v22, v23, v24, a3);
  CGImageRelease(v26);
  CGImageRelease(v8);
  return v27;
}

- (void)drawInContext:(CGContext *)a3
{
  double v5 = [(_CUIGraphicVariantVectorGlyph *)self image];
  [(_CUIGraphicVariantVectorGlyph *)self alignmentRect];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [(CUINamedVectorGlyph *)self scale];
  CGAffineTransformMakeScale(&v15, v14, v14);
  v16.origin.double x = v7;
  v16.origin.double y = v9;
  v16.size.double width = v11;
  v16.size.double height = v13;
  CGRect v17 = CGRectApplyAffineTransform(v16, &v15);
  CGContextDrawImage(a3, v17, v5);
}

- (CGImage)imageWithColorResolver:(id)a3
{
  [(CUINamedVectorGlyph *)self scale];
  double v6 = v5;
  [(_CUIGraphicVariantVectorGlyph *)self _sizeOfBackgroundShape];
  return -[_CUIGraphicVariantVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withColorResolver:](self, "rasterizeImageUsingScaleFactor:forTargetSize:withColorResolver:", a3, v6, v7, v8);
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withColorResolver:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  double v10 = -[_CUIGraphicVariantVectorGlyph _createBackgroundImageOfSize:scale:](self, "_createBackgroundImageOfSize:scale:", a4.width, a4.height, a3);
  -[_CUIGraphicVariantVectorGlyph _interiorAlignmentRectUnroundedForTargetSize:](self, "_interiorAlignmentRectUnroundedForTargetSize:", width, height);
  BOOL v15 = width * a3 < 56.0 || height * a3 < 56.0;
  if (v15 || (v14 * a3 >= 32.0 ? (BOOL v16 = v13 * a3 < 32.0) : (BOOL v16 = 1), v16))
  {
    double v18 = 0.0;
    int v17 = 1;
  }
  else
  {
    int v17 = 0;
    double v18 = a3;
  }
  -[_CUIGraphicVariantVectorGlyph _scaledContentRectForBackgroundSize:baseContentRect:snappingScale:](self, "_scaledContentRectForBackgroundSize:baseContentRect:snappingScale:", width, height, v11, v12, v13, v14, v18);
  double v22 = v21;
  double v24 = v23;
  double v25 = v19;
  double v26 = v20;
  if (v17) {
    double v27 = a3 + a3;
  }
  else {
    double v27 = a3;
  }
  v31.receiver = self;
  v31.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  v28 = -[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withColorResolver:](&v31, sel_rasterizeImageUsingScaleFactor_forTargetSize_withColorResolver_, a5, v27, v19, v20);
  objc_super v29 = -[_CUIGraphicVariantVectorGlyph _createGraphicVariantImageAtScale:backgroundImage:symbolImage:destinationRect:disableColorFill:outputScale:](self, "_createGraphicVariantImageAtScale:backgroundImage:symbolImage:destinationRect:disableColorFill:outputScale:", v10, v28, 1, v27, v22, v24, v25, v26, a3);
  CGImageRelease(v28);
  CGImageRelease(v10);
  return v29;
}

- (unint64_t)numberOfMulticolorLayers
{
  return 1;
}

- (void)drawMulticolorLayerAtIndex:(unint64_t)a3 inContext:(CGContext *)a4 withColorResolver:(id)a5
{
  double v7 = [(_CUIGraphicVariantVectorGlyph *)self imageWithColorResolver:a5];
  [(_CUIGraphicVariantVectorGlyph *)self alignmentRect];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(CUINamedVectorGlyph *)self scale];
  CGAffineTransformMakeScale(&v17, v16, v16);
  v18.origin.double x = v9;
  v18.origin.double y = v11;
  v18.size.double width = v13;
  v18.size.double height = v15;
  CGRect v19 = CGRectApplyAffineTransform(v18, &v17);
  CGContextDrawImage(a4, v19, v7);
  CGImageRelease(v7);
}

- (CGImage)imageWithHierarchyColorResolver:(id)a3
{
  [(CUINamedVectorGlyph *)self scale];
  double v6 = v5;
  [(_CUIGraphicVariantVectorGlyph *)self _sizeOfBackgroundShape];
  return -[_CUIGraphicVariantVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withHierarchyColorResolver:](self, "rasterizeImageUsingScaleFactor:forTargetSize:withHierarchyColorResolver:", a3, v6, v7, v8);
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withHierarchyColorResolver:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  double v10 = -[_CUIGraphicVariantVectorGlyph _createBackgroundImageOfSize:scale:](self, "_createBackgroundImageOfSize:scale:", a4.width, a4.height, a3);
  -[_CUIGraphicVariantVectorGlyph _interiorAlignmentRectUnroundedForTargetSize:](self, "_interiorAlignmentRectUnroundedForTargetSize:", width, height);
  BOOL v15 = width * a3 < 56.0 || height * a3 < 56.0;
  if (v15 || (v14 * a3 >= 32.0 ? (BOOL v16 = v13 * a3 < 32.0) : (BOOL v16 = 1), v16))
  {
    double v18 = 0.0;
    int v17 = 1;
  }
  else
  {
    int v17 = 0;
    double v18 = a3;
  }
  -[_CUIGraphicVariantVectorGlyph _scaledContentRectForBackgroundSize:baseContentRect:snappingScale:](self, "_scaledContentRectForBackgroundSize:baseContentRect:snappingScale:", width, height, v11, v12, v13, v14, v18);
  double v22 = v21;
  double v24 = v23;
  double v25 = v19;
  double v26 = v20;
  if (v17) {
    double v27 = a3 + a3;
  }
  else {
    double v27 = a3;
  }
  v31.receiver = self;
  v31.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  v28 = -[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withHierarchyColorResolver:](&v31, sel_rasterizeImageUsingScaleFactor_forTargetSize_withHierarchyColorResolver_, a5, v27, v19, v20);
  objc_super v29 = -[_CUIGraphicVariantVectorGlyph _createGraphicVariantImageAtScale:backgroundImage:symbolImage:destinationRect:disableColorFill:outputScale:](self, "_createGraphicVariantImageAtScale:backgroundImage:symbolImage:destinationRect:disableColorFill:outputScale:", v10, v28, 1, v27, v22, v24, v25, v26, a3);
  CGImageRelease(v28);
  CGImageRelease(v10);
  return v29;
}

- (unint64_t)numberOfHierarchyLayers
{
  return 1;
}

- (void)drawHierarchyLayerAtIndex:(unint64_t)a3 inContext:(CGContext *)a4 withColorResolver:(id)a5
{
  double v7 = [(_CUIGraphicVariantVectorGlyph *)self imageWithHierarchyColorResolver:a5];
  [(_CUIGraphicVariantVectorGlyph *)self alignmentRect];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(CUINamedVectorGlyph *)self scale];
  CGAffineTransformMakeScale(&v17, v16, v16);
  v18.origin.double x = v9;
  v18.origin.double y = v11;
  v18.size.double width = v13;
  v18.size.double height = v15;
  CGRect v19 = CGRectApplyAffineTransform(v18, &v17);
  CGContextDrawImage(a4, v19, v7);
  CGImageRelease(v7);
}

- (CGImage)imageWithPaletteColorResolver:(id)a3
{
  [(CUINamedVectorGlyph *)self scale];
  double v6 = v5;
  [(_CUIGraphicVariantVectorGlyph *)self _sizeOfBackgroundShape];
  return -[_CUIGraphicVariantVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withPaletteColorResolver:](self, "rasterizeImageUsingScaleFactor:forTargetSize:withPaletteColorResolver:", a3, v6, v7, v8);
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withPaletteColorResolver:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  double v10 = -[_CUIGraphicVariantVectorGlyph _createBackgroundImageOfSize:scale:](self, "_createBackgroundImageOfSize:scale:", a4.width, a4.height, a3);
  -[_CUIGraphicVariantVectorGlyph _interiorAlignmentRectUnroundedForTargetSize:](self, "_interiorAlignmentRectUnroundedForTargetSize:", width, height);
  BOOL v15 = width * a3 < 56.0 || height * a3 < 56.0;
  if (v15 || (v14 * a3 >= 32.0 ? (BOOL v16 = v13 * a3 < 32.0) : (BOOL v16 = 1), v16))
  {
    double v18 = 0.0;
    int v17 = 1;
  }
  else
  {
    int v17 = 0;
    double v18 = a3;
  }
  -[_CUIGraphicVariantVectorGlyph _scaledContentRectForBackgroundSize:baseContentRect:snappingScale:](self, "_scaledContentRectForBackgroundSize:baseContentRect:snappingScale:", width, height, v11, v12, v13, v14, v18);
  double v22 = v21;
  double v24 = v23;
  double v25 = v19;
  double v26 = v20;
  if (v17) {
    double v27 = a3 + a3;
  }
  else {
    double v27 = a3;
  }
  v31.receiver = self;
  v31.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  v28 = -[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withPaletteColorResolver:](&v31, sel_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColorResolver_, a5, v27, v19, v20);
  objc_super v29 = -[_CUIGraphicVariantVectorGlyph _createGraphicVariantImageAtScale:backgroundImage:symbolImage:destinationRect:disableColorFill:outputScale:](self, "_createGraphicVariantImageAtScale:backgroundImage:symbolImage:destinationRect:disableColorFill:outputScale:", v10, v28, 1, v27, v22, v24, v25, v26, a3);
  CGImageRelease(v28);
  CGImageRelease(v10);
  return v29;
}

- (void)drawPaletteLayerAtIndex:(unint64_t)a3 inContext:(CGContext *)a4 withColorResolver:(id)a5
{
  double v7 = [(_CUIGraphicVariantVectorGlyph *)self imageWithPaletteColorResolver:a5];
  [(_CUIGraphicVariantVectorGlyph *)self alignmentRect];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(CUINamedVectorGlyph *)self scale];
  CGAffineTransformMakeScale(&v17, v16, v16);
  v18.origin.double x = v9;
  v18.origin.double y = v11;
  v18.size.double width = v13;
  v18.size.double height = v15;
  CGRect v19 = CGRectApplyAffineTransform(v18, &v17);
  CGContextDrawImage(a4, v19, v7);
  CGImageRelease(v7);
}

- (CGImage)imageWithPaletteColors:(id)a3
{
  [(CUINamedVectorGlyph *)self scale];
  double v6 = v5;
  [(_CUIGraphicVariantVectorGlyph *)self _sizeOfBackgroundShape];
  return -[_CUIGraphicVariantVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withPaletteColors:](self, "rasterizeImageUsingScaleFactor:forTargetSize:withPaletteColors:", a3, v6, v7, v8);
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withPaletteColors:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v10 = [a5 count];
  id v11 = objc_msgSend(-[CUINamedVectorGlyph hierarchyLayers](self, "hierarchyLayers"), "lastIndex");
  double v12 = -[_CUIGraphicVariantVectorGlyph _createBackgroundImageOfSize:scale:](self, "_createBackgroundImageOfSize:scale:", width, height, a3);
  -[_CUIGraphicVariantVectorGlyph _interiorAlignmentRectUnroundedForTargetSize:](self, "_interiorAlignmentRectUnroundedForTargetSize:", width, height);
  BOOL v17 = width * a3 < 56.0 || height * a3 < 56.0;
  if (v17 || (v16 * a3 >= 32.0 ? (BOOL v18 = v15 * a3 < 32.0) : (BOOL v18 = 1), v18))
  {
    double v20 = 0.0;
    int v19 = 1;
  }
  else
  {
    int v19 = 0;
    double v20 = a3;
  }
  -[_CUIGraphicVariantVectorGlyph _scaledContentRectForBackgroundSize:baseContentRect:snappingScale:](self, "_scaledContentRectForBackgroundSize:baseContentRect:snappingScale:", width, height, v13, v14, v15, v16, v20);
  double v24 = v23;
  double v26 = v25;
  double v27 = v21;
  double v28 = v22;
  if (v19) {
    double v29 = a3 + a3;
  }
  else {
    double v29 = a3;
  }
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = __96___CUIGraphicVariantVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColors___block_invoke;
  v34[3] = &unk_1E5A51BC0;
  v34[5] = v10;
  v34[6] = v11;
  v34[4] = a5;
  v33.receiver = self;
  v33.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  CGFloat v30 = -[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withPaletteColorResolver:](&v33, sel_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColorResolver_, v34, v29, v21, v22);
  objc_super v31 = -[_CUIGraphicVariantVectorGlyph _createGraphicVariantImageAtScale:backgroundImage:symbolImage:destinationRect:disableColorFill:outputScale:](self, "_createGraphicVariantImageAtScale:backgroundImage:symbolImage:destinationRect:disableColorFill:outputScale:", v12, v30, 1, v29, v24, v26, v27, v28, a3);
  CGImageRelease(v30);
  CGImageRelease(v12);
  return v31;
}

- (void)drawInContext:(CGContext *)a3 withPaletteColors:(id)a4
{
  double v6 = [(_CUIGraphicVariantVectorGlyph *)self imageWithPaletteColors:a4];
  [(_CUIGraphicVariantVectorGlyph *)self alignmentRect];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(CUINamedVectorGlyph *)self scale];
  CGAffineTransformMakeScale(&v16, v15, v15);
  v17.origin.double x = v8;
  v17.origin.double y = v10;
  v17.size.double width = v12;
  v17.size.double height = v14;
  CGRect v18 = CGRectApplyAffineTransform(v17, &v16);
  CGContextDrawImage(a3, v18, v6);
  CGImageRelease(v6);
}

- (CGSize)_sizeOfBackgroundShape
{
  double v3 = [(_CUIGraphicVariantVectorGlyph *)self options];
  [(CUINamedVectorGlyph *)self pointSize];
  double v5 = v4 + v4 * 0.1 * 2.0;
  [(CUINamedVectorGlyph *)self glyphContinuousSize];
  +[CUIVectorGlyphMutator transformForGlyphContinuousSize:](CUIVectorGlyphMutator, "transformForGlyphContinuousSize:");
  double v7 = v5 * v6;
  id v8 = [(CUIVectorGlyphGraphicVariantOptions *)v3 shape];
  if (v8 == (id)2)
  {
    double v10 = v7 + v7 * 0.1725 * 2.0;
  }
  else
  {
    if (v8) {
      double v9 = 0.0;
    }
    else {
      double v9 = v7;
    }
    if (v8 == (id)1) {
      double v10 = v7;
    }
    else {
      double v10 = v9;
    }
    if (v8 != (id)1) {
      double v7 = v9;
    }
  }
  double v11 = v7;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGRect)_safeContentAreaBounds
{
  [(_CUIGraphicVariantVectorGlyph *)self _sizeOfBackgroundShape];
  -[_CUIGraphicVariantVectorGlyph _safeContentAreaBoundsForBackgroundSize:](self, "_safeContentAreaBoundsForBackgroundSize:");
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (int64_t)_effectiveCenteringStyle
{
  double v2 = [(_CUIGraphicVariantVectorGlyph *)self options];
  int64_t result = [(CUIVectorGlyphGraphicVariantOptions *)v2 imageCentering];
  if (!result) {
    return (unint64_t)[(CUIVectorGlyphGraphicVariantOptions *)v2 shape] < 3;
  }
  return result;
}

- (CGRect)_safeContentAreaBoundsForBackgroundSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int64_t v5 = [(CUIVectorGlyphGraphicVariantOptions *)[(_CUIGraphicVariantVectorGlyph *)self options] shape];
  if (v5 == 2)
  {
    double y = height * 0.1;
    double x = height * 0.1725;
  }
  else
  {
    if (v5 == 1)
    {
      double v9 = width * 0.5 * 1.41421356;
      double y = (width - v9) * 0.5;
      double v8 = v9;
      double x = y;
      goto LABEL_9;
    }
    if (v5)
    {
      double x = CGRectZero.origin.x;
      double y = CGRectZero.origin.y;
      double v8 = CGRectZero.size.width;
      double v9 = CGRectZero.size.height;
      goto LABEL_9;
    }
    double x = width * 0.1;
    double y = height * 0.1;
  }
  double v8 = width + x * -2.0;
  double v9 = height + y * -2.0;
LABEL_9:
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)_defaultScaledContentRectForBackgroundSize:(CGSize)a3 safeContentArea:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.height;
  double v9 = a3.width;
  double v11 = [(_CUIGraphicVariantVectorGlyph *)self options];
  CGFloat v12 = [(CUIVectorGlyphGraphicVariantOptions *)v11 imageScaling];
  int64_t v13 = [(CUIVectorGlyphGraphicVariantOptions *)v11 imageAlignment];
  v68.receiver = self;
  v68.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  [(CUINamedVectorGlyph *)&v68 alignmentRectUnrounded];
  double v15 = v14;
  double v60 = v16;
  double v18 = v17;
  v67.receiver = self;
  v67.super_class = (Class)_CUIGraphicVariantVectorGlyph;
  [(CUINamedVectorGlyph *)&v67 contentBoundsUnrounded];
  double v56 = v19;
  double v57 = v20;
  if ((unint64_t)v12 < 2)
  {
    double v29 = v8;
    double v21 = floor(width * 0.5);
    double v22 = floor(height * 0.5);
  }
  else
  {
    double v21 = floor(v9 * 0.5);
    double v22 = floor(v8 * 0.5);
    double v23 = floor(width * 0.5);
    double v24 = floor(height * 0.5);
    if (v12 == (char *)3) {
      double v25 = height;
    }
    else {
      double v25 = 0.0;
    }
    if (v12 == (char *)3) {
      double v26 = width;
    }
    else {
      double v26 = 0.0;
    }
    if (v12 == (char *)3) {
      double v27 = y;
    }
    else {
      double v27 = 0.0;
    }
    if (v12 == (char *)3) {
      double v28 = x;
    }
    else {
      double v28 = 0.0;
    }
    if (v12 != (char *)3)
    {
      double v24 = 0.0;
      double v23 = 0.0;
    }
    double v29 = v8;
    if (v12 == (char *)2) {
      double height = v8;
    }
    else {
      double height = v25;
    }
    if (v12 == (char *)2) {
      double width = v9;
    }
    else {
      double width = v26;
    }
    if (v12 == (char *)2) {
      double y = 0.0;
    }
    else {
      double y = v27;
    }
    if (v12 == (char *)2) {
      double x = 0.0;
    }
    else {
      double x = v28;
    }
    if (v12 != (char *)2)
    {
      double v22 = v24;
      double v21 = v23;
    }
  }
  double v30 = v29;
  switch(v13)
  {
    case 1:
      double x = x + v21 * 0.5;
      goto LABEL_35;
    case 2:
      goto LABEL_35;
    case 3:
      double x = width + x - v21;
LABEL_35:
      double y = height + y - v22;
      goto LABEL_40;
    case 4:
      goto LABEL_39;
    case 5:
      double x = x + v21 * 0.5;
      goto LABEL_40;
    case 6:
      goto LABEL_40;
    case 7:
      double x = width + x - v21;
      goto LABEL_40;
    case 8:
      double x = width + x - v21;
LABEL_39:
      double y = y + v22 * 0.5;
LABEL_40:
      double v31 = v60;
      break;
    default:
      double v22 = height;
      double v21 = width;
      double v31 = v60;
      double v30 = v29;
      break;
  }
  if ((unint64_t)(v12 - 1) >= 2)
  {
    double v32 = 1.0;
    if (v12 == (char *)3 && (v31 > v21 || v18 > v22))
    {
      double v34 = fmin(v21 / v31, v22 / v18);
      double v35 = fmin(v34, 0.5);
      if (v13) {
        double v32 = v35;
      }
      else {
        double v32 = v34;
      }
    }
  }
  else
  {
    double v32 = fmin(v21 / v31, v22 / v18);
  }
  double v58 = v21;
  double v59 = v22;
  double v61 = v18;
  double v36 = x;
  if ((id)[(CUIVectorGlyphGraphicVariantOptions *)v11 shapeEffect] == (id)1)
  {
    [(CUINamedVectorGlyph *)self scale];
    double v38 = v30 * v37;
    double v39 = 0.8046875;
    if (v38 < 256.0) {
      double v39 = 0.8125;
    }
    BOOL v40 = v38 < 64.0;
    double v41 = 0.833;
    if (!v40) {
      double v41 = v39;
    }
    double v32 = v32 * v41;
  }
  double v42 = y;
  if ((id)[(_CUIGraphicVariantVectorGlyph *)self _effectiveCenteringStyle] == (id)1)
  {
    double v43 = v56 - v15;
    v66.receiver = self;
    v66.super_class = (Class)_CUIGraphicVariantVectorGlyph;
    [(CUINamedVectorGlyph *)&v66 baselineOffsetUnrounded];
    CGFloat v45 = v44;
    v65 = self;
    v46 = (objc_super *)&v65;
    double v47 = v31;
    CGFloat v48 = v57;
  }
  else
  {
    v64.receiver = self;
    v64.super_class = (Class)_CUIGraphicVariantVectorGlyph;
    [(CUINamedVectorGlyph *)&v64 baselineOffsetUnrounded];
    CGFloat v45 = v49;
    v63.receiver = self;
    double v43 = 0.0;
    v46 = &v63;
    CGFloat v48 = v31;
    double v47 = v31;
  }
  v46->super_class = (Class)_CUIGraphicVariantVectorGlyph;
  [(objc_super *)v46 capHeightUnrounded];
  CGFloat v51 = v50;
  CGAffineTransformMakeScale(&v62, v32, v32);
  v69.origin.double x = v43;
  v69.origin.double y = v45;
  v69.size.double width = v48;
  v69.size.double height = v51;
  CGRect v70 = CGRectApplyAffineTransform(v69, &v62);
  double v52 = v36 + v58 * 0.5 - (v70.origin.x + v70.size.width * 0.5);
  double v53 = v42 + v59 * 0.5 - (v70.origin.y + v70.size.height * 0.5);
  double v54 = v47 * v32;
  double v55 = v61 * v32;
  result.size.double height = v55;
  result.size.double width = v54;
  result.origin.double y = v53;
  result.origin.double x = v52;
  return result;
}

- (CGRect)_scaledContentRectForBackgroundSize:(CGSize)a3 baseContentRect:(CGRect)a4 snappingScale:(double)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat v29 = a3.height;
  CGFloat x = a4.origin.x;
  CGFloat v28 = a3.width;
  [(CUIVectorGlyphGraphicVariantOptions *)[(_CUIGraphicVariantVectorGlyph *)self options] imageOffset];
  v10.f64[0] = height;
  v5.f64[0] = y;
  v7.f64[1] = v6;
  v8.f64[0] = v29;
  v8.f64[1] = v28;
  v5.f64[1] = x;
  float64x2_t v9 = vmlaq_f64(v5, v8, v7);
  v10.f64[1] = width;
  if (a5 >= 0.999999881)
  {
    float64x2_t v12 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a5, 0);
    __asm { FMOV            V16.2D, #0.5 }
    float64x2_t v18 = vaddq_f64(vmulq_f64(v10, _Q16), v9);
    float64x2_t v19 = vdivq_f64(vrndaq_f64(vmulq_n_f64(v9, a5)), v12);
    float64x2_t v20 = vrndmq_f64(vmulq_n_f64(vaddq_f64(v10, v9), a5));
    float64x2_t v9 = vdivq_f64(v20, v12);
    __asm { FMOV            V7.2D, #1.0 }
    float64x2_t v22 = vdivq_f64(vaddq_f64(v20, _Q7), v12);
    float64x2_t v10 = vsubq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(vsubq_f64(vmulq_f64(vaddq_f64(v19, v22), _Q16), v18), vsubq_f64(v18, vmulq_f64(vaddq_f64(v19, v9), _Q16))), (int8x16_t)v9, (int8x16_t)v22), v19);
    double v11 = v19.f64[1];
    v9.f64[0] = v19.f64[0];
  }
  else
  {
    double v11 = v9.f64[1];
  }
  double v23 = v10.f64[1];
  double v24 = v9.f64[0];
  result.size.CGFloat height = v10.f64[0];
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGImage)_createGraphicVariantImageAtScale:(double)a3 backgroundImage:(CGImage *)a4 symbolImage:(CGImage *)a5 destinationRect:(CGRect)a6 disableColorFill:(BOOL)a7 outputScale:(double)a8
{
  BOOL v9 = a7;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v15 = vabdd_f64(a3, a8);
  double v16 = +[CIImage imageWithCGImage:a4];
  double v17 = +[CIImage imageWithCGImage:a5];
  [(CIImage *)v16 extent];
  double v20 = v18;
  double v21 = v19;
  double v22 = 1.0;
  if (v15 > 0.00000011920929) {
    double v22 = a3;
  }
  double v36 = 1.0;
  id v23 = -[_CUIGraphicVariantVectorGlyph _createContentEffectsForTargetSize:scale:](self, "_createContentEffectsForTargetSize:scale:", &v36, v18 * v22, v19 * v22);
  if (v23)
  {
    double v24 = v23;
    if (v9) {
      [v23 setBypassColorFills:1];
    }
    double v17 = (CIImage *)[v24 processedImageFromImage:v17 withScale:v36];
  }
  double v35 = 1.0;
  id v25 = -[_CUIGraphicVariantVectorGlyph _createShapeEffectsForTargetSize:scale:](self, "_createShapeEffectsForTargetSize:scale:", &v35, v20, v21);
  if (v25)
  {
    double v26 = v25;
    double v16 = (CIImage *)[v25 processedImageFromImage:v16 withScale:v35];
  }
  double v27 = +[CUIShapeEffectStack offset:by:](CUIShapeEffectStack, "offset:by:", v17, x * a3, y * a3);
  if (v15 <= 0.00000011920929)
  {
    CGFloat v29 = kCIInputImageKey;
  }
  else
  {
    CGFloat v28 = +[CIFilter filterWithString:@"CIAppleSmithGossettScale"];
    CGFloat v29 = kCIInputImageKey;
    [(CIFilter *)v28 setValue:v27 forKey:kCIInputImageKey];
    [(CIFilter *)v28 setValue:+[NSNumber numberWithDouble:a8 / a3] forKey:kCIInputScaleKey];
    double v27 = [(CIFilter *)v28 outputImage];
  }
  id v30 = +[CUIShapeEffectStack composite:v27 over:v16];
  double v31 = +[CIFilter filterWithName:@"CICrop"];
  [(CIFilter *)v31 setValue:v30 forKey:v29];
  [(CIFilter *)v31 setValue:+[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", 0.0, 0.0, v20, v21) forKey:@"inputRectangle"];
  double v32 = [(CIFilter *)v31 outputImage];
  id v33 = +[CUIShapeEffectStack sharedCIContext];
  [(CIImage *)v32 extent];
  return (CGImage *)objc_msgSend(v33, "createCGImage:fromRect:", v32);
}

- (CGImage)_createBackgroundImageOfSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  if ([(_CUIGraphicVariantVectorGlyph *)self _containsWideGamutColor])
  {
    uint64_t v8 = 4097;
    size_t v9 = 16;
    DisplayP3 = (CGColorSpace *)_CUIColorSpaceGetDisplayP3();
  }
  else
  {
    uint64_t v8 = 8193;
    size_t v9 = 8;
    DisplayP3 = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  }
  CGRect result = CUICGBitmapContextCreate(vcvtpd_u64_f64(width * a4), vcvtpd_u64_f64(height * a4), v9, 0, DisplayP3, v8, v11, v12);
  if (result)
  {
    double v14 = result;
    -[_CUIGraphicVariantVectorGlyph _drawBackgroundShapeInContext:targetSize:scale:](self, "_drawBackgroundShapeInContext:targetSize:scale:", result, width, height, a4);
    Image = CGBitmapContextCreateImage(v14);
    CFRelease(v14);
    return Image;
  }
  return result;
}

- (CGPath)_createBackgroundShapeInRect:(CGRect)a3 scale:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  size_t v9 = [(_CUIGraphicVariantVectorGlyph *)self options];
  id v10 = [(CUIVectorGlyphGraphicVariantOptions *)v9 shape];
  CGAffineTransformMakeScale(&v17, a4, a4);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGRect v19 = CGRectApplyAffineTransform(v18, &v17);
  CGRect v20 = CGRectIntegral(v19);
  CGFloat v12 = v20.origin.x;
  CGFloat v13 = v20.origin.y;
  double v14 = v20.size.width;
  CGFloat v15 = v20.size.height;
  if (v10 == (id)2 || v10 == (id)1)
  {
    v20.origin.CGFloat x = v20.size.height * 0.5;
    goto LABEL_6;
  }
  if (!v10)
  {
    [(CUIVectorGlyphGraphicVariantOptions *)v9 roundedRectCornerRadius];
    v20.origin.CGFloat x = v14 * v20.origin.x;
LABEL_6:
    v11.n128_f64[0] = fmax(v20.origin.x, 0.0);
    v20.origin.CGFloat x = v12;
    v20.origin.CGFloat y = v13;
    v20.size.CGFloat width = v14;
    v20.size.CGFloat height = v15;
    return (CGPath *)_CUICreateNewContinuousRoundedRect((__n128)v20.origin, *(__n128 *)&v20.origin.y, (__n128)v20.size, *(__n128 *)&v20.size.height, v11);
  }
  return 0;
}

- (CGGradient)_createSCurveGradientWithStartColor:(CGColor *)a3 endColor:(CGColor *)a4 height:(double)a5
{
  CGColorSpaceRef SRGB = (CGColorSpaceRef)_CUIColorSpaceGetSRGB();
  uint64_t v8 = 0;
  if (a3 && a4)
  {
    id v9 = objc_alloc((Class)CAMediaTimingFunction);
    LODWORD(v10) = 1046631210;
    LODWORD(v11) = 1000812293;
    LODWORD(v12) = 1062073097;
    LODWORD(v13) = 1.0;
    id v14 = [v9 initWithControlPoints:v10 :v11 :v12 :v13];
    uint64_t v15 = (int)(a5 * 5.0);
    double v16 = (float64x2_t *)CGColorGetComponents(a3);
    CGAffineTransform v17 = (float64x2_t *)CGColorGetComponents(a4);
    CGRect v18 = objc_opt_new();
    uint64_t v33 = (uint64_t)&v33;
    CGRect v20 = (const CGFloat *)((char *)&v33 - ((8 * v15 + 15) & 0xFFFFFFFF0));
    if ((int)v15 >= 1)
    {
      for (uint64_t i = 0; v15 != i; ++i)
      {
        float v22 = (float)(int)i / (float)(int)v15;
        *(float *)&double v19 = v22;
        objc_msgSend(v14, "_solveForInput:", v19, v33);
        if (v23 >= 1.0)
        {
          id v30 = v18;
          double v31 = a4;
        }
        else
        {
          if (v23 > 0.0)
          {
            double v24 = v23;
            double v25 = (float)(1.0 - v23);
            float64x2_t v26 = vmlaq_n_f64(vmulq_n_f64(*v17, v24), *v16, v25);
            float64x2_t v27 = vmlaq_n_f64(vmulq_n_f64(v17[1], v24), v16[1], v25);
            *(float64x2_t *)components = v26;
            float64x2_t v36 = v27;
            CGColorRef v28 = CGColorCreate(SRGB, components);
            if (v28)
            {
              CGFloat v29 = v28;
              [v18 addObject:v28];
              v20[i] = v22;
              CGColorRelease(v29);
            }
            continue;
          }
          id v30 = v18;
          double v31 = a3;
        }
        [v30 addObject:v31];
        double v19 = v22;
        v20[i] = v22;
      }
    }
    uint64_t v8 = CGGradientCreateWithColors(0, (CFArrayRef)v18, v20);
  }
  return v8;
}

- (CGGradient)_createBackgroundGradientWithColors:(id)a3 useSCurve:(BOOL)a4 height:(double)a5
{
  BOOL v6 = a4;
  id v9 = [a3 count];
  uint64_t SRGB = _CUIColorSpaceGetSRGB();
  if (v9 == (id)2)
  {
    CGRect v18 = (CGColor *)[a3 firstObject];
    double v19 = (CGColor *)[a3 lastObject];
    GrayGamma2_2 = (CGColorSpace *)_CUIColorSpaceGetGrayGamma2_2();
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(GrayGamma2_2, kCGRenderingIntentRelativeColorimetric, v18, 0);
    double v22 = *CGColorGetComponents(CopyByMatchingToColorSpace);
    CGColorRelease(CopyByMatchingToColorSpace);
    float v23 = (CGColorSpace *)_CUIColorSpaceGetGrayGamma2_2();
    double v24 = CGColorCreateCopyByMatchingToColorSpace(v23, kCGRenderingIntentRelativeColorimetric, v19, 0);
    double v25 = *CGColorGetComponents(v24);
    CGColorRelease(v24);
    if (v22 <= v25) {
      float64x2_t v26 = v18;
    }
    else {
      float64x2_t v26 = v19;
    }
    if (v22 <= v25) {
      float64x2_t v27 = v19;
    }
    else {
      float64x2_t v27 = v18;
    }
    if (!v6)
    {
      uint64_t v43 = 0;
      *(_OWORD *)locations = xmmword_1A139E178;
      v40[0] = v26;
      v40[1] = v27;
      return CGGradientCreateWithColors(0, (CFArrayRef)+[NSArray arrayWithObjects:v40 count:2], locations);
    }
    return [(_CUIGraphicVariantVectorGlyph *)self _createSCurveGradientWithStartColor:v26 endColor:v27 height:a5];
  }
  else
  {
    if (v9 == (id)1)
    {
      double v11 = (CGColorSpace *)SRGB;
      double v12 = (CGColor *)[a3 firstObject];
      double v13 = (CGColorSpace *)_CUIColorSpaceGetGrayGamma2_2();
      id v14 = CGColorCreateCopyByMatchingToColorSpace(v13, kCGRenderingIntentRelativeColorimetric, v12, 0);
      double v15 = *CGColorGetComponents(v14);
      double v16 = 0.25;
      if (v15 <= 0.25)
      {
        BOOL v17 = 0;
        double v16 = 0.2;
      }
      else if (v15 <= 0.5)
      {
        BOOL v17 = 0;
      }
      else
      {
        BOOL v17 = v15 > 0.75;
        double v16 = dbl_1A139E150[v15 > 0.75];
      }
      CGColorGetColorSpace(v12);
      if (CGColorSpaceEqualToColorSpace()) {
        CGColorRetain(v12);
      }
      else {
        double v12 = CGColorCreateCopyByMatchingToColorSpace(v11, kCGRenderingIntentRelativeColorimetric, v12, 0);
      }
      Components = CGColorGetComponents(v12);
      double v31 = Components[1];
      double v32 = Components[2];
      double v33 = fmin(*Components, fmin(v31, v32));
      double v34 = fmax(*Components, fmax(v31, v32));
      double v35 = (v33 + v34) * 0.5;
      if (v35 <= 0.0) {
        double v35 = 1.0;
      }
      double v36 = v16 * v35;
      CGColorRef v37 = CGColorCreateSRGB(*Components + v36 - (*Components + v36 - (v33 + v36 + v34 + v36) * 0.5) * 0.2, v31 + v36 - (v31 + v36 - (v33 + v36 + v34 + v36) * 0.5) * 0.2, v32 + v36 - (v32 + v36 - (v33 + v36 + v34 + v36) * 0.5) * 0.2, Components[3]);
      if (v17) {
        double v38 = v12;
      }
      else {
        double v38 = v37;
      }
      if (v17) {
        double v12 = v37;
      }
      if (v6)
      {
        double v39 = [(_CUIGraphicVariantVectorGlyph *)self _createSCurveGradientWithStartColor:v12 endColor:v38 height:a5];
      }
      else
      {
        uint64_t v43 = 0x3FF0000000000000;
        *(_OWORD *)locations = xmmword_1A139E160;
        v41[0] = v12;
        v41[1] = v12;
        v41[2] = v38;
        double v39 = CGGradientCreateWithColors(0, (CFArrayRef)+[NSArray arrayWithObjects:v41 count:3], locations);
      }
      CGFloat v29 = v39;
      CGColorRelease(v14);
      CGColorRelease(v12);
      CGColorRelease(v38);
      return v29;
    }
    return CGGradientCreateWithColors(0, (CFArrayRef)a3, 0);
  }
}

- (CGRect)_backgroundShapeBoundsForTargetSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  int64_t v7 = [(CUIVectorGlyphGraphicVariantOptions *)[(_CUIGraphicVariantVectorGlyph *)self options] shapeEffect];
  double v8 = 0.0;
  if (v7 == 1)
  {
    double v9 = 0.8046875;
    if (height * a4 < 256.0) {
      double v9 = 0.8125;
    }
    double v10 = 0.833;
    if (height * a4 >= 64.0) {
      double v10 = v9;
    }
    double v11 = CUIEdgeInsetsMake((height - height * v10) * 0.5, (height - height * v10) * 0.5, (height - height * v10) * 0.5, (height - height * v10) * 0.5);
    double v15 = CUIEdgeInsetsInsetRect(0.0, 0.0, width, height, v11, v12, v13, v14);
    double width = v16;
    double height = v17;
  }
  else
  {
    double v15 = 0.0;
  }
  double v18 = width;
  double v19 = height;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v15;
  return result;
}

- (void)_drawBackgroundShapeInContext:(CGContext *)a3 targetSize:(CGSize)a4 scale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  double v10 = [(_CUIGraphicVariantVectorGlyph *)self options];
  [(CUIVectorGlyphGraphicVariantOptions *)v10 borderWidth];
  double v12 = v11 / a5;
  double v74 = width;
  -[_CUIGraphicVariantVectorGlyph _backgroundShapeBoundsForTargetSize:scale:](self, "_backgroundShapeBoundsForTargetSize:scale:", width, height, a5);
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  if (v12 > 0.0) {
    *(CGRect *)&double v13 = CGRectInset(*(CGRect *)&v13, v12, v12);
  }
  double v21 = -[_CUIGraphicVariantVectorGlyph _createBackgroundShapeInRect:scale:](self, "_createBackgroundShapeInRect:scale:", v13, v14, v15, v16, a5);
  int64_t v22 = [(CUIVectorGlyphGraphicVariantOptions *)v10 fill];
  float v23 = [(CUIVectorGlyphGraphicVariantOptions *)v10 fillColors];
  CGContextSaveGState(a3);
  switch(v22)
  {
    case 0:
      CGContextSetFillColorWithColor(a3, (CGColorRef)[(NSArray *)v23 objectAtIndex:0]);
      CGContextAddPath(a3, v21);
      CGContextFillPath(a3);
      break;
    case 1:
      double v24 = height * a5;
      double v25 = self;
      float64x2_t v26 = v23;
      uint64_t v27 = 0;
      goto LABEL_8;
    case 2:
      CGColorRef v28 = [(_CUIGraphicVariantVectorGlyph *)self _createBackgroundGradientWithColors:v23 useSCurve:0 height:height * a5];
      CGContextAddPath(a3, v21);
      CGContextClip(a3);
      v76.CGFloat x = width * a5 * 0.5;
      v76.CGFloat y = height * a5 * 0.5;
      CGContextDrawRadialGradient(a3, v28, v76, v76.y, v76, 0.0, 3u);
      goto LABEL_9;
    case 3:
      double v24 = height * a5;
      double v25 = self;
      float64x2_t v26 = v23;
      uint64_t v27 = 1;
LABEL_8:
      CGColorRef v28 = [(_CUIGraphicVariantVectorGlyph *)v25 _createBackgroundGradientWithColors:v26 useSCurve:v27 height:v24];
      CGContextAddPath(a3, v21);
      CGContextClip(a3);
      v77.CGFloat x = v74 * a5 * 0.5;
      v77.CGFloat y = 0.0;
      v78.CGFloat x = v77.x;
      v78.CGFloat y = v24;
      CGContextDrawLinearGradient(a3, v28, v77, v78, 3u);
LABEL_9:
      CGGradientRelease(v28);
      break;
    default:
      break;
  }
  if (v12 > 0.0)
  {
    CGContextSaveGState(a3);
    CGContextResetClip(a3);
    v79.origin.CGFloat x = v17;
    v79.origin.CGFloat y = v18;
    v79.size.double width = v19;
    v79.size.double height = v20;
    CGRect v80 = CGRectInset(v79, v12 + 0.5, v12 + 0.5);
    CGFloat v29 = -[_CUIGraphicVariantVectorGlyph _createBackgroundShapeInRect:scale:](self, "_createBackgroundShapeInRect:scale:", v80.origin.x, v80.origin.y, v80.size.width, v80.size.height, a5);
    id v30 = -[_CUIGraphicVariantVectorGlyph _createBackgroundShapeInRect:scale:](self, "_createBackgroundShapeInRect:scale:", v17, v18, v19, v20, a5);
    Mutable = CGPathCreateMutable();
    CGPathAddPath(Mutable, 0, v29);
    CGPathAddPath(Mutable, 0, v30);
    CGContextAddPath(a3, Mutable);
    CGContextSetFillColorWithColor(a3, (CGColorRef)[(CUIVectorGlyphGraphicVariantOptions *)v10 borderColor]);
    CGContextEOFillPath(a3);
    CGPathRelease(Mutable);
    CGPathRelease(v29);
    CGPathRelease(v30);
    CGContextRestoreGState(a3);
  }
  CGContextRestoreGState(a3);
  if (_CUIDebugShowGraphicVariantMetrics())
  {
    -[_CUIGraphicVariantVectorGlyph _safeContentAreaBoundsForBackgroundSize:](self, "_safeContentAreaBoundsForBackgroundSize:", v74, height);
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    -[_CUIGraphicVariantVectorGlyph interiorAlignmentRectForTargetSize:scale:](self, "interiorAlignmentRectForTargetSize:scale:", v74, height, a5);
    CGFloat v68 = v41;
    CGFloat v69 = v40;
    CGFloat v66 = v43;
    CGFloat v67 = v42;
    -[_CUIGraphicVariantVectorGlyph alignmentRectForTargetSize:scale:](self, "alignmentRectForTargetSize:scale:", v74, height, a5);
    double v71 = v45;
    CGFloat v72 = v44;
    double v70 = v46;
    double v47 = height * a5;
    CGFloat v73 = v48;
    if ((id)[(CUIVectorGlyphGraphicVariantOptions *)v10 shapeEffect] == (id)1)
    {
      double v49 = 0.8046875;
      if (v47 < 256.0) {
        double v49 = 0.8125;
      }
      if (v47 < 64.0) {
        double v49 = 0.833;
      }
      double v50 = CUIEdgeInsetsMake((v39 - v39 * (v49 * a5)) * 0.5, (v39 - v39 * (v49 * a5)) * 0.5, (v39 - v39 * (v49 * a5)) * 0.5, (v39 - v39 * (v49 * a5)) * 0.5);
      double v33 = CUIEdgeInsetsInsetRect(v33, v35, v37, v39, v50, v51, v52, v53);
      double v35 = v54;
      double v37 = v55;
      double v39 = v56;
    }
    CGContextSaveGState(a3);
    CGContextSetBlendMode(a3, kCGBlendModeCopy);
    CGContextSetLineWidth(a3, 1.0);
    CGContextSetShouldAntialias(a3, 0);
    CGAffineTransformMakeScale(&v75, a5, a5);
    v81.origin.CGFloat x = v33;
    v81.origin.CGFloat y = v35;
    v81.size.double width = v37;
    v81.size.double height = v39;
    CGRect v82 = CGRectApplyAffineTransform(v81, &v75);
    CGContextAddRect(a3, v82);
    CGContextMoveToPoint(a3, 0.0, height * 0.5 * a5);
    CGContextAddLineToPoint(a3, v74 * a5, height * 0.5 * a5);
    CGFloat v57 = v74 * 0.5 * a5;
    CGContextMoveToPoint(a3, v57, 0.0);
    CGContextAddLineToPoint(a3, v57, v47);
    uint64_t SRGB = CGColorCreateSRGB(1.0, 0.0, 1.0, 1.0);
    CGContextSetStrokeColorWithColor(a3, SRGB);
    CGContextStrokePath(a3);
    CGColorRelease(SRGB);
    v83.origin.CGFloat y = v68;
    v83.origin.CGFloat x = v69;
    v83.size.double height = v66;
    v83.size.double width = v67;
    CGContextAddRect(a3, v83);
    double v59 = CGColorCreateSRGB(1.0, 1.0, 0.0, 1.0);
    CGContextSetStrokeColorWithColor(a3, v59);
    CGContextStrokePath(a3);
    CGColorRelease(v59);
    ClipBoundingBoCGFloat x = CGContextGetClipBoundingBox(a3);
    v84.origin.CGFloat x = v73;
    v84.origin.CGFloat y = v72;
    v84.size.double width = v71;
    v84.size.double height = v70;
    BOOL v60 = CGRectEqualToRect(v84, ClipBoundingBox);
    if (v60) {
      double v61 = v71 + -1.0;
    }
    else {
      double v61 = v71;
    }
    if (v60) {
      double v62 = v70 + -1.0;
    }
    else {
      double v62 = v70;
    }
    CGFloat v63 = v73;
    CGFloat v64 = v72;
    CGContextAddRect(a3, *(CGRect *)(&v61 - 2));
    v65 = CGColorCreateSRGB(1.0, 0.0, 0.0, 1.0);
    CGContextSetStrokeColorWithColor(a3, v65);
    CGContextStrokePath(a3);
    CGColorRelease(v65);
    CGContextRestoreGState(a3);
  }
  CGPathRelease(v21);
}

- (id)_createContentEffectsForTargetSize:(CGSize)a3 scale:(double *)a4
{
  double height = a3.height;
  BOOL v6 = [(_CUIGraphicVariantVectorGlyph *)self options];
  unint64_t v7 = [(CUIVectorGlyphGraphicVariantOptions *)v6 contentEffect];
  if (height >= 0.0)
  {
    if (v7 > 2) {
      double v8 = 0;
    }
    else {
      double v8 = off_1E5A51BE0[v7];
    }
  }
  else
  {
    double v8 = @"CUIVectorGlyphGraphicVariantContentEffectNone";
  }
  id v9 = +[CUIDesignLibraryCompositeCatalog compositeCatalogForDesignSystem:0 colorScheme:0 contrast:0 styling:0 error:0];
  if (!v9) {
    return 0;
  }
  double v10 = (CUIShapeEffectStack *)[v9 shapeEffectPresetWithName:v8 error:0];
  if (v10)
  {
    double v10 = [[CUIShapeEffectStack alloc] initWithEffectPreset:v10];
    if ([(CUIVectorGlyphGraphicVariantOptions *)v6 monochromeForegroundColor]) {
      [(CUIShapeEffectStack *)v10 applyCustomForegroundColor:[(CUIVectorGlyphGraphicVariantOptions *)v6 monochromeForegroundColor] tintEffectColors:1];
    }
    if (v10)
    {
      double v11 = height * *a4;
      double v12 = 1.0;
      if (v11 > 32.0) {
        double v12 = v11 / 992.0 * 10.0;
      }
      [(CUIShapeEffectStack *)v10 scaleEffectParametersBy:v12];
      *a4 = v12;
    }
  }
  return v10;
}

- (id)_createShapeEffectsForTargetSize:(CGSize)a3 scale:(double *)a4
{
  double height = a3.height;
  if ((id)[(CUIVectorGlyphGraphicVariantOptions *)[(_CUIGraphicVariantVectorGlyph *)self options] shapeEffect] != (id)1)return 0; {
  id v6 = +[CUIDesignLibraryCompositeCatalog compositeCatalogForDesignSystem:0 colorScheme:0 contrast:0 styling:0 error:0];
  }
  if (!v6) {
    return 0;
  }
  unint64_t v7 = (CUIShapeEffectStack *)[v6 shapeEffectPresetWithName:@"CUIVectorGlyphGraphicVariantShapeEffectDropShadow" error:0];
  if (v7)
  {
    double v8 = [[CUIShapeEffectStack alloc] initWithEffectPreset:v7];
    unint64_t v7 = v8;
    if (v8)
    {
      double v9 = height * *a4;
      double v10 = 1.0;
      if (v9 > 32.0) {
        double v10 = v9 / 992.0 * 10.0;
      }
      [(CUIShapeEffectStack *)v8 scaleEffectParametersBy:v10];
      *a4 = v10;
    }
  }
  return v7;
}

- (CUIVectorGlyphGraphicVariantOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

@end