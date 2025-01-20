@interface BrowseViewController
- (_TtC18HealthExperienceUI20BrowseViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI20BrowseViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)restoreUserActivityState:(id)a3;
- (void)updateStateForTraitCollection;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation BrowseViewController

- (_TtC18HealthExperienceUI20BrowseViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD3B6D28();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD3B0B48();
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4 = self;
  sub_1AD3B1234(a3);
}

- (void)updateStateForTraitCollection
{
  v2 = self;
  sub_1AD3B157C();
}

- (_TtC18HealthExperienceUI20BrowseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18HealthExperienceUI20BrowseViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI20BrowseViewController_activeSearchController));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI20BrowseViewController____lazy_storage___browseCategoriesViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI20BrowseViewController____lazy_storage___browseSearchViewController));
  sub_1AD3B8A1C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI20BrowseViewController_state, type metadata accessor for BrowseViewController.State);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI20BrowseViewController_healthStore));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI20BrowseViewController_experienceStore);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI20BrowseViewController_pinnedContentManager);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI20BrowseViewController____lazy_storage___profileBarButton));
  sub_1AD3B8A1C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI20BrowseViewController_sidebarEmptySearchState, type metadata accessor for BrowseViewController.State);
  sub_1AD3B8A1C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI20BrowseViewController_categoriesEmptySearchState, type metadata accessor for BrowseViewController.State);
}

- (void)restoreUserActivityState:(id)a3
{
  id v4 = a3;
  v5 = self;
  BrowseViewController.restoreUserActivityState(_:)((NSUserActivity)v4);
}

@end