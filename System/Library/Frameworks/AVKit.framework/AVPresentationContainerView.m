@interface AVPresentationContainerView
+ (Class)layerClass;
- (AVPresentationContainerViewAppearanceProxy)appearanceProxy;
- (BOOL)avkit_isCounterRotatedForTransition;
- (BOOL)avkit_isVideoGravityFrozen;
- (BOOL)isBeingDismissed;
- (BOOL)isBeingPresented;
- (BOOL)isCounterRotatingContentView;
- (BOOL)wantsAppearanceConfigValues;
- (BOOL)willBeginOrientationChange;
- (CGAffineTransform)_contentTransform;
- (UIEdgeInsets)avkit_overrideLayoutMarginsForCounterRotation;
- (UIEdgeInsets)avkit_overrideLayoutMarginsForInterfaceOrientation:(int64_t)a3;
- (UIView)presentationContainerContentView;
- (double)_continuousCornerRadius;
- (double)_cornerRadius;
- (double)_radiansForCounterRotation;
- (int64_t)fromOrientation;
- (int64_t)toOrientation;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setCornerRadius:(double)a3;
- (void)didStopTransition;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setBeingDismissed:(BOOL)a3;
- (void)setBeingPresented:(BOOL)a3;
- (void)setClipsToBounds:(BOOL)a3;
- (void)setCounterRotatingContentView:(BOOL)a3;
- (void)setFromOrientation:(int64_t)a3;
- (void)setPresentationContainerContentView:(id)a3;
- (void)setToOrientation:(int64_t)a3;
- (void)setWantsAppearanceConfigValues:(BOOL)a3;
- (void)setWillBeginOrientationChange:(BOOL)a3;
- (void)willBeginAdjustingOrientation;
- (void)willStartDismissalTransitionFromInterfaceOrientation:(int64_t)a3 toOrientation:(int64_t)a4 needsCounterRotation:(BOOL)a5;
- (void)willStartPresentationTransitionFromInterfaceOrientation:(int64_t)a3 toOrientation:(int64_t)a4 needsCounterRotation:(BOOL)a5;
@end

@implementation AVPresentationContainerView

- (void)setBackgroundColor:(id)a3
{
  id v5 = a3;
  BOOL v6 = [(AVPresentationContainerView *)self wantsAppearanceConfigValues];
  if (v6)
  {
    v3 = [(AVPresentationContainerView *)self appearanceProxy];
    [v3 backgroundColor];
  }
  else
  {
    [MEMORY[0x1E4FB1618] clearColor];
  v7 = };
  v11.receiver = self;
  v11.super_class = (Class)AVPresentationContainerView;
  [(AVPresentationContainerView *)&v11 setBackgroundColor:v7];
  if (v6)
  {

    v7 = v3;
  }

  v8 = [(AVPresentationContainerView *)self appearanceProxy];
  [v8 setBackgroundColor:v5];

  v9 = [(AVPresentationContainerView *)self appearanceProxy];
  v10 = [v9 actualView];
  [v10 setBackgroundColor:v5];
}

- (AVPresentationContainerViewAppearanceProxy)appearanceProxy
{
  v2 = [(AVPresentationContainerView *)self layer];
  v3 = [v2 appearanceProxy];

  return (AVPresentationContainerViewAppearanceProxy *)v3;
}

- (BOOL)wantsAppearanceConfigValues
{
  return self->_wantsAppearanceConfigValues;
}

- (void)setPresentationContainerContentView:(id)a3
{
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
}

- (void)setWillBeginOrientationChange:(BOOL)a3
{
  self->_willBeginOrientationChange = a3;
}

- (BOOL)willBeginOrientationChange
{
  return self->_willBeginOrientationChange;
}

- (void)setToOrientation:(int64_t)a3
{
  self->_toOrientation = a3;
}

- (int64_t)toOrientation
{
  return self->_toOrientation;
}

- (void)setFromOrientation:(int64_t)a3
{
  self->_fromOrientation = a3;
}

- (int64_t)fromOrientation
{
  return self->_fromOrientation;
}

- (void)setBeingDismissed:(BOOL)a3
{
  self->_beingDismissed = a3;
}

- (BOOL)isBeingDismissed
{
  return self->_beingDismissed;
}

- (void)setBeingPresented:(BOOL)a3
{
  self->_beingPresented = a3;
}

- (BOOL)isBeingPresented
{
  return self->_beingPresented;
}

- (UIView)presentationContainerContentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationContainerContentView);

  return (UIView *)WeakRetained;
}

- (void)setCounterRotatingContentView:(BOOL)a3
{
  self->_counterRotatingContentView = a3;
}

- (BOOL)isCounterRotatingContentView
{
  return self->_counterRotatingContentView;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)AVPresentationContainerView;
  [(AVPresentationContainerView *)&v21 layoutSubviews];
  v3 = [(AVPresentationContainerView *)self presentationContainerContentView];
  v4 = [v3 superview];

  if (v4 == self)
  {
    [(AVPresentationContainerView *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [(AVPresentationContainerView *)self presentationContainerContentView];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    [(AVPresentationContainerView *)self _contentTransform];
    v14 = [(AVPresentationContainerView *)self presentationContainerContentView];
    v20[0] = v20[3];
    v20[1] = v20[4];
    v20[2] = v20[5];
    [v14 setTransform:v20];

    [(AVPresentationContainerView *)self bounds];
    UIRectGetCenter();
    double v16 = v15;
    double v18 = v17;
    v19 = [(AVPresentationContainerView *)self presentationContainerContentView];
    objc_msgSend(v19, "setCenter:", v16, v18);
  }
}

- (void)setClipsToBounds:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVPresentationContainerView;
  [(AVPresentationContainerView *)&v8 setClipsToBounds:[(AVPresentationContainerView *)self wantsAppearanceConfigValues] & a3];
  double v5 = [(AVPresentationContainerView *)self appearanceProxy];
  [v5 setClipsToBounds:v3];

  double v6 = [(AVPresentationContainerView *)self appearanceProxy];
  double v7 = [v6 actualView];
  [v7 setClipsToBounds:v3];
}

- (double)_radiansForCounterRotation
{
  if ([(AVPresentationContainerView *)self fromOrientation] == 1)
  {
    int v3 = 0;
  }
  else if ([(AVPresentationContainerView *)self fromOrientation] == 4)
  {
    int v3 = 1;
  }
  else if ([(AVPresentationContainerView *)self fromOrientation] == 3)
  {
    int v3 = -1;
  }
  else
  {
    int v3 = 2 * ([(AVPresentationContainerView *)self fromOrientation] == 2);
  }
  if ([(AVPresentationContainerView *)self toOrientation] == 1)
  {
    int v4 = 0;
  }
  else if ([(AVPresentationContainerView *)self toOrientation] == 4)
  {
    int v4 = -1;
  }
  else if ([(AVPresentationContainerView *)self toOrientation] == 3)
  {
    int v4 = 1;
  }
  else if ([(AVPresentationContainerView *)self toOrientation] == 2)
  {
    int v4 = -2;
  }
  else
  {
    int v4 = 0;
  }
  return (double)(v4 + v3) * 1.57079633;
}

- (CGAffineTransform)_contentTransform
{
  result = (CGAffineTransform *)[(AVPresentationContainerView *)self isCounterRotatingContentView];
  if (result)
  {
    [(AVPresentationContainerView *)self _radiansForCounterRotation];
    CGAffineTransformMakeRotation(&v9, v6);
    return (CGAffineTransform *)UIIntegralTransform();
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4F1DAB8];
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v8;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v7 + 32);
  }
  return result;
}

- (void)didStopTransition
{
  [(AVPresentationContainerView *)self setBeingDismissed:0];
  [(AVPresentationContainerView *)self setBeingPresented:0];
  [(AVPresentationContainerView *)self setFromOrientation:[(AVPresentationContainerView *)self toOrientation]];
  [(AVPresentationContainerView *)self setCounterRotatingContentView:0];
  [(AVPresentationContainerView *)self setNeedsLayout];
  [(AVPresentationContainerView *)self layoutIfNeeded];

  [(AVPresentationContainerView *)self setWillBeginOrientationChange:0];
}

- (void)willStartDismissalTransitionFromInterfaceOrientation:(int64_t)a3 toOrientation:(int64_t)a4 needsCounterRotation:(BOOL)a5
{
  BOOL v5 = a5;
  [(AVPresentationContainerView *)self setBeingDismissed:1];
  [(AVPresentationContainerView *)self setFromOrientation:a3];
  [(AVPresentationContainerView *)self setToOrientation:a4];
  [(AVPresentationContainerView *)self setCounterRotatingContentView:v5];
  [(AVPresentationContainerView *)self setNeedsLayout];
  [(AVPresentationContainerView *)self layoutIfNeeded];

  [(AVPresentationContainerView *)self setWillBeginOrientationChange:0];
}

- (void)willStartPresentationTransitionFromInterfaceOrientation:(int64_t)a3 toOrientation:(int64_t)a4 needsCounterRotation:(BOOL)a5
{
  BOOL v5 = a5;
  [(AVPresentationContainerView *)self setBeingPresented:1];
  [(AVPresentationContainerView *)self setFromOrientation:a3];
  [(AVPresentationContainerView *)self setToOrientation:a4];
  [(AVPresentationContainerView *)self setCounterRotatingContentView:v5];
  [(AVPresentationContainerView *)self setNeedsLayout];
  [(AVPresentationContainerView *)self layoutIfNeeded];

  [(AVPresentationContainerView *)self setWillBeginOrientationChange:0];
}

- (UIEdgeInsets)avkit_overrideLayoutMarginsForCounterRotation
{
  if (![(AVPresentationContainerView *)self avkit_isCounterRotatedForTransition]) {
    goto LABEL_7;
  }
  if (![(AVPresentationContainerView *)self isBeingPresented])
  {
    if ([(AVPresentationContainerView *)self isBeingDismissed])
    {
      int64_t v3 = [(AVPresentationContainerView *)self fromOrientation];
      goto LABEL_6;
    }
LABEL_7:
    double v4 = 2.22507386e-308;
    double v5 = 2.22507386e-308;
    double v6 = 2.22507386e-308;
    double v7 = 2.22507386e-308;
    goto LABEL_8;
  }
  int64_t v3 = [(AVPresentationContainerView *)self toOrientation];
LABEL_6:
  [(AVPresentationContainerView *)self avkit_overrideLayoutMarginsForInterfaceOrientation:v3];
LABEL_8:
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)avkit_overrideLayoutMarginsForInterfaceOrientation:(int64_t)a3
{
  double v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];
  if ((unint64_t)(a3 - 3) > 1 || v5)
  {

    goto LABEL_6;
  }
  double v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  double v7 = [v6 traitCollection];
  [v7 displayCornerRadius];
  double v9 = v8;

  if (v9 <= 0.0)
  {
LABEL_6:
    double v10 = 2.22507386e-308;
    goto LABEL_7;
  }
  double v10 = 27.0;
LABEL_7:
  double v11 = v10;
  double v12 = v10;
  double v13 = v10;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (BOOL)avkit_isCounterRotatedForTransition
{
  if ([(AVPresentationContainerView *)self isBeingDismissed]
    || (BOOL v3 = [(AVPresentationContainerView *)self isBeingPresented]))
  {
    int64_t v4 = [(AVPresentationContainerView *)self fromOrientation];
    LOBYTE(v3) = v4 != [(AVPresentationContainerView *)self toOrientation];
  }
  return v3;
}

- (BOOL)avkit_isVideoGravityFrozen
{
  BOOL v3 = [(AVPresentationContainerView *)self willBeginOrientationChange];
  if (v3)
  {
    int64_t v4 = [(AVPresentationContainerView *)self window];
    char v5 = [v4 _windowOwnsInterfaceOrientation];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)willBeginAdjustingOrientation
{
}

- (void)_setCornerRadius:(double)a3
{
  char v5 = [(AVPresentationContainerView *)self layer];
  [v5 setCornerRadius:a3];

  uint64_t v6 = *MEMORY[0x1E4F39EA0];
  double v7 = [(AVPresentationContainerView *)self layer];
  [v7 setCornerCurve:v6];

  double v8 = [(AVPresentationContainerView *)self layer];
  double v9 = [v8 appearanceProxy];
  uint64_t v10 = [v9 maskedCorners];
  double v11 = [(AVPresentationContainerView *)self layer];
  [v11 setMaskedCorners:v10];

  if (a3 > 0.0)
  {
    [(AVPresentationContainerView *)self setClipsToBounds:1];
  }
}

- (double)_cornerRadius
{
  BOOL v3 = [(AVPresentationContainerView *)self layer];
  int64_t v4 = [v3 cornerCurve];
  double v5 = 0.0;
  if (v4 == (void *)*MEMORY[0x1E4F39EA0])
  {
    uint64_t v6 = [(AVPresentationContainerView *)self layer];
    [v6 cornerRadius];
    double v5 = v7;
  }
  return v5;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  double v5 = [(AVPresentationContainerView *)self layer];
  [v5 setCornerRadius:a3];

  uint64_t v6 = *MEMORY[0x1E4F39EA8];
  double v7 = [(AVPresentationContainerView *)self layer];
  [v7 setCornerCurve:v6];

  double v8 = [(AVPresentationContainerView *)self layer];
  double v9 = [v8 appearanceProxy];
  uint64_t v10 = [v9 maskedCorners];
  double v11 = [(AVPresentationContainerView *)self layer];
  [v11 setMaskedCorners:v10];

  if (a3 > 0.0)
  {
    [(AVPresentationContainerView *)self setClipsToBounds:1];
  }
}

- (double)_continuousCornerRadius
{
  BOOL v3 = [(AVPresentationContainerView *)self layer];
  int64_t v4 = [v3 cornerCurve];
  double v5 = 0.0;
  if (v4 == (void *)*MEMORY[0x1E4F39EA8])
  {
    uint64_t v6 = [(AVPresentationContainerView *)self layer];
    [v6 cornerRadius];
    double v5 = v7;
  }
  return v5;
}

- (void)setWantsAppearanceConfigValues:(BOOL)a3
{
  if (self->_wantsAppearanceConfigValues != a3)
  {
    BOOL v4 = a3;
    self->_wantsAppearanceConfigValues = a3;
    if (a3)
    {
      BOOL v3 = [(AVPresentationContainerView *)self appearanceProxy];
      [v3 backgroundColor];
    }
    else
    {
      [MEMORY[0x1E4FB1618] clearColor];
    uint64_t v6 = };
    v8.receiver = self;
    v8.super_class = (Class)AVPresentationContainerView;
    [(AVPresentationContainerView *)&v8 setBackgroundColor:v6];
    if (v4)
    {

      uint64_t v6 = v3;
    }

    double v7 = [(AVPresentationContainerView *)self layer];
    [v7 setWantsAppearanceConfigValues:v4];
  }
}

@end