@interface BlastDoorAPSUserPayloadDeliveryContext
- (BOOL)has_count;
- (BlastDoorAPSUserPayloadDeliveryContext)init;
- (NSString)description;
- (int64_t)count;
@end

@implementation BlastDoorAPSUserPayloadDeliveryContext

- (NSString)description
{
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)has_count
{
  return (self->aPSUserPayloadDeliveryContext[OBJC_IVAR___BlastDoorAPSUserPayloadDeliveryContext_aPSUserPayloadDeliveryContext] & 1) == 0;
}

- (int64_t)count
{
  if (self->aPSUserPayloadDeliveryContext[OBJC_IVAR___BlastDoorAPSUserPayloadDeliveryContext_aPSUserPayloadDeliveryContext]) {
    return 0;
  }
  else {
    return *(int64_t *)((char *)&self->super.isa
  }
                             + OBJC_IVAR___BlastDoorAPSUserPayloadDeliveryContext_aPSUserPayloadDeliveryContext);
}

- (BlastDoorAPSUserPayloadDeliveryContext)init
{
  result = (BlastDoorAPSUserPayloadDeliveryContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end