@interface SearchHintsCollectionViewDelegate
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (_TtC22SubscribePageExtension33SearchHintsCollectionViewDelegate)init;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation SearchHintsCollectionViewDelegate

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  double v10 = sub_100525320();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_100756440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  double v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v13 = a3;
  id v14 = a4;
  double v15 = self;
  sub_10052566C(v14);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)scrollViewDidScroll:(id)a3
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension33SearchHintsCollectionViewDelegate_impressionsCalculator))
  {
    id v4 = a3;
    v5 = self;
    swift_retain();
    [v4 bounds];
    sub_10075E290();

    swift_release();
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_100756440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  double v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v13 = a3;
  id v14 = a4;
  double v15 = self;
  sub_100525A0C();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v11 = a3;
  double v12 = self;
  sub_1007563C0();
  sub_10075DBD0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_100756440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  double v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v13 = a3;
  id v14 = a4;
  double v15 = self;
  double v16 = sub_100525F20(v13);
  double v18 = v17;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  double v19 = v16;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (_TtC22SubscribePageExtension33SearchHintsCollectionViewDelegate)init
{
  CGSize result = (_TtC22SubscribePageExtension33SearchHintsCollectionViewDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();

  swift_release();
}

@end