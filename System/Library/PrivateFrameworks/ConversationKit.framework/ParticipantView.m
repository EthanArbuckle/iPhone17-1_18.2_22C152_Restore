@interface ParticipantView
- (BOOL)isExpanded;
- (BOOL)isInRoster;
- (BOOL)shouldOverrideShadowHidden;
- (CGAffineTransform)transform;
- (_TtC15ConversationKit15ParticipantView)initWithCoder:(id)a3;
- (_TtC15ConversationKit15ParticipantView)initWithFrame:(CGRect)a3;
- (_TtC15ConversationKit19ParticipantInfoView)infoView;
- (_TtC15ConversationKit21ParticipantViewButton)kickMemberButton;
- (_TtC15ConversationKit23ParticipantMonogramView)monogramView;
- (void)dealloc;
- (void)didTapKickMember;
- (void)layoutSubviews;
- (void)setInfoView:(id)a3;
- (void)setIsExpanded:(BOOL)a3;
- (void)setIsInRoster:(BOOL)a3;
- (void)setShouldOverrideShadowHidden:(BOOL)a3;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation ParticipantView

- (CGAffineTransform)transform
{
  v4 = self;
  ParticipantView.transform.getter();

  *retstr = v6;
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&a3->tx;
  v4 = self;
  ParticipantView.transform.setter(v5);
}

- (_TtC15ConversationKit23ParticipantMonogramView)monogramView
{
  id v2 = ParticipantView.monogramView.getter();
  return (_TtC15ConversationKit23ParticipantMonogramView *)v2;
}

- (_TtC15ConversationKit19ParticipantInfoView)infoView
{
  id v2 = self;
  long long v3 = ParticipantView.infoView.getter();

  return (_TtC15ConversationKit19ParticipantInfoView *)v3;
}

- (void)setInfoView:(id)a3
{
  id v4 = a3;
  v5 = self;
  ParticipantView.infoView.setter((uint64_t)v4);
}

- (_TtC15ConversationKit21ParticipantViewButton)kickMemberButton
{
  id v2 = ParticipantView.kickMemberButton.getter();
  return (_TtC15ConversationKit21ParticipantViewButton *)v2;
}

- (BOOL)isInRoster
{
  return ParticipantView.isInRoster.getter() & 1;
}

- (void)setIsInRoster:(BOOL)a3
{
  id v4 = self;
  ParticipantView.isInRoster.setter(a3);
}

- (BOOL)shouldOverrideShadowHidden
{
  return ParticipantView.shouldOverrideShadowHidden.getter() & 1;
}

- (void)setShouldOverrideShadowHidden:(BOOL)a3
{
  id v4 = self;
  ParticipantView.shouldOverrideShadowHidden.setter(a3);
}

- (BOOL)isExpanded
{
  return ParticipantView.isExpanded.getter() & 1;
}

- (void)setIsExpanded:(BOOL)a3
{
  id v4 = self;
  ParticipantView.isExpanded.setter(a3);
}

- (_TtC15ConversationKit15ParticipantView)initWithCoder:(id)a3
{
  id v3 = a3;
  ParticipantView.init(coder:)();
}

- (void)dealloc
{
  id v2 = self;
  ParticipantView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit15ParticipantView_backgroundEffectsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit15ParticipantView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit15ParticipantView_monogramView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit15ParticipantView_videoView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit15ParticipantView_alertView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit15ParticipantView_videoOverlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit15ParticipantView____lazy_storage___infoView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit15ParticipantView_prominenceBorderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit15ParticipantView_debugLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit15ParticipantView_kickMemberButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit15ParticipantView_gradientOverlayView));
  id v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit15ParticipantView_loggingIdentifier;
  type metadata accessor for UUID();
  OUTLINED_FUNCTION_0();
  (*(void (**)(char *))(v4 + 8))(v3);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit15ParticipantView_hideInfoViewTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit15ParticipantView_hideAlertViewTimer));
  swift_release();
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit15ParticipantView_participantIdentifier, (uint64_t *)&demangling cache variable for type metadata for UUID?);
  v5 = (char *)self + OBJC_IVAR____TtC15ConversationKit15ParticipantView_delegate;
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)v5);
}

- (void)layoutSubviews
{
  id v2 = self;
  ParticipantView.layoutSubviews()();
}

- (void)didTapKickMember
{
  id v2 = self;
  ParticipantView.didTapKickMember()();
}

- (_TtC15ConversationKit15ParticipantView)initWithFrame:(CGRect)a3
{
}

@end