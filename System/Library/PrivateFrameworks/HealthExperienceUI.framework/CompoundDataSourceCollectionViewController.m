@interface CompoundDataSourceCollectionViewController
- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (_TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)observedTraitsDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation CompoundDataSourceCollectionViewController

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CompoundDataSourceCollectionViewController();
  v4 = v6.receiver;
  id v5 = [(CompoundDataSourceCollectionViewController *)&v6 viewDidAppear:v3];
  (*(void (**)(id))((*MEMORY[0x1E4FBC8C8] & *v4) + 0xE8))(v5);
}

- (_TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v4 = a3;
  return (_TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController *)CompoundDataSourceCollectionViewController.init(collectionViewLayout:)(a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  id v4 = self;
  sub_1AD1B3998(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD1C9F14();
}

- (_TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController *)CompoundDataSourceCollectionViewController.init(coder:)(a3);
}

- (void)observedTraitsDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  swift_unknownObjectRetain();
  id v7 = a4;
  v8 = self;
  sub_1AD1BA2A4(a3, (uint64_t)v7);
  swift_unknownObjectRelease();
}

- (_TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD206D18((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI42CompoundDataSourceCollectionViewController_dataSourceProvider, (unint64_t *)&qword_1EB73F5D0, &qword_1EB73F5C8);
  swift_release();
  swift_release();
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_1AD4086EC(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(id, char *))CompoundDataSourceCollectionViewController.collectionView(_:shouldSelectItemAt:));
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return sub_1AD4086EC(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(id, char *))CompoundDataSourceCollectionViewController.collectionView(_:shouldHighlightItemAt:));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AD73A860();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (void (*)(char *, uint64_t, uint64_t))((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1AD73A7E0();
  id v10 = a3;
  v11 = self;
  CompoundDataSourceCollectionViewController.collectionView(_:didSelectItemAt:)(v10, v9);

  (*(void (**)(void (*)(char *, uint64_t, uint64_t), uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7 = sub_1AD73A860();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD73A7E0();
  id v11 = a3;
  uint64_t v12 = self;
  v13 = (void *)_s18HealthExperienceUI42CompoundDataSourceCollectionViewControllerC010collectionH0_33contextMenuConfigurationForItemAt5pointSo09UIContextlM0CSgSo012UICollectionH0C_10Foundation9IndexPathVSo7CGPointVtF_0(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  return sub_1AD4086EC(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(id, char *))CompoundDataSourceCollectionViewController.collectionView(_:selectionFollowsFocusForItemAt:));
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  v29 = self;
  uint64_t v7 = sub_1AD73A860();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  id v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x1F4188790](v9);
  v14 = (char *)&v28 - v13;
  uint64_t v15 = MEMORY[0x1F4188790](v12);
  v17 = (char *)&v28 - v16;
  MEMORY[0x1F4188790](v15);
  v19 = (char *)&v28 - v18;
  sub_1AD73A7E0();
  sub_1AD73A7E0();
  sub_1AD73A7E0();
  id v20 = a3;
  v21 = v29;
  uint64_t v22 = *(void *)sub_1AD219708();
  char v23 = (*(uint64_t (**)(char *, char *))(v22 + 368))(v17, v11);
  swift_release();
  if (v23) {
    v24 = v11;
  }
  else {
    v24 = v17;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v19, v24, v7);

  v25 = *(void (**)(char *, uint64_t))(v8 + 8);
  v25(v11, v7);
  v25(v14, v7);
  v25(v17, v7);
  v26 = (void *)sub_1AD73A7C0();
  v25(v19, v7);
  return v26;
}

@end