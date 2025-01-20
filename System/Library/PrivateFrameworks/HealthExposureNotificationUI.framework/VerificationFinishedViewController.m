@interface VerificationFinishedViewController
- (_TtC28HealthExposureNotificationUI34VerificationFinishedViewController)initWithRegionDisplayName:(id)a3;
- (_TtC28HealthExposureNotificationUI34VerificationFinishedViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC28HealthExposureNotificationUI34VerificationFinishedViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapPrimaryButton;
- (void)viewDidLoad;
@end

@implementation VerificationFinishedViewController

- (_TtC28HealthExposureNotificationUI34VerificationFinishedViewController)initWithRegionDisplayName:(id)a3
{
  if (a3)
  {
    uint64_t v3 = sub_2294191A8();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC28HealthExposureNotificationUI34VerificationFinishedViewController *)VerificationFinishedViewController.init(regionDisplayName:)(v3, v4);
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(OBBaseWelcomeController *)&v4 viewDidLoad];
  sub_2293EA418();
  id v3 = objc_msgSend(v2, sel_navigationItem, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setHidesBackButton_, 1);
}

- (void)didTapPrimaryButton
{
  if (*(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI34VerificationFinishedViewController_flow))
  {
    uint64_t v3 = *(void *)((char *)&self->super.super.super.super._responderFlags
                   + OBJC_IVAR____TtC28HealthExposureNotificationUI34VerificationFinishedViewController_flow);
    uint64_t ObjectType = swift_getObjectType();
    v5 = *(void (**)(_TtC28HealthExposureNotificationUI34VerificationFinishedViewController *, _UNKNOWN **, uint64_t, uint64_t))(v3 + 120);
    v6 = self;
    swift_unknownObjectRetain();
    v5(v6, &protocol witness table for VerificationFinishedViewController, ObjectType, v3);

    swift_unknownObjectRelease();
  }
  else
  {
    [(VerificationFinishedViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (_TtC28HealthExposureNotificationUI34VerificationFinishedViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC28HealthExposureNotificationUI34VerificationFinishedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI34VerificationFinishedViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC28HealthExposureNotificationUI34VerificationFinishedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI34VerificationFinishedViewController_primaryButton);
}

@end