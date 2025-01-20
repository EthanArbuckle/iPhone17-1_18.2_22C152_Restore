@interface FMFindingWatchMetrics
- (_TtC11FMFindingUI21FMFindingWatchMetrics)init;
@end

@implementation FMFindingWatchMetrics

- (_TtC11FMFindingUI21FMFindingWatchMetrics)init
{
  return (_TtC11FMFindingUI21FMFindingWatchMetrics *)FMFindingWatchMetrics.init()();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11FMFindingUI21FMFindingWatchMetrics_instanceIdentifier;
  uint64_t v4 = sub_24D39C8A0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11FMFindingUI21FMFindingWatchMetrics_startTime;
  uint64_t v6 = sub_24D39C830();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
}

@end