@interface AVTStickerGenerator
+ (id)addCamera:(id)a3 inScene:(id)a4 reversionContext:(id)a5;
+ (id)poseByApplyingAdjustmentsForConfiguration:(id)a3 avatar:(id)a4;
+ (void)addProps:(id)a3 toScene:(id)a4 forAvatar:(id)a5 withCamera:(id)a6 options:(id)a7 reversionContext:(id)a8;
+ (void)applyViewTransitionConfiguration:(id)a3 forLateAdditionOfComponentAssetNode:(id)a4 ofAvatar:(id)a5;
+ (void)applyViewTransitionConfiguration:(id)a3 toView:(id)a4 scope:(unint64_t)a5 options:(unint64_t)a6 duration:(double)a7 avatar:(id)a8 context:(id)a9 completionHandler:(id)a10;
- (AVTAvatar)avatar;
- (AVTStickerGenerator)initWithAvatar:(id)a3;
- (BOOL)async;
- (void)_snapshotAtTime:(double)a3 configuration:(id)a4 options:(id)a5 completionBlock:(id)a6;
- (void)_stickerImageWithConfiguration:(id)a3 options:(id)a4 startTime:(double)a5 completionHandler:(id)a6;
- (void)applyConfiguration:(id)a3 options:(id)a4 snapshotBlock:(id)a5;
- (void)dealloc;
- (void)posterWithConfiguration:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)setAsync:(BOOL)a3;
- (void)setAvatar:(id)a3;
- (void)stickerImageWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)stickerImageWithConfiguration:(id)a3 correctClipping:(BOOL)a4 completionHandler:(id)a5;
- (void)stickerImageWithConfiguration:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)updateConfiguration:(id)a3 atTime:(double)a4;
@end

@implementation AVTStickerGenerator

+ (id)poseByApplyingAdjustmentsForConfiguration:(id)a3 avatar:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 physicalizedPose];
  v8 = [v7 pose];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v9 = objc_msgSend(v5, "poseAdjustments", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      v14 = v8;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v8 = [*(id *)(*((void *)&v16 + 1) + 8 * v13) poseByApplyingToPose:v14 forAvatar:v6];

        ++v13;
        v14 = v8;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

+ (void)applyViewTransitionConfiguration:(id)a3 toView:(id)a4 scope:(unint64_t)a5 options:(unint64_t)a6 duration:(double)a7 avatar:(id)a8 context:(id)a9 completionHandler:(id)a10
{
  char v78 = a6;
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a8;
  id v19 = a9;
  v20 = (void (**)(void))a10;
  if (!v19)
  {
    uint64_t v21 = avt_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[AVTStickerGenerator applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:](v21);
    }
  }
  v22 = [v17 scene];
  v23 = [v17 pointOfView];
  uint64_t v24 = [v17 environment];
  v25 = (void *)v24;
  if (a5 <= 1)
  {
    v71 = v23;
    unint64_t v72 = a5;
    v74 = v22;
    v75 = (void *)v24;
    [v16 loadIfNeeded];
    [v19 resetForAvatar:v18];
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    v26 = [v16 presetOverrides];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v91 objects:v98 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v92 != v29) {
            objc_enumerationMutation(v26);
          }
          [*(id *)(*((void *)&v91 + 1) + 8 * i) applyToAvatar:v18 reversionContext:v19];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v91 objects:v98 count:16];
      }
      while (v28);
    }
    id v73 = a1;
    v77 = v20;

    [v18 update];
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    v31 = [v16 shaderModifiers];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v87 objects:v97 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v88;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v88 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = *(void **)(*((void *)&v87 + 1) + 8 * j);
          v37 = [v18 avatarNode];
          [v36 applyToMatchedMaterialsOfAvatar:v18 inHierarchy:v37 options:0 reversionContext:v19];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v87 objects:v97 count:16];
      }
      while (v33);
    }

    if ((v78 & 1) == 0)
    {
      v38 = v77;
      if (a7 <= 0.0)
      {
        v39 = 0;
      }
      else
      {
        v39 = (void *)MEMORY[0x210539A20](v77);

        v38 = 0;
      }
      v40 = [v16 poseAdjustments];

      v41 = [v16 physicalizedPose];
      v42 = v41;
      v77 = v38;
      if (v40)
      {
        v70 = v39;
        uint64_t v43 = [v41 pose];

        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        v44 = [v16 poseAdjustments];
        uint64_t v45 = [v44 countByEnumeratingWithState:&v83 objects:v96 count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          uint64_t v47 = *(void *)v84;
          do
          {
            uint64_t v48 = 0;
            v49 = (void *)v43;
            do
            {
              if (*(void *)v84 != v47) {
                objc_enumerationMutation(v44);
              }
              uint64_t v43 = [*(id *)(*((void *)&v83 + 1) + 8 * v48) poseByApplyingToPose:v49 forAvatar:v18];

              ++v48;
              v49 = (void *)v43;
            }
            while (v46 != v48);
            uint64_t v46 = [v44 countByEnumeratingWithState:&v83 objects:v96 count:16];
          }
          while (v46);
        }

        v50 = [AVTAvatarPhysicalizedPose alloc];
        v51 = [v16 physicalizedPose];
        v52 = [v51 physicsStates];
        v53 = [(AVTAvatarPhysicalizedPose *)v50 initWithPose:v43 physicsStates:v52];

        v39 = v70;
        [(AVTAvatarPhysicalizedPose *)v53 applyWithTransitionToAvatar:v18 duration:v70 completionHandler:a7];

        v42 = (void *)v43;
      }
      else
      {
        [v41 applyWithTransitionToAvatar:v18 duration:v39 completionHandler:a7];
      }
    }
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    v54 = [v16 morpherOverrides];
    uint64_t v55 = [v54 countByEnumeratingWithState:&v79 objects:v95 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v80;
      do
      {
        for (uint64_t k = 0; k != v56; ++k)
        {
          if (*(void *)v80 != v57) {
            objc_enumerationMutation(v54);
          }
          v59 = *(void **)(*((void *)&v79 + 1) + 8 * k);
          v60 = [v18 avatarNode];
          [v59 applyToAvatar:v18 inHierarchy:v60 reversionContext:v19];
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v79 objects:v95 count:16];
      }
      while (v56);
    }

    if ((v78 & 2) != 0)
    {
      v23 = v71;
      a5 = v72;
      v25 = v75;
      v20 = (void (**)(void))v77;
      a1 = v73;
      v22 = v74;
    }
    else
    {
      v61 = [v16 camera];

      v25 = v75;
      v20 = (void (**)(void))v77;
      a1 = v73;
      v22 = v74;
      if (v61)
      {
        v62 = [v16 camera];
        v23 = [v73 addCamera:v62 inScene:v74 reversionContext:v19];

        v63 = [v23 camera];
        [v63 setProjectionDirection:0];

        [v19 saveUpdatePointOfViewFromFramingModeInEnvironment:v75];
        if (a7 <= 0.0)
        {
          [v17 setPointOfView:v23];
        }
        else
        {
          [MEMORY[0x263F16B08] begin];
          [MEMORY[0x263F16B08] setAnimationDuration:a7];
          v64 = (void *)MEMORY[0x263F16B08];
          v65 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
          [v64 setAnimationTimingFunction:v65];

          v25 = v75;
          [v17 setPointOfView:v23];
          v22 = v74;
          [MEMORY[0x263F16B08] commit];
        }
        a5 = v72;
      }
      else
      {
        v23 = v71;
        a5 = v72;
      }
    }
  }
  if ((a5 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v76 = v25;
      id v66 = v18;
      v67 = [v16 bodyPose];
      [v66 setShowsBody:v67 != 0];
      [v66 setBodyPose:v67];
      if (v67) {
        [v19 saveShowMemojiBody:0];
      }
      [v66 update];

      v25 = v76;
    }
    v68 = [v16 props];

    if (v68)
    {
      v69 = [v16 props];
      [a1 addProps:v69 toScene:v22 forAvatar:v18 withCamera:v23 options:0 reversionContext:v19];
    }
  }
  if (v20) {
    v20[2](v20);
  }
}

+ (void)applyViewTransitionConfiguration:(id)a3 forLateAdditionOfComponentAssetNode:(id)a4 ofAvatar:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v7 loadIfNeeded];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = [v7 shaderModifiers];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * v14++) applyToMatchedMaterialsOfAvatar:v9 inHierarchy:v8 options:0 reversionContext:0];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v15 = objc_msgSend(v7, "morpherOverrides", 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v19++) applyToAvatar:v9 inHierarchy:v8 reversionContext:0];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }
}

- (void)applyConfiguration:(id)a3 options:(id)a4 snapshotBlock:(id)a5
{
  v136[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  [MEMORY[0x263F16B08] begin];
  [MEMORY[0x263F16B08] setAnimationDuration:0.0];
  renderer = self->_renderer;
  if (!renderer)
  {
    v135 = @"AVTRendererOptionInitiallyConfigureForARMode";
    v136[0] = MEMORY[0x263EFFA80];
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v136 forKeys:&v135 count:1];
    uint64_t v13 = +[SCNRenderer rendererWithDevice:0 options:v12];
    uint64_t v14 = self->_renderer;
    self->_renderer = v13;

    [(AVTRenderer *)self->_renderer setFramingMode:@"cameraDefault"];
    [(AVTRenderer *)self->_renderer setEnableReticle:0];
    renderer = self->_renderer;
  }
  [(AVTRenderer *)renderer setAvatar:self->_avatar];
  [v8 loadIfNeeded];
  [(AVTStickerConfigurationReversionContext *)self->_context resetForAvatar:self->_avatar];
  v15 = [v8 camera];

  if (v15)
  {
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = [v8 camera];
    uint64_t v18 = [(AVTRenderer *)self->_renderer scene];
    uint64_t v19 = [v16 addCamera:v17 inScene:v18 reversionContext:self->_context];

    [(AVTRenderer *)self->_renderer setPointOfView:v19];
  }
  else
  {
    uint64_t v20 = [v8 framingMode];
    long long v21 = (void *)v20;
    long long v22 = @"camera";
    if (v20) {
      long long v22 = (__CFString *)v20;
    }
    long long v23 = v22;

    [(AVTRenderer *)self->_renderer setFramingModeForcingPointOfViewUpdate:v23];
    uint64_t v19 = [(AVTRenderer *)self->_renderer pointOfView];
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v98 = v10;
  if (self->_avatar)
  {
    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    long long v24 = [v8 presetOverrides];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v119 objects:v134 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v120;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v120 != v27) {
            objc_enumerationMutation(v24);
          }
          [*(id *)(*((void *)&v119 + 1) + 8 * i) applyToAvatar:self->_avatar reversionContext:self->_context];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v119 objects:v134 count:16];
      }
      while (v26);
    }
    v95 = v19;

    uint64_t v29 = [v8 poseAdjustments];

    uint64_t v30 = [v8 physicalizedPose];
    v31 = v30;
    if (v29)
    {
      uint64_t v32 = [v30 pose];

      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      uint64_t v33 = [v8 poseAdjustments];
      uint64_t v34 = [v33 countByEnumeratingWithState:&v115 objects:v133 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v116;
        do
        {
          uint64_t v37 = 0;
          v38 = (void *)v32;
          do
          {
            if (*(void *)v116 != v36) {
              objc_enumerationMutation(v33);
            }
            uint64_t v32 = [*(id *)(*((void *)&v115 + 1) + 8 * v37) poseByApplyingToPose:v38 forAvatar:self->_avatar];

            ++v37;
            v38 = (void *)v32;
          }
          while (v35 != v37);
          uint64_t v35 = [v33 countByEnumeratingWithState:&v115 objects:v133 count:16];
        }
        while (v35);
      }

      v39 = [AVTAvatarPhysicalizedPose alloc];
      v40 = [v8 physicalizedPose];
      v41 = [v40 physicsStates];
      v42 = [(AVTAvatarPhysicalizedPose *)v39 initWithPose:v32 physicsStates:v41];

      [(AVTAvatarPhysicalizedPose *)v42 applyToAvatar:self->_avatar];
      v31 = (void *)v32;
    }
    else
    {
      [v30 applyToAvatar:self->_avatar];
    }

    if (isKindOfClass)
    {
      uint64_t v43 = self->_avatar;
      v44 = [v8 bodyPose];
      [(AVTAvatar *)v43 setShowsBody:v44 != 0];
      [(AVTAvatar *)v43 setBodyPose:v44];
    }
    [(AVTAvatar *)self->_avatar update];
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    uint64_t v45 = [v8 shaderModifiers];
    uint64_t v46 = [v45 countByEnumeratingWithState:&v111 objects:v132 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v112;
      do
      {
        for (uint64_t j = 0; j != v47; ++j)
        {
          if (*(void *)v112 != v48) {
            objc_enumerationMutation(v45);
          }
          v50 = *(void **)(*((void *)&v111 + 1) + 8 * j);
          avatar = self->_avatar;
          v52 = [(AVTAvatar *)avatar avatarNode];
          [v50 applyToMatchedMaterialsOfAvatar:avatar inHierarchy:v52 options:v9 reversionContext:self->_context];
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v111 objects:v132 count:16];
      }
      while (v47);
    }

    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    v53 = [v8 morpherOverrides];
    uint64_t v54 = [v53 countByEnumeratingWithState:&v107 objects:v131 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v108;
      do
      {
        for (uint64_t k = 0; k != v55; ++k)
        {
          if (*(void *)v108 != v56) {
            objc_enumerationMutation(v53);
          }
          v58 = *(void **)(*((void *)&v107 + 1) + 8 * k);
          v59 = self->_avatar;
          v60 = [(AVTAvatar *)v59 avatarNode];
          [v58 applyToAvatar:v59 inHierarchy:v60 reversionContext:self->_context];
        }
        uint64_t v55 = [v53 countByEnumeratingWithState:&v107 objects:v131 count:16];
      }
      while (v55);
    }

    uint64_t v19 = v95;
  }
  v61 = [v8 props];

  if (v61)
  {
    v62 = objc_opt_class();
    v63 = [v8 props];
    v64 = [(AVTRenderer *)self->_renderer scene];
    [v62 addProps:v63 toScene:v64 forAvatar:self->_avatar withCamera:v19 options:v9 reversionContext:self->_context];
  }
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  v65 = [v8 props];
  uint64_t v66 = [v65 countByEnumeratingWithState:&v103 objects:v130 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v104;
    do
    {
      for (uint64_t m = 0; m != v67; ++m)
      {
        if (*(void *)v104 != v68) {
          objc_enumerationMutation(v65);
        }
        [*(id *)(*((void *)&v103 + 1) + 8 * m) stickerGenerationWillBegin];
      }
      uint64_t v67 = [v65 countByEnumeratingWithState:&v103 objects:v130 count:16];
    }
    while (v67);
  }

  v70 = [v19 camera];
  [v70 fieldOfView];
  double v72 = v71;
  objc_msgSend(v70, "avt_simdPostProjectionTransform");
  HIDWORD(v73) = 0;
  HIDWORD(v74) = 0;
  long long v94 = v74;
  long long v96 = v73;
  HIDWORD(v75) = 0;
  long long v93 = v75;
  int v76 = [v9 useLegacyCorrectClippingImplementation];
  uint64_t v77 = [v9 contentMode];
  if (v76)
  {
    if (v77 != 1) {
      goto LABEL_66;
    }
    char v78 = [v19 camera];
    [v78 setFieldOfView:v72 * 1.375];
    goto LABEL_65;
  }
  if (v77 == 1)
  {
    uint64_t v79 = 0;
    long long v123 = v96;
    long long v124 = v94;
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = v93;
    do
    {
      *(long long *)((char *)&v126 + v79) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_20B88FF10, COERCE_FLOAT(*(long long *)((char *)&v123 + v79))), (float32x4_t)xmmword_20B88FF20, *(float32x2_t *)((char *)&v123 + v79), 1), (float32x4_t)xmmword_20B88FF30, *(float32x4_t *)((char *)&v123 + v79), 2);
      v79 += 16;
    }
    while (v79 != 48);
LABEL_64:
    char v78 = objc_msgSend(v19, "camera", v126, v127, v128);
    objc_msgSend(v78, "avt_setSimdPostProjectionTransform:", v90, v91, v92);
LABEL_65:

    goto LABEL_66;
  }
  if ([v9 contentMode] == 2
    || [v9 contentMode] == 3
    || [v9 contentMode] == 4)
  {
    uint64_t v80 = 0;
    long long v123 = v96;
    long long v124 = v94;
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = v93;
    do
    {
      *(long long *)((char *)&v126 + v80) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_20B88FF10, COERCE_FLOAT(*(long long *)((char *)&v123 + v80))), (float32x4_t)xmmword_20B88FF20, *(float32x2_t *)((char *)&v123 + v80), 1), (float32x4_t)xmmword_20B88FE80, *(float32x4_t *)((char *)&v123 + v80), 2);
      v80 += 16;
    }
    while (v80 != 48);
    goto LABEL_64;
  }
LABEL_66:
  long long v81 = v19;
  [MEMORY[0x263F16B08] commit];
  v98[2]();
  [MEMORY[0x263F16B08] begin];
  [MEMORY[0x263F16B08] setAnimationDuration:0.0];
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v82 = [v8 props];
  uint64_t v83 = [v82 countByEnumeratingWithState:&v99 objects:v129 count:16];
  if (v83)
  {
    uint64_t v84 = v83;
    uint64_t v85 = *(void *)v100;
    do
    {
      for (uint64_t n = 0; n != v84; ++n)
      {
        if (*(void *)v100 != v85) {
          objc_enumerationMutation(v82);
        }
        [*(id *)(*((void *)&v99 + 1) + 8 * n) stickerGenerationDidEnd];
      }
      uint64_t v84 = [v82 countByEnumeratingWithState:&v99 objects:v129 count:16];
    }
    while (v84);
  }

  if (isKindOfClass)
  {
    long long v87 = self->_avatar;
    [(AVTAvatar *)v87 setShowsBody:0];
    [(AVTAvatar *)v87 setBodyPose:0];
  }
  [(AVTStickerConfigurationReversionContext *)self->_context revertChangesWithScope:0 animationDuration:0.0];
  int v88 = [v9 useLegacyCorrectClippingImplementation];
  uint64_t v89 = [v9 contentMode];
  if (v88)
  {
    if (v89 == 1) {
      [v70 setFieldOfView:v72];
    }
  }
  else if (v89 == 1 {
         || [v9 contentMode] == 2
  }
         || [v9 contentMode] == 3
         || [v9 contentMode] == 4)
  {
    objc_msgSend(v70, "avt_setSimdPostProjectionTransform:", *(double *)&v96, *(double *)&v94, *(double *)&v93);
  }
  [v8 unload];
  [MEMORY[0x263F16B08] commit];
}

- (void)updateConfiguration:(id)a3 atTime:(double)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = [v6 props];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    LOBYTE(v10) = 0;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v7);
        }
        if (v10) {
          int v10 = 1;
        }
        else {
          int v10 = [*(id *)(*((void *)&v30 + 1) + 8 * i) wantsTimedUpdates];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v9);

    if (v10)
    {
      [MEMORY[0x263F16B08] begin];
      [MEMORY[0x263F16B08] setAnimationDuration:0.0];
      memset(&v29, 0, sizeof(v29));
      CMTimeMakeWithSeconds(&v29, a4, 1000000000);
      uint64_t v13 = [(AVTRenderer *)self->_renderer scene];
      uint64_t v14 = [v13 rootNode];
      v15 = [v14 childNodeWithName:@"sticker_props" recursively:0];

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v16 = [v6 props];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v34 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v26;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v26 != v19) {
              objc_enumerationMutation(v16);
            }
            long long v21 = *(void **)(*((void *)&v25 + 1) + 8 * j);
            long long v22 = [v21 nodeName];
            long long v23 = [v15 childNodeWithName:v22 recursively:0];

            CMTime v24 = v29;
            [v21 updateNode:v23 withContentAtTime:&v24];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v34 count:16];
        }
        while (v18);
      }

      [MEMORY[0x263F16B08] commit];
    }
  }
  else
  {
  }
}

+ (void)addProps:(id)a3 toScene:(id)a4 forAvatar:(id)a5 withCamera:(id)a6 options:(id)a7 reversionContext:(id)a8
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = objc_alloc_init(MEMORY[0x263F16A98]);
  [v19 setName:@"sticker_props"];
  long long v26 = v14;
  uint64_t v20 = [v14 rootNode];
  [v20 addChildNode:v19];

  [v18 saveExtraPropsNode:v19];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v13;
  uint64_t v21 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        long long v25 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        CACurrentMediaTime();
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __86__AVTStickerGenerator_addProps_toScene_forAvatar_withCamera_options_reversionContext___block_invoke;
        v28[3] = &unk_26401FAA0;
        id v29 = v19;
        [v25 buildNodeForAvatar:v15 withCamera:v16 options:v17 completionHandler:v28];
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v22);
  }
}

uint64_t __86__AVTStickerGenerator_addProps_toScene_forAvatar_withCamera_options_reversionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addChildNode:a2];
}

+ (id)addCamera:(id)a3 inScene:(id)a4 reversionContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [a3 buildNode];
  [v9 setName:@"sticker_camera"];
  int v10 = [v8 rootNode];

  [v10 addChildNode:v9];
  [v7 saveExtraCameraNode:v9];

  return v9;
}

- (AVTStickerGenerator)initWithAvatar:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AVTStickerGenerator;
  id v5 = [(AVTStickerGenerator *)&v12 init];
  id v6 = v5;
  if (v5)
  {
    [(AVTStickerGenerator *)v5 setAvatar:v4];
    id v7 = objc_alloc_init(AVTStickerConfigurationReversionContext);
    context = v6->_context;
    v6->_context = v7;

    v6->_async = 1;
    uint64_t v9 = objc_alloc_init(AVTSnapshotHelper);
    snapshotHelper = v6->_snapshotHelper;
    v6->_snapshotHelper = v9;

    if (initWithAvatar__onceToken != -1) {
      dispatch_once(&initWithAvatar__onceToken, &__block_literal_global_2);
    }
    objc_storeStrong((id *)&v6->_workQueue, (id)initWithAvatar__sharedWorkQueue);
  }

  return v6;
}

void __38__AVTStickerGenerator_initWithAvatar___block_invoke()
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.avatarkit.AVTStickerGenerator", v0);
  v2 = (void *)initWithAvatar__sharedWorkQueue;
  initWithAvatar__sharedWorkQueue = (uint64_t)v1;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AVTStickerGenerator;
  [(AVTStickerGenerator *)&v2 dealloc];
}

- (void)setAvatar:(id)a3
{
  id v5 = (AVTAvatar *)a3;
  avatar = self->_avatar;
  p_avatar = &self->_avatar;
  if (avatar != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_avatar, a3);
    [(AVTAvatar *)*p_avatar pauseBakedAnimation];
    id v5 = v8;
  }
}

- (void)_snapshotAtTime:(double)a3 configuration:(id)a4 options:(id)a5 completionBlock:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(id, const void *, id, double, double, double, double, double, double, double, double))a6;
  [v10 size];
  double v13 = v12;
  [v10 size];
  double v15 = v14;
  [v10 sizeMultiplier];
  double v17 = v16;
  [v10 scaleFactor];
  double v19 = v18;
  uint64_t v20 = [v9 legacySizeOption];

  if (v20)
  {
    uint64_t v21 = [v9 legacySizeOption];
    [v21 floatValue];
    float v23 = v22;

    double v13 = v23;
    double v15 = v13;
  }
  unint64_t v24 = (unint64_t)(v19 * (v17 * v13));
  unint64_t v25 = (unint64_t)(v19 * (v17 * v15));
  if ([v10 contentMode] == 1)
  {
    double v26 = (double)v24;
    double v27 = (double)v25;
    if ([v10 useLegacyCorrectClippingImplementation])
    {
      uint64_t v28 = (unint64_t)(v26 * 1.375);
      uint64_t v29 = (unint64_t)(v27 * 1.375);
      double v39 = (double)(unint64_t)v28;
      double v30 = (double)(unint64_t)v29;
      double v31 = (double)(v28 - v24) * 0.5;
      double v32 = (double)(v29 - v25) * 0.5;
    }
    else
    {
      uint64_t v28 = (unint64_t)(v26 * 1.9);
      uint64_t v29 = (unint64_t)(v27 * 1.9);
      double v39 = (double)(unint64_t)v28;
      double v30 = (double)(unint64_t)v29;
      double v31 = (double)(v28 - v24) * 0.5;
      double v32 = (double)(v29 - v25);
    }
    goto LABEL_11;
  }
  if ([v10 contentMode] == 2
    || [v10 contentMode] == 3
    || [v10 contentMode] == 4)
  {
    double v26 = (double)v24;
    uint64_t v28 = (unint64_t)((double)v24 * 1.9);
    double v27 = (double)v25;
    uint64_t v29 = (unint64_t)((double)v25 * 1.9);
    double v32 = (double)(v29 - v25) * 0.5;
    double v39 = (double)(unint64_t)v28;
    double v30 = (double)(v29 - (unint64_t)v32);
    double v31 = (double)(v28 - v24) * 0.5;
LABEL_11:
    double v33 = 0.0;
    double v34 = 0.0;
    goto LABEL_12;
  }
  double v26 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v30 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v27 = v30;
  double v39 = v26;
  double v34 = *MEMORY[0x263F001A8];
  double v33 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v32 = v33;
  double v31 = *MEMORY[0x263F001A8];
  uint64_t v29 = v25;
  uint64_t v28 = v24;
LABEL_12:
  [(AVTStickerGenerator *)self updateConfiguration:v9 atTime:a3];
  [(AVTRenderer *)self->_renderer updateAtTime:a3];
  renderer = self->_renderer;
  snapshotHelper = self->_snapshotHelper;
  id v41 = 0;
  uint64_t v37 = (const void *)-[AVTSnapshotHelper newCGImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:error:]((CGImageRef)snapshotHelper, renderer, 2, v28, v29, &v41);
  id v38 = v41;
  v11[2](v11, v37, v38, v31, v32, v26, v27, v34, v33, v39, v30);

  if (v37) {
    CFRelease(v37);
  }
}

- (void)stickerImageWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[AVTStickerGeneratorOptions defaultOptions];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__AVTStickerGenerator_stickerImageWithConfiguration_completionHandler___block_invoke;
  v10[3] = &unk_26401FAC8;
  id v11 = v6;
  id v9 = v6;
  [(AVTStickerGenerator *)self stickerImageWithConfiguration:v7 options:v8 completionHandler:v10];
}

uint64_t __71__AVTStickerGenerator_stickerImageWithConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stickerImageWithConfiguration:(id)a3 correctClipping:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = +[AVTStickerGeneratorOptions optionsWithCorrectClipping:v5];
  [(AVTStickerGenerator *)self stickerImageWithConfiguration:v9 options:v10 completionHandler:v8];
}

- (void)_stickerImageWithConfiguration:(id)a3 options:(id)a4 startTime:(double)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *, AVTAvatar *, double, double, double, double))a6;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  uint64_t v30 = 0;
  double v31 = (double *)&v30;
  uint64_t v32 = 0x4010000000;
  double v33 = &unk_20B8B3B5E;
  long long v12 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  long long v34 = *MEMORY[0x263F001A8];
  long long v35 = v12;
  uint64_t v13 = [v10 contentMode];
  char v14 = AVTPosterExpectsExtraTallContent(self->_avatar, v9);
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __90__AVTStickerGenerator__stickerImageWithConfiguration_options_startTime_completionHandler___block_invoke;
  float v22 = &unk_26401FB40;
  float v23 = self;
  id v15 = v9;
  id v24 = v15;
  id v16 = v10;
  id v25 = v16;
  double v26 = &v36;
  double v27 = &v30;
  BOOL v28 = v13 == 4;
  char v29 = v14;
  [(AVTStickerGenerator *)self applyConfiguration:v15 options:v16 snapshotBlock:&v19];
  if (v37[3])
  {
    objc_msgSend(v16, "scaleFactor", v19, v20, v21, v22, v23, v24);
    *(float *)&double v17 = v17;
    double v18 = [MEMORY[0x263F1C6B0] imageWithCGImage:v37[3] scale:0 orientation:*(float *)&v17];
    CGImageRelease((CGImageRef)v37[3]);
    v11[2](v11, v18, self->_avatar, v31[4], v31[5], v31[6], v31[7]);
  }
  else
  {
    v11[2](v11, 0, self->_avatar, v31[4], v31[5], v31[6], v31[7]);
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);
}

void __90__AVTStickerGenerator__stickerImageWithConfiguration_options_startTime_completionHandler___block_invoke(uint64_t a1)
{
  objc_super v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __90__AVTStickerGenerator__stickerImageWithConfiguration_options_startTime_completionHandler___block_invoke_2;
  v5[3] = &unk_26401FB18;
  id v6 = v4;
  long long v7 = *(_OWORD *)(a1 + 56);
  __int16 v8 = *(_WORD *)(a1 + 72);
  [v2 _snapshotAtTime:v3 configuration:v6 options:v5 completionBlock:0.0];
}

void __90__AVTStickerGenerator__stickerImageWithConfiguration_options_startTime_completionHandler___block_invoke_2(uint64_t a1, CGImage *a2, void *a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  id v21 = a3;
  if (a2)
  {
    if ([*(id *)(a1 + 32) contentMode] == 1 || objc_msgSend(*(id *)(a1 + 32), "contentMode") == 2)
    {
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __90__AVTStickerGenerator__stickerImageWithConfiguration_options_startTime_completionHandler___block_invoke_3;
      v32[3] = &unk_26401FAF0;
      long long v33 = *(_OWORD *)(a1 + 40);
      double v34 = a4;
      double v35 = a5;
      double v36 = a6;
      double v37 = a7;
      +[AVTImageUtilities cropImageWhitespace:outsideRect:insideRect:resultBlock:](AVTImageUtilities, "cropImageWhitespace:outsideRect:insideRect:resultBlock:", a2, v32, a4, a5, a6, a7, a8, a9, a10, a11);
    }
    else if ([*(id *)(a1 + 32) contentMode] == 3 || objc_msgSend(*(id *)(a1 + 32), "contentMode") == 4)
    {
      uint64_t v23 = *(void *)(a1 + 32);
      LODWORD(v22) = *(_DWORD *)(v23 + 24);
      uint64_t v24 = *(unsigned __int8 *)(a1 + 56);
      uint64_t v25 = *(unsigned __int8 *)(a1 + 57);
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __90__AVTStickerGenerator__stickerImageWithConfiguration_options_startTime_completionHandler___block_invoke_4;
      v26[3] = &unk_26401FAF0;
      long long v27 = *(_OWORD *)(a1 + 40);
      double v28 = a4;
      double v29 = a5;
      double v30 = a6;
      double v31 = a7;
      +[AVTImageUtilities posterWithStickerImage:posterSize:minimumHorizontalMargin:thumbnailRect:allowsExtraTallContent:expectsExtraTallContent:resultBlock:](AVTImageUtilities, "posterWithStickerImage:posterSize:minimumHorizontalMargin:thumbnailRect:allowsExtraTallContent:expectsExtraTallContent:resultBlock:", a2, v24, v25, v26, *(double *)(v23 + 8), *(double *)(v23 + 16), v22, a4, a5, a6, a7);
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CGImageRetain(a2);
    }
  }
}

double __90__AVTStickerGenerator__stickerImageWithConfiguration_options_startTime_completionHandler___block_invoke_3(uint64_t a1, CGImageRef image, double a3, double a4)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CGImageRetain(image);
  double result = *(double *)(a1 + 48) - a3;
  double v8 = *(double *)(a1 + 56) - a4;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v10 = *(_OWORD *)(a1 + 64);
  *(double *)(v9 + 32) = result;
  *(double *)(v9 + 40) = v8;
  *(_OWORD *)(v9 + 48) = v10;
  return result;
}

double __90__AVTStickerGenerator__stickerImageWithConfiguration_options_startTime_completionHandler___block_invoke_4(uint64_t a1, CGImageRef image, double a3, double a4)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CGImageRetain(image);
  double result = *(double *)(a1 + 48) - a3;
  double v8 = *(double *)(a1 + 56) - a4;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v10 = *(_OWORD *)(a1 + 64);
  *(double *)(v9 + 32) = result;
  *(double *)(v9 + 40) = v8;
  *(_OWORD *)(v9 + 48) = v10;
  return result;
}

- (void)stickerImageWithConfiguration:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CFTimeInterval v11 = CACurrentMediaTime();
  if (self->_async)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__AVTStickerGenerator_stickerImageWithConfiguration_options_completionHandler___block_invoke;
    block[3] = &unk_26401FB90;
    block[4] = self;
    id v42 = v8;
    id v43 = v9;
    CFTimeInterval v45 = v11;
    id v44 = v10;
    dispatch_async(workQueue, block);

    uint64_t v13 = v42;
  }
  else
  {
    uint64_t v35 = 0;
    double v36 = &v35;
    uint64_t v37 = 0x3032000000;
    uint64_t v38 = __Block_byref_object_copy__2;
    uint64_t v39 = __Block_byref_object_dispose__2;
    v40 = 0;
    uint64_t v29 = 0;
    double v30 = &v29;
    uint64_t v31 = 0x3032000000;
    uint64_t v32 = __Block_byref_object_copy__2;
    long long v33 = __Block_byref_object_dispose__2;
    id v34 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = (double *)&v23;
    uint64_t v25 = 0x4010000000;
    double v26 = &unk_20B8B3B5E;
    long long v14 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    long long v27 = *MEMORY[0x263F001A8];
    long long v28 = v14;
    id v15 = self->_workQueue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __79__AVTStickerGenerator_stickerImageWithConfiguration_options_completionHandler___block_invoke_115;
    v16[3] = &unk_26401FBE0;
    v16[4] = self;
    id v17 = v8;
    CFTimeInterval v22 = v11;
    id v18 = v9;
    uint64_t v19 = &v35;
    uint64_t v20 = &v29;
    id v21 = &v23;
    dispatch_sync(v15, v16);
    (*((void (**)(id, uint64_t, uint64_t, double, double, double, double))v10 + 2))(v10, v36[5], v30[5], v24[4], v24[5], v24[6], v24[7]);

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);

    _Block_object_dispose(&v35, 8);
    uint64_t v13 = v40;
  }
}

void __79__AVTStickerGenerator_stickerImageWithConfiguration_options_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_queue_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  double v3 = *(double *)(a1 + 64);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __79__AVTStickerGenerator_stickerImageWithConfiguration_options_completionHandler___block_invoke_2;
  v5[3] = &unk_26401FAC8;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v1 _stickerImageWithConfiguration:v2 options:v4 startTime:v5 completionHandler:v3];
}

void __79__AVTStickerGenerator_stickerImageWithConfiguration_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13 = a2;
  id v14 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__AVTStickerGenerator_stickerImageWithConfiguration_options_completionHandler___block_invoke_3;
  block[3] = &unk_26401FB68;
  id v15 = *(id *)(a1 + 32);
  id v20 = v14;
  id v21 = v15;
  id v19 = v13;
  double v22 = a4;
  double v23 = a5;
  double v24 = a6;
  double v25 = a7;
  id v16 = v14;
  id v17 = v13;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __79__AVTStickerGenerator_stickerImageWithConfiguration_options_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, double, double, double, double))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

uint64_t __79__AVTStickerGenerator_stickerImageWithConfiguration_options_completionHandler___block_invoke_115(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  double v4 = *(double *)(a1 + 80);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__AVTStickerGenerator_stickerImageWithConfiguration_options_completionHandler___block_invoke_2_116;
  v6[3] = &unk_26401FBB8;
  long long v7 = *(_OWORD *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 72);
  return [v2 _stickerImageWithConfiguration:v1 options:v3 startTime:v6 completionHandler:v4];
}

void __79__AVTStickerGenerator_stickerImageWithConfiguration_options_completionHandler___block_invoke_2_116(void *a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13 = a2;
  id v14 = a3;
  uint64_t v15 = *(void *)(a1[4] + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v13;
  id v21 = v13;

  uint64_t v17 = *(void *)(a1[5] + 8);
  id v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v14;
  id v19 = v14;

  id v20 = *(double **)(a1[6] + 8);
  v20[4] = a4;
  v20[5] = a5;
  v20[6] = a6;
  v20[7] = a7;
}

- (void)posterWithConfiguration:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  CFTimeInterval v11 = objc_alloc_init(AVTStickerGeneratorOptions);
  [v9 size];
  double v13 = v12 + v12;
  [v9 size];
  double v15 = v14 + v14;
  if (v13 >= v14 + v14) {
    double v15 = v13;
  }
  [(AVTStickerGeneratorOptions *)v11 setSize:v15];
  [v9 scaleFactor];
  -[AVTStickerGeneratorOptions setScaleFactor:](v11, "setScaleFactor:");
  if ([v9 growsForExtraTallContent]) {
    uint64_t v16 = 4;
  }
  else {
    uint64_t v16 = 3;
  }
  [(AVTStickerGeneratorOptions *)v11 setContentMode:v16];
  [(AVTStickerGeneratorOptions *)v11 sizeMultiplier];
  double v18 = v17;
  [(AVTStickerGeneratorOptions *)v11 scaleFactor];
  double v20 = v19;
  [v9 size];
  double v22 = v20 * (v18 * v21);
  [v9 size];
  v11->_posterSizeInPixels.width = (double)(unint64_t)v22;
  v11->_posterSizeInPixels.height = (double)(unint64_t)(v20 * (v18 * v23));
  [v9 minimumHorizontalMargin];
  double v25 = v24;

  float v26 = v20 * (v18 * v25);
  v11->_posterMinimumHorizontalMargiuint64_t n = v26;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __73__AVTStickerGenerator_posterWithConfiguration_options_completionHandler___block_invoke;
  v28[3] = &unk_26401FAC8;
  id v29 = v8;
  id v27 = v8;
  [(AVTStickerGenerator *)self stickerImageWithConfiguration:v10 options:v11 completionHandler:v28];
}

uint64_t __73__AVTStickerGenerator_posterWithConfiguration_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (AVTAvatar)avatar
{
  return self->_avatar;
}

- (BOOL)async
{
  return self->_async;
}

- (void)setAsync:(BOOL)a3
{
  self->_async = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_snapshotHelper, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

+ (void)applyViewTransitionConfiguration:(os_log_t)log toView:scope:options:duration:avatar:context:completionHandler:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "context";
}

@end