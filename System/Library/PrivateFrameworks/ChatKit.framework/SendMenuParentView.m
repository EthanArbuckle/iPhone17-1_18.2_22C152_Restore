@interface SendMenuParentView
- (_TtC7ChatKit18SendMenuParentView)init;
- (_TtC7ChatKit18SendMenuParentView)initWithCoder:(id)a3;
- (_TtC7ChatKit18SendMenuParentView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation SendMenuParentView

- (_TtC7ChatKit18SendMenuParentView)init
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit18SendMenuParentView_allowsHitTesting) = 1;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SendMenuParentView();
  v2 = -[SendMenuParentView initWithFrame:](&v7, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v3 = self;
  v4 = v2;
  id v5 = objc_msgSend(v3, sel_clearColor);
  [(SendMenuParentView *)v4 setBackgroundColor:v5];

  [(SendMenuParentView *)v4 setAccessibilityViewIsModal:1];
  return v4;
}

- (_TtC7ChatKit18SendMenuParentView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit18SendMenuParentView_allowsHitTesting) = 1;
  id v4 = a3;

  result = (_TtC7ChatKit18SendMenuParentView *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v8 = (char *)self + OBJC_IVAR____TtC7ChatKit18SendMenuParentView_allowsHitTesting;
  swift_beginAccess();
  id v9 = 0;
  if (*v8 == 1)
  {
    v11.receiver = self;
    v11.super_class = (Class)type metadata accessor for SendMenuParentView();
    id v9 = -[SendMenuParentView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, a4, x, y);
  }

  return v9;
}

- (_TtC7ChatKit18SendMenuParentView)initWithFrame:(CGRect)a3
{
  result = (_TtC7ChatKit18SendMenuParentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end