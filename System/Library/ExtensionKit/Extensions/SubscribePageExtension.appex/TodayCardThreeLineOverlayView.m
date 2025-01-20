@interface TodayCardThreeLineOverlayView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension29TodayCardThreeLineOverlayView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension29TodayCardThreeLineOverlayView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TodayCardThreeLineOverlayView

- (_TtC22SubscribePageExtension29TodayCardThreeLineOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension29TodayCardThreeLineOverlayView *)sub_10069EDD4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension29TodayCardThreeLineOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006A0154();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10069F504();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_10069F8CC(width);
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
  sub_10069FAE8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29TodayCardThreeLineOverlayView_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29TodayCardThreeLineOverlayView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29TodayCardThreeLineOverlayView_descriptionLabel));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension29TodayCardThreeLineOverlayView_clickActionHandler);

  sub_10001A4D0(v3);
}

@end