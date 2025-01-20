@interface DaemonHealthExperienceStoreOracle
- (void)dealloc;
- (void)debuggingInfoRequestedWithNote:(id)a3;
@end

@implementation DaemonHealthExperienceStoreOracle

- (void)dealloc
{
  v2 = self;
  sub_1C2685440();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for DaemonHealthExperienceStoreOracle();
  [(DaemonHealthExperienceStoreOracle *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)debuggingInfoRequestedWithNote:(id)a3
{
  uint64_t v4 = sub_1C277A580();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C277A530();
  v8 = self;
  DaemonHealthExperienceStoreOracle.debuggingInfoRequested(note:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end