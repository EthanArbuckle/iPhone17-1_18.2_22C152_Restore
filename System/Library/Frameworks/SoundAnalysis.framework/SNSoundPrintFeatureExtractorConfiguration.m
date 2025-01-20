@interface SNSoundPrintFeatureExtractorConfiguration
- (BOOL)isEqual:(id)a3;
- (_TtC13SoundAnalysis41SNSoundPrintFeatureExtractorConfiguration)init;
- (int64_t)hash;
@end

@implementation SNSoundPrintFeatureExtractorConfiguration

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_1DCB20F28();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1DCB88808();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_1DCB20FCC((uint64_t)v8);

  sub_1DC881978((uint64_t)v8);
  return v6;
}

- (_TtC13SoundAnalysis41SNSoundPrintFeatureExtractorConfiguration)init
{
}

- (void).cxx_destruct
{
}

@end