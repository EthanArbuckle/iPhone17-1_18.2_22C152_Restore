@interface ArticleHeaderViewController.ContentView
- (_TtCC20ProductPageExtension27ArticleHeaderViewControllerP33_53F03593704F22464E792C7CAB8A1DE411ContentView)initWithCoder:(id)a3;
- (_TtCC20ProductPageExtension27ArticleHeaderViewControllerP33_53F03593704F22464E792C7CAB8A1DE411ContentView)initWithFrame:(CGRect)a3;
- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews;
@end

@implementation ArticleHeaderViewController.ContentView

- (_TtCC20ProductPageExtension27ArticleHeaderViewControllerP33_53F03593704F22464E792C7CAB8A1DE411ContentView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v7 = -[ArticleHeaderViewController.ContentView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  [(ArticleHeaderViewController.ContentView *)v7 setEdgesInsettingLayoutMarginsFromSafeArea:0];
  return v7;
}

- (_TtCC20ProductPageExtension27ArticleHeaderViewControllerP33_53F03593704F22464E792C7CAB8A1DE411ContentView)initWithCoder:(id)a3
{
  result = (_TtCC20ProductPageExtension27ArticleHeaderViewControllerP33_53F03593704F22464E792C7CAB8A1DE411ContentView *)sub_10077D120();
  __break(1u);
  return result;
}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  return 0;
}

@end