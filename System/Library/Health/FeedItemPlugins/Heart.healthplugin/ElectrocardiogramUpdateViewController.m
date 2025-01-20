@interface ElectrocardiogramUpdateViewController
- (NSString)title;
- (_TtC5Heart37ElectrocardiogramUpdateViewController)initWithCoder:(id)a3;
- (_TtC5Heart37ElectrocardiogramUpdateViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didCompleteOnboarding;
- (void)didDismissOnboarding;
- (void)viewDidLoad;
@end

@implementation ElectrocardiogramUpdateViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_240BA7CFC();
}

- (NSString)title
{
  uint64_t v2 = qword_26AFDA090;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  sub_240BB2980();

  v4 = (void *)sub_240BB6DA0();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (_TtC5Heart37ElectrocardiogramUpdateViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_240BB6DE0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC5Heart37ElectrocardiogramUpdateViewController *)sub_240BA9178(v5, v7, a4);
}

- (_TtC5Heart37ElectrocardiogramUpdateViewController)initWithCoder:(id)a3
{
  return (_TtC5Heart37ElectrocardiogramUpdateViewController *)sub_240BA9350(a3);
}

- (void).cxx_destruct
{
  sub_240BA9E9C((uint64_t)self + OBJC_IVAR____TtC5Heart37ElectrocardiogramUpdateViewController_context, (uint64_t (*)(void))sub_240B89E0C);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart37ElectrocardiogramUpdateViewController_onboardingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart37ElectrocardiogramUpdateViewController____lazy_storage___tileView));
  v3 = (char *)self + OBJC_IVAR____TtC5Heart37ElectrocardiogramUpdateViewController_detail;
  uint64_t v4 = sub_240BB43B0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC5Heart37ElectrocardiogramUpdateViewController_deselectionBehavior;
  uint64_t v6 = sub_240BB46D0();
  uint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (void)didDismissOnboarding
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart37ElectrocardiogramUpdateViewController_onboardingManager) = 0;
  MEMORY[0x270F9A758]();
}

- (void)didCompleteOnboarding
{
  uint64_t v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Heart37ElectrocardiogramUpdateViewController_onboardingManager);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart37ElectrocardiogramUpdateViewController_onboardingManager) = 0;
  v9 = self;

  v3 = (_TtC5Heart37ElectrocardiogramUpdateViewController *)[(ElectrocardiogramUpdateViewController *)v9 tabBarController];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = (_TtC5Heart37ElectrocardiogramUpdateViewController *)sub_240BA88F8();
    if (v5)
    {
      uint64_t v6 = v5;
      sub_240AA7788(v5, 0);

      uint64_t v7 = v4;
      uint64_t v4 = v6;
    }
    else
    {
      uint64_t v7 = v9;
    }

    id v8 = v4;
  }
  else
  {
    id v8 = v9;
  }
}

@end