@interface SessionsTransitioningDelegate
- (_TtC13MediaControls29SessionsTransitioningDelegate)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
@end

@implementation SessionsTransitioningDelegate

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = sub_1AE8FD3A8(v8, a4);

  return v12;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13MediaControls29SessionsTransitioningDelegate_presentationStyle))
  {
    id v5 = 0;
  }
  else
  {
    type metadata accessor for SessionsPresentationAnimationController();
    id v10 = a3;
    id v11 = a4;
    id v12 = a5;
    v13 = self;
    id v5 = sub_1AE9318C8(0, (uint64_t)v10);
  }

  return v5;
}

- (id)animationControllerForDismissedController:(id)a3
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13MediaControls29SessionsTransitioningDelegate_presentationStyle))
  {
    id v3 = 0;
  }
  else
  {
    type metadata accessor for SessionsPresentationAnimationController();
    id v6 = a3;
    v7 = self;
    id v3 = sub_1AE9318C8(1, (uint64_t)v6);
  }

  return v3;
}

- (_TtC13MediaControls29SessionsTransitioningDelegate)init
{
  result = (_TtC13MediaControls29SessionsTransitioningDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end