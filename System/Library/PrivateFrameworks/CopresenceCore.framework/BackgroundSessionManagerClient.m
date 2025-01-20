@interface BackgroundSessionManagerClient
- (void)beginWithRequest:(id)a3 completion:(id)a4;
- (void)createPresenceSessionWith:(id)a3 completion:(id)a4;
- (void)leaveWithIdentifier:(id)a3 completion:(id)a4;
- (void)sessionDidReceiveUpdatedUnknownParticipantListWithSessionID:(id)a3 unknownParticipants:(id)a4;
- (void)sessionDidRejectKeyRecoveryRequestWithSessionID:(id)a3;
- (void)updateMembersWithIdentifier:(id)a3 members:(id)a4 completion:(id)a5;
- (void)updateShare:(id)a3 activityID:(id)a4 completion:(id)a5;
- (void)updateWithActivitySessions:(id)a3;
@end

@implementation BackgroundSessionManagerClient

- (void)beginWithRequest:(id)a3 completion:(id)a4
{
}

- (void)leaveWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  v12 = self;
  BackgroundSessionManagerClient.leave(identifier:completion:)((uint64_t)v9, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)updateMembersWithIdentifier:(id)a3 members:(id)a4 completion:(id)a5
{
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUHandle);
  lazy protocol witness table accessor for type TUHandle and conformance NSObject();
  uint64_t v12 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  v14 = self;
  BackgroundSessionManagerClient.updateMembers(identifier:members:completion:)((uint64_t)v10, v12, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, v13);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)updateShare:(id)a3 activityID:(id)a4 completion:(id)a5
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  id v14 = a3;
  uint64_t v15 = self;
  BackgroundSessionManagerClient.updateShare(_:activityID:completion:)(v14, (uint64_t)v11, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> (), v13);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)createPresenceSessionWith:(id)a3 completion:(id)a4
{
}

- (void)updateWithActivitySessions:(id)a3
{
  type metadata accessor for TUConversationActivity(0, &lazy cache variable for type metadata for TUConversationActivitySessionContainer);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = (char *)self + direct field offset for BackgroundSessionManagerClient.delegate;
  swift_beginAccess();
  if (MEMORY[0x1B3EA3B30](v4))
  {
    uint64_t v5 = *((void *)v4 + 1);
    swift_getObjectType();
    uint64_t v6 = *(void (**)(void))(v5 + 16);
    uint64_t v7 = self;
    v6();

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)sessionDidRejectKeyRecoveryRequestWithSessionID:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = (char *)self + direct field offset for BackgroundSessionManagerClient.delegate;
  swift_beginAccess();
  if (MEMORY[0x1B3EA3B30](v8))
  {
    uint64_t v9 = *((void *)v8 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 24);
    uint64_t v12 = self;
    v11(v7, ObjectType, v9);

    swift_unknownObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)sessionDidReceiveUpdatedUnknownParticipantListWithSessionID:(id)a3 unknownParticipants:(id)a4
{
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUHandle);
  lazy protocol witness table accessor for type TUHandle and conformance NSObject();
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = (char *)self + direct field offset for BackgroundSessionManagerClient.delegate;
  swift_beginAccess();
  if (MEMORY[0x1B3EA3B30](v10))
  {
    uint64_t v11 = *((void *)v10 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v17 = v6;
    uint64_t v13 = ObjectType;
    id v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 32);
    uint64_t v15 = self;
    uint64_t v16 = v13;
    uint64_t v6 = v17;
    v14(v8, v9, v16, v11);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end