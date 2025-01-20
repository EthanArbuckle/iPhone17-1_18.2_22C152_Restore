@interface DKViewControllerDelegateResponder
- (_TtC11Diagnostics33DKViewControllerDelegateResponder)init;
- (void)diagnosticManager:(id)a3 dismissViewController:(id)a4 completion:(id)a5;
- (void)diagnosticManager:(id)a3 presentViewController:(id)a4 completion:(id)a5;
- (void)hideStatusBar;
- (void)setStatusBarStyle:(int64_t)a3;
- (void)showStatusBar;
@end

@implementation DKViewControllerDelegateResponder

- (void)diagnosticManager:(id)a3 presentViewController:(id)a4 completion:(id)a5
{
}

- (void)diagnosticManager:(id)a3 dismissViewController:(id)a4 completion:(id)a5
{
}

- (void)showStatusBar
{
}

- (void)hideStatusBar
{
}

- (void)setStatusBarStyle:(int64_t)a3
{
  v5 = self;
  v7 = self;
  unsigned int v6 = objc_msgSend(objc_msgSend(v5, "currentPlatform"), "isCheckerBoardActive");
  swift_unknownObjectRelease();
  if (v6)
  {
    objc_msgSend(objc_msgSend(v5, "currentPlatform"), "sceneStatusBarStyle:", a3);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (_TtC11Diagnostics33DKViewControllerDelegateResponder)init
{
  v2 = (char *)self + OBJC_IVAR____TtC11Diagnostics33DKViewControllerDelegateResponder__presentationTransitionStyle;
  *(void *)v2 = 0;
  v2[8] = 1;
  v3 = (char *)self + OBJC_IVAR____TtC11Diagnostics33DKViewControllerDelegateResponder__dismissalTransitionStyle;
  *(void *)v3 = 0;
  v3[8] = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DKViewControllerDelegateResponder();
  return [(DKViewControllerDelegateResponder *)&v5 init];
}

@end