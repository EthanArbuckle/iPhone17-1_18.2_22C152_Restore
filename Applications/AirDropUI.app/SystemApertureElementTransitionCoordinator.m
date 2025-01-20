@interface SystemApertureElementTransitionCoordinator
- (_TtC9AirDropUI42SystemApertureElementTransitionCoordinator)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
@end

@implementation SystemApertureElementTransitionCoordinator

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_10000A668();

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_10000A770();

  return v6;
}

- (_TtC9AirDropUI42SystemApertureElementTransitionCoordinator)init
{
  return (_TtC9AirDropUI42SystemApertureElementTransitionCoordinator *)sub_100008458();
}

- (void).cxx_destruct
{
}

@end