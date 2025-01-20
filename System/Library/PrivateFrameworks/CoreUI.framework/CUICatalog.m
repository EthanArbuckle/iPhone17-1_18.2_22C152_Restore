@interface CUICatalog
+ (BOOL)isValidAssetStorageWithURL:(id)a3;
+ (BOOL)isValidLCRWithBytes:(const void *)a3 length:(unint64_t)a4;
+ (CGColor)newColorByAdjustingLightnessOfColor:(CGColor *)a3 darker:(BOOL)a4;
+ (id)bestMatchUsingImages:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6;
+ (id)bestMatchUsingImages:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(unint64_t)a7 layoutDirection:(unint64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10;
+ (id)bestMatchUsingImages:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8;
+ (id)bestMatchUsingImages:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 displayGamut:(unint64_t)a6 deviceSubtype:(unint64_t)a7 sizeClassHorizontal:(int64_t)a8 sizeClassVertical:(int64_t)a9;
+ (id)bestMatchUsingObjects:(id)a3 getAttributeValueUsing:(id)a4 scaleFactor:(double)a5 deviceIdiom:(int64_t)a6 deviceSubtype:(unint64_t)a7 displayGamut:(int64_t)a8 deploymentTarget:(int64_t)a9 layoutDirection:(int64_t)a10 sizeClassHorizontal:(int64_t)a11 sizeClassVertical:(int64_t)a12 memoryClass:(int64_t)a13 graphicsFeatureSetClass:(int64_t)a14 graphicsFallBackOrder:(id)a15 deviceSubtypeFallBackOrder:(id)a16;
+ (id)bestMatchUsingObjects:(id)a3 getAttributeValueUsing:(id)a4 scaleFactor:(double)a5 deviceIdiom:(int64_t)a6 deviceSubtype:(unint64_t)a7 displayGamut:(int64_t)a8 deploymentTarget:(int64_t)a9 layoutDirection:(int64_t)a10 sizeClassHorizontal:(int64_t)a11 sizeClassVertical:(int64_t)a12 memoryClass:(int64_t)a13 graphicsFeatureSetClass:(int64_t)a14 graphicsFallBackOrder:(id)a15 deviceSubtypeFallBackOrder:(id)a16 platform:(int64_t)a17;
+ (id)defaultUICatalogForBundle:(id)a3;
- ($01BB1521EC52D44A8E7628F5261DCEC8)styledInsetsForStylePresetName:(id)a3 styleConfiguration:(id)a4 foregroundColor:(CGColor *)a5 scale:(double)a6;
- (BOOL)_doStyledQuartzDrawingInContext:(CGContext *)a3 inBounds:(CGRect)a4 stylePresetName:(id)a5 styleConfiguration:(id)a6 drawingHandler:(id)a7;
- (BOOL)_effectStyle:(unint64_t *)a3 state:(int64_t *)a4 presentationState:(int64_t *)a5 value:(int64_t *)a6 resolution:(unint64_t *)a7 dimension1:(unint64_t *)a8 appearance:(int64_t *)a9 fromStyleConfiguration:(id)a10;
- (BOOL)canGetShapeEffectRenditionWithKey:(id)a3;
- (BOOL)containsLookupForName:(id)a3;
- (BOOL)drawGlyphs:(const unsigned __int16 *)a3 atPositions:(const CGPoint *)a4 inContext:(CGContext *)a5 withFont:(__CTFont *)a6 count:(unint64_t)a7 stylePresetName:(id)a8 styleConfiguration:(id)a9 foregroundColor:(CGColor *)a10;
- (BOOL)fillStyledPath:(CGPath *)a3 inContext:(CGContext *)a4 stylePresetName:(id)a5 styleConfiguration:(id)a6;
- (BOOL)fillStyledRect:(CGRect)a3 inContext:(CGContext *)a4 stylePresetName:(id)a5 styleConfiguration:(id)a6;
- (BOOL)hasStylePresetWithName:(id)a3;
- (BOOL)hasStylePresetWithName:(id)a3 styleConfiguration:(id)a4;
- (BOOL)imageExistsWithName:(id)a3;
- (BOOL)strokeStyledPath:(CGPath *)a3 inContext:(CGContext *)a4 stylePresetName:(id)a5 styleConfiguration:(id)a6;
- (CGColor)equivalentForegroundColorForStylePresetWithName:(id)a3 styleConfiguration:(id)a4;
- (CGColor)equivalentForegroundColorForStylePresetWithName:(id)a3 styleConfiguration:(id)a4 baseForegroundColor:(CGColor *)a5;
- (CGPDFDocument)pdfDocumentWithName:(id)a3;
- (CGPDFDocument)pdfDocumentWithName:(id)a3 appearanceName:(id)a4;
- (CUICatalog)initWithBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (CUICatalog)initWithName:(id)a3 fromBundle:(id)a4;
- (CUICatalog)initWithName:(id)a3 fromBundle:(id)a4 error:(id *)a5;
- (CUICatalog)initWithURL:(id)a3 error:(id *)a4;
- (id)_baseAtlasContentsKeyForName:(id)a3;
- (id)_baseAtlasKeyForName:(id)a3;
- (id)_baseColorKeyForName:(id)a3;
- (id)_baseImageKeyForName:(id)a3;
- (id)_baseKeyForName:(id)a3;
- (id)_baseModelForKeyForName:(id)a3;
- (id)_baseMultisizeImageSetKeyForName:(id)a3;
- (id)_baseRecognitionGroupImageSetKeyForName:(id)a3;
- (id)_baseRecognitionObjectKeyForName:(id)a3;
- (id)_baseStackKeyForName:(id)a3;
- (id)_baseTextureKeyForName:(id)a3;
- (id)_baseVectorGlyphForName:(id)a3;
- (id)_baseVectorRenditionKey:(id)a3;
- (id)_dataWithName:(id)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 memoryClass:(unint64_t)a6 graphicsClass:(unint64_t)a7 appearanceIdentifier:(int64_t)a8 graphicsFallBackOrder:(id)a9 deviceSubtypeFallBackOrder:(id)a10;
- (id)_defaultAssetRenditionKey:(id)a3;
- (id)_defaultLayerStackWithScaleFactor:(double)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 sizeClassHorizontal:(int64_t)a6 sizeClassVertical:(int64_t)a7;
- (id)_defaultNamedAssetWithScaleFactor:(double)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 sizeClassHorizontal:(int64_t)a6 sizeClassVertical:(int64_t)a7;
- (id)_imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 memoryClass:(unint64_t)a11 graphicsClass:(unint64_t)a12 appearanceIdentifier:(int64_t)a13 graphicsFallBackOrder:(id)a14 deviceSubtypeFallBackOrder:(id)a15 locale:(id)a16;
- (id)_layerStackWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8;
- (id)_modelWithName:(id)a3;
- (id)_nameForAppearanceIdentifier:(int64_t)a3;
- (id)_nameForLocalizationIdentifier:(int64_t)a3;
- (id)_namedImageAtlasWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 displayGamut:(int64_t)a6 deviceSubtype:(unint64_t)a7 memoryClass:(unint64_t)a8 graphicsClass:(unint64_t)a9 graphicsFallBackOrder:(id)a10 deviceSubtypeFallBackOrder:(id)a11;
- (id)_namedLookupWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceName:(id)a11 locale:(id)a12;
- (id)_namedTextureWithName:(id)a3 scaleFactor:(double)a4 appearanceName:(id)a5;
- (id)_namedTextureWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 appearanceName:(id)a6;
- (id)_namedVectorImageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceIdentifier:(int64_t)a11 locale:(id)a12;
- (id)_private_resolvedRenditionKeyFromThemeRef:(void *)a3 withBaseKey:(id)a4 scaleFactor:(uint64_t)a5 deviceIdiom:(void *)a6 deviceSubtype:(uint64_t)a7 displayGamut:(uint64_t)a8 layoutDirection:(double)a9 sizeClassHorizontal:(uint64_t)a10 sizeClassVertical:(uint64_t)a11 memoryClass:(uint64_t)a12 graphicsClass:(void *)a13 graphicsFallBackOrder:(void *)a14 deviceSubtypeFallBackOrder:(uint64_t)a15 localizationIdentifier:(uint64_t)a16 adjustRenditionKeyWithBlock:;
- (id)_recognitionImageWithName:(id)a3;
- (id)_recognitionObjectWithName:(id)a3;
- (id)_resolvedRenditionKeyForName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 memoryClass:(unint64_t)a11 graphicsClass:(unint64_t)a12 graphicsFallBackOrder:(id)a13 deviceSubtypeFallBackOrder:(id)a14 locale:(id)a15 withBaseKeySelector:(SEL)a16 adjustRenditionKeyWithBlock:(id)a17;
- (id)_resolvedRenditionKeyFromThemeRef:(unint64_t)a3 withBaseKey:(id)a4 scaleFactor:(double)a5 deviceIdiom:(int64_t)a6 deviceSubtype:(unint64_t)a7 displayGamut:(int64_t)a8 layoutDirection:(int64_t)a9 sizeClassHorizontal:(int64_t)a10 sizeClassVertical:(int64_t)a11 memoryClass:(unint64_t)a12 graphicsClass:(unint64_t)a13 graphicsFallBackOrder:(id)a14 deviceSubtypeFallBackOrder:(id)a15 locale:(id)a16 adjustRenditionKeyWithBlock:(id)a17;
- (id)_themeStore;
- (id)allImageNames;
- (id)appearanceNames;
- (id)colorWithName:(id)a3 displayGamut:(int64_t)a4;
- (id)colorWithName:(id)a3 displayGamut:(int64_t)a4 appearanceName:(id)a5;
- (id)colorWithName:(id)a3 displayGamut:(int64_t)a4 deviceIdiom:(int64_t)a5;
- (id)colorWithName:(id)a3 displayGamut:(int64_t)a4 deviceIdiom:(int64_t)a5 appearanceName:(id)a6;
- (id)compositingFilterForStylePresetWithName:(id)a3 styleConfiguration:(id)a4;
- (id)compositingFilterForStylePresetWithName:(id)a3 styleConfiguration:(id)a4 foregroundColor:(CGColor *)a5;
- (id)dataWithName:(id)a3;
- (id)dataWithName:(id)a3 appearanceName:(id)a4;
- (id)dataWithName:(id)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 memoryClass:(unint64_t)a6 graphicsClass:(unint64_t)a7 appearanceIdentifier:(int64_t)a8 graphicsFallBackOrder:(id)a9 deviceSubtypeFallBackOrder:(id)a10;
- (id)dataWithName:(id)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 memoryClass:(unint64_t)a6 graphicsClass:(unint64_t)a7 graphicsFallBackOrder:(id)a8 deviceSubtypeFallBackOrder:(id)a9;
- (id)debugDescription;
- (id)defaultLayerStackWithScaleFactor:(double)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 sizeClassHorizontal:(int64_t)a6 sizeClassVertical:(int64_t)a7;
- (id)defaultNamedAssetWithScaleFactor:(double)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 sizeClassHorizontal:(int64_t)a6 sizeClassVertical:(int64_t)a7;
- (id)iconImageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 desiredSize:(CGSize)a11;
- (id)iconImageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 desiredSize:(CGSize)a11 appearanceName:(id)a12;
- (id)iconImageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(unint64_t)a5 layoutDirection:(int64_t)a6 desiredSize:(CGSize)a7;
- (id)iconImageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(unint64_t)a5 layoutDirection:(int64_t)a6 desiredSize:(CGSize)a7 appearanceName:(id)a8;
- (id)imageByStylingImage:(CGImage *)a3 stylePresetName:(id)a4 styleConfiguration:(id)a5 foregroundColor:(CGColor *)a6 scale:(double)a7;
- (id)imageWithName:(id)a3 scaleFactor:(double)a4;
- (id)imageWithName:(id)a3 scaleFactor:(double)a4 appearanceName:(id)a5;
- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5;
- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 appearanceName:(id)a6;
- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6;
- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 appearanceName:(id)a7;
- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10;
- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceName:(id)a11;
- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceName:(id)a11 locale:(id)a12;
- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 memoryClass:(int64_t)a11 graphicsClass:(int64_t)a12;
- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 memoryClass:(unint64_t)a11 graphicsClass:(unint64_t)a12 appearanceIdentifier:(int64_t)a13 graphicsFallBackOrder:(id)a14 deviceSubtypeFallBackOrder:(id)a15;
- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 memoryClass:(unint64_t)a11 graphicsClass:(unint64_t)a12 appearanceIdentifier:(int64_t)a13 graphicsFallBackOrder:(id)a14 deviceSubtypeFallBackOrder:(id)a15 locale:(id)a16;
- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 memoryClass:(unint64_t)a11 graphicsClass:(unint64_t)a12 graphicsFallBackOrder:(id)a13 deviceSubtypeFallBackOrder:(id)a14;
- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8;
- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8 appearanceName:(id)a9;
- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 layoutDirection:(int64_t)a6 locale:(id)a7 adjustRenditionKeyWithBlock:(id)a8;
- (id)imageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 layoutDirection:(int64_t)a6;
- (id)imageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 layoutDirection:(int64_t)a6 appearanceName:(id)a7;
- (id)imageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 layoutDirection:(int64_t)a6 appearanceName:(id)a7 locale:(id)a8;
- (id)imageWithName:(id)a3 scaleFactor:(double)a4 locale:(id)a5;
- (id)imagesWithName:(id)a3;
- (id)layerStackWithName:(id)a3;
- (id)layerStackWithName:(id)a3 scaleFactor:(double)a4;
- (id)layerStackWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5;
- (id)layerStackWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8;
- (id)localObjectCache;
- (id)lookupCache;
- (id)modelWithName:(id)a3;
- (id)namedImageAtlasWithName:(id)a3 scaleFactor:(double)a4;
- (id)namedImageAtlasWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5;
- (id)namedImageAtlasWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 displayGamut:(int64_t)a6 deviceSubtype:(unint64_t)a7 memoryClass:(unint64_t)a8 graphicsClass:(unint64_t)a9 graphicsFallBackOrder:(id)a10 deviceSubtypeFallBackOrder:(id)a11;
- (id)namedImageAtlasWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(unint64_t)a5;
- (id)namedLookupWithName:(id)a3 scaleFactor:(double)a4;
- (id)namedLookupWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10;
- (id)namedLookupWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceName:(id)a11;
- (id)namedLookupWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceName:(id)a11 locale:(id)a12;
- (id)namedLookupWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8;
- (id)namedRecognitionGroupWithName:(id)a3;
- (id)namedTextureWithName:(id)a3 scaleFactor:(double)a4;
- (id)namedTextureWithName:(id)a3 scaleFactor:(double)a4 appearanceName:(id)a5;
- (id)namedTextureWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5;
- (id)namedTextureWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 appearanceName:(id)a6;
- (id)namedVectorGlyphWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 glyphSize:(int64_t)a6 glyphWeight:(int64_t)a7 glyphPointSize:(double)a8 appearanceName:(id)a9;
- (id)namedVectorGlyphWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 layoutDirection:(int64_t)a6 glyphContinuousSize:(double)a7 glyphContinuousWeight:(double)a8 glyphPointSize:(double)a9 appearanceName:(id)a10 locale:(id)a11;
- (id)namedVectorGlyphWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 layoutDirection:(int64_t)a6 glyphSize:(int64_t)a7 glyphWeight:(int64_t)a8 glyphPointSize:(double)a9 appearanceName:(id)a10;
- (id)namedVectorGlyphWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 layoutDirection:(int64_t)a6 glyphSize:(int64_t)a7 glyphWeight:(int64_t)a8 glyphPointSize:(double)a9 appearanceName:(id)a10 locale:(id)a11;
- (id)namedVectorImageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10;
- (id)namedVectorImageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceName:(id)a11;
- (id)namedVectorImageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceName:(id)a11 locale:(id)a12;
- (id)namedVectorImageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 layoutDirection:(int64_t)a6;
- (id)namedVectorImageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 layoutDirection:(int64_t)a6 appearanceName:(id)a7;
- (id)namedVectorImageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 layoutDirection:(int64_t)a6 appearanceName:(id)a7 locale:(id)a8;
- (id)negativeCache;
- (id)newShapeEffectPresetForStylePresetName:(id)a3 styleConfiguration:(id)a4;
- (id)newShapeEffectPresetWithRenditionKey:(id)a3;
- (id)newShapeEffectStackForStylePresetName:(id)a3 styleConfiguration:(id)a4 foregroundColor:(CGColor *)a5;
- (id)newTextEffectStackForStylePresetName:(id)a3 styleConfiguration:(id)a4 foregroundColor:(CGColor *)a5;
- (id)parentNamedImageAtlasForImageNamed:(id)a3 scaleFactor:(double)a4 displayGamut:(unint64_t)a5;
- (id)parentNamedImageAtlastForImageNamed:(id)a3 scaleFactor:(double)a4;
- (id)renditionKeyForShapeEffectPresetForStylePresetName:(id)a3 styleConfiguration:(id)a4;
- (id)renditionKeyForShapeEffectPresetWithStyleID:(unint64_t)a3 state:(int64_t)a4 presentationState:(int64_t)a5 value:(int64_t)a6 resolution:(unint64_t)a7 dimension1:(unint64_t)a8;
- (id)renditionKeyForShapeEffectPresetWithStylePresetName:(id)a3 state:(int64_t)a4 presentationState:(int64_t)a5 value:(int64_t)a6 resolution:(unint64_t)a7 dimension1:(unint64_t)a8 appearance:(int64_t)a9;
- (id)textStyleWithName:(id)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 displayGamut:(int64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8;
- (id)textStyleWithName:(id)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 displayGamut:(int64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8 appearanceName:(id)a9;
- (id)textStyleWithName:(id)a3 displayGamut:(int64_t)a4;
- (id)textStyleWithName:(id)a3 displayGamut:(int64_t)a4 appearanceName:(id)a5;
- (int)blendModeForStylePresetWithName:(id)a3 styleConfiguration:(id)a4;
- (int64_t)platform;
- (unint64_t)_storageRefForRendition:(id)a3 representsODRContent:(BOOL *)a4;
- (unint64_t)_themeRef;
- (unint64_t)storageRef;
- (void)_resolveInterpolationSourceRenditionKeysUltralight:(id *)a3 regular:(id *)a4 black:(id *)a5 forName:(id)a6 scaleFactor:(double)a7 deviceIdiom:(int64_t)a8 deviceSubtype:(unint64_t)a9 displayGamut:(int64_t)a10 layoutDirection:(int64_t)a11 sizeClassHorizontal:(int64_t)a12 sizeClassVertical:(int64_t)a13 memoryClass:(unint64_t)a14 graphicsClass:(unint64_t)a15 graphicsFallBackOrder:(id)a16 deviceSubtypeFallBackOrder:(id)a17 appearanceIdentifier:(int64_t)a18 locale:(id)a19;
- (void)_resourceUnPinnedNotification:(id)a3;
- (void)_setPreferredLocalization:(id)a3;
- (void)_vibrantColorMatrixBrightnessSaturationForColor:(CGColor *)a3 saturation:(double *)a4 brightness:(double *)a5;
- (void)clearCachedImageResources;
- (void)dealloc;
- (void)enumerateNamedLookupsUsingBlock:(id)a3;
- (void)finalizeNamedVectorGlyphLookupWithResult:(id)a3 name:(id)a4 glyphContinuousSize:(double)a5 glyphContinuousWeight:(double)a6 pointSize:(double)a7;
- (void)preloadNamedAtlasWithScaleFactor:(double)a3 andNames:(id)a4 completionHandler:(id)a5;
- (void)setStorageRef:(unint64_t)a3;
@end

@implementation CUICatalog

- (id)_private_resolvedRenditionKeyFromThemeRef:(void *)a3 withBaseKey:(id)a4 scaleFactor:(uint64_t)a5 deviceIdiom:(void *)a6 deviceSubtype:(uint64_t)a7 displayGamut:(uint64_t)a8 layoutDirection:(double)a9 sizeClassHorizontal:(uint64_t)a10 sizeClassVertical:(uint64_t)a11 memoryClass:(uint64_t)a12 graphicsClass:(void *)a13 graphicsFallBackOrder:(void *)a14 deviceSubtypeFallBackOrder:(uint64_t)a15 localizationIdentifier:(uint64_t)a16 adjustRenditionKeyWithBlock:
{
  uint64_t v93 = a5;
  if (!a1) {
    return 0;
  }
  uint64_t v22 = a10;
  unint64_t v90 = 0;
  unint64_t v91 = 0;
  uint64_t v73 = CUIMaxScaleForTargetPlatform((uint64_t)[a1 platform]);
  uint64_t v23 = CUICurrentDeploymentVersionForTargetPlatform();
  v24 = (char *)[a13 count];
  v74 = (char *)[a14 count];
  objc_msgSend(+[CUIRuntimeStatistics sharedRuntimeStatistics](CUIRuntimeStatistics, "sharedRuntimeStatistics"), "incrementStaticsInitialLookup");
  uint64_t v87 = a12;
  v83 = v24;
  if (a12 && !v24)
  {
    _CUILog(4, (uint64_t)"-[CUICatalog _resolvedRenditionKeyFromThemeRef:...] got passed a graphicsClass '%d' but No graphicsFallbacks ignoring the graphicsClass", v25, v26, v27, v28, v29, v30, a12);
    uint64_t v87 = 0;
  }
  CUIValidateIdiomSubtypes((uint64_t)a4, &v93, v25, v26, v27, v28, v29, v30);
  uint64_t v32 = 0;
  uint64_t v84 = (uint64_t)a9;
  uint64_t v78 = v93;
  uint64_t v92 = v23;
  while (__memorySearchValues[v32] != a11)
  {
    if (++v32 == 9)
    {
      uint64_t v32 = 0;
      break;
    }
  }
  v33 = (void *)_LookupStructuredThemeProvider(a2, v31);
  id v34 = [a3 copy];
  [v34 setThemeMemoryClass:__memorySearchValues[v32]];
  [v34 setThemeScale:v84];
  [v34 setThemeIdiom:a4];
  [v34 setThemeSubtype:v78];
  [v34 setThemeDisplayGamut:a6];
  [v34 setThemeDeploymentTarget:v92];
  [v34 setThemeDirection:a7];
  [v34 setThemeSizeClassHorizontal:a8];
  [v34 setThemeSizeClassVertical:a10];
  [v34 setThemeGraphicsClass:v87];
  [v34 setThemeLocalization:a15];
  if (a16) {
    (*(void (**)(void))(a16 + 16))();
  }
  id v35 = objc_msgSend(v33, "copyLookupKeySignatureForKey:", objc_msgSend(v34, "keyList"));

  id v36 = [a1 lookupCache];
  id v37 = [a1 negativeCache];
  id v38 = [v36 objectForKey:v35];
  if (v38)
  {
    id v39 = v38;

    return v39;
  }
  v72 = v36;
  if ([v37 objectForKey:v35])
  {

    return 0;
  }
  v69 = v37;
  v71 = v35;
  id v77 = objc_msgSend(v33, "renditionInfoForIdentifier:", (unsigned __int16)objc_msgSend(a3, "themeIdentifier"));
  if (!v77)
  {
    uint64_t v43 = a7;
    uint64_t v40 = v87;
    uint64_t v41 = v78;
    id v42 = a6;
    if (v32 < 0) {
      goto LABEL_139;
    }
    goto LABEL_48;
  }
  uint64_t v40 = v87;
  uint64_t v41 = v78;
  id v42 = a6;
  if (v78 && ![v77 diverseContentPresentForAttribute:16]) {
    uint64_t v41 = 0;
  }
  if (a8 && ![v77 diverseContentPresentForAttribute:20]) {
    a8 = 0;
  }
  if (a10 && ![v77 diverseContentPresentForAttribute:21]) {
    uint64_t v22 = 0;
  }
  if (a6 && ![v77 diverseContentPresentForAttribute:24]) {
    id v42 = 0;
  }
  if (v92)
  {
    if ([v77 diverseContentPresentForAttribute:25])
    {
      if (![v77 attributePresent:25 withValue:(unsigned __int16)v92])
      {
        --v92;
        [v77 decrementValue:&v92 forAttribute:25];
      }
    }
    else
    {
      uint64_t v92 = 0;
    }
  }
  if (v32 && ![v77 diverseContentPresentForAttribute:22]) {
    uint64_t v32 = 0;
  }
  if (v87 && ![v77 diverseContentPresentForAttribute:23]) {
    uint64_t v40 = 0;
  }
  if (!a7)
  {
    uint64_t v43 = 0;
    if (v32 < 0) {
      goto LABEL_139;
    }
    goto LABEL_48;
  }
  unsigned int v44 = [v77 diverseContentPresentForAttribute:4];
  uint64_t v43 = a7;
  if (!v44) {
    uint64_t v43 = 0;
  }
  if ((v32 & 0x8000000000000000) == 0)
  {
LABEL_48:
    v79 = (void *)v41;
    uint64_t v88 = v40;
    uint64_t v45 = 0;
    uint64_t v46 = v22 | a8;
    uint64_t v47 = 4;
    if (v22 | a8) {
      uint64_t v48 = 1;
    }
    else {
      uint64_t v48 = 4;
    }
    uint64_t v76 = v48;
    uint64_t v86 = v43;
    if (v43 == 4) {
      uint64_t v47 = 5;
    }
    uint64_t v70 = v47;
    uint64_t v68 = (uint64_t)a9;
    while (1)
    {
      unint64_t v90 = 0x7FFFFFFFFFFFFFFFLL;
      id v49 = v79;
      while (2)
      {
        id v50 = v49;
        [a3 setThemeDeploymentTarget:v92];
        uint64_t v80 = __memorySearchValues[v32];
        objc_msgSend(a3, "setThemeMemoryClass:");
        id v82 = v50;
        [a3 setThemeSubtype:v50];
        [a3 setThemeGraphicsClass:v88];
        [a3 setThemeScale:v84];
        [a3 setThemeIdiom:a4];
        [a3 setThemeDisplayGamut:v42];
        [a3 setThemeDirection:v86];
        [a3 setThemeSizeClassHorizontal:a8];
        [a3 setThemeSizeClassVertical:v22];
        [a3 setThemeLocalization:a15];
        if (a16) {
          (*(void (**)(void))(a16 + 16))();
        }
        unint64_t v91 = 0x7FFFFFFFFFFFFFFFLL;
        while (2)
        {
          if (objc_msgSend(v33, "canGetRenditionWithKey:", objc_msgSend(a3, "keyList")))
          {
LABEL_59:
            uint64_t v51 = v45;
LABEL_60:
            if (!a3)
            {
              char v52 = 1;
              uint64_t v45 = v51;
              goto LABEL_62;
            }
            id v39 = [a3 copy];
            [v72 setObject:v39 forKey:v71];

            id v66 = v39;
            return v39;
          }
          uint64_t v75 = -1;
          uint64_t v55 = v76;
          while (1)
          {
            while (1)
            {
              while (1)
              {
                if (v55 == 3)
                {
                  [a3 setThemeSizeClassVertical:0];
                  [a3 setThemeSizeClassHorizontal:0];
LABEL_74:
                  uint64_t v55 = 4;
                  goto LABEL_86;
                }
                if (v55 == 2)
                {
                  [a3 setThemeSizeClassVertical:v22];
                  [a3 setThemeSizeClassHorizontal:0];
                  uint64_t v55 = 3;
                  goto LABEL_86;
                }
                if (v55 != 1) {
                  break;
                }
                [a3 setThemeSizeClassVertical:0];
                [a3 setThemeSizeClassHorizontal:a8];
                uint64_t v55 = 2;
LABEL_86:
                if (objc_msgSend(v33, "canGetRenditionWithKey:", objc_msgSend(a3, "keyList"))) {
                  goto LABEL_59;
                }
              }
              if (a4 && [a3 themeIdiom] == a4)
              {
                [a3 setThemeIdiom:0];
                if (v46)
                {
                  [a3 setThemeSizeClassVertical:v22];
                  [a3 setThemeSizeClassHorizontal:a8];
                  uint64_t v55 = 1;
                  goto LABEL_86;
                }
                goto LABEL_74;
              }
              if (v42 && [a3 themeDisplayGamut] == v42)
              {
                [a3 setThemeDisplayGamut:0];
                if (v46)
                {
                  [a3 setThemeSizeClassVertical:v22];
                  [a3 setThemeSizeClassHorizontal:a8];
                  uint64_t v55 = 1;
                }
                else
                {
                  uint64_t v55 = 4;
                }
                [a3 setThemeIdiom:a4];
                goto LABEL_86;
              }
              if (!v86 || ![a3 themeDirection]) {
                break;
              }
              if (v45) {
                uint64_t v56 = 0;
              }
              else {
                uint64_t v56 = v70;
              }
              [a3 setThemeDirection:v56];
              if (v46)
              {
                [a3 setThemeSizeClassVertical:v22];
                [a3 setThemeSizeClassHorizontal:a8];
                uint64_t v55 = 1;
              }
              else
              {
                uint64_t v55 = 4;
              }
              [a3 setThemeIdiom:a4];
              [a3 setThemeDisplayGamut:v42];
              uint64_t v45 = 1;
LABEL_103:
              if (objc_msgSend(v33, "canGetRenditionWithKey:", objc_msgSend(a3, "keyList"))) {
                goto LABEL_59;
              }
            }
            if (v92 && [a3 themeDeploymentTarget])
            {
              v89 = 0;
              v89 = (char *)[a3 themeDeploymentTarget];
              [a3 setThemeIdiom:a4];
              [a3 setThemeDisplayGamut:v42];
              [a3 setThemeDirection:v86];
              if (v46)
              {
                [a3 setThemeSizeClassVertical:v22];
                [a3 setThemeSizeClassHorizontal:a8];
                uint64_t v55 = 1;
              }
              else
              {
                uint64_t v55 = 4;
              }
              --v89;
              [v77 decrementValue:&v89 forAttribute:25];
              [a3 setThemeDeploymentTarget:v89];
              uint64_t v45 = 0;
              goto LABEL_103;
            }
            [a3 setThemeIdiom:a4];
            [a3 setThemeDisplayGamut:v42];
            [a3 setThemeDirection:v86];
            if (v46)
            {
              [a3 setThemeSizeClassVertical:v22];
              [a3 setThemeSizeClassHorizontal:a8];
              uint64_t v55 = 1;
            }
            else
            {
              uint64_t v55 = 4;
            }
            [a3 setThemeDeploymentTarget:v92];
            uint64_t v57 = v75 + v68;
            if (v75 < 0)
            {
              BOOL v58 = v57 < 1;
              if (v57 < 1) {
                uint64_t v57 = (uint64_t)a9;
              }
              uint64_t v59 = 1;
              if (!v58) {
                uint64_t v59 = -1;
              }
              uint64_t v75 = v59;
              goto LABEL_116;
            }
            if (v57 > v73) {
              break;
            }
LABEL_116:
            uint64_t v68 = v57;
            objc_msgSend(a3, "setThemeScale:");
            unsigned __int8 v60 = objc_msgSend(v33, "canGetRenditionWithKey:", objc_msgSend(a3, "keyList"));
            uint64_t v45 = 0;
            uint64_t v51 = 0;
            if (v60) {
              goto LABEL_60;
            }
          }
          v68 += v75;
          char v52 = 0;
          uint64_t v45 = 0;
LABEL_62:
          [a3 setThemeDeploymentTarget:v92];
          [a3 setThemeMemoryClass:v80];
          [a3 setThemeSubtype:v82];
          [a3 setThemeGraphicsClass:v88];
          [a3 setThemeScale:v84];
          [a3 setThemeIdiom:a4];
          [a3 setThemeDisplayGamut:v42];
          [a3 setThemeDeploymentTarget:v92];
          [a3 setThemeDirection:v86];
          [a3 setThemeSizeClassHorizontal:a8];
          [a3 setThemeSizeClassVertical:v22];
          [a3 setThemeLocalization:a15];
          if (a16) {
            (*(void (**)(void))(a16 + 16))();
          }
          if (v88)
          {
            if (v83)
            {
              if (v91 == 0x7FFFFFFFFFFFFFFFLL)
              {
                unint64_t v53 = 0;
                unint64_t v91 = 0;
                v54 = a13;
                goto LABEL_122;
              }
              if (v91 < (unint64_t)(v83 - 1))
              {
                ++v91;
                v54 = a13;
                [v77 incrementIndex:&v91 inValues:a13 forAttribute:23];
                unint64_t v53 = v91;
LABEL_122:
                id v61 = objc_msgSend(objc_msgSend(v54, "objectAtIndex:", v53), "integerValue");
LABEL_123:
                [a3 setThemeGraphicsClass:v61];
                continue;
              }
            }
            else if ([a3 themeGraphicsClass])
            {
              id v61 = 0;
              goto LABEL_123;
            }
          }
          break;
        }
        if (v79)
        {
          if (v74)
          {
            if (v90 == 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v62 = 0;
              unint64_t v90 = 0;
              v63 = a14;
LABEL_132:
              id v49 = objc_msgSend(objc_msgSend(v63, "objectAtIndex:", v62), "integerValue");
              continue;
            }
            if (v90 < (unint64_t)(v74 - 1))
            {
              ++v90;
              v63 = a14;
              [v77 incrementIndex:&v90 inValues:a14 forAttribute:16];
              unint64_t v62 = v90;
              goto LABEL_132;
            }
          }
          else
          {
            id v49 = 0;
            if (v82) {
              continue;
            }
          }
        }
        break;
      }
      BOOL v58 = v32-- <= 0;
      if (v58)
      {
        char v64 = v52 ^ 1;
        if (!a3) {
          char v64 = 1;
        }
        if ((v64 & 1) == 0)
        {
          id v39 = [a3 copy];
          [v72 setObject:v39 forKey:v71];
          id v65 = v39;
          if (v39) {
            goto LABEL_140;
          }
        }
        break;
      }
    }
  }
LABEL_139:
  [v69 setObject:v71 forKey:v71];
  id v39 = 0;
LABEL_140:

  return v39;
}

- (int64_t)platform
{
  v2 = (void *)_LookupStructuredThemeProvider(self->_storageRef, a2);
  return (int64_t)[v2 deploymentPlatform];
}

id __68__CUICatalog_colorWithName_displayGamut_deviceIdiom_appearanceName___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setThemeAppearance:*(void *)(a1 + 32)];
}

id __162__CUICatalog__namedLookupWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_appearanceName_locale___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setThemeAppearance:*(void *)(a1 + 32)];
}

id __173__CUICatalog__namedVectorImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_appearanceIdentifier_locale___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setThemeAppearance:*(void *)(a1 + 32)];
}

id __150__CUICatalog__dataWithName_deviceIdiom_deviceSubtype_memoryClass_graphicsClass_appearanceIdentifier_graphicsFallBackOrder_deviceSubtypeFallBackOrder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setThemeAppearance:*(void *)(a1 + 32)];
}

id __237__CUICatalog__imageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_memoryClass_graphicsClass_appearanceIdentifier_graphicsFallBackOrder_deviceSubtypeFallBackOrder_locale___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setThemeAppearance:*(void *)(a1 + 32)];
}

id __173__CUICatalog__namedVectorImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_appearanceIdentifier_locale___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setThemeAppearance:*(void *)(a1 + 32)];
}

- (id)namedLookupWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceName:(id)a11 locale:(id)a12
{
  CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace();
  id v20 = [(CUICatalog *)self _namedLookupWithName:a3 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:a7 displayGamut:a8 layoutDirection:a9 sizeClassHorizontal:a4 sizeClassVertical:a10 appearanceName:a11 locale:a12];
  kdebug_trace();
  return v20;
}

- (id)_namedLookupWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceName:(id)a11 locale:(id)a12
{
  unsigned __int8 v54 = 0;
  _CUILog(3, (uint64_t)"-[CUICatalog _namedLookupWithName:%@ scaleFactor:%f deviceIdiom:%d deviceSubtype:%d displayGamut:%d layoutDirection:%d sizeClassHorizontal:%d sizeClassVertical:%d appearanceName:%@]", (uint64_t)a3, a5, a6, a7, a8, a9, (uint64_t)a3);
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  uint64_t v19 = __getDeviceTraits___deviceMemoryClass;
  uint64_t v20 = __getDeviceTraits___deviceGraphicsClass;
  uint64_t v21 = __getDeviceTraits___deviceGraphicsFallbackOrder;
  if (__getDeviceTraits___deviceIdiom == a5)
  {
    id v49 = (NSArray *)__getDeviceTraits___deviceSubtypeFallbackOrder;
  }
  else
  {
    uint64_t v55 = +[NSNumber numberWithInt:0];
    id v49 = +[NSArray arrayWithObjects:&v55 count:1];
    _CUILog(3, (uint64_t)"-[CUICatalog _namedLookupWithName]: '%@' using deviceSubtype=%lu and universal subtype fallback instead [%s:%d]", v22, v23, v24, v25, v26, v27, (uint64_t)a3);
  }
  uint64_t v28 = 0;
  if (self && a11) {
    uint64_t v28 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, v18), "appearanceIdentifierForName:", a11);
  }
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = __162__CUICatalog__namedLookupWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_appearanceName_locale___block_invoke;
  v53[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v53[4] = v28;
  id v29 = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, a5, a6, a7, a8, a9, a4, a10, v19, v20, v21, v49, a12, 0, v53,
          a11);
  if (!v29) {
    goto LABEL_12;
  }
  id v36 = v29;
  unint64_t v37 = [(CUICatalog *)self _storageRefForRendition:v29 representsODRContent:&v54];
  if (v37 == 0x7FFFFFFFFFFFFFFFLL)
  {
    _CUILog(4, (uint64_t)"CoreUI: -[CUICatalog _namedLookupWithName]: Cannot find themeRef while resolving key for name '%@' with subtype %u. [%s:%d]", v38, v39, v40, v41, v42, v43, (uint64_t)a3);
LABEL_12:
    _CUILog(3, (uint64_t)"CoreUI: -[CUICatalog _namedLookupWithName]: Cannot resolve key for name '%@' with subtype %u. [%s:%d]", v30, v31, v32, v33, v34, v35, (uint64_t)a3);
    return 0;
  }
  unint64_t v45 = v37;
  uint64_t v46 = [[CUINamedImage alloc] initWithName:a3 usingRenditionKey:v36 fromTheme:v37];
  id v47 = [(CUIThemeRendition *)[(CUINamedLookup *)v46 _rendition] type];
  if (v47 == (id)1002 || v47 == (id)1018)
  {
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = __162__CUICatalog__namedLookupWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_appearanceName_locale___block_invoke_3;
    v52[3] = &unk_1E5A5F3E8;
    *(double *)&v52[8] = a4;
    v52[9] = a5;
    v52[10] = a6;
    v52[11] = a7;
    v52[12] = a8;
    v52[13] = a9;
    v52[14] = a10;
    v52[4] = self;
    v52[5] = v49;
    v52[6] = a12;
    v52[7] = v45;
    uint64_t v48 = (CUINamedImage *)[objc_alloc((Class)objc_opt_class()) initWithName:a3 usingRenditionKey:v36 fromTheme:v45 resolvingWithBlock:v52];

    uint64_t v46 = v48;
  }
  [(CUINamedLookup *)v46 setRepresentsOnDemandContent:v54];
  return v46;
}

- (CUICatalog)initWithName:(id)a3 fromBundle:(id)a4 error:(id *)a5
{
  v12.receiver = self;
  v12.super_class = (Class)CUICatalog;
  v8 = [(CUICatalog *)&v12 init];
  if (v8)
  {
    if (!a4) {
      a4 = +[NSBundle mainBundle];
    }
    unint64_t v9 = +[CUIThemeFacet themeNamed:forBundleIdentifier:error:](CUIThemeFacet, "themeNamed:forBundleIdentifier:error:", a3, [a4 bundleIdentifier], a5);
    v8->_storageRef = v9;
    if (v9)
    {
      *((_DWORD *)v8 + 21) &= 0xF0000000;
      v8->_bundle = (NSBundle *)a4;
      v8->_assetStoreName = (NSString *)[a3 copy];
      [(CUICatalog *)v8 lookupCache];
      [(CUICatalog *)v8 negativeCache];
      [(CUICatalog *)v8 localObjectCache];
      [(CUICatalog *)v8 _setPreferredLocalization:0];
      v10 = +[NSNotificationCenter defaultCenter];
      [(NSNotificationCenter *)v10 addObserver:v8 selector:sel__resourceUnPinnedNotification_ name:_NSBundleResourceRequestAssetPackUnpinnedNotification object:a4];
    }
    else
    {
      v8->_storageRef = 0x7FFFFFFFFFFFFFFFLL;

      return 0;
    }
  }
  return v8;
}

- (id)negativeCache
{
  v3 = (void *)_LookupStructuredThemeProvider(self->_storageRef, a2);
  id result = self->_negativeCache;
  if (!result)
  {
    self->_negativeCache = (NSCache *)objc_alloc_init((Class)NSCache);
    -[NSCache setName:](self->_negativeCache, "setName:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.coreui-negativecache %@", objc_msgSend(objc_msgSend(v3, "themeStore"), "path")));
    [(NSCache *)self->_negativeCache setEvictsObjectsWithDiscardedContent:0];
    [(NSCache *)self->_negativeCache setCountLimit:100];
    [(NSCache *)self->_negativeCache setMinimumObjectCount:15];
    return self->_negativeCache;
  }
  return result;
}

- (id)lookupCache
{
  v3 = (void *)_LookupStructuredThemeProvider(self->_storageRef, a2);
  id result = self->_lookupCache;
  if (!result)
  {
    self->_lookupCache = (NSCache *)objc_alloc_init((Class)NSCache);
    -[NSCache setName:](self->_lookupCache, "setName:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.coreui-cache %@", objc_msgSend(objc_msgSend(v3, "themeStore"), "path")));
    [(NSCache *)self->_lookupCache setEvictsObjectsWithDiscardedContent:0];
    [(NSCache *)self->_lookupCache setCountLimit:500];
    [(NSCache *)self->_lookupCache setMinimumObjectCount:75];
    return self->_lookupCache;
  }
  return result;
}

- (id)namedVectorGlyphWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 layoutDirection:(int64_t)a6 glyphContinuousSize:(double)a7 glyphContinuousWeight:(double)a8 glyphPointSize:(double)a9 appearanceName:(id)a10 locale:(id)a11
{
  id v17 = a3;
  _CUILog(3, (uint64_t)"-[CUICatalog namedVectorGlyphWithName:%@ scaleFactor:%f deviceIdiom:%d layoutDirection:%d glyphSize:%f glyphWeight:%f glyphPointSize:%f appearanceName:%@ locale:%@]", (uint64_t)a3, a5, a6, (uint64_t)a10, (uint64_t)a11, v11, (uint64_t)a3);
  CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", v17), 17);
  kdebug_trace();
  uint64_t v20 = (void *)_LookupStructuredThemeProvider(self->_storageRef, v19);
  id v21 = [(CUICatalog *)self _baseVectorGlyphForName:v17];
  if (v21)
  {
    id v22 = v21;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 && (id v23 = [v20 aliasForName:v17]) != 0)
  {
    id v24 = v23;
    id v22 = [(CUICatalog *)self _baseVectorGlyphForName:v23];
    id v17 = v24;
  }
  else
  {
    id v22 = 0;
  }
  id v26 = objc_msgSend(objc_msgSend(v20, "themeStore"), "renditionInfoForIdentifier:", (unsigned __int16)objc_msgSend(v22, "themeIdentifier"));
  if (a10) {
    uint64_t v56 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, v25), "appearanceIdentifierForName:", a10);
  }
  else {
    uint64_t v56 = 0;
  }
  unsigned __int8 v64 = 0;
  if (a4 <= 0.0 || a9 <= 0.0)
  {
    objc_msgSend(objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "themeStore"), "path");
    _CUILog(4, (uint64_t)"CoreUI: -[CUICatalog namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphSize:glyphWeight:glyphPointSize:appearanceName:] '%@' called with scaleFactor == %f glyphPointSize == %f at '%@'", v30, v31, v32, v33, v34, v35, (uint64_t)v17);
    [(CUICatalog *)self finalizeNamedVectorGlyphLookupWithResult:0 name:v17 glyphContinuousSize:a7 glyphContinuousWeight:a8 pointSize:a9];
    return 0;
  }
  else
  {
    if (__getDeviceTraits___getDeviceTraits_once != -1) {
      dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
    }
    uint64_t v54 = __getDeviceTraits___deviceMemoryClass;
    uint64_t v55 = __getDeviceTraits___deviceDisplayGamut;
    uint64_t v53 = __getDeviceTraits___deviceGraphicsClass;
    uint64_t v27 = __getDeviceTraits___deviceGraphicsFallbackOrder;
    if (__getDeviceTraits___deviceIdiom == a5)
    {
      uint64_t v28 = __getDeviceTraits___deviceSubtype;
      id v29 = (NSArray *)__getDeviceTraits___deviceSubtypeFallbackOrder;
    }
    else
    {
      id v65 = +[NSNumber numberWithInt:0];
      id v29 = +[NSArray arrayWithObjects:&v65 count:1];
      uint64_t v28 = 0;
    }
    uint64_t v37 = 0;
    while (*(double *)&kCoreThemeContinuousGlyphSizes[v37] != a7)
    {
      if (++v37 == 3)
      {
        uint64_t v38 = 0;
        goto LABEL_23;
      }
    }
    uint64_t v38 = kCoreThemeDiscreteGlyphSizes[v37];
LABEL_23:
    uint64_t v39 = 0;
    while (kCoreThemeContinuousGlyphWeights[v39] != a8)
    {
      if (++v39 == 9)
      {
        uint64_t v40 = 0;
        goto LABEL_28;
      }
    }
    uint64_t v40 = kCoreThemeDiscreteGlyphWeights[v39];
LABEL_28:
    if (v40) {
      BOOL v41 = v38 == 0;
    }
    else {
      BOOL v41 = 1;
    }
    char v42 = !v41;
    uint64_t v43 = off_1E5A5F000;
LABEL_35:
    char v52 = v43[363];
    while (1)
    {
      if (v42)
      {
        if ([v26 containsVectorGlyphWithWeight:v40 size:v38])
        {
          v63[0] = _NSConcreteStackBlock;
          v63[1] = 3221225472;
          v63[2] = __158__CUICatalog_namedVectorGlyphWithName_scaleFactor_deviceIdiom_layoutDirection_glyphContinuousSize_glyphContinuousWeight_glyphPointSize_appearanceName_locale___block_invoke;
          v63[3] = &__block_descriptor_56_e25_v16__0__CUIRenditionKey_8l;
          v63[4] = v56;
          v63[5] = v38;
          v63[6] = v40;
          id v44 = [(CUICatalog *)self _resolvedRenditionKeyForName:v17 scaleFactor:a5 deviceIdiom:v28 deviceSubtype:v55 displayGamut:a6 layoutDirection:0 sizeClassHorizontal:a4 sizeClassVertical:0 memoryClass:v54 graphicsClass:v53 graphicsFallBackOrder:v27 deviceSubtypeFallBackOrder:v29 locale:a11 withBaseKeySelector:v52 adjustRenditionKeyWithBlock:v63];
          if (v44) {
            break;
          }
        }
      }
      if ([v26 containsVectorGlyphInterpolationSources])
      {
        unint64_t v45 = [(CUICatalog *)self _storageRefForRendition:0 representsODRContent:&v64];
        uint64_t v61 = 0;
        uint64_t v62 = 0;
        uint64_t v60 = 0;
        -[CUICatalog _resolveInterpolationSourceRenditionKeysUltralight:regular:black:forName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:appearanceIdentifier:locale:](self, "_resolveInterpolationSourceRenditionKeysUltralight:regular:black:forName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:appearanceIdentifier:locale:", &v62, &v61, &v60, v17, a5, v28, a4, v55, a6, 0, 0, v54, v53, v27, v29,
          v56,
          a11);
        if (v62)
        {
          if (v61)
          {
            if (v60)
            {
              uint64_t v46 = [CUINamedVectorGlyph alloc];
              id v47 = [(CUINamedVectorGlyph *)v46 initWithName:v17 scaleFactor:a5 deviceIdiom:v61 pointSize:v62 continuousWeight:v60 continuousSize:self interpolatedFromRegular:a4 ultralight:a9 black:a8 fromCatalog:a7 themeRef:v45 locale:a11];
              if (v47) {
                goto LABEL_52;
              }
            }
          }
        }
        if ((v42 & 1) == 0)
        {
          uint64_t v38 = _snapToDiscreteSizeForSize(a7);
          uint64_t v40 = _snapToDiscreteWeightForWeight(a8);
          char v42 = 1;
          uint64_t v43 = off_1E5A5F000;
          goto LABEL_35;
        }
      }
      BOOL v41 = v40 == 4;
      uint64_t v40 = 4;
      if (v41) {
        goto LABEL_50;
      }
    }
    id v48 = v44;
    unint64_t v49 = [(CUICatalog *)self _storageRefForRendition:v44 representsODRContent:&v64];
    if (v49 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_50:
      id v36 = 0;
      goto LABEL_53;
    }
    id v47 = [[CUINamedVectorGlyph alloc] initWithName:v17 scaleFactor:a5 deviceIdiom:self pointSize:v48 fromCatalog:v49 usingRenditionKey:a11 themeRef:a4 locale:a9];
LABEL_52:
    id v36 = v47;
    [(CUINamedVectorGlyph *)v47 setRepresentsOnDemandContent:v64];
    id v50 = v36;
LABEL_53:
    [(CUICatalog *)self finalizeNamedVectorGlyphLookupWithResult:v36 name:v17 glyphContinuousSize:a7 glyphContinuousWeight:a8 pointSize:a9];
  }
  return v36;
}

- (id)_resolvedRenditionKeyForName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 memoryClass:(unint64_t)a11 graphicsClass:(unint64_t)a12 graphicsFallBackOrder:(id)a13 deviceSubtypeFallBackOrder:(id)a14 locale:(id)a15 withBaseKeySelector:(SEL)a16 adjustRenditionKeyWithBlock:(id)a17
{
  _CUILog(3, (uint64_t)"-[CUICatalog _resolvedRenditionKeyForName:%@ scaleFactor:%f idiom:%d subtype:%u displayGamut:%d layoutDirection:%d sizeClassHorizontal:%d sizeClassVertical:%d memoryClass:%lu graphicsClass:%lu] [%s:%d]", (uint64_t)a3, a5, a6, a7, a8, a9, (uint64_t)a3);
  if (!a3 || ![a3 length])
  {
    uint64_t v39 = (uint64_t)a3;
    id v29 = "CUICatalog: Invalid asset name supplied: '%@'";
    goto LABEL_7;
  }
  if (!a5 && a6)
  {
    uint64_t v39 = a6;
    id v29 = "CUICatalog: Invalid Request: requesting subtype %d without specifying idiom for asset named: '%@'";
LABEL_7:
    _CUILog(4, (uint64_t)v29, v23, v24, v25, v26, v27, v28, v39);
    return 0;
  }
  if (a16) {
    id v31 = [(CUICatalog *)self performSelector:a16 withObject:a3];
  }
  else {
    id v31 = [(CUICatalog *)self _baseKeyForName:a3];
  }
  if (!v31)
  {
    _CUILog(3, (uint64_t)"-[CUICatalog _resolvedRenditionKeyForName:] Cannot resolve base key for bogus name '%@'.", v32, 0, v33, v34, v35, v36, (uint64_t)a3);
    return 0;
  }
  unint64_t storageRef = self->_storageRef;
  double v38 = 0.0;
  if (a4 > 0.0) {
    double v38 = a4;
  }
  return -[CUICatalog _resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:adjustRenditionKeyWithBlock:", storageRef, v31, a5, a6, a7, a8, v38);
}

- (id)_resolvedRenditionKeyFromThemeRef:(unint64_t)a3 withBaseKey:(id)a4 scaleFactor:(double)a5 deviceIdiom:(int64_t)a6 deviceSubtype:(unint64_t)a7 displayGamut:(int64_t)a8 layoutDirection:(int64_t)a9 sizeClassHorizontal:(int64_t)a10 sizeClassVertical:(int64_t)a11 memoryClass:(unint64_t)a12 graphicsClass:(unint64_t)a13 graphicsFallBackOrder:(id)a14 deviceSubtypeFallBackOrder:(id)a15 locale:(id)a16 adjustRenditionKeyWithBlock:(id)a17
{
  uint64_t v25 = (void *)_LookupStructuredThemeProvider(a3, a2);
  id v26 = objc_msgSend(objc_msgSend(v25, "themeStore"), "renditionInfoForIdentifier:", (unsigned __int16)objc_msgSend(a4, "themeIdentifier"));
  id v27 = [a16 languageCode];
  uint64_t v36 = v26;
  if (!a16 || !v27)
  {
    id preferredLocalization = self->_preferredLocalization;
    if (a16 && !v27) {
      _CUILog(4, (uint64_t)"CoreUI: passed in NSLocale %p has a language code of NULL assuming localization identifier %d", 0, v28, v29, v30, v31, v32, (uint64_t)a16);
    }
LABEL_8:
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  id v33 = +[NSLocale mostPreferredLanguageOf:withPreferredLanguages:forUsage:options:](NSLocale, "mostPreferredLanguageOf:withPreferredLanguages:forUsage:options:", self->_assetCatalogLocalizations, +[NSArray arrayWithObject:v27], 1, 0);
  if (v33)
  {
    id preferredLocalization = [v25 localizationIdentifierForName:v33];
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_16;
  }
  id preferredLocalization = 0;
LABEL_12:
  if ((objc_msgSend(v25, "localizationWorkaroundForKeyList:withLocale:", objc_msgSend(a4, "keyList"), a16) & 1) == 0)
  {
LABEL_13:
    if (preferredLocalization)
    {
      if (([v36 attributePresent:13 withValue:preferredLocalization] & 0x80000000) == 0)
      {
        id result = -[CUICatalog _private_resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:localizationIdentifier:adjustRenditionKeyWithBlock:](self, a3, a4, (id)a6, a7, (void *)a8, a9, a10, a5, a11, a12, a13, a14, a15, preferredLocalization, (uint64_t)a17);
        if (result) {
          return result;
        }
      }
    }
  }
LABEL_16:
  return -[CUICatalog _private_resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:localizationIdentifier:adjustRenditionKeyWithBlock:](self, a3, a4, (id)a6, a7, (void *)a8, a9, a10, a5, a11, a12, a13, a14, a15, 0, (uint64_t)a17);
}

- (id)_baseVectorGlyphForName:(id)a3
{
  id result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    v4 = [[CUIRenditionKey alloc] initWithKeyList:result];
    [(CUIRenditionKey *)v4 setThemeElement:85];
    [(CUIRenditionKey *)v4 setThemePart:59];
    return v4;
  }
  return result;
}

- (id)_themeStore
{
  return (id)_LookupStructuredThemeProvider(self->_storageRef, a2);
}

- (unint64_t)_storageRefForRendition:(id)a3 representsODRContent:(BOOL *)a4
{
  *a4 = 0;
  if (!a3) {
    return self->_storageRef;
  }
  uint64_t v48 = 0;
  id v6 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "renditionWithKey:", objc_msgSend(a3, "keyList"));
  if ([v6 type] != (id)1001) {
    return self->_storageRef;
  }
  *a4 = 1;
  id v7 = [v6 assetPackIdentifier];
  storageMapTable = self->_storageMapTable;
  if (!storageMapTable)
  {
    long long v9 = *(_OWORD *)&NSObjectMapKeyCallBacks.retain;
    *(_OWORD *)&keyCallBacks.hash = *(_OWORD *)&NSObjectMapKeyCallBacks.hash;
    *(_OWORD *)&keyCallBacks.retain = v9;
    *(_OWORD *)&keyCallBacks.describe = *(_OWORD *)&NSObjectMapKeyCallBacks.describe;
    NSMapTableValueCallBacks valueCallBacks = NSIntegerMapValueCallBacks;
    storageMapTable = NSCreateMapTable(&keyCallBacks, &valueCallBacks, 2uLL);
    self->_storageMapTable = storageMapTable;
  }
  v10 = NSMapGet(storageMapTable, v7);
  if (!v10)
  {
    if (([v7 hasPrefix:@"/"] & 1) != 0
      || [v7 hasPrefix:@"./"])
    {
      if ([v7 hasPrefix:@"./"])
      {
        uint64_t v11 = +[CUIThemeFacet themeWithContentsOfURL:error:](CUIThemeFacet, "themeWithContentsOfURL:error:", -[NSBundle URLForResource:withExtension:](self->_bundle, "URLForResource:withExtension:", objc_msgSend(objc_msgSend(v7, "substringFromIndex:", 2), "stringByDeletingPathExtension"), @"car"), &v48);
        if (!v11) {
          goto LABEL_15;
        }
      }
      else
      {
        id v19 = [objc_alloc((Class)NSURL) initFileURLWithPath:v7 isDirectory:0];
        uint64_t v11 = +[CUIThemeFacet themeWithContentsOfURL:v19 error:&v48];

        if (!v11)
        {
LABEL_15:
          _CUILog(4, (uint64_t)"CoreUI: can't open asset pack '%@' contents of asset pack will be ignored error:'%@'", v13, v14, v15, v16, v17, v18, (uint64_t)v7);
          return 0x7FFFFFFFFFFFFFFFLL;
        }
      }
    }
    else
    {
      id v20 = +[NSBundleResourceRequest _assetPackBundleForBundle:self->_bundle withAssetPackID:v7];
      if (!v20)
      {
        if (self->_bundle)
        {
          _CUILog(4, (uint64_t)"CoreUI: can't locate asset pack '%@' for bundle '%@' contents of asset pack will be ignored", v21, v22, v23, v24, v25, v26, (uint64_t)v7);
        }
        else
        {
          objc_msgSend(objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "themeStore"), "path");
          _CUILog(4, (uint64_t)"CoreUI: can't locate asset pack '%@' because CUICatalog was initialized with a path of '%@' instead of a bundle contents of asset pack will be ignored", v40, v41, v42, v43, v44, v45, (uint64_t)v7);
        }
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      id v27 = [v20 URLForResource:self->_assetStoreName withExtension:@"car"];
      if (!v27)
      {
        _CUILog(4, (uint64_t)"CoreUI: can't locate '%@.car' in asset pack '%@' for bundle '%@' contents of asset pack will be ignored", v28, v29, v30, v31, v32, v33, (uint64_t)self->_assetStoreName);
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      uint64_t v11 = +[CUIThemeFacet themeWithContentsOfURL:v27 error:&v48];
      if (!v11)
      {
        _CUILog(4, (uint64_t)"CoreUI: can't open asset pack '%@' for bundle '%@' contents of asset pack will be ignored error:'%@'", v34, v35, v36, v37, v38, v39, (uint64_t)v7);
        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    NSMapInsert(self->_storageMapTable, v7, v11);
    return (unint64_t)v11;
  }
  return (unint64_t)v10;
}

- (id)appearanceNames
{
  v2 = (void *)_LookupStructuredThemeProvider(self->_storageRef, a2);
  id v3 = [v2 appearances];
  if (!v3 || (id result = [v3 allKeys]) == 0)
  {
    id v5 = [v2 defaultAppearanceName];
    return +[NSArray arrayWithObject:v5];
  }
  return result;
}

- (void)finalizeNamedVectorGlyphLookupWithResult:(id)a3 name:(id)a4 glyphContinuousSize:(double)a5 glyphContinuousWeight:(double)a6 pointSize:(double)a7
{
  if (!a3 && objc_msgSend(a4, "length", a5, a6, a7) == (id)2)
  {
    [a4 getCharacters:&v14];
    if ((v14 & 0xFC00) == 0xD800
      && (v15 & 0xFC00) == 0xDC00
      && ((v15 + (v14 << 10) - 56613888) & 0xFFFF0000) == 0x100000)
    {
      _CUILog(4, (uint64_t)"CoreUI: Symbol asset lookup attempted with invalid name '%@'. Argument contains Unicode codepoint copied from SF Symbols app. Please use full symbol name instead!", v8, v9, v10, v11, v12, v13, (uint64_t)a4);
    }
  }
  kdebug_trace();
}

- (id)_baseKeyForName:(id)a3
{
  id result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    v4 = [[CUIRenditionKey alloc] initWithKeyList:result];
    return v4;
  }
  return result;
}

- (id)_baseColorKeyForName:(id)a3
{
  id result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    v4 = [[CUIRenditionKey alloc] initWithKeyList:result];
    [(CUIRenditionKey *)v4 setThemeElement:85];
    [(CUIRenditionKey *)v4 setThemePart:217];
    return v4;
  }
  return result;
}

- (id)_baseImageKeyForName:(id)a3
{
  id result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    v4 = [[CUIRenditionKey alloc] initWithKeyList:result];
    [(CUIRenditionKey *)v4 setThemeElement:85];
    [(CUIRenditionKey *)v4 setThemePart:181];
    return v4;
  }
  return result;
}

- (void)_resolveInterpolationSourceRenditionKeysUltralight:(id *)a3 regular:(id *)a4 black:(id *)a5 forName:(id)a6 scaleFactor:(double)a7 deviceIdiom:(int64_t)a8 deviceSubtype:(unint64_t)a9 displayGamut:(int64_t)a10 layoutDirection:(int64_t)a11 sizeClassHorizontal:(int64_t)a12 sizeClassVertical:(int64_t)a13 memoryClass:(unint64_t)a14 graphicsClass:(unint64_t)a15 graphicsFallBackOrder:(id)a16 deviceSubtypeFallBackOrder:(id)a17 appearanceIdentifier:(int64_t)a18 locale:(id)a19
{
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __295__CUICatalog__resolveInterpolationSourceRenditionKeysUltralight_regular_black_forName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_memoryClass_graphicsClass_graphicsFallBackOrder_deviceSubtypeFallBackOrder_appearanceIdentifier_locale___block_invoke;
  v28[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v28[4] = a18;
  *a3 = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a6, a8, a9, a10, a13, a14, a15, a16, a17, a19, sel__baseVectorGlyphForName_, v28);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __295__CUICatalog__resolveInterpolationSourceRenditionKeysUltralight_regular_black_forName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_memoryClass_graphicsClass_graphicsFallBackOrder_deviceSubtypeFallBackOrder_appearanceIdentifier_locale___block_invoke_2;
  v27[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v27[4] = a18;
  *a4 = [(CUICatalog *)self _resolvedRenditionKeyForName:a6 scaleFactor:a8 deviceIdiom:a9 deviceSubtype:a10 displayGamut:a11 layoutDirection:a12 sizeClassHorizontal:a7 sizeClassVertical:a13 memoryClass:a14 graphicsClass:a15 graphicsFallBackOrder:a16 deviceSubtypeFallBackOrder:a17 locale:a19 withBaseKeySelector:sel__baseVectorGlyphForName_ adjustRenditionKeyWithBlock:v27];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __295__CUICatalog__resolveInterpolationSourceRenditionKeysUltralight_regular_black_forName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_memoryClass_graphicsClass_graphicsFallBackOrder_deviceSubtypeFallBackOrder_appearanceIdentifier_locale___block_invoke_3;
  v26[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v26[4] = a18;
  *a5 = [(CUICatalog *)self _resolvedRenditionKeyForName:a6 scaleFactor:a8 deviceIdiom:a9 deviceSubtype:a10 displayGamut:a11 layoutDirection:a12 sizeClassHorizontal:a7 sizeClassVertical:a13 memoryClass:a14 graphicsClass:a15 graphicsFallBackOrder:a16 deviceSubtypeFallBackOrder:a17 locale:a19 withBaseKeySelector:sel__baseVectorGlyphForName_ adjustRenditionKeyWithBlock:v26];
}

- (id)colorWithName:(id)a3 displayGamut:(int64_t)a4 deviceIdiom:(int64_t)a5 appearanceName:(id)a6
{
  CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace();
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  uint64_t v17 = __getDeviceTraits___deviceIdiom;
  uint64_t v18 = __getDeviceTraits___deviceSubtype;
  uint64_t v33 = __getDeviceTraits___deviceGraphicsClass;
  uint64_t v34 = __getDeviceTraits___deviceMemoryClass;
  uint64_t v19 = __getDeviceTraits___deviceGraphicsFallbackOrder;
  id v20 = (NSArray *)__getDeviceTraits___deviceSubtypeFallbackOrder;
  _CUILog(3, (uint64_t)"-[CUICatalog colorWithName:%@ displayGamut:%d deviceIdiom:%d appearanceName:%@]", v11, v12, v13, v14, v15, v16, (uint64_t)a3);
  uint64_t v22 = 0;
  unsigned __int8 v36 = 0;
  if (self && a6) {
    uint64_t v22 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, v21), "appearanceIdentifierForName:", a6);
  }
  if (v17 != a5)
  {
    uint64_t v37 = +[NSNumber numberWithInt:0];
    id v20 = +[NSArray arrayWithObjects:&v37 count:1];
    uint64_t v18 = 0;
  }
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = __68__CUICatalog_colorWithName_displayGamut_deviceIdiom_appearanceName___block_invoke;
  v35[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v35[4] = v22;
  id v23 = [(CUICatalog *)self _resolvedRenditionKeyForName:a3 scaleFactor:a5 deviceIdiom:v18 deviceSubtype:a4 displayGamut:0 layoutDirection:0 sizeClassHorizontal:1.0 sizeClassVertical:0 memoryClass:v34 graphicsClass:v33 graphicsFallBackOrder:v19 deviceSubtypeFallBackOrder:v20 locale:0 withBaseKeySelector:sel__baseColorKeyForName_ adjustRenditionKeyWithBlock:v35];
  if (v23)
  {
    uint64_t v24 = v23;
    id v25 = [(CUICatalog *)self localObjectCache];
    unint64_t v26 = [(CUICatalog *)self _storageRefForRendition:v24 representsODRContent:&v36];
    id v28 = objc_msgSend((id)_LookupStructuredThemeProvider(v26, v27), "copyLookupKeySignatureForKey:", objc_msgSend(v24, "keyList"));
    uint64_t v29 = (CUINamedColor *)[v25 objectForKey:v28];
    uint64_t v30 = v29;
    if (colorWithName_displayGamut_deviceIdiom_appearanceName____onceToken == -1)
    {
      if (!v29) {
        goto LABEL_15;
      }
    }
    else
    {
      dispatch_once(&colorWithName_displayGamut_deviceIdiom_appearanceName____onceToken, &__block_literal_global_114);
      if (!v30) {
        goto LABEL_15;
      }
    }
    if (objc_opt_isKindOfClass())
    {
      uint64_t v31 = v30;
LABEL_16:

      goto LABEL_17;
    }
LABEL_15:
    uint64_t v30 = [[CUINamedColor alloc] initWithName:a3 usingRenditionKey:v24 fromTheme:v26];
    [(CUINamedLookup *)v30 setRepresentsOnDemandContent:v36];
    [v25 setObject:v30 forKey:v28];
    goto LABEL_16;
  }
  uint64_t v30 = 0;
LABEL_17:
  kdebug_trace();
  return v30;
}

- (id)localObjectCache
{
  id v3 = (void *)_LookupStructuredThemeProvider(self->_storageRef, a2);
  id result = self->_localObjectCache;
  if (!result)
  {
    self->_localObjectCache = (NSCache *)objc_alloc_init((Class)NSCache);
    -[NSCache setName:](self->_localObjectCache, "setName:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.coreui-cuicache %@", objc_msgSend(objc_msgSend(v3, "themeStore"), "path")));
    [(NSCache *)self->_localObjectCache setEvictsObjectsWithDiscardedContent:0];
    [(NSCache *)self->_localObjectCache setCountLimit:100];
    [(NSCache *)self->_localObjectCache setMinimumObjectCount:15];
    return self->_localObjectCache;
  }
  return result;
}

- (void)_setPreferredLocalization:(id)a3
{
  id v5 = (void *)_LookupStructuredThemeProvider(self->_storageRef, a2);
  id v6 = v5;
  if (a3)
  {
    self->_id preferredLocalization = (unsigned __int16)[v5 localizationIdentifierForName:a3];
LABEL_3:
    _CUILog(3, (uint64_t)"-[CUICatalog _setPreferredLocalization:] set it to '%@' %d", v7, v8, v9, v10, v11, v12, (uint64_t)a3);
    return;
  }
  id v13 = [v5 localizations];

  self->_assetCatalogLocalizations = (NSArray *)[v13 allKeys];
  uint64_t v14 = [+[NSBundle mainBundle] preferredLocalizations];
  id v15 = [(NSArray *)+[NSBundle preferredLocalizationsFromArray:self->_assetCatalogLocalizations forPreferences:0] firstObject];
  id v16 = +[NSLocale mostPreferredLanguageOf:self->_assetCatalogLocalizations withPreferredLanguages:v14 forUsage:1 options:0];
  if (v16)
  {
    a3 = v16;
    unsigned int v23 = objc_msgSend(+[NSLocale baseLanguageFromLanguage:](NSLocale, "baseLanguageFromLanguage:", v15), "isEqualToString:", +[NSLocale baseLanguageFromLanguage:](NSLocale, "baseLanguageFromLanguage:", v16));
    self->_id preferredLocalization = (unsigned __int16)[v6 localizationIdentifierForName:a3];
    if (v23) {
      goto LABEL_3;
    }
    _CUILog(3, (uint64_t)"-[CUICatalog _setPreferredLocalization:] set it to *'%@' %d", v7, v8, v9, v10, v11, v12, (uint64_t)a3);
  }
  else
  {
    self->_id preferredLocalization = 0;
    _CUILog(3, (uint64_t)"-[CUICatalog _setPreferredLocalization:] set it to unlocalized/base %d", v17, v18, v19, v20, v21, v22, 0);
  }
}

- (id)_baseVectorRenditionKey:(id)a3
{
  id result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    v4 = [[CUIRenditionKey alloc] initWithKeyList:result];
    [(CUIRenditionKey *)v4 setThemeElement:85];
    [(CUIRenditionKey *)v4 setThemePart:42];
    return v4;
  }
  return result;
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 layoutDirection:(int64_t)a6 locale:(id)a7 adjustRenditionKeyWithBlock:(id)a8
{
  unsigned __int8 v33 = 0;
  CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace();
  _CUILog(3, (uint64_t)"-[CUICatalog imageWithName:%@ scaleFactor:%f deviceIdiom:%d locale:%@]", v15, v16, v17, v18, v19, v20, (uint64_t)a3);
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  uint64_t v21 = __getDeviceTraits___deviceDisplayGamut;
  uint64_t v22 = __getDeviceTraits___deviceMemoryClass;
  uint64_t v23 = __getDeviceTraits___deviceGraphicsClass;
  uint64_t v24 = __getDeviceTraits___deviceGraphicsFallbackOrder;
  if (__getDeviceTraits___deviceIdiom == a5)
  {
    uint64_t v25 = __getDeviceTraits___deviceSubtype;
    unint64_t v26 = (NSArray *)__getDeviceTraits___deviceSubtypeFallbackOrder;
  }
  else
  {
    uint64_t v34 = +[NSNumber numberWithInt:0];
    unint64_t v26 = +[NSArray arrayWithObjects:&v34 count:1];
    uint64_t v25 = 0;
  }
  id v27 = [(CUICatalog *)self _resolvedRenditionKeyForName:a3 scaleFactor:a5 deviceIdiom:v25 deviceSubtype:v21 displayGamut:a6 layoutDirection:0 sizeClassHorizontal:a4 sizeClassVertical:0 memoryClass:v22 graphicsClass:v23 graphicsFallBackOrder:v24 deviceSubtypeFallBackOrder:v26 locale:a7 withBaseKeySelector:sel__baseImageKeyForName_ adjustRenditionKeyWithBlock:a8];
  if (v27)
  {
    id v28 = v27;
    if ([v27 themePart] == (id)220
      || (unint64_t v29 = [(CUICatalog *)self _storageRefForRendition:v28 representsODRContent:&v33], v29 == 0x7FFFFFFFFFFFFFFFLL))
    {
      uint64_t v30 = 0;
    }
    else
    {
      uint64_t v31 = [[CUINamedImage alloc] initWithName:a3 usingRenditionKey:v28 fromTheme:v29];
      [(CUINamedLookup *)v31 setRepresentsOnDemandContent:v33];
      uint64_t v30 = v31;
    }
  }
  else
  {
    uint64_t v30 = 0;
  }
  kdebug_trace();
  return v30;
}

id __295__CUICatalog__resolveInterpolationSourceRenditionKeysUltralight_regular_black_forName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_memoryClass_graphicsClass_graphicsFallBackOrder_deviceSubtypeFallBackOrder_appearanceIdentifier_locale___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 setThemeAppearance:*(void *)(a1 + 32)];
  [a2 setThemeGlyphSize:1];
  return [a2 setThemeGlyphWeight:4];
}

id __295__CUICatalog__resolveInterpolationSourceRenditionKeysUltralight_regular_black_forName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_memoryClass_graphicsClass_graphicsFallBackOrder_deviceSubtypeFallBackOrder_appearanceIdentifier_locale___block_invoke_3(uint64_t a1, void *a2)
{
  [a2 setThemeAppearance:*(void *)(a1 + 32)];
  [a2 setThemeGlyphSize:1];
  return [a2 setThemeGlyphWeight:9];
}

id __295__CUICatalog__resolveInterpolationSourceRenditionKeysUltralight_regular_black_forName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_memoryClass_graphicsClass_graphicsFallBackOrder_deviceSubtypeFallBackOrder_appearanceIdentifier_locale___block_invoke(uint64_t a1, void *a2)
{
  [a2 setThemeAppearance:*(void *)(a1 + 32)];
  [a2 setThemeGlyphSize:1];
  return [a2 setThemeGlyphWeight:1];
}

id __158__CUICatalog_namedVectorGlyphWithName_scaleFactor_deviceIdiom_layoutDirection_glyphContinuousSize_glyphContinuousWeight_glyphPointSize_appearanceName_locale___block_invoke(void *a1, void *a2)
{
  [a2 setThemeAppearance:a1[4]];
  [a2 setThemeGlyphSize:a1[5]];
  uint64_t v4 = a1[6];
  return [a2 setThemeGlyphWeight:v4];
}

- (id)namedVectorGlyphWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 layoutDirection:(int64_t)a6 glyphSize:(int64_t)a7 glyphWeight:(int64_t)a8 glyphPointSize:(double)a9 appearanceName:(id)a10
{
  return [(CUICatalog *)self namedVectorGlyphWithName:a3 scaleFactor:a5 deviceIdiom:a6 layoutDirection:a7 glyphSize:a8 glyphWeight:a10 glyphPointSize:a4 appearanceName:a9 locale:0];
}

- (id)namedVectorGlyphWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 layoutDirection:(int64_t)a6 glyphSize:(int64_t)a7 glyphWeight:(int64_t)a8 glyphPointSize:(double)a9 appearanceName:(id)a10 locale:(id)a11
{
  return [(CUICatalog *)self namedVectorGlyphWithName:a3 scaleFactor:a5 deviceIdiom:a6 layoutDirection:a10 glyphContinuousSize:a11 glyphContinuousWeight:a4 glyphPointSize:*(double *)off_1E5A5F4A0[a7] appearanceName:*(double *)off_1E5A5F450[a8] locale:a9];
}

- (id)colorWithName:(id)a3 displayGamut:(int64_t)a4 deviceIdiom:(int64_t)a5
{
  return [(CUICatalog *)self colorWithName:a3 displayGamut:a4 deviceIdiom:a5 appearanceName:0];
}

- (id)namedVectorImageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceName:(id)a11 locale:(id)a12
{
  uint64_t v19 = 0;
  if (self && a11) {
    uint64_t v19 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "appearanceIdentifierForName:", a11);
  }
  CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace();
  id v20 = [(CUICatalog *)self _namedVectorImageWithName:a3 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:a7 displayGamut:a8 layoutDirection:a9 sizeClassHorizontal:a4 sizeClassVertical:a10 appearanceIdentifier:v19 locale:a12];
  kdebug_trace();
  return v20;
}

- (id)_namedVectorImageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceIdentifier:(int64_t)a11 locale:(id)a12
{
  id v18 = a3;
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  unsigned __int8 v61 = 0;
  if (__getDeviceTraits___deviceIdiom == a5 && __getDeviceTraits___deviceSubtype == a6)
  {
    uint64_t v21 = (NSArray *)__getDeviceTraits___deviceSubtypeFallbackOrder;
  }
  else
  {
    uint64_t v62 = +[NSNumber numberWithInt:0];
    uint64_t v21 = +[NSArray arrayWithObjects:&v62 count:1];
  }
  _CUILog(3, (uint64_t)"-[CUICatalog _namedVectorImageWithName:%@ scaleFactor:%f deviceIdiom:%d deviceSubtype:%d displayGamut:%d layoutDirection:%d sizeClassHorizontal:%d sizeClassVertical:%d appearanceIdentifier:%d +subtypefallback;%@]",
    (uint64_t)a3,
    a5,
    a6,
    a7,
    a8,
    a9,
    (uint64_t)v18);
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = __173__CUICatalog__namedVectorImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_appearanceIdentifier_locale___block_invoke;
  v60[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v60[4] = a11;
  int64_t v58 = a8;
  id result = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", v18, a5, a6, a7, a8, a9, a4, a10, 0, 0, 0, v21, a12, 0, v60,
             a11,
             v21);
  if (result)
  {
    id v23 = result;
    int64_t v57 = a7;
    unint64_t v24 = [(CUICatalog *)self _storageRefForRendition:result representsODRContent:&v61];
    if (v24 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v29 = v24;
      uint64_t v56 = (uint64_t)v18;
      uint64_t v30 = (void *)_LookupStructuredThemeProvider(self->_storageRef, v25);
      unsigned int v55 = [v30 distilledInCoreUIVersion];
      id v31 = objc_msgSend(v30, "renditionWithKey:", objc_msgSend(v23, "keyList"));
      if (a4 == 0.0)
      {
        unsigned int v32 = [v31 pixelFormat];
        if (v32 == 1398163232)
        {
          unsigned __int8 v33 = OBJC_CLASS___CUINamedVectorSVGImage_ptr;
        }
        else
        {
          if (v32 != 1346651680) {
            goto LABEL_30;
          }
          unsigned __int8 v33 = OBJC_CLASS___CUINamedVectorPDFImage_ptr;
        }
        id v44 = objc_alloc(*v33);
        id v45 = (id)v56;
        id v46 = v23;
        unint64_t v47 = v29;
LABEL_28:
        id v48 = [v44 initWithName:v45 usingRenditionKey:v46 fromTheme:v47];
LABEL_31:
        [v48 setRepresentsOnDemandContent:v61];
        return v48;
      }
      id v18 = (id)v56;
      if (v55 >= 0x1E5 && ([v31 preservedVectorRepresentation] & 1) == 0)
      {
        _CUILog(3, (uint64_t)"-[CUICatalog _namedVectorImageWithName:%@ scaleFactor:%f deviceIdiom:%d deviceSubtype:%d displayGamut:%d layoutDirection:%d sizeClassHorizontal:%d sizeClassVertical:%d appearanceIdentifier:%d] stopped]", v38, v39, v40, v41, v42, v43, v56);
        return 0;
      }
    }
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = __173__CUICatalog__namedVectorImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_appearanceIdentifier_locale___block_invoke_2;
    v59[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
    v59[4] = a11;
    id result = [(CUICatalog *)self _resolvedRenditionKeyForName:v18 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:v57 displayGamut:v58 layoutDirection:a9 sizeClassHorizontal:a4 sizeClassVertical:a10 memoryClass:0 graphicsClass:0 graphicsFallBackOrder:0 deviceSubtypeFallBackOrder:v21 locale:a12 withBaseKeySelector:sel__baseVectorRenditionKey_ adjustRenditionKeyWithBlock:v59];
    if (!result) {
      return result;
    }
    id v26 = result;
    unint64_t v27 = [(CUICatalog *)self _storageRefForRendition:result representsODRContent:&v61];
    if (v27 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    unint64_t v34 = v27;
    id v35 = objc_msgSend((id)_LookupStructuredThemeProvider(v27, v28), "renditionWithKey:", objc_msgSend(v26, "keyList"));
    unsigned int v36 = [v35 pixelFormat];
    if (v36 == 1346651680)
    {
      uint64_t v37 = CUINamedVectorPDFImage;
      goto LABEL_27;
    }
    if (v36 == 1398163232)
    {
      uint64_t v37 = CUINamedVectorSVGImage;
LABEL_27:
      id v44 = [v37 alloc];
      id v45 = v18;
      id v46 = v26;
      unint64_t v47 = v34;
      goto LABEL_28;
    }
    [v35 pixelFormat];
    _CUILog(4, (uint64_t)"CoreUI: namedVectorImage '%@' has unknown pixelformat '%d'", v49, v50, v51, v52, v53, v54, (uint64_t)v18);
LABEL_30:
    id v48 = 0;
    goto LABEL_31;
  }
  return result;
}

- (id)dataWithName:(id)a3 appearanceName:(id)a4
{
  uint64_t v6 = 0;
  if (self && a4) {
    uint64_t v6 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "appearanceIdentifierForName:", a4);
  }
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  return [(CUICatalog *)self dataWithName:a3 deviceIdiom:__getDeviceTraits___deviceIdiom deviceSubtype:__getDeviceTraits___deviceSubtype memoryClass:__getDeviceTraits___deviceMemoryClass graphicsClass:__getDeviceTraits___deviceGraphicsClass appearanceIdentifier:v6 graphicsFallBackOrder:__getDeviceTraits___deviceGraphicsFallbackOrder deviceSubtypeFallBackOrder:__getDeviceTraits___deviceSubtypeFallbackOrder];
}

- (id)dataWithName:(id)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 memoryClass:(unint64_t)a6 graphicsClass:(unint64_t)a7 appearanceIdentifier:(int64_t)a8 graphicsFallBackOrder:(id)a9 deviceSubtypeFallBackOrder:(id)a10
{
  CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace();
  id v17 = [(CUICatalog *)self _dataWithName:a3 deviceIdiom:a4 deviceSubtype:a5 memoryClass:a6 graphicsClass:a7 appearanceIdentifier:a8 graphicsFallBackOrder:a9 deviceSubtypeFallBackOrder:a10];
  kdebug_trace();
  return v17;
}

- (id)_dataWithName:(id)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 memoryClass:(unint64_t)a6 graphicsClass:(unint64_t)a7 appearanceIdentifier:(int64_t)a8 graphicsFallBackOrder:(id)a9 deviceSubtypeFallBackOrder:(id)a10
{
  v23[0] = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __150__CUICatalog__dataWithName_deviceIdiom_deviceSubtype_memoryClass_graphicsClass_appearanceIdentifier_graphicsFallBackOrder_deviceSubtypeFallBackOrder___block_invoke;
  v22[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v22[4] = a8;
  id v17 = [(CUICatalog *)self _resolvedRenditionKeyForName:a3 scaleFactor:a4 deviceIdiom:a5 deviceSubtype:0 displayGamut:0 layoutDirection:0 sizeClassHorizontal:1.0 sizeClassVertical:0 memoryClass:a6 graphicsClass:a7 graphicsFallBackOrder:a9 deviceSubtypeFallBackOrder:a10 locale:0 withBaseKeySelector:0 adjustRenditionKeyWithBlock:v22];
  if (v17
    || (v21[0] = _NSConcreteStackBlock,
        v21[1] = 3221225472,
        v21[2] = __150__CUICatalog__dataWithName_deviceIdiom_deviceSubtype_memoryClass_graphicsClass_appearanceIdentifier_graphicsFallBackOrder_deviceSubtypeFallBackOrder___block_invoke_2,
        v21[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l,
        v21[4] = a8,
        id result = [(CUICatalog *)self _resolvedRenditionKeyForName:a3 scaleFactor:a4 deviceIdiom:a5 deviceSubtype:0 displayGamut:0 layoutDirection:0 sizeClassHorizontal:0.0 sizeClassVertical:0 memoryClass:a6 graphicsClass:a7 graphicsFallBackOrder:a9 deviceSubtypeFallBackOrder:a10 locale:0 withBaseKeySelector:0 adjustRenditionKeyWithBlock:v21],
        (id v17 = result) != 0))
  {
    unint64_t v19 = [(CUICatalog *)self _storageRefForRendition:v17 representsODRContent:v23];
    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      id v20 = [[CUINamedData alloc] initWithName:a3 usingRenditionKey:v17 fromTheme:v19];
      [(CUINamedLookup *)v20 setRepresentsOnDemandContent:v23[0]];
      return v20;
    }
  }
  return result;
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceName:(id)a11
{
  return [(CUICatalog *)self imageWithName:a3 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:a7 displayGamut:a8 layoutDirection:a9 sizeClassHorizontal:a4 sizeClassVertical:a10 appearanceName:a11 locale:0];
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceName:(id)a11 locale:(id)a12
{
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  uint64_t v16 = 0;
  uint64_t v17 = __getDeviceTraits___deviceIdiom;
  uint64_t v18 = __getDeviceTraits___deviceSubtype;
  uint64_t v19 = __getDeviceTraits___deviceMemoryClass;
  uint64_t v20 = __getDeviceTraits___deviceGraphicsClass;
  uint64_t v21 = __getDeviceTraits___deviceGraphicsFallbackOrder;
  uint64_t v22 = __getDeviceTraits___deviceSubtypeFallbackOrder;
  if (self && a11)
  {
    uint64_t v23 = __getDeviceTraits___deviceMemoryClass;
    uint64_t v24 = __getDeviceTraits___deviceGraphicsClass;
    uint64_t v25 = __getDeviceTraits___deviceGraphicsFallbackOrder;
    unsigned int v26 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "appearanceIdentifierForName:", a11);
    uint64_t v21 = v25;
    uint64_t v20 = v24;
    uint64_t v19 = v23;
    uint64_t v16 = v26;
  }
  if (v17 == a5 && v18 == a6) {
    return [(CUICatalog *)self imageWithName:a3 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:a7 displayGamut:a8 layoutDirection:a9 sizeClassHorizontal:a4 sizeClassVertical:a10 memoryClass:v19 graphicsClass:v20 appearanceIdentifier:v16 graphicsFallBackOrder:v21 deviceSubtypeFallBackOrder:v22 locale:a12];
  }
  uint64_t v28 = v21;
  uint64_t v29 = v20;
  uint64_t v30 = v19;
  if (a5 == 5)
  {
    id v31 = (NSArray *)+[NSMutableArray array];
    CUIWatchSubTypeFallbackOrder(a6, v31);
    [(NSArray *)v31 addObject:+[NSNumber numberWithInt:0]];
  }
  else
  {
    uint64_t v37 = +[NSNumber numberWithInt:0];
    id v31 = +[NSArray arrayWithObjects:&v37 count:1];
  }
  return [(CUICatalog *)self imageWithName:a3 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:a7 displayGamut:a8 layoutDirection:a9 sizeClassHorizontal:a4 sizeClassVertical:a10 memoryClass:v30 graphicsClass:v29 appearanceIdentifier:v16 graphicsFallBackOrder:v28 deviceSubtypeFallBackOrder:v31 locale:a12];
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 memoryClass:(unint64_t)a11 graphicsClass:(unint64_t)a12 appearanceIdentifier:(int64_t)a13 graphicsFallBackOrder:(id)a14 deviceSubtypeFallBackOrder:(id)a15 locale:(id)a16
{
  CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace();
  id v24 = [(CUICatalog *)self _imageWithName:a3 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:a7 displayGamut:a8 layoutDirection:a9 sizeClassHorizontal:a4 sizeClassVertical:a10 memoryClass:a11 graphicsClass:a12 appearanceIdentifier:a13 graphicsFallBackOrder:a14 deviceSubtypeFallBackOrder:a15 locale:a16];
  kdebug_trace();
  return v24;
}

- (id)_imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 memoryClass:(unint64_t)a11 graphicsClass:(unint64_t)a12 appearanceIdentifier:(int64_t)a13 graphicsFallBackOrder:(id)a14 deviceSubtypeFallBackOrder:(id)a15 locale:(id)a16
{
  v29[0] = 0;
  _CUILog(3, (uint64_t)"-[CUICatalog _imageWithName:%@ scaleFactor:%f deviceIdiom:%d deviceSubtype:%d displayGamut:%d layoutDirection:%d sizeClassHorizontal:%d sizeClassVertical:%d memoryClass:%d graphicsClass:%d appearanceIdentifier:%d graphicsFallBackOrder:%@ deviceSubtypeFallBackOrder:%@ locale:%@]", (uint64_t)a3, a5, a6, a7, a8, a9, (uint64_t)a3);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = __237__CUICatalog__imageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_memoryClass_graphicsClass_appearanceIdentifier_graphicsFallBackOrder_deviceSubtypeFallBackOrder_locale___block_invoke;
  v28[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v28[4] = a13;
  id result = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, a5, a6, a7, a8, a9, a4, a10, a11, a12, a14, a15, a16, sel__baseImageKeyForName_, v28,
             a11,
             a12,
             a13,
             a14,
             a15,
             a16);
  if (result)
  {
    id v21 = result;
    if ([result themePart] == (id)220) {
      return 0;
    }
    unint64_t v22 = [(CUICatalog *)self _storageRefForRendition:v21 representsODRContent:v29];
    if (v22 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      uint64_t v23 = [[CUINamedImage alloc] initWithName:a3 usingRenditionKey:v21 fromTheme:v22];
      [(CUINamedLookup *)v23 setRepresentsOnDemandContent:v29[0]];
      return v23;
    }
  }
  return result;
}

- (unint64_t)storageRef
{
  return self->_storageRef;
}

- (void)setStorageRef:(unint64_t)a3
{
  self->_unint64_t storageRef = a3;
}

- (id)dataWithName:(id)a3
{
  return [(CUICatalog *)self dataWithName:a3 appearanceName:0];
}

uint64_t __68__CUICatalog_colorWithName_displayGamut_deviceIdiom_appearanceName___block_invoke_2()
{
  uint64_t result = objc_opt_class();
  colorWithName_displayGamut_deviceIdiom_appearanceName____colorClass = result;
  return result;
}

- (void)dealloc
{
  if ((*((unsigned char *)self + 82) & 1) == 0 && self->_storageRef != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v3 removeObserver:self name:_NSBundleResourceRequestAssetPackUnpinnedNotification object:self->_bundle];
  }
  [(CUICatalog *)self clearCachedImageResources];

  if (*((unsigned char *)self + 82)) {
    +[CUIThemeFacet themeUnregisterThemeRef:self->_storageRef];
  }

  v4.receiver = self;
  v4.super_class = (Class)CUICatalog;
  [(CUICatalog *)&v4 dealloc];
}

- (void)clearCachedImageResources
{
  if (self->_storageRef != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = [(CUICatalog *)self _themeStore];
    _CUILog(3, (uint64_t)"-[CUICatalog clearCachedImageResources] on themestore '%@'", v4, v5, v6, v7, v8, v9, (uint64_t)v3);
    [v3 clearRenditionCache];
    [(NSCache *)self->_lookupCache removeAllObjects];
    negativeCache = self->_negativeCache;
    [(NSCache *)negativeCache removeAllObjects];
  }
}

+ (BOOL)isValidLCRWithBytes:(const void *)a3 length:(unint64_t)a4
{
  return +[CUICommonAssetStorage isValidAssetStorageWithBytes:a3 length:a4];
}

+ (BOOL)isValidAssetStorageWithURL:(id)a3
{
  return +[CUICommonAssetStorage isValidAssetStorageWithURL:a3];
}

+ (id)defaultUICatalogForBundle:(id)a3
{
  id v3 = (NSBundle *)a3;
  if (a3 || (id v3 = +[NSBundle mainBundle]) != 0)
  {
    if (__onceToken_1 != -1) {
      dispatch_once(&__onceToken_1, &__block_literal_global_20);
    }
    uint64_t v6 = 0;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x3052000000;
    uint64_t v9 = __Block_byref_object_copy__3;
    uint64_t v10 = __Block_byref_object_dispose__3;
    uint64_t v11 = 0;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __40__CUICatalog_defaultUICatalogForBundle___block_invoke_5;
    v5[3] = &unk_1E5A5F258;
    v5[4] = v3;
    v5[5] = &v6;
    dispatch_sync((dispatch_queue_t)__cacheQueue, v5);
    id v3 = (NSBundle *)(id)v7[5];
    _Block_object_dispose(&v6, 8);
  }
  return v3;
}

id __40__CUICatalog_defaultUICatalogForBundle___block_invoke()
{
  __cacheQueue = (uint64_t)dispatch_queue_create("com.apple.CoreUI.UICatalog-cache", 0);
  id result = [objc_alloc((Class)NSMapTable) initWithKeyOptions:5 valueOptions:0 capacity:0];
  __catalogCache_0 = (uint64_t)result;
  return result;
}

CUICatalog *__40__CUICatalog_defaultUICatalogForBundle___block_invoke_5(uint64_t a1)
{
  id result = (CUICatalog *)[(id)__catalogCache_0 objectForKey:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id result = [[CUICatalog alloc] initWithName:@"Assets" fromBundle:*(void *)(a1 + 32) error:0];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      id v3 = (void *)__catalogCache_0;
      return (CUICatalog *)objc_msgSend(v3, "setObject:forKey:");
    }
  }
  return result;
}

+ (id)bestMatchUsingObjects:(id)a3 getAttributeValueUsing:(id)a4 scaleFactor:(double)a5 deviceIdiom:(int64_t)a6 deviceSubtype:(unint64_t)a7 displayGamut:(int64_t)a8 deploymentTarget:(int64_t)a9 layoutDirection:(int64_t)a10 sizeClassHorizontal:(int64_t)a11 sizeClassVertical:(int64_t)a12 memoryClass:(int64_t)a13 graphicsFeatureSetClass:(int64_t)a14 graphicsFallBackOrder:(id)a15 deviceSubtypeFallBackOrder:(id)a16
{
  return [a1 bestMatchUsingObjects:a3 getAttributeValueUsing:a4 scaleFactor:a6 deviceIdiom:a7 deviceSubtype:a8 displayGamut:a9 deploymentTarget:a5 layoutDirection:a10 sizeClassHorizontal:a11 sizeClassVertical:a12 memoryClass:a13 graphicsFeatureSetClass:a14 graphicsFallBackOrder:a15 deviceSubtypeFallBackOrder:a16 platform:CUICurrentPlatform()];
}

+ (id)bestMatchUsingObjects:(id)a3 getAttributeValueUsing:(id)a4 scaleFactor:(double)a5 deviceIdiom:(int64_t)a6 deviceSubtype:(unint64_t)a7 displayGamut:(int64_t)a8 deploymentTarget:(int64_t)a9 layoutDirection:(int64_t)a10 sizeClassHorizontal:(int64_t)a11 sizeClassVertical:(int64_t)a12 memoryClass:(int64_t)a13 graphicsFeatureSetClass:(int64_t)a14 graphicsFallBackOrder:(id)a15 deviceSubtypeFallBackOrder:(id)a16 platform:(int64_t)a17
{
  unsigned int v21 = CUIMaxScaleForTargetPlatform(a17);
  unint64_t v65 = (unint64_t)[a15 count];
  unint64_t v22 = (char *)[a16 count];
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  do
  {
    if (__memorySearchValues[v23] == a13) {
      uint64_t v24 = v23;
    }
    ++v23;
  }
  while (v23 != 9);
  if ((v24 & 0x8000000000000000) == 0)
  {
    uint64_t v70 = v24;
    int64_t v57 = v22;
    int64_t v68 = a8;
    uint64_t v25 = 4;
    if (__PAIR128__(a12, a11) == 0) {
      uint64_t v26 = 4;
    }
    else {
      uint64_t v26 = 1;
    }
    uint64_t v67 = v26;
    double v27 = (double)v21;
    if (a10 == 4) {
      uint64_t v25 = 5;
    }
    uint64_t v62 = v25;
    unsigned int v55 = v22 - 1;
    while (1)
    {
      unint64_t v56 = 0x7FFFFFFFFFFFFFFFLL;
      id v28 = (id)a7;
      while (2)
      {
        int64_t v29 = a14;
        int64_t v30 = v68;
        int64_t v31 = a6;
LABEL_14:
        id v32 = v28;
        int64_t v59 = v29;
        if (v29) {
          BOOL v33 = v65 == 0;
        }
        else {
          BOOL v33 = 1;
        }
        char v34 = v33;
        char v60 = v34;
        unint64_t v58 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
LABEL_21:
          char v64 = 0;
          uint64_t v61 = -1;
          int64_t v75 = a10;
          int64_t v76 = a9;
          int64_t v36 = a12;
          int64_t v35 = a11;
          int64_t v37 = v30;
          int64_t v38 = v31;
          double v39 = a5;
LABEL_22:
          uint64_t v40 = v67;
          while (1)
          {
            while (1)
            {
              while (1)
              {
                while (1)
                {
                  do
                  {
                    uint64_t v71 = v40;
                    int64_t v73 = v36;
                    int64_t v74 = v35;
                    long long v79 = 0u;
                    long long v80 = 0u;
                    long long v77 = 0u;
                    long long v78 = 0u;
                    id v41 = [a3 countByEnumeratingWithState:&v77 objects:v81 count:16];
                    if (v41)
                    {
                      id v42 = v41;
                      uint64_t v43 = *(void *)v78;
LABEL_25:
                      uint64_t v44 = 0;
                      while (1)
                      {
                        if (*(void *)v78 != v43) {
                          objc_enumerationMutation(a3);
                        }
                        id v45 = *(void **)(*((void *)&v77 + 1) + 8 * v44);
                        if (v39 == (double)(*((uint64_t (**)(id, void *, uint64_t))a4 + 2))(a4, v45, 12)
                          && (*((uint64_t (**)(id, void *, uint64_t))a4 + 2))(a4, v45, 15) == v38
                          && (id)(*((uint64_t (**)(id, void *, uint64_t))a4 + 2))(a4, v45, 16) == v32
                          && (*((uint64_t (**)(id, void *, uint64_t))a4 + 2))(a4, v45, 24) == v37
                          && (*((uint64_t (**)(id, void *, uint64_t))a4 + 2))(a4, v45, 25) == v76
                          && (*((uint64_t (**)(id, void *, uint64_t))a4 + 2))(a4, v45, 4) == v75
                          && (*((uint64_t (**)(id, void *, uint64_t))a4 + 2))(a4, v45, 20) == v74
                          && (*((uint64_t (**)(id, void *, uint64_t))a4 + 2))(a4, v45, 21) == v73
                          && (*((uint64_t (**)(id, void *, uint64_t))a4 + 2))(a4, v45, 23) == a14
                          && (*((uint64_t (**)(id, void *, uint64_t))a4 + 2))(a4, v45, 22) == __memorySearchValues[v70])
                        {
                          return v45;
                        }
                        if (v42 == (id)++v44)
                        {
                          id v42 = [a3 countByEnumeratingWithState:&v77 objects:v81 count:16];
                          if (v42) {
                            goto LABEL_25;
                          }
                          break;
                        }
                      }
                    }
                    int64_t v35 = 0;
                    if (v71 == 1)
                    {
                      int64_t v46 = a11;
                      uint64_t v40 = 2;
                      goto LABEL_45;
                    }
                    int64_t v36 = a12;
                    uint64_t v40 = 3;
                  }
                  while (v71 == 2);
                  if (v71 != 3) {
                    break;
                  }
                  int64_t v35 = 0;
                  int64_t v36 = 0;
                  uint64_t v40 = 4;
                }
                int64_t v31 = a6;
                if (!a6 || v38 != a6) {
                  break;
                }
                int64_t v38 = 0;
                int64_t v36 = a12;
                int64_t v35 = a11;
                uint64_t v40 = 1;
                if (__PAIR128__(a12, a11) == 0)
                {
                  int64_t v35 = v73;
                  int64_t v46 = v74;
                  uint64_t v40 = 4;
                  goto LABEL_45;
                }
              }
              int64_t v30 = v68;
              if (v68 && v37 == v68)
              {
                int64_t v37 = 0;
                int64_t v35 = a11;
                if (__PAIR128__(a12, a11) == 0) {
                  int64_t v35 = v74;
                }
                int64_t v36 = a12;
                if (__PAIR128__(a12, a11) == 0) {
                  int64_t v36 = v73;
                }
                goto LABEL_76;
              }
              if (a10 && v75)
              {
                int64_t v48 = v62;
                if (v64) {
                  int64_t v48 = 0;
                }
                int64_t v75 = v48;
                int64_t v35 = a11;
                if (__PAIR128__(a12, a11) == 0) {
                  int64_t v35 = v74;
                }
                int64_t v36 = a12;
                if (__PAIR128__(a12, a11) == 0) {
                  int64_t v36 = v73;
                }
                char v64 = 1;
                goto LABEL_75;
              }
              if (a9 && v76)
              {
                char v64 = 0;
                int64_t v75 = a10;
                --v76;
                int64_t v36 = a12;
                int64_t v35 = a11;
LABEL_75:
                int64_t v37 = v68;
LABEL_76:
                int64_t v38 = a6;
                goto LABEL_22;
              }
              double v47 = v39 + (double)v61;
              if ((v61 & 0x8000000000000000) == 0) {
                break;
              }
              char v64 = 0;
              int64_t v75 = a10;
              int64_t v76 = a9;
              int64_t v36 = a12;
              int64_t v35 = a11;
              int64_t v37 = v68;
              int64_t v38 = a6;
              double v39 = a5;
              uint64_t v61 = 1;
              uint64_t v40 = v67;
              if (v47 > 0.0)
              {
                uint64_t v61 = -1;
                int64_t v38 = a6;
                int64_t v75 = a10;
                int64_t v76 = a9;
                int64_t v35 = a12;
                int64_t v46 = a11;
                int64_t v37 = v68;
                goto LABEL_61;
              }
            }
            if (v47 > v27) {
              break;
            }
            char v64 = 0;
            int64_t v75 = a10;
            int64_t v76 = a9;
            int64_t v35 = a12;
            int64_t v46 = a11;
            int64_t v37 = v68;
            int64_t v38 = a6;
LABEL_61:
            double v39 = v47;
            uint64_t v40 = v67;
LABEL_45:
            int64_t v36 = v35;
            int64_t v35 = v46;
          }
          if ((v60 & 1) == 0)
          {
            if (v58 == 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v51 = 0;
            }
            else
            {
              if (v58 >= v65 - 1)
              {
                a14 = v59;
                int64_t v31 = a6;
                break;
              }
              unint64_t v51 = v58 + 1;
            }
            unint64_t v58 = v51;
            a14 = (int64_t)objc_msgSend(objc_msgSend(a15, "objectAtIndex:"), "integerValue");
            int64_t v31 = a6;
            goto LABEL_21;
          }
          int64_t v49 = a14 | v65;
          a14 = 0;
          BOOL v50 = v49 == 0;
        }
        while (v59 && !v50);
        if (!a7) {
          goto LABEL_96;
        }
        if (v57)
        {
          if (v56 == 0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v56 = 0;
            id v52 = [a16 objectAtIndex:0];
          }
          else
          {
            if (v56 >= (unint64_t)v55) {
              goto LABEL_96;
            }
            id v52 = [a16 objectAtIndex:++v56];
          }
          id v28 = [v52 integerValue];
          continue;
        }
        break;
      }
      id v28 = 0;
      int64_t v29 = a14;
      if (v32) {
        goto LABEL_14;
      }
LABEL_96:
      id v45 = 0;
      if (v70-- <= 0) {
        return v45;
      }
    }
  }
  return 0;
}

+ (id)bestMatchUsingImages:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6
{
  return [(id)objc_opt_class() bestMatchUsingImages:a3 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:0 displayGamut:0 layoutDirection:0 sizeClassHorizontal:a4 sizeClassVertical:0];
}

+ (id)bestMatchUsingImages:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8
{
  return [(id)objc_opt_class() bestMatchUsingImages:a3 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:0 displayGamut:0 layoutDirection:0 sizeClassHorizontal:a4 sizeClassVertical:0];
}

+ (id)bestMatchUsingImages:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 displayGamut:(unint64_t)a6 deviceSubtype:(unint64_t)a7 sizeClassHorizontal:(int64_t)a8 sizeClassVertical:(int64_t)a9
{
  return [(id)objc_opt_class() bestMatchUsingImages:a3 scaleFactor:a5 deviceIdiom:a7 deviceSubtype:a6 displayGamut:0 layoutDirection:0 sizeClassHorizontal:a4 sizeClassVertical:0];
}

+ (id)bestMatchUsingImages:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(unint64_t)a7 layoutDirection:(unint64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10
{
  id v18 = +[NSMutableArray array];
  if (a5 == 5) {
    CUIWatchSubTypeFallbackOrder(a6, v18);
  }
  objc_msgSend(v18, "addObject:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
  return [a1 bestMatchUsingObjects:a3 getAttributeValueUsing:&__block_literal_global_14 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:a7 displayGamut:0 deploymentTarget:a4 layoutDirection:a8 sizeClassHorizontal:a9 sizeClassVertical:a10 memoryClass:0 graphicsFeatureSetClass:0 graphicsFallBackOrder:0 deviceSubtypeFallBackOrder:v18];
}

id __140__CUICatalog_bestMatchUsingImages_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical___block_invoke(uint64_t a1, void *a2, int a3)
{
  id result = 0;
  switch(a3)
  {
    case 12:
      objc_msgSend(a2, "scale", v3, v4);
      id result = (id)(uint64_t)v6;
      break;
    case 15:
      id result = [a2 idiom];
      break;
    case 16:
      id result = [a2 subtype];
      break;
    case 20:
      id result = [a2 sizeClassHorizontal];
      break;
    case 21:
      id result = [a2 sizeClassVertical];
      break;
    case 22:
      id result = [a2 memoryClass];
      break;
    case 23:
      id result = [a2 graphicsClass];
      break;
    case 24:
      id result = [a2 displayGamut];
      break;
    default:
      return result;
  }
  return result;
}

- (CUICatalog)initWithName:(id)a3 fromBundle:(id)a4
{
  return [(CUICatalog *)self initWithName:a3 fromBundle:a4 error:0];
}

- (id)_nameForLocalizationIdentifier:(int64_t)a3
{
  unsigned __int16 v3 = a3;
  uint64_t v4 = (void *)_LookupStructuredThemeProvider(self->_storageRef, a2);
  return [v4 nameForLocalizationIdentifier:v3];
}

- (CUICatalog)initWithURL:(id)a3 error:(id *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CUICatalog;
  double v6 = [(CUICatalog *)&v9 init];
  if (v6)
  {
    if ([a3 checkResourceIsReachableAndReturnError:a4]
      && (*((unsigned char *)v6 + 82) |= 1u,
          v6->_assetStoreName = (NSString *)objc_msgSend(objc_msgSend(objc_msgSend(a3, "URLByDeletingPathExtension"), "lastPathComponent"), "copy"), v7 = +[CUIThemeFacet themeWithContentsOfURL:error:](CUIThemeFacet, "themeWithContentsOfURL:error:", a3, a4), (v6->_unint64_t storageRef = v7) != 0))
    {
      [(CUICatalog *)v6 lookupCache];
      [(CUICatalog *)v6 negativeCache];
      [(CUICatalog *)v6 localObjectCache];
      [(CUICatalog *)v6 _setPreferredLocalization:0];
    }
    else
    {
      v6->_unint64_t storageRef = 0x7FFFFFFFFFFFFFFFLL;

      return 0;
    }
  }
  return v6;
}

- (CUICatalog)initWithBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  v12.receiver = self;
  v12.super_class = (Class)CUICatalog;
  uint64_t v8 = [(CUICatalog *)&v12 init];
  objc_super v9 = v8;
  if (v8)
  {
    *((unsigned char *)v8 + 82) |= 1u;
    unint64_t v10 = +[CUIThemeFacet themeWithBytes:a3 length:a4 error:a5];
    v9->_unint64_t storageRef = v10;
    if (v10)
    {
      [(CUICatalog *)v9 lookupCache];
      [(CUICatalog *)v9 negativeCache];
      [(CUICatalog *)v9 localObjectCache];
      [(CUICatalog *)v9 _setPreferredLocalization:0];
    }
    else
    {
      v9->_unint64_t storageRef = 0x7FFFFFFFFFFFFFFFLL;

      return 0;
    }
  }
  return v9;
}

- (void)_resourceUnPinnedNotification:(id)a3
{
  if (self->_storageMapTable)
  {
    id v5 = [a3 userInfo];
    id v6 = [v5 objectForKey:_NSBundleResourceRequestAssetPackNotificationAssetPackIDKey];
    unint64_t v7 = NSMapGet(self->_storageMapTable, v6);
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      objc_msgSend(objc_msgSend(a3, "object"), "bundleIdentifier");
      _CUILog(3, (uint64_t)"CoreUI: -[CUICatalog _resourceUnPinnedNotification:] for themeRef '%d' (for bundle identifier '%@' and asset pack identifier '%@').", v9, v10, v11, v12, v13, v14, v8);
      +[CUIThemeFacet themeUnregisterThemeRef:v8];
    }
    else
    {
      id v15 = objc_msgSend(objc_msgSend(a3, "object"), "bundleIdentifier");
      _CUILog(3, (uint64_t)"CoreUI: -[CUICatalog _resourceUnPinnedNotification:] did not find themeRef for for bundle identifier '%@' and asset pack identifier '%@'.", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
    }
    storageMapTable = self->_storageMapTable;
    NSMapRemove(storageMapTable, v6);
  }
}

- (id)_recognitionImageWithName:(id)a3
{
  unsigned __int8 v21 = 0;
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  uint64_t v10 = __getDeviceTraits___deviceIdiom;
  uint64_t v11 = __getDeviceTraits___deviceSubtype;
  uint64_t v12 = __getDeviceTraits___deviceDisplayGamut;
  uint64_t v13 = __getDeviceTraits___deviceMemoryClass;
  uint64_t v14 = __getDeviceTraits___deviceGraphicsClass;
  uint64_t v15 = __getDeviceTraits___deviceGraphicsFallbackOrder;
  uint64_t v16 = __getDeviceTraits___deviceSubtypeFallbackOrder;
  _CUILog(3, (uint64_t)"-[CUICatalog _recognitionImageWithName:%@]", (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)a3);
  id result = [(CUICatalog *)self _resolvedRenditionKeyForName:a3 scaleFactor:v10 deviceIdiom:v11 deviceSubtype:v12 displayGamut:0 layoutDirection:0 sizeClassHorizontal:1.0 sizeClassVertical:0 memoryClass:v13 graphicsClass:v14 graphicsFallBackOrder:v15 deviceSubtypeFallBackOrder:v16 locale:0 withBaseKeySelector:0 adjustRenditionKeyWithBlock:0];
  if (result)
  {
    id v18 = result;
    if ([result themePart] == (id)220) {
      return 0;
    }
    unint64_t v19 = [(CUICatalog *)self _storageRefForRendition:v18 representsODRContent:&v21];
    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      uint64_t v20 = [[CUINamedRecognitionImage alloc] initWithName:a3 usingRenditionKey:v18 fromTheme:v19];
      [(CUINamedLookup *)v20 setRepresentsOnDemandContent:v21];
      return v20;
    }
  }
  return result;
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4
{
  return [(CUICatalog *)self imageWithName:a3 scaleFactor:0 deviceIdiom:0 deviceSubtype:a4];
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 locale:(id)a5
{
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  return [(CUICatalog *)self imageWithName:a3 scaleFactor:__getDeviceTraits___deviceIdiom deviceIdiom:__getDeviceTraits___deviceSubtype deviceSubtype:__getDeviceTraits___deviceDisplayGamut displayGamut:0 layoutDirection:0 sizeClassHorizontal:a4 sizeClassVertical:0 appearanceName:0 locale:a5];
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 appearanceName:(id)a5
{
  return [(CUICatalog *)self imageWithName:a3 scaleFactor:0 deviceIdiom:0 deviceSubtype:a5 appearanceName:a4];
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 layoutDirection:(int64_t)a6
{
  return [(CUICatalog *)self imageWithName:a3 scaleFactor:0 deviceIdiom:0 deviceSubtype:a5 displayGamut:a6 layoutDirection:0 sizeClassHorizontal:a4 sizeClassVertical:0 appearanceName:0 locale:0];
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 layoutDirection:(int64_t)a6 appearanceName:(id)a7
{
  return [(CUICatalog *)self imageWithName:a3 scaleFactor:0 deviceIdiom:0 deviceSubtype:a5 displayGamut:a6 layoutDirection:0 sizeClassHorizontal:a4 sizeClassVertical:0 appearanceName:a7 locale:0];
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 layoutDirection:(int64_t)a6 appearanceName:(id)a7 locale:(id)a8
{
  return [(CUICatalog *)self imageWithName:a3 scaleFactor:0 deviceIdiom:0 deviceSubtype:a5 displayGamut:a6 layoutDirection:0 sizeClassHorizontal:a4 sizeClassVertical:0 appearanceName:a7 locale:a8];
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5
{
  return [(CUICatalog *)self imageWithName:a3 scaleFactor:a5 deviceIdiom:0 appearanceName:a4];
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 appearanceName:(id)a6
{
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  uint64_t v11 = __getDeviceTraits___deviceSubtype;
  return [(CUICatalog *)self imageWithName:a3 scaleFactor:a5 deviceIdiom:v11 deviceSubtype:a6 appearanceName:a4];
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6
{
  return [(CUICatalog *)self imageWithName:a3 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:0 sizeClassHorizontal:0 sizeClassVertical:a4];
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 appearanceName:(id)a7
{
  return [(CUICatalog *)self imageWithName:a3 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:0 sizeClassHorizontal:0 sizeClassVertical:a7 appearanceName:a4];
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8
{
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  return [(CUICatalog *)self imageWithName:a3 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:__getDeviceTraits___deviceDisplayGamut displayGamut:0 layoutDirection:a7 sizeClassHorizontal:a4 sizeClassVertical:a8];
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8 appearanceName:(id)a9
{
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  return [(CUICatalog *)self imageWithName:a3 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:__getDeviceTraits___deviceDisplayGamut displayGamut:0 layoutDirection:a7 sizeClassHorizontal:a4 sizeClassVertical:a8 appearanceName:a9];
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10
{
  return [(CUICatalog *)self imageWithName:a3 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:a7 displayGamut:a8 layoutDirection:a9 sizeClassHorizontal:a4 sizeClassVertical:a10 appearanceName:0 locale:0];
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 memoryClass:(int64_t)a11 graphicsClass:(int64_t)a12
{
  return -[CUICatalog imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:](self, "imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:appearanceName:locale:", a3, a5, a6, a7, a8, a9, a4);
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 memoryClass:(unint64_t)a11 graphicsClass:(unint64_t)a12 graphicsFallBackOrder:(id)a13 deviceSubtypeFallBackOrder:(id)a14
{
  return [(CUICatalog *)self imageWithName:a3 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:a7 displayGamut:a8 layoutDirection:a9 sizeClassHorizontal:a4 sizeClassVertical:a10 memoryClass:a11 graphicsClass:a12 appearanceIdentifier:0 graphicsFallBackOrder:a13 deviceSubtypeFallBackOrder:a14 locale:0];
}

- (id)imageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 memoryClass:(unint64_t)a11 graphicsClass:(unint64_t)a12 appearanceIdentifier:(int64_t)a13 graphicsFallBackOrder:(id)a14 deviceSubtypeFallBackOrder:(id)a15
{
  return [(CUICatalog *)self imageWithName:a3 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:a7 displayGamut:a8 layoutDirection:a9 sizeClassHorizontal:a4 sizeClassVertical:a10 memoryClass:a11 graphicsClass:a12 appearanceIdentifier:a13 graphicsFallBackOrder:a14 deviceSubtypeFallBackOrder:a15 locale:0];
}

- (id)iconImageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 desiredSize:(CGSize)a11
{
  return -[CUICatalog iconImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:desiredSize:appearanceName:](self, "iconImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:desiredSize:appearanceName:", a3, a5, a6, a7, a8, a9, a4, a11.width, a11.height, a10, 0);
}

- (id)iconImageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 desiredSize:(CGSize)a11 appearanceName:(id)a12
{
  CGFloat height = a11.height;
  double width = a11.width;
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  uint64_t v97 = 0;
  uint64_t v21 = __getDeviceTraits___deviceIdiom;
  uint64_t v22 = __getDeviceTraits___deviceSubtype;
  obj = (NSArray *)__getDeviceTraits___deviceSubtypeFallbackOrder;
  if (self && a12) {
    uint64_t v97 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "appearanceIdentifierForName:", a12);
  }
  if (v21 != a5 || v22 != a6)
  {
    if (a5 == 5)
    {
      uint64_t v24 = (NSArray *)+[NSMutableArray array];
      CUIWatchSubTypeFallbackOrder(a6, v24);
      obj = v24;
      [(NSArray *)v24 addObject:+[NSNumber numberWithInt:0]];
    }
    else
    {
      v110 = +[NSNumber numberWithInt:0];
      obj = +[NSArray arrayWithObjects:&v110 count:1];
    }
  }
  _CUILog(3, (uint64_t)"-[CUICatalog iconImageWithName:%@ scaleFactor:%f deviceIdiom:%d deviceSubtype:%d displayGamut:%d layoutDirection:%d sizeClassHorizontal:%d sizeClassVertical:%d desiredSize:%fx%f appearanceName:%@]", (uint64_t)a3, a5, a6, a7, a8, a9, (uint64_t)a3);
  id v25 = objc_alloc_init((Class)NSMutableSet);
  id v26 = -[CUICatalog _resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:](self, "_resolvedRenditionKeyForName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:withBaseKeySelector:adjustRenditionKeyWithBlock:", a3, a5, a6, 0, 0, 0, 1.0, 0, 0, 0, 0, obj, 0, sel__baseMultisizeImageSetKeyForName_, 0,
          *(void *)&width,
          *(void *)&height,
          a12);
  if (!v26) {
    goto LABEL_60;
  }
  double v27 = v26;
  unsigned __int8 v108 = 0;
  unint64_t v28 = [(CUICatalog *)self _storageRefForRendition:v26 representsODRContent:&v108];
  if (v28 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_60;
  }
  unint64_t v29 = v28;
  [v25 addObject:v27];
  unint64_t v90 = [[CUINamedMultisizeImageSet alloc] initWithName:a3 usingRenditionKey:v27 fromTheme:v29];
  if (!v90) {
    goto LABEL_60;
  }
  int64_t v96 = a5;
  v98 = self;
  uint64_t v93 = v27;
  if ([v27 themeSubtype])
  {
    v107[0] = _NSConcreteStackBlock;
    v107[1] = 3221225472;
    v107[2] = __164__CUICatalog_iconImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_desiredSize_appearanceName___block_invoke;
    v107[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
    v107[4] = v97;
    id v30 = [(CUICatalog *)self _resolvedRenditionKeyForName:a3 scaleFactor:a5 deviceIdiom:0 deviceSubtype:0 displayGamut:0 layoutDirection:0 sizeClassHorizontal:1.0 sizeClassVertical:0 memoryClass:0 graphicsClass:0 graphicsFallBackOrder:0 deviceSubtypeFallBackOrder:obj locale:0 withBaseKeySelector:sel__baseMultisizeImageSetKeyForName_ adjustRenditionKeyWithBlock:v107];
    if (v30 && ([v25 containsObject:v30] & 1) == 0)
    {
      [v25 addObject:v30];
      v89 = [[CUINamedMultisizeImageSet alloc] initWithName:a3 usingRenditionKey:v30 fromTheme:v29];
    }
    else
    {
      v89 = 0;
    }
  }
  else
  {
    v89 = 0;
    id v30 = 0;
  }
  int64_t v91 = a7;
  int64_t v87 = a9;
  id v31 = [v93 themeIdiom];
  id v32 = 0;
  if (v30 && v31)
  {
    if ([v30 themeIdiom]
      && (v106[0] = _NSConcreteStackBlock,
          v106[1] = 3221225472,
          v106[2] = __164__CUICatalog_iconImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_desiredSize_appearanceName___block_invoke_2,
          v106[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l,
          v106[4] = v97,
          (id v33 = [(CUICatalog *)self _resolvedRenditionKeyForName:a3 scaleFactor:0 deviceIdiom:0 deviceSubtype:0 displayGamut:0 layoutDirection:0 sizeClassHorizontal:1.0 sizeClassVertical:0 memoryClass:0 graphicsClass:0 graphicsFallBackOrder:0 deviceSubtypeFallBackOrder:0 locale:0 withBaseKeySelector:sel__baseMultisizeImageSetKeyForName_ adjustRenditionKeyWithBlock:v106]) != 0)
      && (id v34 = v33, ([v25 containsObject:v33] & 1) == 0))
    {
      [v25 addObject:v34];
      id v32 = [[CUINamedMultisizeImageSet alloc] initWithName:a3 usingRenditionKey:v34 fromTheme:v29];
    }
    else
    {
      id v32 = 0;
    }
  }
  unint64_t v94 = v29;
  int64_t v35 = v25;
  unint64_t v92 = a6;
  int64_t v36 = +[NSMutableArray arrayWithArray:[(CUINamedMultisizeImageSet *)v90 sizeIndexes]];
  [(NSMutableArray *)v36 addObjectsFromArray:[(CUINamedMultisizeImageSet *)v89 sizeIndexes]];
  uint64_t v88 = v32;
  [(NSMutableArray *)v36 addObjectsFromArray:[(CUINamedMultisizeImageSet *)v32 sizeIndexes]];
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v37 = [(NSArray *)obj countByEnumeratingWithState:&v102 objects:v109 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v103;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v103 != v39) {
          objc_enumerationMutation(obj);
        }
        id v41 = [*(id *)(*((void *)&v102 + 1) + 8 * i) integerValue];
        v101[0] = _NSConcreteStackBlock;
        v101[1] = 3221225472;
        v101[2] = __164__CUICatalog_iconImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_desiredSize_appearanceName___block_invoke_3;
        v101[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
        v101[4] = v97;
        id v42 = [(CUICatalog *)v98 _resolvedRenditionKeyForName:a3 scaleFactor:a5 deviceIdiom:v41 deviceSubtype:0 displayGamut:0 layoutDirection:0 sizeClassHorizontal:1.0 sizeClassVertical:0 memoryClass:0 graphicsClass:0 graphicsFallBackOrder:0 deviceSubtypeFallBackOrder:0 locale:0 withBaseKeySelector:sel__baseMultisizeImageSetKeyForName_ adjustRenditionKeyWithBlock:v101];
        if (v42)
        {
          id v43 = v42;
          if (([v35 containsObject:v42] & 1) == 0)
          {
            [v35 addObject:v43];
            uint64_t v44 = [[CUINamedMultisizeImageSet alloc] initWithName:a3 usingRenditionKey:v43 fromTheme:v94];
            [(NSMutableArray *)v36 addObjectsFromArray:[(CUINamedMultisizeImageSet *)v44 sizeIndexes]];
          }
        }
      }
      id v38 = [(NSArray *)obj countByEnumeratingWithState:&v102 objects:v109 count:16];
    }
    while (v38);
  }
  double v45 = CGSizeZero.width;
  double v46 = CGSizeZero.height;
  id v47 = [(NSMutableArray *)v36 sortedArrayUsingComparator:&__block_literal_global_44];
  int64_t v48 = (char *)[v47 count];
  if (v48)
  {
    int64_t v49 = v48;
    int64_t v51 = a8;
    int64_t v50 = v87;
    int64_t v52 = v91;
    while (1)
    {
      double width = (double)width;
      unsigned int v53 = objc_msgSend(objc_msgSend(v47, "objectAtIndex:", v49 - 1), "index");
      uint64_t v54 = 0;
      unsigned int v55 = -1;
      while (1)
      {
        id v56 = [v47 objectAtIndex:v54];
        [v56 size];
        double v58 = v57;
        if (v57 >= width) {
          break;
        }
        ++v54;
        ++v55;
        if (v49 == v54)
        {
          uint64_t v54 = v49;
          goto LABEL_51;
        }
      }
      unsigned int v59 = [v56 index];
      unsigned int v53 = v59;
      if (v54)
      {
        int64_t v60 = v51;
        int64_t v61 = v50;
        unsigned int v62 = v59;
        id v63 = [v47 objectAtIndex:v54];
        while ((v55 & 0x80000000) == 0)
        {
          id v64 = [v47 objectAtIndex:v55];
          [v64 size];
          double v66 = v65;
          [v63 size];
          if (v66 == v67)
          {
            [v64 size];
            double v69 = v68;
            [v63 size];
            --v55;
            if (v69 == v70) {
              continue;
            }
          }
          [v64 size];
          double v45 = v71;
          double v46 = v72;
          break;
        }
        unsigned int v53 = v62;
        int64_t v50 = v61;
        int64_t v51 = v60;
        int64_t v52 = v91;
      }
LABEL_51:
      uint64_t v73 = v53;
      id v74 = [v93 copy];
      [v74 setThemePart:220];
      unint64_t storageRef = v98->_storageRef;
      v100[0] = _NSConcreteStackBlock;
      v100[1] = 3221225472;
      v100[2] = __164__CUICatalog_iconImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_desiredSize_appearanceName___block_invoke_5;
      v100[3] = &__block_descriptor_48_e25_v16__0__CUIRenditionKey_8l;
      v100[4] = v73;
      v100[5] = v97;
      id v76 = [(CUICatalog *)v98 _resolvedRenditionKeyFromThemeRef:storageRef withBaseKey:v74 scaleFactor:v96 deviceIdiom:v92 deviceSubtype:v52 displayGamut:v51 layoutDirection:a4 sizeClassHorizontal:v50 sizeClassVertical:a10 memoryClass:0 graphicsClass:0 graphicsFallBackOrder:0 deviceSubtypeFallBackOrder:obj locale:0 adjustRenditionKeyWithBlock:v100];

      if (v58 < width || v76 || (unint64_t)v49 < 2) {
        break;
      }
      id v77 = [v47 mutableCopy];
      [v77 removeObjectAtIndex:v54];
      id v47 = v77;
      int64_t v49 = (char *)[v47 count];
      long long v78 = v98;
      if (!v49) {
        goto LABEL_57;
      }
    }
  }
  else
  {
    long long v78 = v98;
LABEL_57:
    objc_msgSend(objc_msgSend(-[CUICatalog _themeStore](v78, "_themeStore"), "themeStore"), "path");
    _CUILog(4, (uint64_t)"CoreUI: icon image with name '%@' has no sizes indexes at '%@'", v79, v80, v81, v82, v83, v84, (uint64_t)a3);
    id v76 = 0;
  }

  id v25 = v35;
  if (v76)
  {
    v85 = [(CUINamedImage *)[CUINamedMultisizeImage alloc] initWithName:a3 usingRenditionKey:v76 fromTheme:v94];
    [(CUINamedLookup *)v85 setRepresentsOnDemandContent:v108];
    -[CUINamedMultisizeImage setNextSizeSmaller:](v85, "setNextSizeSmaller:", v45, v46);
  }
  else
  {
LABEL_60:
    v85 = 0;
  }

  return v85;
}

id __164__CUICatalog_iconImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_desiredSize_appearanceName___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setThemeAppearance:*(void *)(a1 + 32)];
}

id __164__CUICatalog_iconImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_desiredSize_appearanceName___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setThemeAppearance:*(void *)(a1 + 32)];
}

id __164__CUICatalog_iconImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_desiredSize_appearanceName___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setThemeAppearance:*(void *)(a1 + 32)];
}

uint64_t __164__CUICatalog_iconImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_desiredSize_appearanceName___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  [a2 size];
  double v6 = v5;
  [a2 size];
  double v8 = v6 * v7;
  [a3 size];
  double v10 = v9;
  [a3 size];
  if (v8 < v10 * v11) {
    return -1;
  }
  if (v8 > v10 * v11) {
    return 1;
  }
  id v13 = [a2 subtype];
  if (v13 < [a3 subtype]) {
    return 1;
  }
  id v14 = [a2 subtype];
  if (v14 > [a3 subtype]) {
    return -1;
  }
  id v15 = [a2 idiom];
  if ((uint64_t)v15 < (uint64_t)[a3 idiom]) {
    return 1;
  }
  id v16 = [a2 idiom];
  if ((uint64_t)v16 <= (uint64_t)[a3 idiom]) {
    return 0;
  }
  else {
    return -1;
  }
}

id __164__CUICatalog_iconImageWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_desiredSize_appearanceName___block_invoke_5(uint64_t a1, void *a2)
{
  [a2 setThemeDimension2:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(a1 + 40);
  return [a2 setThemeAppearance:v4];
}

- (BOOL)imageExistsWithName:(id)a3
{
  return objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3) != 0;
}

id __150__CUICatalog__dataWithName_deviceIdiom_deviceSubtype_memoryClass_graphicsClass_appearanceIdentifier_graphicsFallBackOrder_deviceSubtypeFallBackOrder___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setThemeAppearance:*(void *)(a1 + 32)];
}

- (id)dataWithName:(id)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 memoryClass:(unint64_t)a6 graphicsClass:(unint64_t)a7 graphicsFallBackOrder:(id)a8 deviceSubtypeFallBackOrder:(id)a9
{
  return [(CUICatalog *)self dataWithName:a3 deviceIdiom:a4 deviceSubtype:a5 memoryClass:a6 graphicsClass:a7 appearanceIdentifier:0 graphicsFallBackOrder:a8 deviceSubtypeFallBackOrder:a9];
}

- (id)textStyleWithName:(id)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 displayGamut:(int64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8
{
  return [(CUICatalog *)self textStyleWithName:a3 deviceIdiom:a4 deviceSubtype:a5 displayGamut:a6 sizeClassHorizontal:a7 sizeClassVertical:a8 appearanceName:0];
}

- (id)textStyleWithName:(id)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 displayGamut:(int64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8 appearanceName:(id)a9
{
  uint64_t v16 = 0;
  if (self && a9) {
    uint64_t v16 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "appearanceIdentifierForName:", a9);
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __124__CUICatalog_textStyleWithName_deviceIdiom_deviceSubtype_displayGamut_sizeClassHorizontal_sizeClassVertical_appearanceName___block_invoke;
  v21[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v21[4] = v16;
  id result = [(CUICatalog *)self _resolvedRenditionKeyForName:a3 scaleFactor:a4 deviceIdiom:a5 deviceSubtype:a6 displayGamut:0 layoutDirection:a7 sizeClassHorizontal:1.0 sizeClassVertical:a8 memoryClass:0 graphicsClass:0 graphicsFallBackOrder:0 deviceSubtypeFallBackOrder:0 locale:0 withBaseKeySelector:0 adjustRenditionKeyWithBlock:v21];
  if (result)
  {
    id v18 = result;
    char v20 = 0;
    unint64_t v19 = [(CUICatalog *)self _storageRefForRendition:result representsODRContent:&v20];
    if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    else {
      return [[CUITextStyle alloc] initWithName:a3 usingRenditionKey:v18 fromTheme:v19];
    }
  }
  return result;
}

id __124__CUICatalog_textStyleWithName_deviceIdiom_deviceSubtype_displayGamut_sizeClassHorizontal_sizeClassVertical_appearanceName___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setThemeAppearance:*(void *)(a1 + 32)];
}

- (id)textStyleWithName:(id)a3 displayGamut:(int64_t)a4
{
  return [(CUICatalog *)self textStyleWithName:a3 displayGamut:a4 appearanceName:0];
}

- (id)textStyleWithName:(id)a3 displayGamut:(int64_t)a4 appearanceName:(id)a5
{
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  uint64_t v8 = __getDeviceTraits___deviceIdiom;
  uint64_t v9 = __getDeviceTraits___deviceSubtype;
  return [(CUICatalog *)self textStyleWithName:a3 deviceIdiom:v8 deviceSubtype:v9 displayGamut:a4 sizeClassHorizontal:0 sizeClassVertical:0];
}

- (id)_namedImageAtlasWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 displayGamut:(int64_t)a6 deviceSubtype:(unint64_t)a7 memoryClass:(unint64_t)a8 graphicsClass:(unint64_t)a9 graphicsFallBackOrder:(id)a10 deviceSubtypeFallBackOrder:(id)a11
{
  unsigned __int8 v23 = 0;
  id v17 = [(CUICatalog *)self _resolvedRenditionKeyForName:a3 scaleFactor:a5 deviceIdiom:a7 deviceSubtype:a6 displayGamut:0 layoutDirection:0 sizeClassHorizontal:a4 sizeClassVertical:0 memoryClass:a8 graphicsClass:a9 graphicsFallBackOrder:a10 deviceSubtypeFallBackOrder:a11 locale:0 withBaseKeySelector:sel__baseAtlasKeyForName_ adjustRenditionKeyWithBlock:0];
  if (v17
    || (id result = [(CUICatalog *)self _resolvedRenditionKeyForName:a3 scaleFactor:a5 deviceIdiom:a7 deviceSubtype:a6 displayGamut:0 layoutDirection:0 sizeClassHorizontal:0.0 sizeClassVertical:0 memoryClass:a8 graphicsClass:a9 graphicsFallBackOrder:a10 deviceSubtypeFallBackOrder:a11 locale:0 withBaseKeySelector:sel__baseAtlasKeyForName_ adjustRenditionKeyWithBlock:0],
        (id v17 = result) != 0))
  {
    id v19 = [(CUICatalog *)self _resolvedRenditionKeyForName:a3 scaleFactor:0 deviceIdiom:0 deviceSubtype:0 displayGamut:0 layoutDirection:0 sizeClassHorizontal:1.0 sizeClassVertical:0 memoryClass:0 graphicsClass:0 graphicsFallBackOrder:0 deviceSubtypeFallBackOrder:0 locale:0 withBaseKeySelector:sel__baseAtlasContentsKeyForName_ adjustRenditionKeyWithBlock:0];
    unint64_t v20 = [(CUICatalog *)self _storageRefForRendition:v17 representsODRContent:&v23];
    id result = 0;
    if (v20 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v21 = [[CUINamedImageAtlas alloc] initWithName:a3 usingRenditionKey:v17 withContents:v19 contentsFromCatalog:self fromTheme:v20 withSourceThemeRef:[(CUICatalog *)self _themeRef]];
      [(CUINamedLookup *)v21 setRepresentsOnDemandContent:v23];
      return v21;
    }
  }
  return result;
}

- (id)namedImageAtlasWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 displayGamut:(int64_t)a6 deviceSubtype:(unint64_t)a7 memoryClass:(unint64_t)a8 graphicsClass:(unint64_t)a9 graphicsFallBackOrder:(id)a10 deviceSubtypeFallBackOrder:(id)a11
{
  CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace();
  id v19 = [(CUICatalog *)self _namedImageAtlasWithName:a3 scaleFactor:a5 deviceIdiom:a6 displayGamut:a7 deviceSubtype:a8 memoryClass:a9 graphicsClass:a4 graphicsFallBackOrder:a10 deviceSubtypeFallBackOrder:a11];
  kdebug_trace();
  return v19;
}

- (id)namedImageAtlasWithName:(id)a3 scaleFactor:(double)a4
{
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  return [(CUICatalog *)self namedImageAtlasWithName:a3 scaleFactor:__getDeviceTraits___deviceIdiom deviceIdiom:__getDeviceTraits___deviceDisplayGamut displayGamut:__getDeviceTraits___deviceSubtype deviceSubtype:__getDeviceTraits___deviceMemoryClass memoryClass:__getDeviceTraits___deviceGraphicsClass graphicsClass:a4 graphicsFallBackOrder:__getDeviceTraits___deviceGraphicsFallbackOrder deviceSubtypeFallBackOrder:__getDeviceTraits___deviceSubtypeFallbackOrder];
}

- (id)namedImageAtlasWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5
{
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  if (__getDeviceTraits___deviceIdiom == a5) {
    uint64_t v9 = __getDeviceTraits___deviceSubtype;
  }
  else {
    uint64_t v9 = 0;
  }
  return [(CUICatalog *)self namedImageAtlasWithName:a3 scaleFactor:a5 deviceIdiom:__getDeviceTraits___deviceDisplayGamut displayGamut:v9 deviceSubtype:__getDeviceTraits___deviceMemoryClass memoryClass:__getDeviceTraits___deviceGraphicsClass graphicsClass:a4 graphicsFallBackOrder:__getDeviceTraits___deviceGraphicsFallbackOrder deviceSubtypeFallBackOrder:__getDeviceTraits___deviceSubtypeFallbackOrder];
}

- (id)namedImageAtlasWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(unint64_t)a5
{
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  return [(CUICatalog *)self namedImageAtlasWithName:a3 scaleFactor:__getDeviceTraits___deviceIdiom deviceIdiom:a5 displayGamut:__getDeviceTraits___deviceSubtype deviceSubtype:__getDeviceTraits___deviceMemoryClass memoryClass:__getDeviceTraits___deviceGraphicsClass graphicsClass:a4 graphicsFallBackOrder:__getDeviceTraits___deviceGraphicsFallbackOrder deviceSubtypeFallBackOrder:__getDeviceTraits___deviceSubtypeFallbackOrder];
}

- (id)parentNamedImageAtlasForImageNamed:(id)a3 scaleFactor:(double)a4 displayGamut:(unint64_t)a5
{
  char v17 = 0;
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  id result = [(CUICatalog *)self _resolvedRenditionKeyForName:a3 scaleFactor:__getDeviceTraits___deviceIdiom deviceIdiom:__getDeviceTraits___deviceSubtype deviceSubtype:a5 displayGamut:0 layoutDirection:0 sizeClassHorizontal:a4 sizeClassVertical:0 memoryClass:__getDeviceTraits___deviceMemoryClass graphicsClass:__getDeviceTraits___deviceGraphicsClass graphicsFallBackOrder:__getDeviceTraits___deviceGraphicsFallbackOrder deviceSubtypeFallBackOrder:__getDeviceTraits___deviceSubtypeFallbackOrder locale:0 withBaseKeySelector:0 adjustRenditionKeyWithBlock:0];
  if (result)
  {
    id v10 = result;
    unint64_t v11 = [(CUICatalog *)self _storageRefForRendition:result representsODRContent:&v17];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    id v13 = (void *)_LookupStructuredThemeProvider(v11, v12);
    id v14 = objc_msgSend(v13, "renditionWithKey:usingKeySignature:", objc_msgSend(v10, "keyList"), 0);
    unsigned int v15 = [v14 isInternalLink];
    id result = 0;
    if (v15)
    {
      id v16 = [v14 linkingToRendition];
      if ([v16 themeElement] != (id)9 || objc_msgSend(v16, "themePart") != (id)181) {
        return 0;
      }
      return objc_msgSend(v13, "renditionNameForKeyList:", objc_msgSend(v16, "keyList"));
    }
  }
  return result;
}

- (id)parentNamedImageAtlastForImageNamed:(id)a3 scaleFactor:(double)a4
{
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  uint64_t v7 = __getDeviceTraits___deviceDisplayGamut;
  return [(CUICatalog *)self parentNamedImageAtlasForImageNamed:a3 scaleFactor:v7 displayGamut:a4];
}

- (void)preloadNamedAtlasWithScaleFactor:(double)a3 andNames:(id)a4 completionHandler:(id)a5
{
  global_queue = dispatch_get_global_queue(17, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __74__CUICatalog_preloadNamedAtlasWithScaleFactor_andNames_completionHandler___block_invoke;
  v10[3] = &unk_1E5A5F300;
  v10[4] = a4;
  v10[5] = self;
  *(double *)&v10[7] = a3;
  v10[6] = a5;
  dispatch_async(global_queue, v10);
}

void __74__CUICatalog_preloadNamedAtlasWithScaleFactor_andNames_completionHandler___block_invoke(uint64_t a1)
{
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  uint64_t v2 = __getDeviceTraits___deviceIdiom;
  uint64_t v27 = __getDeviceTraits___deviceDisplayGamut;
  uint64_t v28 = __getDeviceTraits___deviceSubtype;
  uint64_t v25 = __getDeviceTraits___deviceGraphicsClass;
  uint64_t v26 = __getDeviceTraits___deviceMemoryClass;
  uint64_t v23 = __getDeviceTraits___deviceSubtypeFallbackOrder;
  uint64_t v24 = __getDeviceTraits___deviceGraphicsFallbackOrder;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v20 = objc_alloc_init((Class)NSMutableArray);
  callBacks.version = 0;
  callBacks.retain = (CFArrayRetainCallBack)__blockSetRetain;
  callBacks.copyDescription = 0;
  callBacks.equal = 0;
  callBacks.release = (CFArrayReleaseCallBack)__blockSetRelease;
  uint64_t v39 = kCGImageBlockFormatRequest;
  uint64_t v40 = kCGImageBlockFormatBGRx8;
  +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  uint64_t v4 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &callBacks);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obCFIndex j = *(id *)(a1 + 32);
  id v29 = [obj countByEnumeratingWithState:&v31 objects:v38 count:16];
  if (v29)
  {
    uint64_t v22 = *(void *)v32;
    uint64_t v18 = v2;
    id v19 = v3;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v7 = [*(id *)(a1 + 40) _resolvedRenditionKeyForName:v6 scaleFactor:v2 deviceIdiom:v28 deviceSubtype:v27 displayGamut:0 layoutDirection:0 sizeClassHorizontal:*(double *)(a1 + 56) sizeClassVertical:0 memoryClass:v26 graphicsClass:v25 graphicsFallBackOrder:v24 deviceSubtypeFallBackOrder:v23 locale:0 withBaseKeySelector:sel__baseAtlasKeyForName_ adjustRenditionKeyWithBlock:0];
        if (v7
          && (id v8 = v7,
              unsigned __int8 v30 = 0,
              id v9 = [*(id *)(a1 + 40) _resolvedRenditionKeyForName:v6 scaleFactor:0 deviceIdiom:0 deviceSubtype:0 displayGamut:0 layoutDirection:0 sizeClassHorizontal:1.0 sizeClassVertical:0 memoryClass:0 graphicsClass:0 graphicsFallBackOrder:0 deviceSubtypeFallBackOrder:0 locale:0 withBaseKeySelector:sel__baseAtlasContentsKeyForName_ adjustRenditionKeyWithBlock:0],
              id v10 = [*(id *)(a1 + 40) _storageRefForRendition:v8 representsODRContent:&v30],
              v10 != (id)0x7FFFFFFFFFFFFFFFLL))
        {
          unint64_t v11 = -[CUINamedImageAtlas initWithName:usingRenditionKey:withContents:contentsFromCatalog:fromTheme:withSourceThemeRef:]([CUINamedImageAtlas alloc], "initWithName:usingRenditionKey:withContents:contentsFromCatalog:fromTheme:withSourceThemeRef:", v6, v8, v9, *(void *)(a1 + 40), v10, [*(id *)(a1 + 40) _themeRef]);
          [(CUINamedLookup *)v11 setRepresentsOnDemandContent:v30];
          CFArrayRef v12 = [(CUINamedImageAtlas *)v11 images];
          CFIndex Count = CFArrayGetCount(v12);
          if (Count >= 1)
          {
            CFIndex v14 = Count;
            for (CFIndex j = 0; j != v14; ++j)
            {
              ValueAtIndex = (CGImage *)CFArrayGetValueAtIndex(v12, j);
              if (CGImageGetImageProvider())
              {
                CGImageGetWidth(ValueAtIndex);
                CGImageGetHeight(ValueAtIndex);
                char v17 = (const void *)CGImageProviderCopyImageBlockSetWithOptions();
                CFArrayAppendValue(v4, v17);
                CGImageBlockSetRelease();
              }
            }
          }
          [v20 addObject:v11];

          uint64_t v2 = v18;
          id v3 = v19;
        }
        else
        {
          [v3 addObject:v6];
        }
      }
      id v29 = [obj countByEnumeratingWithState:&v31 objects:v38 count:16];
    }
    while (v29);
  }
  if ([v3 count])
  {
    int64_t v36 = @"missing keys";
    id v37 = v3;
    +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"AssetCatalog", 1, +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1]);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  CFAutorelease(v4);
}

- (id)namedVectorGlyphWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 glyphSize:(int64_t)a6 glyphWeight:(int64_t)a7 glyphPointSize:(double)a8 appearanceName:(id)a9
{
  return [(CUICatalog *)self namedVectorGlyphWithName:a3 scaleFactor:a5 deviceIdiom:5 layoutDirection:a6 glyphSize:a7 glyphWeight:a9 glyphPointSize:a4 appearanceName:a8];
}

- (id)allImageNames
{
  id v2 = [(CUICatalog *)self _themeStore];
  return [v2 allImageNames];
}

- (id)imagesWithName:(id)a3
{
  id v4 = [(CUICatalog *)self _themeStore];
  return [v4 imagesWithName:a3];
}

- (BOOL)containsLookupForName:(id)a3
{
  if (objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "containsLookupForName:", a3)) {
    return 1;
  }
  id v6 = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "mappedAliases");
  id v7 = [v6 indexOfObject:a3];
  if (v6) {
    BOOL v8 = v7 == (id)0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v8 = 1;
  }
  return !v8;
}

- (void)enumerateNamedLookupsUsingBlock:(id)a3
{
  double v5 = (void *)_LookupStructuredThemeProvider(self->_storageRef, a2);
  if (objc_opt_respondsToSelector())
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __46__CUICatalog_enumerateNamedLookupsUsingBlock___block_invoke;
    v6[3] = &unk_1E5A5F370;
    v6[4] = v5;
    v6[6] = self;
    v6[7] = a3;
    objc_msgSend(objc_msgSend(v5, "themeStore"), "enumerateKeysAndObjectsUsingBlock:", v6);
  }
}

void __46__CUICatalog_enumerateNamedLookupsUsingBlock___block_invoke(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  double v5 = -[CUIThemeRendition initWithCSIData:forKey:version:]([CUIThemeRendition alloc], "initWithCSIData:forKey:version:", a3, a2, [*(id *)(a1 + 32) distilledInCoreUIVersion]);
  id v6 = [[CUIRenditionKey alloc] initWithKeyList:a2];
  id v7 = [*(id *)(a1 + 40) renditionNameForKeyList:a2];
  if (![v7 length]) {
    id v7 = [(CUIThemeRendition *)v5 name];
  }
  id v8 = [(CUIThemeRendition *)v5 type];
  switch((unint64_t)v8)
  {
    case 0x3E8uLL:
      if ([(CUIThemeRendition *)v5 unslicedImage]) {
        goto LABEL_7;
      }
      goto LABEL_13;
    case 0x3E9uLL:
    case 0x3EBuLL:
    case 0x3EDuLL:
    case 0x3EEuLL:
    case 0x3EFuLL:
    case 0x3F0uLL:
    case 0x3F4uLL:
    case 0x3F8uLL:
      goto LABEL_11;
    case 0x3EAuLL:
      CFArrayRef v12 = [CUINamedLayerStack alloc];
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v14 = *(void *)(v13 + 8);
      uint64_t v23 = _NSConcreteStackBlock;
      uint64_t v24 = 3221225472;
      uint64_t v25 = __46__CUICatalog_enumerateNamedLookupsUsingBlock___block_invoke_2;
      uint64_t v26 = &unk_1E5A5F348;
      uint64_t v27 = v13;
      uint64_t v28 = a2;
      unsigned int v15 = &v23;
      goto LABEL_25;
    case 0x3ECuLL:
      if (!CUIRenditionKeyValueForAttribute(a2, 17)) {
        goto LABEL_7;
      }
      id v9 = CUINamedImageAtlas;
      goto LABEL_8;
    case 0x3F1uLL:
      id v9 = CUINamedColor;
      goto LABEL_8;
    case 0x3F2uLL:
      id v9 = CUINamedMultisizeImageSet;
      goto LABEL_8;
    case 0x3F3uLL:
      id v9 = CUINamedModel;
      goto LABEL_8;
    case 0x3F5uLL:
      id v9 = CUINamedRecognitionGroup;
      goto LABEL_8;
    case 0x3F6uLL:
      id v9 = CUINamedRecognitionObject;
      goto LABEL_8;
    case 0x3F7uLL:
      id v9 = CUITextStyle;
      goto LABEL_8;
    case 0x3F9uLL:
      id v9 = CUINamedVectorGlyph;
      goto LABEL_8;
    case 0x3FAuLL:
      CFArrayRef v12 = [CUINamedSolidLayerStack alloc];
      uint64_t v16 = *(void *)(a1 + 48);
      uint64_t v14 = *(void *)(v16 + 8);
      char v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      id v19 = __46__CUICatalog_enumerateNamedLookupsUsingBlock___block_invoke_3;
      id v20 = &unk_1E5A5F348;
      uint64_t v21 = v16;
      uint64_t v22 = a2;
      unsigned int v15 = &v17;
LABEL_25:
      id v10 = -[CUINamedLayerStack initWithName:usingRenditionKey:fromTheme:resolvingWithBlock:](v12, "initWithName:usingRenditionKey:fromTheme:resolvingWithBlock:", v7, v6, v14, v15, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28);
      goto LABEL_9;
    default:
      if ((unint64_t)v8 >= 6)
      {
        if (v8 != (id)9) {
          goto LABEL_11;
        }
LABEL_13:
        id v9 = CUINamedData;
      }
      else
      {
LABEL_7:
        id v9 = CUINamedImage;
      }
LABEL_8:
      id v10 = (CUINamedLayerStack *)[[v9 alloc] initWithName:v7 usingRenditionKey:v6 fromTheme:*(void *)(*(void *)(a1 + 48) + 8)];
LABEL_9:
      unint64_t v11 = v10;
      if (v10)
      {
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
LABEL_11:

      return;
  }
}

id __46__CUICatalog_enumerateNamedLookupsUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[1];
  double v6 = (double)CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 12);
  uint64_t v7 = CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 15);
  uint64_t v8 = CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 16);
  uint64_t v9 = CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 24);
  uint64_t v10 = CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 4);
  uint64_t v11 = CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 20);
  return objc_msgSend(v4, "_resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:adjustRenditionKeyWithBlock:", v5, a2, v7, v8, v9, v10, v6, v11, CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 21), 0, 0, 0, 0, 0, 0);
}

id __46__CUICatalog_enumerateNamedLookupsUsingBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[1];
  double v6 = (double)CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 12);
  uint64_t v7 = CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 15);
  uint64_t v8 = CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 16);
  uint64_t v9 = CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 24);
  uint64_t v10 = CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 4);
  uint64_t v11 = CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 20);
  return objc_msgSend(v4, "_resolvedRenditionKeyFromThemeRef:withBaseKey:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:graphicsFallBackOrder:deviceSubtypeFallBackOrder:locale:adjustRenditionKeyWithBlock:", v5, a2, v7, v8, v9, v10, v6, v11, CUIRenditionKeyValueForAttribute(*(unsigned __int16 **)(a1 + 40), 21), 0, 0, 0, 0, 0, 0);
}

- (CGPDFDocument)pdfDocumentWithName:(id)a3
{
  return [(CUICatalog *)self pdfDocumentWithName:a3 appearanceName:0];
}

- (CGPDFDocument)pdfDocumentWithName:(id)a3 appearanceName:(id)a4
{
  uint64_t v6 = 0;
  char v15 = 0;
  if (self && a4) {
    uint64_t v6 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "appearanceIdentifierForName:", a4);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __49__CUICatalog_pdfDocumentWithName_appearanceName___block_invoke;
  v14[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v14[4] = v6;
  id result = [(CUICatalog *)self _resolvedRenditionKeyForName:a3 scaleFactor:0 deviceIdiom:0 deviceSubtype:0 displayGamut:0 layoutDirection:0 sizeClassHorizontal:0.0 sizeClassVertical:0 memoryClass:0 graphicsClass:0 graphicsFallBackOrder:0 deviceSubtypeFallBackOrder:0 locale:0 withBaseKeySelector:0 adjustRenditionKeyWithBlock:v14];
  if (result)
  {
    uint64_t v8 = result;
    unint64_t v9 = [(CUICatalog *)self _storageRefForRendition:result representsODRContent:&v15];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v11 = [(CUICatalog *)self namedVectorImageWithName:a3 scaleFactor:1 displayGamut:0 layoutDirection:(double)CUIMaxScaleForTargetPlatform([(CUICatalog *)self platform])];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id result = 0;
      if ((isKindOfClass & 1) == 0) {
        return result;
      }
    }
    else
    {
      uint64_t v13 = (void *)_LookupStructuredThemeProvider(v9, v10);
      if ((uint64_t)[(CGPDFDocument *)v8 themeScale] >= 2
        && (objc_msgSend(v13, "canGetRenditionWithKey:", -[CGPDFDocument keyList](v8, "keyList")) & 1) == 0)
      {
        [(CGPDFDocument *)v8 setThemeScale:0];
      }
      id v11 = objc_msgSend(v13, "renditionWithKey:", -[CGPDFDocument keyList](v8, "keyList"));
      if ([v11 pixelFormat] != 1346651680) {
        return 0;
      }
    }
    return (CGPDFDocument *)[v11 pdfDocument];
  }
  return result;
}

id __49__CUICatalog_pdfDocumentWithName_appearanceName___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setThemeAppearance:*(void *)(a1 + 32)];
}

- (id)namedVectorImageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 layoutDirection:(int64_t)a6
{
  return [(CUICatalog *)self namedVectorImageWithName:a3 scaleFactor:a5 displayGamut:a6 layoutDirection:0 appearanceName:a4];
}

- (id)namedVectorImageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 layoutDirection:(int64_t)a6 appearanceName:(id)a7
{
  return [(CUICatalog *)self namedVectorImageWithName:a3 scaleFactor:a5 displayGamut:a6 layoutDirection:a7 appearanceName:0 locale:a4];
}

- (id)namedVectorImageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 layoutDirection:(int64_t)a6 appearanceName:(id)a7 locale:(id)a8
{
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  return [(CUICatalog *)self namedVectorImageWithName:a3 scaleFactor:__getDeviceTraits___deviceIdiom deviceIdiom:__getDeviceTraits___deviceSubtype deviceSubtype:a5 displayGamut:a6 layoutDirection:0 sizeClassHorizontal:a4 sizeClassVertical:0 appearanceName:a7 locale:a8];
}

- (id)namedVectorImageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10
{
  return [(CUICatalog *)self namedVectorImageWithName:a3 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:a7 displayGamut:a8 layoutDirection:a9 sizeClassHorizontal:a4 sizeClassVertical:a10 appearanceName:0 locale:0];
}

- (id)namedVectorImageWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceName:(id)a11
{
  return [(CUICatalog *)self namedVectorImageWithName:a3 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:a7 displayGamut:a8 layoutDirection:a9 sizeClassHorizontal:a4 sizeClassVertical:a10 appearanceName:a11 locale:0];
}

- (id)layerStackWithName:(id)a3
{
  return [(CUICatalog *)self layerStackWithName:a3 scaleFactor:0 deviceIdiom:1.0];
}

- (id)layerStackWithName:(id)a3 scaleFactor:(double)a4
{
  return [(CUICatalog *)self layerStackWithName:a3 scaleFactor:0 deviceIdiom:0 deviceSubtype:0 sizeClassHorizontal:0 sizeClassVertical:a4];
}

- (id)layerStackWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5
{
  return [(CUICatalog *)self layerStackWithName:a3 scaleFactor:a5 deviceIdiom:0 deviceSubtype:0 sizeClassHorizontal:0 sizeClassVertical:a4];
}

- (id)_baseStackKeyForName:(id)a3
{
  id result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    id v4 = [[CUIRenditionKey alloc] initWithKeyList:result];
    [(CUIRenditionKey *)v4 setThemeElement:85];
    [(CUIRenditionKey *)v4 setThemePart:181];
    return v4;
  }
  return result;
}

- (id)_layerStackWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8
{
  v26[0] = 0;
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  uint64_t v15 = __getDeviceTraits___deviceDisplayGamut;
  id result = [(CUICatalog *)self _resolvedRenditionKeyForName:a3 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:__getDeviceTraits___deviceDisplayGamut displayGamut:0 layoutDirection:a7 sizeClassHorizontal:a4 sizeClassVertical:a8 memoryClass:0 graphicsClass:0 graphicsFallBackOrder:0 deviceSubtypeFallBackOrder:0 locale:0 withBaseKeySelector:sel__baseStackKeyForName_ adjustRenditionKeyWithBlock:0];
  if (result)
  {
    id v17 = result;
    unint64_t v18 = [(CUICatalog *)self _storageRefForRendition:result representsODRContent:v26];
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      unint64_t v20 = v18;
      if (objc_msgSend(objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, v19), "renditionWithKey:", objc_msgSend(v17, "keyList")), "type") == (id)1002)
      {
        uint64_t v21 = [CUINamedLayerStack alloc];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = __110__CUICatalog__layerStackWithName_scaleFactor_deviceIdiom_deviceSubtype_sizeClassHorizontal_sizeClassVertical___block_invoke;
        v25[3] = &unk_1E5A5F398;
        v25[4] = self;
        v25[5] = v20;
        *(double *)&v25[6] = a4;
        v25[7] = a5;
        v25[8] = a6;
        v25[9] = v15;
        v25[10] = a7;
        v25[11] = a8;
        uint64_t v22 = v25;
      }
      else
      {
        uint64_t v21 = [CUINamedSolidLayerStack alloc];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = __110__CUICatalog__layerStackWithName_scaleFactor_deviceIdiom_deviceSubtype_sizeClassHorizontal_sizeClassVertical___block_invoke_2;
        v24[3] = &unk_1E5A5F398;
        v24[4] = self;
        v24[5] = v20;
        *(double *)&v24[6] = a4;
        v24[7] = a5;
        v24[8] = a6;
        v24[9] = v15;
        v24[10] = a7;
        v24[11] = a8;
        uint64_t v22 = v24;
      }
      uint64_t v23 = [(CUINamedLayerStack *)v21 initWithName:a3 usingRenditionKey:v17 fromTheme:v20 resolvingWithBlock:v22];
      [(CUINamedLookup *)v23 setRepresentsOnDemandContent:v26[0]];
      return v23;
    }
  }
  return result;
}

id __110__CUICatalog__layerStackWithName_scaleFactor_deviceIdiom_deviceSubtype_sizeClassHorizontal_sizeClassVertical___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _resolvedRenditionKeyFromThemeRef:*(void *)(a1 + 40) withBaseKey:a2 scaleFactor:*(void *)(a1 + 56) deviceIdiom:*(void *)(a1 + 64) deviceSubtype:*(void *)(a1 + 72) displayGamut:0 layoutDirection:*(double *)(a1 + 48) sizeClassHorizontal:*(void *)(a1 + 80) sizeClassVertical:*(void *)(a1 + 88) memoryClass:0 graphicsClass:0 graphicsFallBackOrder:0 deviceSubtypeFallBackOrder:0 locale:0 adjustRenditionKeyWithBlock:0];
}

id __110__CUICatalog__layerStackWithName_scaleFactor_deviceIdiom_deviceSubtype_sizeClassHorizontal_sizeClassVertical___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _resolvedRenditionKeyFromThemeRef:*(void *)(a1 + 40) withBaseKey:a2 scaleFactor:*(void *)(a1 + 56) deviceIdiom:*(void *)(a1 + 64) deviceSubtype:*(void *)(a1 + 72) displayGamut:0 layoutDirection:*(double *)(a1 + 48) sizeClassHorizontal:*(void *)(a1 + 80) sizeClassVertical:*(void *)(a1 + 88) memoryClass:0 graphicsClass:0 graphicsFallBackOrder:0 deviceSubtypeFallBackOrder:0 locale:0 adjustRenditionKeyWithBlock:0];
}

- (id)layerStackWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8
{
  CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace();
  id v15 = [(CUICatalog *)self _layerStackWithName:a3 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:a7 sizeClassHorizontal:a8 sizeClassVertical:a4];
  kdebug_trace();
  return v15;
}

- (id)_defaultLayerStackWithScaleFactor:(double)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 sizeClassHorizontal:(int64_t)a6 sizeClassVertical:(int64_t)a7
{
  unsigned __int8 v21 = 0;
  int v13 = *((unsigned char *)self + 82) & 6;
  if ((*((unsigned char *)self + 82) & 6) == 0)
  {
    id v14 = objc_msgSend(objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "themeStore"), "keyFormat");
    if (CUIRenditionKeyHasIdentifier((uint64_t)v14, 24)) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    *((unsigned char *)self + 82) = *((unsigned char *)self + 82) & 0xF9 | v13;
  }
  BOOL v15 = v13 == 4;
  id result = [(CUICatalog *)self _resolvedRenditionKeyForName:@"IGNORED_VALUE" scaleFactor:a4 deviceIdiom:a5 deviceSubtype:v15 displayGamut:0 layoutDirection:a6 sizeClassHorizontal:a3 sizeClassVertical:a7 memoryClass:0 graphicsClass:0 graphicsFallBackOrder:0 deviceSubtypeFallBackOrder:0 locale:0 withBaseKeySelector:sel__defaultAssetRenditionKey_ adjustRenditionKeyWithBlock:0];
  if (result)
  {
    id v17 = result;
    unint64_t v18 = [(CUICatalog *)self _storageRefForRendition:result representsODRContent:&v21];
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = __112__CUICatalog__defaultLayerStackWithScaleFactor_deviceIdiom_deviceSubtype_sizeClassHorizontal_sizeClassVertical___block_invoke;
      v20[3] = &unk_1E5A5F398;
      v20[4] = self;
      v20[5] = v18;
      *(double *)&v20[6] = a3;
      v20[7] = a4;
      v20[8] = a5;
      v20[9] = v15;
      v20[10] = a6;
      v20[11] = a7;
      uint64_t v19 = [[CUINamedLayerStack alloc] initWithName:0 usingRenditionKey:v17 fromTheme:v18 resolvingWithBlock:v20];
      [(CUINamedLookup *)v19 setRepresentsOnDemandContent:v21];
      return v19;
    }
  }
  return result;
}

id __112__CUICatalog__defaultLayerStackWithScaleFactor_deviceIdiom_deviceSubtype_sizeClassHorizontal_sizeClassVertical___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) _resolvedRenditionKeyFromThemeRef:*(void *)(a1 + 40) withBaseKey:a2 scaleFactor:*(void *)(a1 + 56) deviceIdiom:*(void *)(a1 + 64) deviceSubtype:*(void *)(a1 + 72) displayGamut:0 layoutDirection:*(double *)(a1 + 48) sizeClassHorizontal:*(void *)(a1 + 80) sizeClassVertical:*(void *)(a1 + 88) memoryClass:0 graphicsClass:0 graphicsFallBackOrder:0 deviceSubtypeFallBackOrder:0 locale:0 adjustRenditionKeyWithBlock:0];
  }
  else {
    return 0;
  }
}

- (id)defaultLayerStackWithScaleFactor:(double)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 sizeClassHorizontal:(int64_t)a6 sizeClassVertical:(int64_t)a7
{
  kdebug_trace();
  id v13 = [(CUICatalog *)self _defaultLayerStackWithScaleFactor:a4 deviceIdiom:a5 deviceSubtype:a6 sizeClassHorizontal:a7 sizeClassVertical:a3];
  kdebug_trace();
  return v13;
}

- (id)_defaultNamedAssetWithScaleFactor:(double)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 sizeClassHorizontal:(int64_t)a6 sizeClassVertical:(int64_t)a7
{
  unsigned __int8 v24 = 0;
  uint64_t v25 = +[NSNumber numberWithInt:0];
  id result = [(CUICatalog *)self _resolvedRenditionKeyForName:@"IGNORED_VALUE" scaleFactor:a4 deviceIdiom:a5 deviceSubtype:0 displayGamut:0 layoutDirection:a6 sizeClassHorizontal:a3 sizeClassVertical:a7 memoryClass:0 graphicsClass:0 graphicsFallBackOrder:0 deviceSubtypeFallBackOrder:+[NSArray arrayWithObjects:&v25 count:1] locale:0 withBaseKeySelector:sel__defaultAssetRenditionKey_ adjustRenditionKeyWithBlock:0];
  if (result)
  {
    id v14 = result;
    unint64_t v15 = [(CUICatalog *)self _storageRefForRendition:result representsODRContent:&v24];
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      unint64_t v16 = v15;
      id v17 = [[CUINamedLookup alloc] initWithName:0 usingRenditionKey:v14 fromTheme:v15];
      unint64_t v18 = [(CUINamedLookup *)v17 _rendition];
      id v19 = [(CUIThemeRendition *)v18 type];
      id v20 = [(CUIThemeRendition *)v18 name];
      if (v19 == (id)1002 || v19 == (id)1018)
      {
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = __112__CUICatalog__defaultNamedAssetWithScaleFactor_deviceIdiom_deviceSubtype_sizeClassHorizontal_sizeClassVertical___block_invoke;
        v23[3] = &unk_1E5A5F3C0;
        v23[4] = self;
        v23[5] = v16;
        *(double *)&v23[6] = a3;
        v23[7] = a4;
        v23[8] = a5;
        unsigned char v23[9] = a6;
        v23[10] = a7;
        unsigned __int8 v21 = (CUINamedImage *)[objc_alloc((Class)objc_opt_class()) initWithName:v20 usingRenditionKey:v14 fromTheme:v16 resolvingWithBlock:v23];
      }
      else
      {
        unsigned __int8 v21 = [[CUINamedImage alloc] initWithName:v20 usingRenditionKey:v14 fromTheme:v16];
      }
      uint64_t v22 = v21;

      [(CUINamedLookup *)v22 setRepresentsOnDemandContent:v24];
      return v22;
    }
  }
  return result;
}

id __112__CUICatalog__defaultNamedAssetWithScaleFactor_deviceIdiom_deviceSubtype_sizeClassHorizontal_sizeClassVertical___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _resolvedRenditionKeyFromThemeRef:*(void *)(a1 + 40) withBaseKey:a2 scaleFactor:*(void *)(a1 + 56) deviceIdiom:*(void *)(a1 + 64) deviceSubtype:0 displayGamut:0 layoutDirection:*(double *)(a1 + 48) sizeClassHorizontal:*(void *)(a1 + 72) sizeClassVertical:*(void *)(a1 + 80) memoryClass:0 graphicsClass:0 graphicsFallBackOrder:0 deviceSubtypeFallBackOrder:0 locale:0 adjustRenditionKeyWithBlock:0];
}

- (id)defaultNamedAssetWithScaleFactor:(double)a3 deviceIdiom:(int64_t)a4 deviceSubtype:(unint64_t)a5 sizeClassHorizontal:(int64_t)a6 sizeClassVertical:(int64_t)a7
{
  kdebug_trace();
  id v13 = [(CUICatalog *)self _defaultNamedAssetWithScaleFactor:a4 deviceIdiom:a5 deviceSubtype:a6 sizeClassHorizontal:a7 sizeClassVertical:a3];
  kdebug_trace();
  return v13;
}

- (id)namedLookupWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 sizeClassHorizontal:(int64_t)a7 sizeClassVertical:(int64_t)a8
{
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  return [(CUICatalog *)self namedLookupWithName:a3 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:__getDeviceTraits___deviceDisplayGamut displayGamut:0 layoutDirection:a7 sizeClassHorizontal:a4 sizeClassVertical:a8];
}

id __162__CUICatalog__namedLookupWithName_scaleFactor_deviceIdiom_deviceSubtype_displayGamut_layoutDirection_sizeClassHorizontal_sizeClassVertical_appearanceName_locale___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _resolvedRenditionKeyFromThemeRef:*(void *)(a1 + 56) withBaseKey:a2 scaleFactor:*(void *)(a1 + 72) deviceIdiom:*(void *)(a1 + 80) deviceSubtype:*(void *)(a1 + 88) displayGamut:*(void *)(a1 + 96) layoutDirection:*(double *)(a1 + 64) sizeClassHorizontal:*(void *)(a1 + 104) sizeClassVertical:*(void *)(a1 + 112) memoryClass:0 graphicsClass:0 graphicsFallBackOrder:0 deviceSubtypeFallBackOrder:*(void *)(a1 + 40) locale:*(void *)(a1 + 48) adjustRenditionKeyWithBlock:0];
}

- (id)namedLookupWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10
{
  return [(CUICatalog *)self namedLookupWithName:a3 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:a7 displayGamut:a8 layoutDirection:a9 sizeClassHorizontal:a4 sizeClassVertical:a10 appearanceName:0 locale:0];
}

- (id)namedLookupWithName:(id)a3 scaleFactor:(double)a4 deviceIdiom:(int64_t)a5 deviceSubtype:(unint64_t)a6 displayGamut:(int64_t)a7 layoutDirection:(int64_t)a8 sizeClassHorizontal:(int64_t)a9 sizeClassVertical:(int64_t)a10 appearanceName:(id)a11
{
  return [(CUICatalog *)self namedLookupWithName:a3 scaleFactor:a5 deviceIdiom:a6 deviceSubtype:a7 displayGamut:a8 layoutDirection:a9 sizeClassHorizontal:a4 sizeClassVertical:a10 appearanceName:a11 locale:0];
}

- (id)namedLookupWithName:(id)a3 scaleFactor:(double)a4
{
  return [(CUICatalog *)self namedLookupWithName:a3 scaleFactor:0 deviceIdiom:0 deviceSubtype:0 sizeClassHorizontal:0 sizeClassVertical:a4];
}

- (id)_baseTextureKeyForName:(id)a3
{
  id result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    id v4 = [[CUIRenditionKey alloc] initWithKeyList:result];
    [(CUIRenditionKey *)v4 setThemeElement:41];
    [(CUIRenditionKey *)v4 setThemePart:0];
    return v4;
  }
  return result;
}

- (id)_namedTextureWithName:(id)a3 scaleFactor:(double)a4 appearanceName:(id)a5
{
  unsigned __int8 v20 = 0;
  _CUILog(3, (uint64_t)"-[CUICatalog _namedTextureWithName:%@ scaleFactor:%f appearanceName:%@]", (uint64_t)a3, (uint64_t)a5, v5, v6, v7, v8, (uint64_t)a3);
  uint64_t v14 = 0;
  if (self && a5) {
    uint64_t v14 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, v13), "appearanceIdentifierForName:", a5);
  }
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __63__CUICatalog__namedTextureWithName_scaleFactor_appearanceName___block_invoke;
  v19[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v19[4] = v14;
  id result = [(CUICatalog *)self _resolvedRenditionKeyForName:a3 scaleFactor:__getDeviceTraits___deviceIdiom deviceIdiom:__getDeviceTraits___deviceSubtype deviceSubtype:__getDeviceTraits___deviceDisplayGamut displayGamut:0 layoutDirection:0 sizeClassHorizontal:a4 sizeClassVertical:0 memoryClass:__getDeviceTraits___deviceMemoryClass graphicsClass:__getDeviceTraits___deviceGraphicsClass graphicsFallBackOrder:__getDeviceTraits___deviceGraphicsFallbackOrder deviceSubtypeFallBackOrder:__getDeviceTraits___deviceSubtypeFallbackOrder locale:0 withBaseKeySelector:sel__baseTextureKeyForName_ adjustRenditionKeyWithBlock:v19];
  if (result)
  {
    id v16 = result;
    unint64_t v17 = [(CUICatalog *)self _storageRefForRendition:result representsODRContent:&v20];
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      unint64_t v18 = [(CUINamedLookup *)[CUINamedTexture alloc] initWithName:a3 usingRenditionKey:v16 fromTheme:v17];
      [(CUINamedLookup *)v18 setRepresentsOnDemandContent:v20];
      return v18;
    }
  }
  return result;
}

id __63__CUICatalog__namedTextureWithName_scaleFactor_appearanceName___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setThemeAppearance:*(void *)(a1 + 32)];
}

- (id)namedTextureWithName:(id)a3 scaleFactor:(double)a4 appearanceName:(id)a5
{
  CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace();
  id v9 = [(CUICatalog *)self _namedTextureWithName:a3 scaleFactor:a5 appearanceName:a4];
  kdebug_trace();
  return v9;
}

- (id)namedTextureWithName:(id)a3 scaleFactor:(double)a4
{
  return [(CUICatalog *)self namedTextureWithName:a3 scaleFactor:0 appearanceName:a4];
}

- (id)_namedTextureWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 appearanceName:(id)a6
{
  unsigned __int8 v21 = 0;
  _CUILog(3, (uint64_t)"-[CUICatalog _namedTextureWithName:%@ scaleFactor:%f displayGamut:%d appearanceName:%@]", (uint64_t)a3, a5, (uint64_t)a6, v6, v7, v8, (uint64_t)a3);
  uint64_t v15 = 0;
  if (self && a6) {
    uint64_t v15 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, v14), "appearanceIdentifierForName:", a6);
  }
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __76__CUICatalog__namedTextureWithName_scaleFactor_displayGamut_appearanceName___block_invoke;
  v20[3] = &__block_descriptor_40_e25_v16__0__CUIRenditionKey_8l;
  v20[4] = v15;
  id result = [(CUICatalog *)self _resolvedRenditionKeyForName:a3 scaleFactor:__getDeviceTraits___deviceIdiom deviceIdiom:__getDeviceTraits___deviceSubtype deviceSubtype:a5 displayGamut:0 layoutDirection:0 sizeClassHorizontal:a4 sizeClassVertical:0 memoryClass:__getDeviceTraits___deviceMemoryClass graphicsClass:__getDeviceTraits___deviceGraphicsClass graphicsFallBackOrder:__getDeviceTraits___deviceGraphicsFallbackOrder deviceSubtypeFallBackOrder:__getDeviceTraits___deviceSubtypeFallbackOrder locale:0 withBaseKeySelector:sel__baseTextureKeyForName_ adjustRenditionKeyWithBlock:v20];
  if (result)
  {
    id v17 = result;
    unint64_t v18 = [(CUICatalog *)self _storageRefForRendition:result representsODRContent:&v21];
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      id v19 = [(CUINamedLookup *)[CUINamedTexture alloc] initWithName:a3 usingRenditionKey:v17 fromTheme:v18];
      [(CUINamedLookup *)v19 setRepresentsOnDemandContent:v21];
      return v19;
    }
  }
  return result;
}

id __76__CUICatalog__namedTextureWithName_scaleFactor_displayGamut_appearanceName___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setThemeAppearance:*(void *)(a1 + 32)];
}

- (id)namedTextureWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5 appearanceName:(id)a6
{
  CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace();
  id v11 = [(CUICatalog *)self _namedTextureWithName:a3 scaleFactor:a5 displayGamut:a6 appearanceName:a4];
  kdebug_trace();
  return v11;
}

- (id)namedTextureWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(int64_t)a5
{
  return [(CUICatalog *)self namedTextureWithName:a3 scaleFactor:a5 displayGamut:0 appearanceName:a4];
}

- (id)iconImageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(unint64_t)a5 layoutDirection:(int64_t)a6 desiredSize:(CGSize)a7
{
  return -[CUICatalog iconImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:desiredSize:appearanceName:](self, "iconImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:desiredSize:appearanceName:", a3, 0, 0, a5, a6, 0, a4, a7.width, a7.height, 0, 0);
}

- (id)iconImageWithName:(id)a3 scaleFactor:(double)a4 displayGamut:(unint64_t)a5 layoutDirection:(int64_t)a6 desiredSize:(CGSize)a7 appearanceName:(id)a8
{
  return -[CUICatalog iconImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:desiredSize:appearanceName:](self, "iconImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:desiredSize:appearanceName:", a3, 0, 0, a5, a6, 0, a4, a7.width, a7.height, 0, a8);
}

- (id)colorWithName:(id)a3 displayGamut:(int64_t)a4 appearanceName:(id)a5
{
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  uint64_t v9 = __getDeviceTraits___deviceIdiom;
  return [(CUICatalog *)self colorWithName:a3 displayGamut:a4 deviceIdiom:v9 appearanceName:a5];
}

- (id)colorWithName:(id)a3 displayGamut:(int64_t)a4
{
  return [(CUICatalog *)self colorWithName:a3 displayGamut:a4 appearanceName:0];
}

+ (CGColor)newColorByAdjustingLightnessOfColor:(CGColor *)a3 darker:(BOOL)a4
{
  return +[CUIShapeEffectStack newColorByAdjustingLightnessOfColor:a3 darker:a4];
}

- (id)_baseModelForKeyForName:(id)a3
{
  id result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    id v4 = [[CUIRenditionKey alloc] initWithKeyList:result];
    [(CUIRenditionKey *)v4 setThemeElement:164];
    [(CUIRenditionKey *)v4 setThemePart:60];
    return v4;
  }
  return result;
}

- (id)_modelWithName:(id)a3
{
  char v9 = 0;
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  id result = [(CUICatalog *)self _resolvedRenditionKeyForName:a3 scaleFactor:__getDeviceTraits___deviceIdiom deviceIdiom:__getDeviceTraits___deviceSubtype deviceSubtype:__getDeviceTraits___deviceDisplayGamut displayGamut:0 layoutDirection:0 sizeClassHorizontal:1.0 sizeClassVertical:0 memoryClass:__getDeviceTraits___deviceMemoryClass graphicsClass:__getDeviceTraits___deviceGraphicsClass graphicsFallBackOrder:__getDeviceTraits___deviceGraphicsFallbackOrder deviceSubtypeFallBackOrder:__getDeviceTraits___deviceSubtypeFallbackOrder locale:0 withBaseKeySelector:sel__baseModelForKeyForName_ adjustRenditionKeyWithBlock:0];
  if (result)
  {
    id v6 = result;
    unint64_t v7 = [(CUICatalog *)self _storageRefForRendition:result representsODRContent:&v9];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = [[CUINamedModel alloc] initWithName:a3 usingRenditionKey:v6 fromTheme:v7];
    }
    return v8;
  }
  return result;
}

- (id)modelWithName:(id)a3
{
  CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace();
  id v5 = [(CUICatalog *)self _modelWithName:a3];
  kdebug_trace();
  return v5;
}

- (id)_baseRecognitionGroupImageSetKeyForName:(id)a3
{
  id result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    id v4 = [[CUIRenditionKey alloc] initWithKeyList:result];
    [(CUIRenditionKey *)v4 setThemeElement:85];
    [(CUIRenditionKey *)v4 setThemePart:206];
    return v4;
  }
  return result;
}

- (id)namedRecognitionGroupWithName:(id)a3
{
  char v10 = 0;
  CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace();
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  id v5 = [(CUICatalog *)self _resolvedRenditionKeyForName:a3 scaleFactor:__getDeviceTraits___deviceIdiom deviceIdiom:__getDeviceTraits___deviceSubtype deviceSubtype:__getDeviceTraits___deviceDisplayGamut displayGamut:0 layoutDirection:0 sizeClassHorizontal:1.0 sizeClassVertical:0 memoryClass:__getDeviceTraits___deviceMemoryClass graphicsClass:__getDeviceTraits___deviceGraphicsClass graphicsFallBackOrder:__getDeviceTraits___deviceGraphicsFallbackOrder deviceSubtypeFallBackOrder:__getDeviceTraits___deviceSubtypeFallbackOrder locale:0 withBaseKeySelector:sel__baseRecognitionGroupImageSetKeyForName_ adjustRenditionKeyWithBlock:0];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = [(CUICatalog *)self _storageRefForRendition:v5 representsODRContent:&v10];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = [[CUINamedRecognitionGroup alloc] initWithName:a3 contentsFromCatalog:self usingRenditionKey:v6 fromTheme:v7];
    }
    kdebug_trace();
    return v8;
  }
  else
  {
    kdebug_trace();
    return 0;
  }
}

- (id)_baseRecognitionObjectKeyForName:(id)a3
{
  id result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    id v4 = [[CUIRenditionKey alloc] initWithKeyList:result];
    [(CUIRenditionKey *)v4 setThemeElement:85];
    [(CUIRenditionKey *)v4 setThemePart:207];
    return v4;
  }
  return result;
}

- (id)_recognitionObjectWithName:(id)a3
{
  char v23 = 0;
  CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3), 17);
  kdebug_trace();
  if (__getDeviceTraits___getDeviceTraits_once != -1) {
    dispatch_once(&__getDeviceTraits___getDeviceTraits_once, &__block_literal_global_505);
  }
  uint64_t v11 = __getDeviceTraits___deviceIdiom;
  uint64_t v12 = __getDeviceTraits___deviceSubtype;
  uint64_t v13 = __getDeviceTraits___deviceDisplayGamut;
  uint64_t v14 = __getDeviceTraits___deviceMemoryClass;
  uint64_t v15 = __getDeviceTraits___deviceGraphicsClass;
  uint64_t v16 = __getDeviceTraits___deviceGraphicsFallbackOrder;
  uint64_t v17 = __getDeviceTraits___deviceSubtypeFallbackOrder;
  _CUILog(3, (uint64_t)"-[CUICatalog _recognitionObjectWithName:%@]", v5, v6, v7, v8, v9, v10, (uint64_t)a3);
  id v18 = [(CUICatalog *)self _resolvedRenditionKeyForName:a3 scaleFactor:v11 deviceIdiom:v12 deviceSubtype:v13 displayGamut:0 layoutDirection:0 sizeClassHorizontal:1.0 sizeClassVertical:0 memoryClass:v14 graphicsClass:v15 graphicsFallBackOrder:v16 deviceSubtypeFallBackOrder:v17 locale:0 withBaseKeySelector:sel__baseRecognitionObjectKeyForName_ adjustRenditionKeyWithBlock:0];
  if (v18)
  {
    id v19 = v18;
    unint64_t v20 = [(CUICatalog *)self _storageRefForRendition:v18 representsODRContent:&v23];
    if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
      unsigned __int8 v21 = 0;
    }
    else {
      unsigned __int8 v21 = [[CUINamedRecognitionObject alloc] initWithName:a3 usingRenditionKey:v19 fromTheme:v20];
    }
    kdebug_trace();
    return v21;
  }
  else
  {
    kdebug_trace();
    return 0;
  }
}

- (unint64_t)_themeRef
{
  return self->_storageRef;
}

- (id)_baseAtlasKeyForName:(id)a3
{
  id result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    id v4 = [[CUIRenditionKey alloc] initWithKeyList:result];
    [(CUIRenditionKey *)v4 setThemeElement:9];
    [(CUIRenditionKey *)v4 setThemePart:181];
    return v4;
  }
  return result;
}

- (id)_baseAtlasContentsKeyForName:(id)a3
{
  id result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    id v4 = [[CUIRenditionKey alloc] initWithKeyList:result];
    [(CUIRenditionKey *)v4 setThemeElement:9];
    [(CUIRenditionKey *)v4 setThemePart:127];
    return v4;
  }
  return result;
}

- (id)_defaultAssetRenditionKey:(id)a3
{
  long long v4 = xmmword_1A13A1840;
  return [[CUIRenditionKey alloc] initWithKeyList:&v4];
}

- (id)_baseMultisizeImageSetKeyForName:(id)a3
{
  id result = objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "renditionKeyForName:", a3);
  if (result)
  {
    long long v4 = [[CUIRenditionKey alloc] initWithKeyList:result];
    [(CUIRenditionKey *)v4 setThemeElement:85];
    [(CUIRenditionKey *)v4 setThemePart:218];
    return v4;
  }
  return result;
}

- (id)_nameForAppearanceIdentifier:(int64_t)a3
{
  unsigned __int16 v3 = a3;
  long long v4 = (void *)_LookupStructuredThemeProvider(self->_storageRef, a2);
  return [v4 nameForAppearanceIdentifier:v3];
}

- (id)newShapeEffectPresetWithRenditionKey:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v5 = [(CUICatalog *)self _themeStore];
  id v6 = [a3 keyList];
  id v7 = [v5 copyLookupKeySignatureForKey:v6];
  id v8 = [(CUICatalog *)self localObjectCache];
  id v9 = [v8 objectForKey:v7];
  if (!v9)
  {
    id v9 = [v5 renditionWithKey:v6];
    if (v9)
    {
      uint64_t v11 = v9;
      if ([v9 type] == (id)7)
      {
        id v13 = [v11 effectPreset];
        [v8 setObject:v13 forKey:v7];
        id v9 = v13;
      }
      else
      {
        id v9 = 0;
      }
    }
  }
  id v12 = v9;

  return v12;
}

- (BOOL)canGetShapeEffectRenditionWithKey:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = [(CUICatalog *)self _themeStore];
  id v5 = [a3 keyList];
  return [v4 canGetRenditionWithKey:v5];
}

- (id)renditionKeyForShapeEffectPresetWithStyleID:(unint64_t)a3 state:(int64_t)a4 presentationState:(int64_t)a5 value:(int64_t)a6 resolution:(unint64_t)a7 dimension1:(unint64_t)a8
{
  __int16 v8 = a8;
  if (a6 == 1) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = 2 * (a6 == 2);
  }
  if (a3 == 4
    && (unint64_t)(a6 - 1) <= 1
    && objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "distilledInCoreUIVersion") < 0x1F2)
  {
    uint64_t v13 = 0;
  }
  if ((unint64_t)(a4 - 1) > 4) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = qword_1A13A1818[a4 - 1];
  }
  if (a5 == 1) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = 2 * (a5 == 2);
  }
  uint64_t v16 = CUICreateRenditionKeyWithShapeEffectState(a3, v14, v15, v13, a7, v8);
  return v16;
}

- (id)renditionKeyForShapeEffectPresetWithStylePresetName:(id)a3 state:(int64_t)a4 presentationState:(int64_t)a5 value:(int64_t)a6 resolution:(unint64_t)a7 dimension1:(unint64_t)a8 appearance:(int64_t)a9
{
  id v16 = [(CUICatalog *)self _themeStore];
  uint64_t v17 = (unsigned __int16 *)[v16 renditionKeyForName:a3];
  if (!v17) {
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, +[NSString stringWithFormat:@"Unknown style preset name '%@'", a3], 0));
  }
  id v18 = v17;
  id v19 = [[CUIRenditionKey alloc] initWithKeyList:v17];
  if ([v16 authoredWithSchemaVersion] >= 2)
  {
    if (a7 == 1) {
      uint64_t v20 = 179;
    }
    else {
      uint64_t v20 = 178;
    }
    [(CUIRenditionKey *)v19 setThemePart:v20];
  }
  [(CUIRenditionKey *)v19 setThemeState:a4];
  [(CUIRenditionKey *)v19 setThemePresentationState:a5];
  [(CUIRenditionKey *)v19 setThemeValue:a6];
  [(CUIRenditionKey *)v19 setThemeDimension1:a8];
  [(CUIRenditionKey *)v19 setThemeAppearance:a9];
  if (a7 == 144) {
    uint64_t v21 = 2;
  }
  else {
    uint64_t v21 = 1;
  }
  [(CUIRenditionKey *)v19 setThemeScale:v21];
  unsigned __int8 v22 = [(CUICatalog *)self canGetShapeEffectRenditionWithKey:v19];
  if (a7 == 1 && (v22 & 1) == 0) {
    [(CUIRenditionKey *)v19 setThemePart:178];
  }
  unsigned __int8 v23 = [(CUICatalog *)self canGetShapeEffectRenditionWithKey:v19];
  if (a4 && (v23 & 1) == 0) {
    [(CUIRenditionKey *)v19 setThemeState:0];
  }
  unsigned __int8 v24 = [(CUICatalog *)self canGetShapeEffectRenditionWithKey:v19];
  if (a5 && (v24 & 1) == 0) {
    [(CUIRenditionKey *)v19 setThemePresentationState:0];
  }
  unsigned __int8 v25 = [(CUICatalog *)self canGetShapeEffectRenditionWithKey:v19];
  if (a6 && (v25 & 1) == 0) {
    [(CUIRenditionKey *)v19 setThemeValue:0];
  }
  unsigned __int8 v26 = [(CUICatalog *)self canGetShapeEffectRenditionWithKey:v19];
  if (a8 && (v26 & 1) == 0) {
    [(CUIRenditionKey *)v19 setThemeDimension1:0];
  }
  unsigned __int8 v27 = [(CUICatalog *)self canGetShapeEffectRenditionWithKey:v19];
  if (a9 && (v27 & 1) == 0) {
    [(CUIRenditionKey *)v19 setThemeAppearance:0];
  }
  if (![(CUICatalog *)self canGetShapeEffectRenditionWithKey:v19])
  {
    uint64_t v34 = 0;
    memset(v33, 0, sizeof(v33));
    int v28 = CUIRenditionKeyValueForAttribute(v18, 1);
    CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v33, 1, v28, 0x16u);
    int v29 = CUIRenditionKeyValueForAttribute(v18, 2);
    CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v33, 2, v29, 0x16u);
    int v30 = CUIRenditionKeyValueForAttribute(v18, 17);
    CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v33, 17, v30, 0x16u);
    long long v31 = [[CUIRenditionKey alloc] initWithKeyList:v33];

    id v19 = v31;
  }
  return v19;
}

- (BOOL)_effectStyle:(unint64_t *)a3 state:(int64_t *)a4 presentationState:(int64_t *)a5 value:(int64_t *)a6 resolution:(unint64_t *)a7 dimension1:(unint64_t *)a8 appearance:(int64_t *)a9 fromStyleConfiguration:(id)a10
{
  if (a10)
  {
    *a4 = (int64_t)[a10 state];
    *a5 = 0;
    id v16 = [a10 value];
  }
  else
  {
    id v16 = 0;
    *a4 = 0;
    *a5 = 0;
  }
  *a6 = (int64_t)v16;
  *a3 = 5;
  *a8 = (unint64_t)[a10 dimension1];
  if (*a6 == 1)
  {
    unint64_t v17 = *a3;
    if (*a3) {
      goto LABEL_9;
    }
    if (objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "authoredWithSchemaVersion") <= 4) {
      *a6 = 0;
    }
  }
  unint64_t v17 = *a3;
LABEL_9:
  int64_t v18 = *a6;
  if (v17 == 4)
  {
    if (v18 != 2) {
      goto LABEL_15;
    }
    unint64_t v17 = 0;
    goto LABEL_14;
  }
  if (v18 == 2 && v17 == 1) {
LABEL_14:
  }
    *a6 = v17;
LABEL_15:
  unsigned int v19 = [a10 useSimplifiedEffect];
  unint64_t v20 = 72;
  if (v19) {
    unint64_t v20 = 1;
  }
  *a7 = v20;
  if ([a10 appearanceName])
  {
    id v21 = [a10 appearanceName];
    int64_t v23 = 0;
    if (self && v21) {
      int64_t v23 = objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, v22), "appearanceIdentifierForName:", v21);
    }
  }
  else
  {
    int64_t v23 = 0;
  }
  *a9 = v23;
  return 1;
}

- (id)renditionKeyForShapeEffectPresetForStylePresetName:(id)a3 styleConfiguration:(id)a4
{
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v11 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  [(CUICatalog *)self _effectStyle:&v10 state:&v13 presentationState:&v12 value:&v11 resolution:&v9 dimension1:&v8 appearance:&v7 fromStyleConfiguration:a4];
  if (a3) {
    return [(CUICatalog *)self renditionKeyForShapeEffectPresetWithStylePresetName:a3 state:v13 presentationState:v12 value:v11 resolution:v9 dimension1:v8 appearance:v7];
  }
  else {
    return [(CUICatalog *)self renditionKeyForShapeEffectPresetWithStyleID:v10 state:v13 presentationState:v12 value:v11 resolution:v9 dimension1:v8];
  }
}

- (id)newShapeEffectPresetForStylePresetName:(id)a3 styleConfiguration:(id)a4
{
  _CUILog(3, (uint64_t)"-[CUICatalog newShapeEffectPresetForStylePresetName:%@ styleConfiguration:%@]", (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)a3);
  id result = [(CUICatalog *)self renditionKeyForShapeEffectPresetForStylePresetName:a3 styleConfiguration:a4];
  if (result)
  {
    return [(CUICatalog *)self newShapeEffectPresetWithRenditionKey:result];
  }
  return result;
}

- (id)newTextEffectStackForStylePresetName:(id)a3 styleConfiguration:(id)a4 foregroundColor:(CGColor *)a5
{
  id v7 = -[CUICatalog newShapeEffectPresetForStylePresetName:styleConfiguration:](self, "newShapeEffectPresetForStylePresetName:styleConfiguration:", a3);
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v9 = [[CUITextEffectStack alloc] initWithEffectPreset:v7];

  if (v9)
  {
    [a4 effectScale];
    if (v10 > 0.0)
    {
      [a4 effectScale];
      -[CUIShapeEffectStack scaleEffectParametersBy:](v9, "scaleEffectParametersBy:");
    }
    if (a5)
    {
      if (([a4 shouldIgnoreForegroundColor] & 1) == 0) {
        -[CUIShapeEffectStack applyCustomForegroundColor:tintEffectColors:](v9, "applyCustomForegroundColor:tintEffectColors:", a5, [a4 foregroundColorShouldTintEffects]);
      }
      [a4 brightnessMultiplier];
      if (v11 > 0.0)
      {
        [a4 brightnessMultiplier];
        -[CUIShapeEffectStack scaleBrightnessOfEffectColorsByAmount:onlyTintableColors:](v9, "scaleBrightnessOfEffectColorsByAmount:onlyTintableColors:", 0);
      }
      if ((unint64_t)[a4 colorTemperature] >= 0x3E8
        && (unint64_t)[a4 colorTemperature] <= 0x9C40)
      {
        -[CUIShapeEffectStack adjustEffectColorsToTemperature:onlyTintableColors:](v9, "adjustEffectColorsToTemperature:onlyTintableColors:", [a4 colorTemperature], 0);
      }
      if ([a4 shouldRespectOutputBlending]) {
        [(CUIShapeEffectStack *)v9 updateOutputBlendingWithInteriorFillHeuristic];
      }
    }
  }
  return v9;
}

- (id)newShapeEffectStackForStylePresetName:(id)a3 styleConfiguration:(id)a4 foregroundColor:(CGColor *)a5
{
  id v7 = -[CUICatalog newShapeEffectPresetForStylePresetName:styleConfiguration:](self, "newShapeEffectPresetForStylePresetName:styleConfiguration:", a3);
  uint64_t v8 = [[CUIShapeEffectStack alloc] initWithEffectPreset:v7];

  [a4 effectScale];
  if (v9 > 0.0)
  {
    [a4 effectScale];
    -[CUIShapeEffectStack scaleEffectParametersBy:](v8, "scaleEffectParametersBy:");
  }
  if (a5 && ([a4 shouldIgnoreForegroundColor] & 1) == 0) {
    -[CUIShapeEffectStack applyCustomForegroundColor:tintEffectColors:](v8, "applyCustomForegroundColor:tintEffectColors:", a5, [a4 foregroundColorShouldTintEffects]);
  }
  return v8;
}

- (BOOL)drawGlyphs:(const unsigned __int16 *)a3 atPositions:(const CGPoint *)a4 inContext:(CGContext *)a5 withFont:(__CTFont *)a6 count:(unint64_t)a7 stylePresetName:(id)a8 styleConfiguration:(id)a9 foregroundColor:(CGColor *)a10
{
  uint64_t v10 = off_1EF485220(self, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v12 = v11;
  size_t v14 = v13;
  id v16 = v15;
  int64_t v18 = v17;
  unint64_t v20 = v19;
  uint64_t v22 = v21;
  int64_t v23 = (void *)v10;
  kdebug_trace();
  if (!v14) {
    goto LABEL_11;
  }
  if (a9) {
    unsigned __int8 v24 = (CUIStyleEffectConfiguration *)[a9 copy];
  }
  else {
    unsigned __int8 v24 = objc_alloc_init(CUIStyleEffectConfiguration);
  }
  unsigned __int8 v25 = v24;
  -[CUIStyleEffectConfiguration setUseSimplifiedEffect:](v24, "setUseSimplifiedEffect:", [a9 useSimplifiedEffect]);
  [(CUIStyleEffectConfiguration *)v25 setUseSimplifiedEffect:_CUIDebugUseSimplifiedTextEffects() & [(CUIStyleEffectConfiguration *)v25 useSimplifiedEffect]];
  if (![(CUIStyleEffectConfiguration *)v25 useSimplifiedEffect])
  {
    if (v14 < 0x81)
    {
      id v37 = (CGRect *)&v64;
    }
    else
    {
      id v37 = (CGRect *)malloc_type_calloc(v14, 0x20uLL, 0x1000040E0EAB150uLL);
      if (!v37) {
        goto LABEL_21;
      }
    }
    CGRect BoundingRectsForGlyphs = CTFontGetBoundingRectsForGlyphs(v16, kCTFontOrientationDefault, v22, v37, v14);
    CGFloat x = BoundingRectsForGlyphs.origin.x;
    double y = BoundingRectsForGlyphs.origin.y;
    CGFloat width = BoundingRectsForGlyphs.size.width;
    CGFloat height = BoundingRectsForGlyphs.size.height;
    if (CGRectGetHeight(BoundingRectsForGlyphs) != 0.0)
    {
      v68.origin.CGFloat x = x;
      v68.origin.double y = y;
      v68.size.CGFloat width = width;
      v68.size.CGFloat height = height;
      if (CGRectGetWidth(v68) != 0.0)
      {
        double v58 = v23;
        uint64_t v59 = v12;
        int64_t v60 = v20;
        uint64_t v61 = 0;
        uint64_t v43 = 0;
        uint64_t v44 = 0;
        p_CGFloat width = &v37->size.width;
        double v46 = 0.0;
        double v47 = 0.0;
        double v48 = 0.0;
        double v49 = 0.0;
        do
        {
          double v50 = *(p_width - 2);
          v69.origin.double y = *(p_width - 1);
          double v51 = *p_width;
          v69.size.CGFloat height = p_width[1];
          v69.origin.CGFloat x = v50;
          v69.size.CGFloat width = *p_width;
          if (CGRectIsNull(v69)) {
            goto LABEL_30;
          }
          if (v50 + *v20 < v49 + v47)
          {
            uint64_t v43 = v44;
            double v49 = *v20;
            double v47 = v50;
          }
          double v52 = v50 + v51;
          if (v50 + v51 + *v20 <= v48 + v46)
          {
LABEL_30:
            double v52 = v46;
          }
          else
          {
            uint64_t v61 = v44;
            double v48 = *v20;
          }
          ++v44;
          v20 += 2;
          p_width += 4;
          double v46 = v52;
        }
        while (v14 != v44);
        memset(&v63, 0, sizeof(v63));
        CGContextGetTextMatrix(&v63, v18);
        unint64_t v20 = v60;
        double v53 = v37[v61].size.width + v37[v61].origin.x;
        if (v53 <= 0.0) {
          double v53 = -0.0;
        }
        double v54 = v63.c * 0.0 + v63.a * (v48 - v49) + v53;
        double v55 = v37[v43].origin.x;
        if (v55 >= 0.0) {
          double v56 = 0.0;
        }
        else {
          double v56 = -v55;
        }
        v70.size.CGFloat width = v56 + v54;
        double v57 = &v60[2 * v43];
        v70.origin.CGFloat x = *v57 - v56;
        v70.origin.double y = y + v57[1];
        CGAffineTransform v62 = v63;
        v70.size.CGFloat height = height;
        CGRect v71 = CGRectApplyAffineTransform(v70, &v62);
        NSRect v72 = NSIntegralRectWithOptions(v71, 0xF00uLL);
        CGFloat v26 = v72.origin.x;
        CGFloat v27 = v72.origin.y;
        CGFloat v28 = v72.size.width;
        CGFloat v29 = v72.size.height;
        if (v14 >= 0x81) {
          free(v37);
        }
        int64_t v23 = v58;
        uint64_t v12 = v59;
        goto LABEL_7;
      }
    }
    if (v14 >= 0x81) {
      free(v37);
    }
LABEL_21:

    kdebug_trace();
    return 1;
  }
  CGFloat v26 = CGRectInfinite.origin.x;
  CGFloat v27 = CGRectInfinite.origin.y;
  CGFloat v28 = CGRectInfinite.size.width;
  CGFloat v29 = CGRectInfinite.size.height;
LABEL_7:
  ClipBoundingBoCGFloat x = CGContextGetClipBoundingBox(v18);
  v65.origin.CGFloat x = v26;
  v65.origin.double y = v27;
  v65.size.CGFloat width = v28;
  v65.size.CGFloat height = v29;
  CGRect v66 = CGRectIntersection(v65, ClipBoundingBox);
  if (v66.size.height == 0.0 || (double v30 = v66.size.width, v66.size.width == 0.0))
  {

    BOOL v36 = 1;
    kdebug_trace();
    return v36;
  }
  double v31 = v66.origin.x;
  double v32 = v66.origin.y;
  double v33 = v66.size.height;
  double v34 = _CUIEffectiveScaleForContext(v18);
  id v35 = [v23 newTextEffectStackForStylePresetName:v12 styleConfiguration:v25 foregroundColor:a10];

  if (!v35)
  {
    kdebug_trace();
    return 0;
  }
  objc_msgSend(v35, "drawGlyphs:inContext:usingFont:atPositions:count:lineHeight:inBounds:atScale:", v22, v18, v16, v20, v14, 0.0, v31, v32, v30, v33, v34);

LABEL_11:
  BOOL v36 = 1;
  kdebug_trace();
  return v36;
}

- (BOOL)_doStyledQuartzDrawingInContext:(CGContext *)a3 inBounds:(CGRect)a4 stylePresetName:(id)a5 styleConfiguration:(id)a6 drawingHandler:(id)a7
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  ClipBoundingBoCGFloat x = CGContextGetClipBoundingBox(a3);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGRect v26 = CGRectIntersection(v25, ClipBoundingBox);
  double v16 = v26.origin.x;
  double v17 = v26.origin.y;
  double v18 = v26.size.width;
  double v19 = v26.size.height;
  if (v26.size.height == 0.0 && v26.size.width == 0.0) {
    return 1;
  }
  double v20 = _CUIEffectiveScaleForContext(a3);
  if (a6) {
    id v21 = (CUIStyleEffectConfiguration *)[a6 copy];
  }
  else {
    id v21 = objc_alloc_init(CUIStyleEffectConfiguration);
  }
  uint64_t v22 = v21;
  -[CUIStyleEffectConfiguration setUseSimplifiedEffect:](v21, "setUseSimplifiedEffect:", [a6 useSimplifiedEffect]);
  [(CUIStyleEffectConfiguration *)v22 setUseSimplifiedEffect:_CUIDebugUseSimplifiedTextEffects() & [(CUIStyleEffectConfiguration *)v22 useSimplifiedEffect]];
  id v23 = [(CUICatalog *)self newTextEffectStackForStylePresetName:a5 styleConfiguration:v22 foregroundColor:CGContextGetFillColorAsColor()];

  if (v23)
  {
    objc_msgSend(v23, "drawUsingQuartz:inContext:inBounds:atScale:", a7, a3, v16, v17, v18, v19, v20);

    return 1;
  }
  return 0;
}

- (BOOL)strokeStyledPath:(CGPath *)a3 inContext:(CGContext *)a4 stylePresetName:(id)a5 styleConfiguration:(id)a6
{
  if (!a4) {
    return 0;
  }
  if (a3)
  {
    CGContextBeginPath(a4);
    CGContextAddPath(a4, a3);
  }
  CGContextReplacePathWithStrokedPath(a4);
  return [(CUICatalog *)self fillStyledPath:0 inContext:a4 stylePresetName:a5 styleConfiguration:a6];
}

- (BOOL)fillStyledPath:(CGPath *)a3 inContext:(CGContext *)a4 stylePresetName:(id)a5 styleConfiguration:(id)a6
{
  if (a4)
  {
    if (a3)
    {
      CGContextBeginPath(a4);
      CGContextAddPath(a4, a3);
    }
    uint64_t v11 = CGContextCopyPath(a4);
    BoundingBoCGFloat x = CGPathGetBoundingBox(v11);
    if (v11)
    {
      CGFloat x = BoundingBox.origin.x;
      CGFloat y = BoundingBox.origin.y;
      CGFloat width = BoundingBox.size.width;
      CGFloat height = BoundingBox.size.height;
      if (!CGRectIsEmpty(BoundingBox))
      {
        v20.origin.CGFloat x = x;
        v20.origin.CGFloat y = y;
        v20.size.CGFloat width = width;
        v20.size.CGFloat height = height;
        CGRect v21 = CGContextConvertRectToDeviceSpace(a4, v20);
        CGRect v22 = CGRectIntegral(v21);
        CGRect v23 = CGContextConvertRectToUserSpace(a4, v22);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = __74__CUICatalog_fillStyledPath_inContext_stylePresetName_styleConfiguration___block_invoke;
        v18[3] = &__block_descriptor_48_e20_v16__0__CGContext__8l;
        v18[4] = v11;
        v18[5] = a4;
        BOOL v16 = -[CUICatalog _doStyledQuartzDrawingInContext:inBounds:stylePresetName:styleConfiguration:drawingHandler:](self, "_doStyledQuartzDrawingInContext:inBounds:stylePresetName:styleConfiguration:drawingHandler:", a4, a5, a6, v18, v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);
        CGPathRelease(v11);
        return v16;
      }
    }
    CGPathRelease(v11);
  }
  return 0;
}

void __74__CUICatalog_fillStyledPath_inContext_stylePresetName_styleConfiguration___block_invoke(uint64_t a1, CGContextRef c)
{
  uint64_t v4 = CGContextCopyPath(c);
  if (*(const CGPath **)(a1 + 32) != v4)
  {
    CGContextBeginPath(*(CGContextRef *)(a1 + 40));
    CGContextAddPath(c, *(CGPathRef *)(a1 + 32));
  }
  CGContextFillPath(c);
  CGPathRelease(v4);
}

- (BOOL)fillStyledRect:(CGRect)a3 inContext:(CGContext *)a4 stylePresetName:(id)a5 styleConfiguration:(id)a6
{
  if (!a4) {
    return 0;
  }
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (CGRectIsEmpty(a3)) {
    return 0;
  }
  CGContextBeginPath(a4);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGContextAddRect(a4, v16);
  return [(CUICatalog *)self fillStyledPath:0 inContext:a4 stylePresetName:a5 styleConfiguration:a6];
}

- (BOOL)hasStylePresetWithName:(id)a3 styleConfiguration:(id)a4
{
  if (a3)
  {
    id v6 = [(CUICatalog *)self _themeStore];
    id v7 = [v6 renditionKeyForName:a3];
    if (v7)
    {
      CUIRenditionKeyCopy(v9, v7, 0x16u);
      CUIRenditionKeySetValueForAttribute(v9, 12, 1, 0x16u);
      LOBYTE(v7) = objc_msgSend(objc_msgSend(v6, "renditionWithKey:", v9), "type") == (id)7;
    }
  }
  else
  {
    id v7 = [(CUICatalog *)self renditionKeyForShapeEffectPresetForStylePresetName:0 styleConfiguration:a4];
    if (v7)
    {
      LOBYTE(v7) = [(CUICatalog *)self canGetShapeEffectRenditionWithKey:v7];
    }
  }
  return (char)v7;
}

- (BOOL)hasStylePresetWithName:(id)a3
{
  return [(CUICatalog *)self hasStylePresetWithName:a3 styleConfiguration:0];
}

- (CGColor)equivalentForegroundColorForStylePresetWithName:(id)a3 styleConfiguration:(id)a4
{
  id v7 = [a4 foregroundColorShouldTintEffects];
  [a4 setForegroundColorShouldTintEffects:0];
  uint64_t v8 = [(CUICatalog *)self equivalentForegroundColorForStylePresetWithName:a3 styleConfiguration:a4 baseForegroundColor:0];
  [a4 setForegroundColorShouldTintEffects:v7];
  return v8;
}

- (CGColor)equivalentForegroundColorForStylePresetWithName:(id)a3 styleConfiguration:(id)a4 baseForegroundColor:(CGColor *)a5
{
  if ([a4 useSimplifiedEffect]) {
    id v9 = [(CUICatalog *)self newTextEffectStackForStylePresetName:a3 styleConfiguration:a4 foregroundColor:a5];
  }
  else {
    id v9 = [(CUICatalog *)self newShapeEffectStackForStylePresetName:a3 styleConfiguration:a4 foregroundColor:a5];
  }
  uint64_t v10 = v9;
  if ((objc_msgSend(v9, "expressableByColorFillCheckingOutputBlending:", objc_msgSend(a4, "shouldRespectOutputBlending")) & 1) == 0)
  {

    return 0;
  }
  id v11 = [v10 newColorByProcessingColor:0];

  if (!v11) {
    return 0;
  }
  return (CGColor *)CFAutorelease(v11);
}

- (int)blendModeForStylePresetWithName:(id)a3 styleConfiguration:(id)a4
{
  id v4 = [(CUICatalog *)self newShapeEffectPresetForStylePresetName:a3 styleConfiguration:a4];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 1852797549;
    id v7 = (char *)[v4 effectCount];
    if (v7)
    {
      uint64_t v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        unsigned int v10 = [v5 effectTypeAtIndex:i];
        unsigned int v11 = v10;
        if (v10 == 1198678372 || v10 == 1131375730) {
          uint64_t v6 = (uint64_t)[v5 valueForParameter:7 inEffectAtIndex:i];
        }
        if (v11 == 1131375730) {
          break;
        }
        if (v11 == 1198678372) {
          break;
        }
      }
    }

    LODWORD(v4) = +[CUIShapeEffectPreset cgBlendModeFromCUIEffectBlendMode:v6];
  }
  return (int)v4;
}

- (void)_vibrantColorMatrixBrightnessSaturationForColor:(CGColor *)a3 saturation:(double *)a4 brightness:(double *)a5
{
  if (!self->_vibrantColorMatrixTints)
  {
    if (_vibrantColorMatrixBrightnessSaturationForColor_saturation_brightness__onceToken[0] != -1) {
      dispatch_once(_vibrantColorMatrixBrightnessSaturationForColor_saturation_brightness__onceToken, &__block_literal_global_160);
    }
    id v9 = objc_alloc((Class)NSMutableDictionary);
    unsigned int v10 = (NSDictionary *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend((id)_vibrantColorMatrixBrightnessSaturationForColor_saturation_brightness__colorNamesTintNames, "count"));
    uint64_t v12 = _LookupStructuredThemeProvider(self->_storageRef, v11);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = __84__CUICatalog__vibrantColorMatrixBrightnessSaturationForColor_saturation_brightness___block_invoke_2;
    v36[3] = &unk_1E5A5F430;
    v36[4] = v12;
    v36[5] = v10;
    [(id)_vibrantColorMatrixBrightnessSaturationForColor_saturation_brightness__colorNamesTintNames enumerateKeysAndObjectsUsingBlock:v36];
    self->_vibrantColorMatrixTints = v10;
  }
  Components = CGColorGetComponents(a3);
  double v34 = 0.0;
  double v35 = 0.0;
  double v33 = 0.0;
  size_t v14 = [(NSArray *)[(NSDictionary *)self->_vibrantColorMatrixTints allKeys] sortedArrayUsingSelector:sel_compare_];
  double v16 = v34;
  double v15 = v35;
  double v17 = v33;
  double v18 = [(NSArray *)v14 count];
  double v19 = 1.0;
  if (!v18)
  {
LABEL_10:
    double v27 = 1.0;
    if (!a5) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  CGRect v20 = v18;
  CGRect v21 = 0;
  int v22 = ((int)(v16 * 255.0) << 8) | ((int)(v15 * 360.0) << 16) | (int)(v17 * 255.0);
  CGRect v23 = v18 - 1;
  while (1)
  {
    id v24 = [(NSArray *)v14 objectAtIndex:v21];
    signed int v25 = [v24 intValue];
    signed int v26 = v25;
    if (v23 == v21 || v25 > v22) {
      break;
    }
    if (v20 == ++v21) {
      goto LABEL_10;
    }
  }
  unsigned __int16 v28 = (unsigned __int16)objc_msgSend(-[NSDictionary objectForKey:](self->_vibrantColorMatrixTints, "objectForKey:", v24), "intValue");
  if (v21)
  {
    id v29 = [(NSArray *)v14 objectAtIndex:v21 - 1];
    unsigned int v30 = [v29 intValue];
    unsigned __int16 v31 = (unsigned __int16)objc_msgSend(-[NSDictionary objectForKey:](self->_vibrantColorMatrixTints, "objectForKey:", v29), "intValue");
  }
  else
  {
    unsigned __int16 v31 = 0;
    unsigned int v30 = 0x7FFFFFFF;
  }
  if (v26 - v22 <= (int)(v22 - v30)) {
    unsigned __int16 v32 = v28;
  }
  else {
    unsigned __int16 v32 = v31;
  }
  if (!v21) {
    unsigned __int16 v32 = v28;
  }
  double v19 = (double)HIBYTE(v32) / 255.0 + (double)HIBYTE(v32) / 255.0;
  double v27 = (double)v32 / 255.0 + (double)v32 / 255.0;
  if (a5) {
LABEL_11:
  }
    *a5 = v27;
LABEL_12:
  if (a4) {
    *a4 = v19;
  }
}

id __84__CUICatalog__vibrantColorMatrixBrightnessSaturationForColor_saturation_brightness___block_invoke()
{
  id result = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"privateVibrantMatrixTintRedColor", @"systemRedColor", @"privateVibrantMatrixTintOrangeColor", @"systemOrangeColor", @"privateVibrantMatrixTintYellowColor", @"systemYellowColor", @"privateVibrantMatrixTintGreenColor", @"systemGreenColor", @"privateVibrantMatrixTintTealColor", @"systemTealColor", @"privateVibrantMatrixTintBlueColor", @"systemBlueColor", @"privateVibrantMatrixTintIndigoColor", @"systemIndigoColor", @"privateVibrantMatrixTintPurpleColor", @"systemPurpleColor", @"privateVibrantMatrixTintPinkColor",
             @"systemPinkColor",
             @"privateVibrantMatrixTintBrownColor",
             @"systemBrownColor",
             0);
  _vibrantColorMatrixBrightnessSaturationForColor_saturation_brightness__colorNamesTintNames = (uint64_t)result;
  return result;
}

id __84__CUICatalog__vibrantColorMatrixBrightnessSaturationForColor_saturation_brightness___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v17 = 0;
  uint64_t v16 = 0;
  int v15 = 0;
  uint64_t v14 = 0;
  unsigned int v5 = [*(id *)(a1 + 32) getPhysicalColor:&v16 withName:a2];
  id result = [*(id *)(a1 + 32) getPhysicalColor:&v14 withName:a3];
  if (v5) {
    BOOL v7 = result == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    double v12 = 0.0;
    double v13 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
    _CUIRGBToHSB(&v13, &v12, &v11, (double)BYTE2(v17) / 255.0, (double)BYTE1(v17) / 255.0, (double)v17 / 255.0);
    _CUIRGBToHSB(&v10, &v9, &v8, (double)BYTE2(v15) / 255.0, (double)BYTE1(v15) / 255.0, (double)v15 / 255.0);
    return objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", ((int)(v9 * 255.0) << 8) | ((int)(v10 * 360.0) << 16) | (int)(v8 * 255.0)), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", ((int)(v12 * 255.0) << 8) | ((int)(v13 * 360.0) << 16) | (int)(v11 * 255.0)));
  }
  return result;
}

- (id)compositingFilterForStylePresetWithName:(id)a3 styleConfiguration:(id)a4
{
  return [(CUICatalog *)self compositingFilterForStylePresetWithName:a3 styleConfiguration:a4 foregroundColor:0];
}

- (id)compositingFilterForStylePresetWithName:(id)a3 styleConfiguration:(id)a4 foregroundColor:(CGColor *)a5
{
  id v8 = -[CUICatalog newShapeEffectPresetForStylePresetName:styleConfiguration:](self, "newShapeEffectPresetForStylePresetName:styleConfiguration:", a3);
  id v9 = v8;
  if (v8)
  {
    signed int v26 = a5;
    uint64_t v10 = 1852797549;
    double v11 = (char *)[v8 effectCount];
    if (v11)
    {
      double v12 = v11;
      double v13 = 0;
      LOBYTE(v14) = 0;
      LOBYTE(v15) = 0;
      unsigned __int8 v16 = 0;
      do
      {
        unsigned int v17 = [v9 effectTypeAtIndex:v13];
        unsigned int v18 = v17;
        if (v17 == 1198678372 || v17 == 1131375730)
        {
          uint64_t v10 = (uint64_t)[v9 valueForParameter:7 inEffectAtIndex:v13];
          unint64_t v19 = (unint64_t)[v9 valueForParameter:0 inEffectAtIndex:v13];
          unsigned __int8 v16 = v19;
          unint64_t v15 = v19 >> 8;
          unint64_t v14 = v19 >> 16;
        }
        if (v18 == 1131375730) {
          break;
        }
        if (v18 == 1198678372) {
          break;
        }
        ++v13;
      }
      while (v12 != v13);
    }
    else
    {
      unsigned __int8 v16 = 0;
      LOBYTE(v15) = 0;
      LOBYTE(v14) = 0;
    }

    id v9 = +[CUIShapeEffectPreset caFilterFromCUIEffectBlendMode:v10];
    if (v9 && (v10 == 1986229103 || v10 == 1986227573))
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v29 = 0u;
      if (v26 && [a4 foregroundColorShouldTintEffects])
      {
        double v20 = (double)(v15 + v16 + v14) / 255.0 / 3.0;
        double v21 = v20 + v20;
        SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
        if (CGColorGetColorSpace(v26) == SRGB) {
          CGColorRef CopyByMatchingToColorSpace = CGColorRetain(v26);
        }
        else {
          CGColorRef CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(SRGB, kCGRenderingIntentDefault, v26, 0);
        }
        id v24 = CopyByMatchingToColorSpace;
        *(void *)&v27[0] = 0;
        double v28 = 0.0;
        [(CUICatalog *)self _vibrantColorMatrixBrightnessSaturationForColor:CopyByMatchingToColorSpace saturation:v27 brightness:&v28];
        double v28 = v21 * v28;
        +[CUIShapeEffectPreset vibrantColorMatrixOptionsWithColor:saturation:brightness:](CUIShapeEffectPreset, "vibrantColorMatrixOptionsWithColor:saturation:brightness:", v24, *(double *)v27);
        CGColorRelease(v24);
      }
      else
      {
        +[CUIShapeEffectPreset monochromeVibrantColorMatrixOptions];
      }
      v27[4] = v33;
      void v27[5] = v34;
      v27[6] = v35;
      v27[0] = v29;
      v27[1] = v30;
      v27[2] = v31;
      v27[3] = v32;
      +[CUIShapeEffectPreset configureVibrantColorMatrixFilter:v9 withOptions:v27];
    }
  }
  return v9;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)styledInsetsForStylePresetName:(id)a3 styleConfiguration:(id)a4 foregroundColor:(CGColor *)a5 scale:(double)a6
{
  id v7 = [(CUICatalog *)self newShapeEffectStackForStylePresetName:a3 styleConfiguration:a4 foregroundColor:a5];
  if (v7)
  {
    id v8 = v7;
    [v7 effectInsetsWithScale:a6];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v16 = 0.0;
    double v14 = 0.0;
    double v12 = 0.0;
    double v10 = 0.0;
  }
  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.var3 = v20;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (id)imageByStylingImage:(CGImage *)a3 stylePresetName:(id)a4 styleConfiguration:(id)a5 foregroundColor:(CGColor *)a6 scale:(double)a7
{
  id v9 = [(CUICatalog *)self newShapeEffectStackForStylePresetName:a4 styleConfiguration:a5 foregroundColor:a6];
  if (!v9) {
    return 0;
  }
  double v10 = v9;
  double v11 = (CGImage *)objc_msgSend(v9, "newFlattenedImageFromShapeCGImage:withScale:ciContext:", a3, objc_msgSend((id)objc_opt_class(), "sharedCIContext"), a7);
  if (v11)
  {
    double v12 = v11;
    double v13 = +[CUIImage imageWithCGImage:v11];
    CGImageRelease(v12);
  }
  else
  {
    double v13 = 0;
  }

  return v13;
}

- (id)debugDescription
{
  unsigned __int16 v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p, %@>", NSStringFromClass(v3), self, objc_msgSend(-[CUICatalog _themeStore](self, "_themeStore"), "debugDescription"));
}

@end