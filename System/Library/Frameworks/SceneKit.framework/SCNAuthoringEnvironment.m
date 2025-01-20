@interface SCNAuthoringEnvironment
+ (id)authoringEnvironmentForSceneRenderer:(id)a3;
+ (id)authoringEnvironmentForSceneRenderer:(id)a3 createIfNeeded:(BOOL)a4;
+ (id)rendererForSceneRenderer:(id)a3;
+ (int64_t)defaultAuthoringDisplayMask;
- (BOOL)didTapAtPoint:(CGPoint)a3;
- (BOOL)graphicalSelectionEnabled;
- (BOOL)isEditingSubComponent;
- (BOOL)selectionIsReadonly;
- (BOOL)shouldSnapOnGrid;
- (BOOL)shouldSnapToAlign;
- (BOOL)surroundToSelect;
- (NSArray)selectedNodes;
- (SCNAuthoringEnvironment)init;
- (SCNAuthoringEnvironmentDelegate)delegate;
- (SCNManipulator)manipulator;
- (SCNMatrix4)viewMatrix;
- (SCNNode)authoringOverlayLayer;
- (SCNSceneRenderer)sceneRenderer;
- (double)gridUnit;
- (id)_initWithEngineContext:(__C3DEngineContext *)a3;
- (id)authoringEnvironment2;
- (id)renderer;
- (id)selectedItems;
- (int64_t)authoringDisplayMask;
- (int64_t)editingSpace;
- (void)_setupAuthoringEnv2:(id)a3;
- (void)beginEditingNode:(id)a3;
- (void)beginEditingNodes:(id)a3;
- (void)beginOrbiting;
- (void)dealloc;
- (void)drawLineFromPoint:(SCNVector3)a3 toPoint:(SCNVector3)a4 color:(id)a5;
- (void)drawString:(id)a3 atPoint:(CGPoint)a4 color:(id)a5;
- (void)endOrbiting;
- (void)saveInitialSelection;
- (void)sceneDidChange:(id)a3;
- (void)setAuthoringDisplayMask:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEditingSpace:(int64_t)a3;
- (void)setGraphicalSelectionEnabled:(BOOL)a3;
- (void)setSelectionIsReadonly:(BOOL)a3;
- (void)setShouldSnapOnGrid:(BOOL)a3;
- (void)setShouldSnapToAlign:(BOOL)a3;
- (void)setSurroundToSelect:(BOOL)a3;
- (void)setupAuthoringEnv2;
- (void)update;
@end

@implementation SCNAuthoringEnvironment

- (SCNAuthoringEnvironment)init
{
  return self;
}

- (id)_initWithEngineContext:(__C3DEngineContext *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNAuthoringEnvironment;
  v3 = [(SCNAuthoringEnvironment *)&v5 init];
  if (v3)
  {
    LOBYTE(v3->_gridUnit) = 0;
    C3DWireframeRendererCreate();
  }
  return 0;
}

+ (int64_t)defaultAuthoringDisplayMask
{
  return 0;
}

+ (id)rendererForSceneRenderer:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return a3;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_super v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[SCNAuthoringEnvironment rendererForSceneRenderer:]();
    }
    return 0;
  }

  return (id)[a3 renderer];
}

+ (id)authoringEnvironmentForSceneRenderer:(id)a3
{
  return (id)[a1 authoringEnvironmentForSceneRenderer:a3 createIfNeeded:1];
}

+ (id)authoringEnvironmentForSceneRenderer:(id)a3 createIfNeeded:(BOOL)a4
{
  uint64_t AuthoringEnvironment = C3DEngineContextGetAuthoringEnvironment(objc_msgSend((id)objc_msgSend(a1, "rendererForSceneRenderer:"), "_engineContext"), a4);
  v6 = (unsigned char *)AuthoringEnvironment;
  if (AuthoringEnvironment)
  {
    *(void *)(AuthoringEnvironment + 16) = a3;
    objc_opt_class();
    v6[24] = objc_opt_isKindOfClass() & 1;
  }
  return v6;
}

- (SCNSceneRenderer)sceneRenderer
{
  return self->_sceneRenderer;
}

- (id)renderer
{
  v3 = objc_opt_class();
  sceneRenderer = self->_sceneRenderer;

  return (id)[v3 rendererForSceneRenderer:sceneRenderer];
}

- (SCNMatrix4)viewMatrix
{
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  result = (SCNMatrix4 *)self->_engineContext;
  if (result)
  {
    uint64_t Matrix4x4 = C3DEngineContextGetMatrix4x4((uint64_t)result, 1);
    C3DMatrix4x4ToSCNMatrix4(Matrix4x4, retstr);
  }
  else
  {
    *retstr = SCNMatrix4Identity;
  }
  return result;
}

- (BOOL)selectionIsReadonly
{
  v2 = (void *)[(objc_class *)self[1].super.isa manipulator];

  return [v2 readonly];
}

- (void)setSelectionIsReadonly:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)[(objc_class *)self[1].super.isa manipulator];

  [v4 setReadonly:v3];
}

- (void)setEditingSpace:(int64_t)a3
{
  if (self->_editingSpace != a3)
  {
    self->_editingSpace = a3;
    BOOL v3 = [(SCNAuthoringEnvironment *)self manipulator];
    [(SCNManipulator *)v3 editingSpaceChanged];
  }
}

- (void)_setupAuthoringEnv2:(id)a3
{
  p_authoringDisplayMask = &self->_authoringDisplayMask;
  if (!self[1].super.isa)
  {
    id v4 = +[SCNAuthoringEnvironment2 authoringEnvironmentForScene:a3 createIfNeeded:1];
    p_authoringDisplayMask[135] = (int64_t)v4;
    int64_t v5 = *p_authoringDisplayMask;
    [v4 setDisplayMask:v5];
  }
}

- (void)setupAuthoringEnv2
{
  if (!self[1].super.isa)
  {
    Scene = (id *)C3DEngineContextGetScene((uint64_t)self->_engineContext);
    ObjCWrapper = C3DEntityGetObjCWrapper(Scene);
    if (ObjCWrapper)
    {
      [(SCNAuthoringEnvironment *)self _setupAuthoringEnv2:ObjCWrapper];
    }
  }
}

- (id)authoringEnvironment2
{
  v2 = self + 1;
  Class isa = self[1].super.isa;
  if (!isa)
  {
    [(SCNAuthoringEnvironment *)self setupAuthoringEnv2];
    return v2->super.isa;
  }
  return isa;
}

- (void)update
{
  uint64_t RendererContextGL = C3DEngineContextGetRendererContextGL((uint64_t)self->_engineContext);
  if (RendererContextGL)
  {
    Showsuint64_t AuthoringEnvironment = C3DRendererContextGetShowsAuthoringEnvironment(RendererContextGL);
    uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)self->_engineContext);
    if (!RenderContext)
    {
      if (!ShowsAuthoringEnvironment) {
        return;
      }
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t RenderContext = C3DEngineContextGetRenderContext((uint64_t)self->_engineContext);
    if (!RenderContext) {
      return;
    }
  }
  if (!-[SCNMTLRenderContext showsAuthoringEnvironment](RenderContext)) {
    return;
  }
LABEL_7:
  Class isa = self[1].super.isa;
  int64_t authoringDisplayMask = self->_authoringDisplayMask;

  [(objc_class *)isa setDisplayMask:authoringDisplayMask];
}

- (void)sceneDidChange:(id)a3
{
  objc_msgSend((id)objc_msgSend(-[SCNAuthoringEnvironment authoringEnvironment2](self, "authoringEnvironment2"), "manipulator"), "_setAuthoringEnvironment:", 0);

  self[1].super.Class isa = 0;

  [(SCNAuthoringEnvironment *)self _setupAuthoringEnv2:a3];
}

- (SCNNode)authoringOverlayLayer
{
  id v2 = [(SCNAuthoringEnvironment *)self authoringEnvironment2];

  return (SCNNode *)[v2 authoringOverlayLayer];
}

- (SCNManipulator)manipulator
{
  return (SCNManipulator *)[(objc_class *)self[1].super.isa manipulator];
}

- (void)setAuthoringDisplayMask:(int64_t)a3
{
  p_int64_t authoringDisplayMask = &self->_authoringDisplayMask;
  self->_int64_t authoringDisplayMask = a3;
  objc_msgSend(-[SCNAuthoringEnvironment renderer](self, "renderer"), "_reloadDebugOptions");
  if ((a3 & 0x33C) != 0) {
    [(SCNAuthoringEnvironment *)self setupAuthoringEnv2];
  }
  v6 = (void *)p_authoringDisplayMask[135];
  if (v6)
  {
    [v6 setDisplayMask:a3];
  }
}

- (int64_t)authoringDisplayMask
{
  return self->_authoringDisplayMask;
}

- (NSArray)selectedNodes
{
  return *(NSArray **)&self->_isOrbiting;
}

- (id)selectedItems
{
  return self->_selectedNodes;
}

- (void)beginEditingNode:(id)a3
{
  id v3 = a3;
  v6[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    v6[0] = a3;
    a3 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  }
  [(SCNAuthoringEnvironment *)self beginEditingNodes:a3];
  Class isa = self[1].super.isa;
  if (isa) {
    [(objc_class *)isa selectNode:v3];
  }
}

- (void)beginEditingNodes:(id)a3
{
  p_selectedNodes = (id *)&self->_selectedNodes;
  v6 = objc_msgSend(-[SCNAuthoringEnvironment authoringEnvironment2](self, "authoringEnvironment2"), "manipulator");
  [v6 _setAuthoringEnvironment:self];
  objc_sync_enter(self);

  p_selectedNodes[1] = (id)[a3 copy];
  uint64_t v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__SCNAuthoringEnvironment_beginEditingNodes___block_invoke;
  v11[3] = &unk_2640051E0;
  v11[4] = v7;
  [a3 enumerateObjectsUsingBlock:v11];

  id *p_selectedNodes = (id)[objc_alloc(MEMORY[0x263EFF9B0]) initWithArray:v7];
  uint64_t SharedInstance = C3DNotificationCenterGetSharedInstance();
  Scene = (const void *)C3DEngineContextGetScene((uint64_t)self->_engineContext);
  C3DNotificationCenterPostNotification(SharedInstance, @"kC3DNotificationEngineContextInvalidatePasses", Scene, 0, 1u);
  objc_sync_exit(self);
  if ([*p_selectedNodes count]) {
    id v10 = *p_selectedNodes;
  }
  else {
    id v10 = 0;
  }
  [v6 setTargets:v10];
}

uint64_t __45__SCNAuthoringEnvironment_beginEditingNodes___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([a2 authoringEnvironmentNode]
    && [v2 authoringEnvironmentCompanionNode])
  {
    id v2 = (void *)[v2 authoringEnvironmentCompanionNode];
  }
  id v4 = +[SCNNodeManipulableItem nodeManipulatorItemWithNode:v2 screenSize:0.0];
  int64_t v5 = *(void **)(a1 + 32);

  return [v5 addObject:v4];
}

- (void)saveInitialSelection
{
  self->_selection = (NSMutableOrderedSet *)objc_msgSend((id)objc_msgSend(-[SCNAuthoringEnvironment selectedItems](self, "selectedItems"), "set"), "copy");
}

- (void)beginOrbiting
{
  LOBYTE(self->_gridUnit) = 1;
}

- (void)endOrbiting
{
  LOBYTE(self->_gridUnit) = 0;
}

- (BOOL)didTapAtPoint:(CGPoint)a3
{
  p_waitDisplayLinkTime = &self->_statisticsInfo.waitDisplayLinkTime;
  if (!LOBYTE(self->_statisticsInfo.waitDisplayLinkTime)) {
    goto LABEL_13;
  }
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v19 = 0;
  __appendText_(0, &v19, 0, @"$1$", 0, (uint64_t)&self->_boldTextInfo, 0, 0);
  float v18 = *(float *)&v19;
  if (*((unsigned char *)p_waitDisplayLinkTime + 1))
  {
    float v7 = self->_normalTextInfo.lineHeight * 7.0 + 14.0;
    float v8 = v7 + 3.0;
  }
  else
  {
    float v8 = 3.0;
  }
  unint64_t v9 = C3DEngineContextGetDrawableSafeAreaInsets((__n128 *)self->_engineContext).n128_u64[0];
  v22.origin.CGFloat y = (float)(v8 + *((float *)&v9 + 1));
  v22.size.CGFloat height = v18;
  v22.origin.CGFloat x = (float)(*(float *)&v9 + 7.0);
  v22.size.CGFloat width = v18;
  CGRect v23 = CGRectInset(v22, -10.0, -10.0);
  double v10 = v23.origin.x;
  CGFloat v11 = v23.origin.y;
  CGFloat width = v23.size.width;
  CGFloat height = v23.size.height;
  v20.CGFloat x = x;
  v20.CGFloat y = y;
  BOOL v14 = CGRectContainsPoint(v23, v20);
  if (v14)
  {
    uint64_t v15 = 0;
  }
  else
  {
    v24.origin.CGFloat x = v10 + (float)(v18 + 5.0);
    v24.origin.CGFloat y = v11;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    v21.CGFloat x = x;
    v21.CGFloat y = y;
    BOOL v16 = CGRectContainsPoint(v24, v21);
    if (!v16) {
      return v16;
    }
    uint64_t v15 = 1;
  }
  *((void *)p_waitDisplayLinkTime + 2) = v15;
  if (!*(unsigned char *)p_waitDisplayLinkTime)
  {
LABEL_13:
    LOBYTE(v16) = 0;
    return v16;
  }
  if (v14) {
    *((unsigned char *)p_waitDisplayLinkTime + 1) ^= 1u;
  }
  *((void *)p_waitDisplayLinkTime + 2) = -1;
  LOBYTE(v16) = 1;
  return v16;
}

- (void)drawLineFromPoint:(SCNVector3)a3 toPoint:(SCNVector3)a4 color:(id)a5
{
  float z = a4.z;
  float y = a4.y;
  v12.i64[0] = *(void *)&a4.x;
  float v11 = a3.z;
  float v10 = a3.y;
  v9.i64[0] = *(void *)&a3.x;
  v15[0] = C3DColor4FromRGBCFColor(a5, 0);
  v15[1] = v6;
  float32x4_t v7 = v9;
  v7.f32[1] = v10;
  v7.f32[2] = v11;
  float32x4_t v8 = v12;
  v8.f32[1] = y;
  v8.f32[2] = z;
  C3DAuthoringEnvironmentAppendDebugSegment((uint64_t)self, 0, (float *)v15, 0, v7, v8);
}

- (void)drawString:(id)a3 atPoint:(CGPoint)a4 color:(id)a5
{
  CGFloat x = a4.x;
  CGFloat y = a4.y;
  v11[0] = C3DColor4FromRGBCFColor(a5, 0);
  v11[1] = v7;
  v8.f64[0] = x;
  v8.f64[1] = y;
  C3DAuthoringEnvironmentAppendDebugString((uint64_t)self, (const __CFString *)a3, v11, COERCE_DOUBLE(vcvt_f32_f64(v8)));
}

- (void)dealloc
{
  p_selection = &self->_selection;
  objc_msgSend((id)objc_msgSend(-[SCNAuthoringEnvironment authoringEnvironment2](self, "authoringEnvironment2"), "manipulator"), "_setAuthoringEnvironment:", 0);
  C3DRasterizerStatesRelease(self->_depthOnCullOnStates);
  C3DRasterizerStatesRelease(self->_depthOnCullOffStates);
  C3DRasterizerStatesRelease(self->_depthOffCullOnStates);
  C3DRasterizerStatesRelease(self->_depthOffCullOffStates);

  __destroyGLInfo((uint64_t)self, (uint64_t)&self->_logsInfo);
  __destroyGLInfo((uint64_t)self, (uint64_t)&self->_dynamicLinesInfo);
  __destroyGLInfo((uint64_t)self, (uint64_t)&self->_dynamicLinesNoDepthTestInfo);
  __destroyGLInfo((uint64_t)self, (uint64_t)&self->_overlayDynamicLinesInfo);
  __destroyGLInfo((uint64_t)self, (uint64_t)&self->_overlayDynamicTriangleInfo);
  __destroyGLInfo((uint64_t)self, (uint64_t)&self->_dynamicTrianglesInfo);
  __destroyGLInfo((uint64_t)self, (uint64_t)&self->_lightProbesInfo);
  __destroyGLInfo((uint64_t)self, (uint64_t)&self->_textInfo);
  __destroyGLInfo((uint64_t)self, (uint64_t)&self->_boldLogsInfo);
  texture = self->_normalTextInfo.textureInfo.texture;
  if (texture)
  {
    CFRelease(texture);
    self->_normalTextInfo.textureInfo.texture = 0;
  }
  symbolRects = self->_normalTextInfo.symbolRects;
  if (symbolRects) {
    free(symbolRects);
  }
  characterWidth_typographCGFloat y = self->_normalTextInfo.characterWidth_typography;
  if (characterWidth_typography) {
    free(characterWidth_typography);
  }
  uint64_t v7 = self->_boldTextInfo.textureInfo.texture;
  if (v7)
  {
    CFRelease(v7);
    self->_boldTextInfo.textureInfo.texture = 0;
  }
  float64x2_t v8 = self->_boldTextInfo.symbolRects;
  if (v8) {
    free(v8);
  }
  float32x4_t v9 = self->_boldTextInfo.characterWidth_typography;
  if (v9) {
    free(v9);
  }

  noColorProgram = self->_noColorProgram;
  if (noColorProgram)
  {
    CFRelease(noColorProgram);
    self->_noColorProgram = 0;
  }
  colorOnlyProgram = self->_colorOnlyProgram;
  if (colorOnlyProgram)
  {
    CFRelease(colorOnlyProgram);
    self->_colorOnlyProgram = 0;
  }
  colorAndTextureProgram = self->_colorAndTextureProgram;
  if (colorAndTextureProgram)
  {
    CFRelease(colorAndTextureProgram);
    self->_colorAndTextureProgram = 0;
  }
  lightProbesProgram = self->_lightProbesProgram;
  if (lightProbesProgram)
  {
    CFRelease(lightProbesProgram);
    self->_lightProbesProgram = 0;
  }
  wireframeProgram = self->_wireframeProgram;
  if (wireframeProgram)
  {
    CFRelease(wireframeProgram);
    self->_wireframeProgram = 0;
  }
  drawInstancedQuadProgram = self->_drawInstancedQuadProgram;
  if (drawInstancedQuadProgram)
  {
    CFRelease(drawInstancedQuadProgram);
    self->_drawInstancedQuadProgram = 0;
  }
  drawInstancedCubeProgram = self->_drawInstancedCubeProgram;
  if (drawInstancedCubeProgram)
  {
    CFRelease(drawInstancedCubeProgram);
    self->_drawInstancedCubeProgram = 0;
  }
  v17 = p_selection[13];
  if (v17)
  {
    CFRelease(v17);
    p_selection[13] = 0;
  }
  float v18 = p_selection[12];
  if (v18)
  {
    CFRelease(v18);
    p_selection[12] = 0;
  }
  uint64_t v19 = p_selection[11];
  if (v19)
  {
    CFRelease(v19);
    p_selection[11] = 0;
  }
  C3DWireframeRendererDestroy((WireframeMeshRenderer *)p_selection[6]);

  v20.receiver = self;
  v20.super_class = (Class)SCNAuthoringEnvironment;
  [(SCNAuthoringEnvironment *)&v20 dealloc];
}

- (BOOL)isEditingSubComponent
{
  return 0;
}

- (BOOL)shouldSnapOnGrid
{
  return self->_shouldSnapOnGrid;
}

- (void)setShouldSnapOnGrid:(BOOL)a3
{
  self->_shouldSnapOnGrid = a3;
}

- (BOOL)shouldSnapToAlign
{
  return self->_shouldSnapToAlign;
}

- (void)setShouldSnapToAlign:(BOOL)a3
{
  self->_shouldSnapToAlign = a3;
}

- (double)gridUnit
{
  return *(double *)&self->_visibleManipulableItems;
}

- (int64_t)editingSpace
{
  return self->_editingSpace;
}

- (SCNAuthoringEnvironmentDelegate)delegate
{
  return (SCNAuthoringEnvironmentDelegate *)self->_authEnv2;
}

- (void)setDelegate:(id)a3
{
  self->_authEnid v2 = (SCNAuthoringEnvironment2 *)a3;
}

- (BOOL)graphicalSelectionEnabled
{
  return self->_graphicalSelectionEnabled;
}

- (void)setGraphicalSelectionEnabled:(BOOL)a3
{
  self->_graphicalSelectionEnabled = a3;
}

- (BOOL)surroundToSelect
{
  return BYTE1(self->_initialSelection);
}

- (void)setSurroundToSelect:(BOOL)a3
{
  BYTE1(self->_initialSelection) = a3;
}

+ (void)rendererForSceneRenderer:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Unknown SCNSceneRenderer conforming class", v2, v3, v4, v5, v6);
}

@end