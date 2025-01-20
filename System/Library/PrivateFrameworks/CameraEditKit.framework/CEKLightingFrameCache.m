@interface CEKLightingFrameCache
- (BOOL)_needsBackgroundFrame;
- (BOOL)_needsForegroundFrames;
- (CEKLightingFrameCache)init;
- (NSDictionary)_backgroundFrameMapsByLightingType;
- (NSIndexSet)_availableAbsoluteAngles;
- (NSMutableDictionary)_foregroundFramesByAvailableAngle;
- (id)_appearanceForLightingType:(int64_t)a3;
- (id)_renderBackgroundFramesForAbsoluteAngles:(id)a3 lightingType:(int64_t)a4 scale:(double)a5;
- (id)_renderForegroundFramesForAbsoluteAngles:(id)a3 scale:(double)a4;
- (id)_renderFrameForAngle:(int64_t)a3 scale:(double)a4 components:(int64_t)a5 appearance:(id)a6;
- (id)backgroundFrameForAngle:(int64_t)a3 lightingType:(int64_t)a4;
- (id)foregroundFrameForAngle:(int64_t)a3;
- (int64_t)angleOfAvailableFrameForAngle:(int64_t)a3;
- (unint64_t)angleCount;
- (void)preloadBackgroundFrames;
- (void)preloadForegroundFrames;
- (void)set_backgroundFrameMapsByLightingType:(id)a3;
- (void)set_foregroundFramesByAvailableAngle:(id)a3;
@end

@implementation CEKLightingFrameCache

- (CEKLightingFrameCache)init
{
  v21[6] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)CEKLightingFrameCache;
  v2 = [(CEKLightingFrameCache *)&v19 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28E60] indexSet];
    for (uint64_t i = 0; i != 20; ++i)
      [v3 addIndex:CEKLightingFrameAbsoluteAngles[i]];
    uint64_t v5 = [(CEKLightingFrameCache *)v2 angleCount];
    uint64_t v6 = [v3 copy];
    availableAbsoluteAngles = v2->__availableAbsoluteAngles;
    v2->__availableAbsoluteAngles = (NSIndexSet *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v5];
    foregroundFramesByAvailableAngle = v2->__foregroundFramesByAvailableAngle;
    v2->__foregroundFramesByAvailableAngle = (NSMutableDictionary *)v8;

    v20[0] = &unk_1F1A0FB08;
    v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v5];
    v21[0] = v10;
    v20[1] = &unk_1F1A0FB20;
    v11 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v5];
    v21[1] = v11;
    v20[2] = &unk_1F1A0FB38;
    v12 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v5];
    v21[2] = v12;
    v20[3] = &unk_1F1A0FB50;
    v13 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v5];
    v21[3] = v13;
    v20[4] = &unk_1F1A0FB68;
    v14 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v5];
    v21[4] = v14;
    v20[5] = &unk_1F1A0FB80;
    v15 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v5];
    v21[5] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:6];
    backgroundFrameMapsByLightingType = v2->__backgroundFrameMapsByLightingType;
    v2->__backgroundFrameMapsByLightingType = (NSDictionary *)v16;
  }
  return v2;
}

- (unint64_t)angleCount
{
  return 39;
}

- (void)preloadForegroundFrames
{
  if ([(CEKLightingFrameCache *)self _needsForegroundFrames])
  {
    v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v3 scale];
    uint64_t v5 = v4;

    uint64_t v6 = [(CEKLightingFrameCache *)self _availableAbsoluteAngles];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v8 = v7;
    objc_initWeak(&location, self);
    v9 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__CEKLightingFrameCache_preloadForegroundFrames__block_invoke;
    block[3] = &unk_1E63CDB88;
    objc_copyWeak(v13, &location);
    id v12 = v6;
    v13[1] = v5;
    v13[2] = v8;
    id v10 = v6;
    dispatch_async(v9, block);

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
}

void __48__CEKLightingFrameCache_preloadForegroundFrames__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [WeakRetained _renderForegroundFramesForAbsoluteAngles:*(void *)(a1 + 32) scale:*(double *)(a1 + 48)];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CEKLightingFrameCache_preloadForegroundFrames__block_invoke_2;
  block[3] = &unk_1E63CD500;
  v8[1] = *(id *)(a1 + 56);
  objc_copyWeak(v8, v2);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v8);
}

void __48__CEKLightingFrameCache_preloadForegroundFrames__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v3 = v2;
  double v4 = *(double *)(a1 + 48);
  id v5 = os_log_create("com.apple.camera", "CameraEditKit");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    double v9 = v3 - v4;
    _os_log_impl(&dword_1BEE2D000, v5, OS_LOG_TYPE_DEFAULT, "Loaded foreground frames for lighting cube in %.2f seconds", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "set_foregroundFramesByAvailableAngle:", v6);
}

- (void)preloadBackgroundFrames
{
  if ([(CEKLightingFrameCache *)self _needsForegroundFrames])
  {
    double v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v3 scale];
    id v5 = v4;

    uint64_t v6 = [(CEKLightingFrameCache *)self _availableAbsoluteAngles];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    int v8 = v7;
    objc_initWeak(&location, self);
    double v9 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__CEKLightingFrameCache_preloadBackgroundFrames__block_invoke;
    block[3] = &unk_1E63CDB88;
    objc_copyWeak(v13, &location);
    id v12 = v6;
    v13[1] = v5;
    v13[2] = v8;
    id v10 = v6;
    dispatch_async(v9, block);

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
}

void __48__CEKLightingFrameCache_preloadBackgroundFrames__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(&unk_1F1A0FF20, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v3 = [&unk_1F1A0FF20 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(&unk_1F1A0FF20);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v8 = [v7 unsignedIntegerValue];
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        id v10 = [WeakRetained _renderBackgroundFramesForAbsoluteAngles:*(void *)(a1 + 32) lightingType:v8 scale:*(double *)(a1 + 48)];
        [v2 setObject:v10 forKeyedSubscript:v7];
      }
      uint64_t v4 = [&unk_1F1A0FF20 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__CEKLightingFrameCache_preloadBackgroundFrames__block_invoke_2;
  v12[3] = &unk_1E63CDBB0;
  v15[1] = *(id *)(a1 + 56);
  id v13 = &unk_1F1A0FF20;
  objc_copyWeak(v15, (id *)(a1 + 40));
  id v14 = v2;
  id v11 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v12);

  objc_destroyWeak(v15);
}

void __48__CEKLightingFrameCache_preloadBackgroundFrames__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v3 = v2;
  double v4 = *(double *)(a1 + 56);
  uint64_t v5 = os_log_create("com.apple.camera", "CameraEditKit");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [*(id *)(a1 + 32) count];
    int v9 = 134218240;
    uint64_t v10 = v6;
    __int16 v11 = 2048;
    double v12 = v3 - v4;
    _os_log_impl(&dword_1BEE2D000, v5, OS_LOG_TYPE_DEFAULT, "Loaded background frames for %lu lighting cubes in %.2f seconds", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "set_backgroundFrameMapsByLightingType:", v7);
}

- (int64_t)angleOfAvailableFrameForAngle:(int64_t)a3
{
  double v4 = [(CEKLightingFrameCache *)self _availableAbsoluteAngles];
  uint64_t v5 = v4;
  if (a3 >= 0) {
    int64_t v6 = a3;
  }
  else {
    int64_t v6 = -a3;
  }
  uint64_t v7 = objc_msgSend(v4, "cek_indexNearestToIndex:", v6);
  if (a3 >= 0) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = -v7;
  }

  return v8;
}

- (id)foregroundFrameForAngle:(int64_t)a3
{
  int64_t v5 = -[CEKLightingFrameCache angleOfAvailableFrameForAngle:](self, "angleOfAvailableFrameForAngle:");
  int64_t v6 = [(CEKLightingFrameCache *)self _foregroundFramesByAvailableAngle];
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:v5];
  int64_t v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    int v9 = [(CEKLightingFrameCache *)self _appearanceForLightingType:1];
    uint64_t v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v10 scale];
    int64_t v8 = -[CEKLightingFrameCache _renderFrameForAngle:scale:components:appearance:](self, "_renderFrameForAngle:scale:components:appearance:", a3, 48, v9);

    if (v8)
    {
      __int16 v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:v5];
      [v6 setObject:v8 forKeyedSubscript:v11];
    }
  }

  return v8;
}

- (id)backgroundFrameForAngle:(int64_t)a3 lightingType:(int64_t)a4
{
  int64_t v7 = -[CEKLightingFrameCache angleOfAvailableFrameForAngle:](self, "angleOfAvailableFrameForAngle:");
  int64_t v8 = [(CEKLightingFrameCache *)self _backgroundFrameMapsByLightingType];
  int v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  __int16 v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:v7];
  double v12 = [v10 objectForKeyedSubscript:v11];

  if (!v12)
  {
    uint64_t v13 = [(CEKLightingFrameCache *)self _appearanceForLightingType:a4];
    id v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v14 scale];
    double v12 = -[CEKLightingFrameCache _renderFrameForAngle:scale:components:appearance:](self, "_renderFrameForAngle:scale:components:appearance:", a3, 15, v13);

    if (v12)
    {
      v15 = [MEMORY[0x1E4F28ED0] numberWithInteger:v7];
      [v10 setObject:v12 forKeyedSubscript:v15];
    }
  }

  return v12;
}

- (BOOL)_needsForegroundFrames
{
  double v2 = self;
  double v3 = [(CEKLightingFrameCache *)self _foregroundFramesByAvailableAngle];
  unint64_t v4 = [v3 count];
  LOBYTE(v2) = v4 < [(CEKLightingFrameCache *)v2 angleCount];

  return (char)v2;
}

- (BOOL)_needsBackgroundFrame
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(CEKLightingFrameCache *)self _backgroundFrameMapsByLightingType];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "count", (void)v11);
        if (v8 < [(CEKLightingFrameCache *)self angleCount])
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (id)_appearanceForLightingType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      uint64_t v5 = +[CEKLightingCubeStyleGlowing naturalAppearance];
      goto LABEL_11;
    case 2:
      uint64_t v5 = +[CEKLightingCubeStyleGlowing studioAppearance];
      goto LABEL_11;
    case 3:
      uint64_t v5 = +[CEKLightingCubeStyleGlowing contourAppearance];
      goto LABEL_11;
    case 4:
      uint64_t v5 = +[CEKLightingCubeStyleGlowing stageAppearance];
      goto LABEL_11;
    case 5:
      uint64_t v5 = +[CEKLightingCubeStyleGlowing stageMonoAppearance];
      goto LABEL_11;
    case 6:
      uint64_t v5 = +[CEKLightingCubeStyleGlowing stageWhiteAppearance];
LABEL_11:
      break;
    default:
      uint64_t v5 = 0;
      break;
  }
  return v5;
}

- (id)_renderForegroundFramesForAbsoluteAngles:(id)a3 scale:(double)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  unint64_t v8 = objc_msgSend(v6, "dictionaryWithCapacity:", 2 * objc_msgSend(v7, "count"));
  BOOL v9 = [(CEKLightingFrameCache *)self _appearanceForLightingType:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __72__CEKLightingFrameCache__renderForegroundFramesForAbsoluteAngles_scale___block_invoke;
  v15[3] = &unk_1E63CDBD8;
  double v18 = a4;
  uint64_t v19 = 48;
  v15[4] = self;
  id v16 = v9;
  id v10 = v8;
  id v17 = v10;
  id v11 = v9;
  [v7 enumerateIndexesUsingBlock:v15];

  long long v12 = v17;
  id v13 = v10;

  return v13;
}

void __72__CEKLightingFrameCache__renderForegroundFramesForAbsoluteAngles_scale___block_invoke(uint64_t a1, uint64_t a2)
{
  id v9 = [*(id *)(a1 + 32) _renderFrameForAngle:a2 scale:*(void *)(a1 + 64) components:*(void *)(a1 + 40) appearance:*(double *)(a1 + 56)];
  uint64_t v4 = *(void **)(a1 + 48);
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a2];
  [v4 setObject:v9 forKeyedSubscript:v5];

  uint64_t v6 = [v9 imageWithHorizontallyFlippedOrientation];
  id v7 = *(void **)(a1 + 48);
  unint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:-a2];
  [v7 setObject:v6 forKeyedSubscript:v8];
}

- (id)_renderBackgroundFramesForAbsoluteAngles:(id)a3 lightingType:(int64_t)a4 scale:(double)a5
{
  unint64_t v8 = (void *)MEMORY[0x1E4F1CA60];
  id v9 = a3;
  id v10 = objc_msgSend(v8, "dictionaryWithCapacity:", 2 * objc_msgSend(v9, "count"));
  id v11 = [(CEKLightingFrameCache *)self _appearanceForLightingType:a4];
  long long v12 = [(CEKLightingFrameCache *)self _appearanceForLightingType:a4];
  id v13 = [(CEKLightingFrameCache *)self _appearanceForLightingType:a4];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __85__CEKLightingFrameCache__renderBackgroundFramesForAbsoluteAngles_lightingType_scale___block_invoke;
  v21[3] = &unk_1E63CDC00;
  id v22 = v11;
  id v23 = v13;
  id v14 = v10;
  id v24 = v14;
  v25 = self;
  double v27 = a5;
  uint64_t v28 = 15;
  v26 = v12;
  id v15 = v12;
  id v16 = v13;
  id v17 = v11;
  [v9 enumerateIndexesUsingBlock:v21];

  double v18 = v26;
  id v19 = v14;

  return v19;
}

void __85__CEKLightingFrameCache__renderBackgroundFramesForAbsoluteAngles_lightingType_scale___block_invoke(uint64_t a1, unint64_t a2)
{
  double v4 = (float)a2 / 90.0;
  uint64_t v5 = +[CEKLightingCubeAppearance appearanceFrom:*(void *)(a1 + 32) to:*(void *)(a1 + 40) progress:v4];
  uint64_t v6 = [*(id *)(a1 + 56) _renderFrameForAngle:a2 scale:*(void *)(a1 + 80) components:v5 appearance:*(double *)(a1 + 72)];
  id v7 = *(void **)(a1 + 48);
  unint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a2];
  [v7 setObject:v6 forKeyedSubscript:v8];

  uint64_t v9 = -(uint64_t)a2;
  id v13 = +[CEKLightingCubeAppearance appearanceFrom:*(void *)(a1 + 64) to:*(void *)(a1 + 32) progress:-v4];

  id v10 = [*(id *)(a1 + 56) _renderFrameForAngle:v9 scale:*(void *)(a1 + 80) components:v13 appearance:*(double *)(a1 + 72)];
  id v11 = *(void **)(a1 + 48);
  long long v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:v9];
  [v11 setObject:v10 forKeyedSubscript:v12];
}

- (id)_renderFrameForAngle:(int64_t)a3 scale:(double)a4 components:(int64_t)a5 appearance:(id)a6
{
  CGFloat v8 = 49.0 - 1.0 / a4;
  double v9 = 3.0 - 1.0 / a4;
  double v10 = 1.0 / a4 + 1.0;
  double v11 = (double)a3 * 3.14159265 / 180.0;
  id v12 = a6;
  id v13 = [[CEKLightingCube alloc] initWithRotationAngle:v11];
  id v14 = [[CEKLightingCubeRenderer alloc] initWithCube:v13 appearance:v12 components:a5];

  v19.width = v8;
  v19.height = v8;
  UIGraphicsBeginImageContextWithOptions(v19, 0, a4);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextTranslateCTM(CurrentContext, v8 * 0.5, v8 * 0.5);
  -[CEKLightingCubeRenderer renderInContext:size:scale:cornerRadius:stroke:](v14, "renderInContext:size:scale:cornerRadius:stroke:", CurrentContext, v8, v8, a4, v9, v10);
  CGContextTranslateCTM(CurrentContext, v8 * -0.5, v8 * -0.5);
  id v16 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v16;
}

- (NSIndexSet)_availableAbsoluteAngles
{
  return self->__availableAbsoluteAngles;
}

- (NSMutableDictionary)_foregroundFramesByAvailableAngle
{
  return self->__foregroundFramesByAvailableAngle;
}

- (void)set_foregroundFramesByAvailableAngle:(id)a3
{
}

- (NSDictionary)_backgroundFrameMapsByLightingType
{
  return self->__backgroundFrameMapsByLightingType;
}

- (void)set_backgroundFrameMapsByLightingType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__backgroundFrameMapsByLightingType, 0);
  objc_storeStrong((id *)&self->__foregroundFramesByAvailableAngle, 0);
  objc_storeStrong((id *)&self->__availableAbsoluteAngles, 0);
}

@end