@interface GuidedSearchTokenPaletteView
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (_TtC18ASMessagesProvider28GuidedSearchTokenPaletteView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider28GuidedSearchTokenPaletteView)initWithFrame:(CGRect)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation GuidedSearchTokenPaletteView

- (_TtC18ASMessagesProvider28GuidedSearchTokenPaletteView)initWithFrame:(CGRect)a3
{
  sub_1AA5FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC18ASMessagesProvider28GuidedSearchTokenPaletteView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AE404();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AB1A4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v4 = self;
  id v5 = [(GuidedSearchTokenPaletteView *)v4 traitCollection];

  double v6 = 50.0;
  double v7 = width;
  result.height = v6;
  result.CGFloat width = v7;
  return result;
}

- (void).cxx_destruct
{
  sub_13308(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC18ASMessagesProvider28GuidedSearchTokenPaletteView_onSelect));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider28GuidedSearchTokenPaletteView_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider28GuidedSearchTokenPaletteView_layout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider28GuidedSearchTokenPaletteView_maskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider28GuidedSearchTokenPaletteView_leadingGradientMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider28GuidedSearchTokenPaletteView_trailingGradientMask));
  swift_release();
  swift_release();
  swift_release();
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider28GuidedSearchTokenPaletteView_containerImpressionMetrics, (uint64_t *)&unk_951EB0);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_76C1E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  v10 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                       + OBJC_IVAR____TtC18ASMessagesProvider28GuidedSearchTokenPaletteView_onSelect);
  if (v10)
  {
    id v11 = a3;
    v12 = self;
    sub_13318((uint64_t)v10);
    uint64_t v13 = sub_76C140();
    v10(v13);
    sub_13308((uint64_t)v10);
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider28GuidedSearchTokenPaletteView_tokens))[2];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_76C1E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  id v10 = a3;
  id v11 = self;
  id v12 = sub_1AC4D0(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_76C1E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_1AC5FC((uint64_t)v34);
  sub_146D8((uint64_t)v34, (uint64_t)v35, &qword_95A500);
  uint64_t v15 = v36;
  if (v36)
  {
    uint64_t v16 = v35[0];
    uint64_t v17 = v35[1];
    uint64_t v18 = v35[2];
    id v33 = v13;
    uint64_t v19 = v8;
    char v20 = v37;
    [v12 bounds];
    double v22 = v21;
    double v24 = v23;
    v25 = (void *)sub_47832C(v16, v17, v18, v15, v12);
    uint64_t v26 = v20 & 1;
    uint64_t v8 = v19;
    double v27 = sub_478638(v25, v26, v12, v22, v24);
    double v29 = v28;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {

    double v27 = 0.0;
    double v29 = 0.0;
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v30 = v27;
  double v31 = v29;
  result.height = v31;
  result.CGFloat width = v30;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  uint64_t v7 = qword_94DA90;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_FD50((uint64_t *)&unk_95A4F0);
  sub_FDF4(v11, (uint64_t)qword_95A3E0);
  sub_76E3A0();

  double v12 = v16;
  double v13 = v17;
  double v14 = v18;
  double v15 = v19;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_76C1E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  id v12 = a3;
  id v13 = a4;
  double v14 = self;
  sub_1AE534(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1ACBA4(v4);
}

@end