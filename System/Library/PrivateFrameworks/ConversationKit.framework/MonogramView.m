@interface MonogramView
- (_TtC15ConversationKit12MonogramView)init;
- (_TtC15ConversationKit12MonogramView)initWithCoder:(id)a3;
- (_TtC15ConversationKit12MonogramView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation MonogramView

- (_TtC15ConversationKit12MonogramView)init
{
}

- (_TtC15ConversationKit12MonogramView)initWithFrame:(CGRect)a3
{
}

- (_TtC15ConversationKit12MonogramView)initWithCoder:(id)a3
{
  id v3 = a3;
  MonogramView.init(coder:)();
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  MonogramView.draw(_:)(v9);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end