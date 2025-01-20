@interface MediaControlsAnimationController
- (double)transitionDuration:(id)a3;
- (id)initForPresenting:(BOOL)a3;
- (void)animateTransition:(id)a3;
@end

@implementation MediaControlsAnimationController

- (id)initForPresenting:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MediaControlsAnimationController;
  id result = [(MediaControlsAnimationController *)&v5 init];
  if (result) {
    *((unsigned char *)result + 8) = a3;
  }
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  long long v6 = *MEMORY[0x1E4F1DAB8];
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v23 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v24 = v7;
  *(_OWORD *)&v21.a = v6;
  *(_OWORD *)&v21.c = v23;
  *(_OWORD *)&v21.tx = v7;
  long long v22 = v6;
  if (self->_presenting)
  {
    v8 = [v4 viewForKey:*MEMORY[0x1E4FB30D0]];
    v9 = [v5 containerView];
    [v9 addSubview:v8];

    double v10 = 1.0;
    double v11 = 0.0;
    v12 = (CGAffineTransform *)&v22;
  }
  else
  {
    v8 = [v4 viewForKey:*MEMORY[0x1E4FB30C0]];
    double v10 = 0.0;
    double v11 = 1.0;
    v12 = &v21;
  }
  CGAffineTransformMakeScale(v12, 1.92, 1.92);
  if ([v5 isAnimated])
  {
    [v8 setAlpha:v11];
    v20[0] = v22;
    v20[1] = v23;
    v20[2] = v24;
    [v8 setTransform:v20];
    v13 = [MEMORY[0x1E4F318A0] standardSpringAnimator];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__MediaControlsAnimationController_animateTransition___block_invoke;
    v16[3] = &unk_1E5F0E360;
    id v17 = v8;
    double v18 = v10;
    CGAffineTransform v19 = v21;
    [v13 addAnimations:v16];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__MediaControlsAnimationController_animateTransition___block_invoke_2;
    v14[3] = &unk_1E5F0E388;
    id v15 = v5;
    [v13 addCompletion:v14];
    [v13 startAnimation];
  }
  else
  {
    [v5 completeTransition:1];
  }
}

uint64_t __54__MediaControlsAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
  long long v2 = *(_OWORD *)(a1 + 64);
  v4[0] = *(_OWORD *)(a1 + 48);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 80);
  return [*(id *)(a1 + 32) setTransform:v4];
}

uint64_t __54__MediaControlsAnimationController_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  unsigned int v4 = [v3 transitionWasCancelled] ^ 1;
  if (a2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v4;
  }

  return [v3 completeTransition:v5];
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

@end