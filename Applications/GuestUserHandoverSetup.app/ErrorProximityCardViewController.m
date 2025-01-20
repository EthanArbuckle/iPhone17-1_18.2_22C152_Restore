@interface ErrorProximityCardViewController
- (BOOL)_canShowWhileLocked;
- (_TtC22GuestUserHandoverSetup32ErrorProximityCardViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation ErrorProximityCardViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10000DE58();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC22GuestUserHandoverSetup32ErrorProximityCardViewController)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC22GuestUserHandoverSetup32ErrorProximityCardViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  id v3 = &self->PRXIconContentViewController_opaque[OBJC_IVAR____TtC22GuestUserHandoverSetup32ErrorProximityCardViewController_error];
  uint64_t v4 = type metadata accessor for GuestUserAccessError();
  v5 = *(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end