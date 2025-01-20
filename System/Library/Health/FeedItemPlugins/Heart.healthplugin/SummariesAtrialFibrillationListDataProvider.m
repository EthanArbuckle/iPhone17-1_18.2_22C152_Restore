@interface SummariesAtrialFibrillationListDataProvider
- (_TtC5Heart43SummariesAtrialFibrillationListDataProvider)init;
- (_TtC5Heart43SummariesAtrialFibrillationListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4;
- (id)createDataFetcherForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7;
@end

@implementation SummariesAtrialFibrillationListDataProvider

- (_TtC5Heart43SummariesAtrialFibrillationListDataProvider)initWithDisplayType:(id)a3 profile:(id)a4
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart43SummariesAtrialFibrillationListDataProvider_store) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC5Heart43SummariesAtrialFibrillationListDataProvider_healthExperienceStore;
  v8 = (objc_class *)type metadata accessor for SummariesAtrialFibrillationListDataProvider();
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((void *)v7 + 4) = 0;
  v10.receiver = self;
  v10.super_class = v8;
  return [(WDSampleListDataProvider *)&v10 initWithDisplayType:a3 profile:a4];
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
  id v16 = sub_240AEE518((uint64_t)sub_240AEE510, v12);

  swift_bridgeObjectRelease();
  swift_release();

  return v16;
}

- (_TtC5Heart43SummariesAtrialFibrillationListDataProvider)init
{
  result = (_TtC5Heart43SummariesAtrialFibrillationListDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart43SummariesAtrialFibrillationListDataProvider_store));
  sub_240AEE640((uint64_t)self + OBJC_IVAR____TtC5Heart43SummariesAtrialFibrillationListDataProvider_healthExperienceStore, &qword_268C9F668, (uint64_t (*)(uint64_t))sub_240A83088);
}

@end