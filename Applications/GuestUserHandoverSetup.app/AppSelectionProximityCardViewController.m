@interface AppSelectionProximityCardViewController
- (BOOL)_canShowWhileLocked;
- (_TtC22GuestUserHandoverSetup39AppSelectionProximityCardViewController)initWithContentView:(id)a3;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation AppSelectionProximityCardViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1000134E0();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC22GuestUserHandoverSetup39AppSelectionProximityCardViewController)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC22GuestUserHandoverSetup39AppSelectionProximityCardViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  id v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC22GuestUserHandoverSetup39AppSelectionProximityCardViewController_datasource];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  v7 = sub_10001545C(v5);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  [v10 deselectRowAtIndexPath:isa animated:1];

  sub_100014548((uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end