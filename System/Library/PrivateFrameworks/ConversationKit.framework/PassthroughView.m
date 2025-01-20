@interface PassthroughView
- (_TtC15ConversationKitP33_8148F13423B452987C585C9F6B0F97A415PassthroughView)initWithCoder:(id)a3;
- (_TtC15ConversationKitP33_8148F13423B452987C585C9F6B0F97A415PassthroughView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PassthroughView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = PassthroughView.hitTest(_:with:)((uint64_t)a4, x, y);

  return v10;
}

- (_TtC15ConversationKitP33_8148F13423B452987C585C9F6B0F97A415PassthroughView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKitP33_8148F13423B452987C585C9F6B0F97A415PassthroughView *)PassthroughView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15ConversationKitP33_8148F13423B452987C585C9F6B0F97A415PassthroughView)initWithCoder:(id)a3
{
  return (_TtC15ConversationKitP33_8148F13423B452987C585C9F6B0F97A415PassthroughView *)PassthroughView.init(coder:)(a3);
}

@end