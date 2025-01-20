@interface SNSpeechEmotionResult
+ (BOOL)supportsSecureCoding;
- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)modelIdentifier;
- (SNSpeechEmotionResult)init;
- (SNSpeechEmotionResult)initWithBinarySampleRepresentation:(id)a3;
- (SNSpeechEmotionResult)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (SNSpeechEmotionResult)initWithCoder:(id)a3;
- (SNSpeechEmotionResult)initWithMood:(double)a3 valence:(double)a4 arousal:(double)a5 dominance:(double)a6;
- (double)arousal;
- (double)confidence;
- (double)dominance;
- (double)mood;
- (double)valence;
- (id)binarySampleRepresentation;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setArousal:(double)a3;
- (void)setConfidence:(double)a3;
- (void)setDominance:(double)a3;
- (void)setModelIdentifier:(id)a3;
- (void)setMood:(double)a3;
- (void)setTimeRange:(id *)a3;
- (void)setValence:(double)a3;
@end

@implementation SNSpeechEmotionResult

- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange
{
  SNSpeechEmotionResult.timeRange.getter((uint64_t)v9);
  int64_t v5 = v12;
  uint64_t v6 = v9[1];
  uint64_t v7 = v11;
  long long v8 = v10;
  retstr->var0.var0 = v9[0];
  *(void *)&retstr->var0.var1 = v6;
  *(_OWORD *)&retstr->var0.var3 = v8;
  *(void *)&retstr->var1.var1 = v7;
  retstr->var1.var3 = v5;
  return result;
}

- (void)setTimeRange:(id *)a3
{
  int64_t var3 = a3->var1.var3;
  v4[0] = a3->var0.var0;
  v4[1] = *(void *)&a3->var0.var1;
  long long v5 = *(_OWORD *)&a3->var0.var3;
  uint64_t v6 = *(void *)&a3->var1.var1;
  int64_t v7 = var3;
  SNSpeechEmotionResult.timeRange.setter((uint64_t)v4);
}

- (double)confidence
{
  return SNSpeechEmotionResult.confidence.getter();
}

- (void)setConfidence:(double)a3
{
}

- (double)mood
{
  return SNSpeechEmotionResult.mood.getter();
}

- (void)setMood:(double)a3
{
}

- (double)valence
{
  return SNSpeechEmotionResult.valence.getter();
}

- (void)setValence:(double)a3
{
}

- (double)arousal
{
  return SNSpeechEmotionResult.arousal.getter();
}

- (void)setArousal:(double)a3
{
}

- (double)dominance
{
  return SNSpeechEmotionResult.dominance.getter();
}

- (void)setDominance:(double)a3
{
}

- (NSString)modelIdentifier
{
  SNSpeechEmotionResult.modelIdentifier.getter();
  v2 = (void *)sub_1DCB87908();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setModelIdentifier:(id)a3
{
  uint64_t v4 = sub_1DCB87938();
  uint64_t v6 = v5;
  int64_t v7 = self;
  SNSpeechEmotionResult.modelIdentifier.setter(v4, v6);
}

- (SNSpeechEmotionResult)init
{
  return (SNSpeechEmotionResult *)sub_1DCA5EEFC();
}

- (SNSpeechEmotionResult)initWithMood:(double)a3 valence:(double)a4 arousal:(double)a5 dominance:(double)a6
{
  return (SNSpeechEmotionResult *)sub_1DCA5EF8C(a3, a4, a5, a6);
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  SNSpeechEmotionResult.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  uint64_t v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = SNSpeechEmotionResult.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1DCB88808();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = SNSpeechEmotionResult.isEqual(_:)((uint64_t)v8);

  sub_1DC881978((uint64_t)v8);
  return v6 & 1;
}

- (SNSpeechEmotionResult)initWithCoder:(id)a3
{
  return (SNSpeechEmotionResult *)SNSpeechEmotionResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  SNSpeechEmotionResult.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  v2 = self;
  SNSpeechEmotionResult.description.getter();

  int64_t v3 = (void *)sub_1DCB87908();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (SNSpeechEmotionResult)initWithBinarySampleRepresentation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_1DCB86AD8();
  unint64_t v6 = v5;

  return (SNSpeechEmotionResult *)sub_1DCA5FC84(v4, v6);
}

- (id)binarySampleRepresentation
{
  v2 = self;
  uint64_t v3 = sub_1DCA5FEE4();
  unint64_t v5 = v4;

  unint64_t v6 = (void *)sub_1DCB86AB8();
  sub_1DC881920(v3, v5);

  return v6;
}

- (SNSpeechEmotionResult)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  id v6 = a3;
  id v7 = a4;
  sub_1DCB86AD8();

  sub_1DCB877B8();
  return (SNSpeechEmotionResult *)sub_1DC91F404();
}

- (void).cxx_destruct
{
}

@end