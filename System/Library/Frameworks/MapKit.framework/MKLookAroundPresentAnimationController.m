@interface MKLookAroundPresentAnimationController
- (BOOL)_shouldUseSpringWithDampingAnimationStyle;
- (MKLookAroundPresentAnimationController)initWithSourceView:(id)a3 initialFrame:(CGRect)a4;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation MKLookAroundPresentAnimationController

- (MKLookAroundPresentAnimationController)initWithSourceView:(id)a3 initialFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MKLookAroundPresentAnimationController;
  v11 = [(MKLookAroundPresentAnimationController *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sourceView, a3);
    v12->_initialFrame.origin.CGFloat x = x;
    v12->_initialFrame.origin.CGFloat y = y;
    v12->_initialFrame.size.CGFloat width = width;
    v12->_initialFrame.size.CGFloat height = height;
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
    [v4 finalFrameForViewController:v5];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    [(MKLookAroundPresentAnimationController *)self transitionDuration:v4];
    double v17 = v16;
    v18 = [v4 viewForKey:*MEMORY[0x1E4F43EC8]];
    if (v18) {
      [v6 addSubview:v18];
    }
    [v6 addSubview:v7];
    [v18 setHidden:1];
    -[UIView setFrame:](v7, "setFrame:", self->_initialFrame.origin.x, self->_initialFrame.origin.y, self->_initialFrame.size.width, self->_initialFrame.size.height);
    objc_msgSend(v18, "setFrame:", v9, v11, v13, v15);
    BOOL v19 = [(MKLookAroundPresentAnimationController *)self _shouldUseSpringWithDampingAnimationStyle];
    v20 = (void *)MEMORY[0x1E4F42FF0];
    if (v19)
    {
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __60__MKLookAroundPresentAnimationController_animateTransition___block_invoke;
      v41[3] = &unk_1E54B9040;
      v30 = (id *)v42;
      v21 = v7;
      v42[0] = v21;
      *(double *)&v42[1] = v9;
      *(double *)&v42[2] = v11;
      *(double *)&v42[3] = v13;
      *(double *)&v42[4] = v15;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __60__MKLookAroundPresentAnimationController_animateTransition___block_invoke_2;
      v37[3] = &unk_1E54B9068;
      v22 = &v38;
      v23 = (id *)&v39;
      v38 = v18;
      v39 = v21;
      v24 = &v40;
      id v40 = v4;
      v25 = v21;
      id v26 = v18;
      [v20 animateWithDuration:0 delay:v41 usingSpringWithDamping:v37 initialSpringVelocity:v17 options:0.0 animations:0.666666687 completion:0.0];
    }
    else
    {
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __60__MKLookAroundPresentAnimationController_animateTransition___block_invoke_3;
      v35[3] = &unk_1E54B9040;
      v30 = (id *)v36;
      v27 = v7;
      v36[0] = v27;
      *(double *)&v36[1] = v9;
      *(double *)&v36[2] = v11;
      *(double *)&v36[3] = v13;
      *(double *)&v36[4] = v15;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __60__MKLookAroundPresentAnimationController_animateTransition___block_invoke_4;
      v31[3] = &unk_1E54B9068;
      v22 = &v32;
      v23 = (id *)&v33;
      v32 = v18;
      v33 = v27;
      v24 = &v34;
      id v34 = v4;
      v28 = v27;
      id v29 = v18;
      [v20 animateWithDuration:0 delay:v35 options:v31 animations:v17 completion:0.0];
    }
  }
}

uint64_t __60__MKLookAroundPresentAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __60__MKLookAroundPresentAnimationController_animateTransition___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:0];
  [*(id *)(a1 + 40) removeFromSuperview];
  v2 = *(void **)(a1 + 48);
  uint64_t v3 = [v2 transitionWasCancelled] ^ 1;

  return [v2 completeTransition:v3];
}

uint64_t __60__MKLookAroundPresentAnimationController_animateTransition___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __60__MKLookAroundPresentAnimationController_animateTransition___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:0];
  [*(id *)(a1 + 40) removeFromSuperview];
  v2 = *(void **)(a1 + 48);
  uint64_t v3 = [v2 transitionWasCancelled] ^ 1;

  return [v2 completeTransition:v3];
}

- (void).cxx_destruct
{
}

@end