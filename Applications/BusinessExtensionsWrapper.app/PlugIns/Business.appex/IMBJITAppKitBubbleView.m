@interface IMBJITAppKitBubbleView
- (_TtC8Business22IMBJITAppKitBubbleView)initWithCoder:(id)a3;
@end

@implementation IMBJITAppKitBubbleView

- (_TtC8Business22IMBJITAppKitBubbleView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Business22IMBJITAppKitBubbleView_bubbleState) = 1;
  id v4 = a3;

  result = (_TtC8Business22IMBJITAppKitBubbleView *)sub_1000BC0B8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Business22IMBJITAppKitBubbleView_model);

  swift_release();
}

@end