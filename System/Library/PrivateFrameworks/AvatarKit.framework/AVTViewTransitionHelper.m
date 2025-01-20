@interface AVTViewTransitionHelper
- (__n128)viewBackgroundColor;
- (id)initWithView:(id *)a1;
- (id)snapshotViewUsingBackgroundColor:(AVTViewTransitionHelper *)self;
- (id)transitionTechnique;
- (void)coordinator_performCrossFadeThenAnimateTransitionOutOfStickerConfigurationWithDuration:(double)a3 avatar:(id)a4 avatarNode:(id)a5 oldReversionContext:(id)a6;
- (void)coordinator_performCrossFadeThenAnimateTransitionToStickerConfiguration:(id)a3 duration:(double)a4 options:(unint64_t)a5 avatar:(id)a6 avatarNode:(id)a7 oldReversionContext:(id)a8;
- (void)coordinator_performCrossFadeTransitionOutOfStickerConfigurationWithDuration:(double)a3 avatar:(id)a4 avatarNode:(id)a5 oldReversionContext:(id)a6;
- (void)coordinator_performCrossFadeTransitionToStickerConfiguration:(id)a3 duration:(double)a4 options:(unint64_t)a5 avatar:(id)a6 avatarNode:(id)a7 oldReversionContext:(id)a8;
- (void)transitionCoordinatorOutOfStickerConfigurationWithDuration:(double)a3 style:(uint64_t)a4 options:(void *)a5 avatar:;
- (void)transitionCoordinatorToStickerConfiguration:(unint64_t)a3 duration:(uint64_t)a4 style:(void *)a5 options:(double)a6 avatar:;
- (void)transitionViewToStickerConfiguration:(void *)a3 fallbackPose:(unint64_t)a4 duration:(void *)a5 style:(void *)a6 avatar:(void *)a7 completionHandler:(double)a8 simultaneousAnimationsBlock:;
- (void)view_performAnimateThenCrossFadeTransitionFromStickerConfiguration:(id)a3 toStickerConfiguration:(id)a4 duration:(double)a5 avatar:(id)a6 avatarNode:(id)a7 oldReversionContext:(id)a8 completionHandler:(id)a9 simultaneousAnimationsBlock:(id)a10;
- (void)view_performCrossFadeThenAnimateTransitionToStickerConfiguration:(id)a3 fallbackPose:(id)a4 duration:(double)a5 avatar:(id)a6 avatarNode:(id)a7 oldReversionContext:(id)a8 completionHandler:(id)a9 simultaneousAnimationsBlock:(id)a10;
- (void)view_performCrossFadeTransitionToStickerConfiguration:(id)a3 fallbackPose:(id)a4 duration:(double)a5 avatar:(id)a6 avatarNode:(id)a7 oldReversionContext:(id)a8 completionHandler:(id)a9 simultaneousAnimationsBlock:(id)a10;
@end

@implementation AVTViewTransitionHelper

- (id)initWithView:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)AVTViewTransitionHelper;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4) {
      objc_storeWeak(v4 + 1, v3);
    }
  }

  return a1;
}

- (void)transitionViewToStickerConfiguration:(void *)a3 fallbackPose:(unint64_t)a4 duration:(void *)a5 style:(void *)a6 avatar:(void *)a7 completionHandler:(double)a8 simultaneousAnimationsBlock:
{
  unint64_t v16 = a2;
  unint64_t v17 = a3;
  id v18 = a5;
  v19 = a6;
  v20 = a7;
  if (a1)
  {
    uint64_t v69 = [v18 avatarNode];
    if (v17)
    {
      v21 = [v18 pose];
      char v22 = [v21 isEqualToPose:v17];
    }
    else
    {
      char v22 = 0;
    }
    unint64_t v23 = (unint64_t)a1[2];
    BOOL v24 = v23 != v16 || v16 == 0;
    if (!v24 || (v22 & 1) != 0 || !(v16 | v17 | v23))
    {
      if (v20) {
        v20[2](v20);
      }
      v30 = (void *)v69;
      if (v19) {
        v19[2](v19);
      }
      goto LABEL_60;
    }
    id v25 = (id)v23;
    objc_storeStrong(a1 + 2, a2);
    id v26 = a1[3];
    id v27 = a1[3];
    a1[3] = 0;

    if (!v16 && v25) {
      [v18 resetToPhysicsState:0 assumeRestStateIfNil:0];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v28 = v18;
      v29 = v28;
      v68 = v28;
      if (v16)
      {
        v78[0] = MEMORY[0x263EF8330];
        v78[1] = 3221225472;
        v78[2] = __145__AVTViewTransitionHelper_transitionViewToStickerConfiguration_fallbackPose_duration_style_avatar_completionHandler_simultaneousAnimationsBlock___block_invoke;
        v78[3] = &unk_26401F750;
        id v79 = (id)v16;
        [v29 setComponentAssetNodeObservationForStickerBlock:v78];
      }
      else
      {
        [v28 setComponentAssetNodeObservationForStickerBlock:0];
      }
    }
    else
    {
      v68 = 0;
    }
    if (a4) {
      unint64_t v31 = a4;
    }
    else {
      unint64_t v31 = 3;
    }
    if (a8 == 0.0)
    {
      [v18 removeDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:@"sticker-transition"];
      id WeakRetained = objc_loadWeakRetained(a1 + 1);
      [WeakRetained setAvtRendererTechnique:0];

      if (v26) {
        [v26 revertChangesWithScope:0 animationDuration:0.0];
      }
      [v18 stopTransitionAnimation];
      if (v16)
      {
        v33 = objc_alloc_init(AVTStickerConfigurationReversionContext);
        id v34 = a1[3];
        a1[3] = v33;

        id v35 = objc_loadWeakRetained(a1 + 1);
        +[AVTStickerGenerator applyViewTransitionConfiguration:v16 toView:v35 scope:0 options:0 duration:v18 avatar:a1[3] context:0.0 completionHandler:0];

        v30 = (void *)v69;
      }
      else
      {
        v30 = (void *)v69;
        if (v17) {
          [v18 setPose:v17];
        }
      }
      if (v20) {
        v20[2](v20);
      }
      if (v19) {
        v19[2](v19);
      }
      goto LABEL_59;
    }
    if (v25) {
      int v36 = [v25 definesPoseOnly] ^ 1;
    }
    else {
      int v36 = 0;
    }
    id v67 = v25;
    if (v16) {
      int v37 = [(id)v16 definesPoseOnly] ^ 1;
    }
    else {
      int v37 = 0;
    }
    if (v31 == 1) {
      char v38 = 1;
    }
    else {
      char v38 = v36;
    }
    if ((v38 & 1) == 0 && (v37 & 1) == 0)
    {
      [v18 removeDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:@"sticker-transition"];
      id v39 = objc_loadWeakRetained(a1 + 1);
      [v39 setAvtRendererTechnique:0];

      if (v16)
      {
        v40 = objc_alloc_init(AVTStickerConfigurationReversionContext);
        id v41 = a1[3];
        a1[3] = v40;

        id v63 = objc_loadWeakRetained(a1 + 1);
        id v64 = a1[3];
        v74[0] = MEMORY[0x263EF8330];
        v74[1] = 3221225472;
        v74[2] = __145__AVTViewTransitionHelper_transitionViewToStickerConfiguration_fallbackPose_duration_style_avatar_completionHandler_simultaneousAnimationsBlock___block_invoke_2;
        v74[3] = &unk_26401F778;
        v66 = &v75;
        id v42 = v18;
        id v75 = v42;
        v65 = &v76;
        id v43 = (id)v16;
        id v76 = v43;
        v44 = (id *)&v77;
        v77 = v19;
        +[AVTStickerGenerator applyViewTransitionConfiguration:v43 toView:v63 scope:0 options:0 duration:v42 avatar:v64 context:a8 completionHandler:v74];
      }
      else
      {
        v70[0] = MEMORY[0x263EF8330];
        v70[1] = 3221225472;
        v70[2] = __145__AVTViewTransitionHelper_transitionViewToStickerConfiguration_fallbackPose_duration_style_avatar_completionHandler_simultaneousAnimationsBlock___block_invoke_3;
        v70[3] = &unk_26401F778;
        v66 = &v71;
        id v45 = v18;
        id v71 = v45;
        v65 = &v72;
        id v46 = (id)v17;
        id v72 = v46;
        v44 = (id *)&v73;
        v73 = v19;
        [v45 transitionFromPose:0 toPose:v46 duration:v70 delay:a8 completionHandler:0.0];
      }
      id v25 = v67;

      v30 = (void *)v69;
      if (v20) {
        v20[2](v20);
      }
      [v26 revertChangesWithScope:0 animationDuration:a8];
      goto LABEL_59;
    }
    if (v31 <= 2 || (v36 & v37) == 1)
    {
      v30 = (void *)v69;
      objc_msgSend(a1, "view_performCrossFadeTransitionToStickerConfiguration:fallbackPose:duration:avatar:avatarNode:oldReversionContext:completionHandler:simultaneousAnimationsBlock:", v16, v17, v18, v69, v26, v19, a8, v20);
    }
    else
    {
      if (v31 != 3)
      {
        v47 = avt_default_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          -[AVTViewTransitionHelper transitionViewToStickerConfiguration:fallbackPose:duration:style:avatar:completionHandler:simultaneousAnimationsBlock:](v47, v48, v49, v50, v51, v52, v53, v54);
        }
      }
      if (v36)
      {
        v30 = (void *)v69;
        objc_msgSend(a1, "view_performCrossFadeThenAnimateTransitionToStickerConfiguration:fallbackPose:duration:avatar:avatarNode:oldReversionContext:completionHandler:simultaneousAnimationsBlock:", v16, v17, v18, v69, v26, v19, a8, v20);
      }
      else
      {
        if (v37)
        {
          id v25 = v67;
          v30 = (void *)v69;
          objc_msgSend(a1, "view_performAnimateThenCrossFadeTransitionFromStickerConfiguration:toStickerConfiguration:duration:avatar:avatarNode:oldReversionContext:completionHandler:simultaneousAnimationsBlock:", v67, v16, v18, v69, v26, v19, a8, v20);
          goto LABEL_59;
        }
        v55 = avt_default_log();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
          -[AVTViewTransitionHelper transitionViewToStickerConfiguration:fallbackPose:duration:style:avatar:completionHandler:simultaneousAnimationsBlock:](v55, v56, v57, v58, v59, v60, v61, v62);
        }

        v30 = (void *)v69;
      }
    }
    id v25 = v67;
LABEL_59:

LABEL_60:
  }
}

uint64_t __145__AVTViewTransitionHelper_transitionViewToStickerConfiguration_fallbackPose_duration_style_avatar_completionHandler_simultaneousAnimationsBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4) {
    return +[AVTStickerGenerator applyViewTransitionConfiguration:*(void *)(result + 32) forLateAdditionOfComponentAssetNode:a3 ofAvatar:a2];
  }
  return result;
}

uint64_t __145__AVTViewTransitionHelper_transitionViewToStickerConfiguration_fallbackPose_duration_style_avatar_completionHandler_simultaneousAnimationsBlock___block_invoke_2(uint64_t a1)
{
  v2 = +[AVTStickerGenerator poseByApplyingAdjustmentsForConfiguration:*(void *)(a1 + 40) avatar:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) setPose:v2];

  [*(id *)(a1 + 32) stopTransitionAnimation];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __145__AVTViewTransitionHelper_transitionViewToStickerConfiguration_fallbackPose_duration_style_avatar_completionHandler_simultaneousAnimationsBlock___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setPose:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) stopTransitionAnimation];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)transitionCoordinatorToStickerConfiguration:(unint64_t)a3 duration:(uint64_t)a4 style:(void *)a5 options:(double)a6 avatar:
{
  id v12 = a2;
  id v13 = a5;
  v14 = v13;
  if (a1)
  {
    v15 = [v13 avatarNode];
    if (a1[2])
    {
      unint64_t v16 = avt_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[AVTViewTransitionHelper transitionCoordinatorToStickerConfiguration:duration:style:options:avatar:](v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }
    objc_storeStrong(a1 + 2, a2);
    id v24 = a1[3];
    id v25 = a1[3];
    a1[3] = 0;

    if (!a3) {
      a3 = 3;
    }
    if (a6 == 0.0)
    {
      [v14 removeDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:@"sticker-transition"];
      id WeakRetained = objc_loadWeakRetained(a1 + 1);
      [WeakRetained setAvtRendererTechnique:0];

      if (v24) {
        [v24 revertChangesWithScope:0 animationDuration:0.0];
      }
      if (!v12) {
        goto LABEL_22;
      }
      id v27 = objc_alloc_init(AVTStickerConfigurationReversionContext);
      id v28 = a1[3];
      a1[3] = v27;

      id v29 = objc_loadWeakRetained(a1 + 1);
      +[AVTStickerGenerator applyViewTransitionConfiguration:v12 toView:v29 scope:0 options:a4 duration:v14 avatar:a1[3] context:0.0 completionHandler:0];
    }
    else
    {
      if (v12) {
        int v30 = [v12 definesPoseOnly];
      }
      else {
        int v30 = 1;
      }
      if (a3 == 1 || !v30)
      {
        if (a3 > 2)
        {
          if (a3 == 3)
          {
            objc_msgSend(a1, "coordinator_performCrossFadeThenAnimateTransitionToStickerConfiguration:duration:options:avatar:avatarNode:oldReversionContext:", v12, a4, v14, v15, v24, a6);
          }
          else
          {
            id v34 = avt_default_log();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              -[AVTViewTransitionHelper transitionViewToStickerConfiguration:fallbackPose:duration:style:avatar:completionHandler:simultaneousAnimationsBlock:](v34, v35, v36, v37, v38, v39, v40, v41);
            }
          }
        }
        else
        {
          objc_msgSend(a1, "coordinator_performCrossFadeTransitionToStickerConfiguration:duration:options:avatar:avatarNode:oldReversionContext:", v12, a4, v14, v15, v24, a6);
        }
        goto LABEL_22;
      }
      [v14 removeDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:@"sticker-transition"];
      id v31 = objc_loadWeakRetained(a1 + 1);
      [v31 setAvtRendererTechnique:0];

      if (v24) {
        [v24 revertChangesWithScope:0 animationDuration:a6];
      }
      v32 = objc_alloc_init(AVTStickerConfigurationReversionContext);
      id v33 = a1[3];
      a1[3] = v32;

      id v29 = objc_loadWeakRetained(a1 + 1);
      +[AVTStickerGenerator applyViewTransitionConfiguration:v12 toView:v29 scope:0 options:a4 duration:v14 avatar:a1[3] context:a6 completionHandler:0];
    }

LABEL_22:
  }
}

- (void)transitionCoordinatorOutOfStickerConfigurationWithDuration:(double)a3 style:(uint64_t)a4 options:(void *)a5 avatar:
{
  id v8 = a5;
  v9 = v8;
  if (a1)
  {
    v10 = [v8 avatarNode];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v9;
      [v11 setComponentAssetNodeObservationForStickerBlock:0];
    }
    else
    {
      id v11 = 0;
    }
    id v12 = a1[2];
    id v13 = a1[2];
    a1[2] = 0;

    id v14 = a1[3];
    id v15 = a1[3];
    a1[3] = 0;

    if (!a2) {
      a2 = 3;
    }
    if (v12) {
      int v16 = [v12 definesPoseOnly];
    }
    else {
      int v16 = 1;
    }
    if (a2 == 1 || !v16)
    {
      if (a2 > 2)
      {
        if (a2 == 3)
        {
          objc_msgSend(a1, "coordinator_performCrossFadeThenAnimateTransitionOutOfStickerConfigurationWithDuration:avatar:avatarNode:oldReversionContext:", v9, v10, v14, a3);
        }
        else
        {
          uint64_t v17 = avt_default_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            -[AVTViewTransitionHelper transitionViewToStickerConfiguration:fallbackPose:duration:style:avatar:completionHandler:simultaneousAnimationsBlock:](v17, v18, v19, v20, v21, v22, v23, v24);
          }
        }
      }
      else
      {
        objc_msgSend(a1, "coordinator_performCrossFadeTransitionOutOfStickerConfigurationWithDuration:avatar:avatarNode:oldReversionContext:", v9, v10, v14, a3);
      }
    }
    else
    {
      [v14 revertChangesWithScope:0 animationDuration:a3];
    }
  }
}

- (void)view_performCrossFadeTransitionToStickerConfiguration:(id)a3 fallbackPose:(id)a4 duration:(double)a5 avatar:(id)a6 avatarNode:(id)a7 oldReversionContext:(id)a8 completionHandler:(id)a9 simultaneousAnimationsBlock:(id)a10
{
  id v44 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v43 = a8;
  id v41 = a9;
  id v20 = a10;
  objc_initWeak(location, self);
  objc_copyWeak(&to, (id *)&self->_view);
  uint64_t v21 = [(AVTViewTransitionHelper *)self transitionTechnique];
  if (!v21)
  {
    uint64_t v22 = avt_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[AVTViewTransitionHelper view_performCrossFadeTransitionToStickerConfiguration:fallbackPose:duration:avatar:avatarNode:oldReversionContext:completionHandler:simultaneousAnimationsBlock:](v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }
  [v21 setFramebufferTextureOpacity:0.0];
  uint64_t v40 = v19;
  [(AVTViewTransitionHelper *)self viewBackgroundColor];
  long long v39 = v30;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v32 = [WeakRetained renderer];
  id v33 = [v32 _renderingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __187__AVTViewTransitionHelper_view_performCrossFadeTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke;
  block[3] = &unk_26401F7F0;
  objc_copyWeak(&v54, location);
  objc_copyWeak(v55, &to);
  long long v46 = v39;
  id v47 = v21;
  id v48 = v43;
  id v49 = v18;
  id v50 = v44;
  id v51 = v17;
  id v52 = v20;
  v55[1] = *(id *)&a5;
  int v56 = 0;
  id v53 = v41;
  id v42 = v41;
  *(void *)&long long v39 = v20;
  id v34 = v17;
  id v35 = v44;
  id v36 = v18;
  id v37 = v43;
  id v38 = v21;
  dispatch_async(v33, block);

  objc_destroyWeak(v55);
  objc_destroyWeak(&v54);
  objc_destroyWeak(&to);
  objc_destroyWeak(location);
}

void __187__AVTViewTransitionHelper_view_performCrossFadeTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  id v3 = objc_loadWeakRetained((id *)(a1 + 112));
  v4 = v3;
  if (WeakRetained && v3)
  {
    [v3 setAvtRendererTechnique:0];
    v5 = [WeakRetained snapshotViewUsingBackgroundColor:*(double *)(a1 + 32)];
    if (v5)
    {
      [*(id *)(a1 + 48) setSnapshotTexture:v5];
      [v4 setAvtRendererTechnique:*(void *)(a1 + 48)];
    }
    [*(id *)(a1 + 56) revertChangesWithScope:0 animationDuration:0.0];
    [*(id *)(a1 + 64) stopTransitionAnimation];
    if (*(void *)(a1 + 72))
    {
      objc_super v6 = objc_alloc_init(AVTStickerConfigurationReversionContext);
      v7 = (void *)WeakRetained[3];
      WeakRetained[3] = v6;
      id v8 = v6;

      +[AVTStickerGenerator applyViewTransitionConfiguration:*(void *)(a1 + 72) toView:v4 scope:0 options:0 duration:*(void *)(a1 + 64) avatar:v8 context:0.0 completionHandler:0];
    }
    else
    {
      [*(id *)(a1 + 64) setPose:*(void *)(a1 + 80)];
    }
    [MEMORY[0x263F16B08] flush];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __187__AVTViewTransitionHelper_view_performCrossFadeTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_2;
    block[3] = &unk_26401F7C8;
    id v14 = *(id *)(a1 + 88);
    id v10 = *(id *)(a1 + 64);
    v16[1] = *(id *)(a1 + 120);
    int v17 = *(_DWORD *)(a1 + 128);
    id v11 = *(id *)(a1 + 48);
    objc_copyWeak(v16, (id *)(a1 + 112));
    id v12 = *(id *)(a1 + 72);
    id v13 = *(id *)(a1 + 80);
    id v15 = *(id *)(a1 + 96);
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(v16);
  }
}

void __187__AVTViewTransitionHelper_view_performCrossFadeTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __187__AVTViewTransitionHelper_view_performCrossFadeTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_3;
  v6[3] = &unk_26401F7A0;
  v12[1] = *(id *)(a1 + 88);
  id v5 = v3;
  id v7 = v5;
  int v13 = *(_DWORD *)(a1 + 96);
  id v8 = *(id *)(a1 + 40);
  objc_copyWeak(v12, (id *)(a1 + 80));
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 72);
  [v4 addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:@"sticker-transition" block:v6];

  objc_destroyWeak(v12);
}

void __187__AVTViewTransitionHelper_view_performCrossFadeTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_3(uint64_t a1, void *a2, double a3, double a4, uint64_t a5, unsigned char *a6)
{
  id v19 = a2;
  double v10 = (a3 - a4) / *(double *)(a1 + 80);
  *(float *)&double v10 = v10;
  *(float *)&a4 = fmaxf(fminf(*(float *)&v10, 1.0), 0.0);
  LODWORD(v10) = LODWORD(a4);
  [*(id *)(a1 + 32) _solveForInput:v10];
  *(float *)&double v12 = *(float *)(a1 + 88) + (float)(v11 * (float)(1.0 - *(float *)(a1 + 88)));
  [*(id *)(a1 + 40) setFramebufferTextureOpacity:v12];
  if (*(float *)&a4 >= 1.0)
  {
    *a6 = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    id v14 = WeakRetained;
    if (WeakRetained)
    {
      id v15 = [WeakRetained avtRendererTechnique];
      int v16 = *(void **)(a1 + 40);

      if (v15 == v16) {
        [v14 setAvtRendererTechnique:0];
      }
    }
    int v17 = +[AVTStickerGenerator poseByApplyingAdjustmentsForConfiguration:*(void *)(a1 + 48) avatar:v19];
    id v18 = v17;
    if (!v17) {
      id v18 = *(void **)(a1 + 56);
    }
    [v19 setPose:v18];

    [v19 stopTransitionAnimation];
    if (*(void *)(a1 + 64)) {
      dispatch_async(MEMORY[0x263EF83A0], *(dispatch_block_t *)(a1 + 64));
    }
  }
}

- (void)coordinator_performCrossFadeTransitionToStickerConfiguration:(id)a3 duration:(double)a4 options:(unint64_t)a5 avatar:(id)a6 avatarNode:(id)a7 oldReversionContext:(id)a8
{
  id v13 = a8;
  id v14 = a6;
  id v15 = a3;
  int v16 = [(AVTViewTransitionHelper *)self transitionTechnique];
  if (!v16)
  {
    int v17 = avt_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[AVTViewTransitionHelper view_performCrossFadeTransitionToStickerConfiguration:fallbackPose:duration:avatar:avatarNode:oldReversionContext:completionHandler:simultaneousAnimationsBlock:](v17, v18, v19, v20, v21, v22, v23, v24);
    }
  }
  [v16 setFramebufferTextureOpacity:0.0];
  [(AVTViewTransitionHelper *)self viewBackgroundColor];
  long long v36 = v25;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  uint64_t v27 = [WeakRetained renderer];
  uint64_t v28 = [v27 _renderingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __143__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke;
  block[3] = &unk_26401F818;
  id v43 = self;
  long long v42 = v36;
  id v29 = v16;
  id v44 = v29;
  dispatch_sync(v28, block);

  [v13 revertChangesWithScope:0 animationDuration:0.0];
  long long v30 = objc_alloc_init(AVTStickerConfigurationReversionContext);
  stickerTransitionReversionContext = self->_stickerTransitionReversionContext;
  self->_stickerTransitionReversionContext = v30;

  id v32 = objc_loadWeakRetained((id *)&self->_view);
  +[AVTStickerGenerator applyViewTransitionConfiguration:v15 toView:v32 scope:0 options:a5 duration:v14 avatar:self->_stickerTransitionReversionContext context:a4 completionHandler:0];

  id v33 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __143__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke_2;
  v37[3] = &unk_26401F840;
  double v40 = a4;
  id v38 = v33;
  id v39 = v29;
  id v34 = v29;
  id v35 = v33;
  [v14 addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:@"sticker-transition" block:v37];
}

void __143__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained setAvtRendererTechnique:0];
    id v3 = [*(id *)(a1 + 48) snapshotViewUsingBackgroundColor:*(double *)(a1 + 32)];
    if (v3)
    {
      [*(id *)(a1 + 56) setSnapshotTexture:v3];
      [v4 setAvtRendererTechnique:*(void *)(a1 + 56)];
      [MEMORY[0x263F16B08] flush];
    }

    id WeakRetained = v4;
  }
}

void __143__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke_2(uint64_t a1, double a2, double a3, uint64_t a4, void *a5, unsigned char *a6)
{
  id v10 = a5;
  double v11 = (a2 - a3) / *(double *)(a1 + 48);
  *(float *)&double v11 = v11;
  *(float *)&a3 = fmaxf(fminf(*(float *)&v11, 1.0), 0.0);
  LODWORD(v11) = LODWORD(a3);
  [*(id *)(a1 + 32) _solveForInput:v11];
  *(float *)&double v13 = v12 + 0.0;
  [*(id *)(a1 + 40) setFramebufferTextureOpacity:v13];
  if (*(float *)&a3 >= 1.0)
  {
    *a6 = 1;
    if ([v10 conformsToProtocol:&unk_26C067FE8])
    {
      id v14 = v10;
      id v15 = [v14 avtRendererTechnique];
      int v16 = *(void **)(a1 + 40);

      if (v15 == v16) {
        [v14 setAvtRendererTechnique:0];
      }
    }
    else
    {
      int v17 = avt_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __143__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke_2_cold_1();
      }
    }
  }
}

- (void)coordinator_performCrossFadeTransitionOutOfStickerConfigurationWithDuration:(double)a3 avatar:(id)a4 avatarNode:(id)a5 oldReversionContext:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  double v11 = [(AVTViewTransitionHelper *)self transitionTechnique];
  if (!v11)
  {
    float v12 = avt_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[AVTViewTransitionHelper view_performCrossFadeTransitionToStickerConfiguration:fallbackPose:duration:avatar:avatarNode:oldReversionContext:completionHandler:simultaneousAnimationsBlock:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  [v11 setFramebufferTextureOpacity:0.0];
  [(AVTViewTransitionHelper *)self viewBackgroundColor];
  long long v28 = v20;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  uint64_t v22 = [WeakRetained renderer];
  uint64_t v23 = [v22 _renderingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __141__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionOutOfStickerConfigurationWithDuration_avatar_avatarNode_oldReversionContext___block_invoke;
  block[3] = &unk_26401F818;
  id v35 = self;
  long long v34 = v28;
  id v24 = v11;
  id v36 = v24;
  dispatch_sync(v23, block);

  [v9 revertChangesWithScope:0 animationDuration:0.0];
  long long v25 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __141__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionOutOfStickerConfigurationWithDuration_avatar_avatarNode_oldReversionContext___block_invoke_2;
  v29[3] = &unk_26401F840;
  double v32 = a3;
  id v30 = v25;
  id v31 = v24;
  id v26 = v24;
  id v27 = v25;
  [v10 addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:@"sticker-transition" block:v29];
}

void __141__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionOutOfStickerConfigurationWithDuration_avatar_avatarNode_oldReversionContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained setAvtRendererTechnique:0];
    id v3 = [*(id *)(a1 + 48) snapshotViewUsingBackgroundColor:*(double *)(a1 + 32)];
    if (v3)
    {
      [*(id *)(a1 + 56) setSnapshotTexture:v3];
      [v4 setAvtRendererTechnique:*(void *)(a1 + 56)];
      [MEMORY[0x263F16B08] flush];
    }

    id WeakRetained = v4;
  }
}

void __141__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionOutOfStickerConfigurationWithDuration_avatar_avatarNode_oldReversionContext___block_invoke_2(uint64_t a1, double a2, double a3, uint64_t a4, void *a5, unsigned char *a6)
{
  id v10 = a5;
  double v11 = (a2 - a3) / *(double *)(a1 + 48);
  *(float *)&double v11 = v11;
  *(float *)&a3 = fmaxf(fminf(*(float *)&v11, 1.0), 0.0);
  LODWORD(v11) = LODWORD(a3);
  [*(id *)(a1 + 32) _solveForInput:v11];
  *(float *)&double v13 = v12 + 0.0;
  [*(id *)(a1 + 40) setFramebufferTextureOpacity:v13];
  if (*(float *)&a3 >= 1.0)
  {
    *a6 = 1;
    if ([v10 conformsToProtocol:&unk_26C067FE8])
    {
      id v14 = v10;
      uint64_t v15 = [v14 avtRendererTechnique];
      uint64_t v16 = *(void **)(a1 + 40);

      if (v15 == v16) {
        [v14 setAvtRendererTechnique:0];
      }
    }
    else
    {
      uint64_t v17 = avt_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __143__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke_2_cold_1();
      }
    }
  }
}

- (void)view_performCrossFadeThenAnimateTransitionToStickerConfiguration:(id)a3 fallbackPose:(id)a4 duration:(double)a5 avatar:(id)a6 avatarNode:(id)a7 oldReversionContext:(id)a8 completionHandler:(id)a9 simultaneousAnimationsBlock:(id)a10
{
  id v43 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  objc_initWeak(location, self);
  objc_copyWeak(&to, (id *)&self->_view);
  uint64_t v23 = [(AVTViewTransitionHelper *)self transitionTechnique];
  if (!v23)
  {
    id v24 = avt_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[AVTViewTransitionHelper view_performCrossFadeTransitionToStickerConfiguration:fallbackPose:duration:avatar:avatarNode:oldReversionContext:completionHandler:simultaneousAnimationsBlock:](v24, v25, v26, v27, v28, v29, v30, v31);
    }
  }
  [v23 setFramebufferTextureOpacity:0.0];
  long long v42 = v19;
  [(AVTViewTransitionHelper *)self viewBackgroundColor];
  long long v41 = v32;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  long long v34 = [WeakRetained renderer];
  id v35 = [v34 _renderingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __198__AVTViewTransitionHelper_view_performCrossFadeThenAnimateTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke;
  block[3] = &unk_26401F8B8;
  objc_copyWeak(&v54, location);
  objc_copyWeak(v55, &to);
  long long v46 = v41;
  id v47 = v23;
  id v48 = v20;
  v55[1] = *(id *)&a5;
  int v56 = 0;
  id v49 = v18;
  id v50 = v43;
  id v51 = v17;
  id v52 = v22;
  id v53 = v21;
  *(void *)&long long v41 = v21;
  id v40 = v17;
  id v44 = v43;
  id v36 = v18;
  id v37 = v22;
  id v38 = v20;
  id v39 = v23;
  dispatch_async(v35, block);

  objc_destroyWeak(v55);
  objc_destroyWeak(&v54);
  objc_destroyWeak(&to);
  objc_destroyWeak(location);
}

void __198__AVTViewTransitionHelper_view_performCrossFadeThenAnimateTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  id v3 = objc_loadWeakRetained((id *)(a1 + 112));
  id v4 = v3;
  if (WeakRetained && v3)
  {
    [v3 setAvtRendererTechnique:0];
    id v5 = [WeakRetained snapshotViewUsingBackgroundColor:*(double *)(a1 + 32)];
    if (v5)
    {
      [*(id *)(a1 + 48) setSnapshotTexture:v5];
      [v4 setAvtRendererTechnique:*(void *)(a1 + 48)];
    }
    [*(id *)(a1 + 56) revertChangesWithScope:1 animationDuration:0.0];
    [MEMORY[0x263F16B08] flush];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __198__AVTViewTransitionHelper_view_performCrossFadeThenAnimateTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_2;
    v6[3] = &unk_26401F890;
    id v14 = *(id *)(a1 + 88);
    id v7 = *(id *)(a1 + 64);
    v16[1] = *(id *)(a1 + 120);
    int v17 = *(_DWORD *)(a1 + 128);
    id v8 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 72);
    id v10 = WeakRetained;
    id v11 = v4;
    id v12 = *(id *)(a1 + 80);
    id v13 = *(id *)(a1 + 56);
    objc_copyWeak(v16, (id *)(a1 + 112));
    id v15 = *(id *)(a1 + 96);
    dispatch_async(MEMORY[0x263EF83A0], v6);

    objc_destroyWeak(v16);
  }
}

void __198__AVTViewTransitionHelper_view_performCrossFadeThenAnimateTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  id v3 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  id v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __198__AVTViewTransitionHelper_view_performCrossFadeThenAnimateTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_3;
  v9[3] = &unk_26401F868;
  v19[1] = *(id *)(a1 + 112);
  id v5 = v3;
  id v10 = v5;
  int v20 = *(_DWORD *)(a1 + 120);
  id v11 = *(id *)(a1 + 40);
  id v18 = v21;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v8 = *(void **)(a1 + 64);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v8;
  id v15 = *(id *)(a1 + 72);
  id v16 = *(id *)(a1 + 80);
  objc_copyWeak(v19, (id *)(a1 + 104));
  id v17 = *(id *)(a1 + 96);
  [v4 addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:@"sticker-transition" block:v9];

  objc_destroyWeak(v19);
  _Block_object_dispose(v21, 8);
}

void __198__AVTViewTransitionHelper_view_performCrossFadeThenAnimateTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_3(uint64_t a1, void *a2, double a3, double a4, uint64_t a5, unsigned char *a6)
{
  id v28 = a2;
  double v10 = (a3 - a4) / *(double *)(a1 + 112);
  *(float *)&double v10 = v10;
  float v11 = fmaxf(fminf(*(float *)&v10, 1.0), 0.0);
  *(float *)&double v10 = v11;
  [*(id *)(a1 + 32) _solveForInput:v10];
  *(float *)&double v13 = *(float *)(a1 + 120)
                 + (float)(fminf(fmaxf(v12 / 0.75, 0.0), 1.0) * (float)(1.0 - *(float *)(a1 + 120)));
  [*(id *)(a1 + 40) setFramebufferTextureOpacity:v13];
  if (v11 >= 0.25)
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 96) + 8);
    if (!*(unsigned char *)(v14 + 24))
    {
      *(unsigned char *)(v14 + 24) = 1;
      float v15 = *(double *)(a1 + 112) * 0.75;
      if (*(void *)(a1 + 48))
      {
        id v16 = objc_alloc_init(AVTStickerConfigurationReversionContext);
        uint64_t v17 = *(void *)(a1 + 56);
        id v18 = *(void **)(v17 + 24);
        *(void *)(v17 + 24) = v16;
        id v19 = v16;

        double v20 = v15;
        +[AVTStickerGenerator applyViewTransitionConfiguration:*(void *)(a1 + 48) toView:*(void *)(a1 + 64) scope:0 options:0 duration:v28 avatar:v19 context:v20 completionHandler:0];
      }
      else
      {
        double v20 = v15;
        [v28 transitionFromPose:0 toPose:*(void *)(a1 + 72) duration:0 delay:v20 completionHandler:0.0];
      }
      [*(id *)(a1 + 80) revertChangesWithScope:0 animationDuration:v20];
    }
  }
  if (v11 >= 1.0)
  {
    *a6 = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    char v22 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v23 = [WeakRetained avtRendererTechnique];
      id v24 = *(void **)(a1 + 40);

      if (v23 == v24) {
        [v22 setAvtRendererTechnique:0];
      }
    }
    uint64_t v25 = *(void **)(a1 + 48);
    if (v25)
    {
      uint64_t v26 = [v25 physicalizedPose];
      uint64_t v27 = [v26 pose];
      [v28 setPose:v27];
    }
    else
    {
      [v28 setPose:*(void *)(a1 + 72)];
    }
    [v28 stopTransitionAnimation];
    if (*(void *)(a1 + 88)) {
      dispatch_async(MEMORY[0x263EF83A0], *(dispatch_block_t *)(a1 + 88));
    }
  }
}

- (void)coordinator_performCrossFadeThenAnimateTransitionToStickerConfiguration:(id)a3 duration:(double)a4 options:(unint64_t)a5 avatar:(id)a6 avatarNode:(id)a7 oldReversionContext:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v43 = a7;
  id v16 = a8;
  uint64_t v17 = [(AVTViewTransitionHelper *)self transitionTechnique];
  if (!v17)
  {
    id v18 = avt_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[AVTViewTransitionHelper view_performCrossFadeTransitionToStickerConfiguration:fallbackPose:duration:avatar:avatarNode:oldReversionContext:completionHandler:simultaneousAnimationsBlock:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
  [v17 setFramebufferTextureOpacity:0.0];
  [(AVTViewTransitionHelper *)self viewBackgroundColor];
  long long v44 = v26;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v28 = [WeakRetained renderer];
  uint64_t v29 = [v28 _renderingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __154__AVTViewTransitionHelper_coordinator_performCrossFadeThenAnimateTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke;
  block[3] = &unk_26401F818;
  v55 = self;
  long long v54 = v44;
  id v30 = v17;
  id v56 = v30;
  dispatch_sync(v29, block);

  [v16 revertChangesWithScope:1 animationDuration:0.0];
  dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  char v52 = 0;
  long long v32 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __154__AVTViewTransitionHelper_coordinator_performCrossFadeThenAnimateTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke_2;
  v45[3] = &unk_26401F8E0;
  double v50 = a4;
  id v33 = v32;
  id v46 = v33;
  id v34 = v30;
  id v47 = v34;
  id v49 = v51;
  id v35 = v31;
  id v48 = v35;
  [v15 addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:@"sticker-transition" block:v45];
  float v36 = fmin(a4 * 10.0, 2.0);
  dispatch_time_t v37 = dispatch_time(0, (uint64_t)(float)(v36 * 1000000000.0));
  dispatch_semaphore_wait(v35, v37);
  id v38 = objc_alloc_init(AVTStickerConfigurationReversionContext);
  stickerTransitionReversionContext = self->_stickerTransitionReversionContext;
  self->_stickerTransitionReversionContext = v38;

  id v41 = objc_loadWeakRetained((id *)&self->_view);
  float v39 = a4 * 0.75;
  double v42 = v39;
  +[AVTStickerGenerator applyViewTransitionConfiguration:v14 toView:v41 scope:0 options:a5 duration:v15 avatar:self->_stickerTransitionReversionContext context:v42 completionHandler:0];

  [v16 revertChangesWithScope:0 animationDuration:v42];
  _Block_object_dispose(v51, 8);
}

void __154__AVTViewTransitionHelper_coordinator_performCrossFadeThenAnimateTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained setAvtRendererTechnique:0];
    id v3 = [*(id *)(a1 + 48) snapshotViewUsingBackgroundColor:*(double *)(a1 + 32)];
    if (v3)
    {
      [*(id *)(a1 + 56) setSnapshotTexture:v3];
      [v4 setAvtRendererTechnique:*(void *)(a1 + 56)];
      [MEMORY[0x263F16B08] flush];
    }

    id WeakRetained = v4;
  }
}

void __154__AVTViewTransitionHelper_coordinator_performCrossFadeThenAnimateTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke_2(uint64_t a1, double a2, double a3, uint64_t a4, void *a5, unsigned char *a6)
{
  id v10 = a5;
  double v11 = (a2 - a3) / *(double *)(a1 + 64);
  *(float *)&double v11 = v11;
  float v12 = fmaxf(fminf(*(float *)&v11, 1.0), 0.0);
  *(float *)&double v11 = v12;
  [*(id *)(a1 + 32) _solveForInput:v11];
  *(float *)&double v14 = fminf(fmaxf(v13 / 0.75, 0.0), 1.0) + 0.0;
  [*(id *)(a1 + 40) setFramebufferTextureOpacity:v14];
  if (v12 >= 0.25)
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    if (!*(unsigned char *)(v15 + 24))
    {
      *(unsigned char *)(v15 + 24) = 1;
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
    }
  }
  if (v12 >= 1.0)
  {
    *a6 = 1;
    if ([v10 conformsToProtocol:&unk_26C067FE8])
    {
      id v16 = v10;
      uint64_t v17 = [v16 avtRendererTechnique];
      id v18 = *(void **)(a1 + 40);

      if (v17 == v18) {
        [v16 setAvtRendererTechnique:0];
      }
    }
    else
    {
      uint64_t v19 = avt_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __143__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke_2_cold_1();
      }
    }
  }
}

- (void)coordinator_performCrossFadeThenAnimateTransitionOutOfStickerConfigurationWithDuration:(double)a3 avatar:(id)a4 avatarNode:(id)a5 oldReversionContext:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  float v13 = [(AVTViewTransitionHelper *)self transitionTechnique];
  if (!v13)
  {
    double v14 = avt_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[AVTViewTransitionHelper view_performCrossFadeTransitionToStickerConfiguration:fallbackPose:duration:avatar:avatarNode:oldReversionContext:completionHandler:simultaneousAnimationsBlock:](v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  [v13 setFramebufferTextureOpacity:0.0];
  [(AVTViewTransitionHelper *)self viewBackgroundColor];
  long long v35 = v22;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  uint64_t v24 = [WeakRetained renderer];
  uint64_t v25 = [v24 _renderingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __152__AVTViewTransitionHelper_coordinator_performCrossFadeThenAnimateTransitionOutOfStickerConfigurationWithDuration_avatar_avatarNode_oldReversionContext___block_invoke;
  block[3] = &unk_26401F818;
  id v46 = self;
  long long v45 = v35;
  id v26 = v13;
  id v47 = v26;
  dispatch_sync(v25, block);

  [v12 revertChangesWithScope:1 animationDuration:0.0];
  dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 0;
  id v28 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __152__AVTViewTransitionHelper_coordinator_performCrossFadeThenAnimateTransitionOutOfStickerConfigurationWithDuration_avatar_avatarNode_oldReversionContext___block_invoke_2;
  v36[3] = &unk_26401F8E0;
  double v41 = a3;
  id v29 = v28;
  id v37 = v29;
  id v30 = v26;
  id v38 = v30;
  id v40 = v42;
  dispatch_semaphore_t v31 = v27;
  float v39 = v31;
  [v10 addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:@"sticker-transition" block:v36];
  float v32 = fmin(a3 * 10.0, 2.0);
  dispatch_time_t v33 = dispatch_time(0, (uint64_t)(float)(v32 * 1000000000.0));
  dispatch_semaphore_wait(v31, v33);
  float v34 = a3 * 0.75;
  [v12 revertChangesWithScope:0 animationDuration:v34];

  _Block_object_dispose(v42, 8);
}

void __152__AVTViewTransitionHelper_coordinator_performCrossFadeThenAnimateTransitionOutOfStickerConfigurationWithDuration_avatar_avatarNode_oldReversionContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained setAvtRendererTechnique:0];
    id v3 = [*(id *)(a1 + 48) snapshotViewUsingBackgroundColor:*(double *)(a1 + 32)];
    if (v3)
    {
      [*(id *)(a1 + 56) setSnapshotTexture:v3];
      [v4 setAvtRendererTechnique:*(void *)(a1 + 56)];
      [MEMORY[0x263F16B08] flush];
    }

    id WeakRetained = v4;
  }
}

void __152__AVTViewTransitionHelper_coordinator_performCrossFadeThenAnimateTransitionOutOfStickerConfigurationWithDuration_avatar_avatarNode_oldReversionContext___block_invoke_2(uint64_t a1, double a2, double a3, uint64_t a4, void *a5, unsigned char *a6)
{
  id v10 = a5;
  double v11 = (a2 - a3) / *(double *)(a1 + 64);
  *(float *)&double v11 = v11;
  float v12 = fmaxf(fminf(*(float *)&v11, 1.0), 0.0);
  *(float *)&double v11 = v12;
  [*(id *)(a1 + 32) _solveForInput:v11];
  *(float *)&double v14 = fminf(fmaxf(v13 / 0.75, 0.0), 1.0) + 0.0;
  [*(id *)(a1 + 40) setFramebufferTextureOpacity:v14];
  if (v12 >= 0.25)
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    if (!*(unsigned char *)(v15 + 24))
    {
      *(unsigned char *)(v15 + 24) = 1;
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
    }
  }
  if (v12 >= 1.0)
  {
    *a6 = 1;
    if ([v10 conformsToProtocol:&unk_26C067FE8])
    {
      id v16 = v10;
      uint64_t v17 = [v16 avtRendererTechnique];
      uint64_t v18 = *(void **)(a1 + 40);

      if (v17 == v18) {
        [v16 setAvtRendererTechnique:0];
      }
    }
    else
    {
      uint64_t v19 = avt_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __143__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke_2_cold_1();
      }
    }
  }
}

- (void)view_performAnimateThenCrossFadeTransitionFromStickerConfiguration:(id)a3 toStickerConfiguration:(id)a4 duration:(double)a5 avatar:(id)a6 avatarNode:(id)a7 oldReversionContext:(id)a8 completionHandler:(id)a9 simultaneousAnimationsBlock:(id)a10
{
  id v41 = a3;
  id v43 = a4;
  id v17 = a6;
  id v44 = a7;
  id v42 = a8;
  id v18 = a9;
  id v19 = a10;
  uint64_t v20 = [(AVTViewTransitionHelper *)self transitionTechnique];
  if (!v20)
  {
    uint64_t v21 = avt_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[AVTViewTransitionHelper view_performCrossFadeTransitionToStickerConfiguration:fallbackPose:duration:avatar:avatarNode:oldReversionContext:completionHandler:simultaneousAnimationsBlock:](v21, v22, v23, v24, v25, v26, v27, v28);
    }
  }
  [(AVTViewTransitionHelper *)self viewBackgroundColor];
  long long v40 = v29;
  objc_initWeak(location, self);
  p_view = &self->_view;
  objc_copyWeak(&to, (id *)p_view);
  id WeakRetained = objc_loadWeakRetained((id *)p_view);
  float v32 = [WeakRetained renderer];
  dispatch_time_t v33 = [v32 _renderingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __210__AVTViewTransitionHelper_view_performAnimateThenCrossFadeTransitionFromStickerConfiguration_toStickerConfiguration_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke;
  block[3] = &unk_26401F958;
  objc_copyWeak(&v54, location);
  objc_copyWeak(v55, &to);
  id v47 = v17;
  id v48 = v42;
  long long v46 = v40;
  id v49 = v43;
  id v50 = v20;
  v55[1] = *(id *)&a5;
  id v51 = v41;
  id v52 = v19;
  id v53 = v18;
  *(void *)&long long v40 = v18;
  id v39 = v19;
  id v34 = v41;
  id v35 = v20;
  id v36 = v43;
  id v37 = v42;
  id v38 = v17;
  dispatch_async(v33, block);

  objc_destroyWeak(v55);
  objc_destroyWeak(&v54);
  objc_destroyWeak(&to);
  objc_destroyWeak(location);
}

void __210__AVTViewTransitionHelper_view_performAnimateThenCrossFadeTransitionFromStickerConfiguration_toStickerConfiguration_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 104);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 104));
  id v4 = objc_loadWeakRetained((id *)(a1 + 112));
  id v5 = v4;
  if (WeakRetained && v4)
  {
    [*(id *)(a1 + 48) stopTransitionAnimation];
    [*(id *)(a1 + 56) revertChangesWithScope:0 animationDuration:0.0];
    id v6 = objc_alloc_init(AVTStickerConfigurationReversionContext);
    objc_storeStrong(WeakRetained + 3, v6);
    +[AVTStickerGenerator applyViewTransitionConfiguration:*(void *)(a1 + 64) toView:v5 scope:0 options:0 duration:*(void *)(a1 + 48) avatar:v6 context:0.0 completionHandler:0];
    [v5 setAvtRendererTechnique:0];
    [MEMORY[0x263F16B08] flush];
    uint64_t v7 = [WeakRetained snapshotViewUsingBackgroundColor:*(double *)(a1 + 32)];
    if (v7) {
      [*(id *)(a1 + 72) setSnapshotTexture:v7];
    }
    [(AVTStickerConfigurationReversionContext *)v6 revertChangesWithScope:0 animationDuration:0.0];
    +[AVTStickerGenerator applyViewTransitionConfiguration:*(void *)(a1 + 80) toView:v5 scope:0 options:0 duration:*(void *)(a1 + 48) avatar:v6 context:0.0 completionHandler:0];
    [MEMORY[0x263F16B08] flush];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __210__AVTViewTransitionHelper_view_performAnimateThenCrossFadeTransitionFromStickerConfiguration_toStickerConfiguration_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_2;
    block[3] = &unk_26401F930;
    objc_copyWeak(&v16, v2);
    objc_copyWeak(v17, (id *)(a1 + 112));
    v17[1] = *(id *)(a1 + 120);
    id v10 = v6;
    id v11 = *(id *)(a1 + 64);
    id v12 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 88);
    id v13 = *(id *)(a1 + 72);
    id v15 = *(id *)(a1 + 96);
    id v8 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(v17);
    objc_destroyWeak(&v16);
  }
}

void __210__AVTViewTransitionHelper_view_performAnimateThenCrossFadeTransitionFromStickerConfiguration_toStickerConfiguration_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v3 = objc_loadWeakRetained((id *)(a1 + 88));
  id v4 = v3;
  if (WeakRetained && v3)
  {
    float v5 = *(double *)(a1 + 96) * 0.75;
    [*(id *)(a1 + 32) revertChangesWithScope:0 animationDuration:0.0];
    +[AVTStickerGenerator applyViewTransitionConfiguration:*(void *)(a1 + 40) toView:v4 scope:1 options:0 duration:*(void *)(a1 + 48) avatar:*(void *)(a1 + 32) context:v5 completionHandler:0];
    uint64_t v6 = *(void *)(a1 + 64);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
    [v4 setAvtRendererTechnique:*(void *)(a1 + 56)];
    [*(id *)(a1 + 56) setFramebufferTextureOpacity:0.0];
    uint64_t v7 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
    id v8 = *(void **)(a1 + 48);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __210__AVTViewTransitionHelper_view_performAnimateThenCrossFadeTransitionFromStickerConfiguration_toStickerConfiguration_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_3;
    v10[3] = &unk_26401F908;
    v16[1] = *(id *)(a1 + 96);
    id v9 = v7;
    id v11 = v9;
    id v12 = *(id *)(a1 + 56);
    objc_copyWeak(v16, (id *)(a1 + 88));
    id v13 = *(id *)(a1 + 40);
    id v14 = *(id *)(a1 + 32);
    id v15 = *(id *)(a1 + 72);
    [v8 addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:@"sticker-transition" block:v10];

    objc_destroyWeak(v16);
  }
}

void __210__AVTViewTransitionHelper_view_performAnimateThenCrossFadeTransitionFromStickerConfiguration_toStickerConfiguration_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_3(uint64_t a1, void *a2, double a3, double a4, uint64_t a5, unsigned char *a6)
{
  id v16 = a2;
  double v10 = (a3 - a4) / *(double *)(a1 + 80);
  *(float *)&double v10 = v10;
  *(float *)&a4 = fmaxf(fminf(*(float *)&v10, 1.0), 0.0);
  LODWORD(v10) = LODWORD(a4);
  [*(id *)(a1 + 32) _solveForInput:v10];
  *(float *)&double v12 = 1.0 - fminf(fmaxf((float)(v11 + -0.25) / 0.75, 0.0), 1.0);
  [*(id *)(a1 + 40) setFramebufferTextureOpacity:v12];
  if (*(float *)&a4 >= 1.0)
  {
    *a6 = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    +[AVTStickerGenerator applyViewTransitionConfiguration:*(void *)(a1 + 48) toView:WeakRetained scope:2 options:0 duration:v16 avatar:*(void *)(a1 + 56) context:0.0 completionHandler:0];
    if (WeakRetained)
    {
      id v14 = [WeakRetained avtRendererTechnique];
      id v15 = *(void **)(a1 + 40);

      if (v14 == v15) {
        [WeakRetained setAvtRendererTechnique:0];
      }
    }
    if (*(void *)(a1 + 64)) {
      dispatch_async(MEMORY[0x263EF83A0], *(dispatch_block_t *)(a1 + 64));
    }
  }
}

- (id)transitionTechnique
{
  transitionTechnique = self->_transitionTechnique;
  if (!transitionTechnique)
  {
    id v4 = [AVTRendererViewTransitionTechnique alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    uint64_t v6 = [(AVTRendererViewTransitionTechnique *)v4 initWithSceneRenderer:WeakRetained];
    uint64_t v7 = self->_transitionTechnique;
    self->_transitionTechnique = v6;

    transitionTechnique = self->_transitionTechnique;
  }
  return transitionTechnique;
}

- (__n128)viewBackgroundColor
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v8 = 0;
  id v9 = (float32x4_t *)&v8;
  uint64_t v10 = 0x3020000000;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  id v3 = [WeakRetained traitCollection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__AVTViewTransitionHelper_viewBackgroundColor__block_invoke;
  v7[3] = &unk_26401F980;
  v7[4] = a1;
  v7[5] = &v8;
  [v3 performAsCurrentTraitCollection:v7];

  float32x4_t v4 = vmulq_laneq_f32(v9[2], v9[2], 3);
  v4.i32[3] = HIDWORD(*(_OWORD *)&v9[2]);
  float32x4_t v6 = v4;
  v9[2] = v4;
  _Block_object_dispose(&v8, 8);
  return (__n128)v6;
}

void __46__AVTViewTransitionHelper_viewBackgroundColor__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v3 = [WeakRetained renderer];
  id v4 = [v3 backgroundColor];
  float v5 = (CGColor *)[v4 CGColor];

  *(__n128 *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = AVTColor4WithCGColor(v5);
}

- (id)snapshotViewUsingBackgroundColor:(AVTViewTransitionHelper *)self
{
  *(_OWORD *)id v49 = v2;
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  float v5 = [WeakRetained renderer];

  float32x4_t v6 = [v5 device];
  [v5 _backingSize];
  unint64_t v9 = (unint64_t)v8;
  if ((unint64_t)v7) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    uint64_t v11 = 0;
  }
  else
  {
    unint64_t v50 = (unint64_t)v7;
    uint64_t v12 = objc_msgSend(MEMORY[0x263F12A58], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 71);
    uint64_t v13 = 2;
    [v12 setStorageMode:2];
    [v12 setUsage:5];
    uint64_t v14 = [v6 newTextureWithDescriptor:v12];
    int v15 = AVTMTLDeviceSupportsMemorylessStorage(v6);
    id v16 = objc_loadWeakRetained((id *)p_view);
    uint64_t v17 = [v16 antialiasingMode];
    unint64_t v18 = v17 - 1;
    uint64_t v19 = 1;
    if (v17 == 1) {
      uint64_t v19 = 2;
    }
    if (v17 == 2) {
      uint64_t v20 = 4;
    }
    else {
      uint64_t v20 = v19;
    }

    if (v15) {
      uint64_t v21 = 3;
    }
    else {
      uint64_t v21 = 2;
    }
    id v48 = (void *)v14;
    if (v18 > 1)
    {
      uint64_t v23 = 0;
      id v47 = 0;
      uint64_t v22 = v14;
      objc_msgSend(MEMORY[0x263F12A58], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 252, v50, v9, 0, 1);
    }
    else
    {
      [v12 setStorageMode:v21];
      uint64_t v13 = 4;
      [v12 setUsage:4];
      [v12 setTextureType:4];
      [v12 setSampleCount:v20];
      uint64_t v22 = [v6 newTextureWithDescriptor:v12];
      uint64_t v23 = v14;
      id v47 = (void *)v22;
      objc_msgSend(MEMORY[0x263F12A58], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 252, v50, v9, 0, 2);
    uint64_t v24 = };
    [v24 setStorageMode:v21];
    [v24 setUsage:4];
    [v24 setTextureType:v13];
    [v24 setSampleCount:v20];
    long long v46 = v6;
    uint64_t v25 = (void *)[v6 newTextureWithDescriptor:v24];
    uint64_t v26 = [MEMORY[0x263F12998] renderPassDescriptor];
    uint64_t v27 = [v26 colorAttachments];
    uint64_t v28 = [v27 objectAtIndexedSubscript:0];
    [v28 setTexture:v22];

    long long v29 = [v26 colorAttachments];
    id v30 = [v29 objectAtIndexedSubscript:0];
    [v30 setResolveTexture:v23];

    dispatch_semaphore_t v31 = [v26 colorAttachments];
    float v32 = [v31 objectAtIndexedSubscript:0];
    [v32 setLoadAction:2];

    dispatch_time_t v33 = [v26 colorAttachments];
    id v34 = [v33 objectAtIndexedSubscript:0];
    objc_msgSend(v34, "setClearColor:", v49[0], v49[1], v49[2], v49[3]);

    id v35 = [v26 colorAttachments];
    id v36 = [v35 objectAtIndexedSubscript:0];
    [v36 setStoreAction:v45];

    id v37 = [v26 depthAttachment];
    [v37 setTexture:v25];

    if ([v5 usesReverseZ]) {
      double v38 = 1.0;
    }
    else {
      double v38 = 0.0;
    }
    id v39 = [v26 depthAttachment];
    [v39 setClearDepth:v38];

    long long v40 = [v26 depthAttachment];
    [v40 setLoadAction:2];

    id v41 = [v26 depthAttachment];
    [v41 setStoreAction:0];

    id v42 = [v5 commandQueue];
    id v43 = [v42 commandBuffer];

    [v5 updateAtTime:CACurrentMediaTime()];
    objc_msgSend(v5, "renderWithViewport:commandBuffer:passDescriptor:", v43, v26, 0.0, 0.0, (double)v50, (double)v9);
    [v43 commit];

    float32x4_t v6 = v46;
    uint64_t v11 = v48;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionTechnique, 0);
  objc_storeStrong((id *)&self->_stickerTransitionReversionContext, 0);
  objc_storeStrong((id *)&self->_stickerConfiguration, 0);
  objc_destroyWeak((id *)&self->_view);
}

- (void)transitionViewToStickerConfiguration:(uint64_t)a3 fallbackPose:(uint64_t)a4 duration:(uint64_t)a5 style:(uint64_t)a6 avatar:(uint64_t)a7 completionHandler:(uint64_t)a8 simultaneousAnimationsBlock:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)transitionViewToStickerConfiguration:(uint64_t)a3 fallbackPose:(uint64_t)a4 duration:(uint64_t)a5 style:(uint64_t)a6 avatar:(uint64_t)a7 completionHandler:(uint64_t)a8 simultaneousAnimationsBlock:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)transitionCoordinatorToStickerConfiguration:(uint64_t)a3 duration:(uint64_t)a4 style:(uint64_t)a5 options:(uint64_t)a6 avatar:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)view_performCrossFadeTransitionToStickerConfiguration:(NSObject *)a1 fallbackPose:(uint64_t)a2 duration:(uint64_t)a3 avatar:(uint64_t)a4 avatarNode:(uint64_t)a5 oldReversionContext:(uint64_t)a6 completionHandler:(uint64_t)a7 simultaneousAnimationsBlock:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __143__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_20B819000, v0, v1, "Error: %@ does not conform to AVTRendererTechniqueSupport", v2, v3, v4, v5, v6);
}

@end