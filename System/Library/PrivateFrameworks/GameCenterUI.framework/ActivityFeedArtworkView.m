@interface ActivityFeedArtworkView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityLabel;
- (_TtC12GameCenterUI23ActivityFeedArtworkView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI23ActivityFeedArtworkView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
@end

@implementation ActivityFeedArtworkView

- (_TtC12GameCenterUI23ActivityFeedArtworkView)initWithFrame:(CGRect)a3
{
  sub_1AF59C7A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC12GameCenterUI23ActivityFeedArtworkView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF59CB30();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_1AF59CCB0();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF59CE14();
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_1AF59D90C();
  uint64_t v4 = v3;

  if (v4)
  {
    double v5 = (void *)sub_1AF7AE0A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v5 = 0;
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

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI23ActivityFeedArtworkView_contentBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI23ActivityFeedArtworkView_sharedView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI23ActivityFeedArtworkView_artworkContainer));

  swift_bridgeObjectRelease();
}

@end