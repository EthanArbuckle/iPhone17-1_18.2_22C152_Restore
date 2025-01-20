@interface DOCItemInfoContentViewController.RootHStack
- (UIEdgeInsets)layoutMargins;
- (_TtCC11SaveToFiles32DOCItemInfoContentViewControllerP33_8867B9CF0B52115FD9A7DF2785A02EB610RootHStack)init;
- (_TtCC11SaveToFiles32DOCItemInfoContentViewControllerP33_8867B9CF0B52115FD9A7DF2785A02EB610RootHStack)initWithFrame:(CGRect)a3;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
@end

@implementation DOCItemInfoContentViewController.RootHStack

- (_TtCC11SaveToFiles32DOCItemInfoContentViewControllerP33_8867B9CF0B52115FD9A7DF2785A02EB610RootHStack)init
{
  return (_TtCC11SaveToFiles32DOCItemInfoContentViewControllerP33_8867B9CF0B52115FD9A7DF2785A02EB610RootHStack *)sub_100415930();
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
  v8 = *(void **)&v7[OBJC_IVAR____TtCC11SaveToFiles32DOCItemInfoContentViewControllerP33_8867B9CF0B52115FD9A7DF2785A02EB610RootHStack_stackView];
  objc_msgSend(v7, "layoutMargins", v9.receiver, v9.super_class);
  sub_1004D1980();
  objc_msgSend(v8, "setLayoutMargins:");
  sub_100416548(0);
}

- (_TtCC11SaveToFiles32DOCItemInfoContentViewControllerP33_8867B9CF0B52115FD9A7DF2785A02EB610RootHStack)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC11SaveToFiles32DOCItemInfoContentViewControllerP33_8867B9CF0B52115FD9A7DF2785A02EB610RootHStack_stackView));
  swift_bridgeObjectRelease();
}

@end