@interface BSBrandMessagingDetailsObjcShim
- (BSBrandMessagingDetailsObjcShim)init;
- (NSString)localizedResponseTime;
@end

@implementation BSBrandMessagingDetailsObjcShim

- (NSString)localizedResponseTime
{
  if (*(void *)&self->messagingDetails[OBJC_IVAR___BSBrandMessagingDetailsObjcShim_messagingDetails])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_229167510();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (BSBrandMessagingDetailsObjcShim)init
{
  result = (BSBrandMessagingDetailsObjcShim *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end