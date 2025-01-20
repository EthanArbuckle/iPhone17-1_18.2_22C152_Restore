@interface AMLFeaturesDonationStatus
- (AMLFeaturesDonationStatus)init;
- (AMLFeaturesDonationStatus)initWithMetadataDonationId:(id)a3 featuresDonationId:(id)a4 configurationDonationId:(id)a5 group:(id)a6;
- (NSString)configurationDonationId;
- (NSString)featuresDonationId;
- (NSString)metadataDonationId;
- (OS_dispatch_group)group;
- (id)copyWithZone:(void *)a3;
- (void)setConfigurationDonationId:(id)a3;
- (void)setFeaturesDonationId:(id)a3;
- (void)setGroup:(id)a3;
- (void)setMetadataDonationId:(id)a3;
@end

@implementation AMLFeaturesDonationStatus

- (NSString)metadataDonationId
{
  return (NSString *)sub_247778194((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_24777807C);
}

- (void)setMetadataDonationId:(id)a3
{
}

- (NSString)featuresDonationId
{
  return (NSString *)sub_247778194((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_2477780CC);
}

- (void)setFeaturesDonationId:(id)a3
{
}

- (NSString)configurationDonationId
{
  return (NSString *)sub_247778194((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_2477781E4);
}

- (void)setConfigurationDonationId:(id)a3
{
}

- (OS_dispatch_group)group
{
  id v2 = sub_247778268();

  return (OS_dispatch_group *)v2;
}

- (void)setGroup:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2477782D0((uint64_t)v4);
}

- (AMLFeaturesDonationStatus)initWithMetadataDonationId:(id)a3 featuresDonationId:(id)a4 configurationDonationId:(id)a5 group:(id)a6
{
  uint64_t v7 = sub_2477BD6D8();
  uint64_t v9 = v8;
  uint64_t v10 = sub_2477BD6D8();
  uint64_t v12 = v11;
  uint64_t v13 = sub_2477BD6D8();
  return (AMLFeaturesDonationStatus *)AMLFeaturesDonationStatus.init(metadataDonationId:featuresDonationId:configurationDonationId:group:)(v7, v9, v10, v12, v13, v14, (uint64_t)a6);
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_2477788C0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))AMLFeaturesDonationStatus.copy(with:));
}

- (AMLFeaturesDonationStatus)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMLFeaturesDonationStatus_group);
}

@end