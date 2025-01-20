@interface RatchetCoolOffContentViewController
- (BOOL)_canShowWhileLocked;
- (_TtC10CoreAuthUI35RatchetCoolOffContentViewController)initWithCoder:(id)a3;
- (_TtC10CoreAuthUI35RatchetCoolOffContentViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC10CoreAuthUI35RatchetCoolOffContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC10CoreAuthUI35RatchetCoolOffContentViewController)initWithRootViewController:(id)a3;
- (void)didMoveToParent:(id)a3;
- (void)setCoolOffDuration:(double)a3;
- (void)viewDidLoad;
- (void)willMoveToParent:(id)a3;
@end

@implementation RatchetCoolOffContentViewController

- (_TtC10CoreAuthUI35RatchetCoolOffContentViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    v5 = (objc_class *)sub_100033A20((unint64_t)&_swiftEmptyArrayStorage);
  }
  else {
    v5 = (objc_class *)&_swiftEmptySetSingleton;
  }
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_cancellables) = v5;

  result = (_TtC10CoreAuthUI35RatchetCoolOffContentViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(RatchetCoolOffContentViewController *)&v5 viewDidLoad];
  id v3 = [v2 interactivePopGestureRecognizer];
  if (v3)
  {
    id v4 = v3;
    [v3 setEnabled:0];
  }
  [v2 setNavigationBarHidden:1 animated:0];
  sub_1000326C4();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC10CoreAuthUI35RatchetCoolOffContentViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC10CoreAuthUI35RatchetCoolOffContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10CoreAuthUI35RatchetCoolOffContentViewController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC10CoreAuthUI35RatchetCoolOffContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10CoreAuthUI35RatchetCoolOffContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10CoreAuthUI35RatchetCoolOffContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)didMoveToParent:(id)a3
{
}

- (void)willMoveToParent:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  [v4 addChildViewController:v5];
  [(RatchetCoolOffContentViewController *)v5 willMoveToParentViewController:v4];
}

- (void)setCoolOffDuration:(double)a3
{
  uint64_t v5 = *(void *)&self->viewModel[OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_viewModel];
  uint64_t ObjectType = swift_getObjectType();
  v7 = *(void (**)(uint64_t, uint64_t, double))(v5 + 24);
  v8 = self;
  v7(ObjectType, v5, a3);
}

@end