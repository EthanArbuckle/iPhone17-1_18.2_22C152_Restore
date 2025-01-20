@interface BlastDoorSMSMessage
- (BOOL)foundAppleGUID;
- (BOOL)has_iMessageCapability;
- (BOOL)has_replaceMessage;
- (BOOL)has_sendEnabled;
- (BOOL)has_spamCategory;
- (BOOL)has_trackMessage;
- (BOOL)sendEnabled;
- (BOOL)trackMessage;
- (BlastDoorSMSMessage)init;
- (BlastDoorSMSMessage_SMSFilteringSettings)smsFilteringSettings;
- (NSArray)items;
- (NSArray)recipients;
- (NSDate)date;
- (NSString)GUID;
- (NSString)contentType;
- (NSString)countryCode;
- (NSString)description;
- (NSString)displayName;
- (NSString)fallbackHash;
- (NSString)groupID;
- (NSString)originalGroupID;
- (NSString)originatedDeviceEmail;
- (NSString)originatedDeviceNumber;
- (NSString)originatedDeviceSIM;
- (NSString)originatedDeviceUniqueID;
- (NSString)sender;
- (NSString)serviceCenter;
- (NSString)subject;
- (NSString)version;
- (int64_t)filterSubCategory;
- (int64_t)iMessageCapability;
- (int64_t)replaceMessage;
- (int64_t)spamCategory;
- (int64_t)type;
@end

@implementation BlastDoorSMSMessage

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for SMSMessage, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage, (uint64_t (*)(void))type metadata accessor for SMSMessage);
}

- (BOOL)has_spamCategory
{
  return (self->sMSMessage[OBJC_IVAR___BlastDoorSMSMessage_sMSMessage] & 1) == 0;
}

- (int64_t)spamCategory
{
  if (self->sMSMessage[OBJC_IVAR___BlastDoorSMSMessage_sMSMessage]) {
    return 0;
  }
  else {
    return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage);
  }
}

- (int64_t)filterSubCategory
{
  int64_t result = sub_1B17B263C(self->sMSMessage[OBJC_IVAR___BlastDoorSMSMessage_sMSMessage + 1]);
  if (v3) {
    __break(1u);
  }
  return result;
}

- (NSString)version
{
  return (NSString *)sub_1B17A7844();
}

- (int64_t)type
{
  return sub_1B179BF7C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage);
}

- (NSArray)recipients
{
  if (*(void *)&self->sMSMessage[OBJC_IVAR___BlastDoorSMSMessage_sMSMessage + 32])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1B196AAF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (NSDate)date
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB7B00E0);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  uint64_t v7 = type metadata accessor for SMSMessage();
  sub_1B11D863C((uint64_t)&v6[*(int *)(v7 + 36)], (uint64_t)v5, qword_1EB7B00E0);
  uint64_t v8 = sub_1B1969E80();
  uint64_t v9 = *(void *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) != 1)
  {
    v10 = (void *)sub_1B1969E50();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }
  return (NSDate *)v10;
}

- (NSString)sender
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  if (*(void *)&v2[*(int *)(type metadata accessor for SMSMessage() + 40) + 8])
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

- (BOOL)has_iMessageCapability
{
  return sub_1B179C2B0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage, (uint64_t (*)(void))type metadata accessor for SMSMessage);
}

- (int64_t)iMessageCapability
{
  return sub_1B179C378((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage, (uint64_t (*)(void))type metadata accessor for SMSMessage);
}

- (NSString)serviceCenter
{
  return (NSString *)sub_1B179C448((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage, (uint64_t (*)(void))type metadata accessor for SMSMessage);
}

- (NSString)originatedDeviceNumber
{
  return (NSString *)sub_1B179C554((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage, (uint64_t (*)(void))type metadata accessor for SMSMessage);
}

- (NSString)originatedDeviceEmail
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  if (*(void *)&v2[*(int *)(type metadata accessor for SMSMessage() + 56) + 8])
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

- (NSString)originatedDeviceSIM
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  if (*(void *)&v2[*(int *)(type metadata accessor for SMSMessage() + 60) + 8])
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

- (NSString)subject
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  if (*(void *)&v2[*(int *)(type metadata accessor for SMSMessage() + 64) + 8])
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

- (NSString)contentType
{
  return (NSString *)sub_1B17A3AD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage, (uint64_t (*)(void))type metadata accessor for SMSMessage);
}

- (BOOL)has_replaceMessage
{
  return sub_1B179C904((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage, (uint64_t (*)(void))type metadata accessor for SMSMessage);
}

- (int64_t)replaceMessage
{
  return sub_1B179C9CC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage, (uint64_t (*)(void))type metadata accessor for SMSMessage);
}

- (NSString)countryCode
{
  return (NSString *)sub_1B17A3CA8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage, (uint64_t (*)(void))type metadata accessor for SMSMessage);
}

- (NSString)GUID
{
  return (NSString *)sub_1B17A3DB4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage, (uint64_t (*)(void))type metadata accessor for SMSMessage);
}

- (NSString)fallbackHash
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  if (*(void *)&v2[*(int *)(type metadata accessor for SMSMessage() + 84) + 8])
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

- (NSArray)items
{
  return (NSArray *)sub_1B17A0558(self, (uint64_t)a2, (void (*)(void))sub_1B179CBF4, (void (*)(void))type metadata accessor for _ObjCSMSCTPartWrapper);
}

- (BOOL)has_trackMessage
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  return v2[*(int *)(type metadata accessor for SMSMessage() + 92)] != 2;
}

- (BOOL)trackMessage
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  return v2[*(int *)(type metadata accessor for SMSMessage() + 92)] & 1;
}

- (BOOL)has_sendEnabled
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  return v2[*(int *)(type metadata accessor for SMSMessage() + 96)] != 2;
}

- (BOOL)sendEnabled
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  return v2[*(int *)(type metadata accessor for SMSMessage() + 96)] & 1;
}

- (BOOL)foundAppleGUID
{
  return sub_1B17A4594((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_sMSMessage, (uint64_t (*)(void))type metadata accessor for SMSMessage);
}

- (NSString)groupID
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  if (*(void *)&v2[*(int *)(type metadata accessor for SMSMessage() + 104) + 8])
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

- (NSString)originalGroupID
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  if (*(void *)&v2[*(int *)(type metadata accessor for SMSMessage() + 108) + 8])
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

- (NSString)displayName
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  if (*(void *)&v2[*(int *)(type metadata accessor for SMSMessage() + 112) + 8])
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

- (NSString)originatedDeviceUniqueID
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  if (*(void *)&v2[*(int *)(type metadata accessor for SMSMessage() + 116) + 8])
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

- (BlastDoorSMSMessage_SMSFilteringSettings)smsFilteringSettings
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorSMSMessage_sMSMessage;
  uint64_t v3 = type metadata accessor for SMSMessage();
  uint64_t v4 = 0;
  v5 = &v2[*(int *)(v3 + 120)];
  uint64_t v6 = *((void *)v5 + 1);
  if (v6 != 1)
  {
    uint64_t v7 = *((void *)v5 + 2);
    uint64_t v8 = *(void *)v5;
    uint64_t v9 = (objc_class *)type metadata accessor for _ObjCSMSMessage_SMSFilteringSettingsWrapper();
    v10 = (char *)objc_allocWithZone(v9);
    v11 = &v10[OBJC_IVAR___BlastDoorSMSMessage_SMSFilteringSettings_sMSMessage_SMSFilteringSettings];
    *(void *)v11 = v8;
    *((void *)v11 + 1) = v6;
    *((void *)v11 + 2) = v7;
    v13.receiver = v10;
    v13.super_class = v9;
    swift_bridgeObjectRetain();
    uint64_t v4 = [(BlastDoorSMSMessage *)&v13 init];
  }
  return (BlastDoorSMSMessage_SMSFilteringSettings *)v4;
}

- (BlastDoorSMSMessage)init
{
  int64_t result = (BlastDoorSMSMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end