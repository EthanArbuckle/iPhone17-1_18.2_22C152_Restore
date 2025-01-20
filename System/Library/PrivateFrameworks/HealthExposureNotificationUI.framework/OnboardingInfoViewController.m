@interface OnboardingInfoViewController
- (_TtC28HealthExposureNotificationUI28OnboardingInfoViewController)initWithCoder:(id)a3;
- (_TtC28HealthExposureNotificationUI28OnboardingInfoViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapDone;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation OnboardingInfoViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(OnboardingInfoViewController *)&v3 viewDidLoad];
  sub_2293BC8C0();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = (char *)v5.receiver;
  [(OnboardingInfoViewController *)&v5 viewDidDisappear:v3];
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC28HealthExposureNotificationUI28OnboardingInfoViewController_scrollView], sel_setContentOffset_animated_, 0, 0.0, 0.0, v5.receiver, v5.super_class);
}

- (_TtC28HealthExposureNotificationUI28OnboardingInfoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_2294191A8();
    a3 = v8;
  }
  uint64_t v9 = OBJC_IVAR____TtC28HealthExposureNotificationUI28OnboardingInfoViewController_scrollView;
  id v10 = objc_allocWithZone(MEMORY[0x263F82B88]);
  v11 = self;
  id v12 = a4;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_init);

  if (a3)
  {
    v13 = (void *)sub_229419178();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  v16.receiver = v11;
  v16.super_class = ObjectType;
  v14 = [(OnboardingInfoViewController *)&v16 initWithNibName:v13 bundle:v12];

  return v14;
}

- (_TtC28HealthExposureNotificationUI28OnboardingInfoViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = OBJC_IVAR____TtC28HealthExposureNotificationUI28OnboardingInfoViewController_scrollView;
  id v7 = objc_allocWithZone(MEMORY[0x263F82B88]);
  id v8 = a3;
  uint64_t v9 = self;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_init);

  v12.receiver = v9;
  v12.super_class = ObjectType;
  id v10 = [(OnboardingInfoViewController *)&v12 initWithCoder:v8];

  return v10;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI28OnboardingInfoViewController_scrollView));
}

- (void)didTapDone
{
}

@end