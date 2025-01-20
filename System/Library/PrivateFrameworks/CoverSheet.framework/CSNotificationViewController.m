@interface CSNotificationViewController
- (SBUIPresentableHomeGestureContext)homeGestureContext;
- (void)expandedPlatter:(id)a3 willDismissWithReason:(id)a4;
- (void)expandedPlatterDidPresent:(id)a3;
- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3;
- (void)setHomeGestureContext:(id)a3;
@end

@implementation CSNotificationViewController

- (void)expandedPlatterDidPresent:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CSNotificationViewController;
  [(NCNotificationShortLookViewController *)&v20 expandedPlatterDidPresent:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
  if (objc_opt_respondsToSelector())
  {
    v5 = [WeakRetained platterBarSwipeAffordanceViewForParticipant:self];
    [v5 addObserver:self];
    v6 = [(NCNotificationShortLookViewController *)self containerViewForExpandedContent];
    [v6 addSubview:v5];
    [v6 bounds];
    CGFloat x = v21.origin.x;
    CGFloat y = v21.origin.y;
    double width = v21.size.width;
    double height = v21.size.height;
    CGRectGetWidth(v21);
    objc_msgSend(v5, "sizeThatFits:", width, height);
    BSRectWithSize();
    double v12 = v11;
    CGFloat v14 = v13;
    double v16 = v15;
    double v18 = v17;
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.double width = width;
    v22.size.double height = height;
    double MaxY = CGRectGetMaxY(v22);
    v23.origin.CGFloat x = v12;
    v23.origin.CGFloat y = v14;
    v23.size.double width = v16;
    v23.size.double height = v18;
    objc_msgSend(v5, "setFrame:", v12, MaxY - CGRectGetHeight(v23), v16, v18);
    [v5 setAutoresizingMask:10];
  }
  [WeakRetained setWantsHomeGesture:1];
}

- (void)expandedPlatter:(id)a3 willDismissWithReason:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CSNotificationViewController;
  [(NCNotificationShortLookViewController *)&v6 expandedPlatter:a3 willDismissWithReason:a4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
  [WeakRetained setWantsHomeGesture:0];
}

- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3
{
  id v5 = [(NCNotificationShortLookViewController *)self presentedExpandedPlatterViewController];
  if (objc_opt_respondsToSelector())
  {
    id v3 = v5;
    v4 = [v3 dismisser];
    [v4 expandedPlatterPresentable:v3 requestsDismissalWithTrigger:2];
  }
}

- (SBUIPresentableHomeGestureContext)homeGestureContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);

  return (SBUIPresentableHomeGestureContext *)WeakRetained;
}

- (void)setHomeGestureContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end