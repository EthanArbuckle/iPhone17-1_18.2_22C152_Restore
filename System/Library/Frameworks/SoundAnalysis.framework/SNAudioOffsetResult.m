@interface SNAudioOffsetResult
+ (BOOL)supportsSecureCoding;
- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (SNAudioOffsetResult)init;
- (SNAudioOffsetResult)initWithCoder:(id)a3;
- (double)confidence;
- (double)offset;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setOffset:(double)a3;
- (void)setTimeRange:(id *)a3;
@end

@implementation SNAudioOffsetResult

- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange
{
  SNAudioOffsetResult.timeRange.getter((uint64_t)v9);
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
  SNAudioOffsetResult.timeRange.setter((uint64_t)v4);
}

- (double)offset
{
  return SNAudioOffsetResult.offset.getter();
}

- (void)setOffset:(double)a3
{
}

- (double)confidence
{
  return SNAudioOffsetResult.confidence.getter();
}

- (void)setConfidence:(double)a3
{
}

- (SNAudioOffsetResult)init
{
  return (SNAudioOffsetResult *)sub_1DCAB4D70();
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  SNAudioOffsetResult.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  return SNAudioOffsetResult.hash.getter();
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
  BOOL v6 = SNAudioOffsetResult.isEqual(_:)((uint64_t)v8);

  sub_1DC881978((uint64_t)v8);
  return v6;
}

- (SNAudioOffsetResult)initWithCoder:(id)a3
{
  return (SNAudioOffsetResult *)SNAudioOffsetResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  long long v5 = self;
  SNAudioOffsetResult.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  v2 = self;
  SNAudioOffsetResult.description.getter();

  v3 = (void *)sub_1DCB87908();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end