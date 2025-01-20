@interface PersonRankingService
- (_TtC20IntelligencePlatform20PersonRankingService)init;
- (_TtC20IntelligencePlatform20PersonRankingService)initWithConfig:(id)a3;
- (id)rankedPersonsForObjCWithMaxCount:(int64_t)a3 error:(id *)a4;
@end

@implementation PersonRankingService

- (_TtC20IntelligencePlatform20PersonRankingService)initWithConfig:(id)a3
{
  return (_TtC20IntelligencePlatform20PersonRankingService *)PersonRankingService.init(config:)((uint64_t)a3);
}

- (id)rankedPersonsForObjCWithMaxCount:(int64_t)a3 error:(id *)a4
{
  v5 = self;
  sub_1B2D7BC44(a3);

  sub_1B2D7DA70();
  v6 = (void *)sub_1B2E82828();
  swift_bridgeObjectRelease();

  return v6;
}

- (_TtC20IntelligencePlatform20PersonRankingService)init
{
}

- (void).cxx_destruct
{
}

@end