@interface MenuBar
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (_TtC13FTMInternal_47MenuBar)initWithCoder:(id)a3;
- (_TtC13FTMInternal_47MenuBar)initWithFrame:(CGRect)a3;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
@end

@implementation MenuBar

- (_TtC13FTMInternal_47MenuBar)initWithFrame:(CGRect)a3
{
  return (_TtC13FTMInternal_47MenuBar *)sub_1001C144C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13FTMInternal_47MenuBar)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001C2298();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10015E120((uint64_t)self + OBJC_IVAR____TtC13FTMInternal_47MenuBar_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_47MenuBar____lazy_storage___collectionView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13FTMInternal_47MenuBar_horizontalBarLeftAnchorConstraint);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC13FTMInternal_47MenuBar_numberOfSegments);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_1001C1674(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_1001C23AC((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  [(MenuBar *)v14 frame];
  CGFloat v15 = CGRectGetWidth(v21)
      / *(double *)((char *)&v14->super.super.super.isa + OBJC_IVAR____TtC13FTMInternal_47MenuBar_segmentWidthMultiplier);
  [(MenuBar *)v14 frame];
  CGFloat Height = CGRectGetHeight(v22);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v17 = v15;
  double v18 = Height;
  result.height = v18;
  result.width = v17;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

@end