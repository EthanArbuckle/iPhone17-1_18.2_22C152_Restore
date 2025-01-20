@interface FBSScene
@end

@implementation FBSScene

BLSBacklightFBSSceneEnvironment *__56__FBSScene_BacklightServices__backlightSceneEnvironment__block_invoke(uint64_t a1)
{
  v2 = bls_scenes_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __56__FBSScene_BacklightServices__backlightSceneEnvironment__block_invoke_cold_1(a1, v2);
  }

  v3 = [[BLSBacklightFBSSceneEnvironment alloc] initWithFBSScene:*(void *)(a1 + 32)];

  return v3;
}

void __56__FBSScene_BacklightServices__backlightSceneEnvironment__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [*(id *)(a1 + 32) debugDescription];
  int v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1B55DE000, a2, OS_LOG_TYPE_DEBUG, "create BLSBacklightFBSSceneEnvironment for fbsScene:%@", (uint8_t *)&v4, 0xCu);
}

@end