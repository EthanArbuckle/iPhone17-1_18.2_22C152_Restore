@interface ConversationManagerClient
- (void)requestEndpointWith:(id)a3 activitySessionUUID:(id)a4 activity:(id)a5 completion:(id)a6;
- (void)updateConversationContainersWithConversationContainersByGroupUUID:(id)a3;
@end

@implementation ConversationManagerClient

- (void)updateConversationContainersWithConversationContainersByGroupUUID:(id)a3
{
  type metadata accessor for UUID();
  type metadata accessor for TUConversationActivity(0, &lazy cache variable for type metadata for TUConversationActivitySessionContainer);
  _s8Dispatch0A13WorkItemFlagsVACs10SetAlgebraAAWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x1E4F27990]);
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  ConversationManagerClient.updateConversationContainers(conversationContainersByGroupUUID:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)requestEndpointWith:(id)a3 activitySessionUUID:(id)a4 activity:(id)a5 completion:(id)a6
{
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a6);
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v13);
  id v17 = a5;
  v18 = self;
  specialized ConversationManagerClient.requestEndpoint(with:activitySessionUUID:activity:completion:)(v14, v16, (uint64_t)v12, (uint64_t)v17, v18, (uint64_t)v13);
  _Block_release(v13);
  _Block_release(v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

@end