@interface ArcadeDownloadPackCategoryListView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension34ArcadeDownloadPackCategoryListView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension34ArcadeDownloadPackCategoryListView)initWithFrame:(CGRect)a3;
- (void)preferredContentSizeCategoryDidChange;
@end

@implementation ArcadeDownloadPackCategoryListView

- (_TtC22SubscribePageExtension34ArcadeDownloadPackCategoryListView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension34ArcadeDownloadPackCategoryListView *)sub_1004BC4EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension34ArcadeDownloadPackCategoryListView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004BD7F8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  id v6 = [(ArcadeDownloadPackCategoryListView *)v5 traitCollection];
  objc_msgSend(*(id *)((char *)&v5->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension34ArcadeDownloadPackCategoryListView_contentView), "systemLayoutSizeFittingSize:", width, height);
  double v8 = v7;
  double v10 = v9;
  id v11 = sub_1004BCADC();
  [v11 constant];
  double v13 = v12;

  double v14 = v10 + v13;
  double v15 = v8;
  result.double height = v14;
  result.double width = v15;
  return result;
}

- (void)preferredContentSizeCategoryDidChange
{
  v2 = self;
  sub_1004BD26C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34ArcadeDownloadPackCategoryListView_firstColumn));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34ArcadeDownloadPackCategoryListView_secondColumn));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34ArcadeDownloadPackCategoryListView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34ArcadeDownloadPackCategoryListView____lazy_storage___topContentConstraint));

  swift_bridgeObjectRelease();
}

@end