@interface BlastDoorRecoverJunkCommand
- (BlastDoorMetadata)metadata;
- (BlastDoorRecoverJunkCommand)init;
- (NSString)description;
@end

@implementation BlastDoorRecoverJunkCommand

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for RecoverJunkCommand, &OBJC_IVAR___BlastDoorRecoverJunkCommand_recoverJunkCommand, (uint64_t (*)(void))type metadata accessor for RecoverJunkCommand);
}

- (BlastDoorMetadata)metadata
{
  v2 = self;
  id v3 = sub_1B17955B0();

  return (BlastDoorMetadata *)v3;
}

- (BlastDoorRecoverJunkCommand)init
{
  result = (BlastDoorRecoverJunkCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end