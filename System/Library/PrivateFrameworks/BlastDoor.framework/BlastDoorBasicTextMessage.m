@interface BlastDoorBasicTextMessage
- (BOOL)has_groupParticipantVersion;
- (BOOL)has_groupProtocolVersion;
- (BOOL)has_replicationSourceID;
- (BlastDoorBasicTextMessage)init;
- (BlastDoorBasicTextMessageMessageTypeWrapper)messageSubType;
- (BlastDoorMetadata)metadata;
- (NSArray)replicatedFallbackGUIDs;
- (NSString)currentGroupName;
- (NSString)description;
- (NSString)groupID;
- (NSString)threadIdentifierGUID;
- (NSString)threadOriginatorFallbackHash;
- (int64_t)replicationSourceID;
- (unint64_t)groupParticipantVersion;
- (unint64_t)groupProtocolVersion;
@end

@implementation BlastDoorBasicTextMessage

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for BasicTextMessage, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage, (uint64_t (*)(void))type metadata accessor for BasicTextMessage);
}

- (BlastDoorMetadata)metadata
{
  uint64_t v3 = type metadata accessor for Metadata();
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Metadata);
  v6 = (objc_class *)type metadata accessor for _ObjCMetadataWrapper(0);
  id v7 = objc_allocWithZone(v6);
  sub_1B17B4094((uint64_t)v5, (uint64_t)v7 + OBJC_IVAR___BlastDoorMetadata_metadata, (uint64_t (*)(void))type metadata accessor for Metadata);
  v11.receiver = v7;
  v11.super_class = v6;
  v8 = self;
  v9 = [(BlastDoorBasicTextMessage *)&v11 init];
  sub_1B17B42FC((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Metadata);

  return (BlastDoorMetadata *)v9;
}

- (BlastDoorBasicTextMessageMessageTypeWrapper)messageSubType
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage;
  uint64_t v3 = type metadata accessor for BasicTextMessage();
  sub_1B136C230(&v2[*(int *)(v3 + 20)], v9);
  uint64_t v4 = (objc_class *)type metadata accessor for _ObjCEnumBasicTextMessageMessageTypeWrapper();
  v5 = (char *)objc_allocWithZone(v4);
  sub_1B136C230(v9, &v5[OBJC_IVAR___BlastDoorBasicTextMessageMessageTypeWrapper_basicTextMessage_MessageType]);
  sub_1B136C4E0((uint64_t)v9, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_1B136C268);
  v8.receiver = v5;
  v8.super_class = v4;
  v6 = [(BlastDoorBasicTextMessage *)&v8 init];
  return (BlastDoorBasicTextMessageMessageTypeWrapper *)v6;
}

- (NSString)threadIdentifierGUID
{
  return (NSString *)sub_1B17875EC((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for BasicTextMessage, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage, (uint64_t (*)(void))type metadata accessor for BasicTextMessage, (uint64_t (*)(void))type metadata accessor for BasicTextMessage);
}

- (NSString)threadOriginatorFallbackHash
{
  return (NSString *)sub_1B1790A68((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for BasicTextMessage, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage, (uint64_t (*)(void))type metadata accessor for BasicTextMessage, (uint64_t (*)(void))type metadata accessor for BasicTextMessage);
}

- (NSString)groupID
{
  return (NSString *)sub_1B17A2CB8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for BasicTextMessage, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage, (uint64_t (*)(void))type metadata accessor for BasicTextMessage, (uint64_t (*)(void))type metadata accessor for BasicTextMessage);
}

- (NSString)currentGroupName
{
  return (NSString *)sub_1B1795DA8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for BasicTextMessage, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage, (uint64_t (*)(void))type metadata accessor for BasicTextMessage, (uint64_t (*)(void))type metadata accessor for BasicTextMessage);
}

- (BOOL)has_groupParticipantVersion
{
  return sub_1B17887B0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage, (uint64_t (*)(void))type metadata accessor for BasicTextMessage);
}

- (unint64_t)groupParticipantVersion
{
  return sub_1B1788878((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage, (uint64_t (*)(void))type metadata accessor for BasicTextMessage);
}

- (BOOL)has_groupProtocolVersion
{
  return sub_1B179C2B0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage, (uint64_t (*)(void))type metadata accessor for BasicTextMessage);
}

- (unint64_t)groupProtocolVersion
{
  return sub_1B179C378((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage, (uint64_t (*)(void))type metadata accessor for BasicTextMessage);
}

- (BOOL)has_replicationSourceID
{
  return sub_1B17A3390((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage, (uint64_t (*)(void))type metadata accessor for BasicTextMessage);
}

- (int64_t)replicationSourceID
{
  return sub_1B17A3458((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage, (uint64_t (*)(void))type metadata accessor for BasicTextMessage);
}

- (NSArray)replicatedFallbackGUIDs
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorBasicTextMessage_basicTextMessage;
  if (*(void *)&v2[*(int *)(type metadata accessor for BasicTextMessage() + 52)])
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_1B196AAF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSArray *)v3;
}

- (BlastDoorBasicTextMessage)init
{
  result = (BlastDoorBasicTextMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end