@interface AAViewingSessionManager
- (AAViewingSessionManager)init;
- (id)viewingSessionForContentIdentifier:(id)a3 object:(id)a4 onEnd:(id)a5;
- (void)endActiveViewingSession;
- (void)endViewingSessionForContentIdentifier:(id)a3;
- (void)removeObject:(id)a3 forContentIdentifier:(id)a4;
@end

@implementation AAViewingSessionManager

- (id)viewingSessionForContentIdentifier:(id)a3 object:(id)a4 onEnd:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = sub_1A916AF90();
  uint64_t v10 = v9;
  if (v7)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v7;
    v7 = sub_1A9103250;
  }
  else
  {
    uint64_t v11 = 0;
  }
  swift_unknownObjectRetain();
  v12 = self;
  id v13 = (id)sub_1A9169964(v8, v10, (uint64_t)a4, (uint64_t)v7, v11);
  sub_1A909E0EC((uint64_t)v7);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return v13;
}

- (void)removeObject:(id)a3 forContentIdentifier:(id)a4
{
  uint64_t v6 = sub_1A916AF90();
  uint64_t v8 = v7;
  swift_unknownObjectRetain();
  uint64_t v9 = self;
  ViewingSessionManager.remove(object:for:)((uint64_t)a3, v6, v8);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)endViewingSessionForContentIdentifier:(id)a3
{
  uint64_t v4 = sub_1A916AF90();
  uint64_t v6 = v5;
  uint64_t v7 = (unint64_t *)((char *)self + OBJC_IVAR___AAViewingSessionManager_sessions);
  swift_beginAccess();
  uint64_t v8 = self;
  uint64_t v9 = sub_1A9169FB0(v7, v4, v6);
  uint64_t v10 = v9;
  if (*v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_1A916B7E0();
    swift_bridgeObjectRelease();
    if (v11 >= v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((*v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v11 >= v9)
    {
LABEL_3:
      sub_1A916A30C(v10, v11);
      swift_endAccess();

      swift_bridgeObjectRelease();
      return;
    }
  }
  __break(1u);
}

- (void)endActiveViewingSession
{
  v2 = self;
  ViewingSessionManager.endActiveViewingSession()();
}

- (AAViewingSessionManager)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AAViewingSessionManager_sessions) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AAViewingSessionManager_activeSession) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(AAViewingSessionManager *)&v5 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end