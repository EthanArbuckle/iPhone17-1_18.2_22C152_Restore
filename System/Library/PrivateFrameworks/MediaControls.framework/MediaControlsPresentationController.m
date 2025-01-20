@interface MediaControlsPresentationController
+ (id)_backgroundEffectForTraitCollection:(id)a3 interactive:(BOOL)a4;
- (BOOL)_shouldRespectDefinesPresentationContext;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)shouldPresentInFullscreen;
- (CGPoint)sourcePoint;
- (CGRect)frameOfPresentedViewInContainerView;
- (MTMaterialView)materialView;
- (UIEdgeInsets)edgeInsets;
- (UIView)presentingView;
- (void)_dismissTap:(id)a3;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionWillBegin;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setMaterialView:(id)a3;
- (void)setPresentingView:(id)a3;
- (void)setSourcePoint:(CGPoint)a3;
@end

@implementation MediaControlsPresentationController

+ (id)_backgroundEffectForTraitCollection:(id)a3 interactive:(BOOL)a4
{
  return 0;
}

- (BOOL)shouldPresentInFullscreen
{
  return 0;
}

- (BOOL)_shouldRespectDefinesPresentationContext
{
  return 1;
}

- (void)presentationTransitionWillBegin
{
  v13.receiver = self;
  v13.super_class = (Class)MediaControlsPresentationController;
  [(UIPreviewPresentationController *)&v13 presentationTransitionWillBegin];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__dismissTap_];
  [v3 setDelegate:self];
  v4 = [(MediaControlsPresentationController *)self containerView];
  [v4 addGestureRecognizer:v3];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingView);
  if (!WeakRetained)
  {
    v6 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:4 configuration:3 initialWeighting:0.0];
    materialView = self->_materialView;
    self->_materialView = v6;

    v8 = [(MediaControlsPresentationController *)self containerView];
    [v8 bounds];
    -[MTMaterialView setFrame:](self->_materialView, "setFrame:");

    [(MTMaterialView *)self->_materialView setAutoresizingMask:18];
    [(MTMaterialView *)self->_materialView setShouldCrossfade:1];
    v9 = [(MediaControlsPresentationController *)self containerView];
    [v9 addSubview:self->_materialView];
  }
  v10 = [(MediaControlsPresentationController *)self presentedViewController];
  v11 = [v10 transitionCoordinator];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__MediaControlsPresentationController_presentationTransitionWillBegin__block_invoke;
  v12[3] = &unk_1E5F0E4A8;
  v12[4] = self;
  [v11 animateAlongsideTransition:v12 completion:0];
}

void __70__MediaControlsPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 448) setWeighting:1.0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 440));
  [WeakRetained setAlpha:0.0];
  CGAffineTransformMakeScale(&v4, 0.8, 0.8);
  CGAffineTransform v3 = v4;
  [WeakRetained setTransform:&v3];
}

- (void)dismissalTransitionWillBegin
{
  v6.receiver = self;
  v6.super_class = (Class)MediaControlsPresentationController;
  [(UIPreviewPresentationController *)&v6 dismissalTransitionWillBegin];
  CGAffineTransform v3 = [(MediaControlsPresentationController *)self presentedViewController];
  CGAffineTransform v4 = [v3 transitionCoordinator];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__MediaControlsPresentationController_dismissalTransitionWillBegin__block_invoke;
  v5[3] = &unk_1E5F0E4A8;
  v5[4] = self;
  [v4 animateAlongsideTransition:v5 completion:0];
}

void __67__MediaControlsPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 448) setWeighting:0.0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 440));
  [WeakRetained setAlpha:1.0];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [WeakRetained setTransform:v4];
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MediaControlsPresentationController;
  -[UIPreviewPresentationController dismissalTransitionDidEnd:](&v8, sel_dismissalTransitionDidEnd_);
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingView);
    [WeakRetained setAlpha:1.0];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v7[0] = *MEMORY[0x1E4F1DAB8];
    v7[1] = v6;
    v7[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [WeakRetained setTransform:v7];
  }
}

- (CGRect)frameOfPresentedViewInContainerView
{
  double x = self->_sourcePoint.x;
  double y = self->_sourcePoint.y;
  v5 = [(MediaControlsPresentationController *)self traitCollection];
  if (![v5 userInterfaceIdiom])
  {

LABEL_8:
    v9 = [(MediaControlsPresentationController *)self containerView];
    [v9 center];

    goto LABEL_9;
  }
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);

  if (x == v6 && y == v7) {
    goto LABEL_8;
  }
LABEL_9:
  v10 = [(MediaControlsPresentationController *)self containerView];
  v11 = [(MediaControlsPresentationController *)self presentedViewController];
  [v11 preferredContentSize];

  [v10 bounds];
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double v15 = v14 + left;
  CGFloat v17 = v16 + top;
  double v19 = v18 - (left + self->_edgeInsets.right);
  double v21 = v20 - (top + self->_edgeInsets.bottom);
  UIRectCenteredAboutPoint();
  CGFloat v22 = v52.origin.x;
  CGFloat v23 = v52.origin.y;
  CGFloat height = v52.size.height;
  CGFloat width = v52.size.width;
  double MinX = CGRectGetMinX(v52);
  CGFloat v25 = v15;
  v53.origin.double x = v15;
  CGFloat rect_8 = v17;
  v53.origin.double y = v17;
  v53.size.CGFloat width = v19;
  v53.size.CGFloat height = v21;
  CGFloat rect = v22;
  if (MinX >= CGRectGetMinX(v53))
  {
    v56.origin.double x = v22;
    CGFloat v28 = v23;
    v56.origin.double y = v23;
    CGFloat v30 = height;
    CGFloat v29 = width;
    v56.size.CGFloat width = width;
    v56.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v56);
    CGFloat v26 = v25;
    v57.origin.double x = v25;
    v57.origin.double y = rect_8;
    v57.size.CGFloat width = v19;
    v57.size.CGFloat height = v21;
    double v33 = 0.0;
    if (MaxX <= CGRectGetMaxX(v57)) {
      goto LABEL_14;
    }
    v58.origin.double x = v26;
    v58.origin.double y = rect_8;
    v58.size.CGFloat width = v19;
    v58.size.CGFloat height = v21;
    double v27 = CGRectGetMaxX(v58);
    v59.origin.double x = rect;
    v59.origin.double y = v28;
    v59.size.CGFloat width = width;
    v59.size.CGFloat height = height;
    double v31 = CGRectGetMaxX(v59);
  }
  else
  {
    CGFloat v26 = v15;
    v54.origin.double x = v15;
    v54.origin.double y = rect_8;
    v54.size.CGFloat width = v19;
    v54.size.CGFloat height = v21;
    double v27 = CGRectGetMinX(v54);
    v55.origin.double x = v22;
    CGFloat v28 = v23;
    v55.origin.double y = v23;
    CGFloat v30 = height;
    CGFloat v29 = width;
    v55.size.CGFloat width = width;
    v55.size.CGFloat height = height;
    double v31 = CGRectGetMinX(v55);
  }
  double v33 = v27 - v31 + 0.0;
LABEL_14:
  v60.origin.double x = rect;
  v60.origin.double y = v28;
  v60.size.CGFloat width = v29;
  v60.size.CGFloat height = v30;
  double MinY = CGRectGetMinY(v60);
  v61.origin.double x = v26;
  v61.origin.double y = rect_8;
  v61.size.CGFloat width = v19;
  v61.size.CGFloat height = v21;
  if (MinY < CGRectGetMinY(v61))
  {
    v62.origin.double x = v26;
    v62.origin.double y = rect_8;
    v62.size.CGFloat width = v19;
    v62.size.CGFloat height = v21;
    double v35 = CGRectGetMinY(v62);
    v63.origin.double x = rect;
    v63.origin.double y = v28;
    v63.size.CGFloat width = v29;
    v63.size.CGFloat height = v30;
    double v36 = CGRectGetMinY(v63);
LABEL_18:
    double v39 = v35 - v36 + 0.0;
    goto LABEL_19;
  }
  v64.origin.double x = rect;
  v64.origin.double y = v28;
  v64.size.CGFloat width = v29;
  v64.size.CGFloat height = v30;
  double MaxY = CGRectGetMaxY(v64);
  v65.origin.double x = v26;
  v65.origin.double y = rect_8;
  v65.size.CGFloat width = v19;
  v65.size.CGFloat height = v21;
  CGFloat v38 = CGRectGetMaxY(v65);
  double v39 = 0.0;
  if (MaxY > v38)
  {
    v66.origin.double x = v26;
    v66.origin.double y = rect_8;
    v66.size.CGFloat width = v19;
    v66.size.CGFloat height = v21;
    double v35 = CGRectGetMaxY(v66);
    v67.origin.double x = rect;
    v67.origin.double y = v28;
    v67.size.CGFloat width = v29;
    v67.size.CGFloat height = v30;
    double v36 = CGRectGetMaxY(v67);
    goto LABEL_18;
  }
LABEL_19:
  v68.origin.double x = rect;
  v68.origin.double y = v28;
  v68.size.CGFloat width = v29;
  v68.size.CGFloat height = v30;
  CGRect v69 = CGRectOffset(v68, v33, v39);
  CGFloat v40 = v69.origin.x;
  CGFloat v41 = v69.origin.y;
  CGFloat v42 = v69.size.width;
  CGFloat v43 = v69.size.height;

  double v44 = v40;
  double v45 = v41;
  double v46 = v42;
  double v47 = v43;
  result.size.CGFloat height = v47;
  result.size.CGFloat width = v46;
  result.origin.double y = v45;
  result.origin.double x = v44;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  double v6 = [(MediaControlsPresentationController *)self presentedViewController];
  double v7 = [v6 view];
  [v5 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  v12 = [(MediaControlsPresentationController *)self presentedViewController];
  objc_super v13 = [v12 view];
  LOBYTE(v6) = objc_msgSend(v13, "pointInside:withEvent:", 0, v9, v11) ^ 1;

  return (char)v6;
}

- (void)_dismissTap:(id)a3
{
  id v3 = [(MediaControlsPresentationController *)self presentedViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (UIView)presentingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingView);

  return (UIView *)WeakRetained;
}

- (void)setPresentingView:(id)a3
{
}

- (CGPoint)sourcePoint
{
  double x = self->_sourcePoint.x;
  double y = self->_sourcePoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSourcePoint:(CGPoint)a3
{
  self->_sourcePoint = a3;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (MTMaterialView)materialView
{
  return self->_materialView;
}

- (void)setMaterialView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialView, 0);

  objc_destroyWeak((id *)&self->_presentingView);
}

@end