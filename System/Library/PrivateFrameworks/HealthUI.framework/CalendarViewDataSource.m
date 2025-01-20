@interface CalendarViewDataSource
- (_TtC8HealthUI22CalendarViewDataSource)init;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
@end

@implementation CalendarViewDataSource

- (_TtC8HealthUI22CalendarViewDataSource)init
{
  result = (_TtC8HealthUI22CalendarViewDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1E0E20BBC((uint64_t)self + OBJC_IVAR____TtC8HealthUI22CalendarViewDataSource_cellProvider);
  v3 = (char *)self + OBJC_IVAR____TtC8HealthUI22CalendarViewDataSource_calendar;
  uint64_t v4 = sub_1E0ECBB60();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8HealthUI22CalendarViewDataSource_startDate;
  uint64_t v6 = sub_1E0ECB980();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v8 = (char *)self + OBJC_IVAR____TtC8HealthUI22CalendarViewDataSource_startComponents;
  uint64_t v9 = sub_1E0ECB460();
  v11 = *(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v11)((void *)(v9 - 8), v8, v9);
  v7((char *)self + OBJC_IVAR____TtC8HealthUI22CalendarViewDataSource_endDate, v6);
  v10 = (char *)self + OBJC_IVAR____TtC8HealthUI22CalendarViewDataSource_endComponents;
  v11(v10, v9);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = _s8HealthUI22CalendarViewDataSourceC16numberOfSections2inSiSo012UICollectionD0C_tF_0();

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v7 = sub_1E0ECB980();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = a3;
  v13 = self;
  CalendarViewDataSource.startDate(forSection:)(a4, (uint64_t)v11);
  uint64_t v14 = sub_1E0E4ABF8((uint64_t)v11);
  uint64_t v15 = sub_1E0ECBAC0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);

  int64_t result = v14 + v15;
  if (__OFADD__(v14, v15)) {
    __break(1u);
  }
  return result;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1E0ECBD30();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E0ECBCE0();
  id v11 = a3;
  id v12 = self;
  v13 = (void *)CalendarViewDataSource.collectionView(_:cellForItemAt:)((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v13;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = sub_1E0ECBD30();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  id v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1E0ECD1D0();
  uint64_t v14 = v13;
  sub_1E0ECBCE0();
  id v15 = a3;
  v16 = self;
  uint64_t v17 = (void *)CalendarViewDataSource.collectionView(_:viewForSupplementaryElementOfKind:at:)((uint64_t)v15, v12, v14, (uint64_t)v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v17;
}

@end