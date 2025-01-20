@interface AMLFeaturesConfiguration
+ (BOOL)supportsSecureCoding;
- (AMLFeaturesConfiguration)init;
- (AMLFeaturesConfiguration)initWithBundleIdentifier:(id)a3 modelName:(id)a4 versionId:(id)a5 expirationPolicy:(int)a6 featuresDescription:(id)a7;
- (AMLFeaturesConfiguration)initWithCoder:(id)a3;
- (AMLFeaturesSpecification)featuresDescription;
- (NSString)bundleIdentifier;
- (NSString)configurationId;
- (NSString)description;
- (NSString)modelName;
- (NSString)versionId;
- (id)copyWithZone:(void *)a3;
- (int)expirationPolicy;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMLFeaturesConfiguration

- (NSString)bundleIdentifier
{
  return (NSString *)sub_2477A8DC8((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_2477A75D8);
}

- (NSString)modelName
{
  sub_2477A765C();
  if (v2)
  {
    v3 = (void *)sub_2477BD6C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)versionId
{
  return (NSString *)sub_2477A8DC8((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_2477A76A0);
}

- (int)expirationPolicy
{
  return sub_2477A76F0();
}

- (AMLFeaturesSpecification)featuresDescription
{
  id v2 = sub_2477A7734();

  return (AMLFeaturesSpecification *)v2;
}

- (NSString)configurationId
{
  return (NSString *)sub_2477A8DC8((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_2477A775C);
}

- (AMLFeaturesConfiguration)initWithBundleIdentifier:(id)a3 modelName:(id)a4 versionId:(id)a5 expirationPolicy:(int)a6 featuresDescription:(id)a7
{
  uint64_t v10 = sub_2477BD6D8();
  uint64_t v12 = v11;
  if (a4)
  {
    a4 = (id)sub_2477BD6D8();
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v14 = 0;
  }
  uint64_t v15 = sub_2477BD6D8();
  return (AMLFeaturesConfiguration *)AMLFeaturesConfiguration.init(bundleIdentifier:modelName:versionId:expirationPolicy:featuresDescription:)(v10, v12, (uint64_t)a4, v14, v15, v16, a6, (uint64_t)a7);
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_2477A9218(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))AMLFeaturesConfiguration.copy(with:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  AMLFeaturesConfiguration.encode(with:)((NSCoder)v4);
}

- (AMLFeaturesConfiguration)initWithCoder:(id)a3
{
  return (AMLFeaturesConfiguration *)AMLFeaturesConfiguration.init(coder:)(a3);
}

- (AMLFeaturesConfiguration)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (NSString)description
{
  return (NSString *)sub_2477A99B8(self, (uint64_t)a2, (void (*)(void))AMLFeaturesConfiguration.description.getter);
}

@end