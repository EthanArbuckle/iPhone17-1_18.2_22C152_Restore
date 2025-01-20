@interface SummariesElectrocardiogramListDataProvider
- (BOOL)calendarDateSelectorVisible;
- (BOOL)hasCompleteDataSet;
- (_TtC5Heart42SummariesElectrocardiogramListDataProvider)init;
- (_TtC5Heart42SummariesElectrocardiogramListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4;
- (_TtC5Heart42SummariesElectrocardiogramListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5;
- (id)activeECGAlgorithmVersion;
- (id)createDataFetcherForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7;
@end

@implementation SummariesElectrocardiogramListDataProvider

- (_TtC5Heart42SummariesElectrocardiogramListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart42SummariesElectrocardiogramListDataProvider____lazy_storage___dataFetcher) = 0;
  id v6 = a3;
  id v7 = a4;

  result = (_TtC5Heart42SummariesElectrocardiogramListDataProvider *)sub_240BB78D0();
  __break(1u);
  return result;
}

- (id)createDataFetcherForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7
{
  v11 = _Block_copy(a7);
  if (a6)
  {
    sub_240A34DC4(0, (unint64_t *)&qword_268CA06D0);
    sub_240BB6F10();
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  v16 = (char *)sub_240B343A4();
  v17 = (void (**)(void *, uint64_t))&v16[OBJC_IVAR____TtC5Heart37SummariesElectrocardiogramDataFetcher_resultsHandler];
  uint64_t v18 = *(void *)&v16[OBJC_IVAR____TtC5Heart37SummariesElectrocardiogramDataFetcher_resultsHandler];
  *v17 = sub_240AEE510;
  v17[1] = (void (*)(void *, uint64_t))v12;
  swift_retain();
  sub_240A87A1C(v18);

  id v19 = sub_240B343A4();
  swift_bridgeObjectRelease();
  swift_release();

  return v19;
}

- (id)activeECGAlgorithmVersion
{
  v2 = self;
  v3 = sub_240B343A4();
  char v4 = v3[OBJC_IVAR____TtC5Heart37SummariesElectrocardiogramDataFetcher_activeAlgorithmVersion + 8];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    sub_240A34DC4(0, (unint64_t *)&qword_268CA10E0);
    v5 = (void *)sub_240BB74E0();
  }

  return v5;
}

- (BOOL)hasCompleteDataSet
{
  return 1;
}

- (BOOL)calendarDateSelectorVisible
{
  return 0;
}

- (_TtC5Heart42SummariesElectrocardiogramListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4 mode:(int64_t)a5
{
  id v6 = a3;
  id v7 = a4;
  result = (_TtC5Heart42SummariesElectrocardiogramListDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Heart42SummariesElectrocardiogramListDataProvider)init
{
  result = (_TtC5Heart42SummariesElectrocardiogramListDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart42SummariesElectrocardiogramListDataProvider_store));
  _s5Heart41FeedItemContextPreviousFeedItemFetcherBoxVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Heart42SummariesElectrocardiogramListDataProvider_healthExperienceStore);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Heart42SummariesElectrocardiogramListDataProvider____lazy_storage___dataFetcher);
}

@end