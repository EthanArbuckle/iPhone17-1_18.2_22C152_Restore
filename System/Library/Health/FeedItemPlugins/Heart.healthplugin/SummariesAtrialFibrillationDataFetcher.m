@interface SummariesAtrialFibrillationDataFetcher
- (_TtC5Heart38SummariesAtrialFibrillationDataFetcher)init;
- (void)start;
@end

@implementation SummariesAtrialFibrillationDataFetcher

- (void)start
{
  v2 = self;
  sub_240AED2BC();
}

- (_TtC5Heart38SummariesAtrialFibrillationDataFetcher)init
{
  result = (_TtC5Heart38SummariesAtrialFibrillationDataFetcher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Heart38SummariesAtrialFibrillationDataFetcher_healthStore));
  _s5Heart41FeedItemContextPreviousFeedItemFetcherBoxVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Heart38SummariesAtrialFibrillationDataFetcher_healthExperienceStore);

  swift_release();
}

@end