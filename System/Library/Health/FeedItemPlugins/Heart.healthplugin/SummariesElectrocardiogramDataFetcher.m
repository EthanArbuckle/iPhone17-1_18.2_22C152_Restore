@interface SummariesElectrocardiogramDataFetcher
- (_TtC5Heart37SummariesElectrocardiogramDataFetcher)init;
- (void)start;
@end

@implementation SummariesElectrocardiogramDataFetcher

- (void)start
{
  v2 = self;
  sub_240B347B8();
}

- (_TtC5Heart37SummariesElectrocardiogramDataFetcher)init
{
  result = (_TtC5Heart37SummariesElectrocardiogramDataFetcher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Heart37SummariesElectrocardiogramDataFetcher_healthStore));
  _s5Heart41FeedItemContextPreviousFeedItemFetcherBoxVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Heart37SummariesElectrocardiogramDataFetcher_healthExperienceStore);

  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC5Heart37SummariesElectrocardiogramDataFetcher_resultsHandler);

  sub_240A87A1C(v3);
}

@end