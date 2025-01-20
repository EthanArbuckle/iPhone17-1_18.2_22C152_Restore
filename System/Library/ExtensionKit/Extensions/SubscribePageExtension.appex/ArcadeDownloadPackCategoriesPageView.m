@interface ArcadeDownloadPackCategoriesPageView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension36ArcadeDownloadPackCategoriesPageView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension36ArcadeDownloadPackCategoriesPageView)initWithFrame:(CGRect)a3;
- (void)invalidateMeasurements;
- (void)layoutSubviews;
- (void)preferredContentSizeCategoryDidChange;
@end

@implementation ArcadeDownloadPackCategoriesPageView

- (_TtC22SubscribePageExtension36ArcadeDownloadPackCategoriesPageView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension36ArcadeDownloadPackCategoriesPageView *)sub_1000BEF14(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension36ArcadeDownloadPackCategoriesPageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000C0738();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  [(ArcadeDownloadPackCategoriesPageView *)v2 bounds];
  id v3 = [(ArcadeDownloadPackCategoriesPageView *)v2 traitCollection];
  sub_1000BF854(v10);
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
  id v4 = [(ArcadeDownloadPackCategoriesPageView *)v3 traitCollection];
  sub_1000BF854(v11);
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
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(ArcadeDownloadPackCategoriesPageView *)&v5 layoutSubviews];
  sub_1000BF854(v4);
  sub_10000FE94(v4, v4[3]);
  [v2 bounds];
  id v3 = [v2 traitCollection];
  sub_100765900();

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v4);
}

- (void)invalidateMeasurements
{
  id v2 = self;
  sub_1000C0090();
}

- (void)preferredContentSizeCategoryDidChange
{
  id v2 = self;
  sub_1000C0348();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36ArcadeDownloadPackCategoriesPageView_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36ArcadeDownloadPackCategoriesPageView_titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension36ArcadeDownloadPackCategoriesPageView_categoriesView);
}

@end