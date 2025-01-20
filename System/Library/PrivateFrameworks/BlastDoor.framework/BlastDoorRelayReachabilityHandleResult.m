@interface BlastDoorRelayReachabilityHandleResult
- (BOOL)isReachable;
- (BlastDoorRelayReachabilityHandleResult)init;
- (NSString)description;
- (NSString)handleID;
- (NSString)service;
@end

@implementation BlastDoorRelayReachabilityHandleResult

- (NSString)description
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)handleID
{
  return (NSString *)sub_1B1798A20((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorRelayReachabilityHandleResult_relayReachabilityHandleResult);
}

- (NSString)service
{
  return (NSString *)sub_1B1798B64();
}

- (BOOL)isReachable
{
  return self->relayReachabilityHandleResult[OBJC_IVAR___BlastDoorRelayReachabilityHandleResult_relayReachabilityHandleResult
                                           + 40];
}

- (BlastDoorRelayReachabilityHandleResult)init
{
  result = (BlastDoorRelayReachabilityHandleResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

@end