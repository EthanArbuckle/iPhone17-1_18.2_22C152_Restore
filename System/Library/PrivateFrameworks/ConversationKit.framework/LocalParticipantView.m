@interface LocalParticipantView
- (_TtC15ConversationKit20LocalParticipantView)initWithCoder:(id)a3;
- (_TtC15ConversationKit20LocalParticipantView)initWithFrame:(CGRect)a3;
- (_TtC15ConversationKit28LocalParticipantControlsView)controlsView;
- (void)handleLongPress:(id)a3;
- (void)layoutSubviews;
- (void)updateCountdownWith:(int64_t)a3;
@end

@implementation LocalParticipantView

- (_TtC15ConversationKit28LocalParticipantControlsView)controlsView
{
  id v2 = LocalParticipantView.controlsView.getter();
  return (_TtC15ConversationKit28LocalParticipantControlsView *)v2;
}

- (_TtC15ConversationKit20LocalParticipantView)initWithCoder:(id)a3
{
  id v3 = a3;
  LocalParticipantView.init(coder:)();
}

- (_TtC15ConversationKit20LocalParticipantView)initWithFrame:(CGRect)a3
{
}

- (void)handleLongPress:(id)a3
{
  v4 = (UILongPressGestureRecognizer *)a3;
  v5 = self;
  LocalParticipantView.handleLongPress(_:)(v4);
}

- (void)layoutSubviews
{
  id v2 = self;
  LocalParticipantView.layoutSubviews()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit20LocalParticipantView_participantView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit20LocalParticipantView_controlsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit20LocalParticipantView_countdownLabel));
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit20LocalParticipantView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit20LocalParticipantView____lazy_storage___overlayBlurView));
  id v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit20LocalParticipantView__videoMessagingState;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<VideoMessageController.State>);
  OUTLINED_FUNCTION_0();
  v6 = *(void (**)(char *, uint64_t))(v5 + 8);
  v6(v3, v4);
}

- (void)updateCountdownWith:(int64_t)a3
{
  uint64_t v4 = self;
  LocalParticipantView.updateCountdownWith(_:)(a3);
}

@end