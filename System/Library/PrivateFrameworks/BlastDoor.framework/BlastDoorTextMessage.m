@interface BlastDoorTextMessage
- (BOOL)has_groupParticipantVersion;
- (BOOL)has_groupPhotoCreationTime;
- (BOOL)has_groupProtocolVersion;
- (BOOL)has_replicationSourceID;
- (BOOL)has_seenAsOffGrid;
- (BOOL)isAutoReply;
- (BOOL)isCritical;
- (BOOL)isExpirable;
- (BOOL)isSOS;
- (BOOL)seenAsOffGrid;
- (BlastDoorMetadata)metadata;
- (BlastDoorNicknameInformation)nicknameInformation;
- (BlastDoorTextMessage)init;
- (BlastDoorTextMessageMessageTypeWrapper)messageSubType;
- (BlastDoorTextMessage_MessageSummaryInfo)messageSummaryInfo;
- (NSArray)replicatedFallbackGUIDs;
- (NSDate)scheduledDate;
- (NSString)availabilityOffGridRecipientEncryptionValidationToken;
- (NSString)availabilityOffGridRecipientSubscriptionValidationToken;
- (NSString)availabilityVerificationRecipientChannelIDPrefix;
- (NSString)availabilityVerificationRecipientEncryptionValidationToken;
- (NSString)currentGroupName;
- (NSString)description;
- (NSString)expressiveSendStyleIdentifier;
- (NSString)groupID;
- (NSString)lastPublisherOfOffGridStatus;
- (NSString)threadIdentifierGUID;
- (NSString)threadOriginatorFallbackHash;
- (NSString)truncatedNicknameRecordKey;
- (NSUUID)replyToGUID;
- (int64_t)replicationSourceID;
- (int64_t)scheduleType;
- (unint64_t)groupParticipantVersion;
- (unint64_t)groupPhotoCreationTime;
- (unint64_t)groupProtocolVersion;
@end

@implementation BlastDoorTextMessage

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, type metadata accessor for TextMessage, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (BlastDoorMetadata)metadata
{
  uint64_t v3 = type metadata accessor for Metadata();
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorTextMessage_textMessage, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Metadata);
  v6 = (objc_class *)type metadata accessor for _ObjCMetadataWrapper(0);
  id v7 = objc_allocWithZone(v6);
  sub_1B17B4094((uint64_t)v5, (uint64_t)v7 + OBJC_IVAR___BlastDoorMetadata_metadata, (uint64_t (*)(void))type metadata accessor for Metadata);
  v11.receiver = v7;
  v11.super_class = v6;
  v8 = self;
  v9 = [(BlastDoorTextMessage *)&v11 init];
  sub_1B17B42FC((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Metadata);

  return (BlastDoorMetadata *)v9;
}

- (BlastDoorTextMessageMessageTypeWrapper)messageSubType
{
  uint64_t v3 = type metadata accessor for TextMessage.MessageType(0);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  uint64_t v7 = type metadata accessor for TextMessage(0);
  sub_1B17B4094((uint64_t)&v6[*(int *)(v7 + 20)], (uint64_t)v5, type metadata accessor for TextMessage.MessageType);
  v8 = (objc_class *)type metadata accessor for _ObjCEnumTextMessageMessageTypeWrapper(0);
  id v9 = objc_allocWithZone(v8);
  sub_1B17B4094((uint64_t)v5, (uint64_t)v9 + OBJC_IVAR___BlastDoorTextMessageMessageTypeWrapper_textMessage_MessageType, type metadata accessor for TextMessage.MessageType);
  v13.receiver = v9;
  v13.super_class = v8;
  v10 = self;
  objc_super v11 = [(BlastDoorTextMessage *)&v13 init];
  sub_1B17B42FC((uint64_t)v5, type metadata accessor for TextMessage.MessageType);

  return (BlastDoorTextMessageMessageTypeWrapper *)v11;
}

- (NSUUID)replyToGUID
{
  return (NSUUID *)sub_1B17A2A2C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (NSString)threadIdentifierGUID
{
  return (NSString *)sub_1B1790A68((uint64_t)self, (uint64_t)a2, type metadata accessor for TextMessage, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage, type metadata accessor for TextMessage);
}

- (NSString)threadOriginatorFallbackHash
{
  return (NSString *)sub_1B17A2CB8((uint64_t)self, (uint64_t)a2, type metadata accessor for TextMessage, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage, type metadata accessor for TextMessage);
}

- (NSString)expressiveSendStyleIdentifier
{
  return (NSString *)sub_1B1795DA8((uint64_t)self, (uint64_t)a2, type metadata accessor for TextMessage, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage, type metadata accessor for TextMessage);
}

- (NSString)groupID
{
  uint64_t v3 = type metadata accessor for TextMessage(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorTextMessage_textMessage, (uint64_t)v6, type metadata accessor for TextMessage);
  uint64_t v7 = &v6[*(int *)(v4 + 48)];
  uint64_t v8 = *((void *)v7 + 3);
  if (v8 == 1)
  {
    result = (NSString *)sub_1B196B120();
    __break(1u);
  }
  else
  {
    uint64_t v9 = *((void *)v7 + 2);
    swift_bridgeObjectRetain();
    sub_1B17B42FC((uint64_t)v6, type metadata accessor for TextMessage);
    if (v8)
    {
      v10 = (void *)sub_1B196A7E0();
      sub_1B11E7748(v9, v8);
    }
    else
    {
      v10 = 0;
    }
    return (NSString *)v10;
  }
  return result;
}

- (NSString)currentGroupName
{
  return (NSString *)sub_1B17A3284((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (BOOL)has_groupParticipantVersion
{
  return sub_1B17A3390((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (unint64_t)groupParticipantVersion
{
  return sub_1B17A3458((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (BOOL)has_groupProtocolVersion
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  return (v2[*(int *)(type metadata accessor for TextMessage(0) + 52) + 8] & 1) == 0;
}

- (unint64_t)groupProtocolVersion
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for TextMessage(0) + 52)];
  if (v3[8]) {
    return 0;
  }
  else {
    return *(void *)v3;
  }
}

- (BOOL)has_groupPhotoCreationTime
{
  return sub_1B17A3640((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (unint64_t)groupPhotoCreationTime
{
  return sub_1B17A3708((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (BlastDoorTextMessage_MessageSummaryInfo)messageSummaryInfo
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for TextMessage(0) + 60)];
  uint64_t v4 = *((void *)v3 + 1);
  if (v4)
  {
    uint64_t v5 = *((void *)v3 + 7);
    uint64_t v6 = *((void *)v3 + 6);
    uint64_t v17 = *((void *)v3 + 5);
    uint64_t v18 = *((void *)v3 + 8);
    uint64_t v8 = *((void *)v3 + 3);
    uint64_t v7 = *((void *)v3 + 4);
    uint64_t v9 = *((void *)v3 + 2);
    uint64_t v10 = *(void *)v3;
    uint64_t v11 = *(void *)v3 >> 8;
    uint64_t v12 = (objc_class *)type metadata accessor for _ObjCTextMessage_MessageSummaryInfoWrapper();
    objc_super v13 = (char *)objc_allocWithZone(v12);
    v14 = &v13[OBJC_IVAR___BlastDoorTextMessage_MessageSummaryInfo_textMessage_MessageSummaryInfo];
    char *v14 = v10;
    v14[1] = v11;
    *((void *)v14 + 1) = v4;
    *((void *)v14 + 2) = v9;
    *((void *)v14 + 3) = v8;
    *((void *)v14 + 4) = v7;
    *((void *)v14 + 5) = v17;
    *((void *)v14 + 6) = v6;
    *((void *)v14 + 7) = v5;
    *((void *)v14 + 8) = v18;
    swift_retain();
    sub_1B11E7664(v8, v7);
    swift_retain();
    sub_1B11E7664(v5, v18);
    v19.receiver = v13;
    v19.super_class = v12;
    v15 = [(BlastDoorTextMessage *)&v19 init];
  }
  else
  {
    v15 = 0;
  }
  return (BlastDoorTextMessage_MessageSummaryInfo *)v15;
}

- (BOOL)isAutoReply
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  return v2[*(int *)(type metadata accessor for TextMessage(0) + 64)];
}

- (NSString)availabilityVerificationRecipientChannelIDPrefix
{
  return (NSString *)sub_1B17A3AD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (NSString)availabilityVerificationRecipientEncryptionValidationToken
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  if (*(void *)&v2[*(int *)(type metadata accessor for TextMessage(0) + 72) + 8])
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

- (NSString)availabilityOffGridRecipientSubscriptionValidationToken
{
  return (NSString *)sub_1B17A3CA8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (NSString)availabilityOffGridRecipientEncryptionValidationToken
{
  return (NSString *)sub_1B17A3DB4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (BOOL)has_seenAsOffGrid
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  return v2[*(int *)(type metadata accessor for TextMessage(0) + 84)] != 2;
}

- (BOOL)seenAsOffGrid
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  return v2[*(int *)(type metadata accessor for TextMessage(0) + 84)] & 1;
}

- (NSString)lastPublisherOfOffGridStatus
{
  uint64_t v3 = type metadata accessor for TextMessage(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorTextMessage_textMessage, (uint64_t)v6, type metadata accessor for TextMessage);
  uint64_t v7 = &v6[*(int *)(v4 + 96)];
  uint64_t v8 = *((void *)v7 + 3);
  if (v8 == 1)
  {
    result = (NSString *)sub_1B196B120();
    __break(1u);
  }
  else
  {
    uint64_t v9 = *((void *)v7 + 2);
    swift_bridgeObjectRetain();
    sub_1B17B42FC((uint64_t)v6, type metadata accessor for TextMessage);
    if (v8)
    {
      uint64_t v10 = (void *)sub_1B196A7E0();
      sub_1B11E7748(v9, v8);
    }
    else
    {
      uint64_t v10 = 0;
    }
    return (NSString *)v10;
  }
  return result;
}

- (BlastDoorNicknameInformation)nicknameInformation
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  uint64_t v3 = type metadata accessor for TextMessage(0);
  sub_1B11F5244((uint64_t)&v2[*(int *)(v3 + 92)], (uint64_t)v21, &qword_1EB7AEAC0);
  sub_1B11F5244((uint64_t)v21, (uint64_t)v22, &qword_1EB7AEAC0);
  int v4 = sub_1B12E1DB4((uint64_t *)v22);
  uint64_t v5 = 0;
  if (v4 != 1)
  {
    uint64_t v6 = (objc_class *)type metadata accessor for _ObjCNicknameInformationWrapper();
    uint64_t v7 = (char *)objc_allocWithZone(v6);
    uint64_t v8 = &v7[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation];
    *(_OWORD *)uint64_t v8 = v22[0];
    long long v9 = v22[4];
    long long v10 = v22[2];
    long long v11 = v22[1];
    *((_OWORD *)v8 + 3) = v22[3];
    *((_OWORD *)v8 + 4) = v9;
    *((_OWORD *)v8 + 1) = v11;
    *((_OWORD *)v8 + 2) = v10;
    long long v12 = v22[8];
    long long v13 = v22[6];
    long long v14 = v22[5];
    *((_OWORD *)v8 + 7) = v22[7];
    *((_OWORD *)v8 + 8) = v12;
    *((_OWORD *)v8 + 5) = v14;
    *((_OWORD *)v8 + 6) = v13;
    long long v15 = v22[11];
    long long v16 = v22[10];
    long long v17 = v22[9];
    *((void *)v8 + 24) = v23;
    *((_OWORD *)v8 + 10) = v16;
    *((_OWORD *)v8 + 11) = v15;
    *((_OWORD *)v8 + 9) = v17;
    sub_1B11F5244((uint64_t)v21, (uint64_t)v20, &qword_1EB7AEAC0);
    sub_1B14E6F2C(v20);
    v19.receiver = v7;
    v19.super_class = v6;
    uint64_t v5 = [(BlastDoorTextMessage *)&v19 init];
  }
  return (BlastDoorNicknameInformation *)v5;
}

- (NSString)truncatedNicknameRecordKey
{
  return (NSString *)sub_1B17A4488((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (BOOL)isExpirable
{
  return sub_1B17A4594((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (BOOL)isSOS
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  return v2[*(int *)(type metadata accessor for TextMessage(0) + 104)];
}

- (BOOL)isCritical
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  return v2[*(int *)(type metadata accessor for TextMessage(0) + 108)];
}

- (BOOL)has_replicationSourceID
{
  return sub_1B17A4724((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (int64_t)replicationSourceID
{
  return sub_1B17A47EC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorTextMessage_textMessage, type metadata accessor for TextMessage);
}

- (int64_t)scheduleType
{
  return sub_1B17A48C0();
}

- (NSDate)scheduledDate
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB7B00E0);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  uint64_t v7 = type metadata accessor for TextMessage(0);
  sub_1B11D863C((uint64_t)&v6[*(int *)(v7 + 120)], (uint64_t)v5, qword_1EB7B00E0);
  uint64_t v8 = sub_1B1969E80();
  uint64_t v9 = *(void *)(v8 - 8);
  long long v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) != 1)
  {
    long long v10 = (void *)sub_1B1969E50();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }
  return (NSDate *)v10;
}

- (NSArray)replicatedFallbackGUIDs
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorTextMessage_textMessage;
  if (*(void *)&v2[*(int *)(type metadata accessor for TextMessage(0) + 124)])
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

- (BlastDoorTextMessage)init
{
  result = (BlastDoorTextMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end