@interface SelfReportVerificationWelcomeViewController
- (_TtC28HealthExposureNotificationUI43SelfReportVerificationWelcomeViewController)initWithCoder:(id)a3;
- (_TtC28HealthExposureNotificationUI43SelfReportVerificationWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SelfReportVerificationWelcomeViewController

- (_TtC28HealthExposureNotificationUI43SelfReportVerificationWelcomeViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2293A93A4();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SelfReportVerificationWelcomeViewController();
  id v2 = v3.receiver;
  [(SelfReportVerificationWelcomeViewController *)&v3 viewDidLoad];
  sub_2293A6BF0();
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)viewWillLayoutSubviews
{
  id v2 = self;
  id v3 = [(SelfReportVerificationWelcomeViewController *)v2 view];
  if (!v3)
  {
    __break(1u);
    goto LABEL_7;
  }
  v4 = v3;
  objc_msgSend(v3, sel_setLayoutMargins_, 0.0, 24.0, 0.0, 24.0);

  id v5 = [(SelfReportVerificationWelcomeViewController *)v2 view];
  if (!v5)
  {
LABEL_7:
    __break(1u);
    return;
  }
  id v6 = v5;
  objc_msgSend(v5, sel_layoutMarginsDidChange);
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  sub_2293A6878();
}

- (_TtC28HealthExposureNotificationUI43SelfReportVerificationWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC28HealthExposureNotificationUI43SelfReportVerificationWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI43SelfReportVerificationWelcomeViewController_healthAgencyModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI43SelfReportVerificationWelcomeViewController____lazy_storage___contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI43SelfReportVerificationWelcomeViewController____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI43SelfReportVerificationWelcomeViewController____lazy_storage___authorityTextView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI43SelfReportVerificationWelcomeViewController____lazy_storage___footerView);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v8 = self;
  sub_2293A6A68();
  id v5 = objc_msgSend(v4, sel_panGestureRecognizer);
  objc_msgSend(v5, sel_velocityInView_, v4);
  double v7 = v6;

  sub_2293A7E14(fabs(v7) < 300.0);
}

@end