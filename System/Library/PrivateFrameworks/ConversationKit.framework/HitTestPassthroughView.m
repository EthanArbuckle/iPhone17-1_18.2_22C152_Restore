@interface HitTestPassthroughView
+ (Class)layerClass;
- (_TtC15ConversationKitP33_4D20B3E5E64D3E09186739EFFCDDD35122HitTestPassthroughView)initWithCoder:(id)a3;
- (_TtC15ConversationKitP33_4D20B3E5E64D3E09186739EFFCDDD35122HitTestPassthroughView)initWithFrame:(CGRect)a3;
@end

@implementation HitTestPassthroughView

+ (Class)layerClass
{
  return (Class)@objc static HitTestPassthroughView.layerClass.getter((uint64_t)a1, (uint64_t)a2, (void (*)(void))static HitTestPassthroughView.layerClass.getter);
}

- (_TtC15ConversationKitP33_4D20B3E5E64D3E09186739EFFCDDD35122HitTestPassthroughView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKitP33_4D20B3E5E64D3E09186739EFFCDDD35122HitTestPassthroughView *)HitTestPassthroughView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15ConversationKitP33_4D20B3E5E64D3E09186739EFFCDDD35122HitTestPassthroughView)initWithCoder:(id)a3
{
}

@end