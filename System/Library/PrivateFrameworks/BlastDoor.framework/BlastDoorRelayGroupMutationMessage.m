@interface BlastDoorRelayGroupMutationMessage
- (BOOL)fromMe;
- (BlastDoorGroupID)groupID;
- (BlastDoorGroupID)originalGroupID;
- (BlastDoorRelayGroupMutationMessage)init;
- (BlastDoorRelayGroupMutationWrapper)mutation;
- (NSString)description;
- (NSString)destinationCallerID;
- (NSString)sender;
- (NSString)service;
- (NSUUID)guid;
@end

@implementation BlastDoorRelayGroupMutationMessage

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for RelayGroupMutationMessage, &OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage, (uint64_t (*)(void))type metadata accessor for RelayGroupMutationMessage);
}

- (NSString)sender
{
  return (NSString *)sub_1B179736C((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for RelayGroupMutationMessage, &OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage, (uint64_t (*)(void))type metadata accessor for RelayGroupMutationMessage, (uint64_t (*)(void))type metadata accessor for RelayGroupMutationMessage);
}

- (NSString)service
{
  return (NSString *)sub_1B1798B64();
}

- (BlastDoorGroupID)groupID
{
  uint64_t v3 = *(void *)&self->relayGroupMutationMessage[OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage
                                                 + 40];
  uint64_t v2 = *(void *)&self->relayGroupMutationMessage[OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage
                                                 + 48];
  uint64_t v5 = *(void *)&self->relayGroupMutationMessage[OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage
                                                 + 56];
  uint64_t v4 = *(void *)&self->relayGroupMutationMessage[OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage
                                                 + 64];
  v6 = (objc_class *)type metadata accessor for _ObjCGroupIDWrapper();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR___BlastDoorGroupID_groupID];
  *(void *)v8 = v3;
  *((void *)v8 + 1) = v2;
  *((void *)v8 + 2) = v5;
  *((void *)v8 + 3) = v4;
  v11.receiver = v7;
  v11.super_class = v6;
  swift_retain();
  swift_bridgeObjectRetain();
  v9 = [(BlastDoorRelayGroupMutationMessage *)&v11 init];
  return (BlastDoorGroupID *)v9;
}

- (BlastDoorGroupID)originalGroupID
{
  uint64_t v3 = *(void *)&self->relayGroupMutationMessage[OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage
                                                 + 72];
  uint64_t v2 = *(void *)&self->relayGroupMutationMessage[OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage
                                                 + 80];
  uint64_t v5 = *(void *)&self->relayGroupMutationMessage[OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage
                                                 + 88];
  uint64_t v4 = *(void *)&self->relayGroupMutationMessage[OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage
                                                 + 96];
  v6 = (objc_class *)type metadata accessor for _ObjCGroupIDWrapper();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR___BlastDoorGroupID_groupID];
  *(void *)v8 = v3;
  *((void *)v8 + 1) = v2;
  *((void *)v8 + 2) = v5;
  *((void *)v8 + 3) = v4;
  v11.receiver = v7;
  v11.super_class = v6;
  swift_retain();
  swift_bridgeObjectRetain();
  v9 = [(BlastDoorRelayGroupMutationMessage *)&v11 init];
  return (BlastDoorGroupID *)v9;
}

- (NSUUID)guid
{
  uint64_t v3 = sub_1B1969EE0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage;
  uint64_t v8 = type metadata accessor for RelayGroupMutationMessage();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, &v7[*(int *)(v8 + 32)], v3);
  v9 = (void *)sub_1B1969EB0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v9;
}

- (NSString)destinationCallerID
{
  return (NSString *)sub_1B1795DA8((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for RelayGroupMutationMessage, &OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage, (uint64_t (*)(void))type metadata accessor for RelayGroupMutationMessage, (uint64_t (*)(void))type metadata accessor for RelayGroupMutationMessage);
}

- (BOOL)fromMe
{
  return sub_1B1797BEC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage, (uint64_t (*)(void))type metadata accessor for RelayGroupMutationMessage);
}

- (BlastDoorRelayGroupMutationWrapper)mutation
{
  uint64_t v2 = (char *)self + OBJC_IVAR___BlastDoorRelayGroupMutationMessage_relayGroupMutationMessage;
  uint64_t v3 = &v2[*(int *)(type metadata accessor for RelayGroupMutationMessage() + 44)];
  uint64_t v4 = *(void *)v3;
  uint64_t v5 = *((void *)v3 + 1);
  uint64_t v6 = *((void *)v3 + 2);
  uint64_t v7 = *((void *)v3 + 3);
  char v8 = v3[32];
  v9 = (objc_class *)type metadata accessor for _ObjCEnumRelayGroupMutationWrapper();
  v10 = (char *)objc_allocWithZone(v9);
  uint64_t v11 = &v10[OBJC_IVAR___BlastDoorRelayGroupMutationWrapper_relayGroupMutation];
  *(void *)uint64_t v11 = v4;
  *((void *)v11 + 1) = v5;
  *((void *)v11 + 2) = v6;
  *((void *)v11 + 3) = v7;
  v11[32] = v8;
  sub_1B14E8240(v4, v5, v6, v7, v8);
  v14.receiver = v10;
  v14.super_class = v9;
  v12 = [(BlastDoorRelayGroupMutationMessage *)&v14 init];
  return (BlastDoorRelayGroupMutationWrapper *)v12;
}

- (BlastDoorRelayGroupMutationMessage)init
{
  result = (BlastDoorRelayGroupMutationMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end