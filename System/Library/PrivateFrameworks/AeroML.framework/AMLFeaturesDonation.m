@interface AMLFeaturesDonation
+ (BOOL)supportsSecureCoding;
- (AMLFeaturesConfiguration)featuresConfiguration;
- (AMLFeaturesDonation)init;
- (AMLFeaturesDonation)initWithCoder:(id)a3;
- (AMLFeaturesDonation)initWithFeaturesConfiguration:(id)a3;
- (NSString)description;
- (id)copyWithZone:(void *)a3;
- (id)donateFeature:(id)a3 metadata:(id)a4 completionBlock:(id)a5;
- (id)donateFeatureDictionaries:(id)a3 metadata:(id)a4 completionBlock:(id)a5;
- (id)donateFeaturesBatch:(id)a3 metadata:(id)a4 completionBlock:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setFeaturesConfiguration:(id)a3;
@end

@implementation AMLFeaturesDonation

- (AMLFeaturesConfiguration)featuresConfiguration
{
  id v2 = sub_2477786F8();

  return (AMLFeaturesConfiguration *)v2;
}

- (void)setFeaturesConfiguration:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_247778760((uint64_t)v4);
}

- (AMLFeaturesDonation)initWithFeaturesConfiguration:(id)a3
{
  return (AMLFeaturesDonation *)AMLFeaturesDonation.init(featuresConfiguration:)((uint64_t)a3);
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_2477788C0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))AMLFeaturesDonation.copy(with:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  AMLFeaturesDonation.encode(with:)((NSCoder)v4);
}

- (AMLFeaturesDonation)initWithCoder:(id)a3
{
  return (AMLFeaturesDonation *)AMLFeaturesDonation.init(coder:)(a3);
}

- (id)donateFeature:(id)a3 metadata:(id)a4 completionBlock:(id)a5
{
  v8 = (uint64_t (*)())_Block_copy(a5);
  if (v8)
  {
    *(void *)(swift_allocObject() + 16) = v8;
    v8 = sub_24777C1A8;
  }
  swift_unknownObjectRetain();
  id v9 = a4;
  v10 = self;
  v11 = sub_247779244((uint64_t)a3);
  sub_24777C034((uint64_t)v8);
  swift_unknownObjectRelease();

  return v11;
}

- (id)donateFeatureDictionaries:(id)a3 metadata:(id)a4 completionBlock:(id)a5
{
  v7 = (uint64_t (*)())_Block_copy(a5);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B130940);
  uint64_t v8 = sub_2477BD748();
  if (v7)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    v7 = sub_24777C1A8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a4;
  v11 = self;
  v12 = (void *)sub_24777A81C(v8, v10, (uint64_t)v7, v9);
  sub_24777C034((uint64_t)v7);

  swift_bridgeObjectRelease();

  return v12;
}

- (id)donateFeaturesBatch:(id)a3 metadata:(id)a4 completionBlock:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  if (v8)
  {
    *(void *)(swift_allocObject() + 16) = v8;
    uint64_t v8 = sub_24777C07C;
  }
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  v12 = sub_24777B678((uint64_t)v9);
  sub_24777C034((uint64_t)v8);

  return v12;
}

- (AMLFeaturesDonation)init
{
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR___AMLFeaturesDonation____lazy_storage___indexFeaturesConfiguration);
  uint64_t v4 = *(void *)&self->featuresConfiguration[OBJC_IVAR___AMLFeaturesDonation____lazy_storage___indexFeaturesConfiguration];
  v5 = *(void **)&self->$__lazy_storage_$_indexFeaturesConfiguration[OBJC_IVAR___AMLFeaturesDonation____lazy_storage___indexFeaturesConfiguration];

  sub_24777BF3C(v3, v4, v5);
}

- (NSString)description
{
  return (NSString *)sub_24777BBDC(self, (uint64_t)a2, (void (*)(void))AMLFeaturesDonation.description.getter);
}

@end