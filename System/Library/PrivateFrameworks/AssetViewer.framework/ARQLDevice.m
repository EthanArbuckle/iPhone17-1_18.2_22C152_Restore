@interface ARQLDevice
+ (BOOL)isRenderTier1;
+ (BOOL)isRenderTier2;
+ (BOOL)isRenderTier3;
+ (BOOL)isRenderTier4;
+ (BOOL)isRenderTier5;
+ (BOOL)supportsAR;
+ (BOOL)supportsSceneReconstruction;
+ (BOOL)useSceneReconstructionMeshForOrientation;
+ (int64_t)renderTier;
@end

@implementation ARQLDevice

+ (BOOL)supportsAR
{
  return [MEMORY[0x1E4F47870] isSupported];
}

+ (BOOL)isRenderTier1
{
  return (unint64_t)(gpuClass - 1) < 3;
}

+ (BOOL)isRenderTier2
{
  return gpuClass == 4;
}

+ (BOOL)isRenderTier3
{
  if (gpuClass == 5) {
    return 1;
  }
  if (gpuClass == 6) {
    return !isiPhone();
  }
  return 0;
}

+ (BOOL)isRenderTier4
{
  checkGPUClass();
  uint64_t v2 = gpuClass;
  if (gpuClass == 6)
  {
    if (isiPhone()) {
      return 1;
    }
    uint64_t v2 = gpuClass;
  }
  return v2 == 7;
}

+ (BOOL)isRenderTier5
{
  return gpuClass == 8;
}

+ (int64_t)renderTier
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__ARQLDevice_renderTier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (renderTier_onceToken != -1) {
    dispatch_once(&renderTier_onceToken, block);
  }
  return renderTier___renderTier;
}

void __24__ARQLDevice_renderTier__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isRenderTier1])
  {
    uint64_t v2 = &OBJC_IVAR____TtC11AssetViewer15CheckoutPlatter_rightBackgroundViewConstraint;
    uint64_t v3 = 1;
LABEL_16:
    v2[162] = v3;
    return;
  }
  if ([*(id *)(a1 + 32) isRenderTier2])
  {
    uint64_t v2 = &OBJC_IVAR____TtC11AssetViewer15CheckoutPlatter_rightBackgroundViewConstraint;
    uint64_t v3 = 2;
    goto LABEL_16;
  }
  if ([*(id *)(a1 + 32) isRenderTier3])
  {
    uint64_t v2 = &OBJC_IVAR____TtC11AssetViewer15CheckoutPlatter_rightBackgroundViewConstraint;
    uint64_t v3 = 3;
    goto LABEL_16;
  }
  if ([*(id *)(a1 + 32) isRenderTier4])
  {
    uint64_t v2 = &OBJC_IVAR____TtC11AssetViewer15CheckoutPlatter_rightBackgroundViewConstraint;
    uint64_t v3 = 4;
    goto LABEL_16;
  }
  if ([*(id *)(a1 + 32) isRenderTier5])
  {
    BOOL v4 = isiPhone();
    uint64_t v2 = &OBJC_IVAR____TtC11AssetViewer15CheckoutPlatter_rightBackgroundViewConstraint;
    if (!v4)
    {
      uint64_t v3 = 5;
      goto LABEL_16;
    }
    renderTier___renderTier = 4;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1E2840000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "ARQLDevice: bumping iPhone down to tier 4", v5, 2u);
    }
  }
  else
  {
    renderTier___renderTier = 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __24__ARQLDevice_renderTier__block_invoke_cold_1();
    }
  }
}

+ (BOOL)supportsSceneReconstruction
{
  if (supportsSceneReconstruction_onceToken != -1) {
    dispatch_once(&supportsSceneReconstruction_onceToken, &__block_literal_global_6);
  }
  return supportsSceneReconstruction___supportsSceneReconstruction;
}

uint64_t __41__ARQLDevice_supportsSceneReconstruction__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F47870] supportsSceneReconstruction:1];
  supportsSceneReconstruction___supportsSceneReconstruction = result;
  return result;
}

+ (BOOL)useSceneReconstructionMeshForOrientation
{
  if (useSceneReconstructionMeshForOrientation_onceToken != -1) {
    dispatch_once(&useSceneReconstructionMeshForOrientation_onceToken, &__block_literal_global_16);
  }
  return useSceneReconstructionMeshForOrientation___useSceneReconstructionMeshForOrientation;
}

BOOL __54__ARQLDevice_useSceneReconstructionMeshForOrientation__block_invoke()
{
  BOOL result = +[ARQLDevice supportsSceneReconstruction];
  if (result) {
    BOOL result = +[ASVUserDefaults forceUseSceneReconstructionMeshForOrientation];
  }
  useSceneReconstructionMeshForOrientation___useSceneReconstructionMeshForOrientation = result;
  return result;
}

void __24__ARQLDevice_renderTier__block_invoke_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1E2840000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "ARQLDevice: Unknown device/rendering tier", v0, 2u);
}

@end