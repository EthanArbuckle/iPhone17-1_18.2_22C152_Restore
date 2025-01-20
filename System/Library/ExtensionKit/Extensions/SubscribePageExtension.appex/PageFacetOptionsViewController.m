@interface PageFacetOptionsViewController
- (_TtC22SubscribePageExtension30PageFacetOptionsViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension30PageFacetOptionsViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC22SubscribePageExtension30PageFacetOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PageFacetOptionsViewController

- (_TtC22SubscribePageExtension30PageFacetOptionsViewController)initWithCoder:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC22SubscribePageExtension30PageFacetOptionsViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension30PageFacetOptionsViewController_diffableDataSource) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension30PageFacetOptionsViewController_preselectionContentOffset;
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  id v6 = a3;

  result = (_TtC22SubscribePageExtension30PageFacetOptionsViewController *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100229324();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v11 = a3;
  v12 = self;
  sub_10022A034(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (_TtC22SubscribePageExtension30PageFacetOptionsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC22SubscribePageExtension30PageFacetOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension30PageFacetOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22SubscribePageExtension30PageFacetOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000FB1C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension30PageFacetOptionsViewController_delegate);
  swift_release();
  id v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension30PageFacetOptionsViewController_facet;
  uint64_t v4 = sub_100757F20();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension30PageFacetOptionsViewController_diffableDataSource);
}

@end