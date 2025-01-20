@interface CAFUICollectionViewController
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (_TtC5CAFUI29CAFUICollectionViewController)initWithCoder:(id)a3;
- (_TtC5CAFUI29CAFUICollectionViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC5CAFUI29CAFUICollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CAFUICollectionViewController

- (_TtC5CAFUI29CAFUICollectionViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5CAFUI29CAFUICollectionViewController_emptyView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC5CAFUI29CAFUICollectionViewController_itemSize;
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  v4[16] = 1;
  v5 = (char *)self + OBJC_IVAR____TtC5CAFUI29CAFUICollectionViewController_collectionViewSize;
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  v6 = (char *)self + OBJC_IVAR____TtC5CAFUI29CAFUICollectionViewController_minimumInteritemSpacing;
  *(void *)v6 = 0;
  v6[8] = 1;
  id v7 = a3;

  result = (_TtC5CAFUI29CAFUICollectionViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  CAFUICollectionViewController.viewDidLoad()();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CAFUICollectionViewController();
  id v4 = v6.receiver;
  [(CAFUICollectionViewController *)&v6 viewWillDisappear:v3];
  id v5 = objc_msgSend(v4, sel_navigationItem, v6.receiver, v6.super_class);
  objc_msgSend(v5, sel_setRightBarButtonItem_, 0);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v4 = (char *)self + OBJC_IVAR____TtC5CAFUI29CAFUICollectionViewController_items;
  swift_beginAccess();
  return *(void *)(*(void *)v4 + 16);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)CAFUICollectionViewController.collectionView(_:cellForItemAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  unint64_t v12 = IndexPath.row.getter();
  v13 = (char *)v11 + OBJC_IVAR____TtC5CAFUI29CAFUICollectionViewController_items;
  BOOL result = swift_beginAccess();
  if ((v12 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v12 < *(void *)(*(void *)v13 + 16))
  {
    outlined init with copy of CAFUIImageRepresentableItemProtocol(*(void *)v13 + 40 * v12 + 32, (uint64_t)v18);
    uint64_t v15 = v19;
    uint64_t v16 = v20;
    __swift_project_boxed_opaque_existential_1(v18, v19);
    char v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 32))(v15, v16);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return v17 & 1;
  }
  __break(1u);
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  specialized CAFUICollectionViewController.collectionView(_:didSelectItemAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  if ((*((unsigned char *)&self->super.super.super._responderFlags
        + OBJC_IVAR____TtC5CAFUI29CAFUICollectionViewController_minimumInteritemSpacing) & 1) != 0)
  {
    double v5 = 45.0;
  }
  else
  {
    double v6 = *(double *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC5CAFUI29CAFUICollectionViewController_minimumInteritemSpacing);
    double v5 = 45.0;
    if (v6 > 45.0) {
      double v5 = trunc(v6);
    }
  }
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = v5;
  result.right = v9;
  result.bottom = v8;
  result.left = v5;
  result.top = v7;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  specialized CAFUICollectionViewController.calculateItemSizeAndInterItemSpacing(layout:)();
  char v17 = (double *)((char *)v14 + OBJC_IVAR____TtC5CAFUI29CAFUICollectionViewController_itemSize);
  if ((*((unsigned char *)&v14->super.super.super.__layeringSceneIdentity
        + OBJC_IVAR____TtC5CAFUI29CAFUICollectionViewController_itemSize) & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    double v19 = *v17;
    double v18 = v17[1];

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    double v15 = v19;
    double v16 = v18;
  }
  result.height = v16;
  result.width = v15;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  specialized CAFUICollectionViewController.calculateItemSizeAndInterItemSpacing(layout:)();
  if ((*((unsigned char *)&v9->super.super.super._responderFlags
        + OBJC_IVAR____TtC5CAFUI29CAFUICollectionViewController_minimumInteritemSpacing) & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    double v11 = *(double *)((char *)&v9->super.super.super.super.isa
                    + OBJC_IVAR____TtC5CAFUI29CAFUICollectionViewController_minimumInteritemSpacing);

    return v11;
  }
  return result;
}

- (_TtC5CAFUI29CAFUICollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  double result = (_TtC5CAFUI29CAFUICollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5CAFUI29CAFUICollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  double result = (_TtC5CAFUI29CAFUICollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC5CAFUI29CAFUICollectionViewController_emptyView);
}

@end