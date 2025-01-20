@interface LiteMessageServiceSession
- (LiteMessageServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5;
- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4;
- (void)deleteAllDataWithCompletionHandler:(id)a3;
- (void)fetchIncomingPendingMessagesFromHandlesIDs:(id)a3;
- (void)handleDaemonFinishedLaunchingWithNotification:(id)a3;
- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 joinProperties:(id)a7;
- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8 joinProperties:(id)a9;
- (void)messenger:(id)a3 incomingMessage:(id)a4 context:(id)a5 clientAcknowledgementBlock:(id)a6;
- (void)messenger:(id)a3 incomingMessage:(id)a4 context:(id)a5 clientErrorAcknowledgementBlock:(id)a6;
- (void)messenger:(id)a3 incomingServiceUpdateMessage:(id)a4 context:(id)a5 clientAcknowledgementBlock:(id)a6;
- (void)messenger:(id)a3 incomingSummaryMessage:(id)a4 context:(id)a5 clientAcknowledgementBlock:(id)a6;
- (void)messenger:(id)a3 receivedIncomingDeliveryReceiptForIdentifier:(id)a4 fromURI:(id)a5 context:(id)a6;
- (void)networkMonitorDidUpdate:(id)a3;
- (void)republishOffGridStatusIfNecessary;
- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5;
- (void)sentDowngradeRequestToHandleID:(id)a3 fromID:(id)a4;
- (void)sessionDidBecomeActive;
- (void)systemDidLeaveFirstDataProtectionLock;
@end

@implementation LiteMessageServiceSession

- (void)messenger:(id)a3 incomingMessage:(id)a4 context:(id)a5 clientErrorAcknowledgementBlock:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = self;
  specialized LiteMessageServiceSession.messenger(_:incomingMessage:context:clientErrorAcknowledgementBlock:)(v13, v14, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> (), v11);

  swift_release();
}

- (void)messenger:(id)a3 incomingMessage:(id)a4 context:(id)a5 clientAcknowledgementBlock:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = thunk for @escaping @callee_unowned @convention(block) () -> ()partial apply;
  *(void *)(v12 + 24) = v11;
  v18[4] = closure #1 in LiteMessageServiceSession.messenger(_:incomingMessage:context:clientAcknowledgementBlock:)partial apply;
  v18[5] = v12;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  v18[2] = thunk for @escaping @callee_guaranteed (@guaranteed Error?) -> ();
  v18[3] = &block_descriptor_23_0;
  id v13 = _Block_copy(v18);
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v17 = self;
  swift_retain();
  swift_release();
  [(LiteMessageServiceSession *)v17 messenger:v14 incomingMessage:v15 context:v16 clientErrorAcknowledgementBlock:v13];
  _Block_release(v13);

  swift_release();
}

- (void)messenger:(id)a3 incomingSummaryMessage:(id)a4 context:(id)a5 clientAcknowledgementBlock:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v11 - 8);
  id v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = _Block_copy(a6);
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v13, 1, 1, v15);
  type metadata accessor for MainActor();
  swift_unknownObjectRetain_n();
  id v16 = self;
  id v17 = a3;
  id v18 = a5;
  uint64_t v19 = static MainActor.shared.getter();
  v20 = (void *)swift_allocObject();
  v20[2] = v19;
  v20[3] = &protocol witness table for MainActor;
  v20[4] = a4;
  v20[5] = v16;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5Tm((uint64_t)v13, (uint64_t)&closure #1 in LiteMessageServiceSession.messenger(_:incomingSummaryMessage:context:clientAcknowledgementBlock:)partial apply, (uint64_t)v20);
  swift_release();
  _Block_release(v14);

  swift_unknownObjectRelease();
}

- (void)messenger:(id)a3 receivedIncomingDeliveryReceiptForIdentifier:(id)a4 fromURI:(id)a5 context:(id)a6
{
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = self;
  specialized LiteMessageServiceSession.messenger(_:receivedIncomingDeliveryReceiptForIdentifier:from:context:)(v10, v12, v14);

  swift_bridgeObjectRelease();
}

- (void)messenger:(id)a3 incomingServiceUpdateMessage:(id)a4 context:(id)a5 clientAcknowledgementBlock:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  swift_unknownObjectRetain();
  id v13 = a5;
  id v14 = self;
  specialized LiteMessageServiceSession.messenger(_:incomingServiceUpdateMessage:context:clientAcknowledgementBlock:)(a4, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) () -> (), v11);

  swift_unknownObjectRelease();

  swift_release();
}

- (LiteMessageServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  return (LiteMessageServiceSession *)LiteMessageServiceSession.init(account:service:replicatingFor:)(v7, v8, a5);
}

- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5
{
  int v5 = a5;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  id v11 = a3;
  id v12 = self;
  LiteMessageServiceSession.sendMessage(_:toChat:style:)(v11, v8, v10, v5);

  swift_bridgeObjectRelease();
}

- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 joinProperties:(id)a7
{
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (a6)
  {
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a6 = v16;
    if (!a7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v15 = 0;
  if (a7) {
LABEL_3:
  }
    a7 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_4:
  id v17 = self;
  LiteMessageServiceSession.joinChat(_:handleInfo:style:groupID:joinProperties:)(v11, v13, v14, a5, v15, a6, (uint64_t)a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8 joinProperties:(id)a9
{
  int v27 = a5;
  uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;
  uint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (a6)
  {
    uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a6 = v16;
    if (a7) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v17 = 0;
    uint64_t v19 = 0;
    if (a8) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v25 = 0;
  if (!a7) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;
  if (a8)
  {
LABEL_4:
    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a8 = v21;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v20 = 0;
LABEL_8:
  v22 = self;
  id v23 = a9;
  if (v23)
  {
    v24 = v23;
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  specialized LiteMessageServiceSession.joinChat(_:handleInfo:style:groupID:lastAddressedHandle:lastAddressedSIMID:joinProperties:)(v26, v14, v15, v27, v25, a6, v17, v19, v20, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)sessionDidBecomeActive
{
  v2 = self;
  LiteMessageServiceSession.sessionDidBecomeActive()();
}

- (void)republishOffGridStatusIfNecessary
{
  v2 = self;
  LiteMessageServiceSession.republishOffGridStatusIfNecessary()();
}

- (void)networkMonitorDidUpdate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LiteMessageServiceSession;
  id v4 = a3;
  int v5 = self;
  [(LiteMessageServiceSession *)&v6 networkMonitorDidUpdate:v4];
  if (objc_msgSend(v4, "immediatelyReachable", v6.receiver, v6.super_class)) {
    LiteMessageServiceSession.sendUpgradeMessagesIfNeeded()();
  }
}

- (void)deleteAllDataWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &async function pointer to partial apply for @objc closure #1 in LiteMessageServiceSession.deleteAllData();
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &_sIeghH_IeAgH_TRTATu;
  v12[5] = v11;
  unint64_t v13 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v7, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v12);
  swift_release();
}

- (void).cxx_destruct
{
  id v2 = *(id *)&self->IMDAppleServiceSession_opaque[OBJC_IVAR___LiteMessageServiceSession_state];

  swift_release();
}

- (void)handleDaemonFinishedLaunchingWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  LiteMessageServiceSession.donateHandlesForKeyExchange()();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)fetchIncomingPendingMessagesFromHandlesIDs:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = self;
  LiteMessageServiceSession.fetchIncomingPendingMessages(fromHandlesIDs:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  type metadata accessor for MainActor();
  id v11 = a3;
  swift_unknownObjectRetain_n();
  uint64_t v12 = self;
  id v13 = v11;
  uint64_t v14 = static MainActor.shared.getter();
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = v14;
  v15[3] = &protocol witness table for MainActor;
  v15[4] = v12;
  v15[5] = v13;
  v15[6] = a4;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, (uint64_t)&closure #1 in LiteMessageServiceSession.calculateReachability(with:responseHandler:)partial apply, (uint64_t)v15);

  swift_unknownObjectRelease();
  swift_release();
}

- (void)sentDowngradeRequestToHandleID:(id)a3 fromID:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;
  id v11 = self;
  specialized LiteMessageServiceSession.sentDowngradeRequest(toHandleID:fromID:)(v5, v7, v8, v10);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  id v2 = self;
  LiteMessageServiceSession.performFirstUnlockTasks()();
}

@end