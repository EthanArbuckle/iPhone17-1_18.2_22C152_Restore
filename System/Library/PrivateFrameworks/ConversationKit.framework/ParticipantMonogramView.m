@interface ParticipantMonogramView
- (UIButton)ringButton;
- (_TtC15ConversationKit23ParticipantMonogramView)init;
- (_TtC15ConversationKit23ParticipantMonogramView)initWithCoder:(id)a3;
- (_TtC15ConversationKit23ParticipantMonogramView)initWithFrame:(CGRect)a3;
- (_TtC15ConversationKit33ParticipantViewLabelContainerView)subtitleLabelContainer;
- (_TtC15ConversationKit33ParticipantViewLabelContainerView)titleLabelContainer;
- (void)didTapRingButton;
- (void)layoutSubviews;
- (void)setRingButton:(id)a3;
@end

@implementation ParticipantMonogramView

- (UIButton)ringButton
{
  id v2 = ParticipantMonogramView.ringButton.getter();
  return (UIButton *)v2;
}

- (void)setRingButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  ParticipantMonogramView.ringButton.setter((uint64_t)v4);
}

- (_TtC15ConversationKit33ParticipantViewLabelContainerView)titleLabelContainer
{
  id v2 = ParticipantMonogramView.titleLabelContainer.getter();
  return (_TtC15ConversationKit33ParticipantViewLabelContainerView *)v2;
}

- (_TtC15ConversationKit33ParticipantViewLabelContainerView)subtitleLabelContainer
{
  id v2 = ParticipantMonogramView.subtitleLabelContainer.getter();
  return (_TtC15ConversationKit33ParticipantViewLabelContainerView *)v2;
}

- (_TtC15ConversationKit23ParticipantMonogramView)init
{
}

- (_TtC15ConversationKit23ParticipantMonogramView)initWithCoder:(id)a3
{
  id v3 = a3;
  ParticipantMonogramView.init(coder:)();
}

- (_TtC15ConversationKit23ParticipantMonogramView)initWithFrame:(CGRect)a3
{
}

- (void)layoutSubviews
{
  id v2 = self;
  ParticipantMonogramView.layoutSubviews()();
}

- (void)didTapRingButton
{
  id v2 = self;
  ParticipantMonogramView.didTapRingButton()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit23ParticipantMonogramView_contactView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit23ParticipantMonogramView_glowClippingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit23ParticipantMonogramView_glowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit23ParticipantMonogramView_audioVisualizationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit23ParticipantMonogramView_ringButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit23ParticipantMonogramView_titleLabelContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit23ParticipantMonogramView_subtitleLabelContainer));
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit23ParticipantMonogramView_delegate);
  swift_release();
}

@end