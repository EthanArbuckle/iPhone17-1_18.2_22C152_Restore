@interface GameLayerNavigationController
- (BOOL)_requiresCustomPresentationController;
- (BOOL)canBecomeFirstResponder;
- (CGSize)preferredContentSize;
- (_TtC12GameCenterUI29GameLayerNavigationController)initWithCoder:(id)a3;
- (_TtC12GameCenterUI29GameLayerNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC12GameCenterUI29GameLayerNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC12GameCenterUI29GameLayerNavigationController)initWithRootViewController:(id)a3;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)didTapDone;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation GameLayerNavigationController

- (_TtC12GameCenterUI29GameLayerNavigationController)initWithRootViewController:(id)a3
{
  return (_TtC12GameCenterUI29GameLayerNavigationController *)GameLayerNavigationController.init(rootViewController:)(a3);
}

- (_TtC12GameCenterUI29GameLayerNavigationController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF4452B4();
}

- (CGSize)preferredContentSize
{
  v2 = self;
  sub_1AF445390();
  double v4 = v3;

  double v5 = 0.0;
  double v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AF445744();
}

- (void)viewDidAppear:(BOOL)a3
{
  double v4 = self;
  sub_1AF44582C(a3);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_1AF4458CC((int)v9, v8);
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v13 = sub_1AF445BB4(v8, v12, v10);

  return v13;
}

- (BOOL)_requiresCustomPresentationController
{
  return 1;
}

- (void)didTapDone
{
  v2 = self;
  sub_1AF445D34();
}

- (_TtC12GameCenterUI29GameLayerNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
}

- (_TtC12GameCenterUI29GameLayerNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1AF7AE0E0();
  }
  id v5 = a4;
  GameLayerNavigationController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  sub_1AF368930(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI29GameLayerNavigationController_doneHandler));
}

@end