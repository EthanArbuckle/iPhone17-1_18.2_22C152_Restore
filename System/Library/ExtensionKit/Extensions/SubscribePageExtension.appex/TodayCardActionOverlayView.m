@interface TodayCardActionOverlayView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension26TodayCardActionOverlayView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension26TodayCardActionOverlayView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TodayCardActionOverlayView

- (_TtC22SubscribePageExtension26TodayCardActionOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension26TodayCardActionOverlayView *)sub_10008EA08(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension26TodayCardActionOverlayView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension26TodayCardActionOverlayView_accessoryView) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension26TodayCardActionOverlayView_isExpanded) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension26TodayCardActionOverlayView_sizeCategory) = 7;
  id v4 = a3;

  result = (_TtC22SubscribePageExtension26TodayCardActionOverlayView *)sub_100768A40();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  id v4 = self;
  double v5 = sub_10008EEC0(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10008F1B4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_10008F550(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26TodayCardActionOverlayView_label));
  sub_10008FB18((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension26TodayCardActionOverlayView_accessory);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension26TodayCardActionOverlayView_accessoryView);
}

@end