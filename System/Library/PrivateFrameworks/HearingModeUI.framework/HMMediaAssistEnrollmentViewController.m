@interface HMMediaAssistEnrollmentViewController
- (_TtC13HearingModeUI37HMMediaAssistEnrollmentViewController)initWithDeviceAddress:(id)a3 audiogramSample:(id)a4;
- (_TtC13HearingModeUI37HMMediaAssistEnrollmentViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC13HearingModeUI37HMMediaAssistEnrollmentViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)dealloc;
- (void)mainButtonTapped;
- (void)secondaryButtonTapped;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HMMediaAssistEnrollmentViewController

- (_TtC13HearingModeUI37HMMediaAssistEnrollmentViewController)initWithDeviceAddress:(id)a3 audiogramSample:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_2512C47F8();
    v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    v7 = 0;
  }
  id v8 = a4;
  return (_TtC13HearingModeUI37HMMediaAssistEnrollmentViewController *)HMMediaAssistEnrollmentViewController.init(deviceAddress:audiogramSample:)(v5, v7, a4);
}

- (void)dealloc
{
  v2 = self;
  HMMediaAssistEnrollmentViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_hearingModeClient));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC13HearingModeUI37HMMediaAssistEnrollmentViewController_selectedAudiogram);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2512B8DFC();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_2512B90E0(a3);
}

- (void)mainButtonTapped
{
  uint64_t v2 = qword_269B30DF0;
  v7 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_2512C42B8();
  __swift_project_value_buffer(v3, (uint64_t)qword_269B31470);
  v4 = sub_2512C4298();
  os_log_type_t v5 = sub_2512C49A8();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_251285000, v4, v5, "Media Assist: mainButtonTapped", v6, 2u);
    MEMORY[0x25339B730](v6, -1, -1);
  }

  (*(void (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)v7->super.super.super.super.super.isa) + 0xF8))();
}

- (void)secondaryButtonTapped
{
  uint64_t v2 = self;
  sub_2512BA360();
}

- (_TtC13HearingModeUI37HMMediaAssistEnrollmentViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC13HearingModeUI37HMMediaAssistEnrollmentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13HearingModeUI37HMMediaAssistEnrollmentViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC13HearingModeUI37HMMediaAssistEnrollmentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end