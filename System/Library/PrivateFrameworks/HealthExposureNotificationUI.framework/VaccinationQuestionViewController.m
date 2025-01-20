@interface VaccinationQuestionViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC28HealthExposureNotificationUI33VaccinationQuestionViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (_TtC28HealthExposureNotificationUI33VaccinationQuestionViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (_TtC28HealthExposureNotificationUI33VaccinationQuestionViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5;
- (_TtC28HealthExposureNotificationUI33VaccinationQuestionViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (void)didTapCancel;
- (void)didTapPrimaryButton;
- (void)didTapSecondaryButton;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation VaccinationQuestionViewController

- (void)viewDidLoad
{
  v2 = self;
  VaccinationQuestionViewController.viewDidLoad()();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  [(OBTableWelcomeController *)&v3 viewDidLayoutSubviews];
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC28HealthExposureNotificationUI33VaccinationQuestionViewController_primaryButton], sel_setEnabled_, v2[OBJC_IVAR____TtC28HealthExposureNotificationUI33VaccinationQuestionViewController_isVaccinated] != 2, v3.receiver, v3.super_class);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_229418F28();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL result = sub_229418F08();
  v11 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI33VaccinationQuestionViewController_dataSource);
  if (v11)
  {
    id v12 = a3;
    v13 = self;
    id v14 = v11;
    sub_229419038();

    if (v17 - 1 < 2)
    {
      BOOL v15 = 1;
LABEL_6:

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      return v15;
    }
    if (!v17)
    {
      BOOL v15 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_229418F28();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_229418F08();
  id v10 = a3;
  v11 = self;
  VaccinationQuestionViewController.tableView(_:didSelectRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_229410F48(a4);
  double v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_229411080(a4);
  double v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_229418F28();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  double v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_229418F08();
  id v10 = a3;
  v11 = self;
  double v12 = VaccinationQuestionViewController.tableView(_:heightForRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)didTapPrimaryButton
{
  v2 = self;
  sub_229410418();
}

- (void)didTapSecondaryButton
{
  uint64_t v3 = *(void *)((char *)&self->super.super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI33VaccinationQuestionViewController_flow);
  swift_getObjectType();
  v4 = *(void (**)(void))(v3 + 120);
  v5 = self;
  v4();
}

- (void)didTapCancel
{
  uint64_t v3 = *(void *)((char *)&self->super.super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI33VaccinationQuestionViewController_flow);
  swift_getObjectType();
  v4 = *(void (**)(void))(v3 + 128);
  v5 = self;
  v4();
}

- (_TtC28HealthExposureNotificationUI33VaccinationQuestionViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  BOOL result = (_TtC28HealthExposureNotificationUI33VaccinationQuestionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI33VaccinationQuestionViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5 = a5;
  BOOL result = (_TtC28HealthExposureNotificationUI33VaccinationQuestionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI33VaccinationQuestionViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  BOOL result = (_TtC28HealthExposureNotificationUI33VaccinationQuestionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI33VaccinationQuestionViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6 = a5;
  BOOL result = (_TtC28HealthExposureNotificationUI33VaccinationQuestionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33VaccinationQuestionViewController_healthAgencyModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33VaccinationQuestionViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33VaccinationQuestionViewController_vaccinatedCell));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33VaccinationQuestionViewController_notVaccinatedCell));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI33VaccinationQuestionViewController_primaryButton));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI33VaccinationQuestionViewController_secondaryButton);
}

@end