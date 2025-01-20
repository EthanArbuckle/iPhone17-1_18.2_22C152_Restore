@interface SNSpeechDistanceResult
+ (BOOL)supportsSecureCoding;
- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (SNSpeechDistanceResult)init;
- (SNSpeechDistanceResult)initWithCoder:(id)a3;
- (double)currentFrameValue;
- (double)meanValue;
- (double)standardDeviation;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentFrameValue:(double)a3;
- (void)setMeanValue:(double)a3;
- (void)setStandardDeviation:(double)a3;
- (void)setTimeRange:(id *)a3;
@end

@implementation SNSpeechDistanceResult

- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange
{
  SNSpeechDistanceResult.timeRange.getter((uint64_t)v9);
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
  SNSpeechDistanceResult.timeRange.setter((uint64_t)v4);
}

- (double)currentFrameValue
{
  return sub_1DC95BC70();
}

- (void)setCurrentFrameValue:(double)a3
{
}

- (double)meanValue
{
  return sub_1DC95BCCC();
}

- (void)setMeanValue:(double)a3
{
}

- (double)standardDeviation
{
  return sub_1DC95BD28();
}

- (void)setStandardDeviation:(double)a3
{
}

- (SNSpeechDistanceResult)init
{
  return (SNSpeechDistanceResult *)sub_1DC95BD60();
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  SNSpeechDistanceResult.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  return SNSpeechDistanceResult.hash.getter();
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
    long long v5 = self;
  }
  BOOL v6 = SNSpeechDistanceResult.isEqual(_:)((uint64_t)v8);

  sub_1DC881978((uint64_t)v8);
  return v6;
}

- (SNSpeechDistanceResult)initWithCoder:(id)a3
{
  return (SNSpeechDistanceResult *)SNSpeechDistanceResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  long long v5 = self;
  SNSpeechDistanceResult.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  v2 = self;
  SNSpeechDistanceResult.description.getter();

  v3 = (void *)sub_1DCB87908();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end