@interface BlastDoorPlayedReceipt
- (BlastDoorMetadata)metadata;
- (BlastDoorPlayedReceipt)init;
- (NSString)description;
@end

@implementation BlastDoorPlayedReceipt

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for PlayedReceipt, &OBJC_IVAR___BlastDoorPlayedReceipt_playedReceipt, (uint64_t (*)(void))type metadata accessor for PlayedReceipt);
}

- (BlastDoorMetadata)metadata
{
  v2 = self;
  id v3 = sub_1B179438C();

  return (BlastDoorMetadata *)v3;
}

- (BlastDoorPlayedReceipt)init
{
  result = (BlastDoorPlayedReceipt *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end