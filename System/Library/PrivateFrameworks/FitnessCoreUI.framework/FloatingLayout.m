@interface FloatingLayout
- (_TtC13FitnessCoreUI14FloatingLayout)initWithCoder:(id)a3;
- (_TtC13FitnessCoreUI14FloatingLayout)initWithSection:(id)a3;
- (_TtC13FitnessCoreUI14FloatingLayout)initWithSection:(id)a3 configuration:(id)a4;
- (_TtC13FitnessCoreUI14FloatingLayout)initWithSectionProvider:(id)a3;
- (_TtC13FitnessCoreUI14FloatingLayout)initWithSectionProvider:(id)a3 configuration:(id)a4;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (void)prepareForCollectionViewUpdates:(id)a3;
@end

@implementation FloatingLayout

- (void)prepareForCollectionViewUpdates:(id)a3
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_24EEBFE9C();
  unint64_t v4 = sub_24EEDD940();
  v5 = self;
  sub_24EEBEAC4(v4);
  swift_release();

  swift_bridgeObjectRelease();
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = sub_24EEDD2E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24EEDD2A0();
  v8 = self;
  id v9 = sub_24EEBF188((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_release();
  return v9;
}

- (_TtC13FitnessCoreUI14FloatingLayout)initWithSection:(id)a3
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13FitnessCoreUI14FloatingLayout_animatableIndexPaths) = (Class)MEMORY[0x263F8EE88];
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FloatingLayout();
  uint64_t v5 = [(FloatingLayout *)&v7 initWithSection:a3];
  swift_release();
  return v5;
}

- (_TtC13FitnessCoreUI14FloatingLayout)initWithSection:(id)a3 configuration:(id)a4
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13FitnessCoreUI14FloatingLayout_animatableIndexPaths) = (Class)MEMORY[0x263F8EE88];
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FloatingLayout();
  objc_super v7 = [(FloatingLayout *)&v9 initWithSection:a3 configuration:a4];
  swift_release();
  return v7;
}

- (_TtC13FitnessCoreUI14FloatingLayout)initWithSectionProvider:(id)a3
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = _Block_copy(a3);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13FitnessCoreUI14FloatingLayout_animatableIndexPaths) = (Class)MEMORY[0x263F8EE88];
  aBlock[4] = sub_24EEC23BC;
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24EEBF904;
  aBlock[3] = &block_descriptor_9;
  objc_super v7 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for FloatingLayout();
  v8 = [(FloatingLayout *)&v10 initWithSectionProvider:v7];
  swift_release();
  _Block_release(v7);
  swift_release();
  return v8;
}

- (_TtC13FitnessCoreUI14FloatingLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  objc_super v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13FitnessCoreUI14FloatingLayout_animatableIndexPaths) = (Class)MEMORY[0x263F8EE88];
  aBlock[4] = sub_24EEBFE10;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24EEBF904;
  aBlock[3] = &block_descriptor_2;
  objc_super v9 = _Block_copy(aBlock);
  id v10 = a4;
  swift_retain();
  swift_release();
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for FloatingLayout();
  uint64_t v11 = [(FloatingLayout *)&v13 initWithSectionProvider:v9 configuration:v10];
  swift_release();

  _Block_release(v9);
  swift_release();
  return v11;
}

- (_TtC13FitnessCoreUI14FloatingLayout)initWithCoder:(id)a3
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13FitnessCoreUI14FloatingLayout_animatableIndexPaths) = (Class)MEMORY[0x263F8EE88];
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FloatingLayout();
  uint64_t v5 = [(FloatingLayout *)&v7 initWithCoder:a3];
  swift_release();
  return v5;
}

- (void).cxx_destruct
{
}

@end