@interface ClientConnection
- (_TtC7parsecd16ClientConnection)init;
- (void)addEncodedEngagedResults:(id)a3 withConfiguration:(id)a4;
- (void)addEncodedEngagedResults:(id)a3 withConfiguration:(id)a4 completion:(id)a5;
- (void)allEngagedResults:(id)a3 maxCount:(int64_t)a4 withConfiguration:(id)a5 completion:(id)a6;
- (void)bag:(id)a3 reply:(id)a4;
- (void)bagChangeNotificationWithNotification:(id)a3;
- (void)clearEncodedEngagedResults:(id)a3 withConfiguration:(id)a4 completion:(id)a5;
- (void)clearEngagementsFromDate:(id)a3 toDate:(id)a4;
- (void)clearEngagementsWithTitle:(id)a3 type:(id)a4;
- (void)dealloc;
- (void)fileDeleteNotificationWithNotification:(id)a3;
- (void)fileDownloadNotificationWithNotification:(id)a3;
- (void)fileHandleAndAttributesForResource:(id)a3 completion:(id)a4;
- (void)fileHandleForWritingFeedbackType:(int64_t)a3 reply:(id)a4;
- (void)forceFetchBag:(id)a3 reply:(id)a4;
- (void)getBagDataWithReply:(id)a3;
- (void)getImageMap:(id)a3;
- (void)getIsDeviceSetupCompleteWithReply:(id)a3;
- (void)getQueryContextDataForClient:(unint64_t)a3 reply:(id)a4;
- (void)handleInvocation;
- (void)listSessions:(id)a3;
- (void)reportFeedback:(id)a3 payloadData:(id)a4 queryId:(unint64_t)a5;
- (void)reportPegasusFeedbackWithPayloadData:(id)a3 forUseragent:(id)a4;
- (void)request:(id)a3 request:(id)a4 reply:(id)a5;
- (void)stopSessions:(id)a3;
- (void)subscribeToChannel:(PARSubscriptionChannel *)a3 reply:(id)a4;
- (void)subscriptionStatusForChannel:(PARSubscriptionChannel *)a3 reply:(id)a4;
- (void)teeFeedback:(id)a3;
- (void)topEncodedEngagedResultsForInput:(NSString *)a3 maxCount:(int64_t)a4 withConfiguration:(PARSessionConfiguration *)a5 completion:(id)a6;
- (void)unsubscribeFromChannel:(PARSubscriptionChannel *)a3 reply:(id)a4;
- (void)updateParametersForSmartSearchV1:(id)a3 smartSearchV2:(id)a4;
@end

@implementation ClientConnection

- (void)reportFeedback:(id)a3 payloadData:(id)a4 queryId:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v13 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  sub_1000054A0(a3);
  sub_1000291B4(v10, v12);
}

- (void)bag:(id)a3 reply:(id)a4
{
  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = sub_10002FFE4;
  }
  id v7 = a3;
  id v8 = self;
  sub_100012C24();
  sub_1000332CC((uint64_t)v6);
}

- (void)handleInvocation
{
  v2 = self;
  sub_10000B2EC();
}

- (void)dealloc
{
  v2 = self;
  sub_100099644();
}

- (void).cxx_destruct
{
  sub_10001CDE0((uint64_t)self + OBJC_IVAR____TtC7parsecd16ClientConnection_assembly);
  type metadata accessor for UUID();
  sub_10001DCF8();
  sub_10000E040();
  v3();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)bagChangeNotificationWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100099CC0();
}

- (void)fileDownloadNotificationWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100099FDC(v4);
}

- (void)fileDeleteNotificationWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10009A244(v4);
}

- (void)forceFetchBag:(id)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  id v8 = self;
  sub_10009A3D4(a3, (uint64_t)v8, v6);
  _Block_release(v6);
}

- (void)request:(id)a3 request:(id)a4 reply:(id)a5
{
  id v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  unint64_t v11 = self;
  sub_10009A8C4(a3, v10, (uint64_t)v11, (void (**)(void, void, void, void))v8);
  _Block_release(v8);
}

- (void)reportPegasusFeedbackWithPayloadData:(id)a3 forUseragent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v11 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10009B278();
  swift_bridgeObjectRelease();
  sub_1000291B4(v8, v10);
}

- (void)teeFeedback:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    v5 = sub_1000A3CB0;
  }
  else
  {
    v5 = 0;
  }
  id v6 = self;
  sub_10009BA5C();
  sub_1000332CC((uint64_t)v5);
}

- (void)stopSessions:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    v5 = sub_1000A3CB0;
  }
  else
  {
    v5 = 0;
  }
  id v6 = self;
  sub_10009BDF4();
  sub_1000332CC((uint64_t)v5);
}

- (void)listSessions:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    v5 = sub_1000A2C28;
  }
  else
  {
    v5 = 0;
  }
  id v6 = self;
  sub_10009C188((uint64_t)v5);
  sub_1000332CC((uint64_t)v5);
}

- (void)fileHandleAndAttributesForResource:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    v5 = sub_1000A2C20;
  }
  unint64_t v9 = self;
  sub_10009C32C(v6, v8, (void (*)(void, void))v5);
  sub_1000332CC((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)fileHandleForWritingFeedbackType:(int64_t)a3 reply:(id)a4
{
  v5 = _Block_copy(a4);
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    v5 = sub_1000300F0;
  }
  uint64_t v6 = self;
  sub_10009C6B0();
  sub_1000332CC((uint64_t)v5);
}

- (void)clearEngagementsFromDate:(id)a3 toDate:(id)a4
{
  uint64_t v5 = type metadata accessor for Date();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  unint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  unint64_t v11 = (char *)&v14 - v10;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = self;
  sub_10009C8A8();

  v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, v5);
  v13(v11, v5);
}

- (void)clearEngagementsWithTitle:(id)a3 type:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = a4;
  uint64_t v10 = self;
  sub_10009CAA4(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)addEncodedEngagedResults:(id)a3 withConfiguration:(id)a4
{
  if (a3) {
    uint64_t v6 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = a4;
  uint64_t v8 = self;
  sub_10009CC28(v6, v7);

  swift_bridgeObjectRelease();
}

- (void)addEncodedEngagedResults:(id)a3 withConfiguration:(id)a4 completion:(id)a5
{
  uint64_t v8 = (void (*)(void))_Block_copy(a5);
  if (a3) {
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (v8)
  {
    *(void *)(swift_allocObject() + 16) = v8;
    uint64_t v8 = (void (*)(void))sub_1000A3CB0;
  }
  id v9 = a4;
  uint64_t v10 = self;
  sub_10009CE50(a3, v9, v8);
  sub_1000332CC((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (void)topEncodedEngagedResultsForInput:(NSString *)a3 maxCount:(int64_t)a4 withConfiguration:(PARSessionConfiguration *)a5 completion:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  unint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  unint64_t v12 = a3;
  v13 = a5;
  uint64_t v14 = self;

  sub_10009DA7C((uint64_t)&unk_10021CD18, (uint64_t)v11);
}

- (void)allEngagedResults:(id)a3 maxCount:(int64_t)a4 withConfiguration:(id)a5 completion:(id)a6
{
  id v9 = (void (*)(uint64_t))_Block_copy(a6);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  if (v9)
  {
    *(void *)(swift_allocObject() + 16) = v9;
    id v9 = sub_1000A2B14;
  }
  id v13 = a5;
  uint64_t v14 = self;
  sub_10009DB80(v10, v12, a4, v13, v9);
  sub_1000332CC((uint64_t)v9);

  swift_bridgeObjectRelease();
}

- (void)clearEncodedEngagedResults:(id)a3 withConfiguration:(id)a4 completion:(id)a5
{
  uint64_t v8 = (void (*)(void))_Block_copy(a5);
  if (a3) {
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (v8)
  {
    *(void *)(swift_allocObject() + 16) = v8;
    uint64_t v8 = (void (*)(void))sub_1000A2AA4;
  }
  id v9 = a4;
  uint64_t v10 = self;
  sub_10009DF08(a3, v9, v8);
  sub_1000332CC((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (void)updateParametersForSmartSearchV1:(id)a3 smartSearchV2:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_10009E284();
}

- (void)getImageMap:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    uint64_t v5 = sub_1000A2A9C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = self;
  sub_10009E388();
  sub_1000332CC((uint64_t)v5);
}

- (_TtC7parsecd16ClientConnection)init
{
}

- (void)getQueryContextDataForClient:(unint64_t)a3 reply:(id)a4
{
  id v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = self;
  sub_10009E734(a3, (uint64_t)v7, (uint64_t)v6);
  _Block_release(v6);
}

- (void)getBagDataWithReply:(id)a3
{
}

- (void)getIsDeviceSetupCompleteWithReply:(id)a3
{
}

- (void)subscribeToChannel:(PARSubscriptionChannel *)a3 reply:(id)a4
{
}

- (void)unsubscribeFromChannel:(PARSubscriptionChannel *)a3 reply:(id)a4
{
}

- (void)subscriptionStatusForChannel:(PARSubscriptionChannel *)a3 reply:(id)a4
{
}

@end