@interface _SNClassification
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (_SNClassification)init;
- (_SNClassification)initWithCoder:(id)a3;
- (_SNClassification)initWithIdentifier:(id)a3 confidence:(double)a4;
- (double)confidence;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation _SNClassification

- (NSString)identifier
{
  _SNClassification.identifier.getter();
  v2 = (void *)sub_1DCB87908();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4 = sub_1DCB87938();
  uint64_t v6 = v5;
  v7 = self;
  _SNClassification.identifier.setter(v4, v6);
}

- (double)confidence
{
  return _SNClassification.confidence.getter();
}

- (void)setConfidence:(double)a3
{
}

- (_SNClassification)init
{
}

- (_SNClassification)initWithIdentifier:(id)a3 confidence:(double)a4
{
  uint64_t v5 = sub_1DCB87938();
  return (_SNClassification *)sub_1DC91CD88(v5, v6, a4);
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_1DC91E460(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))_SNClassification.copy(with:));
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = _SNClassification.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  return sub_1DC91E6CC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))_SNClassification.isEqual(_:));
}

- (_SNClassification)initWithCoder:(id)a3
{
  return (_SNClassification *)_SNClassification.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _SNClassification.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)sub_1DC91ECF8(self, (uint64_t)a2, (void (*)(void))_SNClassification.description.getter);
}

- (void).cxx_destruct
{
}

@end