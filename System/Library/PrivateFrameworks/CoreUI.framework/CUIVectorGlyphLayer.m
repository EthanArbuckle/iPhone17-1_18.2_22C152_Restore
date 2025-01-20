@interface CUIVectorGlyphLayer
+ (BOOL)_classesContainRenderModeClass:(id)a3;
+ (BOOL)_indexFromStyleSuffix:(id)a3 integer:(unint64_t *)a4;
+ (CGColor)_fillColorFromStyle:(CGSVGAttributeMap *)a3;
+ (CGColor)_strokeColorFromStyle:(CGSVGAttributeMap *)a3;
+ (double)_strokeWidthForNode:(CGSVGNode *)a3;
+ (double)_strokeWidthFromStyle:(CGSVGAttributeMap *)a3;
+ (id)_colorNameForRenderingStyle:(id)a3;
+ (id)_createLayerWithLayerTreeNode:(CGSVGNode *)a3 layerName:(id)a4 index:(unint64_t)a5 subpaths:(id)a6 delegate:(id)a7;
+ (id)_createPathFromStyle:(CGSVGAttributeMap *)a3 subpaths:(id)a4;
+ (id)_createShapeLayerWithLayerTreeNode:(CGSVGNode *)a3 layerName:(id)a4 index:(unint64_t)a5 shapes:(id)a6 delegate:(id)a7;
+ (id)_createSimpleLayerWithLayerTreeNode:(CGSVGNode *)a3 layerName:(id)a4 index:(unint64_t)a5 subpaths:(id)a6 delegate:(id)a7;
+ (id)_createTreeWithLayerTreeNode:(CGSVGNode *)a3 modePrefix:(id)a4 layerName:(id)a5 index:(unint64_t)a6 subpaths:(id)a7 delegate:(id)a8;
+ (id)_layerHierarchyStyleNames;
+ (id)_suffixForNamedStyleWithPrefix:(id)a3 styles:(id)a4;
+ (id)createLayerGroupWithLayerNames:(id)a3 delegate:(id)a4;
+ (id)createLayerGroupWithLayerTree:(CGSVGNode *)a3 layerNames:(id)a4 shapes:(id)a5 delegate:(id)a6;
+ (id)createLayerGroupWithLayerTree:(CGSVGNode *)a3 modePrefix:(id)a4 shapes:(id)a5 delegate:(id)a6;
+ (int)_lineCapFromStyle:(CGSVGAttributeMap *)a3;
+ (int)_lineJoinFromStyle:(CGSVGAttributeMap *)a3;
+ (unsigned)_alwaysBreathesAtom;
+ (unsigned)_alwaysPulsesAtom;
+ (unsigned)_alwaysRotatesAtom;
+ (unsigned)_clearBehindAtom;
+ (unsigned)_fillActionAtom;
+ (unsigned)_layerTagsAtom;
+ (unsigned)_motionGroupAtom;
+ (unsigned)_subpathIndicesAtom;
+ (unsigned)_variableThresholdAtom;
- (BOOL)_anyLayerAlwaysPulses;
- (BOOL)_anyLayerAlwaysRotates;
- (BOOL)alwaysBreathes;
- (BOOL)alwaysPulses;
- (BOOL)alwaysRotates;
- (BOOL)anyLayerNeedsWideGamutColor;
- (BOOL)isEraserLayer;
- (BOOL)isPassthrough;
- (BOOL)needsWideGamut;
- (CGColor)_colorForVariableThreshold:(double)a3 variableMinValue:(double)a4 variableMaxValue:(double)a5 onFillColor:(CGColor *)a6 offFillColor:(CGColor *)a7;
- (CGImage)createImageUsingScaleFactor:(double)a3 targetSize:(CGSize)a4 variableMinValue:(double)a5 variableMaxValue:(double)a6 onFillColor:(CGColor *)a7 offFillColor:(CGColor *)a8;
- (CGImage)createSublayerMaskUsingScaleFactor:(double)a3 targetSize:(CGSize)a4 maskColor:(CGColor *)a5;
- (CGPath)copyClipShape;
- (CGPath)shape;
- (CGPath)shapeAtScale:(double)a3;
- (CUIVectorGlyhLayerDelegate)delegate;
- (CUIVectorGlyphPath)referencePath;
- (NSArray)sublayers;
- (NSArray)tags;
- (NSString)name;
- (double)opacity;
- (double)strokeWidth;
- (double)valueThreshold;
- (id)__initGroupWithName:(id)a3 index:(unint64_t)a4 sublayers:(id)a5 attributes:(CGSVGAttributeMap *)a6 style:(CGSVGAttributeMap *)a7 passthrough:(BOOL)a8 delegate:(id)a9;
- (id)__initTreeWithName:(id)a3 index:(unint64_t)a4 sublayers:(id)a5 attributes:(CGSVGAttributeMap *)a6 style:(CGSVGAttributeMap *)a7 delegate:(id)a8;
- (id)_initWithName:(id)a3 index:(unint64_t)a4 shape:(id)a5 strokeWidth:(double)a6 attributes:(CGSVGAttributeMap *)a7 style:(CGSVGAttributeMap *)a8 delegate:(id)a9;
- (id)_initWithName:(id)a3 index:(unint64_t)a4 sublayers:(id)a5 attributes:(CGSVGAttributeMap *)a6 style:(CGSVGAttributeMap *)a7 delegate:(id)a8;
- (id)debugDescription;
- (id)debugDescriptionWithIndentLevel:(unint64_t)a3;
- (id)path;
- (id)pathAtScale:(double)a3;
- (id)referenceShape;
- (int)lineCap;
- (int)lineJoin;
- (unint64_t)index;
- (unint64_t)motionGroup;
- (void)_readCSSAttributes:(CGSVGAttributeMap *)a3 styleAttributes:(CGSVGAttributeMap *)a4;
- (void)_setAllLayersAlwaysPulse:(BOOL)a3;
- (void)_setAllLayersAlwaysRotate:(BOOL)a3;
- (void)_setAlwaysPulses:(BOOL)a3;
- (void)_setAlwaysRotates:(BOOL)a3;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3 scaleFactor:(double)a4 targetSize:(CGSize)a5 variableMinValue:(double)a6 variableMaxValue:(double)a7 onFillColor:(CGColor *)a8 offFillColor:(CGColor *)a9;
- (void)setDelegate:(id)a3;
@end

@implementation CUIVectorGlyphLayer

- (void)_readCSSAttributes:(CGSVGAttributeMap *)a3 styleAttributes:(CGSVGAttributeMap *)a4
{
  [(CUIVectorGlyhLayerDelegate *)[(CUIVectorGlyphLayer *)self delegate] templateVersion];
  if (a4)
  {
    float v8 = v7;
    if (CGSVGAttributeMapGetAttribute())
    {
      if (CGSVGAttributeGetFloat()) {
        double v9 = 1.0;
      }
      else {
        double v9 = 1.0;
      }
    }
    else
    {
      double v9 = 1.0;
    }
    +[CUIVectorGlyphLayer _clearBehindAtom];
    uint64_t Attribute = CGSVGAttributeMapGetAttribute();
    if (Attribute) {
      BOOL Boolean = CUISVGAttributeGetBoolean(Attribute);
    }
    else {
      BOOL Boolean = 0;
    }
    if (v8 >= 4.0)
    {
      +[CUIVectorGlyphLayer _variableThresholdAtom];
      if (CGSVGAttributeMapGetAttribute()) {
        CGSVGAttributeGetFloat();
      }
    }
    if (v8 >= 5.0)
    {
      +[CUIVectorGlyphLayer _fillActionAtom];
      if (CGSVGAttributeMapGetAttribute())
      {
        v19 = (void *)CGSVGAttributeCopyString();
        id v20 = [v19 stringByReplacingOccurrencesOfString:@"\"" withString:&stru_1EF488038];

        if ([@"erase" caseInsensitiveCompare:v20])
        {
          id v21 = [@"draw" caseInsensitiveCompare:v20];
          unsigned __int8 v10 = 0;
          unsigned __int8 v11 = 0;
          unsigned __int8 v12 = 0;
          unint64_t v13 = 0;
          BOOL Boolean = 0;
          if (v21) {
            double v9 = 0.0;
          }
          else {
            double v9 = 1.0;
          }
        }
        else
        {
          unsigned __int8 v10 = 0;
          unsigned __int8 v11 = 0;
          unsigned __int8 v12 = 0;
          unint64_t v13 = 0;
          double v9 = 0.0;
          BOOL Boolean = 1;
        }
      }
      else
      {
        +[CUIVectorGlyphLayer _motionGroupAtom];
        if (CGSVGAttributeMapGetAttribute())
        {
          if (CGSVGAttributeGetFloat()) {
            unint64_t v13 = (unint64_t)0.0;
          }
          else {
            unint64_t v13 = 0;
          }
        }
        else
        {
          unint64_t v13 = 0;
        }
        +[CUIVectorGlyphLayer _alwaysPulsesAtom];
        if (CGSVGAttributeMapGetAttribute() && CGSVGAttributeGetAtom())
        {
          v22 = (void *)CGSVGAtomCopyString();
          unsigned __int8 v12 = [v22 BOOLValue];
        }
        else
        {
          unsigned __int8 v12 = 0;
        }
        +[CUIVectorGlyphLayer _alwaysRotatesAtom];
        if (CGSVGAttributeMapGetAttribute() && CGSVGAttributeGetAtom())
        {
          v23 = (void *)CGSVGAtomCopyString();
          unsigned __int8 v11 = [v23 BOOLValue];
        }
        else
        {
          unsigned __int8 v11 = 0;
        }
        +[CUIVectorGlyphLayer _alwaysBreathesAtom];
        if (CGSVGAttributeMapGetAttribute() && CGSVGAttributeGetAtom())
        {
          v24 = (void *)CGSVGAtomCopyString();
          unsigned __int8 v10 = [v24 BOOLValue];
        }
        else
        {
          unsigned __int8 v10 = 0;
        }
      }
    }
    else
    {
      unsigned __int8 v10 = 0;
      unsigned __int8 v11 = 0;
      unsigned __int8 v12 = 0;
      unint64_t v13 = 0;
    }
    if (v8 >= 6.0
      && (+[CUIVectorGlyphLayer _layerTagsAtom],
          CGSVGAttributeMapGetAttribute()))
    {
      v25 = (void *)CGSVGAttributeCopyString();
      id v26 = [v25 stringByReplacingOccurrencesOfString:@"\"" withString:&stru_1EF488038];

      a4 = (CGSVGAttributeMap *)[v26 componentsSeparatedByString:@" "];
    }
    else
    {
      a4 = 0;
    }
    BOOL v14 = Boolean;
    if (a3) {
      goto LABEL_45;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
    unsigned __int8 v11 = 0;
    unsigned __int8 v12 = 0;
    unint64_t v13 = 0;
    BOOL v14 = 0;
    double v9 = 1.0;
    if (a3)
    {
LABEL_45:
      int v16 = [(id)objc_opt_class() _lineCapFromStyle:a3];
      int v15 = [(id)objc_opt_class() _lineJoinFromStyle:a3];
      goto LABEL_46;
    }
  }
  int v15 = 0;
  int v16 = 1;
LABEL_46:
  self->_lineCap = v16;
  self->_lineJoin = v15;
  self->_isEraserLayer = v14;
  self->_opacity = v9;
  self->_valueThreshold = INFINITY;
  self->_motionGroup = v13;
  self->_alwaysPulses = v12;
  self->_alwaysRotates = v11;
  self->_alwaysBreathes = v10;
  self->_tags = (NSArray *)a4;
}

- (CUIVectorGlyhLayerDelegate)delegate
{
  return (CUIVectorGlyhLayerDelegate *)objc_loadWeak((id *)&self->_delegate);
}

+ (unsigned)_variableThresholdAtom
{
  if (_variableThresholdAtom_onceToken != -1) {
    dispatch_once(&_variableThresholdAtom_onceToken, &__block_literal_global_3_0);
  }
  return _variableThresholdAtom_variableThresholdAtom;
}

+ (int)_lineJoinFromStyle:(CGSVGAttributeMap *)a3
{
  if (a3)
  {
    uint64_t Attribute = CGSVGAttributeMapGetAttribute();
    if (Attribute)
    {
      CGSVGAttributeGetAtom();
      LODWORD(Attribute) = 0;
    }
  }
  else
  {
    LODWORD(Attribute) = 0;
  }
  return Attribute;
}

+ (int)_lineCapFromStyle:(CGSVGAttributeMap *)a3
{
  if (a3 && CGSVGAttributeMapGetAttribute()) {
    CGSVGAttributeGetAtom();
  }
  return 1;
}

+ (unsigned)_clearBehindAtom
{
  if (_clearBehindAtom_onceToken != -1) {
    dispatch_once(&_clearBehindAtom_onceToken, &__block_literal_global_17);
  }
  return _clearBehindAtom_clearBehindAtom;
}

+ (unsigned)_motionGroupAtom
{
  if (_motionGroupAtom_onceToken != -1) {
    dispatch_once(&_motionGroupAtom_onceToken, &__block_literal_global_13);
  }
  return _motionGroupAtom_motionGroupAtom;
}

+ (unsigned)_fillActionAtom
{
  if (_fillActionAtom_onceToken != -1) {
    dispatch_once(&_fillActionAtom_onceToken, &__block_literal_global_8);
  }
  return _fillActionAtom_fillActionAtom;
}

+ (unsigned)_alwaysRotatesAtom
{
  if (_alwaysRotatesAtom_onceToken != -1) {
    dispatch_once(&_alwaysRotatesAtom_onceToken, &__block_literal_global_23);
  }
  return _alwaysRotatesAtom_alwaysRotatesAtom;
}

+ (unsigned)_alwaysPulsesAtom
{
  if (_alwaysPulsesAtom_onceToken != -1) {
    dispatch_once(&_alwaysPulsesAtom_onceToken, &__block_literal_global_18_0);
  }
  return _alwaysPulsesAtom_alwaysPulsesAtom;
}

+ (unsigned)_alwaysBreathesAtom
{
  if (_alwaysBreathesAtom_onceToken != -1) {
    dispatch_once(&_alwaysBreathesAtom_onceToken, &__block_literal_global_28_0);
  }
  return _alwaysBreathesAtom_alwaysBreathesAtom;
}

+ (unsigned)_layerTagsAtom
{
  if (_layerTagsAtom_onceToken != -1) {
    dispatch_once(&_layerTagsAtom_onceToken, &__block_literal_global_38);
  }
  return _layerTagsAtom_layerTagsAtom;
}

- (NSArray)tags
{
  return self->_tags;
}

- (unint64_t)motionGroup
{
  return self->_motionGroup;
}

- (int)lineJoin
{
  return self->_lineJoin;
}

- (int)lineCap
{
  return self->_lineCap;
}

- (BOOL)alwaysRotates
{
  return self->_alwaysRotates;
}

- (BOOL)alwaysPulses
{
  return self->_alwaysPulses;
}

- (void)dealloc
{
  referencePath = self->_referencePath;
  if (referencePath)
  {

    self->_referencePath = 0;
  }

  clipPathFromSublayers = self->_clipPathFromSublayers;
  if (clipPathFromSublayers)
  {
    CGPathRelease(clipPathFromSublayers);
    self->_clipPathFromSublayers = 0;
  }
  objc_storeWeak((id *)&self->_delegate, 0);
  v5.receiver = self;
  v5.super_class = (Class)CUIVectorGlyphLayer;
  [(CUIVectorGlyphLayer *)&v5 dealloc];
}

- (unint64_t)index
{
  return self->_index;
}

- (double)valueThreshold
{
  return self->_valueThreshold;
}

- (void)drawInContext:(CGContext *)a3 scaleFactor:(double)a4 targetSize:(CGSize)a5 variableMinValue:(double)a6 variableMaxValue:(double)a7 onFillColor:(CGColor *)a8 offFillColor:(CGColor *)a9
{
  double height = a5.height;
  double width = a5.width;
  p_delegate = &self->_delegate;
  [objc_loadWeak((id *)&self->_delegate) referenceCanvasSize];
  double v20 = v19;
  double v22 = v21;
  CGContextSaveGState(a3);
  unsigned int v23 = [(CUIVectorGlyphLayer *)self isEraserLayer];
  [(CUIVectorGlyphLayer *)self opacity];
  double v25 = v24;
  if (v23) {
    CGBlendMode v26 = kCGBlendModeCopy;
  }
  else {
    CGBlendMode v26 = kCGBlendModeNormal;
  }
  SRGBClear = a8;
  if (v24 < 1.0)
  {
    CGFloat Alpha = CGColorGetAlpha(a8);
    CopyWithCGFloat Alpha = CGColorCreateCopyWithAlpha(a8, v25 * Alpha);
    SRGBClear = (CGColor *)CFAutorelease(CopyWithAlpha);
  }
  if (a6 != INFINITY || a7 != INFINITY)
  {
    double v39 = width;
    double v30 = height;
    double v31 = v20;
    [(CUIVectorGlyphLayer *)self valueThreshold];
    double v33 = v32;
    if (v32 != INFINITY)
    {
      if (!a9)
      {
        char v34 = v23 ^ 1;
        if (v25 >= 2.22044605e-16) {
          char v34 = 1;
        }
        if (v34)
        {
          a9 = 0;
        }
        else
        {
          SRGBClear = (CGColor *)_CUIColorGetSRGBClear();
          a9 = CGColorCreateCopyWithAlpha(SRGBClear, 0.7);
          CFAutorelease(a9);
          CGBlendMode v26 = kCGBlendModeDestinationIn;
        }
      }
      SRGBClear = [(CUIVectorGlyphLayer *)self _colorForVariableThreshold:SRGBClear variableMinValue:a9 variableMaxValue:v33 onFillColor:a6 offFillColor:a7];
    }
    double v20 = v31;
    double height = v30;
    double width = v39;
  }
  v35 = [(CUIVectorGlyphLayer *)self copyClipShape];
  if (v35)
  {
    v36 = v35;
    CGContextScaleCTM(a3, width * a4 / v20, height * a4 / v22);
    CGContextScaleCTM(a3, 1.0, -1.0);
    CGContextTranslateCTM(a3, 0.0, -v22);
    CGContextSetFillColorWithColor(a3, SRGBClear);
    CGContextSetStrokeColorWithColor(a3, SRGBClear);
    CGContextSetBlendMode(a3, v26);
    CGContextAddPath(a3, v36);
    [(CUIVectorGlyphLayer *)self strokeWidth];
    if (v37 <= 0.0)
    {
      CGContextFillPath(a3);
    }
    else
    {
      CGFloat v38 = v37;
      CGContextSetLineCap(a3, (CGLineCap)[(CUIVectorGlyphLayer *)self lineCap]);
      CGContextSetLineJoin(a3, (CGLineJoin)[(CUIVectorGlyphLayer *)self lineJoin]);
      CGContextSetLineWidth(a3, v38);
      CGContextStrokePath(a3);
    }
    CGPathRelease(v36);
  }
  else
  {
    objc_msgSend(objc_loadWeak((id *)p_delegate), "_legacy_drawMonochromeLayerNamed:inContext:scaleFactor:targetSize:onFillColor:offFillColor:", -[CUIVectorGlyphLayer name](self, "name"), a3, a8, a9, a4, width, height);
  }
  CGContextRestoreGState(a3);
}

- (double)opacity
{
  return self->_opacity;
}

- (BOOL)isEraserLayer
{
  return self->_isEraserLayer;
}

- (CGPath)copyClipShape
{
  v3 = [(CUIVectorGlyphLayer *)self referenceShape];
  if (v3)
  {
    v4 = v3;
    [(CUIVectorGlyphLayer *)self strokeWidth];
    if (v5 > 0.0 && [(CUIVectorGlyphLayer *)self isEraserLayer])
    {
      [(CUIVectorGlyphLayer *)self strokeWidth];
      CGFloat v7 = v6;
      CGLineCap v8 = [(CUIVectorGlyphLayer *)self lineCap];
      CGLineJoin v9 = [(CUIVectorGlyphLayer *)self lineJoin];
      return CGPathCreateCopyByStrokingPath(v4, 0, v7, v8, v9, 0.0);
    }
    else
    {
      return CGPathRetain(v4);
    }
  }
  clipPathFromSublayers = self->_clipPathFromSublayers;
  if (clipPathFromSublayers) {
    goto LABEL_33;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  sublayers = self->_sublayers;
  id v13 = [(NSArray *)sublayers countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v13)
  {
    clipPathFromSublayers = 0;
    goto LABEL_32;
  }
  id v14 = v13;
  clipPathFromSublayers = 0;
  uint64_t v15 = *(void *)v25;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v25 != v15) {
        objc_enumerationMutation(sublayers);
      }
      v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      if (![v17 isEraserLayer] || (objc_msgSend(v17, "opacity"), v18 >= 2.22044605e-16))
      {
        double v22 = (const CGPath *)[v17 copyClipShape];
        if (!v22) {
          continue;
        }
        double v20 = v22;
        if (clipPathFromSublayers)
        {
          CGPathRef CopyByUnioningPath = CGPathCreateCopyByUnioningPath(clipPathFromSublayers, v22, 0);
          goto LABEL_25;
        }
        clipPathFromSublayers = (CGPath *)MEMORY[0x1A62305F0](v22);
LABEL_27:
        CGPathRelease(v20);
        continue;
      }
      if (clipPathFromSublayers)
      {
        double v19 = (const CGPath *)[v17 copyClipShape];
        if (v19)
        {
          double v20 = v19;
          CGPathRef CopyByUnioningPath = CGPathCreateCopyBySubtractingPath(clipPathFromSublayers, v19, 0);
          if (!CopyByUnioningPath) {
            goto LABEL_27;
          }
LABEL_25:
          unsigned int v23 = CopyByUnioningPath;
          CGPathRelease(clipPathFromSublayers);
          clipPathFromSublayers = v23;
          goto LABEL_27;
        }
      }
    }
    id v14 = [(NSArray *)sublayers countByEnumeratingWithState:&v24 objects:v28 count:16];
  }
  while (v14);
LABEL_32:
  self->_clipPathFromSublayers = clipPathFromSublayers;
LABEL_33:
  CGPathRetain(clipPathFromSublayers);
  return clipPathFromSublayers;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (id)referenceShape
{
  return [(CUIVectorGlyphPath *)self->_referencePath path];
}

- (NSArray)sublayers
{
  return self->_sublayers;
}

+ (id)createLayerGroupWithLayerNames:(id)a3 delegate:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(a3, "count"));
  CGLineCap v8 = (char *)[a3 count];
  if (v8)
  {
    CGLineJoin v9 = v8;
    for (i = 0; i != v9; ++i)
    {
      id v11 = [a3 objectAtIndex:i];
      id v12 = [a4 styleForLayerName:v11];
      id v13 = [a4 attributesForLayerNamed:v11];
      id v14 = [a4 pathForLayerNamed:v11];
      [a4 strokeWidthForLayerNamed:v11];
      id v16 = [objc_alloc((Class)a1) _initWithName:v11 index:i shape:v14 strokeWidth:v13 attributes:v12 style:a4 delegate:v15];
      [v7 addObject:v16];
    }
  }
  id v17 = [objc_alloc((Class)a1) _initWithName:@"root" index:0 sublayers:v7 attributes:0 style:0 delegate:a4];

  return v17;
}

- (id)_initWithName:(id)a3 index:(unint64_t)a4 shape:(id)a5 strokeWidth:(double)a6 attributes:(CGSVGAttributeMap *)a7 style:(CGSVGAttributeMap *)a8 delegate:(id)a9
{
  v18.receiver = self;
  v18.super_class = (Class)CUIVectorGlyphLayer;
  id v16 = [(CUIVectorGlyphLayer *)&v18 init];
  if (v16)
  {
    v16->_name = (NSString *)[a3 copy];
    v16->_index = a4;
    objc_storeWeak((id *)&v16->_delegate, a9);
    v16->_isPassthrough = 1;
    if (a5) {
      v16->_referencePath = (CUIVectorGlyphPath *)[a5 copy];
    }
    [(CUIVectorGlyphLayer *)v16 _readCSSAttributes:a7 styleAttributes:a8];
    v16->_strokeWidth = a6;
  }
  return v16;
}

- (id)_initWithName:(id)a3 index:(unint64_t)a4 sublayers:(id)a5 attributes:(CGSVGAttributeMap *)a6 style:(CGSVGAttributeMap *)a7 delegate:(id)a8
{
  return [(CUIVectorGlyphLayer *)self __initGroupWithName:a3 index:a4 sublayers:a5 attributes:a6 style:a7 passthrough:0 delegate:a8];
}

- (id)__initGroupWithName:(id)a3 index:(unint64_t)a4 sublayers:(id)a5 attributes:(CGSVGAttributeMap *)a6 style:(CGSVGAttributeMap *)a7 passthrough:(BOOL)a8 delegate:(id)a9
{
  v17.receiver = self;
  v17.super_class = (Class)CUIVectorGlyphLayer;
  double v15 = [(CUIVectorGlyphLayer *)&v17 init];
  if (v15)
  {
    v15->_name = (NSString *)[a3 copy];
    v15->_index = a4;
    objc_storeWeak((id *)&v15->_delegate, a9);
    v15->_isPassthrough = a8;
    v15->_sublayers = (NSArray *)a5;
    [(CUIVectorGlyphLayer *)v15 _readCSSAttributes:a6 styleAttributes:a7];
    v15->_strokeWidth = 0.0;
  }
  return v15;
}

- (NSString)name
{
  return self->_name;
}

+ (id)_colorNameForRenderingStyle:(id)a3
{
  v4 = (char *)[a3 rangeOfString:@":"];
  if (v5 != 1) {
    return &stru_1EF488038;
  }
  double v6 = v4 + 1;
  if (v4 + 1 >= (char *)[a3 length] - 1) {
    return &stru_1EF488038;
  }
  return [a3 substringFromIndex:v6];
}

+ (id)_layerHierarchyStyleNames
{
  if (_layerHierarchyStyleNames_onceToken_0 != -1) {
    dispatch_once(&_layerHierarchyStyleNames_onceToken_0, &__block_literal_global_110);
  }
  return (id)_layerHierarchyStyleNames_layerHierarchyStyleNames_0;
}

+ (CGColor)_strokeColorFromStyle:(CGSVGAttributeMap *)a3
{
  if (!a3 || !CGSVGAttributeMapGetAttribute()) {
    return 0;
  }
  v3 = 0;
  if (CGSVGAttributeGetPaint())
  {
    CGSVGPaintGetColor();
    CGColor = (CGColor *)CGSVGColorCreateCGColor();
    v3 = CGColor;
    if (CGColor) {
      CFAutorelease(CGColor);
    }
  }
  return v3;
}

+ (CGColor)_fillColorFromStyle:(CGSVGAttributeMap *)a3
{
  if (!a3 || !CGSVGAttributeMapGetAttribute()) {
    return 0;
  }
  v3 = 0;
  if (CGSVGAttributeGetPaint())
  {
    CGSVGPaintGetColor();
    CGColor = (CGColor *)CGSVGColorCreateCGColor();
    v3 = CGColor;
    if (CGColor) {
      CFAutorelease(CGColor);
    }
  }
  return v3;
}

- (CUIVectorGlyphPath)referencePath
{
  return self->_referencePath;
}

- (void).cxx_destruct
{
}

uint64_t __45__CUIVectorGlyphLayer__variableThresholdAtom__block_invoke()
{
  uint64_t result = CGSVGAtomFromString();
  _variableThresholdAtom_variableThresholdAtom = result;
  return result;
}

uint64_t __42__CUIVectorGlyphLayer__alwaysBreathesAtom__block_invoke()
{
  uint64_t result = CGSVGAtomFromString();
  _alwaysBreathesAtom_alwaysBreathesAtom = result;
  return result;
}

uint64_t __41__CUIVectorGlyphLayer__alwaysRotatesAtom__block_invoke()
{
  uint64_t result = CGSVGAtomFromString();
  _alwaysRotatesAtom_alwaysRotatesAtom = result;
  return result;
}

uint64_t __40__CUIVectorGlyphLayer__alwaysPulsesAtom__block_invoke()
{
  uint64_t result = CGSVGAtomFromString();
  _alwaysPulsesAtom_alwaysPulsesAtom = result;
  return result;
}

uint64_t __39__CUIVectorGlyphLayer__motionGroupAtom__block_invoke()
{
  uint64_t result = CGSVGAtomFromString();
  _motionGroupAtom_motionGroupAtom = result;
  return result;
}

uint64_t __39__CUIVectorGlyphLayer__clearBehindAtom__block_invoke()
{
  uint64_t result = CGSVGAtomFromString();
  _clearBehindAtom_clearBehindAtom = result;
  return result;
}

uint64_t __38__CUIVectorGlyphLayer__fillActionAtom__block_invoke()
{
  uint64_t result = CGSVGAtomFromString();
  _fillActionAtom_fillActionAtom = result;
  return result;
}

uint64_t __37__CUIVectorGlyphLayer__layerTagsAtom__block_invoke()
{
  uint64_t result = CGSVGAtomFromString();
  _layerTagsAtom_layerTagsAtom = result;
  return result;
}

void *__48__CUIVectorGlyphLayer__layerHierarchyStyleNames__block_invoke()
{
  uint64_t result = &unk_1EF4A6D08;
  _layerHierarchyStyleNames_layerHierarchyStyleNames_0 = (uint64_t)result;
  return result;
}

+ (double)_strokeWidthForNode:(CGSVGNode *)a3
{
  if (a3 && CGSVGNodeGetAttributeMap() && CGSVGAttributeMapGetAttribute()) {
    CGSVGAttributeGetFloat();
  }
  return 0.0;
}

+ (unsigned)_subpathIndicesAtom
{
  if (_subpathIndicesAtom_onceToken != -1) {
    dispatch_once(&_subpathIndicesAtom_onceToken, &__block_literal_global_33);
  }
  return _subpathIndicesAtom_sSubpathIndicesAtom;
}

uint64_t __42__CUIVectorGlyphLayer__subpathIndicesAtom__block_invoke()
{
  uint64_t result = CGSVGAtomFromString();
  _subpathIndicesAtom_sSubpathIndicesAtom = result;
  return result;
}

+ (BOOL)_classesContainRenderModeClass:(id)a3
{
  if (([a3 containsString:@"monochrome-"] & 1) != 0
    || ([a3 containsString:@"monochrome-"] & 1) != 0)
  {
    return 1;
  }
  return [a3 containsString:@"hierarchical-"];
}

+ (id)_suffixForNamedStyleWithPrefix:(id)a3 styles:(id)a4
{
  id v5 = [a4 componentsSeparatedByString:@" "];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id result = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (result)
  {
    id v7 = result;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      CGLineJoin v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v9);
        if ([v10 hasPrefix:a3])
        {
          id v11 = [v10 rangeOfString:a3];
          return objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", v11, v12, &stru_1EF488038);
        }
        CGLineJoin v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id result = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      id v7 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

+ (BOOL)_indexFromStyleSuffix:(id)a3 integer:(unint64_t *)a4
{
  if (a3 && a4)
  {
    id v5 = a3;
    id v6 = [a3 rangeOfString:@":"];
    if (v6 == (id)0x7FFFFFFFFFFFFFFFLL || v7 == 1 && (id v5 = [v5 substringToIndex:v6]) != 0)
    {
      unint64_t v9 = 0;
      if ([+[NSScanner scannerWithString:v5] scanInteger:&v9])
      {
        if ((v9 & 0x8000000000000000) == 0)
        {
          *a4 = v9;
          return 1;
        }
      }
    }
    goto LABEL_10;
  }
  if (a4)
  {
LABEL_10:
    BOOL result = 0;
    *a4 = 0;
    return result;
  }
  return 0;
}

+ (id)_createPathFromStyle:(CGSVGAttributeMap *)a3 subpaths:(id)a4
{
  [a1 _subpathIndicesAtom];
  id result = (id)CGSVGAttributeMapGetAttribute();
  if (result)
  {
    id v6 = (void *)CGSVGAttributeCopyString();
    id v7 = [v6 stringByReplacingOccurrencesOfString:@"\"" withString:&stru_1EF488038];

    id v8 = [v7 componentsSeparatedByString:@" "];
    return +[CUIVectorGlyphPath createFromSubpaths:a4 indices:v8];
  }
  return result;
}

+ (id)_createTreeWithLayerTreeNode:(CGSVGNode *)a3 modePrefix:(id)a4 layerName:(id)a5 index:(unint64_t)a6 subpaths:(id)a7 delegate:(id)a8
{
  if (!a3) {
    return 0;
  }
  uint64_t ChildCount = CGSVGNodeGetChildCount();
  id v29 = [objc_alloc((Class)NSMutableArray) initWithCapacity:ChildCount];
  if (ChildCount)
  {
    uint64_t v12 = 0;
    while (1)
    {
      uint64_t ChildAtIndex = CGSVGNodeGetChildAtIndex();
      if (!CGSVGNodeFindAttribute()) {
        break;
      }
      long long v14 = (void *)CGSVGAttributeCopyString();
      unsigned __int8 v15 = +[CUIVectorGlyphLayer _classesContainRenderModeClass:v14];
      id v16 = v14;
      if ((v15 & 1) == 0) {
        goto LABEL_10;
      }
      id v17 = [a1 _suffixForNamedStyleWithPrefix:a4 styles:v14];
      if (v17)
      {
        id v18 = v17;
        uint64_t v31 = 0;
        if ([a1 _indexFromStyleSuffix:v17 integer:&v31])
        {
          double v19 = +[NSString stringWithFormat:@"%@%@", a4, v18];
          id v20 = [a1 _createLayerWithLayerTreeNode:ChildAtIndex layerName:v19 index:v31 subpaths:a7 delegate:a8];
          [v29 addObject:v20];
        }
      }
LABEL_15:
      if (ChildCount == ++v12) {
        goto LABEL_16;
      }
    }
    long long v14 = 0;
LABEL_10:
    id v21 = [a1 _suffixForNamedStyleWithPrefix:@"group-" styles:v14];
    uint64_t v31 = 0;
    if ([a1 _indexFromStyleSuffix:v21 integer:&v31])
    {
      double v22 = +[NSString stringWithFormat:@"%@%@", @"group-", v21];
      id v23 = [a1 _createTreeWithLayerTreeNode:ChildAtIndex modePrefix:a4 layerName:v22 index:v31 subpaths:a7 delegate:a8];
      [v29 addObject:v23];
    }
    else
    {
      long long v24 = +[NSString stringWithFormat:@"%@0", @"anonymousGroup-"];
      id v23 = [a1 _createTreeWithLayerTreeNode:ChildAtIndex modePrefix:a4 layerName:v24 index:v31 subpaths:a7 delegate:a8];
      if ([v23 sublayers]) {
        objc_msgSend(v29, "addObjectsFromArray:", objc_msgSend(v23, "sublayers"));
      }
    }

    goto LABEL_15;
  }
LABEL_16:
  id v25 = objc_msgSend(objc_alloc((Class)a1), "__initTreeWithName:index:sublayers:attributes:style:delegate:", a5, a6, v29, 0, objc_msgSend(a8, "styleForLayerName:", a5), a8);

  return v25;
}

+ (id)_createLayerWithLayerTreeNode:(CGSVGNode *)a3 layerName:(id)a4 index:(unint64_t)a5 subpaths:(id)a6 delegate:(id)a7
{
  if (CGSVGNodeGetChildCount())
  {
    return [a1 _createShapeLayerWithLayerTreeNode:a3 layerName:a4 index:a5 shapes:a6 delegate:a7];
  }
  else
  {
    return [a1 _createSimpleLayerWithLayerTreeNode:a3 layerName:a4 index:a5 subpaths:a6 delegate:a7];
  }
}

+ (id)_createSimpleLayerWithLayerTreeNode:(CGSVGNode *)a3 layerName:(id)a4 index:(unint64_t)a5 subpaths:(id)a6 delegate:(id)a7
{
  if (!a3) {
    return 0;
  }
  uint64_t AttributeMap = CGSVGNodeGetAttributeMap();
  id v14 = [a7 styleForLayerName:a4];
  id v15 = [a1 _createPathFromStyle:v14 subpaths:a6];
  [a1 _strokeWidthForNode:a3];
  id v17 = [objc_alloc((Class)a1) _initWithName:a4 index:a5 shape:v15 strokeWidth:AttributeMap attributes:v14 style:a7 delegate:v16];
  if (v15) {

  }
  return v17;
}

+ (id)_createShapeLayerWithLayerTreeNode:(CGSVGNode *)a3 layerName:(id)a4 index:(unint64_t)a5 shapes:(id)a6 delegate:(id)a7
{
  if (!a3) {
    return 0;
  }
  uint64_t ChildCount = CGSVGNodeGetChildCount();
  uint64_t AttributeMap = CGSVGNodeGetAttributeMap();
  id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:ChildCount];
  if (ChildCount)
  {
    uint64_t v12 = 0;
    id v27 = a6;
    do
    {
      uint64_t ChildAtIndex = CGSVGNodeGetChildAtIndex();
      if (CGSVGNodeFindAttribute())
      {
        id v14 = (void *)CGSVGAttributeCopyString();
        if ([v14 hasPrefix:@"shapeGroupLayer-"])
        {
          id v15 = [a7 styleForLayerName:v14];
          id v16 = v14;
          if (v15)
          {
            if (CGSVGNodeGetChildCount())
            {
              id v17 = [a1 _createShapeLayerWithLayerTreeNode:ChildAtIndex layerName:v14 index:v12 shapes:a6 delegate:a7];
              [v11 addObject:v17];
            }
            else
            {
              id v19 = [a1 _createPathFromStyle:v15 subpaths:a6];
              if (v19)
              {
                [a1 _strokeWidthForNode:ChildAtIndex];
                id v21 = [objc_alloc((Class)a1) _initWithName:v14 index:v12 shape:v19 strokeWidth:AttributeMap attributes:v15 style:a7 delegate:v20];
                [v11 addObject:v21];
              }
              a6 = v27;
            }
          }
        }
        else
        {
          id v18 = v14;
        }
      }
      ++v12;
    }
    while (ChildCount != v12);
  }
  id v22 = objc_msgSend(objc_alloc((Class)a1), "_initWithName:index:sublayers:attributes:style:delegate:", a4, a5, v11, 0, objc_msgSend(a7, "styleForLayerName:", a4, AttributeMap), a7);

  return v22;
}

+ (id)createLayerGroupWithLayerTree:(CGSVGNode *)a3 layerNames:(id)a4 shapes:(id)a5 delegate:(id)a6
{
  if (!a3) {
    return 0;
  }
  id v7 = (char *)[a4 count];
  id v26 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v7];
  uint64_t ChildCount = CGSVGNodeGetChildCount();
  if (v7)
  {
    uint64_t v9 = ChildCount;
    for (i = 0; i != v7; ++i)
    {
      id v11 = [a4 objectAtIndex:i];
      if (v9)
      {
        id v12 = v11;
        uint64_t v13 = 0;
        while (1)
        {
          uint64_t ChildAtIndex = CGSVGNodeGetChildAtIndex();
          if (CGSVGNodeFindAttribute())
          {
            id v15 = (void *)CGSVGAttributeCopyString();
            unsigned __int8 v16 = [v15 containsString:v12];

            if (ChildAtIndex)
            {
              if (v16) {
                break;
              }
            }
          }
          if (v9 == ++v13) {
            goto LABEL_15;
          }
        }
        if (CGSVGNodeGetChildCount())
        {
          id v17 = [a1 _createShapeLayerWithLayerTreeNode:ChildAtIndex layerName:v12 index:i shapes:a5 delegate:a6];
          [v26 addObject:v17];
        }
        else
        {
          uint64_t AttributeMap = CGSVGNodeGetAttributeMap();
          id v18 = [a6 styleForLayerName:v12];
          id v19 = [a1 _createPathFromStyle:v18 subpaths:a5];
          [a6 strokeWidthForLayerNamed:v12];
          id v21 = [objc_alloc((Class)a1) _initWithName:v12 index:i shape:v19 strokeWidth:AttributeMap attributes:v18 style:a6 delegate:v20];
          [v26 addObject:v21];

          if (v19) {
        }
          }
      }
LABEL_15:
      ;
    }
  }
  id v22 = [objc_alloc((Class)a1) _initWithName:@"root" index:0 sublayers:v26 attributes:0 style:0 delegate:a6];

  return v22;
}

+ (id)createLayerGroupWithLayerTree:(CGSVGNode *)a3 modePrefix:(id)a4 shapes:(id)a5 delegate:(id)a6
{
  return [a1 _createTreeWithLayerTreeNode:a3 modePrefix:a4 layerName:@"root" index:0 subpaths:a5 delegate:a6];
}

- (id)__initTreeWithName:(id)a3 index:(unint64_t)a4 sublayers:(id)a5 attributes:(CGSVGAttributeMap *)a6 style:(CGSVGAttributeMap *)a7 delegate:(id)a8
{
  return [(CUIVectorGlyphLayer *)self __initGroupWithName:a3 index:a4 sublayers:a5 attributes:a6 style:a7 passthrough:1 delegate:a8];
}

- (id)debugDescriptionWithIndentLevel:(unint64_t)a3
{
  id v5 = (objc_class *)objc_opt_class();
  id v25 = NSStringFromClass(v5);
  id v6 = [(CUIVectorGlyphLayer *)self name];
  unint64_t v7 = [(CUIVectorGlyphLayer *)self index];
  id v8 = [(CUIVectorGlyphLayer *)self referenceShape];
  [(CUIVectorGlyphLayer *)self opacity];
  uint64_t v10 = v9;
  if ([(CUIVectorGlyphLayer *)self isEraserLayer]) {
    id v11 = @"YES";
  }
  else {
    id v11 = @"NO";
  }
  [(CUIVectorGlyphLayer *)self valueThreshold];
  if (v12 == INFINITY)
  {
    uint64_t v13 = (NSNumber *)@"<unspecified>";
  }
  else
  {
    [(CUIVectorGlyphLayer *)self valueThreshold];
    uint64_t v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  }
  unint64_t v14 = [(CUIVectorGlyphLayer *)self motionGroup];
  if ([(CUIVectorGlyphLayer *)self alwaysPulses]) {
    id v15 = @"YES";
  }
  else {
    id v15 = @"NO";
  }
  unsigned __int8 v16 = +[NSString stringWithFormat:@"<%@: %p, %@, layerIndex=%lu, shape=%p, opacity=%.2f, eraser=%@, value=%@, motionGroup=%lu, alwaysPulses=%@", v25, self, v6, v7, v8, v10, v11, v13, v14, v15];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obj = self->_sublayers;
  id v17 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(obj);
        }
        id v21 = [*(id *)(*((void *)&v27 + 1) + 8 * i) debugDescriptionWithIndentLevel:a3 + 1];
        if (a3)
        {
          unint64_t v22 = a3;
          id v23 = @"\n";
          do
          {
            id v23 = (__CFString *)[(__CFString *)v23 stringByAppendingString:@"\t"];
            --v22;
          }
          while (v22);
        }
        else
        {
          id v23 = @"\n";
        }
        unsigned __int8 v16 = [(NSString *)v16 stringByAppendingString:[(__CFString *)v23 stringByAppendingString:v21]];
      }
      id v18 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v18);
  }
  return v16;
}

- (id)debugDescription
{
  return [(CUIVectorGlyphLayer *)self debugDescriptionWithIndentLevel:1];
}

- (CGPath)shape
{
  p_delegate = &self->_delegate;
  if (objc_loadWeak((id *)&self->_delegate)) {
    [objc_loadWeak((id *)p_delegate) scale];
  }
  else {
    double v4 = 1.0;
  }
  return [(CUIVectorGlyphLayer *)self shapeAtScale:v4];
}

- (CGPath)shapeAtScale:(double)a3
{
  id v3 = [(CUIVectorGlyphLayer *)self pathAtScale:a3];
  if (!v3) {
    return 0;
  }
  double v4 = (const CGPath *)[v3 path];
  CGPathRetain(v4);
  CFAutorelease(v4);
  return v4;
}

- (id)path
{
  p_delegate = &self->_delegate;
  if (objc_loadWeak((id *)&self->_delegate)) {
    [objc_loadWeak((id *)p_delegate) scale];
  }
  else {
    double v4 = 1.0;
  }
  return [(CUIVectorGlyphLayer *)self pathAtScale:v4];
}

- (id)pathAtScale:(double)a3
{
  if (!self->_referencePath) {
    return 0;
  }
  p_delegate = &self->_delegate;
  if (!objc_loadWeak((id *)&self->_delegate)) {
    return 0;
  }
  [objc_loadWeak((id *)p_delegate) _requestedPointSizeRatio];
  double v7 = v6 * a3;
  if (fabs(v7 + -1.0) >= 2.22044605e-16)
  {
    memset(&v14, 0, sizeof(v14));
    CGAffineTransformMakeScale(&v14, v7, v7);
    referencePath = self->_referencePath;
    CGAffineTransform v13 = v14;
    id v8 = [(CUIVectorGlyphPath *)referencePath createCopyApplyingTransform:&v13];
  }
  else
  {
    id v8 = self->_referencePath;
  }
  uint64_t v9 = v8;
  id v11 = v8;
  return v9;
}

- (void)_setAlwaysPulses:(BOOL)a3
{
  self->_alwaysPulses = a3;
}

- (BOOL)_anyLayerAlwaysPulses
{
  if (self->_alwaysPulses)
  {
LABEL_2:
    LOBYTE(v2) = 1;
    return (char)v2;
  }
  id v2 = [(NSArray *)self->_sublayers count];
  if (v2)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    sublayers = self->_sublayers;
    id v2 = [(NSArray *)sublayers countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v2)
    {
      id v5 = v2;
      uint64_t v6 = *(void *)v10;
LABEL_7:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(sublayers);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * v7) _anyLayerAlwaysPulses]) {
          goto LABEL_2;
        }
        if (v5 == (id)++v7)
        {
          id v5 = [(NSArray *)sublayers countByEnumeratingWithState:&v9 objects:v13 count:16];
          LOBYTE(v2) = 0;
          if (v5) {
            goto LABEL_7;
          }
          return (char)v2;
        }
      }
    }
  }
  return (char)v2;
}

- (void)_setAllLayersAlwaysPulse:(BOOL)a3
{
  if (self->_opacity != 0.0)
  {
    BOOL v3 = a3;
    self->_alwaysPulses = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    sublayers = self->_sublayers;
    id v5 = [(NSArray *)sublayers countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(sublayers);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * i) _setAllLayersAlwaysPulse:v3];
        }
        id v6 = [(NSArray *)sublayers countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)_setAlwaysRotates:(BOOL)a3
{
  self->_alwaysRotates = a3;
}

- (BOOL)_anyLayerAlwaysRotates
{
  if (self->_alwaysRotates)
  {
LABEL_2:
    LOBYTE(v2) = 1;
    return (char)v2;
  }
  id v2 = [(NSArray *)self->_sublayers count];
  if (v2)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    sublayers = self->_sublayers;
    id v2 = [(NSArray *)sublayers countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v2)
    {
      id v5 = v2;
      uint64_t v6 = *(void *)v10;
LABEL_7:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(sublayers);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * v7) _anyLayerAlwaysRotates]) {
          goto LABEL_2;
        }
        if (v5 == (id)++v7)
        {
          id v5 = [(NSArray *)sublayers countByEnumeratingWithState:&v9 objects:v13 count:16];
          LOBYTE(v2) = 0;
          if (v5) {
            goto LABEL_7;
          }
          return (char)v2;
        }
      }
    }
  }
  return (char)v2;
}

- (void)_setAllLayersAlwaysRotate:(BOOL)a3
{
  BOOL v3 = a3;
  self->_alwaysRotates = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  sublayers = self->_sublayers;
  id v5 = [(NSArray *)sublayers countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(sublayers);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) _setAllLayersAlwaysRotate:v3];
      }
      id v6 = [(NSArray *)sublayers countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)needsWideGamut
{
  return 0;
}

- (BOOL)anyLayerNeedsWideGamutColor
{
  if ([(NSArray *)self->_sublayers count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    sublayers = self->_sublayers;
    id v4 = [(NSArray *)sublayers countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v10;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(sublayers);
          }
          if ([*(id *)(*((void *)&v9 + 1) + 8 * i) needsWideGamut])
          {
            LOBYTE(v4) = 1;
            return (char)v4;
          }
        }
        id v5 = [(NSArray *)sublayers countByEnumeratingWithState:&v9 objects:v13 count:16];
        LOBYTE(v4) = 0;
        if (v5) {
          continue;
        }
        break;
      }
    }
  }
  else if (self->_referencePath)
  {
    LOBYTE(v4) = [(CUIVectorGlyphLayer *)self needsWideGamut];
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (CGColor)_colorForVariableThreshold:(double)a3 variableMinValue:(double)a4 variableMaxValue:(double)a5 onFillColor:(CGColor *)a6 offFillColor:(CGColor *)a7
{
  if (a3 == INFINITY || a6 == 0) {
    return a6;
  }
  CopyWithCGFloat Alpha = a7;
  BOOL v10 = a3 <= a5;
  if (a3 <= 0.0) {
    BOOL v10 = a3 < a5;
  }
  if (a5 == INFINITY) {
    BOOL v10 = 1;
  }
  BOOL v11 = a3 >= a4 || a4 == INFINITY;
  if (v11 && v10) {
    return a6;
  }
  if (!a7)
  {
    CGFloat Alpha = CGColorGetAlpha(a6);
    CopyWithCGFloat Alpha = CGColorCreateCopyWithAlpha(a6, Alpha * 0.3);
    CFAutorelease(CopyWithAlpha);
  }
  return CopyWithAlpha;
}

- (CGImage)createImageUsingScaleFactor:(double)a3 targetSize:(CGSize)a4 variableMinValue:(double)a5 variableMaxValue:(double)a6 onFillColor:(CGColor *)a7 offFillColor:(CGColor *)a8
{
  double height = a4.height;
  double width = a4.width;
  double v16 = a4.width * a3;
  double v17 = a4.height * a3;
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  id v21 = CUICGBitmapContextCreate(vcvtpd_u64_f64(v16), vcvtpd_u64_f64(v17), 8uLL, 0, SRGB, 8193, v19, v20);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  unint64_t v22 = [(CUIVectorGlyphLayer *)self sublayers];
  id v23 = [(NSArray *)v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      id v26 = 0;
      do
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * (void)v26), "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:onFillColor:offFillColor:", v21, a7, a8, a3, width, height, a5, a6);
        id v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      id v24 = [(NSArray *)v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v24);
  }
  Image = CGBitmapContextCreateImage(v21);
  CGContextRelease(v21);
  return Image;
}

- (CGImage)createSublayerMaskUsingScaleFactor:(double)a3 targetSize:(CGSize)a4 maskColor:(CGColor *)a5
{
  uint64_t SRGBBlack = (uint64_t)a5;
  double height = a4.height;
  double width = a4.width;
  double v10 = a4.width * a3;
  double v11 = a4.height * a3;
  if (!a5) {
    uint64_t SRGBBlack = _CUIColorGetSRGBBlack();
  }
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  id v15 = CUICGBitmapContextCreate(vcvtpd_u64_f64(v10), vcvtpd_u64_f64(v11), 8uLL, 0, SRGB, 8193, v13, v14);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v16 = [(CUIVectorGlyphLayer *)self sublayers];
  id v17 = [(NSArray *)v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * (void)v20), "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:onFillColor:offFillColor:", v15, SRGBBlack, 0, a3, width, height, INFINITY, INFINITY);
        uint64_t v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [(NSArray *)v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v18);
  }
  Image = CGBitmapContextCreateImage(v15);
  CGContextRelease(v15);
  return Image;
}

+ (double)_strokeWidthFromStyle:(CGSVGAttributeMap *)a3
{
  if (a3 && CGSVGAttributeMapGetAttribute()) {
    CGSVGAttributeGetFloat();
  }
  return 0.0;
}

- (BOOL)alwaysBreathes
{
  return self->_alwaysBreathes;
}

- (BOOL)isPassthrough
{
  return self->_isPassthrough;
}

- (void)setDelegate:(id)a3
{
}

@end