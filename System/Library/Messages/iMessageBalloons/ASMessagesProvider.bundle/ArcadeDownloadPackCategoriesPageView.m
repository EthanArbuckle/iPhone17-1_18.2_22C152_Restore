@interface ArcadeDownloadPackCategoriesPageView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider36ArcadeDownloadPackCategoriesPageView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider36ArcadeDownloadPackCategoriesPageView)initWithFrame:(CGRect)a3;
- (void)invalidateMeasurements;
- (void)layoutSubviews;
- (void)preferredContentSizeCategoryDidChange;
@end

@implementation ArcadeDownloadPackCategoriesPageView

- (_TtC18ASMessagesProvider36ArcadeDownloadPackCategoriesPageView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider36ArcadeDownloadPackCategoriesPageView *)sub_F7858(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider36ArcadeDownloadPackCategoriesPageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_F906C();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  [(ArcadeDownloadPackCategoriesPageView *)v2 bounds];
  id v3 = [(ArcadeDownloadPackCategoriesPageView *)v2 traitCollection];
  sub_F8198(v10);
  sub_FB9C(v10, v10[3]);
  sub_77B980();
  double v5 = v4;
  double v7 = v6;
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v10);

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
  sub_F8198(v11);
  sub_FB9C(v11, v11[3]);
  sub_77B980();
  double v6 = v5;
  double v8 = v7;
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v11);

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
  sub_F8198(v4);
  sub_FB9C(v4, v4[3]);
  [v2 bounds];
  id v3 = [v2 traitCollection];
  sub_77B970();

  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v4);
}

- (void)invalidateMeasurements
{
  id v2 = self;
  sub_F89D4();
}

- (void)preferredContentSizeCategoryDidChange
{
  id v2 = self;
  sub_F8C8C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36ArcadeDownloadPackCategoriesPageView_wordmarkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36ArcadeDownloadPackCategoriesPageView_titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider36ArcadeDownloadPackCategoriesPageView_categoriesView);
}

@end