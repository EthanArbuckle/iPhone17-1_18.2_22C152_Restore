@interface SGBannerContentHostingView
- (CGSize)intrinsicContentSize;
- (_TtC17CoreSuggestionsUI26SGBannerContentHostingView)initWithBanner:(id)a3;
- (_TtC17CoreSuggestionsUI26SGBannerContentHostingView)initWithCoder:(id)a3;
- (_TtC17CoreSuggestionsUI26SGBannerContentHostingView)initWithFrame:(CGRect)a3;
- (double)actionButtonLeadingEdgeOffset;
- (void)invalidateBannerView;
- (void)reload;
- (void)setSuggestionWithStore:(id)a3;
- (void)updateBannerViews;
- (void)updateWithBanner:(id)a3;
@end

@implementation SGBannerContentHostingView

- (_TtC17CoreSuggestionsUI26SGBannerContentHostingView)initWithBanner:(id)a3
{
  return (_TtC17CoreSuggestionsUI26SGBannerContentHostingView *)SGBannerContentHostingView.init(banner:)(a3);
}

- (_TtC17CoreSuggestionsUI26SGBannerContentHostingView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5BA5878();
}

- (void)updateBannerViews
{
  v2 = self;
  sub_1B5BA5934();
}

- (void)updateWithBanner:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)OUTLINED_FUNCTION_22_0();
  sub_1B5BA5B10(v6);
}

- (void)setSuggestionWithStore:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)OUTLINED_FUNCTION_22_0();
  sub_1B5BA5BDC(v6);
}

- (void)invalidateBannerView
{
}

- (void)reload
{
  v2 = self;
  sub_1B5BA5CA8();
}

- (double)actionButtonLeadingEdgeOffset
{
  v2 = self;
  double v3 = sub_1B5BA5EE8();

  return v3;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_1B5BA60A0();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC17CoreSuggestionsUI26SGBannerContentHostingView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_hostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_banner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17CoreSuggestionsUI26SGBannerContentHostingView_suggestionStore));
  swift_release();
}

@end