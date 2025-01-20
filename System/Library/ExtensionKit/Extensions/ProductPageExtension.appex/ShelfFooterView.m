@interface ShelfFooterView
- (BOOL)_disableRasterizeInAnimations;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension15ShelfFooterView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension15ShelfFooterView)initWithFrame:(CGRect)a3;
- (void)didTapWithTitleButton:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ShelfFooterView

- (_TtC20ProductPageExtension15ShelfFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension15ShelfFooterView *)sub_10016FC24(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension15ShelfFooterView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100170E68();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_1001700C8(v11);
  sub_10000FA3C(v11, v11[3]);
  id v4 = [(ShelfFooterView *)v3 traitCollection];
  sub_100779F70();
  double v6 = v5;
  double v8 = v7;

  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v11);
  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(ShelfFooterView *)&v5 layoutSubviews];
  sub_1001700C8(v4);
  sub_10000FA3C(v4, v4[3]);
  sub_100770A80();
  id v3 = [v2 traitCollection];
  sub_100779F60();

  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v4);
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = (char *)v6.receiver;
  [(ShelfFooterView *)&v6 prepareForReuse];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension15ShelfFooterView_separator];
  sub_100019840(0, (unint64_t *)&qword_10094BD10);
  id v4 = (void *)sub_10077C8F0();
  objc_msgSend(v3, "setBackgroundColor:", v4, v6.receiver, v6.super_class);

  objc_super v5 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension15ShelfFooterView_titleButton];
  [v5 setHidden:0];
  [v5 setTitle:0 forState:0];
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)didTapWithTitleButton:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_100170554((uint64_t)v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension15ShelfFooterView_separator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension15ShelfFooterView_titleButton));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension15ShelfFooterView_footerAction);

  sub_1000194B0(v3);
}

@end