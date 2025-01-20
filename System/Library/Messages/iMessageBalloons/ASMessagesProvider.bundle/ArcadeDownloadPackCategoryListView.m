@interface ArcadeDownloadPackCategoryListView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider34ArcadeDownloadPackCategoryListView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider34ArcadeDownloadPackCategoryListView)initWithFrame:(CGRect)a3;
- (void)preferredContentSizeCategoryDidChange;
@end

@implementation ArcadeDownloadPackCategoryListView

- (_TtC18ASMessagesProvider34ArcadeDownloadPackCategoryListView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider34ArcadeDownloadPackCategoryListView *)sub_6F4238(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider34ArcadeDownloadPackCategoryListView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_6F5544();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  id v6 = [(ArcadeDownloadPackCategoryListView *)v5 traitCollection];
  objc_msgSend(*(id *)((char *)&v5->super.super.super.isa+ OBJC_IVAR____TtC18ASMessagesProvider34ArcadeDownloadPackCategoryListView_contentView), "systemLayoutSizeFittingSize:", width, height);
  double v8 = v7;
  double v10 = v9;
  id v11 = sub_6F4828();
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
  sub_6F4FB8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider34ArcadeDownloadPackCategoryListView_firstColumn));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider34ArcadeDownloadPackCategoryListView_secondColumn));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider34ArcadeDownloadPackCategoryListView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider34ArcadeDownloadPackCategoryListView____lazy_storage___topContentConstraint));

  swift_bridgeObjectRelease();
}

@end