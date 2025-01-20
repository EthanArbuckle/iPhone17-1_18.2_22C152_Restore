@interface ExportViewController
- (_TtC13FTMInternal_420ExportViewController)initWithCoder:(id)a3;
- (_TtC13FTMInternal_420ExportViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapDismissWithSender:(id)a3;
- (void)viewDidLoad;
@end

@implementation ExportViewController

- (_TtC13FTMInternal_420ExportViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001F353C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1001F1EB0();
}

- (void)didTapDismissWithSender:(id)a3
{
  id v5 = objc_allocWithZone((Class)UIImpactFeedbackGenerator);
  id v6 = a3;
  v7 = self;
  id v8 = [v5 initWithStyle:1];
  [v8 impactOccurred];
  [(ExportViewController *)v7 dismissViewControllerAnimated:1 completion:0];
}

- (_TtC13FTMInternal_420ExportViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC13FTMInternal_420ExportViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_420ExportViewController____lazy_storage___exportOptionsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_420ExportViewController_dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_420ExportViewController____lazy_storage___loadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_420ExportViewController_containerView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13FTMInternal_420ExportViewController_persistanceStore);
}

@end