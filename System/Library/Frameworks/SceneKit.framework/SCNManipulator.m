@interface SCNManipulator
- (BOOL)_applyWithEvent:(id *)a3;
- (BOOL)isDragging;
- (BOOL)mouseDown:(id *)a3;
- (BOOL)mouseDragged:(id *)a3;
- (BOOL)mouseMoved:(id *)a3;
- (BOOL)mouseUp:(id *)a3;
- (BOOL)readonly;
- (NSOrderedSet)targets;
- (SCNAuthoringEnvironment)authoringEnvironment;
- (SCNManipulator)init;
- (SCNMatrix4)transform;
- (SCNNode)manipulatorNode;
- (SCNNode)target;
- (const)snapInfoAtIndex:(unint64_t)a3 axis:(unint64_t)a4;
- (id)copy;
- (id)hitTest:(id *)a3;
- (id)scene;
- (id)setupClones;
- (id)snapGuideIndexesOnAxis:(unint64_t)a3;
- (int64_t)effectiveEditingSpace;
- (int64_t)xAlignment;
- (int64_t)yAlignment;
- (int64_t)zAlignment;
- (unint64_t)_effectiveFeatures;
- (unint64_t)features;
- (void)_deleteOriginalData;
- (void)_prepareSnapToAlignData:(SCNManipulator *)self minOffset:(SEL)a2 maxOffset:(unsigned __int16)a3;
- (void)_saveOriginalData;
- (void)_setAuthoringEnvironment:(id)a3;
- (void)_snapPositionToAlign:(float)a3 original:(float)a4 unit:(float)a5 axisMove:(double)a6 rayStart:(__n128)a7 rayDir:(__n128)a8 didSnap:(uint64_t)a9 snapIndexes:(int)a10;
- (void)_updateActionWithEvent:(id *)a3;
- (void)addClonesToScene;
- (void)clearSnapIndexes;
- (void)dealloc;
- (void)lockLayout;
- (void)prepareSnapToAlignData;
- (void)prepareSnapToAlignDataIfNeeded;
- (void)removeClonesFromScene;
- (void)setAlternateMode:(BOOL)a3;
- (void)setFeatures:(unint64_t)a3;
- (void)setReadonly:(BOOL)a3;
- (void)setTarget:(id)a3;
- (void)setTargets:(id)a3;
- (void)setXAlignment:(int64_t)a3;
- (void)setYAlignment:(int64_t)a3;
- (void)setZAlignment:(int64_t)a3;
- (void)setupNode;
- (void)unhighlightSelectedNode;
- (void)unlockLayout;
- (void)updateItemsPosition;
- (void)updateItemsRotation:(SCNManipulator *)self;
- (void)updateItemsScale:(float)a3;
- (void)updateManipulatorComponents;
- (void)updateManipulatorNode;
- (void)updateManipulatorPosition:(__C3DEngineContext *)a3;
- (void)validateClones;
@end

@implementation SCNManipulator

- (NSOrderedSet)targets
{
  return self->_targets;
}

- (void)setTargets:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = [(SCNManipulator *)self authoringEnvironment];
  objc_sync_enter(v5);
  v6 = self->_targets;
  self->_targets = 0;
  if (a3)
  {
    v7 = objc_msgSend(MEMORY[0x263EFF9B0], "orderedSetWithCapacity:", objc_msgSend(a3, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(a3);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
          if (![v11 component])
          {
            for (uint64_t i = [v11 parentItem]; ; uint64_t i = objc_msgSend(v13, "parentItem"))
            {
              v13 = (void *)i;
              if (!i) {
                break;
              }
              if ([a3 containsObject:i]) {
                goto LABEL_9;
              }
            }
          }
          [v7 addObject:v11];
LABEL_9:
          ++v10;
        }
        while (v10 != v8);
        uint64_t v14 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
        uint64_t v8 = v14;
      }
      while (v14);
    }
    self->_targets = (NSOrderedSet *)v7;
  }
  objc_sync_exit(v5);
  [(SCNManipulator *)self updateManipulatorNode];
}

- (SCNNode)target
{
  v3 = [(SCNManipulator *)self authoringEnvironment];
  objc_sync_enter(v3);
  if ([(NSOrderedSet *)self->_targets count]) {
    v4 = [(NSOrderedSet *)self->_targets firstObject];
  }
  else {
    v4 = 0;
  }
  objc_sync_exit(v3);
  return v4;
}

- (void)setTarget:(id)a3
{
  if (a3) {
    a3 = (id)objc_msgSend(MEMORY[0x263EFF9D8], "orderedSetWithObject:");
  }

  [(SCNManipulator *)self setTargets:a3];
}

- (SCNAuthoringEnvironment)authoringEnvironment
{
  return self->_authoringEnvironment;
}

- (void)_setAuthoringEnvironment:(id)a3
{
  self->_authoringEnvironment = (SCNAuthoringEnvironment *)a3;
}

- (SCNMatrix4)transform
{
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  C3DMatrix4x4ToSCNMatrix4((uint64_t)&self->_worldMatrix.components[1], retstr);
  return result;
}

- (SCNManipulator)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCNManipulator;
  v2 = [(SCNManipulator *)&v5 init];
  v3 = v2;
  if (v2)
  {
    C3DMatrix4x4MakeRotationY((C3DMatrix4x4 *)v2->_xAxisToZAxisTransform.components, 1.5708);
    C3DMatrix4x4MakeRotationX((C3DMatrix4x4 *)v3->_yAxisToZAxisTransform.components, -1.5708);
    C3DMatrix4x4MakeRotationY((C3DMatrix4x4 *)v3->_xyPlaneToYZPlaneTransform.components, -1.5708);
    C3DMatrix4x4MakeRotationX((C3DMatrix4x4 *)v3->_xyPlaneToXZPlaneTransform.components, 1.5708);
    v3->_zAlignment = 0;
    *(_OWORD *)&v3->_xAlignment = 0u;
    v3->_snapXIndexes = (NSMutableIndexSet *)(id)[MEMORY[0x263F089C8] indexSet];
    v3->_snapYIndexes = (NSMutableIndexSet *)(id)[MEMORY[0x263F089C8] indexSet];
    v3->_snapZIndexes = (NSMutableIndexSet *)(id)[MEMORY[0x263F089C8] indexSet];
    v3->_features = 3;
  }
  return v3;
}

- (void)dealloc
{
  [(SCNManipulator *)self _deleteOriginalData];

  free(self->_snapToAlignOnX);
  free(self->_snapToAlignOnY);
  free(self->_snapToAlignOnZ);
  [(SCNNode *)self->_node removeFromParentNode];

  v3.receiver = self;
  v3.super_class = (Class)SCNManipulator;
  [(SCNManipulator *)&v3 dealloc];
}

- (id)copy
{
  objc_super v3 = objc_alloc_init(SCNManipulator);
  [(SCNManipulator *)v3 setTarget:[(SCNManipulator *)self target]];
  return v3;
}

- (int64_t)effectiveEditingSpace
{
  if ((unint64_t)[(SCNAuthoringEnvironment *)[(SCNManipulator *)self authoringEnvironment] editingSpace] <= 1&& [(NSOrderedSet *)self->_targets count] > 1)
  {
    return 2;
  }
  v4 = [(SCNManipulator *)self authoringEnvironment];

  return [(SCNAuthoringEnvironment *)v4 editingSpace];
}

- (BOOL)isDragging
{
  return self->_isMouseDown;
}

- (SCNNode)manipulatorNode
{
  result = self->_node;
  if (!result)
  {
    [(SCNManipulator *)self setupNode];
    return self->_node;
  }
  return result;
}

- (void)setupNode
{
  BOOL v39 = +[SCNTransaction immediateMode];
  +[SCNTransaction setImmediateMode:1];
  self->_node = +[SCNNode node];
  objc_super v3 = _arrowNode(objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorRed));
  v4 = _arrowNode(objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorGreen));
  objc_super v5 = (SCNNode *)_arrowNode(objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorBlue));
  self->_zArrow = v5;
  LODWORD(v6) = -1077342245;
  objc_msgSend(v3, "setEulerAngles:", 0.0, 0.0, v6);
  LODWORD(v7) = 1070141403;
  -[SCNNode setEulerAngles:](v5, "setEulerAngles:", v7, 0.0, 0.0);
  [v3 setCategoryBitMask:273];
  [v4 setCategoryBitMask:289];
  [(SCNNode *)v5 setCategoryBitMask:305];
  uint64_t v8 = _axisNode(objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorRed));
  uint64_t v9 = _axisNode(objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorGreen));
  uint64_t v10 = _axisNode(objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorBlue));
  LODWORD(v11) = -1077342245;
  objc_msgSend(v8, "setEulerAngles:", 0.0, 0.0, v11);
  LODWORD(v12) = 1070141403;
  objc_msgSend(v10, "setEulerAngles:", v12, 0.0, 0.0);
  v13 = +[SCNNode node];
  self->_axis = v13;
  [(SCNNode *)v13 addChildNode:v8];
  [(SCNNode *)self->_axis addChildNode:v9];
  [(SCNNode *)self->_axis addChildNode:v10];
  [(SCNNode *)self->_axis setHidden:1];
  [(SCNNode *)self->_node addChildNode:self->_axis];
  uint64_t v14 = +[SCNNode node];
  [(SCNNode *)v14 addChildNode:v3];
  [(SCNNode *)v14 addChildNode:v4];
  [(SCNNode *)v14 addChildNode:v5];
  self->_translateHandles = v14;
  [(SCNNode *)self->_node addChildNode:v14];
  self->_planarTranslationHandleXY = (SCNNode *)_translationPlaneNode(objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorBlue));
  self->_planarTranslationHandleYZ = (SCNNode *)_translationPlaneNode(objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorRed));
  self->_planarTranslationHandleXZ = (SCNNode *)_translationPlaneNode(objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorGreen));
  LODWORD(v15) = -1077342245;
  -[SCNNode setEulerAngles:](self->_planarTranslationHandleYZ, "setEulerAngles:", 0.0, v15, 0.0);
  LODWORD(v16) = 1070141403;
  -[SCNNode setEulerAngles:](self->_planarTranslationHandleXZ, "setEulerAngles:", v16, 0.0, 0.0);
  [(SCNNode *)self->_planarTranslationHandleXY setCategoryBitMask:561];
  [(SCNNode *)self->_planarTranslationHandleYZ setCategoryBitMask:529];
  [(SCNNode *)self->_planarTranslationHandleXZ setCategoryBitMask:545];
  long long v17 = +[SCNNode node];
  self->_planarTranslationHandles = v17;
  [(SCNNode *)v17 addChildNode:self->_planarTranslationHandleXY];
  [(SCNNode *)self->_planarTranslationHandles addChildNode:self->_planarTranslationHandleYZ];
  [(SCNNode *)self->_planarTranslationHandles addChildNode:self->_planarTranslationHandleXZ];
  [(SCNNode *)self->_node addChildNode:self->_planarTranslationHandles];
  self->_arcHandleXY = (SCNNode *)_rotationArcNode(objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorBlue));
  self->_arcHandleYZ = (SCNNode *)_rotationArcNode(objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorRed));
  self->_arcHandleXZ = (SCNNode *)_rotationArcNode(objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorGreen));
  LODWORD(v18) = -1077342245;
  LODWORD(v19) = 1078530011;
  -[SCNNode setEulerAngles:](self->_arcHandleXY, "setEulerAngles:", v18, 0.0, v19);
  LODWORD(v20) = 1078530011;
  LODWORD(v21) = -1077342245;
  -[SCNNode setEulerAngles:](self->_arcHandleYZ, "setEulerAngles:", v20, 0.0, v21);
  LODWORD(v22) = 1078530011;
  -[SCNNode setEulerAngles:](self->_arcHandleXZ, "setEulerAngles:", 0.0, v22, 0.0);
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[SCNNode childNodes](self->_arcHandleXY, "childNodes"), "objectAtIndexedSubscript:", 0), "setCategoryBitMask:", 561);
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[SCNNode childNodes](self->_arcHandleYZ, "childNodes"), "objectAtIndexedSubscript:", 0), "setCategoryBitMask:", 529);
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[SCNNode childNodes](self->_arcHandleXZ, "childNodes"), "objectAtIndexedSubscript:", 0), "setCategoryBitMask:", 545);
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[SCNNode childNodes](self->_arcHandleXY, "childNodes"), "objectAtIndexedSubscript:", 1), "setCategoryBitMask:", 817);
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[SCNNode childNodes](self->_arcHandleYZ, "childNodes"), "objectAtIndexedSubscript:", 1), "setCategoryBitMask:", 785);
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[SCNNode childNodes](self->_arcHandleXZ, "childNodes"), "objectAtIndexedSubscript:", 1), "setCategoryBitMask:", 801);
  v23 = +[SCNNode node];
  self->_arcHandles = v23;
  [(SCNNode *)v23 addChildNode:self->_arcHandleXY];
  [(SCNNode *)self->_arcHandles addChildNode:self->_arcHandleYZ];
  [(SCNNode *)self->_arcHandles addChildNode:self->_arcHandleXZ];
  [(SCNNode *)self->_node addChildNode:self->_arcHandles];
  v24 = +[SCNNode node];
  v25 = _wireframeCircle(objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorRed), 1.0);
  v26 = _wireframeCircle(objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorGreen), 1.0);
  v27 = _wireframeCircle(objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorBlue), 1.0);
  v28 = _wireframeCircle(objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", &C3DAuthoringEnvironmentColorGrayDark), 1.02);
  [v25 setRenderingOrder:2];
  [v26 setRenderingOrder:2];
  [v27 setRenderingOrder:2];
  [v28 setRenderingOrder:0];
  LODWORD(v29) = -1077342245;
  objc_msgSend(v25, "setEulerAngles:", 0.0, 0.0, v29);
  LODWORD(v30) = 1070141403;
  objc_msgSend(v27, "setEulerAngles:", v30, 0.0, 0.0);
  LODWORD(v31) = 1070141403;
  objc_msgSend(v28, "setEulerAngles:", v31, 0.0, 0.0);
  [v25 setCategoryBitMask:785];
  [v26 setCategoryBitMask:801];
  [v27 setCategoryBitMask:817];
  [v28 setCategoryBitMask:769];
  v32 = +[SCNNode node];
  [(SCNNode *)v32 addChildNode:v28];
  v33 = +[SCNBillboardConstraint billboardConstraint];
  self->_billboard = v33;
  [(SCNBillboardConstraint *)v33 setPreserveScale:1];
  self->_screenSpaceRotation = v32;
  v34 = +[SCNNode node];
  self->_rotationHandles = v34;
  [(SCNNode *)v34 addChildNode:v25];
  [(SCNNode *)self->_rotationHandles addChildNode:v26];
  [(SCNNode *)self->_rotationHandles addChildNode:v27];
  [(SCNNode *)v24 addChildNode:self->_rotationHandles];
  [(SCNNode *)v24 addChildNode:v32];
  [(SCNNode *)self->_node addChildNode:v24];
  v35 = +[SCNSphere sphereWithRadius:0.99];
  [(SCNSphere *)v35 setGeodesic:1];
  [(SCNSphere *)v35 setSegmentCount:24];
  [(SCNMaterial *)[(SCNGeometry *)v35 firstMaterial] setLightingModelName:@"SCNLightingModelConstant"];
  [(SCNMaterial *)[(SCNGeometry *)v35 firstMaterial] setColorBufferWriteMask:0];
  v36 = +[SCNNode nodeWithGeometry:v35];
  [(SCNNode *)v36 setOpacity:0.01];
  [(SCNNode *)v36 setRenderingOrder:1];
  self->_occluder = v36;
  [(SCNNode *)self->_node addChildNode:v36];
  v37 = +[SCNBox boxWithWidth:0.2 height:0.2 length:0.2 chamferRadius:0.0];
  -[SCNMaterialProperty setContents:](-[SCNMaterial diffuse](-[SCNGeometry firstMaterial](v37, "firstMaterial"), "diffuse"), "setContents:", objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DAuthoringEnvironmentColorYellow));
  [(SCNMaterial *)[(SCNGeometry *)v37 firstMaterial] setLightingModelName:@"SCNLightingModelConstant"];
  v38 = +[SCNNode nodeWithGeometry:v37];
  self->_scaleNode = v38;
  [(SCNNode *)v38 setCategoryBitMask:1073];
  [(SCNNode *)self->_scaleNode setHidden:1];
  [(SCNNode *)self->_node addChildNode:self->_scaleNode];
  [(SCNManipulator *)self updateManipulatorComponents];

  +[SCNTransaction setImmediateMode:v39];
}

- (void)updateManipulatorPosition:(__C3DEngineContext *)a3
{
  BOOL v5 = +[SCNTransaction immediateMode];
  +[SCNTransaction setImmediateMode:1];
  __computeAnchorMatrix(self, &v59);
  long long v6 = v60;
  *(float32x4_t *)&self->_worldMatrix.components[1] = v59;
  *(_OWORD *)&self->_worldMatrix.components[5] = v6;
  long long v7 = v62;
  *(_OWORD *)&self->_worldMatrix.components[9] = v61;
  *(_OWORD *)&self->_worldMatrix.components[13] = v7;
  -[SCNNode setSimdWorldTransform:](self->_node, "setSimdWorldTransform:", *(double *)&self->_worldMatrix.components[1], *(double *)&self->_worldMatrix.components[5], *(double *)&self->_worldMatrix.components[9], *(double *)&self->_worldMatrix.components[13]);
  C3DSizeForScreenSpaceSizeAndTransform((__n128 *)a3);
  float v9 = v8;
  node = self->_node;
  if (v8 <= 0.000001)
  {
    [(SCNNode *)node setOpacity:0.0];
  }
  else
  {
    planarTranslationLayout = (float32x2_t *)self->_planarTranslationLayout;
    [(SCNNode *)node setOpacity:1.0];
    *(float *)&double v12 = v9;
    *(float *)&double v13 = v9;
    *(float *)&double v14 = v9;
    -[SCNNode setScale:](self->_node, "setScale:", v12, v13, v14);
    int64_t v15 = [(SCNManipulator *)self effectiveEditingSpace];
    if (!self->_layoutLocked || v15 == 3)
    {
      if (v15 == 3)
      {
        __asm { FMOV            V0.4S, #1.0 }
        *(_OWORD *)self->_planarTranslationLayout = _Q0;
      }
      else
      {
        long long v61 = 0u;
        long long v62 = 0u;
        float32x4_t v59 = 0u;
        long long v60 = 0u;
        Matrix4x4 = (float32x4_t *)C3DEngineContextGetMatrix4x4((uint64_t)a3, 1);
        C3DMatrix4x4Mult((uint64_t)&self->_worldMatrix.components[1], Matrix4x4, &v59);
        float32x4_t v55 = v59;
        long long v56 = v60;
        long long v57 = v61;
        long long v58 = v62;
        *(double *)v22.i64 = C3DVector3Rotate((float32x2_t *)&v55, (float32x4_t)xmmword_20B5CB820);
        int32x4_t v52 = v22;
        float32x4_t v55 = v59;
        long long v56 = v60;
        long long v57 = v61;
        long long v58 = v62;
        *(double *)v23.i64 = C3DVector3Rotate((float32x2_t *)&v55, (float32x4_t)xmmword_20B5CB7D0);
        int32x4_t v49 = v23;
        float32x4_t v55 = v59;
        long long v56 = v60;
        long long v57 = v61;
        long long v58 = v62;
        C3DVector3Rotate((float32x2_t *)&v55, (float32x4_t)xmmword_20B5CB520);
        int32x4_t v26 = vzip2q_s32(v52, v49);
        __asm
        {
          FMOV            V2.2S, #1.0
          FMOV            V3.2S, #-1.0
        }
        *(int8x8_t *)v26.i8 = vbsl_s8((int8x8_t)vcltz_f32(*(float32x2_t *)v26.i8), _D3, _D2);
        if (v27 >= 0.0) {
          float v28 = 1.0;
        }
        else {
          float v28 = -1.0;
        }
        float v29 = 1.5708;
        float v30 = 3.1416;
        if (*(float *)&v26.i32[1] == 1.0) {
          float v31 = 0.0;
        }
        else {
          float v31 = 1.5708;
        }
        if (*(float *)&v26.i32[1] == 1.0) {
          float v32 = 3.1416;
        }
        else {
          float v32 = -1.5708;
        }
        if (*(float *)&v26.i32[1] == 1.0) {
          float v33 = -1.5708;
        }
        else {
          float v33 = 0.0;
        }
        if (*(float *)&v26.i32[1] == 1.0) {
          float v34 = -1.5708;
        }
        else {
          float v34 = 1.5708;
        }
        if (v28 == 1.0) {
          float v35 = v33;
        }
        else {
          float v35 = v34;
        }
        if (v28 == 1.0) {
          float v36 = v32;
        }
        else {
          float v36 = 0.0;
        }
        if (v28 == 1.0) {
          float v37 = v31;
        }
        else {
          float v37 = 0.0;
        }
        if (v28 != 1.0)
        {
          float v30 = -1.5708;
          float v29 = 0.0;
        }
        *(float *)&v26.i32[2] = v28;
        *(int32x4_t *)self->_planarTranslationLayout = v26;
        if (*(float *)v26.i32 == 1.0) {
          float v38 = v30;
        }
        else {
          float v38 = v29;
        }
        [(SCNNode *)self->_arcHandleXY setEulerAngles:*(_OWORD *)&v49];
        *(float *)&double v39 = v36;
        *(float *)&double v40 = v37;
        *(float *)&double v41 = v35;
        -[SCNNode setEulerAngles:](self->_arcHandleYZ, "setEulerAngles:", v39, v40, v41);
        *(float *)&double v42 = v38;
        -[SCNNode setEulerAngles:](self->_arcHandleXZ, "setEulerAngles:", 0.0, v42, 0.0);
      }
    }
    float64x2_t v53 = (float64x2_t)vdupq_n_s64(0x3FD3333333333333uLL);
    __asm { FMOV            V1.2D, #0.5 }
    float64x2_t v50 = _Q1;
    double v44 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(vmulq_f64(vcvtq_f64_f32(*planarTranslationLayout), v53), _Q1)));
    LODWORD(_Q1.f64[0]) = HIDWORD(v44);
    -[SCNNode setPosition:](self->_planarTranslationHandleXY, "setPosition:", v44, _Q1.f64[0], 0.0, *(_OWORD *)&v50);
    double v45 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)&self->_planarTranslationLayout[4]), v53), v51)));
    LODWORD(v46) = HIDWORD(v45);
    -[SCNNode setPosition:](self->_planarTranslationHandleYZ, "setPosition:", 0.0, v45, v46);
    HIDWORD(v47) = 1070805811;
    double v48 = COERCE_FLOAT(*(_OWORD *)planarTranslationLayout->f32) * 0.3 * 0.5;
    *(float *)&double v48 = v48;
    *(float *)&double v47 = COERCE_FLOAT(*(void *)&self->_planarTranslationLayout[8]) * 0.3 * 0.5;
    -[SCNNode setPosition:](self->_planarTranslationHandleXZ, "setPosition:", v48, 0.0, v47);
    if (self->_screenSpaceRotation)
    {
      long long v61 = 0u;
      long long v62 = 0u;
      float32x4_t v59 = 0u;
      long long v60 = 0u;
      if (C3DConstraintBillboardMatrixForNode((uint64_t)a3, (uint64_t)[(SCNConstraint *)self->_billboard __CFObject], (float32x4_t *)[(SCNNode *)self->_screenSpaceRotation nodeRef], &v59, 1.0))
      {
        long long v57 = 0u;
        long long v58 = 0u;
        float32x4_t v55 = 0u;
        long long v56 = 0u;
        C3DMatrix4x4ToSCNMatrix4((uint64_t)&v59, &v55);
        v54[0] = v55;
        v54[1] = v56;
        v54[2] = v57;
        v54[3] = v58;
        [(SCNNode *)self->_screenSpaceRotation setTransform:v54];
      }
    }
  }
  +[SCNTransaction setImmediateMode:v5];
}

- (void)updateManipulatorNode
{
  node = self->_node;
  if (!node)
  {
    [(SCNManipulator *)self setupNode];
    node = self->_node;
  }
  if (![(SCNNode *)node parentNode])
  {
    v4 = [(SCNAuthoringEnvironment *)[(SCNManipulator *)self authoringEnvironment] authoringOverlayLayer];
    BOOL v5 = [(SCNManipulator *)self manipulatorNode];
    [(SCNNode *)v4 addChildNode:v5];
  }
}

- (void)updateManipulatorComponents
{
  char v3 = [(SCNManipulator *)self _effectiveFeatures];
  int64_t v4 = [(SCNManipulator *)self effectiveEditingSpace];
  BOOL v5 = (v3 & 4) != 0 && !self->_readonly;
  int v6 = !v5;
  [(SCNNode *)self->_scaleNode setHidden:!v5];
  if ((v3 & 2) != 0)
  {
    BOOL v7 = !self->_readonly;
    if (v3) {
      goto LABEL_6;
    }
  }
  else
  {
    BOOL v7 = 0;
    if (v3)
    {
LABEL_6:
      BOOL v8 = !self->_readonly;
      goto LABEL_9;
    }
  }
  BOOL v8 = 0;
LABEL_9:
  BOOL v9 = v4 == 3;
  BOOL v10 = v4 == 3;
  uint64_t v11 = v8 & v6 | !v7;
  if (v9) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = v11;
  }
  [(SCNNode *)self->_rotationHandles setHidden:v12];
  [(SCNNode *)self->_screenSpaceRotation setHidden:v11];
  [(SCNNode *)self->_translateHandles setHidden:v6 & !v8];
  int v13 = self->_readonly || !v8;
  [(SCNNode *)self->_planarTranslationHandles setHidden:(v5 || v7) | v13];
  int v14 = !v7 || !v8;
  if (self->_readonly) {
    int v14 = 1;
  }
  [(SCNNode *)self->_arcHandles setHidden:v14 | v5];
  [(SCNNode *)self->_axis setHidden:!self->_readonly];
  [(SCNNode *)self->_zArrow setHidden:v10];
  [(SCNNode *)self->_planarTranslationHandleXZ setHidden:v10];
  [(SCNNode *)self->_planarTranslationHandleYZ setHidden:v10];
  [(SCNNode *)self->_arcHandleXZ setHidden:v10];
  arcHandleYZ = self->_arcHandleYZ;

  [(SCNNode *)arcHandleYZ setHidden:v10];
}

- (unint64_t)_effectiveFeatures
{
  unint64_t features = self->_features;
  unint64_t v3 = features | 4;
  if ((features & 4) != 0) {
    unint64_t v3 = 7;
  }
  if (self->_alternateMode) {
    return v3;
  }
  else {
    return self->_features;
  }
}

- (void)setFeatures:(unint64_t)a3
{
  self->_unint64_t features = a3;
  [(SCNManipulator *)self updateManipulatorComponents];
}

- (void)setAlternateMode:(BOOL)a3
{
  self->_alternateMode = a3;
  [(SCNManipulator *)self updateManipulatorComponents];
}

- (void)setReadonly:(BOOL)a3
{
  self->_readonly = a3;
  [(SCNManipulator *)self updateManipulatorComponents];
}

- (unint64_t)features
{
  return self->_features;
}

- (void)lockLayout
{
  self->_layoutLocked = 1;
}

- (void)unlockLayout
{
  self->_layoutLocked = 0;
}

- (void)unhighlightSelectedNode
{
  self->_highlightNode = 0;
}

uint64_t __41__SCNManipulator_unhighlightSelectedNode__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "geometry"), "firstMaterial"), "emission"), "setContents:", objc_msgSend(MEMORY[0x263F1C550], "blackColor"));
  uint64_t v3 = [MEMORY[0x263F1C550] whiteColor];
  int64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "geometry"), "firstMaterial"), "multiply");

  return [v4 setContents:v3];
}

- (id)hitTest:(id *)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  node = self->_node;
  if (!node) {
    return 0;
  }
  [(SCNNode *)node opacity];
  if (v6 == 0.0) {
    return 0;
  }
  if ([(SCNNode *)self->_node isHidden]) {
    return 0;
  }
  BOOL v7 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  [v7 setObject:self->_node forKey:@"kHitTestRootNode"];
  uint64_t v8 = MEMORY[0x263EFFA80];
  [v7 setObject:MEMORY[0x263EFFA80] forKey:@"kHitTestSkipHiddenNode"];
  [v7 setObject:&unk_26BFC11F8 forKey:@"kHitTestSearchMode"];
  [v7 setObject:v8 forKey:@"kHitTestClipToZRange"];
  objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", 4), @"kHitTestLayerMask");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v9 = objc_msgSend(a3->var1, "hitTest:options:", v7, a3->var3.x, a3->var3.y, 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v10) {
    return 0;
  }
  uint64_t v11 = v10;
  char v12 = 0;
  uint64_t v13 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v22 != v13) {
        objc_enumerationMutation(v9);
      }
      int64_t v15 = (SCNNode *)[*(id *)(*((void *)&v21 + 1) + 8 * i) node];
      if (v15 == self->_occluder) {
        goto LABEL_20;
      }
      double v16 = v15;
      while ([(SCNNode *)v15 categoryBitMask] == 0xFFFF)
      {
        int64_t v15 = [(SCNNode *)v16 parentNode];
        double v16 = v15;
      }
      if ((v12 & 1) != 0 && [(SCNNode *)v16 parentNode] == self->_rotationHandles)
      {
LABEL_20:
        char v12 = 1;
      }
      else
      {
        long long v17 = v16;
        if (!v16) {
          return v16;
        }
        do
        {
          char v18 = [v17 isHidden];
          uint64_t v19 = [v17 parentNode];
          if (v18) {
            break;
          }
          long long v17 = (void *)v19;
        }
        while (v19);
        if ((v18 & 1) == 0) {
          return v16;
        }
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    double v16 = 0;
  }
  while (v11);
  return v16;
}

- (void)_updateActionWithEvent:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var4.x;
  v8[2] = a3->var3;
  v8[3] = v4;
  v8[4] = *(_OWORD *)&a3->var5.y;
  CGPoint var2 = a3->var2;
  v8[0] = *(_OWORD *)&a3->var0;
  v8[1] = var2;
  double v6 = [(SCNManipulator *)self hitTest:v8];
  highlightNode = self->_highlightNode;
  if (highlightNode != v6) {
    [(SCNManipulator *)self unhighlightSelectedNode];
  }
  if (v6)
  {
    self->_action = [(SCNNode *)v6 categoryBitMask] >> 8;
    self->_selectedAxis = [(SCNNode *)v6 categoryBitMask] >> 4;
    if (highlightNode != v6)
    {
      self->_highlightNode = v6;
      [(SCNNode *)v6 enumerateHierarchyUsingBlock:&__block_literal_global_16_0];
    }
  }
  else
  {
    self->_action = 0;
  }
}

uint64_t __41__SCNManipulator__updateActionWithEvent___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "geometry"), "firstMaterial"), "emission"), "setContents:", objc_msgSend(MEMORY[0x263F1C550], "whiteColor"));
  uint64_t v3 = [MEMORY[0x263F1C550] orangeColor];
  long long v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "geometry"), "firstMaterial"), "multiply");

  return [v4 setContents:v3];
}

- (BOOL)mouseMoved:(id *)a3
{
  int action = self->_action;
  self->_int action = 0;
  if ([(NSOrderedSet *)self->_targets count] && !self->_readonly)
  {
    if ([(SCNNode *)self->_node isHidden]) {
      return 0;
    }
    long long v7 = *(_OWORD *)&a3->var4.x;
    v9[2] = a3->var3;
    v9[3] = v7;
    v9[4] = *(_OWORD *)&a3->var5.y;
    CGPoint var2 = a3->var2;
    v9[0] = *(_OWORD *)&a3->var0;
    v9[1] = var2;
    [(SCNManipulator *)self _updateActionWithEvent:v9];
  }
  return action != self->_action;
}

- (void)updateItemsPosition
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v5 = [a1 count];
  int v6 = *a2;
  int v7 = 136315650;
  uint64_t v8 = "setToApplyTo.count <= _originalDataCount";
  __int16 v9 = 1024;
  int v10 = v5;
  __int16 v11 = 1024;
  int v12 = v6;
  _os_log_fault_impl(&dword_20B249000, a3, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. The set we are updating contains more elements than the number of positions we have in store, something it wrong (%d vs %d)", (uint8_t *)&v7, 0x18u);
}

- (void)updateItemsRotation:(SCNManipulator *)self
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  float32x4_t v51 = v2;
  uint64_t v4 = 800;
  if (!self->_cloning) {
    uint64_t v4 = 16;
  }
  int v5 = *(Class *)((char *)&self->super.isa + v4);
  int64_t v6 = [(SCNAuthoringEnvironment *)[(SCNManipulator *)self authoringEnvironment] editingSpace];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v48 != v10) {
          objc_enumerationMutation(v5);
        }
        int v12 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v13 = (void *)[v12 parentItem];
        if (v13)
        {
          memset(&v46, 0, sizeof(v46));
          [v13 worldTransform];
          memset(&v45, 0, sizeof(v45));
          SCNMatrix4 m = v46;
          SCNMatrix4Invert(&v45, &m);
          memset(&m, 0, sizeof(m));
          C3DMatrix4x4FromSCNMatrix4(&m, (uint64_t)&v45);
          memset(v43, 0, sizeof(v43));
          memset(&v42, 0, sizeof(v42));
          memset(v41, 0, sizeof(v41));
          memset(v40, 0, sizeof(v40));
          v39.i32[2] = 0;
          v39.i64[0] = 0;
          memset(v38, 0, sizeof(v38));
          if (v12) {
            [v12 worldTransform];
          }
          memset(v37, 0, sizeof(v37));
          C3DMatrix4x4FromSCNMatrix4(v37, (uint64_t)v38);
          C3DMatrix4x4GetScale(v37, &v39);
          C3DMatrix4x4MakeAffine(v43, (float32x4_t *)(*(void *)self->_anon_188 + 16 * (v9 + i)), (float32x4_t *)(*(void *)&self->_anon_188[8] + 16 * (v9 + i)), (float32x2_t *)&v39);
          memset(&v36, 0, sizeof(v36));
          if (v6) {
            int v14 = (__n128 *)&self->_worldInitialMatrix.components[13];
          }
          else {
            int v14 = (__n128 *)(*(void *)self->_anon_188 + 16 * (v9 + i));
          }
          C3DMatrix4x4MakeTranslation((uint64_t)&v36, v14);
          C3DMatrix4x4Invert(&v36, &v42);
          C3DMatrix4x4Mult((uint64_t)v43, (float32x4_t *)&v42, v43);
          C3DMatrix4x4MakeRotation(v40, &v51);
          C3DMatrix4x4Mult((uint64_t)v43, v40, v43);
          C3DMatrix4x4Mult((uint64_t)v43, (float32x4_t *)&v36, v43);
          C3DMatrix4x4Mult((uint64_t)v43, (float32x4_t *)&m, v41);
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          C3DMatrix4x4ToSCNMatrix4((uint64_t)v41, &v32);
          v31[0] = v32;
          v31[1] = v33;
          v31[2] = v34;
          v31[3] = v35;
          [v12 setTransform:v31];
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v47 objects:v53 count:16];
      v9 += i;
    }
    while (v8);
  }
  if (self->_cloning)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    targets = self->_targets;
    uint64_t v16 = [(NSOrderedSet *)targets countByEnumeratingWithState:&v27 objects:v52 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      int v18 = 0;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(targets);
          }
          long long v21 = *(void **)(*((void *)&v27 + 1) + 8 * j);
          long long v22 = (long long *)(*(void *)&self->_anon_188[16] + ((unint64_t)(v18 + j) << 6));
          long long v23 = v22[3];
          long long v25 = *v22;
          long long v24 = v22[1];
          v26[2] = v22[2];
          v26[3] = v23;
          v26[0] = v25;
          v26[1] = v24;
          [v21 setTransform:v26];
        }
        uint64_t v17 = [(NSOrderedSet *)targets countByEnumeratingWithState:&v27 objects:v52 count:16];
        v18 += j;
      }
      while (v17);
    }
  }
}

- (void)updateItemsScale:(float)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v4 = 800;
  if (!self->_cloning) {
    uint64_t v4 = 16;
  }
  int v5 = *(Class *)((char *)&self->super.isa + v4);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v42, 16, *(void *)&a3);
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v5);
        }
        __int16 v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if ([v11 parentItem])
        {
          v36.i32[2] = 0;
          v36.i64[0] = 0;
          uint64_t v12 = 16 * (v8 + i);
          float32x4_t v36 = vmulq_n_f32(*(float32x4_t *)(*(void *)&self->_anon_188[24] + v12), v24);
          long long v34 = 0u;
          memset(v35, 0, sizeof(v35));
          long long v32 = 0u;
          long long v33 = 0u;
          long long v31 = 0u;
          C3DMatrix4x4MakeAffine(v35, (float32x4_t *)(*(void *)self->_anon_188 + v12), (float32x4_t *)(*(void *)&self->_anon_188[8] + v12), (float32x2_t *)&v36);
          C3DMatrix4x4ToSCNMatrix4((uint64_t)v35, &v31);
          v30[0] = v31;
          v30[1] = v32;
          v30[2] = v33;
          v30[3] = v34;
          [v11 setWorldTransform:v30];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:v42 count:16];
      v8 += i;
    }
    while (v7);
  }
  if (self->_cloning)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    targets = self->_targets;
    uint64_t v14 = [(NSOrderedSet *)targets countByEnumeratingWithState:&v26 objects:v41 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      int v16 = 0;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(targets);
          }
          uint64_t v19 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          double v20 = (long long *)(*(void *)&self->_anon_188[16] + ((unint64_t)(v16 + j) << 6));
          long long v21 = v20[3];
          long long v23 = *v20;
          long long v22 = v20[1];
          v25[2] = v20[2];
          v25[3] = v21;
          v25[0] = v23;
          v25[1] = v22;
          [v19 setTransform:v25];
        }
        uint64_t v15 = [(NSOrderedSet *)targets countByEnumeratingWithState:&v26 objects:v41 count:16];
        v16 += j;
      }
      while (v15);
    }
  }
}

- (void)_saveOriginalData
{
  [(SCNManipulator *)self _deleteOriginalData];
  unsigned int v3 = [(NSOrderedSet *)self->_targets count];
  self->_originalDataCount = v3;
  if (v3)
  {
    *(void *)&self->_anon_188[8] = malloc_type_malloc(16 * v3, 0x1000040451B5BE8uLL);
    *(void *)self->_anon_188 = malloc_type_malloc(16 * self->_originalDataCount, 0x1000040451B5BE8uLL);
    *(void *)&self->_anon_188[24] = malloc_type_malloc(16 * self->_originalDataCount, 0x1000040451B5BE8uLL);
    *(void *)&self->_anon_188[16] = malloc_type_malloc((unint64_t)self->_originalDataCount << 6, 0x1000040FA0F61DDuLL);
    targets = self->_targets;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __35__SCNManipulator__saveOriginalData__block_invoke;
    v5[3] = &unk_2640051E0;
    v5[4] = self;
    [(NSOrderedSet *)targets enumerateObjectsUsingBlock:v5];
  }
}

double __35__SCNManipulator__saveOriginalData__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  long long v19 = 0u;
  memset(v18, 0, sizeof(v18));
  if (a2)
  {
    [a2 worldTransform];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = a1 + 32;
    uint64_t v8 = *(void *)(v7 + 408);
    [a2 transform];
  }
  else
  {
    uint64_t v6 = a1 + 32;
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 408);
    long long v16 = 0uLL;
    long long v17 = 0uLL;
    long long v14 = 0uLL;
    long long v15 = 0uLL;
  }
  long long v9 = v14;
  long long v10 = v15;
  __int16 v11 = (_OWORD *)(v8 + (a3 << 6));
  long long v12 = v17;
  v11[2] = v16;
  v11[3] = v12;
  _OWORD *v11 = v9;
  v11[1] = v10;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  C3DMatrix4x4FromSCNMatrix4(&v14, (uint64_t)v18);
  C3DMatrix4x4GetAffineTransforms((uint64_t)&v14, 0, (int8x16_t *)(*(void *)(*(void *)v6 + 400) + 16 * a3), (float32x4_t *)(*(void *)(*(void *)v6 + 416) + 16 * a3));
  double result = *(double *)&v19;
  *(_OWORD *)(*(void *)(*(void *)v6 + 392) + 16 * a3) = v19;
  return result;
}

- (void)_deleteOriginalData
{
  anon_188 = self->_anon_188;
  free(*(void **)self->_anon_188);
  free(*(void **)&self->_anon_188[8]);
  free(*(void **)&self->_anon_188[24]);
  free(*(void **)&self->_anon_188[16]);
  self->_originalDataCount = 0;
  *(_OWORD *)anon_188 = 0u;
  *((_OWORD *)anon_188 + 1) = 0u;
}

- (BOOL)_applyWithEvent:(id *)a3
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  v3.i64[0] = *(void *)&a3->var4.x;
  float32x4_t v6 = v3;
  v6.i32[2] = LODWORD(a3->var4.z);
  v3.i32[2] = v6.i32[2];
  v4.i64[0] = *(void *)&a3->var5.x;
  v4.i32[2] = LODWORD(a3->var5.z);
  float32x4_t v7 = vsubq_f32(v4, v3);
  float v8 = self->_worldMatrix.components[13];
  float v9 = self->_worldMatrix.components[14];
  float v10 = self->_worldMatrix.components[15];
  switch(self->_action)
  {
    case 1u:
      *(double *)v11.i64 = __resolveAxisMove((float32x4_t *)self, v6, v7);
      __n128 v88 = (__n128)vaddq_f32(v11, *(float32x4_t *)&self->_anon_130[32]);
      +[SCNTransaction begin];
      +[SCNTransaction setDisableActions:1];
      LOBYTE(v91) = 0;
      [(SCNAuthoringEnvironment *)[(SCNManipulator *)self authoringEnvironment] gridUnit];
      long double v13 = v12;
      memset(&v96, 255, 24);
      BOOL v14 = [(SCNAuthoringEnvironment *)[(SCNManipulator *)self authoringEnvironment] shouldSnapToAlign];
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      if (v14)
      {
        *(float *)&double v15 = v8;
        *(float *)&double v16 = v9;
        *(float *)&double v17 = v10;
        -[SCNManipulator _snapPositionToAlign:original:unit:axisMove:rayStart:rayDir:didSnap:snapIndexes:](self, "_snapPositionToAlign:original:unit:axisMove:rayStart:rayDir:didSnap:snapIndexes:", 1, &v91, &v96, v88.n128_f64[0], v15, v16, v17, (double)v13, *(double *)self->_anon_130, *(double *)&self->_anon_130[16]);
      }
      if (![(SCNAuthoringEnvironment *)[(SCNManipulator *)self authoringEnvironment] shouldSnapOnGrid])goto LABEL_36; {
      if (v13 == 0.0)
      }
        goto LABEL_36;
      v90[0].i8[0] = 0;
      _snapPositionToGrid(1, v90, v88, v8, v9, v10, v13, *(float32x4_t *)self->_anon_130, *(float32x4_t *)&self->_anon_130[16]);
      if (!v90[0].i8[0]) {
        goto LABEL_36;
      }
      if ((_BYTE)v91)
      {
        float32x4_t v21 = vsubq_f32(v20, (float32x4_t)v88);
        float32x4_t v22 = vmulq_f32(v21, v21);
        float32x4_t v23 = vsubq_f32(v87, (float32x4_t)v88);
        float32x4_t v24 = vmulq_f32(v23, v23);
        if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1))).f32[0]) >= sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v24, 2), vaddq_f32(v24, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v24.f32, 1))).f32[0]))
        {
LABEL_36:
          if (!(_BYTE)v91) {
            goto LABEL_72;
          }
          int64_t v67 = v96.columns[0].i64[0];
          if (v96.columns[0].i64[0] != -1 && v96.columns[0].i64[0] < self->_snapToAlignCount)
          {
            float var0 = self->_snapToAlignOnX[v96.columns[0].i64[0]].var0;
            uint64_t v69 = v96.columns[0].i64[0];
            do
            {
              if (vabds_f32(self->_snapToAlignOnX[v69].var0, var0) >= 0.00001) {
                break;
              }
              [(NSMutableIndexSet *)self->_snapXIndexes addIndex:v67++];
              ++v69;
            }
            while (v67 < self->_snapToAlignCount);
          }
          int64_t v70 = v96.columns[0].i64[1];
          if (v96.columns[0].i64[1] != -1 && v96.columns[0].i64[1] < self->_snapToAlignCount)
          {
            float v71 = self->_snapToAlignOnY[v96.columns[0].i64[1]].var0;
            uint64_t v72 = v96.columns[0].i64[1];
            do
            {
              if (vabds_f32(self->_snapToAlignOnY[v72].var0, v71) >= 0.00001) {
                break;
              }
              [(NSMutableIndexSet *)self->_snapYIndexes addIndex:v70++];
              ++v72;
            }
            while (v70 < self->_snapToAlignCount);
          }
          int64_t v73 = v96.columns[1].i64[0];
          if (v96.columns[1].i64[0] != -1 && v96.columns[1].i64[0] < self->_snapToAlignCount)
          {
            float v74 = self->_snapToAlignOnZ[v96.columns[1].i64[0]].var0;
            uint64_t v75 = v96.columns[1].i64[0];
            do
            {
              if (vabds_f32(self->_snapToAlignOnZ[v75].var0, v74) >= 0.00001) {
                break;
              }
              [(NSMutableIndexSet *)self->_snapZIndexes addIndex:v73++];
              ++v75;
            }
            while (v73 < self->_snapToAlignCount);
          }
          goto LABEL_71;
        }
        memset(&v96, 255, 24);
      }
      else
      {
        LOBYTE(v91) = 1;
      }
      float32x4_t v87 = v20;
      goto LABEL_36;
    case 2u:
      float32x4_t v27 = *(float32x4_t *)&self->_anon_130[16];
      float32x4_t v28 = vmulq_f32(v7, v27);
      float32x4_t v29 = vmulq_f32(v27, vsubq_f32(*(float32x4_t *)&self->_anon_130[32], v6));
      __n128 v88 = (__n128)vaddq_f32(*(float32x4_t *)&self->_anon_130[48], vmlaq_n_f32(v6, v7, vdivq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v29, 2), vaddq_f32(v29, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v29.f32, 1))), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v28, 2), vaddq_f32(v28, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.f32, 1)))).f32[0]));
      +[SCNTransaction begin];
      +[SCNTransaction setDisableActions:1];
      LOBYTE(v91) = 0;
      [(SCNAuthoringEnvironment *)[(SCNManipulator *)self authoringEnvironment] gridUnit];
      long double v31 = v30;
      memset(&v96, 255, 24);
      BOOL v32 = [(SCNAuthoringEnvironment *)[(SCNManipulator *)self authoringEnvironment] shouldSnapToAlign];
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      if (v32)
      {
        *(float *)&double v33 = v8;
        *(float *)&double v34 = v9;
        *(float *)&double v35 = v10;
        -[SCNManipulator _snapPositionToAlign:original:unit:axisMove:rayStart:rayDir:didSnap:snapIndexes:](self, "_snapPositionToAlign:original:unit:axisMove:rayStart:rayDir:didSnap:snapIndexes:", 0, &v91, &v96, v88.n128_f64[0], v33, v34, v35, (double)v31, 0.0, 0.0);
      }
      if (![(SCNAuthoringEnvironment *)[(SCNManipulator *)self authoringEnvironment] shouldSnapOnGrid])goto LABEL_55; {
      if (v31 == 0.0)
      }
        goto LABEL_55;
      v90[0].i8[0] = 0;
      _snapPositionToGrid(0, v90, v88, v8, v9, v10, v31, *(float32x4_t *)&self->_anon_130[32], *(float32x4_t *)&self->_anon_130[16]);
      if (!v90[0].i8[0]) {
        goto LABEL_55;
      }
      if ((_BYTE)v91)
      {
        float32x4_t v39 = vsubq_f32(v38, (float32x4_t)v88);
        float32x4_t v40 = vmulq_f32(v39, v39);
        float32x4_t v41 = vsubq_f32(v87, (float32x4_t)v88);
        float32x4_t v42 = vmulq_f32(v41, v41);
        if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v40, 2), vaddq_f32(v40, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v40.f32, 1))).f32[0]) >= sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v42, 2), vaddq_f32(v42, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v42.f32, 1))).f32[0]))goto LABEL_55; {
        memset(&v96, 255, 24);
        }
      }
      else
      {
        LOBYTE(v91) = 1;
      }
      float32x4_t v87 = v38;
LABEL_55:
      if ((_BYTE)v91)
      {
        int64_t v76 = v96.columns[0].i64[0];
        if (v96.columns[0].i64[0] != -1 && v96.columns[0].i64[0] < self->_snapToAlignCount)
        {
          float v77 = self->_snapToAlignOnX[v96.columns[0].i64[0]].var0;
          uint64_t v78 = v96.columns[0].i64[0];
          do
          {
            if (vabds_f32(self->_snapToAlignOnX[v78].var0, v77) >= 0.00001) {
              break;
            }
            [(NSMutableIndexSet *)self->_snapXIndexes addIndex:v76++];
            ++v78;
          }
          while (v76 < self->_snapToAlignCount);
        }
        int64_t v79 = v96.columns[0].i64[1];
        if (v96.columns[0].i64[1] != -1 && v96.columns[0].i64[1] < self->_snapToAlignCount)
        {
          float v80 = self->_snapToAlignOnY[v96.columns[0].i64[1]].var0;
          uint64_t v81 = v96.columns[0].i64[1];
          do
          {
            if (vabds_f32(self->_snapToAlignOnY[v81].var0, v80) >= 0.00001) {
              break;
            }
            [(NSMutableIndexSet *)self->_snapYIndexes addIndex:v79++];
            ++v81;
          }
          while (v79 < self->_snapToAlignCount);
        }
        int64_t v82 = v96.columns[1].i64[0];
        if (v96.columns[1].i64[0] != -1 && v96.columns[1].i64[0] < self->_snapToAlignCount)
        {
          float v83 = self->_snapToAlignOnZ[v96.columns[1].i64[0]].var0;
          uint64_t v84 = v96.columns[1].i64[0];
          do
          {
            if (vabds_f32(self->_snapToAlignOnZ[v84].var0, v83) >= 0.00001) {
              break;
            }
            [(NSMutableIndexSet *)self->_snapZIndexes addIndex:v82++];
            ++v84;
          }
          while (v82 < self->_snapToAlignCount);
        }
LABEL_71:
        __n128 v88 = (__n128)v87;
      }
LABEL_72:
      __n128 v85 = v88;
      v85.n128_u32[3] = *((_DWORD *)&self->_worldMatrix + 16);
      *(__n128 *)&self->_worldMatrix.components[13] = v85;
      [(SCNManipulator *)self updateItemsPosition];
      +[SCNTransaction commit];
      return 1;
    case 3u:
      float v43 = a3->var2.y - self->_originalMouseLocation.y;
      float v44 = (float)(*(float *)self->_anon_130 * v43) * 0.01;
      float32x4_t v95 = 0uLL;
      unsigned int selectedAxis = self->_selectedAxis;
      float v89 = v44;
      if (self->_selectedAxis)
      {
        __asm { FMOV            V1.2S, #1.0 }
        *(int8x8_t *)v6.f32 = vand_s8(_D1, (int8x8_t)vceq_s32(vdup_n_s32(selectedAxis), (int32x2_t)0x200000001));
        float v51 = 0.0;
        if (selectedAxis == 3) {
          float v51 = 1.0;
        }
        v6.f32[2] = v51;
        simd_float4 v52 = *(simd_float4 *)&self->_worldInitialMatrix.components[5];
        v96.columns[0] = *(simd_float4 *)&self->_worldInitialMatrix.components[1];
        v96.columns[1] = v52;
        simd_float4 v53 = *(simd_float4 *)&self->_worldInitialMatrix.components[13];
        v96.columns[2] = *(simd_float4 *)&self->_worldInitialMatrix.components[9];
        v96.columns[3] = v53;
        *(float32x2_t *)v54.f32 = C3DVector3RotateAndScale((float32x2_t *)&v96, v6);
        int32x4_t v55 = (int32x4_t)vmulq_f32(v54, v54);
        v55.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v55, 2), vadd_f32(*(float32x2_t *)v55.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v55.i8, 1))).u32[0];
        float32x2_t v56 = vrsqrte_f32((float32x2_t)v55.u32[0]);
        float32x2_t v57 = vmul_f32(v56, vrsqrts_f32((float32x2_t)v55.u32[0], vmul_f32(v56, v56)));
        float32x4_t v58 = vmulq_n_f32(v54, vmul_f32(v57, vrsqrts_f32((float32x2_t)v55.u32[0], vmul_f32(v57, v57))).f32[0]);
      }
      else
      {
        memset(&v96, 0, sizeof(v96));
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        v66 = [(SCNManipulator *)self authoringEnvironment];
        if (v66)
        {
          [(SCNAuthoringEnvironment *)v66 viewMatrix];
        }
        else
        {
          long long v93 = 0u;
          long long v94 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
        }
        C3DMatrix4x4FromSCNMatrix4(&v96, (uint64_t)&v91);
        C3DMatrix4x4Invert(&v96, &v96);
        v90[0] = (float32x4_t)v96.columns[0];
        v90[1] = (float32x4_t)v96.columns[1];
        v90[2] = (float32x4_t)v96.columns[2];
        v90[3] = (float32x4_t)v96.columns[3];
        *(double *)v58.i64 = C3DVector3Rotate((float32x2_t *)v90, (float32x4_t)xmmword_20B5CB810);
      }
      v58.f32[3] = v89;
      v90[0] = v58;
      C3DQuaternionMakeAxisAngle(&v95, v90);
      memset(&v96, 0, sizeof(v96));
      C3DMatrix4x4MakeRotation(&v96, &v95);
      +[SCNTransaction begin];
      BOOL v26 = 1;
      +[SCNTransaction setDisableActions:1];
      [(SCNManipulator *)self updateItemsRotation:*(double *)v95.i64];
      goto LABEL_33;
    case 4u:
      float v59 = a3->var2.y - self->_originalMouseLocation.y;
      BOOL v60 = v59 <= 0.0;
      double v61 = v59;
      double v62 = 1.0 / ((100.0 - v61) / 100.0);
      double v63 = (v61 + 100.0) / 100.0;
      if (v60) {
        double v63 = v62;
      }
      float v64 = v63;
      +[SCNTransaction begin];
      BOOL v26 = 1;
      +[SCNTransaction setDisableActions:1];
      *(float *)&double v65 = v64;
      [(SCNManipulator *)self updateItemsScale:v65];
LABEL_33:
      +[SCNTransaction commit];
      return v26;
    default:
      long long v25 = scn_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[SCNManipulator _applyWithEvent:](v25);
      }
      return 0;
  }
}

- (void)clearSnapIndexes
{
  free(self->_snapToAlignOnX);
  free(self->_snapToAlignOnY);
  free(self->_snapToAlignOnZ);
  *(_OWORD *)&self->_snapToAlignCount = 0u;
  *(_OWORD *)&self->_snapToAlignOnY = 0u;
  [(NSMutableIndexSet *)self->_snapXIndexes removeAllIndexes];
  [(NSMutableIndexSet *)self->_snapYIndexes removeAllIndexes];
  snapZIndexes = self->_snapZIndexes;

  [(NSMutableIndexSet *)snapZIndexes removeAllIndexes];
}

- (BOOL)mouseDragged:(id *)a3
{
  if (!self->_action) {
    return 0;
  }
  long long v5 = *(_OWORD *)&a3->var4.x;
  CGPoint var3 = a3->var3;
  long long v13 = v5;
  long long v14 = *(_OWORD *)&a3->var5.y;
  CGPoint var2 = a3->var2;
  long long v10 = *(_OWORD *)&a3->var0;
  CGPoint v11 = var2;
  [(SCNManipulator *)self _updateCloneStateWithEvent:&v10];
  long long v7 = *(_OWORD *)&a3->var4.x;
  CGPoint var3 = a3->var3;
  long long v13 = v7;
  long long v14 = *(_OWORD *)&a3->var5.y;
  CGPoint v8 = a3->var2;
  long long v10 = *(_OWORD *)&a3->var0;
  CGPoint v11 = v8;
  return [(SCNManipulator *)self _applyWithEvent:&v10];
}

- (BOOL)mouseDown:(id *)a3
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  if ([(SCNManipulator *)self readonly]) {
    return 0;
  }
  long long v5 = *(_OWORD *)&a3->var4.x;
  CGPoint var3 = a3->var3;
  long long v77 = v5;
  long long v78 = *(_OWORD *)&a3->var5.y;
  CGPoint var2 = a3->var2;
  float32x4_t v74 = *(float32x4_t *)&a3->var0;
  CGPoint v75 = var2;
  [(SCNManipulator *)self _updateActionWithEvent:&v74];
  if (!self->_action) {
    return 0;
  }
  BOOL v7 = 1;
  self->_isMouseDown = 1;
  [(SCNManipulator *)self _saveOriginalData];
  __computeAnchorMatrix(self, &v74);
  CGPoint v9 = v75;
  *(float32x4_t *)&self->_worldMatrix.components[1] = v74;
  *(CGPoint *)&self->_worldMatrix.components[5] = v9;
  long long v10 = v77;
  *(CGPoint *)&self->_worldMatrix.components[9] = var3;
  *(_OWORD *)&self->_worldMatrix.components[13] = v10;
  long long v11 = *(_OWORD *)&self->_worldMatrix.components[5];
  *(_OWORD *)&self->_worldInitialMatrix.components[1] = *(_OWORD *)&self->_worldMatrix.components[1];
  *(_OWORD *)&self->_worldInitialMatrix.components[5] = v11;
  long long v12 = *(_OWORD *)&self->_worldMatrix.components[13];
  *(_OWORD *)&self->_worldInitialMatrix.components[9] = *(_OWORD *)&self->_worldMatrix.components[9];
  *(_OWORD *)&self->_worldInitialMatrix.components[13] = v12;
  float32x4_t v13 = (float32x4_t)a3->var2;
  self->_originalMouseLocation = (CGPoint)v13;
  long long v14 = (float32x4_t *)&self->_worldMatrix.components[1];
  switch(self->_action)
  {
    case 1u:
      unsigned int selectedAxis = self->_selectedAxis;
      __asm { FMOV            V1.2S, #1.0 }
      *(int8x8_t *)v13.f32 = vand_s8((int8x8_t)vceq_s32(vdup_n_s32(selectedAxis), (int32x2_t)0x200000001), _D1);
      float v21 = 0.0;
      if (selectedAxis == 3) {
        float v21 = 1.0;
      }
      v13.f32[2] = v21;
      float32x4_t v66 = vmulq_f32(v13, (float32x4_t)vdupq_n_s32(0x42C80000u));
      CGPoint v22 = *(CGPoint *)&self->_worldMatrix.components[5];
      float32x4_t v74 = *v14;
      CGPoint v75 = v22;
      long long v23 = *(_OWORD *)&self->_worldMatrix.components[13];
      float32x4_t v24 = *v14;
      CGPoint v25 = *(CGPoint *)&self->_worldMatrix.components[5];
      CGPoint var3 = *(CGPoint *)&self->_worldMatrix.components[9];
      long long v77 = v23;
      float32x4_t v70 = v24;
      CGPoint v71 = v25;
      long long v26 = *(_OWORD *)&self->_worldMatrix.components[13];
      CGPoint v72 = *(CGPoint *)&self->_worldMatrix.components[9];
      long long v73 = v26;
      *(double *)v27.i64 = C3DVector3MultMatrix4x4(&v70, (float32x4_t)0);
      float32x4_t v68 = v27;
      float32x4_t v70 = v74;
      CGPoint v71 = v75;
      CGPoint v72 = var3;
      long long v73 = v77;
      *(double *)v28.i64 = C3DVector3MultMatrix4x4(&v70, v66);
      float32x4_t v29 = vsubq_f32(v28, v68);
      float32x4_t v30 = vmulq_f32(v29, v29);
      v30.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32((int32x4_t)v30, 2), vadd_f32(*(float32x2_t *)v30.f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v30.f32, 1))).u32[0];
      float32x2_t v31 = vrsqrte_f32((float32x2_t)v30.u32[0]);
      float32x2_t v32 = vmul_f32(v31, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(v31, v31)));
      float32x4_t v33 = vmulq_n_f32(v29, vmul_f32(v32, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(v32, v32))).f32[0]);
      *(float32x4_t *)self->_anon_130 = v68;
      *(float32x4_t *)&self->_anon_130[16] = v33;
      v33.i64[0] = *(void *)&a3->var4.x;
      float32x4_t v34 = v33;
      v34.i32[2] = LODWORD(a3->var4.z);
      v33.i32[2] = v34.i32[2];
      v30.i64[0] = *(void *)&a3->var5.x;
      v30.i32[2] = LODWORD(a3->var5.z);
      *(double *)v35.i64 = __resolveAxisMove((float32x4_t *)self, v33, vsubq_f32(v30, v34));
      *(float32x4_t *)&self->_anon_130[32] = vsubq_f32(v68, v35);
      break;
    case 2u:
      unsigned int v36 = self->_selectedAxis;
      __asm { FMOV            V1.2S, #1.0 }
      *(int8x8_t *)v8.f32 = vand_s8((int8x8_t)vceq_s32(vdup_n_s32(v36), (int32x2_t)0x200000001), _D1);
      float v38 = 0.0;
      if (v36 == 3) {
        float v38 = 1.0;
      }
      v8.f32[2] = v38;
      float32x4_t v69 = v8;
      CGPoint v39 = *(CGPoint *)&self->_worldMatrix.components[5];
      float32x4_t v74 = *v14;
      CGPoint v75 = v39;
      long long v40 = *(_OWORD *)&self->_worldMatrix.components[13];
      float32x4_t v42 = *v14;
      CGPoint v41 = *(CGPoint *)&self->_worldMatrix.components[5];
      CGPoint var3 = *(CGPoint *)&self->_worldMatrix.components[9];
      long long v77 = v40;
      float32x4_t v70 = v42;
      CGPoint v71 = v41;
      long long v43 = *(_OWORD *)&self->_worldMatrix.components[13];
      CGPoint v72 = *(CGPoint *)&self->_worldMatrix.components[9];
      long long v73 = v43;
      *(double *)v44.i64 = C3DVector3MultMatrix4x4(&v70, (float32x4_t)0);
      float32x4_t v67 = v44;
      float32x4_t v70 = v74;
      CGPoint v71 = v75;
      CGPoint v72 = var3;
      long long v73 = v77;
      *(double *)v45.i64 = C3DVector3MultMatrix4x4(&v70, v69);
      v46.i32[3] = v67.i32[3];
      float32x4_t v47 = vsubq_f32(v45, v67);
      *(float32x4_t *)&self->_anon_130[16] = v47;
      *(float32x4_t *)&self->_anon_130[32] = v67;
      *(float32x4_t *)self->_anon_130 = v67;
      v46.i64[0] = *(void *)&a3->var4.x;
      v46.i32[2] = LODWORD(a3->var4.z);
      v48.i64[0] = *(void *)&a3->var5.x;
      v48.i32[2] = LODWORD(a3->var5.z);
      float32x4_t v49 = vsubq_f32(v48, v46);
      float32x4_t v50 = vmulq_f32(v47, v49);
      float32x4_t v51 = vmulq_f32(v47, vsubq_f32(v67, v46));
      *(float32x4_t *)&self->_anon_130[48] = vsubq_f32(v67, vmlaq_n_f32(v46, v49, vdivq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v51, 2), vaddq_f32(v51, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v51.f32, 1))), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v50, 2), vaddq_f32(v50, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v50.f32, 1)))).f32[0]));
      break;
    case 3u:
      CGPoint v52 = *(CGPoint *)&self->_worldMatrix.components[5];
      float32x4_t v74 = *v14;
      CGPoint v75 = v52;
      float32x4_t v55 = *(float32x4_t *)&self->_worldMatrix.components[9];
      _Q1 = *(_OWORD *)&self->_worldMatrix.components[13];
      unsigned int v54 = self->_selectedAxis;
      CGPoint var3 = (CGPoint)v55;
      long long v77 = _Q1;
      __asm { FMOV            V1.2S, #1.0 }
      *(int8x8_t *)v55.f32 = vand_s8(*(int8x8_t *)&_Q1, (int8x8_t)vceq_s32(vdup_n_s32(v54), (int32x2_t)0x200000001));
      float v56 = 0.0;
      if (v54 == 3) {
        float v56 = 1.0;
      }
      v55.f32[2] = v56;
      *(float32x2_t *)v57.f32 = C3DVector3RotateAndScale((float32x2_t *)&v74, v55);
      float32x4_t v58 = vmulq_f32(v57, v57);
      float32x4_t v59 = (float32x4_t)vdupq_laneq_s32((int32x4_t)v58, 2);
      v58.i32[0] = vadd_f32(*(float32x2_t *)v59.f32, vadd_f32(*(float32x2_t *)v58.f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v58.f32, 1))).u32[0];
      *(float32x2_t *)v59.f32 = vrsqrte_f32((float32x2_t)v58.u32[0]);
      *(float32x2_t *)v59.f32 = vmul_f32(*(float32x2_t *)v59.f32, vrsqrts_f32((float32x2_t)v58.u32[0], vmul_f32(*(float32x2_t *)v59.f32, *(float32x2_t *)v59.f32)));
      v58.i32[0] = vmul_f32(*(float32x2_t *)v59.f32, vrsqrts_f32((float32x2_t)v58.u32[0], vmul_f32(*(float32x2_t *)v59.f32, *(float32x2_t *)v59.f32))).u32[0];
      v59.i64[0] = *(void *)&a3->var5.x;
      v59.i32[2] = LODWORD(a3->var5.z);
      float32x4_t v60 = vmulq_n_f32(v57, v58.f32[0]);
      v58.i64[0] = *(void *)&a3->var4.x;
      v58.i32[2] = LODWORD(a3->var4.z);
      float32x4_t v61 = vmulq_f32(v60, vsubq_f32(v59, v58));
      BOOL v62 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v61, 2), vaddq_f32(v61, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v61.f32, 1))).f32[0] <= 0.0;
      float v63 = -1.0;
      if (v62) {
        float v63 = 1.0;
      }
      *(float *)self->_anon_130 = v63;
      break;
    case 4u:
      return v7;
    default:
      float v64 = scn_default_log();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
        -[SCNManipulator _applyWithEvent:](v64);
      }
      return 0;
  }
  return v7;
}

- (BOOL)mouseUp:(id *)a3
{
  if ([(SCNManipulator *)self readonly]) {
    return 0;
  }
  [(SCNManipulator *)self clearSnapIndexes];
  BOOL v5 = self->_action != 0;
  if (self->_action)
  {
    long long v6 = *(_OWORD *)&a3->var4.x;
    CGPoint var3 = a3->var3;
    long long v19 = v6;
    long long v20 = *(_OWORD *)&a3->var5.y;
    CGPoint var2 = a3->var2;
    long long v16 = *(_OWORD *)&a3->var0;
    CGPoint v17 = var2;
    [(SCNManipulator *)self _updateCloneStateWithEvent:&v16];
    long long v8 = *(_OWORD *)&a3->var4.x;
    CGPoint var3 = a3->var3;
    long long v19 = v8;
    long long v20 = *(_OWORD *)&a3->var5.y;
    CGPoint v9 = a3->var2;
    long long v16 = *(_OWORD *)&a3->var0;
    CGPoint v17 = v9;
    [(SCNManipulator *)self _applyWithEvent:&v16];
    if (self->_cloning)
    {
      [(SCNManipulator *)self validateClones];
    }
    else
    {
      float32x4_t v13 = [(SCNAuthoringEnvironment *)self->_authoringEnvironment delegate];
      if (v13)
      {
        long long v14 = v13;
        if (objc_opt_respondsToSelector()) {
          [(SCNAuthoringEnvironmentDelegate *)v14 authoringEnvironment:self->_authoringEnvironment didMoveItems:[(NSOrderedSet *)self->_targets array] fromTransform:*(void *)&self->_anon_188[16]];
        }
      }
    }
  }

  self->_cloneSet = 0;
  self->_cloning = 0;
  self->_int action = 0;
  *(_OWORD *)self->_anon_130 = 0u;
  *(_OWORD *)&self->_anon_130[16] = 0u;
  *(_OWORD *)&self->_anon_130[32] = 0u;
  *(_OWORD *)&self->_anon_130[48] = 0u;
  self->_isMouseDown = 0;
  long long v10 = *(_OWORD *)&a3->var4.x;
  v15[2] = a3->var3;
  v15[3] = v10;
  v15[4] = *(_OWORD *)&a3->var5.y;
  CGPoint v11 = a3->var2;
  v15[0] = *(_OWORD *)&a3->var0;
  v15[1] = v11;
  [(SCNManipulator *)self mouseMoved:v15];
  return v5;
}

- (id)scene
{
  float32x4_t v2 = [(SCNAuthoringEnvironment *)[(SCNManipulator *)self authoringEnvironment] sceneRenderer];

  return (id)[(SCNSceneRenderer *)v2 scene];
}

- (void)removeClonesFromScene
{
  [(NSOrderedSet *)self->_cloneSet firstObject];
  float32x4_t v3 = objc_opt_class();
  float32x4_t v4 = [(NSOrderedSet *)self->_cloneSet array];

  [v3 removeItemsFromScene:v4];
}

- (void)addClonesToScene
{
  id v3 = [(SCNManipulator *)self scene];
  [(NSOrderedSet *)self->_cloneSet firstObject];
  float32x4_t v4 = objc_opt_class();
  BOOL v5 = [(NSOrderedSet *)self->_cloneSet array];

  [v4 addItems:v5 toScene:v3];
}

- (void)validateClones
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(SCNAuthoringEnvironment *)self->_authoringEnvironment delegate];
  if (v3)
  {
    float32x4_t v4 = v3;
    if (objc_opt_respondsToSelector())
    {
      BOOL v5 = [(SCNManipulator *)self authoringEnvironment];
      objc_sync_enter(v5);
      [(NSOrderedSet *)self->_cloneSet firstObject];
      objc_msgSend((id)objc_opt_class(), "removeItemsFromScene:", -[NSOrderedSet array](self->_cloneSet, "array"));
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      cloneSet = self->_cloneSet;
      uint64_t v7 = [(NSOrderedSet *)cloneSet countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v11;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(cloneSet);
            }
            [*(id *)(*((void *)&v10 + 1) + 8 * i) validateClone];
          }
          uint64_t v7 = [(NSOrderedSet *)cloneSet countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
      objc_sync_exit(v5);
      [(SCNAuthoringEnvironmentDelegate *)v4 authoringEnvironment:self->_authoringEnvironment didCloneSelection:[(NSOrderedSet *)self->_cloneSet array]];
    }
  }
}

- (id)setupClones
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = (void *)[MEMORY[0x263EFF9B0] orderedSet];
  id v4 = [(SCNManipulator *)self scene];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  targets = self->_targets;
  uint64_t v6 = [(NSOrderedSet *)targets countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(targets);
        }
        uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) cloneForManipulators];
        if (v10)
        {
          uint64_t v11 = v10;
          long long v12 = objc_opt_class();
          uint64_t v18 = v11;
          objc_msgSend(v12, "addItems:toScene:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v18, 1), v4);
          [v3 addObject:v11];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSOrderedSet *)targets countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }
  return v3;
}

- (id)snapGuideIndexesOnAxis:(unint64_t)a3
{
  uint64_t v3 = 608;
  if (a3 == 2) {
    uint64_t v3 = 600;
  }
  if (a3 == 1) {
    uint64_t v3 = 592;
  }
  return *(Class *)((char *)&self->super.isa + v3);
}

- (const)snapInfoAtIndex:(unint64_t)a3 axis:(unint64_t)a4
{
  uint64_t v4 = 584;
  if (a4 == 2) {
    uint64_t v4 = 576;
  }
  if (a4 == 1) {
    uint64_t v4 = 568;
  }
  return (const $650CE108227E718D0103F828694BDA85 *)(*(char **)((char *)&self->super.isa + v4) + 24 * a3);
}

- (void)_prepareSnapToAlignData:(SCNManipulator *)self minOffset:(SEL)a2 maxOffset:(unsigned __int16)a3
{
  long long v34 = v3;
  long long v35 = v4;
  if ((a3 - 1) >= 3)
  {
    NSLog(&cfstr_Preparesnaptoa.isa, a2);
  }
  else
  {
    int v5 = a3;
    uint64_t v7 = 8 * (unsigned __int16)(a3 - 1) + 568;
    free(*(void **)((char *)&self->super.isa + v7));
    *(Class *)((char *)&self->super.isa + v7) = 0;
    if ([(NSOrderedSet *)self->_targets count])
    {
      uint64_t v8 = objc_msgSend((id)objc_msgSend(-[SCNManipulator scene](self, "scene"), "rootNode"), "childNodesPassingTest:", &__block_literal_global_28);
      unsigned int v9 = [v8 count];
      uint64_t v10 = v9;
      if (v9)
      {
        uint64_t v11 = 0;
        unsigned int v12 = 0;
        *(Class *)((char *)&self->super.isa + v7) = (Class)malloc_type_calloc(0x18uLL, 5 * v9, 0x1F81AE88uLL);
        float v13 = *((float *)&v34 + 2);
        float v14 = *((float *)&v35 + 2);
        float v15 = *((float *)&v34 + 1);
        float v16 = *((float *)&v35 + 1);
        while (1)
        {
          long long v17 = objc_msgSend(v8, "objectAtIndex:", v11, v34, v35);
          if ((_itemsContainsNode(self->_targets, v17) & 1) == 0) {
            break;
          }
LABEL_19:
          if (v10 == ++v11)
          {
            self->_snapToAlignCount = v12;
            qsort(*(void **)((char *)&self->super.isa + v7), v12, 0x18uLL, (int (__cdecl *)(const void *, const void *))_sortSnapData);
            return;
          }
        }
        uint64_t v18 = (float32x4_t *)[v17 nodeRef];
        long long v40 = 0u;
        float32x4_t v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        if (v17) {
          [v17 worldTransform];
        }
        float32x4_t v36 = 0u;
        int32x4_t v37 = 0u;
        if (C3DNodeGetLocalBoundingBox((uint64_t)v18, &v36))
        {
          WorldMatrix = C3DNodeGetWorldMatrix(v18);
          float32x4_t v20 = WorldMatrix[1];
          float32x4_t v21 = WorldMatrix[2];
          float32x4_t v22 = vaddq_f32(WorldMatrix[3], vmlaq_laneq_f32(vmlaq_n_f32(vmulq_lane_f32(v20, *(float32x2_t *)v36.f32, 1), *WorldMatrix, v36.f32[0]), v21, v36, 2));
          v22.i32[3] = 1.0;
          float32x4_t v23 = (float32x4_t)v37;
          v23.i32[1] = v37.i32[0];
          v23.i32[2] = v37.i32[0];
          float32x4_t v24 = vaddq_f32(vaddq_f32(vabsq_f32(vmulq_f32(*WorldMatrix, v23)), vabsq_f32(vmulq_f32((float32x4_t)vuzp2q_s32(vdupq_lane_s32(*(int32x2_t *)v37.i8, 1), v37), v20))), vabsq_f32(vmulq_f32((float32x4_t)vzip2q_s32(vtrn1q_s32(v37, v37), v37), v21)));
        }
        else
        {
          float32x4_t v22 = v41;
          v22.i32[3] = 1.0;
          float32x4_t v24 = 0uLL;
        }
        float32x4_t v36 = v22;
        int32x4_t v37 = (int32x4_t)v24;
        uint64_t v25 = 3 * v12;
        (*(void **)((char *)&self->super.isa + v7))[v25 + 1] = v18;
        unsigned int v26 = v12 + 1;
        (*(void **)((char *)&self->super.isa + v7))[3 * v12 + 4] = v18;
        unsigned int v27 = v12 + 2;
        (*(void **)((char *)&self->super.isa + v7))[3 * v12 + 7] = v18;
        unsigned int v28 = v12 + 3;
        (*(void **)((char *)&self->super.isa + v7))[3 * v12 + 10] = v18;
        (*(void **)((char *)&self->super.isa + v7))[3 * v12 + 13] = v18;
        uint64_t v29 = *(uint64_t *)((char *)&self->super.isa + v7);
        *(_DWORD *)(v29 + 8 * v25 + 16) = 0;
        switch(v5)
        {
          case 3:
            *(_DWORD *)(v29 + 24 * v12) = v41.i32[2];
            *(float *)(v29 + 24 * v26) = v13 + (float)(v36.f32[2] + *(float *)&v37.i32[2]);
            *(float *)(v29 + 24 * v27) = v14 + (float)(v36.f32[2] + *(float *)&v37.i32[2]);
            *(float *)(v29 + 24 * v28) = v13 + (float)(v36.f32[2] - *(float *)&v37.i32[2]);
            float v30 = v14 + (float)(v36.f32[2] - *(float *)&v37.i32[2]);
            float v31 = v13;
            float v32 = v14;
            break;
          case 2:
            *(_DWORD *)(v29 + 24 * v12) = v41.i32[1];
            *(float *)(v29 + 24 * v26) = v15 + (float)(v36.f32[1] + *(float *)&v37.i32[1]);
            *(float *)(v29 + 24 * v27) = v16 + (float)(v36.f32[1] + *(float *)&v37.i32[1]);
            *(float *)(v29 + 24 * v28) = v15 + (float)(v36.f32[1] - *(float *)&v37.i32[1]);
            float v30 = v16 + (float)(v36.f32[1] - *(float *)&v37.i32[1]);
            float v31 = v15;
            float v32 = v16;
            break;
          case 1:
            *(_DWORD *)(v29 + 24 * v12) = v41.i32[0];
            *(float *)(v29 + 24 * v26) = (float)(v36.f32[0] + *(float *)v37.i32) + *(float *)&v34;
            *(float *)(v29 + 24 * v27) = (float)(v36.f32[0] + *(float *)v37.i32) + *(float *)&v35;
            *(float *)(v29 + 24 * v28) = (float)(v36.f32[0] - *(float *)v37.i32) + *(float *)&v34;
            float v30 = (float)(v36.f32[0] - *(float *)v37.i32) + *(float *)&v35;
            float v31 = *(float *)&v34;
            float v32 = *(float *)&v35;
            break;
          default:
LABEL_18:
            v12 += 5;
            goto LABEL_19;
        }
        float32x4_t v33 = (float *)(v29 + 24 * (v12 + 4));
        float *v33 = v30;
        *(float *)(v29 + 24 * v26 + 16) = v31;
        *(float *)(v29 + 24 * v27 + 16) = v32;
        *(float *)(v29 + 24 * v28 + 16) = v31;
        v33[4] = v32;
        goto LABEL_18;
      }
    }
  }
}

BOOL __62__SCNManipulator__prepareSnapToAlignData_minOffset_maxOffset___block_invoke(uint64_t a1, void *a2)
{
  return [a2 geometry] != 0;
}

- (void)prepareSnapToAlignData
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  float32x2_t v35 = 0;
  long long v3 = [(SCNManipulator *)self targets];
  uint64_t v4 = [(NSOrderedSet *)v3 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v50;
    *(void *)&long long v8 = 0x80000000800000;
    *((void *)&v8 + 1) = 0x80000000800000;
    long long v37 = v8;
    int32x4_t v39 = vdupq_n_s32(0x7F7FFFFFu);
    do
    {
      uint64_t v9 = 0;
      int32x4_t v10 = v39;
      do
      {
        int32x4_t v40 = v10;
        if (*(void *)v50 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v11 = *(void **)(*((void *)&v49 + 1) + 8 * v9);
        if ([v11 node]
          && (float v48 = 0.0,
              unint64_t v47 = 0,
              int v46 = 0,
              uint64_t v45 = 0,
              objc_msgSend((id)objc_msgSend(v11, "node"), "getBoundingBoxMin:max:", &v47, &v45)))
        {
          unsigned int v12 = (void *)[v11 node];
          LODWORD(v14) = HIDWORD(v47);
          LODWORD(v13) = v47;
          *(float *)&double v15 = v48;
          objc_msgSend(v12, "convertPosition:toNode:", 0, v13, v14, v15);
          unint64_t v47 = __PAIR64__(v17, v16);
          float v48 = v18;
          long long v19 = (void *)[v11 node];
          LODWORD(v21) = HIDWORD(v45);
          LODWORD(v20) = v45;
          LODWORD(v22) = v46;
          objc_msgSend(v19, "convertPosition:toNode:", 0, v20, v21, v22);
          float v26 = *(float *)&v40.i32[2];
          if (v48 >= v25) {
            float v27 = v25;
          }
          else {
            float v27 = v48;
          }
          if (v48 >= v25) {
            float v25 = v48;
          }
          if (*(float *)&v40.i32[2] >= v27) {
            float v26 = v27;
          }
          v23.i32[1] = v24;
          int8x8_t v28 = (int8x8_t)vcgt_f32(v23, (float32x2_t)v47);
          float32x2_t v29 = (float32x2_t)vbsl_s8(v28, (int8x8_t)v47, (int8x8_t)v23);
          *(int8x8_t *)v10.i8 = vbsl_s8((int8x8_t)vcgt_f32(v29, *(float32x2_t *)v40.i8), *(int8x8_t *)v40.i8, (int8x8_t)v29);
          v10.i64[1] = __PAIR64__(v40.u32[3], LODWORD(v26));
          float32x2_t v30 = (float32x2_t)vbsl_s8(v28, (int8x8_t)v23, (int8x8_t)v47);
          *(int8x8_t *)&long long v31 = vbsl_s8((int8x8_t)vcgt_f32(v30, *(float32x2_t *)&v37), (int8x8_t)v30, *(int8x8_t *)&v37);
          float v32 = *((float *)&v37 + 2);
          if (*((float *)&v37 + 2) < v25) {
            float v32 = v25;
          }
          *((void *)&v31 + 1) = __PAIR64__(HIDWORD(v37), LODWORD(v32));
          char v6 = 1;
          long long v37 = v31;
        }
        else
        {
          int32x4_t v10 = v40;
        }
        ++v9;
      }
      while (v5 != v9);
      int32x4_t v39 = v10;
      uint64_t v5 = [(NSOrderedSet *)v3 countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v5);
    *(double *)&float32x2_t v33 = 0.0;
    if (v6)
    {
      if (self)
      {
        [(SCNManipulator *)self transform];
        [(SCNManipulator *)self transform];
        [(SCNManipulator *)self transform];
        [(SCNManipulator *)self transform];
        [(SCNManipulator *)self transform];
        [(SCNManipulator *)self transform];
        float32x2_t v33 = vsub_f32(*(float32x2_t *)v39.i8, (float32x2_t)__PAIR64__(v41, v42));
        float32x2_t v34 = vsub_f32(*(float32x2_t *)&v37, (float32x2_t)__PAIR64__(v43, v44));
      }
      else
      {
        float32x2_t v34 = (float32x2_t)v37;
        float32x2_t v33 = *(float32x2_t *)v39.i8;
      }
      float32x2_t v35 = v34;
    }
  }
  else
  {
    *(double *)&float32x2_t v33 = 0.0;
  }
  double v38 = *(double *)&v33;
  -[SCNManipulator _prepareSnapToAlignData:minOffset:maxOffset:](self, "_prepareSnapToAlignData:minOffset:maxOffset:", 1, *(void *)&v35);
  [(SCNManipulator *)self _prepareSnapToAlignData:2 minOffset:v38 maxOffset:v36];
  [(SCNManipulator *)self _prepareSnapToAlignData:3 minOffset:v38 maxOffset:v36];
}

- (void)prepareSnapToAlignDataIfNeeded
{
  if (!self->_snapToAlignCount)
  {
    uint64_t v3 = objc_msgSend(-[SCNManipulator scene](self, "scene"), "sceneRef");
    +[SCNTransaction lock];
    if (v3)
    {
      C3DSceneLock(v3);
      [(SCNManipulator *)self prepareSnapToAlignData];
      C3DSceneUnlock(v3);
    }
    else
    {
      [(SCNManipulator *)self prepareSnapToAlignData];
    }
    +[SCNTransaction unlock];
  }
}

- (void)_snapPositionToAlign:(float)a3 original:(float)a4 unit:(float)a5 axisMove:(double)a6 rayStart:(__n128)a7 rayDir:(__n128)a8 didSnap:(uint64_t)a9 snapIndexes:(int)a10
{
  __n128 v34 = a8;
  __n128 v35 = a7;
  [a1 prepareSnapToAlignDataIfNeeded];
  *a11 = 0;
  if (a1[70] && a1[71])
  {
    __n128 v32 = 0u;
    __n128 v33 = 0u;
    __int32 v31 = 0;
    C3DRay3Make(&v32, &v35, &v34);
    __n128 v20 = a2;
    BOOL v21 = 0;
    float32x4_t v22 = (float32x4_t)a2;
    if (vabds_f32(a2.n128_f32[0], a3) > 0.00001)
    {
      uint64_t v23 = _snapPositionToAlign(a1[71], a1[70], &v31, a2.n128_f32[0], a6);
      *a12 = v23;
      if (v23 == -1)
      {
        BOOL v21 = 0;
        __n128 v20 = a2;
        float32x4_t v22 = (float32x4_t)a2;
      }
      else
      {
        v22.i32[0] = v31;
        __n128 v20 = a2;
        *(uint64_t *)((char *)v22.i64 + 4) = *(uint64_t *)((char *)a2.n128_i64 + 4);
        BOOL v21 = 1;
      }
    }
    if (vabds_f32(v20.n128_f32[1], a4) <= 0.00001)
    {
      int v25 = 0;
    }
    else
    {
      float32x4_t v28 = v22;
      uint64_t v24 = _snapPositionToAlign(a1[72], a1[70], &v31, v20.n128_f32[1], a6);
      a12[1] = v24;
      if (v24 == -1)
      {
        int v25 = 0;
        float32x4_t v22 = v28;
        __n128 v20 = a2;
      }
      else
      {
        __n128 v20 = a2;
        v22.i64[0] = __PAIR64__(v31, v28.u32[0]);
        v22.i64[1] = v28.i64[1];
        int v25 = 1;
      }
    }
    if (vabds_f32(v20.n128_f32[2], a5) <= 0.00001)
    {
      int v27 = 0;
    }
    else
    {
      float32x4_t v29 = v22;
      uint64_t v26 = _snapPositionToAlign(a1[73], a1[70], &v31, v20.n128_f32[2], a6);
      a12[2] = v26;
      if (v26 == -1)
      {
        int v27 = 0;
        float32x4_t v22 = v29;
        __n128 v20 = a2;
      }
      else
      {
        __n128 v20 = a2;
        v22.i64[0] = v29.i64[0];
        v22.i64[1] = __PAIR64__(v29.u32[3], v31);
        int v27 = 1;
      }
    }
    *a11 = v21 | v25 | v27;
    if (v21 | v25 | v27)
    {
      if (a10) {
        _adjustSnapForAxisMove(v21, v25, v27, a12, v22, v20, v32, v33);
      }
    }
  }
}

- (BOOL)readonly
{
  return self->_readonly;
}

- (int64_t)xAlignment
{
  return self->_xAlignment;
}

- (void)setXAlignment:(int64_t)a3
{
  self->_xAlignment = a3;
}

- (int64_t)yAlignment
{
  return self->_yAlignment;
}

- (void)setYAlignment:(int64_t)a3
{
  self->_yAlignment = a3;
}

- (int64_t)zAlignment
{
  return self->_zAlignment;
}

- (void)setZAlignment:(int64_t)a3
{
  self->_zAlignment = a3;
}

- (void)_applyWithEvent:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: Unknown manipulator action", v1, 2u);
}

@end