@interface HUCameraStreamFullScreenPresentingAnimator
- (HMCameraSnapshot)cameraSnapshot;
- (HUCameraStreamFullScreenPresentingAnimator)initWithSourceCameraCell:(id)a3 cameraSnapshot:(id)a4;
- (HUCameraStreamFullScreenPresentingAnimator)initWithSourceCameraCell:(id)a3 cameraSnapshot:(id)a4 snapshotDemoURL:(id)a5;
- (NSURL)demoSnapshotURL;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setDemoSnapshotURL:(id)a3;
@end

@implementation HUCameraStreamFullScreenPresentingAnimator

- (HUCameraStreamFullScreenPresentingAnimator)initWithSourceCameraCell:(id)a3 cameraSnapshot:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUCameraStreamFullScreenPresentingAnimator;
  v8 = [(HUCameraStreamFullScreenAnimator *)&v11 initWithSourceCameraCell:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_cameraSnapshot, a4);
  }

  return v9;
}

- (HUCameraStreamFullScreenPresentingAnimator)initWithSourceCameraCell:(id)a3 cameraSnapshot:(id)a4 snapshotDemoURL:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUCameraStreamFullScreenPresentingAnimator;
  objc_super v11 = [(HUCameraStreamFullScreenAnimator *)&v14 initWithSourceCameraCell:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_cameraSnapshot, a4);
    objc_storeStrong((id *)&v12->_demoSnapshotURL, a5);
  }

  return v12;
}

- (double)transitionDuration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUCameraStreamFullScreenPresentingAnimator;
  [(HUCameraStreamFullScreenAnimator *)&v4 transitionDuration:a3];
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 containerView];
  v6 = [v4 viewForKey:*MEMORY[0x1E4F43EC8]];
  id v7 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [(HUCameraStreamFullScreenAnimator *)self _toViewFinalFrame:v4];
  v8 = objc_msgSend(v7, "initWithFrame:");
  id v9 = [MEMORY[0x1E4F428B8] systemBlackColor];
  [v8 setBackgroundColor:v9];

  [v8 setAlpha:0.0];
  [v5 addSubview:v8];
  id v10 = [(HUCameraStreamFullScreenAnimator *)self sourceCameraCell];
  [v10 cameraViewFrame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [(HUCameraStreamFullScreenAnimator *)self sourceCameraCell];
  objc_msgSend(v5, "convertRect:fromView:", v19, v12, v14, v16, v18);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2E768]), "initWithFrame:", v21, v23, v25, v27);
  [v28 setContentMode:1];
  v29 = [(HUCameraStreamFullScreenPresentingAnimator *)self cameraSnapshot];
  [v28 setCameraSource:v29];

  [v5 addSubview:v28];
  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled])
  {
    id v30 = objc_alloc(MEMORY[0x1E4F42A80]);
    v31 = [(HUCameraStreamFullScreenPresentingAnimator *)self demoSnapshotURL];
    v32 = [v31 path];
    v33 = (void *)[v30 initWithContentsOfFile:v32];

    v34 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v33];
    [v28 bounds];
    objc_msgSend(v34, "setFrame:");
    [v34 setContentMode:1];
    [v34 setAutoresizingMask:18];
    [v28 addSubview:v34];
  }
  v35 = [(HUCameraStreamFullScreenAnimator *)self sourceCameraCell];
  [v35 setCameraViewAlpha:0.0];

  v36 = (void *)MEMORY[0x1E4F42FF0];
  [(HUCameraStreamFullScreenPresentingAnimator *)self transitionDuration:v4];
  double v38 = v37;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __64__HUCameraStreamFullScreenPresentingAnimator_animateTransition___block_invoke;
  v51[3] = &unk_1E6386568;
  id v52 = v28;
  v53 = self;
  id v54 = v4;
  id v55 = v8;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __64__HUCameraStreamFullScreenPresentingAnimator_animateTransition___block_invoke_3;
  v44[3] = &unk_1E6386590;
  id v45 = v55;
  id v46 = v52;
  id v47 = v6;
  v48 = self;
  id v49 = v54;
  id v50 = v5;
  id v39 = v5;
  id v40 = v54;
  id v41 = v6;
  id v42 = v52;
  id v43 = v55;
  [v36 animateKeyframesWithDuration:327680 delay:v51 options:v44 animations:v38 completion:0.0];
}

void __64__HUCameraStreamFullScreenPresentingAnimator_animateTransition___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  [v2 _toViewFinalFrame:*(void *)(a1 + 48)];
  objc_msgSend(v2, "_adjustPresentedViewFrame:forTransitionContext:", *(void *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  v3 = (void *)MEMORY[0x1E4F42FF0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__HUCameraStreamFullScreenPresentingAnimator_animateTransition___block_invoke_2;
  v4[3] = &unk_1E6386018;
  id v5 = *(id *)(a1 + 56);
  [v3 addKeyframeWithRelativeStartTime:v4 relativeDuration:0.5 animations:0.5];
}

uint64_t __64__HUCameraStreamFullScreenPresentingAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __64__HUCameraStreamFullScreenPresentingAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(a1 + 40) removeFromSuperview];
  [*(id *)(a1 + 56) _toViewFinalFrame:*(void *)(a1 + 64)];
  objc_msgSend(*(id *)(a1 + 48), "setFrame:");
  [*(id *)(a1 + 72) addSubview:*(void *)(a1 + 48)];
  v2 = [*(id *)(a1 + 56) sourceCameraCell];
  [v2 setCameraViewAlpha:1.0];

  v3 = *(void **)(a1 + 64);

  return [v3 completeTransition:1];
}

- (HMCameraSnapshot)cameraSnapshot
{
  return self->_cameraSnapshot;
}

- (NSURL)demoSnapshotURL
{
  return self->_demoSnapshotURL;
}

- (void)setDemoSnapshotURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demoSnapshotURL, 0);

  objc_storeStrong((id *)&self->_cameraSnapshot, 0);
}

@end