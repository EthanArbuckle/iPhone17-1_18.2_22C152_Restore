@interface DOCItemInfoContentViewController.RootHStack
- (UIEdgeInsets)layoutMargins;
- (_TtCC17RecentsAppPopover32DOCItemInfoContentViewControllerP33_B957D115690792E033AEA49F4E9ABF3410RootHStack)init;
- (_TtCC17RecentsAppPopover32DOCItemInfoContentViewControllerP33_B957D115690792E033AEA49F4E9ABF3410RootHStack)initWithFrame:(CGRect)a3;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
@end

@implementation DOCItemInfoContentViewController.RootHStack

- (_TtCC17RecentsAppPopover32DOCItemInfoContentViewControllerP33_B957D115690792E033AEA49F4E9ABF3410RootHStack)init
{
  return (_TtCC17RecentsAppPopover32DOCItemInfoContentViewControllerP33_B957D115690792E033AEA49F4E9ABF3410RootHStack *)sub_100055FAC();
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
  v8 = *(void **)&v7[OBJC_IVAR____TtCC17RecentsAppPopover32DOCItemInfoContentViewControllerP33_B957D115690792E033AEA49F4E9ABF3410RootHStack_stackView];
  objc_msgSend(v7, "layoutMargins", v9.receiver, v9.super_class);
  sub_1004BF220();
  objc_msgSend(v8, "setLayoutMargins:");
  sub_100056BC4(0);
}

- (_TtCC17RecentsAppPopover32DOCItemInfoContentViewControllerP33_B957D115690792E033AEA49F4E9ABF3410RootHStack)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC17RecentsAppPopover32DOCItemInfoContentViewControllerP33_B957D115690792E033AEA49F4E9ABF3410RootHStack_stackView));
  swift_bridgeObjectRelease();
}

@end