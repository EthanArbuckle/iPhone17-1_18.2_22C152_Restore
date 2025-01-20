@interface ParticipantInfoView
- (BOOL)isMomentsAvailable;
- (_TtC15ConversationKit19ParticipantInfoView)initWithCoder:(id)a3;
- (_TtC15ConversationKit19ParticipantInfoView)initWithFrame:(CGRect)a3;
- (_TtC15ConversationKit33ParticipantViewLabelContainerView)nameLabel;
- (void)didTapExpandButton;
- (void)didTapShutterButton;
- (void)layoutSubviews;
- (void)setIsMomentsAvailable:(BOOL)a3;
@end

@implementation ParticipantInfoView

- (_TtC15ConversationKit33ParticipantViewLabelContainerView)nameLabel
{
  id v2 = ParticipantInfoView.nameLabel.getter();
  return (_TtC15ConversationKit33ParticipantViewLabelContainerView *)v2;
}

- (BOOL)isMomentsAvailable
{
  return ParticipantInfoView.isMomentsAvailable.getter() & 1;
}

- (void)setIsMomentsAvailable:(BOOL)a3
{
  v4 = self;
  ParticipantInfoView.isMomentsAvailable.setter(a3);
}

- (_TtC15ConversationKit19ParticipantInfoView)initWithCoder:(id)a3
{
  id v3 = a3;
  ParticipantInfoView.init(coder:)();
}

- (void)layoutSubviews
{
  id v2 = self;
  ParticipantInfoView.layoutSubviews()();
}

- (void)didTapExpandButton
{
  id v2 = self;
  ParticipantInfoView.didTapExpandButton()();
}

- (void)didTapShutterButton
{
  id v2 = self;
  ParticipantInfoView.didTapShutterButton()();
}

- (_TtC15ConversationKit19ParticipantInfoView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit19ParticipantInfoView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit19ParticipantInfoView_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit19ParticipantInfoView_shutterButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit19ParticipantInfoView_expandButton));
  id v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit19ParticipantInfoView_delegate;
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)v3);
}

@end