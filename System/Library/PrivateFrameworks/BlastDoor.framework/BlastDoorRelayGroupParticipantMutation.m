@interface BlastDoorRelayGroupParticipantMutation
- (BlastDoorRelayGroupParticipantMutation)init;
- (NSString)description;
- (NSString)handleID;
- (NSString)itemID;
@end

@implementation BlastDoorRelayGroupParticipantMutation

- (NSString)description
{
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)handleID
{
  return (NSString *)sub_1B1798A20((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorRelayGroupParticipantMutation_relayGroupParticipantMutation);
}

- (NSString)itemID
{
  return (NSString *)sub_1B17969C4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorRelayGroupParticipantMutation_relayGroupParticipantMutation);
}

- (BlastDoorRelayGroupParticipantMutation)init
{
  result = (BlastDoorRelayGroupParticipantMutation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end