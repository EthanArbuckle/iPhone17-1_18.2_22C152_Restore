@interface CycleHistoryDataSource
- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4;
- (void)significantTimeChangeDidOccur:(id)a3;
@end

@implementation CycleHistoryDataSource

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  v5 = *(void **)self->analysis;
  *(void *)self->analysis = a4;
  id v6 = a3;
  id v7 = a4;
  swift_retain();

  id v8 = v7;
  sub_2416041D8(v8);

  swift_release();
}

- (void)significantTimeChangeDidOccur:(id)a3
{
  uint64_t v3 = sub_24162AF38();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162AF08();
  swift_retain();
  sub_241604B20((uint64_t)v6);
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end