@interface ProxCardSetUpRootViewController
- (BOOL)_canShowWhileLocked;
- (_TtC22GuestUserHandoverSetup31ProxCardSetUpRootViewController)initWithCoder:(id)a3;
- (_TtC22GuestUserHandoverSetup31ProxCardSetUpRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ProxCardSetUpRootViewController

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100008078(a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC22GuestUserHandoverSetup31ProxCardSetUpRootViewController)initWithCoder:(id)a3
{
  *(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC22GuestUserHandoverSetup31ProxCardSetUpRootViewController_proxNavigationController] = 0;
  id v4 = a3;

  result = (_TtC22GuestUserHandoverSetup31ProxCardSetUpRootViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC22GuestUserHandoverSetup31ProxCardSetUpRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22GuestUserHandoverSetup31ProxCardSetUpRootViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(void **)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC22GuestUserHandoverSetup31ProxCardSetUpRootViewController_proxNavigationController];
}

@end