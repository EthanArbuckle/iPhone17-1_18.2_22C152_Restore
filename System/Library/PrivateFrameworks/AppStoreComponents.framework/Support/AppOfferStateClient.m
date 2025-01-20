@interface AppOfferStateClient
- (_TtC19appstorecomponentsd19AppOfferStateClient)init;
- (void)dealloc;
- (void)decorateBuyParamsForOffer:(id)a3 withActivity:(id)a4 withReplyHandler:(id)a5;
- (void)didChangeAppCapabilities:(id)a3;
- (void)performActionOfOffer:(id)a3 withActivity:(id)a4 inContext:(id)a5 withReplyHandler:(id)a6;
- (void)reinstallWatchAppWithID:(id)a3 withReplyHandler:(id)a4;
- (void)reinstallWatchSystemAppWithBundleID:(id)a3 withReplyHandler:(id)a4;
- (void)startObservingStateOfOffers:(id)a3;
- (void)stopObservingStateOfOffers:(id)a3;
- (void)viewAppForAppDistributionOffer:(id)a3;
@end

@implementation AppOfferStateClient

- (void)dealloc
{
  v2 = self;
  sub_100053EAC();
}

- (void).cxx_destruct
{
  swift_release();
  sub_10002ED08((uint64_t)self + OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_appStateController);
  sub_10002ED08((uint64_t)self + OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_arcadeSubscription);
  sub_10002ED08((uint64_t)self + OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_restrictions);
  sub_10002ED08((uint64_t)self + OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_contingentOffers);
  sub_10002ED08((uint64_t)self + OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_appStoreInstallStateMonitor);
  sub_10002ED08((uint64_t)self + OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_jsStackManager);
  sub_10002ED08((uint64_t)self + OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_localizer);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_appDistribution;

  sub_10002ED08((uint64_t)v3);
}

- (void)didChangeAppCapabilities:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_100056DF8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)startObservingStateOfOffers:(id)a3
{
}

- (void)stopObservingStateOfOffers:(id)a3
{
}

- (void)performActionOfOffer:(id)a3 withActivity:(id)a4 inContext:(id)a5 withReplyHandler:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  swift_unknownObjectRetain();
  id v12 = a4;
  id v13 = a5;
  v14 = self;
  sub_10005B6E0(a3, v12, v13, (void (*)(void))sub_10006239C, v11);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)reinstallWatchAppWithID:(id)a3 withReplyHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_10005E458(v8, (uint64_t)sub_10006239C, v7);

  swift_release();
}

- (void)reinstallWatchSystemAppWithBundleID:(id)a3 withReplyHandler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  v10 = self;
  sub_10005F140(v6, v8, (uint64_t)sub_100061788, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)viewAppForAppDistributionOffer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10005FE3C(v4);
}

- (void)decorateBuyParamsForOffer:(id)a3 withActivity:(id)a4 withReplyHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  id v12 = self;
  sub_10005FFD8(v10, v11, (uint64_t)sub_10006162C, v9);

  swift_release();
}

- (_TtC19appstorecomponentsd19AppOfferStateClient)init
{
  result = (_TtC19appstorecomponentsd19AppOfferStateClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end