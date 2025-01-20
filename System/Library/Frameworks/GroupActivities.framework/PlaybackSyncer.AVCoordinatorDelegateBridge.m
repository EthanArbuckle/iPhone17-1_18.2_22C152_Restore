@interface PlaybackSyncer.AVCoordinatorDelegateBridge
- (_TtCC15GroupActivities14PlaybackSyncer27AVCoordinatorDelegateBridge)init;
- (id)localParticipantUUIDForPlaybackCoordinator:(id)a3;
- (void)playbackCoordinator:(id)a3 broadcastLocalParticipantStateDictionary:(id)a4;
- (void)playbackCoordinator:(id)a3 broadcastTransportControlStateDictionary:(id)a4 forItemWithIdentifier:(id)a5;
- (void)playbackCoordinator:(id)a3 promptForLeaveOrEndSessionAllowingCancellation:(BOOL)a4 completionHandler:(id)a5;
- (void)playbackCoordinator:(id)a3 reloadTransportControlStateForItemWithIdentifier:(id)a4 completionHandler:(id)a5;
@end

@implementation PlaybackSyncer.AVCoordinatorDelegateBridge

- (id)localParticipantUUIDForPlaybackCoordinator:(id)a3
{
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  v10 = self;
  PlaybackSyncer.AVCoordinatorDelegateBridge.localParticipantUUID(for:)((uint64_t)v8);

  v11.super.isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v11.super.isa;
}

- (void)playbackCoordinator:(id)a3 broadcastLocalParticipantStateDictionary:(id)a4
{
  type metadata accessor for AVPlaybackCoordinationParticipantStateKey(0);
  _s10Foundation4UUIDVACSHAAWlTm_0(&lazy protocol witness table cache variable for type AVPlaybackCoordinationParticipantStateKey and conformance AVPlaybackCoordinationParticipantStateKey, type metadata accessor for AVPlaybackCoordinationParticipantStateKey);
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x60);
  id v12 = a3;
  uint64_t v7 = self;
  if (v6())
  {
    uint64_t v9 = v8;
    uint64_t ObjectType = swift_getObjectType();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    (*(void (**)(Class, uint64_t, uint64_t))(v9 + 8))(isa, ObjectType, v9);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
}

- (void)playbackCoordinator:(id)a3 broadcastTransportControlStateDictionary:(id)a4 forItemWithIdentifier:(id)a5
{
  type metadata accessor for AVPlaybackCoordinationTransportControlStateKey(0);
  _s10Foundation4UUIDVACSHAAWlTm_0(&lazy protocol witness table cache variable for type AVPlaybackCoordinationTransportControlStateKey and conformance AVPlaybackCoordinationTransportControlStateKey, type metadata accessor for AVPlaybackCoordinationTransportControlStateKey);
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x60);
  id v16 = a3;
  v15 = self;
  if (v9())
  {
    uint64_t v11 = v10;
    uint64_t ObjectType = swift_getObjectType();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t, Class, uint64_t, uint64_t))(v11 + 16))(v14, v8, isa, ObjectType, v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

- (void)playbackCoordinator:(id)a3 reloadTransportControlStateForItemWithIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  id v12 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x60);
  id v13 = a3;
  v17 = self;
  if (v12())
  {
    uint64_t v15 = v14;
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v15 + 24))(v8, v10, partial apply for thunk for @escaping @callee_unowned @convention(block) () -> (), v11, ObjectType, v15);
    swift_bridgeObjectRelease();
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
}

- (_TtCC15GroupActivities14PlaybackSyncer27AVCoordinatorDelegateBridge)init
{
  result = (_TtCC15GroupActivities14PlaybackSyncer27AVCoordinatorDelegateBridge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtCC15GroupActivities14PlaybackSyncer27AVCoordinatorDelegateBridge_localParticipantID;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtCC15GroupActivities14PlaybackSyncer27AVCoordinatorDelegateBridge_delegate;

  outlined destroy of weak SystemCoordinatorHostDelegate?((uint64_t)v5);
}

- (void)playbackCoordinator:(id)a3 promptForLeaveOrEndSessionAllowingCancellation:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  uint64_t v11 = self;
  specialized PlaybackSyncer.AVCoordinatorDelegateBridge.playbackCoordinator(_:promptForLeaveOrEndSessionAllowingCancellation:completionHandler:)(a4, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool) -> (), v9);

  swift_release();
}

@end