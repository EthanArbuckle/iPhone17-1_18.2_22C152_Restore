@interface ServiceBrokerClient
- (_TtC19appstorecomponentsd19ServiceBrokerClient)init;
- (void)getAppOfferStateServiceForDelegate:(id)a3 withReplyHandler:(id)a4;
- (void)getLockupFetcherServiceWithReplyHandler:(id)a3;
- (void)getMetricsServiceWithReplyHandler:(id)a3;
- (void)getUtilityServiceWithReplyHandler:(id)a3;
- (void)testConnectionWithReplyHandler:(id)a3;
@end

@implementation ServiceBrokerClient

- (void)testConnectionWithReplyHandler:(id)a3
{
}

- (void)getLockupFetcherServiceWithReplyHandler:(id)a3
{
}

- (void)getMetricsServiceWithReplyHandler:(id)a3
{
}

- (void)getAppOfferStateServiceForDelegate:(id)a3 withReplyHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  swift_unknownObjectRetain();
  v8 = self;
  sub_10012F0C8((uint64_t)a3, (uint64_t)sub_1000B685C, v7);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)getUtilityServiceWithReplyHandler:(id)a3
{
}

- (_TtC19appstorecomponentsd19ServiceBrokerClient)init
{
  result = (_TtC19appstorecomponentsd19ServiceBrokerClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end