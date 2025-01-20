@interface SceneModule
- (_TtC16IntelligentLight11SceneModule)init;
@end

@implementation SceneModule

- (_TtC16IntelligentLight11SceneModule)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->moduleAccessor[OBJC_IVAR____TtC16IntelligentLight11SceneModule_moduleAccessor] = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16IntelligentLight11SceneModule_activeLightSceneSessionIds) = (Class)&_swiftEmptySetSingleton;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16IntelligentLight11SceneModule_activeNoiseSceneSessionIds) = (Class)&_swiftEmptySetSingleton;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(SceneModule *)&v5 init];
}

- (void).cxx_destruct
{
  sub_1000087CC((uint64_t)self + OBJC_IVAR____TtC16IntelligentLight11SceneModule_moduleAccessor);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end