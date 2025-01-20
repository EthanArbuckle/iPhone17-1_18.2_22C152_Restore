@interface AMLFeaturesSpecification
+ (BOOL)supportsSecureCoding;
- (AMLFeaturesSpecification)init;
- (AMLFeaturesSpecification)initWithCoder:(id)a3;
- (AMLFeaturesSpecification)initWithFeatureDictionary:(id)a3;
- (AMLFeaturesSpecification)initWithFeaturesDescription:(id)a3;
- (NSArray)featuresDescription;
- (NSString)description;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setFeaturesDescription:(id)a3;
@end

@implementation AMLFeaturesSpecification

- (NSArray)featuresDescription
{
  sub_2477A8464();
  sub_247771180(0, &qword_26B130990);
  v2 = (void *)sub_2477BD738();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (void)setFeaturesDescription:(id)a3
{
  sub_247771180(0, &qword_26B130990);
  uint64_t v4 = sub_2477BD748();
  v5 = self;
  sub_2477A84F0(v4);
}

- (AMLFeaturesSpecification)initWithFeaturesDescription:(id)a3
{
  sub_247771180(0, &qword_26B130990);
  uint64_t v3 = sub_2477BD748();
  return (AMLFeaturesSpecification *)AMLFeaturesSpecification.init(featuresDescription:)(v3);
}

- (AMLFeaturesSpecification)initWithFeatureDictionary:(id)a3
{
  uint64_t v3 = sub_2477BD698();
  return (AMLFeaturesSpecification *)AMLFeaturesSpecification.init(featureDictionary:)(v3);
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_2477A9218(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))sub_2477A896C);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2477A8AA0(v4);
}

- (AMLFeaturesSpecification)initWithCoder:(id)a3
{
  return (AMLFeaturesSpecification *)AMLFeaturesSpecification.init(coder:)(a3);
}

- (AMLFeaturesSpecification)init
{
}

- (void).cxx_destruct
{
}

- (NSString)description
{
  return (NSString *)sub_2477A99B8(self, (uint64_t)a2, (void (*)(void))AMLFeaturesSpecification.description.getter);
}

@end