@interface VerificationSymptomDateEntryViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (_TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (_TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5;
- (_TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (void)datePickerValueChanged:(id)a3;
- (void)didTapCancel;
- (void)didTapPrimaryButton;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSymptomsDateCell:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation VerificationSymptomDateEntryViewController

- (void)viewDidLoad
{
  v2 = self;
  VerificationSymptomDateEntryViewController.viewDidLoad()();
}

- (void)updateSymptomsDateCell:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22938FCDC(v4);
}

- (void)datePickerValueChanged:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2683166D8);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  v9 = self;
  id v10 = objc_msgSend(v8, sel_date);
  sub_229418E48();

  uint64_t v11 = sub_229418E68();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 0, 1, v11);
  uint64_t v12 = (uint64_t)v9
      + OBJC_IVAR____TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController_symptomOnsetDate;
  swift_beginAccess();
  sub_229393EBC((uint64_t)v7, v12);
  swift_endAccess();
  sub_22938E27C();
  sub_229394E14((uint64_t)v7, (uint64_t *)&unk_2683166D8);
}

- (void)viewDidLayoutSubviews
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2683166C8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11.receiver = self;
  v11.super_class = ObjectType;
  v7 = self;
  [(OBTableWelcomeController *)&v11 viewDidLayoutSubviews];
  id v8 = objc_retain(*(id *)((char *)&v7->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController_primaryButton));
  sub_22938E4C0(v6);
  uint64_t v9 = type metadata accessor for SymptomOnset(0);
  BOOL v10 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v6, 1, v9) != 1;
  sub_229394E14((uint64_t)v6, (uint64_t *)&unk_2683166C8);
  objc_msgSend(v8, sel_setEnabled_, v10);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_229418F28();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_229418F08();
  id v10 = a3;
  objc_super v11 = self;
  LOBYTE(self) = sub_229393DEC();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_229418F28();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_229418F08();
  id v10 = a3;
  objc_super v11 = self;
  VerificationSymptomDateEntryViewController.tableView(_:didSelectRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_229393F8C(a4);
  double v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_2293940C8(a4);
  double v9 = v8;

  return v9;
}

- (void)didTapPrimaryButton
{
  v2 = self;
  sub_229390BA0();
}

- (void)didTapCancel
{
  uint64_t v3 = *(void *)((char *)&self->super.super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController_flow);
  swift_getObjectType();
  uint64_t v4 = *(void (**)(void))(v3 + 128);
  uint64_t v5 = self;
  v4();
}

- (_TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  result = (_TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5 = a5;
  result = (_TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  result = (_TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6 = a5;
  result = (_TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController_healthAgencyModel));
  sub_229394E14((uint64_t)self+ OBJC_IVAR____TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController_symptomOnsetDate, (uint64_t *)&unk_2683166D8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController_primaryButton));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI42VerificationSymptomDateEntryViewController_secondaryButton);
}

@end