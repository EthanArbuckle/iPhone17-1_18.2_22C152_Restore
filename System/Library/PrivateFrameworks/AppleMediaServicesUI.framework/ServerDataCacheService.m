@interface ServerDataCacheService
- (_TtC14amsengagementd22ServerDataCacheService)init;
- (void)reminderEventsForAccountDSID:(id)a3 service:(id)a4 eventType:(id)a5 networkPolicy:(int64_t)a6 completion:(id)a7;
- (void)setUpCacheForAccount:(id)a3 completion:(id)a4;
- (void)setUpCacheForAccountDSID:(id)a3 completion:(id)a4;
- (void)tearDownCacheForAccountDSID:(id)a3 completion:(id)a4;
- (void)updateCacheForAccountDSID:(id)a3 withCachePayload:(id)a4 completion:(id)a5;
- (void)updateCacheForAccountDSID:(id)a3 withCacheTypeIDs:(id)a4 completion:(id)a5;
@end

@implementation ServerDataCacheService

- (_TtC14amsengagementd22ServerDataCacheService)init
{
  return (_TtC14amsengagementd22ServerDataCacheService *)sub_10016E7A8();
}

- (void).cxx_destruct
{
}

- (void)updateCacheForAccountDSID:(id)a3 withCachePayload:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(swift_allocObject() + 16) = v7;
  id v8 = a3;
  v9 = self;
  sub_100170560();

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)updateCacheForAccountDSID:(id)a3 withCacheTypeIDs:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(swift_allocObject() + 16) = v7;
  id v8 = a3;
  v9 = self;
  sub_100170560();

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)reminderEventsForAccountDSID:(id)a3 service:(id)a4 eventType:(id)a5 networkPolicy:(int64_t)a6 completion:(id)a7
{
  v10 = _Block_copy(a7);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v10;
  id v18 = a3;
  v19 = self;
  sub_10017454C(v18, v11, v13, v14, v16, a6, (uint64_t)sub_100179F38, v17);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)setUpCacheForAccount:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = (void **)a3;
  id v8 = self;
  sub_1001779D4(v7, v8, (void (**)(void, void, void))v6);
  _Block_release(v6);
}

- (void)setUpCacheForAccountDSID:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  *(void *)(swift_allocObject() + 16) = v6;
  id v7 = a3;
  id v8 = self;
  sub_100177DA0();

  swift_release();
}

- (void)tearDownCacheForAccountDSID:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  *(void *)(swift_allocObject() + 16) = v6;
  id v7 = a3;
  id v8 = self;
  sub_100178AB0();

  swift_release();
}

@end