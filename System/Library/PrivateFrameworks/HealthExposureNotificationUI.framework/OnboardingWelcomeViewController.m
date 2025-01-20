@interface OnboardingWelcomeViewController
- (_TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController)initWithCoder:(id)a3;
- (_TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapDone;
- (void)didTapFooterLabel;
- (void)didTapHowExposureNotificationsWork;
- (void)didTapPrimaryButton;
- (void)didTapSecondaryButton;
- (void)scrollViewDidScroll:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation OnboardingWelcomeViewController

- (_TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2293C2240();
}

- (void)viewDidLoad
{
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(OnboardingWelcomeViewController *)&v7 viewWillAppear:v3];
  id v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setNavigationBarHidden_animated_, 1, v3);
  }
  sub_22941157C();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(OnboardingWelcomeViewController *)&v5 viewDidAppear:v3];
  OnboardingWelcomeViewController.updateForScrollOffsetChange()();
}

- (void)viewDidLayoutSubviews
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(OnboardingWelcomeViewController *)&v5 viewDidDisappear:v3];
  sub_229411A64();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  objc_super v7 = v6;
  v9.value.super.isa = (Class)a3;
  OnboardingWelcomeViewController.traitCollectionDidChange(_:)(v9);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  OnboardingWelcomeViewController.updateForScrollOffsetChange()();
}

- (void)didTapHowExposureNotificationsWork
{
  type metadata accessor for OnboardingInfoViewController();
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v4 = self;
  id v5 = objc_msgSend(v3, sel_init);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F829B8]), sel_initWithRootViewController_, v5);

  [(OnboardingWelcomeViewController *)v4 presentViewController:v6 animated:1 completion:0];
}

- (void)didTapFooterLabel
{
  v2 = self;
  sub_2293BE608();
}

- (void)didTapPrimaryButton
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_flow);
  id v3 = self;
  sub_2293C1B94(v3, v2);
}

- (void)didTapSecondaryButton
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_flow);
  id v3 = self;
  sub_2293C1CA0(v3, v2);
}

- (void)didTapDone
{
}

- (_TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_notificationPreview));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_secondaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_howItWorksButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_footerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_scrollViewContentSizeObserver));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_buttonTray);
}

@end