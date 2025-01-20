@interface HeadphoneMarketingUpsellViewController
- (_TtC20HeadphoneProxService38HeadphoneMarketingUpsellViewController)initWithContentView:(id)a3;
- (void)dynamicViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5;
- (void)viewDidLoad;
@end

@implementation HeadphoneMarketingUpsellViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HeadphoneMarketingUpsellViewController();
  id v2 = v3.receiver;
  [(HeadphoneMarketingUpsellViewController *)&v3 viewDidLoad];
  sub_10002A930();
  [v2 setDismissalType:1];
}

- (_TtC20HeadphoneProxService38HeadphoneMarketingUpsellViewController)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC20HeadphoneProxService38HeadphoneMarketingUpsellViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService38HeadphoneMarketingUpsellViewController_presenter];

  sub_100008F00((uint64_t)v3);
}

- (void)dynamicViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5
{
  if (a4) {
    uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = a3;
  id v10 = a5;
  v11 = self;
  sub_10002AF54(v9, v8, (uint64_t)a5);

  swift_bridgeObjectRelease();
}

@end