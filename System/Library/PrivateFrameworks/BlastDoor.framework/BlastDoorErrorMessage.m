@interface BlastDoorErrorMessage
- (BlastDoorErrorMessage)init;
- (BlastDoorMetadata)metadata;
- (NSString)additionalInfo;
- (NSString)description;
- (unsigned)type;
@end

@implementation BlastDoorErrorMessage

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for ErrorMessage, &OBJC_IVAR___BlastDoorErrorMessage_errorMessage, (uint64_t (*)(void))type metadata accessor for ErrorMessage);
}

- (BlastDoorMetadata)metadata
{
  uint64_t v3 = type metadata accessor for Metadata();
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorErrorMessage_errorMessage, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Metadata);
  v6 = (objc_class *)type metadata accessor for _ObjCMetadataWrapper(0);
  id v7 = objc_allocWithZone(v6);
  sub_1B17B4094((uint64_t)v5, (uint64_t)v7 + OBJC_IVAR___BlastDoorMetadata_metadata, (uint64_t (*)(void))type metadata accessor for Metadata);
  v11.receiver = v7;
  v11.super_class = v6;
  v8 = self;
  v9 = [(BlastDoorErrorMessage *)&v11 init];
  sub_1B17B42FC((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Metadata);

  return (BlastDoorMetadata *)v9;
}

- (unsigned)type
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorErrorMessage_errorMessage;
  uint64_t v3 = type metadata accessor for ErrorMessage();
  uint64_t v4 = sub_1B17B2D7C(word_1B19BB6D8[v2[*(int *)(v3 + 20)]]);
  if ((v4 & 0x10000) != 0) {
    __break(1u);
  }
  return v4;
}

- (NSString)additionalInfo
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorErrorMessage_errorMessage;
  if (*(void *)&v2[*(int *)(type metadata accessor for ErrorMessage() + 24) + 8])
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSString *)v3;
}

- (BlastDoorErrorMessage)init
{
  result = (BlastDoorErrorMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end