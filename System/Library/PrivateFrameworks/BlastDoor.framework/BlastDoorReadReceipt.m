@interface BlastDoorReadReceipt
- (BlastDoorMetadata)metadata;
- (BlastDoorReadReceipt)init;
- (NSString)description;
@end

@implementation BlastDoorReadReceipt

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for ReadReceipt, &OBJC_IVAR___BlastDoorReadReceipt_readReceipt, (uint64_t (*)(void))type metadata accessor for ReadReceipt);
}

- (BlastDoorMetadata)metadata
{
  v2 = self;
  id v3 = sub_1B1795258();

  return (BlastDoorMetadata *)v3;
}

- (BlastDoorReadReceipt)init
{
  result = (BlastDoorReadReceipt *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end