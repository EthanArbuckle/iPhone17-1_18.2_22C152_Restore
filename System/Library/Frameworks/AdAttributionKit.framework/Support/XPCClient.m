@interface XPCClient
- (_TtC20AttributionKitCommon9XPCClient)init;
- (void)handleMessages:(id)a3;
@end

@implementation XPCClient

- (void)handleMessages:(id)a3
{
  id v4 = a3;
  v8 = self;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  _s20AttributionKitCommon9XPCClientC14handleMessagesyy10Foundation4DataVF_0();
  sub_100020930(v5, v7);
}

- (_TtC20AttributionKitCommon9XPCClient)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  UUID.init()();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(XPCClient *)&v5 init];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC20AttributionKitCommon9XPCClient_id;
  uint64_t v3 = type metadata accessor for UUID();
  id v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end