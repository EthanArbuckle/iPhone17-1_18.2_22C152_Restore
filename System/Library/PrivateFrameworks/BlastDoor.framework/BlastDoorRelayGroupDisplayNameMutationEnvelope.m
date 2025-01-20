@interface BlastDoorRelayGroupDisplayNameMutationEnvelope
- (BlastDoorGroupDisplayName)updatedName;
- (BlastDoorRelayGroupDisplayNameMutationEnvelope)init;
- (NSString)description;
@end

@implementation BlastDoorRelayGroupDisplayNameMutationEnvelope

- (NSString)description
{
  sub_1B14FBAB0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___BlastDoorRelayGroupDisplayNameMutationEnvelope_relayGroupDisplayNameMutationEnvelope));
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorGroupDisplayName)updatedName
{
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR___BlastDoorRelayGroupDisplayNameMutationEnvelope_relayGroupDisplayNameMutationEnvelope);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR___BlastDoorRelayGroupDisplayNameMutationEnvelope_relayGroupDisplayNameMutationEnvelope);
  if (v3)
  {
    uint64_t v5 = v2[2];
    uint64_t v4 = v2[3];
    uint64_t v6 = v2[1];
    v7 = (objc_class *)type metadata accessor for _ObjCGroupDisplayNameWrapper();
    v8 = (char *)objc_allocWithZone(v7);
    v9 = (uint64_t *)&v8[OBJC_IVAR___BlastDoorGroupDisplayName_groupDisplayName];
    uint64_t *v9 = v3;
    v9[1] = v6;
    v9[2] = v5;
    v9[3] = v4;
    sub_1B14FBAB0(v3);
    v12.receiver = v8;
    v12.super_class = v7;
    v10 = [(BlastDoorRelayGroupDisplayNameMutationEnvelope *)&v12 init];
  }
  else
  {
    v10 = 0;
  }
  return (BlastDoorGroupDisplayName *)v10;
}

- (BlastDoorRelayGroupDisplayNameMutationEnvelope)init
{
  result = (BlastDoorRelayGroupDisplayNameMutationEnvelope *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B14F9D04(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___BlastDoorRelayGroupDisplayNameMutationEnvelope_relayGroupDisplayNameMutationEnvelope));
}

@end