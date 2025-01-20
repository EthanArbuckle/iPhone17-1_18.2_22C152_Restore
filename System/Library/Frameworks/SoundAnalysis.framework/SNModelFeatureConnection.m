@interface SNModelFeatureConnection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)destinationFeatureName;
- (NSString)sourceFeatureName;
- (SNModelFeatureConnection)init;
- (SNModelFeatureConnection)initWithCoder:(id)a3;
- (SNModelFeatureConnection)initWithSourceFeatureName:(id)a3 destinationFeatureName:(id)a4;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDestinationFeatureName:(id)a3;
- (void)setSourceFeatureName:(id)a3;
@end

@implementation SNModelFeatureConnection

- (NSString)sourceFeatureName
{
  return (NSString *)sub_1DCB32250((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1DCB30DD4);
}

- (void)setSourceFeatureName:(id)a3
{
}

- (NSString)destinationFeatureName
{
  return (NSString *)sub_1DCB32250((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1DCB30D98);
}

- (void)setDestinationFeatureName:(id)a3
{
}

- (SNModelFeatureConnection)initWithSourceFeatureName:(id)a3 destinationFeatureName:(id)a4
{
  uint64_t v4 = sub_1DCB87938();
  uint64_t v6 = v5;
  uint64_t v7 = sub_1DCB87938();
  return (SNModelFeatureConnection *)sub_1DCB32348(v4, v6, v7, v8);
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_1DCB32414(v6);

  sub_1DC881A8C(v6, v6[3]);
  uint64_t v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_1DCB3254C();

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
  char v6 = sub_1DCB325B4((uint64_t)v8);

  sub_1DC881978((uint64_t)v8);
  return v6 & 1;
}

- (SNModelFeatureConnection)initWithCoder:(id)a3
{
  return (SNModelFeatureConnection *)sub_1DCB32748(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1DCB32864((uint64_t)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SNModelFeatureConnection)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end