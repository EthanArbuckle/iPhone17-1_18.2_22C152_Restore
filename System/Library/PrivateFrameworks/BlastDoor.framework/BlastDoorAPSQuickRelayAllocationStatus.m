@interface BlastDoorAPSQuickRelayAllocationStatus
- (BOOL)has_allocationStatus;
- (BOOL)has_participantId;
- (BlastDoorAPSQuickRelayAllocationStatus)init;
- (NSData)token;
- (NSString)description;
- (NSString)destinationId;
- (int64_t)allocationStatus;
- (unint64_t)participantId;
@end

@implementation BlastDoorAPSQuickRelayAllocationStatus

- (NSString)description
{
  sub_1B11F10F4(*(void *)&self->aPSQuickRelayAllocationStatus[OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus+ 24], *(void *)&self->aPSQuickRelayAllocationStatus[OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus+ 32]);
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)has_participantId
{
  return (self->aPSQuickRelayAllocationStatus[OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus] & 1) == 0;
}

- (unint64_t)participantId
{
  if (self->aPSQuickRelayAllocationStatus[OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus]) {
    return 0;
  }
  else {
    return *(unint64_t *)((char *)&self->super.isa
  }
                               + OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus);
}

- (BOOL)has_allocationStatus
{
  return (self->aPSQuickRelayAllocationStatus[OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus
                                            + 16] & 1) == 0;
}

- (int64_t)allocationStatus
{
  if (self->aPSQuickRelayAllocationStatus[OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus
                                         + 16])
    return 0;
  else {
    return *(void *)&self->aPSQuickRelayAllocationStatus[OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus
  }
                                                         + 8];
}

- (NSData)token
{
  unint64_t v2 = *(void *)&self->aPSQuickRelayAllocationStatus[OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus
                                                     + 32];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSQuickRelayAllocationStatus[OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus
                                                       + 24];
    sub_1B11F1108(v4, v2);
    v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (NSString)destinationId
{
  return (NSString *)sub_1B17A7974((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus);
}

- (BlastDoorAPSQuickRelayAllocationStatus)init
{
  result = (BlastDoorAPSQuickRelayAllocationStatus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B11ED778(*(void *)&self->aPSQuickRelayAllocationStatus[OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus+ 24], *(void *)&self->aPSQuickRelayAllocationStatus[OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus+ 32]);
  swift_bridgeObjectRelease();
}

@end