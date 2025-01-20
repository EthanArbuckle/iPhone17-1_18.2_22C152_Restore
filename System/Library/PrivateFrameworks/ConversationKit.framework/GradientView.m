@interface GradientView
+ (Class)layerClass;
- (_TtC15ConversationKit12GradientView)init;
- (_TtC15ConversationKit12GradientView)initWithCoder:(id)a3;
- (_TtC15ConversationKit12GradientView)initWithFrame:(CGRect)a3;
@end

@implementation GradientView

- (_TtC15ConversationKit12GradientView)init
{
  return (_TtC15ConversationKit12GradientView *)GradientView.init()();
}

- (_TtC15ConversationKit12GradientView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit12GradientView *)GradientView.init(frame:)();
}

- (_TtC15ConversationKit12GradientView)initWithCoder:(id)a3
{
  id v3 = a3;
  GradientView.init(coder:)();
}

+ (Class)layerClass
{
  static GradientView.layerClass.getter();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void).cxx_destruct
{
}

@end