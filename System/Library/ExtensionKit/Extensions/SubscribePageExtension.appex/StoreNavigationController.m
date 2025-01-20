@interface StoreNavigationController
- (NSArray)keyCommands;
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC22SubscribePageExtension25StoreNavigationController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension25StoreNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC22SubscribePageExtension25StoreNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC22SubscribePageExtension25StoreNavigationController)initWithRootViewController:(id)a3;
- (id)popToRootViewControllerAnimated:(BOOL)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)handleBackKeyCommandWithCommand:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation StoreNavigationController

- (_TtC22SubscribePageExtension25StoreNavigationController)initWithCoder:(id)a3
{
  result = (_TtC22SubscribePageExtension25StoreNavigationController *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StoreNavigationController();
  id v2 = v5.receiver;
  [(StoreNavigationController *)&v5 viewDidLoad];
  id v3 = objc_msgSend(v2, "navigationBar", v5.receiver, v5.super_class);
  [v2 pageMarginInsets];
  objc_msgSend(v3, "setLayoutMargins:");

  id v4 = [v2 navigationBar];
  [v4 setPrefersLargeTitles:1];
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for StoreNavigationController();
  id v4 = a3;
  id v5 = v7.receiver;
  [(StoreNavigationController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, "navigationBar", v7.receiver, v7.super_class);
  [v5 pageMarginInsets];
  objc_msgSend(v6, "setLayoutMargins:");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for StoreNavigationController();
  swift_unknownObjectRetain();
  id v7 = v12.receiver;
  -[StoreNavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  v11[4] = sub_1000371D4;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_1003EC79C;
  v11[3] = &unk_1008713B0;
  v9 = _Block_copy(v11);
  id v10 = v7;
  swift_release();
  [a4 animateAlongsideTransition:v9 completion:0];
  _Block_release(v9);
  swift_unknownObjectRelease();
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  id v2 = [(StoreNavigationController *)self topViewController];

  return (UIViewController *)v2;
}

- (unint64_t)supportedInterfaceOrientations
{
  id v2 = self;
  id v3 = [(StoreNavigationController *)v2 topViewController];
  if (v3)
  {
    id v4 = v3;
    id v5 = [v3 supportedInterfaceOrientations];

    return (unint64_t)v5;
  }
  else
  {
    v8.receiver = v2;
    v8.super_class = (Class)type metadata accessor for StoreNavigationController();
    id v7 = [(StoreNavigationController *)&v8 supportedInterfaceOrientations];

    return (unint64_t)v7;
  }
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  id v4 = self;
  sub_10003680C(a3);
  uint64_t v6 = v5;

  if (v6)
  {
    sub_10001A860(0, (unint64_t *)&qword_100934AB0);
    v7.super.isa = sub_1007677F0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }

  return v7.super.isa;
}

- (NSArray)keyCommands
{
  id v2 = self;
  unint64_t v3 = sub_100036AA4();

  if (v3)
  {
    sub_10001A860(0, (unint64_t *)&qword_100934370);
    v4.super.isa = sub_1007677F0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)handleBackKeyCommandWithCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [(StoreNavigationController *)v5 popViewControllerAnimated:1];
}

- (_TtC22SubscribePageExtension25StoreNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC22SubscribePageExtension25StoreNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension25StoreNavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC22SubscribePageExtension25StoreNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension25StoreNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22SubscribePageExtension25StoreNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end