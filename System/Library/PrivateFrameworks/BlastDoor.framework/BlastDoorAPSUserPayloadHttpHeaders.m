@interface BlastDoorAPSUserPayloadHttpHeaders
- (BlastDoorAPSUserPayloadHttpHeaders)init;
- (NSString)adhocServiceOverride;
- (NSString)asHttpHeader;
- (NSString)description;
- (NSString)responseIdentifierString;
- (NSString)splunkHint;
- (NSString)strictTransportSecurity;
- (NSString)traceId;
@end

@implementation BlastDoorAPSUserPayloadHttpHeaders

- (NSString)description
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)adhocServiceOverride
{
  return (NSString *)sub_1B17AD0C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSUserPayloadHttpHeaders_aPSUserPayloadHttpHeaders);
}

- (NSString)responseIdentifierString
{
  return (NSString *)sub_1B17AD14C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSUserPayloadHttpHeaders_aPSUserPayloadHttpHeaders);
}

- (NSString)strictTransportSecurity
{
  return (NSString *)sub_1B17A78F0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSUserPayloadHttpHeaders_aPSUserPayloadHttpHeaders);
}

- (NSString)traceId
{
  return (NSString *)sub_1B17A7974((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSUserPayloadHttpHeaders_aPSUserPayloadHttpHeaders);
}

- (NSString)splunkHint
{
  return (NSString *)sub_1B178E8A4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSUserPayloadHttpHeaders_aPSUserPayloadHttpHeaders);
}

- (NSString)asHttpHeader
{
  if (*(void *)&self->aPSUserPayloadHttpHeaders[OBJC_IVAR___BlastDoorAPSUserPayloadHttpHeaders_aPSUserPayloadHttpHeaders
                                                 + 80])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1B196A7E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (BlastDoorAPSUserPayloadHttpHeaders)init
{
  result = (BlastDoorAPSUserPayloadHttpHeaders *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end