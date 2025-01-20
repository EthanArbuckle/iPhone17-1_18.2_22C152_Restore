@interface LockupPlaceholderView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC20ProductPageExtension21LockupPlaceholderView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension21LockupPlaceholderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LockupPlaceholderView

- (_TtC20ProductPageExtension21LockupPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension21LockupPlaceholderView *)sub_10015D884(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension21LockupPlaceholderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10015F074();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_10015DB4C(v18);
  sub_10000FA3C(v18, v18[3]);
  sub_100779100();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v18);
  swift_unknownObjectRelease();

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10015EB04();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21LockupPlaceholderView_iconPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21LockupPlaceholderView_headingPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21LockupPlaceholderView_titlePlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21LockupPlaceholderView_subtitlePlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21LockupPlaceholderView_offerButtonPlaceholder));
  id v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension21LockupPlaceholderView_contentType;
  uint64_t v4 = sub_100777C30();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end