@interface BlastDoorCrossServiceAssociationMessage
- (BlastDoorCrossServiceAssociationMessage)init;
- (BlastDoorMetadata)metadata;
- (NSString)description;
- (NSUUID)replacementGUID;
@end

@implementation BlastDoorCrossServiceAssociationMessage

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for CrossServiceAssociationMessage, &OBJC_IVAR___BlastDoorCrossServiceAssociationMessage_crossServiceAssociationMessage, (uint64_t (*)(void))type metadata accessor for CrossServiceAssociationMessage);
}

- (BlastDoorMetadata)metadata
{
  uint64_t v3 = type metadata accessor for Metadata();
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorCrossServiceAssociationMessage_crossServiceAssociationMessage, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Metadata);
  v6 = (objc_class *)type metadata accessor for _ObjCMetadataWrapper(0);
  id v7 = objc_allocWithZone(v6);
  sub_1B17B4094((uint64_t)v5, (uint64_t)v7 + OBJC_IVAR___BlastDoorMetadata_metadata, (uint64_t (*)(void))type metadata accessor for Metadata);
  v11.receiver = v7;
  v11.super_class = v6;
  v8 = self;
  v9 = [(BlastDoorCrossServiceAssociationMessage *)&v11 init];
  sub_1B17B42FC((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Metadata);

  return (BlastDoorMetadata *)v9;
}

- (NSUUID)replacementGUID
{
  uint64_t v3 = sub_1B1969EE0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = (char *)self + OBJC_IVAR___BlastDoorCrossServiceAssociationMessage_crossServiceAssociationMessage;
  uint64_t v8 = type metadata accessor for CrossServiceAssociationMessage();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, &v7[*(int *)(v8 + 20)], v3);
  v9 = (void *)sub_1B1969EB0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v9;
}

- (BlastDoorCrossServiceAssociationMessage)init
{
  result = (BlastDoorCrossServiceAssociationMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end