@interface HearingAssistFlowController
- (HPMHeadphoneDevice)headphoneDevice;
- (UINavigationController)flowContainerController;
- (UIViewController)initialViewController;
- (_TtC21HearingModeSettingsUI27HearingAssistFlowController)init;
- (_TtC21HearingModeSettingsUI27HearingAssistFlowController)initWithDevice:(id)a3 serviceClient:(id)a4 flow:(int64_t)a5;
- (void)setInitialViewController:(id)a3;
@end

@implementation HearingAssistFlowController

- (UIViewController)initialViewController
{
  v2 = self;
  v3 = (void *)sub_251232C74();

  return (UIViewController *)v3;
}

- (void)setInitialViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController____lazy_storage___initialViewController);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController____lazy_storage___initialViewController) = (Class)a3;
  id v3 = a3;
}

- (UINavigationController)flowContainerController
{
  uint64_t v3 = *MEMORY[0x263F8EED0] & (uint64_t)self->super.isa;
  type metadata accessor for HearingFlowNavigationController();
  id v4 = *(uint64_t (**)(void))(v3 + 112);
  v5 = self;
  v6 = (void *)v4();
  id v7 = sub_251250EAC((uint64_t)v5, v6);
  return (UINavigationController *)v7;
}

- (HPMHeadphoneDevice)headphoneDevice
{
  return (HPMHeadphoneDevice *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController_headphoneDevice));
}

- (_TtC21HearingModeSettingsUI27HearingAssistFlowController)initWithDevice:(id)a3 serviceClient:(id)a4 flow:(int64_t)a5
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController____lazy_storage___initialViewController) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController_headphoneDevice) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController_flowType) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController_hmsClient) = (Class)a4;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for HearingAssistFlowController();
  id v7 = a3;
  id v8 = a4;
  return [(HearingAssistFlowController *)&v10 init];
}

- (_TtC21HearingModeSettingsUI27HearingAssistFlowController)init
{
  result = (_TtC21HearingModeSettingsUI27HearingAssistFlowController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController____lazy_storage___initialViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController_headphoneDevice));
  uint64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21HearingModeSettingsUI27HearingAssistFlowController_hmsClient);
}

@end