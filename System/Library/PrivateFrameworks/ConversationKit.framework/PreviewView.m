@interface PreviewView
+ (Class)layerClass;
- (_TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5611PreviewView)initWithCoder:(id)a3;
- (_TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5611PreviewView)initWithFrame:(CGRect)a3;
@end

@implementation PreviewView

+ (Class)layerClass
{
  swift_getObjCClassMetadata();
  static PreviewView.layerClass.getter();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5611PreviewView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5611PreviewView *)PreviewView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5611PreviewView)initWithCoder:(id)a3
{
  return (_TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5611PreviewView *)PreviewView.init(coder:)(a3);
}

@end