@interface BlastDoorSafetyMonitorGroupFields
- (BlastDoorSafetyMonitorGroupFields)init;
- (NSString)description;
- (NSString)participantID;
- (NSString)receiverHandle;
- (NSString)shareURL;
- (NSString)sharingInvitationData;
- (unint64_t)index;
@end

@implementation BlastDoorSafetyMonitorGroupFields

- (NSString)description
{
  long long v2 = *(_OWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 104];
  v8[6] = *(_OWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                   + 88];
  v8[7] = v2;
  long long v3 = *(_OWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 40];
  v8[2] = *(_OWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                   + 24];
  v8[3] = v3;
  long long v4 = *(_OWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 72];
  v8[4] = *(_OWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                   + 56];
  v8[5] = v4;
  long long v5 = *(_OWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 8];
  v8[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields);
  v8[1] = v5;
  uint64_t v9 = *(void *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 120];
  sub_1B11ED84C(v8);
  sub_1B196A850();
  v6 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (unint64_t)index
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields);
}

- (NSString)receiverHandle
{
  return (NSString *)sub_1B17AC8A4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields);
}

- (NSString)sharingInvitationData
{
  return (NSString *)sub_1B17ACA08((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields);
}

- (NSString)shareURL
{
  uint64_t v2 = *(void *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 88];
  if (v2)
  {
    if (v2 == 1)
    {
      result = (NSString *)sub_1B196B120();
      __break(1u);
      return result;
    }
    uint64_t v4 = *(void *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                  + 80];
    swift_bridgeObjectRetain();
    long long v3 = (void *)sub_1B196A7E0();
    sub_1B11E7748(v4, v2);
  }
  else
  {
    long long v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)participantID
{
  uint64_t v2 = *(void *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 120];
  if (v2)
  {
    if (v2 == 1)
    {
      result = (NSString *)sub_1B196B120();
      __break(1u);
      return result;
    }
    uint64_t v4 = *(void *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                  + 112];
    swift_bridgeObjectRetain();
    long long v3 = (void *)sub_1B196A7E0();
    sub_1B11E7748(v4, v2);
  }
  else
  {
    long long v3 = 0;
  }
  return (NSString *)v3;
}

- (BlastDoorSafetyMonitorGroupFields)init
{
  result = (BlastDoorSafetyMonitorGroupFields *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  long long v2 = *(_OWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 104];
  v6[6] = *(_OWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                   + 88];
  v6[7] = v2;
  uint64_t v7 = *(void *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 120];
  long long v3 = *(_OWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 40];
  v6[2] = *(_OWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                   + 24];
  v6[3] = v3;
  long long v4 = *(_OWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 72];
  v6[4] = *(_OWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                   + 56];
  v6[5] = v4;
  long long v5 = *(_OWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 8];
  v6[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields);
  v6[1] = v5;
  sub_1B11ED904(v6);
}

@end