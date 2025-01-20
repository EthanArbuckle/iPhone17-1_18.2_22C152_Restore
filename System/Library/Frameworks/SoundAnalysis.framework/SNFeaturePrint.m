@interface SNFeaturePrint
+ (BOOL)supportsSecureCoding;
+ (id)cosineSimilarityBetweenOneFeatureVector:(id)a3 andAnotherFeatureVector:(id)a4 error:(id *)a5;
+ (id)cosineSimilarityBetweenOneFloat32Array:(float *)a3 andAnotherFloat32Array:(float *)a4 length:(int64_t)a5 error:(id *)a6;
- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange;
- (BOOL)isEqual:(id)a3;
- (MLMultiArray)featureVector;
- (NSString)description;
- (SNFeaturePrint)init;
- (SNFeaturePrint)initWithCoder:(id)a3;
- (SNFeaturePrint)initWithFeaturePrintType:(int64_t)a3 featureVector:(id)a4;
- (id)copyWithZone:(void *)a3;
- (int64_t)featurePrintType;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFeaturePrintType:(int64_t)a3;
- (void)setFeatureVector:(id)a3;
- (void)setTimeRange:(id *)a3;
@end

@implementation SNFeaturePrint

- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange
{
  SNFeaturePrint.timeRange.getter((uint64_t)v9);
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
  SNFeaturePrint.timeRange.setter((uint64_t)v4);
}

- (int64_t)featurePrintType
{
  return SNFeaturePrint.featurePrintType.getter();
}

- (void)setFeaturePrintType:(int64_t)a3
{
}

- (MLMultiArray)featureVector
{
  id v2 = SNFeaturePrint.featureVector.getter();

  return (MLMultiArray *)v2;
}

- (void)setFeatureVector:(id)a3
{
  id v4 = a3;
  long long v5 = self;
  SNFeaturePrint.featureVector.setter((uint64_t)v4);
}

- (SNFeaturePrint)init
{
  return (SNFeaturePrint *)sub_1DCA943DC();
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  SNFeaturePrint.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  id v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  id v2 = self;
  int64_t v3 = SNFeaturePrint.hash.getter();

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
  char v6 = SNFeaturePrint.isEqual(_:)((uint64_t)v8);

  sub_1DC881978((uint64_t)v8);
  return v6 & 1;
}

- (SNFeaturePrint)initWithCoder:(id)a3
{
  return (SNFeaturePrint *)SNFeaturePrint.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  long long v5 = self;
  SNFeaturePrint.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SNFeaturePrint)initWithFeaturePrintType:(int64_t)a3 featureVector:(id)a4
{
  return (SNFeaturePrint *)sub_1DCA94C18(a3, a4);
}

+ (id)cosineSimilarityBetweenOneFloat32Array:(float *)a3 andAnotherFloat32Array:(float *)a4 length:(int64_t)a5 error:(id *)a6
{
  id v6 = sub_1DCA94DA0(a3, a4, a5);

  return v6;
}

+ (id)cosineSimilarityBetweenOneFeatureVector:(id)a3 andAnotherFeatureVector:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  sub_1DCA95114(v6, v7);
  v9 = v8;

  return v9;
}

- (NSString)description
{
  id v2 = self;
  SNFeaturePrint.description.getter();

  int64_t v3 = (void *)sub_1DCB87908();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
}

@end