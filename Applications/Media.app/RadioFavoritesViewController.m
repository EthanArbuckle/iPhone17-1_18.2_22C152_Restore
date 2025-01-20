@interface RadioFavoritesViewController
- (BOOL)collectionView:(id)a3 canEditItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (_TtC5Media28RadioFavoritesViewController)initWithCoder:(id)a3;
- (_TtC5Media28RadioFavoritesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)invalidate;
- (void)longPressGestureChangedWithGesture:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation RadioFavoritesViewController

- (_TtC5Media28RadioFavoritesViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100031EE0();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_10002D5A4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10002D814();
}

- (void)invalidate
{
  id v3 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_cancelSet);
  swift_beginAccess();
  *id v3 = &_swiftEmptySetSingleton;
  v4 = self;
  swift_bridgeObjectRelease();
  v5 = (Class *)((char *)&v4->super.super.super.isa
               + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_favoritesCancelSet);
  swift_beginAccess();
  void *v5 = &_swiftEmptySetSingleton;
  swift_bridgeObjectRelease();
  v6 = (Class *)((char *)&v4->super.super.super.isa
               + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_favoritesObserverSet);
  swift_beginAccess();
  void *v6 = &_swiftEmptySetSingleton;

  swift_bridgeObjectRelease();
}

- (void)longPressGestureChangedWithGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002F8E0(v4);
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  v13 = (char *)&v19 - v12;
  __chkstk_darwin(v11);
  v15 = (char *)&v19 - v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v10, v6);
  v16(v13, v6);
  v17.super.isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v16(v15, v6);

  return v17.super.isa;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  sub_100032068();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  if (*((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_isEditingFavorites)) {
    goto LABEL_5;
  }
  id v10 = a3;
  uint64_t v11 = self;
  uint64_t v12 = (void *)sub_10002EF84((uint64_t)v9);
  if (!v12)
  {

LABEL_5:
    char v15 = 0;
    goto LABEL_6;
  }
  v13 = v12;
  unsigned __int8 v14 = [v12 disabled];

  char v15 = v14 ^ 1;
LABEL_6:
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v15;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v17 - v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v14 = a3;
  char v15 = self;
  sub_10003219C((uint64_t)v13);

  v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v11, v7);
  v16(v13, v7);
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 16.0;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  uint64_t v7 = qword_1000AC708;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  if (v7 != -1) {
    swift_once();
  }
  unsigned long long v11 = xmmword_1000B1BD0;
  uint64_t v12 = qword_1000B1BE0;
  uint64_t v13 = qword_1000B1BE8;

  *(void *)&double v15 = v11 >> 64;
  *(void *)&double v14 = v11;
  double v16 = *(double *)&v12;
  double v17 = *(double *)&v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 12.0;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  double v10 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_itemSize);
  double v11 = *(double *)&self->carManager[OBJC_IVAR____TtC5Media28RadioFavoritesViewController_itemSize];
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  double v12 = v10;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 1;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v6 = (unint64_t *)((char *)self + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_favorites);
  swift_beginAccess();
  unint64_t v7 = *v6;
  if (!(v7 >> 62)) {
    return *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v10 = a3;
  double v11 = self;
  swift_bridgeObjectRetain();
  int64_t v8 = _CocoaArrayWrapper.endIndex.getter();

  swift_bridgeObjectRelease();
  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  double v11 = self;
  double v12 = (void *)sub_1000305E0(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (BOOL)collectionView:(id)a3 canEditItemAtIndexPath:(id)a4
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (_TtC5Media28RadioFavoritesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGSize result = (_TtC5Media28RadioFavoritesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_emptyLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media28RadioFavoritesViewController_longPressRecognizer));

  swift_release();
}

@end