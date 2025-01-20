@interface BlastDoorDeliveredQuietlyReceipt
- (BlastDoorDeliveredQuietlyReceipt)init;
- (BlastDoorMetadata)metadata;
- (NSString)description;
@end

@implementation BlastDoorDeliveredQuietlyReceipt

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for DeliveredQuietlyReceipt, &OBJC_IVAR___BlastDoorDeliveredQuietlyReceipt_deliveredQuietlyReceipt, (uint64_t (*)(void))type metadata accessor for DeliveredQuietlyReceipt);
}

- (BlastDoorMetadata)metadata
{
  v2 = self;
  id v3 = sub_1B1781718();

  return (BlastDoorMetadata *)v3;
}

- (BlastDoorDeliveredQuietlyReceipt)init
{
  result = (BlastDoorDeliveredQuietlyReceipt *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end