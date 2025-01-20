@interface BlastDoorRepositionStickerCommand
- (BlastDoorMetadata)metadata;
- (BlastDoorRepositionStickerCommand)init;
- (BlastDoorStickerAttachmentInfo)stickerMetadata;
- (NSString)description;
- (NSString)stickerEditedMessageGUID;
@end

@implementation BlastDoorRepositionStickerCommand

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for RepositionStickerCommand, &OBJC_IVAR___BlastDoorRepositionStickerCommand_repositionStickerCommand, (uint64_t (*)(void))type metadata accessor for RepositionStickerCommand);
}

- (BlastDoorMetadata)metadata
{
  uint64_t v3 = type metadata accessor for Metadata();
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorRepositionStickerCommand_repositionStickerCommand, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Metadata);
  v6 = (objc_class *)type metadata accessor for _ObjCMetadataWrapper(0);
  id v7 = objc_allocWithZone(v6);
  sub_1B17B4094((uint64_t)v5, (uint64_t)v7 + OBJC_IVAR___BlastDoorMetadata_metadata, (uint64_t (*)(void))type metadata accessor for Metadata);
  v11.receiver = v7;
  v11.super_class = v6;
  v8 = self;
  v9 = [(BlastDoorRepositionStickerCommand *)&v11 init];
  sub_1B17B42FC((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Metadata);

  return (BlastDoorMetadata *)v9;
}

- (BlastDoorStickerAttachmentInfo)stickerMetadata
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorRepositionStickerCommand_repositionStickerCommand;
  uint64_t v3 = type metadata accessor for RepositionStickerCommand();
  memcpy(__dst, &v2[*(int *)(v3 + 20)], 0x111uLL);
  uint64_t v4 = (objc_class *)type metadata accessor for _ObjCStickerAttachmentInfoWrapper();
  v5 = (char *)objc_allocWithZone(v4);
  memcpy(&v5[OBJC_IVAR___BlastDoorStickerAttachmentInfo_stickerAttachmentInfo], __dst, 0x111uLL);
  sub_1B14DCFF8(__dst);
  v8.receiver = v5;
  v8.super_class = v4;
  v6 = [(BlastDoorRepositionStickerCommand *)&v8 init];
  return (BlastDoorStickerAttachmentInfo *)v6;
}

- (NSString)stickerEditedMessageGUID
{
  return (NSString *)sub_1B17A664C((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___BlastDoorRepositionStickerCommand_repositionStickerCommand, (void (*)(void))type metadata accessor for RepositionStickerCommand);
}

- (BlastDoorRepositionStickerCommand)init
{
  result = (BlastDoorRepositionStickerCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end