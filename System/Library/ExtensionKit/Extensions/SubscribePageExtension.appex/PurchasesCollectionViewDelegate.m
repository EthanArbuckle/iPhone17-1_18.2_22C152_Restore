@interface PurchasesCollectionViewDelegate
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (_TtC22SubscribePageExtension31PurchasesCollectionViewDelegate)init;
- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForHeaderInSection:(int64_t)a5;
- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForRowAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 tableLayout:(id)a4 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation PurchasesCollectionViewDelegate

- (void)scrollViewDidScroll:(id)a3
{
  v3 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtC22SubscribePageExtension31PurchasesCollectionViewDelegate_didScrollHandler);
  if (v3)
  {
    id v5 = a3;
    v6 = self;
    sub_10001A4E0((uint64_t)v3);
    v3(v5);
    sub_10001A4D0((uint64_t)v3);
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_100756440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v13 = a3;
  v14 = (char *)a4;
  v15 = self;
  sub_10009CB24(v13, v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_100756440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  uint64_t v13 = *(uint64_t *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC22SubscribePageExtension31PurchasesCollectionViewDelegate_artworkLoader);
  uint64_t v14 = *(uint64_t *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC22SubscribePageExtension31PurchasesCollectionViewDelegate_objectGraph);
  id v15 = a3;
  id v16 = a4;
  v17 = self;
  sub_1003FCF78(v16, (uint64_t)v12, v13, v14);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  uint64_t v11 = (_TtC22SubscribePageExtension31PurchasesCollectionViewDelegate *)a3;
  v12 = self;
  Class isa = sub_100756340().super.isa;
  uint64_t v14 = (_TtC22SubscribePageExtension31PurchasesCollectionViewDelegate *)[(PurchasesCollectionViewDelegate *)v11 cellForItemAtIndexPath:isa];

  if (v14)
  {
    swift_getObjectType();
    if (swift_conformsToProtocol2()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    BOOL v16 = v15 == 0;

    uint64_t v11 = v12;
    v12 = v14;
  }
  else
  {
    BOOL v16 = 0;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v16;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (objc_class *)((char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100756380();
  uint64_t v11 = *(uint64_t *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC22SubscribePageExtension31PurchasesCollectionViewDelegate_objectGraph);
  id v12 = a3;
  uint64_t v13 = self;
  sub_10009D8CC(v10, (uint64_t)v10, v11, v12);

  (*(void (**)(objc_class *, uint64_t))(v7 + 8))(v10, v6);
}

- (_TtC22SubscribePageExtension31PurchasesCollectionViewDelegate)init
{
  result = (_TtC22SubscribePageExtension31PurchasesCollectionViewDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension31PurchasesCollectionViewDelegate_didScrollHandler);

  sub_10001A4D0(v3);
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForHeaderInSection:(int64_t)a5
{
  uint64_t v8 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension31PurchasesCollectionViewDelegate_pageTraits);
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  swift_unknownObjectRetain();
  sub_1003FAFB8(a5, v8, v9);
  double v13 = v12;

  swift_unknownObjectRelease();
  return v13;
}

- (double)collectionView:(id)a3 tableLayout:(id)a4 heightForRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_100756440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  double v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  uint64_t v13 = *(uint64_t *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC22SubscribePageExtension31PurchasesCollectionViewDelegate_objectGraph);
  uint64_t v14 = *(Class *)((char *)&self->super.isa
                 + OBJC_IVAR____TtC22SubscribePageExtension31PurchasesCollectionViewDelegate_pageTraits);
  id v15 = a3;
  id v16 = a4;
  v17 = self;
  swift_unknownObjectRetain();
  sub_1003F5F20((uint64_t)v12, v13, v14, v15);
  double v19 = v18;

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  return v19;
}

- (id)collectionView:(id)a3 tableLayout:(id)a4 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_100756440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  double v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v13 = a3;
  id v14 = a4;
  id v15 = self;
  id v16 = sub_10009DE78((uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);

  return v16;
}

@end