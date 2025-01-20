@interface CHUISRemoteWidgetLaunchRequest
- (BSAction)action;
- (CHSExtensionIdentity)extensionIdentity;
- (CHUISRemoteWidgetLaunchRequest)init;
- (CHUISRemoteWidgetLaunchRequest)initWithData:(id)a3;
- (void)setAction:(id)a3;
- (void)setExtensionIdentity:(id)a3;
@end

@implementation CHUISRemoteWidgetLaunchRequest

- (CHSExtensionIdentity)extensionIdentity
{
  return (CHSExtensionIdentity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___CHUISRemoteWidgetLaunchRequest_extensionIdentity));
}

- (void)setExtensionIdentity:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISRemoteWidgetLaunchRequest_extensionIdentity);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISRemoteWidgetLaunchRequest_extensionIdentity) = (Class)a3;
  id v3 = a3;
}

- (BSAction)action
{
  return (BSAction *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___CHUISRemoteWidgetLaunchRequest_action));
}

- (void)setAction:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISRemoteWidgetLaunchRequest_action);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISRemoteWidgetLaunchRequest_action) = (Class)a3;
  id v3 = a3;
}

- (CHUISRemoteWidgetLaunchRequest)initWithData:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    id v4 = a3;
    uint64_t v3 = sub_1BC487408();
    unint64_t v6 = v5;
  }
  else
  {
    unint64_t v6 = 0xF000000000000000;
  }
  return (CHUISRemoteWidgetLaunchRequest *)sub_1BC42E274(v3, v6);
}

- (CHUISRemoteWidgetLaunchRequest)init
{
  result = (CHUISRemoteWidgetLaunchRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHUISRemoteWidgetLaunchRequest_action);
}

@end