@interface AMLStorageMetadata
- (AMLFeaturesDonationMetadata)donationMetadata;
- (AMLStorageMetadata)init;
- (AMLStorageMetadata)initWithDonationMetadata:(id)a3 donationTime:(id)a4;
- (NSString)donationTime;
@end

@implementation AMLStorageMetadata

- (AMLFeaturesDonationMetadata)donationMetadata
{
  id v2 = sub_24776B280();

  return (AMLFeaturesDonationMetadata *)v2;
}

- (NSString)donationTime
{
  sub_24776B2DC();
  id v2 = (void *)sub_2477BD6C8();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (AMLStorageMetadata)initWithDonationMetadata:(id)a3 donationTime:(id)a4
{
  uint64_t v5 = sub_2477BD6D8();
  return (AMLStorageMetadata *)AMLStorageMetadata.init(donationMetadata:donationTime:)((uint64_t)a3, v5, v6);
}

- (AMLStorageMetadata)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end