@interface SCNGeometry
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (BOOL)supportsSecureCoding;
+ (SCNGeometry)geometry;
+ (SCNGeometry)geometryWithGeometryRef:(__C3DGeometry *)a3;
+ (SCNGeometry)geometryWithMDLMesh:(MDLMesh *)mdlMesh;
+ (SCNGeometry)geometryWithMDLMesh:(id)a3 options:(id)a4;
+ (SCNGeometry)geometryWithMDLMesh:(id)a3 submesh:(id)a4 options:(id)a5;
+ (SCNGeometry)geometryWithSources:(NSArray *)sources elements:(NSArray *)elements;
+ (SCNGeometry)geometryWithSources:(id)a3 elements:(id)a4 sourceChannels:(id)a5;
+ (id)boxWithWidth:(double)a3 height:(double)a4 length:(double)a5 cornerRadius:(double)a6 options:(id)a7;
+ (id)capsuleWithRadius:(double)a3 height:(double)a4 options:(id)a5;
+ (id)coneWithHeight:(double)a3 topRadius:(double)a4 bottomRadius:(double)a5 options:(id)a6;
+ (id)cylinderWithRadius:(double)a3 height:(double)a4 options:(id)a5;
+ (id)floorWithOptions:(id)a3;
+ (id)morpherWithMDLMesh:(id)a3;
+ (id)planeWithWidth:(double)a3 height:(double)a4 options:(id)a5;
+ (id)pyramidWithWidth:(double)a3 height:(double)a4 length:(double)a5 options:(id)a6;
+ (id)sphereWithRadius:(double)a3 options:(id)a4;
+ (id)torusWithRingRadius:(double)a3 pipeRadius:(double)a4 options:(id)a5;
+ (id)tubeWithInnerRadius:(double)a3 outerRadius:(double)a4 height:(double)a5 options:(id)a6;
- ($DCA043AFB23218D33360BC4455B4EE77)_subdivisionSettings;
- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4;
- (BOOL)_hasFixedBoundingBoxExtrema;
- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4;
- (BOOL)getBoundingSphereCenter:(SCNVector3 *)a3 radius:(double *)a4;
- (BOOL)isAnimationForKeyPaused:(id)a3;
- (BOOL)isPausedOrPausedByInheritance;
- (BOOL)isPresentationInstance;
- (BOOL)parseSpecialKey:(id)a3 withPath:(id)a4 intoDestination:(id *)a5 remainingPath:(id *)a6;
- (BOOL)simdGetBoundingSphereCenter:(SCNGeometry *)self radius:(SEL)a2;
- (BOOL)wantsAdaptiveSubdivision;
- (NSArray)animationKeys;
- (NSArray)geometryElements;
- (NSArray)geometrySourceChannels;
- (NSArray)geometrySources;
- (NSArray)geometrySourcesForSemantic:(SCNGeometrySourceSemantic)semantic;
- (NSArray)levelsOfDetail;
- (NSArray)materials;
- (NSDictionary)shaderModifiers;
- (NSInteger)geometryElementCount;
- (NSNumber)minimumLanguageVersion;
- (NSString)description;
- (NSString)name;
- (NSUInteger)subdivisionLevel;
- (SCNGeometry)init;
- (SCNGeometry)initWithCoder:(id)a3;
- (SCNGeometry)initWithGeometryRef:(__C3DGeometry *)a3;
- (SCNGeometryElement)edgeCreasesElement;
- (SCNGeometryElement)geometryElementAtIndex:(NSInteger)elementIndex;
- (SCNGeometrySource)edgeCreasesSource;
- (SCNGeometryTessellator)tessellator;
- (SCNMaterial)firstMaterial;
- (SCNMaterial)materialWithName:(NSString *)name;
- (SCNProgram)program;
- (__C3DAnimationManager)animationManager;
- (__C3DGeometry)geometryRef;
- (__C3DMaterial)materialRef;
- (__C3DMaterial)materialRefCreateIfNeeded;
- (__C3DScene)sceneRef;
- (id)__shadableHelper;
- (id)_firstMaterial;
- (id)_geometryByAddingSourcesOfSkinner:(id)a3;
- (id)_geometryByRemovingSkinnerSources;
- (id)_geometryByUnifyingNormalsWithCreaseThreshold:(double)a3;
- (id)_geometryByWeldingVerticesWithThreshold:(double)a3 normalThreshold:(double)a4;
- (id)_materialWithName:(id)a3;
- (id)_renderableCopy;
- (id)_scnAnimationForKey:(id)a3;
- (id)_scnBindings;
- (id)animationForKey:(id)a3;
- (id)animationPlayerForKey:(id)a3;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customMaterialAttributeNames;
- (id)customMaterialAttributes;
- (id)customMaterialProperties;
- (id)customMaterialPropertyNames;
- (id)debugQuickLookData;
- (id)debugQuickLookObject;
- (id)geometryDescription;
- (id)geometrySourceForSemantic:(id)a3;
- (id)getBoundingBox;
- (id)getBoundingSphere;
- (id)identifier;
- (id)initPresentationGeometryWithGeometryRef:(__C3DGeometry *)a3;
- (id)interleavedCopy;
- (id)keyForNodeAttributes;
- (id)mutableCopy;
- (id)mutableMaterials;
- (id)objectInMaterialsAtIndex:(unint64_t)a3;
- (id)presentationGeometry;
- (id)scene;
- (id)shaderModifiersArgumentsNames;
- (id)valueForUndefinedKey:(id)a3;
- (int64_t)primitiveType;
- (unint64_t)countOfMaterials;
- (void)__CFObject;
- (void)_copyAnimationsFrom:(id)a3;
- (void)_copyAttributesTo:(id)a3;
- (void)_customDecodingOfSCNGeometry:(id)a3;
- (void)_customEncodingOfSCNGeometry:(id)a3;
- (void)_discardOriginalTopology;
- (void)_expand;
- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5;
- (void)_releaseCachedSourcesAndElements;
- (void)_setGeometryRef:(__C3DGeometry *)a3;
- (void)_setupGeometryElements;
- (void)_setupGeometrySources;
- (void)_setupObjCModelFrom:(id)a3;
- (void)_setupShadableHelperIfNeeded;
- (void)_shadableSetValue:(id)a3 forUndefinedKey:(id)a4;
- (void)_syncEntityObjCModel;
- (void)_syncObjCAnimations;
- (void)_syncObjCModel;
- (void)_unifyNormals;
- (void)addAnimation:(id)a3;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)addAnimationPlayer:(id)a3 forKey:(id)a4;
- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6;
- (void)copyShaderModifiersAndLanguageVersionFrom:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleBindingOfSymbol:(id)a3 usingBlock:(id)a4;
- (void)handleUnbindingOfSymbol:(id)a3 usingBlock:(id)a4;
- (void)insertObject:(id)a3 inMaterialsAtIndex:(unint64_t)a4;
- (void)pauseAnimationForKey:(id)a3;
- (void)removeAllAnimations;
- (void)removeAllAnimationsWithBlendOutDuration:(double)a3;
- (void)removeAllBindings;
- (void)removeAllMaterials;
- (void)removeAnimationForKey:(id)a3;
- (void)removeAnimationForKey:(id)a3 blendOutDuration:(double)a4;
- (void)removeMaterial:(id)a3;
- (void)removeObjectFromMaterialsAtIndex:(unint64_t)a3;
- (void)replaceMaterial:(id)a3 with:(id)a4;
- (void)replaceObjectInMaterialsAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)resumeAnimationForKey:(id)a3;
- (void)setBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4;
- (void)setEdgeCreasesElement:(SCNGeometryElement *)edgeCreasesElement;
- (void)setEdgeCreasesSource:(SCNGeometrySource *)edgeCreasesSource;
- (void)setFirstMaterial:(SCNMaterial *)firstMaterial;
- (void)setGeometryRef:(__C3DGeometry *)a3;
- (void)setIdentifier:(id)a3;
- (void)setLevelsOfDetail:(NSArray *)levelsOfDetail;
- (void)setMaterials:(NSArray *)materials;
- (void)setMinimumLanguageVersion:(id)a3;
- (void)setName:(NSString *)name;
- (void)setPrimitiveType:(int64_t)a3;
- (void)setProgram:(id)a3;
- (void)setShaderModifiers:(id)a3;
- (void)setSpeed:(double)a3 forAnimationKey:(id)a4;
- (void)setSubdivisionLevel:(NSUInteger)subdivisionLevel;
- (void)setTessellator:(SCNGeometryTessellator *)tessellator;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)setValueForKey:(id)a3 optionKey:(id)a4 options:(id)a5;
- (void)setWantsAdaptiveSubdivision:(BOOL)wantsAdaptiveSubdivision;
- (void)set_subdivisionSettings:(id)a3;
- (void)unbindAnimatablePath:(id)a3;
@end

@implementation SCNGeometry

- (__C3DScene)sceneRef
{
  v2 = [(SCNGeometry *)self __CFObject];

  return (__C3DScene *)C3DGetScene(v2);
}

- (void)__CFObject
{
  return self->_geometry;
}

CFStringRef __23__SCNGeometry_setName___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  CFStringRef v3 = *(const __CFString **)(a1 + 40);

  return C3DEntitySetName(v2, v3);
}

- (SCNMaterial)firstMaterial
{
  result = [(SCNGeometry *)self _firstMaterial];
  if (*((unsigned char *)self + 16))
  {
    return (SCNMaterial *)[(SCNMaterial *)result presentationMaterial];
  }
  return result;
}

- (id)_firstMaterial
{
  id v2 = [(SCNGeometry *)self mutableMaterials];
  if (!v2) {
    return 0;
  }
  CFStringRef v3 = v2;
  if (![v2 count]) {
    return 0;
  }

  return (id)[v3 objectAtIndex:0];
}

- (id)mutableMaterials
{
  id result = self->_materials;
  if (!result)
  {
    [(SCNGeometry *)self _expand];
    return self->_materials;
  }
  return result;
}

+ (SCNGeometry)geometryWithMDLMesh:(id)a3 options:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
  v30 = (_anonymous_namespace_ *)objc_alloc_init(MEMORY[0x263EFF980]);
  obuint64_t j = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  v46._meshElement = 0;
  v46._elementData = 0;
  uint64_t v45 = 0;
  v46.super.isa = (Class)&v46._meshElement;
  v43 = (uint64_t *)&v44;
  v44 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v7 = (void *)[a3 submeshes];
  uint64_t v10 = [v7 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if ([v13 indexCount])
        {
          v14 = +[SCNGeometryElement geometryElementWithMDLSubmesh:v13];
          if (v14) {
            [v6 addObject:v14];
          }
          v15 = (SCNMaterial *)objc_msgSend(v13, "material", v14);
          if (v15)
          {
            v15 = +[SCNMaterial materialWithMDLMaterial:v15 options:a4];
            if (v15) {
              [v31 addObject:v15];
            }
          }
          objc_msgSend(v13, "topology", v15);
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v10);
  }
  v16 = v30;
  v37 = 0;
  uint64_t v38 = 0;
  if (objc_msgSend((id)objc_msgSend(a3, "submeshes"), "count"))
  {
    unsigned int v17 = 0;
    uint64_t v18 = *MEMORY[0x263F135C8];
    while (1)
    {
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "vertexDescriptor"), "attributes"), "count") <= (unint64_t)v17)
      {
        unsigned int v28 = 0;
        goto LABEL_25;
      }
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "vertexDescriptor"), "attributes"), "objectAtIndexedSubscript:", v17), "name"), "containsString:", v18))break; {
      ++v17;
      }
    }
    unsigned int v28 = v17;
LABEL_25:
    id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v21 = [(NSMutableArray *)obj countByEnumeratingWithState:&v33 objects:&v46._primitiveType count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v33 + 1) + 8 * j);
          unint64_t v25 = [v24 unsignedLongValue];
          if (v25 >= objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "submeshes"), "objectAtIndexedSubscript:", 0), "faceIndexing"), "count"))uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v28); {
          else
          }
            uint64_t v26 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "submeshes"), "objectAtIndexedSubscript:", 0), "faceIndexing"), "objectAtIndexedSubscript:", objc_msgSend(v24, "integerValue"));
          [v20 addObject:v26];
        }
        uint64_t v21 = [(NSMutableArray *)obj countByEnumeratingWithState:&v33 objects:&v46._primitiveType count:16];
      }
      while (v21);
    }
    v16 = v30;
    if (v45) {
      objc_msgSend(v20, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v28));
    }
    v19 = (SCNGeometry *)[a1 geometryWithSources:v30 elements:v6 sourceChannels:v20];
  }
  else
  {
    v19 = (SCNGeometry *)[a1 geometryWithSources:v30 elements:v6];
  }
  -[SCNGeometry setName:](v19, "setName:", [a3 name]);
  [(SCNGeometry *)v19 setSubdivisionLevel:0];
  [(SCNGeometry *)v19 setEdgeCreasesElement:v37];
  [(SCNGeometry *)v19 setEdgeCreasesSource:v38];
  [(SCNGeometry *)v19 setMaterials:v31];

  std::__tree<char>::destroy((uint64_t)&v43, v44);
  std::__tree<char>::destroy((uint64_t)&v46, &v46._meshElement->var0.var0.var0);
  return v19;
}

- (void)setMaterials:(NSArray *)materials
{
  [(SCNGeometry *)self removeAllMaterials];
  NSUInteger v5 = [(NSArray *)materials count];
  if (v5)
  {
    NSUInteger v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      [(SCNGeometry *)self insertMaterial:[(NSArray *)materials objectAtIndex:i] atIndex:i];
  }
}

- (void)removeAllMaterials
{
  [(NSMutableArray *)self->_materials removeAllObjects];
  CFStringRef v3 = [(SCNGeometry *)self sceneRef];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__SCNGeometry_removeAllMaterials__block_invoke;
  v4[3] = &unk_264005010;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:v3 object:self applyBlock:v4];
  if (!self->_materials) {
    self->_materials = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  }
}

- (void)insertObject:(id)a3 inMaterialsAtIndex:(unint64_t)a4
{
  if (!a3)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[SCNGeometry insertObject:inMaterialsAtIndex:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  materials = self->_materials;
  if (!materials)
  {
    [(SCNGeometry *)self _expand];
    materials = self->_materials;
  }
  [(NSMutableArray *)materials insertObject:a3 atIndex:a4];
  v16 = [(SCNGeometry *)self sceneRef];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __47__SCNGeometry_insertObject_inMaterialsAtIndex___block_invoke;
  v17[3] = &unk_264004E20;
  v17[4] = self;
  v17[5] = a3;
  v17[6] = a4;
  +[SCNTransaction postCommandWithContext:v16 object:self applyBlock:v17];
}

void __47__SCNGeometry_insertObject_inMaterialsAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  CFStringRef v3 = (void *)[*(id *)(a1 + 40) materialRef];
  CFIndex v4 = *(void *)(a1 + 48);

  C3DGeometryInsertMaterialAtIndex(v2, v3, v4);
}

- (void)setSubdivisionLevel:(NSUInteger)subdivisionLevel
{
  if (subdivisionLevel <= 0x7FFFFFFFFFFFFFFELL)
  {
    v9[10] = v3;
    v9[11] = v4;
    if (self->_subdivisionLevel != subdivisionLevel)
    {
      self->_subdivisionLevel = subdivisionLevel;
      tessellator = self->_tessellator;
      if (tessellator) {
        [(SCNGeometryTessellator *)tessellator tessellatorValueDidChangeForClient:self];
      }
      uint64_t v8 = [(SCNGeometry *)self sceneRef];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __35__SCNGeometry_setSubdivisionLevel___block_invoke;
      v9[3] = &unk_264004FC0;
      v9[4] = self;
      v9[5] = subdivisionLevel;
      +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v9];
    }
  }
}

- (void)setName:(NSString *)name
{
  if (*((unsigned char *)self + 16))
  {
    NSUInteger v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNGeometry setName:]();
    }
  }
  else if ((unint64_t)name | (unint64_t)self->_name)
  {
    if ((-[NSString isEqual:](name, "isEqual:") & 1) == 0)
    {

      self->_name = (NSString *)[(NSString *)name copy];
      NSUInteger v5 = [(SCNGeometry *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __23__SCNGeometry_setName___block_invoke;
      v7[3] = &unk_264006160;
      v7[4] = self;
      v7[5] = name;
      +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
    }
  }
}

- (void)setEdgeCreasesSource:(SCNGeometrySource *)edgeCreasesSource
{
  uint64_t v3 = self->_edgeCreasesSource;
  if (v3 != edgeCreasesSource)
  {
    if (!edgeCreasesSource)
    {
LABEL_5:

      self->_edgeCreasesSource = edgeCreasesSource;
      NSUInteger v6 = [(SCNGeometry *)self sceneRef];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __36__SCNGeometry_setEdgeCreasesSource___block_invoke;
      v15[3] = &unk_264005010;
      v15[4] = self;
      +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v15];
      return;
    }
    if ([(NSString *)[(SCNGeometrySource *)edgeCreasesSource semantic] isEqualToString:@"kGeometrySourceSemanticEdgeCrease"])
    {
      uint64_t v3 = self->_edgeCreasesSource;
      goto LABEL_5;
    }
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNGeometry setEdgeCreasesSource:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)setEdgeCreasesElement:(SCNGeometryElement *)edgeCreasesElement
{
  uint64_t v3 = self->_edgeCreasesElement;
  if (v3 != edgeCreasesElement)
  {
    if (!edgeCreasesElement)
    {
LABEL_5:

      self->_edgeCreasesElement = edgeCreasesElement;
      NSUInteger v6 = [(SCNGeometry *)self sceneRef];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __37__SCNGeometry_setEdgeCreasesElement___block_invoke;
      v15[3] = &unk_264005010;
      v15[4] = self;
      +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v15];
      return;
    }
    if ([(SCNGeometryElement *)edgeCreasesElement primitiveType] == SCNGeometryPrimitiveTypeLine)
    {
      uint64_t v3 = self->_edgeCreasesElement;
      goto LABEL_5;
    }
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNGeometry setEdgeCreasesElement:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

+ (SCNGeometry)geometryWithSources:(id)a3 elements:(id)a4 sourceChannels:(id)a5
{
  Class v29 = (Class)a1;
  id v30 = a5;
  uint64_t v41 = *MEMORY[0x263EF8340];
  v7 = (const void *)C3DGeometryCreate();
  Default = (void *)C3DMaterialCreateDefault();
  C3DGeometryAppendMaterial((uint64_t)v7, Default);
  CFRelease(Default);
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFIndex v10 = [a3 count];
  uint64_t v11 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
  Mutable = CFArrayCreateMutable(v9, v10, MEMORY[0x263EFFF70]);
  uint64_t v13 = CFArrayCreateMutable(v9, [a4 count], v11);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v14 = [a3 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(a3);
        }
        uint64_t v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        objc_msgSend(v18, "_clearC3DCache", v29);
        CFArrayAppendValue(Mutable, (const void *)[v18 meshSource]);
      }
      uint64_t v15 = [a3 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v15);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v19 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v31, v39, 16, v29);
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(a4);
        }
        CFArrayAppendValue(v13, (const void *)[*(id *)(*((void *)&v31 + 1) + 8 * j) meshElement]);
      }
      uint64_t v20 = [a4 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v20);
  }
  size_t v23 = [a3 count];
  v24 = (char *)&v29 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v25 = v30;
  __buildSourceChannels(v30, v23, a4, v24);
  uint64_t v26 = (uint64_t *)C3DMeshCreateWithMeshSourcesAndMeshElements(Mutable, v13, (uint64_t)v24);
  C3DGeometrySetMesh((uint64_t)v7, v26);
  CFRelease(Mutable);
  CFRelease(v13);
  CFRelease(v26);
  v27 = (void *)[[v29 alloc] initWithGeometryRef:v7];
  v27[5] = [v25 copy];
  if (v7) {
    CFRelease(v7);
  }
  return (SCNGeometry *)v27;
}

- (SCNGeometry)initWithGeometryRef:(__C3DGeometry *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNGeometry;
  uint64_t v4 = [(SCNGeometry *)&v7 init];
  if (v4)
  {
    NSUInteger v5 = (__C3DGeometry *)CFRetain(a3);
    v4->_geometry = v5;
    if (v5) {
      C3DEntitySetObjCWrapper((uint64_t)v5, v4);
    }
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    v4->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
    [(SCNGeometry *)v4 _syncObjCModel];
    [(SCNGeometry *)v4 _syncObjCAnimations];
  }
  return v4;
}

- (void)_syncObjCModel
{
  [(SCNGeometry *)self _syncEntityObjCModel];
  self->_subdivisionIsAdaptive = C3DGeometryOsdGetWantsAdaptiveSubdivision((uint64_t)self->_geometry);
  self->_subdivisionSettings = ($FB11F3FFE165EAA867AAC892096804C2)C3DGeometryOsdGetSubdivisionSettings((uint64_t)self->_geometry);

  self->_edgeCreasesSource = 0;
  EdgeCreasesSource = (id *)C3DGeometryOsdGetEdgeCreasesSource((uint64_t)self->_geometry);
  if (EdgeCreasesSource)
  {
    uint64_t v4 = EdgeCreasesSource;
    ObjCWrapper = C3DEntityGetObjCWrapper(EdgeCreasesSource);
    if (ObjCWrapper) {
      NSUInteger v6 = ObjCWrapper;
    }
    else {
      NSUInteger v6 = [[SCNGeometrySource alloc] initWithMeshSource:v4];
    }
    self->_edgeCreasesSource = v6;
  }

  self->_edgeCreasesElement = 0;
  EdgeCreasesElement = (id *)C3DGeometryOsdGetEdgeCreasesElement((uint64_t)self->_geometry);
  if (EdgeCreasesElement)
  {
    uint64_t v8 = EdgeCreasesElement;
    CFAllocatorRef v9 = C3DEntityGetObjCWrapper(EdgeCreasesElement);
    if (v9) {
      CFIndex v10 = v9;
    }
    else {
      CFIndex v10 = [[SCNGeometryElement alloc] initWithMeshElement:v8];
    }
    self->_edgeCreasesElement = v10;
  }
}

- (void)_syncObjCAnimations
{
  uint64_t v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  os_unfair_lock_lock(&self->_animationsLock);

  self->_animations = objc_alloc_init(SCNOrderedDictionary);
  os_unfair_lock_unlock(&self->_animationsLock);
  NSUInteger v5 = [(SCNGeometry *)self __CFObject];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    if ((CFTypeIsC3DEntity(v5) & 1) == 0)
    {
      objc_super v7 = scn_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        [(SCNNode *)v7 _syncObjCAnimations];
      }
    }
    CFDictionaryRef Animations = C3DEntityGetAnimations(v6);
    if (Animations)
    {
      CFDictionaryRef v16 = Animations;
      os_unfair_lock_lock(&self->_animationsLock);
      C3DOrderedDictionaryApplyFunction(v16, (const char *)SCNConvertC3DAnimationDictionaryFunc, (uint64_t)self->_animations);
      os_unfair_lock_unlock(&self->_animationsLock);
    }
  }
  if (v4) {
    C3DSceneUnlock(v4);
  }
}

- (void)_syncEntityObjCModel
{
  uint64_t v3 = [(SCNGeometry *)self __CFObject];

  self->_name = (NSString *)(id)C3DEntityGetName((uint64_t)v3);
}

- (id)copy
{
  return [(SCNGeometry *)self copyWithZone:0];
}

- (void)_setupObjCModelFrom:(id)a3
{
  +[SCNTransaction begin];
  +[SCNTransaction setImmediateMode:1];
  -[SCNGeometry setLevelsOfDetail:](self, "setLevelsOfDetail:", [a3 levelsOfDetail]);
  -[SCNGeometry setMaterials:](self, "setMaterials:", [a3 materials]);
  -[SCNGeometry setSubdivisionLevel:](self, "setSubdivisionLevel:", [a3 subdivisionLevel]);
  -[SCNGeometry setWantsAdaptiveSubdivision:](self, "setWantsAdaptiveSubdivision:", [a3 wantsAdaptiveSubdivision]);
  -[SCNGeometry set_subdivisionSettings:](self, "set_subdivisionSettings:", [a3 _subdivisionSettings]);
  [(SCNGeometry *)self _copyAnimationsFrom:a3];
  os_unfair_lock_lock((os_unfair_lock_t)a3 + 38);
  NSUInteger v5 = (void *)*((void *)a3 + 18);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__SCNGeometry__setupObjCModelFrom___block_invoke;
  v6[3] = &unk_264006110;
  v6[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v6];
  os_unfair_lock_unlock((os_unfair_lock_t)a3 + 38);
  -[SCNGeometry setTessellator:](self, "setTessellator:", [a3 tessellator]);
  +[SCNTransaction commitImmediate];
}

- (BOOL)wantsAdaptiveSubdivision
{
  return self->_subdivisionIsAdaptive;
}

- (SCNGeometryTessellator)tessellator
{
  return self->_tessellator;
}

- (NSUInteger)subdivisionLevel
{
  return self->_subdivisionLevel;
}

- (void)set_subdivisionSettings:(id)a3
{
  $DCA043AFB23218D33360BC4455B4EE77 v8 = a3;
  if (a3 != *(_DWORD *)&self->_subdivisionSettings)
  {
    self->_subdivisionSettings = ($FB11F3FFE165EAA867AAC892096804C2)a3;
    NSUInteger v5 = [(SCNGeometry *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __39__SCNGeometry_set_subdivisionSettings___block_invoke;
    v6[3] = &unk_264009038;
    v6[4] = self;
    $DCA043AFB23218D33360BC4455B4EE77 v7 = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

- (void)setWantsAdaptiveSubdivision:(BOOL)wantsAdaptiveSubdivision
{
  if (self->_subdivisionIsAdaptive != wantsAdaptiveSubdivision)
  {
    self->_subdivisionIsAdaptive = wantsAdaptiveSubdivision;
    NSUInteger v5 = [(SCNGeometry *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __43__SCNGeometry_setWantsAdaptiveSubdivision___block_invoke;
    v6[3] = &unk_264004FE8;
    v6[4] = self;
    BOOL v7 = wantsAdaptiveSubdivision;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

- (void)setTessellator:(SCNGeometryTessellator *)tessellator
{
  uint64_t v4 = self->_tessellator;
  if (v4 != tessellator)
  {
    [(SCNGeometryTessellator *)v4 removeClient:self];

    uint64_t v6 = tessellator;
    self->_tessellator = v6;
    [(SCNGeometryTessellator *)v6 addClient:self];
  }
}

- (void)setLevelsOfDetail:(NSArray *)levelsOfDetail
{
  uint64_t v3 = self->_levelsOfDetail;
  if (v3 != levelsOfDetail)
  {

    self->_levelsOfDetail = (NSArray *)[(NSArray *)levelsOfDetail copy];
    uint64_t v6 = [(NSArray *)levelsOfDetail sortedArrayUsingComparator:&__block_literal_global_82];
    BOOL v7 = [(SCNGeometry *)self sceneRef];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __33__SCNGeometry_setLevelsOfDetail___block_invoke_2;
    v8[3] = &unk_264006160;
    v8[4] = v6;
    v8[5] = self;
    +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v8];
  }
}

- (NSArray)materials
{
  if (!self->_materials) {
    [(SCNGeometry *)self _expand];
  }
  materials = self->_materials;
  if (*((unsigned char *)self + 16))
  {
    uint64_t v5 = [(NSMutableArray *)materials count];
    uint64_t v4 = (NSArray *)(id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v5];
    if (v5 >= 1)
    {
      for (uint64_t i = 0; i != v5; ++i)
        -[NSArray addObject:](v4, "addObject:", objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_materials, "objectAtIndex:", i), "presentationMaterial"));
    }
  }
  else
  {
    uint64_t v4 = (NSArray *)(id)[(NSMutableArray *)materials copy];
  }
  if ([(NSArray *)v4 count]) {
    return v4;
  }
  else {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
}

- (NSArray)levelsOfDetail
{
  return self->_levelsOfDetail;
}

- ($DCA043AFB23218D33360BC4455B4EE77)_subdivisionSettings
{
  return ($DCA043AFB23218D33360BC4455B4EE77)self->_subdivisionSettings;
}

- (void)_copyAnimationsFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = objc_msgSend(a3, "animationKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend((id)objc_msgSend(a3, "animationPlayerForKey:", v10), "copy");
        [(SCNGeometry *)self addAnimationPlayer:v11 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (NSArray)animationKeys
{
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  uint64_t v4 = [(SCNOrderedDictionary *)self->_animations allKeys];
  os_unfair_lock_unlock(p_animationsLock);
  if ([(NSArray *)v4 count]) {
    return v4;
  }
  else {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  Copy = (const void *)C3DGeometryCreateCopy([(SCNGeometry *)self geometryRef]);
  uint64_t v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGeometryRef:Copy];
  if (Copy) {
    CFRelease(Copy);
  }
  [v5 _setupObjCModelFrom:self];
  [(SCNGeometry *)self _copyAttributesTo:v5];
  return v5;
}

void __33__SCNGeometry_removeAllMaterials__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) geometryRef];
  if (v1)
  {
    C3DGeometryRemoveAllMaterials(v1);
  }
}

- (__C3DGeometry)geometryRef
{
  return self->_geometry;
}

- (void)_copyAttributesTo:(id)a3
{
  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_valuesForUndefinedKeys copy];
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__SCNGeometry__copyAttributesTo___block_invoke;
  v7[3] = &unk_264006110;
  v7[4] = a3;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];

  [a3 copyShaderModifiersAndLanguageVersionFrom:self];
}

- (void)copyShaderModifiersAndLanguageVersionFrom:(id)a3
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNGeometry copyShaderModifiersAndLanguageVersionFrom:]();
    }
  }
  else
  {
    if ([a3 shaderModifiers]) {
      [(SCNGeometry *)self _setupShadableHelperIfNeeded];
    }
    uint64_t v5 = objc_msgSend(a3, "__shadableHelper");
    [(SCNShadableHelper *)self->_shadableHelper copyModifiersFrom:v5];
    uint64_t v6 = [v5 minimumLanguageVersion];
    shadableHelper = self->_shadableHelper;
    [(SCNShadableHelper *)shadableHelper setMinimumLanguageVersion:v6];
  }
}

- (NSDictionary)shaderModifiers
{
  return [(SCNShadableHelper *)self->_shadableHelper shaderModifiers];
}

- (id)__shadableHelper
{
  return self->_shadableHelper;
}

+ (SCNGeometry)geometryWithMDLMesh:(id)a3 submesh:(id)a4 options:(id)a5
{
  uint64_t v5 = 0;
  if (a3 && a4)
  {
    if ([a4 indexCount])
    {
      id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v12 = (_anonymous_namespace_ *)objc_alloc_init(MEMORY[0x263EFF980]);
      long long v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      long long v14 = +[SCNGeometryElement geometryElementWithMDLSubmesh:a4];
      if (v14) {
        [v10 addObject:v14];
      }
      uint64_t v15 = [a4 material];
      if (v15)
      {
        CFDictionaryRef v16 = +[SCNMaterial materialWithMDLMaterial:v15 option:a5];
        if (v16) {
          [v11 addObject:v16];
        }
      }
      v24._meshElement = 0;
      v24._elementData = 0;
      v23[1] = 0;
      v24.super.isa = (Class)&v24._meshElement;
      uint64_t v22 = (uint64_t *)v23;
      v23[0] = 0;
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      uint64_t v5 = (SCNGeometry *)[a1 geometryWithSources:v12 elements:v10];
      -[SCNGeometry setName:](v5, "setName:", [a3 name]);
      [(SCNGeometry *)v5 setSubdivisionLevel:0];
      [(SCNGeometry *)v5 setEdgeCreasesElement:v20];
      [(SCNGeometry *)v5 setEdgeCreasesSource:v21];
      [(SCNGeometry *)v5 setMaterials:v11];

      std::__tree<char>::destroy((uint64_t)&v22, v23[0]);
      std::__tree<char>::destroy((uint64_t)&v24, &v24._meshElement->var0.var0.var0);
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

+ (SCNGeometry)geometryWithMDLMesh:(MDLMesh *)mdlMesh
{
  return (SCNGeometry *)[a1 geometryWithMDLMesh:mdlMesh options:0];
}

+ (id)morpherWithMDLMesh:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)[a3 vertexDescriptor];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v7 = (void *)[v4 attributes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v44;
    uint64_t v11 = *MEMORY[0x263F135C8];
    uint64_t v12 = *MEMORY[0x263F135B8];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v44 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v14 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if ([v14 format])
        {
          if (objc_msgSend((id)objc_msgSend(v14, "name"), "containsString:", v11)) {
            [v5 addObject:v14];
          }
          if (objc_msgSend((id)objc_msgSend(v14, "name"), "containsString:", v12)) {
            [v6 addObject:v14];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v9);
  }
  if ([v5 count])
  {
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v16 = [v5 countByEnumeratingWithState:&v39 objects:v50 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v15, "addObject:", +[SCNGeometrySource geometrySourceWithMDLVertexAttribute:mesh:](SCNGeometrySource, "geometrySourceWithMDLVertexAttribute:mesh:", *(void *)(*((void *)&v39 + 1) + 8 * j), a3));
        }
        uint64_t v17 = [v5 countByEnumeratingWithState:&v39 objects:v50 count:16];
      }
      while (v17);
    }
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v21 = [v6 countByEnumeratingWithState:&v35 objects:v49 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v36;
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v36 != v23) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(v20, "addObject:", +[SCNGeometrySource geometrySourceWithMDLVertexAttribute:mesh:](SCNGeometrySource, "geometrySourceWithMDLVertexAttribute:mesh:", *(void *)(*((void *)&v35 + 1) + 8 * k), a3));
        }
        uint64_t v22 = [v6 countByEnumeratingWithState:&v35 objects:v49 count:16];
      }
      while (v22);
    }
    uint64_t v25 = [a1 geometryWithMDLMesh:a3];
    uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v15, "count"));
    if ([v5 count] == 1)
    {
      [v26 addObject:v25];
    }
    else
    {
      uint64_t v28 = [v15 count];
      uint64_t v29 = [v20 count];
      uint64_t v30 = [v15 count];
      if (v28 == v29)
      {
        if (v30)
        {
          unint64_t v31 = 0;
          do
          {
            v48[0] = [v15 objectAtIndexedSubscript:v31];
            v48[1] = [v20 objectAtIndexedSubscript:v31];
            objc_msgSend(v26, "addObject:", +[SCNGeometry geometryWithSources:elements:](SCNGeometry, "geometryWithSources:elements:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v48, 2), 0));
            ++v31;
          }
          while (v31 < [v15 count]);
        }
      }
      else if (v30)
      {
        unint64_t v32 = 0;
        do
        {
          uint64_t v47 = [v15 objectAtIndexedSubscript:v32];
          objc_msgSend(v26, "addObject:", +[SCNGeometry geometryWithSources:elements:](SCNGeometry, "geometryWithSources:elements:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v47, 1), 0));
          ++v32;
        }
        while (v32 < [v15 count]);
      }
    }

    long long v33 = objc_alloc_init(SCNMorpher);
    [(SCNMorpher *)v33 setTargets:v26];

    return v33;
  }
  else
  {

    return 0;
  }
}

- (void)setValueForKey:(id)a3 optionKey:(id)a4 options:(id)a5
{
  uint64_t v7 = [a5 objectForKey:a4];
  if (v7)
  {
    [(SCNGeometry *)self setValue:v7 forKey:a3];
  }
}

+ (id)planeWithWidth:(double)a3 height:(double)a4 options:(id)a5
{
  id v6 = +[SCNPlane planeWithWidth:a3 height:a4];
  [(SCNGeometry *)v6 setValueForKey:@"widthSegmentCount" optionKey:@"kPrimitiveWidthSegments" options:a5];
  [(SCNGeometry *)v6 setValueForKey:@"heightSegmentCount" optionKey:@"kPrimitiveHeightSegments" options:a5];
  return v6;
}

+ (id)boxWithWidth:(double)a3 height:(double)a4 length:(double)a5 cornerRadius:(double)a6 options:(id)a7
{
  uint64_t v8 = +[SCNBox boxWithWidth:a3 height:a4 length:a5 chamferRadius:a6];
  [(SCNGeometry *)v8 setValueForKey:@"widthSegmentCount" optionKey:@"kPrimitiveWidthSegments" options:a7];
  [(SCNGeometry *)v8 setValueForKey:@"heightSegmentCount" optionKey:@"kPrimitiveHeightSegments" options:a7];
  [(SCNGeometry *)v8 setValueForKey:@"lengthSegmentCount" optionKey:@"kPrimitiveLengthSegments" options:a7];
  [(SCNGeometry *)v8 setValueForKey:@"chamferSegmentCount" optionKey:@"kPrimitiveChamferSegments" options:a7];
  return v8;
}

+ (id)pyramidWithWidth:(double)a3 height:(double)a4 length:(double)a5 options:(id)a6
{
  uint64_t v7 = +[SCNPyramid pyramidWithWidth:a3 height:a4 length:a5];
  [(SCNGeometry *)v7 setValueForKey:@"widthSegmentCount" optionKey:@"kPrimitiveWidthSegments" options:a6];
  [(SCNGeometry *)v7 setValueForKey:@"heightSegmentCount" optionKey:@"kPrimitiveHeightSegments" options:a6];
  [(SCNGeometry *)v7 setValueForKey:@"lengthSegmentCount" optionKey:@"kPrimitiveLengthSegments" options:a6];
  return v7;
}

+ (id)sphereWithRadius:(double)a3 options:(id)a4
{
  id v5 = +[SCNSphere sphereWithRadius:a3];
  [(SCNGeometry *)v5 setValueForKey:@"segmentCount" optionKey:@"kPrimitiveRotationSegments" options:a4];
  id v6 = (void *)[a4 objectForKey:@"kPrimitiveSphereType"];
  if (v6) {
    -[SCNSphere setGeodesic:](v5, "setGeodesic:", [v6 isEqualToString:@"kPrimitiveTypeGeosphere"]);
  }
  return v5;
}

+ (id)cylinderWithRadius:(double)a3 height:(double)a4 options:(id)a5
{
  id v6 = +[SCNCylinder cylinderWithRadius:a3 height:a4];
  [(SCNGeometry *)v6 setValueForKey:@"radialSegmentCount" optionKey:@"kPrimitiveRotationSegments" options:a5];
  [(SCNGeometry *)v6 setValueForKey:@"heightSegmentCount" optionKey:@"kPrimitiveHeightSegments" options:a5];
  return v6;
}

+ (id)coneWithHeight:(double)a3 topRadius:(double)a4 bottomRadius:(double)a5 options:(id)a6
{
  uint64_t v7 = +[SCNCone coneWithTopRadius:a4 bottomRadius:a5 height:a3];
  [(SCNGeometry *)v7 setValueForKey:@"radialSegmentCount" optionKey:@"kPrimitiveRotationSegments" options:a6];
  [(SCNGeometry *)v7 setValueForKey:@"heightSegmentCount" optionKey:@"kPrimitiveHeightSegments" options:a6];
  return v7;
}

+ (id)tubeWithInnerRadius:(double)a3 outerRadius:(double)a4 height:(double)a5 options:(id)a6
{
  uint64_t v7 = +[SCNTube tubeWithInnerRadius:a3 outerRadius:a4 height:a5];
  [(SCNGeometry *)v7 setValueForKey:@"radialSegmentCount" optionKey:@"kPrimitiveRotationSegments" options:a6];
  [(SCNGeometry *)v7 setValueForKey:@"heightSegmentCount" optionKey:@"kPrimitiveHeightSegments" options:a6];
  return v7;
}

+ (id)capsuleWithRadius:(double)a3 height:(double)a4 options:(id)a5
{
  id v6 = +[SCNCapsule capsuleWithCapRadius:a3 height:a4];
  [(SCNGeometry *)v6 setValueForKey:@"radialSegmentCount" optionKey:@"kPrimitiveRotationSegments" options:a5];
  [(SCNGeometry *)v6 setValueForKey:@"heightSegmentCount" optionKey:@"kPrimitiveHeightSegments" options:a5];
  return v6;
}

+ (id)torusWithRingRadius:(double)a3 pipeRadius:(double)a4 options:(id)a5
{
  id v6 = +[SCNTorus torusWithRingRadius:a3 pipeRadius:a4];
  [(SCNGeometry *)v6 setValueForKey:@"ringSegmentCount" optionKey:@"kPrimitiveRotationSegments" options:a5];
  [(SCNGeometry *)v6 setValueForKey:@"pipeSegmentCount" optionKey:@"kPrimitivePipeSegments" options:a5];
  return v6;
}

+ (id)floorWithOptions:(id)a3
{
  return +[SCNFloor floor];
}

- (SCNGeometry)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCNGeometry;
  uint64_t v2 = [(SCNGeometry *)&v5 init];
  if (v2)
  {
    uint64_t v3 = C3DGeometryCreate();
    v2->_geometry = (__C3DGeometry *)v3;
    if (v3) {
      C3DEntitySetObjCWrapper(v3, v2);
    }
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    v2->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
    [(SCNGeometry *)v2 _syncObjCModel];
  }
  return v2;
}

- (id)initPresentationGeometryWithGeometryRef:(__C3DGeometry *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNGeometry;
  uint64_t v4 = [(SCNGeometry *)&v7 init];
  objc_super v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4 + 16) |= 1u;
    v4->_geometry = (__C3DGeometry *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
    v5->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (SCNGeometry)geometryWithGeometryRef:(__C3DGeometry *)a3
{
  id result = (SCNGeometry *)C3DEntityGetObjCWrapper((id *)a3);
  if (!result)
  {
    id v6 = (void *)[objc_alloc((Class)a1) initWithGeometryRef:a3];
    return (SCNGeometry *)v6;
  }
  return result;
}

+ (SCNGeometry)geometry
{
  id v2 = objc_alloc_init((Class)a1);

  return (SCNGeometry *)v2;
}

- (void)dealloc
{
  geometry = self->_geometry;
  if (geometry)
  {
    if ((*((unsigned char *)self + 16) & 1) == 0)
    {
      C3DEntitySetObjCWrapper((uint64_t)geometry, 0);
      geometry = self->_geometry;
    }
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __22__SCNGeometry_dealloc__block_invoke;
    v5[3] = &__block_descriptor_40_e8_v16__0d8l;
    v5[4] = geometry;
    +[SCNTransaction postCommandWithContext:0 object:0 applyBlock:v5];
  }
  [(SCNGeometryTessellator *)self->_tessellator clientWillDie:self];

  [(SCNShadableHelper *)self->_shadableHelper ownerWillDie];
  free(self->_fixedBoundingBoxExtrema);
  v4.receiver = self;
  v4.super_class = (Class)SCNGeometry;
  [(SCNGeometry *)&v4 dealloc];
}

void __22__SCNGeometry_dealloc__block_invoke(uint64_t a1)
{
}

- (BOOL)isPresentationInstance
{
  return *((unsigned char *)self + 16) & 1;
}

- (NSString)name
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_name;
  }
  objc_super v4 = [(SCNGeometry *)self sceneRef];
  uint64_t v5 = (uint64_t)v4;
  if (v4) {
    C3DSceneLock((uint64_t)v4);
  }
  Name = (NSString *)C3DEntityGetName((uint64_t)[(SCNGeometry *)self __CFObject]);
  if (v5) {
    C3DSceneUnlock(v5);
  }
  return Name;
}

- (void)setIdentifier:(id)a3
{
  objc_super v4 = [(SCNGeometry *)self __CFObject];

  C3DEntitySetID((uint64_t)v4, a3);
}

- (id)identifier
{
  id v2 = [(SCNGeometry *)self __CFObject];

  return (id)C3DEntityGetID((uint64_t)v2);
}

- (id)geometryDescription
{
  uint64_t v3 = (void *)[MEMORY[0x263F089D8] string];
  NSUInteger v4 = [(NSString *)[(SCNGeometry *)self name] length];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  if (v4) {
    [v3 appendFormat:@"%@: %p '%@'", v6, self, -[SCNGeometry name](self, "name")];
  }
  else {
    [v3 appendFormat:@"%@: %p", v6, self, v8];
  }
  if ([(SCNGeometry *)self geometryElementCount] >= 2) {
    objc_msgSend(v3, "appendFormat:", @" | %d elements", -[SCNGeometry geometryElementCount](self, "geometryElementCount"));
  }
  return v3;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@>", -[SCNGeometry geometryDescription](self, "geometryDescription")];
}

- (void)_setGeometryRef:(__C3DGeometry *)a3
{
  uint64_t v3 = a3;
  geometry = self->_geometry;
  if (geometry)
  {
    C3DEntitySetObjCWrapper((uint64_t)geometry, 0);
    id v6 = self->_geometry;
    if (v6 == v3) {
      goto LABEL_10;
    }
    if (v6)
    {
      CFRelease(v6);
      self->_geometry = 0;
    }
    if (!v3) {
      goto LABEL_9;
    }
  }
  else if (!a3)
  {
    goto LABEL_10;
  }
  uint64_t v3 = (__C3DGeometry *)CFRetain(v3);
LABEL_9:
  self->_geometry = v3;
LABEL_10:
  if (v3)
  {
    C3DEntitySetObjCWrapper((uint64_t)v3, self);
  }
}

- (void)setGeometryRef:(__C3DGeometry *)a3
{
  if (self->_geometry != a3)
  {
    -[SCNGeometry _setGeometryRef:](self, "_setGeometryRef:");
    [(SCNGeometry *)self willChangeValueForKey:@"materials"];

    self->_materials = 0;
    [(SCNGeometry *)self didChangeValueForKey:@"materials"];
  }
}

- (id)presentationGeometry
{
  if ((*((unsigned char *)self + 16) & 1) == 0)
  {
    id v2 = (void *)[objc_alloc((Class)objc_opt_class()) initPresentationGeometryWithGeometryRef:*((void *)self + 1)];
    return v2;
  }
  return self;
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (void)_releaseCachedSourcesAndElements
{
  self->_sources = 0;
  self->_elements = 0;
}

+ (SCNGeometry)geometryWithSources:(NSArray *)sources elements:(NSArray *)elements
{
  return (SCNGeometry *)[a1 geometryWithSources:sources elements:elements sourceChannels:0];
}

- (void)_setupGeometrySources
{
  uint64_t v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  uint64_t v5 = self->_sources;
  self->_sources = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t Mesh = C3DGeometryGetMesh((uint64_t)self->_geometry);
  if (Mesh)
  {
    uint64_t v7 = Mesh;
    uint64_t v15 = -1;
    char v8 = C3DMeshUsesSameChannelForAllSources(Mesh, &v15);
    if (v15) {
      char v9 = 0;
    }
    else {
      char v9 = v8;
    }
    if (v9) {
      id v10 = 0;
    }
    else {
      id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    CFArrayRef v11 = C3DMeshCopyAllSources(v7, 0);
    uint64_t v12 = [(__CFArray *)v11 count];
    if (v12)
    {
      uint64_t v13 = v12;
      for (uint64_t i = 0; i != v13; ++i)
      {
        [(NSMutableArray *)self->_sources addObject:+[SCNGeometrySource geometrySourceWithMeshSourceRef:[(__CFArray *)v11 objectAtIndexedSubscript:i]]];
        if ((v9 & 1) == 0) {
          objc_msgSend(v10, "addObject:", objc_msgSend(NSNumber, "numberWithLong:", C3DMeshGetChannelForSourceAtIndex(v7, i)));
        }
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  self->_sourceChannels = (NSArray *)[v10 copy];
  if (v4) {
    C3DSceneUnlock(v4);
  }
}

- (void)_setupGeometryElements
{
  uint64_t v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  uint64_t Mesh = C3DGeometryGetMesh((uint64_t)self->_geometry);
  if (Mesh)
  {
    uint64_t v6 = Mesh;
    uint64_t v7 = self->_elements;
    self->_elements = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    CFArrayRef ElementsCount = C3DMeshGetElementsCount(v6);
    if ((uint64_t)ElementsCount >= 1)
    {
      CFArrayRef v9 = ElementsCount;
      for (CFIndex i = 0; (const __CFArray *)i != v9; ++i)
        [(NSMutableArray *)self->_elements addObject:+[SCNGeometryElement geometryElementWithMeshElementRef:C3DMeshGetElementAtIndex(v6, i, 0)]];
    }
  }
  if (v4)
  {
    C3DSceneUnlock(v4);
  }
}

- (NSArray)geometrySources
{
  id result = &self->_sources->super;
  if (!result)
  {
    [(SCNGeometry *)self _setupGeometrySources];
    return &self->_sources->super;
  }
  return result;
}

- (NSArray)geometrySourceChannels
{
  return self->_sourceChannels;
}

- (NSArray)geometrySourcesForSemantic:(SCNGeometrySourceSemantic)semantic
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(SCNGeometry *)self geometrySources];
  uint64_t v5 = (NSArray *)[MEMORY[0x263EFF980] arrayWithCapacity:1];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v10, "semantic"), "isEqualToString:", semantic)) {
          [(NSArray *)v5 addObject:v10];
        }
      }
      uint64_t v7 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  if (![(NSArray *)v5 count])
  {
    if (C3DWasLinkedBeforeMajorOSYear2015()) {
      return 0;
    }
    else {
      return (NSArray *)MEMORY[0x263EFFA68];
    }
  }
  return v5;
}

- (id)geometrySourceForSemantic:(id)a3
{
  NSLog(&cfstr_Geometrysource_0.isa, a2);
  uint64_t v5 = [(SCNGeometry *)self geometrySourcesForSemantic:a3];
  id result = [(NSArray *)v5 count];
  if (result)
  {
    return [(NSArray *)v5 objectAtIndex:0];
  }
  return result;
}

- (NSArray)geometryElements
{
  id result = &self->_elements->super;
  if (!result)
  {
    [(SCNGeometry *)self _setupGeometryElements];
    return &self->_elements->super;
  }
  return result;
}

- (NSInteger)geometryElementCount
{
  id v2 = [(SCNGeometry *)self geometryElements];

  return [(NSArray *)v2 count];
}

- (SCNGeometryElement)geometryElementAtIndex:(NSInteger)elementIndex
{
  uint64_t v4 = [(SCNGeometry *)self geometryElements];
  if ([(NSArray *)v4 count] <= elementIndex) {
    return 0;
  }

  return (SCNGeometryElement *)[(NSArray *)v4 objectAtIndexedSubscript:elementIndex];
}

- (BOOL)_hasFixedBoundingBoxExtrema
{
  return self->_fixedBoundingBoxExtrema != 0;
}

- (BOOL)getBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4
{
  fixedBoundingBoxExtrema = self->_fixedBoundingBoxExtrema;
  if (fixedBoundingBoxExtrema && (*((unsigned char *)self + 16) & 1) == 0)
  {
    if (a3)
    {
      uint64_t v8 = *(void *)&fixedBoundingBoxExtrema->x;
      a3->z = fixedBoundingBoxExtrema->z;
      *(void *)&a3->x = v8;
    }
    if (a4)
    {
      CFArrayRef v9 = self->_fixedBoundingBoxExtrema;
      uint64_t v10 = *(void *)&v9[1].x;
      a4->z = v9[1].z;
      *(void *)&a4->x = v10;
    }
    return 1;
  }
  long long v12 = [(SCNGeometry *)self sceneRef];
  uint64_t v13 = (uint64_t)v12;
  if (v12) {
    C3DSceneLock((uint64_t)v12);
  }
  if (![(SCNGeometry *)self geometryRef])
  {
    char v11 = 0;
    if (!v13) {
      return v11;
    }
    goto LABEL_16;
  }
  float v20 = 0.0;
  uint64_t v19 = 0;
  float v18 = 0.0;
  uint64_t v17 = 0;
  char v11 = C3DGetBoundingBox([(SCNGeometry *)self geometryRef], 1, (uint64_t)&v19, (uint64_t)&v17);
  if (a3)
  {
    float v14 = v20;
    *(void *)&a3->x = v19;
    a3->z = v14;
  }
  if (a4)
  {
    float v15 = v18;
    *(void *)&a4->x = v17;
    a4->z = v15;
  }
  if (v13) {
LABEL_16:
  }
    C3DSceneUnlock(v13);
  return v11;
}

- (void)setBoundingBoxMin:(SCNVector3 *)a3 max:(SCNVector3 *)a4
{
  if (*((unsigned char *)self + 16))
  {
    char v11 = scn_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SCNGeometry setBoundingBoxMin:max:]();
    }
  }
  else
  {
    fixedBoundingBoxExtrema = self->_fixedBoundingBoxExtrema;
    if (a3 && a4)
    {
      if (fixedBoundingBoxExtrema)
      {
        BOOL v8 = SCNVector3EqualToVector3(*a3, *fixedBoundingBoxExtrema);
        uint64_t v10 = self->_fixedBoundingBoxExtrema;
        if (v8)
        {
          if (SCNVector3EqualToVector3(*a4, v10[1])) {
            return;
          }
          uint64_t v10 = self->_fixedBoundingBoxExtrema;
        }
      }
      else
      {
        uint64_t v10 = (SCNVector3 *)malloc_type_malloc(0x18uLL, 0x10000403E1C8BA9uLL);
        self->_fixedBoundingBoxExtrema = v10;
      }
      uint64_t v14 = *(void *)&a3->x;
      v10->z = a3->z;
      *(void *)&v10->x = v14;
      float v15 = self->_fixedBoundingBoxExtrema;
      uint64_t v16 = *(void *)&a4->x;
      v15[1].z = a4->z;
      *(void *)&v15[1].x = v16;
      *(void *)&long long v9 = *(void *)&a3->x;
      DWORD2(v9) = LODWORD(a3->z);
      long long v18 = v9;
      DWORD2(v9) = LODWORD(a4->z);
      long long v12 = [(SCNGeometry *)self sceneRef];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __37__SCNGeometry_setBoundingBoxMin_max___block_invoke_2;
      v20[3] = &unk_2640087A8;
      long long v21 = v19;
      long long v22 = v17;
      uint64_t v23 = self;
      uint64_t v13 = v20;
    }
    else
    {
      if (!fixedBoundingBoxExtrema) {
        return;
      }
      free(fixedBoundingBoxExtrema);
      self->_fixedBoundingBoxExtrema = 0;
      long long v12 = [(SCNGeometry *)self sceneRef];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __37__SCNGeometry_setBoundingBoxMin_max___block_invoke;
      v24[3] = &unk_264005010;
      v24[4] = self;
      uint64_t v13 = v24;
    }
    +[SCNTransaction postCommandWithContext:v12 object:self applyBlock:v13];
  }
}

void __37__SCNGeometry_setBoundingBoxMin_max___block_invoke(uint64_t a1)
{
}

__n128 __37__SCNGeometry_setBoundingBoxMin_max___block_invoke_2(float32x4_t *a1)
{
  float32x4_t v1 = a1[2];
  float32x4_t v2 = a1[3];
  v3.i64[0] = 0x3F0000003F000000;
  v3.i64[1] = 0x3F0000003F000000;
  float32x4_t v4 = vmulq_f32(vaddq_f32(v1, v2), v3);
  float32x4_t v5 = vmulq_f32(vsubq_f32(v2, v1), v3);
  v4.i32[3] = 1.0;
  v5.i32[3] = 0;
  v7[0] = v4;
  v7[1] = v5;
  C3DGeometrySetBoundingBox(*(void *)(a1[4].i64[0] + 8), v7);
  return result;
}

- (BOOL)getBoundingSphereCenter:(SCNVector3 *)a3 radius:(double *)a4
{
  uint64_t v7 = [(SCNGeometry *)self sceneRef];
  uint64_t v8 = (uint64_t)v7;
  if (v7) {
    C3DSceneLock((uint64_t)v7);
  }
  long long v9 = [(SCNGeometry *)self geometryRef];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  if (!v9 || !C3DGetBoundingSphere(v9, 1, (uint64_t)&v13))
  {
    BOOL v11 = 0;
    if (!v8) {
      return v11;
    }
LABEL_12:
    C3DSceneUnlock(v8);
    return v11;
  }
  if (a3)
  {
    float v10 = *(float *)&v14;
    *(void *)&a3->x = v13;
    a3->z = v10;
  }
  if (a4) {
    *a4 = *((float *)&v14 + 1);
  }
  BOOL v11 = 1;
  if (v8) {
    goto LABEL_12;
  }
  return v11;
}

- (BOOL)simdGetBoundingSphereCenter:(SCNGeometry *)self radius:(SEL)a2
{
  float32x4_t v4 = v3;
  float32x4_t v5 = v2;
  uint64_t v7 = [(SCNGeometry *)self sceneRef];
  uint64_t v8 = (uint64_t)v7;
  if (v7) {
    C3DSceneLock((uint64_t)v7);
  }
  long long v9 = [(SCNGeometry *)self geometryRef];
  long long v12 = 0uLL;
  if (!v9 || !C3DGetBoundingSphere(v9, 1, (uint64_t)&v12))
  {
    BOOL v10 = 0;
    if (!v8) {
      return v10;
    }
LABEL_12:
    C3DSceneUnlock(v8);
    return v10;
  }
  if (v5) {
    *float32x4_t v5 = v12;
  }
  if (v4) {
    *float32x4_t v4 = HIDWORD(v12);
  }
  BOOL v10 = 1;
  if (v8) {
    goto LABEL_12;
  }
  return v10;
}

- (id)getBoundingSphere
{
  int v10 = 0;
  double v8 = 0.0;
  uint64_t v9 = 0;
  BOOL v2 = [(SCNGeometry *)self getBoundingSphereCenter:&v9 radius:&v8];
  id result = 0;
  if (v2)
  {
    float32x4_t v4 = objc_alloc_init(SCNBoundingSphere);
    LODWORD(v6) = HIDWORD(v9);
    LODWORD(v5) = v9;
    LODWORD(v7) = v10;
    -[SCNBoundingSphere setCenter:](v4, "setCenter:", v5, v6, v7);
    [(SCNBoundingSphere *)v4 setRadius:v8];
    return v4;
  }
  return result;
}

- (id)getBoundingBox
{
  int v14 = 0;
  uint64_t v13 = 0;
  int v12 = 0;
  uint64_t v11 = 0;
  BOOL v2 = [(SCNGeometry *)self getBoundingBoxMin:&v13 max:&v11];
  id result = 0;
  if (v2)
  {
    float32x4_t v4 = objc_alloc_init(SCNBoundingBox);
    LODWORD(v6) = HIDWORD(v13);
    LODWORD(v5) = v13;
    LODWORD(v7) = v14;
    -[SCNBoundingBox setMin:](v4, "setMin:", v5, v6, v7);
    LODWORD(v9) = HIDWORD(v11);
    LODWORD(v8) = v11;
    LODWORD(v10) = v12;
    -[SCNBoundingBox setMax:](v4, "setMax:", v8, v9, v10);
    return v4;
  }
  return result;
}

uint64_t __35__SCNGeometry__setupObjCModelFrom___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _shadableSetValue:a3 forUndefinedKey:a2];
}

void __33__SCNGeometry__copyAttributesTo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (id)[a3 copy];
  [*(id *)(a1 + 32) _shadableSetValue:v5 forUndefinedKey:a2];
}

- (id)mutableCopy
{
  MutableCopy = (const void *)C3DGeometryCreateMutableCopy([(SCNGeometry *)self geometryRef]);
  float32x4_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGeometryRef:MutableCopy];
  [v4 _setupObjCModelFrom:self];
  p_valuesForUndefinedKeysLocuint64_t k = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  double v6 = (void *)[(NSMutableDictionary *)self->_valuesForUndefinedKeys copy];
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = ____createCopy_block_invoke;
  v8[3] = &unk_264006110;
  v8[4] = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  return v4;
}

- (id)interleavedCopy
{
  InterleavedCopy = (const void *)C3DGeometryCreateInterleavedCopy([(SCNGeometry *)self geometryRef]);
  float32x4_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGeometryRef:InterleavedCopy];
  [v4 _setupObjCModelFrom:self];
  p_valuesForUndefinedKeysLocuint64_t k = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  double v6 = (void *)[(NSMutableDictionary *)self->_valuesForUndefinedKeys copy];
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = ____createCopy_block_invoke;
  v8[3] = &unk_264006110;
  v8[4] = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
  if (InterleavedCopy) {
    CFRelease(InterleavedCopy);
  }
  return v4;
}

- (id)_renderableCopy
{
  RenderableCopy = (const void *)C3DGeometryCreateRenderableCopy([(SCNGeometry *)self geometryRef]);
  float32x4_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGeometryRef:RenderableCopy];
  [v4 _setupObjCModelFrom:self];
  p_valuesForUndefinedKeysLocuint64_t k = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  double v6 = (void *)[(NSMutableDictionary *)self->_valuesForUndefinedKeys copy];
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = ____createCopy_block_invoke;
  v8[3] = &unk_264006110;
  v8[4] = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
  if (RenderableCopy) {
    CFRelease(RenderableCopy);
  }
  return v4;
}

- (id)scene
{
  id result = [(SCNGeometry *)self sceneRef];
  if (result)
  {
    return C3DEntityGetObjCWrapper((id *)result);
  }
  return result;
}

- (id)keyForNodeAttributes
{
  return @"kMeshKey";
}

- (void)_expand
{
}

- (id)_materialWithName:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  float32x4_t v4 = [(SCNGeometry *)self materials];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    double v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "name"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (SCNMaterial)materialWithName:(NSString *)name
{
  id result = [(SCNGeometry *)self _materialWithName:name];
  if (*((unsigned char *)self + 16))
  {
    return (SCNMaterial *)[(SCNMaterial *)result presentationMaterial];
  }
  return result;
}

- (unint64_t)countOfMaterials
{
  materials = self->_materials;
  if (!materials)
  {
    [(SCNGeometry *)self _expand];
    materials = self->_materials;
  }

  return [(NSMutableArray *)materials count];
}

- (id)objectInMaterialsAtIndex:(unint64_t)a3
{
  materials = self->_materials;
  if (!materials)
  {
    [(SCNGeometry *)self _expand];
    materials = self->_materials;
  }

  return (id)[(NSMutableArray *)materials objectAtIndex:a3];
}

- (void)removeObjectFromMaterialsAtIndex:(unint64_t)a3
{
  materials = self->_materials;
  if (!materials)
  {
    [(SCNGeometry *)self _expand];
    materials = self->_materials;
  }
  if ([(NSMutableArray *)materials count] <= a3)
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[SCNGeometry removeObjectFromMaterialsAtIndex:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  [(NSMutableArray *)self->_materials removeObjectAtIndex:a3];
  long long v14 = [(SCNGeometry *)self sceneRef];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __48__SCNGeometry_removeObjectFromMaterialsAtIndex___block_invoke;
  v15[3] = &unk_264004FC0;
  v15[4] = self;
  void v15[5] = a3;
  +[SCNTransaction postCommandWithContext:v14 object:self applyBlock:v15];
}

void __48__SCNGeometry_removeObjectFromMaterialsAtIndex___block_invoke(uint64_t a1)
{
}

- (void)replaceObjectInMaterialsAtIndex:(unint64_t)a3 withObject:(id)a4
{
  if (!a4)
  {
    uint64_t v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[SCNGeometry insertObject:inMaterialsAtIndex:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  if (!self->_materials) {
    [(SCNGeometry *)self _expand];
  }
  float v15 = [(SCNGeometry *)self sceneRef];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __58__SCNGeometry_replaceObjectInMaterialsAtIndex_withObject___block_invoke;
  v16[3] = &unk_264004E20;
  v16[4] = self;
  v16[5] = a4;
  v16[6] = a3;
  +[SCNTransaction postCommandWithContext:v15 object:self applyBlock:v16];
  [(NSMutableArray *)self->_materials replaceObjectAtIndex:a3 withObject:a4];
}

void __58__SCNGeometry_replaceObjectInMaterialsAtIndex_withObject___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  float32x4_t v3 = (void *)[*(id *)(a1 + 40) materialRef];
  CFIndex v4 = *(void *)(a1 + 48);

  C3DGeometryReplaceMaterialAtIndex(v2, v3, v4);
}

- (void)setFirstMaterial:(SCNMaterial *)firstMaterial
{
  if (firstMaterial)
  {
    if (objc_msgSend(-[SCNGeometry mutableMaterials](self, "mutableMaterials"), "count"))
    {
      [(SCNGeometry *)self replaceObjectInMaterialsAtIndex:0 withObject:firstMaterial];
    }
    else
    {
      [(SCNGeometry *)self insertMaterial:firstMaterial atIndex:0];
    }
  }
  else
  {
    -[SCNGeometry removeMaterialAtIndex:](self, "removeMaterialAtIndex:");
  }
}

- (void)removeMaterial:(id)a3
{
  NSUInteger v4 = [(NSArray *)[(SCNGeometry *)self materials] indexOfObject:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(SCNGeometry *)self removeObjectFromMaterialsAtIndex:v4];
  }
}

- (void)replaceMaterial:(id)a3 with:(id)a4
{
  NSUInteger v6 = [(NSArray *)[(SCNGeometry *)self materials] indexOfObject:a3];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(SCNGeometry *)self replaceObjectInMaterialsAtIndex:v6 withObject:a4];
  }
}

- (int64_t)primitiveType
{
  float32x4_t v3 = [(SCNGeometry *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  uint64_t Mesh = C3DGeometryGetMesh((uint64_t)[(SCNGeometry *)self geometryRef]);
  int64_t Type = Mesh;
  if (Mesh)
  {
    if ((uint64_t)C3DMeshGetElementsCount(Mesh) < 1)
    {
      int64_t Type = 0;
      if (!v4) {
        return Type;
      }
      goto LABEL_7;
    }
    ElementAtIndex = C3DMeshGetElementAtIndex(Type, 0, 0);
    int64_t Type = (int)C3DMeshElementGetType((uint64_t)ElementAtIndex);
  }
  if (v4) {
LABEL_7:
  }
    C3DSceneUnlock(v4);
  return Type;
}

- (void)setPrimitiveType:(int64_t)a3
{
  char v3 = a3;
  uint64_t v5 = [(SCNGeometry *)self sceneRef];
  uint64_t v6 = (uint64_t)v5;
  if (v5) {
    C3DSceneLock((uint64_t)v5);
  }
  uint64_t Mesh = C3DGeometryGetMesh((uint64_t)[(SCNGeometry *)self geometryRef]);
  if (Mesh)
  {
    uint64_t v8 = Mesh;
    if ((uint64_t)C3DMeshGetElementsCount(Mesh) >= 1)
    {
      CFArrayRef ElementsCount = C3DMeshGetElementsCount(v8);
      if ((uint64_t)ElementsCount >= 1)
      {
        CFArrayRef v10 = ElementsCount;
        for (CFIndex i = 0; (const __CFArray *)i != v10; ++i)
        {
          ElementAtIndex = C3DMeshGetElementAtIndex(v8, i, 0);
          C3DMeshElementSetType((uint64_t)ElementAtIndex, v3);
        }
      }
    }
  }
  if (v6)
  {
    C3DSceneUnlock(v6);
  }
}

- (BOOL)parseSpecialKey:(id)a3 withPath:(id)a4 intoDestination:(id *)a5 remainingPath:(id *)a6
{
  int v10 = [a3 hasPrefix:@"materials["];
  if (v10)
  {
    uint64_t v11 = objc_msgSend(a4, "substringWithRange:", 10, objc_msgSend(a4, "length") - 10);
    uint64_t v12 = [v11 rangeOfString:@"]"];
    if (v13 == 1
      && (uint64_t v14 = v12,
          int v15 = objc_msgSend((id)objc_msgSend(v11, "substringWithRange:", 0, v12), "intValue"),
          uint64_t v16 = [(SCNGeometry *)self materials],
          [(NSArray *)v16 count] > v15))
    {
      id v17 = [(NSArray *)v16 objectAtIndex:v15];
      if (a6)
      {
        unint64_t v18 = v14 + 12;
        if (v18 >= [a4 length]) {
          long long v19 = 0;
        }
        else {
          long long v19 = objc_msgSend(a4, "substringWithRange:", v18, objc_msgSend(a4, "length") - v18);
        }
        *a6 = v19;
      }
      *a5 = v17;
      LOBYTE(v10) = 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (![a3 length]) {
    return 0;
  }
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  SCNKitSplitKVCPath(a3, &v24, &v23);
  id v21 = 0;
  uint64_t v22 = 0;
  if ([(SCNGeometry *)self parseSpecialKey:v24 withPath:a3 intoDestination:&v21 remainingPath:&v22])
  {
    uint64_t v7 = (void *)[v21 copyAnimationChannelForKeyPath:v22 animation:a4];
    if (v7)
    {
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v7, "count") + 1);
      [v8 addObject:v24];
      [v8 addObjectsFromArray:v7];

      return v8;
    }
    return 0;
  }
  id v21 = (id)[(SCNGeometry *)self valueForKey:v24];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (uint64_t v9 = (void *)[v21 copyAnimationChannelForKeyPath:v23 animation:a4]) != 0)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count") + 1);
    [v8 addObject:v24];
    [v8 addObjectsFromArray:v9];
  }
  else
  {
    if (self->_shadableHelper)
    {
      os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
      uint64_t v10 = [(NSMutableDictionary *)self->_valuesForUndefinedKeys objectForKey:a3];
      os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
      if (!v10)
      {
        TargetedBaseint64_t Type = SCNAnimationGetTargetedBaseType(a4);
        if (TargetedBaseType)
        {
          uint64_t v17 = SCNDefaultValueWithBaseType(TargetedBaseType, v13, v14, v15, v16);
          unint64_t v18 = [(SCNGeometry *)self sceneRef];
          uint64_t v19 = (uint64_t)v18;
          if (v18)
          {
            C3DSceneLock((uint64_t)v18);
            +[SCNTransaction begin];
            +[SCNTransaction setImmediateMode:1];
            [(SCNGeometry *)self setValue:v17 forUndefinedKey:a3];
            +[SCNTransaction commitImmediate];
            C3DSceneUnlock(v19);
          }
          else
          {
            +[SCNTransaction begin];
            +[SCNTransaction setImmediateMode:1];
            [(SCNGeometry *)self setValue:v17 forUndefinedKey:a3];
            +[SCNTransaction commitImmediate];
          }
        }
        else
        {
          float v20 = scn_default_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v26 = a3;
            _os_log_impl(&dword_20B249000, v20, OS_LOG_TYPE_DEFAULT, "Warning: can't prepare shadable animation with path %@", buf, 0xCu);
          }
        }
      }
    }
    return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
  }
  return v8;
}

uint64_t __33__SCNGeometry_setLevelsOfDetail___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = [a2 thresholdMode];
  objc_msgSend((id)objc_msgSend(a2, "thresholdValue"), "doubleValue");
  double v7 = v6;
  objc_msgSend((id)objc_msgSend(a3, "thresholdValue"), "doubleValue");
  BOOL v9 = v7 > v8;
  if (!v5) {
    BOOL v9 = v7 < v8;
  }
  if (v9) {
    return -1;
  }
  else {
    return 1;
  }
}

void __33__SCNGeometry_setLevelsOfDetail___block_invoke_2(uint64_t a1)
{
  CFArrayRef v2 = (const __CFArray *)objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  char v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__SCNGeometry_setLevelsOfDetail___block_invoke_3;
  v4[3] = &unk_2640051E0;
  v4[4] = v2;
  [v3 enumerateObjectsUsingBlock:v4];
  C3DGeometrySetLOD(*(void *)(*(void *)(a1 + 40) + 8), v2);
}

uint64_t __33__SCNGeometry_setLevelsOfDetail___block_invoke_3(uint64_t a1, void *a2)
{
  CFArrayRef v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_msgSend(a2, "__CFObject");

  return [v2 addObject:v3];
}

void __39__SCNGeometry_set_subdivisionSettings___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  if (v2)
  {
    int v3 = *(_DWORD *)(a1 + 40);
    C3DGeometryOsdSetSubdivisionSettings(v2, v3);
  }
}

void __35__SCNGeometry_setSubdivisionLevel___block_invoke(uint64_t a1)
{
  uint64_t v2 = (__C3DGeometry *)[*(id *)(a1 + 32) geometryRef];
  if (v2)
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    C3DGeometryOsdSetSubdivisionLevel(v2, v3);
  }
}

void __43__SCNGeometry_setWantsAdaptiveSubdivision___block_invoke(uint64_t a1)
{
  uint64_t v2 = (__C3DGeometry *)[*(id *)(a1 + 32) geometryRef];
  if (v2)
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    C3DGeometryOsdSetWantsAdaptiveSubdivision(v2, v3);
  }
}

- (SCNGeometryElement)edgeCreasesElement
{
  return self->_edgeCreasesElement;
}

void __37__SCNGeometry_setEdgeCreasesElement___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  if (v2)
  {
    int v3 = (__C3DGeometry *)v2;
    uint64_t v4 = (__C3DMeshElement *)[*(id *)(*(void *)(a1 + 32) + 112) meshElement];
    C3DGeometryOsdSetEdgeCreasesElement(v3, v4);
  }
}

- (SCNGeometrySource)edgeCreasesSource
{
  return self->_edgeCreasesSource;
}

void __36__SCNGeometry_setEdgeCreasesSource___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) geometryRef];
  if (v2)
  {
    int v3 = (__C3DGeometry *)v2;
    uint64_t v4 = (__C3DMeshSource *)[*(id *)(*(void *)(a1 + 32) + 104) meshSource];
    C3DGeometryOsdSetEdgeCreasesSource(v3, v4);
  }
}

- (__C3DMaterial)materialRefCreateIfNeeded
{
  uint64_t v2 = [(SCNGeometry *)self geometryRef];
  OverrideMaterial = (__C3DMaterial *)C3DGeometryGetOverrideMaterial((uint64_t)v2);
  if (!OverrideMaterial)
  {
    if ((uint64_t)C3DGeometryGetMaterialsCount((uint64_t)v2) >= 1
      && (CFArrayRef MaterialAtIndex = C3DGeometryGetMaterialAtIndex((uint64_t)v2, 0)) != 0)
    {
      Copy = (__C3DMaterial *)C3DMaterialCreateCopy((uint64_t)MaterialAtIndex);
    }
    else
    {
      Copy = (__C3DMaterial *)C3DMaterialCreate();
    }
    OverrideMaterial = Copy;
    C3DGeometrySetOverrideMaterial(v2, Copy);
    CFRelease(OverrideMaterial);
  }
  return OverrideMaterial;
}

- (__C3DMaterial)materialRef
{
  uint64_t v2 = [(SCNGeometry *)self geometryRef];

  return (__C3DMaterial *)C3DGeometryGetOverrideMaterial((uint64_t)v2);
}

- (void)_unifyNormals
{
  uint64_t v2 = [(SCNGeometry *)self geometryRef];
  if (v2)
  {
    uint64_t Mesh = C3DGeometryGetMesh((uint64_t)v2);
    C3DMeshUnifyNormals(Mesh, Mesh, 1, 0);
  }
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  if ([a4 hasPrefix:@"materials["])
  {
    uint64_t v7 = 0;
    if ([(SCNGeometry *)self parseSpecialKey:a4 withPath:a4 intoDestination:&v7 remainingPath:0]&& v7)
    {
      if (a3) {
        -[SCNGeometry replaceMaterial:with:](self, "replaceMaterial:with:");
      }
      else {
        -[SCNGeometry removeMaterial:](self, "removeMaterial:");
      }
    }
  }
  else
  {
    [(SCNGeometry *)self _shadableSetValue:a3 forUndefinedKey:a4];
  }
}

- (id)valueForUndefinedKey:(id)a3
{
  if (*((unsigned char *)self + 16))
  {
    double v6 = [(SCNGeometry *)self sceneRef];
    uint64_t v7 = (uint64_t)v6;
    if (v6) {
      C3DSceneLock((uint64_t)v6);
    }
    CFDictionaryRef ValueForKey = C3DEntityGetValueForKey((uint64_t)self->_geometry, a3);
    uint64_t v5 = ValueForKey;
    if (ValueForKey)
    {
      Bytes = (float32x2_t *)C3DValueGetBytes((uint64_t)ValueForKey);
      int Type = C3DValueGetType((uint64_t)v5);
      uint64_t v5 = (void *)SCNNSValueFromTypedBytes(Bytes, Type, v11, v12, v13, v14);
    }
    if (v7) {
      C3DSceneUnlock(v7);
    }
    if (v5) {
      return v5;
    }
    CFStringRef v15 = C3DCFTypeCopyModelInfoAtPath((float32x4_t *)self->_geometry, (CFStringRef)a3, 0);
    if (v15)
    {
      CFStringRef v16 = v15;
      if (C3DModelTargetGetTargetAddress((uint64_t)v15))
      {
        TargetAddress = (float32x2_t *)C3DModelTargetGetTargetAddress((uint64_t)v16);
        Baseint Type = C3DModelTargetGetBaseType((uint64_t)v16);
        uint64_t v23 = (void *)SCNNSValueFromTypedBytes(TargetAddress, BaseType, v19, v20, v21, v22);
        CFRelease(v16);
        return v23;
      }
      CFRelease(v16);
    }
  }
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v26 = 0;
  SCNKitSplitKVCPath(a3, &v27, &v26);
  if ([(SCNGeometry *)self parseSpecialKey:v27 withPath:a3 intoDestination:&v28 remainingPath:0])
  {
    return v28;
  }
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  id v25 = (id)[(NSMutableDictionary *)self->_valuesForUndefinedKeys objectForKey:a3];
  os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
  return v25;
}

- (void)_shadableSetValue:(id)a3 forUndefinedKey:(id)a4
{
  if ((*((unsigned char *)self + 16) & 1) == 0)
  {
    id v5 = a4;
    if ([a4 hasPrefix:@"shaderModifiers."]) {
      id v5 = (id)[v5 substringFromIndex:16];
    }
    os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
    id v7 = (id)[(NSMutableDictionary *)self->_valuesForUndefinedKeys objectForKey:v5];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
    {
      os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
      [(SCNGeometry *)self willChangeValueForKey:@"customMaterialProperties"];
      [(SCNGeometry *)self willChangeValueForKey:@"customMaterialAttributes"];
      os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
    }
    valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
    if (a3)
    {
      if (!valuesForUndefinedKeys)
      {
        valuesForUndefinedKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        self->_valuesForUndefinedKeys = valuesForUndefinedKeys;
      }
      [(NSMutableDictionary *)valuesForUndefinedKeys setObject:a3 forKey:v5];
    }
    else
    {
      [(NSMutableDictionary *)valuesForUndefinedKeys removeObjectForKey:v5];
    }
    os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
    if ((isKindOfClass & 1) == 0)
    {
      [(SCNGeometry *)self didChangeValueForKey:@"customMaterialProperties"];
      [(SCNGeometry *)self didChangeValueForKey:@"customMaterialAttributes"];
    }
    double v11 = [(SCNGeometry *)self __CFObject];
    objc_opt_class();
    id v12 = v5;
    if (objc_opt_isKindOfClass())
    {
      [v7 unlinkCustomPropertyWithParent:self];
      id v12 = 0;
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a3 linkCustomPropertyWithParent:self andCustomName:v5];
      double v13 = (const void *)[a3 effectSlot];
      if (v13) {
        uint64_t v14 = (uint64_t)CFRetain(v13);
      }
      else {
        uint64_t v14 = 0;
      }
      id v12 = 0;
      goto LABEL_25;
    }
    uint64_t v14 = SCNCopyValueFromObjCProperty(self, v5);
    if (v14)
    {
LABEL_21:
      if (!v7)
      {
        int Type = C3DValueGetType(v14);
        uint64_t Default = C3DValueCreateDefault(Type);
        uint64_t v17 = [(SCNGeometry *)self sceneRef];
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __49__SCNGeometry__shadableSetValue_forUndefinedKey___block_invoke;
        v21[3] = &unk_264007A28;
        v21[4] = v5;
        v21[5] = v11;
        v21[6] = Default;
        +[SCNTransaction postCommandWithContext:v17 object:self applyBlock:v21];
      }
      goto LABEL_25;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = (uint64_t)SCNCopyValueFromObjCValue(a3);
      if (v14) {
        goto LABEL_21;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22[0] = C3DColor4FromRGBCFColor(a3, 0);
        v22[1] = v19;
        uint64_t v14 = C3DValueCreate(10, 1);
        C3DValueInitFrom(v14, v22);
        if (v14) {
          goto LABEL_21;
        }
      }
      else
      {
        uint64_t v14 = 0;
      }
    }
LABEL_25:
    unint64_t v18 = [(SCNGeometry *)self sceneRef];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __49__SCNGeometry__shadableSetValue_forUndefinedKey___block_invoke_2;
    v20[3] = &unk_264008580;
    v20[6] = v14;
    v20[7] = v11;
    void v20[4] = v5;
    v20[5] = a3;
    +[SCNTransaction postCommandWithContext:v18 object:self keyPath:v12 applyBlock:v20];
    return;
  }
  uint64_t v10 = scn_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[SCNGeometry _shadableSetValue:forUndefinedKey:]();
  }
}

void __49__SCNGeometry__shadableSetValue_forUndefinedKey___block_invoke(uint64_t a1)
{
  C3DEntitySetValueForKey(*(void *)(a1 + 40), *(void **)(a1 + 32), *(__int16 **)(a1 + 48));
  uint64_t v2 = *(const void **)(a1 + 48);
  if (v2)
  {
    CFRelease(v2);
  }
}

void __49__SCNGeometry__shadableSetValue_forUndefinedKey___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(__int16 **)(a1 + 48);
  if (v2)
  {
    C3DEntitySetValueForKey(*(void *)(a1 + 56), *(void **)(a1 + 32), v2);
    int v3 = *(const void **)(a1 + 48);
    CFRelease(v3);
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 56);
    id v5 = *(void **)(a1 + 32);
    double v6 = *(__int16 **)(a1 + 40);
    if (v6)
    {
      C3DEntitySetValueForKey(v4, v5, v6);
    }
    else
    {
      C3DEntityResetValueForKey(v4, v5);
    }
  }
}

- (id)customMaterialPropertyNames
{
  p_valuesForUndefinedKeysLocuint64_t k = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableDictionary count](self->_valuesForUndefinedKeys, "count"));
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _OWORD v7[2] = __42__SCNGeometry_customMaterialPropertyNames__block_invoke;
  v7[3] = &unk_264006110;
  v7[4] = v4;
  [(NSMutableDictionary *)valuesForUndefinedKeys enumerateKeysAndObjectsUsingBlock:v7];
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v4;
}

uint64_t __42__SCNGeometry_customMaterialPropertyNames__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    id v5 = *(void **)(a1 + 32);
    return [v5 addObject:a2];
  }
  return result;
}

- (id)customMaterialProperties
{
  p_valuesForUndefinedKeysLocuint64_t k = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableDictionary count](self->_valuesForUndefinedKeys, "count"));
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _OWORD v7[2] = __39__SCNGeometry_customMaterialProperties__block_invoke;
  v7[3] = &unk_264006110;
  v7[4] = v4;
  [(NSMutableDictionary *)valuesForUndefinedKeys enumerateKeysAndObjectsUsingBlock:v7];
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v4;
}

uint64_t __39__SCNGeometry_customMaterialProperties__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    double v6 = *(void **)(a1 + 32);
    return [v6 addObject:a3];
  }
  return result;
}

- (id)customMaterialAttributeNames
{
  p_valuesForUndefinedKeysLocuint64_t k = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableDictionary count](self->_valuesForUndefinedKeys, "count"));
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _OWORD v7[2] = __43__SCNGeometry_customMaterialAttributeNames__block_invoke;
  v7[3] = &unk_264006110;
  v7[4] = v4;
  [(NSMutableDictionary *)valuesForUndefinedKeys enumerateKeysAndObjectsUsingBlock:v7];
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v4;
}

uint64_t __43__SCNGeometry_customMaterialAttributeNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = _isValidCustomPropertyType(a3);
  if (result)
  {
    double v6 = *(void **)(a1 + 32);
    return [v6 addObject:a2];
  }
  return result;
}

- (id)customMaterialAttributes
{
  p_valuesForUndefinedKeysLocuint64_t k = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableDictionary count](self->_valuesForUndefinedKeys, "count"));
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _OWORD v7[2] = __39__SCNGeometry_customMaterialAttributes__block_invoke;
  v7[3] = &unk_264006110;
  v7[4] = v4;
  [(NSMutableDictionary *)valuesForUndefinedKeys enumerateKeysAndObjectsUsingBlock:v7];
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v4;
}

uint64_t __39__SCNGeometry_customMaterialAttributes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = _isValidCustomPropertyType(a3);
  if (result)
  {
    double v6 = *(void **)(a1 + 32);
    return [v6 addObject:a3];
  }
  return result;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  return SCNObject_resolveInstanceMethod((objc_class *)a1, a3);
}

- (void)_setupShadableHelperIfNeeded
{
  if (!self->_shadableHelper) {
    self->_shadableHelper = [[SCNShadableHelper alloc] initWithOwner:self];
  }
}

- (SCNProgram)program
{
  return [(SCNShadableHelper *)self->_shadableHelper program];
}

- (void)setShaderModifiers:(id)a3
{
  if (*((unsigned char *)self + 16))
  {
    double v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNGeometry setShaderModifiers:]();
    }
  }
  else
  {
    if (a3) {
      [(SCNGeometry *)self _setupShadableHelperIfNeeded];
    }
    shadableHelper = self->_shadableHelper;
    [(SCNShadableHelper *)shadableHelper setShaderModifiers:a3];
  }
}

- (void)setMinimumLanguageVersion:(id)a3
{
  if (*((unsigned char *)self + 16))
  {
    double v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNGeometry setMinimumLanguageVersion:]();
    }
  }
  else
  {
    if (a3) {
      [(SCNGeometry *)self _setupShadableHelperIfNeeded];
    }
    shadableHelper = self->_shadableHelper;
    [(SCNShadableHelper *)shadableHelper setMinimumLanguageVersion:a3];
  }
}

- (NSNumber)minimumLanguageVersion
{
  return [(SCNShadableHelper *)self->_shadableHelper minimumLanguageVersion];
}

- (id)shaderModifiersArgumentsNames
{
  return [(SCNShadableHelper *)self->_shadableHelper shaderModifiersArgumentsNames];
}

- (void)handleBindingOfSymbol:(id)a3 usingBlock:(id)a4
{
  [(SCNGeometry *)self _setupShadableHelperIfNeeded];
  shadableHelper = self->_shadableHelper;

  [(SCNShadableHelper *)shadableHelper handleBindingOfSymbol:a3 usingBlock:a4];
}

- (void)handleUnbindingOfSymbol:(id)a3 usingBlock:(id)a4
{
  [(SCNGeometry *)self _setupShadableHelperIfNeeded];
  shadableHelper = self->_shadableHelper;

  [(SCNShadableHelper *)shadableHelper handleUnbindingOfSymbol:a3 usingBlock:a4];
}

- (void)setProgram:(id)a3
{
  if (*((unsigned char *)self + 16))
  {
    id v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNGeometry setProgram:]();
    }
  }
  else
  {
    if (a3)
    {
      [(SCNGeometry *)self _setupShadableHelperIfNeeded];
      shadableHelper = self->_shadableHelper;
      id v6 = a3;
    }
    else
    {
      shadableHelper = self->_shadableHelper;
      id v6 = 0;
    }
    [(SCNShadableHelper *)shadableHelper setProgram:v6];
  }
}

- (__C3DAnimationManager)animationManager
{
  uint64_t result = [(SCNGeometry *)self sceneRef];
  if (result)
  {
    return (__C3DAnimationManager *)C3DSceneGetAnimationManager((uint64_t)result);
  }
  return result;
}

- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4
{
  if (!a4) {
    return 0;
  }
  p_animationsLocuint64_t k = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  BOOL v8 = objc_msgSend(-[SCNOrderedDictionary objectForKey:](self->_animations, "objectForKey:", a4), "animation") == (void)a3;
  if (v8)
  {
    [(SCNOrderedDictionary *)self->_animations removeObjectForKey:a4];
    BOOL v9 = [(SCNGeometry *)self __CFObject];
    if ((CFTypeIsC3DEntity(v9) & 1) == 0)
    {
      uint64_t v10 = scn_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[SCNNode __removeAnimation:forKey:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    C3DEntityRemoveAnimationForKey(v9, a4, 1);
  }
  os_unfair_lock_unlock(p_animationsLock);
  return v8;
}

- (void)addAnimationPlayer:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    if (!a4) {
      id v5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08C38], "UUID"), "UUIDString");
    }
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (!animations)
    {
      animations = objc_alloc_init(SCNOrderedDictionary);
      self->_animations = animations;
    }
    [(SCNOrderedDictionary *)animations setObject:a3 forKey:v5];
    os_unfair_lock_unlock(&self->_animationsLock);
    BOOL v8 = [(SCNGeometry *)self sceneRef];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __41__SCNGeometry_addAnimationPlayer_forKey___block_invoke;
    v10[3] = &unk_264006138;
    v10[4] = a3;
    v10[5] = self;
    v10[6] = v5;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v10];
  }
  else
  {
    BOOL v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SCNTechnique addAnimationPlayer:forKey:]((uint64_t)self, v9);
    }
  }
}

void __41__SCNGeometry_addAnimationPlayer_forKey___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "prepareWithTarget:implicitDuration:", a1[5]);
  if ((SCNAddAnimation(a1[4], a1[5], a1[6]) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1[5] + 14);
    [*((id *)a1[5] + 8) removeObjectForKey:a1[6]];
    uint64_t v2 = (os_unfair_lock_s *)((char *)a1[5] + 56);
    os_unfair_lock_unlock(v2);
  }
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v6 = (SCNAnimation *)a3;
    if (!a4) {
      id v5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08C38], "UUID"), "UUIDString");
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = +[SCNAnimation animationWithCAAnimation:v6];
    }
    id v7 = +[SCNAnimationPlayer animationPlayerWithSCNAnimation:v6];
    [(SCNGeometry *)self addAnimationPlayer:v7 forKey:v5];
    [(SCNAnimationPlayer *)v7 play];
  }
  else
  {
    BOOL v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNTechnique addAnimation:forKey:]((uint64_t)self, v8);
    }
  }
}

- (void)addAnimation:(id)a3
{
}

- (void)removeAllAnimations
{
  p_animationsLocuint64_t k = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  [(SCNOrderedDictionary *)self->_animations removeAllObjects];
  os_unfair_lock_unlock(p_animationsLock);
  uint64_t v4 = [(SCNGeometry *)self sceneRef];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__SCNGeometry_removeAllAnimations__block_invoke;
  v5[3] = &unk_264005010;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:v4 object:self applyBlock:v5];
}

void __34__SCNGeometry_removeAllAnimations__block_invoke(uint64_t a1)
{
}

- (void)removeAllAnimationsWithBlendOutDuration:(double)a3
{
  p_animationsLocuint64_t k = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  [(SCNOrderedDictionary *)self->_animations removeAllObjects];
  os_unfair_lock_unlock(p_animationsLock);
  id v6 = [(SCNGeometry *)self sceneRef];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _OWORD v7[2] = __55__SCNGeometry_removeAllAnimationsWithBlendOutDuration___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(double *)&void v7[5] = a3;
  +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
}

void __55__SCNGeometry_removeAllAnimationsWithBlendOutDuration___block_invoke(uint64_t a1)
{
}

- (void)removeAnimationForKey:(id)a3
{
  if (a3)
  {
    p_animationsLocuint64_t k = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    [(SCNOrderedDictionary *)self->_animations removeObjectForKey:a3];
    os_unfair_lock_unlock(p_animationsLock);
    id v6 = [(SCNGeometry *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    _OWORD v7[2] = __37__SCNGeometry_removeAnimationForKey___block_invoke;
    v7[3] = &unk_264006160;
    v7[4] = self;
    void v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __37__SCNGeometry_removeAnimationForKey___block_invoke(uint64_t a1)
{
}

- (void)removeAnimationForKey:(id)a3 blendOutDuration:(double)a4
{
  if (a3)
  {
    p_animationsLocuint64_t k = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    [(SCNOrderedDictionary *)self->_animations removeObjectForKey:a3];
    os_unfair_lock_unlock(p_animationsLock);
    BOOL v8 = [(SCNGeometry *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __54__SCNGeometry_removeAnimationForKey_blendOutDuration___block_invoke;
    v9[3] = &unk_264004E20;
    v9[4] = self;
    v9[5] = a3;
    *(double *)&v9[6] = a4;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v9];
  }
}

void __54__SCNGeometry_removeAnimationForKey_blendOutDuration___block_invoke(uint64_t a1)
{
}

- (id)animationForKey:(id)a3
{
  id v3 = [(SCNGeometry *)self _scnAnimationForKey:a3];
  uint64_t v4 = (void *)MEMORY[0x263F15748];

  return (id)[v4 animationWithSCNAnimation:v3];
}

- (id)_scnAnimationForKey:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    p_animationsLocuint64_t k = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (animations) {
      id v3 = (id)objc_msgSend(-[SCNOrderedDictionary objectForKey:](animations, "objectForKey:", v3), "animation");
    }
    else {
      id v3 = 0;
    }
    os_unfair_lock_unlock(p_animationsLock);
  }
  return v3;
}

- (id)animationPlayerForKey:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    p_animationsLocuint64_t k = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (animations) {
      id v3 = [(SCNOrderedDictionary *)animations objectForKey:v3];
    }
    else {
      id v3 = 0;
    }
    os_unfair_lock_unlock(p_animationsLock);
  }
  return v3;
}

- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = a3;
  BOOL v9 = [(SCNGeometry *)self __CFObject];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = [(SCNGeometry *)self animationManager];
    if (v11)
    {
      uint64_t v12 = (uint64_t)v11;
      double v13 = CACurrentMediaTime();
      C3DAnimationManagerPauseAnimationForKey(v12, v10, a4, v7, v5, v13);
    }
  }
}

- (void)pauseAnimationForKey:(id)a3
{
  BOOL v5 = [(SCNGeometry *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__SCNGeometry_pauseAnimationForKey___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  void v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __36__SCNGeometry_pauseAnimationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseAnimation:1 forKey:*(void *)(a1 + 40) pausedByNode:0];
}

- (void)resumeAnimationForKey:(id)a3
{
  BOOL v5 = [(SCNGeometry *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__SCNGeometry_resumeAnimationForKey___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  void v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __37__SCNGeometry_resumeAnimationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseAnimation:0 forKey:*(void *)(a1 + 40) pausedByNode:0];
}

- (void)setSpeed:(double)a3 forAnimationKey:(id)a4
{
  uint64_t v7 = [NSString stringWithFormat:@"animations.%@.speed", a4];
  BOOL v8 = [(SCNGeometry *)self sceneRef];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__SCNGeometry_setSpeed_forAnimationKey___block_invoke;
  v9[3] = &unk_264004E20;
  v9[4] = self;
  v9[5] = a4;
  *(double *)&v9[6] = a3;
  +[SCNTransaction postCommandWithContext:v8 object:self keyPath:v7 applyBlock:v9];
}

void __40__SCNGeometry_setSpeed_forAnimationKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  if (v2)
  {
    id v3 = (void *)v2;
    uint64_t v4 = [*(id *)(a1 + 32) animationManager];
    if (v4)
    {
      BOOL v5 = *(const void **)(a1 + 40);
      float v6 = *(double *)(a1 + 48);
      C3DAnimationManagerChangeSpeedOfAnimationForKey(v4, v3, v5, v6);
    }
  }
}

- (BOOL)isAnimationForKeyPaused:(id)a3
{
  BOOL v5 = [(SCNGeometry *)self sceneRef];
  uint64_t v6 = (uint64_t)v5;
  if (v5) {
    C3DSceneLock((uint64_t)v5);
  }
  uint64_t v7 = [(SCNGeometry *)self __CFObject];
  if (v7)
  {
    BOOL v8 = v7;
    BOOL v9 = [(SCNGeometry *)self animationManager];
    if (v9)
    {
      char IsPaused = C3DAnimationManagerGetAnimationForKeyIsPaused((uint64_t)v9, v8, a3);
      if (!v6) {
        return IsPaused;
      }
      goto LABEL_8;
    }
  }
  char IsPaused = 0;
  if (v6) {
LABEL_8:
  }
    C3DSceneUnlock(v6);
  return IsPaused;
}

- (id)_scnBindings
{
  return self->_bindings;
}

- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6
{
  if (self != a4)
  {
    v16[15] = v6;
    v16[16] = v7;
    double v13 = objc_alloc_init(C3DBinding);
    [(C3DBinding *)v13 setSourceObject:a4];
    [(C3DBinding *)v13 setKeyPathDst:a3];
    [(C3DBinding *)v13 setKeyPathSrc:a5];
    [(C3DBinding *)v13 setOptions:a6];
    bindings = self->_bindings;
    if (!bindings)
    {
      bindings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      self->_bindings = bindings;
    }
    [(NSMutableDictionary *)bindings setValue:v13 forKey:a3];

    uint64_t v15 = [(SCNGeometry *)self sceneRef];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __63__SCNGeometry_bindAnimatablePath_toObject_withKeyPath_options___block_invoke;
    v16[3] = &unk_264006188;
    v16[4] = self;
    v16[5] = a4;
    v16[6] = a3;
    void v16[7] = a5;
    v16[8] = a6;
    +[SCNTransaction postCommandWithContext:v15 object:self applyBlock:v16];
  }
}

void __63__SCNGeometry_bindAnimatablePath_toObject_withKeyPath_options___block_invoke(uint64_t a1)
{
  uint64_t v2 = (float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  id v3 = objc_alloc_init(C3DBinding);
  -[C3DBinding setSourceObject:](v3, "setSourceObject:", objc_msgSend(*(id *)(a1 + 40), "__CFObject"));
  [(C3DBinding *)v3 setKeyPathDst:*(void *)(a1 + 48)];
  [(C3DBinding *)v3 setKeyPathSrc:*(void *)(a1 + 56)];
  [(C3DBinding *)v3 setOptions:*(void *)(a1 + 64)];
  C3DEntityAddBinding(v2, v3);
}

- (void)unbindAnimatablePath:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_bindings, "removeObjectForKey:");
  if (![(NSMutableDictionary *)self->_bindings count])
  {

    self->_bindings = 0;
  }
  BOOL v5 = [(SCNGeometry *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__SCNGeometry_unbindAnimatablePath___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  void v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __36__SCNGeometry_unbindAnimatablePath___block_invoke(uint64_t a1)
{
  uint64_t v2 = (float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  CFStringRef v3 = *(const __CFString **)(a1 + 40);

  C3DEntityRemoveBindingWithKeyPath(v2, v3);
}

- (void)removeAllBindings
{
  self->_bindings = 0;
  CFStringRef v3 = [(SCNGeometry *)self sceneRef];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__SCNGeometry_removeAllBindings__block_invoke;
  v4[3] = &unk_264005010;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:v3 object:self applyBlock:v4];
}

void __32__SCNGeometry_removeAllBindings__block_invoke(uint64_t a1)
{
  float32x4_t v1 = (CFTypeRef *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");

  C3DEntityRemoveAllBindings(v1);
}

- (void)_customEncodingOfSCNGeometry:(id)a3
{
  if (!self->_materials) {
    [(SCNGeometry *)self _expand];
  }
  fixedBoundingBoxExtrema = self->_fixedBoundingBoxExtrema;
  if (fixedBoundingBoxExtrema)
  {
    *(float *)&double v3 = fixedBoundingBoxExtrema->x;
    *(float *)&double v4 = fixedBoundingBoxExtrema->y;
    *(float *)&double v5 = fixedBoundingBoxExtrema->z;
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithSCNVector3:", v3, v4, v5), @"fixedBoundingBoxExtrema[0]");
    BOOL v9 = self->_fixedBoundingBoxExtrema;
    *(float *)&double v10 = v9[1].x;
    *(float *)&double v11 = v9[1].y;
    *(float *)&double v12 = v9[1].z;
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithSCNVector3:", v10, v11, v12), @"fixedBoundingBoxExtrema[1]");
  }
  uint64_t TypeID = C3DGeometryGetTypeID();
  if (TypeID == CFGetTypeID(self->_geometry))
  {
    uint64_t v14 = [(SCNGeometry *)self geometrySourcesForSemantic:@"kGeometrySourceSemanticVertex"];
    if (v14) {
      [a3 encodeObject:v14 forKey:@"kGeometrySourceSemanticVertex"];
    }
    uint64_t v15 = [(SCNGeometry *)self geometrySourcesForSemantic:@"kGeometrySourceSemanticNormal"];
    if (v15) {
      [a3 encodeObject:v15 forKey:@"kGeometrySourceSemanticNormal"];
    }
    uint64_t v16 = [(SCNGeometry *)self geometrySourcesForSemantic:@"kGeometrySourceSemanticColor"];
    if (v16) {
      [a3 encodeObject:v16 forKey:@"kGeometrySourceSemanticColor"];
    }
    uint64_t v17 = [(SCNGeometry *)self geometrySourcesForSemantic:@"kGeometrySourceSemanticTexcoord"];
    if (v17) {
      [a3 encodeObject:v17 forKey:@"kGeometrySourceSemanticTexcoord"];
    }
    unint64_t v18 = [(SCNGeometry *)self geometrySourcesForSemantic:@"kGeometrySourceSemanticTangent"];
    if (v18) {
      [a3 encodeObject:v18 forKey:@"kGeometrySourceSemanticTangent"];
    }
    uint64_t v19 = [(SCNGeometry *)self geometryElements];
    if ([(NSArray *)v19 count]) {
      [a3 encodeObject:v19 forKey:@"elements"];
    }
    sourceChannels = self->_sourceChannels;
    if (sourceChannels) {
      [a3 encodeObject:sourceChannels forKey:@"sourceChannels"];
    }
  }
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  if (valuesForUndefinedKeys) {
    [a3 encodeObject:valuesForUndefinedKeys forKey:@"valuesForUndefinedKeys"];
  }
  os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
}

- (void)_customDecodingOfSCNGeometry:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  if ([a3 containsValueForKey:@"fixedBoundingBoxExtrema[0]"])
  {
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"fixedBoundingBoxExtrema[0]"), "SCNVector3Value");
    v49[0] = v5;
    v49[1] = v6;
    v49[2] = v7;
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"fixedBoundingBoxExtrema[1]"), "SCNVector3Value");
    v50[0] = v8;
    v50[1] = v9;
    v50[2] = v10;
    [(SCNGeometry *)self setBoundingBoxMin:v49 max:v50];
  }
  uint64_t TypeID = C3DGeometryGetTypeID();
  if (TypeID == CFGetTypeID(self->_geometry))
  {
    double v12 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"elements");
    double v13 = (void *)[MEMORY[0x263EFF980] array];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", v14, @"kGeometrySourceSemanticVertex");
    if (v15) {
      [v13 addObjectsFromArray:v15];
    }
    uint64_t v16 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", v14, @"kGeometrySourceSemanticNormal");
    if (v16) {
      [v13 addObjectsFromArray:v16];
    }
    uint64_t v17 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", v14, @"kGeometrySourceSemanticColor");
    if (v17) {
      [v13 addObjectsFromArray:v17];
    }
    uint64_t v18 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", v14, @"kGeometrySourceSemanticTexcoord");
    if (v18) {
      [v13 addObjectsFromArray:v18];
    }
    uint64_t v19 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", v14, @"kGeometrySourceSemanticTangent");
    if (v19) {
      [v13 addObjectsFromArray:v19];
    }
    CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFIndex v21 = [v13 count];
    double v22 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
    Mutable = CFArrayCreateMutable(v20, v21, MEMORY[0x263EFFF70]);
    uint64_t v24 = CFArrayCreateMutable(v20, [v12 count], v22);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v25 = [v13 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v44;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v44 != v27) {
            objc_enumerationMutation(v13);
          }
          CFArrayAppendValue(Mutable, (const void *)[*(id *)(*((void *)&v43 + 1) + 8 * v28++) meshSource]);
        }
        while (v26 != v28);
        uint64_t v26 = [v13 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v26);
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v29 = [v12 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v40;
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v40 != v31) {
            objc_enumerationMutation(v12);
          }
          CFArrayAppendValue(v24, (const void *)[*(id *)(*((void *)&v39 + 1) + 8 * v32++) meshElement]);
        }
        while (v30 != v32);
        uint64_t v30 = [v12 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v30);
    }
    self->_sourceChannels = (NSArray *)(id)objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"sourceChannels");
    size_t v33 = [v13 count];
    long long v34 = (char *)&v38[-1] - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
    __buildSourceChannels(self->_sourceChannels, v33, v12, v34);
    long long v35 = (uint64_t *)C3DMeshCreateWithMeshSourcesAndMeshElements(Mutable, v24, (uint64_t)v34);
    C3DGeometrySetMesh((uint64_t)self->_geometry, v35);
    CFRelease(Mutable);
    CFRelease(v24);
    CFRelease(v35);
  }
  long long v36 = (void *)[a3 decodeObjectOfClasses:SCNUserInfoClasses() forKey:@"valuesForUndefinedKeys"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __44__SCNGeometry__customDecodingOfSCNGeometry___block_invoke;
    v38[3] = &unk_264006110;
    v38[4] = self;
    [v36 enumerateKeysAndObjectsUsingBlock:v38];
  }
}

uint64_t __44__SCNGeometry__customDecodingOfSCNGeometry___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _shadableSetValue:a3 forUndefinedKey:a2];
}

- (void)encodeWithCoder:(id)a3
{
  if (*((unsigned char *)self + 16)) {
    [(SCNGeometry *)self _syncObjCModel];
  }
  [(SCNGeometry *)self _customEncodingOfSCNGeometry:a3];
  materials = self->_materials;
  if (materials) {
    [a3 encodeObject:materials forKey:@"materials"];
  }
  levelsOfDetail = self->_levelsOfDetail;
  if (levelsOfDetail) {
    [a3 encodeObject:levelsOfDetail forKey:@"levelsOfDetail"];
  }
  [a3 encodeInteger:self->_subdivisionLevel forKey:@"subdivisionLevel"];
  [a3 encodeBool:self->_subdivisionIsAdaptive forKey:@"wantsAdaptiveSubdivision"];
  edgeCreasesSource = self->_edgeCreasesSource;
  if (edgeCreasesSource) {
    [a3 encodeObject:edgeCreasesSource forKey:@"edgeCreasesSource"];
  }
  edgeCreasesElement = self->_edgeCreasesElement;
  if (edgeCreasesElement) {
    [a3 encodeObject:edgeCreasesElement forKey:@"edgeCreasesElement"];
  }
  shadableHelper = self->_shadableHelper;
  if (shadableHelper) {
    [a3 encodeObject:shadableHelper forKey:@"shadableHelper"];
  }
  [a3 encodeBytes:&self->_subdivisionSettings length:4 forKey:@"subdivisionSettings"];
  name = self->_name;
  if (name) {
    [a3 encodeObject:name forKey:@"name"];
  }
  SCNEncodeEntity(a3, self);
  SCNEncodeAnimations(a3, self);
  tessellator = self->_tessellator;

  [a3 encodeObject:tessellator forKey:@"tessellator"];
}

- (SCNGeometry)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SCNGeometry;
  double v4 = [(SCNGeometry *)&v11 init];
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    uint64_t v6 = objc_msgSend(v4, "__createCFObject");
    *((void *)v4 + 1) = v6;
    if (v6) {
      C3DEntitySetObjCWrapper(v6, v4);
    }
    [v4 _syncObjCModel];
    *((_DWORD *)v4 + 38) = 0;
    [v4 _customDecodingOfSCNGeometry:a3];
    objc_msgSend(v4, "setMaterials:", objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:containingNestedContainersForKey:", objc_opt_class(), @"materials"));
    objc_msgSend(v4, "setLevelsOfDetail:", objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"levelsOfDetail"));
    objc_msgSend(v4, "setSubdivisionLevel:", objc_msgSend(a3, "decodeIntegerForKey:", @"subdivisionLevel"));
    objc_msgSend(v4, "setWantsAdaptiveSubdivision:", objc_msgSend(a3, "decodeBoolForKey:", @"wantsAdaptiveSubdivision"));
    objc_msgSend(v4, "setEdgeCreasesSource:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"edgeCreasesSource"));
    objc_msgSend(v4, "setEdgeCreasesElement:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"edgeCreasesElement"));
    id v7 = (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"shadableHelper"];
    *((void *)v4 + 15) = v7;
    if ((char *)[v7 owner] != v4)
    {

      *((void *)v4 + 15) = 0;
    }
    uint64_t v10 = 0;
    int v8 = (_DWORD *)[a3 decodeBytesForKey:@"subdivisionSettings" returnedLength:&v10];
    if (v10 == 4) {
      *(_DWORD *)(v4 + 97) = *v8;
    }
    objc_msgSend(v4, "setName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"name"));
    *((_DWORD *)v4 + 14) = 0;
    SCNDecodeEntity(a3, v4);
    SCNDecodeAnimations(a3, v4);
    objc_msgSend(v4, "setTessellator:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"tessellator"));
    +[SCNTransaction setImmediateMode:v5];
  }
  return (SCNGeometry *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_geometryByUnifyingNormalsWithCreaseThreshold:(double)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v5 = [(SCNGeometry *)self geometryElements];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v22 + 1) + 8 * v9) primitiveType] == 4)
        {
          uint64_t v15 = (SCNGeometry *)[(SCNGeometry *)self copy];
          uint64_t v16 = [(SCNGeometry *)v15 geometryRef];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t Mesh = C3DGeometryGetMesh(v16);
            Copy = (uint64_t *)C3DMeshCreateCopy(Mesh);
            C3DMeshUnifyNormals((uint64_t)Copy, (uint64_t)Copy, 1, 1);
            C3DGeometrySetMesh(v17, Copy);
            if (Copy) {
              CFRelease(Copy);
            }
          }
          return v15;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = [(SCNGeometry *)self geometrySources];
  uint64_t v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v10, "count") - 1);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __71__SCNGeometry_SCNUtils___geometryByUnifyingNormalsWithCreaseThreshold___block_invoke;
  v21[3] = &unk_2640051E0;
  v21[4] = v11;
  [(NSArray *)v10 enumerateObjectsUsingBlock:v21];
  double v12 = +[SCNGeometry geometryWithSources:v11 elements:[(SCNGeometry *)self geometryElements]];
  double v13 = (void *)[MEMORY[0x263F13618] meshWithSCNGeometry:v12];
  *(float *)&double v14 = a3;
  [v13 addNormalsWithAttributeNamed:@"normals" creaseThreshold:v14];
  +[SCNTransaction begin];
  +[SCNTransaction setImmediateMode:1];
  uint64_t v15 = +[SCNGeometry geometryWithMDLMesh:v13];
  [(SCNGeometry *)v15 _setupObjCModelFrom:self];
  [(SCNGeometry *)v15 setName:[(SCNGeometry *)self name]];
  +[SCNTransaction commitImmediate];
  return v15;
}

uint64_t __71__SCNGeometry_SCNUtils___geometryByUnifyingNormalsWithCreaseThreshold___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "semantic"), "isEqualToString:", @"kGeometrySourceSemanticNormal");
  if ((result & 1) == 0)
  {
    BOOL v5 = *(void **)(a1 + 32);
    return [v5 addObject:a2];
  }
  return result;
}

- (id)_geometryByAddingSourcesOfSkinner:(id)a3
{
  uint64_t v4 = [a3 skinnerRef];
  if (C3DSkinnerHasOnlyOneJoint(v4))
  {
    id v5 = [(SCNGeometry *)self copy];
    return v5;
  }
  else
  {
    uint64_t v7 = [(SCNGeometry *)self geometryRef];
    uint64_t Mesh = C3DGeometryGetMesh((uint64_t)v7);
    uint64_t v9 = (uint64_t *)C3DMeshCreate();
    __C3DSkinnerPrepareSkinnedMesh(v4, Mesh, (uint64_t)v9, v7);
    uint64_t Copy = C3DGeometryCreateCopy(v7);
    C3DGeometrySetMesh(Copy, v9);
    CFRelease(v9);
    uint64_t v11 = +[SCNGeometry geometryWithGeometryRef:Copy];
    [(SCNGeometry *)v11 setName:[(SCNGeometry *)self name]];
    [(SCNGeometry *)v11 setMaterials:[(SCNGeometry *)self materials]];
    return v11;
  }
}

- (id)_geometryByRemovingSkinnerSources
{
  double v3 = [(SCNGeometry *)self geometryRef];
  uint64_t Mesh = C3DGeometryGetMesh((uint64_t)v3);
  uint64_t Copy = (CFArrayRef *)C3DMeshCreateCopy(Mesh);
  C3DMeshRemoveSourcesWithSemantic(Copy, 5);
  C3DMeshRemoveSourcesWithSemantic(Copy, 6);
  uint64_t v6 = (const void *)C3DGeometryCreateCopy(v3);
  C3DGeometrySetMesh((uint64_t)v6, (uint64_t *)Copy);
  uint64_t v7 = +[SCNGeometry geometryWithGeometryRef:v6];
  if (Copy) {
    CFRelease(Copy);
  }
  if (v6) {
    CFRelease(v6);
  }
  [(SCNGeometry *)v7 setName:[(SCNGeometry *)self name]];
  [(SCNGeometry *)v7 setMaterials:[(SCNGeometry *)self materials]];
  return v7;
}

- (void)_discardOriginalTopology
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  Renderinguint64_t Mesh = C3DGeometryGetRenderingMesh([(SCNGeometry *)self geometryRef]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v4 = [(SCNGeometry *)self geometrySources];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v20 + 1) + 8 * v8) meshSource];
        if (v9) {
          C3DEntitySetObjCWrapper(v9, 0);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [(SCNGeometry *)self geometryElements];
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = [*(id *)(*((void *)&v16 + 1) + 8 * v14) meshElement];
        if (v15) {
          C3DEntitySetObjCWrapper(v15, 0);
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }
  C3DMeshBuildRenderableData((uint64_t)RenderingMesh, 0);
  [(SCNGeometry *)self _releaseCachedSourcesAndElements];
}

- (id)_geometryByWeldingVerticesWithThreshold:(double)a3 normalThreshold:(double)a4
{
  uint64_t v6 = self;
  uint64_t v124 = *MEMORY[0x263EF8340];
  id v7 = -[NSArray firstObject](-[SCNGeometry geometrySourcesForSemantic:](self, "geometrySourcesForSemantic:"), "firstObject");
  id v8 = [(NSArray *)[(SCNGeometry *)v6 geometrySourcesForSemantic:@"kGeometrySourceSemanticNormal"] firstObject];
  [(SCNGeometry *)v6 geometrySourcesForSemantic:@"kGeometrySourceSemanticTexcoord"];
  size_t v9 = [v7 vectorCount];
  uint64_t v10 = (char *)malloc_type_malloc(8 * v9, 0x100004000313F17uLL);
  uint64_t v11 = malloc_type_malloc(8 * v9, 0x100004000313F17uLL);
  uint64_t v12 = v11;
  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      *(void *)&v10[8 * i] = i;
      v11[i] = i;
    }
  }
  uint64_t v105 = objc_msgSend((id)objc_msgSend(v7, "data"), "bytes");
  uint64_t v106 = [v7 dataOffset];
  uint64_t v107 = [v7 dataStride];
  qsort_r(v10, v9, 8uLL, &v105, (int (__cdecl *)(void *, const void *, const void *))vertexSort);
  if (v9)
  {
    v79 = v6;
    v80 = v10;
    uint64_t v15 = 0;
    uint64_t v92 = 0;
    double v16 = a4 + a4;
    long long v17 = v10 + 8;
    while (1)
    {
      uint64_t v18 = *(void *)&v10[8 * v15];
      if (v12[v18] == v18)
      {
        uint64_t v19 = v105 + v106 + v107 * v18;
        v14.i64[0] = *(void *)v19;
        LODWORD(__dst) = *(void *)v19;
        v14.i32[2] = *(_DWORD *)(v19 + 8);
        float32x4_t v89 = v14;
        uint64_t v20 = objc_msgSend((id)objc_msgSend(v8, "data"), "bytes");
        uint64_t v21 = [v8 dataOffset];
        uint64_t v22 = [v8 dataStride];
        v23.i64[0] = *(void *)(v20 + v22 * v18 + v21);
        v23.i32[2] = *(_DWORD *)(v20 + v21 + 8 + v22 * v18);
        float32x4_t v86 = v23;
        unint64_t v24 = [v8 vectorCount];
        uint64_t v25 = v15 + 1;
        if (v15 + 1 < v24)
        {
          int v26 = 0;
          uint64_t v27 = v105;
          unint64_t v28 = ~v15 + v24;
          uint64_t v29 = &v17[8 * v15];
          uint64_t v30 = v92;
          do
          {
            uint64_t v32 = *(void *)v29;
            v29 += 8;
            uint64_t v31 = v32;
            if (v12[v32] == v32)
            {
              uint64_t v33 = v106 + v107 * v31;
              v14.i32[0] = *(_DWORD *)(v27 + v33);
              if (vabds_f32(__dst, v14.f32[0]) > a3) {
                break;
              }
              uint64_t v34 = v33 + v27;
              v14.i32[1] = *(_DWORD *)(v34 + 4);
              v14.i32[2] = *(_DWORD *)(v34 + 8);
              float32x4_t v35 = vsubq_f32(v89, v14);
              float32x4_t v36 = vmulq_f32(v35, v35);
              float32x4_t v14 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v36, 2), vaddq_f32(v36, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 1)));
              if (sqrtf(v14.f32[0]) <= a3)
              {
                v14.i64[0] = *(void *)(v20 + v31 * v22 + v21);
                v14.i32[2] = *(_DWORD *)(v20 + v21 + 8 + v31 * v22);
                float32x4_t v37 = vmulq_f32(v86, v14);
                float32x4_t v14 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v37, 2), vaddq_f32(v37, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v37.f32, 1)));
                if (v16 >= (float)(1.0 - v14.f32[0]))
                {
                  v12[v31] = v18;
                  ++v26;
                }
              }
            }
            --v28;
          }
          while (v28);
          uint64_t v10 = v80;
          goto LABEL_19;
        }
        int v26 = 0;
        uint64_t v10 = v80;
      }
      else
      {
        int v26 = 0;
        uint64_t v25 = v15 + 1;
      }
      uint64_t v30 = v92;
LABEL_19:
      uint64_t v92 = v30 + v26;
      uint64_t v15 = v25;
      if (v25 == v9)
      {
        uint64_t v38 = v30 + v26;
        if (v92)
        {
          long long v39 = [(SCNGeometry *)v79 geometrySources];
          long long v40 = [(SCNGeometry *)v79 geometryElements];
          obunint64_t j = v39;
          v87 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v39, "count"));
          v82 = v40;
          v85 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v40, "count"));
          for (unint64_t j = 0; j != v9; ++j)
          {
            unint64_t v42 = v12[j];
            do
            {
              unint64_t v43 = v42;
              unint64_t v42 = v12[v42];
            }
            while (v43 > v42);
            v12[j] = v43;
            if (v43 > j && v12[v43] == v43)
            {
              v12[v43] = j;
              v12[j] = j;
            }
          }
          long long v103 = 0u;
          long long v104 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          uint64_t v90 = [(NSArray *)v39 countByEnumeratingWithState:&v101 objects:v123 count:16];
          if (v90)
          {
            uint64_t v83 = *(void *)v102;
            do
            {
              for (uint64_t k = 0; k != v90; ++k)
              {
                if (*(void *)v102 != v83) {
                  objc_enumerationMutation(obj);
                }
                long long v45 = *(void **)(*((void *)&v101 + 1) + 8 * k);
                uint64_t v46 = [v45 bytesPerComponent];
                size_t v47 = [v45 componentsPerVector] * v46;
                size_t v48 = ([v45 vectorCount] - v38) * v47;
                __dsta = (char *)malloc_type_malloc(v48, 0x5EF88AB8uLL);
                uint64_t v49 = objc_msgSend((id)objc_msgSend(v45, "data"), "bytes");
                [v45 vectorCount];
                uint64_t v50 = [v45 dataStride];
                uint64_t v51 = 0;
                uint64_t v52 = (char *)(v49 + [v45 dataOffset]);
                v53 = __dsta;
                do
                {
                  if (v51 == v12[v51])
                  {
                    memcpy(v53, v52, v47);
                    v53 += v47;
                  }
                  v52 += v50;
                  ++v51;
                }
                while (v9 != v51);
                uint64_t v38 = v92;
                id v54 = +[SCNGeometrySource _geometrySourceWithData:semantic:vectorCount:componentType:componentCount:dataOffset:dataStride:](SCNGeometrySource, "_geometrySourceWithData:semantic:vectorCount:componentType:componentCount:dataOffset:dataStride:", [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:__dsta length:v48 freeWhenDone:1], objc_msgSend(v45, "semantic"), objc_msgSend(v45, "vectorCount") - v92, objc_msgSend(v45, "_componentType"), objc_msgSend(v45, "componentsPerVector"), 0, 0);
                objc_msgSend((id)objc_msgSend(v45, "semantic"), "isEqualToString:", @"kGeometrySourceSemanticVertex");
                [v87 addObject:v54];
              }
              uint64_t v90 = [(NSArray *)obj countByEnumeratingWithState:&v101 objects:v123 count:16];
            }
            while (v90);
          }
          unint64_t v55 = 0;
          uint64_t v56 = 0;
          size_t v57 = v9 - v38;
          do
          {
            if (v12[v55] > v55)
            {
              v58 = scn_default_log();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT)) {
                -[SCNGeometry(SCNUtils) _geometryByWeldingVerticesWithThreshold:normalThreshold:].cold.8(v121, &v122, v58);
              }
            }
            if (v55 != v12[v55])
            {
              ++v56;
              if (!v55)
              {
                v59 = scn_default_log();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT)) {
                  -[SCNGeometry(SCNUtils) _geometryByWeldingVerticesWithThreshold:normalThreshold:].cold.7(v119, &v120, v59);
                }
              }
            }
            if (v12[v55] > v55)
            {
              v60 = scn_default_log();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT)) {
                -[SCNGeometry(SCNUtils) _geometryByWeldingVerticesWithThreshold:normalThreshold:].cold.6(v117, &v118, v60);
              }
            }
            *(void *)&v80[8 * v55] = v55 - v56;
            v12[v55] = *(void *)&v80[8 * v12[v55]];
            if (*(void *)&v80[8 * v55] >= v57)
            {
              v61 = scn_default_log();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT)) {
                -[SCNGeometry(SCNUtils) _geometryByWeldingVerticesWithThreshold:normalThreshold:].cold.5(v115, &v116, v61);
              }
            }
            ++v55;
          }
          while (v9 != v55);
          if (v56 != v92)
          {
            v62 = scn_default_log();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT)) {
              -[SCNGeometry(SCNUtils) _geometryByWeldingVerticesWithThreshold:normalThreshold:].cold.4(v62);
            }
          }
          long long v99 = 0u;
          long long v100 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          uint64_t v88 = [(NSArray *)v82 countByEnumeratingWithState:&v97 objects:v114 count:16];
          if (v88)
          {
            uint64_t v84 = *(void *)v98;
            unint64_t v63 = v9 - v92;
            do
            {
              for (uint64_t m = 0; m != v88; ++m)
              {
                if (*(void *)v98 != v84) {
                  objc_enumerationMutation(v82);
                }
                v65 = *(void **)(*((void *)&v97 + 1) + 8 * m);
                uint64_t v66 = [v65 bytesPerIndex];
                uint64_t v67 = objc_msgSend((id)objc_msgSend(v65, "data"), "bytes");
                uint64_t v68 = [v65 indexCount];
                if ([v65 primitiveType] == 4) {
                  uint64_t v69 = [v65 primitiveCount] * v66;
                }
                else {
                  uint64_t v69 = 0;
                }
                size_t __dstb = v69;
                size_t v91 = v69 + v68 * v66;
                v93 = (char *)malloc_type_malloc(v91, 0xFE15709BuLL);
                if (v68)
                {
                  uint64_t v70 = 0;
                  v71 = &v93[__dstb];
                  do
                  {
                    switch(v66)
                    {
                      case 4:
                        uint64_t v76 = v12[*(unsigned int *)(v67 + 4 * v70)];
                        *(_DWORD *)&v71[4 * v70] = v76;
                        if (v63 <= v76)
                        {
                          v77 = scn_default_log();
                          if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT)) {
                            -[SCNGeometry(SCNUtils) _geometryByWeldingVerticesWithThreshold:normalThreshold:](v108, &v109, v77);
                          }
                        }
                        break;
                      case 2:
                        uint64_t v74 = v12[*(unsigned __int16 *)(v67 + 2 * v70)];
                        *(_WORD *)&v71[2 * v70] = v74;
                        if (v63 <= (unsigned __int16)v74)
                        {
                          v75 = scn_default_log();
                          if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT)) {
                            -[SCNGeometry(SCNUtils) _geometryByWeldingVerticesWithThreshold:normalThreshold:](v110, &v111, v75);
                          }
                        }
                        break;
                      case 1:
                        uint64_t v72 = v12[*(unsigned __int8 *)(v67 + v70)];
                        v71[v70] = v72;
                        if (v63 <= v72)
                        {
                          v73 = scn_default_log();
                          if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT)) {
                            -[SCNGeometry(SCNUtils) _geometryByWeldingVerticesWithThreshold:normalThreshold:](v112, &v113, v73);
                          }
                        }
                        break;
                    }
                    ++v70;
                  }
                  while (v68 != v70);
                }
                if (__dstb) {
                  memcpy(v93, (const void *)objc_msgSend((id)objc_msgSend(v65, "data"), "bytes"), __dstb);
                }
                objc_msgSend(v85, "addObject:", +[SCNGeometryElement geometryElementWithData:primitiveType:primitiveCount:bytesPerIndex:](SCNGeometryElement, "geometryElementWithData:primitiveType:primitiveCount:bytesPerIndex:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", v93, v91, 1), objc_msgSend(v65, "primitiveType"), objc_msgSend(v65, "primitiveCount"), v66));
              }
              uint64_t v88 = [(NSArray *)v82 countByEnumeratingWithState:&v97 objects:v114 count:16];
            }
            while (v88);
          }
          uint64_t v6 = +[SCNGeometry geometryWithSources:v87 elements:v85];
          [(SCNGeometry *)v6 setName:[(SCNGeometry *)v79 name]];
          [(SCNGeometry *)v6 setMaterials:[(SCNGeometry *)v79 materials]];
          uint64_t v10 = v80;
        }
        else
        {
          uint64_t v6 = v79;
        }
        break;
      }
    }
  }
  free(v10);
  free(v12);
  return v6;
}

- (id)debugQuickLookObject
{
  uint64_t v2 = +[SCNNode nodeWithGeometry:self];

  return [(SCNNode *)v2 debugQuickLookObject];
}

- (id)debugQuickLookData
{
  uint64_t v2 = [(SCNGeometry *)self debugQuickLookObject];

  return UIImagePNGRepresentation(v2);
}

- (void)setName:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setBoundingBoxMin:max:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)insertObject:(uint64_t)a3 inMaterialsAtIndex:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeObjectFromMaterialsAtIndex:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setEdgeCreasesElement:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setEdgeCreasesSource:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_shadableSetValue:forUndefinedKey:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setShaderModifiers:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)copyShaderModifiersAndLanguageVersionFrom:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setMinimumLanguageVersion:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setProgram:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)_customEncodingOfSCNGeometry:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Failed to archive geometry's custom attributes. %@ %@", (uint8_t *)&v3, 0x16u);
}

@end