@interface SCNScene
+ (BOOL)canImportFileExtension:(id)a3;
+ (BOOL)canImportFileUTI:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (SCNScene)scene;
+ (SCNScene)sceneNamed:(NSString *)name;
+ (SCNScene)sceneNamed:(NSString *)name inDirectory:(NSString *)directory options:(NSDictionary *)options;
+ (SCNScene)sceneWithData:(id)a3 atIndex:(int64_t)a4 options:(id)a5;
+ (SCNScene)sceneWithData:(id)a3 options:(id)a4;
+ (SCNScene)sceneWithMDLAsset:(MDLAsset *)mdlAsset;
+ (SCNScene)sceneWithMDLAsset:(id)a3 options:(id)a4;
+ (SCNScene)sceneWithSceneRef:(__C3DScene *)a3;
+ (SCNScene)sceneWithURL:(NSURL *)url options:(NSDictionary *)options error:(NSError *)error;
+ (SCNScene)sceneWithURL:(id)a3 atIndex:(int64_t)a4 options:(id)a5;
+ (SCNScene)sceneWithURL:(id)a3 options:(id)a4;
+ (SEL)jsConstructor;
+ (id)_indexPathForNode:(id)a3;
+ (id)sceneNamed:(id)a3 options:(id)a4;
+ (id)supportedFileUTIsForExport;
+ (id)supportedFileUTIsForImport;
- (BOOL)_allowsDefaultLightingEnvironmentFallback;
- (BOOL)isPaused;
- (BOOL)isPausedForEditing;
- (BOOL)isPausedOrPausedByInheritance;
- (BOOL)wantsScreenSpaceReflection;
- (BOOL)writeToURL:(NSURL *)url options:(NSDictionary *)options delegate:(id)delegate progressHandler:(SCNSceneExportProgressHandler)progressHandler;
- (BOOL)writeToURL:(id)a3 options:(id)a4;
- (BOOL)writeToURLWithUSDKit:(id)a3;
- (CGFloat)fogDensityExponent;
- (CGFloat)fogEndDistance;
- (CGFloat)fogStartDistance;
- (CGFloat)screenSpaceReflectionMaximumDistance;
- (CGFloat)screenSpaceReflectionStride;
- (NSArray)particleSystems;
- (NSInteger)screenSpaceReflectionSampleCount;
- (SCNMaterialProperty)background;
- (SCNMaterialProperty)lightingEnvironment;
- (SCNNode)rootNode;
- (SCNPhysicsWorld)physicsWorld;
- (SCNScene)init;
- (SCNScene)initWithCoder:(id)a3;
- (SCNScene)initWithSceneRef:(__C3DScene *)a3;
- (SCNVector3)upAxis;
- (__C3DScene)sceneRef;
- (double)endTime;
- (double)frameRate;
- (double)screenSpaceReflectionDepthThreshold;
- (double)startTime;
- (float)playbackSpeed;
- (id)_exportAsMovieOperationWithDestinationURL:(id)a3 size:(CGSize)a4 attributes:(id)a5 delegate:(id)a6 didEndSelector:(SEL)a7 userInfo:(void *)a8;
- (id)_nodeWithIndexPath:(id)a3;
- (id)_physicsWorldCreateIfNeeded:(BOOL)a3;
- (id)_scenes;
- (id)_subnodeFromIndexPath:(id)a3;
- (id)attributeForKey:(NSString *)key;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyAnimationChannelForKeyPath:(id)a3 property:(id)a4;
- (id)debugQuickLookObject;
- (id)debugQuickLookObjectWithPointOfView:(id)a3;
- (id)fogColor;
- (id)initForJavascript:(id)a3;
- (id)root;
- (id)rootNodeForLayer:(int)a3;
- (id)sceneSource;
- (id)valueForUndefinedKey:(id)a3;
- (void)__CFObject;
- (void)_clearSceneRef;
- (void)_customDecodingOfSCNScene:(id)a3;
- (void)_customEncodingOfSCNScene:(id)a3;
- (void)_didDecodeSCNScene:(id)a3;
- (void)_dumpToDisk;
- (void)_prettifyForPreview;
- (void)_resetSceneTimeRange;
- (void)_scaleSceneBy:(double)a3;
- (void)_setRootNode:(id)a3;
- (void)_setSourceURL:(id)a3;
- (void)_syncObjCModel;
- (void)addParticleSystem:(SCNParticleSystem *)system withTransform:(SCNMatrix4 *)transform;
- (void)addSceneAnimation:(id)a3 forKey:(id)a4 target:(id)a5;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)lock;
- (void)removeAllParticleSystems;
- (void)removeParticleSystem:(SCNParticleSystem *)system;
- (void)root;
- (void)setAttribute:(id)attribute forKey:(NSString *)key;
- (void)setEndTime:(double)a3;
- (void)setFogColor:(id)fogColor;
- (void)setFogDensityExponent:(CGFloat)fogDensityExponent;
- (void)setFogEndDistance:(CGFloat)fogEndDistance;
- (void)setFogStartDistance:(CGFloat)fogStartDistance;
- (void)setFrameRate:(double)a3;
- (void)setPaused:(BOOL)paused;
- (void)setPausedForEditing:(BOOL)a3;
- (void)setPlaybackSpeed:(float)a3;
- (void)setRootNode:(id)a3 forLayer:(int)a4;
- (void)setSceneSource:(id)a3;
- (void)setScreenSpaceReflectionMaximumDistance:(CGFloat)screenSpaceReflectionMaximumDistance;
- (void)setScreenSpaceReflectionSampleCount:(NSInteger)screenSpaceReflectionSampleCount;
- (void)setScreenSpaceReflectionStride:(CGFloat)screenSpaceReflectionStride;
- (void)setStartTime:(double)a3;
- (void)setUpAxis:(SCNVector3)a3;
- (void)setWantsScreenSpaceReflection:(BOOL)wantsScreenSpaceReflection;
- (void)set_allowsDefaultLightingEnvironmentFallback:(BOOL)a3;
- (void)unlock;
@end

@implementation SCNScene

double __24__SCNScene_setFogColor___block_invoke(uint64_t a1)
{
  v4.n128_u64[0] = C3DColor4FromRGBCFColor(*(const void **)(a1 + 32), 0);
  v4.n128_u64[1] = v2;
  *(void *)&double result = C3DSceneSetFogColor((__n128 *)*(void *)(*(void *)(a1 + 40) + 8), &v4).n128_u64[0];
  return result;
}

- (void)__CFObject
{
  return self->_scene;
}

- (SCNMaterialProperty)background
{
  double result = self->_background;
  if (!result)
  {
    double result = [[SCNMaterialProperty alloc] initWithParent:self propertyType:24];
    self->_background = result;
  }
  return result;
}

+ (SCNScene)scene
{
  id v2 = objc_alloc_init((Class)a1);

  return (SCNScene *)v2;
}

- (SCNScene)init
{
  v8.receiver = self;
  v8.super_class = (Class)SCNScene;
  id v2 = [(SCNScene *)&v8 init];
  if (v2)
  {
    uint64_t v3 = C3DSceneCreate();
    *((void *)v2 + 1) = v3;
    if (v3) {
      C3DEntitySetObjCWrapper(v3, v2);
    }
    [v2 _syncObjCModel];
    if (!*((void *)v2 + 4))
    {
      uint64_t v4 = [v2 sceneRef];
      uint64_t v5 = v4;
      if (v4) {
        C3DSceneLock(v4);
      }
      if (!*((void *)v2 + 4))
      {
        uint64_t v6 = *((void *)v2 + 1);
        if (v6)
        {
          C3DSceneLock(v6);
          if (C3DSceneGetRootNode(*((void *)v2 + 1))) {
            *((void *)v2 + 4) = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:");
          }
          else {
            objc_msgSend(v2, "_setRootNode:", +[SCNNode node](SCNNode, "node"));
          }
          C3DSceneUnlock(*((void *)v2 + 1));
        }
      }
      if (v5) {
        C3DSceneUnlock(v5);
      }
    }
  }
  return (SCNScene *)v2;
}

- (void)_syncObjCModel
{
  self->_fogStartDistance = C3DSceneGetFogStartDistance((uint64_t)self->_scene);
  self->_fogEndDistance = C3DSceneGetFogEndDistance((uint64_t)self->_scene);
  self->_fogDensityExponent = C3DSceneGetFogDensityExponent((uint64_t)self->_scene);
  self->_wantsScreenSpaceReflection = C3DSceneGetWantsSSR((uint64_t)self->_scene);
  self->_screenSpaceReflectionSampleCount = C3DSceneGetSSRSampleCount((uint64_t)self->_scene);
  self->_screenSpaceReflectionMaxRayDistance = C3DSceneGetSSRMaxRayDistance((uint64_t)self->_scene);
  self->_screenSpaceReflectionStride = C3DSceneGetSSRStride((uint64_t)self->_scene);
  uint64_t FogColor = C3DSceneGetFogColor((uint64_t)self->_scene);

  self->_fogColor = (id)objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", FogColor);
}

- (void)_setRootNode:(id)a3
{
  rootNode = self->_rootNode;
  if (rootNode != a3)
  {

    self->_rootNode = (SCNNode *)a3;
    self->_layerRootNode[0] = (SCNNode *)a3;
    uint64_t v6 = [(SCNScene *)self sceneRef];
    if (v6)
    {
      uint64_t v7 = (uint64_t)v6;
      C3DSceneLock((uint64_t)v6);
      C3DSceneSetRootNode((uint64_t)self->_scene, (uint64_t *)[a3 nodeRef]);
      C3DSceneUnlock(v7);
    }
    else
    {
      scene = self->_scene;
      v9 = (uint64_t *)[a3 nodeRef];
      C3DSceneSetRootNode((uint64_t)scene, v9);
    }
  }
}

- (void)setFogColor:(id)fogColor
{
  if (self->_fogColor != fogColor && (objc_msgSend(fogColor, "isEqual:") & 1) == 0)
  {

    self->_fogColor = fogColor;
    uint64_t v5 = [(SCNScene *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __24__SCNScene_setFogColor___block_invoke;
    v6[3] = &unk_264006160;
    v6[4] = fogColor;
    v6[5] = self;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"fogColor" applyBlock:v6];
  }
}

- (__C3DScene)sceneRef
{
  return self->_scene;
}

- (id)attributeForKey:(NSString *)key
{
  if ([(NSString *)key isEqualToString:@"kSceneStartTimeAttributeKey"])
  {
    uint64_t v5 = NSNumber;
    [(SCNScene *)self startTime];
LABEL_7:
    return (id)objc_msgSend(v5, "numberWithDouble:");
  }
  if ([(NSString *)key isEqualToString:@"kSceneEndTimeAttributeKey"])
  {
    uint64_t v5 = NSNumber;
    [(SCNScene *)self endTime];
    goto LABEL_7;
  }
  if ([(NSString *)key isEqualToString:@"kSceneFrameRateAttributeKey"])
  {
    uint64_t v5 = NSNumber;
    [(SCNScene *)self frameRate];
    goto LABEL_7;
  }
  if ([(NSString *)key isEqualToString:@"kSceneUpAxisAttributeKey"])
  {
    uint64_t v7 = (void *)MEMORY[0x263F08D40];
    [(SCNScene *)self upAxis];
    return (id)objc_msgSend(v7, "valueWithSCNVector3:");
  }
  else
  {
    userAttributes = self->_userAttributes;
    return (id)[(NSMutableDictionary *)userAttributes objectForKey:key];
  }
}

- (SCNVector3)upAxis
{
  scene = self->_scene;
  if (scene)
  {
    v6.n128_u32[2] = 0;
    v6.n128_u64[0] = 0;
    C3DSceneGetUpAxis((__n128 *)scene, &v6);
    float v4 = v6.n128_f32[1];
    float v3 = v6.n128_f32[0];
    float v5 = v6.n128_f32[2];
  }
  else
  {
    float v4 = 1.0;
    float v5 = 0.0;
    float v3 = 0.0;
  }
  result.z = v5;
  result.y = v4;
  result.x = v3;
  return result;
}

- (SCNNode)rootNode
{
  if (!self->_rootNode)
  {
    float v3 = [(SCNScene *)self sceneRef];
    uint64_t v4 = (uint64_t)v3;
    if (v3) {
      C3DSceneLock((uint64_t)v3);
    }
    if (!self->_rootNode)
    {
      scene = self->_scene;
      if (scene)
      {
        C3DSceneLock((uint64_t)scene);
        if (C3DSceneGetRootNode((uint64_t)self->_scene)) {
          self->_rootNode = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:");
        }
        else {
          [(SCNScene *)self _setRootNode:+[SCNNode node]];
        }
        C3DSceneUnlock((uint64_t)self->_scene);
      }
    }
    if (v4) {
      C3DSceneUnlock(v4);
    }
  }
  __n128 v6 = self->_rootNode;

  return v6;
}

- (SCNMaterialProperty)lightingEnvironment
{
  SCNVector3 result = self->_environment;
  if (!result)
  {
    SCNVector3 result = [[SCNMaterialProperty alloc] initWithParent:self propertyType:25];
    self->_environment = result;
  }
  return result;
}

+ (SCNScene)sceneWithMDLAsset:(MDLAsset *)mdlAsset
{
  return (SCNScene *)[a1 sceneWithMDLAsset:mdlAsset options:0];
}

+ (SCNScene)sceneWithMDLAsset:(id)a3 options:(id)a4
{
  uint64_t v154 = *MEMORY[0x263EF8340];
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v7 = objc_opt_new();
  obuint64_t j = (id)objc_opt_new();
  id v8 = objc_alloc_init((Class)a1);
  if (objc_opt_respondsToSelector())
  {
    [a3 upAxis];
    LODWORD(v10) = HIDWORD(v9);
    LODWORD(v12) = v11;
    objc_msgSend(v8, "setAttribute:forKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithSCNVector3:", v9, v10, v12), @"kSceneUpAxisAttributeKey");
  }
  v116 = (void *)v7;
  v142[0] = 0;
  v142[1] = 0;
  v141 = (uint64_t *)v142;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  uint64_t v13 = [a3 countByEnumeratingWithState:&v137 objects:v152 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v138;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v138 != v14) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend((id)objc_msgSend(v8, "rootNode"), "addChildNode:", +[SCNNode nodeWithMDLObject:masterObjects:sceneNodes:skinnedMeshes:skelNodesMap:asset:options:](SCNNode, "nodeWithMDLObject:masterObjects:sceneNodes:skinnedMeshes:skelNodesMap:asset:options:", *(void *)(*((void *)&v137 + 1) + 8 * i), v6, v7, obj, &v141, a3, a4));
      }
      uint64_t v13 = [a3 countByEnumeratingWithState:&v137 objects:v152 count:16];
    }
    while (v13);
  }

  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  v16 = (void *)v7;
  uint64_t v17 = [obj countByEnumeratingWithState:&v133 objects:v151 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v134;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v134 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v133 + 1) + 8 * j);
        v21 = objc_msgSend(v116, "objectForKeyedSubscript:", objc_msgSend(v20, "path"));
        if (v21) {
          [v21 _addSkinnerWithMDLMesh:v20 sceneNodes:v116];
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v133 objects:v151 count:16];
    }
    while (v17);
  }
  if (objc_msgSend((id)objc_msgSend(a3, "animations"), "count"))
  {
    v22 = objc_opt_new();
    unint64_t v23 = 0;
    id v113 = a3;
    v111 = v22;
    uint64_t v122 = *MEMORY[0x263F15AA8];
    id v112 = v8;
    while (v23 < objc_msgSend((id)objc_msgSend(a3, "animations"), "count"))
    {
      v24 = objc_msgSend((id)objc_msgSend(a3, "animations"), "objectAtIndexedSubscript:", v23);
      if (v24)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v128 = v24;
          int v121 = objc_msgSend((id)objc_msgSend(v24, "jointPaths"), "count");
          if (v121)
          {
            v25 = (void *)[a4 valueForKey:@"kSceneSourceAnimationLoadingMode"];
            v26 = v25;
            if (v25)
            {
              float v27 = 0.0;
              if ([v25 isEqualToString:@"playOnce"])
              {
                int v124 = 0;
                uint64_t v114 = 1;
              }
              else if ([v26 isEqualToString:@"playUsingSceneTime"])
              {
                uint64_t v114 = 0;
                int v124 = 1;
              }
              else
              {
                HIDWORD(v114) = [v26 isEqualToString:@"keepSeparate"];
                LODWORD(v114) = 0;
                int v124 = 0;
                if (HIDWORD(v114)) {
                  float v27 = 0.0;
                }
                else {
                  float v27 = INFINITY;
                }
              }
            }
            else
            {
              uint64_t v114 = 0;
              int v124 = 0;
              float v27 = INFINITY;
            }
            memptr = 0;
            v147 = 0;
            v148 = 0;
            v125 = objc_msgSend((id)objc_msgSend(v128, "translations"), "keyTimes");
            v127 = objc_msgSend((id)objc_msgSend(v128, "rotations"), "keyTimes");
            v126 = objc_msgSend((id)objc_msgSend(v128, "scales"), "keyTimes");
            uint64_t v28 = v127 != 0;
            if (v125) {
              ++v28;
            }
            if (v126) {
              uint64_t v29 = v28 + 1;
            }
            else {
              uint64_t v29 = v28;
            }
            int v30 = [v125 count];
            int v31 = [v127 count];
            int v32 = [v126 count];
            int v33 = v30 * v121;
            if (v125) {
              malloc_type_posix_memalign(&memptr, 0x10uLL, 16 * v33, 0x1000040451B5BE8uLL);
            }
            int v34 = v31 * v121;
            if (v127) {
              malloc_type_posix_memalign(&v148, 0x10uLL, 16 * v34, 0x1000040451B5BE8uLL);
            }
            int v35 = v32 * v121;
            if (v126) {
              malloc_type_posix_memalign(&v147, 0x10uLL, 16 * v35, 0x1000040451B5BE8uLL);
            }
            if (memptr)
            {
              v36 = (void *)[v128 translations];
              [v36 getFloat3Array:memptr maxCount:v33];
            }
            if (v148)
            {
              v37 = (void *)[v128 rotations];
              [v37 getFloatQuaternionArray:v148 maxCount:v34];
            }
            if (v147)
            {
              v38 = (void *)[v128 scales];
              [v38 getFloat3Array:v147 maxCount:v35];
            }
            objc_msgSend((id)objc_msgSend(v128, "translations"), "maximumTime");
            double v40 = v39;
            objc_msgSend((id)objc_msgSend(v128, "translations"), "minimumTime");
            double v42 = v41;
            objc_msgSend((id)objc_msgSend(v128, "rotations"), "maximumTime");
            double v44 = v43;
            objc_msgSend((id)objc_msgSend(v128, "rotations"), "minimumTime");
            double v46 = v45;
            objc_msgSend((id)objc_msgSend(v128, "scales"), "maximumTime");
            double v48 = v47;
            objc_msgSend((id)objc_msgSend(v128, "scales"), "minimumTime");
            double v50 = v49;
            v123 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(v128, "jointPaths"), "count") * v29);
            long long v145 = 0u;
            long long v146 = 0u;
            long long v143 = 0u;
            long long v144 = 0u;
            v51 = (void *)[v128 jointPaths];
            uint64_t v52 = [v51 countByEnumeratingWithState:&v143 objects:v153 count:16];
            double v53 = v40 - v42;
            double v54 = v44 - v46;
            if (v52)
            {
              int v55 = 0;
              id v118 = v51;
              uint64_t v119 = *(void *)v144;
              do
              {
                uint64_t v56 = 0;
                uint64_t v57 = (16 * v55) | 8;
                uint64_t v120 = v52;
                do
                {
                  if (*(void *)v144 != v119) {
                    objc_enumerationMutation(v118);
                  }
                  v58 = *(void **)(*((void *)&v143 + 1) + 8 * v56);
                  if (v125)
                  {
                    v59 = NSString;
                    uint64_t v60 = [*(id *)(*((void *)&v143 + 1) + 8 * v56) rangeOfString:@"/" options:4];
                    uint64_t v61 = (uint64_t)v58;
                    if (v60 != 0x7FFFFFFFFFFFFFFFLL) {
                      uint64_t v61 = [v58 substringFromIndex:v60 + 1];
                    }
                    uint64_t v62 = [v59 stringWithFormat:@"/%@.position", v61];
                    v63 = (void *)[MEMORY[0x263F157D8] animationWithKeyPath:v62];
                    [v63 setDuration:v53];
                    objc_msgSend((id)objc_msgSend(v128, "translations"), "minimumTime");
                    double v65 = v64;
                    double v66 = 0.0;
                    if ((v124 & 1) == 0) {
                      objc_msgSend((id)objc_msgSend(v128, "translations", 0.0), "minimumTime");
                    }
                    [v63 setBeginTime:v65 - v66];
                    objc_msgSend((id)objc_msgSend(v128, "translations"), "minimumTime");
                    [v63 setFillMode:v122];
                    [v63 setRemovedOnCompletion:0];
                    [v123 addObject:v63];
                  }
                  if (v127)
                  {
                    v68 = (void *)MEMORY[0x263F157D8];
                    v69 = NSString;
                    uint64_t v70 = [v58 rangeOfString:@"/" options:4];
                    uint64_t v71 = (uint64_t)v58;
                    if (v70 != 0x7FFFFFFFFFFFFFFFLL) {
                      uint64_t v71 = [v58 substringFromIndex:v70 + 1];
                    }
                    v72 = (void *)[v68 animationWithKeyPath:objc_msgSend(v69, "stringWithFormat:", @"/%@.orientation", v71)];
                    [v72 setDuration:v54];
                    objc_msgSend((id)objc_msgSend(v128, "rotations"), "minimumTime");
                    double v74 = v73;
                    double v75 = 0.0;
                    if ((v124 & 1) == 0) {
                      objc_msgSend((id)objc_msgSend(v128, "rotations", 0.0), "minimumTime");
                    }
                    [v72 setBeginTime:v74 - v75];
                    objc_msgSend((id)objc_msgSend(v128, "rotations"), "minimumTime");
                    v77 = (char *)v148;
                    int v78 = [v127 count];
                    v79 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:v78];
                    if (v78 >= 1)
                    {
                      v84 = &v77[v57];
                      do
                      {
                        LODWORD(v80) = *((_DWORD *)v84 - 2);
                        LODWORD(v81) = *((_DWORD *)v84 - 1);
                        LODWORD(v82) = *(_DWORD *)v84;
                        LODWORD(v83) = *((_DWORD *)v84 + 1);
                        objc_msgSend(v79, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithSCNVector4:", v80, v81, v82, v83));
                        v84 += 16 * v121;
                        --v78;
                      }
                      while (v78);
                    }
                    [v72 setValues:v79];
                    [v72 setFillMode:v122];
                    [v72 setRemovedOnCompletion:0];
                    [v123 addObject:v72];
                  }
                  if (v126)
                  {
                    v85 = (void *)MEMORY[0x263F157D8];
                    v86 = NSString;
                    uint64_t v87 = [v58 rangeOfString:@"/" options:4];
                    if (v87 != 0x7FFFFFFFFFFFFFFFLL) {
                      v58 = (void *)[v58 substringFromIndex:v87 + 1];
                    }
                    v88 = (void *)[v85 animationWithKeyPath:objc_msgSend(v86, "stringWithFormat:", @"/%@.scale", v58)];
                    [v88 setDuration:v48 - v50];
                    objc_msgSend((id)objc_msgSend(v128, "scales"), "minimumTime");
                    double v90 = v89;
                    double v91 = 0.0;
                    if ((v124 & 1) == 0) {
                      objc_msgSend((id)objc_msgSend(v128, "scales", 0.0), "minimumTime");
                    }
                    [v88 setBeginTime:v90 - v91];
                    objc_msgSend((id)objc_msgSend(v128, "scales"), "minimumTime");
                    [v88 setFillMode:v122];
                    [v88 setRemovedOnCompletion:0];
                    [v123 addObject:v88];
                  }
                  ++v55;
                  ++v56;
                  v57 += 16;
                }
                while (v56 != v120);
                uint64_t v52 = [v118 countByEnumeratingWithState:&v143 objects:v153 count:16];
              }
              while (v52);
            }
            free(memptr);
            free(v148);
            free(v147);
            id v8 = v112;
            a3 = v113;
            v16 = v116;
            v22 = v111;
            v93 = (void *)[MEMORY[0x263F15750] animation];
            [v93 setAnimations:v123];
            [v93 setFillMode:v122];
            *(float *)&double v94 = v27;
            [v93 setRepeatCount:v94];
            [v93 setRemovedOnCompletion:v114];
            [v93 setUsesSceneTimeBase:v124 | HIDWORD(v114)];
            if (v124)
            {
              objc_msgSend((id)objc_msgSend(v128, "translations"), "maximumTime");
              double v96 = v95;
              objc_msgSend((id)objc_msgSend(v128, "rotations"), "maximumTime");
              double v98 = v97;
              objc_msgSend((id)objc_msgSend(v128, "scales"), "maximumTime");
              if (v96 >= v98) {
                double v100 = v96;
              }
              else {
                double v100 = v98;
              }
              if (v100 >= v99) {
                double v99 = v100;
              }
            }
            else
            {
              if (v53 >= v54) {
                double v99 = v53;
              }
              else {
                double v99 = v54;
              }
              if (v99 < v48 - v50) {
                double v99 = v48 - v50;
              }
            }
            [v93 setDuration:v99];
            if (v93) {
              objc_msgSend(v111, "setObject:forKeyedSubscript:", +[SCNAnimation animationWithCAAnimation:](SCNAnimation, "animationWithCAAnimation:", v93), objc_msgSend(v128, "name"));
            }
          }
        }
      }
      ++v23;
    }
  }
  else
  {
    v22 = 0;
  }
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  uint64_t v101 = [a3 countByEnumeratingWithState:&v129 objects:v150 count:16];
  if (v101)
  {
    uint64_t v102 = *(void *)v130;
    do
    {
      for (uint64_t k = 0; k != v101; ++k)
      {
        if (*(void *)v130 != v102) {
          objc_enumerationMutation(a3);
        }
      }
      uint64_t v101 = [a3 countByEnumeratingWithState:&v129 objects:v150 count:16];
    }
    while (v101);
  }
  v104 = v141;
  if (v141 != (uint64_t *)v142)
  {
    do
    {
      v105 = (void *)v104[5];
      if (v105) {

      }
      v106 = (uint64_t *)v104[1];
      if (v106)
      {
        do
        {
          v107 = v106;
          v106 = (uint64_t *)*v106;
        }
        while (v106);
      }
      else
      {
        do
        {
          v107 = (uint64_t *)v104[2];
          BOOL v108 = *v107 == (void)v104;
          v104 = v107;
        }
        while (!v108);
      }
      v104 = v107;
    }
    while (v107 != (uint64_t *)v142);
  }
  if (v22) {

  }
  [v8 _resetSceneTimeRange];
  [a3 startTime];
  objc_msgSend(v8, "setStartTime:");
  [a3 endTime];
  objc_msgSend(v8, "setEndTime:");
  v109 = (SCNScene *)v8;
  return v109;
}

- (SCNScene)initWithSceneRef:(__C3DScene *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SCNScene;
  id v4 = [(SCNScene *)&v8 init];
  if (v4)
  {
    CFTypeRef v5 = CFRetain(a3);
    *((void *)v4 + 1) = v5;
    if (v5) {
      C3DEntitySetObjCWrapper((uint64_t)v5, v4);
    }
    [v4 _syncObjCModel];
    if (!*((void *)v4 + 4))
    {
      uint64_t v6 = *((void *)v4 + 1);
      if (v6)
      {
        C3DSceneLock(v6);
        if (C3DSceneGetRootNode(*((void *)v4 + 1))) {
          *((void *)v4 + 4) = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:");
        }
        else {
          objc_msgSend(v4, "_setRootNode:", +[SCNNode node](SCNNode, "node"));
        }
        C3DSceneUnlock(*((void *)v4 + 1));
      }
    }
  }
  return (SCNScene *)v4;
}

+ (SCNScene)sceneNamed:(NSString *)name
{
  return (SCNScene *)[a1 sceneNamed:name inDirectory:0 options:0];
}

+ (SCNScene)sceneNamed:(NSString *)name inDirectory:(NSString *)directory options:(NSDictionary *)options
{
  double v9 = [(NSString *)name pathExtension];
  if (![(__CFString *)v9 length]) {
    double v9 = @"dae";
  }
  SCNVector3 result = (SCNScene *)objc_msgSend((id)SCNGetResourceBundle(), "URLForResource:withExtension:subdirectory:", -[NSString stringByDeletingPathExtension](name, "stringByDeletingPathExtension"), v9, directory);
  if (result)
  {
    return (SCNScene *)[a1 sceneWithURL:result options:options error:0];
  }
  return result;
}

+ (id)sceneNamed:(id)a3 options:(id)a4
{
  return (id)[a1 sceneNamed:a3 inDirectory:0 options:a4];
}

+ (SCNScene)sceneWithURL:(id)a3 options:(id)a4
{
  return (SCNScene *)[a1 sceneWithURL:a3 options:a4 error:0];
}

+ (SCNScene)sceneWithURL:(NSURL *)url options:(NSDictionary *)options error:(NSError *)error
{
  if (!url) {
    return 0;
  }
  objc_super v8 = +[SCNSceneSource sceneSourceWithURL:[(NSURL *)url URLByResolvingSymlinksInPath] options:options];
  if (!v8) {
    return 0;
  }

  return (SCNScene *)[(SCNSceneSource *)v8 sceneWithClass:a1 options:options error:error];
}

+ (SCNScene)sceneWithURL:(id)a3 atIndex:(int64_t)a4 options:(id)a5
{
  objc_super v8 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:a5];
  objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a4), @"kSceneSourceSceneIndexKey");

  return (SCNScene *)[a1 sceneWithURL:a3 options:v8 error:0];
}

+ (SCNScene)sceneWithData:(id)a3 atIndex:(int64_t)a4 options:(id)a5
{
  objc_super v8 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:a5];
  objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a4), @"kSceneSourceSceneIndexKey");

  return (SCNScene *)[a1 sceneWithData:a3 options:v8];
}

+ (SCNScene)sceneWithData:(id)a3 options:(id)a4
{
  SCNVector3 result = +[SCNSceneSource sceneSourceWithData:options:](SCNSceneSource, "sceneSourceWithData:options:", a3);
  if (result)
  {
    return [(SCNScene *)result sceneWithClass:a1 options:a4 error:0];
  }
  return result;
}

+ (SCNScene)sceneWithSceneRef:(__C3DScene *)a3
{
  SCNVector3 result = (SCNScene *)C3DEntityGetObjCWrapper((id *)a3);
  if (!result)
  {
    uint64_t v6 = (void *)[objc_alloc((Class)a1) initWithSceneRef:a3];
    return (SCNScene *)v6;
  }
  return result;
}

- (void)_clearSceneRef
{
  scene = self->_scene;
  if (scene)
  {
    C3DEntitySetObjCWrapper((uint64_t)scene, 0);
    id v4 = self->_scene;
    if (v4) {
      CFRelease(v4);
    }
    self->_scene = 0;
  }
}

- (void)setUpAxis:(SCNVector3)a3
{
  scene = self->_scene;
  if (scene)
  {
    float y = a3.y;
    v5.n128_u32[2] = LODWORD(a3.z);
    v5.n128_u64[0] = *(void *)&a3.x;
    C3DSceneSetUpAxis((__n128 *)scene, &v5);
  }
}

- (void)dealloc
{
  [(SCNPhysicsWorld *)self->_physicsWorld sceneWillDie];
  scene = self->_scene;
  if (scene)
  {
    C3DEntitySetObjCWrapper((uint64_t)scene, 0);
    id v4 = self->_scene;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __19__SCNScene_dealloc__block_invoke;
    v7[3] = &__block_descriptor_40_e8_v16__0d8l;
    v7[4] = v4;
    +[SCNTransaction postCommandWithContext:0 object:0 applyBlock:v7];
  }

  [(SCNMaterialProperty *)self->_background parentWillDie:self];
  [(SCNMaterialProperty *)self->_environment parentWillDie:self];

  for (uint64_t i = 40; i != 72; i += 8)
  v6.receiver = self;
  v6.super_class = (Class)SCNScene;
  [(SCNScene *)&v6 dealloc];
}

void __19__SCNScene_dealloc__block_invoke(uint64_t a1)
{
}

- (void)_setSourceURL:(id)a3
{
  sourceURL = self->_sourceURL;
  if (sourceURL != a3)
  {

    self->_sourceURL = (NSURL *)a3;
  }
}

- (id)_scenes
{
  return (id)[MEMORY[0x263EFF8C0] arrayWithObject:self];
}

- (void)setSceneSource:(id)a3
{
  sceneSource = self->_sceneSource;
  if (sceneSource != a3)
  {

    self->_sceneSource = (SCNSceneSource *)a3;
  }
}

- (id)sceneSource
{
  return self->_sceneSource;
}

- (id)root
{
  if ((root_done & 1) == 0)
  {
    root_done = 1;
    float v3 = scn_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      [(SCNScene *)v3 root];
    }
  }
  return [(SCNScene *)self rootNode];
}

- (void)setRootNode:(id)a3 forLayer:(int)a4
{
  layerRootNode = self->_layerRootNode;
  uint64_t v5 = self->_layerRootNode[a4];
  if (v5 != a3)
  {
    if (a4)
    {

      layerRootNode[a4] = (SCNNode *)a3;
      uint64_t v9 = [(SCNScene *)self sceneRef];
      if (v9)
      {
        uint64_t v10 = (uint64_t)v9;
        C3DSceneLock((uint64_t)v9);
        C3DSceneSetLayerRootNode((uint64_t)self->_scene, a4, (void *)[a3 nodeRef]);
        C3DSceneUnlock(v10);
      }
      else
      {
        scene = self->_scene;
        double v12 = (void *)[a3 nodeRef];
        C3DSceneSetLayerRootNode((uint64_t)scene, a4, v12);
      }
    }
    else
    {
      -[SCNScene _setRootNode:](self, "_setRootNode:");
    }
  }
}

- (id)rootNodeForLayer:(int)a3
{
  return self->_layerRootNode[a3];
}

- (void)_scaleSceneBy:(double)a3
{
  uint64_t v5 = [(SCNScene *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __26__SCNScene__scaleSceneBy___block_invoke;
  v6[3] = &unk_264004FC0;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:0 applyBlock:v6];
}

void __26__SCNScene__scaleSceneBy___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sceneRef];
  float v3 = *(double *)(a1 + 40);

  C3DApplyScaleFactorOnScene(v2, v3);
}

+ (BOOL)canImportFileUTI:(id)a3
{
  if ([a3 isEqualToString:@"org.khronos.collada.digital-asset-exchange"]) {
    return 1;
  }

  return [a3 hasPrefix:@"com.apple.scenekit"];
}

+ (BOOL)canImportFileExtension:(id)a3
{
  float v3 = (void *)[a3 lowercaseString];
  if (([v3 isEqualToString:@"dae"] & 1) != 0
    || ([v3 isEqualToString:@"c3d"] & 1) != 0
    || ([v3 isEqualToString:@"scn"] & 1) != 0
    || ([v3 isEqualToString:@"scnz"] & 1) != 0)
  {
    return 1;
  }
  uint64_t v5 = (void *)MEMORY[0x263F135E8];

  return [v5 canImportFileExtension:v3];
}

+ (id)supportedFileUTIsForImport
{
  uint64_t v2 = (void *)[MEMORY[0x263EFF980] array];
  [v2 addObjectsFromArray:&unk_26BFC1798];
  return v2;
}

+ (id)supportedFileUTIsForExport
{
  uint64_t v2 = (void *)[MEMORY[0x263EFF980] array];
  [v2 addObjectsFromArray:&unk_26BFC17B0];
  return v2;
}

- (SCNPhysicsWorld)physicsWorld
{
  return (SCNPhysicsWorld *)[(SCNScene *)self _physicsWorldCreateIfNeeded:1];
}

- (id)_physicsWorldCreateIfNeeded:(BOOL)a3
{
  id result = self->_physicsWorld;
  if (result) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    id result = [[SCNPhysicsWorld alloc] initWithScene:self];
    self->_physicsWorld = (SCNPhysicsWorld *)result;
  }
  return result;
}

- (void)_resetSceneTimeRange
{
  uint64_t v9 = 0;
  uint64_t v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  float v3 = [(SCNScene *)self rootNode];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__SCNScene__resetSceneTimeRange__block_invoke;
  v4[3] = &unk_264008840;
  v4[4] = &v9;
  v4[5] = &v5;
  [(SCNNode *)v3 enumerateHierarchyUsingBlock:v4];
  [(SCNScene *)self setStartTime:v10[3]];
  [(SCNScene *)self setEndTime:v6[3]];
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
}

uint64_t __32__SCNScene__resetSceneTimeRange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = objc_msgSend(a2, "animationKeys", 0);
  uint64_t result = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)[a2 animationPlayerForKey:*(void *)(*((void *)&v17 + 1) + 8 * v8)];
        if (objc_msgSend((id)objc_msgSend(v9, "animation"), "usesSceneTimeBase"))
        {
          objc_msgSend((id)objc_msgSend(v9, "animation"), "startDelay");
          double v11 = v10;
          objc_msgSend((id)objc_msgSend(v9, "animation"), "duration");
          double v13 = v11 + v12;
          uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
          double v15 = *(double *)(v14 + 24);
          if (v11 < v15) {
            double v15 = v11;
          }
          *(double *)(v14 + 24) = v15;
          uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
          if (v13 < *(double *)(v16 + 24)) {
            double v13 = *(double *)(v16 + 24);
          }
          *(double *)(v16 + 24) = v13;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t result = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v6 = result;
    }
    while (result);
  }
  return result;
}

- (double)startTime
{
  float v3 = [(SCNScene *)self sceneRef];
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    C3DSceneLock((uint64_t)v3);
    double StartTime = C3DSceneGetStartTime((uint64_t)self->_scene);
    C3DSceneUnlock(v4);
    return StartTime;
  }
  else
  {
    scene = self->_scene;
    return C3DSceneGetStartTime((uint64_t)scene);
  }
}

- (void)setStartTime:(double)a3
{
  uint64_t v5 = [(SCNScene *)self sceneRef];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    C3DSceneLock((uint64_t)v5);
    C3DSceneSetStartTime((uint64_t)self->_scene, a3);
    C3DSceneUnlock(v6);
  }
  else
  {
    scene = self->_scene;
    C3DSceneSetStartTime((uint64_t)scene, a3);
  }
}

- (double)endTime
{
  float v3 = [(SCNScene *)self sceneRef];
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    C3DSceneLock((uint64_t)v3);
    double EndTime = C3DSceneGetEndTime((uint64_t)self->_scene);
    C3DSceneUnlock(v4);
    return EndTime;
  }
  else
  {
    scene = self->_scene;
    return C3DSceneGetEndTime((uint64_t)scene);
  }
}

- (void)setEndTime:(double)a3
{
  uint64_t v5 = [(SCNScene *)self sceneRef];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    C3DSceneLock((uint64_t)v5);
    C3DSceneSetEndTime((uint64_t)self->_scene, a3);
    C3DSceneUnlock(v6);
  }
  else
  {
    scene = self->_scene;
    C3DSceneSetEndTime((uint64_t)scene, a3);
  }
}

- (double)frameRate
{
  float v3 = [(SCNScene *)self sceneRef];
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    C3DSceneLock((uint64_t)v3);
    float FrameRate = C3DSceneGetFrameRate((uint64_t)self->_scene);
    C3DSceneUnlock(v4);
  }
  else
  {
    return C3DSceneGetFrameRate((uint64_t)self->_scene);
  }
  return FrameRate;
}

- (void)setFrameRate:(double)a3
{
  uint64_t v5 = [(SCNScene *)self sceneRef];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    C3DSceneLock((uint64_t)v5);
    float v7 = a3;
    C3DSceneSetFrameRate((uint64_t)self->_scene, v7);
    C3DSceneUnlock(v6);
  }
  else
  {
    scene = self->_scene;
    float v9 = a3;
    C3DSceneSetFrameRate((uint64_t)scene, v9);
  }
}

- (float)playbackSpeed
{
  float v3 = [(SCNScene *)self sceneRef];
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    C3DSceneLock((uint64_t)v3);
    float PlaybackSpeed = C3DSceneGetPlaybackSpeed((uint64_t)self->_scene);
    C3DSceneUnlock(v4);
    return PlaybackSpeed;
  }
  else
  {
    scene = self->_scene;
    return C3DSceneGetPlaybackSpeed((uint64_t)scene);
  }
}

- (void)setPlaybackSpeed:(float)a3
{
  uint64_t v5 = [(SCNScene *)self sceneRef];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    C3DSceneLock((uint64_t)v5);
    C3DSceneSetPlaybackSpeed((uint64_t)self->_scene, a3);
    C3DSceneUnlock(v6);
  }
  else
  {
    scene = self->_scene;
    C3DSceneSetPlaybackSpeed((uint64_t)scene, a3);
  }
}

- (void)setAttribute:(id)attribute forKey:(NSString *)key
{
  if ([(NSString *)key isEqualToString:@"kSceneStartTimeAttributeKey"])
  {
    [attribute doubleValue];
    -[SCNScene setStartTime:](self, "setStartTime:");
  }
  else if ([(NSString *)key isEqualToString:@"kSceneEndTimeAttributeKey"])
  {
    [attribute doubleValue];
    -[SCNScene setEndTime:](self, "setEndTime:");
  }
  else if ([(NSString *)key isEqualToString:@"kSceneFrameRateAttributeKey"])
  {
    [(SCNScene *)self frameRate];
    float v8 = v7;
    [attribute doubleValue];
    -[SCNScene setFrameRate:](self, "setFrameRate:");
    if (v8 != 0.0)
    {
      [(SCNScene *)self playbackSpeed];
      double v10 = v9;
      [attribute doubleValue];
      double v12 = v11 * v10 / v8;
      *(float *)&double v12 = v12;
      [(SCNScene *)self setPlaybackSpeed:v12];
    }
  }
  else if ([(NSString *)key isEqualToString:@"kSceneUpAxisAttributeKey"])
  {
    [attribute SCNVector3Value];
    -[SCNScene setUpAxis:](self, "setUpAxis:");
  }
  else
  {
    userAttributes = self->_userAttributes;
    if (attribute && !userAttributes)
    {
      userAttributes = (NSMutableDictionary *)(id)[MEMORY[0x263EFF9A0] dictionary];
      self->_userAttributes = userAttributes;
    }
    [(NSMutableDictionary *)userAttributes setValue:attribute forKey:key];
    if (![(NSMutableDictionary *)self->_userAttributes count])
    {

      self->_userAttributes = 0;
    }
  }
}

- (BOOL)_allowsDefaultLightingEnvironmentFallback
{
  return self->_allowsDefaultLightingEnvironmentFallback;
}

- (void)set_allowsDefaultLightingEnvironmentFallback:(BOOL)a3
{
  if (self->_allowsDefaultLightingEnvironmentFallback != a3)
  {
    self->_allowsDefaultLightingEnvironmentFallbacuint64_t k = a3;
    uint64_t v5 = [(SCNScene *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __57__SCNScene_set_allowsDefaultLightingEnvironmentFallback___block_invoke;
    v6[3] = &unk_264004FE8;
    v6[4] = self;
    BOOL v7 = a3;
    +[SCNTransaction postCommandWithContext:v5 object:0 applyBlock:v6];
  }
}

void __57__SCNScene_set_allowsDefaultLightingEnvironmentFallback___block_invoke(uint64_t a1)
{
}

- (id)fogColor
{
  return self->_fogColor;
}

- (CGFloat)fogEndDistance
{
  return self->_fogEndDistance;
}

- (void)setFogEndDistance:(CGFloat)fogEndDistance
{
  if (fogEndDistance >= 1.0e-35) {
    CGFloat v3 = fogEndDistance;
  }
  else {
    CGFloat v3 = 0.0;
  }
  if (v3 != self->_fogEndDistance)
  {
    self->_fogEndDistance = v3;
    uint64_t v5 = [(SCNScene *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __30__SCNScene_setFogEndDistance___block_invoke;
    v6[3] = &unk_264004FC0;
    v6[4] = self;
    *(CGFloat *)&void v6[5] = v3;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"fogEndDistance" applyBlock:v6];
  }
}

float __30__SCNScene_setFogEndDistance___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DSceneSetFogEndDistance(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)fogDensityExponent
{
  return self->_fogDensityExponent;
}

- (void)setFogDensityExponent:(CGFloat)fogDensityExponent
{
  if (self->_fogDensityExponent != fogDensityExponent)
  {
    self->_fogDensityExponent = fogDensityExponent;
    uint64_t v5 = [(SCNScene *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __34__SCNScene_setFogDensityExponent___block_invoke;
    v6[3] = &unk_264004FC0;
    v6[4] = self;
    *(CGFloat *)&void v6[5] = fogDensityExponent;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"fogDensityExponent" applyBlock:v6];
  }
}

float __34__SCNScene_setFogDensityExponent___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DSceneSetFogDensityExponent(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)fogStartDistance
{
  return self->_fogStartDistance;
}

- (void)setFogStartDistance:(CGFloat)fogStartDistance
{
  if (self->_fogStartDistance != fogStartDistance)
  {
    self->_fogStartDistance = fogStartDistance;
    uint64_t v5 = [(SCNScene *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __32__SCNScene_setFogStartDistance___block_invoke;
    v6[3] = &unk_264004FC0;
    v6[4] = self;
    *(CGFloat *)&void v6[5] = fogStartDistance;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"fogStartDistance" applyBlock:v6];
  }
}

float __32__SCNScene_setFogStartDistance___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DSceneSetFogStartDistance(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (BOOL)wantsScreenSpaceReflection
{
  return self->_wantsScreenSpaceReflection;
}

- (void)setWantsScreenSpaceReflection:(BOOL)wantsScreenSpaceReflection
{
  if (self->_wantsScreenSpaceReflection != wantsScreenSpaceReflection)
  {
    self->_wantsScreenSpaceReflection = wantsScreenSpaceReflection;
    uint64_t v5 = [(SCNScene *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __42__SCNScene_setWantsScreenSpaceReflection___block_invoke;
    v6[3] = &unk_264004FE8;
    v6[4] = self;
    BOOL v7 = wantsScreenSpaceReflection;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

void __42__SCNScene_setWantsScreenSpaceReflection___block_invoke(uint64_t a1)
{
}

- (NSInteger)screenSpaceReflectionSampleCount
{
  return self->_screenSpaceReflectionSampleCount;
}

- (void)setScreenSpaceReflectionSampleCount:(NSInteger)screenSpaceReflectionSampleCount
{
  if (self->_screenSpaceReflectionSampleCount != screenSpaceReflectionSampleCount)
  {
    self->_screenSpaceReflectionSampleCount = screenSpaceReflectionSampleCount;
    uint64_t v5 = [(SCNScene *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __48__SCNScene_setScreenSpaceReflectionSampleCount___block_invoke;
    v6[3] = &unk_264004FC0;
    v6[4] = self;
    void v6[5] = screenSpaceReflectionSampleCount;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

void __48__SCNScene_setScreenSpaceReflectionSampleCount___block_invoke(uint64_t a1)
{
}

- (double)screenSpaceReflectionDepthThreshold
{
  return 0.0;
}

- (CGFloat)screenSpaceReflectionMaximumDistance
{
  return self->_screenSpaceReflectionMaxRayDistance;
}

- (void)setScreenSpaceReflectionMaximumDistance:(CGFloat)screenSpaceReflectionMaximumDistance
{
  if (self->_screenSpaceReflectionMaxRayDistance != screenSpaceReflectionMaximumDistance)
  {
    self->_screenSpaceReflectionMaxRayDistance = screenSpaceReflectionMaximumDistance;
    uint64_t v5 = [(SCNScene *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __52__SCNScene_setScreenSpaceReflectionMaximumDistance___block_invoke;
    v6[3] = &unk_264004FC0;
    v6[4] = self;
    *(CGFloat *)&void v6[5] = screenSpaceReflectionMaximumDistance;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

float __52__SCNScene_setScreenSpaceReflectionMaximumDistance___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DSceneSetSSRMaxRayDistance(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)screenSpaceReflectionStride
{
  return self->_screenSpaceReflectionStride;
}

- (void)setScreenSpaceReflectionStride:(CGFloat)screenSpaceReflectionStride
{
  if (self->_screenSpaceReflectionStride != screenSpaceReflectionStride)
  {
    self->_screenSpaceReflectionStride = screenSpaceReflectionStride;
    uint64_t v5 = [(SCNScene *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __43__SCNScene_setScreenSpaceReflectionStride___block_invoke;
    v6[3] = &unk_264004FC0;
    v6[4] = self;
    *(CGFloat *)&void v6[5] = screenSpaceReflectionStride;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

float __43__SCNScene_setScreenSpaceReflectionStride___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DSceneSetSSRStride(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (BOOL)writeToURL:(NSURL *)url options:(NSDictionary *)options delegate:(id)delegate progressHandler:(SCNSceneExportProgressHandler)progressHandler
{
  if (options) {
    id v10 = (id)[(NSDictionary *)options mutableCopy];
  }
  else {
    id v10 = (id)[MEMORY[0x263EFF9A0] dictionary];
  }
  double v11 = v10;
  uint64_t v12 = [v10 valueForKey:@"kSceneSourceFormat"];
  if (v12)
  {
    double v13 = (void *)v12;
LABEL_6:
    int v14 = 0;
    goto LABEL_16;
  }
  double v15 = [(NSString *)[(NSURL *)url pathExtension] lowercaseString];
  if ([(NSString *)v15 isEqualToString:@"dae"])
  {
    int v14 = 0;
    uint64_t v16 = SCNSceneSourceFormatCOLLADA;
    goto LABEL_14;
  }
  if ([(NSString *)v15 isEqualToString:@"scn"])
  {
    int v14 = 0;
LABEL_11:
    uint64_t v16 = SCNSceneSourceFormatSCN;
    goto LABEL_14;
  }
  if (![(NSString *)v15 isEqualToString:@"c3d"])
  {
    if (![(NSString *)v15 isEqualToString:@"scnz"])
    {
      double v13 = 0;
      goto LABEL_6;
    }
    int v14 = 1;
    goto LABEL_11;
  }
  int v14 = 0;
  uint64_t v16 = SCNSceneSourceFormatC3D;
LABEL_14:
  double v13 = *v16;
  if (*v16) {
    [v11 setValue:*v16 forKey:@"kSceneSourceFormat"];
  }
LABEL_16:
  char v39 = 0;
  if ([v13 isEqualToString:@"scn"])
  {
    int v17 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", @"SCNSceneExportPresentationTree"), "BOOLValue");
    if (v17)
    {
      +[SCNTransaction lock];
      long long v18 = [(SCNScene *)self sceneRef];
      uint64_t v19 = (uint64_t)v18;
      if (v18) {
        C3DSceneLock((uint64_t)v18);
      }
    }
    else
    {
      uint64_t v19 = 0;
    }
    id v25 = +[SCNKeyedArchiver archivedDataWithRootObject:self options:v11];
    char v26 = v17 ^ 1;
    if (!v19) {
      char v26 = 1;
    }
    if ((v26 & 1) == 0)
    {
      C3DSceneUnlock(v19);
      +[SCNTransaction unlock];
    }
    if (v14) {
      id v25 = (id)objc_msgSend(v25, "scn_compressedDataUsingCompressionAlgorithm:", 517);
    }
    uint64_t v38 = 0;
    char v27 = [v25 writeToURL:url options:1 error:&v38];
    goto LABEL_38;
  }
  if (([v13 isEqualToString:@"c3d"] & 1) == 0
    && ![v13 isEqualToString:@"dae"])
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    int v34 = __56__SCNScene_writeToURL_options_delegate_progressHandler___block_invoke;
    int v35 = &unk_264008868;
    v36 = v13;
    v37 = url;
    if (v13)
    {
      if (([v13 isEqualToString:@"usd"] & 1) == 0
        && ([v13 isEqualToString:@"usda"] & 1) == 0
        && ([v13 isEqualToString:@"usdc"] & 1) == 0
        && ([v13 isEqualToString:@"usdz"] & 1) == 0)
      {
LABEL_55:
        if (C3DWasLinkedBeforeMajorOSYear2015() && !NSClassFromString(&cfstr_Mdlasset.isa)) {
          return 0;
        }
        uint64_t v38 = 0;
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __56__SCNScene_writeToURL_options_delegate_progressHandler___block_invoke_3;
        v31[3] = &unk_264008890;
        v31[4] = self;
        char v27 = v34((uint64_t)v33, (uint64_t)&v38, (uint64_t)v31);
        goto LABEL_38;
      }
    }
    else
    {
      int v30 = [(NSString *)[(NSURL *)url pathExtension] lowercaseString];
      if (![(NSString *)v30 isEqualToString:@"usd"]
        && ![(NSString *)v30 isEqualToString:@"usda"]
        && ![(NSString *)v30 isEqualToString:@"usdc"]
        && ![(NSString *)v30 isEqualToString:@"usdz"])
      {
        goto LABEL_55;
      }
    }
    uint64_t v38 = 0;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __56__SCNScene_writeToURL_options_delegate_progressHandler___block_invoke_2;
    v32[3] = &unk_264008890;
    v32[4] = self;
    char v27 = v34((uint64_t)v33, (uint64_t)&v38, (uint64_t)v32);
LABEL_38:
    BOOL v23 = v27;
    if (progressHandler)
    {
      v28.n128_u32[0] = 1.0;
      (*((void (**)(SCNSceneExportProgressHandler, uint64_t, char *, __n128))progressHandler + 2))(progressHandler, v38, &v39, v28);
    }
    return v23;
  }
  +[SCNTransaction flush];
  long long v20 = (void *)[v11 valueForKey:@"SCNSceneSourceInputSource"];
  if (v20)
  {
    objc_msgSend(v11, "setValue:forKey:", objc_msgSend(v20, "library"), @"kSceneSourceInputLibrary");
    [v11 removeObjectForKey:@"SCNSceneSourceInputSource"];
  }
  v21 = [(SCNScene *)self sceneRef];
  uint64_t v22 = (uint64_t)v21;
  if (v21) {
    C3DSceneLock((uint64_t)v21);
  }
  BOOL v23 = C3DIOWriteSceneToURL((const __CFURL *)url, [(SCNScene *)self sceneRef], (const __CFDictionary *)v11, delegate, (uint64_t)progressHandler);
  if (v22) {
    C3DSceneUnlock(v22);
  }
  if (progressHandler)
  {
    v24.n128_u32[0] = 1.0;
    (*((void (**)(SCNSceneExportProgressHandler, void, char *, __n128))progressHandler + 2))(progressHandler, 0, &v39, v24);
  }
  return v23;
}

uint64_t __56__SCNScene_writeToURL_options_delegate_progressHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 32)
    && !objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "pathExtension"), "lowercaseString")))
  {
    float v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, *(void *)(a1 + 40), 1, a2);
    if (v9
      && (uint64_t v10 = objc_msgSend(v9, "URLByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "lastPathComponent"), "stringByAppendingPathExtension:", *(void *)(a1 + 32))), (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, v10, a2)))
    {
      double v11 = (void *)[MEMORY[0x263F08850] defaultManager];
      uint64_t v12 = *(void *)(a1 + 40);
      return [v11 moveItemAtURL:v10 toURL:v12 error:a2];
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    BOOL v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16);
    return v7(a3, v6, a2);
  }
}

uint64_t __56__SCNScene_writeToURL_options_delegate_progressHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) writeToURLWithUSDKit:a2];
}

uint64_t __56__SCNScene_writeToURL_options_delegate_progressHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F135E8], "assetWithSCNScene:", objc_msgSend(*(id *)(a1 + 32), "scene"));

  return [v5 exportAssetToURL:a2 error:a3];
}

- (void)_dumpToDisk
{
  CGFloat v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "temporaryDirectory"), "path");
  uint64_t v4 = 0;
  do
  {
    uint64_t v5 = [v3 stringByAppendingPathComponent:objc_msgSend(NSString, "stringWithFormat:", @"sceneDump%d.scn", v4)];
    uint64_t v4 = (v4 + 1);
  }
  while ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:", v5) & 1) != 0);
  NSLog(&cfstr_DumpingSceneTo.isa, v5);
  uint64_t v6 = [NSURL fileURLWithPath:v5];

  [(SCNScene *)self writeToURL:v6 options:0 delegate:0 progressHandler:0];
}

- (void)lock
{
  uint64_t v2 = [(SCNScene *)self sceneRef];
  if (v2)
  {
    C3DSceneLock((uint64_t)v2);
  }
}

- (void)unlock
{
  uint64_t v2 = [(SCNScene *)self sceneRef];
  if (v2)
  {
    C3DSceneUnlock((uint64_t)v2);
  }
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  int v17 = 0;
  id v18 = 0;
  SCNKitSplitKVCPath(a3, &v18, (uint64_t *)&v17);
  if ([v18 isEqual:@"root"])
  {
    if (!self->_rootNode)
    {
      BOOL v7 = [(SCNScene *)self sceneRef];
      uint64_t v8 = (uint64_t)v7;
      if (v7) {
        C3DSceneLock((uint64_t)v7);
      }
      if (!self->_rootNode)
      {
        scene = self->_scene;
        if (scene)
        {
          C3DSceneLock((uint64_t)scene);
          if (C3DSceneGetRootNode((uint64_t)self->_scene)) {
            self->_rootNode = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:");
          }
          else {
            [(SCNScene *)self _setRootNode:+[SCNNode node]];
          }
          C3DSceneUnlock((uint64_t)self->_scene);
        }
      }
      if (v8) {
        C3DSceneUnlock(v8);
      }
    }
    id result = self->_rootNode;
    goto LABEL_27;
  }
  if ([a3 hasPrefix:@"/"])
  {
    if (!self->_rootNode) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
  int v10 = [a3 hasPrefix:@"children["];
  rootNode = self->_rootNode;
  if (v10)
  {
    if (!rootNode)
    {
LABEL_14:
      uint64_t v12 = [(SCNScene *)self sceneRef];
      uint64_t v13 = (uint64_t)v12;
      if (v12) {
        C3DSceneLock((uint64_t)v12);
      }
      if (!self->_rootNode)
      {
        int v14 = self->_scene;
        if (v14)
        {
          C3DSceneLock((uint64_t)v14);
          if (C3DSceneGetRootNode((uint64_t)self->_scene)) {
            self->_rootNode = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:");
          }
          else {
            [(SCNScene *)self _setRootNode:+[SCNNode node]];
          }
          C3DSceneUnlock((uint64_t)self->_scene);
        }
      }
      if (v13) {
        C3DSceneUnlock(v13);
      }
    }
LABEL_32:
    id result = self->_rootNode;
    id v16 = a3;
    return (id)[result copyAnimationChannelForKeyPath:v16 animation:a4];
  }
  id result = [(SCNNode *)rootNode childNodeWithName:v18 recursively:1];
  if (result)
  {
LABEL_27:
    id v16 = v17;
    return (id)[result copyAnimationChannelForKeyPath:v16 animation:a4];
  }
  return result;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 property:(id)a4
{
  if (self->_background == a4)
  {
    uint64_t v6 = kC3DModelPathBackgroundMap;
  }
  else
  {
    if (self->_environment != a4) {
      return 0;
    }
    uint64_t v6 = kC3DModelPathLightingEnvironmentMap;
  }
  BOOL v7 = (__CFString *)[NSString stringWithFormat:@"%@.%@", *v6, a3];

  return SCNCreateAnimationChannelWithObjectAndPath(self, v7);
}

- (id)valueForUndefinedKey:(id)a3
{
  if ([a3 hasPrefix:@"/"])
  {
    if (!self->_rootNode)
    {
      uint64_t v5 = [(SCNScene *)self sceneRef];
      uint64_t v6 = (uint64_t)v5;
      if (v5) {
        C3DSceneLock((uint64_t)v5);
      }
      if (!self->_rootNode)
      {
        scene = self->_scene;
        if (scene)
        {
          C3DSceneLock((uint64_t)scene);
          if (C3DSceneGetRootNode((uint64_t)self->_scene)) {
            self->_rootNode = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:");
          }
          else {
            [(SCNScene *)self _setRootNode:+[SCNNode node]];
          }
          C3DSceneUnlock((uint64_t)self->_scene);
        }
      }
      if (v6) {
        C3DSceneUnlock(v6);
      }
    }
    rootNode = self->_rootNode;
    return (id)[(SCNNode *)rootNode valueForKey:a3];
  }
  else
  {
    id result = [(SCNScene *)self attributeForKey:a3];
    if (!result)
    {
      float v9 = self->_rootNode;
      return [(SCNNode *)v9 childNodeWithName:a3 recursively:1];
    }
  }
  return result;
}

- (void)addSceneAnimation:(id)a3 forKey:(id)a4 target:(id)a5
{
  id v7 = (id)[a3 copy];
  [v7 setUsesSceneTimeBase:1];

  [a5 addAnimation:v7 forKey:a4];
}

- (void)addParticleSystem:(SCNParticleSystem *)system withTransform:(SCNMatrix4 *)transform
{
  if (system)
  {
    id v7 = [(SCNScene *)self sceneRef];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __44__SCNScene_addParticleSystem_withTransform___block_invoke;
    v17[3] = &unk_2640088B8;
    long long v8 = *(_OWORD *)&transform->m21;
    long long v18 = *(_OWORD *)&transform->m11;
    long long v19 = v8;
    long long v9 = *(_OWORD *)&transform->m41;
    long long v20 = *(_OWORD *)&transform->m31;
    long long v21 = v9;
    v17[4] = self;
    v17[5] = system;
    +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v17];
  }
  else
  {
    int v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SCNScene addParticleSystem:withTransform:]((uint64_t)self, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

double __44__SCNScene_addParticleSystem_withTransform___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  if (v2)
  {
    ParticleManager = C3DSceneGetParticleManager(v2, 1);
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = (const void *)objc_msgSend(*(id *)(a1 + 40), "__CFObject", C3DMatrix4x4FromSCNMatrix4(v6, a1 + 48).n128_f64[0]);
    return C3DParticleManagerAddSystem((uint64_t)ParticleManager, 0, v5, v6);
  }
  return result;
}

- (void)removeParticleSystem:(SCNParticleSystem *)system
{
  if (system)
  {
    uint64_t v5 = [(SCNScene *)self sceneRef];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __33__SCNScene_removeParticleSystem___block_invoke;
    v13[3] = &unk_264006160;
    v13[4] = self;
    v13[5] = system;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v13];
  }
  else
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNScene addParticleSystem:withTransform:]((uint64_t)self, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

void __33__SCNScene_removeParticleSystem___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  if (v2)
  {
    ParticleManager = C3DSceneGetParticleManager(v2, 0);
    if (ParticleManager)
    {
      uint64_t v4 = (uint64_t)ParticleManager;
      uint64_t v5 = objc_msgSend(*(id *)(a1 + 40), "__CFObject");
      C3DParticleManagerRemoveAllInstanceOfSystem(v4, v5);
    }
  }
}

- (void)removeAllParticleSystems
{
  CGFloat v3 = [(SCNScene *)self sceneRef];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__SCNScene_removeAllParticleSystems__block_invoke;
  v4[3] = &unk_264005010;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:v3 object:self applyBlock:v4];
}

void __36__SCNScene_removeAllParticleSystems__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  if (v1)
  {
    ParticleManager = C3DSceneGetParticleManager(v1, 0);
    if (ParticleManager)
    {
      C3DParticleManagerRemoveAllSystems((uint64_t)ParticleManager);
    }
  }
}

- (NSArray)particleSystems
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  CGFloat v3 = [(SCNScene *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  uint64_t v5 = [(SCNScene *)self __CFObject];
  if (v5 && (ParticleManager = C3DSceneGetParticleManager((uint64_t)v5, 0)) != 0)
  {
    ParticleSystemsForNode = C3DParticleManagerGetParticleSystemsForNode((uint64_t)ParticleManager, 0);
    uint64_t v8 = (NSArray *)objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[__CFArray count](ParticleSystemsForNode, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = [(__CFArray *)ParticleSystemsForNode countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(ParticleSystemsForNode);
          }
          [(NSArray *)v8 addObject:+[SCNParticleSystem particleSystemWithParticleSystemRef:*(void *)(*((void *)&v14 + 1) + 8 * i)]];
        }
        uint64_t v10 = [(__CFArray *)ParticleSystemsForNode countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return v8;
}

- (void)setPaused:(BOOL)paused
{
  if (self->_paused != paused)
  {
    BOOL v3 = paused;
    self->_paused = paused;
    uint64_t v5 = [(SCNScene *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __22__SCNScene_setPaused___block_invoke;
    v9[3] = &unk_264004FE8;
    v9[4] = self;
    BOOL v10 = v3;
    +[SCNTransaction postCommandWithContext:v5 object:0 applyBlock:v9];
    [(SCNNode *)[(SCNScene *)self rootNode] setPaused:v3];
    uint64_t v6 = [(SCNScene *)self __CFObject];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __22__SCNScene_setPaused___block_invoke_2;
    v7[3] = &__block_descriptor_41_e8_v16__0d8l;
    v7[4] = v6;
    BOOL v8 = v3;
    +[SCNTransaction postCommandWithContext:0 object:0 applyBlock:v7];
    +[SCNTransaction flush];
  }
}

uint64_t __22__SCNScene_setPaused___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sceneRef];
  char v3 = *(unsigned char *)(a1 + 40);

  return C3DSceneSetPaused(v2, v3);
}

uint64_t __22__SCNScene_setPaused___block_invoke_2(uint64_t a1)
{
  return C3DSceneSetPaused(*(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (BOOL)isPausedOrPausedByInheritance
{
  return self->_paused;
}

- (void)setPausedForEditing:(BOOL)a3
{
  if (self->_pausedForEditing != a3)
  {
    self->_pausedForEditing = a3;
    C3DSceneSetPausedForEditing((uint64_t)self->_scene);
  }
}

- (BOOL)isPausedForEditing
{
  return self->_pausedForEditing;
}

- (id)_nodeWithIndexPath:(id)a3
{
  uint64_t v4 = [(SCNScene *)self rootNode];
  uint64_t v5 = [a3 length];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    while (1)
    {
      unint64_t v8 = [a3 indexAtPosition:v7];
      if ([(NSArray *)[(SCNNode *)v4 childNodes] count] <= v8) {
        break;
      }
      ++v7;
      uint64_t v4 = [(NSArray *)[(SCNNode *)v4 childNodes] objectAtIndexedSubscript:v8];
      if (v6 == v7) {
        return v4;
      }
    }
    uint64_t v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SCNScene _nodeWithIndexPath:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
    return 0;
  }
  return v4;
}

+ (id)_indexPathForNode:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  uint64_t v4 = -1;
  size_t v5 = -8;
  id v6 = a3;
  do
  {
    id v6 = (id)[v6 parentNode];
    ++v4;
    v5 += 8;
  }
  while (v6);
  if (v4)
  {
    uint64_t v7 = malloc_type_malloc(v5, 0x100004000313F17uLL);
    unint64_t v8 = (void *)[v3 parentNode];
    if (!v8) {
      goto LABEL_9;
    }
    uint64_t v9 = v4 + 1;
    do
    {
      uint64_t v10 = v8;
      v7[v9 - 2] = [v8 indexOfChildNode:v3];
      unint64_t v8 = (void *)[v10 parentNode];
      --v9;
      id v3 = v10;
    }
    while (v8);
    if (v9 != 1)
    {
LABEL_9:
      uint64_t v11 = scn_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        +[SCNScene _indexPathForNode:](v11);
      }
    }
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F088C8]) initWithIndexes:v7 length:v4];
    free(v7);
    return v12;
  }
  else
  {
    uint64_t v14 = scn_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[SCNScene _indexPathForNode:]((uint64_t)v3, v14, v15, v16, v17, v18, v19, v20);
    }
    return 0;
  }
}

- (id)_subnodeFromIndexPath:(id)a3
{
  if (a3) {
    return (id)objc_msgSend(self, "_nodeWithIndexPath:");
  }
  return self;
}

- (id)initForJavascript:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)SCNScene;
  uint64_t v4 = [(SCNScene *)&v11 init];
  if (!v4) {
    return v4;
  }
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = (id)[NSURL URLWithString:a3];
      if (![v5 scheme]) {
        id v5 = (id)[NSURL fileURLWithPath:a3];
      }
    }
    else
    {
      id v5 = a3;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [[SCNSceneSource alloc] initWithURL:v5 options:0];
      uint64_t v7 = [(SCNSceneSource *)v6 _createSceneRefWithOptions:0 statusHandler:0];

      if (v7)
      {
        v4->_scene = (__C3DScene *)v7;
        p_scene = (uint64_t *)&v4->_scene;
LABEL_13:
        C3DEntitySetObjCWrapper(v7, v4);
        goto LABEL_14;
      }
      uint64_t v9 = scn_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v5;
        _os_log_impl(&dword_20B249000, v9, OS_LOG_TYPE_DEFAULT, "Warning: failed to load scene at %@", buf, 0xCu);
      }
    }
  }
  uint64_t v7 = C3DSceneCreate();
  v4->_scene = (__C3DScene *)v7;
  p_scene = (uint64_t *)&v4->_scene;
  if (v7) {
    goto LABEL_13;
  }
LABEL_14:
  if (!v4->_rootNode && *p_scene)
  {
    C3DSceneLock(*p_scene);
    if (C3DSceneGetRootNode(*p_scene)) {
      v4->_rootNode = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:");
    }
    else {
      [(SCNScene *)v4 _setRootNode:+[SCNNode node]];
    }
    C3DSceneUnlock(*p_scene);
  }
  return v4;
}

+ (SEL)jsConstructor
{
  return sel_initForJavascript_;
}

- (void)_customEncodingOfSCNScene:(id)a3
{
  [(SCNScene *)self endTime];
  objc_msgSend(a3, "encodeDouble:forKey:", @"endTime");
  [(SCNScene *)self startTime];
  objc_msgSend(a3, "encodeDouble:forKey:", @"startTime");
  [(SCNScene *)self frameRate];
  objc_msgSend(a3, "encodeDouble:forKey:", @"frameRate");
  [(SCNScene *)self upAxis];

  SCNEncodeVector3(a3, @"upAxis", v5, v6, v7);
}

- (void)_customDecodingOfSCNScene:(id)a3
{
  [a3 decodeDoubleForKey:@"endTime"];
  -[SCNScene setEndTime:](self, "setEndTime:");
  [a3 decodeDoubleForKey:@"startTime"];
  -[SCNScene setStartTime:](self, "setStartTime:");
  [a3 decodeDoubleForKey:@"frameRate"];
  -[SCNScene setFrameRate:](self, "setFrameRate:");
  v5.n128_f32[0] = SCNDecodeVector3(a3, @"upAxis");
  v5.n128_u32[1] = v6;
  v5.n128_u32[2] = v7;
  __n128 v8 = v5;
  C3DSceneSetUpAxis((__n128 *)self->_scene, &v8);
}

- (void)_didDecodeSCNScene:(id)a3
{
  if ((C3DMetalIsSupported() & 1) == 0)
  {
    uint64_t RootNode = C3DSceneGetRootNode((uint64_t)[(SCNScene *)self sceneRef]);
    C3DSplitMeshesIfNeededInNodeTree(RootNode, 0xFFFFLL);
  }
}

- (void)_prettifyForPreview
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  char v29 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  id v3 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v4 = [(SCNScene *)self rootNode];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __31__SCNScene__prettifyForPreview__block_invoke;
  v19[3] = &unk_264008900;
  v19[4] = v3;
  v19[5] = &v20;
  v19[6] = v28;
  v19[7] = v26;
  v19[8] = v24;
  [(SCNNode *)v4 enumerateHierarchyUsingBlock:v19];
  if (!*((unsigned char *)v21 + 24)) {
    [(SCNNode *)[(SCNScene *)self rootNode] enumerateHierarchyUsingBlock:&__block_literal_global_72];
  }
  if (![(SCNMaterialProperty *)[(SCNScene *)self lightingEnvironment] contents])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v3);
          }
          __n128 v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "light"), "type"), "isEqualToString:", @"omni"))
          {
            objc_msgSend((id)objc_msgSend(v8, "light"), "intensity");
            double v10 = v9;
            objc_super v11 = (void *)[v8 light];
            double v12 = v10 * 0.05;
          }
          else
          {
            objc_msgSend((id)objc_msgSend(v8, "light"), "intensity");
            double v14 = v13;
            objc_super v11 = (void *)[v8 light];
            double v12 = v14 * 0.5;
          }
          [v11 setIntensity:v12];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v30 count:16];
      }
      while (v5);
    }
    [(SCNScene *)self set_allowsDefaultLightingEnvironmentFallback:1];
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
}

uint64_t __31__SCNScene__prettifyForPreview__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "geometry", 0), "materials");
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "lightingModelName"), "isEqualToString:", @"SCNLightingModelPhysicallyBased"))*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1; {
        }
          }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) && [a2 camera]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  uint64_t result = [a2 light];
  if (result)
  {
    [*(id *)(a1 + 32) addObject:a2];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "light"), "type"), "isEqualToString:", @"omni");
    if (result) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
  }
  return result;
}

uint64_t __31__SCNScene__prettifyForPreview__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend((id)objc_msgSend(a2, "geometry", 0), "materials");
  uint64_t result = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        if (objc_msgSend((id)objc_msgSend(v7, "reflective"), "contents"))
        {
          objc_msgSend((id)objc_msgSend(v7, "reflective"), "contents");
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
        }
        else
        {
          char isKindOfClass = 1;
        }
        if (objc_msgSend((id)objc_msgSend(v7, "lightingModelName"), "isEqualToString:", @"SCNLightingModelPhysicallyBased") & 1) == 0&& (isKindOfClass)
        {
          [v7 setLightingModelName:@"SCNLightingModelPhysicallyBased"];
          objc_msgSend((id)objc_msgSend(v7, "metalness"), "setContents:", &unk_26BFC1808);
          objc_msgSend((id)objc_msgSend(v7, "specular"), "contents");
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            float v9 = COERCE_FLOAT(objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "specular"), "contents"), "scn_C3DColorIgnoringColorSpace:success:", 1, 0));
            objc_msgSend((id)objc_msgSend(v7, "roughness"), "setContents:", objc_msgSend(NSNumber, "numberWithDouble:", (float)(1.0 - v9) * 0.2 + 0.2));
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  -[SCNScene _customEncodingOfSCNScene:](self, "_customEncodingOfSCNScene:");
  physicsWorld = self->_physicsWorld;
  if (physicsWorld && ![(SCNPhysicsWorld *)physicsWorld _isDefault]) {
    [a3 encodeObject:self->_physicsWorld forKey:@"physicsWorld"];
  }
  rootNode = self->_rootNode;
  if (rootNode) {
    [a3 encodeObject:rootNode forKey:@"rootNode"];
  }
  background = self->_background;
  if (background) {
    [a3 encodeObject:background forKey:@"background"];
  }
  environment = self->_environment;
  if (environment) {
    [a3 encodeObject:environment forKey:@"environment"];
  }
  userAttributes = self->_userAttributes;
  if (userAttributes) {
    [a3 encodeObject:userAttributes forKey:@"userAttributes"];
  }
  [a3 encodeDouble:@"fogStartDistance" forKey:self->_fogStartDistance];
  [a3 encodeDouble:@"fogEndDistance" forKey:self->_fogEndDistance];
  [a3 encodeDouble:@"fogDensityExponent" forKey:self->_fogDensityExponent];
  id fogColor = self->_fogColor;
  if (fogColor) {
    SCNEncodeUnsafeObjectForKey(a3, (uint64_t)fogColor, @"fogColor");
  }
  [a3 encodeBool:self->_wantsScreenSpaceReflection forKey:@"wantsScreenSpaceReflection"];
  [a3 encodeInt:LODWORD(self->_screenSpaceReflectionSampleCount) forKey:@"screenSpaceReflectionSampleCount"];
  double screenSpaceReflectionMaxRayDistance = self->_screenSpaceReflectionMaxRayDistance;
  *(float *)&double screenSpaceReflectionMaxRayDistance = screenSpaceReflectionMaxRayDistance;
  [a3 encodeFloat:@"screenSpaceReflectionMaximumDistance" forKey:screenSpaceReflectionMaxRayDistance];
  double screenSpaceReflectionStride = self->_screenSpaceReflectionStride;
  *(float *)&double screenSpaceReflectionStride = screenSpaceReflectionStride;
  [a3 encodeFloat:@"screenSpaceReflectionStride" forKey:screenSpaceReflectionStride];
  [a3 encodeBool:self->_paused forKey:@"paused"];
  [a3 encodeInteger:1 forKey:@"version"];
  sourceURL = self->_sourceURL;
  if (sourceURL) {
    [a3 encodeObject:sourceURL forKey:@"sourceURL"];
  }

  [(SCNScene *)self _didEncodeSCNScene:a3];
}

- (SCNScene)initWithCoder:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)SCNScene;
  id v4 = [(SCNScene *)&v25 init];
  if (v4)
  {
    if (C3DSceneSourceGetSceneCount())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [a3 _allowDecodingCyclesInSecureMode];
      }
    }
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"sourceURL"];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (![a3 documentURL]) {
          [a3 setDocumentURL:v7];
        }
      }
      else
      {
        objc_setAssociatedObject(a3, @"SCNSourceURLForCurrentlyUnarchivedScene", v7, (void *)0x301);
      }
    }
    uint64_t v8 = C3DSceneCreate();
    *((void *)v4 + 1) = v8;
    if (v8) {
      C3DEntitySetObjCWrapper(v8, v4);
    }
    [v4 _syncObjCModel];
    [v4 _customDecodingOfSCNScene:a3];
    uint64_t v9 = [a3 decodeIntegerForKey:@"version"];
    *((void *)v4 + 3) = (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"physicsWorld"];
    uint64_t v10 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"rootNode"];
    if (v10)
    {
      [v4 setRootNode:v10];
    }
    else
    {
      long long v11 = scn_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SCNScene initWithCoder:](v11, v12, v13, v14, v15, v16, v17, v18);
      }
      if (!*((void *)v4 + 4))
      {
        uint64_t v19 = *((void *)v4 + 1);
        if (v19)
        {
          C3DSceneLock(v19);
          if (C3DSceneGetRootNode(*((void *)v4 + 1))) {
            *((void *)v4 + 4) = +[SCNNode nodeWithNodeRef:](SCNNode, "nodeWithNodeRef:");
          }
          else {
            objc_msgSend(v4, "_setRootNode:", +[SCNNode node](SCNNode, "node"));
          }
          C3DSceneUnlock(*((void *)v4 + 1));
        }
      }
    }
    id v20 = (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"background"];
    *((void *)v4 + 9) = v20;
    if (!v9)
    {
      [v20 contents];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [*((id *)v4 + 9) setContents:0];
      }
    }
    *((void *)v4 + 10) = (id)[a3 decodeObjectOfClasses:SCNUserInfoClasses() forKey:@"environment"];
    *((void *)v4 + 11) = (id)[a3 decodeObjectOfClasses:SCNUserInfoClasses() forKey:@"userAttributes"];
    [a3 decodeDoubleForKey:@"fogStartDistance"];
    objc_msgSend(v4, "setFogStartDistance:");
    [a3 decodeDoubleForKey:@"fogEndDistance"];
    objc_msgSend(v4, "setFogEndDistance:");
    [a3 decodeDoubleForKey:@"fogDensityExponent"];
    objc_msgSend(v4, "setFogDensityExponent:");
    if ([a3 containsValueForKey:@"wantsScreenSpaceReflection"]) {
      objc_msgSend(v4, "setWantsScreenSpaceReflection:", objc_msgSend(a3, "decodeBoolForKey:", @"wantsScreenSpaceReflection"));
    }
    if ([a3 containsValueForKey:@"screenSpaceReflectionSampleCount"]) {
      objc_msgSend(v4, "setScreenSpaceReflectionSampleCount:", (int)objc_msgSend(a3, "decodeIntForKey:", @"screenSpaceReflectionSampleCount"));
    }
    if ([a3 containsValueForKey:@"screenSpaceReflectionMaximumDistance"])
    {
      [a3 decodeFloatForKey:@"screenSpaceReflectionMaximumDistance"];
      [v4 setScreenSpaceReflectionMaximumDistance:v21];
    }
    if ([a3 containsValueForKey:@"screenSpaceReflectionStride"])
    {
      [a3 decodeFloatForKey:@"screenSpaceReflectionStride"];
      [v4 setScreenSpaceReflectionStride:v22];
    }
    char v23 = (void *)[MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    [v4 setFogColor:SCNDecodeUnsafeObjectForKey(a3, @"fogColor", v23)];
    objc_msgSend(v4, "setPaused:", objc_msgSend(a3, "decodeBoolForKey:", @"paused"));
    [v4 _didDecodeSCNScene:a3];
    +[SCNTransaction setImmediateMode:v5];
  }
  return (SCNScene *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)writeToURLWithUSDKit:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  BOOL v5 = objc_msgSend((id)objc_msgSend(a3, "pathExtension"), "lowercaseString");
  if (([v5 isEqualToString:@"usd"] & 1) == 0
    && ([v5 isEqualToString:@"usda"] & 1) == 0
    && ([v5 isEqualToString:@"usdc"] & 1) == 0
    && ![v5 isEqualToString:@"usdz"])
  {
    goto LABEL_16;
  }
  if (SCNLoadUsdKitIfNeeded(void)::onceToken != -1) {
    dispatch_once(&SCNLoadUsdKitIfNeeded(void)::onceToken, &__block_literal_global_100);
  }
  if (SCNLoadUsdKitIfNeeded(void)::loaded == 1)
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, a3, 1, 0);
    uint64_t v7 = (NSURL *)objc_msgSend(v6, "URLByAppendingPathComponent:", objc_msgSend(a3, "lastPathComponent"));
    if ([v5 isEqualToString:@"usdz"]) {
      uint64_t v7 = [[(NSURL *)v7 URLByDeletingPathExtension] URLByAppendingPathExtension:@"usdc"];
    }
    +[SCNTransaction flush];
    uint64_t v8 = (__CFString *)objc_msgSend((id)objc_msgSend(a3, "URLByDeletingPathExtension"), "lastPathComponent");
    if (!v8 || (uint64_t v9 = v8, [(__CFString *)v8 isEqualToString:&stru_26BF72F58])) {
      uint64_t v9 = @"root_node";
    }
    USDKitConverter::USDKitConverter((USDKitConverter *)v27, self, &v9->isa, v7, (NSString *)[v6 path]);
    USKScene = (void *)USDKitConverter::makeUSKScene((USDKitConverter *)v27, v7);
    uint64_t v10 = [a3 URLByDeletingLastPathComponent];
    long long v11 = (void *)[MEMORY[0x263F08850] defaultManager];
    int v12 = [v11 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:0];
    if (v12)
    {
      if ([v5 isEqualToString:@"usdz"])
      {
        [USKScene saveAndCreateUSDZPackageWithURL:a3];
      }
      else
      {
        [USKScene save];
        if (objc_msgSend(v11, "fileExistsAtPath:", objc_msgSend(a3, "path"))) {
          [v11 removeItemAtURL:a3 error:0];
        }
        uint64_t v13 = objc_msgSend((id)objc_msgSend(a3, "URLByDeletingLastPathComponent"), "path");
        uint64_t v14 = objc_msgSend(v11, "enumeratorAtPath:", objc_msgSend(v6, "path"));
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v24 != v16) {
                objc_enumerationMutation(v14);
              }
              uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * i);
              uint64_t v19 = objc_msgSend((id)objc_msgSend(v6, "path"), "stringByAppendingPathComponent:", v18);
              uint64_t v20 = [v13 stringByAppendingPathComponent:v18];
              if ([v11 fileExistsAtPath:v20]) {
                [v11 removeItemAtPath:v20 error:0];
              }
              [v11 moveItemAtPath:v19 toPath:v20 error:0];
            }
            uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
          }
          while (v15);
        }
      }
    }

    [v11 removeItemAtURL:v6 error:0];
    USDKitConverter::~USDKitConverter((USDKitConverter *)v27);
  }
  else
  {
LABEL_16:
    LOBYTE(v12) = 0;
  }
  return v12;
}

- (BOOL)writeToURL:(id)a3 options:(id)a4
{
  return 0;
}

- (id)_exportAsMovieOperationWithDestinationURL:(id)a3 size:(CGSize)a4 attributes:(id)a5 delegate:(id)a6 didEndSelector:(SEL)a7 userInfo:(void *)a8
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v16 = +[SCNRenderer rendererWithDevice:0 options:0];
  [(SCNRenderer *)v16 setScene:self];
  uint64_t v17 = -[SCNMovieExportOperation initWithRenderer:size:attributes:outputURL:]([SCNMovieExportOperation alloc], "initWithRenderer:size:attributes:outputURL:", v16, a5, a3, width, height);
  [(_SCNExportOperation *)v17 setDelegate:a6];
  [(_SCNExportOperation *)v17 setUserInfo:a8];
  [(_SCNExportOperation *)v17 setDidEndSelector:a7];
  return v17;
}

- (id)debugQuickLookObject
{
  return [(SCNScene *)self debugQuickLookObjectWithPointOfView:0];
}

- (id)debugQuickLookObjectWithPointOfView:(id)a3
{
  if (C3DMetalIsSupported()) {
    BOOL v5 = +[SCNOffscreenRenderer offscreenRendererWithDevice:size:](SCNOffscreenRenderer, "offscreenRendererWithDevice:size:", 0, 512.0, 512.0);
  }
  else {
    BOOL v5 = +[SCNOffscreenRenderer offscreenRendererWithContext:size:](SCNOffscreenRenderer, "offscreenRendererWithContext:size:", 0, 512.0, 512.0);
  }
  uint64_t v6 = v5;
  [(SCNRenderer *)v5 setScene:self];
  [(SCNRenderer *)v6 setJitteringEnabled:0];
  [(SCNRenderer *)v6 setAutoenablesDefaultLighting:1];
  [(SCNRenderer *)v6 setAutoAdjustCamera:1];
  if (a3) {
    [(SCNRenderer *)v6 setPointOfView:a3];
  }
  +[SCNTransaction flush];

  return [(SCNOffscreenRenderer *)v6 snapshot];
}

- (void)root
{
}

- (void)addParticleSystem:(uint64_t)a3 withTransform:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_nodeWithIndexPath:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_indexPathForNode:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_indexPathForNode:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "wr == 0";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. _subnodeIndexPath - unexpected count (hierachy was mutated?)", (uint8_t *)&v1, 0xCu);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end