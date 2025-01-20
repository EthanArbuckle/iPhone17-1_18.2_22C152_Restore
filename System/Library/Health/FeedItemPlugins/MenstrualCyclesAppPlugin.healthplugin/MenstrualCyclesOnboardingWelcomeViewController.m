@interface MenstrualCyclesOnboardingWelcomeViewController
- (_TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)cancelButtonTapped:(id)a3;
- (void)nextButtonTapped:(id)a3;
- (void)viewDidLoad;
@end

@implementation MenstrualCyclesOnboardingWelcomeViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2413CE280();
}

- (void)nextButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_241632CE8();
  swift_unknownObjectRelease();
  sub_2413CF2E4();

  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)&v5);
}

- (void)cancelButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_241632CE8();
  swift_unknownObjectRelease();
  uint64_t v5 = (char *)v4 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController_delegate;
  if (MEMORY[0x245621790]((char *)v4+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController_delegate))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(_TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController *, uint64_t, uint64_t))(v6 + 16))(v4, ObjectType, v6);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)&v8);
}

- (_TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2411CD138((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController_analysis));
  v3 = (char *)self
     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController_securityVariant;
  uint64_t v4 = sub_24162CA88();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController_pinnedContentManager);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController____lazy_storage___reviewCycleFactorsViewController));
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingWelcomeViewController____lazy_storage___ongoingCycleFactorsViewController);
}

@end