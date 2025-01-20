@interface PageFacetsViewController
- (_TtC18ASMessagesProvider24PageFacetsViewController)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider24PageFacetsViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC18ASMessagesProvider24PageFacetsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (uint64_t)collectionView:(void *)a3 shouldSelectItemAtIndexPath:;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PageFacetsViewController

- (_TtC18ASMessagesProvider24PageFacetsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_709224();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_702418();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_76C1E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  id v10 = a3;
  v11 = self;
  sub_705E90(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (uint64_t)collectionView:(void *)a3 shouldSelectItemAtIndexPath:
{
  uint64_t v5 = sub_76C1E0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  id v9 = a3;
  id v10 = a1;
  sub_70932C();
  LOBYTE(a1) = v11;

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return a1 & 1;
}

- (_TtC18ASMessagesProvider24PageFacetsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18ASMessagesProvider24PageFacetsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18ASMessagesProvider24PageFacetsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18ASMessagesProvider24PageFacetsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_174B8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider24PageFacetsViewController_delegate);
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider24PageFacetsViewController_pageFacets, &qword_959390);
  swift_bridgeObjectRelease();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider24PageFacetsViewController_diffableDataSource);
}

@end