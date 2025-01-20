@interface MKLookAroundDismissAnimationController
- (BOOL)_shouldUseSpringWithDampingAnimationStyle;
- (MKLookAroundDismissAnimationController)initWithSourceView:(id)a3 finalFrame:(CGRect)a4;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation MKLookAroundDismissAnimationController

- (MKLookAroundDismissAnimationController)initWithSourceView:(id)a3 finalFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MKLookAroundDismissAnimationController;
  v11 = [(MKLookAroundDismissAnimationController *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sourceView, a3);
    v12->_finalFrame.origin.CGFloat x = x;
    v12->_finalFrame.origin.CGFloat y = y;
    v12->_finalFrame.size.CGFloat width = width;
    v12->_finalFrame.size.CGFloat height = height;
  }

  return v12;
}

- (BOOL)_shouldUseSpringWithDampingAnimationStyle
{
  return GEOConfigGetBOOL();
}

- (double)transitionDuration:(id)a3
{
  GEOConfigGetDouble();
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewControllerForKey:*MEMORY[0x1E4F43EC0]];
  if (v5)
  {
    v6 = [v4 containerView];
    v7 = self->_sourceView;
    CGSize size = self->_finalFrame.size;
    CGPoint origin = self->_finalFrame.origin;
    CGSize v41 = size;
    [(MKLookAroundDismissAnimationController *)self transitionDuration:v4];
    double v10 = v9;
    v11 = [v4 viewForKey:*MEMORY[0x1E4F43EC8]];
    if (v11) {
      [v6 insertSubview:v11 atIndex:0];
    }
    [v6 addSubview:v7];
    BOOL v12 = [(MKLookAroundDismissAnimationController *)self _shouldUseSpringWithDampingAnimationStyle];
    v13 = (void *)MEMORY[0x1E4F42FF0];
    if (v12)
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __60__MKLookAroundDismissAnimationController_animateTransition___block_invoke;
      v36[3] = &unk_1E54B9040;
      v23 = (id *)&v37;
      objc_super v14 = v7;
      CGPoint v38 = origin;
      v37 = v14;
      CGSize v39 = v41;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __60__MKLookAroundDismissAnimationController_animateTransition___block_invoke_2;
      v32[3] = &unk_1E54B9068;
      v15 = (id *)&v33;
      v33 = v14;
      v16 = &v34;
      v17 = &v35;
      id v34 = v4;
      v35 = v11;
      id v18 = v11;
      v19 = v14;
      [v13 animateWithDuration:0 delay:v36 usingSpringWithDamping:v32 initialSpringVelocity:v10 options:0.0 animations:0.666666687 completion:0.0];
    }
    else
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __60__MKLookAroundDismissAnimationController_animateTransition___block_invoke_3;
      v28[3] = &unk_1E54B9040;
      v23 = (id *)&v29;
      v20 = v7;
      CGPoint v30 = origin;
      CGSize v31 = v41;
      v29 = v20;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __60__MKLookAroundDismissAnimationController_animateTransition___block_invoke_4;
      v24[3] = &unk_1E54B9068;
      v15 = (id *)&v25;
      v25 = v20;
      v16 = &v26;
      v17 = &v27;
      id v26 = v4;
      v27 = v11;
      id v21 = v11;
      v22 = v20;
      [v13 animateWithDuration:0 delay:v28 options:v24 animations:v10 completion:0.0];
    }
  }
}

uint64_t __60__MKLookAroundDismissAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __60__MKLookAroundDismissAnimationController_animateTransition___block_invoke_2(id *a1)
{
  [a1[4] removeFromSuperview];
  if ([a1[5] transitionWasCancelled]) {
    [a1[6] removeFromSuperview];
  }
  id v2 = a1[5];
  uint64_t v3 = [v2 transitionWasCancelled] ^ 1;

  return [v2 completeTransition:v3];
}

uint64_t __60__MKLookAroundDismissAnimationController_animateTransition___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __60__MKLookAroundDismissAnimationController_animateTransition___block_invoke_4(id *a1)
{
  [a1[4] removeFromSuperview];
  if ([a1[5] transitionWasCancelled]) {
    [a1[6] removeFromSuperview];
  }
  id v2 = a1[5];
  uint64_t v3 = [v2 transitionWasCancelled] ^ 1;

  return [v2 completeTransition:v3];
}

- (void).cxx_destruct
{
}

@end