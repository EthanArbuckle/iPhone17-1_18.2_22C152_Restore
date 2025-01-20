@interface SNShazamSignatureResult
+ (BOOL)supportsSecureCoding;
- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (SHSignature)signature;
- (SNShazamSignatureResult)init;
- (SNShazamSignatureResult)initWithCoder:(id)a3;
- (SNShazamSignatureResult)initWithSignature:(id)a3 sequenceNum:(unint64_t)a4;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (unint64_t)sequenceNum;
- (void)encodeWithCoder:(id)a3;
- (void)setSequenceNum:(unint64_t)a3;
- (void)setSignature:(id)a3;
- (void)setTimeRange:(id *)a3;
@end

@implementation SNShazamSignatureResult

- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange
{
  SNShazamSignatureResult.timeRange.getter((uint64_t)v9);
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
  SNShazamSignatureResult.timeRange.setter((uint64_t)v4);
}

- (SHSignature)signature
{
  id v2 = SNShazamSignatureResult.signature.getter();

  return (SHSignature *)v2;
}

- (void)setSignature:(id)a3
{
  id v4 = a3;
  long long v5 = self;
  SNShazamSignatureResult.signature.setter((uint64_t)v4);
}

- (unint64_t)sequenceNum
{
  return SNShazamSignatureResult.sequenceNum.getter();
}

- (void)setSequenceNum:(unint64_t)a3
{
}

- (SNShazamSignatureResult)initWithSignature:(id)a3 sequenceNum:(unint64_t)a4
{
  return (SNShazamSignatureResult *)sub_1DC9CB5F4(a3, a4);
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  SNShazamSignatureResult.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  id v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  id v2 = self;
  int64_t v3 = SNShazamSignatureResult.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1DCB88808();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    long long v5 = self;
  }
  char v6 = SNShazamSignatureResult.isEqual(_:)((uint64_t)v8);

  sub_1DC881978((uint64_t)v8);
  return v6 & 1;
}

- (SNShazamSignatureResult)initWithCoder:(id)a3
{
  return (SNShazamSignatureResult *)SNShazamSignatureResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  long long v5 = self;
  SNShazamSignatureResult.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  id v2 = self;
  SNShazamSignatureResult.description.getter();

  int64_t v3 = (void *)sub_1DCB87908();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (SNShazamSignatureResult)init
{
}

- (void).cxx_destruct
{
}

@end