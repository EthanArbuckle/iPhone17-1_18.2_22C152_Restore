@interface ICSMessageStoreClient
- (ICSMessageStoreClient)init;
- (void)urlForVideoMessageWithUUID:(id)a3 completionHandler:(id)a4;
@end

@implementation ICSMessageStoreClient

- (ICSMessageStoreClient)init
{
  return (ICSMessageStoreClient *)sub_100121138();
}

- (void)urlForVideoMessageWithUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  v13 = self;
  sub_1001211CC((uint64_t)v10, (uint64_t)sub_100122290, v12);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void).cxx_destruct
{
}

@end