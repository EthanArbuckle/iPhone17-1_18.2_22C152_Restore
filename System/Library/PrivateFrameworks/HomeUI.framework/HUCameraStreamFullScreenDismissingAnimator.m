@interface HUCameraStreamFullScreenDismissingAnimator
- (HUCameraStreamFullScreenDismissingAnimator)initWithSourceCameraCell:(id)a3 cameraViewSnapshot:(id)a4 cameraOverlaySnapshot:(id)a5;
- (UIView)cameraOverlaySnapshot;
- (UIView)cameraViewSnapshot;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation HUCameraStreamFullScreenDismissingAnimator

- (HUCameraStreamFullScreenDismissingAnimator)initWithSourceCameraCell:(id)a3 cameraViewSnapshot:(id)a4 cameraOverlaySnapshot:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUCameraStreamFullScreenDismissingAnimator;
  v11 = [(HUCameraStreamFullScreenAnimator *)&v14 initWithSourceCameraCell:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_cameraViewSnapshot, a4);
    objc_storeStrong((id *)&v12->_cameraOverlaySnapshot, a5);
  }

  return v12;
}

- (double)transitionDuration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUCameraStreamFullScreenDismissingAnimator;
  [(HUCameraStreamFullScreenAnimator *)&v4 transitionDuration:a3];
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 containerView];
  v6 = [v4 viewForKey:*MEMORY[0x1E4F43EB8]];
  v7 = [v4 viewForKey:*MEMORY[0x1E4F43EC8]];
  id v8 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [v6 frame];
  id v9 = objc_msgSend(v8, "initWithFrame:");
  id v10 = [MEMORY[0x1E4F428B8] systemBlackColor];
  [v9 setBackgroundColor:v10];

  v11 = [(HUCameraStreamFullScreenDismissingAnimator *)self cameraViewSnapshot];
  [v11 frame];
  objc_msgSend(v5, "convertRect:fromView:", v6);
  -[HUCameraStreamFullScreenAnimator _adjustPresentedViewFrame:forTransitionContext:](self, "_adjustPresentedViewFrame:forTransitionContext:", v4);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(HUCameraStreamFullScreenDismissingAnimator *)self cameraViewSnapshot];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  v21 = [(HUCameraStreamFullScreenDismissingAnimator *)self cameraViewSnapshot];
  [v21 setContentMode:1];

  v22 = [(HUCameraStreamFullScreenDismissingAnimator *)self cameraOverlaySnapshot];
  [v22 frame];
  objc_msgSend(v5, "convertRect:fromView:", v6);
  -[HUCameraStreamFullScreenAnimator _adjustPresentedViewFrame:forTransitionContext:](self, "_adjustPresentedViewFrame:forTransitionContext:", v4);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  v31 = [(HUCameraStreamFullScreenDismissingAnimator *)self cameraOverlaySnapshot];
  objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);

  [v6 removeFromSuperview];
  [(HUCameraStreamFullScreenAnimator *)self _toViewFinalFrame:v4];
  objc_msgSend(v7, "setFrame:");
  [v5 addSubview:v7];
  [v5 addSubview:v9];
  v32 = [(HUCameraStreamFullScreenDismissingAnimator *)self cameraViewSnapshot];
  [v5 addSubview:v32];

  v33 = [(HUCameraStreamFullScreenDismissingAnimator *)self cameraOverlaySnapshot];
  [v5 addSubview:v33];

  v34 = [(HUCameraStreamFullScreenAnimator *)self sourceCameraCell];
  [v34 setCameraViewAlpha:0.0];

  v35 = (void *)MEMORY[0x1E4F42FF0];
  [(HUCameraStreamFullScreenDismissingAnimator *)self transitionDuration:v4];
  double v37 = v36;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __64__HUCameraStreamFullScreenDismissingAnimator_animateTransition___block_invoke;
  v43[3] = &unk_1E6386340;
  id v44 = v5;
  v45 = self;
  id v46 = v9;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __64__HUCameraStreamFullScreenDismissingAnimator_animateTransition___block_invoke_3;
  v41[3] = &unk_1E63865B8;
  v41[4] = self;
  id v42 = v4;
  id v38 = v4;
  id v39 = v9;
  id v40 = v5;
  [v35 animateKeyframesWithDuration:327680 delay:v43 options:v41 animations:v37 completion:0.0];
}

void __64__HUCameraStreamFullScreenDismissingAnimator_animateTransition___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) sourceCameraCell];
  [v3 cameraViewFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [*(id *)(a1 + 40) sourceCameraCell];
  objc_msgSend(v2, "convertRect:fromView:", v12, v5, v7, v9, v11);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  v21 = [*(id *)(a1 + 40) cameraViewSnapshot];
  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

  v22 = [*(id *)(a1 + 40) cameraOverlaySnapshot];
  objc_msgSend(v22, "setFrame:", v14, v16, v18, v20);

  double v23 = (void *)MEMORY[0x1E4F42FF0];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __64__HUCameraStreamFullScreenDismissingAnimator_animateTransition___block_invoke_2;
  v26[3] = &unk_1E63850E0;
  id v24 = *(id *)(a1 + 48);
  uint64_t v25 = *(void *)(a1 + 40);
  id v27 = v24;
  uint64_t v28 = v25;
  [v23 addKeyframeWithRelativeStartTime:v26 relativeDuration:0.0 animations:0.5];
}

void __64__HUCameraStreamFullScreenDismissingAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = [*(id *)(a1 + 40) cameraOverlaySnapshot];
  [v2 setAlpha:0.0];
}

uint64_t __64__HUCameraStreamFullScreenDismissingAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sourceCameraCell];
  [v2 setCameraViewAlpha:1.0];

  v3 = *(void **)(a1 + 40);

  return [v3 completeTransition:1];
}

- (UIView)cameraViewSnapshot
{
  return self->_cameraViewSnapshot;
}

- (UIView)cameraOverlaySnapshot
{
  return self->_cameraOverlaySnapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraOverlaySnapshot, 0);

  objc_storeStrong((id *)&self->_cameraViewSnapshot, 0);
}

@end