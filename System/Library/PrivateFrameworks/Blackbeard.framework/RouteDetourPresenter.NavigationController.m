@interface RouteDetourPresenter.NavigationController
- (_TtCC10Blackbeard20RouteDetourPresenter20NavigationController)initWithCoder:(id)a3;
- (_TtCC10Blackbeard20RouteDetourPresenter20NavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtCC10Blackbeard20RouteDetourPresenter20NavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtCC10Blackbeard20RouteDetourPresenter20NavigationController)initWithRootViewController:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)dealloc;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation RouteDetourPresenter.NavigationController

- (unint64_t)supportedInterfaceOrientations
{
  return *(unint64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR____TtCC10Blackbeard20RouteDetourPresenter20NavigationController_supportedOrientations);
}

- (void)dealloc
{
  v2 = self;
  sub_248E99038();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC10Blackbeard20RouteDetourPresenter20NavigationController_menuGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC10Blackbeard20RouteDetourPresenter20NavigationController_activityIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC10Blackbeard20RouteDetourPresenter20NavigationController_blurBackgroundView));
  swift_release();
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtCC10Blackbeard20RouteDetourPresenter20NavigationController__decorateProgressEnabled;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B151280);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (_TtCC10Blackbeard20RouteDetourPresenter20NavigationController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_248E9AC10();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_248E9938C();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(RouteDetourPresenter.NavigationController *)&v5 viewDidAppear:v3];
  sub_248E998F4();
}

- (_TtCC10Blackbeard20RouteDetourPresenter20NavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtCC10Blackbeard20RouteDetourPresenter20NavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtCC10Blackbeard20RouteDetourPresenter20NavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtCC10Blackbeard20RouteDetourPresenter20NavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtCC10Blackbeard20RouteDetourPresenter20NavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtCC10Blackbeard20RouteDetourPresenter20NavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end