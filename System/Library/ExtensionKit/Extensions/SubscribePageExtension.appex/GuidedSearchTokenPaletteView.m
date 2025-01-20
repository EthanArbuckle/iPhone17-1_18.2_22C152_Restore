@interface GuidedSearchTokenPaletteView
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (_TtC22SubscribePageExtension28GuidedSearchTokenPaletteView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension28GuidedSearchTokenPaletteView)initWithFrame:(CGRect)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation GuidedSearchTokenPaletteView

- (_TtC22SubscribePageExtension28GuidedSearchTokenPaletteView)initWithFrame:(CGRect)a3
{
  sub_100672990(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC22SubscribePageExtension28GuidedSearchTokenPaletteView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100676548();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100673538();
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
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension28GuidedSearchTokenPaletteView_onSelect));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28GuidedSearchTokenPaletteView_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28GuidedSearchTokenPaletteView_layout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28GuidedSearchTokenPaletteView_maskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28GuidedSearchTokenPaletteView_leadingGradientMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28GuidedSearchTokenPaletteView_trailingGradientMask));
  swift_release();
  swift_release();
  swift_release();
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension28GuidedSearchTokenPaletteView_containerImpressionMetrics, (uint64_t *)&unk_1009369D0);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  v11 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                       + OBJC_IVAR____TtC22SubscribePageExtension28GuidedSearchTokenPaletteView_onSelect);
  if (v11)
  {
    id v12 = a3;
    v13 = self;
    sub_10001A4E0((uint64_t)v11);
    uint64_t v14 = sub_1007563A0();
    v11(v14);
    sub_10001A4D0((uint64_t)v11);
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28GuidedSearchTokenPaletteView_tokens))[2];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v11 = a3;
  id v12 = self;
  id v13 = sub_1006744EC(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);

  return v13;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_100756440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  id v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = self;
  sub_100674618((uint64_t)v33);
  sub_100078C78((uint64_t)v33, (uint64_t)v34, &qword_100956278);
  if (v34[3])
  {
    uint64_t v16 = v34[0];
    uint64_t v17 = v34[1];
    id v32 = v14;
    uint64_t v18 = v8;
    char v19 = v35;
    [v13 bounds];
    double v21 = v20;
    double v23 = v22;
    id v24 = sub_100675058(v16, v17);
    uint64_t v25 = v19 & 1;
    uint64_t v8 = v18;
    double v26 = sub_1006DD020(v24, v25, v13, v21, v23);
    double v28 = v27;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {

    double v26 = 0.0;
    double v28 = 0.0;
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  double v29 = v26;
  double v30 = v28;
  result.height = v30;
  result.CGFloat width = v29;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  uint64_t v7 = qword_100932388;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_10000FB44(&qword_100950868);
  sub_10001076C(v11, (uint64_t)qword_1009561B0);
  sub_100758400();

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
  uint64_t v8 = sub_100756440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  double v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v13 = a3;
  id v14 = a4;
  double v15 = self;
  sub_100676678(v14);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100674BC0(v4);
}

@end