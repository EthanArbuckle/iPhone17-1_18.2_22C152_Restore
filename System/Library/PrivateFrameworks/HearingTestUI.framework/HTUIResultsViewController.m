@interface HTUIResultsViewController
- (_TtC13HearingTestUI25HTUIResultsViewController)initWithAudiogram:(id)a3 healthStore:(id)a4 isHearingAssistAvailable:(BOOL)a5 application:(id)a6 deviceBluetoothUUID:(id)a7;
- (_TtC13HearingTestUI25HTUIResultsViewController)initWithAudiogram:(id)a3 healthStore:(id)a4 isHearingAssistAvailable:(BOOL)a5 deviceBluetoothUUID:(id)a6;
- (_TtC13HearingTestUI25HTUIResultsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC13HearingTestUI25HTUIResultsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapDone;
- (void)didTapLearnMoreAboutAid;
- (void)didTapSetUpHearingAid;
- (void)didTapSetUpMediaAssist;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HTUIResultsViewController

- (_TtC13HearingTestUI25HTUIResultsViewController)initWithAudiogram:(id)a3 healthStore:(id)a4 isHearingAssistAvailable:(BOOL)a5 application:(id)a6 deviceBluetoothUUID:(id)a7
{
  v11 = _Block_copy(a7);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  return (_TtC13HearingTestUI25HTUIResultsViewController *)HTUIResultsViewController.init(audiogram:healthStore:isHearingAssistAvailable:application:deviceBluetoothUUID:)(a3, a4, a5, a6, (uint64_t)sub_251426B84, v12);
}

- (_TtC13HearingTestUI25HTUIResultsViewController)initWithAudiogram:(id)a3 healthStore:(id)a4 isHearingAssistAvailable:(BOOL)a5 deviceBluetoothUUID:(id)a6
{
  v9 = _Block_copy(a6);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  id v11 = objc_allocWithZone(MEMORY[0x263F82E10]);
  id v12 = a3;
  id v13 = a4;
  id v14 = objc_msgSend(v11, sel_init);
  v15 = (char *)objc_allocWithZone((Class)type metadata accessor for HTUIResultsViewController());
  v16 = sub_251425DDC(v12, v13, a5, (uint64_t)sub_251426440, v10, (uint64_t)v14, 0, 0, v15);

  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC13HearingTestUI25HTUIResultsViewController *)v16;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_251422190();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_2514228AC(a3);
}

- (void)didTapDone
{
  if (*(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC13HearingTestUI25HTUIResultsViewController_analyticsManager))
  {
    uint64_t v2 = *(void *)((char *)&self->super.super.super.super._responderFlags
                   + OBJC_IVAR____TtC13HearingTestUI25HTUIResultsViewController_analyticsManager);
    uint64_t ObjectType = swift_getObjectType();
    char v7 = 3;
    (*(void (**)(char *, _TtC13HearingTestUI25HTUIResultsViewController *, _UNKNOWN **, uint64_t, uint64_t))(v2 + 48))(&v7, self, &protocol witness table for HTUIResultsViewController, ObjectType, v2);
  }
  else
  {
    v4 = self;
  }
  -[HTUIResultsViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0, self);
}

- (void)didTapSetUpHearingAid
{
  uint64_t v2 = self;
  sub_251424180();
}

- (void)didTapSetUpMediaAssist
{
  uint64_t v2 = self;
  sub_251424658();
}

- (void)didTapLearnMoreAboutAid
{
  uint64_t v2 = self;
  sub_251424180();
}

- (_TtC13HearingTestUI25HTUIResultsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC13HearingTestUI25HTUIResultsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13HearingTestUI25HTUIResultsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC13HearingTestUI25HTUIResultsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_251426448((uint64_t)self + OBJC_IVAR____TtC13HearingTestUI25HTUIResultsViewController_stepStartTime, (uint64_t)&qword_26B21D4A0, MEMORY[0x263F07490], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_2514266B8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI25HTUIResultsViewController_audiogram));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI25HTUIResultsViewController_healthStore));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13HearingTestUI25HTUIResultsViewController_articlePresenter);
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI25HTUIResultsViewController_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUI25HTUIResultsViewController_secondaryButton));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end