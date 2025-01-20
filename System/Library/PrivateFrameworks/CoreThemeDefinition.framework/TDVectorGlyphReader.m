@interface TDVectorGlyphReader
+ (CGPoint)_anchorInOutlineCoordinateSpaceForAnchor:(CGSVGNode *)a3 glyph:(CGSVGNode *)a4;
+ (id)vectorGlyphReaderWithURL:(id)a3 error:(id *)a4;
+ (id)vectorGlyphReaderWithURL:(id)a3 platform:(int64_t)a4 error:(id *)a5;
+ (void)clearInstanceCache;
- ($01BB1521EC52D44A8E7628F5261DCEC8)_fixedAlignmentRectInsetsForVectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4 foundExactMargins:(BOOL *)a5;
- ($01BB1521EC52D44A8E7628F5261DCEC8)_interpolatedAlignmentRectInsetsForVectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4;
- ($01BB1521EC52D44A8E7628F5261DCEC8)alignmentRectInsetsForVectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4;
- (BOOL)_commonInitWithData:(id)a3 platform:(int64_t)a4 error:(id *)a5;
- (BOOL)_readSVGNodesError:(id *)a3;
- (BOOL)_validateVectorGlyphsWithError:(id *)a3;
- (BOOL)canDrawWithWeight:(int64_t)a3 size:(int64_t)a4;
- (BOOL)containsHierarchicalLayers;
- (BOOL)containsMulticolorLayers;
- (BOOL)containsWideGamutContent;
- (BOOL)interpolatedRotateAnchorForWeight:(int64_t)a3 size:(int64_t)a4 scaleFactor:(double)a5 point:(CGPoint *)a6;
- (BOOL)isInterpolatableForWeight:(int64_t)a3 size:(int64_t)a4;
- (BOOL)vectorGlyphExistsWithWeight:(int64_t)a3 size:(int64_t)a4 error:(id *)a5;
- (CGImage)fillImageWithName:(id)a3;
- (CGSVGAttributeMap)attributesForLayerNamed:(id)a3;
- (CGSVGAttributeMap)styleForLayerName:(id)a3;
- (CGSVGDocument)vectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4 error:(id *)a5;
- (CGSVGNode)interpolatedSymbolForWeight:(int64_t)a3 size:(int64_t)a4;
- (CGSize)canvasSizeForWeight:(int64_t)a3 size:(int64_t)a4;
- (CGSize)referenceCanvasSize;
- (TDVectorGlyphReader)initWithData:(id)a3 error:(id *)a4;
- (TDVectorGlyphReader)initWithData:(id)a3 platform:(int64_t)a4 error:(id *)a5;
- (TDVectorGlyphReader)initWithURL:(id)a3 error:(id *)a4;
- (TDVectorGlyphReader)initWithURL:(id)a3 platform:(int64_t)a4 error:(id *)a5;
- (double)_requestedPointSizeRatio;
- (double)_sourcePointSize;
- (double)baselineForVectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4;
- (double)capHeightForVectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4;
- (double)defaultPointSize;
- (double)scale;
- (double)strokeWidthForLayerNamed:(id)a3;
- (float)templateVersion;
- (id)_baselineNodeIDForGlyphSize:(int64_t)a3;
- (id)_caplineNodeIDForGlyphSize:(int64_t)a3;
- (id)_glyphNodeIDForWeight:(int64_t)a3 size:(int64_t)a4;
- (id)_layerNamesForRenderingMode:(id)a3;
- (id)_marginNodeIDForWeight:(int64_t)a3 size:(int64_t)a4 direction:(int64_t)a5;
- (id)_pathForLayerNamed:(id)a3 inDocument:(CGSVGDocument *)a4;
- (id)_symbolDefaults;
- (id)createMonochromeLayerGroupForSymbol:(CGSVGDocument *)a3 layerNames:(id)a4;
- (id)fillImageNames;
- (id)hierarchicalLayerNodeNames;
- (id)monochromeLayerNodeNames;
- (id)multicolorLayerNodeNames;
- (id)pathForLayerNamed:(id)a3;
- (unint64_t)numberOfVectorGlyphs;
- (void)_calcInterpolatability;
- (void)_legacy_drawMonochromeLayerNamed:(id)a3 inContext:(CGContext *)a4 scaleFactor:(double)a5 targetSize:(CGSize)a6 onFillColor:(CGColor *)a7 offFillColor:(CGColor *)a8;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3 atPointSize:(double)a4 scaleFactor:(double)a5 weight:(int64_t)a6 size:(int64_t)a7;
@end

@implementation TDVectorGlyphReader

- (void)dealloc
{
  if (self->_svgDocument)
  {
    CGSVGDocumentRelease();
    self->_svgDocument = 0;
  }
  if (self->_drawingSymbol)
  {
    CGSVGDocumentRelease();
    self->_drawingSymbol = 0;
  }

  v3.receiver = self;
  v3.super_class = (Class)TDVectorGlyphReader;
  [(TDVectorGlyphReader *)&v3 dealloc];
}

- (TDVectorGlyphReader)initWithURL:(id)a3 error:(id *)a4
{
  uint64_t v7 = CUICurrentPlatform();

  return [(TDVectorGlyphReader *)self initWithURL:a3 platform:v7 error:a4];
}

- (TDVectorGlyphReader)initWithURL:(id)a3 platform:(int64_t)a4 error:(id *)a5
{
  v14.receiver = self;
  v14.super_class = (Class)TDVectorGlyphReader;
  v8 = [(TDVectorGlyphReader *)&v14 init];
  if (v8)
  {
    v8->_fileURL = (NSURL *)a3;
    v8->_platform = a4;
    uint64_t v9 = CUICurrentPlatform();
    if ((unint64_t)(v9 - 3) <= 1) {
      v8->_platform = v9;
    }
    uint64_t v10 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:a3 options:8 error:a5];
    if (!v10
      || (v11 = (void *)v10,
          BOOL v12 = [(TDVectorGlyphReader *)v8 _commonInitWithData:v10 platform:a4 error:a5], v11, !v12))
    {

      return 0;
    }
  }
  return v8;
}

- (TDVectorGlyphReader)initWithData:(id)a3 error:(id *)a4
{
  uint64_t v7 = CUICurrentPlatform();

  return [(TDVectorGlyphReader *)self initWithData:a3 platform:v7 error:a4];
}

- (TDVectorGlyphReader)initWithData:(id)a3 platform:(int64_t)a4 error:(id *)a5
{
  v6 = self;
  if (!a3)
  {
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"NULL data received by -[TDVectorGlyphReader initWithData:error:]", a4);
    if (a5) {
      *a5 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v10, *MEMORY[0x263F08320], 0));
    }
    goto LABEL_7;
  }
  v12.receiver = self;
  v12.super_class = (Class)TDVectorGlyphReader;
  uint64_t v9 = [(TDVectorGlyphReader *)&v12 init];
  v6 = v9;
  if (v9
    && ![(TDVectorGlyphReader *)v9 _commonInitWithData:a3 platform:a4 error:a5])
  {
LABEL_7:

    return 0;
  }
  return v6;
}

- (BOOL)_commonInitWithData:(id)a3 platform:(int64_t)a4 error:(id *)a5
{
  self->_lock._os_unfair_lock_opaque = 0;
  double v7 = 0.0;
  if ((unint64_t)a4 <= 5) {
    double v7 = dbl_2351848A0[a4];
  }
  self->_defaultPointSize = v7;
  if (!a3)
  {
    if (self->_svgDocument) {
      goto LABEL_5;
    }
LABEL_17:
    uint64_t v15 = [NSString stringWithFormat:@"Unable to parse SVG Data from %@", self->_fileURL];
    if (a5) {
      *a5 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v15, *MEMORY[0x263F08320], 0));
    }
    NSLog(&stru_26E866BF0.isa, v15);
    return 0;
  }
  v8 = (CGSVGDocument *)CGSVGDocumentCreateFromData();
  self->_svgDocument = v8;
  if (!v8) {
    goto LABEL_17;
  }
LABEL_5:
  [(TDVectorGlyphReader *)self _readSVGNodesError:a5];
  if (!a5 || !*a5)
  {
    id v9 = [(NSDictionary *)self->_guideNodes objectForKey:@"Baseline-M"];
    id v10 = [(NSDictionary *)self->_guideNodes objectForKey:@"Capline-M"];
    if (v9)
    {
      if (v10)
      {
        if (CGSVGNodeGetType() == 2 && CGSVGNodeGetType() == 2)
        {
          CGSVGNodeGetBoundingBoxWithOptions();
          double v12 = v11;
          CGSVGNodeGetBoundingBoxWithOptions();
          if (fabs(v12) != INFINITY && fabs(v13) != INFINITY) {
            self->_sourcePointSize = round((v12 - v13) / 0.704589844);
          }
        }
      }
    }
    if (self->_sourcePointSize >= 0.00000011920929) {
      return 1;
    }
    if (a5) {
      *a5 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"Symbol image file has too small a point size", *MEMORY[0x263F08320], 0));
    }
    NSLog(&stru_26E866BF0.isa, @"Symbol image file has too small a point size");
  }
  return 0;
}

- (BOOL)_readSVGNodesError:(id *)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (self->_vectorGlyphNodes && self->_vectorGlyphRotateAnchorNodes) {
    return 1;
  }
  id v4 = objc_alloc(MEMORY[0x263EFF9A0]);
  if (__CUIVectorGlyphNodeIDs_onceToken != -1) {
    dispatch_once(&__CUIVectorGlyphNodeIDs_onceToken, &__block_literal_global_392);
  }
  v5 = (NSDictionary *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend((id)__CUIVectorGlyphNodeIDs__CUIVectorGlyphNodeIDs, "count"));
  id v6 = objc_alloc(MEMORY[0x263EFF9A0]);
  if (__CUIVectorGlyphNodeIDs_onceToken != -1) {
    dispatch_once(&__CUIVectorGlyphNodeIDs_onceToken, &__block_literal_global_392);
  }
  v32 = (NSDictionary *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend((id)__CUIVectorGlyphNodeIDs__CUIVectorGlyphNodeIDs, "count"));
  id v7 = objc_alloc(MEMORY[0x263EFF9A0]);
  if (CUIVectorGlyphGuideIDs_onceToken != -1) {
    dispatch_once(&CUIVectorGlyphGuideIDs_onceToken, &__block_literal_global_394);
  }
  v8 = (NSDictionary *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend((id)CUIVectorGlyphGuideIDs__CUIVectorGlyphGuideIDs, "count"));
  if (self->_svgDocument)
  {
    CGSVGDocumentGetRootNode();
    if (CGSVGNodeFindChildWithStringIdentifier()
      && CGSVGNodeGetType() == 2
      && CGSVGShapeNodeGetPrimitive() == 10001)
    {
      id v9 = (id)CGSVGShapeNodeCopyText();
      uint64_t v10 = [v9 rangeOfString:@"Template v."];
      if (v11)
      {
        double v12 = (void *)[v9 substringFromIndex:v10 + v11];

        id v9 = v12;
      }
      [v9 floatValue];
      if (((LODWORD(v13) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E) {
        self->_templateVersion = v13;
      }
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    if (__CUIVectorGlyphNodeIDs_onceToken != -1) {
      dispatch_once(&__CUIVectorGlyphNodeIDs_onceToken, &__block_literal_global_392);
    }
    objc_super v14 = (void *)__CUIVectorGlyphNodeIDs__CUIVectorGlyphNodeIDs;
    uint64_t v15 = [(id)__CUIVectorGlyphNodeIDs__CUIVectorGlyphNodeIDs countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v42 != v16) {
            objc_enumerationMutation(v14);
          }
          v18 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          uint64_t ChildWithStringIdentifier = CGSVGNodeFindChildWithStringIdentifier();
          if (ChildWithStringIdentifier)
          {
            [(NSDictionary *)v5 setObject:ChildWithStringIdentifier forKey:v18];
            if (self->_templateVersion >= 6.0)
            {
              [v18 stringByAppendingString:@"-rotate-anchor"];
              uint64_t v20 = CGSVGNodeFindChildWithStringIdentifier();
              if (v20) {
                [(NSDictionary *)v32 setObject:v20 forKey:v18];
              }
            }
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v15);
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    if (CUIVectorGlyphGuideIDs_onceToken != -1) {
      dispatch_once(&CUIVectorGlyphGuideIDs_onceToken, &__block_literal_global_394);
    }
    v21 = (void *)CUIVectorGlyphGuideIDs__CUIVectorGlyphGuideIDs;
    uint64_t v22 = [(id)CUIVectorGlyphGuideIDs__CUIVectorGlyphGuideIDs countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v38 != v23) {
            objc_enumerationMutation(v21);
          }
          uint64_t v25 = *(void *)(*((void *)&v37 + 1) + 8 * j);
          uint64_t v26 = CGSVGNodeFindChildWithStringIdentifier();
          if (v26) {
            [(NSDictionary *)v8 setObject:v26 forKey:v25];
          }
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v22);
    }
    if (self->_templateVersion >= 5.0 && CGSVGNodeFindChildWithStringIdentifier())
    {
      uint64_t ChildCount = CGSVGNodeGetChildCount();
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x2020000000;
      BOOL v28 = CGSVGNodeGetType() != 1 || ChildCount == 0;
      char v29 = !v28;
      char v36 = v29;
      if (!v28)
      {
        CGSVGNodeEnumerate();
        if (*((unsigned char *)v34 + 24)) {
          self->_layerTreeNode = (CGSVGNode *)CGSVGNodeRetain();
        }
      }
      _Block_object_dispose(&v33, 8);
    }
  }
  self->_vectorGlyphNodes = v5;
  self->_vectorGlyphRotateAnchorNodes = v32;
  self->_guideNodes = v8;
  [(TDVectorGlyphReader *)self _calcInterpolatability];
  if ([(TDVectorGlyphReader *)self _validateVectorGlyphsWithError:a3]) {
    return 1;
  }
  [(NSDictionary *)v5 removeAllObjects];
  [(NSDictionary *)v32 removeAllObjects];
  [(NSDictionary *)v8 removeAllObjects];
  return 0;
}

uint64_t __42__TDVectorGlyphReader__readSVGNodesError___block_invoke(uint64_t result, uint64_t a2, int a3, unsigned char *a4)
{
  if (!a3)
  {
    uint64_t v5 = result;
    result = CGSVGNodeGetType();
    if (result != 1)
    {
      *(unsigned char *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  return result;
}

- (BOOL)_validateVectorGlyphsWithError:(id *)a3
{
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x3052000000;
  v76 = __Block_byref_object_copy_;
  v77 = __Block_byref_object_dispose_;
  uint64_t v78 = 0;
  float templateVersion = self->_templateVersion;
  uint64_t v5 = (void *)MEMORY[0x263F08320];
  if (templateVersion <= 6.0)
  {
    uint64_t v6 = 1;
    while (1)
    {
      id v7 = [(TDVectorGlyphReader *)self _caplineNodeIDForGlyphSize:v6];
      id v8 = [(TDVectorGlyphReader *)self _baselineNodeIDForGlyphSize:v6];
      id v9 = [(NSDictionary *)self->_guideNodes objectForKey:v8];
      id v10 = [(NSDictionary *)self->_guideNodes objectForKey:v7];
      if (!v9)
      {
        uint64_t v14 = [NSString stringWithFormat:@"Symbol image file '%@' is missing a baseline guide for %@ ", self->_fileURL, v8];
        id v15 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v16 = objc_msgSend(v15, "initWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", v14, *v5));
        goto LABEL_10;
      }
      if (!v10) {
        break;
      }
      if (++v6 == 4) {
        goto LABEL_11;
      }
    }
    uint64_t v17 = [NSString stringWithFormat:@"Symbol image file '%@' is missing a capline guide for %@ ", self->_fileURL, v7];
    id v18 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v16 = objc_msgSend(v18, "initWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", v17, *v5));
LABEL_10:
    v74[5] = v16;
LABEL_11:
    guideNodes = self->_guideNodes;
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = __54__TDVectorGlyphReader__validateVectorGlyphsWithError___block_invoke;
    v72[3] = &unk_264C445D8;
    v72[4] = self;
    v72[5] = &v73;
    [(NSDictionary *)guideNodes enumerateKeysAndObjectsUsingBlock:v72];
  }
  else
  {
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Template format %.1f is newer than the version that this software supports (%.1f)", templateVersion, 0x4018000000000000);
    id v12 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v13 = objc_msgSend(v12, "initWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", v11, *v5));
    v74[5] = v13;
  }
  if (self->_templateVersion < 3.0) {
    goto LABEL_79;
  }
  id v20 = [(TDVectorGlyphReader *)self _marginNodeIDForWeight:1 size:1 direction:4];
  id v21 = [(TDVectorGlyphReader *)self _marginNodeIDForWeight:1 size:1 direction:5];
  id v22 = [(NSDictionary *)self->_guideNodes objectForKey:v20];
  id v69 = [(NSDictionary *)self->_guideNodes objectForKey:v21];
  id v23 = [(TDVectorGlyphReader *)self _marginNodeIDForWeight:4 size:1 direction:4];
  id v24 = [(TDVectorGlyphReader *)self _marginNodeIDForWeight:4 size:1 direction:5];
  id v25 = [(NSDictionary *)self->_guideNodes objectForKey:v23];
  id v26 = [(NSDictionary *)self->_guideNodes objectForKey:v24];
  id v27 = [(TDVectorGlyphReader *)self _marginNodeIDForWeight:9 size:1 direction:4];
  id v28 = [(TDVectorGlyphReader *)self _marginNodeIDForWeight:9 size:1 direction:5];
  id v29 = [(NSDictionary *)self->_guideNodes objectForKey:v27];
  id v30 = [(NSDictionary *)self->_guideNodes objectForKey:v28];
  id v31 = [(TDVectorGlyphReader *)self _marginNodeIDForWeight:4 size:2 direction:4];
  id v32 = [(TDVectorGlyphReader *)self _marginNodeIDForWeight:4 size:2 direction:5];
  id v68 = [(NSDictionary *)self->_guideNodes objectForKey:v31];
  id v67 = [(NSDictionary *)self->_guideNodes objectForKey:v32];
  id v66 = [(NSDictionary *)self->_guideNodes objectForKey:@"left-margin"];
  id v65 = [(NSDictionary *)self->_guideNodes objectForKey:@"right-margin"];
  if (!self->_isInterpolatable)
  {
    if (v68 && v67 || v66 && v65)
    {
      uint64_t v40 = 2;
    }
    else
    {
      if (!v25 || !v26) {
        goto LABEL_77;
      }
      uint64_t v40 = 1;
    }
    id v41 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:[(TDVectorGlyphReader *)self _glyphNodeIDForWeight:4 size:v40]];
LABEL_43:
    if (v41) {
      goto LABEL_79;
    }
    id v38 = v22;
    BOOL v39 = 1;
    BOOL v36 = 1;
    goto LABEL_45;
  }
  if (v22 && v69 && v25 && v26 && v29 && v30)
  {
    id v33 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:[(TDVectorGlyphReader *)self _glyphNodeIDForWeight:1 size:1]];
    BOOL v34 = v33 != 0;
    id v35 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:[(TDVectorGlyphReader *)self _glyphNodeIDForWeight:4 size:1]];
    BOOL v36 = v35 != 0;
    id v37 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:[(TDVectorGlyphReader *)self _glyphNodeIDForWeight:9 size:1]];
    id v38 = v22;
    BOOL v39 = v37 != 0;
    if (v33 && v35 && v37) {
      goto LABEL_79;
    }
    goto LABEL_46;
  }
  if (v22 || v69 || !v25 || !v26 || v29 || v30)
  {
    if (v68 && v67 || v66 && v65)
    {
      id v41 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:[(TDVectorGlyphReader *)self _glyphNodeIDForWeight:4 size:2]];
      goto LABEL_43;
    }
LABEL_77:
    uint64_t v48 = [NSString stringWithFormat:@"Symbol image file '%@' is missing margin guides: interpolatable margins on Ultralight-S, Regular-S, and Black-S, or fixed margins on Regular-M or Regular-S are required.", self->_fileURL];
    id v49 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v47 = objc_msgSend(v49, "initWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", v48, *MEMORY[0x263F08320]));
LABEL_78:
    v74[5] = v47;
    goto LABEL_79;
  }
  if ([(NSDictionary *)self->_vectorGlyphNodes objectForKey:[(TDVectorGlyphReader *)self _glyphNodeIDForWeight:4 size:1]])
  {
    goto LABEL_79;
  }
  id v38 = 0;
  BOOL v36 = 0;
  BOOL v39 = 1;
LABEL_45:
  BOOL v34 = 1;
LABEL_46:
  if (v38 && v69 && v25 && v26 && v29 && v30)
  {
    long long v42 = (void *)[NSString stringWithFormat:@"Symbol image file '%@' has interpolatable margin guides for missing glyphs: margins on Ultralight-S, Regular-S, and Black-S but", self->_fileURL];
    if (!v34) {
      long long v42 = (void *)[v42 stringByAppendingString:@" Ultralight-S"];
    }
    if (!v36) {
      long long v42 = (void *)[v42 stringByAppendingString:@" Regular-S"];
    }
    if (!v39) {
      long long v42 = (void *)[v42 stringByAppendingString:@" Black-S"];
    }
    uint64_t v43 = [v42 stringByAppendingString:@" glyphs are missing."];
    goto LABEL_72;
  }
  if (!v38 && !v69 && v25 && v26 && !v29 && !v30)
  {
    long long v44 = @"Symbol image file '%@' has fixed margin guides for a glyph which is absent: fixed margins found for Regular-S but no corresponding glyph exists.";
LABEL_71:
    uint64_t v43 = objc_msgSend(NSString, "stringWithFormat:", v44, self->_fileURL);
LABEL_72:
    uint64_t v45 = v43;
    if (!v43) {
      goto LABEL_79;
    }
    id v46 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v47 = objc_msgSend(v46, "initWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", v45, *MEMORY[0x263F08320]));
    goto LABEL_78;
  }
  if (v68 && v67 || v66 && v65)
  {
    long long v44 = @"Symbol image file '%@' has fixed margin guides for a glyph which is absent: fixed margins found for Regular-M but no corresponding glyph exists.";
    goto LABEL_71;
  }
LABEL_79:
  if (templateVersion <= 6.0)
  {
    vectorGlyphNodes = self->_vectorGlyphNodes;
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __54__TDVectorGlyphReader__validateVectorGlyphsWithError___block_invoke_2;
    v71[3] = &unk_264C445D8;
    v71[4] = self;
    v71[5] = &v73;
    [(NSDictionary *)vectorGlyphNodes enumerateKeysAndObjectsUsingBlock:v71];
  }
  id v51 = [(TDVectorGlyphReader *)self _glyphNodeIDForWeight:4 size:2];
  v52 = (void *)MEMORY[0x263F08320];
  if (![(NSDictionary *)self->_vectorGlyphNodes objectForKey:v51])
  {
    [(TDVectorGlyphReader *)self templateVersion];
    if (v53 < 3.0
      || (id v62 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:[(TDVectorGlyphReader *)self _glyphNodeIDForWeight:1 size:1]], v63 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:[(TDVectorGlyphReader *)self _glyphNodeIDForWeight:4 size:1]], v64 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:[(TDVectorGlyphReader *)self _glyphNodeIDForWeight:9 size:1]], !v62)|| !v63|| !v64|| !CUISVGNodeCanBeRepresentedAsPath()|| !CUISVGNodeCanBeRepresentedAsPath()|| (CUISVGNodeCanBeRepresentedAsPath() & 1) == 0)
    {
      uint64_t v54 = [NSString stringWithFormat:@"Symbol image file '%@' must have a glyph for Regular weight Medium size", self->_fileURL];
      id v55 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v56 = objc_msgSend(v55, "initWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", v54, *v52));
      v74[5] = v56;
    }
  }
  v57 = v74;
  v58 = (void *)v74[5];
  if (v58)
  {
    if (a3)
    {
      *a3 = v58;
      v58 = (void *)v57[5];
    }
    NSLog(&stru_26E866BF0.isa, objc_msgSend((id)objc_msgSend(v58, "userInfo"), "objectForKey:", *v52));
    id v59 = (id)v74[5];
    BOOL v60 = 0;
  }
  else
  {
    BOOL v60 = templateVersion <= 6.0;
  }
  _Block_object_dispose(&v73, 8);
  return v60;
}

uint64_t __54__TDVectorGlyphReader__validateVectorGlyphsWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = CGSVGNodeGetType();
  if (result != 2)
  {
    uint64_t v8 = [NSString stringWithFormat:@"Symbol image file '%@' has guide object %@ of the wrong type, it must be a shape", *(void *)(*(void *)(a1 + 32) + 24), a2];
    id v9 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t result = objc_msgSend(v9, "initWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", v8, *MEMORY[0x263F08320]));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
    *a4 = 1;
  }
  return result;
}

uint64_t __54__TDVectorGlyphReader__validateVectorGlyphsWithError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t Type = CGSVGNodeGetType();
  if (Type != 1)
  {
    uint64_t v12 = [NSString stringWithFormat:@"Symbol image file '%@' has glyph node %@ that is not a group got type:'%d' expected:'%d'", *(void *)(*(void *)(a1 + 32) + 24), a2, Type, 1];
LABEL_10:
    uint64_t v13 = v12;
    id v14 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t result = objc_msgSend(v14, "initWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", v13, *MEMORY[0x263F08320]));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
    goto LABEL_11;
  }
  if (!CGSVGNodeGetChildCount())
  {
    uint64_t v12 = [NSString stringWithFormat:@"Symbol image file '%@' has glyph node %@ that contains no content", *(void *)(*(void *)(a1 + 32) + 24), a2, v15, v16];
    goto LABEL_10;
  }
  CGSVGNodeGetBoundingBoxWithOptions();
  if (v10 <= 0.0 || v9 <= 0.0)
  {
    uint64_t v12 = [NSString stringWithFormat:@"Symbol image file '%@' has glyph node %@ that is zero size width || height", *(void *)(*(void *)(a1 + 32) + 24), a2, v15, v16];
    goto LABEL_10;
  }
  uint64_t result = __ValidateGlyphNode(a3, *(void *)(*(void *)(a1 + 32) + 24), (void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  if ((result & 1) == 0) {
LABEL_11:
  }
    *a4 = 1;
  return result;
}

- (unint64_t)numberOfVectorGlyphs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  vectorGlyphNodes = self->_vectorGlyphNodes;
  if (!vectorGlyphNodes)
  {
    [(TDVectorGlyphReader *)self _readSVGNodesError:0];
    vectorGlyphNodes = self->_vectorGlyphNodes;
  }
  unint64_t v5 = [(NSDictionary *)vectorGlyphNodes count];
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (double)_sourcePointSize
{
  return self->_sourcePointSize;
}

- (double)defaultPointSize
{
  return self->_defaultPointSize;
}

- (id)_glyphNodeIDForWeight:(int64_t)a3 size:(int64_t)a4
{
  switch(a4)
  {
    case 3:
      int64_t v4 = a3 - 1;
      if ((unint64_t)(a3 - 1) < 9)
      {
        unint64_t v5 = off_264C44840;
        return v5[v4];
      }
      break;
    case 2:
      int64_t v4 = a3 - 1;
      if ((unint64_t)(a3 - 1) < 9)
      {
        unint64_t v5 = off_264C447F8;
        return v5[v4];
      }
      break;
    case 1:
      int64_t v4 = a3 - 1;
      if ((unint64_t)(a3 - 1) < 9)
      {
        unint64_t v5 = off_264C447B0;
        return v5[v4];
      }
      break;
  }
  return 0;
}

- (id)_baselineNodeIDForGlyphSize:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  else {
    return off_264C44888[a3 - 1];
  }
}

- (id)_caplineNodeIDForGlyphSize:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  else {
    return off_264C448A0[a3 - 1];
  }
}

- (id)_marginNodeIDForWeight:(int64_t)a3 size:(int64_t)a4 direction:(int64_t)a5
{
  id v6 = [(TDVectorGlyphReader *)self _glyphNodeIDForWeight:a3 size:a4];
  if (!v6) {
    return 0;
  }
  if (a5 == 4)
  {
    id v7 = @"left-margin";
    return (id)[(__CFString *)v7 stringByAppendingFormat:@"-%@", v6];
  }
  if (a5 != 5) {
    return 0;
  }
  id v7 = @"right-margin";
  return (id)[(__CFString *)v7 stringByAppendingFormat:@"-%@", v6];
}

- (CGSVGDocument)vectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4 error:(id *)a5
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  float templateVersion = self->_templateVersion;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ((unint64_t)(a3 - 1) > 8 || (unint64_t)(a4 - 1) > 2)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%s called with invalid weight %d or invalid size %d for file '%@'", "-[TDVectorGlyphReader vectorGlyphWithWeight:size:error:]", a3, a4, self->_fileURL];
    if (a5) {
      *a5 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v13, *MEMORY[0x263F08320], 0));
    }
    NSLog(&stru_26E866BF0.isa, v13);
LABEL_8:
    uint64_t v12 = 0;
    goto LABEL_9;
  }
  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d.%d", a3, a4);
  uint64_t v11 = [(NSMutableDictionary *)self->_vectorGlyphWithWeightSize objectForKey:v10];
  if (!v11)
  {
    if (!self->_vectorGlyphNodes && ![(TDVectorGlyphReader *)self _readSVGNodesError:a5])
    {
      os_unfair_lock_unlock(p_lock);
      return 0;
    }
    id v15 = [(TDVectorGlyphReader *)self _glyphNodeIDForWeight:a3 size:a4];
    if (![(NSDictionary *)self->_vectorGlyphNodes objectForKey:v15]
      && (![(TDVectorGlyphReader *)self isInterpolatableForWeight:a3 size:a4]
       || ![(TDVectorGlyphReader *)self interpolatedSymbolForWeight:a3 size:a4]))
    {
      goto LABEL_8;
    }
    memset(&v84, 0, sizeof(v84));
    [(TDVectorGlyphReader *)self defaultPointSize];
    double v17 = v16;
    [(TDVectorGlyphReader *)self _sourcePointSize];
    double v19 = v17 / v18;
    if (self->_platform == 4) {
      double v19 = v19 * 0.94634;
    }
    double v68 = v19;
    CGAffineTransformMakeScale(&v83, v19, v19);
    CGFloat a = v83.a;
    CGFloat b = v83.b;
    CGFloat c = v83.c;
    CGFloat d = v83.d;
    CGFloat tx = v83.tx;
    tCGFloat y = v83.ty;
    CGSVGNodeGetBoundingBoxWithOptions();
    double v26 = v25;
    double v28 = v27;
    CGSVGDocumentGetRootNode();
    if (CGSVGNodeGetParent())
    {
      CGSVGNodeGetBoundingBoxWithOptions();
      double v26 = v29;
      double v28 = v30;
    }
    id v67 = v15;
    uint64_t v63 = v10;
    id v64 = p_lock;
    t1.CGFloat a = a;
    t1.CGFloat b = b;
    t1.CGFloat c = c;
    t1.CGFloat d = d;
    t1.CGFloat tx = tx;
    t1.tCGFloat y = ty;
    CGAffineTransformTranslate(&v83, &t1, -v26, -v28);
    CGFloat v32 = v83.a;
    CGFloat v31 = v83.b;
    double v33 = v83.c;
    CGFloat v34 = v83.d;
    double v36 = v83.tx;
    CGFloat v35 = v83.ty;
    uint64_t Attribute = CGSVGNodeFindAttribute();
    CGFloat v38 = v35;
    CGFloat v39 = v36;
    CGFloat v40 = v34;
    CGFloat v41 = v33;
    CGFloat v42 = v31;
    CGFloat v43 = v32;
    if (Attribute)
    {
      int Transform = CGSVGAttributeGetTransform();
      CGFloat v38 = v35;
      CGFloat v39 = v36;
      CGFloat v40 = v34;
      CGFloat v41 = v33;
      CGFloat v42 = v31;
      CGFloat v43 = v32;
      if (Transform)
      {
        CGAffineTransform t1 = v84;
        t2.CGFloat a = v32;
        t2.CGFloat b = v31;
        t2.CGFloat c = v33;
        t2.CGFloat d = v34;
        t2.CGFloat tx = v36;
        t2.tCGFloat y = v35;
        CGAffineTransformConcat(&v83, &t1, &t2);
        CGFloat v43 = v83.a;
        CGFloat v42 = v83.b;
        CGFloat v41 = v83.c;
        CGFloat v40 = v83.d;
        CGFloat v39 = v83.tx;
        CGFloat v38 = v83.ty;
      }
    }
    v83.CGFloat a = v43;
    v83.CGFloat b = v42;
    v83.CGFloat c = v41;
    v83.CGFloat d = v40;
    v83.CGFloat tx = v39;
    v83.tCGFloat y = v38;
    CGSVGAttributeCreateWithTransform();
    uint64_t v12 = (CGSVGDocument *)CGSVGDocumentCreate();
    uint64_t v45 = (void *)[MEMORY[0x263EFF9C0] set];
    [v45 addObject:@"defaults"];
    uint64_t v75 = MEMORY[0x263EF8330];
    uint64_t v76 = 3221225472;
    v77 = __56__TDVectorGlyphReader_vectorGlyphWithWeight_size_error___block_invoke;
    uint64_t v78 = &unk_264C44620;
    BOOL v80 = templateVersion >= 5.0;
    v79 = v45;
    CGSVGNodeEnumerate();
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    uint64_t v46 = [v45 countByEnumeratingWithState:&v71 objects:v85 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v72 != v48) {
            objc_enumerationMutation(v45);
          }
          [@"." stringByAppendingString:*(void *)(*((void *)&v71 + 1) + 8 * i)];
          if (CGSVGDocumentGetNamedStyle() && CGSVGAttributeMapCopy())
          {
            CGSVGDocumentAddNamedStyle();
            CGSVGAttributeMapRelease();
          }
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v71 objects:v85 count:16];
      }
      while (v47);
    }
    CGSVGDocumentGetRootNode();
    CGSVGNodeCopy();
    CGSVGNodeSetAttribute();
    CGSVGAttributeRelease();
    CGSVGNodeSetStringIdentifier();
    CGSVGNodeAddChild();
    CGSVGNodeRelease();
    id v50 = [(NSDictionary *)self->_vectorGlyphRotateAnchorNodes objectForKey:v67];
    t1.CGFloat a = 0.0;
    t1.CGFloat b = 0.0;
    if (v50)
    {
      CGSVGNodeGetBoundingBox();
      double v66 = v34;
      CGFloat x = v87.origin.x;
      double v52 = v31;
      CGFloat y = v87.origin.y;
      double v65 = v32;
      CGFloat width = v87.size.width;
      CGFloat height = v87.size.height;
      double v62 = v35;
      double MidX = CGRectGetMidX(v87);
      v88.origin.CGFloat x = x;
      v88.origin.CGFloat y = y;
      v88.size.CGFloat width = width;
      v88.size.CGFloat height = height;
      CGFloat MidY = CGRectGetMidY(v88);
      t1.CGFloat a = v36 + v33 * MidY + v65 * MidX;
      t1.CGFloat b = v62 + v66 * MidY + v52 * MidX;
      uint64_t v58 = v63;
      p_lock = v64;
    }
    else
    {
      uint64_t v58 = v63;
      p_lock = v64;
      if (![(TDVectorGlyphReader *)self interpolatedRotateAnchorForWeight:a3 size:a4 scaleFactor:&t1 point:v68])goto LABEL_39; {
      CGSVGNodeGetBoundingBoxWithOptions();
      }
      memset(&v83, 0, sizeof(v83));
      CGAffineTransformMakeTranslation(&v83, v59, v60);
      *(float64x2_t *)&t1.CGFloat a = vaddq_f64(*(float64x2_t *)&v83.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v83.c, t1.b), *(float64x2_t *)&v83.a, t1.a));
    }
    CGSVGNodeCreate();
    CGSVGNodeSetStringIdentifier();
    CGSVGAttributeCreateWithFloat();
    CGSVGAttributeCreateWithFloat();
    CGSVGNodeSetAttribute();
    CGSVGNodeSetAttribute();
    CGSVGAttributeRelease();
    CGSVGAttributeRelease();
    CGSVGNodeAddChild();
    CGSVGNodeRelease();
LABEL_39:
    if (self->_layerTreeNode && templateVersion >= 5.0)
    {
      CGSVGNodeCopy();
      CGSVGNodeAddChild();
      CGSVGNodeSetStringIdentifier();
      CGSVGNodeRelease();
    }
    CGSVGNodeEnumerate();
    CGSVGNodeEnumerate();
    vectorGlyphWithWeightSize = self->_vectorGlyphWithWeightSize;
    if (!vectorGlyphWithWeightSize)
    {
      vectorGlyphWithWeightSize = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      self->_vectorGlyphWithWeightSize = vectorGlyphWithWeightSize;
    }
    [(NSMutableDictionary *)vectorGlyphWithWeightSize setObject:v12 forKey:v58];
    goto LABEL_9;
  }
  uint64_t v12 = (CGSVGDocument *)v11;
  CGSVGDocumentRetain();
LABEL_9:
  os_unfair_lock_unlock(p_lock);
  return v12;
}

void __56__TDVectorGlyphReader_vectorGlyphWithWeight_size_error___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3)
  {
    int Type = CGSVGNodeGetType();
    if (Type == 2 || Type == 1 && *(unsigned char *)(a1 + 40))
    {
      if (CGSVGNodeFindAttribute())
      {
        id v6 = (id)CGSVGAttributeCopyString();
        unint64_t v5 = objc_msgSend((id)objc_msgSend(v6, "componentsSeparatedByString:", @" "), "mutableCopy");
        objc_msgSend(v5, "removeObjectsAtIndexes:", objc_msgSend(v5, "indexesOfObjectsPassingTest:", &__block_literal_global));
        [*(id *)(a1 + 32) addObjectsFromArray:v5];
      }
    }
  }
}

uint64_t __56__TDVectorGlyphReader_vectorGlyphWithWeight_size_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:@"SFSymbolsPreview"];
}

uint64_t __56__TDVectorGlyphReader_vectorGlyphWithWeight_size_error___block_invoke_3(uint64_t result, uint64_t a2, int a3)
{
  if (!a3)
  {
    v13[10] = v6;
    v13[11] = v5;
    v13[16] = v3;
    v13[17] = v4;
    uint64_t v7 = result;
    uint64_t result = CGSVGNodeGetType();
    if (result == 2 || result == 1 && *(unsigned char *)(v7 + 32))
    {
      if (CGSVGNodeFindAttribute())
      {
        uint64_t v8 = (void *)CGSVGAttributeCopyString();
        double v9 = objc_msgSend((id)objc_msgSend(v8, "componentsSeparatedByString:", @" "), "mutableCopy");
        objc_msgSend(v9, "removeObjectsAtIndexes:", objc_msgSend(v9, "indexesOfObjectsPassingTest:", &__block_literal_global_213));
        [v9 componentsJoinedByString:@" "];
        uint64_t v10 = (const void *)CGSVGAttributeCreateWithString();
        CGSVGNodeSetAttribute();

        CFRelease(v10);
      }
      uint64_t v11 = (void *)[MEMORY[0x263EFF980] array];
      uint64_t AttributeMap = CGSVGNodeGetAttributeMap();
      v13[5] = MEMORY[0x263EF8330];
      v13[6] = 3221225472;
      v13[7] = __56__TDVectorGlyphReader_vectorGlyphWithWeight_size_error___block_invoke_5;
      v13[8] = &unk_264C44648;
      v13[9] = v11;
      CGSVGAttributeMapEnumerate();
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __56__TDVectorGlyphReader_vectorGlyphWithWeight_size_error___block_invoke_6;
      v13[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
      v13[4] = AttributeMap;
      return [v11 enumerateObjectsUsingBlock:v13];
    }
  }
  return result;
}

uint64_t __56__TDVectorGlyphReader_vectorGlyphWithWeight_size_error___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:@"SFSymbolsPreview"];
}

void __56__TDVectorGlyphReader_vectorGlyphWithWeight_size_error___block_invoke_5(uint64_t a1)
{
  id v2 = (id)CGSVGAtomCopyString();
  if ([v2 hasPrefix:@"-sfsymbols-"]) {
    [*(id *)(a1 + 32) addObject:v2];
  }
}

uint64_t __56__TDVectorGlyphReader_vectorGlyphWithWeight_size_error___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = CGSVGAtomFromString();

  return MEMORY[0x270F233E0](v1, v2);
}

uint64_t __56__TDVectorGlyphReader_vectorGlyphWithWeight_size_error___block_invoke_7(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3)
  {
    uint64_t result = CGSVGNodeGetType();
    if (result == 2)
    {
      uint64_t result = CGSVGNodeGetAttributeMap();
      if (result)
      {
        uint64_t result = CGSVGAttributeMapGetAttribute();
        if (result) {
          return CGSVGAttributeGetFloat();
        }
      }
    }
  }
  return result;
}

- (BOOL)vectorGlyphExistsWithWeight:(int64_t)a3 size:(int64_t)a4 error:(id *)a5
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ((unint64_t)(a3 - 1) > 8 || (unint64_t)(a4 - 1) > 2)
  {
    uint64_t v11 = [NSString stringWithFormat:@"%s called with invalid weight %d or invalid size %d for file '%@'", "-[TDVectorGlyphReader vectorGlyphExistsWithWeight:size:error:]", a3, a4, self->_fileURL];
    if (a5) {
      *a5 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 1010, objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v11, *MEMORY[0x263F08320], 0));
    }
    NSLog(&stru_26E866BF0.isa, v11);
    BOOL v10 = 0;
  }
  else
  {
    if (!self->_vectorGlyphNodes) {
      [(TDVectorGlyphReader *)self _readSVGNodesError:a5];
    }
    BOOL v10 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:[(TDVectorGlyphReader *)self _glyphNodeIDForWeight:a3 size:a4]] != 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (double)baselineForVectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ((unint64_t)(a3 - 1) > 8)
  {
    NSLog(&cfstr_SCalledWithInv_0.isa, "-[TDVectorGlyphReader baselineForVectorGlyphWithWeight:size:]", a3, a4, self->_fileURL);
    double v20 = 0.0;
  }
  else
  {
    id v8 = [(TDVectorGlyphReader *)self _glyphNodeIDForWeight:a3 size:a4];
    id v9 = [(TDVectorGlyphReader *)self _baselineNodeIDForGlyphSize:a4];
    id v10 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:v8];
    id v11 = [(NSDictionary *)self->_guideNodes objectForKey:v9];
    [(TDVectorGlyphReader *)self defaultPointSize];
    double v13 = v12;
    [(TDVectorGlyphReader *)self _sourcePointSize];
    double v15 = v14;
    if (v10 && v11 && CGSVGNodeGetType() == 2)
    {
      CGSVGNodeGetBoundingBoxWithOptions();
      double v17 = v16;
      double v19 = v18;
      CGSVGNodeGetBoundingBoxWithOptions();
      double v20 = v13 * ((v17 + v19 - CGRectGetMidY(v48)) / v15);
    }
    else
    {
      double v20 = 0.0;
      if (self->_isInterpolatable)
      {
        id v21 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:[(TDVectorGlyphReader *)self _glyphNodeIDForWeight:1 size:1]];
        id v22 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:[(TDVectorGlyphReader *)self _glyphNodeIDForWeight:4 size:1]];
        id v23 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:[(TDVectorGlyphReader *)self _glyphNodeIDForWeight:9 size:1]];
        id v24 = [(NSDictionary *)self->_guideNodes objectForKey:[(TDVectorGlyphReader *)self _baselineNodeIDForGlyphSize:1]];
        if (v21)
        {
          if (v22 && v23 && v24 && CGSVGNodeGetType() == 2)
          {
            CGSVGNodeGetBoundingBoxWithOptions();
            double v26 = v25;
            double v28 = v27;
            CGSVGNodeGetBoundingBoxWithOptions();
            double v30 = v29;
            double v32 = v31;
            CGSVGNodeGetBoundingBoxWithOptions();
            double v34 = v33;
            double v36 = v35;
            CGSVGNodeGetBoundingBoxWithOptions();
            CGFloat MidY = CGRectGetMidY(v49);
            double v38 = v13 * ((v26 + v28 - MidY) / v15);
            double v39 = v13 * ((v30 + v32 - MidY) / v15);
            double v40 = v13 * ((v34 + v36 - MidY) / v15);
            [MEMORY[0x263F38400] scalarsForGlyphWeight:a3 glyphSize:a4];
            double v42 = v41;
            double v44 = v43;
            [MEMORY[0x263F38400] transformForGlyphSize:a4];
            double v20 = v46 * (v39 + (v38 - v39) * v42 + (v40 - v39) * v44) - v13 * v45;
          }
        }
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
  double result = v20 * 0.94634;
  if (self->_platform != 4) {
    return v20;
  }
  return result;
}

- (double)capHeightForVectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ((unint64_t)(a3 - 1) > 8)
  {
    NSLog(&cfstr_SCalledWithInv_1.isa, "-[TDVectorGlyphReader capHeightForVectorGlyphWithWeight:size:]", a3, a4, self->_fileURL);
    double v16 = 0.0;
  }
  else
  {
    id v8 = [(TDVectorGlyphReader *)self _caplineNodeIDForGlyphSize:a4];
    id v9 = [(NSDictionary *)self->_guideNodes objectForKey:[(TDVectorGlyphReader *)self _baselineNodeIDForGlyphSize:a4]];
    id v10 = [(NSDictionary *)self->_guideNodes objectForKey:v8];
    if (!v9 || (id v11 = v10) == 0)
    {
      id v12 = [(TDVectorGlyphReader *)self _caplineNodeIDForGlyphSize:1];
      id v9 = [(NSDictionary *)self->_guideNodes objectForKey:[(TDVectorGlyphReader *)self _baselineNodeIDForGlyphSize:1]];
      id v11 = [(NSDictionary *)self->_guideNodes objectForKey:v12];
    }
    [(TDVectorGlyphReader *)self defaultPointSize];
    double v14 = v13;
    [(TDVectorGlyphReader *)self _sourcePointSize];
    double v16 = 0.0;
    if (v9)
    {
      if (v11)
      {
        double v17 = v15;
        if (CGSVGNodeGetType() == 2 && CGSVGNodeGetType() == 2)
        {
          CGSVGNodeGetBoundingBoxWithOptions();
          double v19 = v18;
          CGSVGNodeGetBoundingBoxWithOptions();
          if (fabs(v19) == INFINITY || fabs(v20) == INFINITY) {
            NSLog(&cfstr_SGotInvalidBas.isa, "-[TDVectorGlyphReader capHeightForVectorGlyphWithWeight:size:]", self->_fileURL, a3, a4);
          }
          else {
            double v16 = v14 * ((v19 - v20) / v17);
          }
        }
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
  double result = v16 * 0.94634;
  if (self->_platform != 4) {
    return v16;
  }
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)alignmentRectInsetsForVectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4
{
  char v24 = 0;
  [(TDVectorGlyphReader *)self _fixedAlignmentRectInsetsForVectorGlyphWithWeight:a3 size:a4 foundExactMargins:&v24];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  if (CUIEdgeInsetsValid())
  {
    if (!self->_isInterpolatable || v24 != 0) {
      goto LABEL_11;
    }
  }
  else if (!self->_isInterpolatable)
  {
    [(TDVectorGlyphReader *)self defaultPointSize];
    CUIEdgeInsetsMake();
    goto LABEL_10;
  }
  [(TDVectorGlyphReader *)self _interpolatedAlignmentRectInsetsForVectorGlyphWithWeight:a3 size:a4];
LABEL_10:
  double v8 = v16;
  double v10 = v17;
  double v12 = v18;
  double v14 = v19;
LABEL_11:
  if (self->_platform == 4)
  {
    double v10 = v10 * 0.94634;
    double v12 = v12 * 0.94634;
    double v14 = v14 * 0.94634;
    double v8 = v8 * 0.94634;
  }
  double v20 = v8;
  double v21 = v10;
  double v22 = v12;
  double v23 = v14;
  result.var3 = v23;
  result.var2 = v22;
  result.var1 = v21;
  result.var0 = v20;
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)_interpolatedAlignmentRectInsetsForVectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4
{
  __int16 v45 = 0;
  char v44 = 0;
  [(TDVectorGlyphReader *)self _fixedAlignmentRectInsetsForVectorGlyphWithWeight:1 size:1 foundExactMargins:(char *)&v45 + 1];
  double v8 = v7;
  double v42 = v9;
  double v43 = v10;
  double v12 = v11;
  [(TDVectorGlyphReader *)self _fixedAlignmentRectInsetsForVectorGlyphWithWeight:4 size:1 foundExactMargins:&v45];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [(TDVectorGlyphReader *)self _fixedAlignmentRectInsetsForVectorGlyphWithWeight:9 size:1 foundExactMargins:&v44];
  if (HIBYTE(v45)) {
    BOOL v25 = v45 == 0;
  }
  else {
    BOOL v25 = 1;
  }
  if (!v25 && v44 != 0)
  {
    double v27 = v22;
    double v28 = v24;
    double v41 = v23;
    double v39 = v21;
    [MEMORY[0x263F38400] scalarsForGlyphWeight:a3 glyphSize:a4];
    double v40 = v12;
    double v30 = v29;
    double v38 = v8;
    double v32 = v31;
    [MEMORY[0x263F38400] transformForGlyphSize:a4];
    double v16 = (v16 + (v42 - v16) * v30 + (v27 - v16) * v32) * v33;
    double v20 = (v20 + (v43 - v20) * v30 + (v28 - v20) * v32) * v33;
    double v14 = (v14 + (v38 - v14) * v30 + (v39 - v14) * v32) * v33;
    double v18 = (v18 + (v40 - v18) * v30 + (v41 - v18) * v32) * v33;
  }
  double v34 = v14;
  double v35 = v16;
  double v36 = v18;
  double v37 = v20;
  result.var3 = v37;
  result.var2 = v36;
  result.var1 = v35;
  result.var0 = v34;
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)_fixedAlignmentRectInsetsForVectorGlyphWithWeight:(int64_t)a3 size:(int64_t)a4 foundExactMargins:(BOOL *)a5
{
  double v9 = *MEMORY[0x263F38360];
  double v10 = *(double *)(MEMORY[0x263F38360] + 8);
  double v11 = *(double *)(MEMORY[0x263F38360] + 16);
  double v12 = *(double *)(MEMORY[0x263F38360] + 24);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ((unint64_t)(a3 - 1) <= 8)
  {
    id v14 = [(TDVectorGlyphReader *)self _glyphNodeIDForWeight:a3 size:a4];
    id v15 = [(TDVectorGlyphReader *)self _marginNodeIDForWeight:a3 size:a4 direction:4];
    id v16 = [(TDVectorGlyphReader *)self _marginNodeIDForWeight:a3 size:a4 direction:5];
    id v17 = [(NSDictionary *)self->_guideNodes objectForKey:v15];
    id v18 = [(NSDictionary *)self->_guideNodes objectForKey:v16];
    id v19 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:v14];
    [(TDVectorGlyphReader *)self defaultPointSize];
    [(TDVectorGlyphReader *)self _sourcePointSize];
    if (!v17) {
      goto LABEL_7;
    }
    if (v18 && v19)
    {
      if (a5) {
        *a5 = 1;
      }
    }
    else
    {
LABEL_7:
      id v20 = [(TDVectorGlyphReader *)self _glyphNodeIDForWeight:4 size:2];
      id v21 = [(TDVectorGlyphReader *)self _marginNodeIDForWeight:4 size:2 direction:4];
      id v22 = [(TDVectorGlyphReader *)self _marginNodeIDForWeight:4 size:2 direction:5];
      id v17 = [(NSDictionary *)self->_guideNodes objectForKey:v21];
      id v18 = [(NSDictionary *)self->_guideNodes objectForKey:v22];
      id v19 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:v20];
    }
    if (!v17 || !v18 || !v19)
    {
      id v23 = [(TDVectorGlyphReader *)self _glyphNodeIDForWeight:4 size:1];
      id v24 = [(TDVectorGlyphReader *)self _marginNodeIDForWeight:4 size:1 direction:4];
      id v25 = [(TDVectorGlyphReader *)self _marginNodeIDForWeight:4 size:1 direction:5];
      id v17 = [(NSDictionary *)self->_guideNodes objectForKey:v24];
      id v18 = [(NSDictionary *)self->_guideNodes objectForKey:v25];
      id v19 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:v23];
    }
    if (!v17 || !v18)
    {
      id v26 = [(TDVectorGlyphReader *)self _glyphNodeIDForWeight:4 size:2];
      id v17 = [(NSDictionary *)self->_guideNodes objectForKey:@"left-margin"];
      id v18 = [(NSDictionary *)self->_guideNodes objectForKey:@"right-margin"];
      id v19 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:v26];
    }
    if (v17 && v18)
    {
      if (CGSVGShapeNodeGetPrimitive() == 32)
      {
        double v58 = 0.0;
        double v59 = 0.0;
        uint64_t v57 = 0;
        double v56 = 0.0;
        CGSVGShapeNodeGetLineGeometry();
        CGFloat v27 = 0.0;
        CGFloat v28 = 0.0;
        double height = 0.0 - 0.0;
        CGSVGNodeGetParent();
        if (!CGSVGNodeFindAttribute())
        {
          double v31 = 0.5;
LABEL_24:
          if (CGSVGShapeNodeGetPrimitive() == 32)
          {
            double v58 = 0.0;
            double v59 = 0.0;
            uint64_t v57 = 0;
            double v56 = 0.0;
            CGSVGShapeNodeGetLineGeometry();
            CGFloat y = v58;
            CGFloat x = v59;
            double rect = v56 - v58;
            CGSVGNodeGetParent();
            if (!CGSVGNodeFindAttribute())
            {
              double width = 0.5;
              goto LABEL_31;
            }
            long long v34 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
            *(_OWORD *)&v55.CGFloat a = *MEMORY[0x263F000D0];
            *(_OWORD *)&v55.CGFloat c = v34;
            *(_OWORD *)&v55.CGFloat tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
            double width = 0.5;
            if (!CGSVGAttributeGetTransform())
            {
LABEL_31:
              [(TDVectorGlyphReader *)self templateVersion];
              if (v36 >= 2.0)
              {
                if (v19)
                {
                  CGSVGNodeGetBoundingBoxWithOptions();
                  CGFloat v51 = v38;
                  CGFloat v52 = v37;
                  CGFloat v49 = v40;
                  CGFloat v50 = v39;
                  v66.origin.CGFloat x = v28;
                  v66.origin.CGFloat y = v27;
                  v66.size.double width = v31;
                  v66.size.double height = height;
                  if (!CGRectIsNull(v66))
                  {
                    v67.origin.CGFloat y = v51;
                    v67.origin.CGFloat x = v52;
                    v67.size.double height = v49;
                    v67.size.double width = v50;
                    CGRectGetMinX(v67);
                    v68.origin.CGFloat x = v28;
                    v68.origin.CGFloat y = v27;
                    v68.size.double width = v31;
                    v68.size.double height = height;
                    CGRectGetMinX(v68);
                  }
                  v69.origin.CGFloat x = x;
                  v69.origin.CGFloat y = y;
                  v69.size.double width = width;
                  v69.size.double height = rect;
                  if (!CGRectIsNull(v69))
                  {
                    v70.origin.CGFloat x = x;
                    v70.origin.CGFloat y = y;
                    v70.size.double width = width;
                    v70.size.double height = rect;
                    CGRectGetMinX(v70);
                    v71.origin.CGFloat x = v52;
                    v71.origin.CGFloat y = v51;
                    v71.size.double height = v49;
                    v71.size.double width = v50;
                    CGRectGetMaxX(v71);
                  }
                }
              }
              else
              {
                v64.origin.CGFloat x = v28;
                v64.origin.CGFloat y = v27;
                v64.size.double width = v31;
                v64.size.double height = height;
                CGRectIsEmpty(v64);
                v65.origin.CGFloat x = x;
                v65.origin.CGFloat y = y;
                v65.size.double width = width;
                v65.size.double height = rect;
                CGRectIsEmpty(v65);
              }
              CUIEdgeInsetsMake();
              double v9 = v41;
              double v10 = v42;
              double v11 = v43;
              double v12 = v44;
              goto LABEL_39;
            }
            CGAffineTransform v54 = v55;
            v62.size.double width = 0.5;
            v62.origin.CGFloat x = x;
            v62.origin.CGFloat y = y;
            v62.size.double height = rect;
            CGRect v63 = CGRectApplyAffineTransform(v62, &v54);
          }
          else
          {
            CGSVGNodeGetBoundingBoxWithOptions();
          }
          CGFloat x = v63.origin.x;
          CGFloat y = v63.origin.y;
          double width = v63.size.width;
          double rect = v63.size.height;
          goto LABEL_31;
        }
        long long v30 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
        *(_OWORD *)&v55.CGFloat a = *MEMORY[0x263F000D0];
        *(_OWORD *)&v55.CGFloat c = v30;
        *(_OWORD *)&v55.CGFloat tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
        double v31 = 0.5;
        if (!CGSVGAttributeGetTransform()) {
          goto LABEL_24;
        }
        CGAffineTransform v54 = v55;
        v60.size.double width = 0.5;
        v60.origin.CGFloat x = 0.0;
        v60.origin.CGFloat y = 0.0;
        v60.size.double height = 0.0 - 0.0;
        CGRect v61 = CGRectApplyAffineTransform(v60, &v54);
      }
      else
      {
        CGSVGNodeGetBoundingBoxWithOptions();
      }
      CGFloat v28 = v61.origin.x;
      CGFloat v27 = v61.origin.y;
      double v31 = v61.size.width;
      double height = v61.size.height;
      goto LABEL_24;
    }
  }
LABEL_39:
  os_unfair_lock_unlock(p_lock);
  double v45 = v9;
  double v46 = v10;
  double v47 = v11;
  double v48 = v12;
  result.var3 = v48;
  result.var2 = v47;
  result.var1 = v46;
  result.var0 = v45;
  return result;
}

- (void)_calcInterpolatability
{
  if (self->_templateVersion >= 3.0)
  {
    id v3 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:[(TDVectorGlyphReader *)self _glyphNodeIDForWeight:4 size:1]];
    id v4 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:[(TDVectorGlyphReader *)self _glyphNodeIDForWeight:1 size:1]];
    id v5 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:[(TDVectorGlyphReader *)self _glyphNodeIDForWeight:9 size:1]];
    if (v4)
    {
      if (v3)
      {
        uint64_t v6 = (uint64_t)v5;
        if (v5)
        {
          if (CUISVGNodeCanBeRepresentedAsPath() && CUISVGNodeCanBeRepresentedAsPath())
          {
            if (CUISVGNodeCanBeRepresentedAsPath()) {
              self->_isInterpolatable = __nodesAreInterpolationCompatible((uint64_t)v4, (uint64_t)v3, v6);
            }
          }
        }
      }
    }
  }
}

- (BOOL)isInterpolatableForWeight:(int64_t)a3 size:(int64_t)a4
{
  if (!self->_vectorGlyphNodes) {
    -[TDVectorGlyphReader _readSVGNodesError:](self, "_readSVGNodesError:", 0, a4);
  }
  return self->_isInterpolatable;
}

- (CGSVGNode)interpolatedSymbolForWeight:(int64_t)a3 size:(int64_t)a4
{
  if (!-[TDVectorGlyphReader isInterpolatableForWeight:size:](self, "isInterpolatableForWeight:size:")) {
    return 0;
  }
  id v7 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:[(TDVectorGlyphReader *)self _glyphNodeIDForWeight:4 size:1]];
  id v8 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:[(TDVectorGlyphReader *)self _glyphNodeIDForWeight:1 size:1]];
  id v9 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:[(TDVectorGlyphReader *)self _glyphNodeIDForWeight:9 size:1]];
  double v10 = 0;
  if (v8)
  {
    if (v7)
    {
      uint64_t v11 = (uint64_t)v9;
      if (v9)
      {
        double v10 = (CGSVGNode *)CGSVGNodeCopy();
        [MEMORY[0x263F38400] scalarsForGlyphWeight:a3 glyphSize:a4];
        double v13 = v12;
        double v15 = v14;
        [MEMORY[0x263F38400] transformForGlyphSize:a4];
        double v17 = v16;
        double v19 = v18;
        [(TDVectorGlyphReader *)self defaultPointSize];
        double v21 = v20;
        [(TDVectorGlyphReader *)self _sourcePointSize];
        __interpolateChildShapes(v13, v15, v17, v19, v21, (uint64_t)v10, (uint64_t)v8, (uint64_t)v7, v11);
        CFAutorelease(v10);
      }
    }
  }
  return v10;
}

+ (CGPoint)_anchorInOutlineCoordinateSpaceForAnchor:(CGSVGNode *)a3 glyph:(CGSVGNode *)a4
{
  CGSVGNodeGetBoundingBoxWithOptions();
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGSVGNodeGetBoundingBoxWithOptions();
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  v26.origin.CGFloat x = v5;
  v26.origin.CGFloat y = v7;
  v26.size.double width = v9;
  v26.size.double height = v11;
  double MinX = CGRectGetMinX(v26);
  v27.origin.CGFloat x = v5;
  v27.origin.CGFloat y = v7;
  v27.size.double width = v9;
  v27.size.double height = v11;
  double MinY = CGRectGetMinY(v27);
  v28.origin.CGFloat x = v13;
  v28.origin.CGFloat y = v15;
  v28.size.double width = v17;
  v28.size.double height = v19;
  double MidX = CGRectGetMidX(v28);
  v29.origin.CGFloat x = v13;
  v29.origin.CGFloat y = v15;
  v29.size.double width = v17;
  v29.size.double height = v19;
  double v22 = CGRectGetMidY(v29) - MinY;
  double v23 = MidX - MinX;
  result.CGFloat y = v22;
  result.CGFloat x = v23;
  return result;
}

- (BOOL)interpolatedRotateAnchorForWeight:(int64_t)a3 size:(int64_t)a4 scaleFactor:(double)a5 point:(CGPoint *)a6
{
  id v11 = [(TDVectorGlyphReader *)self _glyphNodeIDForWeight:4 size:1];
  id v12 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:v11];
  id v13 = [(NSDictionary *)self->_vectorGlyphRotateAnchorNodes objectForKey:v11];
  id v14 = [(TDVectorGlyphReader *)self _glyphNodeIDForWeight:1 size:1];
  id v15 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:v14];
  id v16 = [(NSDictionary *)self->_vectorGlyphRotateAnchorNodes objectForKey:v14];
  id v17 = [(TDVectorGlyphReader *)self _glyphNodeIDForWeight:9 size:1];
  id v18 = [(NSDictionary *)self->_vectorGlyphNodes objectForKey:v17];
  id v19 = [(NSDictionary *)self->_vectorGlyphRotateAnchorNodes objectForKey:v17];
  if (v15) {
    BOOL v20 = v12 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  BOOL v24 = v20 || v18 == 0 || v13 == 0 || v16 == 0 || v19 == 0;
  BOOL v25 = !v24;
  if (!v24)
  {
    id v26 = v19;
    [MEMORY[0x263F38400] scalarsForGlyphWeight:a3 glyphSize:a4];
    double v28 = v27;
    double v30 = v29;
    [MEMORY[0x263F38400] transformForGlyphSize:a4];
    double v32 = v31;
    +[TDVectorGlyphReader _anchorInOutlineCoordinateSpaceForAnchor:v16 glyph:v15];
    double v34 = v33;
    double v36 = v35;
    +[TDVectorGlyphReader _anchorInOutlineCoordinateSpaceForAnchor:v13 glyph:v12];
    double v38 = v37;
    double v40 = v39;
    +[TDVectorGlyphReader _anchorInOutlineCoordinateSpaceForAnchor:v26 glyph:v18];
    a6->CGFloat x = v32 * (v38 + v28 * (v34 - v38) + v30 * (v41 - v38)) * a5;
    a6->CGFloat y = v32 * (v40 + v28 * (v36 - v40) + v30 * (v42 - v40)) * a5;
  }
  return v25;
}

- (CGSize)canvasSizeForWeight:(int64_t)a3 size:(int64_t)a4
{
  if ([(TDVectorGlyphReader *)self vectorGlyphWithWeight:a3 size:a4 error:0])
  {
    CGSVGDocumentGetCanvasSize();
  }
  else
  {
    double v4 = *MEMORY[0x263F001B0];
    double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (BOOL)containsWideGamutContent
{
  if (!self->_svgDocument) {
    return 0;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  char v3 = CGSVGDocumentContainsWideGamutContent();
  os_unfair_lock_unlock(p_lock);
  return v3;
}

- (id)_layerNamesForRenderingMode:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  if (self->_svgDocument)
  {
    os_unfair_lock_lock(&self->_lock);
    CGSVGDocumentGetRootNode();
    float templateVersion = self->_templateVersion;
    v9[6] = MEMORY[0x263EF8330];
    v9[7] = 3221225472;
    v9[8] = __51__TDVectorGlyphReader__layerNamesForRenderingMode___block_invoke;
    v9[9] = &unk_264C446D0;
    BOOL v10 = templateVersion >= 5.0;
    v9[10] = a3;
    v9[11] = v5;
    CGSVGNodeEnumerate();
    uint64_t v7 = [v5 count];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __51__TDVectorGlyphReader__layerNamesForRenderingMode___block_invoke_2;
    v9[3] = &unk_264C446F8;
    v9[4] = a3;
    v9[5] = v7;
    [v5 sortUsingComparator:v9];
    os_unfair_lock_unlock(&self->_lock);
  }
  return v5;
}

void __51__TDVectorGlyphReader__layerNamesForRenderingMode___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    int Type = CGSVGNodeGetType();
    if (Type == 2 || Type == 1 && *(unsigned char *)(a1 + 48))
    {
      if (CGSVGNodeFindAttribute())
      {
        id v5 = (void *)CGSVGAttributeCopyString();
        double v6 = (void *)[v5 componentsSeparatedByString:@" "];
        long long v12 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v13;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v13 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
              if ([v11 hasPrefix:*(void *)(a1 + 32)]) {
                [*(id *)(a1 + 40) addObject:v11];
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
          }
          while (v8);
        }
      }
    }
  }
}

uint64_t __51__TDVectorGlyphReader__layerNamesForRenderingMode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  if (*(void *)(a1 + 40) <= 9uLL
    || ((uint64_t v6 = [a2 rangeOfString:*(void *)(a1 + 32)],
         uint64_t v8 = v7,
         uint64_t v9 = [a3 rangeOfString:*(void *)(a1 + 32)],
         v6 != 0x7FFFFFFFFFFFFFFFLL)
      ? (BOOL v11 = v9 == 0x7FFFFFFFFFFFFFFFLL)
      : (BOOL v11 = 1),
        v11))
  {
    return [a2 compare:a3];
  }
  else
  {
    uint64_t v13 = v9;
    uint64_t v14 = v10;
    long long v15 = objc_msgSend(a2, "stringByReplacingCharactersInRange:withString:", v6, v8, &stru_26E8675B0);
    id v16 = objc_msgSend(a3, "stringByReplacingCharactersInRange:withString:", v13, v14, &stru_26E8675B0);
    unint64_t v17 = [v15 integerValue];
    unint64_t v18 = [v16 integerValue];
    if (v17 < v18) {
      return -1;
    }
    else {
      return v17 > v18;
    }
  }
}

- (id)monochromeLayerNodeNames
{
  return [(TDVectorGlyphReader *)self _layerNamesForRenderingMode:@"monochrome-"];
}

- (id)multicolorLayerNodeNames
{
  return [(TDVectorGlyphReader *)self _layerNamesForRenderingMode:@"multicolor-"];
}

- (id)hierarchicalLayerNodeNames
{
  return [(TDVectorGlyphReader *)self _layerNamesForRenderingMode:@"hierarchical-"];
}

- (BOOL)containsHierarchicalLayers
{
  [(TDVectorGlyphReader *)self templateVersion];
  return v3 >= 3.0
      && objc_msgSend(-[TDVectorGlyphReader hierarchicalLayerNodeNames](self, "hierarchicalLayerNodeNames"), "count") != 0;
}

- (BOOL)containsMulticolorLayers
{
  [(TDVectorGlyphReader *)self templateVersion];
  return v3 >= 2.1
      && objc_msgSend(-[TDVectorGlyphReader multicolorLayerNodeNames](self, "multicolorLayerNodeNames"), "count") != 0;
}

- (id)_pathForLayerNamed:(id)a3 inDocument:(CGSVGDocument *)a4
{
  if (!a4) {
    return 0;
  }
  CGSVGDocumentGetRootNode();
  CGSVGNodeGetChildAtIndex();
  uint64_t ChildCount = CGSVGNodeGetChildCount();
  uint64_t v6 = (void *)[MEMORY[0x263EFF980] array];
  if (ChildCount)
  {
    uint64_t v7 = 0;
    uint64_t v8 = (long long *)MEMORY[0x263F000D0];
    do
    {
      CGSVGNodeGetChildAtIndex();
      if (CGSVGNodeGetType() == 2 && CGSVGNodeFindAttribute())
      {
        uint64_t v9 = (void *)CGSVGAttributeCopyString();
        if (objc_msgSend((id)objc_msgSend(v9, "componentsSeparatedByString:", @" "), "containsObject:", a3))
        {
          long long v12 = *v8;
          long long v13 = v8[1];
          long long v14 = v8[2];
          uint64_t v10 = (void *)CUICreatePathFromSVGNode();
          objc_msgSend(v6, "addObject:", v10, v12, v13, v14);
        }
      }
      ++v7;
    }
    while (ChildCount != v7);
  }
  return (id)[MEMORY[0x263F38408] createConcatenatingPaths:v6];
}

- (id)createMonochromeLayerGroupForSymbol:(CGSVGDocument *)a3 layerNames:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  CGSVGDocumentGetRootNode();
  CGSVGNodeFindChildWithCStringIdentifier();
  float templateVersion = self->_templateVersion;
  if (self->_layerTreeNode) {
    BOOL v7 = templateVersion < 5.0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v10 = (void *)CUICreateSubpathsFromSVGNode();
    BOOL v11 = (void *)[MEMORY[0x263F383F8] createLayerGroupWithLayerTree:self->_layerTreeNode layerNames:a4 shapes:v10 delegate:self];

    return v11;
  }
  if (templateVersion < 4.0 || ![a4 count])
  {
    id v12 = [(TDVectorGlyphReader *)self pathForLayerNamed:0];
    [(TDVectorGlyphReader *)self strokeWidthForLayerNamed:0];
    long long v14 = (void *)[objc_alloc(MEMORY[0x263F383F8]) _initWithName:@"monochrome-0" index:0 shape:v12 strokeWidth:0 attributes:0 style:self delegate:v13];
    id v15 = objc_alloc(MEMORY[0x263F383F8]);
    v16[0] = v14;
    BOOL v11 = objc_msgSend(v15, "_initWithName:index:sublayers:attributes:style:delegate:", @"root", 0, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v16, 1), 0, 0, self);

    return v11;
  }
  uint64_t v8 = (void *)MEMORY[0x263F383F8];

  return (id)[v8 createLayerGroupWithLayerNames:a4 delegate:self];
}

- (void)drawInContext:(CGContext *)a3 atPointSize:(double)a4 scaleFactor:(double)a5 weight:(int64_t)a6 size:(int64_t)a7
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (a3 && a4 > 0.0)
  {
    BOOL v11 = [(TDVectorGlyphReader *)self vectorGlyphWithWeight:a6 size:a7 error:0];
    id v12 = [(TDVectorGlyphReader *)self monochromeLayerNodeNames];
    os_unfair_lock_lock(&self->_lock);
    [(TDVectorGlyphReader *)self defaultPointSize];
    self->_drawingPointSize = a4;
    self->_drawingScale = a4 * a5 / v13;
    self->_drawingSymbol = (CGSVGDocument *)CGSVGDocumentRetain();
    if (v11)
    {
      CGSVGDocumentGetCanvasSize();
      double v15 = v14;
      double v17 = v16;
      id v18 = [(TDVectorGlyphReader *)self createMonochromeLayerGroupForSymbol:v11 layerNames:v12];
      CGColorRef ConstantColor = CGColorGetConstantColor((CFStringRef)*MEMORY[0x263F001C0]);
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      BOOL v25 = v18;
      BOOL v20 = (void *)[v18 sublayers];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v27;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v27 != v23) {
              objc_enumerationMutation(v20);
            }
            objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v24++), "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:onFillColor:offFillColor:", a3, ConstantColor, 0, self->_drawingScale, v15, v17, INFINITY, INFINITY);
          }
          while (v22 != v24);
          uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v22);
      }
    }
    CGSVGDocumentRelease();
    self->_drawingPointSize = 0.0;
    self->_drawingScale = 0.0;
    self->_drawingSymbol = 0;
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (BOOL)canDrawWithWeight:(int64_t)a3 size:(int64_t)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL isInterpolatable = 0;
  if ((unint64_t)(a3 - 1) <= 8 && (unint64_t)(a4 - 1) <= 2)
  {
    if (!self->_vectorGlyphNodes) {
      [(TDVectorGlyphReader *)self _readSVGNodesError:0];
    }
    if ([(NSDictionary *)self->_vectorGlyphNodes objectForKey:[(TDVectorGlyphReader *)self _glyphNodeIDForWeight:a3 size:a4]])
    {
      BOOL isInterpolatable = 1;
    }
    else
    {
      BOOL isInterpolatable = self->_isInterpolatable;
    }
  }
  os_unfair_lock_unlock(p_lock);
  return isInterpolatable;
}

+ (id)vectorGlyphReaderWithURL:(id)a3 error:(id *)a4
{
  uint64_t v7 = CUICurrentPlatform();

  return (id)[a1 vectorGlyphReaderWithURL:a3 platform:v7 error:a4];
}

+ (id)vectorGlyphReaderWithURL:(id)a3 platform:(int64_t)a4 error:(id *)a5
{
  if (__onceToken != -1) {
    dispatch_once(&__onceToken, &__block_literal_global_262);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&__lock);
  uint64_t v8 = (TDVectorGlyphReader *)[(id)__instanceCache objectForKey:a3];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = v8;
  }
  else
  {
    uint64_t v9 = [[TDVectorGlyphReader alloc] initWithURL:a3 platform:a4 error:a5];
    if (v9) {
      [(id)__instanceCache setObject:v9 forKey:a3];
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__lock);
  return v9;
}

uint64_t __63__TDVectorGlyphReader_vectorGlyphReaderWithURL_platform_error___block_invoke()
{
  __instanceCache = (uint64_t)objc_alloc_init(MEMORY[0x263EFF8E0]);
  [(id)__instanceCache setName:@"com.apple.corethemedefinition-VectoryGlyphCache"];
  [(id)__instanceCache setEvictsObjectsWithDiscardedContent:0];
  v0 = (void *)__instanceCache;

  return [v0 setCountLimit:1500];
}

+ (void)clearInstanceCache
{
  os_unfair_lock_lock((os_unfair_lock_t)&__lock);
  [(id)__instanceCache removeAllObjects];

  os_unfair_lock_unlock((os_unfair_lock_t)&__lock);
}

- (double)scale
{
  return self->_drawingScale;
}

- (double)_requestedPointSizeRatio
{
  double drawingPointSize = self->_drawingPointSize;
  [(TDVectorGlyphReader *)self defaultPointSize];
  BOOL v4 = v3 < 1.0 || drawingPointSize < 1.0;
  double result = drawingPointSize / v3;
  if (v4) {
    return 1.0;
  }
  return result;
}

- (float)templateVersion
{
  return self->_templateVersion;
}

- (CGSize)referenceCanvasSize
{
  if (self->_drawingSymbol)
  {
    CGSVGDocumentGetCanvasSize();
  }
  else
  {
    double v2 = *MEMORY[0x263F001B0];
    double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (id)pathForLayerNamed:(id)a3
{
  if (!self->_drawingSymbol || !self->_isInterpolatable) {
    return 0;
  }
  if (!a3)
  {
    CGSVGDocumentGetRootNode();
    CGSVGNodeFindChildWithCStringIdentifier();
    BOOL v4 = (void *)CUICreatePathFromSVGNode();
    id v5 = v4;
    return v4;
  }

  return -[TDVectorGlyphReader _pathForLayerNamed:inDocument:](self, "_pathForLayerNamed:inDocument:");
}

- (CGSVGAttributeMap)styleForLayerName:(id)a3
{
  if (!a3 || !self->_drawingSymbol) {
    return 0;
  }
  objc_msgSend(@".", "stringByAppendingString:");

  return (CGSVGAttributeMap *)CGSVGDocumentGetNamedStyle();
}

- (double)strokeWidthForLayerNamed:(id)a3
{
  if ([(TDVectorGlyphReader *)self attributesForLayerNamed:a3]
    && CGSVGAttributeMapGetAttribute())
  {
    CGSVGAttributeGetFloat();
  }
  return 0.0;
}

- (CGSVGAttributeMap)attributesForLayerNamed:(id)a3
{
  if (a3)
  {
    [(TDVectorGlyphReader *)self templateVersion];
    float v5 = v4;
    CGSVGDocumentGetRootNode();
    if (v5 >= 5.0 && CGSVGNodeFindChildWithStringIdentifier())
    {
      uint64_t ChildCount = CGSVGNodeGetChildCount();
      if (ChildCount)
      {
        uint64_t v7 = ChildCount;
        for (uint64_t i = 0; i != v7; ++i)
        {
          CGSVGNodeGetChildAtIndex();
          if (CGSVGNodeFindAttribute())
          {
            uint64_t v9 = (void *)CGSVGAttributeCopyString();
            if ([v9 containsString:a3])
            {
              uint64_t AttributeMap = (CGSVGAttributeMap *)CGSVGNodeGetAttributeMap();

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
      uint64_t v11 = CGSVGNodeGetChildCount();
      if (v11)
      {
        uint64_t v12 = v11;
        for (uint64_t j = 0; j != v12; ++j)
        {
          CGSVGNodeGetChildAtIndex();
          if (CGSVGNodeFindAttribute())
          {
            double v14 = (void *)CGSVGAttributeCopyString();
            if ([v14 containsString:a3])
            {
              uint64_t AttributeMap = (CGSVGAttributeMap *)CGSVGNodeGetAttributeMap();

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

- (void)_legacy_drawMonochromeLayerNamed:(id)a3 inContext:(CGContext *)a4 scaleFactor:(double)a5 targetSize:(CGSize)a6 onFillColor:(CGColor *)a7 offFillColor:(CGColor *)a8
{
  if (self->_drawingSymbol)
  {
    CGFloat v9 = a6.width * a5;
    CGFloat v10 = a6.height * a5;
    [(TDVectorGlyphReader *)self referenceCanvasSize];
    double v12 = v11;
    double v14 = v13;
    CGContextSaveGState(a4);
    CGContextScaleCTM(a4, v9 / v12, v10 / v14);
    CGContextDrawSVGDocument();
    CGContextRestoreGState(a4);
  }
}

- (id)_symbolDefaults
{
  return (id)MEMORY[0x263EFFA78];
}

- (id)fillImageNames
{
  return (id)MEMORY[0x263EFFA68];
}

- (CGImage)fillImageWithName:(id)a3
{
  return 0;
}

@end