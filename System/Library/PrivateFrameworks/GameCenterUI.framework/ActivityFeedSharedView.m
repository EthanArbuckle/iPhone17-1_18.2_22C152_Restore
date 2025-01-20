@interface ActivityFeedSharedView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityLabel;
- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC12GameCenterUI22ActivityFeedSharedView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI22ActivityFeedSharedView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ActivityFeedSharedView

- (_TtC12GameCenterUI22ActivityFeedSharedView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI22ActivityFeedSharedView *)sub_1AF4812D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI22ActivityFeedSharedView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF4816C0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1AF481C4C(width);
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
  sub_1AF481D54();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_1AF482188(a3);
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_1AF482500();
  uint64_t v4 = v3;

  if (v4)
  {
    id v5 = (void *)sub_1AF7AE0A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1AF7AE0E0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  double v7 = self;
  sub_1AF406D14(v4, v6);
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel
{
  id v2 = sub_1AF482624();

  return (_TtC12GameCenterUI16DynamicTypeLabel *)v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI22ActivityFeedSharedView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI22ActivityFeedSharedView_playerGroupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI22ActivityFeedSharedView_playerGroupSubartworkView));
  swift_release();

  swift_release();
}

@end