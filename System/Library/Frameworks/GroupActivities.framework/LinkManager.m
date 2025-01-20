@interface LinkManager
- (_TtC15GroupActivities11LinkManager)init;
- (void)dealloc;
@end

@implementation LinkManager

- (void)dealloc
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x238);
  v3 = self;

  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for LinkManager(0);
  [(LinkManager *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC15GroupActivities11LinkManager__attachmentLedgerTopic;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CurrentSubject<AttachmentLedgerTopic?>);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR____TtC15GroupActivities11LinkManager__attachments;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CurrentSubject<[LinkManager.Attachment]>);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  v7 = (char *)self + OBJC_IVAR____TtC15GroupActivities11LinkManager_identifier;
  uint64_t v8 = type metadata accessor for UUID();
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9((char *)self + OBJC_IVAR____TtC15GroupActivities11LinkManager_groupUUID, v8);
  _s15GroupActivities11ParticipantVWOhTm_0((uint64_t)self + OBJC_IVAR____TtC15GroupActivities11LinkManager_localParticipant, (uint64_t (*)(void))type metadata accessor for Participant);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15GroupActivities11LinkManager_unreliableMessengerConfig));
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15GroupActivities11LinkManager_receivedDataHandler));
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15GroupActivities11LinkManager_onFirstConnectedHandler));
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15GroupActivities11LinkManager_invalidationHandler));
  uint64_t v10 = *(uint64_t *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC15GroupActivities11LinkManager_requestEncryptionKeysHandler);

  outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(v10);
}

- (_TtC15GroupActivities11LinkManager)init
{
  result = (_TtC15GroupActivities11LinkManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end