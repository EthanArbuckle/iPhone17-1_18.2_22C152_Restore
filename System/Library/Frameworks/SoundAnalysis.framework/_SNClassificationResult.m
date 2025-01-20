@interface _SNClassificationResult
+ (BOOL)supportsSecureCoding;
- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)classificationDictionary;
- (NSString)classifierIdentifier;
- (NSString)description;
- (_SNClassificationResult)init;
- (_SNClassificationResult)initWithBinarySampleRepresentation:(id)a3;
- (_SNClassificationResult)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (_SNClassificationResult)initWithClassificationDictionary:(id)a3;
- (_SNClassificationResult)initWithCoder:(id)a3;
- (id)_initPrivate:(id)a3;
- (id)binarySampleRepresentation;
- (id)classificationForIdentifier:(id)a3;
- (id)classifications;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setClassificationDictionary:(id)a3;
- (void)setClassifierIdentifier:(id)a3;
- (void)setTimeRange:(id *)a3;
@end

@implementation _SNClassificationResult

- (_SNClassificationResult)init
{
}

- (NSDictionary)classificationDictionary
{
  v2 = self;
  _SNClassificationResult.classificationDictionary.getter();

  sub_1DC89C89C(0, (unint64_t *)&qword_1EAA9C7A0);
  v3 = (void *)sub_1DCB87788();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v3;
}

- (void)setClassificationDictionary:(id)a3
{
  sub_1DC89C89C(0, (unint64_t *)&qword_1EAA9C7A0);
  uint64_t v4 = sub_1DCB877B8();
  v5 = self;
  _SNClassificationResult.classificationDictionary.setter(v4);
}

- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange
{
  _SNClassificationResult.timeRange.getter((uint64_t)v9);
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
  v4[0] = *(double *)&a3->var0.var0;
  v4[1] = *(double *)&a3->var0.var1;
  long long v5 = *(_OWORD *)&a3->var0.var3;
  uint64_t v6 = *(void *)&a3->var1.var1;
  int64_t v7 = var3;
  _SNClassificationResult.timeRange.setter(v4);
}

- (NSString)classifierIdentifier
{
  _SNClassificationResult.classifierIdentifier.getter();
  if (v2)
  {
    v3 = (void *)sub_1DCB87908();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setClassifierIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1DCB87938();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  int64_t v7 = self;
  _SNClassificationResult.classifierIdentifier.setter(v4, v6);
}

- (id)_initPrivate:(id)a3
{
  id v4 = a3;
  return sub_1DC91DCF0(a3);
}

- (_SNClassificationResult)initWithClassificationDictionary:(id)a3
{
  return (_SNClassificationResult *)sub_1DC91DE08();
}

- (id)classificationForIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1DCB87938();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  int64_t v7 = self;
  id v8 = sub_1DC91DF38(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (id)classifications
{
  uint64_t v2 = self;
  sub_1DC91E0B4();

  type metadata accessor for _SNClassification();
  v3 = (void *)sub_1DCB87C08();
  swift_bridgeObjectRelease();

  return v3;
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_1DC91E460(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))_SNClassificationResult.copy(with:));
}

- (int64_t)hash
{
  uint64_t v2 = self;
  int64_t v3 = _SNClassificationResult.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  return sub_1DC91E6CC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))_SNClassificationResult.isEqual(_:));
}

- (_SNClassificationResult)initWithCoder:(id)a3
{
  return (_SNClassificationResult *)_SNClassificationResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _SNClassificationResult.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)sub_1DC91ECF8(self, (uint64_t)a2, (void (*)(void))_SNClassificationResult.description.getter);
}

- (_SNClassificationResult)initWithBinarySampleRepresentation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_1DCB86AD8();
  unint64_t v6 = v5;

  return (_SNClassificationResult *)sub_1DC91EF30(v4, v6);
}

- (id)binarySampleRepresentation
{
  uint64_t v2 = self;
  uint64_t v3 = sub_1DC91F25C();
  unint64_t v5 = v4;

  unint64_t v6 = (void *)sub_1DCB86AB8();
  sub_1DC881920(v3, v5);

  return v6;
}

- (_SNClassificationResult)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  id v6 = a3;
  id v7 = a4;
  sub_1DCB86AD8();

  sub_1DCB877B8();
  return (_SNClassificationResult *)sub_1DC91F404();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end