@interface WalkingSteadinessOnboardingStartViewController
- (_TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)cancelButtonTapped;
- (void)primaryFooterButtonTapped;
- (void)secondaryFooterButtonTapped;
- (void)viewDidLoad;
@end

@implementation WalkingSteadinessOnboardingStartViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1E0ADE7C8();
}

- (void)primaryFooterButtonTapped
{
  v3 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x1E4E3C5D0](v3))
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 8);
    v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (void)secondaryFooterButtonTapped
{
  v3 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x1E4E3C5D0](v3))
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 16);
    v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (void)cancelButtonTapped
{
  v3 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x1E4E3C5D0](v3))
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 24);
    v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (_TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC16HealthMobilityUI46WalkingSteadinessOnboardingStartViewController_delegate;
  sub_1E0ACD748((uint64_t)v3);
}

@end