@interface JSCampaignAttributionService
- (_TtC19appstorecomponentsd28JSCampaignAttributionService)init;
- (id)processRedirectURL:(id)a3;
@end

@implementation JSCampaignAttributionService

- (id)processRedirectURL:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10002EE34(0, &qword_1001A4098);
  v4 = self;
  v5 = (void *)static JSContext.requiredCurrent.getter();
  v6 = (void *)JSContext.propagateErrorsToExceptions(_:)();

  swift_bridgeObjectRelease();

  return v6;
}

- (_TtC19appstorecomponentsd28JSCampaignAttributionService)init
{
  result = (_TtC19appstorecomponentsd28JSCampaignAttributionService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19appstorecomponentsd28JSCampaignAttributionService_process));
  sub_10002ED08((uint64_t)self + OBJC_IVAR____TtC19appstorecomponentsd28JSCampaignAttributionService_accounts);
  v3 = (char *)self + OBJC_IVAR____TtC19appstorecomponentsd28JSCampaignAttributionService_bag;
  uint64_t v4 = type metadata accessor for Bag();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end