@interface SharedProfileOverviewViewController
- (_TtC18HealthExperienceUI35SharedProfileOverviewViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI35SharedProfileOverviewViewController)initWithCollectionViewLayout:(id)a3;
- (void)backButtonTapped:(id)a3;
- (void)optionsButtonTapped:(id)a3;
- (void)restoreUserActivityState:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)ttrButtonTapped;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SharedProfileOverviewViewController

- (_TtC18HealthExperienceUI35SharedProfileOverviewViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD491C1C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD48F4BC();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1AD48F85C();
}

- (void)backButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  v5 = (_TtC18HealthExperienceUI35SharedProfileOverviewViewController *)[(SharedProfileOverviewViewController *)v4 navigationController];
  if (v5)
  {
    v6 = v5;
    id v7 = [(SharedProfileOverviewViewController *)v5 popViewControllerAnimated:1];

    v4 = v6;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v8);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AD48FAB8((uint64_t)a3);
}

- (void)scrollViewDidScroll:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SharedProfileOverviewViewController();
  id v4 = a3;
  id v5 = v6.receiver;
  [(CompoundDataSourceCollectionViewController *)&v6 scrollViewDidScroll:v4];
  sub_1AD422468();
}

- (void)restoreUserActivityState:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AD49024C(v4);
}

- (_TtC18HealthExperienceUI35SharedProfileOverviewViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI35SharedProfileOverviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35SharedProfileOverviewViewController_providedHealthStore));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUI35SharedProfileOverviewViewController_providedHealthExperienceStore);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI35SharedProfileOverviewViewController_pinnedContentManager);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35SharedProfileOverviewViewController_navigationBarTitleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35SharedProfileOverviewViewController_gradientView));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI35SharedProfileOverviewViewController_gradientColorProvider);
}

- (void)optionsButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  sub_1AD490F94();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)ttrButtonTapped
{
  v2 = self;
  SharedProfileOverviewViewController.ttrButtonTapped()();
}

@end