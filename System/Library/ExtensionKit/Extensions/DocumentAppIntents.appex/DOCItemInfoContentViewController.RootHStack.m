@interface DOCItemInfoContentViewController.RootHStack
- (UIEdgeInsets)layoutMargins;
- (_TtCC18DocumentAppIntents32DOCItemInfoContentViewControllerP33_A466455E948BE2F6B7FA6693E5CBEFB310RootHStack)init;
- (_TtCC18DocumentAppIntents32DOCItemInfoContentViewControllerP33_A466455E948BE2F6B7FA6693E5CBEFB310RootHStack)initWithFrame:(CGRect)a3;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
@end

@implementation DOCItemInfoContentViewController.RootHStack

- (_TtCC18DocumentAppIntents32DOCItemInfoContentViewControllerP33_A466455E948BE2F6B7FA6693E5CBEFB310RootHStack)init
{
  return (_TtCC18DocumentAppIntents32DOCItemInfoContentViewControllerP33_A466455E948BE2F6B7FA6693E5CBEFB310RootHStack *)sub_10005155C();
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
  v8 = *(void **)&v7[OBJC_IVAR____TtCC18DocumentAppIntents32DOCItemInfoContentViewControllerP33_A466455E948BE2F6B7FA6693E5CBEFB310RootHStack_stackView];
  objc_msgSend(v7, "layoutMargins", v9.receiver, v9.super_class);
  sub_1004F4CB0();
  objc_msgSend(v8, "setLayoutMargins:");
  sub_100052174(0);
}

- (_TtCC18DocumentAppIntents32DOCItemInfoContentViewControllerP33_A466455E948BE2F6B7FA6693E5CBEFB310RootHStack)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC18DocumentAppIntents32DOCItemInfoContentViewControllerP33_A466455E948BE2F6B7FA6693E5CBEFB310RootHStack_stackView));

  swift_bridgeObjectRelease();
}

@end