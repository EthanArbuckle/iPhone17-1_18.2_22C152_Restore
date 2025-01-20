@interface AMLRawSignalsConfiguration
+ (BOOL)supportsSecureCoding;
- (AMLFeaturesSpecification)rawSignalsDescription;
- (AMLRawSignalsConfiguration)init;
- (AMLRawSignalsConfiguration)initWithBundleIdentifier:(id)a3 modelName:(id)a4 versionId:(id)a5 expirationPolicy:(int)a6 rawSignalsDescription:(id)a7;
- (AMLRawSignalsConfiguration)initWithCoder:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)configurationId;
- (NSString)description;
- (NSString)modelName;
- (NSString)versionId;
- (id)copyWithZone:(void *)a3;
- (int)expirationPolicy;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setExpirationPolicy:(int)a3;
- (void)setModelName:(id)a3;
- (void)setRawSignalsDescription:(id)a3;
- (void)setVersionId:(id)a3;
@end

@implementation AMLRawSignalsConfiguration

- (NSString)bundleIdentifier
{
  return (NSString *)sub_2477B82A4((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_2477B7FD8);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)modelName
{
  sub_2477B8068();
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

- (void)setModelName:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_2477BD6D8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  sub_2477B8114(v4, v6);
}

- (NSString)versionId
{
  return (NSString *)sub_2477B82A4((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_2477B8138);
}

- (void)setVersionId:(id)a3
{
}

- (int)expirationPolicy
{
  return sub_2477B819C();
}

- (void)setExpirationPolicy:(int)a3
{
}

- (AMLFeaturesSpecification)rawSignalsDescription
{
  id v2 = sub_2477B8218();

  return (AMLFeaturesSpecification *)v2;
}

- (void)setRawSignalsDescription:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_2477B8280((uint64_t)v4);
}

- (NSString)configurationId
{
  return (NSString *)sub_2477B82A4((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_2477B82F4);
}

- (AMLRawSignalsConfiguration)initWithBundleIdentifier:(id)a3 modelName:(id)a4 versionId:(id)a5 expirationPolicy:(int)a6 rawSignalsDescription:(id)a7
{
  sub_2477BD6D8();
  if (a4) {
    sub_2477BD6D8();
  }
  sub_2477BD6D8();
  id v9 = a7;
  AMLRawSignalsConfiguration.init(bundleIdentifier:modelName:versionId:expirationPolicy:rawSignalsDescription:)();
  return result;
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_2477B9180(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))AMLRawSignalsConfiguration.copy(with:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  AMLRawSignalsConfiguration.encode(with:)((NSCoder)v4);
}

- (AMLRawSignalsConfiguration)initWithCoder:(id)a3
{
  return (AMLRawSignalsConfiguration *)AMLRawSignalsConfiguration.init(coder:)(a3);
}

- (AMLRawSignalsConfiguration)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_59_2();
  OUTLINED_FUNCTION_59_2();

  swift_bridgeObjectRelease();
}

- (NSString)description
{
  return (NSString *)sub_2477BB9E8(self, (uint64_t)a2, (void (*)(void))AMLRawSignalsConfiguration.description.getter);
}

@end