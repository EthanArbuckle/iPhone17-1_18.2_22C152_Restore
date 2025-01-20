@interface ConversationManagerHostConnection
- (void)addRemoteMembers:(id)a3 toConversationWithUUID:(id)a4;
- (void)buzzMember:(id)a3 conversationUUID:(id)a4;
- (void)createActivitySessionWith:(id)a3 onConversationWithUUID:(id)a4 completion:(id)a5;
- (void)fetchEndpointWith:(id)a3 activitySessionUUID:(id)a4 activity:(id)a5 completion:(id)a6;
- (void)includeMetricsReport:(id)a3 onConversationWithUUID:(id)a4;
- (void)kickMember:(id)a3 conversationUUID:(id)a4;
- (void)prepareForGroupActivityWithOverrides:(id)a3 completionHandler:(id)a4;
- (void)registerIdentifierForCustomEndpoint:(id)a3;
- (void)requestConversationContainersByGroupUUIDWithReply:(id)a3;
- (void)requestEndpointWith:(id)a3 activitySessionUUID:(id)a4 activity:(id)a5 completion:(id)a6;
- (void)setActivityAuthorization:(BOOL)a3 forBundleIdentifier:(id)a4;
- (void)setDownlinkMuted:(BOOL)a3 forRemoteParticipantsInConversationWithUUID:(id)a4;
- (void)unregisterIdentifierForCustomEndpoint:(id)a3;
- (void)updateConversationContainersWithConversationContainersByGroupUUID:(id)a3;
- (void)updateConversationWith:(id)a3 participantPresentationContexts:(id)a4;
@end

@implementation ConversationManagerHostConnection

- (void)updateConversationContainersWithConversationContainersByGroupUUID:(id)a3
{
  type metadata accessor for UUID();
  type metadata accessor for TUConversationActivity(0, &lazy cache variable for type metadata for TUConversationActivitySessionContainer);
  _s8Dispatch0A13WorkItemFlagsVACs10SetAlgebraAAWlTm_1((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x1E4F27990]);
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  ConversationManagerHostConnection.updateConversationContainers(conversationContainersByGroupUUID:)((Swift::OpaquePointer)v4);

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
  uint64_t v16 = v15;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v13);
  id v17 = a5;
  v18 = self;
  specialized ConversationManagerHostConnection.requestEndpoint(with:activitySessionUUID:activity:completion:)(v14, v16, (uint64_t)v12, (uint64_t)v17, v18, (void (**)(void, void))v13);
  _Block_release(v13);
  _Block_release(v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)prepareForGroupActivityWithOverrides:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  ConversationManagerHostConnection.prepareForGroupActivity(overrides:completionHandler:)(a3, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool, @unowned NSError?) -> (), v7);

  swift_release();
}

- (void)createActivitySessionWith:(id)a3 onConversationWithUUID:(id)a4 completion:(id)a5
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v12);
  id v13 = a3;
  uint64_t v14 = self;
  specialized ConversationManagerHostConnection.createActivitySession(with:onConversationWithUUID:completion:)(v13, (uint64_t)v11, v14, v12);
  _Block_release(v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)requestConversationContainersByGroupUUIDWithReply:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  ConversationManagerHostConnection.requestConversationContainersByGroupUUID(reply:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSDictionary) -> (), v5);

  swift_release();
}

- (void)addRemoteMembers:(id)a3 toConversationWithUUID:(id)a4
{
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationMember);
  lazy protocol witness table accessor for type TUConversationMember and conformance NSObject();
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = self;
  ConversationManagerHostConnection.addRemoteMembers(_:toConversationWithUUID:)(v9, (uint64_t)v8);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)setActivityAuthorization:(BOOL)a3 forBundleIdentifier:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  ConversationManagerHostConnection.setActivityAuthorization(_:forBundleIdentifier:)(a3, v10);

  swift_bridgeObjectRelease();
}

- (void)buzzMember:(id)a3 conversationUUID:(id)a4
{
}

- (void)setDownlinkMuted:(BOOL)a3 forRemoteParticipantsInConversationWithUUID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  Swift::String v10 = self;
  ConversationManagerHostConnection.setDownlinkMuted(_:forRemoteParticipantsInConversationWithUUID:)(v4, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)kickMember:(id)a3 conversationUUID:(id)a4
{
}

- (void)updateConversationWith:(id)a3 participantPresentationContexts:(id)a4
{
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for TUConversationActivity(0, &lazy cache variable for type metadata for TUConversationParticipantPresentationContext);
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  Swift::String v10 = self;
  ConversationManagerHostConnection.updateConversation(with:participantPresentationContexts:)((uint64_t)v8, v9);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)includeMetricsReport:(id)a3 onConversationWithUUID:(id)a4
{
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  Swift::String v10 = self;
  ConversationManagerHostConnection.includeMetricsReport(_:onConversationWithUUID:)(v9, (uint64_t)v8);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)registerIdentifierForCustomEndpoint:(id)a3
{
}

- (void)unregisterIdentifierForCustomEndpoint:(id)a3
{
}

- (void)fetchEndpointWith:(id)a3 activitySessionUUID:(id)a4 activity:(id)a5 completion:(id)a6
{
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = _Block_copy(a6);
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v13;
  id v18 = a5;
  uint64_t v19 = self;
  ConversationManagerHostConnection.fetchEndpoint(with:activitySessionUUID:activity:completion:)(v14, v16, (uint64_t)v12, v18, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned TUConversationActivity?) -> (), v17);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

@end