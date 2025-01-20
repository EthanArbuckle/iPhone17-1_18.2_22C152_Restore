@interface BlastDoorRelayGroupMutationWrapper
- (BlastDoorRelayGroupDisplayNameMutationEnvelope)displayName;
- (BlastDoorRelayGroupMutationWrapper)init;
- (BlastDoorRelayGroupParticipantMutationEnvelope)participant;
- (NSString)description;
- (unint64_t)type;
@end

@implementation BlastDoorRelayGroupMutationWrapper

- (NSString)description
{
  return (NSString *)sub_1B17B0F0C((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___BlastDoorRelayGroupMutationWrapper_relayGroupMutation, (void (*)(void))sub_1B14E8240);
}

- (unint64_t)type
{
  return self->relayGroupMutation[OBJC_IVAR___BlastDoorRelayGroupMutationWrapper_relayGroupMutation + 24];
}

- (BlastDoorRelayGroupDisplayNameMutationEnvelope)displayName
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR___BlastDoorRelayGroupMutationWrapper_relayGroupMutation);
  if (self->relayGroupMutation[OBJC_IVAR___BlastDoorRelayGroupMutationWrapper_relayGroupMutation + 24])
  {
    v3 = 0;
  }
  else
  {
    uint64_t v5 = v2[2];
    uint64_t v4 = v2[3];
    uint64_t v7 = *v2;
    uint64_t v6 = v2[1];
    v8 = (objc_class *)type metadata accessor for _ObjCRelayGroupDisplayNameMutationEnvelopeWrapper();
    v9 = (char *)objc_allocWithZone(v8);
    v10 = (uint64_t *)&v9[OBJC_IVAR___BlastDoorRelayGroupDisplayNameMutationEnvelope_relayGroupDisplayNameMutationEnvelope];
    uint64_t *v10 = v7;
    v10[1] = v6;
    v10[2] = v5;
    v10[3] = v4;
    sub_1B14FBAB0(v7);
    v12.receiver = v9;
    v12.super_class = v8;
    v3 = [(BlastDoorRelayGroupMutationWrapper *)&v12 init];
  }
  return (BlastDoorRelayGroupDisplayNameMutationEnvelope *)v3;
}

- (BlastDoorRelayGroupParticipantMutationEnvelope)participant
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorRelayGroupMutationWrapper_relayGroupMutation;
  if (self->relayGroupMutation[OBJC_IVAR___BlastDoorRelayGroupMutationWrapper_relayGroupMutation + 24] == 1)
  {
    uint64_t v3 = *((void *)v2 + 1);
    char v4 = *v2;
    uint64_t v5 = (objc_class *)type metadata accessor for _ObjCRelayGroupParticipantMutationEnvelopeWrapper();
    uint64_t v6 = (char *)objc_allocWithZone(v5);
    uint64_t v7 = &v6[OBJC_IVAR___BlastDoorRelayGroupParticipantMutationEnvelope_relayGroupParticipantMutationEnvelope];
    *uint64_t v7 = v4 & 1;
    *((void *)v7 + 1) = v3;
    v10.receiver = v6;
    v10.super_class = v5;
    swift_bridgeObjectRetain();
    v8 = [(BlastDoorRelayGroupMutationWrapper *)&v10 init];
  }
  else
  {
    v8 = 0;
  }
  return (BlastDoorRelayGroupParticipantMutationEnvelope *)v8;
}

- (BlastDoorRelayGroupMutationWrapper)init
{
  result = (BlastDoorRelayGroupMutationWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end