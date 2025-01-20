@interface AVTStickerSceneProp
- (AVTStickerSceneProp)initWithRootNode:(id)a3 scale:(BOOL)a4 position:(id)a5 rotation:(id)a6 renderLast:(id)a7 palettesDescriptions:modifiers:adjustments:;
- (SCNNode)rootNode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryWithTargetPath:(id)a3;
- (void)buildNodeForAvatar:(id)a3 withCamera:(id)a4 options:(id)a5 completionHandler:(id)a6;
@end

@implementation AVTStickerSceneProp

- (AVTStickerSceneProp)initWithRootNode:(id)a3 scale:(BOOL)a4 position:(id)a5 rotation:(id)a6 renderLast:(id)a7 palettesDescriptions:modifiers:adjustments:
{
  BOOL v13 = a4;
  double v21 = v8;
  double v22 = v9;
  double v20 = v7;
  id v16 = a3;
  v23.receiver = self;
  v23.super_class = (Class)AVTStickerSceneProp;
  v17 = -[AVTStickerProp initWithSize:scale:position:renderLast:orientToCamera:rotation:palettesDescriptions:shaderModifiers:adjustments:](&v23, sel_initWithSize_scale_position_renderLast_orientToCamera_rotation_palettesDescriptions_shaderModifiers_adjustments_, v13, 0, a5, a6, a7, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8), v20, v21, v22);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_rootNode, a3);
    objc_msgSend(v16, "avt_enableSubdivisionOnHierarchyWithQuality:animoji:", 1, 0);
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [AVTStickerSceneProp alloc];
  v5 = [(AVTStickerSceneProp *)self rootNode];
  [(AVTStickerProp *)self scale];
  double v17 = v6;
  [(AVTStickerProp *)self position];
  double v16 = v7;
  [(AVTStickerProp *)self rotation];
  double v15 = v8;
  BOOL v9 = [(AVTStickerProp *)self renderLast];
  v10 = [(AVTStickerProp *)self palettesDescriptions];
  v11 = [(AVTStickerProp *)self shaderModifiers];
  v12 = [(AVTStickerProp *)self adjustments];
  BOOL v13 = [(AVTStickerSceneProp *)v4 initWithRootNode:v5 scale:v9 position:v10 rotation:v11 renderLast:v12 palettesDescriptions:v17 modifiers:v16 adjustments:v15];

  return v13;
}

- (void)buildNodeForAvatar:(id)a3 withCamera:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = (void (**)(id, void *))a6;
  v14 = [(AVTStickerProp *)self node];

  if (!v14)
  {
    double v15 = [(AVTStickerSceneProp *)self rootNode];
    [(AVTStickerProp *)self setNode:v15];
  }
  double v16 = [(AVTStickerProp *)self node];
  double v17 = AVTCloneNodesAndMaterials(v16);

  [(AVTStickerProp *)self position];
  objc_msgSend(v17, "setSimdPosition:");
  [(AVTStickerProp *)self rotation];
  objc_msgSend(v17, "setSimdEulerAngles:");
  [(AVTStickerProp *)self scale];
  objc_msgSend(v17, "setSimdScale:");
  [(AVTStickerProp *)self opacity];
  objc_msgSend(v17, "setOpacity:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v35 = v11;
    id v18 = v10;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v19 = [(AVTStickerProp *)self adjustments];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v42;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v42 != v22) {
            objc_enumerationMutation(v19);
          }
          objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * v23++), "applyAdjustmentIfNeededToNode:forMemoji:ignoreScaleZ:", v17, v18, 0, v35);
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v21);
    }

    [v18 updateMorphVariantsInStickerPropNodeHierarchy:v17];
    id v11 = v35;
  }
  v24 = objc_msgSend(v10, "neckNode", v35);
  [v24 simdWorldPosition];
  float32x4_t v36 = v25;
  [v11 simdWorldPosition];
  float32x4_t v27 = vsubq_f32(v36, v26);
  float32x4_t v28 = vmulq_f32(v27, v27);
  [(AVTStickerProp *)self applyCamera:v11 toNode:v17 distToHead:sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v28, 2), vaddq_f32(v28, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.f32, 1))).f32[0])];

  v29 = [(AVTStickerProp *)self palettesDescriptions];
  +[AVTStickerProp applyPalettesForAvatar:v10 toNode:v17 palettesDescriptions:v29];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v30 = [(AVTStickerProp *)self shaderModifiers];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v38;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v38 != v33) {
          objc_enumerationMutation(v30);
        }
        [*(id *)(*((void *)&v37 + 1) + 8 * v34++) applyToMatchedMaterialsOfAvatar:v10 inHierarchy:v17 options:v12 reversionContext:0];
      }
      while (v32 != v34);
      uint64_t v32 = [v30 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v32);
  }

  v13[2](v13, v17);
}

- (id)dictionaryWithTargetPath:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVTStickerSceneProp;
  v4 = [(AVTStickerProp *)&v8 dictionaryWithTargetPath:a3];
  v5 = (void *)[v4 mutableCopy];

  [v5 removeObjectForKey:@"orientToCamera"];
  double v6 = [(AVTStickerProp *)self originalName];
  [v5 setObject:v6 forKeyedSubscript:@"scene"];

  return v5;
}

- (SCNNode)rootNode
{
  return self->_rootNode;
}

- (void).cxx_destruct
{
}

@end