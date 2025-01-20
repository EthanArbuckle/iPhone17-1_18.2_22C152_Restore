@interface SCNAuthoringEnvironment2
+ (id)authoringEnvironmentForScene:(id)a3;
+ (id)authoringEnvironmentForScene:(id)a3 createIfNeeded:(BOOL)a4;
- (BOOL)didTapAtPoint:(CGPoint)a3;
- (SCNAuthoringEnvironment2)initWithScene:(id)a3;
- (SCNManipulator)manipulator;
- (SCNNode)authoringLayer;
- (SCNNode)authoringOverlayLayer;
- (id)authoringCamera:(int64_t)a3;
- (id)authoringCameraNodes;
- (id)cameraFrustumGeometry;
- (id)cameraGeometry;
- (id)cameraNearPlaneGeometry;
- (id)cameraOrthographicFrustumGeometry;
- (id)fieldGeometry;
- (id)geometryForLightType:(id)a3;
- (id)particlesGeometry;
- (int64_t)displayMask;
- (void)_resetLightAuthoringWithContainerNode:(id)a3 source:(id)a4 light:(id)a5;
- (void)_updateRootsVisibility;
- (void)addCameraNode:(id)a3;
- (void)addLightNode:(id)a3;
- (void)addNodeToSelection:(id)a3;
- (void)addParticlesNode:(id)a3;
- (void)addPhysicsFieldNode:(id)a3;
- (void)addedNode:(id)a3;
- (void)cancelSelection;
- (void)dealloc;
- (void)prepareScene:(id)a3;
- (void)removeCameraNode:(id)a3;
- (void)removeLightNode:(id)a3;
- (void)removeParticlesNode:(id)a3;
- (void)removePhysicsFieldNode:(id)a3;
- (void)removedNode:(id)a3;
- (void)selectNode:(id)a3;
- (void)selectNodes:(id)a3;
- (void)setAuthoringCamera:(int64_t)a3 forView:(id)a4;
- (void)setDisplayMask:(int64_t)a3;
- (void)setupParticleMeshEmitter:(id)a3 authoringNode:(id)a4;
- (void)updateCameraNode:(id)a3 withSourceNode:(id)a4;
- (void)updateFieldNode:(id)a3 withSourceNode:(id)a4;
- (void)updateLightNode:(id)a3 withSourceNode:(id)a4;
- (void)updateLightTypeForNode:(id)a3 source:(id)a4 light:(id)a5 screenspaceScalingFactor:(float)a6;
- (void)updateParticlesNode:(id)a3 withSourceNode:(id)a4;
- (void)updateWithRenderer:(id)a3;
@end

@implementation SCNAuthoringEnvironment2

+ (id)authoringEnvironmentForScene:(id)a3
{
  return (id)[a1 authoringEnvironmentForScene:a3 createIfNeeded:1];
}

+ (id)authoringEnvironmentForScene:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  +[SCNTransaction lock];
  uint64_t v6 = [a3 sceneRef];
  if (v6)
  {
    uint64_t v7 = v6;
    C3DSceneLock(v6);
    AuthoringEnvironment2 = (void *)C3DSceneGetAuthoringEnvironment2(v7, v4);
    C3DSceneUnlock(v7);
  }
  else
  {
    AuthoringEnvironment2 = 0;
  }
  +[SCNTransaction unlock];
  return AuthoringEnvironment2;
}

- (SCNAuthoringEnvironment2)initWithScene:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNAuthoringEnvironment2;
  BOOL v4 = [(SCNAuthoringEnvironment2 *)&v7 init];
  v5 = v4;
  if (v4) {
    [(SCNAuthoringEnvironment2 *)v4 prepareScene:a3];
  }
  return v5;
}

- (void)dealloc
{
  CFRelease(self->_lightsDictionary);
  CFRelease(self->_camerasDictionary);
  CFRelease(self->_particlesDictionary);
  CFRelease(self->_physicsFieldsDictionary);

  v3.receiver = self;
  v3.super_class = (Class)SCNAuthoringEnvironment2;
  [(SCNAuthoringEnvironment2 *)&v3 dealloc];
}

- (void)prepareScene:(id)a3
{
  v62[1] = *MEMORY[0x263EF8340];
  self->_scene = (__C3DScene *)[a3 sceneRef];
  self->_manipulator = objc_alloc_init(SCNManipulator);
  self->_selection = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  BOOL v4 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  v5 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  self->_lightsDictionary = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  self->_camerasDictionary = CFDictionaryCreateMutable(0, 0, v4, v5);
  self->_particlesDictionary = CFDictionaryCreateMutable(0, 0, v4, v5);
  self->_physicsFieldsDictionary = CFDictionaryCreateMutable(0, 0, v4, v5);
  self->_layerRoot = +[SCNNode node];
  self->_overlayLayerRoot = +[SCNNode node];
  self->_lightRoot = +[SCNNode node];
  self->_cameraRoot = +[SCNNode node];
  self->_particlesRoot = +[SCNNode node];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v57 = 0u;
  Mesh::AppendWireframeSphere((Mesh *)&v57, 1.0, 3u, (const C3DColor4 *)C3DAuthoringEnvironmentColorWhite);
  uint64_t v6 = +[SCNNode nodeWithGeometry:Mesh::CreateLineGeometry((Mesh *)&v57)];
  self->_cameraTarget = v6;
  [(SCNNode *)v6 setHidden:1];
  if ((void)v60)
  {
    *((void *)&v60 + 1) = v60;
    operator delete((void *)v60);
  }
  if (*((void *)&v58 + 1))
  {
    *(void *)&long long v59 = *((void *)&v58 + 1);
    operator delete(*((void **)&v58 + 1));
  }
  if ((void)v57)
  {
    *((void *)&v57 + 1) = v57;
    operator delete((void *)v57);
  }
  self->_physicsFieldsRoot = +[SCNNode node];
  self->_pointsOfViewRoot = +[SCNNode node];
  [(SCNNode *)self->_layerRoot setName:@"_layerRoot"];
  [(SCNNode *)self->_overlayLayerRoot setName:@"_overlayLayerRoot"];
  [(SCNNode *)self->_lightRoot setName:@"_lightRoot"];
  [(SCNNode *)self->_cameraRoot setName:@"_cameraRoot"];
  [(SCNNode *)self->_particlesRoot setName:@"_particlesRoot"];
  [(SCNNode *)self->_physicsFieldsRoot setName:@"_physicsFieldRoot"];
  [(SCNNode *)self->_pointsOfViewRoot setName:@"_pointsOfViewRoot"];
  self->_paleGreen = (UIColor *)(id)objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorPaleGreen);
  self->_paleBlue = (UIColor *)(id)objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", &C3DAuthoringEnvironmentColorPaleBlue);
  self->_red = (UIColor *)(id)objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorRed);
  self->_green = (UIColor *)(id)objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorGreen);
  self->_blue = (UIColor *)(id)objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorBlue);
  self->_cyan = (UIColor *)(id)objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorCyan);
  self->_yellow = (UIColor *)(id)objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorYellow);
  self->_orange = (UIColor *)(id)objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", &C3DAuthoringEnvironmentColorOrange);
  self->_pink = (UIColor *)(id)objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", &C3DAuthoringEnvironmentColorPink);
  self->_grayLight = (UIColor *)(id)objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", &C3DAuthoringEnvironmentColorGrayLight);
  self->_grayMedium = (UIColor *)(id)objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", &C3DAuthoringEnvironmentColorGrayMedium);
  self->_grayDark = (UIColor *)(id)objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", &C3DAuthoringEnvironmentColorGrayDark);
  self->_white = (UIColor *)(id)objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorWhite);
  [(SCNNode *)self->_layerRoot setAuthoringEnvironmentNode:1];
  [(SCNNode *)self->_overlayLayerRoot setAuthoringEnvironmentNode:1];
  [(SCNNode *)self->_lightRoot setAuthoringEnvironmentNode:1];
  [(SCNNode *)self->_cameraRoot setAuthoringEnvironmentNode:1];
  [(SCNNode *)self->_particlesRoot setAuthoringEnvironmentNode:1];
  [(SCNNode *)self->_physicsFieldsRoot setAuthoringEnvironmentNode:1];
  [(SCNNode *)self->_cameraTarget setAuthoringEnvironmentNode:1];
  [(SCNNode *)self->_pointsOfViewRoot setAuthoringEnvironmentNode:1];
  [(SCNNode *)self->_lightRoot setHidden:1];
  [(SCNNode *)self->_cameraRoot setHidden:1];
  [(SCNNode *)self->_particlesRoot setHidden:1];
  [a3 setRootNode:self->_layerRoot forLayer:1];
  [a3 setRootNode:self->_overlayLayerRoot forLayer:2];
  [(SCNNode *)self->_layerRoot addChildNode:self->_lightRoot];
  [(SCNNode *)self->_layerRoot addChildNode:self->_cameraRoot];
  [(SCNNode *)self->_layerRoot addChildNode:self->_particlesRoot];
  [(SCNNode *)self->_layerRoot addChildNode:self->_physicsFieldsRoot];
  [(SCNNode *)self->_layerRoot addChildNode:self->_cameraTarget];
  [(SCNNode *)self->_layerRoot addChildNode:self->_pointsOfViewRoot];
  v44 = (void *)[a3 rootNode];
  +[SCNTransaction begin];
  +[SCNTransaction setDisableActions:1];
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __41__SCNAuthoringEnvironment2_prepareScene___block_invoke;
  v56[3] = &unk_264005228;
  v56[4] = self;
  [v44 enumerateChildNodesUsingBlock:v56];
  +[SCNTransaction commit];
  v62[0] = [a3 rootNode];
  double BoundingSphere = SCNNodeGetBoundingSphere((void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:1], 0x10000);
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  +[SCNNode simdLocalUp];
  float32x4_t v47 = v12;
  +[SCNNode simdLocalRight];
  float32x4_t v46 = v13;
  +[SCNNode simdLocalFront];
  float32x4_t v45 = v14;
  uint64_t v15 = 0;
  v14.i64[0] = v9;
  v14.i64[1] = v11;
  float32x4_t v49 = v14;
  float v16 = *((float *)&v11 + 1) * 1.33;
  if (*((float *)&v11 + 1) <= 0.0) {
    float v16 = 1.0;
  }
  double v17 = v16;
  double v18 = *((float *)&v11 + 1);
  do
  {
    v19 = +[SCNCamera camera];
    v20 = -[SCNAuthoringEnvironment2 prepareScene:]::camNames[v15];
    -[SCNCamera setName:](v19, "setName:", objc_msgSend(NSString, "stringWithFormat:", @"_authoringCamera%s", v20));
    [(SCNCamera *)v19 setUsesOrthographicProjection:v15 != 0];
    [(SCNCamera *)v19 setAutomaticallyAdjustsZRange:1];
    [(SCNCamera *)v19 setOrthographicScale:v17];
    v21 = +[SCNNode node];
    [(SCNNode *)v21 setCamera:v19];
    -[SCNNode setName:](v21, "setName:", [NSString stringWithUTF8String:v20]);
    [(SCNNode *)v21 setAuthoringEnvironmentNode:1];
    [(SCNNode *)v21 setAuthoringCameraType:v15];
    switch((int)v15)
    {
      case 0:
        [(SCNCamera *)[(SCNNode *)v21 camera] setZNear:0.1];
        if (self->_scene
          && (+[SCNTransaction lock],
              C3DSceneLock((uint64_t)self->_scene),
              v24 = C3DCreateDefaultCameraNode((__n128 *)self->_scene, 1),
              C3DSceneUnlock((uint64_t)self->_scene),
              +[SCNTransaction unlock],
              v24))
        {
          v25 = +[SCNNode nodeWithNodeRef:v24];
          if (v25)
          {
            [(SCNNode *)v25 transform];
          }
          else
          {
            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
          }
          v51[0] = v52;
          v51[1] = v53;
          v51[2] = v54;
          v51[3] = v55;
          [(SCNNode *)v21 setTransform:v51];
          CFRelease(v24);
        }
        else
        {
          v38 = objc_msgSend((id)objc_msgSend(v44, "childNodesWithAttribute:recursively:", objc_opt_class(), 1), "firstObject");
          if (v38)
          {
            [v38 transform];
            v50[0] = v50[4];
            v50[1] = v50[5];
            v50[2] = v50[6];
            v50[3] = v50[7];
            [(SCNNode *)v21 setTransform:v50];
          }
          else
          {
            LODWORD(v40) = 1061628640;
            LODWORD(v39) = -1094336732;
            -[SCNNode setEulerAngles:](v21, "setEulerAngles:", v39, v40, 0.0);
            LODWORD(v41) = 1075302105;
            LODWORD(v42) = 1069321028;
            LODWORD(v43) = 1075415351;
            -[SCNNode setPosition:](v21, "setPosition:", v41, v42, v43);
          }
        }
        break;
      case 1:
        LODWORD(v22) = -1077342245;
        -[SCNNode setEulerAngles:](v21, "setEulerAngles:", v22, 0.0, 0.0);
        [(SCNCamera *)v19 zNear];
        float v27 = v26 + v18;
        [(SCNNode *)v21 setSimdWorldPosition:*(double *)vmlaq_n_f32(v49, v47, v27).i64];
        break;
      case 2:
        LODWORD(v22) = 1070141403;
        -[SCNNode setEulerAngles:](v21, "setEulerAngles:", v22, 0.0, 0.0);
        [(SCNCamera *)v19 zNear];
        v29.f32[0] = v28 + v18;
        [(SCNNode *)v21 setSimdWorldPosition:*(double *)vmlsq_lane_f32(v49, v47, v29, 0).i64];
        break;
      case 3:
        LODWORD(v23) = -1077342245;
        -[SCNNode setEulerAngles:](v21, "setEulerAngles:", 0.0, v23, 0.0);
        [(SCNCamera *)v19 zNear];
        v31.f32[0] = v30 + v18;
        [(SCNNode *)v21 setSimdWorldPosition:*(double *)vmlsq_lane_f32(v49, v46, v31, 0).i64];
        break;
      case 4:
        LODWORD(v23) = 1070141403;
        -[SCNNode setEulerAngles:](v21, "setEulerAngles:", 0.0, v23, 0.0);
        [(SCNCamera *)v19 zNear];
        float v33 = v32 + v18;
        [(SCNNode *)v21 setSimdWorldPosition:*(double *)vmlaq_n_f32(v49, v46, v33).i64];
        break;
      case 5:
        -[SCNNode setEulerAngles:](v21, "setEulerAngles:", 0.0, 0.0, 0.0);
        [(SCNCamera *)v19 zNear];
        v35.f32[0] = v34 + v18;
        [(SCNNode *)v21 setSimdWorldPosition:*(double *)vmlsq_lane_f32(v49, v45, v35, 0).i64];
        break;
      case 6:
        LODWORD(v23) = -1068953637;
        -[SCNNode setEulerAngles:](v21, "setEulerAngles:", 0.0, v23, 0.0);
        [(SCNCamera *)v19 zNear];
        float v37 = v36 + v18;
        [(SCNNode *)v21 setSimdWorldPosition:*(double *)vmlaq_n_f32(v49, v45, v37).i64];
        break;
      default:
        break;
    }
    [(SCNNode *)self->_pointsOfViewRoot addChildNode:v21];
    ++v15;
  }
  while (v15 != 7);
  [(SCNAuthoringEnvironment2 *)self setDisplayMask:0];
}

uint64_t __41__SCNAuthoringEnvironment2_prepareScene___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addedNode:a2];
}

- (id)authoringCameraNodes
{
  return [(SCNNode *)self->_pointsOfViewRoot childNodes];
}

- (SCNManipulator)manipulator
{
  return self->_manipulator;
}

- (id)geometryForLightType:(id)a3
{
  if ([a3 isEqualToString:@"probe"]) {
    return 0;
  }
  lightGeometry = self->_lightGeometry;
  if (!lightGeometry)
  {
    *(_OWORD *)__p = 0u;
    long long v11 = 0u;
    *(_OWORD *)uint64_t v8 = 0u;
    long long v9 = 0u;
    *(_OWORD *)objc_super v7 = 0u;
    Mesh::AppendWireframeSphere((Mesh *)v7, 0.5, 3u, (const C3DColor4 *)C3DAuthoringEnvironmentColorWhite);
    self->_lightGeometry = Mesh::CreateLineGeometry((Mesh *)v7);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v8[1])
    {
      *(void **)&long long v9 = v8[1];
      operator delete(v8[1]);
    }
    if (v7[0])
    {
      v7[1] = v7[0];
      operator delete(v7[0]);
    }
    lightGeometry = self->_lightGeometry;
  }
  id v6 = [(SCNGeometry *)lightGeometry copy];
  objc_msgSend(v6, "setFirstMaterial:", -[SCNMaterial copy](-[SCNGeometry firstMaterial](self->_lightGeometry, "firstMaterial"), "copy"));
  return v6;
}

- (void)addLightNode:(id)a3
{
  if (CFDictionaryContainsKey(self->_lightsDictionary, a3))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNAuthoringEnvironment2 addLightNode:]();
    }
  }
  else
  {
    id v6 = +[SCNNode nodeWithGeometry:](SCNNode, "nodeWithGeometry:", -[SCNAuthoringEnvironment2 geometryForLightType:](self, "geometryForLightType:", objc_msgSend((id)objc_msgSend(a3, "light"), "type")));
    [(SCNNode *)v6 setName:@"lightAuth"];
    [(SCNNode *)v6 setAuthoringEnvironmentNode:1];
    [(SCNNode *)v6 setAuthoringEnvironmentCompanionNode:a3];
    [a3 setAuthoringEnvironmentPresentationNode:v6];
    [(SCNNode *)self->_lightRoot addChildNode:v6];
    lightsDictionary = self->_lightsDictionary;
    CFDictionaryAddValue(lightsDictionary, a3, v6);
  }
}

- (id)particlesGeometry
{
  particlesGeometry = self->_particlesGeometry;
  if (!particlesGeometry)
  {
    *(_OWORD *)__p = 0u;
    long long v12 = 0u;
    *(_OWORD *)long long v9 = 0u;
    long long v10 = 0u;
    *(_OWORD *)uint64_t v8 = 0u;
    unint64_t v6 = 0x3EB33333BCF5C28FLL;
    int v7 = 1027101164;
    Mesh::AppendWireframeSphere((uint64_t)v8, (float *)&v6, 0.2, 3u, (const C3DColor4 *)C3DAuthoringEnvironmentColorWhite);
    unint64_t v6 = 0xBE6B851FBE4CCCCDLL;
    int v7 = 1052602532;
    Mesh::AppendWireframeSphere((uint64_t)v8, (float *)&v6, 0.2, 3u, (const C3DColor4 *)C3DAuthoringEnvironmentColorWhite);
    unint64_t v6 = 0xBE6B851F3E99999ALL;
    int v7 = -1094881116;
    Mesh::AppendWireframeSphere((uint64_t)v8, (float *)&v6, 0.2, 3u, (const C3DColor4 *)C3DAuthoringEnvironmentColorWhite);
    self->_particlesGeometry = Mesh::CreateLineGeometry((Mesh *)v8);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v9[1])
    {
      *(void **)&long long v10 = v9[1];
      operator delete(v9[1]);
    }
    if (v8[0])
    {
      v8[1] = v8[0];
      operator delete(v8[0]);
    }
    particlesGeometry = self->_particlesGeometry;
  }
  id v4 = [(SCNGeometry *)particlesGeometry copy];
  objc_msgSend(v4, "setFirstMaterial:", -[SCNMaterial copy](-[SCNGeometry firstMaterial](self->_particlesGeometry, "firstMaterial"), "copy"));
  return v4;
}

- (void)setupParticleMeshEmitter:(id)a3 authoringNode:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  if (objc_msgSend((id)objc_msgSend(a4, "childNodes"), "count") == 2) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "childNodes"), "objectAtIndexedSubscript:", 1), "removeFromParentNode");
  }
  uint64_t v7 = [a3 nodeRef];
  if (v7)
  {
    CFArrayRef ParticleSystems = C3DNodeGetParticleSystems(v7);
    if (ParticleSystems)
    {
      CFArrayRef v9 = ParticleSystems;
      if (CFArrayGetCount(ParticleSystems))
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v9, 0);
        EmitterShape = (const void *)C3DParticleSystemGetEmitterShape((uint64_t)ValueAtIndex);
        if (EmitterShape)
        {
          Copy = (const void *)C3DGeometryCreateCopy(EmitterShape);
          float32x4_t v13 = +[SCNGeometry geometryWithGeometryRef:Copy];
          CFRelease(Copy);
          float32x4_t v14 = +[SCNMaterial material];
          [(SCNMaterial *)v14 setLightingModelName:@"SCNLightingModelConstant"];
          [(SCNMaterialProperty *)[(SCNMaterial *)v14 diffuse] setContents:self->_yellow];
          [(SCNMaterial *)v14 setFillMode:1];
          v16[0] = v14;
          -[SCNGeometry setMaterials:](v13, "setMaterials:", [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1]);
          uint64_t v15 = +[SCNNode nodeWithGeometry:v13];
          [(SCNNode *)v15 setAuthoringEnvironmentNode:1];
          [(SCNNode *)v15 setAuthoringEnvironmentCompanionNode:a3];
          [a3 setAuthoringEnvironmentPresentationNode:v15];
          [a4 addChildNode:v15];
        }
      }
    }
  }
}

- (void)addParticlesNode:(id)a3
{
  if (CFDictionaryContainsKey(self->_particlesDictionary, a3))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNAuthoringEnvironment2 addParticlesNode:]();
    }
  }
  else
  {
    unint64_t v6 = +[SCNNode node];
    uint64_t v7 = +[SCNNode nodeWithGeometry:[(SCNAuthoringEnvironment2 *)self particlesGeometry]];
    [(SCNNode *)v7 setName:@"particlesAuth"];
    [(SCNNode *)v7 setAuthoringEnvironmentNode:1];
    [(SCNNode *)v7 setAuthoringEnvironmentCompanionNode:a3];
    [a3 setAuthoringEnvironmentPresentationNode:v7];
    [(SCNNode *)v6 setAuthoringEnvironmentNode:1];
    [(SCNNode *)v6 addChildNode:v7];
    [(SCNNode *)self->_particlesRoot addChildNode:v6];
    particlesDictionary = self->_particlesDictionary;
    CFDictionaryAddValue(particlesDictionary, a3, v6);
  }
}

- (id)cameraGeometry
{
  id result = self->_cameraGeometry;
  if (!result)
  {
    id result = Mesh::CreateCameraGeometry(0);
    self->_cameraGeometry = (SCNGeometry *)result;
  }
  return result;
}

- (id)cameraFrustumGeometry
{
  id result = self->_cameraFrustumGeometry;
  if (!result)
  {
    id result = Mesh::CreateCameraFrustumGeometry(0);
    self->_cameraFrustumGeometry = (SCNGeometry *)result;
  }
  return result;
}

- (id)cameraOrthographicFrustumGeometry
{
  id result = self->_cameraOrthographicFrustumGeometry;
  if (!result)
  {
    id result = Mesh::CreateOrthographicCameraFrustumGeometry(0);
    self->_cameraOrthographicFrustumGeometry = (SCNGeometry *)result;
  }
  return result;
}

- (id)cameraNearPlaneGeometry
{
  id result = self->_cameraNearPlaneGeometry;
  if (!result)
  {
    id result = Mesh::CreateCameraNearPlaneGeometry(0);
    self->_cameraNearPlaneGeometry = (SCNGeometry *)result;
  }
  return result;
}

- (id)fieldGeometry
{
  id result = self->_fieldGeometry;
  if (!result)
  {
    id result = Mesh::CreatePhysicsFieldGeometry(0);
    self->_fieldGeometry = (SCNGeometry *)result;
  }
  return result;
}

- (void)addCameraNode:(id)a3
{
  if (CFDictionaryContainsKey(self->_camerasDictionary, a3))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNAuthoringEnvironment2 addCameraNode:]();
    }
  }
  else if ((![a3 name] {
          || objc_msgSend((id)objc_msgSend(a3, "name"), "compare:", @"kSCNFreeViewCameraName"))
  }
         && ([a3 authoringEnvironmentNode] & 1) == 0)
  {
    unint64_t v6 = +[SCNNode nodeWithGeometry:[(SCNAuthoringEnvironment2 *)self cameraGeometry]];
    [(SCNNode *)v6 setName:@"cameraAuth"];
    [(SCNNode *)v6 setAuthoringEnvironmentNode:1];
    [(SCNNode *)v6 setAuthoringEnvironmentCompanionNode:a3];
    [a3 setAuthoringEnvironmentPresentationNode:v6];
    if (objc_msgSend((id)objc_msgSend(a3, "camera"), "usesOrthographicProjection")) {
      id v7 = [(SCNAuthoringEnvironment2 *)self cameraOrthographicFrustumGeometry];
    }
    else {
      id v7 = [(SCNAuthoringEnvironment2 *)self cameraFrustumGeometry];
    }
    uint64_t v8 = +[SCNNode nodeWithGeometry:v7];
    [(SCNNode *)v8 setName:@"cameraFrustumAuth"];
    [(SCNNode *)v8 setAuthoringEnvironmentNode:1];
    [(SCNNode *)v8 setHittable:0];
    CFArrayRef v9 = +[SCNNode nodeWithGeometry:[(SCNAuthoringEnvironment2 *)self cameraNearPlaneGeometry]];
    [(SCNNode *)v9 setName:@"cameraNearPlaneAuth"];
    [(SCNNode *)v9 setAuthoringEnvironmentNode:1];
    [(SCNNode *)v9 setHittable:0];
    [(SCNNode *)self->_cameraRoot addChildNode:v6];
    [(SCNNode *)v6 addChildNode:v8];
    [(SCNNode *)v8 addChildNode:v9];
    camerasDictionary = self->_camerasDictionary;
    CFDictionaryAddValue(camerasDictionary, a3, v6);
  }
}

- (void)removeCameraNode:(id)a3
{
  objc_msgSend((id)CFDictionaryGetValue(self->_camerasDictionary, a3), "removeFromParentNode");
  camerasDictionary = self->_camerasDictionary;

  CFDictionaryRemoveValue(camerasDictionary, a3);
}

- (void)addPhysicsFieldNode:(id)a3
{
  if (CFDictionaryContainsKey(self->_physicsFieldsDictionary, a3))
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNAuthoringEnvironment2 addPhysicsFieldNode:]();
    }
  }
  else
  {
    unint64_t v6 = +[SCNNode nodeWithGeometry:[(SCNAuthoringEnvironment2 *)self fieldGeometry]];
    [(SCNNode *)v6 setName:@"fieldAuth"];
    [(SCNNode *)v6 setAuthoringEnvironmentNode:1];
    [(SCNNode *)v6 setAuthoringEnvironmentCompanionNode:a3];
    [a3 setAuthoringEnvironmentPresentationNode:v6];
    [(SCNNode *)self->_physicsFieldsRoot addChildNode:v6];
    physicsFieldsDictionary = self->_physicsFieldsDictionary;
    CFDictionaryAddValue(physicsFieldsDictionary, a3, v6);
  }
}

- (void)removePhysicsFieldNode:(id)a3
{
  objc_msgSend((id)CFDictionaryGetValue(self->_physicsFieldsDictionary, a3), "removeFromParentNode");
  physicsFieldsDictionary = self->_physicsFieldsDictionary;

  CFDictionaryRemoveValue(physicsFieldsDictionary, a3);
}

- (void)removeLightNode:(id)a3
{
  objc_msgSend((id)CFDictionaryGetValue(self->_lightsDictionary, a3), "removeFromParentNode");
  lightsDictionary = self->_lightsDictionary;

  CFDictionaryRemoveValue(lightsDictionary, a3);
}

- (void)removeParticlesNode:(id)a3
{
  objc_msgSend((id)CFDictionaryGetValue(self->_particlesDictionary, a3), "removeFromParentNode");
  particlesDictionary = self->_particlesDictionary;

  CFDictionaryRemoveValue(particlesDictionary, a3);
}

- (void)addedNode:(id)a3
{
  if (([a3 authoringEnvironmentNode] & 1) == 0)
  {
    if ([a3 light]) {
      [(SCNAuthoringEnvironment2 *)self addLightNode:a3];
    }
    if ([a3 particleSystems]) {
      [(SCNAuthoringEnvironment2 *)self addParticlesNode:a3];
    }
    if ([a3 camera]) {
      [(SCNAuthoringEnvironment2 *)self addCameraNode:a3];
    }
    if ([a3 physicsField])
    {
      [(SCNAuthoringEnvironment2 *)self addPhysicsFieldNode:a3];
    }
  }
}

- (void)removedNode:(id)a3
{
  if (([a3 authoringEnvironmentNode] & 1) == 0)
  {
    id v4 = a3;
    if ([a3 light]) {
      [(SCNAuthoringEnvironment2 *)self removeLightNode:a3];
    }
    if ([a3 particleSystems]) {
      [(SCNAuthoringEnvironment2 *)self removeParticlesNode:a3];
    }
    if ([a3 camera]) {
      [(SCNAuthoringEnvironment2 *)self removeCameraNode:a3];
    }
    if ([a3 physicsField]) {
      [(SCNAuthoringEnvironment2 *)self removePhysicsFieldNode:a3];
    }
  }
}

- (void)selectNode:(id)a3
{
  objc_sync_enter(self);
  if (([a3 authoringEnvironmentNode] & 1) == 0)
  {
    [(NSMutableSet *)self->_selection removeAllObjects];
    if (a3) {
      [(NSMutableSet *)self->_selection addObject:a3];
    }
  }

  objc_sync_exit(self);
}

- (void)addNodeToSelection:(id)a3
{
  objc_sync_enter(self);
  char v5 = [a3 authoringEnvironmentNode];
  if (a3) {
    char v6 = v5;
  }
  else {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    [(NSMutableSet *)self->_selection addObject:a3];
  }

  objc_sync_exit(self);
}

- (void)selectNodes:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  [(NSMutableSet *)self->_selection removeAllObjects];
  if (a3)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(a3);
          }
          uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if (([v8 authoringEnvironmentNode] & 1) == 0) {
            [(NSMutableSet *)self->_selection addObject:v8];
          }
        }
        uint64_t v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
  objc_sync_exit(self);
}

- (void)cancelSelection
{
  objc_sync_enter(self);
  [(NSMutableSet *)self->_selection removeAllObjects];

  objc_sync_exit(self);
}

- (void)_resetLightAuthoringWithContainerNode:(id)a3 source:(id)a4 light:(id)a5
{
  [a3 removeAllChilds];
  objc_msgSend(a3, "setValue:forKey:", objc_msgSend(a5, "type"), @"SCNDebugLightTypeKey");
  [a3 setValue:0 forKey:@"SCNDebugLightSubTypeKey"];
  if (objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", @"ambient")) {
    return;
  }
  if (objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", @"omni"))
  {
    *(_OWORD *)__p = 0u;
    long long v59 = 0u;
    *(_OWORD *)v56 = 0u;
    long long v57 = 0u;
    *(_OWORD *)long long v55 = 0u;
    Mesh::AppendWireframeSphere((Mesh *)v55, 1.0, 3u, (const C3DColor4 *)C3DAuthoringEnvironmentColorWhite);
    long long v9 = +[SCNNode nodeWithGeometry:Mesh::CreateLineGeometry((Mesh *)v55)];
    [(SCNNode *)v9 setName:@"lightInnerAuth"];
    [(SCNNode *)v9 setAuthoringEnvironmentNode:1];
    [(SCNNode *)v9 setHittable:0];
    [a3 addChildNode:v9];
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v56[1])
    {
      *(void **)&long long v57 = v56[1];
      operator delete(v56[1]);
    }
    if (v55[0])
    {
      v55[1] = v55[0];
      operator delete(v55[0]);
    }
    *(_OWORD *)__p = 0u;
    long long v59 = 0u;
    *(_OWORD *)v56 = 0u;
    long long v57 = 0u;
    *(_OWORD *)long long v55 = 0u;
    Mesh::AppendWireframeSphere((Mesh *)v55, 1.0, 3u, (const C3DColor4 *)C3DAuthoringEnvironmentColorWhite);
    long long v10 = +[SCNNode nodeWithGeometry:Mesh::CreateLineGeometry((Mesh *)v55)];
    [(SCNNode *)v10 setName:@"lightOuterAuth"];
    [(SCNNode *)v10 setAuthoringEnvironmentNode:1];
    [(SCNNode *)v10 setHittable:0];
    [a3 addChildNode:v10];
LABEL_19:
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v56[1])
    {
      *(void **)&long long v57 = v56[1];
      operator delete(v56[1]);
    }
    if (v55[0])
    {
      v55[1] = v55[0];
      operator delete(v55[0]);
    }
    return;
  }
  if ((objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", @"directional") & 1) != 0
    || objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", @"ies"))
  {
    *(_OWORD *)__p = 0u;
    long long v59 = 0u;
    *(_OWORD *)v56 = 0u;
    long long v57 = 0u;
    *(_OWORD *)long long v55 = 0u;
    Mesh::AppendZUpArrow((Mesh *)v55, &C3DAuthoringEnvironmentColorOrange);
    long long v11 = +[SCNNode nodeWithGeometry:Mesh::CreateTriangleGeometry((Mesh *)v55)];
    [(SCNNode *)v11 setName:@"lightArrowAuth"];
    [(SCNNode *)v11 setAuthoringEnvironmentNode:1];
    LODWORD(v12) = 1078530011;
    -[SCNNode setEulerAngles:](v11, "setEulerAngles:", v12, 0.0, 0.0);
    LODWORD(v13) = 10.0;
    LODWORD(v14) = 10.0;
    LODWORD(v15) = 10.0;
    -[SCNNode setScale:](v11, "setScale:", v13, v14, v15);
    [(SCNNode *)v11 setHittable:0];
    [a3 addChildNode:v11];
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v56[1])
    {
      *(void **)&long long v57 = v56[1];
      operator delete(v56[1]);
    }
    if (v55[0])
    {
      v55[1] = v55[0];
      operator delete(v55[0]);
    }
    *(_OWORD *)__p = 0u;
    long long v59 = 0u;
    *(_OWORD *)v56 = 0u;
    long long v57 = 0u;
    *(_OWORD *)long long v55 = 0u;
    *(void *)&long long v52 = 0;
    DWORD2(v52) = 0;
    v61.x = 1.0;
    v61.y = 1.0;
    v61.z = 0.5;
    Mesh::AppendWireframeBox((Mesh *)v55, (const SCNVector3 *)&v52, v61, &C3DAuthoringEnvironmentColorOrange);
    float v16 = +[SCNNode nodeWithGeometry:Mesh::CreateLineGeometry((Mesh *)v55)];
    -[SCNNode setSimdPivot:](v16, "setSimdPivot:", *MEMORY[0x263EF89A8], *(double *)(MEMORY[0x263EF89A8] + 16), *(double *)(MEMORY[0x263EF89A8] + 32), 0.0);
    [(SCNNode *)v16 setName:@"lightShadowAuth"];
    [(SCNNode *)v16 setAuthoringEnvironmentNode:1];
    [(SCNNode *)v16 setHittable:0];
    [a3 addChildNode:v16];
    goto LABEL_19;
  }
  if (!objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", @"spot"))
  {
    if (objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", @"probe"))
    {
      double v18 = +[SCNSphere sphereWithRadius:](SCNSphere, "sphereWithRadius:", dbl_20B5EE190[[a5 probeType] == 1]);
      [(SCNGeometry *)v18 setName:@"probeGeometry"];
      if ([a5 probeType])
      {
        *(_OWORD *)__p = 0u;
        long long v59 = 0u;
        *(_OWORD *)v56 = 0u;
        long long v57 = 0u;
        *(_OWORD *)long long v55 = 0u;
        v62.x = 1.0;
        v62.y = 1.0;
        v62.z = 1.0;
        Mesh::AppendWireframeBox((Mesh *)v55, &SCNVector3Zero, v62, (const C3DColor4 *)C3DAuthoringEnvironmentColorRed);
        v19 = +[SCNNode nodeWithGeometry:Mesh::CreateLineGeometry((Mesh *)v55)];
        [(SCNNode *)v19 setName:@"lightProbeExtents"];
        [(SCNNode *)v19 setAuthoringEnvironmentNode:1];
        [(SCNNode *)v19 setHittable:0];
        [a3 addChildNode:v19];
        vmesh::StaticAdjacencyInformation<Pair>::~StaticAdjacencyInformation((uint64_t)v55);
        [(SCNMaterial *)[(SCNGeometry *)v18 firstMaterial] setColorBufferWriteMask:0];
      }
      else
      {
        uint64_t v22 = [a5 _sphericalHarmonics];
        objc_msgSend((id)objc_msgSend(-[SCNGeometry material](v18, "material"), "diffuse"), "setColor:", self->_white);
        objc_msgSend(-[SCNGeometry material](v18, "material"), "setLightingModelName:", @"SCNLightingModelConstant");
        if (v22)
        {
          double v23 = +[SCNProgram program];
          uint64_t v24 = -[SCNMTLRenderContext resourceManager]((uint64_t)[(SCNRenderer *)self->_renderer _renderContextMetal]);
          -[SCNProgram setLibrary:](v23, "setLibrary:", [(id)-[SCNMTLResourceManager libraryManager](v24) frameworkLibrary]);
          [(SCNProgram *)v23 setVertexFunctionName:@"scn_probesphere_from_sh_vertex"];
          [(SCNProgram *)v23 setFragmentFunctionName:@"scn_probesphere_from_sh_fragment"];
          v54[0] = MEMORY[0x263EF8330];
          v54[1] = 3221225472;
          v54[2] = __79__SCNAuthoringEnvironment2__resetLightAuthoringWithContainerNode_source_light___block_invoke;
          v54[3] = &unk_264008EB0;
          v54[4] = a5;
          [(SCNProgram *)v23 handleBindingOfBufferNamed:@"sh" frequency:1 usingBlock:v54];
          objc_msgSend(-[SCNGeometry material](v18, "material"), "setProgram:", v23);
        }
      }
      v25 = +[SCNNode nodeWithGeometry:v18];
      [(SCNNode *)v25 setName:@"probe"];
      [(SCNNode *)v25 setAuthoringEnvironmentNode:1];
      [(SCNNode *)v25 setAuthoringEnvironmentCompanionNode:a4];
      [a4 setAuthoringEnvironmentPresentationNode:v25];
      [(SCNNode *)v25 setHittable:1];
      [a3 addChildNode:v25];
      *(_OWORD *)__p = 0u;
      long long v59 = 0u;
      *(_OWORD *)v56 = 0u;
      long long v57 = 0u;
      *(_OWORD *)long long v55 = 0u;
      Mesh::AppendWireframeSphere((Mesh *)v55, 1.0, 3u, &C3DAuthoringEnvironmentColorGrayMedium);
      LineGeometry = Mesh::CreateLineGeometry((Mesh *)v55);
      vmesh::StaticAdjacencyInformation<Pair>::~StaticAdjacencyInformation((uint64_t)v55);
      float v27 = +[SCNNode nodeWithGeometry:LineGeometry];
      [(SCNNode *)v27 setName:@"lightInnerAuth"];
      [(SCNNode *)v27 setAuthoringEnvironmentNode:1];
      [(SCNNode *)v27 setHittable:0];
      [a5 zFar];
      double v28 = 0.5;
      double v30 = v29 * 0.5;
      *(float *)&double v30 = v30;
      LODWORD(v28) = LODWORD(v30);
      LODWORD(v31) = LODWORD(v30);
      -[SCNNode setScale:](v27, "setScale:", v30, v28, v31);
      id v32 = a3;
      float v33 = v27;
    }
    else
    {
      if (!objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", @"area")) {
        return;
      }
      long long v52 = 0u;
      long long v53 = 0u;
      *(void *)&double v20 = C3DLightGetAreaDescription([a5 lightRef], &v52).n128_u64[0];
      objc_msgSend(a3, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", v52, v20), @"SCNDebugLightSubTypeKey");
      switch((char)v52)
      {
        case 0:
          *(_OWORD *)__p = 0u;
          long long v59 = 0u;
          *(_OWORD *)v56 = 0u;
          long long v57 = 0u;
          *(_OWORD *)long long v55 = 0u;
          *(void *)&v51.x = 3212836864;
          v51.z = 0.0;
          *(void *)&v50.x = 1065353216;
          v50.z = 0.0;
          Mesh::AppendSegment((Mesh *)v55, &v51, &v50, &C3DAuthoringEnvironmentColorOrange, &C3DAuthoringEnvironmentColorOrange);
          v21 = Mesh::CreateLineGeometry((Mesh *)v55);
          goto LABEL_50;
        case 1:
          *(_OWORD *)__p = 0u;
          long long v59 = 0u;
          *(_OWORD *)v56 = 0u;
          long long v57 = 0u;
          *(_OWORD *)long long v55 = 0u;
          *(void *)&v51.x = 0x3F800000BF800000;
          v51.z = 0.0;
          __asm { FMOV            V0.2S, #1.0 }
          *(void *)&v50.x = _D0;
          v50.z = 0.0;
          *(void *)&v49.x = 0xBF8000003F800000;
          v49.z = 0.0;
          __asm { FMOV            V0.2S, #-1.0 }
          *(void *)&v48.x = _D0;
          v48.z = 0.0;
          Mesh::AppendQuad((Mesh *)v55, &v51, &v50, &v49, &v48, &C3DAuthoringEnvironmentColorOrange);
          v21 = Mesh::CreateLineGeometry((Mesh *)v55);
          goto LABEL_50;
        case 2:
          *(_OWORD *)__p = 0u;
          long long v59 = 0u;
          *(_OWORD *)v56 = 0u;
          long long v57 = 0u;
          *(_OWORD *)long long v55 = 0u;
          Mesh::AppendWireframeXYDisk((Mesh *)v55, 1.0, &C3DAuthoringEnvironmentColorOrange);
          v21 = Mesh::CreateLineGeometry((Mesh *)v55);
          goto LABEL_50;
        case 3:
          *(_OWORD *)__p = 0u;
          long long v59 = 0u;
          *(_OWORD *)v56 = 0u;
          long long v57 = 0u;
          *(_OWORD *)long long v55 = 0u;
          Mesh::AppendWireframeSphere((Mesh *)v55, 1.0, 3u, &C3DAuthoringEnvironmentColorOrange);
          v21 = Mesh::CreateLineGeometry((Mesh *)v55);
          goto LABEL_50;
        case 4:
          *(_OWORD *)__p = 0u;
          long long v59 = 0u;
          *(_OWORD *)v56 = 0u;
          long long v57 = 0u;
          *(_OWORD *)long long v55 = 0u;
          uint64_t v41 = v53;
          if ((_BYTE)v53)
          {
            uint64_t v42 = 0;
            int v43 = v53 - 1;
            do
            {
              uint64_t v44 = *(void *)(*((void *)&v53 + 1) + 8 * v42);
              if (v43 == v42) {
                unsigned int v45 = 0;
              }
              else {
                unsigned int v45 = v42 + 1;
              }
              uint64_t v46 = *(void *)(*((void *)&v53 + 1) + 8 * v45);
              v51.x = -*(float *)&v44;
              v51.y = *((float *)&v44 + 1);
              v51.z = 0.0;
              v50.x = -*(float *)&v46;
              v50.y = *((float *)&v46 + 1);
              v50.z = 0.0;
              Mesh::AppendSegment((Mesh *)v55, &v51, &v50, &C3DAuthoringEnvironmentColorOrange, &C3DAuthoringEnvironmentColorOrange);
              ++v42;
            }
            while (v41 != v42);
          }
          v21 = Mesh::CreateLineGeometry((Mesh *)v55);
LABEL_50:
          double v34 = v21;
          vmesh::StaticAdjacencyInformation<Pair>::~StaticAdjacencyInformation((uint64_t)v55);
          break;
        default:
          double v34 = 0;
          break;
      }
      float32x4_t v47 = +[SCNNode nodeWithGeometry:v34];
      [(SCNNode *)v47 setName:@"lightAreaAuth"];
      [(SCNNode *)v47 setAuthoringEnvironmentNode:1];
      [(SCNNode *)v47 setAuthoringEnvironmentCompanionNode:a4];
      id v32 = a3;
      float v33 = v47;
    }
    [v32 addChildNode:v33];
    return;
  }
  double v17 = +[SCNNode node];
  [(SCNNode *)v17 setName:@"lightSpotAuth"];
  [(SCNNode *)v17 setAuthoringEnvironmentNode:1];
  [(SCNNode *)v17 setHittable:0];

  [a3 addChildNode:v17];
}

void __79__SCNAuthoringEnvironment2__resetLightAuthoringWithContainerNode_source_light___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (void *)[*(id *)(a1 + 32) _sphericalHarmonics];
  int v4 = C3DDeduceSphericalHarmonicsOrderFromDataLength([v3 length]);
  uint64_t v5 = [v3 bytes];
  if (v4 == 3)
  {
    uint64_t v6 = v5;
    uint64_t v7 = [v3 length];
    [a2 writeBytes:v6 length:v7];
  }
  else
  {
    uint64_t v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      C3DLightProbesSystemSetProbeData_cold_1(v4, v8);
    }
  }
}

- (void)updateLightTypeForNode:(id)a3 source:(id)a4 light:(id)a5 screenspaceScalingFactor:(float)a6
{
  uint64_t v11 = [a3 valueForKey:@"SCNDebugLightTypeKey"];
  double v12 = (void *)[a3 valueForKey:@"SCNDebugLightSubTypeKey"];
  int v13 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"disabled"), "BOOLValue");
  int v14 = 0;
  if ([(NSMutableSet *)self->_selection count] && a4)
  {
    id v15 = a4;
    do
    {
      int v14 = [(NSMutableSet *)self->_selection containsObject:v15];
      uint64_t v16 = [v15 parentNode];
      if (v14) {
        break;
      }
      id v15 = (id)v16;
    }
    while (v16);
  }
  id v93 = a4;
  uint64_t v17 = [a4 isHidden] & (v14 ^ 1);
  unsigned int v18 = v13 ^ v17;
  if ((v13 ^ v17) == 1) {
    objc_msgSend(a3, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithBool:", v17), @"disabled");
  }
  if (objc_msgSend((id)objc_msgSend(a3, "childNodes"), "count")
    && objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", @"probe"))
  {
    if ((v14 | v18))
    {
      unsigned int v18 = 1;
    }
    else
    {
      uint64_t v91 = [a5 _sphericalHarmonics];
      uint64_t v97 = objc_msgSend((id)objc_msgSend(a5, "probeEnvironment"), "contents");
      v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "childNodeWithName:recursively:", @"probe", 1), "geometry"), "firstMaterial");
      double v20 = v19;
      if (v19)
      {
        BOOL v21 = [v19 program] != 0;
        LODWORD(v20) = objc_msgSend((id)objc_msgSend(v20, "reflective"), "contents") != 0;
      }
      else
      {
        BOOL v21 = 0;
      }
      if ([a5 probeType])
      {
        unsigned int v18 = (v97 != 0) ^ v20;
      }
      else if (a5)
      {
        unsigned int v18 = (v91 != 0) ^ v21;
      }
      else
      {
        unsigned int v18 = 0;
      }
    }
  }
  if (objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", @"area"))
  {
    uint64_t v23 = [a5 areaType];
    if (v23 != [v12 integerValue]) {
      unsigned int v18 = 1;
    }
  }
  uint64_t v24 = v93;
  *(float *)&uint64_t v22 = fmaxf(a6, 0.001);
  uint64_t v98 = v22;
  if (!objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", v11) || v18) {
    [(SCNAuthoringEnvironment2 *)self _resetLightAuthoringWithContainerNode:a3 source:v93 light:a5];
  }
  v25.i32[1] = HIDWORD(v98);
  *(float *)v25.i32 = 1.0 / *(float *)&v98;
  int32x2_t v92 = v25;
  if (objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", @"omni"))
  {
    double v26 = objc_msgSend((id)objc_msgSend(a3, "childNodes"), "objectAtIndexedSubscript:", 0);
    [a5 attenuationStartDistance];
    double v28 = v27 * *(float *)v92.i32;
    *(float *)&double v28 = v28;
    if (*(float *)&v28 < 0.0) {
      *(float *)&double v28 = 0.0;
    }
    double v94 = v28;
    objc_msgSend(v26, "setSimdScale:", *(double *)vdupq_lane_s32(*(int32x2_t *)&v28, 0).i64);
    objc_msgSend(v26, "setHidden:", *(float *)&v94 == 0.0, v94);
    double v29 = objc_msgSend((id)objc_msgSend(a3, "childNodes"), "objectAtIndexedSubscript:", 1);
    [a5 attenuationEndDistance];
    double v31 = v30 * *(float *)v92.i32;
    *(float *)&double v31 = v31;
    if (*(float *)&v31 < 0.0) {
      *(float *)&double v31 = 0.0;
    }
    double v95 = v31;
    objc_msgSend(v29, "setSimdScale:", *(double *)vdupq_lane_s32(*(int32x2_t *)&v31, 0).i64);
    objc_msgSend(v29, "setHidden:", *(float *)&v95 == 0.0, v95);
    if ([v24 isHidden])
    {
      uint64_t v32 = 272;
      if (v14) {
        uint64_t v32 = 256;
      }
      uint64_t v33 = *(uint64_t *)((char *)&self->super.isa + v32);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "geometry"), "firstMaterial"), "diffuse"), "setColor:", v33);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v26, "geometry"), "firstMaterial"), "diffuse"), "setColor:", v33);
    }
    else
    {
      uint64_t v47 = 240;
      if (v14)
      {
        uint64_t v47 = 256;
        uint64_t v48 = 256;
      }
      else
      {
        uint64_t v48 = 248;
      }
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "geometry"), "firstMaterial"), "diffuse"), "setColor:", *(Class *)((char *)&self->super.isa + v47));
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v26, "geometry"), "firstMaterial"), "diffuse"), "setColor:", *(Class *)((char *)&self->super.isa + v48));
      uint64_t v33 = *(uint64_t *)((char *)&self->super.isa + v48);
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v29, "geometry"), "firstMaterial"), "diffuse"), "setColor:", v33);
    goto LABEL_85;
  }
  if (objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", @"spot"))
  {
    [a5 spotOuterAngle];
    float v35 = fmin(v34 / 180.0 * 3.14159265, 3.13159265);
    [a5 spotInnerAngle];
    double v37 = v36 / 180.0 * 3.14159265;
    if (v37 >= v35) {
      float v38 = v35;
    }
    else {
      float v38 = v37;
    }
    [a5 attenuationStartDistance];
    float v40 = v39;
    [a5 attenuationEndDistance];
    float v42 = v41;
    int v43 = objc_msgSend((id)objc_msgSend(a3, "childNodes"), "objectAtIndexedSubscript:", 0);
    uint64_t v44 = objc_msgSend(NSString, "stringWithFormat:", @"oa:%f ia:%f s:%f e:%f", v35, v38, v40, v42);
    uint64_t v45 = [v43 valueForKey:@"AuthEnvHash"];
    if (!v45 || [v44 compare:v45])
    {
      long long __p = 0u;
      long long v107 = 0u;
      *(_OWORD *)v104 = 0u;
      long long v105 = 0u;
      *(_OWORD *)v103 = 0u;
      v102.z = 0.0;
      *(void *)&v102.x = 0;
      *(void *)&v101.x = 0;
      v101.z = -1.0;
      if (v40 > 0.0 || v42 > 0.0)
      {
        if (v40 > 0.0) {
          Mesh::AppendSphericalCap((Mesh *)v103, v40, v35 * 0.5, &C3DAuthoringEnvironmentColorGrayMedium);
        }
        if (v42 > 0.0) {
          Mesh::AppendSphericalCap((Mesh *)v103, v42, v35 * 0.5, &C3DAuthoringEnvironmentColorGrayMedium);
        }
      }
      else
      {
        float v46 = tanf(v35 * 0.5);
        Mesh::AppendCone((Mesh *)v103, &v102, &v101, 20.0, v46 * 20.0, &C3DAuthoringEnvironmentColorOrange);
      }
      if (v38 > 0.0)
      {
        if (v42 <= 0.0) {
          float v42 = 20.0;
        }
        float v57 = tanf(v38 * 0.5);
        Mesh::AppendCone((Mesh *)v103, &v102, &v101, v42, v42 * v57, &C3DAuthoringEnvironmentColorOrange);
      }
      [v43 setGeometry:Mesh::CreateLineGeometry((Mesh *)v103)];
      [v43 setValue:v44 forKey:@"AuthEnvHash"];
      if ((void)__p)
      {
        *((void *)&__p + 1) = __p;
        operator delete((void *)__p);
      }
      if (v104[1])
      {
        *(void **)&long long v105 = v104[1];
        operator delete(v104[1]);
      }
      if (v103[0])
      {
        v103[1] = v103[0];
        operator delete(v103[0]);
      }
    }
    objc_msgSend(v43, "setSimdScale:", *(double *)vdupq_lane_s32(v92, 0).i64);
    if ([v93 isHidden])
    {
      if (v14) {
        uint64_t v58 = 256;
      }
      else {
        uint64_t v58 = 272;
      }
      uint64_t v59 = *(uint64_t *)((char *)&self->super.isa + v58);
    }
    else
    {
      uint64_t v60 = 240;
      if (v14) {
        uint64_t v60 = 256;
      }
      uint64_t v59 = *(uint64_t *)((char *)&self->super.isa + v60);
      if (v14) {
        uint64_t v58 = 256;
      }
      else {
        uint64_t v58 = 288;
      }
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "geometry"), "firstMaterial"), "diffuse"), "setColor:", v59);
    uint64_t v61 = *(uint64_t *)((char *)&self->super.isa + v58);
    id v62 = v43;
LABEL_84:
    objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v62, "geometry"), "firstMaterial"), "diffuse"), "setColor:", v61);
    goto LABEL_85;
  }
  if ((objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", @"directional") & 1) != 0
    || objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", @"ies"))
  {
    int v49 = objc_msgSend((id)objc_msgSend(a3, "childNodes"), "count");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "childNodes"), "objectAtIndexedSubscript:", 0), "setHidden:", v17);
    SCNVector3 v50 = objc_msgSend((id)objc_msgSend(a3, "childNodes"), "objectAtIndexedSubscript:", v49 - 1);
    objc_msgSend(v50, "setHidden:", objc_msgSend(a5, "automaticallyAdjustsShadowProjection"));
    if (([a5 automaticallyAdjustsShadowProjection] & 1) == 0)
    {
      [a5 zNear];
      [v50 setSimdPosition:0.0];
      [a5 orthographicScale];
      float64_t v89 = v51;
      [a5 orthographicScale];
      v52.f64[0] = v89;
      v52.f64[1] = v53;
      double v90 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_n_f64(v52, *(float *)v92.i32)));
      [a5 zFar];
      [a5 zNear];
      [v50 setSimdScale:v90];
    }
    v99[0] = MEMORY[0x263EF8330];
    v99[1] = 3221225472;
    v99[2] = __89__SCNAuthoringEnvironment2_updateLightTypeForNode_source_light_screenspaceScalingFactor___block_invoke;
    v99[3] = &unk_264008ED8;
    char v100 = v14;
    v99[4] = v93;
    v99[5] = self;
    [a3 enumerateChildNodesUsingBlock:v99];
    int v54 = [v93 isHidden];
    _ZF = v14 == 0;
    if (v54) {
      uint64_t v56 = 272;
    }
    else {
      uint64_t v56 = 240;
    }
LABEL_81:
    if (!_ZF) {
      uint64_t v56 = 256;
    }
    uint64_t v61 = *(uint64_t *)((char *)&self->super.isa + v56);
    id v62 = a3;
    goto LABEL_84;
  }
  if (!objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", @"probe"))
  {
    if (!objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", @"area")) {
      goto LABEL_85;
    }
    *(_OWORD *)v103 = 0u;
    *(_OWORD *)v104 = 0u;
    v80 = objc_msgSend((id)objc_msgSend(a3, "childNodes", C3DLightGetAreaDescription(objc_msgSend(a5, "lightRef"), (long long *)v103).n128_f64[0]), "objectAtIndexedSubscript:", 0);
    objc_msgSend(v80, "setSimdScale:", *(double *)vdupq_lane_s32(v92, 0).i64);
    switch(LOBYTE(v103[0]))
    {
      case 0:
        __asm { FMOV            V0.4S, #1.0 }
        _Q0.i32[0] = (__int32)v104[0];
        float32x4_t v96 = _Q0;
        goto LABEL_97;
      case 1:
      case 2:
        float32x4_t v81 = *(float32x4_t *)v104;
        v81.i32[2] = 1.0;
        float32x4_t v96 = v81;
LABEL_97:
        [v80 simdScale];
        float32x4_t v87 = v96;
        goto LABEL_99;
      case 3:
        [v80 simdScale];
        float32x4_t v87 = *(float32x4_t *)v104;
LABEL_99:
        objc_msgSend(v80, "setSimdScale:", *(double *)vmulq_f32(v86, v87).i64);
        break;
      default:
        break;
    }
    int v88 = [v24 isHidden];
    uint64_t v56 = 240;
    if (v88) {
      uint64_t v56 = 272;
    }
    _ZF = v14 == 0;
    goto LABEL_81;
  }
  uint64_t v64 = 288;
  if (v14) {
    uint64_t v64 = 256;
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "geometry"), "firstMaterial"), "diffuse"), "setColor:", *(Class *)((char *)&self->super.isa + v64));
  [a3 setHidden:(self->_displayMask & 0x200) == 0];
  v65 = (void *)[a3 childNodeWithName:@"lightInnerAuth" recursively:0];
  [v65 setHidden:v14 ^ 1u];
  [a5 zFar];
  double v66 = 0.5;
  double v68 = v67 * 0.5;
  *(float *)&double v68 = v68;
  LODWORD(v66) = LODWORD(v68);
  LODWORD(v69) = LODWORD(v68);
  objc_msgSend(v65, "setScale:", v68, v66, v69);
  v70 = (void *)[a3 childNodeWithName:@"lightProbeExtents" recursively:0];
  [a5 probeExtents];
  v71.i64[0] = 0x3F0000003F000000;
  v71.i64[1] = 0x3F0000003F000000;
  float32x4_t v73 = vmulq_f32(v72, v71);
  v71.i32[0] = v73.i32[1];
  LODWORD(v74) = v73.i32[2];
  objc_msgSend(v70, "setScale:", *(double *)v73.i64, *(double *)v71.i64, v74);
  v75 = (void *)[a3 childNodeWithName:@"probe" recursively:0];
  [a5 probeOffset];
  LODWORD(v77) = HIDWORD(v76);
  LODWORD(v79) = v78;
  objc_msgSend(v75, "setPosition:", v76, v77, v79);
LABEL_85:
  if (a5)
  {
    if ((objc_msgSend((id)objc_msgSend(a5, "type"), "isEqualToString:", @"probe") & 1) == 0)
    {
      [a3 simdScale];
      objc_msgSend(a3, "setSimdScale:", *(double *)vmulq_n_f32(v63, *(float *)&v98).i64);
      [a3 setHidden:(self->_displayMask & 0x20) == 0];
    }
  }
}

uint64_t __89__SCNAuthoringEnvironment2_updateLightTypeForNode_source_light_screenspaceScalingFactor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 authoringEnvironmentNode];
  if (result)
  {
    int v5 = [*(id *)(a1 + 32) isHidden];
    uint64_t v6 = 288;
    if (v5) {
      uint64_t v6 = 272;
    }
    uint64_t v7 = 256;
    if (!*(unsigned char *)(a1 + 48)) {
      uint64_t v7 = v6;
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + v7);
    long long v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "geometry"), "firstMaterial"), "diffuse");
    return [v9 setColor:v8];
  }
  return result;
}

- (void)updateLightNode:(id)a3 withSourceNode:(id)a4
{
  uint64_t v7 = [a4 light];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    if ([(SCNRenderer *)self->_renderer pointOfView] == a4) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = [a4 isHidden];
    }
    [a3 setHidden:v9];
    if (([a3 isHidden] & 1) == 0)
    {
      objc_msgSend((id)objc_msgSend(a4, "presentationNode"), "simdWorldTransform");
      objc_msgSend(a3, "setSimdWorldTransform:");
      int v10 = objc_msgSend((id)objc_msgSend(v8, "type"), "isEqualToString:", @"probe");
      C3DSizeForScreenSpaceSizeAndTransform((__n128 *)[(SCNRenderer *)self->_renderer _engineContext]);
      -[SCNAuthoringEnvironment2 updateLightTypeForNode:source:light:screenspaceScalingFactor:](self, "updateLightTypeForNode:source:light:screenspaceScalingFactor:", a3, a4, v8);
      if (v10)
      {
        BOOL v11 = (self->_displayMask & 0x200) == 0;
        [a3 setHidden:v11];
      }
    }
  }
  else
  {
    [(SCNAuthoringEnvironment2 *)self removeLightNode:a4];
  }
}

- (void)updateParticlesNode:(id)a3 withSourceNode:(id)a4
{
  if ([a4 particleSystems] && objc_msgSend((id)objc_msgSend(a4, "particleSystems"), "count"))
  {
    objc_msgSend(a3, "setHidden:", objc_msgSend(a4, "isHidden"));
    if ([a3 isHidden]) {
      return;
    }
    uint64_t v7 = (void *)[a4 presentationNode];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    if (v7) {
      [v7 worldTransform];
    }
    v26[0] = v27;
    v26[1] = v28;
    v26[2] = v29;
    v26[3] = v30;
    [a3 setTransform:v26];
    uint64_t v8 = [(SCNRenderer *)self->_renderer _engineContext];
    C3DSizeForScreenSpaceSizeAndTransform((__n128 *)v8);
    int v10 = v9;
    if (a4)
    {
      id v11 = a4;
      do
      {
        int v12 = [(NSMutableSet *)self->_selection containsObject:v11];
        uint64_t v13 = [v11 parentNode];
        if (v12) {
          break;
        }
        id v11 = (id)v13;
      }
      while (v13);
    }
    else
    {
      int v12 = 0;
    }
    int v14 = objc_msgSend((id)objc_msgSend(a3, "childNodes"), "objectAtIndexedSubscript:", 0);
    int v15 = [v14 isHidden];
    uint64_t v16 = 240;
    if (v15) {
      uint64_t v16 = 272;
    }
    if (v12) {
      uint64_t v16 = 256;
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "geometry"), "firstMaterial"), "diffuse"), "setColor:", *(Class *)((char *)&self->super.isa + v16));
    uint64_t v17 = objc_msgSend((id)objc_msgSend(a3, "childNodes"), "count");
    unsigned int v18 = 0;
    if (v17 == 2) {
      unsigned int v18 = objc_msgSend((id)objc_msgSend(a3, "childNodes"), "objectAtIndexedSubscript:", 1);
    }
    uint64_t v19 = v12 ^ 1u;
    [v18 setHidden:v19];
    if (v19)
    {
      uint64_t v24 = 0;
    }
    else
    {
      uint64_t v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "particleSystems"), "firstObject"), "presentationInstance"), "emitterShape");
      if (v20 == objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"sourceShape"), "unsignedLongValue"))
      {
LABEL_26:
        LODWORD(v21) = v10;
        LODWORD(v22) = v10;
        LODWORD(v23) = v10;
        objc_msgSend(v14, "setScale:", v21, v22, v23);
        return;
      }
      [(SCNAuthoringEnvironment2 *)self setupParticleMeshEmitter:a4 authoringNode:a3];
      uint64_t v24 = [NSNumber numberWithUnsignedLong:v20];
    }
    [a3 setValue:v24 forKey:@"sourceShape"];
    goto LABEL_26;
  }

  [(SCNAuthoringEnvironment2 *)self removeParticlesNode:a4];
}

- (void)updateCameraNode:(id)a3 withSourceNode:(id)a4
{
  uint64_t v7 = [a4 camera];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    if ([(SCNRenderer *)self->_renderer pointOfView] == a4) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = [a4 isHidden];
    }
    [a3 setHidden:v9];
    if (([a3 isHidden] & 1) == 0)
    {
      if (a4)
      {
        id v10 = a4;
        do
        {
          int v11 = [(NSMutableSet *)self->_selection containsObject:v10];
          uint64_t v12 = [v10 parentNode];
          if (v11) {
            break;
          }
          id v10 = (id)v12;
        }
        while (v12);
        if (v11) {
          uint64_t v13 = 256;
        }
        else {
          uint64_t v13 = 200;
        }
      }
      else
      {
        uint64_t v13 = 200;
      }
      int v14 = (void *)[a4 presentationNode];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      if (v14) {
        [v14 worldTransform];
      }
      v43[0] = v44;
      v43[1] = v45;
      v43[2] = v46;
      v43[3] = v47;
      [a3 setTransform:v43];
      int v15 = [(SCNRenderer *)self->_renderer _engineContext];
      C3DSizeForScreenSpaceSizeAndTransform((__n128 *)v15);
      float v17 = *(float *)&v16;
      LODWORD(v18) = LODWORD(v16);
      LODWORD(v19) = LODWORD(v16);
      objc_msgSend(a3, "setScale:", v16, v18, v19);
      uint64_t v20 = [v8 cameraRef];
      float ZNear = C3DCameraGetZNear(v20);
      float ZFar = C3DCameraGetZFar(v20);
      int UsesOrthographicProjection = C3DCameraGetUsesOrthographicProjection(v20);
      uint64_t v24 = objc_msgSend((id)objc_msgSend(a3, "childNodes"), "objectAtIndexedSubscript:", 0);
      if (UsesOrthographicProjection)
      {
        objc_msgSend(v24, "setGeometry:", -[SCNAuthoringEnvironment2 cameraOrthographicFrustumGeometry](self, "cameraOrthographicFrustumGeometry"));
        long double OrthographicScale = C3DCameraGetOrthographicScale(v20);
        *(float *)&long double OrthographicScale = OrthographicScale;
        *(float *)&long double OrthographicScale = *(float *)&OrthographicScale / v17;
        *(float *)&double v26 = ZFar / v17;
        long long v27 = v24;
        LODWORD(v28) = LODWORD(OrthographicScale);
      }
      else
      {
        objc_msgSend(v24, "setGeometry:", -[SCNAuthoringEnvironment2 cameraFrustumGeometry](self, "cameraFrustumGeometry"));
        uint64_t v41 = 0;
        __n128 Viewport = C3DEngineContextGetViewport((__n128 *)[(SCNRenderer *)self->_renderer _engineContext]);
        __asm { FMOV            V1.2S, #1.0 }
        Viewport.n128_u64[0] = (unint64_t)vmaxnm_f32((float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)Viewport, (int8x16_t)Viewport, 8uLL), _D1);
        C3DCameraGetEffectiveFovForAspectRatio(v20, (float *)&v41 + 1, (float *)&v41, vdiv_f32((float32x2_t)Viewport.n128_u64[0], (float32x2_t)vdup_lane_s32((int32x2_t)Viewport.n128_u64[0], 1)).f32[0]);
        if (v17 == 0.0)
        {
LABEL_24:
          double v36 = objc_msgSend((id)objc_msgSend(v24, "childNodes"), "objectAtIndexedSubscript:", 0);
          *(float *)&double v37 = ZNear / ZFar;
          *(float *)&double v38 = ZNear / ZFar;
          *(float *)&double v39 = ZNear / ZFar;
          objc_msgSend(v36, "setScale:", v37, v38, v39);
          BOOL v40 = (self->_displayMask & 4) == 0;
          [v24 setHidden:v40];
          [v36 setHidden:v40];
          objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "geometry"), "firstMaterial"), "diffuse"), "setColor:", self->_grayMedium);
          objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v24, "geometry"), "firstMaterial"), "diffuse"), "setColor:", *(Class *)((char *)&self->super.isa + v13));
          objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v36, "geometry"), "firstMaterial"), "diffuse"), "setColor:", *(Class *)((char *)&self->super.isa + v13));
          return;
        }
        float v35 = tan(*(float *)&v41 * 0.5 / 180.0 * 3.14159265) * ZFar;
        long double OrthographicScale = tan(*((float *)&v41 + 1) * 0.5 / 180.0 * 3.14159265) * ZFar;
        *(float *)&long double OrthographicScale = OrthographicScale;
        *(float *)&long double OrthographicScale = *(float *)&OrthographicScale / v17;
        *(float *)&double v28 = v35 / v17;
        *(float *)&double v26 = ZFar / v17;
        long long v27 = v24;
      }
      objc_msgSend(v27, "setScale:", (double)OrthographicScale, v28, v26);
      goto LABEL_24;
    }
  }
  else
  {
    [(SCNAuthoringEnvironment2 *)self removeCameraNode:a4];
  }
}

- (void)updateFieldNode:(id)a3 withSourceNode:(id)a4
{
  id v4 = a4;
  if ([a4 physicsField])
  {
    objc_msgSend(a3, "setHidden:", objc_msgSend(v4, "isHidden"));
    if (([a3 isHidden] & 1) == 0)
    {
      uint64_t v7 = (void *)[v4 presentationNode];
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      if (v7) {
        [v7 worldTransform];
      }
      v11[0] = v12;
      v11[1] = v13;
      v11[2] = v14;
      v11[3] = v15;
      [a3 setTransform:v11];
      if (v4)
      {
        do
        {
          int v8 = [(NSMutableSet *)self->_selection containsObject:v4];
          uint64_t v9 = [v4 parentNode];
          if (v8) {
            break;
          }
          id v4 = (id)v9;
        }
        while (v9);
        uint64_t v10 = 200;
        if (v8) {
          uint64_t v10 = 256;
        }
      }
      else
      {
        uint64_t v10 = 200;
      }
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "geometry"), "firstMaterial"), "diffuse"), "setColor:", *(Class *)((char *)&self->super.isa + v10));
    }
  }
  else
  {
    [(SCNAuthoringEnvironment2 *)self removePhysicsFieldNode:v4];
  }
}

- (void)updateWithRenderer:(id)a3
{
  objc_sync_enter(self);
  self->_renderer = (SCNRenderer *)a3;
  uint64_t v5 = [a3 _engineContext];
  uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL(v5);
  if (RendererContextGL) {
    int ShowsAuthoringEnvironment = C3DRendererContextGetShowsAuthoringEnvironment(RendererContextGL);
  }
  else {
    int ShowsAuthoringEnvironment = 0;
  }
  uint64_t RenderContext = C3DEngineContextGetRenderContext(v5);
  if (RenderContext) {
    int ShowsAuthoringEnvironment = -[SCNMTLRenderContext showsAuthoringEnvironment](RenderContext);
  }
  if (ShowsAuthoringEnvironment)
  {
    if (![(SCNNode *)self->_lightRoot isHidden]) {
      CFDictionaryApplyFunction(self->_lightsDictionary, (CFDictionaryApplierFunction)__UpdateLight, self);
    }
    if (![(SCNNode *)self->_cameraRoot isHidden]) {
      CFDictionaryApplyFunction(self->_camerasDictionary, (CFDictionaryApplierFunction)__UpdateCamera, self);
    }
    if (![(SCNNode *)self->_particlesRoot isHidden]) {
      CFDictionaryApplyFunction(self->_particlesDictionary, (CFDictionaryApplierFunction)__UpdateParticles, self);
    }
    if (![(SCNNode *)self->_physicsFieldsRoot isHidden]) {
      CFDictionaryApplyFunction(self->_physicsFieldsDictionary, (CFDictionaryApplierFunction)__UpdateFields, self);
    }
    uint64_t v9 = (void *)[a3 privateRendererOwner];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend((id)objc_msgSend(v9, "defaultCameraController"), "target");
      -[SCNNode setPosition:](self->_cameraTarget, "setPosition:");
    }
    [(SCNNode *)self->_cameraTarget setHidden:1];
  }
  [(SCNManipulator *)self->_manipulator updateManipulatorPosition:v5];
  uint64_t v10 = (void *)[a3 privateRendererOwner];
  int v11 = v10;
  if (v10 && [v10 pointOfView])
  {
    uint64_t v15 = 0;
    double v16 = &v15;
    uint64_t v17 = 0x2020000000;
    BOOL v18 = 0;
    BOOL v18 = [(NSOrderedSet *)[(SCNManipulator *)self->_manipulator targets] count] == 0;
    long long v12 = [(SCNManipulator *)self->_manipulator targets];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __47__SCNAuthoringEnvironment2_updateWithRenderer___block_invoke;
    v14[3] = &unk_2640062F0;
    v14[4] = v11;
    v14[5] = &v15;
    [(NSOrderedSet *)v12 enumerateObjectsUsingBlock:v14];
    [(SCNNode *)[(SCNManipulator *)self->_manipulator manipulatorNode] setHidden:*((unsigned __int8 *)v16 + 24) != 0];
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    [(SCNNode *)[(SCNManipulator *)self->_manipulator manipulatorNode] setHidden:1];
  }
  if (ShowsAuthoringEnvironment == [(SCNNode *)self->_layerRoot isHidden])
  {
    uint64_t v13 = ShowsAuthoringEnvironment ^ 1u;
    [(SCNNode *)self->_layerRoot setHidden:v13];
    [(SCNNode *)self->_overlayLayerRoot setHidden:v13];
  }
  self->_renderer = 0;
  objc_sync_exit(self);
}

uint64_t __47__SCNAuthoringEnvironment2_updateWithRenderer___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [*(id *)(a1 + 32) pointOfView];
  uint64_t result = [a2 node];
  if (v7 == result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (SCNNode)authoringLayer
{
  return self->_layerRoot;
}

- (SCNNode)authoringOverlayLayer
{
  return self->_overlayLayerRoot;
}

- (int64_t)displayMask
{
  return self->_displayMask;
}

- (void)_updateRootsVisibility
{
  [(SCNNode *)self->_lightRoot setHidden:(self->_displayMask & 0x228) == 0];
  [(SCNNode *)self->_particlesRoot setHidden:(self->_displayMask & 0x28) == 0];
  BOOL v3 = (self->_displayMask & 0x14) == 0;
  cameraRoot = self->_cameraRoot;

  [(SCNNode *)cameraRoot setHidden:v3];
}

- (void)setDisplayMask:(int64_t)a3
{
  self->_displayMask = a3;
  [(SCNAuthoringEnvironment2 *)self _updateRootsVisibility];
}

- (BOOL)didTapAtPoint:(CGPoint)a3
{
  return 0;
}

- (void)setAuthoringCamera:(int64_t)a3 forView:(id)a4
{
  v38[1] = *MEMORY[0x263EF8340];
  if ([a4 scene])
  {
    objc_msgSend((id)objc_msgSend(a4, "defaultCameraController"), "simdTarget");
    float32x4_t v37 = v7;
    id v8 = [(NSArray *)[(SCNNode *)self->_pointsOfViewRoot childNodes] objectAtIndexedSubscript:a3];
    v38[0] = objc_msgSend((id)objc_msgSend(a4, "scene"), "rootNode");
    double BoundingSphere = SCNNodeGetBoundingSphere((void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1], 0x10000);
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    objc_msgSend((id)objc_msgSend(v8, "camera", BoundingSphere), "zNear");
    double v15 = v14;
    +[SCNNode simdLocalUp];
    float32x4_t v35 = v16;
    +[SCNNode simdLocalRight];
    float32x4_t v34 = v17;
    +[SCNNode simdLocalFront];
    float32x4_t v20 = v19;
    v19.i64[0] = v11;
    v19.i64[1] = v13;
    float v21 = v15;
    float32x4_t v22 = vsubq_f32(v37, v19);
    float32x4_t v23 = vmulq_f32(v22, v22);
    *(void *)&double v24 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v23, 2), vaddq_f32(v23, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 1))).u64[0];
    *(float *)&double v24 = (float)(*((float *)&v13 + 1) + sqrtf(*(float *)&v24)) + v21;
    double v36 = v24;
    switch(a3)
    {
      case 1:
        LODWORD(v24) = -1077342245;
        double v18 = 0.0;
        long long v25 = v8;
        goto LABEL_11;
      case 2:
        LODWORD(v24) = 1070141403;
        double v26 = v8;
        goto LABEL_8;
      case 3:
        LODWORD(v18) = -1077342245;
        objc_msgSend(v8, "setEulerAngles:", 0.0, v18, 0.0);
        float32x2_t v28 = *(float32x2_t *)&v36;
        float32x4_t v27 = v37;
        float32x4_t v29 = v34;
        goto LABEL_9;
      case 4:
        LODWORD(v18) = 1070141403;
        objc_msgSend(v8, "setEulerAngles:", 0.0, v18, 0.0);
        float v31 = *(float *)&v36;
        float32x4_t v30 = v37;
        float32x4_t v32 = v34;
        goto LABEL_12;
      case 5:
        double v24 = 0.0;
        double v26 = v8;
        float32x4_t v35 = v20;
LABEL_8:
        objc_msgSend(v26, "setEulerAngles:", v24, 0.0, 0.0);
        float32x2_t v28 = *(float32x2_t *)&v36;
        float32x4_t v27 = v37;
        float32x4_t v29 = v35;
LABEL_9:
        unint64_t v33 = vmlsq_lane_f32(v27, v29, v28, 0).u64[0];
        goto LABEL_13;
      case 6:
        LODWORD(v18) = -1068953637;
        double v24 = 0.0;
        long long v25 = v8;
        float32x4_t v35 = v20;
LABEL_11:
        objc_msgSend(v25, "setEulerAngles:", v24, v18, 0.0);
        float v31 = *(float *)&v36;
        float32x4_t v30 = v37;
        float32x4_t v32 = v35;
LABEL_12:
        unint64_t v33 = vmlaq_n_f32(v30, v32, v31).u64[0];
LABEL_13:
        [v8 setSimdWorldPosition:*(double *)&v33];
        break;
      default:
        break;
    }
    [a4 setPointOfView:v8];
    objc_msgSend((id)objc_msgSend(a4, "defaultCameraController"), "setPointOfView:", v8);
  }
}

- (id)authoringCamera:(int64_t)a3
{
  id v4 = [(SCNNode *)self->_pointsOfViewRoot childNodes];

  return [(NSArray *)v4 objectAtIndexedSubscript:a3];
}

- (void)addLightNode:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: light node already has an authoring node - skip", v2, v3, v4, v5, v6);
}

- (void)addParticlesNode:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: particle node already has an authoring node - skip", v2, v3, v4, v5, v6);
}

- (void)addCameraNode:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: camera node already has an authoring node - skip", v2, v3, v4, v5, v6);
}

- (void)addPhysicsFieldNode:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: physicsField node already has an authoring node - skip", v2, v3, v4, v5, v6);
}

@end