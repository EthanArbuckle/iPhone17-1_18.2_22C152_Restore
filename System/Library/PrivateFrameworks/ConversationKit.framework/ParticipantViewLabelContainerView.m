@interface ParticipantViewLabelContainerView
+ (Class)layerClass;
- (CGSize)intrinsicContentSize;
- (UILabel)label;
- (_TtC15ConversationKit33ParticipantViewLabelContainerView)initWithCoder:(id)a3;
- (_TtC15ConversationKit33ParticipantViewLabelContainerView)initWithFrame:(CGRect)a3;
@end

@implementation ParticipantViewLabelContainerView

- (UILabel)label
{
  id v2 = ParticipantViewLabelContainerView.label.getter();
  return (UILabel *)v2;
}

- (_TtC15ConversationKit33ParticipantViewLabelContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit33ParticipantViewLabelContainerView *)ParticipantViewLabelContainerView.init(frame:)();
}

- (CGSize)intrinsicContentSize
{
  id v2 = self;
  double v3 = ParticipantViewLabelContainerView.intrinsicContentSize.getter();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC15ConversationKit33ParticipantViewLabelContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  ParticipantViewLabelContainerView.init(coder:)();
}

+ (Class)layerClass
{
  static ParticipantViewLabelContainerView.layerClass.getter();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit33ParticipantViewLabelContainerView_label));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end