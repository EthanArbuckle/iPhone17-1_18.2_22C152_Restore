@interface CUINamedVectorGlyph
+ (id)_colorStyleNames;
+ (id)_knockoutStyleNames;
+ (id)_layerHierarchyStyleNames;
+ (unsigned)_backgroundImageNamesAtom;
+ (unsigned)_hasImageFillsAtom;
+ (unsigned)_rotatesClockwiseAtom;
+ (unsigned)_variableColorContinuousAtom;
+ (unsigned)_wiggleAngleAtom;
+ (unsigned)_wiggleStyleAtom;
- (BOOL)_canUsePathConcatenation;
- (BOOL)_containsWideGamutColor;
- (BOOL)canBeInterpolatedWith:(id)a3;
- (BOOL)containsNamedColorStyle:(id)a3;
- (BOOL)containsNamedColorStyles;
- (BOOL)generatedImage;
- (BOOL)hasImageFills;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFlippable;
- (BOOL)isInterpolatable;
- (BOOL)isKnockoutEnabledForHierarchicalLayerAtIndex:(int64_t)a3 opacity:(double *)a4;
- (BOOL)isKnockoutEnabledForMulticolorLayerAtIndex:(int64_t)a3 opacity:(double *)a4;
- (CGImage)_cgImageRef;
- (CGImage)fillImageWithName:(id)a3;
- (CGImage)image;
- (CGImage)imageWithColorResolver:(id)a3;
- (CGImage)imageWithHierarchicalPrimaryColor:(CGColor *)a3;
- (CGImage)imageWithHierarchyColorResolver:(id)a3;
- (CGImage)imageWithPaletteColorResolver:(id)a3;
- (CGImage)imageWithPaletteColors:(id)a3;
- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4;
- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 hierarchicalPrimaryColor:(CGColor *)a5;
- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withColorResolver:(id)a5;
- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withHierarchyColorResolver:(id)a5;
- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withPaletteColorResolver:(id)a5;
- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withPaletteColors:(id)a5;
- (CGImageRef)_rasterizeImageUsingScaleFactor:(uint64_t)a3 forTargetSize:(double)a4 renderingMode:(double)a5 colorResolver:(double)a6;
- (CGPath)CGPath;
- (CGPath)maskShape;
- (CGPoint)_getMetricCenterInRendition:(id)a3;
- (CGPoint)_interpolatedAnchorWithWeight:(double)a3 glyphSize:(double)a4 fromUltralight:(CGPoint)a5 regular:(CGPoint)a6 black:(CGPoint)a7;
- (CGPoint)metricCenter;
- (CGPoint)rotationAnchor;
- (CGRect)alignmentRect;
- (CGRect)alignmentRectUnrounded;
- (CGRect)contentBounds;
- (CGRect)contentBoundsUnrounded;
- (CGSVGAttributeMap)attributesForLayerNamed:(id)a3;
- (CGSVGAttributeMap)attributesForLayerNamed:(id)a3 inRendition:(id)a4;
- (CGSVGAttributeMap)styleForLayerName:(id)a3;
- (CGSVGDocument)referenceGlyph;
- (CGSVGNode)_getOutlineNodeForDocument:(CGSVGDocument *)a3;
- (CGSize)_interpolatedCanvasSizeWithWeight:(double)a3 glyphSize:(double)a4 fromUltralight:(CGSize)a5 regular:(CGSize)a6 black:(CGSize)a7;
- (CGSize)referenceCanvasSize;
- (CUINamedVectorGlyph)initWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 pointSize:(double)a6 continuousWeight:(double)a7 continuousSize:(double)a8 interpolatedFromRegular:(id)a9 ultralight:(id)a10 black:(id)a11 fromCatalog:(id)a12 themeRef:(unint64_t)a13;
- (CUINamedVectorGlyph)initWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 pointSize:(double)a6 continuousWeight:(double)a7 continuousSize:(double)a8 interpolatedFromRegular:(id)a9 ultralight:(id)a10 black:(id)a11 fromCatalog:(id)a12 themeRef:(unint64_t)a13 locale:(id)a14;
- (CUINamedVectorGlyph)initWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 pointSize:(double)a6 fromCatalog:(id)a7 usingRenditionKey:(id)a8 fromTheme:(unint64_t)a9;
- (CUINamedVectorGlyph)initWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 pointSize:(double)a6 fromCatalog:(id)a7 usingRenditionKey:(id)a8 themeRef:(unint64_t)a9 locale:(id)a10;
- (__CFString)colorNameForRenderingStyle:(__CFString *)result;
- (const)_fillColorOfStyle:(uint64_t)a1;
- (double)_interpolatedAlignmentRectInsetsWithWeight:(double)a3 glyphSize:(double)a4 fromUltralight:(double)a5 regular:(double)a6 black:(double)a7;
- (double)_interpolatedBaselineOffsetWithWeight:(double)a3 glyphSize:(double)a4 fromUltralight:(double)a5 regular:(double)a6 black:(double)a7;
- (double)_interpolatedCapHeightWithWeight:(double)a3 glyphSize:(double)a4 fromUltralight:(double)a5 regular:(double)a6 black:(double)a7;
- (double)_interpolatedStrokeWidthWithWeight:(double)a3 glyphSize:(double)a4 fromUltralight:(double)a5 regular:(double)a6 black:(double)a7;
- (double)_requestedPointSizeRatio;
- (double)baselineOffset;
- (double)baselineOffsetUnrounded;
- (double)capHeight;
- (double)capHeightUnrounded;
- (double)fontMatchingScaleFactor;
- (double)glyphContinuousSize;
- (double)glyphContinuousWeight;
- (double)pointSize;
- (double)referencePointSize;
- (double)scale;
- (double)strokeWidthForLayerNamed:(id)a3;
- (double)strokeWidthForLayerNamed:(id)a3 inRendition:(id)a4;
- (double)variableMaxValue;
- (double)variableMinValue;
- (float)templateVersion;
- (id)_assumeConcatenatedPathForLayerNamed:(void *)a3 inRendition:;
- (id)_blackInterpolationSource;
- (id)_blackRendition;
- (id)_catalog;
- (id)_createShapeGroupSubpaths;
- (id)_getAnchor:(id)a3 inRendition:(id)a4;
- (id)_interpolatedPathWithWeight:(double)a3 glyphSize:(double)a4 fromUltralightSmall:(id)a5 regularSmall:(id)a6 blackSmall:(id)a7;
- (id)_layerNamesForRenderingMode:(int)a3 inRendition:(id)a4;
- (id)_partialLocale;
- (id)_performWithLockedRenditions:(id *)result;
- (id)_regularRendition;
- (id)_stylePrefixForRenderingMode:(int)a3;
- (id)_symbolDefaults;
- (id)_ultralightInterpolationSource;
- (id)_ultralightRendition;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)edgeDefinitionTextureWithBufferAllocator:(id)a3;
- (id)fillImageNames;
- (id)gradientTextureWithBufferAllocator:(id)a3;
- (id)graphicVariantWithOptions:(id)a3;
- (id)hierarchicalLayerThresholds;
- (id)hierarchicalLayers;
- (id)hierarchyLayers;
- (id)hierarchyLevels;
- (id)intWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 pointSize:(double)a6 weight:(int64_t)a7 glyphSize:(int64_t)a8 interpolatedFromRegular:(id)a9 ultralight:(id)a10 black:(id)a11 fromCatalog:(id)a12 themeRef:(unint64_t)a13;
- (id)knownAvailableVectorSizes;
- (id)makeLayerWithColorResolver:(id)a3;
- (id)monochromeLayerNamesInRendition:(id)a3;
- (id)monochromeLayers;
- (id)multicolorColorNames;
- (id)multicolorLayerColorNames;
- (id)multicolorLayerThresholds;
- (id)multicolorLayers;
- (id)paletteLevels;
- (id)pathForLayerNamed:(id)a3;
- (id)symbolDefaults;
- (id)templateLayerThresholds;
- (int64_t)glyphSize;
- (int64_t)glyphWeight;
- (int64_t)layoutDirection;
- (int64_t)preferredRenderingMode;
- (uint64_t)_imageForRenderingMode:(uint64_t)a3 withColorResolver:;
- (uint64_t)_prepareShapeNode:(uint64_t)a3 atNodeIndex:(void *)a4 forRenderingStyle:(uint64_t)a5 withColorResolver:;
- (uint64_t)_setFillColor:(uint64_t)a3 ofStyle:;
- (unint64_t)hash;
- (unint64_t)numberOfHierarchyLayers;
- (unint64_t)numberOfMulticolorLayers;
- (unint64_t)numberOfTemplateLayers;
- (void)_drawHierarchicalLayersInContext:(CGContext *)a3 scaleFactor:(double)a4 targetSize:(CGSize)a5 colorResolver:(id)a6;
- (void)_drawInContext:(uint64_t)a3 scaleFactor:(uint64_t)a4 targetSize:(double)a5 primaryColor:(double)a6 tertiaryColor:(double)a7;
- (void)_drawInContext:(void *)result;
- (void)_drawMulticolorLayersInContext:(CGContext *)a3 scaleFactor:(double)a4 targetSize:(CGSize)a5 colorResolver:(id)a6;
- (void)_drawPaletteLayersInContext:(CGContext *)a3 scaleFactor:(double)a4 targetSize:(CGSize)a5 colorResolver:(id)a6;
- (void)_legacy_drawHierarchicalLayerNamed:(id)a3 inContext:(CGContext *)a4 scaleFactor:(double)a5 targetSize:(CGSize)a6 colorResolver:(id)a7;
- (void)_legacy_drawMonochromeLayerNamed:(id)a3 inContext:(CGContext *)a4 scaleFactor:(double)a5 targetSize:(CGSize)a6 onFillColor:(CGColor *)a7 offFillColor:(CGColor *)a8;
- (void)_legacy_drawMulticolorLayerNamed:(id)a3 inContext:(CGContext *)a4 scaleFactor:(double)a5 targetSize:(CGSize)a6 colorResolver:(id)a7;
- (void)_lookupCatalogImageForIdiom:(int64_t)a3 locale:(id)a4;
- (void)_setBlackInterpolationSource:(id)a3;
- (void)_setCanUsePathConcatenation:(BOOL)a3;
- (void)_setCatalog:(id)a3;
- (void)_setContainsNamedColorStyles:(signed __int16)a3;
- (void)_setFlippable:(BOOL)a3;
- (void)_setGlyphSize:(double)a3;
- (void)_setGlyphWeight:(double)a3;
- (void)_setImage:(CGImage *)a3;
- (void)_setLayoutDirection:(int64_t)a3;
- (void)_setPointSize:(double)a3;
- (void)_setScale:(double)a3;
- (void)_setUltralightInterpolationSource:(id)a3;
- (void)dealloc;
- (void)drawHierarchyLayerAtIndex:(unint64_t)a3 inContext:(CGContext *)a4 withColorResolver:(id)a5;
- (void)drawInContext:(CGContext *)a3;
- (void)drawInContext:(CGContext *)a3 withPaletteColors:(id)a4;
- (void)drawMulticolorLayerAtIndex:(unint64_t)a3 inContext:(CGContext *)a4 withColorResolver:(id)a5;
- (void)drawPaletteLayerAtIndex:(unint64_t)a3 inContext:(CGContext *)a4 withColorResolver:(id)a5;
- (void)hierarchicalLayerGroup;
- (void)monochromeLayerGroup;
- (void)multicolorLayerGroup;
- (void)setFontMatchingScaleFactor:(double)a3;
- (void)setRepresentsOnDemandContent:(BOOL)a3;
- (void)setVariableMaxValue:(double)a3;
- (void)setVariableMinValue:(double)a3;
@end

@implementation CUINamedVectorGlyph

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)CUINamedVectorGlyph;
  unint64_t result = (self->_layoutDirection << (self->_layoutDirection & 7))
         + 83
         * (((unint64_t)(self->_glyphWeight * 1000.0) << ((unint64_t)(self->_glyphWeight * 1000.0) & 7))
          + 83
          * (((unint64_t)(self->_glyphSize * 1000.0) << ((unint64_t)(self->_glyphSize * 1000.0) & 7))
           + 83
           * (((unint64_t)(self->_lookedupScaleFactor * 1000.0) << ((unint64_t)(self->_lookedupScaleFactor
                                                                                            * 1000.0) & 7))
            + 83
            * (((unint64_t)(self->_pointSize * 1000.0) << ((unint64_t)(self->_pointSize * 1000.0) & 7))
             + 83 * [(CUINamedLookup *)&v6 hash]))));
  double variableMinValue = self->_variableMinValue;
  if (variableMinValue != INFINITY) {
    unint64_t result = ((unint64_t)(variableMinValue * 1000.0) << ((unint64_t)(variableMinValue * 1000.0) & 7))
  }
           + 83 * result;
  double variableMaxValue = self->_variableMaxValue;
  if (variableMaxValue != INFINITY) {
    return ((unint64_t)(variableMaxValue * 1000.0) << ((unint64_t)(variableMaxValue * 1000.0) & 7))
  }
         + 83 * result;
  return result;
}

- (void)setRepresentsOnDemandContent:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CUINamedVectorGlyph;
  -[CUINamedLookup setRepresentsOnDemandContent:](&v5, sel_setRepresentsOnDemandContent_);
  [(CUINamedLookup *)self->_ultralightInterpolationSource setRepresentsOnDemandContent:v3];
  [(CUINamedLookup *)self->_blackInterpolationSource setRepresentsOnDemandContent:v3];
}

CGImageRef __64__CUINamedVectorGlyph__imageForRenderingMode_withColorResolver___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 32);
  if (v4[16] && v4[17])
  {
    id v5 = [v4 name];
    id v6 = [*(id *)(a1 + 32) keySignature];
    [*(id *)(a1 + 32) glyphContinuousWeight];
    uint64_t v8 = v7;
    [*(id *)(a1 + 32) glyphContinuousSize];
    v10 = +[NSString stringWithFormat:@"interpolatedsymbol-%@-%@-%f-%f", v5, v6, v8, v9];
  }
  else
  {
    v10 = (NSString *)[v4 keySignature];
  }
  v11 = v10;
  [*(id *)(a1 + 32) scale];
  uint64_t v13 = v12;
  [*(id *)(a1 + 32) pointSize];
  uint64_t v15 = v14;
  [*(id *)(a1 + 32) fontMatchingScaleFactor];
  uint64_t v17 = v16;
  uint64_t v18 = *(unsigned int *)(a1 + 56);
  [*(id *)(a1 + 32) variableMinValue];
  uint64_t v20 = v19;
  [*(id *)(a1 + 32) variableMaxValue];
  v22 = +[NSString stringWithFormat:@"%@-%.0f-%.1f-%.1f-%d-%f-%f", v11, v13, v15, v17, v18, v20, v21];
  int v23 = *(_DWORD *)(a1 + 56);
  if ((v23 - 3) >= 2)
  {
    if (v23 == 2)
    {
      v35 = *(void **)(a1 + 32);
      id v36 = v35 ? [v35 _layerNamesForRenderingMode:2 inRendition:a2] : 0;
      v37 = (char *)[v36 count];
      if (v37)
      {
        v38 = v37;
        for (i = 0; i != v38; ++i)
        {
          v40 = -[CUINamedVectorGlyph colorNameForRenderingStyle:](*(__CFString **)(a1 + 32), [v36 objectAtIndex:i]);
          uint64_t v41 = *(void *)(a1 + 40);
          uint64_t SRGBBlack = _CUIColorGetSRGBBlack();
          v43 = (CGColor *)(*(uint64_t (**)(uint64_t, __CFString *, uint64_t, char *, char *, uint64_t, void))(v41 + 16))(v41, v40, SRGBBlack, i, i, -1, 0);
          v44 = _CUICreateStringWithColor(v43);
          v22 = [(NSString *)v22 stringByAppendingFormat:@"-%@", v44];
          CFRelease(v44);
        }
      }
    }
  }
  else
  {
    v24 = *(void **)(a1 + 32);
    if (v24) {
      id v25 = [v24 _layerNamesForRenderingMode:3 inRendition:a2];
    }
    else {
      id v25 = 0;
    }
    v26 = (char *)[v25 count];
    id v27 = [(id)objc_opt_class() _layerHierarchyStyleNames];
    if (v26)
    {
      for (j = 0; j != v26; ++j)
      {
        v29 = -[CUINamedVectorGlyph colorNameForRenderingStyle:](*(__CFString **)(a1 + 32), [v25 objectAtIndex:j]);
        id v30 = [v27 indexOfObject:v29];
        uint64_t v31 = *(void *)(a1 + 40);
        uint64_t v32 = _CUIColorGetSRGBBlack();
        v33 = (CGColor *)(*(uint64_t (**)(uint64_t, __CFString *, uint64_t, char *, id, uint64_t, void))(v31 + 16))(v31, v29, v32, j, v30, -1, 0);
        v34 = _CUICreateStringWithColor(v33);
        v22 = [(NSString *)v22 stringByAppendingFormat:@"-%@", v34];
        CFRelease(v34);
      }
    }
    else
    {
      uint64_t v45 = _CUIColorGetSRGBBlack();
      v46 = (CGColor *)(*(uint64_t (**)(void, id, uint64_t, void, void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [v27 firstObject], v45, 0, 0, -1, 0);
      v47 = _CUICreateStringWithColor(v46);
      v22 = [(NSString *)v22 stringByAppendingFormat:@"-%@", v47];
      CFRelease(v47);
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(objc_msgSend(objc_loadWeak((id *)(*(void *)(a1 + 32) + 88)), "localObjectCache"), "objectForKey:", v22);
  v48 = *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v48 && (CFTypeID v49 = CFGetTypeID(v48), v49 == CGImageGetTypeID()))
  {
    CGImageRef result = CGImageRetain(*(CGImageRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  }
  else
  {
    v51 = (unsigned __int16 *)objc_msgSend(objc_msgSend(objc_loadWeak((id *)(*(void *)(a1 + 32) + 88)), "_themeStore"), "renditionKeyForName:", objc_msgSend(*(id *)(a1 + 32), "name"));
    CUIRenditionKeyValueForAttribute(v51, 17);
    [*(id *)(a1 + 32) pointSize];
    [*(id *)(a1 + 32) glyphContinuousSize];
    [*(id *)(a1 + 32) glyphContinuousWeight];
    kdebug_trace();
    [*(id *)(a1 + 32) referenceCanvasSize];
    double v53 = v52;
    double v55 = v54;
    [*(id *)(a1 + 32) scale];
    double v57 = v56;
    [*(id *)(a1 + 32) _requestedPointSizeRatio];
    int v59 = *(_DWORD *)(a1 + 56);
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = __64__CUINamedVectorGlyph__imageForRenderingMode_withColorResolver___block_invoke_2;
    v74[3] = &unk_1E5A51410;
    long long v75 = *(_OWORD *)(a1 + 32);
    int v76 = v59;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [(CUINamedVectorGlyph *)(void *)v75 _rasterizeImageUsingScaleFactor:(uint64_t)v74 forTargetSize:v57 * v58 renderingMode:v53 colorResolver:v55];
    uint64_t v60 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    id v67 = [*(id *)(a1 + 32) name];
    if (v60)
    {
      [*(id *)(a1 + 32) pointSize];
      _CUILog(3, (uint64_t)"-[CUINamedVectorGlyph (%@) _imageForRenderingMode:withColorResolver:] pointsize:%f", v68, v69, v70, v71, v72, v73, (uint64_t)v67);
      objc_msgSend(objc_msgSend(objc_loadWeak((id *)(*(void *)(a1 + 32) + 88)), "localObjectCache"), "setObject:forKey:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v22);
    }
    else
    {
      _CUILog(4, (uint64_t)"CoreUI: %s counldn't create vector glyph image with name %@", v61, v62, v63, v64, v65, v66, (uint64_t)"-[CUINamedVectorGlyph _imageForRenderingMode:withColorResolver:]_block_invoke");
    }
    return (CGImageRef)kdebug_trace();
  }
  return result;
}

- (CGImageRef)_rasterizeImageUsingScaleFactor:(uint64_t)a3 forTargetSize:(double)a4 renderingMode:(double)a5 colorResolver:(double)a6
{
  if (!a1) {
    return 0;
  }
  if (a4 == 0.0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:sel__rasterizeImageUsingScaleFactor_forTargetSize_renderingMode_colorResolver_, a1, @"CUINamedVectorGlyph.m", 2228, @"Invalid parameter not satisfying: %@", @"scale" object file lineNumber description];
  }
  if (a5 <= 0.0 || a6 <= 0.0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:sel__rasterizeImageUsingScaleFactor_forTargetSize_renderingMode_colorResolver_, a1, @"CUINamedVectorGlyph.m", 2229, @"Invalid parameter not satisfying: %@", @"targetSizeInPoints.width>0 && targetSizeInPoints.height>0" object file lineNumber description];
  }
  id v12 = [a1 name];
  _CUILog(3, (uint64_t)"-[CUINamedVectorGlyph (%@) rasterizeImageUsingScaleFactor:%f forTargetSize:%fx%f]", v13, v14, v15, v16, v17, v18, (uint64_t)v12);
  [a1 referenceCanvasSize];
  objc_msgSend(objc_msgSend(a1, "_regularRendition"), "svgDocument");
  if (objc_msgSend(objc_msgSend(a1, "renditionKey"), "themeDisplayGamut"))
  {
    double v19 = ceil(a5 * a4);
    double v20 = ceil(a6 * a4);
    if (CGSVGDocumentContainsWideGamutContent())
    {
      uint64_t v21 = 4097;
      size_t v22 = 16;
      DisplayP3 = (CGColorSpace *)_CUIColorSpaceGetDisplayP3();
      goto LABEL_11;
    }
  }
  else
  {
    double v19 = ceil(a5 * a4);
    double v20 = ceil(a6 * a4);
  }
  uint64_t v21 = 8193;
  size_t v22 = 8;
  DisplayP3 = (CGColorSpace *)_CUIColorSpaceGetSRGB();
LABEL_11:
  CGContextRef v26 = CUICGBitmapContextCreate((unint64_t)v19, (unint64_t)v20, v22, 0, DisplayP3, v21, v24, v25);
  if (!v26)
  {
    _CUILog(4, (uint64_t)"CoreUI: %s couldn't create bitmapContext for (%fx%f) colorSpace:'%@' [svgsize:%fx%f scale:%f bpc:%zd bpp:%zd bitmapInfo:%d]", v27, v28, v29, v30, v31, v32, (uint64_t)"-[CUINamedVectorGlyph _rasterizeImageUsingScaleFactor:forTargetSize:renderingMode:colorResolver:]");
    return 0;
  }
  v33 = v26;
  switch(a2)
  {
    case 1:
      uint64_t SRGBBlack = _CUIColorGetSRGBBlack();
      uint64_t v35 = (*(uint64_t (**)(uint64_t, __CFString *, uint64_t, void, void, uint64_t, void))(a3 + 16))(a3, @"primary", SRGBBlack, 0, 0, -1, 0);
      [(CUINamedVectorGlyph *)a1 _drawInContext:v35 scaleFactor:0 targetSize:a4 primaryColor:a5 tertiaryColor:a6];
      break;
    case 2:
      objc_msgSend(a1, "_drawMulticolorLayersInContext:scaleFactor:targetSize:colorResolver:", v26, a3, a4, a5, a6);
      break;
    case 3:
      objc_msgSend(a1, "_drawHierarchicalLayersInContext:scaleFactor:targetSize:colorResolver:", v26, a3, a4, a5, a6);
      break;
    case 4:
      objc_msgSend(a1, "_drawPaletteLayersInContext:scaleFactor:targetSize:colorResolver:", v26, a3, a4, a5, a6);
      break;
    default:
      break;
  }
  CGImageRef Image = CGBitmapContextCreateImage(v33);
  CFRelease(v33);
  return Image;
}

uint64_t __64__CUINamedVectorGlyph__imageForRenderingMode_withColorResolver___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(a1 + 40)) {
    return a3;
  }
  [*(id *)(a1 + 32) templateVersion];
  if (v5 < 2.1 || *(_DWORD *)(a1 + 48) == 1) {
    return a3;
  }
  uint64_t v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v7();
}

- (__CFString)colorNameForRenderingStyle:(__CFString *)result
{
  if (result)
  {
    BOOL v3 = (char *)[a2 rangeOfString:@":"];
    if (v4 == 1 && (float v5 = v3 + 1, v3 + 1 < (char *)[a2 length] - 1))
    {
      return (__CFString *)[a2 substringFromIndex:v5];
    }
    else
    {
      return &stru_1EF488038;
    }
  }
  return result;
}

uint64_t __46__CUINamedVectorGlyph_imageWithColorResolver___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __53__CUINamedVectorGlyph_imageWithPaletteColorResolver___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __46__CUINamedVectorGlyph_imageWithPaletteColors___block_invoke_3(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = a1 + 32;
  BOOL v3 = *(void **)(a1 + 32);
  if (*(void *)(v4 + 8) <= a3) {
    return [v3 lastObject];
  }
  else {
    return objc_msgSend(v3, "objectAtIndex:");
  }
}

+ (id)_layerHierarchyStyleNames
{
  if (_layerHierarchyStyleNames_onceToken != -1) {
    dispatch_once(&_layerHierarchyStyleNames_onceToken, &__block_literal_global_212);
  }
  return (id)_layerHierarchyStyleNames_layerHierarchyStyleNames;
}

- (CUINamedVectorGlyph)initWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 pointSize:(double)a6 continuousWeight:(double)a7 continuousSize:(double)a8 interpolatedFromRegular:(id)a9 ultralight:(id)a10 black:(id)a11 fromCatalog:(id)a12 themeRef:(unint64_t)a13 locale:(id)a14
{
  if (!a9 || !a10 || !a11)
  {

    return 0;
  }
  v27.receiver = self;
  v27.super_class = (Class)CUINamedVectorGlyph;
  int v23 = [(CUINamedLookup *)&v27 initWithName:a3 usingRenditionKey:a9 fromTheme:a13];
  if (!v23) {
    return v23;
  }
  v23->_ultralightInterpolationSource = [[CUINamedLookup alloc] initWithName:a3 usingRenditionKey:a10 fromTheme:a13];
  v23->_blackInterpolationSource = [[CUINamedLookup alloc] initWithName:a3 usingRenditionKey:a11 fromTheme:a13];
  if (![(CUIThemeRendition *)[(CUINamedLookup *)v23 _rendition] isInterpolatable]
    || ![(CUIThemeRendition *)[(CUINamedLookup *)v23->_ultralightInterpolationSource _rendition] isInterpolatable]|| ![(CUIThemeRendition *)[(CUINamedLookup *)v23->_blackInterpolationSource _rendition] isInterpolatable])
  {

    return 0;
  }
  *((unsigned char *)v23 + 104) |= 4u;
  v23->_pointSize = a6;
  v23->_lookedupScaleFactor = a4;
  objc_storeWeak((id *)&v23->_catalog, a12);
  v23->_fontMatchingScaleFactor = 1.0;
  v23->_containsNamedColorStyles = -1;
  v23->_glyphWeight = a7;
  v23->_glyphSize = a8;
  v23->_double variableMinValue = INFINITY;
  v23->_double variableMaxValue = INFINITY;
  [(CUINamedVectorGlyph *)v23 _lookupCatalogImageForIdiom:a5 locale:a14];
  if ([(CUIThemeRendition *)[(CUINamedLookup *)v23 _rendition] isFlippable]) {
    char v24 = 2;
  }
  else {
    char v24 = 0;
  }
  *((unsigned char *)v23 + 104) = *((unsigned char *)v23 + 104) & 0xFD | v24;
  v23->_layoutDirection = [(CUIRenditionKey *)[(CUINamedLookup *)v23 renditionKey] themeDirection];
  if ((*((unsigned char *)v23 + 104) & 2) == 0
    && objc_msgSend((id)_LookupStructuredThemeProvider(a13, v25), "imageNamedShouldFlip:", a3))
  {
    *((unsigned char *)v23 + 104) |= 2u;
    v23->_layoutDirection = 5;
  }
  return v23;
}

- (CUINamedVectorGlyph)initWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 pointSize:(double)a6 fromCatalog:(id)a7 usingRenditionKey:(id)a8 themeRef:(unint64_t)a9 locale:(id)a10
{
  v29.receiver = self;
  v29.super_class = (Class)CUINamedVectorGlyph;
  uint64_t v18 = [(CUINamedLookup *)&v29 initWithName:a3 usingRenditionKey:a8 fromTheme:a9];
  double v19 = v18;
  if (v18)
  {
    v18->_pointSize = a6;
    v18->_lookedupScaleFactor = a4;
    objc_storeWeak((id *)&v18->_catalog, a7);
    v19->_fontMatchingScaleFactor = 1.0;
    v19->_containsNamedColorStyles = -1;
    unint64_t v20 = (unint64_t)[a8 themeGlyphWeight];
    if (v20 > 9) {
      unint64_t v21 = 0xBFE999999999999ALL;
    }
    else {
      unint64_t v21 = qword_1A139DB18[v20];
    }
    *(void *)&v19->_glyphWeight = v21;
    unint64_t v22 = (unint64_t)[a8 themeGlyphSize];
    double v23 = 1.0;
    if (v22 <= 3) {
      double v23 = dbl_1A139DB68[v22];
    }
    v19->_glyphSize = v23;
    v19->_double variableMinValue = INFINITY;
    v19->_double variableMaxValue = INFINITY;
    char v24 = [(CUINamedLookup *)v19 _rendition];
    if ([(CUIThemeRendition *)v24 isInterpolatable]) {
      char v25 = 4;
    }
    else {
      char v25 = 0;
    }
    *((unsigned char *)v19 + 104) = *((unsigned char *)v19 + 104) & 0xFB | v25;
    [(CUINamedVectorGlyph *)v19 _lookupCatalogImageForIdiom:a5 locale:a10];
    if ([(CUIThemeRendition *)v24 isFlippable]) {
      char v26 = 2;
    }
    else {
      char v26 = 0;
    }
    *((unsigned char *)v19 + 104) = *((unsigned char *)v19 + 104) & 0xFD | v26;
    v19->_layoutDirection = [(CUIRenditionKey *)[(CUINamedLookup *)v19 renditionKey] themeDirection];
    if ((*((unsigned char *)v19 + 104) & 2) == 0
      && objc_msgSend((id)_LookupStructuredThemeProvider(a9, v27), "imageNamedShouldFlip:", a3))
    {
      *((unsigned char *)v19 + 104) |= 2u;
      v19->_layoutDirection = 5;
    }
  }
  return v19;
}

- (id)pathForLayerNamed:(id)a3
{
  if ((*((unsigned char *)self + 104) & 4) != 0)
  {
    if (self->_ultralightInterpolationSource && self->_blackInterpolationSource)
    {
      id v6 = (unsigned __int16 *)objc_msgSend(objc_msgSend(objc_loadWeak((id *)&self->_catalog), "_themeStore"), "renditionKeyForName:", -[CUINamedLookup name](self, "name"));
      CUIRenditionKeyValueForAttribute(v6, 17);
      [(CUINamedVectorGlyph *)self pointSize];
      [(CUINamedVectorGlyph *)self glyphContinuousSize];
      [(CUINamedVectorGlyph *)self glyphContinuousWeight];
      kdebug_trace();
      if ([a3 length])
      {
        id v7 = [(CUINamedVectorGlyph *)self _ultralightRendition];
        if ((*((unsigned char *)self + 104) & 4) != 0) {
          id v8 = -[CUINamedVectorGlyph _assumeConcatenatedPathForLayerNamed:inRendition:]((uint64_t)self, (uint64_t)a3, v7);
        }
        else {
          id v8 = 0;
        }
        id v27 = [(CUINamedVectorGlyph *)self _regularRendition];
        if ((*((unsigned char *)self + 104) & 4) != 0) {
          id v28 = -[CUINamedVectorGlyph _assumeConcatenatedPathForLayerNamed:inRendition:]((uint64_t)self, (uint64_t)a3, v27);
        }
        else {
          id v28 = 0;
        }
        id v29 = [(CUINamedVectorGlyph *)self _blackRendition];
        if ((*((unsigned char *)self + 104) & 4) != 0) {
          id v30 = -[CUINamedVectorGlyph _assumeConcatenatedPathForLayerNamed:inRendition:]((uint64_t)self, (uint64_t)a3, v29);
        }
        else {
          id v30 = 0;
        }
        [(CUINamedVectorGlyph *)self glyphContinuousWeight];
        double v32 = v31;
        [(CUINamedVectorGlyph *)self glyphContinuousSize];
        id v24 = [(CUINamedVectorGlyph *)self _interpolatedPathWithWeight:v8 glyphSize:v28 fromUltralightSmall:v30 regularSmall:v32 blackSmall:v33];
LABEL_28:
        kdebug_trace();
        return v24;
      }
      int v11 = 1;
LABEL_15:
      id v12 = -[CUINamedVectorGlyph _getOutlineNodeForDocument:](self, "_getOutlineNodeForDocument:", objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "svgDocument"));
      long long v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
      long long v36 = *(_OWORD *)&CGAffineTransformIdentity.a;
      long long v37 = *(_OWORD *)&CGAffineTransformIdentity.a;
      long long v34 = *(_OWORD *)&CGAffineTransformIdentity.tx;
      long long v35 = v13;
      long long v38 = v13;
      long long v39 = v34;
      id v14 = CUICreatePathFromSVGNode(v12, &v37);
      float v5 = v14;
      if (!v11)
      {
        if (v14) {
          id v26 = v14;
        }
        return v5;
      }
      id v15 = objc_msgSend(-[CUINamedVectorGlyph _ultralightRendition](self, "_ultralightRendition"), "svgDocument");
      id v16 = objc_msgSend(-[CUINamedVectorGlyph _blackRendition](self, "_blackRendition"), "svgDocument");
      uint64_t v17 = [(CUINamedVectorGlyph *)self _getOutlineNodeForDocument:v15];
      uint64_t v18 = [(CUINamedVectorGlyph *)self _getOutlineNodeForDocument:v16];
      long long v37 = v36;
      long long v38 = v35;
      long long v39 = v34;
      id v19 = CUICreatePathFromSVGNode(v17, &v37);
      long long v37 = v36;
      long long v38 = v35;
      long long v39 = v34;
      id v20 = CUICreatePathFromSVGNode(v18, &v37);
      [(CUINamedVectorGlyph *)self glyphContinuousWeight];
      double v22 = v21;
      [(CUINamedVectorGlyph *)self glyphContinuousSize];
      id v24 = [(CUINamedVectorGlyph *)self _interpolatedPathWithWeight:v19 glyphSize:v5 fromUltralightSmall:v20 regularSmall:v22 blackSmall:v23];

      if (v5) {
        id v25 = v5;
      }
      goto LABEL_28;
    }
  }
  else
  {
    objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "svgDocument");
    CGSVGDocumentGetRootNode();
    if ((CUISVGNodeCanBeRepresentedAsPath() & 1) == 0) {
      return 0;
    }
  }
  if (![a3 length])
  {
    int v11 = 0;
    goto LABEL_15;
  }
  id v9 = [(CUINamedVectorGlyph *)self _regularRendition];
  return -[CUINamedVectorGlyph _assumeConcatenatedPathForLayerNamed:inRendition:]((uint64_t)self, (uint64_t)a3, v9);
}

- (id)_assumeConcatenatedPathForLayerNamed:(void *)a3 inRendition:
{
  id result = 0;
  if (a1 && a3)
  {
    [a3 svgDocument];
    CGSVGDocumentGetRootNode();
    CGSVGNodeGetChildAtIndex();
    uint64_t ChildCount = CGSVGNodeGetChildCount();
    id v7 = +[NSMutableArray array];
    if (ChildCount)
    {
      for (uint64_t i = 0; i != ChildCount; ++i)
      {
        ChildAtIndex = (void *)CGSVGNodeGetChildAtIndex();
        if (CGSVGNodeGetType() == 2 && CGSVGNodeFindAttribute())
        {
          v10 = (void *)CGSVGAttributeCopyString();
          if (objc_msgSend(objc_msgSend(v10, "componentsSeparatedByString:", @" "), "containsObject:", a2))
          {
            long long v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
            v13[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
            v13[1] = v11;
            v13[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
            id v12 = CUICreatePathFromSVGNode(ChildAtIndex, v13);
            [v7 addObject:v12];
          }
        }
      }
    }
    return +[CUIVectorGlyphPath createConcatenatingPaths:v7];
  }
  return result;
}

- (void)_lookupCatalogImageForIdiom:(int64_t)a3 locale:(id)a4
{
  if (!self->_cgImageRef)
  {
    p_catalog = &self->_catalog;
    if (objc_loadWeak((id *)&self->_catalog))
    {
      id v8 = [(CUINamedLookup *)self name];
      int64_t v9 = [(CUINamedVectorGlyph *)self layoutDirection];
      id v10 = [(CUINamedVectorGlyph *)self knownAvailableVectorSizes];
      uint64_t v11 = (uint64_t)[v10 count];
      uint64_t v12 = v11;
      uint64_t v13 = 0;
      id v24 = v8;
      while (kCoreThemeContinuousGlyphWeights[v13] != self->_glyphWeight)
      {
        if (++v13 == 9)
        {
          uint64_t v14 = 0;
          goto LABEL_9;
        }
      }
      uint64_t v14 = kCoreThemeDiscreteGlyphWeights[v13];
LABEL_9:
      uint64_t v15 = 0;
      while (*(double *)&kCoreThemeContinuousGlyphSizes[v15] != self->_glyphSize)
      {
        if (++v15 == 3) {
          return;
        }
      }
      if (v14 && v11 >= 1)
      {
        uint64_t v16 = 0;
        uint64_t v23 = kCoreThemeDiscreteGlyphSizes[v15];
        while (1)
        {
          objc_msgSend(objc_msgSend(v10, "objectAtIndex:", v16), "floatValue");
          if (self->_pointSize == v17) {
            break;
          }
          if (v12 == ++v16) {
            return;
          }
        }
        id Weak = objc_loadWeak((id *)p_catalog);
        double lookedupScaleFactor = self->_lookedupScaleFactor;
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = __58__CUINamedVectorGlyph__lookupCatalogImageForIdiom_locale___block_invoke;
        v25[3] = &unk_1E5A51088;
        v25[4] = self;
        v25[5] = v16;
        v25[6] = v23;
        v25[7] = v14;
        id v20 = [Weak imageWithName:v24 scaleFactor:a3 deviceIdiom:v9 layoutDirection:a4 locale:v25 adjustRenditionKeyWithBlock:lookedupScaleFactor];
        double v21 = CGImageRetain((CGImageRef)[v20 image]);
        self->_cgImageRef = v21;
        if (v21)
        {
          [v20 scale];
          self->_double lookedupScaleFactor = v22;
        }
      }
    }
  }
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (id)knownAvailableVectorSizes
{
  id v2 = [(CUINamedVectorGlyph *)self _regularRendition];
  return [v2 vectorGlyphAvailableSizes];
}

- (double)capHeightUnrounded
{
  if (self->_ultralightInterpolationSource && self->_blackInterpolationSource)
  {
    [(CUINamedVectorGlyph *)self glyphContinuousWeight];
    double v4 = v3;
    [(CUINamedVectorGlyph *)self glyphContinuousSize];
    double v6 = v5;
    objc_msgSend(-[CUINamedVectorGlyph _ultralightRendition](self, "_ultralightRendition"), "vectorGlyphCapLine");
    double v8 = v7;
    objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "vectorGlyphCapLine");
    double v10 = v9;
    objc_msgSend(-[CUINamedVectorGlyph _blackRendition](self, "_blackRendition"), "vectorGlyphCapLine");
    [(CUINamedVectorGlyph *)self _interpolatedCapHeightWithWeight:v4 glyphSize:v6 fromUltralight:v8 regular:v10 black:v11];
  }
  else
  {
    objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "vectorGlyphCapLine");
  }
  double v13 = v12;
  [(CUINamedVectorGlyph *)self _requestedPointSizeRatio];
  return v13 * v14;
}

- (double)baselineOffsetUnrounded
{
  if (self->_ultralightInterpolationSource && self->_blackInterpolationSource)
  {
    [(CUINamedVectorGlyph *)self glyphContinuousWeight];
    double v4 = v3;
    [(CUINamedVectorGlyph *)self glyphContinuousSize];
    double v6 = v5;
    objc_msgSend(-[CUINamedVectorGlyph _ultralightRendition](self, "_ultralightRendition"), "vectorGlyphBaseline");
    double v8 = v7;
    objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "vectorGlyphBaseline");
    double v10 = v9;
    objc_msgSend(-[CUINamedVectorGlyph _blackRendition](self, "_blackRendition"), "vectorGlyphBaseline");
    [(CUINamedVectorGlyph *)self _interpolatedBaselineOffsetWithWeight:v4 glyphSize:v6 fromUltralight:v8 regular:v10 black:v11];
  }
  else
  {
    objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "vectorGlyphBaseline");
  }
  double v13 = v12;
  [(CUINamedVectorGlyph *)self _requestedPointSizeRatio];
  return v13 * v14;
}

float64x2_t __36__CUINamedVectorGlyph_alignmentRect__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  [*(id *)(a1 + 32) referenceCanvasSize];
  float64_t v48 = v9;
  double v50 = v8;
  if (a3 && a4)
  {
    double v10 = *(void **)(a1 + 32);
    [v10 glyphContinuousWeight];
    double v51 = v11;
    [*(id *)(a1 + 32) glyphContinuousSize];
    double v45 = v12;
    [a3 vectorGlyphAlignmentRectInsets];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [a2 vectorGlyphAlignmentRectInsets];
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    [a4 vectorGlyphAlignmentRectInsets];
    objc_msgSend(v10, "_interpolatedAlignmentRectInsetsWithWeight:glyphSize:fromUltralight:regular:black:", v51, v45, v14, v16, v18, v20, v22, v24, v26, v28, v29, v30, v31, v32);
  }
  else
  {
    [a2 vectorGlyphAlignmentRectInsets];
  }
  float64_t v52 = v33;
  float64_t v44 = v34;
  [*(id *)(a1 + 32) _requestedPointSizeRatio];
  double v46 = v35;
  [*(id *)(a1 + 32) scale];
  uint64_t v37 = v36;
  v39.f64[0] = v50;
  v38.f64[0] = v52;
  v38.f64[1] = v44;
  v39.f64[1] = v48;
  CGFloat v40 = v46;
  if (v46 > 0.0)
  {
    float64x2_t v53 = vmulq_n_f64(v38, v46);
    memset(&v54, 0, sizeof(v54));
    CGFloat v41 = v46;
    float64x2_t v47 = v39;
    uint64_t v49 = v37;
    CGAffineTransformMakeScale(&v54, v41, v40);
    uint64_t v37 = v49;
    float64x2_t v38 = v53;
    float64x2_t v39 = vmlaq_n_f64(vmulq_laneq_f64(*(float64x2_t *)&v54.c, v47, 1), *(float64x2_t *)&v54.a, v50);
  }
  float64x2_t v42 = (float64x2_t)vdupq_lane_s64(v37, 0);
  *(float64x2_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = vdivq_f64(vrndaq_f64(vmulq_n_f64(v38, *(double *)&v37)), v42);
  float64x2_t result = vdivq_f64(vrndpq_f64(vmulq_n_f64(v39, *(double *)&v37)), v42);
  *(float64x2_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = result;
  return result;
}

- (double)scale
{
  return self->_lookedupScaleFactor;
}

- (double)_requestedPointSizeRatio
{
  [(CUINamedVectorGlyph *)self pointSize];
  double v4 = v3;
  [(CUINamedVectorGlyph *)self referencePointSize];
  BOOL v6 = v5 < 1.0 || v4 < 1.0;
  double v7 = v4 / v5;
  if (v6) {
    double v8 = 1.0;
  }
  else {
    double v8 = v7;
  }
  [(CUINamedVectorGlyph *)self fontMatchingScaleFactor];
  return v9 * v8;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (double)fontMatchingScaleFactor
{
  return self->_fontMatchingScaleFactor;
}

- (CGSize)referenceCanvasSize
{
  if (self->_ultralightInterpolationSource && self->_blackInterpolationSource)
  {
    [(CUINamedVectorGlyph *)self glyphContinuousWeight];
    double v4 = v3;
    [(CUINamedVectorGlyph *)self glyphContinuousSize];
    double v6 = v5;
    objc_msgSend(-[CUINamedVectorGlyph _ultralightRendition](self, "_ultralightRendition"), "canvasSize");
    double v8 = v7;
    double v10 = v9;
    objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "canvasSize");
    double v12 = v11;
    double v14 = v13;
    objc_msgSend(-[CUINamedVectorGlyph _blackRendition](self, "_blackRendition"), "canvasSize");
    -[CUINamedVectorGlyph _interpolatedCanvasSizeWithWeight:glyphSize:fromUltralight:regular:black:](self, "_interpolatedCanvasSizeWithWeight:glyphSize:fromUltralight:regular:black:", v4, v6, v8, v10, v12, v14, v15, v16);
  }
  else
  {
    id v19 = [(CUINamedVectorGlyph *)self _regularRendition];
    [v19 canvasSize];
  }
  result.height = v18;
  result.width = v17;
  return result;
}

- (double)glyphContinuousWeight
{
  return self->_glyphWeight;
}

- (double)glyphContinuousSize
{
  return self->_glyphSize;
}

- (float)templateVersion
{
  id v2 = [(CUINamedVectorGlyph *)self _regularRendition];
  [v2 vectorGlyphTemplateVersion];
  return result;
}

- (int64_t)preferredRenderingMode
{
  int64_t result = (int64_t)objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "vectorGlyphRenderingMode");
  if ((unint64_t)result <= 1) {
    return 1;
  }
  return result;
}

- (double)referencePointSize
{
  id v2 = [(CUINamedVectorGlyph *)self _regularRendition];
  [v2 vectorGlyphReferencePointSize];
  return result;
}

- (id)_regularRendition
{
  lockedRenditions = self->_lockedRenditions;
  if (lockedRenditions) {
    return lockedRenditions->var0;
  }
  else {
    return [(CUINamedLookup *)self _rendition];
  }
}

- (id)_performWithLockedRenditions:(id *)result
{
  if (result)
  {
    double v3 = result;
    [result lock];
    id v4 = [v3 _rendition];
    id v10 = v4;
    [v4 lock];
    id v5 = v4;
    id v6 = [v3[16] _rendition];
    id v11 = v6;
    [v6 lock];
    id v7 = v6;
    id v8 = [v3[17] _rendition];
    id v12 = v8;
    [v8 lock];
    id v9 = v8;
    v3[26] = &v10;
    (*(void (**)(uint64_t, id, id, id))(a2 + 16))(a2, v4, v6, v8);
    v3[26] = 0;
    [v10 unlock];

    [v11 unlock];
    [v12 unlock];

    return (id *)[v3 unlock];
  }
  return result;
}

- (id)_ultralightRendition
{
  lockedRenditions = self->_lockedRenditions;
  if (lockedRenditions) {
    return lockedRenditions->var1;
  }
  else {
    return [(CUINamedLookup *)self->_ultralightInterpolationSource _rendition];
  }
}

- (id)_blackRendition
{
  lockedRenditions = self->_lockedRenditions;
  if (lockedRenditions) {
    return lockedRenditions->var2;
  }
  else {
    return [(CUINamedLookup *)self->_blackInterpolationSource _rendition];
  }
}

float64x2_t __36__CUINamedVectorGlyph_contentBounds__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  [*(id *)(a1 + 32) referenceCanvasSize];
  float64_t v53 = v9;
  double v55 = v8;
  if (a3 && a4)
  {
    id v10 = *(void **)(a1 + 32);
    [v10 glyphContinuousWeight];
    double v59 = v11;
    [*(id *)(a1 + 32) glyphContinuousSize];
    double v56 = v12;
    [a3 vectorGlyphAlignmentRectInsets];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [a2 vectorGlyphAlignmentRectInsets];
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    [a4 vectorGlyphAlignmentRectInsets];
    objc_msgSend(v10, "_interpolatedAlignmentRectInsetsWithWeight:glyphSize:fromUltralight:regular:black:", v59, v56, v14, v16, v18, v20, v22, v24, v26, v28, v29, v30, v31, v32);
  }
  else
  {
    [a2 vectorGlyphAlignmentRectInsets];
  }
  float64_t v49 = v35;
  float64_t v50 = v33;
  float64_t v57 = v36;
  float64_t v60 = v34;
  [*(id *)(a1 + 32) _requestedPointSizeRatio];
  double v51 = v37;
  [*(id *)(a1 + 32) scale];
  uint64_t v39 = v38;
  v41.f64[0] = v55;
  v40.f64[0] = v57;
  v40.f64[1] = v49;
  v41.f64[1] = v53;
  v42.f64[0] = v60;
  v42.f64[1] = v50;
  float64x2_t v43 = v42;
  float64x2_t v44 = v40;
  if (v51 > 0.0)
  {
    float64x2_t v58 = vmulq_n_f64(v40, v51);
    float64x2_t v61 = vmulq_n_f64(v43, v51);
    memset(&v62, 0, sizeof(v62));
    CGFloat v45 = v51;
    CGFloat v46 = v51;
    float64x2_t v52 = v41;
    uint64_t v54 = v39;
    CGAffineTransformMakeScale(&v62, v45, v46);
    uint64_t v39 = v54;
    float64x2_t v44 = v58;
    float64x2_t v43 = v61;
    float64x2_t v41 = vmlaq_n_f64(vmulq_laneq_f64(*(float64x2_t *)&v62.c, v52, 1), *(float64x2_t *)&v62.a, v55);
  }
  float64x2_t v47 = (float64x2_t)vdupq_lane_s64(v39, 0);
  *(CGPoint *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = CGPointZero;
  float64x2_t result = vaddq_f64(vdivq_f64(vrndaq_f64(vmulq_n_f64(v44, *(double *)&v39)), v47), vaddq_f64(vdivq_f64(vrndpq_f64(vmulq_n_f64(v41, *(double *)&v39)), v47), vdivq_f64(vrndaq_f64(vmulq_n_f64(v43, *(double *)&v39)), v47)));
  *(float64x2_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = result;
  return result;
}

- (CGSVGAttributeMap)attributesForLayerNamed:(id)a3 inRendition:(id)a4
{
  [a4 svgDocument];
  if (a3)
  {
    [(CUINamedVectorGlyph *)self templateVersion];
    float v7 = v6;
    CGSVGDocumentGetRootNode();
    if (v7 >= 5.0 && CGSVGNodeFindChildWithStringIdentifier())
    {
      uint64_t ChildCount = CGSVGNodeGetChildCount();
      if (ChildCount)
      {
        uint64_t v9 = ChildCount;
        for (uint64_t i = 0; i != v9; ++i)
        {
          CGSVGNodeGetChildAtIndex();
          if (CGSVGNodeFindAttribute())
          {
            double v11 = (void *)CGSVGAttributeCopyString();
            if ([v11 containsString:a3])
            {
              AttributeMap = (CGSVGAttributeMap *)CGSVGNodeGetAttributeMap();

              if (AttributeMap) {
                return AttributeMap;
              }
            }
            else
            {
            }
          }
        }
      }
    }
    else
    {
      CGSVGNodeGetChildAtIndex();
      uint64_t v13 = CGSVGNodeGetChildCount();
      if (v13)
      {
        uint64_t v14 = v13;
        for (uint64_t j = 0; j != v14; ++j)
        {
          CGSVGNodeGetChildAtIndex();
          if (CGSVGNodeFindAttribute())
          {
            double v16 = (void *)CGSVGAttributeCopyString();
            if ([v16 containsString:a3])
            {
              AttributeMap = (CGSVGAttributeMap *)CGSVGNodeGetAttributeMap();

              if (AttributeMap) {
                return AttributeMap;
              }
            }
            else
            {
            }
          }
        }
      }
    }
    return 0;
  }
  else
  {
    CGSVGDocumentGetRootNode();
    CGSVGNodeGetChildAtIndex();
    return (CGSVGAttributeMap *)CGSVGNodeGetAttributeMap();
  }
}

- (double)_interpolatedAlignmentRectInsetsWithWeight:(double)a3 glyphSize:(double)a4 fromUltralight:(double)a5 regular:(double)a6 black:(double)a7
{
  +[CUIVectorGlyphMutator scalarsForGlyphContinuousWeight:a1 glyphContinuousSize:a2];
  double v18 = v17;
  double v20 = v19;
  +[CUIVectorGlyphMutator transformForGlyphContinuousSize:a2];
  return (a9 + (a3 - a9) * v18 + (a13 - a9) * v20) * v21;
}

- (CGSize)_interpolatedCanvasSizeWithWeight:(double)a3 glyphSize:(double)a4 fromUltralight:(CGSize)a5 regular:(CGSize)a6 black:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  double v8 = a6.height;
  double v9 = a6.width;
  double v10 = a5.height;
  double v11 = a5.width;
  +[CUIVectorGlyphMutator scalarsForGlyphContinuousWeight:glyphContinuousSize:](CUIVectorGlyphMutator, "scalarsForGlyphContinuousWeight:glyphContinuousSize:", a3);
  double v14 = v13;
  double v16 = v15;
  +[CUIVectorGlyphMutator transformForGlyphContinuousSize:a4];
  double v18 = (v8 + (v10 - v8) * v14 + (height - v8) * v16) * v17;
  double v19 = (v9 + (v11 - v9) * v14 + (width - v9) * v16) * v17;
  result.double height = v18;
  result.double width = v19;
  return result;
}

- (id)_interpolatedPathWithWeight:(double)a3 glyphSize:(double)a4 fromUltralightSmall:(id)a5 regularSmall:(id)a6 blackSmall:(id)a7
{
  if (!a5 || !a6 || !a7) {
    return 0;
  }
  double v13 = [CUIVectorGlyphMutator alloc];
  [(CUINamedVectorGlyph *)self referencePointSize];
  double v14 = -[CUIVectorGlyphMutator initWithPointSize:regular:ultralight:black:](v13, "initWithPointSize:regular:ultralight:black:", a6, a5, a7);
  +[CUIVectorGlyphMutator transformForGlyphContinuousSize:a4];
  +[CUIVectorGlyphMutator scalarsForGlyphContinuousWeight:a3 glyphContinuousSize:a4];
  id v15 = -[CUIVectorGlyphMutator pathForScalars:andTransform:](v14, "pathForScalars:andTransform:");

  return v15;
}

- (double)_interpolatedCapHeightWithWeight:(double)a3 glyphSize:(double)a4 fromUltralight:(double)a5 regular:(double)a6 black:(double)a7
{
  +[CUIVectorGlyphMutator scalarsForGlyphContinuousWeight:a3 glyphContinuousSize:a4];
  return a6 + (a5 - a6) * v10 + (a7 - a6) * v11;
}

- (double)_interpolatedBaselineOffsetWithWeight:(double)a3 glyphSize:(double)a4 fromUltralight:(double)a5 regular:(double)a6 black:(double)a7
{
  +[CUIVectorGlyphMutator scalarsForGlyphContinuousWeight:glyphContinuousSize:](CUIVectorGlyphMutator, "scalarsForGlyphContinuousWeight:glyphContinuousSize:", a3);
  double v13 = v12;
  double v15 = v14;
  +[CUIVectorGlyphMutator transformForGlyphContinuousSize:a4];
  double v17 = v16;
  double v19 = v18;
  [(CUINamedVectorGlyph *)self referencePointSize];
  return (a6 + (a5 - a6) * v13 + (a7 - a6) * v15) * v17 - v19 * v20;
}

CGAffineTransform *__45__CUINamedVectorGlyph_alignmentRectUnrounded__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  [*(id *)(a1 + 32) referenceCanvasSize];
  float64_t v43 = v9;
  double v45 = v8;
  if (a3 && a4)
  {
    double v10 = *(void **)(a1 + 32);
    [v10 glyphContinuousWeight];
    double v42 = v11;
    [*(id *)(a1 + 32) glyphContinuousSize];
    double v41 = v12;
    [a3 vectorGlyphAlignmentRectInsets];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [a2 vectorGlyphAlignmentRectInsets];
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    [a4 vectorGlyphAlignmentRectInsets];
    objc_msgSend(v10, "_interpolatedAlignmentRectInsetsWithWeight:glyphSize:fromUltralight:regular:black:", v42, v41, v14, v16, v18, v20, v22, v24, v26, v28, v29, v30, v31, v32);
  }
  else
  {
    [a2 vectorGlyphAlignmentRectInsets];
  }
  double v35 = v33;
  double v36 = v34;
  CGSize result = (CGAffineTransform *)[*(id *)(a1 + 32) _requestedPointSizeRatio];
  v39.f64[0] = v45;
  v39.f64[1] = v43;
  if (v38 > 0.0)
  {
    double v35 = v35 * v38;
    double v36 = v36 * v38;
    memset(&v46, 0, sizeof(v46));
    float64x2_t v44 = v39;
    CGSize result = CGAffineTransformMakeScale(&v46, v38, v38);
    float64x2_t v39 = vmlaq_n_f64(vmulq_laneq_f64(*(float64x2_t *)&v46.c, v44, 1), *(float64x2_t *)&v46.a, v45);
  }
  uint64_t v40 = *(void *)(*(void *)(a1 + 40) + 8);
  *(double *)(v40 + 32) = v35;
  *(double *)(v40 + 40) = v36;
  *(float64x2_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = v39;
  return result;
}

id __39__CUINamedVectorGlyph_monochromeLayers__block_invoke(uint64_t a1)
{
  id result = [-[CUINamedVectorGlyph monochromeLayerGroup](*(void **)(a1 + 32)) sublayers];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

CGImageRef __68__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize___block_invoke(uint64_t a1)
{
  CGImageRef result = [(CUINamedVectorGlyph *)*(void **)(a1 + 32) _rasterizeImageUsingScaleFactor:(uint64_t)&__block_literal_global_65 forTargetSize:*(double *)(a1 + 48) renderingMode:*(double *)(a1 + 56) colorResolver:*(double *)(a1 + 64)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

CGImageRef __86__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withColorResolver___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __86__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withColorResolver___block_invoke_2;
  v4[3] = &unk_1E5A51238;
  v4[4] = *(void *)(a1 + 40);
  CGImageRef result = [(CUINamedVectorGlyph *)v2 _rasterizeImageUsingScaleFactor:(uint64_t)v4 forTargetSize:*(double *)(a1 + 56) renderingMode:*(double *)(a1 + 64) colorResolver:*(double *)(a1 + 72)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

CGImageRef __93__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColorResolver___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __93__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColorResolver___block_invoke_2;
  v4[3] = &unk_1E5A51238;
  v4[4] = *(void *)(a1 + 40);
  CGImageRef result = [(CUINamedVectorGlyph *)v2 _rasterizeImageUsingScaleFactor:(uint64_t)v4 forTargetSize:*(double *)(a1 + 56) renderingMode:*(double *)(a1 + 64) colorResolver:*(double *)(a1 + 72)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (CGSVGNode)_getOutlineNodeForDocument:(CGSVGDocument *)a3
{
  RootNode = (CGSVGNode *)CGSVGDocumentGetRootNode();
  [(CUINamedVectorGlyph *)self templateVersion];
  if (v5 < 5.0) {
    return RootNode;
  }
  return (CGSVGNode *)CGSVGNodeFindChildWithStringIdentifier();
}

id __39__CUINamedVectorGlyph_multicolorLayers__block_invoke(uint64_t a1)
{
  id result = [-[CUINamedVectorGlyph multicolorLayerGroup](*(void **)(a1 + 32)) sublayers];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __41__CUINamedVectorGlyph_hierarchicalLayers__block_invoke(uint64_t a1)
{
  id result = [-[CUINamedVectorGlyph hierarchicalLayerGroup](*(void **)(a1 + 32)) sublayers];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __58__CUINamedVectorGlyph__lookupCatalogImageForIdiom_locale___block_invoke(uint64_t a1, void *a2)
{
  [a2 setThemeDimension2:*(void *)(a1 + 40)];
  objc_msgSend(a2, "setThemeAppearance:", objc_msgSend(*(id *)(a1 + 32), "appearanceIdentifier"));
  [a2 setThemeGlyphSize:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(a1 + 56);
  return [a2 setThemeGlyphWeight:v4];
}

- (double)capHeight
{
  [(CUINamedVectorGlyph *)self capHeightUnrounded];
  double v4 = v3;
  [(CUINamedVectorGlyph *)self scale];
  return round(v4 * v5) / v5;
}

- (BOOL)isEqual:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CUINamedVectorGlyph;
  BOOL v5 = -[CUINamedLookup isEqual:](&v7, sel_isEqual_);
  if (v5) {
    LOBYTE(v5) = vabdd_f64(self->_pointSize, *((double *)a3 + 7)) < 2.22044605e-16
  }
              && vabdd_f64(self->_lookedupScaleFactor, *((double *)a3 + 8)) < 2.22044605e-16
              && self->_glyphSize == *((double *)a3 + 14)
              && self->_glyphWeight == *((double *)a3 + 15)
              && self->_layoutDirection == *((void *)a3 + 12)
              && self->_variableMinValue == *((double *)a3 + 24)
              && self->_variableMaxValue == *((double *)a3 + 25);
  return v5;
}

- (void)dealloc
{
  CGImageRelease(self->_cgImageRef);
  objc_storeWeak((id *)&self->_catalog, 0);
  v3.receiver = self;
  v3.super_class = (Class)CUINamedVectorGlyph;
  [(CUINamedLookup *)&v3 dealloc];
}

- (id)debugDescription
{
  switch([(CUINamedVectorGlyph *)self glyphWeight])
  {
    case 0:
      [(CUINamedVectorGlyph *)self glyphContinuousWeight];
      double v4 = +[NSString stringWithFormat:@"%f", v3];
      break;
    case 1:
      double v4 = @"Ultralight";
      break;
    case 2:
      double v4 = @"Thin";
      break;
    case 3:
      double v4 = @"Light";
      break;
    case 4:
      double v4 = @"Regular";
      break;
    case 5:
      double v4 = @"Medium";
      break;
    case 6:
      double v4 = @"Semibold";
      break;
    case 7:
      double v4 = @"Bold";
      break;
    case 8:
      double v4 = @"Heavy";
      break;
    case 9:
      double v4 = @"Black";
      break;
    default:
      double v4 = 0;
      break;
  }
  switch([(CUINamedVectorGlyph *)self glyphSize])
  {
    case 0:
      [(CUINamedVectorGlyph *)self glyphContinuousSize];
      float v6 = +[NSString stringWithFormat:@"%f", v5];
      break;
    case 1:
      float v6 = @"Small";
      break;
    case 2:
      float v6 = @"Medium";
      break;
    case 3:
      float v6 = @"Large";
      break;
    default:
      float v6 = 0;
      break;
  }
  [(CUINamedVectorGlyph *)self alignmentRect];
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v19);
  uint64_t v8 = objc_opt_class();
  double v9 = [(CUINamedLookup *)self name];
  uint64_t lookedupScaleFactor = (int)self->_lookedupScaleFactor;
  double pointSize = self->_pointSize;
  [(CUINamedVectorGlyph *)self baselineOffset];
  double v13 = +[NSString stringWithFormat:@"<%@: %p> '%@' @%dx, %.0f-points, %@ weight, %@ size, baseline offset = %.2f, alignment rect = %@", v8, self, v9, lookedupScaleFactor, *(void *)&pointSize, v4, v6, v12, DictionaryRepresentation];
  [(CUINamedVectorGlyph *)self variableMinValue];
  if (v14 != INFINITY)
  {
    [(CUINamedVectorGlyph *)self variableMinValue];
    double v13 = [(NSString *)v13 stringByAppendingFormat:@", variable min = %f", v15];
  }
  [(CUINamedVectorGlyph *)self variableMaxValue];
  if (v16 != INFINITY)
  {
    [(CUINamedVectorGlyph *)self variableMaxValue];
    double v13 = [(NSString *)v13 stringByAppendingFormat:@", variable max = %f", v17];
  }
  if (DictionaryRepresentation) {
    CFRelease(DictionaryRepresentation);
  }
  return v13;
}

- (CGRect)alignmentRect
{
  uint64_t v11 = 0;
  uint64_t v12 = (double *)&v11;
  uint64_t v13 = 0x4010000000;
  double v14 = &unk_1A13C9C2D;
  long long v15 = 0u;
  long long v16 = 0u;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __36__CUINamedVectorGlyph_alignmentRect__block_invoke;
  v10[3] = &unk_1E5A510B0;
  v10[4] = self;
  v10[5] = &v11;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v10);
  double v2 = v12[4];
  double v3 = v12[5];
  double v4 = v12[6];
  double v5 = v12[7];
  _Block_object_dispose(&v11, 8);
  double v6 = v2;
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (double)baselineOffset
{
  [(CUINamedVectorGlyph *)self baselineOffsetUnrounded];
  double v4 = v3;
  [(CUINamedVectorGlyph *)self scale];
  return round(v4 * v5) / v5;
}

- (int64_t)glyphWeight
{
  uint64_t v2 = 0;
  while (*(double *)&kCoreThemeContinuousGlyphWeights[v2] != self->_glyphWeight)
  {
    if (++v2 == 9) {
      return 0;
    }
  }
  return kCoreThemeDiscreteGlyphWeights[v2];
}

- (int64_t)glyphSize
{
  uint64_t v2 = 0;
  while (*(double *)&kCoreThemeContinuousGlyphSizes[v2] != self->_glyphSize)
  {
    if (++v2 == 3) {
      return 0;
    }
  }
  return kCoreThemeDiscreteGlyphSizes[v2];
}

- (void)_drawHierarchicalLayersInContext:(CGContext *)a3 scaleFactor:(double)a4 targetSize:(CGSize)a5 colorResolver:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  if (objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup](self), "sublayers"), "count"))
  {
    [(CUINamedVectorGlyph *)self variableMinValue];
    double v12 = v11;
    [(CUINamedVectorGlyph *)self variableMaxValue];
    double v14 = v13;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obuint64_t j = [-[CUINamedVectorGlyph hierarchicalLayerGroup](self) sublayers];
    id v15 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v37;
      BOOL v18 = v14 == INFINITY && v12 == INFINITY;
      do
      {
        for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v37 != v17) {
            objc_enumerationMutation(obj);
          }
          double v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          [v20 valueThreshold];
          char v22 = v21 == INFINITY || v18;
          if (v22)
          {
            uint64_t v23 = -1;
          }
          else
          {
            BOOL v24 = v12 == INFINITY;
            if (v21 >= v12) {
              BOOL v24 = 1;
            }
            BOOL v25 = v21 <= v14;
            if (v21 <= 0.0) {
              BOOL v25 = v21 < v14;
            }
            if (v14 == INFINITY) {
              BOOL v25 = 1;
            }
            uint64_t v23 = v24 & v25;
          }
          [(CUINamedVectorGlyph *)self variableMinValue];
          double v27 = v26;
          [(CUINamedVectorGlyph *)self variableMaxValue];
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = __93__CUINamedVectorGlyph__drawHierarchicalLayersInContext_scaleFactor_targetSize_colorResolver___block_invoke;
          v35[3] = &unk_1E5A51488;
          v35[5] = a6;
          v35[6] = v23;
          v35[4] = v20;
          objc_msgSend(v20, "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:hierarchicalColorResolver:", a3, v35, a4, width, height, v27, v28);
        }
        id v16 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v16);
    }
  }
  else
  {
    id v29 = [(id)objc_opt_class() _layerHierarchyStyleNames];
    uint64_t SRGBBlack = _CUIColorGetSRGBBlack();
    uint64_t v31 = (*((uint64_t (**)(id, id, uint64_t, void, void, uint64_t, void))a6 + 2))(a6, [v29 firstObject], SRGBBlack, 0, 0, -1, 0);
    uint64_t v32 = (*((uint64_t (**)(id, id, uint64_t, void, uint64_t, uint64_t, void))a6 + 2))(a6, [v29 objectAtIndex:2], SRGBBlack, 0, 2, -1, 0);
    [(CUINamedVectorGlyph *)self _drawInContext:v31 scaleFactor:v32 targetSize:a4 primaryColor:width tertiaryColor:height];
  }
}

uint64_t __55__CUINamedVectorGlyph_imageWithHierarchyColorResolver___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __93__CUINamedVectorGlyph__drawHierarchicalLayersInContext_scaleFactor_targetSize_colorResolver___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a1[5];
  uint64_t SRGBBlack = _CUIColorGetSRGBBlack();
  uint64_t v8 = a1[6];
  uint64_t v9 = a1[4];
  double v10 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16);
  return v10(v6, 0, SRGBBlack, a2, a3, v8, v9);
}

- (void)_drawPaletteLayersInContext:(CGContext *)a3 scaleFactor:(double)a4 targetSize:(CGSize)a5 colorResolver:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  if (objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup](self), "sublayers"), "count"))
  {
    [(CUINamedVectorGlyph *)self variableMinValue];
    double v12 = v11;
    [(CUINamedVectorGlyph *)self variableMaxValue];
    double v14 = v13;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obuint64_t j = [-[CUINamedVectorGlyph hierarchicalLayerGroup](self) sublayers];
    id v15 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v37;
      BOOL v18 = v14 == INFINITY && v12 == INFINITY;
      do
      {
        for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v37 != v17) {
            objc_enumerationMutation(obj);
          }
          double v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          [v20 valueThreshold];
          char v22 = v21 == INFINITY || v18;
          if (v22)
          {
            uint64_t v23 = -1;
          }
          else
          {
            BOOL v24 = v12 == INFINITY;
            if (v21 >= v12) {
              BOOL v24 = 1;
            }
            BOOL v25 = v21 <= v14;
            if (v21 <= 0.0) {
              BOOL v25 = v21 < v14;
            }
            if (v14 == INFINITY) {
              BOOL v25 = 1;
            }
            uint64_t v23 = v24 & v25;
          }
          [(CUINamedVectorGlyph *)self variableMinValue];
          double v27 = v26;
          [(CUINamedVectorGlyph *)self variableMaxValue];
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = __88__CUINamedVectorGlyph__drawPaletteLayersInContext_scaleFactor_targetSize_colorResolver___block_invoke;
          v35[3] = &unk_1E5A51488;
          v35[5] = a6;
          v35[6] = v23;
          v35[4] = v20;
          objc_msgSend(v20, "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:paletteColorResolver:", a3, v35, a4, width, height, v27, v28);
        }
        id v16 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v16);
    }
  }
  else
  {
    id v29 = [(id)objc_opt_class() _layerHierarchyStyleNames];
    uint64_t SRGBBlack = _CUIColorGetSRGBBlack();
    uint64_t v31 = (*((uint64_t (**)(id, id, uint64_t, void, void, uint64_t, void))a6 + 2))(a6, [v29 firstObject], SRGBBlack, 0, 0, -1, 0);
    uint64_t v32 = (*((uint64_t (**)(id, id, uint64_t, void, uint64_t, uint64_t, void))a6 + 2))(a6, [v29 objectAtIndex:2], SRGBBlack, 0, 2, -1, 0);
    [(CUINamedVectorGlyph *)self _drawInContext:v31 scaleFactor:v32 targetSize:a4 primaryColor:width tertiaryColor:height];
  }
}

uint64_t __88__CUINamedVectorGlyph__drawPaletteLayersInContext_scaleFactor_targetSize_colorResolver___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a1[5];
  uint64_t SRGBBlack = _CUIColorGetSRGBBlack();
  uint64_t v8 = a1[6];
  uint64_t v9 = a1[4];
  double v10 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16);
  return v10(v6, 0, SRGBBlack, a2, a3, v8, v9);
}

uint64_t __93__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColorResolver___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __86__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColors___block_invoke_3(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = a1 + 32;
  double v3 = *(void **)(a1 + 32);
  if (*(void *)(v4 + 8) <= a3) {
    return [v3 lastObject];
  }
  else {
    return objc_msgSend(v3, "objectAtIndex:");
  }
}

id __46__CUINamedVectorGlyph_numberOfHierarchyLayers__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v3 + 104) & 4) != 0) {
    id v4 = [-[CUINamedVectorGlyph hierarchicalLayerGroup]((void *)v3) sublayers];
  }
  else {
    id v4 = [(id)v3 _layerNamesForRenderingMode:3 inRendition:a2];
  }
  id result = [v4 count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)hierarchicalLayerGroup
{
  if (result)
  {
    v1 = result;
    id result = (void *)result[20];
    if (!result)
    {
      objc_msgSend(objc_msgSend(v1, "_regularRendition"), "svgDocument");
      [v1 templateVersion];
      float v3 = v2;
      CGSVGDocumentGetRootNode();
      if (v3 >= 5.0 && (uint64_t ChildWithStringIdentifier = CGSVGNodeFindChildWithStringIdentifier()) != 0)
      {
        uint64_t v5 = ChildWithStringIdentifier;
        id v6 = [v1 _createShapeGroupSubpaths];
        v1[20] = +[CUIVectorGlyphLayer createLayerGroupWithLayerTree:modePrefix:shapes:delegate:](CUIVectorGlyphHierarchicalLayer, "createLayerGroupWithLayerTree:modePrefix:shapes:delegate:", v5, [v1 _stylePrefixForRenderingMode:3], v6, v1);

        return (void *)v1[20];
      }
      else
      {
        id result = +[CUIVectorGlyphLayer createLayerGroupWithLayerNames:delegate:](CUIVectorGlyphHierarchicalLayer, "createLayerGroupWithLayerNames:delegate:", objc_msgSend(v1, "_layerNamesForRenderingMode:inRendition:", 3, objc_msgSend(v1, "_regularRendition")), v1);
        v1[20] = result;
      }
    }
  }
  return result;
}

- (void)_drawMulticolorLayersInContext:(CGContext *)a3 scaleFactor:(double)a4 targetSize:(CGSize)a5 colorResolver:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  if (objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph multicolorLayerGroup](self), "sublayers"), "count"))
  {
    [(CUINamedVectorGlyph *)self variableMinValue];
    double v12 = v11;
    [(CUINamedVectorGlyph *)self variableMaxValue];
    double v14 = v13;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    obuint64_t j = [-[CUINamedVectorGlyph multicolorLayerGroup](self) sublayers];
    id v15 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v34;
      BOOL v18 = v14 == INFINITY && v12 == INFINITY;
      do
      {
        for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(obj);
          }
          double v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          [v20 valueThreshold];
          char v22 = v21 == INFINITY || v18;
          if (v22)
          {
            uint64_t v23 = -1;
          }
          else
          {
            BOOL v24 = v12 == INFINITY;
            if (v21 >= v12) {
              BOOL v24 = 1;
            }
            BOOL v25 = v21 <= v14;
            if (v21 <= 0.0) {
              BOOL v25 = v21 < v14;
            }
            if (v14 == INFINITY) {
              BOOL v25 = 1;
            }
            uint64_t v23 = v24 & v25;
          }
          [(CUINamedVectorGlyph *)self variableMinValue];
          double v27 = v26;
          [(CUINamedVectorGlyph *)self variableMaxValue];
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = __91__CUINamedVectorGlyph__drawMulticolorLayersInContext_scaleFactor_targetSize_colorResolver___block_invoke;
          v32[3] = &unk_1E5A51460;
          v32[5] = a6;
          v32[6] = v23;
          v32[4] = v20;
          objc_msgSend(v20, "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:colorResolver:", a3, v32, a4, width, height, v27, v28);
        }
        id v16 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v16);
    }
  }
  else
  {
    uint64_t SRGBBlack = _CUIColorGetSRGBBlack();
    [(CUINamedVectorGlyph *)self _drawInContext:SRGBBlack scaleFactor:0 targetSize:a4 primaryColor:width tertiaryColor:height];
  }
}

uint64_t __91__CUINamedVectorGlyph__drawMulticolorLayersInContext_scaleFactor_targetSize_colorResolver___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void, void, void, void))(a1[5] + 16))(a1[5], a2, a3, 0, 0, a1[6], a1[4]);
}

- (void)multicolorLayerGroup
{
  if (result)
  {
    v1 = result;
    id result = (void *)result[19];
    if (!result)
    {
      objc_msgSend(objc_msgSend(v1, "_regularRendition"), "svgDocument");
      [v1 templateVersion];
      float v3 = v2;
      CGSVGDocumentGetRootNode();
      if (v3 >= 5.0 && (uint64_t ChildWithStringIdentifier = CGSVGNodeFindChildWithStringIdentifier()) != 0)
      {
        uint64_t v5 = ChildWithStringIdentifier;
        id v6 = [v1 _createShapeGroupSubpaths];
        v1[19] = +[CUIVectorGlyphLayer createLayerGroupWithLayerTree:modePrefix:shapes:delegate:](CUIVectorGlyphMulticolorLayer, "createLayerGroupWithLayerTree:modePrefix:shapes:delegate:", v5, [v1 _stylePrefixForRenderingMode:2], v6, v1);

        return (void *)v1[19];
      }
      else
      {
        id result = +[CUIVectorGlyphLayer createLayerGroupWithLayerNames:delegate:](CUIVectorGlyphMulticolorLayer, "createLayerGroupWithLayerNames:delegate:", objc_msgSend(v1, "_layerNamesForRenderingMode:inRendition:", 2, objc_msgSend(v1, "_regularRendition")), v1);
        v1[19] = result;
      }
    }
  }
  return result;
}

uint64_t __86__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withColorResolver___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__CUINamedVectorGlyph__layerNamesForRenderingMode_inRendition___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3)
  {
    int Type = CGSVGNodeGetType();
    if (Type == 2 || Type == 1 && *(unsigned char *)(a1 + 48))
    {
      if (CGSVGNodeFindAttribute())
      {
        uint64_t v5 = (void *)CGSVGAttributeCopyString();
        id v6 = [v5 componentsSeparatedByString:@" "];
        long long v12 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v13;
          do
          {
            for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v13 != v9) {
                objc_enumerationMutation(v6);
              }
              double v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
              if ([v11 hasPrefix:*(void *)(a1 + 32)]) {
                [*(id *)(a1 + 40) addObject:v11];
              }
            }
            id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
          }
          while (v8);
        }
      }
    }
  }
}

- (void)_drawInContext:(uint64_t)a3 scaleFactor:(uint64_t)a4 targetSize:(double)a5 primaryColor:(double)a6 tertiaryColor:(double)a7
{
  if (result)
  {
    long long v13 = result;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v14 = objc_msgSend(-[CUINamedVectorGlyph monochromeLayerGroup](result), "sublayers", 0);
    id result = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (result)
    {
      long long v15 = result;
      uint64_t v16 = *(void *)v23;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v14);
          }
          BOOL v18 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v17);
          [v13 variableMinValue];
          double v20 = v19;
          [v13 variableMaxValue];
          objc_msgSend(v18, "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:onFillColor:offFillColor:", a2, a3, a4, a5, a6, a7, v20, v21);
          uint64_t v17 = (void *)((char *)v17 + 1);
        }
        while (v15 != v17);
        id result = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
        long long v15 = result;
      }
      while (result);
    }
  }
  return result;
}

- (double)variableMaxValue
{
  return self->_variableMaxValue;
}

- (double)variableMinValue
{
  return self->_variableMinValue;
}

- (void)monochromeLayerGroup
{
  if (result)
  {
    v1 = result;
    if (!result[18])
    {
      objc_msgSend(objc_msgSend(result, "_regularRendition"), "svgDocument");
      [v1 templateVersion];
      float v3 = v2;
      CGSVGDocumentGetRootNode();
      if (v3 >= 5.0 && (uint64_t ChildWithStringIdentifier = CGSVGNodeFindChildWithStringIdentifier()) != 0)
      {
        uint64_t v5 = ChildWithStringIdentifier;
        id v6 = [v1 _createShapeGroupSubpaths];
        v1[18] = +[CUIVectorGlyphLayer createLayerGroupWithLayerTree:modePrefix:shapes:delegate:](CUIVectorGlyphLayer, "createLayerGroupWithLayerTree:modePrefix:shapes:delegate:", v5, [v1 _stylePrefixForRenderingMode:1], v6, v1);
      }
      else
      {
        id v7 = objc_msgSend(v1, "monochromeLayerNamesInRendition:", objc_msgSend(v1, "_regularRendition"));
        if (v3 >= 4.0 && (id v8 = v7, [v7 count]))
        {
          v1[18] = +[CUIVectorGlyphLayer createLayerGroupWithLayerNames:v8 delegate:v1];
        }
        else
        {
          id v9 = [v1 pathForLayerNamed:0];
          [v1 strokeWidthForLayerNamed:0];
          id v11 = [[CUIVectorGlyphLayer alloc] _initWithName:@"monochrome-0" index:0 shape:v9 strokeWidth:0 attributes:0 style:v1 delegate:v10];
          id v12 = v11;
          v1[18] = [[CUIVectorGlyphLayer alloc] _initWithName:@"root" index:0 sublayers:+[NSArray arrayWithObjects:&v12 count:1] attributes:0 style:0 delegate:v1];
        }
      }
    }
    return (void *)v1[18];
  }
  return result;
}

- (id)_layerNamesForRenderingMode:(int)a3 inRendition:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init((Class)NSMutableOrderedSet);
  [(CUINamedVectorGlyph *)self templateVersion];
  BOOL v9 = v8 >= 5.0;
  [a4 svgDocument];
  CGSVGDocumentGetRootNode();
  v11[6] = _NSConcreteStackBlock;
  v11[7] = 3221225472;
  v11[8] = __63__CUINamedVectorGlyph__layerNamesForRenderingMode_inRendition___block_invoke;
  v11[9] = &unk_1E5A51520;
  BOOL v14 = v9;
  id v12 = [(CUINamedVectorGlyph *)self _stylePrefixForRenderingMode:v5];
  id v13 = v7;
  CGSVGNodeEnumerate();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __63__CUINamedVectorGlyph__layerNamesForRenderingMode_inRendition___block_invoke_2;
  v11[3] = &unk_1E5A51548;
  v11[4] = v12;
  v11[5] = [v7 count];
  [v7 sortUsingComparator:v11];
  return v7;
}

- (id)_stylePrefixForRenderingMode:(int)a3
{
  if ((a3 - 1) > 3) {
    return &stru_1EF488038;
  }
  else {
    return off_1E5A51568[a3 - 1];
  }
}

- (double)strokeWidthForLayerNamed:(id)a3
{
  [(CUINamedVectorGlyph *)self templateVersion];
  if (v5 < 6.0) {
    return 0.0;
  }
  if ((*((unsigned char *)self + 104) & 4) != 0 && self->_ultralightInterpolationSource && self->_blackInterpolationSource)
  {
    [(CUINamedVectorGlyph *)self strokeWidthForLayerNamed:a3 inRendition:[(CUINamedVectorGlyph *)self _ultralightRendition]];
    double v8 = v7;
    [(CUINamedVectorGlyph *)self strokeWidthForLayerNamed:a3 inRendition:[(CUINamedVectorGlyph *)self _regularRendition]];
    double v10 = v9;
    [(CUINamedVectorGlyph *)self strokeWidthForLayerNamed:a3 inRendition:[(CUINamedVectorGlyph *)self _blackRendition]];
    double v12 = v11;
    [(CUINamedVectorGlyph *)self glyphContinuousWeight];
    double v14 = v13;
    [(CUINamedVectorGlyph *)self glyphContinuousSize];
    [(CUINamedVectorGlyph *)self _interpolatedStrokeWidthWithWeight:v14 glyphSize:v15 fromUltralight:v8 regular:v10 black:v12];
  }
  else
  {
    id v16 = [(CUINamedVectorGlyph *)self _regularRendition];
    [(CUINamedVectorGlyph *)self strokeWidthForLayerNamed:a3 inRendition:v16];
  }
  return result;
}

- (double)strokeWidthForLayerNamed:(id)a3 inRendition:(id)a4
{
  if ([(CUINamedVectorGlyph *)self attributesForLayerNamed:a3 inRendition:a4]
    && CGSVGAttributeMapGetAttribute())
  {
    CGSVGAttributeGetFloat();
  }
  return 0.0;
}

- (CGSVGAttributeMap)styleForLayerName:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "svgDocument");
  [@"." stringByAppendingString:a3];
  return (CGSVGAttributeMap *)CGSVGDocumentGetNamedStyle();
}

- (CGSVGAttributeMap)attributesForLayerNamed:(id)a3
{
  id v5 = [(CUINamedVectorGlyph *)self _regularRendition];
  return [(CUINamedVectorGlyph *)self attributesForLayerNamed:a3 inRendition:v5];
}

- (double)_interpolatedStrokeWidthWithWeight:(double)a3 glyphSize:(double)a4 fromUltralight:(double)a5 regular:(double)a6 black:(double)a7
{
  +[CUIVectorGlyphMutator transformForGlyphContinuousSize:a4];
  double v13 = v12;
  +[CUIVectorGlyphMutator scalarsForGlyphContinuousWeight:a3 glyphContinuousSize:a4];
  return v13 * (a6 + (a5 - a6) * v14 + (a7 - a6) * v15);
}

- (id)monochromeLayerNamesInRendition:(id)a3
{
  return [(CUINamedVectorGlyph *)self _layerNamesForRenderingMode:1 inRendition:a3];
}

- (id)_symbolDefaults
{
  symbolDefaults = (NSMutableDictionary *)self->_symbolDefaults;
  if (!symbolDefaults)
  {
    objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "svgDocument");
    CGSVGDocumentGetNamedStyle();
    symbolDefaults = +[NSMutableDictionary dictionaryWithCapacity:CGSVGAttributeMapGetCount()];
    CGSVGAttributeMapEnumerate();
    self->_symbolDefaults = (NSDictionary *)symbolDefaults;
  }
  return symbolDefaults;
}

- (CGRect)contentBounds
{
  uint64_t v11 = 0;
  double v12 = (double *)&v11;
  uint64_t v13 = 0x4010000000;
  double v14 = &unk_1A13C9C2D;
  long long v15 = 0u;
  long long v16 = 0u;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __36__CUINamedVectorGlyph_contentBounds__block_invoke;
  v10[3] = &unk_1E5A510B0;
  v10[4] = self;
  v10[5] = &v11;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v10);
  double v2 = v12[4];
  double v3 = v12[5];
  double v4 = v12[6];
  double v5 = v12[7];
  _Block_object_dispose(&v11, 8);
  double v6 = v2;
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (BOOL)containsNamedColorStyles
{
  if (self->_containsNamedColorStyles < 0)
  {
    id v3 = [(CUINamedVectorGlyph *)self _regularRendition];
    [v3 vectorGlyphTemplateVersion];
    if (v4 >= 2.1)
    {
      unsigned int v5 = [v3 containsMulticolorLayers];
      self->_containsNamedColorStyles = v5;
      if ((v5 & 0x80000000) != 0)
      {
        v7[0] = _NSConcreteStackBlock;
        v7[1] = 3221225472;
        v7[2] = __47__CUINamedVectorGlyph_containsNamedColorStyles__block_invoke;
        v7[3] = &unk_1E5A512B0;
        v7[4] = self;
        -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v7);
      }
    }
    else
    {
      self->_containsNamedColorStyles = 0;
    }
  }
  return self->_containsNamedColorStyles == 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int v5 = [(CUINamedLookup *)+[CUINamedVectorGlyph allocWithZone:](CUINamedVectorGlyph, "allocWithZone:") initWithName:[(CUINamedLookup *)self name] usingRenditionKey:[(CUINamedLookup *)self renditionKey] fromTheme:[(CUINamedLookup *)self storageRef]];
  if (v5)
  {
    if (self->_ultralightInterpolationSource) {
      v5->_ultralightInterpolationSource = [+[CUINamedLookup allocWithZone:a3] initWithName:[(CUINamedLookup *)self->_ultralightInterpolationSource name] usingRenditionKey:[(CUINamedLookup *)self->_ultralightInterpolationSource renditionKey] fromTheme:[(CUINamedLookup *)self->_ultralightInterpolationSource storageRef]];
    }
    if (self->_blackInterpolationSource) {
      v5->_blackInterpolationSource = [+[CUINamedLookup allocWithZone:a3] initWithName:[(CUINamedLookup *)self->_blackInterpolationSource name] usingRenditionKey:[(CUINamedLookup *)self->_blackInterpolationSource renditionKey] fromTheme:[(CUINamedLookup *)self->_blackInterpolationSource storageRef]];
    }
    [(CUINamedVectorGlyph *)self pointSize];
    -[CUINamedVectorGlyph _setPointSize:](v5, "_setPointSize:");
    [(CUINamedVectorGlyph *)self scale];
    -[CUINamedVectorGlyph _setScale:](v5, "_setScale:");
    [(CUINamedVectorGlyph *)v5 _setCatalog:[(CUINamedVectorGlyph *)self _catalog]];
    [(CUINamedVectorGlyph *)self fontMatchingScaleFactor];
    -[CUINamedVectorGlyph setFontMatchingScaleFactor:](v5, "setFontMatchingScaleFactor:");
    [(CUINamedVectorGlyph *)self glyphContinuousWeight];
    -[CUINamedVectorGlyph _setGlyphWeight:](v5, "_setGlyphWeight:");
    [(CUINamedVectorGlyph *)self glyphContinuousSize];
    -[CUINamedVectorGlyph _setGlyphSize:](v5, "_setGlyphSize:");
    [(CUINamedVectorGlyph *)v5 _setFlippable:[(CUINamedVectorGlyph *)self isFlippable]];
    [(CUINamedVectorGlyph *)v5 _setLayoutDirection:[(CUINamedVectorGlyph *)self layoutDirection]];
    [(CUINamedVectorGlyph *)v5 _setCanUsePathConcatenation:[(CUINamedVectorGlyph *)self _canUsePathConcatenation]];
    [(CUINamedVectorGlyph *)v5 _setContainsNamedColorStyles:self->_containsNamedColorStyles];
    cgImageRef = self->_cgImageRef;
    if (cgImageRef)
    {
      v5->_cgImageRef = CGImageRetain(cgImageRef);
      v5->_uint64_t lookedupScaleFactor = self->_lookedupScaleFactor;
    }
    [(CUINamedVectorGlyph *)self variableMinValue];
    -[CUINamedVectorGlyph setVariableMinValue:](v5, "setVariableMinValue:");
    [(CUINamedVectorGlyph *)self variableMaxValue];
    -[CUINamedVectorGlyph setVariableMaxValue:](v5, "setVariableMaxValue:");
  }
  return v5;
}

- (BOOL)isFlippable
{
  return (*((unsigned __int8 *)self + 104) >> 1) & 1;
}

- (void)setVariableMinValue:(double)a3
{
  self->_double variableMinValue = a3;
}

- (void)setVariableMaxValue:(double)a3
{
  self->_double variableMaxValue = a3;
}

- (void)setFontMatchingScaleFactor:(double)a3
{
  if (self->_fontMatchingScaleFactor != a3)
  {
    self->_fontMatchingScaleFactor = a3;
    CGImageRelease(self->_cgImageRef);
    self->_cgImageRef = 0;
  }
}

- (void)_setScale:(double)a3
{
  self->_uint64_t lookedupScaleFactor = a3;
}

- (void)_setPointSize:(double)a3
{
  self->_double pointSize = a3;
}

- (void)_setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (void)_setGlyphWeight:(double)a3
{
  self->_glyphWeight = a3;
}

- (void)_setGlyphSize:(double)a3
{
  self->_glyphSize = a3;
}

- (void)_setFlippable:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 104) = *((unsigned char *)self + 104) & 0xFD | v3;
}

- (void)_setContainsNamedColorStyles:(signed __int16)a3
{
  self->_containsNamedColorStyles = a3;
}

- (void)_setCatalog:(id)a3
{
}

- (void)_setCanUsePathConcatenation:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 104) = *((unsigned char *)self + 104) & 0xFB | v3;
}

- (id)_catalog
{
  return objc_loadWeak((id *)&self->_catalog);
}

- (BOOL)_canUsePathConcatenation
{
  return (*((unsigned __int8 *)self + 104) >> 2) & 1;
}

uint64_t __63__CUINamedVectorGlyph__layerNamesForRenderingMode_inRendition___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  if (*(void *)(a1 + 40) <= 9uLL
    || ((id v6 = [a2 rangeOfString:*(void *)(a1 + 32)],
         uint64_t v8 = v7,
         id v9 = [a3 rangeOfString:*(void *)(a1 + 32)],
         v6 != (id)0x7FFFFFFFFFFFFFFFLL)
      ? (BOOL v11 = v9 == (id)0x7FFFFFFFFFFFFFFFLL)
      : (BOOL v11 = 1),
        v11))
  {
    return (uint64_t)[a2 compare:a3];
  }
  else
  {
    id v13 = v9;
    uint64_t v14 = v10;
    id v15 = objc_msgSend(a2, "stringByReplacingCharactersInRange:withString:", v6, v8, &stru_1EF488038);
    id v16 = objc_msgSend(a3, "stringByReplacingCharactersInRange:withString:", v13, v14, &stru_1EF488038);
    id v17 = [v15 integerValue];
    id v18 = [v16 integerValue];
    if (v17 < v18) {
      return -1;
    }
    else {
      return v17 > v18;
    }
  }
}

- (CGImage)imageWithPaletteColors:(id)a3
{
  uint64_t v18 = 0;
  double v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  if (a3)
  {
    id v5 = [a3 count];
    if (v5 == (id)1)
    {
      [(CUINamedVectorGlyph *)self referenceCanvasSize];
      uint64_t v7 = v6;
      uint64_t v9 = v8;
      [(CUINamedVectorGlyph *)self scale];
      double v11 = v10;
      [(CUINamedVectorGlyph *)self _requestedPointSizeRatio];
      v17[1] = 3221225472;
      v17[0] = _NSConcreteStackBlock;
      v17[2] = __46__CUINamedVectorGlyph_imageWithPaletteColors___block_invoke;
      v17[3] = &unk_1E5A51398;
      v17[5] = a3;
      v17[6] = &v18;
      *(double *)&v17[7] = v11 * v12;
      v17[8] = v7;
      v17[9] = v9;
      v17[4] = self;
      -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v17);
    }
    else
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = __46__CUINamedVectorGlyph_imageWithPaletteColors___block_invoke_3;
      v16[3] = &unk_1E5A513C0;
      v16[4] = a3;
      v16[5] = v5;
      id v13 = [(CUINamedVectorGlyph *)self imageWithPaletteColorResolver:v16];
      v19[3] = (uint64_t)v13;
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CUINamedVectorGlyph.m", 2032, @"Invalid parameter not satisfying: %@", @"colors" object file lineNumber description];
  }
  uint64_t v14 = (CGImage *)v19[3];
  _Block_object_dispose(&v18, 8);
  return v14;
}

- (CGImage)imageWithPaletteColorResolver:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __53__CUINamedVectorGlyph_imageWithPaletteColorResolver___block_invoke;
  v4[3] = &unk_1E5A51238;
  v4[4] = a3;
  return (CGImage *)-[CUINamedVectorGlyph _imageForRenderingMode:withColorResolver:]((id *)&self->super.super.isa, 4, (uint64_t)v4);
}

- (CGImage)imageWithHierarchyColorResolver:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __55__CUINamedVectorGlyph_imageWithHierarchyColorResolver___block_invoke;
  v4[3] = &unk_1E5A51238;
  v4[4] = a3;
  return (CGImage *)-[CUINamedVectorGlyph _imageForRenderingMode:withColorResolver:]((id *)&self->super.super.isa, 3, (uint64_t)v4);
}

- (CGImage)imageWithColorResolver:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __46__CUINamedVectorGlyph_imageWithColorResolver___block_invoke;
  v4[3] = &unk_1E5A51238;
  v4[4] = a3;
  return (CGImage *)-[CUINamedVectorGlyph _imageForRenderingMode:withColorResolver:]((id *)&self->super.super.isa, 2, (uint64_t)v4);
}

- (CGImage)image
{
  cgImageRef = self->_cgImageRef;
  if (cgImageRef && self->_variableMinValue == INFINITY && self->_variableMaxValue == INFINITY) {
    goto LABEL_11;
  }
  float v4 = (CGImage *)-[CUINamedVectorGlyph _imageForRenderingMode:withColorResolver:]((id *)&self->super.super.isa, 1, (uint64_t)&__block_literal_global_0);
  cgImageRef = v4;
  if (self->_variableMinValue == INFINITY && self->_variableMaxValue == INFINITY)
  {
    self->_cgImageRef = v4;
    if (!v4) {
      return cgImageRef;
    }
  }
  else
  {
    CFAutorelease(v4);
    if (!cgImageRef) {
      return cgImageRef;
    }
  }
  if (cgImageRef == self->_cgImageRef)
  {
    cgImageRef = self->_cgImageRef;
LABEL_11:
    CGImageRetain(cgImageRef);
    CFAutorelease(cgImageRef);
  }
  return cgImageRef;
}

- (uint64_t)_imageForRenderingMode:(uint64_t)a3 withColorResolver:
{
  if (!a1) {
    return 0;
  }
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __64__CUINamedVectorGlyph__imageForRenderingMode_withColorResolver___block_invoke;
  v5[3] = &unk_1E5A51438;
  int v6 = a2;
  v5[4] = a1;
  v5[5] = a3;
  v5[6] = &v7;
  -[CUINamedVectorGlyph _performWithLockedRenditions:](a1, (uint64_t)v5);
  uint64_t v3 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v3;
}

id __35__CUINamedVectorGlyph_metricCenter__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id result = [*(id *)(a1 + 32) _getMetricCenterInRendition:a2];
  double v9 = v8;
  double v11 = v10;
  if (a3 && a4)
  {
    [*(id *)(a1 + 32) _getMetricCenterInRendition:a3];
    double v13 = v12;
    double v15 = v14;
    [*(id *)(a1 + 32) _getMetricCenterInRendition:a4];
    double v17 = v16;
    double v19 = v18;
    uint64_t v20 = *(void **)(a1 + 32);
    [v20 glyphContinuousWeight];
    double v22 = v21;
    [*(id *)(a1 + 32) glyphContinuousSize];
    id result = objc_msgSend(v20, "_interpolatedAnchorWithWeight:glyphSize:fromUltralight:regular:black:", v22, v23, v13, v15, v9, v11, v17, v19);
    double v9 = v24;
    double v11 = v25;
  }
  uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 8);
  *(double *)(v26 + 32) = v9;
  *(double *)(v26 + 40) = v11;
  return result;
}

id __37__CUINamedVectorGlyph_rotationAnchor__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = [*(id *)(a1 + 32) _getAnchor:@"ra" inRendition:a2];
  if (v8) {
    id result = [v8 pointValue];
  }
  else {
    id result = [*(id *)(a1 + 32) _getMetricCenterInRendition:a2];
  }
  double v12 = v10;
  double v13 = v11;
  if (a3 && a4)
  {
    id v14 = [*(id *)(a1 + 32) _getAnchor:@"ra" inRendition:a3];
    id v15 = [*(id *)(a1 + 32) _getAnchor:@"ra" inRendition:a4];
    if (v14) {
      [v14 pointValue];
    }
    else {
      [*(id *)(a1 + 32) _getMetricCenterInRendition:a3];
    }
    double v18 = v16;
    double v19 = v17;
    if (v15) {
      [v15 pointValue];
    }
    else {
      [*(id *)(a1 + 32) _getMetricCenterInRendition:a4];
    }
    double v22 = v20;
    double v23 = v21;
    double v24 = *(void **)(a1 + 32);
    [v24 glyphContinuousWeight];
    double v26 = v25;
    [*(id *)(a1 + 32) glyphContinuousSize];
    id result = objc_msgSend(v24, "_interpolatedAnchorWithWeight:glyphSize:fromUltralight:regular:black:", v26, v27, v18, v19, v12, v13, v22, v23);
    double v12 = v28;
    double v13 = v29;
  }
  uint64_t v30 = *(void *)(*(void *)(a1 + 40) + 8);
  *(double *)(v30 + 32) = v12;
  *(double *)(v30 + 40) = v13;
  return result;
}

- (CGPoint)_getMetricCenterInRendition:(id)a3
{
  [a3 vectorGlyphAlignmentRectInsets];
  double v5 = v4;
  double v7 = v6;
  [a3 canvasSize];
  double v9 = v8;
  [a3 vectorGlyphCapLine];
  double v10 = (v7 + v5 + v9) * 0.5 - v5;
  double v12 = v11 * 0.5;
  [a3 vectorGlyphBaseline];
  double v14 = v12 + v13;
  double v15 = v10;
  result.y = v14;
  result.x = v15;
  return result;
}

- (id)_getAnchor:(id)a3 inRendition:(id)a4
{
  [a4 svgDocument];
  CGSVGDocumentGetRootNode();
  id result = (id)CGSVGNodeFindChildWithStringIdentifier();
  if (result)
  {
    CGPoint v6 = CGPointZero;
    CGSVGShapeNodeGetCircleGeometry();
    [a4 canvasSize];
    return +[NSValue valueWithPoint:v6.x];
  }
  return result;
}

- (CGPoint)_interpolatedAnchorWithWeight:(double)a3 glyphSize:(double)a4 fromUltralight:(CGPoint)a5 regular:(CGPoint)a6 black:(CGPoint)a7
{
  double y = a7.y;
  double x = a7.x;
  double v8 = a6.y;
  double v9 = a6.x;
  double v10 = a5.y;
  double v11 = a5.x;
  +[CUIVectorGlyphMutator transformForGlyphContinuousSize:a4];
  double v15 = v14;
  +[CUIVectorGlyphMutator scalarsForGlyphContinuousWeight:a3 glyphContinuousSize:a4];
  double v18 = v9 + (x - v9) * v16 + (v11 - v9) * v17;
  double v19 = v8 + (y - v8) * v16 + (v10 - v8) * v17;
  double v20 = v15 * v18;
  double v21 = v15 * v19;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (CGPoint)metricCenter
{
  [(CUINamedVectorGlyph *)self _requestedPointSizeRatio];
  double v4 = v3;
  metricCenter = self->_metricCenter;
  if (metricCenter)
  {
    [(NSValue *)metricCenter pointValue];
    double v7 = v4 * v6;
    double v9 = v4 * v8;
  }
  else
  {
    uint64_t v14 = 0;
    double v15 = (double *)&v14;
    uint64_t v16 = 0x3010000000;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    double v17 = &unk_1A13C9C2D;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __35__CUINamedVectorGlyph_metricCenter__block_invoke;
    long long v13[3] = &unk_1E5A510B0;
    v13[4] = self;
    v13[5] = &v14;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v13);
    self->_metricCenter = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", v15[4], v15[5]);
    double v10 = v15;
    double v7 = v4 * v15[4];
    double v9 = v4 * v15[5];
    v15[4] = v7;
    v10[5] = v9;
    _Block_object_dispose(&v14, 8);
  }
  double v11 = v7;
  double v12 = v9;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (CGPoint)rotationAnchor
{
  [(CUINamedVectorGlyph *)self _requestedPointSizeRatio];
  double v4 = v3;
  rotationAnchor = self->_rotationAnchor;
  if (rotationAnchor)
  {
    [(NSValue *)rotationAnchor pointValue];
    double v7 = v4 * v6;
    double v9 = v4 * v8;
  }
  else
  {
    uint64_t v14 = 0;
    double v15 = (double *)&v14;
    uint64_t v16 = 0x3010000000;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    double v17 = &unk_1A13C9C2D;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __37__CUINamedVectorGlyph_rotationAnchor__block_invoke;
    long long v13[3] = &unk_1E5A510B0;
    v13[4] = self;
    v13[5] = &v14;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v13);
    self->_rotationAnchor = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", v15[4], v15[5]);
    double v10 = v15;
    double v7 = v4 * v15[4];
    double v9 = v4 * v15[5];
    v15[4] = v7;
    v10[5] = v9;
    _Block_object_dispose(&v14, 8);
  }
  double v11 = v7;
  double v12 = v9;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (void).cxx_destruct
{
}

- (CGRect)alignmentRectUnrounded
{
  uint64_t v11 = 0;
  double v12 = (double *)&v11;
  uint64_t v13 = 0x4010000000;
  uint64_t v14 = &unk_1A13C9C2D;
  long long v15 = 0u;
  long long v16 = 0u;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __45__CUINamedVectorGlyph_alignmentRectUnrounded__block_invoke;
  v10[3] = &unk_1E5A510B0;
  v10[4] = self;
  v10[5] = &v11;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v10);
  double v2 = v12[4];
  double v3 = v12[5];
  double v4 = v12[6];
  double v5 = v12[7];
  _Block_object_dispose(&v11, 8);
  double v6 = v2;
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (id)monochromeLayers
{
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x3052000000;
  double v8 = __Block_byref_object_copy_;
  double v9 = __Block_byref_object_dispose_;
  uint64_t v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __39__CUINamedVectorGlyph_monochromeLayers__block_invoke;
  v4[3] = &unk_1E5A51128;
  v4[4] = self;
  void v4[5] = &v5;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v4);
  double v2 = (void *)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __68__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize___block_invoke;
  v6[3] = &unk_1E5A511C0;
  v6[4] = self;
  v6[5] = &v8;
  *(double *)&v6[6] = a3;
  CGSize v7 = a4;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v6);
  double v4 = (CGImage *)v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (unint64_t)numberOfHierarchyLayers
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  [(CUINamedVectorGlyph *)self templateVersion];
  if (v3 >= 3.0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __46__CUINamedVectorGlyph_numberOfHierarchyLayers__block_invoke;
    v6[3] = &unk_1E5A510B0;
    v6[4] = self;
    v6[5] = &v7;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v6);
    unint64_t v4 = v8[3];
  }
  else
  {
    unint64_t v4 = 1;
    v8[3] = 1;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withColorResolver:(id)a5
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __86__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withColorResolver___block_invoke;
  v7[3] = &unk_1E5A51260;
  void v7[5] = a5;
  v7[6] = &v9;
  *(double *)&v7[7] = a3;
  CGSize v8 = a4;
  v7[4] = self;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v7);
  uint64_t v5 = (CGImage *)v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withPaletteColors:(id)a5
{
  uint64_t v16 = 0;
  double v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  if (a5)
  {
    double height = a4.height;
    double width = a4.width;
    id v10 = [a5 count];
    if (v10 == (id)1)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = __86__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColors___block_invoke;
      v15[3] = &unk_1E5A51398;
      v15[5] = a5;
      v15[6] = &v16;
      *(double *)&v15[7] = a3;
      *(double *)&v15[8] = width;
      *(double *)&v15[9] = height;
      v15[4] = self;
      -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v15);
    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __86__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColors___block_invoke_3;
      v14[3] = &unk_1E5A513C0;
      v14[4] = a5;
      v14[5] = v10;
      uint64_t v11 = -[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withPaletteColorResolver:](self, "rasterizeImageUsingScaleFactor:forTargetSize:withPaletteColorResolver:", v14, a3, width, height);
      v17[3] = (uint64_t)v11;
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CUINamedVectorGlyph.m", 2061, @"Invalid parameter not satisfying: %@", @"colors" object file lineNumber description];
  }
  uint64_t v12 = (CGImage *)v17[3];
  _Block_object_dispose(&v16, 8);
  return v12;
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withPaletteColorResolver:(id)a5
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __93__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColorResolver___block_invoke;
  v7[3] = &unk_1E5A51260;
  void v7[5] = a5;
  v7[6] = &v9;
  *(double *)&v7[7] = a3;
  CGSize v8 = a4;
  v7[4] = self;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v7);
  uint64_t v5 = (CGImage *)v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

void *__48__CUINamedVectorGlyph__layerHierarchyStyleNames__block_invoke()
{
  CGRect result = &unk_1EF4A6BD0;
  _layerHierarchyStyleNames_layerHierarchyStyleNames = (uint64_t)result;
  return result;
}

- (id)multicolorLayers
{
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x3052000000;
  CGSize v8 = __Block_byref_object_copy_;
  uint64_t v9 = __Block_byref_object_dispose_;
  uint64_t v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __39__CUINamedVectorGlyph_multicolorLayers__block_invoke;
  v4[3] = &unk_1E5A51128;
  v4[4] = self;
  void v4[5] = &v5;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v4);
  double v2 = (void *)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)hierarchicalLayers
{
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x3052000000;
  CGSize v8 = __Block_byref_object_copy_;
  uint64_t v9 = __Block_byref_object_dispose_;
  uint64_t v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __41__CUINamedVectorGlyph_hierarchicalLayers__block_invoke;
  v4[3] = &unk_1E5A51128;
  v4[4] = self;
  void v4[5] = &v5;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v4);
  double v2 = (void *)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)_partialLocale
{
  id result = [(CUINamedLookup *)self localization];
  if (result)
  {
    id v4 = [objc_loadWeak((id *)&self->_catalog) _nameForLocalizationIdentifier:result];
    return +[NSLocale localeWithLocaleIdentifier:v4];
  }
  return result;
}

- (CUINamedVectorGlyph)initWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 pointSize:(double)a6 continuousWeight:(double)a7 continuousSize:(double)a8 interpolatedFromRegular:(id)a9 ultralight:(id)a10 black:(id)a11 fromCatalog:(id)a12 themeRef:(unint64_t)a13
{
  return [(CUINamedVectorGlyph *)self initWithName:a3 scaleFactor:a5 deviceIdiom:a9 pointSize:a10 continuousWeight:a11 continuousSize:a12 interpolatedFromRegular:a4 ultralight:a6 black:a7 fromCatalog:a8 themeRef:a13 locale:[(CUINamedVectorGlyph *)self _partialLocale]];
}

- (id)intWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 pointSize:(double)a6 weight:(int64_t)a7 glyphSize:(int64_t)a8 interpolatedFromRegular:(id)a9 ultralight:(id)a10 black:(id)a11 fromCatalog:(id)a12 themeRef:(unint64_t)a13
{
  if ((unint64_t)a7 > 9) {
    double v13 = -0.8;
  }
  else {
    double v13 = *(double *)&qword_1A139DB18[a7];
  }
  double v14 = 1.0;
  if ((unint64_t)a8 <= 3) {
    double v14 = dbl_1A139DB68[a8];
  }
  return -[CUINamedVectorGlyph initWithName:scaleFactor:deviceIdiom:pointSize:continuousWeight:continuousSize:interpolatedFromRegular:ultralight:black:fromCatalog:themeRef:](self, "initWithName:scaleFactor:deviceIdiom:pointSize:continuousWeight:continuousSize:interpolatedFromRegular:ultralight:black:fromCatalog:themeRef:", a3, a5, a9, a10, a11, a12, a4, a6, v13, v14);
}

- (CUINamedVectorGlyph)initWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 pointSize:(double)a6 fromCatalog:(id)a7 usingRenditionKey:(id)a8 fromTheme:(unint64_t)a9
{
  id v17 = [(CUINamedVectorGlyph *)self _partialLocale];
  return [(CUINamedVectorGlyph *)self initWithName:a3 scaleFactor:a5 deviceIdiom:a7 pointSize:a8 fromCatalog:a9 usingRenditionKey:v17 themeRef:a4 locale:a6];
}

- (id)_ultralightInterpolationSource
{
  return self->_ultralightInterpolationSource;
}

- (void)_setUltralightInterpolationSource:(id)a3
{
  if (self->_ultralightInterpolationSource != a3)
  {
    id v5 = a3;

    self->_ultralightInterpolationSource = (CUINamedLookup *)a3;
  }
}

- (id)_blackInterpolationSource
{
  return self->_blackInterpolationSource;
}

- (void)_setBlackInterpolationSource:(id)a3
{
  if (self->_blackInterpolationSource != a3)
  {
    id v5 = a3;

    self->_blackInterpolationSource = (CUINamedLookup *)a3;
  }
}

- (CGImage)_cgImageRef
{
  return self->_cgImageRef;
}

- (void)_setImage:(CGImage *)a3
{
  if (self->_cgImageRef != a3)
  {
    CGImageRetain(a3);
    CGImageRelease(self->_cgImageRef);
    self->_cgImageRef = a3;
  }
}

- (CGSVGDocument)referenceGlyph
{
  id v2 = [(CUINamedVectorGlyph *)self _regularRendition];
  return (CGSVGDocument *)[v2 svgDocument];
}

- (BOOL)isInterpolatable
{
  id v2 = [(CUINamedVectorGlyph *)self _regularRendition];
  return [v2 isInterpolatable];
}

- (BOOL)canBeInterpolatedWith:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    self;
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (id Weak = objc_loadWeak((id *)&self->_catalog), Weak == [a3 _catalog]))
    {
      unsigned int v6 = -[NSString isEqual:](-[CUINamedLookup name](self, "name"), "isEqual:", [a3 name]);
      if (v6)
      {
        unsigned int v6 = [(CUINamedVectorGlyph *)self isInterpolatable];
        if (v6)
        {
          LOBYTE(v6) = [a3 isInterpolatable];
        }
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (CGRect)contentBoundsUnrounded
{
  uint64_t v11 = 0;
  uint64_t v12 = (double *)&v11;
  uint64_t v13 = 0x4010000000;
  double v14 = &unk_1A13C9C2D;
  long long v15 = 0u;
  long long v16 = 0u;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __45__CUINamedVectorGlyph_contentBoundsUnrounded__block_invoke;
  v10[3] = &unk_1E5A510B0;
  v10[4] = self;
  v10[5] = &v11;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v10);
  double v2 = v12[4];
  double v3 = v12[5];
  double v4 = v12[6];
  double v5 = v12[7];
  _Block_object_dispose(&v11, 8);
  double v6 = v2;
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

double __45__CUINamedVectorGlyph_contentBoundsUnrounded__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  [*(id *)(a1 + 32) referenceCanvasSize];
  double v9 = v8;
  double v11 = v10;
  if (a3 && a4)
  {
    uint64_t v12 = *(void **)(a1 + 32);
    [v12 glyphContinuousWeight];
    double v48 = v13;
    [*(id *)(a1 + 32) glyphContinuousSize];
    double v47 = v14;
    [a3 vectorGlyphAlignmentRectInsets];
    double v45 = v16;
    double v46 = v15;
    double v18 = v17;
    double v20 = v19;
    [a2 vectorGlyphAlignmentRectInsets];
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    [a4 vectorGlyphAlignmentRectInsets];
    objc_msgSend(v12, "_interpolatedAlignmentRectInsetsWithWeight:glyphSize:fromUltralight:regular:black:", v48, v47, v46, v45, v18, v20, v22, v24, v26, v28, v29, v30, v31, v32);
  }
  else
  {
    [a2 vectorGlyphAlignmentRectInsets];
  }
  double v37 = v33;
  double v38 = v34;
  double v39 = v35;
  double v40 = v36;
  [*(id *)(a1 + 32) _requestedPointSizeRatio];
  if (v41 > 0.0)
  {
    double v37 = v37 * v41;
    double v38 = v38 * v41;
    double v39 = v39 * v41;
    double v40 = v40 * v41;
    memset(&v49, 0, sizeof(v49));
    CGAffineTransformMakeScale(&v49, v41, v41);
    double v42 = v11 * v49.c;
    double v11 = v11 * v49.d + v49.b * v9;
    double v9 = v42 + v49.a * v9;
  }
  *(CGPoint *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = CGPointZero;
  double result = v40 + v9 + v38;
  uint64_t v44 = *(void *)(*(void *)(a1 + 40) + 8);
  *(double *)(v44 + 48) = result;
  *(double *)(v44 + 56) = v39 + v11 + v37;
  return result;
}

- (BOOL)generatedImage
{
  return *((unsigned char *)self + 104) & 1;
}

- (BOOL)_containsWideGamutColor
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  if ([(CUIRenditionKey *)[(CUINamedLookup *)self renditionKey] themeDisplayGamut])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __46__CUINamedVectorGlyph__containsWideGamutColor__block_invoke;
    v5[3] = &unk_1E5A510D8;
    v5[4] = &v6;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v5);
  }
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__CUINamedVectorGlyph__containsWideGamutColor__block_invoke(uint64_t a1, void *a2)
{
  [a2 svgDocument];
  uint64_t result = CGSVGDocumentContainsWideGamutContent();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)fillImageNames
{
  char v3 = +[NSSet set];
  if (![(CUINamedVectorGlyph *)self hasImageFills]) {
    return v3;
  }
  id v4 = [(CUINamedVectorGlyph *)self symbolDefaults];
  double v5 = CUIVectorGlyphDefaultsKeyFillImageNames;
  return [v4 objectForKeyedSubscript:v5];
}

- (CGImage)fillImageWithName:(id)a3
{
  id v5 = [(CUINamedVectorGlyph *)self fillImageNames];
  uint64_t v6 = v5;
  if (!a3) {
    a3 = [v5 anyObject];
  }
  if (![(CUINamedVectorGlyph *)self hasImageFills]
    || ![v6 containsObject:a3]
    || !objc_loadWeak((id *)&self->_catalog))
  {
    return 0;
  }
  double lookedupScaleFactor = self->_lookedupScaleFactor;
  int64_t v8 = [(CUINamedLookup *)self idiom];
  char v9 = [(CUINamedLookup *)self localization];
  int64_t v10 = [(CUINamedVectorGlyph *)self layoutDirection];
  if (v9) {
    char v9 = +[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", [objc_loadWeak((id *)&self->_catalog) _nameForLocalizationIdentifier:v9]);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __41__CUINamedVectorGlyph_fillImageWithName___block_invoke;
  v14[3] = &unk_1E5A51100;
  v14[4] = self;
  id v11 = [objc_loadWeak((id *)&self->_catalog) imageWithName:a3 scaleFactor:v8 deviceIdiom:v10 layoutDirection:v9 locale:v14 adjustRenditionKeyWithBlock:lookedupScaleFactor];
  if (!v11) {
    return 0;
  }
  CGImageRef v12 = CGImageRetain((CGImageRef)[v11 image]);
  CFAutorelease(v12);
  return v12;
}

id __41__CUINamedVectorGlyph_fillImageWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [*(id *)(a1 + 32) appearanceIdentifier];
  return [a2 setThemeAppearance:v3];
}

- (id)symbolDefaults
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  int64_t v8 = __Block_byref_object_copy_;
  symbolDefaults = self->_symbolDefaults;
  char v9 = __Block_byref_object_dispose_;
  int64_t v10 = symbolDefaults;
  if (!symbolDefaults)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = __37__CUINamedVectorGlyph_symbolDefaults__block_invoke;
    v4[3] = &unk_1E5A51128;
    v4[4] = self;
    void v4[5] = &v5;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v4);
    symbolDefaults = (NSDictionary *)v6[5];
  }
  _Block_object_dispose(&v5, 8);
  return symbolDefaults;
}

id __37__CUINamedVectorGlyph_symbolDefaults__block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _symbolDefaults];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __38__CUINamedVectorGlyph__symbolDefaults__block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  if ([(id)objc_opt_class() _wiggleStyleAtom] == a2)
  {
    CFStringRef v6 = (const __CFString *)CGSVGAttributeCopyString();
    if (!v6) {
      return;
    }
    CFStringRef v7 = v6;
    if (CFStringCompare(v6, @"linear", 0))
    {
      if (CFStringCompare(v7, @"clockwise", 0))
      {
        if (CFStringCompare(v7, @"counterClockwise", 0))
        {
LABEL_18:
          CFRelease(v7);
          return;
        }
        int64_t v8 = &unk_1EF4A6970;
      }
      else
      {
        int64_t v8 = &unk_1EF4A6958;
      }
    }
    else
    {
      int64_t v8 = &unk_1EF4A6940;
    }
    [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:CUIVectorGlyphDefaultsKeyWiggleStyle];
    goto LABEL_18;
  }
  if ([(id)objc_opt_class() _wiggleAngleAtom] == a2)
  {
    if (CGSVGAttributeGetFloat())
    {
      char v9 = +[NSNumber numberWithDouble:0.0];
      [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:CUIVectorGlyphDefaultsKeyWiggleAngle];
    }
    return;
  }
  if ([(id)objc_opt_class() _rotatesClockwiseAtom] == a2)
  {
    int64_t v10 = +[NSNumber numberWithBool:CUISVGAttributeGetBoolean(a3)];
    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = CUIVectorGlyphDefaultsKeyRotatesClockwise;
LABEL_23:
    [v11 setObject:v10 forKeyedSubscript:v12];
    return;
  }
  if ([(id)objc_opt_class() _variableColorContinuousAtom] == a2)
  {
    int64_t v10 = +[NSNumber numberWithBool:CUISVGAttributeGetBoolean(a3)];
    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = CUIVectorGlyphDefaultsKeyVariableColorContinuous;
    goto LABEL_23;
  }
  if ([(id)objc_opt_class() _hasImageFillsAtom] == a2)
  {
    int64_t v10 = +[NSNumber numberWithBool:CUISVGAttributeGetBoolean(a3)];
    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = CUIVectorGlyphDefaultsKeyHasImageFills;
    goto LABEL_23;
  }
  unsigned int v13 = [(id)objc_opt_class() _backgroundImageNamesAtom];
  double v14 = (void *)CGSVGAttributeCopyString();
  if (v13 == a2)
  {
    id v19 = v14;
    double v15 = +[NSSet setWithArray:](NSSet, "setWithArray:", objc_msgSend(v14, "componentsSeparatedByCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")));
    [*(id *)(a1 + 40) setObject:v15 forKeyedSubscript:CUIVectorGlyphDefaultsKeyFillImageNames];
  }
  else
  {
    if (!v14) {
      return;
    }
    id v19 = v14;
    double v16 = (void *)CGSVGAtomCopyString();
    if (v16)
    {
      double v17 = v16;
      if ([v16 hasPrefix:@"-sfsymbols-"])
      {
        id v18 = [v17 substringFromIndex:objc_msgSend(@"-sfsymbols-", "length")];

        double v17 = v18;
      }
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v19, v17, v19);
    }
  }
}

- (BOOL)hasImageFills
{
  id v2 = [(CUINamedVectorGlyph *)self symbolDefaults];
  id v3 = [v2 objectForKeyedSubscript:CUIVectorGlyphDefaultsKeyHasImageFills];
  if (v3)
  {
    LOBYTE(v3) = [v3 BOOLValue];
  }
  return (char)v3;
}

- (unint64_t)numberOfTemplateLayers
{
  uint64_t v7 = 0;
  int64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  [(CUINamedVectorGlyph *)self templateVersion];
  if (v3 >= 3.0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __45__CUINamedVectorGlyph_numberOfTemplateLayers__block_invoke;
    v6[3] = &unk_1E5A51128;
    v6[4] = self;
    v6[5] = &v7;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v6);
    unint64_t v4 = v8[3];
  }
  else
  {
    unint64_t v4 = 1;
    v8[3] = 1;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __45__CUINamedVectorGlyph_numberOfTemplateLayers__block_invoke(uint64_t a1, uint64_t a2)
{
  id result = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "monochromeLayerNamesInRendition:", a2), "count");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v5 = *(void *)(v4 + 24);
  if (v5 <= 1) {
    unint64_t v5 = 1;
  }
  *(void *)(v4 + 24) = v5;
  return result;
}

- (id)templateLayerThresholds
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  uint64_t v12 = __Block_byref_object_copy_;
  unsigned int v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  id v14 = +[NSMutableArray array];
  [(CUINamedVectorGlyph *)self templateVersion];
  if (v3 >= 4.0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __46__CUINamedVectorGlyph_templateLayerThresholds__block_invoke;
    v8[3] = &unk_1E5A510B0;
    v8[4] = self;
    v8[5] = &v9;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v8);
  }
  id v4 = [(id)v10[5] count];
  unint64_t v5 = (void *)v10[5];
  if (v4) {
    [v5 sortUsingSelector:sel_compare_];
  }
  else {
    [v5 addObject:&unk_1EF4A6B98];
  }
  CFStringRef v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

id __46__CUINamedVectorGlyph_templateLayerThresholds__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v3 + 104) & 4) != 0)
  {
    id v4 = [-[CUINamedVectorGlyph monochromeLayerGroup]((void *)v3) sublayers];
    uint64_t v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    id v14 = __46__CUINamedVectorGlyph_templateLayerThresholds__block_invoke_2;
    double v15 = &unk_1E5A51178;
    uint64_t v16 = *(void *)(a1 + 40);
    unint64_t v5 = &v12;
  }
  else
  {
    id v4 = [(id)v3 monochromeLayerNamesInRendition:a2];
    uint64_t v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    uint64_t v9 = __46__CUINamedVectorGlyph_templateLayerThresholds__block_invoke_3;
    uint64_t v10 = &unk_1E5A51178;
    uint64_t v11 = *(void *)(a1 + 40);
    unint64_t v5 = &v7;
  }
  return objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
}

id __46__CUINamedVectorGlyph_templateLayerThresholds__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  [a2 valueThreshold];
  uint64_t v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return [v2 addObject:v3];
}

id __46__CUINamedVectorGlyph_templateLayerThresholds__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:&unk_1EF4A6B98];
}

- (void)drawInContext:(CGContext *)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __37__CUINamedVectorGlyph_drawInContext___block_invoke;
  v3[3] = &unk_1E5A511E8;
  v3[4] = self;
  v3[5] = a3;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v3);
}

void *__37__CUINamedVectorGlyph_drawInContext___block_invoke(uint64_t a1)
{
  return -[CUINamedVectorGlyph _drawInContext:](*(void **)(a1 + 32), *(void *)(a1 + 40));
}

- (void)_drawInContext:(void *)result
{
  if (result && a2)
  {
    uint64_t v3 = result;
    [result referenceCanvasSize];
    double v5 = v4;
    double v7 = v6;
    [v3 scale];
    double v9 = v8;
    [v3 _requestedPointSizeRatio];
    double v11 = v9 * v10;
    id v12 = [v3 name];
    _CUILog(3, (uint64_t)"-[CUINamedVectorGlyph (%@) _drawInContext: scale:%f targetSize:%fx%f]", v13, v14, v15, v16, v17, v18, (uint64_t)v12);
    uint64_t SRGBBlack = _CUIColorGetSRGBBlack();
    return [(CUINamedVectorGlyph *)v3 _drawInContext:SRGBBlack scaleFactor:0 targetSize:v11 primaryColor:v5 tertiaryColor:v7];
  }
  return result;
}

- (CGPath)CGPath
{
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __29__CUINamedVectorGlyph_CGPath__block_invoke;
  v4[3] = &unk_1E5A510B0;
  v4[4] = self;
  void v4[5] = &v5;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v4);
  id v2 = (CGPath *)v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void *__29__CUINamedVectorGlyph_CGPath__block_invoke(void *result)
{
  if ((*(unsigned char *)(result[4] + 104) & 4) != 0)
  {
    v1 = result;
    Mutable = CGPathCreateMutable();
    uint64_t v15 = v1;
    id v3 = [-[CUINamedVectorGlyph monochromeLayerGroup]((void *)v1[4]) sublayers];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v21 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (objc_msgSend(objc_msgSend(v8, "sublayers"), "count"))
          {
            long long v18 = 0u;
            long long v19 = 0u;
            long long v16 = 0u;
            long long v17 = 0u;
            id v9 = [v8 sublayers];
            id v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
            if (v10)
            {
              id v11 = v10;
              uint64_t v12 = *(void *)v17;
              do
              {
                for (uint64_t j = 0; j != v11; uint64_t j = (char *)j + 1)
                {
                  if (*(void *)v17 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * (void)j);
                  if ([v14 shape]) {
                    CGPathAddPath(Mutable, 0, (CGPathRef)[v14 shape]);
                  }
                }
                id v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
              }
              while (v11);
            }
          }
          else if ([v8 shape])
          {
            CGPathAddPath(Mutable, 0, (CGPathRef)[v8 shape]);
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v5);
    }
    *(void *)(*(void *)(v15[5] + 8) + 24) = Mutable;
    return CFAutorelease(Mutable);
  }
  return result;
}

- (CGPath)maskShape
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __32__CUINamedVectorGlyph_maskShape__block_invoke;
  v4[3] = &unk_1E5A510B0;
  v4[4] = self;
  void v4[5] = &v5;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v4);
  id v2 = (CGPath *)v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __32__CUINamedVectorGlyph_maskShape__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v2 + 104) & 4) == 0) {
    return;
  }
  uint64_t v33 = a1;
  id v3 = [-[CUINamedVectorGlyph monochromeLayerGroup]((void *)v2) sublayers];
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obuint64_t j = v3;
  id v5 = [v3 countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (!v5) {
    goto LABEL_30;
  }
  uint64_t v38 = *(void *)v58;
  do
  {
    for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v58 != v38) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void **)(*((void *)&v57 + 1) + 8 * i);
      if ([v7 isEraserLayer])
      {
        [v7 opacity];
        BOOL v9 = v8 < 2.22044605e-16;
      }
      else
      {
        BOOL v9 = 0;
      }
      if (objc_msgSend(objc_msgSend(v7, "sublayers"), "count"))
      {
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v10 = [v7 sublayers];
        id v11 = [v10 countByEnumeratingWithState:&v53 objects:v63 count:16];
        if (!v11) {
          continue;
        }
        uint64_t v12 = *(void *)v54;
        while (1)
        {
          for (uint64_t j = 0; j != v11; uint64_t j = (char *)j + 1)
          {
            if (*(void *)v54 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void **)(*((void *)&v53 + 1) + 8 * (void)j);
            if ([v14 isEraserLayer])
            {
              [v14 opacity];
              if ((v9 ^ (v15 < 2.22044605e-16))) {
                continue;
              }
            }
            else if (v9)
            {
              continue;
            }
            long long v16 = (const CGPath *)[v14 shape];
            if (v16)
            {
              id v17 = CUICreateSubpathArrayFromCGPath(v16);
              [v4 addObjectsFromArray:v17];
            }
          }
          id v11 = [v10 countByEnumeratingWithState:&v53 objects:v63 count:16];
          if (!v11) {
            goto LABEL_28;
          }
        }
      }
      if (!v9)
      {
        long long v18 = (const CGPath *)[v7 shape];
        if (v18)
        {
          id v19 = CUICreateSubpathArrayFromCGPath(v18);
          [v4 addObjectsFromArray:v19];
        }
      }
LABEL_28:
      ;
    }
    id v5 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
  }
  while (v5);
LABEL_30:
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v35 = [v4 countByEnumeratingWithState:&v49 objects:v62 count:16];
  if (v35)
  {
    obja = 0;
    uint64_t v34 = *(void *)v50;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v50 != v34)
        {
          uint64_t v21 = v20;
          objc_enumerationMutation(v4);
          uint64_t v20 = v21;
        }
        uint64_t v39 = v20;
        long long v22 = *(const CGPath **)(*((void *)&v49 + 1) + 8 * v20);
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v23 = [v4 countByEnumeratingWithState:&v45 objects:v61 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v46;
          do
          {
            for (k = 0; k != v23; k = (char *)k + 1)
            {
              if (*(void *)v46 != v24) {
                objc_enumerationMutation(v4);
              }
              uint64_t v26 = *(const CGPath **)(*((void *)&v45 + 1) + 8 * (void)k);
              if (v22 != v26)
              {
                uint64_t v41 = 0;
                double v42 = &v41;
                uint64_t v43 = 0x2020000000;
                char v44 = 0;
                BoundingBoCGFloat x = CGPathGetBoundingBox(v22);
                CGFloat x = BoundingBox.origin.x;
                CGFloat y = BoundingBox.origin.y;
                CGFloat width = BoundingBox.size.width;
                CGFloat height = BoundingBox.size.height;
                CGRect v66 = CGPathGetBoundingBox(v26);
                v67.origin.CGFloat x = x;
                v67.origin.CGFloat y = y;
                v67.size.CGFloat width = width;
                v67.size.CGFloat height = height;
                if (CGRectContainsRect(v66, v67))
                {
                  block[0] = _NSConcreteStackBlock;
                  block[1] = 3221225472;
                  block[2] = __32__CUINamedVectorGlyph_maskShape__block_invoke_2;
                  block[3] = &unk_1E5A51210;
                  block[4] = &v41;
                  block[5] = v26;
                  CGPathApplyWithBlock(v22, block);
                  int v31 = *((unsigned __int8 *)v42 + 24);
                  _Block_object_dispose(&v41, 8);
                  if (!v31) {
                    goto LABEL_50;
                  }
                }
                else
                {
                  *((unsigned char *)v42 + 24) = 1;
                  _Block_object_dispose(&v41, 8);
                }
              }
            }
            id v23 = [v4 countByEnumeratingWithState:&v45 objects:v61 count:16];
          }
          while (v23);
        }
        if (obja)
        {
          CGPathRef CopyByUnioningPath = CGPathCreateCopyByUnioningPath(obja, v22, 0);
          CGPathRelease(obja);
          obja = CopyByUnioningPath;
        }
        else
        {
          obja = CGPathRetain(v22);
        }
LABEL_50:
        uint64_t v20 = v39 + 1;
      }
      while ((id)(v39 + 1) != v35);
      id v35 = [v4 countByEnumeratingWithState:&v49 objects:v62 count:16];
    }
    while (v35);
    if (obja)
    {
      *(void *)(*(void *)(*(void *)(v33 + 40) + 8) + 24) = obja;
      CFAutorelease(obja);
    }
  }
}

uint64_t __32__CUINamedVectorGlyph_maskShape__block_invoke_2(uint64_t result, int *a2)
{
  uint64_t v2 = result;
  int v3 = *a2;
  if (*a2 < 2)
  {
    id v5 = (CGPoint *)*((void *)a2 + 1);
    if (!v5) {
      return result;
    }
  }
  else
  {
    if (v3 == 2)
    {
      uint64_t v4 = 1;
    }
    else
    {
      if (v3 != 3) {
        return result;
      }
      uint64_t v4 = 2;
    }
    id v5 = (CGPoint *)(*((void *)a2 + 1) + 16 * v4);
  }
  id result = CGPathContainsPoint(*(CGPathRef *)(result + 40), 0, *v5, 0);
  if ((result & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(v2 + 32) + 8) + 24) = 1;
  }
  return result;
}

- (unint64_t)numberOfMulticolorLayers
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  [(CUINamedVectorGlyph *)self templateVersion];
  if (v3 >= 2.1)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __47__CUINamedVectorGlyph_numberOfMulticolorLayers__block_invoke;
    v6[3] = &unk_1E5A51128;
    v6[4] = self;
    v6[5] = &v7;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v6);
    unint64_t v4 = v8[3];
  }
  else
  {
    unint64_t v4 = 1;
    v8[3] = 1;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __47__CUINamedVectorGlyph_numberOfMulticolorLayers__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)(a1 + 32);
  if (v3) {
    id v3 = [v3 _layerNamesForRenderingMode:2 inRendition:a2];
  }
  id result = [v3 count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)multicolorLayerThresholds
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  uint64_t v12 = __Block_byref_object_copy_;
  uint64_t v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  id v14 = +[NSMutableArray array];
  [(CUINamedVectorGlyph *)self templateVersion];
  if (v3 >= 4.0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __48__CUINamedVectorGlyph_multicolorLayerThresholds__block_invoke;
    v8[3] = &unk_1E5A510B0;
    v8[4] = self;
    v8[5] = &v9;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v8);
  }
  id v4 = [(id)v10[5] count];
  id v5 = (void *)v10[5];
  if (v4) {
    [v5 sortUsingSelector:sel_compare_];
  }
  else {
    [v5 addObject:&unk_1EF4A6B98];
  }
  uint64_t v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

id __48__CUINamedVectorGlyph_multicolorLayerThresholds__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v3 + 104) & 4) != 0)
  {
    id v4 = [-[CUINamedVectorGlyph multicolorLayerGroup]((void *)v3) sublayers];
    uint64_t v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    id v14 = __48__CUINamedVectorGlyph_multicolorLayerThresholds__block_invoke_2;
    double v15 = &unk_1E5A51178;
    uint64_t v16 = *(void *)(a1 + 40);
    id v5 = &v12;
  }
  else
  {
    id v4 = [(id)v3 _layerNamesForRenderingMode:2 inRendition:a2];
    uint64_t v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    uint64_t v9 = __48__CUINamedVectorGlyph_multicolorLayerThresholds__block_invoke_3;
    uint64_t v10 = &unk_1E5A51178;
    uint64_t v11 = *(void *)(a1 + 40);
    id v5 = &v7;
  }
  return objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
}

id __48__CUINamedVectorGlyph_multicolorLayerThresholds__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  [a2 valueThreshold];
  uint64_t v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return [v2 addObject:v3];
}

id __48__CUINamedVectorGlyph_multicolorLayerThresholds__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:&unk_1EF4A6B98];
}

- (id)makeLayerWithColorResolver:(id)a3
{
  uint64_t v3 = [(CUINamedVectorGlyph *)self imageWithColorResolver:a3];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  id v5 = +[CALayer layer];
  [(CALayer *)v5 setContents:v4];
  double Width = (double)CGImageGetWidth(v4);
  -[CALayer setBounds:](v5, "setBounds:", 0.0, 0.0, Width, (double)CGImageGetHeight(v4));
  CGImageRelease(v4);
  return v5;
}

- (void)drawMulticolorLayerAtIndex:(unint64_t)a3 inContext:(CGContext *)a4 withColorResolver:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __78__CUINamedVectorGlyph_drawMulticolorLayerAtIndex_inContext_withColorResolver___block_invoke;
  v5[3] = &unk_1E5A51288;
  v5[6] = a3;
  void v5[7] = a4;
  v5[4] = self;
  void v5[5] = a5;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v5);
}

id __78__CUINamedVectorGlyph_drawMulticolorLayerAtIndex_inContext_withColorResolver___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 48);
  id result = objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph multicolorLayerGroup](*(void **)(a1 + 32)), "sublayers"), "count");
  if (v2 < (unint64_t)result)
  {
    [*(id *)(a1 + 32) referenceCanvasSize];
    double v5 = v4;
    double v7 = v6;
    [*(id *)(a1 + 32) scale];
    double v9 = v8;
    [*(id *)(a1 + 32) _requestedPointSizeRatio];
    double v11 = v9 * v10;
    id v12 = objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph multicolorLayerGroup](*(void **)(a1 + 32)), "sublayers"), "objectAtIndex:", *(void *)(a1 + 48));
    uint64_t v13 = *(void *)(a1 + 56);
    [*(id *)(a1 + 32) variableMinValue];
    double v15 = v14;
    [*(id *)(a1 + 32) variableMaxValue];
    uint64_t v17 = *(void *)(a1 + 40);
    return objc_msgSend(v12, "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:colorResolver:", v13, v17, v11, v5, v7, v15, v16);
  }
  return result;
}

id __47__CUINamedVectorGlyph_containsNamedColorStyles__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v3 + 104) & 4) != 0) {
    id v4 = [-[CUINamedVectorGlyph multicolorLayerGroup]((void *)v3) sublayers];
  }
  else {
    id v4 = [(id)v3 _layerNamesForRenderingMode:2 inRendition:a2];
  }
  id result = [v4 count];
  *(_WORD *)(*(void *)(a1 + 32) + 106) = result != 0;
  return result;
}

- (BOOL)containsNamedColorStyle:(id)a3
{
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  [(CUINamedVectorGlyph *)self templateVersion];
  if (v5 >= 2.1 && [(CUINamedVectorGlyph *)self containsNamedColorStyles])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __47__CUINamedVectorGlyph_containsNamedColorStyle___block_invoke;
    v8[3] = &unk_1E5A512D8;
    v8[4] = self;
    v8[5] = a3;
    void v8[6] = &v9;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v8);
  }
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

id __47__CUINamedVectorGlyph_containsNamedColorStyle___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v3 + 104) & 4) != 0) {
    id v4 = +[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", objc_msgSend(objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph multicolorLayerGroup]((void *)v3), "sublayers"), "valueForKeyPath:", @"name"), "sortedArrayUsingSelector:", sel_compare_));
  }
  else {
    id v4 = (NSOrderedSet *)[(id)v3 _layerNamesForRenderingMode:2 inRendition:a2];
  }
  float v5 = v4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id result = [(NSOrderedSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v7 = result;
    uint64_t v8 = *(void *)v11;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        id result = -[__CFString isEqualToString:](-[CUINamedVectorGlyph colorNameForRenderingStyle:](*(__CFString **)(a1 + 32), *(void **)(*((void *)&v10 + 1) + 8 * (void)v9)), "isEqualToString:", *(void *)(a1 + 40));
        if (result)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          return result;
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id result = [(NSOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v7 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (id)multicolorColorNames
{
  id v3 = +[NSMutableSet set];
  [(CUINamedVectorGlyph *)self templateVersion];
  if (v4 >= 2.1)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __43__CUINamedVectorGlyph_multicolorColorNames__block_invoke;
    v6[3] = &unk_1E5A51300;
    v6[4] = self;
    v6[5] = v3;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v6);
  }
  return v3;
}

id __43__CUINamedVectorGlyph_multicolorColorNames__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v3 + 104) & 4) != 0) {
    float v4 = +[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", objc_msgSend(objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph multicolorLayerGroup]((void *)v3), "sublayers"), "valueForKeyPath:", @"name"), "sortedArrayUsingSelector:", sel_compare_));
  }
  else {
    float v4 = (NSOrderedSet *)[(id)v3 _layerNamesForRenderingMode:2 inRendition:a2];
  }
  float v5 = v4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id result = [(NSOrderedSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v7 = result;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(a1 + 40), "addObject:", -[CUINamedVectorGlyph colorNameForRenderingStyle:](*(__CFString **)(a1 + 32), *(void **)(*((void *)&v10 + 1) + 8 * (void)v9)));
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id result = [(NSOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v7 = result;
    }
    while (result);
  }
  return result;
}

- (id)multicolorLayerColorNames
{
  id v3 = +[NSMutableArray array];
  [(CUINamedVectorGlyph *)self templateVersion];
  if (v4 >= 2.1)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __48__CUINamedVectorGlyph_multicolorLayerColorNames__block_invoke;
    v6[3] = &unk_1E5A51300;
    v6[4] = self;
    v6[5] = v3;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v6);
  }
  return v3;
}

id __48__CUINamedVectorGlyph_multicolorLayerColorNames__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v3 + 104) & 4) != 0) {
    float v4 = +[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", objc_msgSend(objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph multicolorLayerGroup]((void *)v3), "sublayers"), "valueForKeyPath:", @"name"), "sortedArrayUsingSelector:", sel_compare_));
  }
  else {
    float v4 = (NSOrderedSet *)[(id)v3 _layerNamesForRenderingMode:2 inRendition:a2];
  }
  float v5 = v4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id result = [(NSOrderedSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v7 = result;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(a1 + 40), "addObject:", -[CUINamedVectorGlyph colorNameForRenderingStyle:](*(__CFString **)(a1 + 32), *(void **)(*((void *)&v10 + 1) + 8 * (void)v9)));
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id result = [(NSOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v7 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)isKnockoutEnabledForMulticolorLayerAtIndex:(int64_t)a3 opacity:(double *)a4
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  [(CUINamedVectorGlyph *)self templateVersion];
  if (v7 >= 2.1)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __74__CUINamedVectorGlyph_isKnockoutEnabledForMulticolorLayerAtIndex_opacity___block_invoke;
    v10[3] = &unk_1E5A51328;
    v10[4] = self;
    v10[5] = &v11;
    void v10[6] = a3;
    v10[7] = a4;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v10);
  }
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v8;
}

unsigned char *__74__CUINamedVectorGlyph_isKnockoutEnabledForMulticolorLayerAtIndex_opacity___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) variableMinValue];
  double v3 = v2;
  [*(id *)(a1 + 32) variableMaxValue];
  id result = *(unsigned char **)(a1 + 32);
  double v6 = 1.0;
  if ((result[104] & 4) == 0) {
    goto LABEL_24;
  }
  double v7 = v4;
  id v8 = objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph multicolorLayerGroup](result), "sublayers"), "objectAtIndex:", *(void *)(a1 + 48));
  unsigned int v9 = [v8 isEraserLayer];
  [v8 opacity];
  double v6 = v10;
  id result = [v8 valueThreshold];
  if (v9) {
    BOOL v12 = v6 < 2.22044605e-16;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12 || (v7 == INFINITY ? (BOOL v13 = v3 == INFINITY) : (BOOL v13 = 0), !v13 ? (v14 = v11 == INFINITY) : (v14 = 1), v14))
  {
LABEL_22:
    if (!v9) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  BOOL v15 = v3 == INFINITY;
  if (v11 >= v3) {
    BOOL v15 = 1;
  }
  BOOL v16 = v11 <= v7;
  if (v11 <= 0.0) {
    BOOL v16 = v11 < v7;
  }
  if (v7 == INFINITY) {
    BOOL v16 = 1;
  }
  double v6 = 0.0;
  if (!v15 || !v16)
  {
    double v6 = 0.7;
    goto LABEL_22;
  }
LABEL_23:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
LABEL_24:
  uint64_t v17 = *(double **)(a1 + 56);
  if (v17) {
    *uint64_t v17 = v6;
  }
  return result;
}

- (id)hierarchicalLayerThresholds
{
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x3052000000;
  BOOL v12 = __Block_byref_object_copy_;
  BOOL v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  id v14 = +[NSMutableArray array];
  [(CUINamedVectorGlyph *)self templateVersion];
  if (v3 >= 4.0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __50__CUINamedVectorGlyph_hierarchicalLayerThresholds__block_invoke;
    v8[3] = &unk_1E5A510B0;
    v8[4] = self;
    v8[5] = &v9;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v8);
  }
  id v4 = [(id)v10[5] count];
  float v5 = (void *)v10[5];
  if (v4) {
    [v5 sortUsingSelector:sel_compare_];
  }
  else {
    [v5 addObject:&unk_1EF4A6B98];
  }
  double v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

id __50__CUINamedVectorGlyph_hierarchicalLayerThresholds__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v3 + 104) & 4) != 0)
  {
    id v4 = [-[CUINamedVectorGlyph hierarchicalLayerGroup]((void *)v3) sublayers];
    BOOL v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    id v14 = __50__CUINamedVectorGlyph_hierarchicalLayerThresholds__block_invoke_2;
    BOOL v15 = &unk_1E5A51178;
    uint64_t v16 = *(void *)(a1 + 40);
    float v5 = &v12;
  }
  else
  {
    id v4 = [(id)v3 _layerNamesForRenderingMode:3 inRendition:a2];
    double v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    uint64_t v9 = __50__CUINamedVectorGlyph_hierarchicalLayerThresholds__block_invoke_3;
    double v10 = &unk_1E5A51178;
    uint64_t v11 = *(void *)(a1 + 40);
    float v5 = &v7;
  }
  return objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
}

id __50__CUINamedVectorGlyph_hierarchicalLayerThresholds__block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  [a2 valueThreshold];
  uint64_t v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return [v2 addObject:v3];
}

id __50__CUINamedVectorGlyph_hierarchicalLayerThresholds__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:&unk_1EF4A6B98];
}

- (id)hierarchyLayers
{
  id v3 = +[NSMutableIndexSet indexSet];
  [(CUINamedVectorGlyph *)self templateVersion];
  if (v4 >= 3.0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __38__CUINamedVectorGlyph_hierarchyLayers__block_invoke;
    v6[3] = &unk_1E5A51300;
    v6[4] = self;
    v6[5] = v3;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v6);
  }
  else
  {
    [v3 addIndex:0];
  }
  return v3;
}

id __38__CUINamedVectorGlyph_hierarchyLayers__block_invoke(uint64_t a1)
{
  id v2 = [-[CUINamedVectorGlyph hierarchicalLayerGroup](*(void **)(a1 + 32)) sublayers];
  [*(id *)(a1 + 32) variableMinValue];
  double v4 = v3;
  [*(id *)(a1 + 32) variableMaxValue];
  double v6 = v5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id result = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (result)
  {
    id v8 = result;
    uint64_t v9 = *(void *)v19;
    BOOL v10 = v6 != INFINITY || v4 != INFINITY;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v2);
        }
        BOOL v12 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v11);
        id v13 = [v12 hierarchyLevel];
        if (v10)
        {
          [v12 valueThreshold];
          if (v14 == INFINITY) {
            goto LABEL_17;
          }
          BOOL v15 = v4 == INFINITY;
          if (v14 >= v4) {
            BOOL v15 = 1;
          }
          BOOL v16 = v14 <= v6;
          if (v14 <= 0.0) {
            BOOL v16 = v14 < v6;
          }
          if (v6 == INFINITY) {
            BOOL v16 = 1;
          }
          if (v15 && v16) {
LABEL_17:
          }
            uint64_t v17 = 0;
          else {
            uint64_t v17 = 2;
          }
        }
        else
        {
          uint64_t v17 = (uint64_t)v13;
        }
        [*(id *)(a1 + 40) addIndex:v17];
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id result = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
      id v8 = result;
    }
    while (result);
  }
  return result;
}

- (id)hierarchyLevels
{
  id v3 = +[NSMutableArray array];
  [(CUINamedVectorGlyph *)self templateVersion];
  if (v4 >= 3.0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __38__CUINamedVectorGlyph_hierarchyLevels__block_invoke;
    v6[3] = &unk_1E5A51300;
    v6[4] = self;
    v6[5] = v3;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v6);
  }
  else
  {
    [v3 addObject:&unk_1EF4A6988];
  }
  return v3;
}

id __38__CUINamedVectorGlyph_hierarchyLevels__block_invoke(uint64_t a1)
{
  id v2 = [-[CUINamedVectorGlyph hierarchicalLayerGroup](*(void **)(a1 + 32)) sublayers];
  [*(id *)(a1 + 32) variableMinValue];
  double v4 = v3;
  [*(id *)(a1 + 32) variableMaxValue];
  double v6 = v5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id result = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (result)
  {
    id v8 = result;
    uint64_t v9 = *(void *)v19;
    BOOL v10 = v6 != INFINITY || v4 != INFINITY;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v2);
        }
        BOOL v12 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v11);
        id v13 = [v12 hierarchyLevel];
        if (v10)
        {
          [v12 valueThreshold];
          if (v14 == INFINITY) {
            goto LABEL_17;
          }
          BOOL v15 = v4 == INFINITY;
          if (v14 >= v4) {
            BOOL v15 = 1;
          }
          BOOL v16 = v14 <= v6;
          if (v14 <= 0.0) {
            BOOL v16 = v14 < v6;
          }
          if (v6 == INFINITY) {
            BOOL v16 = 1;
          }
          if (v15 && v16) {
LABEL_17:
          }
            uint64_t v17 = 0;
          else {
            uint64_t v17 = 2;
          }
        }
        else
        {
          uint64_t v17 = (uint64_t)v13;
        }
        objc_msgSend(*(id *)(a1 + 40), "addObject:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v17));
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id result = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
      id v8 = result;
    }
    while (result);
  }
  return result;
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 withHierarchyColorResolver:(id)a5
{
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __95__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withHierarchyColorResolver___block_invoke;
  v7[3] = &unk_1E5A51260;
  void v7[5] = a5;
  v7[6] = &v9;
  *(double *)&v7[7] = a3;
  CGSize v8 = a4;
  v7[4] = self;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v7);
  double v5 = (CGImage *)v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

CGImageRef __95__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withHierarchyColorResolver___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __95__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withHierarchyColorResolver___block_invoke_2;
  v4[3] = &unk_1E5A51238;
  v4[4] = *(void *)(a1 + 40);
  CGImageRef result = [(CUINamedVectorGlyph *)v2 _rasterizeImageUsingScaleFactor:(uint64_t)v4 forTargetSize:*(double *)(a1 + 56) renderingMode:*(double *)(a1 + 64) colorResolver:*(double *)(a1 + 72)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __95__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withHierarchyColorResolver___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)drawHierarchyLayerAtIndex:(unint64_t)a3 inContext:(CGContext *)a4 withColorResolver:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __77__CUINamedVectorGlyph_drawHierarchyLayerAtIndex_inContext_withColorResolver___block_invoke;
  v5[3] = &unk_1E5A51288;
  v5[6] = a3;
  void v5[7] = a4;
  v5[4] = self;
  void v5[5] = a5;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v5);
}

void *__77__CUINamedVectorGlyph_drawHierarchyLayerAtIndex_inContext_withColorResolver___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) referenceCanvasSize];
  double v3 = v2;
  double v5 = v4;
  [*(id *)(a1 + 32) scale];
  double v7 = v6;
  [*(id *)(a1 + 32) _requestedPointSizeRatio];
  double v9 = v7 * v8;
  unint64_t v10 = *(void *)(a1 + 48);
  CGImageRef result = objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup](*(void **)(a1 + 32)), "sublayers"), "count");
  if (v10 >= (unint64_t)result)
  {
    if (!*(void *)(a1 + 48))
    {
      uint64_t v18 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
      long long v19 = *(void **)(a1 + 32);
      uint64_t v20 = *(void *)(a1 + 56);
      return [(CUINamedVectorGlyph *)v19 _drawInContext:v18 scaleFactor:0 targetSize:v9 primaryColor:v3 tertiaryColor:v5];
    }
  }
  else
  {
    id v12 = objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup](*(void **)(a1 + 32)), "sublayers"), "objectAtIndex:", *(void *)(a1 + 48));
    uint64_t v13 = *(void *)(a1 + 56);
    [*(id *)(a1 + 32) variableMinValue];
    double v15 = v14;
    [*(id *)(a1 + 32) variableMaxValue];
    uint64_t v17 = *(void *)(a1 + 40);
    return objc_msgSend(v12, "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:hierarchicalColorResolver:", v13, v17, v9, v3, v5, v15, v16);
  }
  return result;
}

- (CGImage)imageWithHierarchicalPrimaryColor:(CGColor *)a3
{
  if (a3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __57__CUINamedVectorGlyph_imageWithHierarchicalPrimaryColor___block_invoke;
    v5[3] = &__block_descriptor_56_e21___CGColor__24__0Q8Q16l;
    v5[4] = a3;
    void v5[5] = 4;
    v5[6] = CGColorGetAlpha(a3);
    return [(CUINamedVectorGlyph *)self imageWithHierarchyColorResolver:v5];
  }
  else
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CUINamedVectorGlyph.m", 1870, @"Invalid parameter not satisfying: %@", @"primaryColor" object file lineNumber description];
    return 0;
  }
}

CFTypeRef __57__CUINamedVectorGlyph_imageWithHierarchicalPrimaryColor___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  double v5 = (CGColor *)CFRetain(*(CFTypeRef *)(a1 + 32));
  unint64_t v6 = *(void *)(a1 + 40) - 1;
  if (v6 >= a3) {
    unint64_t v6 = a3;
  }
  if (v6)
  {
    CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha(*(CGColorRef *)(a1 + 32), CUIVectorGlyphHierarchicalColorOpacities[v6] * *(double *)(a1 + 48));
    CFRelease(*(CFTypeRef *)(a1 + 32));
  }
  else
  {
    CGColorRef CopyWithAlpha = v5;
  }
  return CFAutorelease(CopyWithAlpha);
}

- (CGImage)rasterizeImageUsingScaleFactor:(double)a3 forTargetSize:(CGSize)a4 hierarchicalPrimaryColor:(CGColor *)a5
{
  if (a5)
  {
    double height = a4.height;
    double width = a4.width;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __93__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_hierarchicalPrimaryColor___block_invoke;
    v10[3] = &__block_descriptor_56_e21___CGColor__24__0Q8Q16l;
    v10[4] = a5;
    v10[5] = 4;
    void v10[6] = CGColorGetAlpha(a5);
    return -[CUINamedVectorGlyph rasterizeImageUsingScaleFactor:forTargetSize:withHierarchyColorResolver:](self, "rasterizeImageUsingScaleFactor:forTargetSize:withHierarchyColorResolver:", v10, a3, width, height);
  }
  else
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CUINamedVectorGlyph.m", 1892, @"Invalid parameter not satisfying: %@", @"primaryColor" object file lineNumber description];
    return 0;
  }
}

CFTypeRef __93__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_hierarchicalPrimaryColor___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  double v5 = (CGColor *)CFRetain(*(CFTypeRef *)(a1 + 32));
  unint64_t v6 = *(void *)(a1 + 40) - 1;
  if (v6 >= a3) {
    unint64_t v6 = a3;
  }
  if (v6)
  {
    CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha(*(CGColorRef *)(a1 + 32), CUIVectorGlyphHierarchicalColorOpacities[v6] * *(double *)(a1 + 48));
    CFRelease(*(CFTypeRef *)(a1 + 32));
  }
  else
  {
    CGColorRef CopyWithAlpha = v5;
  }
  return CFAutorelease(CopyWithAlpha);
}

- (BOOL)isKnockoutEnabledForHierarchicalLayerAtIndex:(int64_t)a3 opacity:(double *)a4
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  if (a4) {
    *a4 = 1.0;
  }
  [(CUINamedVectorGlyph *)self templateVersion];
  if (v7 >= 3.0)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __76__CUINamedVectorGlyph_isKnockoutEnabledForHierarchicalLayerAtIndex_opacity___block_invoke;
    v10[3] = &unk_1E5A51328;
    v10[4] = self;
    v10[5] = &v11;
    void v10[6] = a3;
    void v10[7] = a4;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v10);
  }
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v8;
}

id __76__CUINamedVectorGlyph_isKnockoutEnabledForHierarchicalLayerAtIndex_opacity___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) variableMinValue];
  double v3 = v2;
  [*(id *)(a1 + 32) variableMaxValue];
  double v5 = v4;
  id v6 = objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup](*(void **)(a1 + 32)), "sublayers"), "objectAtIndex:", *(void *)(a1 + 48));
  unsigned int v7 = [v6 isEraserLayer];
  id result = [v6 opacity];
  double v10 = v9;
  if (v7) {
    BOOL v11 = v9 < 2.22044605e-16;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11 && (v3 != INFINITY || v5 != INFINITY))
  {
    id result = [v6 valueThreshold];
    if (v13 != INFINITY)
    {
      BOOL v14 = v3 == INFINITY;
      if (v13 >= v3) {
        BOOL v14 = 1;
      }
      BOOL v15 = v13 <= v5;
      if (v13 <= 0.0) {
        BOOL v15 = v13 < v5;
      }
      if (v5 == INFINITY) {
        BOOL v15 = 1;
      }
      if (v14 && v15) {
        double v10 = 0.0;
      }
      else {
        double v10 = 0.7;
      }
    }
  }
  if (v7) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  double v16 = *(double **)(a1 + 56);
  if (v16) {
    *double v16 = v10;
  }
  return result;
}

- (id)paletteLevels
{
  id v3 = +[NSMutableArray array];
  [(CUINamedVectorGlyph *)self templateVersion];
  if (v4 >= 3.0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __36__CUINamedVectorGlyph_paletteLevels__block_invoke;
    v6[3] = &unk_1E5A51300;
    v6[4] = self;
    v6[5] = v3;
    -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v6);
  }
  else
  {
    [v3 addObject:&unk_1EF4A6988];
  }
  return v3;
}

id __36__CUINamedVectorGlyph_paletteLevels__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v3 + 104) & 4) != 0) {
    float v4 = +[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", objc_msgSend(objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup]((void *)v3), "sublayers"), "valueForKeyPath:", @"name"), "sortedArrayUsingSelector:", sel_compare_));
  }
  else {
    float v4 = (NSOrderedSet *)[(id)v3 _layerNamesForRenderingMode:3 inRendition:a2];
  }
  double v5 = v4;
  id v6 = [(id)objc_opt_class() _layerHierarchyStyleNames];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id result = [(NSOrderedSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    id v8 = result;
    uint64_t v9 = *(void *)v12;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(a1 + 40), "addObject:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", -[CUINamedVectorGlyph colorNameForRenderingStyle:](*(__CFString **)(a1 + 32), *(void **)(*((void *)&v11 + 1) + 8 * (void)v10)))));
        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id result = [(NSOrderedSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v8 = result;
    }
    while (result);
  }
  return result;
}

- (void)drawPaletteLayerAtIndex:(unint64_t)a3 inContext:(CGContext *)a4 withColorResolver:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __75__CUINamedVectorGlyph_drawPaletteLayerAtIndex_inContext_withColorResolver___block_invoke;
  v5[3] = &unk_1E5A51288;
  v5[6] = a3;
  void v5[7] = a4;
  v5[4] = self;
  void v5[5] = a5;
  -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v5);
}

void *__75__CUINamedVectorGlyph_drawPaletteLayerAtIndex_inContext_withColorResolver___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) referenceCanvasSize];
  double v3 = v2;
  double v5 = v4;
  [*(id *)(a1 + 32) scale];
  double v7 = v6;
  [*(id *)(a1 + 32) _requestedPointSizeRatio];
  double v9 = v7 * v8;
  unint64_t v10 = *(void *)(a1 + 48);
  id result = objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup](*(void **)(a1 + 32)), "sublayers"), "count");
  if (v10 >= (unint64_t)result)
  {
    if (!*(void *)(a1 + 48))
    {
      uint64_t v18 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
      long long v19 = *(void **)(a1 + 32);
      uint64_t v20 = *(void *)(a1 + 56);
      return [(CUINamedVectorGlyph *)v19 _drawInContext:v18 scaleFactor:0 targetSize:v9 primaryColor:v3 tertiaryColor:v5];
    }
  }
  else
  {
    id v12 = objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup](*(void **)(a1 + 32)), "sublayers"), "objectAtIndex:", *(void *)(a1 + 48));
    uint64_t v13 = *(void *)(a1 + 56);
    [*(id *)(a1 + 32) variableMinValue];
    double v15 = v14;
    [*(id *)(a1 + 32) variableMaxValue];
    uint64_t v17 = *(void *)(a1 + 40);
    return objc_msgSend(v12, "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:paletteColorResolver:", v13, v17, v9, v3, v5, v15, v16);
  }
  return result;
}

CGImageRef __46__CUINamedVectorGlyph_imageWithPaletteColors___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __46__CUINamedVectorGlyph_imageWithPaletteColors___block_invoke_2;
  v4[3] = &unk_1E5A51370;
  v4[4] = *(void *)(a1 + 40);
  CGImageRef result = [(CUINamedVectorGlyph *)v2 _rasterizeImageUsingScaleFactor:(uint64_t)v4 forTargetSize:*(double *)(a1 + 56) renderingMode:*(double *)(a1 + 64) colorResolver:*(double *)(a1 + 72)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

id __46__CUINamedVectorGlyph_imageWithPaletteColors___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) firstObject];
}

CGImageRef __86__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColors___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __86__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColors___block_invoke_2;
  v4[3] = &unk_1E5A51370;
  v4[4] = *(void *)(a1 + 40);
  CGImageRef result = [(CUINamedVectorGlyph *)v2 _rasterizeImageUsingScaleFactor:(uint64_t)v4 forTargetSize:*(double *)(a1 + 56) renderingMode:*(double *)(a1 + 64) colorResolver:*(double *)(a1 + 72)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

id __86__CUINamedVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColors___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) firstObject];
}

- (void)drawInContext:(CGContext *)a3 withPaletteColors:(id)a4
{
  if (a4)
  {
    unint64_t v7 = [(CUINamedVectorGlyph *)self numberOfHierarchyLayers];
    id v8 = [a4 count];
    if (v8 == (id)1)
    {
      [(CUINamedVectorGlyph *)self referenceCanvasSize];
      uint64_t v10 = v9;
      uint64_t v12 = v11;
      [(CUINamedVectorGlyph *)self scale];
      double v14 = v13;
      [(CUINamedVectorGlyph *)self _requestedPointSizeRatio];
      v19[1] = 3221225472;
      v19[0] = _NSConcreteStackBlock;
      v19[2] = __55__CUINamedVectorGlyph_drawInContext_withPaletteColors___block_invoke;
      v19[3] = &unk_1E5A513E8;
      v19[5] = a4;
      v19[6] = a3;
      *(double *)&v19[7] = v14 * v15;
      v19[8] = v10;
      v19[9] = v12;
      v19[4] = self;
      -[CUINamedVectorGlyph _performWithLockedRenditions:]((id *)&self->super.super.isa, (uint64_t)v19);
    }
    else if (v7)
    {
      id v16 = v8;
      for (uint64_t i = 0; i != v7; ++i)
      {
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = __55__CUINamedVectorGlyph_drawInContext_withPaletteColors___block_invoke_2;
        v18[3] = &unk_1E5A513C0;
        v18[4] = a4;
        v18[5] = v16;
        [(CUINamedVectorGlyph *)self drawPaletteLayerAtIndex:i inContext:a3 withColorResolver:v18];
      }
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CUINamedVectorGlyph.m", 2085, @"Invalid parameter not satisfying: %@", @"colors" object file lineNumber description];
  }
}

void *__55__CUINamedVectorGlyph_drawInContext_withPaletteColors___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 56);
  double v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 40) firstObject];
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  return [(CUINamedVectorGlyph *)v3 _drawInContext:(uint64_t)v5 scaleFactor:0 targetSize:v2 primaryColor:v6 tertiaryColor:v7];
}

id __55__CUINamedVectorGlyph_drawInContext_withPaletteColors___block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = a1 + 32;
  double v3 = *(void **)(a1 + 32);
  if (*(void *)(v4 + 8) <= a3) {
    return [v3 lastObject];
  }
  else {
    return objc_msgSend(v3, "objectAtIndex:");
  }
}

- (id)graphicVariantWithOptions:(id)a3
{
  if (([a3 _areValid] & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CUINamedVectorGlyph.m", 2118, @"Invalid parameter not satisfying: %@", @"[options _areValid]" object file lineNumber description];
  }
  id v6 = [[_CUIGraphicVariantVectorGlyph alloc] _initWithBaseGlyph:self options:a3];
  return v6;
}

- (uint64_t)_prepareShapeNode:(uint64_t)a3 atNodeIndex:(void *)a4 forRenderingStyle:(uint64_t)a5 withColorResolver:
{
  if (!result) {
    return result;
  }
  uint64_t v8 = result;
  CGImageRef result = CGSVGNodeGetType();
  if (result != 2) {
    return result;
  }
  uint64_t AttributeMap = CGSVGNodeGetAttributeMap();
  uint64_t v10 = -[CUINamedVectorGlyph _fillColorOfStyle:](v8, AttributeMap);
  uint64_t v11 = (char *)[a4 rangeOfString:@":"];
  if (v12 == 1 && (double v13 = v11 + 1, v11 + 1 < (char *)[a4 length] - 1)) {
    double v14 = (__CFString *)[a4 substringFromIndex:v13];
  }
  else {
    double v14 = &stru_1EF488038;
  }
  id v15 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "_layerHierarchyStyleNames"), "indexOfObject:", v14);
  if ([(__CFString *)v14 isEqualToString:@"white"])
  {
    uint64_t SRGBWhite = _CUIColorGetSRGBWhite();
LABEL_12:
    uint64_t v10 = (const void *)SRGBWhite;
    goto LABEL_13;
  }
  if ([(__CFString *)v14 isEqualToString:@"black"])
  {
    uint64_t SRGBWhite = _CUIColorGetSRGBBlack();
    goto LABEL_12;
  }
LABEL_13:
  uint64_t v17 = (CGColor *)(*(uint64_t (**)(uint64_t, __CFString *, const void *, uint64_t, id, uint64_t, void))(a5 + 16))(a5, v14, v10, a3, v15, -1, 0);
  return -[CUINamedVectorGlyph _setFillColor:ofStyle:](v8, v17, AttributeMap);
}

- (const)_fillColorOfStyle:(uint64_t)a1
{
  double v2 = 0;
  if (a1 && a2)
  {
    if (CGSVGAttributeMapGetAttribute())
    {
      double v2 = 0;
      if (CGSVGAttributeGetPaint())
      {
        CGSVGPaintGetColor();
        CGColor = (const void *)CGSVGColorCreateCGColor();
        double v2 = CGColor;
        if (CGColor) {
          CFAutorelease(CGColor);
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

- (uint64_t)_setFillColor:(uint64_t)a3 ofStyle:
{
  if (result && a3)
  {
    if (a2)
    {
      SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
      uint64_t DisplayP3 = _CUIColorSpaceGetDisplayP3();
      uint64_t ExtendedRangeSRGB = _CUIColorSpaceGetExtendedRangeSRGB();
      CGColorSpaceRef ColorSpace = CGColorGetColorSpace(a2);
      if (ColorSpace == SRGB
        || ColorSpace == (CGColorSpaceRef)ExtendedRangeSRGB
        || ColorSpace == (CGColorSpaceRef)DisplayP3)
      {
        CopyByMatchingToCGColorSpaceRef ColorSpace = CGColorRetain(a2);
      }
      else
      {
        CopyByMatchingToCGColorSpaceRef ColorSpace = CGColorCreateCopyByMatchingToColorSpace(SRGB, kCGRenderingIntentDefault, a2, 0);
      }
      uint64_t v9 = CopyByMatchingToColorSpace;
      CGColorGetComponents(CopyByMatchingToColorSpace);
      CGSVGColorCreateRGBA();
      CGColorRelease(v9);
      CGSVGAttributeCreateWithColor();
      CGSVGAttributeMapSetAttribute();
      return CGSVGAttributeRelease();
    }
    else
    {
      return _CGSVGAttributeMapRemoveAttribute(a3, 18);
    }
  }
  return result;
}

- (void)_legacy_drawMonochromeLayerNamed:(id)a3 inContext:(CGContext *)a4 scaleFactor:(double)a5 targetSize:(CGSize)a6 onFillColor:(CGColor *)a7 offFillColor:(CGColor *)a8
{
  CGFloat v10 = a6.width * a5;
  CGFloat v11 = a6.height * a5;
  [(CUINamedVectorGlyph *)self referenceCanvasSize];
  double v13 = v12;
  double v15 = v14;
  CGContextSaveGState(a4);
  CGContextScaleCTM(a4, v10 / v13, v11 / v15);
  objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "svgDocument");
  CGContextDrawSVGDocument();
  CGContextRestoreGState(a4);
}

- (void)_legacy_drawMulticolorLayerNamed:(id)a3 inContext:(CGContext *)a4 scaleFactor:(double)a5 targetSize:(CGSize)a6 colorResolver:(id)a7
{
  double height = a6.height;
  double width = a6.width;
  if (objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "svgDocument"))
  {
    CGSVGDocumentGetRootNode();
    CGSVGNodeGetChildAtIndex();
    uint64_t ChildCount = CGSVGNodeGetChildCount();
    [(CUINamedVectorGlyph *)self referenceCanvasSize];
    double v16 = v15;
    double v18 = v17;
    CGContextSaveGState(a4);
    CGContextScaleCTM(a4, width * a5 / v16, height * a5 / v18);
    if (ChildCount)
    {
      for (uint64_t i = 0; i != ChildCount; ++i)
      {
        ChildAtIndeCGFloat x = CGSVGNodeGetChildAtIndex();
        if (CGSVGNodeGetType() == 2 && CGSVGNodeFindAttribute())
        {
          long long v21 = (void *)CGSVGAttributeCopyString();
          if ([v21 containsString:a3])
          {
            if (a7) {
              -[CUINamedVectorGlyph _prepareShapeNode:atNodeIndex:forRenderingStyle:withColorResolver:]((uint64_t)self, ChildAtIndex, i, a3, (uint64_t)a7);
            }
            CGContextDrawSVGNode();
          }
        }
      }
    }
    CGContextRestoreGState(a4);
  }
}

- (void)_legacy_drawHierarchicalLayerNamed:(id)a3 inContext:(CGContext *)a4 scaleFactor:(double)a5 targetSize:(CGSize)a6 colorResolver:(id)a7
{
  double height = a6.height;
  double width = a6.width;
  if ((*((unsigned char *)self + 104) & 4) != 0)
  {
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x3052000000;
    int v31 = __Block_byref_object_copy_;
    uint64_t v32 = __Block_byref_object_dispose_;
    uint64_t v33 = 0;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __105__CUINamedVectorGlyph__legacy_drawHierarchicalLayerNamed_inContext_scaleFactor_targetSize_colorResolver___block_invoke;
    v27[3] = &unk_1E5A514B0;
    v27[4] = a3;
    v27[5] = &v28;
    objc_msgSend(objc_msgSend(-[CUINamedVectorGlyph hierarchicalLayerGroup](self), "sublayers"), "enumerateObjectsUsingBlock:", v27);
    long long v22 = (void *)v29[5];
    if (v22)
    {
      [(CUINamedVectorGlyph *)self variableMinValue];
      double v24 = v23;
      [(CUINamedVectorGlyph *)self variableMaxValue];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = __105__CUINamedVectorGlyph__legacy_drawHierarchicalLayerNamed_inContext_scaleFactor_targetSize_colorResolver___block_invoke_2;
      v26[3] = &unk_1E5A514D8;
      v26[4] = a7;
      v26[5] = &v28;
      objc_msgSend(v22, "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:hierarchicalColorResolver:", a4, v26, a5, width, height, v24, v25);
    }
    _Block_object_dispose(&v28, 8);
  }
  else if (objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "svgDocument"))
  {
    CGSVGDocumentGetRootNode();
    CGSVGNodeGetChildAtIndex();
    uint64_t ChildCount = CGSVGNodeGetChildCount();
    [(CUINamedVectorGlyph *)self referenceCanvasSize];
    double v16 = v15;
    double v18 = v17;
    CGContextSaveGState(a4);
    CGContextScaleCTM(a4, width * a5 / v16, height * a5 / v18);
    if (ChildCount)
    {
      for (uint64_t i = 0; i != ChildCount; ++i)
      {
        ChildAtIndeCGFloat x = CGSVGNodeGetChildAtIndex();
        if (CGSVGNodeGetType() == 2 && CGSVGNodeFindAttribute())
        {
          long long v21 = (void *)CGSVGAttributeCopyString();
          if ([v21 containsString:a3])
          {
            if (a7) {
              -[CUINamedVectorGlyph _prepareShapeNode:atNodeIndex:forRenderingStyle:withColorResolver:]((uint64_t)self, ChildAtIndex, i, a3, (uint64_t)a7);
            }
            CGContextDrawSVGNode();
          }
        }
      }
    }
    CGContextRestoreGState(a4);
  }
}

id __105__CUINamedVectorGlyph__legacy_drawHierarchicalLayerNamed_inContext_scaleFactor_targetSize_colorResolver___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id result = objc_msgSend(objc_msgSend(a2, "name"), "isEqualToString:", *(void *)(a1 + 32));
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

uint64_t __105__CUINamedVectorGlyph__legacy_drawHierarchicalLayerNamed_inContext_scaleFactor_targetSize_colorResolver___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t SRGBBlack = _CUIColorGetSRGBBlack();
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v9 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16);
  return v9(v6, 0, SRGBBlack, a2, a3, -1, v8);
}

- (id)_createShapeGroupSubpaths
{
  [(CUINamedVectorGlyph *)self templateVersion];
  if (v3 < 5.0) {
    return 0;
  }
  id v5 = -[CUINamedVectorGlyph _getOutlineNodeForDocument:](self, "_getOutlineNodeForDocument:", objc_msgSend(-[CUINamedVectorGlyph _regularRendition](self, "_regularRendition"), "svgDocument"));
  uint64_t v6 = v5;
  if (self->_ultralightInterpolationSource && self->_blackInterpolationSource)
  {
    double v7 = (unsigned __int16 *)objc_msgSend(objc_msgSend(objc_loadWeak((id *)&self->_catalog), "_themeStore"), "renditionKeyForName:", -[CUINamedLookup name](self, "name"));
    CUIRenditionKeyValueForAttribute(v7, 17);
    [(CUINamedVectorGlyph *)self pointSize];
    [(CUINamedVectorGlyph *)self glyphContinuousSize];
    [(CUINamedVectorGlyph *)self glyphContinuousWeight];
    kdebug_trace();
    id v8 = objc_msgSend(-[CUINamedVectorGlyph _ultralightRendition](self, "_ultralightRendition"), "svgDocument");
    id v9 = objc_msgSend(-[CUINamedVectorGlyph _blackRendition](self, "_blackRendition"), "svgDocument");
    CGFloat v10 = [(CUINamedVectorGlyph *)self _getOutlineNodeForDocument:v8];
    CGFloat v11 = [(CUINamedVectorGlyph *)self _getOutlineNodeForDocument:v9];
    long long v22 = *(_OWORD *)&CGAffineTransformIdentity.c;
    long long v23 = *(_OWORD *)&CGAffineTransformIdentity.a;
    long long v21 = v23;
    long long v24 = v22;
    long long v25 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    long long v20 = v25;
    id v12 = CUICreatePathFromSVGNode(v10, &v23);
    long long v23 = v21;
    long long v24 = v22;
    long long v25 = v20;
    id v13 = CUICreatePathFromSVGNode(v6, &v23);
    long long v23 = v21;
    long long v24 = v22;
    long long v25 = v20;
    id v14 = CUICreatePathFromSVGNode(v11, &v23);
    [(CUINamedVectorGlyph *)self glyphContinuousWeight];
    double v16 = v15;
    [(CUINamedVectorGlyph *)self glyphContinuousSize];
    id v18 = [(CUINamedVectorGlyph *)self _interpolatedPathWithWeight:v12 glyphSize:v13 fromUltralightSmall:v14 regularSmall:v16 blackSmall:v17];

    id v4 = [v18 createSubpaths];
    kdebug_trace();
    return v4;
  }
  return CUICreateSubpathsFromSVGNode(v5);
}

+ (unsigned)_wiggleStyleAtom
{
  if (_wiggleStyleAtom_onceToken != -1) {
    dispatch_once(&_wiggleStyleAtom_onceToken, &__block_literal_global_141);
  }
  return _wiggleStyleAtom_wiggleStyleAtom;
}

uint64_t __39__CUINamedVectorGlyph__wiggleStyleAtom__block_invoke()
{
  uint64_t result = CGSVGAtomFromString();
  _wiggleStyleAtom_wiggleStyleAtom = result;
  return result;
}

+ (unsigned)_wiggleAngleAtom
{
  if (_wiggleAngleAtom_onceToken != -1) {
    dispatch_once(&_wiggleAngleAtom_onceToken, &__block_literal_global_143);
  }
  return _wiggleAngleAtom_wiggleAngleAtom;
}

uint64_t __39__CUINamedVectorGlyph__wiggleAngleAtom__block_invoke()
{
  uint64_t result = CGSVGAtomFromString();
  _wiggleAngleAtom_wiggleAngleAtom = result;
  return result;
}

+ (unsigned)_rotatesClockwiseAtom
{
  if (_rotatesClockwiseAtom_onceToken != -1) {
    dispatch_once(&_rotatesClockwiseAtom_onceToken, &__block_literal_global_145);
  }
  return _rotatesClockwiseAtom_rotateDirectionAtom;
}

uint64_t __44__CUINamedVectorGlyph__rotatesClockwiseAtom__block_invoke()
{
  uint64_t result = CGSVGAtomFromString();
  _rotatesClockwiseAtom_rotateDirectionAtom = result;
  return result;
}

+ (unsigned)_variableColorContinuousAtom
{
  if (_variableColorContinuousAtom_onceToken != -1) {
    dispatch_once(&_variableColorContinuousAtom_onceToken, &__block_literal_global_147);
  }
  return _variableColorContinuousAtom_variableColorLoopStyleAtom;
}

uint64_t __51__CUINamedVectorGlyph__variableColorContinuousAtom__block_invoke()
{
  uint64_t result = CGSVGAtomFromString();
  _variableColorContinuousAtom_variableColorLoopStyleAtom = result;
  return result;
}

+ (unsigned)_hasImageFillsAtom
{
  if (_hasImageFillsAtom_onceToken != -1) {
    dispatch_once(&_hasImageFillsAtom_onceToken, &__block_literal_global_149);
  }
  return _hasImageFillsAtom_hasImageFillsAtom;
}

uint64_t __41__CUINamedVectorGlyph__hasImageFillsAtom__block_invoke()
{
  uint64_t result = CGSVGAtomFromString();
  _hasImageFillsAtom_hasImageFillsAtom = result;
  return result;
}

+ (unsigned)_backgroundImageNamesAtom
{
  if (_backgroundImageNamesAtom_onceToken != -1) {
    dispatch_once(&_backgroundImageNamesAtom_onceToken, &__block_literal_global_151);
  }
  return _backgroundImageNamesAtom_backgroundImageNamesAtom;
}

uint64_t __48__CUINamedVectorGlyph__backgroundImageNamesAtom__block_invoke()
{
  uint64_t result = CGSVGAtomFromString();
  _backgroundImageNamesAtom_backgroundImageNamesAtom = result;
  return result;
}

+ (id)_colorStyleNames
{
  if (_colorStyleNames_onceToken != -1) {
    dispatch_once(&_colorStyleNames_onceToken, &__block_literal_global_153);
  }
  return (id)_colorStyleNames_colorStyleNames;
}

void *__39__CUINamedVectorGlyph__colorStyleNames__block_invoke()
{
  uint64_t result = &unk_1EF4A6BB8;
  _colorStyleNames_colorStyleNames = (uint64_t)result;
  return result;
}

+ (id)_knockoutStyleNames
{
  return +[NSArray array];
}

- (id)edgeDefinitionTextureWithBufferAllocator:(id)a3
{
  CUICurrentPlatform();
  [(CUINamedVectorGlyph *)self image];
  id v4 = (void *)CUICreateSDFEdgeTextureFromImage();
  return v4;
}

- (id)gradientTextureWithBufferAllocator:(id)a3
{
  CUICurrentPlatform();
  [(CUINamedVectorGlyph *)self image];
  id v4 = (void *)CUICreateSDFGradientTextureFromImage();
  return v4;
}

@end