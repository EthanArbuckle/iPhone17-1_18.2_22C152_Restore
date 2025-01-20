@interface BlastDoorRelayReachabilityResponse
- (BlastDoorRelayReachabilityResponse)init;
- (BlastDoorRelayReachabilityResult)result;
- (NSString)description;
@end

@implementation BlastDoorRelayReachabilityResponse

- (NSString)description
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorRelayReachabilityResult)result
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorRelayReachabilityResponse_relayReachabilityResponse);
  uint64_t v2 = *(void *)&self->relayReachabilityResponse[OBJC_IVAR___BlastDoorRelayReachabilityResponse_relayReachabilityResponse];
  unsigned __int8 v4 = self->relayReachabilityResponse[OBJC_IVAR___BlastDoorRelayReachabilityResponse_relayReachabilityResponse + 8];
  uint64_t v5 = *(void *)&self->relayReachabilityResponse[OBJC_IVAR___BlastDoorRelayReachabilityResponse_relayReachabilityResponse
                                                 + 16];
  unsigned __int8 v6 = self->relayReachabilityResponse[OBJC_IVAR___BlastDoorRelayReachabilityResponse_relayReachabilityResponse + 24];
  unsigned __int8 v7 = self->relayReachabilityResponse[OBJC_IVAR___BlastDoorRelayReachabilityResponse_relayReachabilityResponse + 25];
  unsigned __int8 v8 = self->relayReachabilityResponse[OBJC_IVAR___BlastDoorRelayReachabilityResponse_relayReachabilityResponse + 26];
  v9 = (objc_class *)type metadata accessor for _ObjCRelayReachabilityResultWrapper();
  v10 = (char *)objc_allocWithZone(v9);
  v11 = &v10[OBJC_IVAR___BlastDoorRelayReachabilityResult_relayReachabilityResult];
  *(void *)v11 = v3;
  *((void *)v11 + 1) = v2;
  v11[16] = v4;
  *((void *)v11 + 3) = v5;
  v11[32] = v6;
  v11[33] = v7;
  v11[34] = v8;
  v14.receiver = v10;
  v14.super_class = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12 = [(BlastDoorRelayReachabilityResponse *)&v14 init];
  return (BlastDoorRelayReachabilityResult *)v12;
}

- (BlastDoorRelayReachabilityResponse)init
{
  result = (BlastDoorRelayReachabilityResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end