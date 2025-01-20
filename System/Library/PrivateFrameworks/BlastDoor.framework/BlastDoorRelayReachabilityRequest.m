@interface BlastDoorRelayReachabilityRequest
- (BlastDoorRelayReachabilityContext)context;
- (BlastDoorRelayReachabilityRequest)init;
- (NSArray)handles;
- (NSString)description;
- (NSString)serviceName;
@end

@implementation BlastDoorRelayReachabilityRequest

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for RelayReachabilityRequest, &OBJC_IVAR___BlastDoorRelayReachabilityRequest_relayReachabilityRequest, (uint64_t (*)(void))type metadata accessor for RelayReachabilityRequest);
}

- (NSArray)handles
{
  uint64_t v3 = type metadata accessor for RelayReachabilityRequest();
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorRelayReachabilityRequest_relayReachabilityRequest, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for RelayReachabilityRequest);
  if (*((void *)v5 + 2))
  {
    swift_bridgeObjectRetain();
    sub_1B17B42FC((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for RelayReachabilityRequest);
    v6 = (void *)sub_1B196AAF0();
    swift_bridgeObjectRelease();
    return (NSArray *)v6;
  }
  else
  {
    result = (NSArray *)sub_1B196B120();
    __break(1u);
  }
  return result;
}

- (NSString)serviceName
{
  return (NSString *)sub_1B1798358();
}

- (BlastDoorRelayReachabilityContext)context
{
  uint64_t v3 = type metadata accessor for RelayReachabilityContext();
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___BlastDoorRelayReachabilityRequest_relayReachabilityRequest;
  uint64_t v7 = type metadata accessor for RelayReachabilityRequest();
  sub_1B17B4094((uint64_t)&v6[*(int *)(v7 + 24)], (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for RelayReachabilityContext);
  uint64_t v8 = (objc_class *)type metadata accessor for _ObjCRelayReachabilityContextWrapper(0);
  id v9 = objc_allocWithZone(v8);
  sub_1B17B4094((uint64_t)v5, (uint64_t)v9 + OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext, (uint64_t (*)(void))type metadata accessor for RelayReachabilityContext);
  v13.receiver = v9;
  v13.super_class = v8;
  v10 = self;
  v11 = [(BlastDoorRelayReachabilityRequest *)&v13 init];
  sub_1B17B42FC((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for RelayReachabilityContext);

  return (BlastDoorRelayReachabilityContext *)v11;
}

- (BlastDoorRelayReachabilityRequest)init
{
  result = (BlastDoorRelayReachabilityRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end