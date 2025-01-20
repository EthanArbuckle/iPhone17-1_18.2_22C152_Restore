@interface CycleChartsCollectionView
- (_TtC24MenstrualCyclesAppPlugin25CycleChartsCollectionView)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin25CycleChartsCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (id)ax_cycleChartDayForIndexPath:(id)a3;
- (id)ax_cycles;
- (id)ax_predominantCycle;
@end

@implementation CycleChartsCollectionView

- (id)ax_cycles
{
  sub_2414E6AE0(0, (unint64_t *)&unk_268D04810, (void (*)(uint64_t))type metadata accessor for CycleChartsModel);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (uint64_t *)&v11[-v4];
  swift_getKeyPath();
  swift_getKeyPath();
  v6 = self;
  sub_24162FC48();
  swift_release();
  swift_release();
  uint64_t v7 = type metadata accessor for CycleChartsModel();
  id result = (id)(*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v9 = *v5;
    _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
    sub_2414E6BA0((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for CycleChartsModel);
    sub_2414E3F58(v9);

    swift_bridgeObjectRelease();
    sub_2414E78A4(0, (unint64_t *)&qword_268D00FD0, MEMORY[0x263F8D310], MEMORY[0x263F8D320], MEMORY[0x263F8D060]);
    v10 = (void *)sub_241631F18();
    swift_bridgeObjectRelease();
    return v10;
  }
  return result;
}

- (id)ax_predominantCycle
{
  sub_2414E6AE0(0, &qword_268CFAEC8, (void (*)(uint64_t))type metadata accessor for CycleChartCycle);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - v4;
  swift_getKeyPath();
  swift_getKeyPath();
  v6 = self;
  sub_24162FC48();
  swift_release();
  swift_release();
  uint64_t v7 = type metadata accessor for CycleChartCycle(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) == 1)
  {
    sub_2414E796C((uint64_t)v5, &qword_268CFAEC8, (void (*)(uint64_t))type metadata accessor for CycleChartCycle);
    sub_2414E4810(MEMORY[0x263F8EE78]);
  }
  else
  {
    sub_2414E594C();
    sub_2414E6BA0((uint64_t)v5, type metadata accessor for CycleChartCycle);
  }

  v8 = (void *)sub_241631B18();
  swift_bridgeObjectRelease();

  return v8;
}

- (id)ax_cycleChartDayForIndexPath:(id)a3
{
  uint64_t v4 = sub_24162BB18();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  v8 = self;
  CycleChartsCollectionView.ax_cycleChartDay(forIndexPath:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v9 = (void *)sub_241631B18();
  swift_bridgeObjectRelease();

  return v9;
}

- (_TtC24MenstrualCyclesAppPlugin25CycleChartsCollectionView)initWithCoder:(id)a3
{
  id v4 = a3;
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_241633068()) {
    uint64_t v5 = (objc_class *)sub_2411CA178(MEMORY[0x263F8EE78]);
  }
  else {
    uint64_t v5 = (objc_class *)MEMORY[0x263F8EE88];
  }
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25CycleChartsCollectionView_subscriptions) = v5;

  id result = (_TtC24MenstrualCyclesAppPlugin25CycleChartsCollectionView *)sub_241633038();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin25CycleChartsCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  id v4 = a4;
  id result = (_TtC24MenstrualCyclesAppPlugin25CycleChartsCollectionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end