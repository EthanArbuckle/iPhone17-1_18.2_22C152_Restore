@interface APUISystemApertureElementTransitionCoordinator
- (_TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
@end

@implementation APUISystemApertureElementTransitionCoordinator

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = _s18ActivityProgressUI46APUISystemApertureElementTransitionCoordinatorC19animationController12forPresented10presenting6sourceSo06UIViewJ21AnimatedTransitioning_pSgSo0oJ0C_A2KtF_0();

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = _s18ActivityProgressUI46APUISystemApertureElementTransitionCoordinatorC19animationController12forDismissedSo06UIViewJ21AnimatedTransitioning_pSgSo0mJ0C_tF_0();

  return v6;
}

- (_TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator)init
{
  return (_TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator *)APUISystemApertureElementTransitionCoordinator.init()();
}

- (void).cxx_destruct
{
}

@end