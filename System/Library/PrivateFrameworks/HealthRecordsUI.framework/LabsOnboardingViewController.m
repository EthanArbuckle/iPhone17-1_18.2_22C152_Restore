@interface LabsOnboardingViewController
- (_TtC15HealthRecordsUI28LabsOnboardingViewController)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI28LabsOnboardingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)viewDidLoad;
@end

@implementation LabsOnboardingViewController

- (_TtC15HealthRecordsUI28LabsOnboardingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for LabsOnboardingViewController());
  v5 = (_TtC15HealthRecordsUI28LabsOnboardingViewController *)sub_1C241E294(0, 0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (_TtC15HealthRecordsUI28LabsOnboardingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _s15HealthRecordsUI28LabsOnboardingViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C241CB84();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1C21AB51C(0, &qword_1EA2E3430);
  sub_1C241E62C();
  sub_1C254F8F0();
  id v6 = a4;
  v7 = self;
  v8 = (void *)sub_1C254F8E0();
  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for LabsOnboardingViewController();
  [(LabsOnboardingViewController *)&v10 touchesCancelled:v8 withEvent:v6];

  if (*((unsigned char *)&v7->super.super.super.isa
       + OBJC_IVAR____TtC15HealthRecordsUI28LabsOnboardingViewController_isPresentingInPopover) == 1)
  {
    id v9 = sub_1C241C7E0();
    objc_msgSend(v9, sel_setTextColor_, *(Class *)((char *)&v7->super.super.super.isa+ OBJC_IVAR____TtC15HealthRecordsUI28LabsOnboardingViewController_accessoryColor));

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
}

- (void).cxx_destruct
{
  sub_1C241EB5C((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI28LabsOnboardingViewController_context);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28LabsOnboardingViewController_providedHealthStore));
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC15HealthRecordsUI28LabsOnboardingViewController_headerType;
  uint64_t v4 = sub_1C254D380();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28LabsOnboardingViewController____lazy_storage___tipsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI28LabsOnboardingViewController____lazy_storage___accessoryLabel));
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI28LabsOnboardingViewController_accessoryColor);
}

@end