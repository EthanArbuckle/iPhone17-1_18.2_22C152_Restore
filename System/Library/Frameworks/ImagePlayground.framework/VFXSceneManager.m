@interface VFXSceneManager
- (_TtC15ImagePlayground15VFXSceneManager)init;
- (void)renderer:(id)a3 updateAtTime:(double)a4;
@end

@implementation VFXSceneManager

- (_TtC15ImagePlayground15VFXSceneManager)init
{
  result = (_TtC15ImagePlayground15VFXSceneManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_243E9DDBC((uint64_t)self + OBJC_IVAR____TtC15ImagePlayground15VFXSceneManager_currentAnimatingVisibilityUUID, (uint64_t *)&unk_268E3A110);
  swift_bridgeObjectRelease();

  sub_243F08CF4(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC15ImagePlayground15VFXSceneManager_nodesController), *(void **)&self->magicEffectPosition[OBJC_IVAR____TtC15ImagePlayground15VFXSceneManager_nodesController], *(void **)&self->magicEffectPosition[OBJC_IVAR____TtC15ImagePlayground15VFXSceneManager_nodesController + 8], self->magicEffectPosition[OBJC_IVAR____TtC15ImagePlayground15VFXSceneManager_nodesController + 16]);
  sub_243EAE8F4((uint64_t)self + OBJC_IVAR____TtC15ImagePlayground15VFXSceneManager_attractorsColorUpdatingDelegate);
  v3 = (char *)self + OBJC_IVAR____TtC15ImagePlayground15VFXSceneManager_attractorsIndices;
  uint64_t v4 = sub_2443B5580();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_243F0CC2C((uint64_t)self + OBJC_IVAR____TtC15ImagePlayground15VFXSceneManager_attractorsMapper);

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15ImagePlayground15VFXSceneManager_pathTexture);
}

- (void)renderer:(id)a3 updateAtTime:(double)a4
{
  swift_unknownObjectRetain();
  v6 = self;
  sub_243F0C8C4(a4);
  swift_unknownObjectRelease();
}

@end