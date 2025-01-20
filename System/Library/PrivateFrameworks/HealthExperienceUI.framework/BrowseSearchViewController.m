@interface BrowseSearchViewController
- (_TtC18HealthExperienceUI26BrowseSearchViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI26BrowseSearchViewController)initWithCollectionViewLayout:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)didPresentSearchController:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation BrowseSearchViewController

- (_TtC18HealthExperienceUI26BrowseSearchViewController)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController____lazy_storage___searchController) = 0;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI26BrowseSearchViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD60B850();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1AD60BB58(a3);
}

- (void)willDismissSearchController:(id)a3
{
  id v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x1B3E68580](v5))
  {
    uint64_t v6 = *((void *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 48);
    id v8 = a3;
    v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (void)willPresentSearchController:(id)a3
{
  id v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x1B3E68580](v5))
  {
    uint64_t v6 = *((void *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 40);
    id v8 = a3;
    v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (void)didPresentSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AD60D884(v4);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AD73A860();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73A7E0();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_1AD73A7C0();
  v13 = (objc_class *)type metadata accessor for BrowseSearchViewController();
  v18.receiver = v11;
  v18.super_class = v13;
  [(CompoundDataSourceCollectionViewController *)&v18 collectionView:v10 didSelectItemAtIndexPath:v12];

  v14 = (char *)v11 + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x1B3E68580](v14))
  {
    uint64_t v15 = *((void *)v14 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v15 + 56))(ObjectType, v15);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC18HealthExperienceUI26BrowseSearchViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI26BrowseSearchViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController_healthStore));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController_healthExperienceStore);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController_resultsBeforeHealthRecordsDataSource));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController_resultsAfterHealthRecordsDataSource));
  sub_1AD24D3D8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController_delegate);
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController____lazy_storage___searchController);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
  uint64_t v8 = v7;
  v9 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI26BrowseSearchViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x1B3E68580](v9))
  {
    uint64_t v10 = *((void *)v9 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 32);
    id v13 = a3;
    v14 = self;
    v12(v6, v8, ObjectType, v10);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

@end