@interface HearingAssistWelcomeController
- (_TtC21HearingModeSettingsUI30HearingAssistWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC21HearingModeSettingsUI30HearingAssistWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (_TtP21HearingModeSettingsUI25HearingFlowControllerType_)flowController;
- (void)audiogramIngestionDidSaveAudiogram:(id)a3;
- (void)setFlowController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HearingAssistWelcomeController

- (_TtP21HearingModeSettingsUI25HearingFlowControllerType_)flowController
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (_TtP21HearingModeSettingsUI25HearingFlowControllerType_ *)v2;
}

- (void)setFlowController:(id)a3
{
  v4 = (id *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC21HearingModeSettingsUI30HearingAssistWelcomeController_flowController);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)audiogramIngestionDidSaveAudiogram:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25124BC90((uint64_t)v4);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_25124C074();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_25124C92C(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for HearingAssistWelcomeController();
  id v4 = v9.receiver;
  [(HearingAssistWelcomeController *)&v9 viewWillAppear:v3];
  sub_25126BDF8();
  v5 = (void *)sub_25126BDD8();
  v6 = (void *)sub_25126BDE8();

  v8[4] = sub_25124CB98;
  v8[5] = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_251240CB4;
  v8[3] = &block_descriptor_5;
  v7 = _Block_copy(v8);
  objc_msgSend(v6, sel_triggerFetchAudiogramsWithCompletion_, v7);
  _Block_release(v7);
}

- (_TtC21HearingModeSettingsUI30HearingAssistWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC21HearingModeSettingsUI30HearingAssistWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC21HearingModeSettingsUI30HearingAssistWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC21HearingModeSettingsUI30HearingAssistWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21HearingModeSettingsUI30HearingAssistWelcomeController_serviceClient));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21HearingModeSettingsUI30HearingAssistWelcomeController____lazy_storage___primaryBoldButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC21HearingModeSettingsUI30HearingAssistWelcomeController____lazy_storage___secondaryLinkButton));
  swift_bridgeObjectRelease();
}

@end