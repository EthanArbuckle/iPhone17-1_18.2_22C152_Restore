@interface BlastDoorNicknameInformationMessage
- (BlastDoorMetadata)metadata;
- (BlastDoorNicknameInformation)nicknameInformation;
- (BlastDoorNicknameInformationMessage)init;
- (NSString)description;
@end

@implementation BlastDoorNicknameInformationMessage

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for NicknameInformationMessage, &OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage, (uint64_t (*)(void))type metadata accessor for NicknameInformationMessage);
}

- (BlastDoorNicknameInformation)nicknameInformation
{
  long long v2 = *(_OWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                  + 168];
  long long v33 = *(_OWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                   + 152];
  long long v34 = v2;
  uint64_t v35 = *(void *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                   + 184];
  long long v3 = *(_OWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                  + 104];
  long long v29 = *(_OWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                   + 88];
  long long v30 = v3;
  long long v4 = *(_OWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                  + 136];
  long long v31 = *(_OWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                   + 120];
  long long v32 = v4;
  long long v5 = *(_OWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                  + 40];
  long long v25 = *(_OWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                   + 24];
  long long v26 = v5;
  long long v6 = *(_OWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                  + 72];
  long long v27 = *(_OWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                   + 56];
  long long v28 = v6;
  long long v7 = *(_OWORD *)&self->nicknameInformationMessage[OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage
                                                  + 8];
  long long v23 = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage);
  long long v24 = v7;
  v8 = (objc_class *)type metadata accessor for _ObjCNicknameInformationWrapper();
  v9 = (char *)objc_allocWithZone(v8);
  v10 = &v9[OBJC_IVAR___BlastDoorNicknameInformation_nicknameInformation];
  *(_OWORD *)v10 = v23;
  long long v11 = v27;
  long long v13 = v24;
  long long v12 = v25;
  *((_OWORD *)v10 + 3) = v26;
  *((_OWORD *)v10 + 4) = v11;
  *((_OWORD *)v10 + 1) = v13;
  *((_OWORD *)v10 + 2) = v12;
  long long v14 = v31;
  long long v16 = v28;
  long long v15 = v29;
  *((_OWORD *)v10 + 7) = v30;
  *((_OWORD *)v10 + 8) = v14;
  *((_OWORD *)v10 + 5) = v16;
  *((_OWORD *)v10 + 6) = v15;
  long long v18 = v33;
  long long v17 = v34;
  long long v19 = v32;
  *((void *)v10 + 24) = v35;
  *((_OWORD *)v10 + 10) = v18;
  *((_OWORD *)v10 + 11) = v17;
  *((_OWORD *)v10 + 9) = v19;
  sub_1B14E6F2C(&v23);
  v22.receiver = v9;
  v22.super_class = v8;
  v20 = [(BlastDoorNicknameInformationMessage *)&v22 init];
  return (BlastDoorNicknameInformation *)v20;
}

- (BlastDoorMetadata)metadata
{
  uint64_t v3 = type metadata accessor for Metadata();
  MEMORY[0x1F4188790](v3 - 8);
  long long v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = (char *)self + OBJC_IVAR___BlastDoorNicknameInformationMessage_nicknameInformationMessage;
  uint64_t v7 = type metadata accessor for NicknameInformationMessage();
  sub_1B17B4094((uint64_t)&v6[*(int *)(v7 + 20)], (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Metadata);
  v8 = (objc_class *)type metadata accessor for _ObjCMetadataWrapper(0);
  id v9 = objc_allocWithZone(v8);
  sub_1B17B4094((uint64_t)v5, (uint64_t)v9 + OBJC_IVAR___BlastDoorMetadata_metadata, (uint64_t (*)(void))type metadata accessor for Metadata);
  v13.receiver = v9;
  v13.super_class = v8;
  v10 = self;
  long long v11 = [(BlastDoorNicknameInformationMessage *)&v13 init];
  sub_1B17B42FC((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Metadata);

  return (BlastDoorMetadata *)v11;
}

- (BlastDoorNicknameInformationMessage)init
{
  result = (BlastDoorNicknameInformationMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end