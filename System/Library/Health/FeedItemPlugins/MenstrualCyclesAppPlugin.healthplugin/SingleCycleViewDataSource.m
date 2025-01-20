@interface SingleCycleViewDataSource
- (_TtC24MenstrualCyclesAppPlugin25SingleCycleViewDataSource)init;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
@end

@implementation SingleCycleViewDataSource

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  sub_241215380();
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v11 = (char *)&v23 - v10;
  sub_2412216AC();
  MEMORY[0x270FA5388](v12 - 8);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SingleCycleViewDataSource_today;
  id v16 = a3;
  v17 = self;
  sub_24136561C(v15, (uint64_t)v14);
  uint64_t v18 = sub_241631AC8();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v11, v14, v18);
  v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
  v20(v11, 0, 1, v18);
  v20(v8, 1, 1, v18);
  int64_t v21 = sub_24139358C((uint64_t)v11, (uint64_t)v8);
  sub_241221974((uint64_t)v8, (uint64_t (*)(void))sub_241215380);
  sub_241221974((uint64_t)v11, (uint64_t (*)(void))sub_241215380);
  sub_241221974((uint64_t)v14, (uint64_t (*)(void))sub_2412216AC);

  return v21;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_24162BB18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v10 = a3;
  v11 = self;
  uint64_t v12 = (void *)sub_241631CC8();
  uint64_t v13 = (void *)sub_24162BA88();
  id v14 = objc_msgSend(v10, sel_dequeueReusableCellWithReuseIdentifier_forIndexPath_, v12, v13);

  type metadata accessor for CycleHistoryCycleDayCell();
  v15 = (void *)swift_dynamicCastClassUnconditional();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v15;
}

- (_TtC24MenstrualCyclesAppPlugin25SingleCycleViewDataSource)init
{
  result = (_TtC24MenstrualCyclesAppPlugin25SingleCycleViewDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SingleCycleViewDataSource_cycle));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SingleCycleViewDataSource_cycleViewModelProvider));
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25SingleCycleViewDataSource_today;
  uint64_t v4 = sub_241631AC8();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end