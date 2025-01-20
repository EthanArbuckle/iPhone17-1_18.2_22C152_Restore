@interface HUQuickControlSimpleInteractionCoordinator
- (BOOL)hasStartedSecondTouch;
- (BOOL)isUserInteractionActive;
- (BOOL)isUserInteractionEnabled;
- (BOOL)shouldDismissAutomatically;
- (HUQuickControlInteractiveViewController)contraptionViewController;
- (HUQuickControlSimpleInteractionCoordinator)initWithContraptionViewController:(id)a3 delegate:(id)a4;
- (HUQuickControlSimpleInteractionCoordinator)initWithControlView:(id)a3 delegate:(id)a4;
- (id)value;
- (void)_requestDismissalIfNecessary;
- (void)_setValue:(id)a3 notifyDelegate:(BOOL)a4 updateControlView:(BOOL)a5;
- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3;
- (void)controlView:(id)a3 interactionStateDidChange:(BOOL)a4 forFirstTouch:(BOOL)a5;
- (void)controlView:(id)a3 valueDidChange:(id)a4;
- (void)setHasStartedSecondTouch:(BOOL)a3;
- (void)setShouldDismissAutomatically:(BOOL)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setValue:(id)a3;
@end

@implementation HUQuickControlSimpleInteractionCoordinator

- (HUQuickControlSimpleInteractionCoordinator)initWithContraptionViewController:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 view];
  v10 = [(HUQuickControlSimpleInteractionCoordinator *)self initWithControlView:v9 delegate:v8];

  if (v10) {
    objc_storeStrong((id *)&v10->_contraptionViewController, a3);
  }

  return v10;
}

- (HUQuickControlSimpleInteractionCoordinator)initWithControlView:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUQuickControlSimpleInteractionCoordinator;
  id v7 = [(HUQuickControlInteractionCoordinator *)&v10 initWithControlView:v6 delegate:a4];
  id v8 = v7;
  if (v7)
  {
    v7->_shouldDismissAutomatically = 1;
    [v6 setInteractionDelegate:v7];
  }

  return v8;
}

- (void)beginUserInteractionWithFirstTouchGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = [(HUQuickControlInteractionCoordinator *)self controlView];
  [v5 beginUserInteractionWithFirstTouchGestureRecognizer:v4];
}

- (BOOL)isUserInteractionActive
{
  v2 = [(HUQuickControlInteractionCoordinator *)self controlView];
  char v3 = [v2 isUserInteractionActive];

  return v3;
}

- (BOOL)isUserInteractionEnabled
{
  v2 = [(HUQuickControlInteractionCoordinator *)self controlView];
  char v3 = [v2 isUserInteractionEnabled];

  return v3;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUQuickControlInteractionCoordinator *)self controlView];
  [v4 setUserInteractionEnabled:v3];
}

- (void)setValue:(id)a3
{
}

- (void)_setValue:(id)a3 notifyDelegate:(BOOL)a4 updateControlView:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v11 = a3;
  objc_storeStrong(&self->_value, a3);
  if (v5)
  {
    v9 = [(HUQuickControlInteractionCoordinator *)self controlView];
    [v9 setValue:v11];
  }
  if (v6)
  {
    objc_super v10 = [(HUQuickControlInteractionCoordinator *)self delegate];
    [v10 interactionCoordinator:self viewValueDidChange:v11];
  }
}

- (void)_requestDismissalIfNecessary
{
  if ([(HUQuickControlSimpleInteractionCoordinator *)self shouldDismissAutomatically])
  {
    if (![(HUQuickControlSimpleInteractionCoordinator *)self isUserInteractionActive]
      && ![(HUQuickControlSimpleInteractionCoordinator *)self hasStartedSecondTouch])
    {
      BOOL v3 = [(HUQuickControlInteractionCoordinator *)self delegate];
      int v4 = [v3 hasModelValueChangedForInteractionCoordinator:self];

      if (v4)
      {
        id v5 = [(HUQuickControlInteractionCoordinator *)self delegate];
        [v5 interactionCoordinatorWantsDismissal:self];
      }
    }
  }
}

- (void)controlView:(id)a3 valueDidChange:(id)a4
{
  id v9 = a4;
  uint64_t v5 = [(HUQuickControlSimpleInteractionCoordinator *)self value];
  if ((id)v5 == v9)
  {

    [(HUQuickControlSimpleInteractionCoordinator *)self _setValue:v9 notifyDelegate:1 updateControlView:0];
  }
  else
  {
    BOOL v6 = (void *)v5;
    id v7 = [(HUQuickControlSimpleInteractionCoordinator *)self value];
    char v8 = [v7 isEqual:v9];

    [(HUQuickControlSimpleInteractionCoordinator *)self _setValue:v9 notifyDelegate:1 updateControlView:0];
    if ((v8 & 1) == 0) {
      [(HUQuickControlSimpleInteractionCoordinator *)self _requestDismissalIfNecessary];
    }
  }
}

- (void)controlView:(id)a3 interactionStateDidChange:(BOOL)a4 forFirstTouch:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  char v8 = [(HUQuickControlInteractionCoordinator *)self delegate];
  [v8 interactionCoordinator:self interactionStateDidChange:v6];

  [(HUQuickControlSimpleInteractionCoordinator *)self setHasStartedSecondTouch:!v5];
  if (!v6)
  {
    [(HUQuickControlSimpleInteractionCoordinator *)self _requestDismissalIfNecessary];
  }
}

- (id)value
{
  return self->_value;
}

- (BOOL)shouldDismissAutomatically
{
  return self->_shouldDismissAutomatically;
}

- (void)setShouldDismissAutomatically:(BOOL)a3
{
  self->_shouldDismissAutomatically = a3;
}

- (HUQuickControlInteractiveViewController)contraptionViewController
{
  return self->_contraptionViewController;
}

- (BOOL)hasStartedSecondTouch
{
  return self->_hasStartedSecondTouch;
}

- (void)setHasStartedSecondTouch:(BOOL)a3
{
  self->_hasStartedSecondTouch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contraptionViewController, 0);

  objc_storeStrong(&self->_value, 0);
}

@end