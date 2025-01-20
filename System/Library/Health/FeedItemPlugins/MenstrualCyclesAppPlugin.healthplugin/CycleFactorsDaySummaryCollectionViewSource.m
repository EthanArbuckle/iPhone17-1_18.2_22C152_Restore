@interface CycleFactorsDaySummaryCollectionViewSource
- (_TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource)init;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
@end

@implementation CycleFactorsDaySummaryCollectionViewSource

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource_rows))[2];
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = sub_24162BB18();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  uint64_t v13 = v12;
  sub_24162BAA8();
  id v14 = a3;
  v15 = self;
  v16 = (void *)sub_241224AD8(v14, v11, v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v16;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v10 = a3;
  uint64_t v11 = self;
  uint64_t v12 = (void *)sub_24122527C(v10, (unint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v10 = a3;
  uint64_t v11 = self;
  sub_241226208((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource)init
{
  result = (_TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource_providedHealthStore));
  sub_24122634C((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource_cycleDay, (uint64_t (*)(void))type metadata accessor for CycleDay);
  sub_2411CD138((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource____lazy_storage___shortMonthDayYearDateFormatter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource____lazy_storage___yearDateFormatter));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self
     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin42CycleFactorsDaySummaryCollectionViewSource_gregorianCalenadar;
  uint64_t v4 = sub_24162BA08();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end