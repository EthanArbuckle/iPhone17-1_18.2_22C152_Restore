@interface PageFacetsViewController
- (_TtC20ProductPageExtension24PageFacetsViewController)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension24PageFacetsViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC20ProductPageExtension24PageFacetsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (uint64_t)collectionView:(void *)a3 shouldSelectItemAtIndexPath:;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PageFacetsViewController

- (_TtC20ProductPageExtension24PageFacetsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10067E25C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1006773A8();
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
  sub_10067AE20(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (uint64_t)collectionView:(void *)a3 shouldSelectItemAtIndexPath:
{
  uint64_t v5 = sub_10076A5F0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076A530();
  id v9 = a3;
  id v10 = a1;
  sub_10067E364();
  LOBYTE(a1) = v11;

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return a1 & 1;
}

- (_TtC20ProductPageExtension24PageFacetsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC20ProductPageExtension24PageFacetsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC20ProductPageExtension24PageFacetsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC20ProductPageExtension24PageFacetsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_10000F76C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension24PageFacetsViewController_delegate);
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension24PageFacetsViewController_pageFacets, &qword_10096F3B0);
  swift_bridgeObjectRelease();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension24PageFacetsViewController_diffableDataSource);
}

@end