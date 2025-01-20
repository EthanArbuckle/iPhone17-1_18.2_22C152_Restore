@interface LockupFetcherClient
- (_TtC19appstorecomponentsd19LockupFetcherClient)init;
- (void)buildLockupFromMediaAPIResponse:(id)a3 withContext:(id)a4 withReplyHandler:(id)a5;
- (void)getLockupCollectionWithRequest:(id)a3 withReplyHandler:(id)a4;
- (void)getLockupForBundleID:(id)a3 withContext:(id)a4 enableAppDistribution:(BOOL)a5 withReplyHandler:(id)a6;
- (void)getLockupWithRequest:(id)a3 withReplyHandler:(id)a4;
- (void)getLockupsWithRequest:(id)a3 withReplyHandler:(id)a4;
@end

@implementation LockupFetcherClient

- (void)getLockupWithRequest:(id)a3 withReplyHandler:(id)a4
{
}

- (void)getLockupsWithRequest:(id)a3 withReplyHandler:(id)a4
{
}

- (void)getLockupForBundleID:(id)a3 withContext:(id)a4 enableAppDistribution:(BOOL)a5 withReplyHandler:(id)a6
{
  BOOL v6 = a5;
  v9 = _Block_copy(a6);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v9;
  id v15 = a4;
  v14 = self;
  sub_100104DBC(v10, v12, v15, v6, (uint64_t)sub_10010C73C, v13);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)buildLockupFromMediaAPIResponse:(id)a3 withContext:(id)a4 withReplyHandler:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  id v11 = a4;
  uint64_t v10 = self;
  sub_1001081A4(v8, v11, (void (*)(void, void *))sub_10010B7BC, v9);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)getLockupCollectionWithRequest:(id)a3 withReplyHandler:(id)a4
{
}

- (_TtC19appstorecomponentsd19LockupFetcherClient)init
{
  result = (_TtC19appstorecomponentsd19LockupFetcherClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10002ED08((uint64_t)self + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_fetcher);
  sub_10002ED08((uint64_t)self + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_service);
  sub_10002ED08((uint64_t)self + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_appStateController);
  v3 = (char *)self + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_bag;
  uint64_t v4 = type metadata accessor for Bag();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_appDistribution;

  sub_10002ED08((uint64_t)v5);
}

@end