@interface HUCameraStreamFullScreenAnimator
- (CGRect)_adjustPresentedViewFrame:(CGRect)a3 forTransitionContext:(id)a4;
- (CGRect)_toViewFinalFrame:(id)a3;
- (HUCameraStreamFullScreenAnimator)initWithSourceCameraCell:(id)a3;
- (HUGridCameraCell)sourceCameraCell;
- (double)transitionDuration:(id)a3;
@end

@implementation HUCameraStreamFullScreenAnimator

- (HUCameraStreamFullScreenAnimator)initWithSourceCameraCell:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUCameraStreamFullScreenAnimator;
  v6 = [(HUCameraStreamFullScreenAnimator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sourceCameraCell, a3);
  }

  return v7;
}

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

- (CGRect)_toViewFinalFrame:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4F43EC0];
  id v4 = a3;
  id v5 = [v4 viewControllerForKey:v3];
  [v4 finalFrameForViewController:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_adjustPresentedViewFrame:(CGRect)a3 forTransitionContext:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  if ([MEMORY[0x1E4F69758] isAMac])
  {
    double v9 = [v8 containerView];
    [v9 safeAreaInsets];
    double x = x + v10;
    double y = y + v11;
    double width = width - (v10 + v12);
    double height = height - (v11 + v13);
  }
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (HUGridCameraCell)sourceCameraCell
{
  return self->_sourceCameraCell;
}

- (void).cxx_destruct
{
}

@end