@interface SearchResultsCollectionViewDelegate
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (_TtC20ProductPageExtension35SearchResultsCollectionViewDelegate)init;
- (id)_collectionView:(id)a3 layout:(id)a4 flowLayoutRowAlignmentOptionsForSection:(int64_t)a5;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
@end

@implementation SearchResultsCollectionViewDelegate

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_10076A5F0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076A530();
  id v10 = a3;
  v11 = self;
  sub_1007732D0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9 = sub_10076A5F0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10077BCB0();
  uint64_t v15 = v14;
  sub_10076A530();
  id v16 = a3;
  id v17 = a4;
  v18 = self;
  sub_1004E5BD0(v17, v13, v15);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9 = sub_10076A5F0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10077BCB0();
  uint64_t v15 = v14;
  sub_10076A530();
  type metadata accessor for SearchTransparencyView();
  id v16 = a3;
  id v17 = a4;
  v18 = self;
  if (v13 == sub_10077C5C0() && v15 == v19)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v20 = sub_10077D230();
    swift_bridgeObjectRelease();
    if ((v20 & 1) == 0)
    {
LABEL_7:

      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
  }
  uint64_t v21 = sub_1007732E0();
  if (!v21) {
    goto LABEL_7;
  }
  sub_1004E0E24(v21, (uint64_t)v18);

  swift_bridgeObjectRelease();
  swift_release();
LABEL_8:

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
}

- (void)scrollViewDidScroll:(id)a3
{
}

- (_TtC20ProductPageExtension35SearchResultsCollectionViewDelegate)init
{
  result = (_TtC20ProductPageExtension35SearchResultsCollectionViewDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10000FA80((uint64_t)self+ OBJC_IVAR____TtC20ProductPageExtension35SearchResultsCollectionViewDelegate_containerImpressionMetrics, (uint64_t *)&unk_100956270);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35SearchResultsCollectionViewDelegate_videoPlaybackCoordinator));
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC20ProductPageExtension35SearchResultsCollectionViewDelegate_compoundScrollObserver);
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  double v10 = sub_1007264EC(v7);
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

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_10076A5F0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  double v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076A530();
  id v12 = a3;
  id v13 = a4;
  double v14 = self;
  double v15 = sub_100726794(v13, (uint64_t)v11);
  double v17 = v16;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v18 = v15;
  double v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (id)_collectionView:(id)a3 layout:(id)a4 flowLayoutRowAlignmentOptionsForSection:(int64_t)a5
{
  if (sub_100726904())
  {
    v5.super.isa = sub_10077BB30().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v5.super.isa = 0;
  }

  return v5.super.isa;
}

@end