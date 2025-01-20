@interface LocalParticipantControlsView
- (UIControl)cameraBlurButton;
- (UIControl)cameraFlipButton;
- (UIControl)cinematicFramingButton;
- (UIControl)collapseButton;
- (UIControl)effectsButton;
- (UIControl)reactionEffectGestureButton;
- (UIControl)rotateButton;
- (UIControl)studioLightButton;
- (UIControl)videoPauseButton;
- (UIView)shutterButton;
- (_TtC15ConversationKit28LocalParticipantControlsView)init;
- (_TtC15ConversationKit28LocalParticipantControlsView)initWithCoder:(id)a3;
- (_TtC15ConversationKit28LocalParticipantControlsView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)callBack;
- (void)close;
- (void)handleCameraBlurTapped;
- (void)handleCameraFlipTapped;
- (void)handleCinematicFramingTapped;
- (void)handleCollapseButtonTapped;
- (void)handleEffectsTapped;
- (void)handleReactionEffectGestureTapped;
- (void)handleRotateButtonTapped;
- (void)handleShutterButtonTapped;
- (void)handleStudioLightTapped;
- (void)handleVideoMessageButtonTapped;
- (void)layoutSubviews;
- (void)setShutterButton:(id)a3;
- (void)showCallDetails;
@end

@implementation LocalParticipantControlsView

- (UIControl)effectsButton
{
  id v2 = LocalParticipantControlsView.effectsButton.getter();
  return (UIControl *)v2;
}

- (UIControl)cameraBlurButton
{
  id v2 = LocalParticipantControlsView.cameraBlurButton.getter();
  return (UIControl *)v2;
}

- (UIControl)cinematicFramingButton
{
  id v2 = LocalParticipantControlsView.cinematicFramingButton.getter();
  return (UIControl *)v2;
}

- (UIControl)collapseButton
{
  id v2 = LocalParticipantControlsView.collapseButton.getter();
  return (UIControl *)v2;
}

- (UIControl)rotateButton
{
  id v2 = LocalParticipantControlsView.rotateButton.getter();
  return (UIControl *)v2;
}

- (UIControl)cameraFlipButton
{
  id v2 = LocalParticipantControlsView.cameraFlipButton.getter();
  return (UIControl *)v2;
}

- (UIControl)reactionEffectGestureButton
{
  id v2 = LocalParticipantControlsView.reactionEffectGestureButton.getter();
  return (UIControl *)v2;
}

- (UIControl)studioLightButton
{
  id v2 = LocalParticipantControlsView.studioLightButton.getter();
  return (UIControl *)v2;
}

- (UIControl)videoPauseButton
{
  id v2 = LocalParticipantControlsView.videoPauseButton.getter();
  return (UIControl *)v2;
}

- (UIView)shutterButton
{
  id v2 = self;
  id v3 = LocalParticipantControlsView.shutterButton.getter();

  return (UIView *)v3;
}

- (void)setShutterButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  LocalParticipantControlsView.shutterButton.setter((uint64_t)v4);
}

- (_TtC15ConversationKit28LocalParticipantControlsView)init
{
  return (_TtC15ConversationKit28LocalParticipantControlsView *)LocalParticipantControlsView.init()();
}

- (_TtC15ConversationKit28LocalParticipantControlsView)initWithCoder:(id)a3
{
  id v3 = a3;
  LocalParticipantControlsView.init(coder:)();
}

- (void)layoutSubviews
{
  id v2 = self;
  LocalParticipantControlsView.layoutSubviews()();
}

- (void)handleEffectsTapped
{
  id v2 = self;
  LocalParticipantControlsView.handleEffectsTapped()();
}

- (void)handleCinematicFramingTapped
{
  id v2 = self;
  LocalParticipantControlsView.handleCinematicFramingTapped()();
}

- (void)handleCameraBlurTapped
{
  id v2 = self;
  LocalParticipantControlsView.handleCameraBlurTapped()();
}

- (void)handleCollapseButtonTapped
{
  id v2 = self;
  LocalParticipantControlsView.handleCollapseButtonTapped()();
}

- (void)handleRotateButtonTapped
{
  id v2 = self;
  LocalParticipantControlsView.handleRotateButtonTapped()();
}

- (void)handleCameraFlipTapped
{
  id v2 = self;
  LocalParticipantControlsView.handleCameraFlipTapped()();
}

- (void)handleReactionEffectGestureTapped
{
  id v2 = self;
  LocalParticipantControlsView.handleReactionEffectGestureTapped()();
}

- (void)handleStudioLightTapped
{
  id v2 = self;
  LocalParticipantControlsView.handleStudioLightTapped()();
}

- (void)handleVideoMessageButtonTapped
{
  id v2 = self;
  LocalParticipantControlsView.handleVideoMessageButtonTapped()();
}

- (void)showCallDetails
{
  id v2 = self;
  LocalParticipantControlsView.showCallDetails()();
}

- (void)callBack
{
  id v2 = self;
  LocalParticipantControlsView.callBack()();
}

- (void)close
{
  id v2 = self;
  LocalParticipantControlsView.close()();
}

- (void)handleShutterButtonTapped
{
  id v2 = self;
  LocalParticipantControlsView.handleShutterButtonTapped()();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v15.value.super.isa = (Class)a4;
  LocalParticipantControlsView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v15);
  v12 = v11;

  return v12;
}

- (_TtC15ConversationKit28LocalParticipantControlsView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_effectsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_cameraBlurButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_cinematicFramingButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_collapseButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_rotateButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_cameraFlipButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_reactionEffectGestureButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_studioLightButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_videoPauseButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_videoMessageControls));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView____lazy_storage___videoMessageViewModel));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView____lazy_storage___spinnerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView____lazy_storage___shutterButton));
  swift_bridgeObjectRelease();
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_controlsLayoutGuide));
  outlined destroy of LocalParticipantControlsView.ViewModel((uint64_t)self + OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView_viewModel, (void (*)(void))type metadata accessor for LocalParticipantControlsView.ViewModel);
  id v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit28LocalParticipantControlsView__videoMessagingState;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<VideoMessageController.State>);
  OUTLINED_FUNCTION_0();
  (*(void (**)(char *))(v4 + 8))(v3);
  swift_bridgeObjectRelease();
  swift_release();
}

@end