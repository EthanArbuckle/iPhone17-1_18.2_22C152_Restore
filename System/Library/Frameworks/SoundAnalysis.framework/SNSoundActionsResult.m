@interface SNSoundActionsResult
+ (BOOL)supportsSecureCoding;
- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)name;
- (SNSoundActionsResult)init;
- (SNSoundActionsResult)initWithCoder:(id)a3;
- (double)confidence;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setName:(id)a3;
- (void)setTimeRange:(id *)a3;
@end

@implementation SNSoundActionsResult

- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange
{
  SNSoundActionsResult.timeRange.getter((uint64_t)v9);
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
  SNSoundActionsResult.timeRange.setter((uint64_t)v4);
}

- (double)confidence
{
  return SNSoundActionsResult.confidence.getter();
}

- (void)setConfidence:(double)a3
{
}

- (NSString)name
{
  SNSoundActionsResult.name.getter();
  v2 = (void *)sub_1DCB87908();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setName:(id)a3
{
  uint64_t v4 = sub_1DCB87938();
  uint64_t v6 = v5;
  int64_t v7 = self;
  SNSoundActionsResult.name.setter(v4, v6);
}

- (SNSoundActionsResult)init
{
  return (SNSoundActionsResult *)sub_1DC8FA42C();
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  SNSoundActionsResult.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  uint64_t v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = SNSoundActionsResult.hash.getter();

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
  char v6 = SNSoundActionsResult.isEqual(_:)((uint64_t)v8);

  sub_1DC881978((uint64_t)v8);
  return v6 & 1;
}

- (SNSoundActionsResult)initWithCoder:(id)a3
{
  return (SNSoundActionsResult *)SNSoundActionsResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  SNSoundActionsResult.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  v2 = self;
  SNSoundActionsResult.description.getter();

  int64_t v3 = (void *)sub_1DCB87908();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
}

@end