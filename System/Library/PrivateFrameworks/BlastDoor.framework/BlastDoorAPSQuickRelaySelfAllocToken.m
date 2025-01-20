@interface BlastDoorAPSQuickRelaySelfAllocToken
- (BOOL)has_relayPort;
- (BOOL)has_relayProvider;
- (BlastDoorAPSQuickRelaySelfAllocToken)init;
- (NSData)relayAccessToken;
- (NSData)relayIp;
- (NSData)relayIpv6;
- (NSData)relaySessionId;
- (NSData)relaySessionKey;
- (NSString)description;
- (int64_t)relayPort;
- (int64_t)relayProvider;
@end

@implementation BlastDoorAPSQuickRelaySelfAllocToken

- (NSString)description
{
  uint64_t v2 = *(void *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 8];
  uint64_t v3 = *(void *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 40];
  unint64_t v4 = *(void *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 48];
  uint64_t v5 = *(void *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 56];
  unint64_t v6 = *(void *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 64];
  uint64_t v7 = *(void *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 72];
  long long v10 = *(_OWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                    + 16];
  long long v11 = *(_OWORD *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                    + 80];
  sub_1B11F10F4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken), *(void *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken]);
  sub_1B11F10F4(v2, v10);
  sub_1B11F10F4(v3, v4);
  sub_1B11F10F4(v5, v6);
  sub_1B11F10F4(v7, v11);
  sub_1B196A850();
  v8 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (NSData)relayIp
{
  return (NSData *)sub_1B179AEC4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken, (void (*)(uint64_t, uint64_t))sub_1B11F1108);
}

- (NSData)relayIpv6
{
  unint64_t v2 = *(void *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 16];
  if (v2 >> 60 == 15)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                     + 8];
    sub_1B11F1108(v4, v2);
    uint64_t v3 = (void *)sub_1B1969DB0();
    sub_1B11ED778(v4, v2);
  }
  return (NSData *)v3;
}

- (BOOL)has_relayPort
{
  return (self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                          + 32] & 1) == 0;
}

- (int64_t)relayPort
{
  if (self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                       + 32])
    return 0;
  else {
    return *(void *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
  }
                                                       + 24];
}

- (NSData)relaySessionKey
{
  return (NSData *)sub_1B1774EBC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken);
}

- (NSData)relaySessionId
{
  return (NSData *)sub_1B1774F94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken);
}

- (NSData)relayAccessToken
{
  return (NSData *)sub_1B177473C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken);
}

- (BOOL)has_relayProvider
{
  return (self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                          + 96] & 1) == 0;
}

- (int64_t)relayProvider
{
  if (self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                       + 96])
    return 0;
  else {
    return *(void *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
  }
                                                       + 88];
}

- (BlastDoorAPSQuickRelaySelfAllocToken)init
{
  result = (BlastDoorAPSQuickRelaySelfAllocToken *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 8];
  unint64_t v3 = *(void *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 16];
  uint64_t v4 = *(void *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 40];
  unint64_t v5 = *(void *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 48];
  uint64_t v6 = *(void *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 56];
  unint64_t v7 = *(void *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 64];
  uint64_t v8 = *(void *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 72];
  unint64_t v9 = *(void *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken
                                                   + 80];
  sub_1B11ED778(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken), *(void *)&self->aPSQuickRelaySelfAllocToken[OBJC_IVAR___BlastDoorAPSQuickRelaySelfAllocToken_aPSQuickRelaySelfAllocToken]);
  sub_1B11ED778(v2, v3);
  sub_1B11ED778(v4, v5);
  sub_1B11ED778(v6, v7);
  sub_1B11ED778(v8, v9);
}

@end