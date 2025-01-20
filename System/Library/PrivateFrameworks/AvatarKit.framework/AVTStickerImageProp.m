@interface AVTStickerImageProp
- (AVTStickerImageProp)initWithImageAtPath:(id)a3 size:(CGSize)a4 scale:(BOOL)a5 position:(BOOL)a6 renderLast:(id)a7 orientToCamera:(id)a8 rotation:(id)a9 palettesDescriptions:modifiers:adjustments:;
- (NSString)imagePath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryWithTargetPath:(id)a3;
- (void)buildNodeForAvatar:(id)a3 withCamera:(id)a4 options:(id)a5 completionHandler:(id)a6;
@end

@implementation AVTStickerImageProp

- (AVTStickerImageProp)initWithImageAtPath:(id)a3 size:(CGSize)a4 scale:(BOOL)a5 position:(BOOL)a6 renderLast:(id)a7 orientToCamera:(id)a8 rotation:(id)a9 palettesDescriptions:modifiers:adjustments:
{
  double v26 = v10;
  double v27 = v11;
  BOOL v15 = a6;
  BOOL v16 = a5;
  double v25 = v9;
  double height = a4.height;
  double width = a4.width;
  id v21 = a3;
  v28.receiver = self;
  v28.super_class = (Class)AVTStickerImageProp;
  v22 = -[AVTStickerProp initWithSize:scale:position:renderLast:orientToCamera:rotation:palettesDescriptions:shaderModifiers:adjustments:](&v28, sel_initWithSize_scale_position_renderLast_orientToCamera_rotation_palettesDescriptions_shaderModifiers_adjustments_, v16, v15, a7, a8, a9, width, height, v25, v26, v27);
  v23 = v22;
  if (v22) {
    objc_storeStrong((id *)&v22->_imagePath, a3);
  }

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [AVTStickerImageProp alloc];
  imagePath = self->_imagePath;
  [(AVTStickerProp *)self size];
  double v7 = v6;
  double v9 = v8;
  [(AVTStickerProp *)self scale];
  double v22 = v10;
  [(AVTStickerProp *)self position];
  double v21 = v11;
  BOOL v12 = [(AVTStickerProp *)self renderLast];
  BOOL v13 = [(AVTStickerProp *)self orientToCamera];
  [(AVTStickerProp *)self rotation];
  double v20 = v14;
  BOOL v15 = [(AVTStickerProp *)self palettesDescriptions];
  BOOL v16 = [(AVTStickerProp *)self shaderModifiers];
  v17 = [(AVTStickerProp *)self adjustments];
  v18 = -[AVTStickerImageProp initWithImageAtPath:size:scale:position:renderLast:orientToCamera:rotation:palettesDescriptions:modifiers:adjustments:](v4, "initWithImageAtPath:size:scale:position:renderLast:orientToCamera:rotation:palettesDescriptions:modifiers:adjustments:", imagePath, v12, v13, v15, v16, v17, v7, v9, v22, v21, v20);

  return v18;
}

- (NSString)imagePath
{
  return self->_imagePath;
}

- (void)buildNodeForAvatar:(id)a3 withCamera:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  double v10 = (void (**)(id, void *))a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = (void (**)(id, void *))a6;
  double v14 = [(AVTStickerProp *)self node];

  BOOL v15 = &OBJC_IVAR___AVTStickerGenerator__workQueue;
  if (!v14)
  {
    BOOL v16 = (void *)MEMORY[0x263F16AC0];
    [(AVTStickerProp *)self size];
    double v18 = v17;
    [(AVTStickerProp *)self size];
    v19 = objc_msgSend(v16, "planeWithWidth:height:", v18);
    double v20 = [v19 firstMaterial];
    double v21 = [MEMORY[0x263F16A98] nodeWithGeometry:v19];
    [(AVTStickerProp *)self position];
    objc_msgSend(v21, "setSimdPosition:");
    [(AVTStickerProp *)self rotation];
    objc_msgSend(v21, "setSimdEulerAngles:");
    [(AVTStickerProp *)self scale];
    v61 = v22;
    [(AVTStickerProp *)self scale];
    objc_msgSend(v21, "setSimdScale:", COERCE_DOUBLE(__PAIR64__(v23, v61)));
    [v21 setCastsShadow:0];
    [(AVTStickerProp *)self opacity];
    objc_msgSend(v21, "setOpacity:");
    uint64_t v24 = [(AVTStickerProp *)self palettesDescriptions];
    if (!v24) {
      goto LABEL_5;
    }
    double v25 = (void *)v24;
    [(AVTStickerProp *)self palettesDescriptions];
    v61 = v10;
    double v26 = v20;
    double v27 = v19;
    objc_super v28 = v13;
    v30 = id v29 = v11;
    uint64_t v31 = [v30 count];

    id v11 = v29;
    BOOL v13 = v28;
    v19 = v27;
    double v20 = v26;
    double v10 = v61;

    if (v31)
    {
      imagePath = self->_imagePath;
      v33 = [v20 emission];
    }
    else
    {
LABEL_5:
      imagePath = self->_imagePath;
      v33 = [v20 diffuse];
    }
    v34 = v33;
    [v33 setContents:imagePath];

    [v20 setLightingModelName:*MEMORY[0x263F16B98]];
    [(AVTStickerProp *)self setNode:v21];

    BOOL v15 = &OBJC_IVAR___AVTStickerGenerator__workQueue;
  }
  v35 = [(AVTStickerProp *)self node];
  v36 = AVTCloneNodesAndMaterials(v35);

  if (!*(Class *)((char *)&self->super.super.isa + v15[110]))
  {
    v37 = [v36 geometry];
    v38 = [v37 firstMaterial];

    v39 = [MEMORY[0x263F1C550] blackColor];
    v40 = [v38 emission];
    [v40 setContents:v39];

    v41 = [MEMORY[0x263F1C550] clearColor];
    v42 = [v38 diffuse];
    [v42 setContents:v41];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v61 = v13;
    id v43 = v11;
    v44 = v10;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v45 = [(AVTStickerProp *)self adjustments];
    uint64_t v46 = [v45 countByEnumeratingWithState:&v67 objects:v72 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v68;
      do
      {
        uint64_t v49 = 0;
        do
        {
          if (*(void *)v68 != v48) {
            objc_enumerationMutation(v45);
          }
          objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * v49++), "applyAdjustmentIfNeededToNode:forMemoji:ignoreScaleZ:", v36, v44, 1, v61);
        }
        while (v47 != v49);
        uint64_t v47 = [v45 countByEnumeratingWithState:&v67 objects:v72 count:16];
      }
      while (v47);
    }

    id v11 = v43;
    BOOL v13 = v61;
  }
  v50 = objc_msgSend(v10, "neckNode", v61);
  [v50 simdWorldPosition];
  float32x4_t v62 = v51;
  [v11 simdWorldPosition];
  float32x4_t v53 = vsubq_f32(v62, v52);
  float32x4_t v54 = vmulq_f32(v53, v53);
  [(AVTStickerProp *)self applyCamera:v11 toNode:v36 distToHead:sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v54, 2), vaddq_f32(v54, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v54.f32, 1))).f32[0])];

  v55 = [(AVTStickerProp *)self palettesDescriptions];
  +[AVTStickerProp applyPalettesForAvatar:v10 toNode:v36 palettesDescriptions:v55];

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v56 = [(AVTStickerProp *)self shaderModifiers];
  uint64_t v57 = [v56 countByEnumeratingWithState:&v63 objects:v71 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v64;
    do
    {
      uint64_t v60 = 0;
      do
      {
        if (*(void *)v64 != v59) {
          objc_enumerationMutation(v56);
        }
        [*(id *)(*((void *)&v63 + 1) + 8 * v60++) applyToAllMaterialsOfNode:v36 options:v12 reversionContext:0];
      }
      while (v58 != v60);
      uint64_t v58 = [v56 countByEnumeratingWithState:&v63 objects:v71 count:16];
    }
    while (v58);
  }

  v13[2](v13, v36);
}

- (id)dictionaryWithTargetPath:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVTStickerImageProp;
  v4 = [(AVTStickerProp *)&v8 dictionaryWithTargetPath:a3];
  v5 = (void *)[v4 mutableCopy];

  double v6 = [(AVTStickerProp *)self originalName];
  [v5 setObject:v6 forKeyedSubscript:@"image"];

  return v5;
}

- (void).cxx_destruct
{
}

@end