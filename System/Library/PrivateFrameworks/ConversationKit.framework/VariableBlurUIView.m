@interface VariableBlurUIView
+ (Class)layerClass;
- (_TtC15ConversationKit18VariableBlurUIView)initWithCoder:(id)a3;
- (_TtC15ConversationKit18VariableBlurUIView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation VariableBlurUIView

- (_TtC15ConversationKit18VariableBlurUIView)initWithCoder:(id)a3
{
  id v3 = a3;
  VariableBlurUIView.init(coder:)();
}

+ (Class)layerClass
{
  static VariableBlurUIView.layerClass.getter();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)layoutSubviews
{
  v2 = self;
  VariableBlurUIView.layoutSubviews()();
}

- (_TtC15ConversationKit18VariableBlurUIView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  outlined consume of VariableBlurMask(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ConversationKit18VariableBlurUIView_blurMask), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15ConversationKit18VariableBlurUIView_blurMask), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15ConversationKit18VariableBlurUIView_blurMask), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15ConversationKit18VariableBlurUIView_blurMask), *(uint64_t *)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC15ConversationKit18VariableBlurUIView_blurMask), *((unsigned char *)&self->super._swiftAnimationInfo + OBJC_IVAR____TtC15ConversationKit18VariableBlurUIView_blurMask));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit18VariableBlurUIView_blurMaskImage);
}

@end