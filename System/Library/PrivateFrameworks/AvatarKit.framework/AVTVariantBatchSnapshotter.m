@interface AVTVariantBatchSnapshotter
- (AVTVariantBatchSnapshotter)initWithAvatar:(id)a3 size:(CGSize)a4 scale:(double)a5 antialiasingMode:(unint64_t)a6 device:(id)a7;
- (id)imageWithOptions:(id)a3 modifications:(id)a4;
- (void)dealloc;
@end

@implementation AVTVariantBatchSnapshotter

- (AVTVariantBatchSnapshotter)initWithAvatar:(id)a3 size:(CGSize)a4 scale:(double)a5 antialiasingMode:(unint64_t)a6 device:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v26[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)AVTVariantBatchSnapshotter;
  v16 = [(AVTVariantBatchSnapshotter *)&v24 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_avatar, a3);
    v17->_size.CGFloat width = width;
    v17->_size.CGFloat height = height;
    v17->_scale = a5;
    v17->_antialiasingMode = a6;
    [(AVTAvatar *)v17->_avatar setOptimizeForSnapshot:1];
    v25 = @"AVTRendererOptionInitiallyConfigureForARMode";
    v26[0] = MEMORY[0x263EFFA80];
    v18 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
    uint64_t v19 = +[SCNRenderer rendererWithDevice:v15 options:v18];
    renderer = v17->_renderer;
    v17->_renderer = (AVTRenderer *)v19;

    [(AVTRenderer *)v17->_renderer setFramingMode:@"cameraDefault"];
    [(AVTRenderer *)v17->_renderer setAvatar:v14];
    v21 = objc_alloc_init(AVTSnapshotHelper);
    snapshotHelper = v17->_snapshotHelper;
    v17->_snapshotHelper = v21;
  }
  return v17;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AVTVariantBatchSnapshotter;
  [(AVTVariantBatchSnapshotter *)&v2 dealloc];
}

- (id)imageWithOptions:(id)a3 modifications:(id)a4
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7) {
    (*((void (**)(id, AVTAvatar *))v7 + 2))(v7, self->_avatar);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = self->_avatar;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v10 = [v6 objectForKeyedSubscript:@"AVTSnapshotMemojiPresetSubstitutions"];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v68 objects:v75 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v69 != v13) {
            objc_enumerationMutation(v10);
          }
          -[AVTAvatar setPreset:forCategory:animated:](v9, "setPreset:forCategory:animated:", *(void *)(*((void *)&v68 + 1) + 8 * i), [*(id *)(*((void *)&v68 + 1) + 8 * i) category], 0);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v68 objects:v75 count:16];
      }
      while (v12);
    }

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v15 = [v6 objectForKeyedSubscript:@"AVTSnapshotMemojiColorPresetSubstitutions"];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v64 objects:v74 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v65;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v65 != v18) {
            objc_enumerationMutation(v15);
          }
          -[AVTAvatar setColorPreset:forCategory:colorIndex:](v9, "setColorPreset:forCategory:colorIndex:", *(void *)(*((void *)&v64 + 1) + 8 * j), [*(id *)(*((void *)&v64 + 1) + 8 * j) category], 0);
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v64 objects:v74 count:16];
      }
      while (v17);
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v20 = [v6 objectForKeyedSubscript:@"AVTSnapshotMemojiSecondaryColorPresetSubstitutions"];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v60 objects:v73 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v61;
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v61 != v23) {
            objc_enumerationMutation(v20);
          }
          -[AVTAvatar setColorPreset:forCategory:colorIndex:](v9, "setColorPreset:forCategory:colorIndex:", *(void *)(*((void *)&v60 + 1) + 8 * k), [*(id *)(*((void *)&v60 + 1) + 8 * k) category], 1);
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v60 objects:v73 count:16];
      }
      while (v22);
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v25 = [v6 objectForKeyedSubscript:@"AVTSnapshotMemojiThirdColorPresetSubstitutions"];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v56 objects:v72 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v57;
      do
      {
        for (uint64_t m = 0; m != v27; ++m)
        {
          if (*(void *)v57 != v28) {
            objc_enumerationMutation(v25);
          }
          -[AVTAvatar setColorPreset:forCategory:colorIndex:](v9, "setColorPreset:forCategory:colorIndex:", *(void *)(*((void *)&v56 + 1) + 8 * m), [*(id *)(*((void *)&v56 + 1) + 8 * m) category], 2);
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v56 objects:v72 count:16];
      }
      while (v27);
    }
  }
  [(AVTAvatar *)self->_avatar update];
  v30 = [v6 objectForKeyedSubscript:@"AVTSnapshotPose"];
  if (v30) {
    [(AVTAvatar *)self->_avatar setPose:v30];
  }
  uint64_t v31 = [v6 objectForKeyedSubscript:@"AVTSnapshotFramingMode"];
  v32 = (void *)v31;
  v33 = @"cameraHead";
  if (v31) {
    v33 = (__CFString *)v31;
  }
  v34 = v33;

  [(AVTRenderer *)self->_renderer setFramingMode:v34];
  v35 = [v6 objectForKeyedSubscript:@"AVTSnapshotPoseAnimation"];
  v36 = v35;
  if (v35) {
    id v37 = (id)[v35 addToAvatar:self->_avatar useStaticPhysicsState:0];
  }
  v38 = [v6 objectForKeyedSubscript:@"AVTSnapshotBackgroundColorKey"];
  v39 = [(AVTRenderer *)self->_renderer backgroundColor];

  if (v39 != v38) {
    [(AVTRenderer *)self->_renderer setBackgroundColor:v38];
  }
  [MEMORY[0x263F16B08] flush];
  double scale = self->_scale;
  uint64_t v41 = (unint64_t)(scale * self->_size.width);
  uint64_t v42 = (unint64_t)(scale * self->_size.height);
  v43 = [v6 objectForKeyedSubscript:@"AVTSnapshotHeroFrameKey"];
  [v43 floatValue];
  double v45 = v44;

  [(AVTRenderer *)self->_renderer updateAtTime:v45];
  renderer = self->_renderer;
  unint64_t antialiasingMode = self->_antialiasingMode;
  snapshotHelper = self->_snapshotHelper;
  double height = self->_size.height;
  float v50 = self->_scale;
  id v55 = 0;
  v51 = (void *)[(AVTSnapshotHelper *)(CGImage *)snapshotHelper newImageWithRenderer:antialiasingMode antialiasingMode:v41 pixelWidth:v42 pixelHeight:&v55 imagePointSize:self->_size.width contentScaleFactor:height error:v50];
  id v52 = v55;
  if (!v51)
  {
    v53 = avt_default_log();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      -[AVTVariantBatchSnapshotter imageWithOptions:modifications:](v52);
    }
  }
  return v51;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotHelper, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
}

- (void)imageWithOptions:(void *)a1 modifications:.cold.1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3(&dword_20B819000, v2, v3, "Error: Failed to create image with error: %@", v4, v5, v6, v7, 2u);
}

@end