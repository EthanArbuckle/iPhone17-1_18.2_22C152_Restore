@interface AXHapticFeedbackManager
+ (id)sharedManager;
- (void)_playCancelPatternFeedback;
- (void)_playDiscreteFeedbackForType:(int64_t)a3;
- (void)_playFeedback:(id)a3;
- (void)_playFeedbackImpactBehaviorWithIntensity:(double)a3;
- (void)_playPatternFeedback:(int64_t)a3 numberOfRepetitions:(int64_t)a4 atInterval:(double)a5;
- (void)playHapticFeedbackForType:(int64_t)a3;
@end

@implementation AXHapticFeedbackManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__AXHapticFeedbackManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_SharedManager;
  return v2;
}

uint64_t __40__AXHapticFeedbackManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedManager_SharedManager;
  sharedManager_SharedManager = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (void)playHapticFeedbackForType:(int64_t)a3
{
  if (AXHomeClickHapticsSupported()) {
    AXPerformBlockAsynchronouslyOnMainThread();
  }
}

uint64_t __53__AXHapticFeedbackManager_playHapticFeedbackForType___block_invoke(uint64_t result)
{
  switch(*(void *)(result + 40))
  {
    case 0:
    case 0xCLL:
      id v1 = *(void **)(result + 32);
      uint64_t v2 = 3;
      goto LABEL_3;
    case 1:
    case 0x12:
      id v1 = *(void **)(result + 32);
      uint64_t v2 = 1;
      goto LABEL_3;
    case 2:
      return [*(id *)(result + 32) _playFeedbackImpactBehaviorWithIntensity:1.0];
    case 3:
      id v1 = *(void **)(result + 32);
      uint64_t v2 = 6;
      goto LABEL_3;
    case 4:
      v3 = *(void **)(result + 32);
      double v4 = 0.005;
      uint64_t v5 = 7;
      uint64_t v6 = 4;
      goto LABEL_10;
    case 5:
    case 8:
      id v1 = *(void **)(result + 32);
      uint64_t v2 = 8;
      goto LABEL_3;
    case 6:
      id v1 = *(void **)(result + 32);
      uint64_t v2 = 5;
      goto LABEL_3;
    case 7:
      v3 = *(void **)(result + 32);
      double v4 = 0.1;
      uint64_t v5 = 5;
      goto LABEL_17;
    case 9:
      v3 = *(void **)(result + 32);
      double v4 = 0.1;
      uint64_t v5 = 7;
      goto LABEL_17;
    case 0xALL:
      v3 = *(void **)(result + 32);
      double v4 = 0.1;
      uint64_t v5 = 7;
      goto LABEL_20;
    case 0xBLL:
      return [*(id *)(result + 32) _playCancelPatternFeedback];
    case 0xDLL:
      v3 = *(void **)(result + 32);
      double v4 = 0.1;
      uint64_t v5 = 6;
LABEL_17:
      uint64_t v6 = 2;
      goto LABEL_10;
    case 0xELL:
      id v1 = *(void **)(result + 32);
      uint64_t v2 = 9;
      goto LABEL_3;
    case 0xFLL:
    case 0x13:
      id v1 = *(void **)(result + 32);
      uint64_t v2 = 7;
      goto LABEL_3;
    case 0x10:
      v3 = *(void **)(result + 32);
      double v4 = 0.1;
      uint64_t v5 = 4;
LABEL_20:
      uint64_t v6 = 3;
      goto LABEL_10;
    case 0x11:
      v3 = *(void **)(result + 32);
      double v4 = 0.1;
      uint64_t v5 = 6;
      uint64_t v6 = 1;
LABEL_10:
      result = [v3 _playPatternFeedback:v5 numberOfRepetitions:v6 atInterval:v4];
      break;
    case 0x14:
      id v1 = *(void **)(result + 32);
      uint64_t v2 = 0;
LABEL_3:
      result = [v1 _playDiscreteFeedbackForType:v2];
      break;
    default:
      return result;
  }
  return result;
}

- (void)_playFeedback:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "setHapticOutputMode:", objc_msgSend(v3, "hapticOutputMode") | 5);
  double v4 = [MEMORY[0x1E4FB2100] engineForFeedback:v3];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__AXHapticFeedbackManager__playFeedback___block_invoke;
  v6[3] = &unk_1E649C730;
  id v7 = v3;
  id v5 = v3;
  [v4 runWhenReady:v6];
}

uint64_t __41__AXHapticFeedbackManager__playFeedback___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) play];
  }
  return result;
}

- (void)_playFeedbackImpactBehaviorWithIntensity:(double)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4FB1840]);
  id v5 = [MEMORY[0x1E4FB2190] defaultConfiguration];
  id v6 = (id)[v4 initWithConfiguration:v5 view:0];

  [v6 activateWithCompletionBlock:0];
  objc_msgSend(v6, "impactOccurredWithIntensity:atLocation:", a3, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [v6 deactivate];
}

- (void)_playDiscreteFeedbackForType:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4FB20B0] discreteFeedbackForType:a3];
  [(AXHapticFeedbackManager *)self _playFeedback:v4];
}

- (void)_playPatternFeedback:(int64_t)a3 numberOfRepetitions:(int64_t)a4 atInterval:(double)a5
{
  id v11 = [MEMORY[0x1E4FB2108] feedbackPattern];
  if (a4 >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      v10 = [MEMORY[0x1E4FB20B0] discreteFeedbackForType:a3];
      [v11 addFeedback:v10 atTime:(double)(int)v9 * a5];

      ++v9;
    }
    while (a4 != v9);
  }
  [(AXHapticFeedbackManager *)self _playFeedback:v11];
}

- (void)_playCancelPatternFeedback
{
  id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v2 = [v3 _tapticEngine];
  [v2 actuateFeedback:2];
}

@end