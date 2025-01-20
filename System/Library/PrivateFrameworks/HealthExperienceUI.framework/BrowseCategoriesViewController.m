@interface BrowseCategoriesViewController
- (_TtC18HealthExperienceUI30BrowseCategoriesViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI30BrowseCategoriesViewController)initWithCollectionViewLayout:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BrowseCategoriesViewController

- (_TtC18HealthExperienceUI30BrowseCategoriesViewController)initWithCoder:(id)a3
{
  result = (_TtC18HealthExperienceUI30BrowseCategoriesViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD3759DC();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1AD375C00(a3);
}

- (_TtC18HealthExperienceUI30BrowseCategoriesViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI30BrowseCategoriesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI30BrowseCategoriesViewController_healthStore));
  id v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI30BrowseCategoriesViewController_experienceStore;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end