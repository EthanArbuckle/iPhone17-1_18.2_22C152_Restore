@interface DUCategoryResult
- (NSString)categoryIdentifier;
- (_TtC21DocumentUnderstanding16DUCategoryResult)init;
- (_TtC21DocumentUnderstanding16DUCategoryResult)initWithCoder:(id)a3;
- (double)categoryConfidence;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCategoryConfidence:(double)a3;
- (void)setCategoryIdentifier:(id)a3;
@end

@implementation DUCategoryResult

- (NSString)categoryIdentifier
{
  DUCategoryResult.categoryIdentifier.getter();
  v2 = (void *)sub_23697AF3C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setCategoryIdentifier:(id)a3
{
  uint64_t v4 = sub_23697AF6C();
  uint64_t v6 = v5;
  v7 = self;
  DUCategoryResult.categoryIdentifier.setter(v4, v6);
}

- (double)categoryConfidence
{
  return DUCategoryResult.categoryConfidence.getter();
}

- (void)setCategoryConfidence:(double)a3
{
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  DUCategoryResult.copy(with:)(v6);

  sub_2367CBEE8(v6, (uint64_t)v6[3]);
  uint64_t v4 = (void *)sub_23697B94C();
  sub_2367CBF2C((uint64_t)v6);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  DUCategoryResult.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding16DUCategoryResult)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding16DUCategoryResult *)DUCategoryResult.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding16DUCategoryResult)init
{
  return (_TtC21DocumentUnderstanding16DUCategoryResult *)DUCategoryResult.init()();
}

- (void).cxx_destruct
{
}

@end