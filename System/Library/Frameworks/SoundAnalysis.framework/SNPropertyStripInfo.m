@interface SNPropertyStripInfo
- (BOOL)isEqual:(id)a3;
- (_TtC13SoundAnalysis19SNPropertyStripInfo)init;
- (int64_t)hash;
@end

@implementation SNPropertyStripInfo

- (BOOL)isEqual:(id)a3
{
  return sub_1DC9B2F30(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_1DC9B2D5C);
}

- (int64_t)hash
{
  v2 = self;
  unint64_t v3 = sub_1DC9B2FEC();

  return v3;
}

- (_TtC13SoundAnalysis19SNPropertyStripInfo)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end