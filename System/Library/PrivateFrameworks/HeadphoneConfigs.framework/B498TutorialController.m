@interface B498TutorialController
- (_TtC16HeadphoneConfigs22B498TutorialController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC16HeadphoneConfigs22B498TutorialController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation B498TutorialController

- (void)viewDidLoad
{
  v2 = self;
  sub_1E4C8EFFC();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1E4C8F4BC();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1E4C8F5F0(a3);
}

- (_TtC16HeadphoneConfigs22B498TutorialController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC16HeadphoneConfigs22B498TutorialController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16HeadphoneConfigs22B498TutorialController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC16HeadphoneConfigs22B498TutorialController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType;
  sub_1E4C92AE0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType), *((void *)v3 + 1), *((void *)v3 + 2), *((void *)v3 + 3), *((void *)v3 + 4), *((void *)v3 + 5), *((void **)v3 + 6), *((void *)v3 + 7), v3[64]);
  sub_1E4C92C2C(*(id *)((char *)&self->super.super.super.super.super.isa
                      + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController____lazy_storage___player));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController____lazy_storage___continueButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_contentHeightConstraint));
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_micaView);
}

@end