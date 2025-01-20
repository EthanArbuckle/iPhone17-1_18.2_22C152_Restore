@interface BlastDoorMetadata_StorageContext
- (BOOL)isFromStorage;
- (BOOL)isLastFromStorage;
- (BlastDoorMetadata_StorageContext)init;
- (NSString)description;
@end

@implementation BlastDoorMetadata_StorageContext

- (NSString)description
{
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)isFromStorage
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___BlastDoorMetadata_StorageContext_metadata_StorageContext);
}

- (BOOL)isLastFromStorage
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___BlastDoorMetadata_StorageContext_metadata_StorageContext + 1);
}

- (BlastDoorMetadata_StorageContext)init
{
  result = (BlastDoorMetadata_StorageContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end