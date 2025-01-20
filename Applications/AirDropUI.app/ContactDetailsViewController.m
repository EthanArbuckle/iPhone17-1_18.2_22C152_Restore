@interface ContactDetailsViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (_TtC9AirDropUI28ContactDetailsViewController)initWithCoder:(id)a3;
- (_TtC9AirDropUI28ContactDetailsViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC9AirDropUI28ContactDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9AirDropUI28ContactDetailsViewController)initWithRootViewController:(id)a3;
- (void)contactViewController:(id)a3 didDeleteContact:(id)a4;
@end

@implementation ContactDetailsViewController

- (void)contactViewController:(id)a3 didDeleteContact:(id)a4
{
  v6 = *(void (**)(void))((char *)&self->super.super.super.super.isa
                        + OBJC_IVAR____TtC9AirDropUI28ContactDetailsViewController_dismissHandler);
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  v6();
}

- (_TtC9AirDropUI28ContactDetailsViewController)initWithCoder:(id)a3
{
  result = (_TtC9AirDropUI28ContactDetailsViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC9AirDropUI28ContactDetailsViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC9AirDropUI28ContactDetailsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9AirDropUI28ContactDetailsViewController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC9AirDropUI28ContactDetailsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9AirDropUI28ContactDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9AirDropUI28ContactDetailsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end