@interface BlastDoorRelayGroupParticipantMutationEnvelope
- (BlastDoorRelayGroupParticipantMutationEnvelope)init;
- (NSArray)changedParticipants;
- (NSString)description;
- (int64_t)type;
@end

@implementation BlastDoorRelayGroupParticipantMutationEnvelope

- (NSString)description
{
  return (NSString *)sub_1B1796E64();
}

- (int64_t)type
{
  return *((unsigned __int8 *)&self->super.isa
         + OBJC_IVAR___BlastDoorRelayGroupParticipantMutationEnvelope_relayGroupParticipantMutationEnvelope);
}

- (NSArray)changedParticipants
{
  return (NSArray *)sub_1B17A0558(self, (uint64_t)a2, (void (*)(void))sub_1B1796F28, (void (*)(void))type metadata accessor for _ObjCRelayGroupParticipantMutationWrapper);
}

- (BlastDoorRelayGroupParticipantMutationEnvelope)init
{
  result = (BlastDoorRelayGroupParticipantMutationEnvelope *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end