@interface DOCItemInfoContentViewController.RootHStack
- (UIEdgeInsets)layoutMargins;
- (_TtCC14RecentsAvocado32DOCItemInfoContentViewControllerP33_FB7DE7FD15CB3076C1E873F792ED74B010RootHStack)init;
- (_TtCC14RecentsAvocado32DOCItemInfoContentViewControllerP33_FB7DE7FD15CB3076C1E873F792ED74B010RootHStack)initWithFrame:(CGRect)a3;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
@end

@implementation DOCItemInfoContentViewController.RootHStack

- (_TtCC14RecentsAvocado32DOCItemInfoContentViewControllerP33_FB7DE7FD15CB3076C1E873F792ED74B010RootHStack)init
{
  return (_TtCC14RecentsAvocado32DOCItemInfoContentViewControllerP33_FB7DE7FD15CB3076C1E873F792ED74B010RootHStack *)sub_10004E45C();
}

- (UIEdgeInsets)layoutMargins
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCItemInfoContentViewController.RootHStack();
  [(DOCItemInfoContentViewController.RootHStack *)&v6 layoutMargins];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCItemInfoContentViewController.RootHStack();
  v7 = (char *)v9.receiver;
  -[DOCItemInfoContentViewController.RootHStack setLayoutMargins:](&v9, "setLayoutMargins:", top, left, bottom, right);
  v8 = *(void **)&v7[OBJC_IVAR____TtCC14RecentsAvocado32DOCItemInfoContentViewControllerP33_FB7DE7FD15CB3076C1E873F792ED74B010RootHStack_stackView];
  objc_msgSend(v7, "layoutMargins", v9.receiver, v9.super_class);
  sub_1004CE270();
  objc_msgSend(v8, "setLayoutMargins:");
  sub_10004F074(0);
}

- (_TtCC14RecentsAvocado32DOCItemInfoContentViewControllerP33_FB7DE7FD15CB3076C1E873F792ED74B010RootHStack)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC14RecentsAvocado32DOCItemInfoContentViewControllerP33_FB7DE7FD15CB3076C1E873F792ED74B010RootHStack_stackView));
  swift_bridgeObjectRelease();
}

@end