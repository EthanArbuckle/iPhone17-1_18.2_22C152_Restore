@interface PregnancyOnboardingRecordDetailsViewController
- (_TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)hxui_cancelButtonTapped;
- (void)hxui_primaryFooterButtonTapped;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PregnancyOnboardingRecordDetailsViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2411F2D44();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = sub_24162B718();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController_viewModel);
  v9 = self;
  sub_24162B5E8();
  swift_getKeyPath();
  uint64_t v11 = v8;
  v12 = v7;
  uint64_t v13 = v8;
  sub_2411F42D8((unint64_t *)&qword_268CFA8A0, (void (*)(uint64_t))type metadata accessor for PregnancyDatesInputViewModel);
  sub_24162BB38();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)hxui_primaryFooterButtonTapped
{
  char v2 = *((unsigned char *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController_onboardingStep);
  v3 = self;
  swift_retain();
  sub_2415E7E28(v2, 2);

  swift_release();
}

- (void)hxui_cancelButtonTapped
{
  char v2 = self;
  sub_2411F36E4();
}

- (_TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController____lazy_storage___addPregnancyButton));
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46PregnancyOnboardingRecordDetailsViewController____lazy_storage___hostingController);
}

@end