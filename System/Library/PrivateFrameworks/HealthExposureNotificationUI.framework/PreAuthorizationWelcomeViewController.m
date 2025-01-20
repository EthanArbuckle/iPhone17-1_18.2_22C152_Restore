@interface PreAuthorizationWelcomeViewController
- (_TtC28HealthExposureNotificationUI37PreAuthorizationWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC28HealthExposureNotificationUI37PreAuthorizationWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapCancel;
- (void)didTapPrimaryButton;
- (void)viewDidLoad;
@end

@implementation PreAuthorizationWelcomeViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(OBBaseWelcomeController *)&v3 viewDidLoad];
  sub_2293BA200();
}

- (void)didTapPrimaryButton
{
  id v2 = self;
  sub_2293BA7DC();
}

- (void)didTapCancel
{
  objc_super v3 = (void (**)(void))(*(char **)((char *)&self->super.super.super.super.super.isa
                                               + OBJC_IVAR____TtC28HealthExposureNotificationUI37PreAuthorizationWelcomeViewController_flow)
                                    + OBJC_IVAR____TtC28HealthExposureNotificationUI20PreAuthorizationFlow_completionHandler);
  swift_beginAccess();
  v4 = *v3;
  v5 = self;
  swift_retain();
  v4(0);

  swift_release();
}

- (_TtC28HealthExposureNotificationUI37PreAuthorizationWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC28HealthExposureNotificationUI37PreAuthorizationWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI37PreAuthorizationWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC28HealthExposureNotificationUI37PreAuthorizationWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI37PreAuthorizationWelcomeViewController_healthAgencyModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI37PreAuthorizationWelcomeViewController_primaryButton));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI37PreAuthorizationWelcomeViewController_secondaryButton);
}

@end