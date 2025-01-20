@interface CPSBannerContainerView
- (BOOL)bannerHasAccessibilityFocus;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isBannerHidden;
- (BOOL)isTrackingBannerDismissGesture;
- (CPSBannerContainerView)initWithBannerView:(id)a3;
- (CPSBannerContainerView)initWithCoder:(id)a3;
- (CPSBannerContainerView)initWithFrame:(CGRect)a3;
- (UIView)bannerView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_accessibilityElementFocusDidChange:(id)a3;
- (void)_commonInit;
- (void)_dismissGestureRecognized:(id)a3;
- (void)_installBannerViewIfNeeded;
- (void)_removeBannerAnimationsIfNeeded;
- (void)_updateBannerContentSizeCategory;
- (void)setBannerHasAccessibilityFocus:(BOOL)a3;
- (void)setBannerHidden:(BOOL)a3;
- (void)setBannerHidden:(BOOL)a3 animated:(BOOL)a4 animationCompletion:(id)a5;
- (void)setBannerView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
- (void)willMoveToWindow:(id)a3;
@end

@implementation CPSBannerContainerView

- (CPSBannerContainerView)initWithBannerView:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F42D90] mainScreen];
  [v6 bounds];
  v10.receiver = self;
  v10.super_class = (Class)CPSBannerContainerView;
  v7 = -[CPSBannerContainerView initWithFrame:](&v10, sel_initWithFrame_);

  if (v7)
  {
    [(CPSBannerContainerView *)v7 _commonInit];
    objc_storeStrong((id *)&v7->_bannerView, a3);
    [(CPSBannerContainerView *)v7 _installBannerViewIfNeeded];
    v8 = v7;
  }

  return v7;
}

- (CPSBannerContainerView)initWithFrame:(CGRect)a3
{
  return -[CPSBannerContainerView initWithBannerView:](self, "initWithBannerView:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CPSBannerContainerView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPSBannerContainerView;
  v3 = [(CPSBannerContainerView *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(CPSBannerContainerView *)v3 _commonInit];
    id v5 = v4;
  }

  return v4;
}

- (void)_commonInit
{
  self->_bannerHidden = 1;
  v3 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:self action:sel__dismissGestureRecognized_];
  dismissGesture = self->_dismissGesture;
  self->_dismissGesture = v3;

  [(UIPanGestureRecognizer *)self->_dismissGesture setAllowedScrollTypesMask:2];
  [(UIPanGestureRecognizer *)self->_dismissGesture setDelegate:self];
  id v5 = self->_dismissGesture;

  [(CPSBannerContainerView *)self addGestureRecognizer:v5];
}

- (void)updateConstraints
{
  v4.receiver = self;
  v4.super_class = (Class)CPSBannerContainerView;
  [(CPSBannerContainerView *)&v4 updateConstraints];
  BOOL v3 = self->_bannerHidden && !self->_bannerCrossFading;
  objc_msgSend(MEMORY[0x1E4F28DC8], "cps_if:thenActivate:elseActivate:", v3, self->_verticalPositionConstraintWhenHidden, self->_verticalPositionConstraintWhenVisible);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CPSBannerContainerView;
  -[CPSBannerContainerView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v5 = (CPSBannerContainerView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    id v5 = 0;
  }
  objc_super v7 = v5;

  return v7;
}

- (void)willMoveToWindow:(id)a3
{
  id v5 = a3;
  if (self->_bannerHasAccessibilityFocus) {
    [(CPSBannerContainerView *)self setBannerHasAccessibilityFocus:0];
  }
  objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  if (v5) {
    [v4 addObserver:self selector:sel__accessibilityElementFocusDidChange_ name:*MEMORY[0x1E4F43420] object:0];
  }
  else {
    [v4 removeObserver:self name:*MEMORY[0x1E4F43420] object:0];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPSBannerContainerView;
  [(CPSBannerContainerView *)&v4 traitCollectionDidChange:a3];
  [(CPSBannerContainerView *)self _updateBannerContentSizeCategory];
}

- (void)setBannerView:(id)a3
{
  id v5 = (UIView *)a3;
  bannerView = self->_bannerView;
  if (bannerView != v5)
  {
    objc_super v7 = v5;
    [(UIView *)bannerView removeFromSuperview];
    [(UIView *)self->_bannerView _setLocalOverrideTraitCollection:0];
    objc_storeStrong((id *)&self->_bannerView, a3);
    bannerView = (UIView *)[(CPSBannerContainerView *)self _installBannerViewIfNeeded];
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](bannerView, v5);
}

- (void)setBannerHidden:(BOOL)a3 animated:(BOOL)a4 animationCompletion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  v8 = (void (**)(void))a5;
  if (self->_bannerHidden != v6)
  {
    if (v5)
    {
      [(CPSBannerContainerView *)self _removeBannerAnimationsIfNeeded];
      [(CPSBannerContainerView *)self layoutIfNeeded];
      [(CPSBannerContainerView *)self setBannerHidden:v6];
      [(CPSBannerContainerView *)self setNeedsUpdateConstraints];
      if (UIAccessibilityPrefersCrossFadeTransitions())
      {
        self->_bannerCrossFading = 1;
        double v9 = 0.0;
        if (v6) {
          double v9 = 1.0;
        }
        [(UIView *)self->_bannerView setAlpha:v9];
        objc_super v10 = (void *)MEMORY[0x1E4F42FF0];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __71__CPSBannerContainerView_setBannerHidden_animated_animationCompletion___block_invoke;
        v18[3] = &unk_1E6AE9020;
        v18[4] = self;
        BOOL v19 = v6;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __71__CPSBannerContainerView_setBannerHidden_animated_animationCompletion___block_invoke_2;
        v16[3] = &unk_1E6AE90C0;
        v16[4] = self;
        v17 = v8;
        [v10 animateWithDuration:v18 animations:v16 completion:0.2];
        v11 = v17;
      }
      else
      {
        v12 = (void *)MEMORY[0x1E4F42FF0];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __71__CPSBannerContainerView_setBannerHidden_animated_animationCompletion___block_invoke_3;
        v15[3] = &unk_1E6AE8DF0;
        v15[4] = self;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __71__CPSBannerContainerView_setBannerHidden_animated_animationCompletion___block_invoke_4;
        v13[3] = &unk_1E6AE90E8;
        v14 = v8;
        [v12 _animateUsingSpringWithDampingRatio:1 response:v15 tracking:v13 dampingRatioSmoothing:1.0 responseSmoothing:0.5 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.998];
        v11 = v14;
      }

      goto LABEL_12;
    }
    [(CPSBannerContainerView *)self setBannerHidden:v6];
    [(CPSBannerContainerView *)self setNeedsUpdateConstraints];
  }
  if (v8) {
    v8[2](v8);
  }
LABEL_12:
}

uint64_t __71__CPSBannerContainerView_setBannerHidden_animated_animationCompletion___block_invoke(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 472) setAlpha:v1];
}

uint64_t __71__CPSBannerContainerView_setBannerHidden_animated_animationCompletion___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 448) = 0;
  [*(id *)(*(void *)(a1 + 32) + 472) setAlpha:1.0];
  [*(id *)(a1 + 32) setNeedsUpdateConstraints];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __71__CPSBannerContainerView_setBannerHidden_animated_animationCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) updateConstraintsIfNeeded];
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

uint64_t __71__CPSBannerContainerView_setBannerHidden_animated_animationCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)isTrackingBannerDismissGesture
{
  return [(NSLayoutConstraint *)self->_verticalPositionConstraintForDismissGesture isActive];
}

- (void)_accessibilityElementFocusDidChange:(id)a3
{
  bannerView = self->_bannerView;
  BOOL v5 = [a3 userInfo];
  BOOL v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F43428]];
  uint64_t v7 = viewContainsAccessibilityElement(bannerView, v6);

  if (self->_bannerHasAccessibilityFocus != v7)
  {
    [(CPSBannerContainerView *)self setBannerHasAccessibilityFocus:v7];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_dismissGesture == a3)
  {
    bannerView = self->_bannerView;
    [a3 locationInView:bannerView];
    BOOL v5 = -[UIView hitTest:withEvent:](bannerView, "hitTest:withEvent:", 0);
    BOOL v3 = v5 != 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CPSBannerContainerView;
    return -[CPSBannerContainerView gestureRecognizerShouldBegin:](&v7, sel_gestureRecognizerShouldBegin_);
  }
  return v3;
}

- (void)_dismissGestureRecognized:(id)a3
{
  dismissGesture = self->_dismissGesture;
  id v5 = a3;
  [(UIPanGestureRecognizer *)dismissGesture translationInView:self];
  double v7 = v6;
  [(UIPanGestureRecognizer *)self->_dismissGesture velocityInView:self];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__CPSBannerContainerView__dismissGestureRecognized___block_invoke;
  v16[3] = &unk_1E6AE9110;
  v16[4] = self;
  *(double *)&void v16[5] = v7;
  v16[6] = v8;
  double v9 = (void (**)(void, void))MEMORY[0x1D9487A30](v16);
  uint64_t v10 = [v5 state];

  switch(v10)
  {
    case 1:
      -[UIPanGestureRecognizer setTranslation:inView:](self->_dismissGesture, "setTranslation:inView:", self, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      [(UIView *)self->_bannerView frame];
      self->_double verticalPositionOffsetForDismissGesture = CGRectGetMinY(v17);
      -[NSLayoutConstraint setConstant:](self->_verticalPositionConstraintForDismissGesture, "setConstant:");
      [(CPSBannerContainerView *)self willChangeValueForKey:@"trackingBannerDismissGesture"];
      [(NSLayoutConstraint *)self->_verticalPositionConstraintForDismissGesture setActive:1];
      [(CPSBannerContainerView *)self didChangeValueForKey:@"trackingBannerDismissGesture"];
      break;
    case 2:
      double verticalPositionOffsetForDismissGesture = self->_verticalPositionOffsetForDismissGesture;
      v13 = self->_bannerView;
      [(UIView *)v13 bounds];
      CGRectGetHeight(v18);
      BSUIConstrainValueWithRubberBand();
      [(UIView *)v13 contentScaleFactor];

      UIPointRoundToScale();
      double v15 = verticalPositionOffsetForDismissGesture + v14;
      if (v7 >= 0.0 || v15 <= self->_verticalPositionOffsetForDismissGesture) {
        [(NSLayoutConstraint *)self->_verticalPositionConstraintForDismissGesture setConstant:v15];
      }
      break;
    case 3:
      v9[2](v9, 0);
      break;
    case 4:
      v11 = [NSNumber numberWithBool:self->_bannerHidden];
      ((void (**)(void, void *))v9)[2](v9, v11);

      break;
    default:
      break;
  }
}

void __52__CPSBannerContainerView__dismissGestureRecognized___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 BOOLValue];
    char v6 = 0;
    double v7 = *(double *)(a1 + 40);
  }
  else
  {
    CGFloat v8 = -*(double *)(a1 + 40);
    [*(id *)(*(void *)(a1 + 32) + 472) frame];
    uint64_t v5 = CGRectGetMaxY(v24) * 0.5 < v8 || *(double *)(a1 + 48) < -100.0;
    [*(id *)(*(void *)(a1 + 32) + 416) constant];
    double v10 = v9;
    [*(id *)(*(void *)(a1 + 32) + 472) frame];
    if (v10 < -CGRectGetHeight(v25)) {
      char v6 = v5;
    }
    else {
      char v6 = 0;
    }
    [*(id *)(*(void *)(a1 + 32) + 472) frame];
    double Height = CGRectGetHeight(v26);
    [*(id *)(a1 + 32) safeAreaInsets];
    double v13 = -(Height + v12);
    [*(id *)(*(void *)(a1 + 32) + 472) frame];
    double v7 = v13 - CGRectGetMinY(v27);
  }
  [*(id *)(a1 + 32) willChangeValueForKey:@"trackingBannerDismissGesture"];
  [*(id *)(*(void *)(a1 + 32) + 416) setActive:0];
  [*(id *)(a1 + 32) didChangeValueForKey:@"trackingBannerDismissGesture"];
  double v14 = *(unsigned __int8 **)(a1 + 32);
  if (v14[464] != v5)
  {
    [v14 setBannerHidden:v5];
    [*(id *)(a1 + 32) setNeedsUpdateConstraints];
  }
  if ((v6 & 1) == 0)
  {
    double v15 = [MEMORY[0x1E4F39C90] animation];
    [v15 setStiffness:194.955149];
    [v15 stiffness];
    [v15 setDamping:sqrt(v16) * 1.7];
    if (v7 == 0.0) {
      double v17 = 0.0;
    }
    else {
      double v17 = *(double *)(a1 + 48) / v7;
    }
    [v15 setInitialVelocity:v17];
    id v18 = objc_alloc(MEMORY[0x1E4F42E18]);
    [v15 initialVelocity];
    v20 = objc_msgSend(v18, "initWithDampingRatio:initialVelocity:", 0.85, 0.0, v19);
    id v21 = objc_alloc(MEMORY[0x1E4F43008]);
    [v15 settlingDuration];
    v22 = objc_msgSend(v21, "initWithDuration:timingParameters:", v20);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __52__CPSBannerContainerView__dismissGestureRecognized___block_invoke_2;
    v23[3] = &unk_1E6AE8DF0;
    v23[4] = *(void *)(a1 + 32);
    [v22 addAnimations:v23];
    [v22 startAnimation];
  }
}

uint64_t __52__CPSBannerContainerView__dismissGestureRecognized___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) updateConstraintsIfNeeded];
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (void)_installBannerViewIfNeeded
{
  v35[3] = *MEMORY[0x1E4F143B8];
  bannerView = self->_bannerView;
  if (bannerView)
  {
    objc_super v4 = [(UIView *)bannerView superview];

    if (!v4)
    {
      [(UIView *)self->_bannerView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(CPSBannerContainerView *)self addSubview:self->_bannerView];
      uint64_t v5 = [(CPSBannerContainerView *)self safeAreaLayoutGuide];
      [(CPSBannerContainerView *)self willChangeValueForKey:@"trackingBannerDismissGesture"];
      char v6 = [(UIView *)self->_bannerView topAnchor];
      double v7 = [(CPSBannerContainerView *)self topAnchor];
      CGFloat v8 = [v6 constraintEqualToAnchor:v7];
      verticalPositionConstraintForDismissGesture = self->_verticalPositionConstraintForDismissGesture;
      self->_verticalPositionConstraintForDismissGesture = v8;

      [(CPSBannerContainerView *)self didChangeValueForKey:@"trackingBannerDismissGesture"];
      double v10 = [(UIView *)self->_bannerView topAnchor];
      v11 = [v5 topAnchor];
      double v12 = [v10 constraintEqualToAnchor:v11 constant:8.0];
      LODWORD(v13) = 1148829696;
      objc_msgSend(v12, "cps_setPriority:", v13);
      double v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      verticalPositionConstraintWhenVisible = self->_verticalPositionConstraintWhenVisible;
      self->_verticalPositionConstraintWhenVisible = v14;

      double v16 = [(UIView *)self->_bannerView bottomAnchor];
      double v17 = [(CPSBannerContainerView *)self topAnchor];
      id v18 = [v16 constraintEqualToAnchor:v17];
      LODWORD(v19) = 1148829696;
      objc_msgSend(v18, "cps_setPriority:", v19);
      v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      verticalPositionConstraintWhenHidden = self->_verticalPositionConstraintWhenHidden;
      self->_verticalPositionConstraintWhenHidden = v20;

      v32 = (void *)MEMORY[0x1E4F28DC8];
      [(UIView *)self->_bannerView centerXAnchor];
      v34 = v33 = v5;
      v22 = [v5 centerXAnchor];
      v23 = [v34 constraintEqualToAnchor:v22];
      v35[0] = v23;
      CGRect v24 = [(UIView *)self->_bannerView leadingAnchor];
      CGRect v25 = [v5 leadingAnchor];
      CGRect v26 = [v24 constraintGreaterThanOrEqualToAnchor:v25 constant:8.0];
      v35[1] = v26;
      CGRect v27 = [(UIView *)self->_bannerView widthAnchor];
      v28 = [v27 constraintEqualToConstant:556.0];
      LODWORD(v29) = 1144750080;
      v30 = objc_msgSend(v28, "cps_setPriority:", v29);
      v35[2] = v30;
      v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
      [v32 activateConstraints:v31];

      [(CPSBannerContainerView *)self _updateBannerContentSizeCategory];
    }
  }
}

- (void)_removeBannerAnimationsIfNeeded
{
  [(CPSBannerContainerView *)self bounds];
  CGFloat Width = CGRectGetWidth(v4);
  if (Width != self->_widthDuringLastBannerAnimation) {
    [(UIView *)self->_bannerView _removeAllRetargetableAnimations:0];
  }
  self->_widthDuringLastBannerAnimation = Width;
}

- (void)_updateBannerContentSizeCategory
{
  id v3 = (NSString *)*MEMORY[0x1E4F43790];
  CGRect v4 = [(CPSBannerContainerView *)self traitCollection];
  uint64_t v5 = [v4 preferredContentSizeCategory];
  NSComparisonResult v6 = UIContentSizeCategoryCompareToCategory(v3, v5);

  if (v6 == NSOrderedAscending)
  {
    id v8 = [MEMORY[0x1E4F42F80] traitCollectionWithPreferredContentSizeCategory:v3];
    [(UIView *)self->_bannerView _setLocalOverrideTraitCollection:v8];
  }
  else
  {
    bannerView = self->_bannerView;
    [(UIView *)bannerView _setLocalOverrideTraitCollection:0];
  }
}

- (UIView)bannerView
{
  return self->_bannerView;
}

- (BOOL)isBannerHidden
{
  return self->_bannerHidden;
}

- (void)setBannerHidden:(BOOL)a3
{
  self->_bannerHidden = a3;
}

- (BOOL)bannerHasAccessibilityFocus
{
  return self->_bannerHasAccessibilityFocus;
}

- (void)setBannerHasAccessibilityFocus:(BOOL)a3
{
  self->_bannerHasAccessibilityFocus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_verticalPositionConstraintWhenHidden, 0);
  objc_storeStrong((id *)&self->_verticalPositionConstraintWhenVisible, 0);
  objc_storeStrong((id *)&self->_verticalPositionConstraintForDismissGesture, 0);

  objc_storeStrong((id *)&self->_dismissGesture, 0);
}

@end