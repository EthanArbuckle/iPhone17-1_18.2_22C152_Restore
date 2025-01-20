@interface SCNScene
@end

@implementation SCNScene

void __90__SCNScene_AVTExtension__avt_setInitialValuesExportedAsAnimationsWithWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 animationKeys];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v10 = [v3 animationForKey:v9];
        v11 = AVTSetInitialValuesExportedAsAnimations(v3, v10, *(void *)(a1 + 40), *(void **)(a1 + 32));
        if (v11 != v10)
        {
          [v3 removeAnimationForKey:v9];
          if (v11) {
            [v3 addAnimation:v11 forKey:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

void __69__SCNScene_AVTExtension__avt_removeDuplicateSkeletonRootWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 skinner];
  v4 = [v3 skeleton];
  uint64_t v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    [v3 setSkeleton:*(void *)(a1 + 40)];
    uint64_t v6 = [v3 bones];
    int v7 = [v6 containsObject:*(void *)(a1 + 32)];

    if (v7)
    {
      v8 = avt_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __69__SCNScene_AVTExtension__avt_removeDuplicateSkeletonRootWithHandler___block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
}

void __76__SCNScene_AVTExtension__avt_removeFaceSetsExportedAsDummyNodesWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 name];
  int v4 = [v3 containsString:@"_MTL"];

  if (v4) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void __69__SCNScene_AVTExtension__avt_removeDuplicateSkeletonRootWithHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end