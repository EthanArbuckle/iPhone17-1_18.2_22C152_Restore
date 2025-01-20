@interface ArcadeDownloadPackSuggestionsPageView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension37ArcadeDownloadPackSuggestionsPageView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension37ArcadeDownloadPackSuggestionsPageView)initWithFrame:(CGRect)a3;
- (void)invalidateMeasurements;
- (void)layoutSubviews;
- (void)preferredContentSizeCategoryDidChange;
@end

@implementation ArcadeDownloadPackSuggestionsPageView

- (_TtC22SubscribePageExtension37ArcadeDownloadPackSuggestionsPageView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension37ArcadeDownloadPackSuggestionsPageView *)sub_100387DD0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension37ArcadeDownloadPackSuggestionsPageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100389590();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  [(ArcadeDownloadPackSuggestionsPageView *)v2 bounds];
  id v3 = [(ArcadeDownloadPackSuggestionsPageView *)v2 traitCollection];
  sub_1003886EC(v10);
  sub_10000FE94(v10, v10[3]);
  sub_100765910();
  double v5 = v4;
  double v7 = v6;
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v10);

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  id v4 = [(ArcadeDownloadPackSuggestionsPageView *)v3 traitCollection];
  sub_1003886EC(v11);
  sub_10000FE94(v11, v11[3]);
  sub_100765910();
  double v6 = v5;
  double v8 = v7;
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v11);

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100388DD4();
}

- (void)invalidateMeasurements
{
  v2 = self;
  [(ArcadeDownloadPackSuggestionsPageView *)v2 setNeedsLayout];
  [(ArcadeDownloadPackSuggestionsPageView *)v2 invalidateIntrinsicContentSize];
}

- (void)preferredContentSizeCategoryDidChange
{
  v2 = self;
  sub_100388F7C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension37ArcadeDownloadPackSuggestionsPageView_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension37ArcadeDownloadPackSuggestionsPageView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension37ArcadeDownloadPackSuggestionsPageView_gamesView));

  swift_release();
}

@end