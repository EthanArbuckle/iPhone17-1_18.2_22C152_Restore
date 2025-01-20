@interface PageFacetsViewController
- (_TtC22SubscribePageExtension24PageFacetsViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension24PageFacetsViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC22SubscribePageExtension24PageFacetsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (uint64_t)collectionView:(void *)a3 shouldSelectItemAtIndexPath:;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PageFacetsViewController

- (_TtC22SubscribePageExtension24PageFacetsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003E7B18();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1003E0CAC();
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
  sub_1003E4724(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (uint64_t)collectionView:(void *)a3 shouldSelectItemAtIndexPath:
{
  uint64_t v5 = sub_100756440();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v10 = a3;
  id v11 = a1;
  sub_1003E7C20();
  LOBYTE(a1) = v12;

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return a1 & 1;
}

- (_TtC22SubscribePageExtension24PageFacetsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC22SubscribePageExtension24PageFacetsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension24PageFacetsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC22SubscribePageExtension24PageFacetsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_10000FB1C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension24PageFacetsViewController_delegate);
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension24PageFacetsViewController_pageFacets, &qword_100943E70);
  swift_bridgeObjectRelease();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension24PageFacetsViewController_diffableDataSource);
}

@end