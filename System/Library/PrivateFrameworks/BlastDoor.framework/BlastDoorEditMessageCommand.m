@interface BlastDoorEditMessageCommand
- (BOOL)has_editedMessagePartIndex;
- (BOOL)has_shouldRetractSubject;
- (BOOL)shouldRetractSubject;
- (BlastDoorEditMessageCommand)init;
- (BlastDoorMessageContent)editedMessagePartBody;
- (BlastDoorMessageContent)messageContent;
- (BlastDoorMetadata)metadata;
- (NSString)description;
- (NSString)editedMessageGUID;
- (int64_t)editType;
- (int64_t)editedMessagePartIndex;
@end

@implementation BlastDoorEditMessageCommand

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for EditMessageCommand, &OBJC_IVAR___BlastDoorEditMessageCommand_editMessageCommand, (uint64_t (*)(void))type metadata accessor for EditMessageCommand);
}

- (BlastDoorMetadata)metadata
{
  uint64_t v3 = type metadata accessor for Metadata();
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorEditMessageCommand_editMessageCommand, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Metadata);
  v6 = (objc_class *)type metadata accessor for _ObjCMetadataWrapper(0);
  id v7 = objc_allocWithZone(v6);
  sub_1B17B4094((uint64_t)v5, (uint64_t)v7 + OBJC_IVAR___BlastDoorMetadata_metadata, (uint64_t (*)(void))type metadata accessor for Metadata);
  v11.receiver = v7;
  v11.super_class = v6;
  v8 = self;
  v9 = [(BlastDoorEditMessageCommand *)&v11 init];
  sub_1B17B42FC((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Metadata);

  return (BlastDoorMetadata *)v9;
}

- (NSString)editedMessageGUID
{
  return (NSString *)sub_1B17A6550((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___BlastDoorEditMessageCommand_editMessageCommand, (void (*)(void))type metadata accessor for EditMessageCommand);
}

- (int64_t)editType
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorEditMessageCommand_editMessageCommand;
  int64_t result = v2[*(int *)(type metadata accessor for EditMessageCommand() + 24)];
  if ((unint64_t)result > 2) {
    __break(1u);
  }
  return result;
}

- (BOOL)has_editedMessagePartIndex
{
  return sub_1B1788420((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorEditMessageCommand_editMessageCommand, (uint64_t (*)(void))type metadata accessor for EditMessageCommand);
}

- (int64_t)editedMessagePartIndex
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorEditMessageCommand_editMessageCommand;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for EditMessageCommand() + 28)];
  if (v3[8]) {
    return 0;
  }
  else {
    return *(void *)v3;
  }
}

- (BlastDoorMessageContent)editedMessagePartBody
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorEditMessageCommand_editMessageCommand;
  uint64_t v3 = type metadata accessor for EditMessageCommand();
  uint64_t v4 = 0;
  v5 = &v2[*(int *)(v3 + 32)];
  uint64_t v6 = *((void *)v5 + 1);
  if (v6 != 1)
  {
    uint64_t v8 = *((void *)v5 + 5);
    uint64_t v7 = *((void *)v5 + 6);
    uint64_t v10 = *((void *)v5 + 3);
    uint64_t v9 = *((void *)v5 + 4);
    uint64_t v11 = *((void *)v5 + 2);
    uint64_t v12 = *(void *)v5;
    v13 = (objc_class *)type metadata accessor for _ObjCMessageContentWrapper();
    v14 = (char *)objc_allocWithZone(v13);
    v15 = &v14[OBJC_IVAR___BlastDoorMessageContent_messageContent];
    *(void *)v15 = v12;
    *((void *)v15 + 1) = v6;
    *((void *)v15 + 2) = v11;
    *((void *)v15 + 3) = v10;
    *((void *)v15 + 4) = v9;
    *((void *)v15 + 5) = v8;
    *((void *)v15 + 6) = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B11F10B4(v9);
    v17.receiver = v14;
    v17.super_class = v13;
    uint64_t v4 = [(BlastDoorEditMessageCommand *)&v17 init];
  }
  return (BlastDoorMessageContent *)v4;
}

- (BOOL)has_shouldRetractSubject
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorEditMessageCommand_editMessageCommand;
  return v2[*(int *)(type metadata accessor for EditMessageCommand() + 36)] != 2;
}

- (BOOL)shouldRetractSubject
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorEditMessageCommand_editMessageCommand;
  return v2[*(int *)(type metadata accessor for EditMessageCommand() + 36)] & 1;
}

- (BlastDoorMessageContent)messageContent
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorEditMessageCommand_editMessageCommand;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for EditMessageCommand() + 40)];
  uint64_t v5 = *(void *)v3;
  uint64_t v4 = *((void *)v3 + 1);
  uint64_t v7 = *((void *)v3 + 2);
  uint64_t v6 = *((void *)v3 + 3);
  uint64_t v8 = *((void *)v3 + 4);
  uint64_t v9 = *((void *)v3 + 5);
  uint64_t v10 = *((void *)v3 + 6);
  uint64_t v11 = (objc_class *)type metadata accessor for _ObjCMessageContentWrapper();
  uint64_t v12 = (char *)objc_allocWithZone(v11);
  v13 = &v12[OBJC_IVAR___BlastDoorMessageContent_messageContent];
  *(void *)v13 = v5;
  *((void *)v13 + 1) = v4;
  *((void *)v13 + 2) = v7;
  *((void *)v13 + 3) = v6;
  *((void *)v13 + 4) = v8;
  *((void *)v13 + 5) = v9;
  *((void *)v13 + 6) = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B11F10B4(v8);
  v16.receiver = v12;
  v16.super_class = v11;
  v14 = [(BlastDoorEditMessageCommand *)&v16 init];
  return (BlastDoorMessageContent *)v14;
}

- (BlastDoorEditMessageCommand)init
{
  int64_t result = (BlastDoorEditMessageCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end