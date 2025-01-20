@interface ArticleHeaderViewController.ContentView
- (_TtCC18ASMessagesProvider27ArticleHeaderViewControllerP33_00BC5D4E2124FF40B16B40032225D71111ContentView)initWithCoder:(id)a3;
- (_TtCC18ASMessagesProvider27ArticleHeaderViewControllerP33_00BC5D4E2124FF40B16B40032225D71111ContentView)initWithFrame:(CGRect)a3;
- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews;
@end

@implementation ArticleHeaderViewController.ContentView

- (_TtCC18ASMessagesProvider27ArticleHeaderViewControllerP33_00BC5D4E2124FF40B16B40032225D71111ContentView)initWithFrame:(CGRect)a3
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

- (_TtCC18ASMessagesProvider27ArticleHeaderViewControllerP33_00BC5D4E2124FF40B16B40032225D71111ContentView)initWithCoder:(id)a3
{
  result = (_TtCC18ASMessagesProvider27ArticleHeaderViewControllerP33_00BC5D4E2124FF40B16B40032225D71111ContentView *)sub_77EB20();
  __break(1u);
  return result;
}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  return 0;
}

@end