@interface EditFavoritesCollectionViewController
- (_TtC18HealthExperienceUI37EditFavoritesCollectionViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI37EditFavoritesCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (void)doneButtonTapped;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
@end

@implementation EditFavoritesCollectionViewController

- (_TtC18HealthExperienceUI37EditFavoritesCollectionViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI37EditFavoritesCollectionViewController____lazy_storage___searchController) = 0;
  id v4 = a3;

  result = (_TtC18HealthExperienceUI37EditFavoritesCollectionViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD3717E4();
}

- (void)doneButtonTapped
{
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AD371B90(v4);
}

- (_TtC18HealthExperienceUI37EditFavoritesCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI37EditFavoritesCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI37EditFavoritesCollectionViewController____lazy_storage___searchController));
  swift_release();
  swift_release();
}

@end