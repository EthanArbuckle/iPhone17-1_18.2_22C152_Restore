@interface ParticipantViewButton
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (_TtC15ConversationKit21ParticipantViewButton)initWithCoder:(id)a3;
- (_TtC15ConversationKit21ParticipantViewButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation ParticipantViewButton

- (BOOL)isSelected
{
  v2 = self;
  unsigned __int8 v3 = ParticipantViewButton.isSelected.getter();

  return v3 & 1;
}

- (void)setSelected:(BOOL)a3
{
  v4 = self;
  ParticipantViewButton.isSelected.setter(a3);
}

- (BOOL)isHighlighted
{
  v2 = self;
  unsigned __int8 v3 = ParticipantViewButton.isHighlighted.getter();

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  ParticipantViewButton.isHighlighted.setter(a3);
}

- (BOOL)isEnabled
{
  v2 = self;
  unsigned __int8 v3 = ParticipantViewButton.isEnabled.getter();

  return v3 & 1;
}

- (void)setEnabled:(BOOL)a3
{
  v4 = self;
  ParticipantViewButton.isEnabled.setter(a3);
}

- (_TtC15ConversationKit21ParticipantViewButton)initWithCoder:(id)a3
{
  id v3 = a3;
  ParticipantViewButton.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  ParticipantViewButton.layoutSubviews()();
}

- (_TtC15ConversationKit21ParticipantViewButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit21ParticipantViewButton_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit21ParticipantViewButton_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit21ParticipantViewButton_discView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit21ParticipantViewButton_image));
  swift_bridgeObjectRelease();
}

@end