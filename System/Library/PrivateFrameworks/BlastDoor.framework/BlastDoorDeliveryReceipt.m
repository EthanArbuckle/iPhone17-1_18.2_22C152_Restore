@interface BlastDoorDeliveryReceipt
- (BlastDoorDeliveryReceipt)init;
- (BlastDoorMetadata)metadata;
- (NSString)description;
@end

@implementation BlastDoorDeliveryReceipt

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for DeliveryReceipt, &OBJC_IVAR___BlastDoorDeliveryReceipt_deliveryReceipt, (uint64_t (*)(void))type metadata accessor for DeliveryReceipt);
}

- (BlastDoorMetadata)metadata
{
  v2 = self;
  id v3 = sub_1B1781A70();

  return (BlastDoorMetadata *)v3;
}

- (BlastDoorDeliveryReceipt)init
{
  result = (BlastDoorDeliveryReceipt *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end