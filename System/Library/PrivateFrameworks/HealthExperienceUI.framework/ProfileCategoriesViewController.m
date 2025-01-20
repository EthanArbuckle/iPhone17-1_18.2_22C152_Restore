@interface ProfileCategoriesViewController
- (_TtC18HealthExperienceUI31ProfileCategoriesViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI31ProfileCategoriesViewController)initWithCollectionViewLayout:(id)a3;
- (void)restoreUserActivityState:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation ProfileCategoriesViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ProfileCategoriesViewController();
  id v2 = v6.receiver;
  [(CompoundDataSourceCollectionViewController *)&v6 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_collectionView, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    id v5 = objc_msgSend(self, sel_systemGroupedBackgroundColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);

    sub_1AD41E5E0();
  }
  else
  {
    __break(1u);
  }
}

- (_TtC18HealthExperienceUI31ProfileCategoriesViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI31ProfileCategoriesViewController_navigationBarTitleView) = 0;

  result = (_TtC18HealthExperienceUI31ProfileCategoriesViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_1AD69543C((uint64_t)a3);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AD6956D8((uint64_t)v4);
}

- (void)restoreUserActivityState:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AD695D9C(v4);
}

- (_TtC18HealthExperienceUI31ProfileCategoriesViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI31ProfileCategoriesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31ProfileCategoriesViewController_providedHealthStore));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI31ProfileCategoriesViewController_providedHealthExperienceStore);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI31ProfileCategoriesViewController_pinnedContentManager);
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI31ProfileCategoriesViewController_navigationBarTitleView);
}

@end