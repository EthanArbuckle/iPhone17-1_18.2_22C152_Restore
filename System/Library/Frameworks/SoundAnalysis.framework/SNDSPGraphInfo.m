@interface SNDSPGraphInfo
- (BOOL)isEqual:(id)a3;
- (_TtC13SoundAnalysis14SNDSPGraphInfo)init;
- (int64_t)hash;
@end

@implementation SNDSPGraphInfo

- (BOOL)isEqual:(id)a3
{
  return sub_1DC9B2F30(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_1DC9B2218);
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_1DC9B23F0();

  return v3;
}

- (_TtC13SoundAnalysis14SNDSPGraphInfo)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end