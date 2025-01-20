@interface ProfileViewController
- (_TtC18HealthExperienceUI21ProfileViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI21ProfileViewController)initWithCollectionViewLayout:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)dismissProfile:(id)a3;
- (void)restoreUserActivityState:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ProfileViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (_TtC18HealthExperienceUI21ProfileViewController)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI21ProfileViewController_restorationRowToLoad;
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  v4[16] = -1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI21ProfileViewController_navigationBarTitleView) = 0;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI21ProfileViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD624700();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1AD624BC8(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AD624EC8((uint64_t)a3);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AD625164((uint64_t)v4);
}

- (void)dismissProfile:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  id v5 = (_TtC18HealthExperienceUI21ProfileViewController *)[(ProfileViewController *)v4 navigationController];
  if (v5)
  {
    v6 = v5;
    [(ProfileViewController *)v5 dismissViewControllerAnimated:1 completion:0];

    id v4 = v6;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v7);
}

- (_TtC18HealthExperienceUI21ProfileViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI21ProfileViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD626288(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI21ProfileViewController_restorationRowToLoad), *(void *)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI21ProfileViewController_restorationRowToLoad), *((unsigned char *)&self->super.super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC18HealthExperienceUI21ProfileViewController_restorationRowToLoad));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI21ProfileViewController_providedHealthStore));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI21ProfileViewController_pinnedContentManager);
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI21ProfileViewController_navigationBarTitleView);
}

- (void)restoreUserActivityState:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ProfileViewController.restoreUserActivityState(_:)((NSUserActivity)v4);
}

@end