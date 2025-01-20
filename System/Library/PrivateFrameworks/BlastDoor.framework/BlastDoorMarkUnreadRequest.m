@interface BlastDoorMarkUnreadRequest
- (BlastDoorMarkUnreadRequest)init;
- (BlastDoorMetadata)metadata;
- (NSString)description;
@end

@implementation BlastDoorMarkUnreadRequest

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for MarkUnreadRequest, &OBJC_IVAR___BlastDoorMarkUnreadRequest_markUnreadRequest, (uint64_t (*)(void))type metadata accessor for MarkUnreadRequest);
}

- (BlastDoorMetadata)metadata
{
  v2 = self;
  id v3 = sub_1B1787D60();

  return (BlastDoorMetadata *)v3;
}

- (BlastDoorMarkUnreadRequest)init
{
  result = (BlastDoorMarkUnreadRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end