@interface BlastDoorRelayReachabilityResult
- (BOOL)allAreReachable;
- (BOOL)didCheckServer;
- (BOOL)isFinal;
- (BlastDoorRelayReachabilityResult)init;
- (NSArray)handleResults;
- (NSString)description;
- (NSString)service;
- (int64_t)error;
@end

@implementation BlastDoorRelayReachabilityResult

- (NSString)description
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)service
{
  return (NSString *)sub_1B17AA7A8();
}

- (int64_t)error
{
  int64_t result = sub_1B17B376C(self->relayReachabilityResult[OBJC_IVAR___BlastDoorRelayReachabilityResult_relayReachabilityResult + 8]- 2);
  if (v3) {
    __break(1u);
  }
  return result;
}

- (NSArray)handleResults
{
  return (NSArray *)sub_1B17A0558(self, (uint64_t)a2, (void (*)(void))sub_1B1799048, (void (*)(void))type metadata accessor for _ObjCRelayReachabilityHandleResultWrapper);
}

- (BOOL)isFinal
{
  return self->relayReachabilityResult[OBJC_IVAR___BlastDoorRelayReachabilityResult_relayReachabilityResult + 24];
}

- (BOOL)allAreReachable
{
  return self->relayReachabilityResult[OBJC_IVAR___BlastDoorRelayReachabilityResult_relayReachabilityResult + 25];
}

- (BOOL)didCheckServer
{
  return self->relayReachabilityResult[OBJC_IVAR___BlastDoorRelayReachabilityResult_relayReachabilityResult + 26];
}

- (BlastDoorRelayReachabilityResult)init
{
  int64_t result = (BlastDoorRelayReachabilityResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end