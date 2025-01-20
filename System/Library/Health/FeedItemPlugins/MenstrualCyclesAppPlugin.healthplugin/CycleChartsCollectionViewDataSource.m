@interface CycleChartsCollectionViewDataSource
- (_TtC24MenstrualCyclesAppPlugin35CycleChartsCollectionViewDataSource)init;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
@end

@implementation CycleChartsCollectionViewDataSource

- (_TtC24MenstrualCyclesAppPlugin35CycleChartsCollectionViewDataSource)init
{
  result = (_TtC24MenstrualCyclesAppPlugin35CycleChartsCollectionViewDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return (*(void **)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleChartsCollectionViewDataSource_cycles))[2];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_24143AEC0(a4);
  int64_t v9 = v8;

  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v19 = sub_241631AC8();
  uint64_t v6 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  int64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24162BB18();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  v13 = *(uint64_t (**)(id, char *, char *))((char *)&self->super.isa
                                                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleChartsCollectionViewDataSource_cellProvider);
  id v14 = a3;
  v15 = self;
  sub_24143A7FC();
  v16 = (void *)v13(v14, v12, v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v19);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

  return v16;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = sub_24162BB18();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  uint64_t v13 = v12;
  sub_24162BAA8();
  id v14 = *(uint64_t (**)(id, uint64_t, uint64_t, char *))((char *)&self->super.isa
                                                               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleChartsCollectionViewDataSource_supplementaryViewProvider);
  id v15 = a3;
  v16 = self;
  v17 = (void *)v14(v15, v11, v13, v10);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v17;
}

@end