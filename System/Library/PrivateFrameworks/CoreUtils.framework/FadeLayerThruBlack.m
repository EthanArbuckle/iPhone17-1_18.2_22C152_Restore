@interface FadeLayerThruBlack
@end

@implementation FadeLayerThruBlack

void ___FadeLayerThruBlack_block_invoke(uint64_t a1)
{
  [(Class)getCATransactionClass[0]() begin];
  [(Class)getCATransactionClass[0]() setDisableActions:1];
  [*(id *)(a1 + 40) frame];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  if (CGColorGetBlack_sOnce != -1) {
    dispatch_once_f(&CGColorGetBlack_sOnce, &CGColorGetBlack_sContext, (dispatch_function_t)_CGColorCreateWithRGB);
  }
  [*(id *)(a1 + 32) setBackgroundColor:CGColorGetBlack_sColor];
  [*(id *)(a1 + 32) setOpacity:0.0];
  int v2 = *(unsigned __int8 *)(a1 + 56);
  [*(id *)(a1 + 40) zPosition];
  double v4 = -1.0;
  if (!v2) {
    double v4 = 1.0;
  }
  [*(id *)(a1 + 32) setZPosition:v3 + v4];
  v5 = [*(id *)(a1 + 40) superlayer];
  [v5 addSublayer:*(void *)(a1 + 32)];

  [(Class)getCATransactionClass[0]() commit];
  LODWORD(v6) = 1.0;
  [*(id *)(a1 + 32) setOpacity:v6];
  id v13 = [(Class)getCABasicAnimationClass[0]() animationWithKeyPath:@"opacity"];
  v7 = [NSNumber numberWithFloat:0.0];
  [v13 setFromValue:v7];

  LODWORD(v8) = 1.0;
  v9 = [NSNumber numberWithFloat:v8];
  [v13 setToValue:v9];

  Class v10 = (Class)getCAMediaTimingFunctionClass[0]();
  v11 = getkCAMediaTimingFunctionEaseOut[0]();
  v12 = [(objc_class *)v10 functionWithName:v11];
  [v13 setTimingFunction:v12];

  [v13 setDuration:*(double *)(a1 + 48)];
  [*(id *)(a1 + 32) addAnimation:v13 forKey:@"fadeToBlack"];
}

void ___FadeLayerThruBlack_block_invoke_2(uint64_t a1, double a2)
{
  if (*(unsigned char *)(a1 + 72))
  {
    double v3 = (id *)(a1 + 32);
    float v4 = 1.0;
  }
  else
  {
    [(Class)getCATransactionClass[0]() begin];
    [(Class)getCATransactionClass[0]() setDisableActions:1];
    float v4 = 0.0;
    [*(id *)(a1 + 32) setOpacity:0.0];
    [(Class)getCATransactionClass[0]() commit];
    double v3 = (id *)(a1 + 40);
  }
  *(float *)&a2 = v4;
  [*v3 setOpacity:a2];
  v5 = [(Class)getCABasicAnimationClass[0]() animationWithKeyPath:@"opacity"];
  if (*(unsigned char *)(a1 + 72)) {
    *(float *)&double v6 = 0.0;
  }
  else {
    *(float *)&double v6 = 1.0;
  }
  v7 = [NSNumber numberWithFloat:v6];
  [v5 setFromValue:v7];

  if (*(unsigned char *)(a1 + 72)) {
    *(float *)&double v8 = 1.0;
  }
  else {
    *(float *)&double v8 = 0.0;
  }
  v9 = [NSNumber numberWithFloat:v8];
  [v5 setToValue:v9];

  Class v10 = (Class)getCAMediaTimingFunctionClass[0]();
  v11 = getkCAMediaTimingFunctionEaseIn[0]();
  v12 = [(objc_class *)v10 functionWithName:v11];
  [v5 setTimingFunction:v12];

  [v5 setDuration:*(double *)(a1 + 64)];
  id v13 = objc_alloc_init(CAAnimationDelegateBlockHelper);
  [v5 setDelegate:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = ___FadeLayerThruBlack_block_invoke_3;
  v16[3] = &unk_1E55BD628;
  id v17 = *(id *)(a1 + 40);
  id v19 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 48);
  [(CAAnimationDelegateBlockHelper *)v13 setAnimationDidStopBlock:v16];
  uint64_t v14 = 32;
  if (*(unsigned char *)(a1 + 72))
  {
    v15 = @"fadeInTarget";
  }
  else
  {
    uint64_t v14 = 40;
    v15 = @"fadeOutBlack";
  }
  [*(id *)(a1 + v14) addAnimation:v5 forKey:v15];
}

void ___FadeLayerThruBlack_block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperlayer];
  int v2 = *(void **)(a1 + 48);
  if (v2)
  {
    double v3 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___FadeLayerThruBlack_block_invoke_4;
    block[3] = &unk_1E55BFC80;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

uint64_t ___FadeLayerThruBlack_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end