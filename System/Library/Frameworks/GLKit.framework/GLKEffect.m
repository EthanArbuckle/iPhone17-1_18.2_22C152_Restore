@interface GLKEffect
+ (BOOL)parseXMLFile:(id)a3 rootNode:(id)a4;
+ (id)programInfoLogForName:(unsigned int)a3 effectLabel:(id)a4 msg:(const char *)a5;
+ (id)shaderInfoLogForName:(unsigned int)a3 effectLabel:(id)a4 msg:(const char *)a5;
+ (void)initialize;
+ (void)initializeStaticMasks;
+ (void)setStaticMasksWithVshRoot:(id)a3 fshRoot:(id)a4;
+ (void)unrollLoopNodesForStaticTreeWithRoot:(id)a3;
- (BOOL)includeFshShaderTextForRootNode:(id)a3;
- (BOOL)includeShaderTextForRootNode:(id)a3;
- (BOOL)includeVshShaderTextForRootNode:(id)a3;
- (BOOL)textureOrderStale;
- (BOOL)useColorAttrib;
- (BOOL)useTexCoordAttrib;
- (GLKBigInt_s)fshMask;
- (GLKBigInt_s)fshMasks;
- (GLKBigInt_s)prevFshMask;
- (GLKBigInt_s)prevVshMask;
- (GLKBigInt_s)vshMask;
- (GLKBigInt_s)vshMasks;
- (GLKEffect)init;
- (GLKEffect)initWithPropertyArray:(id)a3;
- (GLKShaderBlockNode)fshRootNode;
- (GLKShaderBlockNode)vshRootNode;
- (NSArray)textureOrder;
- (NSMutableArray)lightProperties;
- (NSMutableArray)properties;
- (NSMutableDictionary)programHash;
- (NSString)label;
- (_GLKVector4)baseLightingColor;
- (_GLKVector4)lightModelAmbientColor;
- (char)fshMaskStr;
- (char)fshStrings;
- (char)vshMaskStr;
- (char)vshStrings;
- (float)materialAmbientColor;
- (float)materialDiffuseColor;
- (id)description;
- (id)effectShaderArray;
- (int)aColorLoc;
- (int)baseLightingColorLoc;
- (int)lightModelAmbientColorLoc;
- (unint64_t)dirtyUniforms;
- (unsigned)colorMaterialEnabled;
- (unsigned)fshMaskCt;
- (unsigned)fshName;
- (unsigned)lightModelTwoSided;
- (unsigned)masksInitialized;
- (unsigned)numFshStrings;
- (unsigned)numLights;
- (unsigned)numTextures;
- (unsigned)numVshStrings;
- (unsigned)perPixelLightingEnabled;
- (unsigned)perVertexLightingEnabled;
- (unsigned)programName;
- (unsigned)texturingEnabled;
- (unsigned)vshMaskCt;
- (unsigned)vshName;
- (void)addTransformProperty;
- (void)bind;
- (void)createAndUseProgramWithShadingHash:(id)a3;
- (void)dealloc;
- (void)dirtyAllUniforms;
- (void)initializeMasks;
- (void)setAColorLoc:(int)a3;
- (void)setBaseLightingColor:(_GLKVector4)a3;
- (void)setBaseLightingColorLoc:(int)a3;
- (void)setColorMaterialEnabled:(unsigned __int8)a3;
- (void)setDirtyUniforms:(unint64_t)a3;
- (void)setEffectShaderArray:(id *)a3;
- (void)setFshMask:(GLKBigInt_s *)a3;
- (void)setFshName:(unsigned int)a3;
- (void)setFshStrings:(char *)a3;
- (void)setLabel:(id)a3;
- (void)setLightModelAmbientColor:(_GLKVector4)a3;
- (void)setLightModelAmbientColorLoc:(int)a3;
- (void)setLightModelTwoSided:(unsigned __int8)a3;
- (void)setLightProperties:(id)a3;
- (void)setMasksInitialized:(unsigned __int8)a3;
- (void)setNumFshStrings:(unsigned int)a3;
- (void)setNumLights:(unsigned int)a3;
- (void)setNumTextures:(unsigned int)a3;
- (void)setNumVshStrings:(unsigned int)a3;
- (void)setPerPixelLightingEnabled:(unsigned __int8)a3;
- (void)setPerVertexLightingEnabled:(unsigned __int8)a3;
- (void)setPrevFshMask:(GLKBigInt_s)a3;
- (void)setPrevVshMask:(GLKBigInt_s)a3;
- (void)setProgramName:(unsigned int)a3;
- (void)setProperties:(id)a3;
- (void)setShaderBindings;
- (void)setTextureIndices;
- (void)setTextureOrder:(id)a3;
- (void)setTextureOrderStale:(BOOL)a3;
- (void)setTexturingEnabled:(unsigned __int8)a3;
- (void)setVshMask:(GLKBigInt_s *)a3;
- (void)setVshName:(unsigned int)a3;
- (void)setVshStrings:(char *)a3;
- (void)updateFshStringsWithRoot:(id)a3 enabled:(GLKBigInt_s)a4;
- (void)updateVshStringsWithRoot:(id)a3 enabled:(GLKBigInt_s)a4;
@end

@implementation GLKEffect

+ (void)initialize
{
  +[GLKEffect initializeStaticMasks];
  __vshRootNode = objc_alloc_init(GLKShaderBlockNode);
  uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:", @"com.apple.GLKit"), "pathForResource:ofType:", @"vsh", @"xml");
  if (+[GLKEffect parseXMLFile:v2 rootNode:__vshRootNode])
  {
    __fshRootNode = objc_alloc_init(GLKShaderBlockNode);
    uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:", @"com.apple.GLKit"), "pathForResource:ofType:", @"fsh", @"xml");
    if (+[GLKEffect parseXMLFile:v3 rootNode:__fshRootNode])
    {
      __sharegroupDict = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, 0);
      __sharegroupQueue = (uint64_t)dispatch_queue_create("com.apple.GLKEffectsSharegroup", 0);
      long long v8 = xmmword_2187C14D0;
      +[GLKShaderBlockNode setMasksWithRoot:treeRoot:mask:](GLKShaderBlockNode, "setMasksWithRoot:treeRoot:mask:", __vshRootNode, __vshRootNode, &v8, 1, 0);
      +[GLKShaderBlockNode setMasksWithRoot:__fshRootNode treeRoot:__fshRootNode mask:&v7];
      +[GLKEffect setStaticMasksWithVshRoot:__vshRootNode fshRoot:__fshRootNode];
      +[GLKEffectPropertyConstantColor setStaticMasksWithVshRoot:__vshRootNode fshRoot:__fshRootNode];
      +[GLKEffectPropertyFog setStaticMasksWithVshRoot:__vshRootNode fshRoot:__fshRootNode];
      +[GLKEffectPropertyLight setStaticMasksWithVshRoot:__vshRootNode fshRoot:__fshRootNode];
      +[GLKEffectPropertyMaterial setStaticMasksWithVshRoot:__vshRootNode fshRoot:__fshRootNode];
      +[GLKEffectPropertyTexture setStaticMasksWithVshRoot:__vshRootNode fshRoot:__fshRootNode];
      +[GLKEffectPropertyTransform setStaticMasksWithVshRoot:__vshRootNode fshRoot:__fshRootNode];
      v4 = getenv("__GLK_PURGE_SHADING_HASH");
      BOOL v5 = v4 && !strcmp(v4, "1");
      __purgeShadingHash = v5;
      return;
    }

    v6 = (void *)__fshRootNode;
  }
  else
  {
    v6 = (void *)__vshRootNode;
  }
}

- (GLKEffect)init
{
  v10.receiver = self;
  v10.super_class = (Class)GLKEffect;
  uint64_t v2 = [(GLKEffect *)&v10 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(GLKEffect *)v2 dirtyAllUniforms];
    v3->_properties = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v3->_numLights = 0;
    v3->_numTextures = 0;
    v3->_aColorLoc = -1;
    v4 = (id *)malloc_type_malloc(0xB0uLL, 0x80040B8603338uLL);
    uint64_t v5 = 0;
    v3->_effectShaderArray = v4;
    do
      v3->_effectShaderArray[v5++] = 0;
    while (v5 != 22);
    *v3->_effectShaderArray = v3;
    v3->_vshStrings = (char **)malloc_type_malloc(0x800uLL, 0x10040436913F5uLL);
    v3->_fshStrings = (char **)malloc_type_malloc(0x800uLL, 0x10040436913F5uLL);
    v3->_vshMask = (GLKBigInt_s *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
    v6 = (GLKBigInt_s *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
    v3->_fshMask = v6;
    vshMask = v3->_vshMask;
    vshMask->n0 = 0;
    vshMask->n1 = 0;
    v6->n0 = 0;
    v6->n1 = 0;
    v8.n0 = -1;
    v8.n1 = -1;
    v3->_prevFshMask = v8;
    v3->_prevVshMask = v8;
    v3->_programHash = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v3->_vshRootNode = (GLKShaderBlockNode *)+[GLKShaderBlockNode copyTreeWithRoot:__vshRootNode parent:0];
    v3->_fshRootNode = (GLKShaderBlockNode *)+[GLKShaderBlockNode copyTreeWithRoot:__fshRootNode parent:0];
    v3->_masksInitialized = 0;
    [(GLKEffect *)v3 setColorMaterialEnabled:0];
    [(GLKEffect *)v3 setLightModelTwoSided:0];
    [(GLKEffect *)v3 setPerPixelLightingEnabled:0];
    [(GLKEffect *)v3 setPerVertexLightingEnabled:0];
    [(GLKEffect *)v3 setTexturingEnabled:0];
    v3->_lightModelAmbientColorLoc = -1;
    v3->_textureOrder = 0;
    v3->_textureOrderStale = 0;
    v3->_lightModelAmbientColor = (_GLKVector4)xmmword_2187C14B0;
  }
  return v3;
}

+ (void)initializeStaticMasks
{
  xmmword_267BDA4B0 = 0u;
  xmmword_267BDA4C0 = 0u;
  xmmword_267BDA490 = 0u;
  xmmword_267BDA4A0 = 0u;
  xmmword_267BDA470 = 0u;
  xmmword_267BDA480 = 0u;
  xmmword_267BDA450 = 0u;
  xmmword_267BDA460 = 0u;
  __vshMasks = 0u;
  *(_OWORD *)&qword_267BDA440 = 0u;
  __fshMasks = 0u;
  *(_OWORD *)&qword_267BDA4E0 = 0u;
  xmmword_267BDA4F0 = 0u;
  xmmword_267BDA500 = 0u;
  xmmword_267BDA510 = 0u;
  *(_OWORD *)&qword_267BDA520 = 0u;
  xmmword_267BDA530 = 0u;
  xmmword_267BDA540 = 0u;
  xmmword_267BDA550 = 0u;
  xmmword_267BDA560 = 0u;
  xmmword_267BDA570 = 0u;
}

+ (BOOL)parseXMLFile:(id)a3 rootNode:(id)a4
{
  uint64_t v6 = [NSURL fileURLWithPath:a3];
  long long v7 = (void *)[objc_alloc(MEMORY[0x263F08D58]) initWithContentsOfURL:v6];
  [v7 setDelegate:a4];
  [v7 setShouldResolveExternalEntities:1];
  int v8 = [v7 parse];

  if (v8) {
    [a1 unrollLoopNodesForStaticTreeWithRoot:a4];
  }
  return v8;
}

+ (void)unrollLoopNodesForStaticTreeWithRoot:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  unint64_t v5 = 0x264339000uLL;
  +[GLKShaderBlockNode buildUnrollNodeArray:a3 array:v4];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v28 = [v4 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v34;
    uint64_t v6 = @"%@%d";
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(v4);
        }
        uint64_t v29 = v7;
        int v8 = *(void **)(*((void *)&v33 + 1) + 8 * v7);
        uint64_t v9 = [v8 label];
        v31 = v8;
        int v10 = [v8 unrollCt];
        if (v10 >= 2)
        {
          uint64_t v11 = 1;
          v12 = v8;
          int v30 = v10;
          do
          {
            v32 = v12;
            v12 = objc_msgSend(*(id *)(v5 + 3432), "copyTreeWithRootButNotSiblings:parent:", v31, objc_msgSend(v31, "parent"));
            [v12 setIndex:v11];
            objc_msgSend(v12, "setPropertyClass:", objc_msgSend(v31, "propertyClass") + v11);
            [v12 setLabel:objc_msgSend(NSString, "stringWithFormat:", v6, v9, v11)];
            [v12 setType:1];
            v13 = *(void **)(v5 + 3432);
            uint64_t v14 = v9;
            v15 = v6;
            uint64_t v16 = [v12 children];
            unint64_t v17 = v5;
            uint64_t v18 = [v31 loopVar];
            uint64_t v19 = [v31 propertyClass];
            uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v11);
            uint64_t v21 = v16;
            uint64_t v6 = v15;
            uint64_t v9 = v14;
            uint64_t v22 = v18;
            unint64_t v5 = v17;
            [v13 setIndicesForRoot:v21 andReplaceLoopVar:v22 baseLabel:v14 basePropertyClass:v19 usingIndex:v11 indexString:v20];
            [*(id *)(v17 + 3432) insertNode:v12 afterSibling:v32];
            uint64_t v11 = (v11 + 1);
          }
          while (v30 != v11);
        }
        v23 = *(void **)(v5 + 3432);
        uint64_t v24 = [v31 children];
        uint64_t v25 = [v31 loopVar];
        uint64_t v26 = [v31 propertyClass];
        [v23 setIndicesForRoot:v24, v25, v9, v26, 0, objc_msgSend(NSString, "stringWithFormat:", @"%d", 0) andReplaceLoopVar baseLabel basePropertyClass usingIndex indexString];
        [v31 setLabel:objc_msgSend(NSString, "stringWithFormat:", v6, objc_msgSend(v31, "label"), 0)];
        [v31 setType:1];
        uint64_t v7 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [v4 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v28);
  }
}

- (GLKEffect)initWithPropertyArray:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = [(GLKEffect *)self init];
  if (!v4) {
    return v4;
  }
  v4->_lightProperties = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  *(void *)&v4->_vshName = 0;
  v4->_programName = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v29;
    int v23 = 1;
    while (2)
    {
      uint64_t v10 = 0;
      int v21 = v7 + v6;
      int v22 = v7;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * v10);
        if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"GLKEffect effectWithAttribs: bad argument type for argument %d: %p", (v22 + 1) + v10, v11);
          goto LABEL_30;
        }
        [(NSMutableArray *)v4->_properties addObject:v11];
        [v11 setEffect:v4];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v11 setEffectDirtyUniforms:&v4->_dirtyUniforms];
          v4->_effectShaderArray[v4->_numLights + 2] = v11;
          [v11 setLightIndex:v4->_numLights++];
          [(NSMutableArray *)v4->_lightProperties addObject:v11];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v4->_texturingEnabled = 1;
            v4->_textureOrderStale = 1;
            ++v4->_numTextures;
          }
          else if (v23 == 1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            int v23 = 0;
            *((void *)v4->_effectShaderArray + 1) = v11;
            uint64_t v8 = (uint64_t)v11;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              *((void *)v4->_effectShaderArray + 10) = v11;
              [v11 setEffectDirtyUniforms:&v4->_dirtyUniforms];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                *((void *)v4->_effectShaderArray + 19) = v11;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  *((void *)v4->_effectShaderArray + 20) = v11;
                }
              }
            }
          }
        }
        ++v10;
      }
      while (v6 != v10);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v28 objects:v33 count:16];
      int v7 = v21;
      if (v6) {
        continue;
      }
      break;
    }
    uint64_t Error = glGetError();
    if (!Error)
    {
      if (v23) {
        goto LABEL_32;
      }
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t Error = glGetError();
    if (!Error)
    {
LABEL_32:
      [(GLKEffect *)v4 addTransformProperty];
      uint64_t v8 = [(NSMutableArray *)v4->_properties objectAtIndex:0];
LABEL_33:
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      lightProperties = v4->_lightProperties;
      uint64_t v16 = [(NSMutableArray *)lightProperties countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v25 != v18) {
              objc_enumerationMutation(lightProperties);
            }
            [*(id *)(*((void *)&v24 + 1) + 8 * i) setTransform:v8];
          }
          uint64_t v17 = [(NSMutableArray *)lightProperties countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v17);
      }
      _lightStateChanged((uint64_t)v4);
      return v4;
    }
  }
  uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"GL ERROR: 0x%04x", Error, v20);
LABEL_30:
  NSLog(&stru_26C9DFC10.isa, v13);
  return 0;
}

- (void)dirtyAllUniforms
{
}

- (void)setTextureOrder:(id)a3
{
  if (!a3)
  {

    self->_textureOrder = 0;
    goto LABEL_13;
  }
  unint64_t v5 = [a3 count];
  textureOrder = self->_textureOrder;
  if (!textureOrder || (v5 == [(NSArray *)textureOrder count] ? (BOOL v7 = v5 == 0) : (BOOL v7 = 1), v7))
  {
    LODWORD(v8) = 0;
  }
  else
  {
    uint64_t v8 = 0;
    unsigned int v9 = 0;
    while (1)
    {
      uint64_t v10 = (void *)[a3 objectAtIndex:v8];
      if (v10 != [(NSArray *)self->_textureOrder objectAtIndex:v8]) {
        break;
      }
      uint64_t v8 = ++v9;
      if (v5 <= v9) {
        goto LABEL_9;
      }
    }
    LODWORD(v8) = v9;
  }
LABEL_9:
  if (!v5 || v5 != v8)
  {

    self->_textureOrder = (NSArray *)a3;
LABEL_13:
    self->_textureOrderStale = 1;
  }
}

- (void)addTransformProperty
{
  uint64_t v3 = objc_alloc_init(GLKEffectPropertyTransform);
  properties = self->_properties;

  [(NSMutableArray *)properties insertObject:v3 atIndex:0];
}

- (void)setTextureIndices
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  GLint params = 0;
  +[GLKEffectPropertyTexture clearAllTexturingMasks:self->_vshMask fshMask:self->_fshMask];
  textureOrder = self->_textureOrder;
  if (textureOrder)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v4 = [(NSArray *)textureOrder countByEnumeratingWithState:&v22 objects:v31 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      int v6 = 0;
      uint64_t v7 = *(void *)v23;
      do
      {
        uint64_t v8 = 0;
        uint64_t v9 = v6;
        do
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(textureOrder);
          }
          uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * v8);
          [v10 setTextureIndex:(v6 + v8)];
          self->_effectShaderArray[v9++ + 11] = v10;
          ++v8;
        }
        while (v5 != v8);
        uint64_t v5 = [(NSArray *)textureOrder countByEnumeratingWithState:&v22 objects:v31 count:16];
        int v6 = v9;
      }
      while (v5);
    }
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    glGetIntegerv(0x8872u, &params);
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    int v14 = 3553;
    do
    {
      uint64_t v21 = v12;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      properties = self->_properties;
      uint64_t v16 = [(NSMutableArray *)properties countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v27 != v18) {
              objc_enumerationMutation(properties);
            }
            uint64_t v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v20 target] == v14)
            {
              [v20 setTextureIndex:v13];
              self->_effectShaderArray[(int)v13 + 11] = v20;
              [v11 addObject:v20];
              uint64_t v13 = (v13 + 1);
            }
          }
          uint64_t v17 = [(NSMutableArray *)properties countByEnumeratingWithState:&v26 objects:v32 count:16];
        }
        while (v17);
      }
      uint64_t v12 = v21 + 1;
      int v14 = dword_2187C14F0[v21 + 1];
    }
    while (v21 != 1);
    -[GLKEffect setTextureOrder:](self, "setTextureOrder:", [MEMORY[0x263EFF8C0] arrayWithArray:v11]);
  }
}

- (BOOL)useTexCoordAttrib
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  textureOrder = self->_textureOrder;
  uint64_t v3 = [(NSArray *)textureOrder countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(textureOrder);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * v6) useTexCoordAttribMask])
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [(NSArray *)textureOrder countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (BOOL)useColorAttrib
{
  return self->_colorMaterialEnabled || self->_perVertexLightingEnabled == 0;
}

+ (id)programInfoLogForName:(unsigned int)a3 effectLabel:(id)a4 msg:(const char *)a5
{
  GLint params = 0;
  glGetProgramiv(a3, 0x8B84u, &params);
  if (!params) {
    return 0;
  }
  long long v8 = (GLchar *)malloc_type_malloc(params, 0xCAFA061BuLL);
  glGetProgramInfoLog(a3, params, &params, v8);
  long long v9 = (void *)[NSString stringWithFormat:@"GLKEffect programInfoLogForName - %s\nEffect: %@\nInformation log:\n%s", a5, a4, v8];
  free(v8);
  return v9;
}

+ (id)shaderInfoLogForName:(unsigned int)a3 effectLabel:(id)a4 msg:(const char *)a5
{
  GLint params = 0;
  glGetShaderiv(a3, 0x8B84u, &params);
  if (!params) {
    return 0;
  }
  long long v8 = (GLchar *)malloc_type_malloc(params, 0xC1A003E4uLL);
  glGetShaderInfoLog(a3, params, &params, v8);
  long long v9 = (void *)[NSString stringWithFormat:@"GLKEffect shaderInfoLogForName - %s\nEffect: %@\nInformation log:\n%s", a5, a4, v8];
  free(v8);
  return v9;
}

- (void)setLightModelAmbientColor:(_GLKVector4)a3
{
  self->_lightModelAmbientColor.x = v3;
  self->_lightModelAmbientColor.y = v4;
  self->_lightModelAmbientColor.z = v5;
  self->_lightModelAmbientColor.w = v6;
  unint64_t v8 = [(GLKEffect *)self dirtyUniforms] | 2;

  [(GLKEffect *)self setDirtyUniforms:v8];
}

- (void)setColorMaterialEnabled:(unsigned __int8)a3
{
  if (self->_colorMaterialEnabled != a3 || !self->_masksInitialized)
  {
    self->_colorMaterialEnabled = a3;
    float v3 = (uint64_t *)&__vshMasks;
    if (a3) {
      float v4 = (uint64_t *)&__vshMasks;
    }
    else {
      float v4 = &qword_267BDA440;
    }
    fshMask = self->_fshMask;
    vshMask = self->_vshMask;
    unint64_t n1 = vshMask->n1;
    vshMask->n0 |= *v4;
    if (a3) {
      unint64_t v8 = (uint64_t *)&__vshMasks + 1;
    }
    else {
      unint64_t v8 = &qword_267BDA448;
    }
    vshMask->unint64_t n1 = n1 | *v8;
    if (a3) {
      long long v9 = (uint64_t *)&__fshMasks;
    }
    else {
      long long v9 = &qword_267BDA4E0;
    }
    unint64_t v10 = fshMask->n1;
    fshMask->n0 |= *v9;
    if (a3) {
      long long v11 = (uint64_t *)&__fshMasks + 1;
    }
    else {
      long long v11 = &qword_267BDA4E8;
    }
    fshMask->unint64_t n1 = v10 | *v11;
    if (a3) {
      float v3 = &qword_267BDA440;
    }
    unint64_t v12 = vshMask->n1;
    vshMask->n0 &= ~*v3;
    if (a3) {
      uint64_t v13 = &qword_267BDA448;
    }
    else {
      uint64_t v13 = (uint64_t *)&__vshMasks + 1;
    }
    vshMask->unint64_t n1 = v12 & ~*v13;
    if (a3) {
      int v14 = &qword_267BDA4E0;
    }
    else {
      int v14 = (uint64_t *)&__fshMasks;
    }
    unint64_t v15 = fshMask->n1;
    fshMask->n0 &= ~*v14;
    if (a3) {
      uint64_t v16 = &qword_267BDA4E8;
    }
    else {
      uint64_t v16 = (uint64_t *)&__fshMasks + 1;
    }
    fshMask->unint64_t n1 = v15 & ~*v16;
  }
}

- (void)setLightModelTwoSided:(unsigned __int8)a3
{
  if (self->_lightModelTwoSided != a3 || !self->_masksInitialized)
  {
    self->_lightModelTwoSided = a3;
    _lightModelTwoSidedMask((uint64_t)self);
  }
}

- (void)setPerVertexLightingEnabled:(unsigned __int8)a3
{
  if (self->_perVertexLightingEnabled != a3 || !self->_masksInitialized) {
    _lightStateChanged((uint64_t)self);
  }
}

- (void)setPerPixelLightingEnabled:(unsigned __int8)a3
{
  if (self->_perPixelLightingEnabled != a3 || !self->_masksInitialized) {
    _lightStateChanged((uint64_t)self);
  }
}

- (void)setShaderBindings
{
  self->_aColorLoc = glGetAttribLocation(self->_programName, "a_color");
  self->_lightModelAmbientColorLoc = glGetUniformLocation(self->_programName, "lightModelAmbientColor");
  self->_baseLightingColorLoc = glGetUniformLocation(self->_programName, "baseLightingColor");

  [(GLKEffect *)self dirtyAllUniforms];
}

- (void)updateVshStringsWithRoot:(id)a3 enabled:(GLKBigInt_s)a4
{
  unint64_t n1 = a4.n1;
  unint64_t n0 = a4.n0;
  if ([a3 propertyClass] == 21
    || [a3 type] == 2
    || (effectShaderArray = self->_effectShaderArray, effectShaderArray[[a3 propertyClass]])
    && objc_msgSend(self->_effectShaderArray[objc_msgSend(a3, "propertyClass")], "includeVshShaderTextForRootNode:", a3))
  {
    if ([a3 blockText])
    {
      uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "blockText"), "UTF8String");
      vshStrings = self->_vshStrings;
      uint64_t numVshStrings = self->_numVshStrings;
      self->_uint64_t numVshStrings = numVshStrings + 1;
      vshStrings[numVshStrings] = (char *)v9;
    }
    if ([a3 children]) {
      -[GLKEffect updateVshStringsWithRoot:enabled:](self, "updateVshStringsWithRoot:enabled:", [a3 children], n0, n1);
    }
  }
  if ([a3 next])
  {
    uint64_t v12 = [a3 next];
    -[GLKEffect updateVshStringsWithRoot:enabled:](self, "updateVshStringsWithRoot:enabled:", v12, n0, n1);
  }
}

- (void)updateFshStringsWithRoot:(id)a3 enabled:(GLKBigInt_s)a4
{
  unint64_t n1 = a4.n1;
  unint64_t n0 = a4.n0;
  if ([a3 propertyClass] == 21
    || [a3 type] == 2
    || (effectShaderArray = self->_effectShaderArray, effectShaderArray[[a3 propertyClass]])
    && objc_msgSend(self->_effectShaderArray[objc_msgSend(a3, "propertyClass")], "includeFshShaderTextForRootNode:", a3))
  {
    if ([a3 blockText])
    {
      uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "blockText"), "UTF8String");
      fshStrings = self->_fshStrings;
      uint64_t numFshStrings = self->_numFshStrings;
      self->_uint64_t numFshStrings = numFshStrings + 1;
      fshStrings[numFshStrings] = (char *)v9;
    }
    if ([a3 children]) {
      -[GLKEffect updateFshStringsWithRoot:enabled:](self, "updateFshStringsWithRoot:enabled:", [a3 children], n0, n1);
    }
  }
  if ([a3 next])
  {
    uint64_t v12 = [a3 next];
    -[GLKEffect updateFshStringsWithRoot:enabled:](self, "updateFshStringsWithRoot:enabled:", v12, n0, n1);
  }
}

- (void)createAndUseProgramWithShadingHash:(id)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  if (!self->_masksInitialized) {
    [(GLKEffect *)self initializeMasks];
  }
  unint64_t v67 = 0;
  uint64_t v68 = 0;
  *(void *)v66 = 0;
  if (__purgeShadingHash == 1 && __hashedShaders >= 0x101)
  {
    GLint params = 0;
    glGetIntegerv(0x8B8Du, &params);
    float v5 = (void *)[(NSMutableDictionary *)self->_programHash keyEnumerator];
    uint64_t v6 = [v5 nextObject];
    if (v6)
    {
      uint64_t v7 = v6;
      do
      {
        GLuint v8 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_programHash, "objectForKey:", v7), "intValue");
        if (v8 != params) {
          glDeleteProgram(v8);
        }
        uint64_t v7 = [v5 nextObject];
      }
      while (v7);
    }
    [(NSMutableDictionary *)self->_programHash removeAllObjects];
    [a3 purgeAllShaders];
    __hashedShaders = 0;
  }
  uint64_t v9 = [[GLKHashableBigInt alloc] initWithBigInt:self->_vshMask];
  unint64_t v10 = (void *)[a3 compiledVshForKey:v9];
  if (v10)
  {
    self->_GLuint vshName = [v10 intValue];
  }
  else
  {
    self->_GLuint vshName = glCreateShader(0x8B31u);
    self->_uint64_t numVshStrings = 0;
    -[GLKEffect updateVshStringsWithRoot:enabled:](self, "updateVshStringsWithRoot:enabled:", self->_vshRootNode, self->_vshMask->n0, self->_vshMask->n1);
    glShaderSource(self->_vshName, self->_numVshStrings, (const GLchar *const *)self->_vshStrings, 0);
    glCompileShader(self->_vshName);
    label = self->_label;
    if (label && (__purgeShadingHash & 1) == 0) {
      glLabelObjectEXT(0x8B48u, self->_vshName, 0, [(NSString *)label cStringUsingEncoding:1]);
    }
    glGetShaderiv(self->_vshName, 0x8B81u, &v66[1]);
    if (!v66[1])
    {
      GLuint vshName = self->_vshName;
LABEL_57:
      glDeleteShader(vshName);
      return;
    }
    objc_msgSend(a3, "setCompiledVsh:forKey:", objc_msgSend(NSNumber, "numberWithLong:", self->_vshName), v9);
    ++__hashedShaders;
  }
  uint64_t v12 = [[GLKHashableBigInt alloc] initWithBigInt:self->_fshMask];
  uint64_t v13 = (void *)[a3 compiledFshForKey:v12];
  if (v13)
  {
    unsigned int fshName = [v13 intValue];
    self->_unsigned int fshName = fshName;
    goto LABEL_25;
  }
  self->_unsigned int fshName = glCreateShader(0x8B30u);
  self->_uint64_t numFshStrings = 0;
  -[GLKEffect updateFshStringsWithRoot:enabled:](self, "updateFshStringsWithRoot:enabled:", self->_fshRootNode, self->_fshMask->n0, self->_fshMask->n1);
  glShaderSource(self->_fshName, self->_numFshStrings, (const GLchar *const *)self->_fshStrings, 0);
  glCompileShader(self->_fshName);
  unint64_t v15 = self->_label;
  if (v15 && (__purgeShadingHash & 1) == 0) {
    glLabelObjectEXT(0x8B48u, self->_fshName, 0, [(NSString *)v15 cStringUsingEncoding:1]);
  }
  glGetShaderiv(self->_fshName, 0x8B81u, &v66[1]);
  if (!v66[1])
  {
    GLuint vshName = self->_fshName;
    goto LABEL_57;
  }
  objc_msgSend(a3, "setCompiledFsh:forKey:", objc_msgSend(NSNumber, "numberWithLong:", self->_fshName), v12);
  ++__hashedShaders;
  unsigned int fshName = self->_fshName;
LABEL_25:
  unint64_t v67 = fshName | ((unint64_t)self->_vshName << 32);
  uint64_t v68 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F146E8], "currentContext"), "sharegroup");
  uint64_t v16 = [[GLKHashableBigInt alloc] initWithBigInt:&v67];
  uint64_t v17 = (void *)[(NSMutableDictionary *)self->_programHash objectForKey:v16];
  if (v17)
  {
    unsigned int v18 = [v17 intValue];
    self->_GLuint programName = v18;
    glUseProgram(v18);
    [(GLKEffect *)self setShaderBindings];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    properties = self->_properties;
    uint64_t v20 = [(NSMutableArray *)properties countByEnumeratingWithState:&v61 objects:v72 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v62 != v22) {
            objc_enumerationMutation(properties);
          }
          [*(id *)(*((void *)&v61 + 1) + 8 * i) setShaderBindings];
        }
        uint64_t v21 = [(NSMutableArray *)properties countByEnumeratingWithState:&v61 objects:v72 count:16];
      }
      while (v21);
    }
    return;
  }
  GLuint Program = glCreateProgram();
  self->_GLuint programName = Program;
  if (self->_label && (__purgeShadingHash & 1) == 0)
  {
    glLabelObjectEXT(0x8B40u, self->_programName, 0, [(NSString *)self->_label cStringUsingEncoding:1]);
    GLuint Program = self->_programName;
  }
  glAttachShader(Program, self->_vshName);
  glAttachShader(self->_programName, self->_fshName);
  glBindAttribLocation(self->_programName, 0, "a_position");
  if (self->_perPixelLightingEnabled || self->_perVertexLightingEnabled) {
    goto LABEL_39;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  textureOrder = self->_textureOrder;
  uint64_t v40 = [(NSArray *)textureOrder countByEnumeratingWithState:&v57 objects:v71 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v58;
LABEL_63:
    uint64_t v43 = 0;
    while (1)
    {
      if (*(void *)v58 != v42) {
        objc_enumerationMutation(textureOrder);
      }
      if ([*(id *)(*((void *)&v57 + 1) + 8 * v43) normalizedNormalsMask]) {
        break;
      }
      if (v41 == ++v43)
      {
        uint64_t v41 = [(NSArray *)textureOrder countByEnumeratingWithState:&v57 objects:v71 count:16];
        if (v41) {
          goto LABEL_63;
        }
        goto LABEL_40;
      }
    }
LABEL_39:
    glBindAttribLocation(self->_programName, 1u, "a_normal");
  }
LABEL_40:
  if ([(GLKEffect *)self useTexCoordAttrib])
  {
    glBindAttribLocation(self->_programName, 3u, "a_texCoord0");
    glBindAttribLocation(self->_programName, 4u, "a_texCoord1");
  }
  if ([(GLKEffect *)self useColorAttrib]) {
    glBindAttribLocation(self->_programName, 2u, "a_color");
  }
  glLinkProgram(self->_programName);
  glGetProgramiv(self->_programName, 0x8B82u, v66);
  GLuint programName = self->_programName;
  if (!v66[0]) {
    goto LABEL_54;
  }
  glUseProgram(programName);
  [(GLKEffect *)self setShaderBindings];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v26 = self->_properties;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v53 objects:v70 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v54 != v29) {
          objc_enumerationMutation(v26);
        }
        [*(id *)(*((void *)&v53 + 1) + 8 * j) setShaderBindings];
      }
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v53 objects:v70 count:16];
    }
    while (v28);
  }
  GLint params = 0;
  GLint UniformLocation = glGetUniformLocation(self->_programName, "unit2d[0]");
  GLint v32 = glGetUniformLocation(self->_programName, "unit2d[1]");
  GLint v33 = glGetUniformLocation(self->_programName, "unit2d[2]");
  GLint v34 = glGetUniformLocation(self->_programName, "unitCube[0]");
  GLint v35 = glGetUniformLocation(self->_programName, "unitCube[1]");
  GLint v36 = glGetUniformLocation(self->_programName, "unitCube[2]");
  glGetIntegerv(0x8872u, &params);
  glUniform1i(UniformLocation, params - 1);
  glUniform1i(v32, params - 2);
  glUniform1i(v33, params - 3);
  glUniform1i(v34, params - 4);
  glUniform1i(v35, params - 5);
  glUniform1i(v36, params - 6);
  glValidateProgram(self->_programName);
  if (+[GLKEffect programInfoLogForName:self->_programName effectLabel:[(GLKEffect *)self label] msg:"program validate failed"])
  {
    GLuint programName = self->_programName;
LABEL_54:
    glDeleteProgram(programName);
    return;
  }
  uint64_t Error = glGetError();
  if (Error)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"GL ERROR: 0x%04x", Error);
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](self->_programHash, "setObject:forKey:", [NSNumber numberWithLong:self->_programName], v16);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v44 = self->_properties;
    uint64_t v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v49 objects:v69 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v50;
      do
      {
        for (uint64_t k = 0; k != v46; ++k)
        {
          if (*(void *)v50 != v47) {
            objc_enumerationMutation(v44);
          }
          [*(id *)(*((void *)&v49 + 1) + 8 * k) dirtyAllUniforms];
        }
        uint64_t v46 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v49 objects:v69 count:16];
      }
      while (v46);
    }
  }
}

- (void)bind
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  if (self->_textureOrderStale) {
    [(GLKEffect *)self setTextureIndices];
  }
  vshMasuint64_t k = self->_vshMask;
  if (vshMask->n0 == self->_prevVshMask.n0
    && vshMask->n1 == self->_prevVshMask.n1
    && (float v4 = self->_fshMask, v4->n0 == self->_prevFshMask.n0)
    && v4->n1 == self->_prevFshMask.n1)
  {
    params[0] = 0;
    glGetIntegerv(0x8B8Du, params);
    GLuint programName = self->_programName;
    if (programName != params[0]) {
      glUseProgram(programName);
    }
  }
  else
  {
    uint64_t v6 = (void *)[MEMORY[0x263F146E8] currentContext];
    if (!v6)
    {
      if (self->_label) {
        NSLog(&cfstr_NoOpenglContex.isa, self->_label);
      }
      else {
        NSLog(&cfstr_NoOpenglContex_0.isa);
      }
      return;
    }
    uint64_t v7 = [v6 sharegroup];
    *(void *)GLint params = 0;
    *(void *)&params[2] = params;
    uint64_t v66 = 0x3052000000;
    unint64_t v67 = __Block_byref_object_copy_;
    uint64_t v68 = __Block_byref_object_dispose_;
    uint64_t v69 = 0;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __17__GLKEffect_bind__block_invoke;
    block[3] = &unk_264339EF0;
    block[5] = self;
    block[6] = params;
    block[4] = v7;
    dispatch_sync((dispatch_queue_t)__sharegroupQueue, block);
    self->_textureOrderStale = 0;
    fshMasuint64_t k = self->_fshMask;
    self->_prevVshMasuint64_t k = *self->_vshMask;
    self->_prevFshMasuint64_t k = *fshMask;
    _Block_object_dispose(params, 8);
  }
  if (self->_textureOrderStale)
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    textureOrder = self->_textureOrder;
    uint64_t v10 = [(NSArray *)textureOrder countByEnumeratingWithState:&v60 objects:v72 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v61 != v12) {
            objc_enumerationMutation(textureOrder);
          }
          [*(id *)(*((void *)&v60 + 1) + 8 * i) setShaderBindings];
        }
        uint64_t v11 = [(NSArray *)textureOrder countByEnumeratingWithState:&v60 objects:v72 count:16];
      }
      while (v11);
    }
    self->_textureOrderStale = 0;
  }
  if ([(GLKEffect *)self dirtyUniforms])
  {
    if (([(GLKEffect *)self dirtyUniforms] & 2) != 0) {
      glUniform4fv(self->_lightModelAmbientColorLoc, 1, &self->_lightModelAmbientColor.x);
    }
    if (!self->_colorMaterialEnabled)
    {
      if ((self->_perVertexLightingEnabled || self->_perPixelLightingEnabled)
        && (([(GLKEffect *)self dirtyUniforms] & 0x1000000) != 0
         || ([(GLKEffect *)self dirtyUniforms] & 0x4000000) != 0
         || ([(GLKEffect *)self dirtyUniforms] & 2) != 0))
      {
        [self->_effectShaderArray[10] ambientColor];
        v15.i32[1] = v14;
        v15.i64[1] = __PAIR64__(v17, v16);
        self->_baseLightingColor = (_GLKVector4)vmulq_f32((float32x4_t)self->_lightModelAmbientColor, v15);
        [self->_effectShaderArray[10] emissiveColor];
        v19.i32[1] = v18;
        v19.i64[1] = __PAIR64__(v21, v20);
        self->_baseLightingColor = (_GLKVector4)vaddq_f32((float32x4_t)self->_baseLightingColor, v19);
        glUniform4fv(self->_baseLightingColorLoc, 1, &self->_baseLightingColor.x);
      }
      if (!self->_colorMaterialEnabled
        && *((void *)self->_effectShaderArray + 10)
        && (([(GLKEffect *)self dirtyUniforms] & 0x1000000) != 0
         || ([(GLKEffect *)self dirtyUniforms] & 0x40000000) != 0))
      {
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        lightProperties = self->_lightProperties;
        uint64_t v34 = [(NSMutableArray *)lightProperties countByEnumeratingWithState:&v56 objects:v71 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v57;
          do
          {
            for (uint64_t j = 0; j != v35; ++j)
            {
              if (*(void *)v57 != v36) {
                objc_enumerationMutation(lightProperties);
              }
              uint64_t v38 = *(void **)(*((void *)&v56 + 1) + 8 * j);
              memset(params, 0, sizeof(params));
              [self->_effectShaderArray[10] ambientColor];
              unsigned int v49 = v39;
              unsigned int v48 = v40;
              unsigned int v50 = v41;
              unsigned int v51 = v42;
              [v38 ambientColor];
              v43.i64[0] = __PAIR64__(v48, v49);
              v43.i64[1] = __PAIR64__(v51, v50);
              v45.i32[1] = v44;
              v45.i64[1] = __PAIR64__(v47, v46);
              *(float32x4_t *)GLint params = vmulq_f32(v43, v45);
              glUniform4fv([v38 ambientTermLoc], 1, (const GLfloat *)params);
            }
            uint64_t v35 = [(NSMutableArray *)lightProperties countByEnumeratingWithState:&v56 objects:v71 count:16];
          }
          while (v35);
        }
      }
    }
    [(GLKEffect *)self setDirtyUniforms:0];
  }
  uint64_t v22 = (void *)*((void *)self->_effectShaderArray + 20);
  if (v22 && ![v22 enabled])
  {
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)GLint params = _Q0;
    glVertexAttrib4fv(self->_aColorLoc, (const GLfloat *)params);
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  properties = self->_properties;
  uint64_t v29 = [(NSMutableArray *)properties countByEnumeratingWithState:&v52 objects:v70 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v53;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v53 != v31) {
          objc_enumerationMutation(properties);
        }
        [*(id *)(*((void *)&v52 + 1) + 8 * k) bind];
      }
      uint64_t v30 = [(NSMutableArray *)properties countByEnumeratingWithState:&v52 objects:v70 count:16];
    }
    while (v30);
  }
}

uint64_t __17__GLKEffect_bind__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = CFDictionaryGetValue((CFDictionaryRef)__sharegroupDict, *(const void **)(a1 + 32));
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_alloc_init(GLKShadingHash);
    CFDictionaryAddValue((CFMutableDictionaryRef)__sharegroupDict, *(const void **)(a1 + 32), *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  float v3 = *(void **)(a1 + 40);

  return [v3 createAndUseProgramWithShadingHash:v2];
}

- (void)initializeMasks
{
  self->_perPixelLightingEnabled = [(GLKEffect *)self perPixelLightingEnabled];
  self->_perVertexLightingEnabled = [(GLKEffect *)self perVertexLightingEnabled];
  float v3 = (uint64_t *)&__vshMasks;
  BOOL v4 = self->_colorMaterialEnabled == 0;
  if (self->_colorMaterialEnabled) {
    float v5 = (uint64_t *)&__vshMasks;
  }
  else {
    float v5 = &qword_267BDA440;
  }
  fshMasuint64_t k = self->_fshMask;
  vshMasuint64_t k = self->_vshMask;
  unint64_t n1 = vshMask->n1;
  vshMask->n0 |= *v5;
  uint64_t v9 = &qword_267BDA448;
  if (v4) {
    uint64_t v10 = &qword_267BDA448;
  }
  else {
    uint64_t v10 = (uint64_t *)&__vshMasks + 1;
  }
  vshMask->unint64_t n1 = n1 | *v10;
  if (v4) {
    uint64_t v11 = &qword_267BDA4E0;
  }
  else {
    uint64_t v11 = (uint64_t *)&__fshMasks;
  }
  unint64_t v12 = fshMask->n1;
  fshMask->n0 |= *v11;
  if (v4) {
    uint64_t v13 = &qword_267BDA4E8;
  }
  else {
    uint64_t v13 = (uint64_t *)&__fshMasks + 1;
  }
  fshMask->unint64_t n1 = v12 | *v13;
  if (!v4) {
    float v3 = &qword_267BDA440;
  }
  unint64_t v14 = vshMask->n1;
  vshMask->n0 &= ~*v3;
  if (v4) {
    uint64_t v9 = (uint64_t *)&__vshMasks + 1;
  }
  vshMask->unint64_t n1 = v14 & ~*v9;
  if (v4) {
    float32x4_t v15 = (uint64_t *)&__fshMasks;
  }
  else {
    float32x4_t v15 = &qword_267BDA4E0;
  }
  unint64_t v16 = fshMask->n1;
  fshMask->n0 &= ~*v15;
  if (v4) {
    unsigned int v17 = (uint64_t *)&__fshMasks + 1;
  }
  else {
    unsigned int v17 = &qword_267BDA4E8;
  }
  fshMask->unint64_t n1 = v16 & ~*v17;
  _lightModelTwoSidedMask((uint64_t)self);
  _vNormalEyeMask((uint64_t)self);
  _vPositionEyeMask((uint64_t)self);
  _useTexCoordAttribMask((uint64_t)self);
  _normalizedNormalsMask((uint64_t)self);
  _texturingEnabledMask((uint64_t)self);
  for (uint64_t i = 1; i != 22; ++i)
  {
    id v19 = self->_effectShaderArray[i];
    if (v19) {
      [v19 initializeMasks];
    }
  }

  [(GLKEffect *)self setMasksInitialized:1];
}

- (BOOL)includeShaderTextForRootNode:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", @"per-pixel lighting enabled"))goto LABEL_2; {
  if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", @"per-vertex lighting enabled"))
  }
  {
LABEL_4:
    int perVertexLightingEnabled = self->_perVertexLightingEnabled;
    goto LABEL_5;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", @"per-vertex lighting disabled"))goto LABEL_8; {
  if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", @"texturing enabled"))
  }
  {
    int perVertexLightingEnabled = self->_texturingEnabled;
    goto LABEL_5;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", @"color material enabled"))
  {
    int perVertexLightingEnabled = self->_colorMaterialEnabled;
    goto LABEL_5;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", @"color material disabled"))
  {
    int colorMaterialEnabled = self->_colorMaterialEnabled;
    goto LABEL_9;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", @"light model two-sided per-vertex enabled"))
  {
    if (self->_lightModelTwoSided) {
      goto LABEL_4;
    }
    goto LABEL_24;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", @"light model two-sided per-vertex disabled"))
  {
    if (self->_lightModelTwoSided)
    {
LABEL_8:
      int colorMaterialEnabled = self->_perVertexLightingEnabled;
LABEL_9:
      LOBYTE(v6) = colorMaterialEnabled == 0;
      return v6;
    }
LABEL_88:
    LOBYTE(v6) = 1;
    return v6;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", @"light model two-sided per-pixel enabled"))
  {
    if (self->_lightModelTwoSided)
    {
LABEL_2:
      int perVertexLightingEnabled = self->_perPixelLightingEnabled;
LABEL_5:
      LOBYTE(v6) = perVertexLightingEnabled != 0;
      return v6;
    }
    goto LABEL_24;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", @"light model two-sided per-pixel disabled"))
  {
    if (self->_lightModelTwoSided)
    {
      int colorMaterialEnabled = self->_perPixelLightingEnabled;
      goto LABEL_9;
    }
    goto LABEL_88;
  }
  if (!objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", @"use tex coord attrib"))
  {
    if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", @"normalized normals"))
    {
      if (!self->_perVertexLightingEnabled && !self->_perPixelLightingEnabled)
      {
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        textureOrder = self->_textureOrder;
        uint64_t v6 = [(NSArray *)textureOrder countByEnumeratingWithState:&v40 objects:v47 count:16];
        if (!v6) {
          return v6;
        }
        uint64_t v9 = v6;
        uint64_t v10 = *(void *)v41;
LABEL_37:
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v41 != v10) {
            objc_enumerationMutation(textureOrder);
          }
          if ([*(id *)(*((void *)&v40 + 1) + 8 * v11) normalizedNormalsMask]) {
            break;
          }
          if (v9 == ++v11)
          {
            uint64_t v9 = [(NSArray *)textureOrder countByEnumeratingWithState:&v40 objects:v47 count:16];
            LOBYTE(v6) = 0;
            if (v9) {
              goto LABEL_37;
            }
            return v6;
          }
        }
      }
      goto LABEL_88;
    }
    if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", @"v_positionEye"))
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      unint64_t v12 = self->_textureOrder;
      uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v36 objects:v46 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v37;
LABEL_47:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v12);
          }
          if ([*(id *)(*((void *)&v36 + 1) + 8 * v16) vPositionEyeMask]) {
            goto LABEL_88;
          }
          if (v14 == ++v16)
          {
            uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v36 objects:v46 count:16];
            if (v14) {
              goto LABEL_47;
            }
            break;
          }
        }
      }
      if (self->_perPixelLightingEnabled)
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        lightProperties = self->_lightProperties;
        uint64_t v6 = [(NSMutableArray *)lightProperties countByEnumeratingWithState:&v32 objects:v45 count:16];
        if (!v6) {
          return v6;
        }
        uint64_t v18 = v6;
        uint64_t v19 = *(void *)v33;
LABEL_56:
        uint64_t v20 = 0;
        while (1)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(lightProperties);
          }
          unsigned int v21 = *(void **)(*((void *)&v32 + 1) + 8 * v20);
          if ([v21 enabled])
          {
            [v21 position];
            if (v22 != 0.0) {
              goto LABEL_88;
            }
          }
          if (v18 == ++v20)
          {
            uint64_t v18 = [(NSMutableArray *)lightProperties countByEnumeratingWithState:&v32 objects:v45 count:16];
            LOBYTE(v6) = 0;
            if (v18) {
              goto LABEL_56;
            }
            return v6;
          }
        }
      }
      goto LABEL_24;
    }
    if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", @"v_normalEye"))
    {
      if (!self->_perPixelLightingEnabled)
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v23 = self->_textureOrder;
        uint64_t v6 = [(NSArray *)v23 countByEnumeratingWithState:&v28 objects:v44 count:16];
        if (!v6) {
          return v6;
        }
        uint64_t v24 = v6;
        uint64_t v25 = *(void *)v29;
LABEL_68:
        uint64_t v26 = 0;
        while (1)
        {
          if (*(void *)v29 != v25) {
            objc_enumerationMutation(v23);
          }
          if ([*(id *)(*((void *)&v28 + 1) + 8 * v26) vNormalEyeMask]) {
            break;
          }
          if (v24 == ++v26)
          {
            uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v28 objects:v44 count:16];
            LOBYTE(v6) = 0;
            if (v24) {
              goto LABEL_68;
            }
            return v6;
          }
        }
      }
      goto LABEL_88;
    }
    if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", @"light model two-sided per-vertex enabled"))
    {
      if (!self->_perVertexLightingEnabled) {
        goto LABEL_24;
      }
      goto LABEL_77;
    }
    if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", @"light model two-sided per-vertex disabled"))
    {
      if (!self->_perVertexLightingEnabled) {
        goto LABEL_88;
      }
    }
    else
    {
      if (objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", @"light model two-sided per-pixel enabled"))
      {
        if (!self->_perPixelLightingEnabled) {
          goto LABEL_24;
        }
LABEL_77:
        if (self->_lightModelTwoSided) {
          goto LABEL_88;
        }
LABEL_24:
        LOBYTE(v6) = 0;
        return v6;
      }
      if (!objc_msgSend((id)objc_msgSend(a3, "label"), "isEqualToString:", @"light model two-sided per-pixel disabled")|| !self->_perPixelLightingEnabled)
      {
        goto LABEL_88;
      }
    }
    if (!self->_lightModelTwoSided) {
      goto LABEL_88;
    }
    goto LABEL_24;
  }

  LOBYTE(v6) = [(GLKEffect *)self useTexCoordAttrib];
  return v6;
}

- (BOOL)includeFshShaderTextForRootNode:(id)a3
{
  uint64_t v3 = *((void *)a3 + 1);
  BOOL result = ((unint64_t)__fshMasks & v3) == 0
        && (uint64_t v4 = *((void *)a3 + 2), (*((void *)&__fshMasks + 1) & v4) == 0)
        && (qword_267BDA4E0 & v3) == 0
        && (qword_267BDA4E8 & v4) == 0
        && ((unint64_t)xmmword_267BDA4F0 & v3) == 0
        && (*((void *)&xmmword_267BDA4F0 + 1) & v4) == 0
        && ((unint64_t)xmmword_267BDA500 & v3) == 0
        && (*((void *)&xmmword_267BDA500 + 1) & v4) == 0
        && ((unint64_t)xmmword_267BDA510 & v3) == 0
        && (*((void *)&xmmword_267BDA510 + 1) & v4) == 0
        && (qword_267BDA520 & v3) == 0
        && (qword_267BDA528 & v4) == 0
        && ((unint64_t)xmmword_267BDA530 & v3) == 0
        && (*((void *)&xmmword_267BDA530 + 1) & v4) == 0
        && ((unint64_t)xmmword_267BDA540 & v3) == 0
        && (*((void *)&xmmword_267BDA540 + 1) & v4) == 0
        && ((unint64_t)xmmword_267BDA550 & v3) == 0
        && (*((void *)&xmmword_267BDA550 + 1) & v4) == 0
        && ((unint64_t)xmmword_267BDA560 & v3) == 0
        && (*((void *)&xmmword_267BDA560 + 1) & v4) == 0
        && ((unint64_t)xmmword_267BDA570 & v3) == 0
        && (*((void *)&xmmword_267BDA570 + 1) & v4) == 0
        || (fshMasuint64_t k = self->_fshMask, (fshMask->n0 & v3) != 0)
        || (*((void *)a3 + 2) & fshMask->n1) != 0;
  return result;
}

- (BOOL)includeVshShaderTextForRootNode:(id)a3
{
  uint64_t v3 = *((void *)a3 + 1);
  BOOL result = ((unint64_t)__vshMasks & v3) == 0
        && (uint64_t v4 = *((void *)a3 + 2), (*((void *)&__vshMasks + 1) & v4) == 0)
        && (qword_267BDA440 & v3) == 0
        && (qword_267BDA448 & v4) == 0
        && ((unint64_t)xmmword_267BDA450 & v3) == 0
        && (*((void *)&xmmword_267BDA450 + 1) & v4) == 0
        && ((unint64_t)xmmword_267BDA460 & v3) == 0
        && (*((void *)&xmmword_267BDA460 + 1) & v4) == 0
        && ((unint64_t)xmmword_267BDA470 & v3) == 0
        && (*((void *)&xmmword_267BDA470 + 1) & v4) == 0
        && ((unint64_t)xmmword_267BDA480 & v3) == 0
        && (*((void *)&xmmword_267BDA480 + 1) & v4) == 0
        && ((unint64_t)xmmword_267BDA490 & v3) == 0
        && (*((void *)&xmmword_267BDA490 + 1) & v4) == 0
        && ((unint64_t)xmmword_267BDA4A0 & v3) == 0
        && (*((void *)&xmmword_267BDA4A0 + 1) & v4) == 0
        && ((unint64_t)xmmword_267BDA4B0 & v3) == 0
        && (*((void *)&xmmword_267BDA4B0 + 1) & v4) == 0
        && ((unint64_t)xmmword_267BDA4C0 & v3) == 0
        && (*((void *)&xmmword_267BDA4C0 + 1) & v4) == 0
        || (vshMasuint64_t k = self->_vshMask, (vshMask->n0 & v3) != 0)
        || (*((void *)a3 + 2) & vshMask->n1) != 0;
  return result;
}

+ (void)setStaticMasksWithVshRoot:(id)a3 fshRoot:(id)a4
{
  *(void *)&__vshMasks = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", @"color material enabled", a3, [a3 index]);
  *((void *)&__vshMasks + 1) = v6;
  qword_267BDA440 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", @"color material disabled", a3, [a3 index]);
  qword_267BDA448 = v7;
  *(void *)&__fshMasks = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", @"color material enabled", a4, [a4 index]);
  *((void *)&__fshMasks + 1) = v8;
  qword_267BDA4E0 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", @"color material disabled", a4, [a4 index]);
  qword_267BDA4E8 = v9;
  *(void *)&xmmword_267BDA450 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", @"light model two-sided per-vertex enabled", a3, [a3 index]);
  *((void *)&xmmword_267BDA450 + 1) = v10;
  *(void *)&xmmword_267BDA4F0 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", @"light model two-sided per-vertex enabled", a4, [a4 index]);
  *((void *)&xmmword_267BDA4F0 + 1) = v11;
  *(void *)&xmmword_267BDA500 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", @"light model two-sided per-vertex disabled", a4, [a4 index]);
  *((void *)&xmmword_267BDA500 + 1) = v12;
  *(void *)&xmmword_267BDA510 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", @"light model two-sided per-pixel enabled", a4, [a4 index]);
  *((void *)&xmmword_267BDA510 + 1) = v13;
  qword_267BDA520 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", @"light model two-sided per-pixel disabled", a4, [a4 index]);
  qword_267BDA528 = v14;
  *(void *)&xmmword_267BDA530 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", @"per-pixel lighting enabled", a4, [a4 index]);
  *((void *)&xmmword_267BDA530 + 1) = v15;
  *(void *)&xmmword_267BDA460 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", @"per-vertex lighting enabled", a3, [a3 index]);
  *((void *)&xmmword_267BDA460 + 1) = v16;
  *(void *)&xmmword_267BDA470 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", @"use tex coord attrib", a3, [a3 index]);
  *((void *)&xmmword_267BDA470 + 1) = v17;
  *(void *)&xmmword_267BDA540 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", @"use tex coord attrib", a4, [a4 index]);
  *((void *)&xmmword_267BDA540 + 1) = v18;
  *(void *)&xmmword_267BDA480 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", @"texturing enabled", a3, [a3 index]);
  *((void *)&xmmword_267BDA480 + 1) = v19;
  *(void *)&xmmword_267BDA550 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", @"texturing enabled", a4, [a4 index]);
  *((void *)&xmmword_267BDA550 + 1) = v20;
  *(void *)&xmmword_267BDA490 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", @"normalized normals", a3, [a3 index]);
  *((void *)&xmmword_267BDA490 + 1) = v21;
  *(void *)&xmmword_267BDA4A0 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", @"v_positionEye", a3, [a3 index]);
  *((void *)&xmmword_267BDA4A0 + 1) = v22;
  *(void *)&xmmword_267BDA560 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", @"v_positionEye", a4, [a4 index]);
  *((void *)&xmmword_267BDA560 + 1) = v23;
  *(void *)&xmmword_267BDA4B0 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", @"v_normalEye", a3, [a3 index]);
  *((void *)&xmmword_267BDA4B0 + 1) = v24;
  *(void *)&xmmword_267BDA570 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", @"v_normalEye", a4, [a4 index]);
  *((void *)&xmmword_267BDA570 + 1) = v25;
  *(void *)&xmmword_267BDA4C0 = +[GLKShaderBlockNode maskForLabel:root:index:](GLKShaderBlockNode, "maskForLabel:root:index:", @"modelview matrix", a3, [a3 index]);
  *((void *)&xmmword_267BDA4C0 + 1) = v26;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"GLKEffect %p: %@", self, self->_label];
}

- (GLKBigInt_s)vshMasks
{
  return (GLKBigInt_s *)&__vshMasks;
}

- (GLKBigInt_s)fshMasks
{
  return (GLKBigInt_s *)&__fshMasks;
}

- (unsigned)vshMaskCt
{
  return 10;
}

- (unsigned)fshMaskCt
{
  return 11;
}

- (char)vshMaskStr
{
  return &__vshMaskStr;
}

- (char)fshMaskStr
{
  return &__fshMaskStr;
}

- (void)dealloc
{
  free(self->_vshMask);
  free(self->_fshMask);
  free(self->_vshStrings);
  free(self->_fshStrings);
  free(self->_effectShaderArray);

  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_programHash objectEnumerator];
  for (i = v3; ; uint64_t v3 = i)
  {
    float v5 = (void *)[v3 nextObject];
    if (!v5) {
      break;
    }
    glDeleteProgram([v5 intValue]);
  }

  v6.receiver = self;
  v6.super_class = (Class)GLKEffect;
  [(GLKEffect *)&v6 dealloc];
}

- (NSMutableArray)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (NSMutableDictionary)programHash
{
  return self->_programHash;
}

- (unsigned)perVertexLightingEnabled
{
  return self->_perVertexLightingEnabled;
}

- (unsigned)perPixelLightingEnabled
{
  return self->_perPixelLightingEnabled;
}

- (unsigned)numLights
{
  return self->_numLights;
}

- (void)setNumLights:(unsigned int)a3
{
  self->_numLights = a3;
}

- (unsigned)numTextures
{
  return self->_numTextures;
}

- (void)setNumTextures:(unsigned int)a3
{
  self->_numTextures = a3;
}

- (unsigned)colorMaterialEnabled
{
  return self->_colorMaterialEnabled;
}

- (unsigned)lightModelTwoSided
{
  return self->_lightModelTwoSided;
}

- (_GLKVector4)lightModelAmbientColor
{
  *(void *)&result.v[2] = a2;
  *(void *)&result.x = self;
  return result;
}

- (unsigned)texturingEnabled
{
  return self->_texturingEnabled;
}

- (void)setTexturingEnabled:(unsigned __int8)a3
{
  self->_texturingEnabled = a3;
}

- (float)materialAmbientColor
{
  return self->_materialAmbientColor;
}

- (float)materialDiffuseColor
{
  return self->_materialDiffuseColor;
}

- (_GLKVector4)baseLightingColor
{
  *(void *)&result.v[2] = a2;
  *(void *)&result.x = self;
  return result;
}

- (void)setBaseLightingColor:(_GLKVector4)a3
{
  self->_baseLightingColor.x = v3;
  self->_baseLightingColor.y = v4;
  self->_baseLightingColor.z = v5;
  self->_baseLightingColor.w = v6;
}

- (unsigned)masksInitialized
{
  return self->_masksInitialized;
}

- (void)setMasksInitialized:(unsigned __int8)a3
{
  self->_masksInitialized = a3;
}

- (int)aColorLoc
{
  return self->_aColorLoc;
}

- (void)setAColorLoc:(int)a3
{
  self->_aColorLoc = a3;
}

- (id)effectShaderArray
{
  return self->_effectShaderArray;
}

- (void)setEffectShaderArray:(id *)a3
{
  self->_effectShaderArray = a3;
}

- (NSMutableArray)lightProperties
{
  return self->_lightProperties;
}

- (void)setLightProperties:(id)a3
{
}

- (NSArray)textureOrder
{
  return self->_textureOrder;
}

- (GLKShaderBlockNode)vshRootNode
{
  return self->_vshRootNode;
}

- (GLKShaderBlockNode)fshRootNode
{
  return self->_fshRootNode;
}

- (unsigned)vshName
{
  return self->_vshName;
}

- (void)setVshName:(unsigned int)a3
{
  self->_GLuint vshName = a3;
}

- (unsigned)fshName
{
  return self->_fshName;
}

- (void)setFshName:(unsigned int)a3
{
  self->_unsigned int fshName = a3;
}

- (unsigned)programName
{
  return self->_programName;
}

- (void)setProgramName:(unsigned int)a3
{
  self->_GLuint programName = a3;
}

- (char)vshStrings
{
  return self->_vshStrings;
}

- (void)setVshStrings:(char *)a3
{
  self->_vshStrings = a3;
}

- (char)fshStrings
{
  return self->_fshStrings;
}

- (void)setFshStrings:(char *)a3
{
  self->_fshStrings = a3;
}

- (unsigned)numVshStrings
{
  return self->_numVshStrings;
}

- (void)setNumVshStrings:(unsigned int)a3
{
  self->_uint64_t numVshStrings = a3;
}

- (unsigned)numFshStrings
{
  return self->_numFshStrings;
}

- (void)setNumFshStrings:(unsigned int)a3
{
  self->_uint64_t numFshStrings = a3;
}

- (unint64_t)dirtyUniforms
{
  return self->_dirtyUniforms;
}

- (void)setDirtyUniforms:(unint64_t)a3
{
  self->_dirtyUniforms = a3;
}

- (BOOL)textureOrderStale
{
  return self->_textureOrderStale;
}

- (void)setTextureOrderStale:(BOOL)a3
{
  self->_textureOrderStale = a3;
}

- (int)lightModelAmbientColorLoc
{
  return self->_lightModelAmbientColorLoc;
}

- (void)setLightModelAmbientColorLoc:(int)a3
{
  self->_lightModelAmbientColorLoc = a3;
}

- (int)baseLightingColorLoc
{
  return self->_baseLightingColorLoc;
}

- (void)setBaseLightingColorLoc:(int)a3
{
  self->_baseLightingColorLoc = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (GLKBigInt_s)fshMask
{
  return self->_fshMask;
}

- (void)setFshMask:(GLKBigInt_s *)a3
{
  self->_fshMasuint64_t k = a3;
}

- (GLKBigInt_s)vshMask
{
  return self->_vshMask;
}

- (void)setVshMask:(GLKBigInt_s *)a3
{
  self->_vshMasuint64_t k = a3;
}

- (GLKBigInt_s)prevFshMask
{
  unint64_t n1 = self->_prevFshMask.n1;
  unint64_t n0 = self->_prevFshMask.n0;
  result.unint64_t n1 = n1;
  result.unint64_t n0 = n0;
  return result;
}

- (void)setPrevFshMask:(GLKBigInt_s)a3
{
  self->_prevFshMasuint64_t k = a3;
}

- (GLKBigInt_s)prevVshMask
{
  unint64_t n1 = self->_prevVshMask.n1;
  unint64_t n0 = self->_prevVshMask.n0;
  result.unint64_t n1 = n1;
  result.unint64_t n0 = n0;
  return result;
}

- (void)setPrevVshMask:(GLKBigInt_s)a3
{
  self->_prevVshMasuint64_t k = a3;
}

@end