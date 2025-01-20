@interface TodayCardLockupView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider19TodayCardLockupView)initWithFrame:(CGRect)a3;
- (_TtC18ASMessagesProvider25SearchAdTransparencyLabel)accessibilityAdLabel;
- (void)layoutSubviews;
@end

@implementation TodayCardLockupView

- (_TtC18ASMessagesProvider19TodayCardLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider19TodayCardLockupView *)sub_CC5DC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  id v5 = [(TodayCardLockupView *)v4 traitCollection];
  sub_CA2B0((uint64_t)v13);
  uint64_t v6 = (uint64_t)v4 + OBJC_IVAR____TtC18ASMessagesProvider19TodayCardLockupView_axMetrics;
  swift_beginAccess();
  sub_CC1D8(v6, (uint64_t)v12);
  [(TodayCardLockupView *)v4 layoutMargins];
  double v7 = sub_CBF70((uint64_t)v13, (uint64_t)v12, v5, width);
  double v9 = v8;
  sub_CC234((uint64_t)v12);
  sub_CC234((uint64_t)v13);

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  CGFloat v3 = sub_CAA10();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.double width = v6;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TodayCardLockupView();
  id v2 = v5.receiver;
  [(TodayCardLockupView *)&v5 layoutSubviews];
  sub_CABD0(v4);
  sub_FB9C(v4, v4[3]);
  sub_772580();
  id v3 = [v2 traitCollection];
  sub_77B970();

  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v4);
}

- (void).cxx_destruct
{
  sub_CC234((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider19TodayCardLockupView_metrics);
  sub_CC234((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider19TodayCardLockupView_axMetrics);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider19TodayCardLockupView_crossLinkTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider19TodayCardLockupView_crossLinkSubtitleLabel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider19TodayCardLockupView_searchAdTertiaryLabel));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC18ASMessagesProvider25SearchAdTransparencyLabel)accessibilityAdLabel
{
  return (_TtC18ASMessagesProvider25SearchAdTransparencyLabel *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider19TodayCardLockupView_searchAdTertiaryLabel);
}

@end