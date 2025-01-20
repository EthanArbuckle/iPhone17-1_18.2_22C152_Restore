@interface BlastDoorChatSessionClose
- (BOOL)deleteConversation;
- (BOOL)isEmergencySOS;
- (BlastDoorChatSessionClose)init;
- (BlastDoorMetadata)metadata;
- (NSString)conversationID;
- (NSString)description;
- (NSString)handle;
- (NSString)name;
- (int64_t)version;
@end

@implementation BlastDoorChatSessionClose

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for ChatSessionClose, &OBJC_IVAR___BlastDoorChatSessionClose_chatSessionClose, (uint64_t (*)(void))type metadata accessor for ChatSessionClose);
}

- (BlastDoorMetadata)metadata
{
  uint64_t v3 = type metadata accessor for Metadata();
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorChatSessionClose_chatSessionClose, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Metadata);
  v6 = (objc_class *)type metadata accessor for _ObjCMetadataWrapper(0);
  id v7 = objc_allocWithZone(v6);
  sub_1B17B4094((uint64_t)v5, (uint64_t)v7 + OBJC_IVAR___BlastDoorMetadata_metadata, (uint64_t (*)(void))type metadata accessor for Metadata);
  v11.receiver = v7;
  v11.super_class = v6;
  v8 = self;
  v9 = [(BlastDoorChatSessionClose *)&v11 init];
  sub_1B17B42FC((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Metadata);

  return (BlastDoorMetadata *)v9;
}

- (BOOL)isEmergencySOS
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorChatSessionClose_chatSessionClose;
  return v2[*(int *)(type metadata accessor for ChatSessionClose() + 20)];
}

- (int64_t)version
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorChatSessionClose_chatSessionClose;
  return *(void *)&v2[*(int *)(type metadata accessor for ChatSessionClose() + 24)];
}

- (NSString)handle
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorChatSessionClose_chatSessionClose;
  if (*(void *)&v2[*(int *)(type metadata accessor for ChatSessionClose() + 28) + 8])
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

- (NSString)name
{
  return (NSString *)sub_1B1797A14((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorChatSessionClose_chatSessionClose, (uint64_t (*)(void))type metadata accessor for ChatSessionClose);
}

- (NSString)conversationID
{
  type metadata accessor for ChatSessionClose();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)deleteConversation
{
  return sub_1B1797BEC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorChatSessionClose_chatSessionClose, (uint64_t (*)(void))type metadata accessor for ChatSessionClose);
}

- (BlastDoorChatSessionClose)init
{
  result = (BlastDoorChatSessionClose *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end