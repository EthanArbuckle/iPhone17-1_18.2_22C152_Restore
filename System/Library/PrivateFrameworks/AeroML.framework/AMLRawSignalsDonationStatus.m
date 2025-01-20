@interface AMLRawSignalsDonationStatus
- (AMLRawSignalsDonationStatus)init;
- (AMLRawSignalsDonationStatus)initWithMetadataDonationId:(id)a3 rawSignalsDonationId:(id)a4 configurationDonationId:(id)a5 group:(id)a6;
- (NSString)configurationDonationId;
- (NSString)metadataDonationId;
- (NSString)rawSignalsDonationId;
- (OS_dispatch_group)group;
- (id)copyWithZone:(void *)a3;
- (void)setConfigurationDonationId:(id)a3;
- (void)setGroup:(id)a3;
- (void)setMetadataDonationId:(id)a3;
- (void)setRawSignalsDonationId:(id)a3;
@end

@implementation AMLRawSignalsDonationStatus

- (NSString)metadataDonationId
{
  return (NSString *)sub_2477B82A4((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_2477B7A00);
}

- (void)setMetadataDonationId:(id)a3
{
}

- (NSString)rawSignalsDonationId
{
  return (NSString *)sub_2477B82A4((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_2477B7A50);
}

- (void)setRawSignalsDonationId:(id)a3
{
}

- (NSString)configurationDonationId
{
  return (NSString *)sub_2477B82A4((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_2477B7B18);
}

- (void)setConfigurationDonationId:(id)a3
{
}

- (OS_dispatch_group)group
{
  id v2 = sub_2477B7B84();

  return (OS_dispatch_group *)v2;
}

- (void)setGroup:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2477B7BEC((uint64_t)v4);
}

- (AMLRawSignalsDonationStatus)initWithMetadataDonationId:(id)a3 rawSignalsDonationId:(id)a4 configurationDonationId:(id)a5 group:(id)a6
{
  uint64_t v7 = sub_2477BD6D8();
  uint64_t v9 = v8;
  uint64_t v10 = sub_2477BD6D8();
  uint64_t v12 = v11;
  uint64_t v13 = sub_2477BD6D8();
  return (AMLRawSignalsDonationStatus *)AMLRawSignalsDonationStatus.init(metadataDonationId:rawSignalsDonationId:configurationDonationId:group:)(v7, v9, v10, v12, v13, v14, (uint64_t)a6);
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_2477B9180(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))AMLRawSignalsDonationStatus.copy(with:));
}

- (AMLRawSignalsDonationStatus)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_59_2();
  OUTLINED_FUNCTION_59_2();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMLRawSignalsDonationStatus_group);
}

@end