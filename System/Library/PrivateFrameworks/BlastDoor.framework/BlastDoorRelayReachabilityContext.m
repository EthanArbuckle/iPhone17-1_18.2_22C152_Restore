@interface BlastDoorRelayReachabilityContext
- (BOOL)conversationWasDowngraded;
- (BOOL)forceMMS;
- (BOOL)hasConversationHistory;
- (BOOL)isForPendingConversation;
- (BOOL)shouldForceServerStatusRefresh;
- (BlastDoorRelayReachabilityContext)init;
- (NSString)chatIdentifier;
- (NSString)description;
- (NSString)lastUsedServiceName;
- (NSString)senderLastAddressedHandle;
- (NSString)serviceOfLastMessage;
- (NSUUID)senderLastAddressedSIMID;
- (int64_t)chatStyle;
@end

@implementation BlastDoorRelayReachabilityContext

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for RelayReachabilityContext, &OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext, (uint64_t (*)(void))type metadata accessor for RelayReachabilityContext);
}

- (NSString)chatIdentifier
{
  return (NSString *)sub_1B179736C((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for RelayReachabilityContext, &OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext, (uint64_t (*)(void))type metadata accessor for RelayReachabilityContext, (uint64_t (*)(void))type metadata accessor for RelayReachabilityContext);
}

- (int64_t)chatStyle
{
  return sub_1B179BF7C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext);
}

- (NSString)senderLastAddressedHandle
{
  uint64_t v3 = type metadata accessor for RelayReachabilityContext();
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for RelayReachabilityContext);
  uint64_t v6 = *((void *)v5 + 8);
  if (v6 == 1)
  {
    result = (NSString *)sub_1B196B120();
    __break(1u);
  }
  else
  {
    uint64_t v7 = *((void *)v5 + 7);
    swift_bridgeObjectRetain();
    sub_1B17B42FC((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for RelayReachabilityContext);
    if (v6)
    {
      v8 = (void *)sub_1B196A7E0();
      sub_1B11E7748(v7, v6);
    }
    else
    {
      v8 = 0;
    }
    return (NSString *)v8;
  }
  return result;
}

- (NSUUID)senderLastAddressedSIMID
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7B4140);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (char *)self + OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext;
  uint64_t v7 = type metadata accessor for RelayReachabilityContext();
  sub_1B11D863C((uint64_t)&v6[*(int *)(v7 + 28)], (uint64_t)v5, &qword_1EB7B4140);
  uint64_t v8 = sub_1B1969EE0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) != 1)
  {
    uint64_t v10 = (void *)sub_1B1969EB0();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }
  return (NSUUID *)v10;
}

- (NSString)lastUsedServiceName
{
  return (NSString *)sub_1B1797A14((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext, (uint64_t (*)(void))type metadata accessor for RelayReachabilityContext);
}

- (NSString)serviceOfLastMessage
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext;
  if (*(void *)&v2[*(int *)(type metadata accessor for RelayReachabilityContext() + 36) + 8])
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

- (BOOL)conversationWasDowngraded
{
  return sub_1B1797BEC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext, (uint64_t (*)(void))type metadata accessor for RelayReachabilityContext);
}

- (BOOL)hasConversationHistory
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext;
  return v2[*(int *)(type metadata accessor for RelayReachabilityContext() + 44)];
}

- (BOOL)shouldForceServerStatusRefresh
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext;
  return v2[*(int *)(type metadata accessor for RelayReachabilityContext() + 48)];
}

- (BOOL)forceMMS
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext;
  return v2[*(int *)(type metadata accessor for RelayReachabilityContext() + 52)];
}

- (BOOL)isForPendingConversation
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext;
  return v2[*(int *)(type metadata accessor for RelayReachabilityContext() + 56)];
}

- (BlastDoorRelayReachabilityContext)init
{
  result = (BlastDoorRelayReachabilityContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end