@interface AMLClientDonations
+ (BOOL)supportsSecureCoding;
- (AMLClientDonations)init;
- (AMLClientDonations)initWithCoder:(id)a3;
- (AMLClientDonations)initWithFeaturesConfiguration:(id)a3 featureProvider:(id)a4 batchProvider:(id)a5 arrayProvider:(id)a6 metadata:(id)a7 donationTime:(id)a8;
- (AMLFeaturesConfiguration)featuresConfiguration;
- (AMLFeaturesDonationMetadata)metadata;
- (MLArrayBatchProvider)arrayProvider;
- (MLBatchProvider)batchProvider;
- (MLFeatureProvider)featureProvider;
- (NSString)donationTime;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMLClientDonations

- (MLFeatureProvider)featureProvider
{
  v2 = (void *)sub_24779DDA4();

  return (MLFeatureProvider *)v2;
}

- (MLBatchProvider)batchProvider
{
  v2 = (void *)sub_24779DDE4();

  return (MLBatchProvider *)v2;
}

- (MLArrayBatchProvider)arrayProvider
{
  v2 = sub_24779DE24();

  return (MLArrayBatchProvider *)v2;
}

- (AMLFeaturesConfiguration)featuresConfiguration
{
  v2 = sub_24779DE88();

  return (AMLFeaturesConfiguration *)v2;
}

- (AMLFeaturesDonationMetadata)metadata
{
  v2 = sub_24779DEEC();

  return (AMLFeaturesDonationMetadata *)v2;
}

- (NSString)donationTime
{
  sub_24779DF74();
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

- (AMLClientDonations)initWithFeaturesConfiguration:(id)a3 featureProvider:(id)a4 batchProvider:(id)a5 arrayProvider:(id)a6 metadata:(id)a7 donationTime:(id)a8
{
  if (a8)
  {
    uint64_t v13 = sub_2477BD6D8();
    uint64_t v15 = v14;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v15 = 0;
  }
  id v16 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v17 = a6;
  id v18 = a7;
  return (AMLClientDonations *)AMLClientDonations.init(featuresConfiguration:featureProvider:batchProvider:arrayProvider:metadata:donationTime:)((uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, v13, v15);
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  AMLClientDonations.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_2477BDA88();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  AMLClientDonations.encode(with:)((NSCoder)v4);
}

- (AMLClientDonations)initWithCoder:(id)a3
{
  return (AMLClientDonations *)AMLClientDonations.init(coder:)(a3);
}

- (AMLClientDonations)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end