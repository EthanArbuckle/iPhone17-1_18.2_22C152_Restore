@interface AutonamingModelFeatures
- (_TtC21DocumentUnderstanding23AutonamingModelFeatures)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AutonamingModelFeatures

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  AutonamingModelFeatures.copy(with:)(v6);

  sub_2367CBEE8(v6, v6[3]);
  v4 = (void *)sub_23697B94C();
  sub_2367CBF2C((uint64_t)v6);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  AutonamingModelFeatures.encode(with:)((NSCoder)v4);
}

- (_TtC21DocumentUnderstanding23AutonamingModelFeatures)initWithCoder:(id)a3
{
  id v3 = a3;
  AutonamingModelFeatures.init(coder:)();
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end