@interface DOCItemInfoContentViewController.RootHStack
- (UIEdgeInsets)layoutMargins;
- (_TtCC33com_apple_DocumentManager_Service32DOCItemInfoContentViewControllerP33_D1F8631902FAEB4BA7726F23C817A13610RootHStack)init;
- (_TtCC33com_apple_DocumentManager_Service32DOCItemInfoContentViewControllerP33_D1F8631902FAEB4BA7726F23C817A13610RootHStack)initWithFrame:(CGRect)a3;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
@end

@implementation DOCItemInfoContentViewController.RootHStack

- (_TtCC33com_apple_DocumentManager_Service32DOCItemInfoContentViewControllerP33_D1F8631902FAEB4BA7726F23C817A13610RootHStack)init
{
  return (_TtCC33com_apple_DocumentManager_Service32DOCItemInfoContentViewControllerP33_D1F8631902FAEB4BA7726F23C817A13610RootHStack *)sub_10008C8C0();
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
  v8 = *(void **)&v7[OBJC_IVAR____TtCC33com_apple_DocumentManager_Service32DOCItemInfoContentViewControllerP33_D1F8631902FAEB4BA7726F23C817A13610RootHStack_stackView];
  objc_msgSend(v7, "layoutMargins", v9.receiver, v9.super_class);
  sub_1004CDA30();
  objc_msgSend(v8, "setLayoutMargins:");
  sub_10008D4D8(0);
}

- (_TtCC33com_apple_DocumentManager_Service32DOCItemInfoContentViewControllerP33_D1F8631902FAEB4BA7726F23C817A13610RootHStack)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC33com_apple_DocumentManager_Service32DOCItemInfoContentViewControllerP33_D1F8631902FAEB4BA7726F23C817A13610RootHStack_stackView));
  swift_bridgeObjectRelease();
}

@end