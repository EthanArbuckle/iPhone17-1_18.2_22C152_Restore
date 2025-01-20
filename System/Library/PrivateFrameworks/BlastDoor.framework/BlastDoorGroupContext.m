@interface BlastDoorGroupContext
- (BOOL)has_groupParticipantVersion;
- (BOOL)has_groupProtocolVersion;
- (BlastDoorGroupContext)init;
- (NSArray)participantDestinationIdentifiers;
- (NSString)currentGroupName;
- (NSString)description;
- (NSString)groupID;
- (unint64_t)groupParticipantVersion;
- (unint64_t)groupProtocolVersion;
@end

@implementation BlastDoorGroupContext

- (NSString)description
{
  uint64_t v2 = *(void *)&self->groupContext[OBJC_IVAR___BlastDoorGroupContext_groupContext + 32];
  long long v5 = *(_OWORD *)&self->groupContext[OBJC_IVAR___BlastDoorGroupContext_groupContext + 40];
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_1B11E7664(v2, v5);
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v3 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSArray)participantDestinationIdentifiers
{
  return (NSArray *)sub_1B17A4ECC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorGroupContext_groupContext);
}

- (NSString)groupID
{
  return (NSString *)sub_1B17ABA40((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorGroupContext_groupContext);
}

- (NSString)currentGroupName
{
  return (NSString *)sub_1B17ABBA4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorGroupContext_groupContext);
}

- (BOOL)has_groupParticipantVersion
{
  return (self->groupContext[OBJC_IVAR___BlastDoorGroupContext_groupContext + 72] & 1) == 0;
}

- (unint64_t)groupParticipantVersion
{
  if (self->groupContext[OBJC_IVAR___BlastDoorGroupContext_groupContext + 72]) {
    return 0;
  }
  else {
    return *(void *)&self->groupContext[OBJC_IVAR___BlastDoorGroupContext_groupContext + 64];
  }
}

- (BOOL)has_groupProtocolVersion
{
  return (self->groupContext[OBJC_IVAR___BlastDoorGroupContext_groupContext + 88] & 1) == 0;
}

- (unint64_t)groupProtocolVersion
{
  if (self->groupContext[OBJC_IVAR___BlastDoorGroupContext_groupContext + 88]) {
    return 0;
  }
  else {
    return *(void *)&self->groupContext[OBJC_IVAR___BlastDoorGroupContext_groupContext + 80];
  }
}

- (BlastDoorGroupContext)init
{
  result = (BlastDoorGroupContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->groupContext[OBJC_IVAR___BlastDoorGroupContext_groupContext + 32];
  uint64_t v3 = *(void *)&self->groupContext[OBJC_IVAR___BlastDoorGroupContext_groupContext + 40];
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1B11E7748(v2, v3);
  swift_bridgeObjectRelease();
}

@end