@interface BlastDoorAPSQuickRelayPluginAllocation
- (BOOL)has_participantId;
- (BOOL)has_pluginStream;
- (BlastDoorAPSQuickRelayPluginAllocation)init;
- (NSData)relayAccessToken;
- (NSData)relaySessionKey;
- (NSString)description;
- (NSString)pluginName;
- (int64_t)pluginStream;
- (unint64_t)participantId;
@end

@implementation BlastDoorAPSQuickRelayPluginAllocation

- (NSString)description
{
  uint64_t v2 = *(void *)&self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                                     + 40];
  unint64_t v3 = *(void *)&self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                                     + 48];
  uint64_t v4 = *(void *)&self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                                     + 56];
  unint64_t v5 = *(void *)&self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                                     + 64];
  swift_bridgeObjectRetain();
  sub_1B11F10F4(v2, v3);
  sub_1B11F10F4(v4, v5);
  sub_1B196A850();
  v6 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (NSString)pluginName
{
  return (NSString *)sub_1B17AD0C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation);
}

- (BOOL)has_pluginStream
{
  return (self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                            + 16] & 1) == 0;
}

- (int64_t)pluginStream
{
  if (self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                         + 16])
    return 0;
  else {
    return *(void *)&self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
  }
                                                         + 8];
}

- (BOOL)has_participantId
{
  return (self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                            + 32] & 1) == 0;
}

- (unint64_t)participantId
{
  if (self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                         + 32])
    return 0;
  else {
    return *(void *)&self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
  }
                                                         + 24];
}

- (NSData)relaySessionKey
{
  return (NSData *)sub_1B1774EBC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation);
}

- (NSData)relayAccessToken
{
  return (NSData *)sub_1B1774F94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation);
}

- (BlastDoorAPSQuickRelayPluginAllocation)init
{
  result = (BlastDoorAPSQuickRelayPluginAllocation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                                     + 40];
  unint64_t v3 = *(void *)&self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                                     + 48];
  uint64_t v4 = *(void *)&self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                                     + 56];
  unint64_t v5 = *(void *)&self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                                     + 64];
  swift_bridgeObjectRelease();
  sub_1B11ED778(v2, v3);
  sub_1B11ED778(v4, v5);
}

@end