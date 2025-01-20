@interface SNAUStripInfo
- (BOOL)isEqual:(id)a3;
- (_TtC13SoundAnalysis13SNAUStripInfo)init;
- (int64_t)hash;
@end

@implementation SNAUStripInfo

- (BOOL)isEqual:(id)a3
{
  return sub_1DC9B2F30(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_1DC9B2808);
}

- (int64_t)hash
{
  v2 = self;
  unint64_t v3 = sub_1DC9B29DC();

  return v3;
}

- (_TtC13SoundAnalysis13SNAUStripInfo)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end