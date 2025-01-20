@interface ContextualEngineSuggestionStore
- (_TtC21AppPredictionInternal31ContextualEngineSuggestionStore)init;
- (void)configurationDidChangeForFilter:(id)a3;
@end

@implementation ContextualEngineSuggestionStore

- (void)configurationDidChangeForFilter:(id)a3
{
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x88);
  id v5 = a3;
  v9 = self;
  if (v4())
  {
    uint64_t v7 = v6;
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(ObjectType, v7);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (_TtC21AppPredictionInternal31ContextualEngineSuggestionStore)init
{
  result = (_TtC21AppPredictionInternal31ContextualEngineSuggestionStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1D1396120((uint64_t)self + OBJC_IVAR____TtC21AppPredictionInternal31ContextualEngineSuggestionStore_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21AppPredictionInternal31ContextualEngineSuggestionStore_actionToWidgetConverter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21AppPredictionInternal31ContextualEngineSuggestionStore_modeFilter));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end