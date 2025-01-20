@interface PromptEntryViewCoordinator
- (_TtC21WritingToolsUIService26PromptEntryViewCoordinator)init;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
@end

@implementation PromptEntryViewCoordinator

- (_TtC21WritingToolsUIService26PromptEntryViewCoordinator)init
{
  result = (_TtC21WritingToolsUIService26PromptEntryViewCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  long long v3 = *(_OWORD *)&self->owner[OBJC_IVAR____TtC21WritingToolsUIService26PromptEntryViewCoordinator_owner + 104];
  v7[6] = *(_OWORD *)&self->owner[OBJC_IVAR____TtC21WritingToolsUIService26PromptEntryViewCoordinator_owner + 88];
  v8[0] = v3;
  *(_OWORD *)((char *)v8 + 9) = *(_OWORD *)&self->owner[OBJC_IVAR____TtC21WritingToolsUIService26PromptEntryViewCoordinator_owner
                                                      + 113];
  long long v4 = *(_OWORD *)&self->owner[OBJC_IVAR____TtC21WritingToolsUIService26PromptEntryViewCoordinator_owner + 40];
  v7[2] = *(_OWORD *)&self->owner[OBJC_IVAR____TtC21WritingToolsUIService26PromptEntryViewCoordinator_owner + 24];
  v7[3] = v4;
  long long v5 = *(_OWORD *)&self->owner[OBJC_IVAR____TtC21WritingToolsUIService26PromptEntryViewCoordinator_owner + 72];
  v7[4] = *(_OWORD *)&self->owner[OBJC_IVAR____TtC21WritingToolsUIService26PromptEntryViewCoordinator_owner + 56];
  v7[5] = v5;
  long long v6 = *(_OWORD *)&self->owner[OBJC_IVAR____TtC21WritingToolsUIService26PromptEntryViewCoordinator_owner + 8];
  v7[0] = *(_OWORD *)((char *)&self->super.isa
                    + OBJC_IVAR____TtC21WritingToolsUIService26PromptEntryViewCoordinator_owner);
  v7[1] = v6;
  sub_100094A34((uint64_t)v7);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21WritingToolsUIService26PromptEntryViewCoordinator_collectionView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21WritingToolsUIService26PromptEntryViewCoordinator_dataSource));
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  type metadata accessor for IndexPath();
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a3;
  v9 = self;
  v10 = (void *)sub_100094288(v7);

  swift_bridgeObjectRelease();

  return v10;
}

@end