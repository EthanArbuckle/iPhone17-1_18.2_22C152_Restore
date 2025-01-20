@interface ShapeView
+ (Class)layerClass;
- (_TtC15ConversationKit9ShapeView)initWithCoder:(id)a3;
- (_TtC15ConversationKit9ShapeView)initWithFrame:(CGRect)a3;
@end

@implementation ShapeView

+ (Class)layerClass
{
  static ShapeView.layerClass.getter();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC15ConversationKit9ShapeView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit9ShapeView *)ShapeView.init(frame:)();
}

- (_TtC15ConversationKit9ShapeView)initWithCoder:(id)a3
{
  return (_TtC15ConversationKit9ShapeView *)ShapeView.init(coder:)(a3);
}

@end