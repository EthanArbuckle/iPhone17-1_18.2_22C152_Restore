@interface BKUIPearlEnrollAnimationManager
+ (id)sharedManager;
- (id)gaussianBlurWithRadius:(double)a3;
- (id)gaussianBlurWithRadius:(double)a3 normalizeEdges:(BOOL)a4 hardEdges:(BOOL)a5 quality:(id)a6 intermediateBitDepth:(id)a7;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)runBasicAnimationOnLayer:(id)a3 withDuration:(double)a4 keyPath:(id)a5 fromValue:(id)a6 toValue:(id)a7 removedOnCompletion:(BOOL)a8 timingFunction:(id)a9 completion:(id)a10;
- (void)transitionTo:(id)a3 completion:(id)a4;
@end

@implementation BKUIPearlEnrollAnimationManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedManager_instance;
  return v2;
}

uint64_t __48__BKUIPearlEnrollAnimationManager_sharedManager__block_invoke()
{
  sharedManager_instance = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (id)gaussianBlurWithRadius:(double)a3 normalizeEdges:(BOOL)a4 hardEdges:(BOOL)a5 quality:(id)a6 intermediateBitDepth:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  v11 = (void *)MEMORY[0x1E4F39BC0];
  uint64_t v12 = *MEMORY[0x1E4F3A0D0];
  id v13 = a7;
  id v14 = a6;
  v15 = [v11 filterWithType:v12];
  v16 = [NSNumber numberWithDouble:a3];
  [v15 setValue:v16 forKey:@"inputRadius"];

  v17 = [NSNumber numberWithBool:v9];
  [v15 setValue:v17 forKey:@"inputNormalizeEdges"];

  v18 = [NSNumber numberWithBool:v8];
  [v15 setValue:v18 forKey:@"inputHardEdges"];

  [v15 setValue:v14 forKey:@"inputQuality"];
  [v15 setValue:v13 forKeyPath:@"inputIntermediateBitDepth"];

  return v15;
}

- (id)gaussianBlurWithRadius:(double)a3
{
  return [(BKUIPearlEnrollAnimationManager *)self gaussianBlurWithRadius:0 normalizeEdges:0 hardEdges:@"default" quality:@"default" intermediateBitDepth:a3];
}

- (void)runBasicAnimationOnLayer:(id)a3 withDuration:(double)a4 keyPath:(id)a5 fromValue:(id)a6 toValue:(id)a7 removedOnCompletion:(BOOL)a8 timingFunction:(id)a9 completion:(id)a10
{
  id v16 = a3;
  id v17 = a9;
  id v18 = a10;
  v19 = (void *)MEMORY[0x1E4F29128];
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  v23 = [v19 UUID];
  v24 = [v23 UUIDString];

  v25 = [MEMORY[0x1E4F39B48] animationWithKeyPath:v22];

  -[CADisplayLink bkui_enableHighFrameRate]((uint64_t)v25);
  [v25 setDuration:a4];
  [v25 setFromValue:v21];

  [v25 setToValue:v20];
  [v25 setRemovedOnCompletion:0];
  [v25 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v25 setDelegate:self];
  if (v17)
  {
    v26 = [MEMORY[0x1E4F39C10] functionWithName:v17];
    [v25 setTimingFunction:v26];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __145__BKUIPearlEnrollAnimationManager_runBasicAnimationOnLayer_withDuration_keyPath_fromValue_toValue_removedOnCompletion_timingFunction_completion___block_invoke;
  aBlock[3] = &unk_1E6EA28E0;
  id v35 = v24;
  id v36 = v18;
  BOOL v37 = a8;
  id v34 = v16;
  id v27 = v24;
  id v28 = v16;
  id v29 = v18;
  v30 = _Block_copy(aBlock);
  v31 = _Block_copy(v30);
  [v25 setValue:v31 forKey:@"PSAnimationCompletion"];

  [v28 addAnimation:v25 forKey:v27];
}

uint64_t __145__BKUIPearlEnrollAnimationManager_runBasicAnimationOnLayer_withDuration_keyPath_fromValue_toValue_removedOnCompletion_timingFunction_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    uint64_t result = (*(uint64_t (**)(void))(result + 16))();
  }
  if (*(unsigned char *)(a1 + 56))
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 removeAnimationForKey:v4];
  }
  return result;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5 = a3;
  uint64_t v4 = [v5 valueForKey:@"PSAnimationCompletion"];
  if (v4)
  {
    [v5 setValue:0 forKey:@"PSAnimationCompletion"];
    v4[2](v4);
  }
}

- (void)transitionTo:(id)a3 completion:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setCompletionBlock:v6];
  v7 = [MEMORY[0x1E4F39D18] animation];
  BOOL v8 = [v5 view];
  v28[0] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];

  v10 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
  [v7 setTimingFunction:v10];

  [v7 setType:@"push"];
  v11 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v12 = [v11 userInterfaceLayoutDirection];

  [v7 setDuration:0.400000006];
  if (v12 == 1) {
    id v13 = @"fromLeft";
  }
  else {
    id v13 = @"fromRight";
  }
  [v7 setSubtype:v13];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v9;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    uint64_t v18 = *MEMORY[0x1E4F3A5B0];
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        id v20 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v21 = objc_msgSend(v20, "layer", (void)v23);
        [v21 removeAllAnimations];

        id v22 = [v20 layer];
        [v22 addAnimation:v7 forKey:v18];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }

  [MEMORY[0x1E4F39CF8] commit];
}

@end