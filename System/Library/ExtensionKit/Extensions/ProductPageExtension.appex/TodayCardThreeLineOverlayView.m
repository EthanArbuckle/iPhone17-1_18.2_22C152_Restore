@interface TodayCardThreeLineOverlayView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension29TodayCardThreeLineOverlayView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension29TodayCardThreeLineOverlayView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TodayCardThreeLineOverlayView

- (_TtC20ProductPageExtension29TodayCardThreeLineOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension29TodayCardThreeLineOverlayView *)sub_10002CC88(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension29TodayCardThreeLineOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10002DE74();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10002D3B8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_10002D780(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_10002D99C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29TodayCardThreeLineOverlayView_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29TodayCardThreeLineOverlayView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29TodayCardThreeLineOverlayView_descriptionLabel));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension29TodayCardThreeLineOverlayView_clickActionHandler);

  sub_1000194B0(v3);
}

@end