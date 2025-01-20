@interface InCallControlsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)audioIsEnabled;
- (BOOL)cinematicFramingIsAvailable;
- (BOOL)cinematicFramingIsEnabled;
- (BOOL)effectsAreAvailable;
- (BOOL)effectsAreEnabled;
- (BOOL)isExpanded;
- (BOOL)isScreenSharing;
- (BOOL)shouldShowLeaveButton;
- (BOOL)videoButtonIsEnabled;
- (BOOL)videoIsEnabled;
- (NSString)description;
- (UIView)audioButton;
- (_TtC15ConversationKit28InCallControlsViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit28InCallControlsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)accessibilityCameraButton;
- (id)accessibilityCameraLabel;
- (id)accessibilityDisableVideoButton;
- (id)accessibilityDisableVideoLabel;
- (id)accessibilityEffectsButton;
- (id)accessibilityEffectsLabel;
- (id)accessibilityHotdog;
- (id)accessibilityJoinLeaveButton;
- (id)accessibilityMuteAudioButton;
- (id)accessibilityMuteAudioLabel;
- (id)accessibilityRouteButton;
- (id)accessibilityRouteLabel;
- (void)didMoveToParentViewController:(id)a3;
- (void)didTapEffectsButton:(id)a3;
- (void)didTapFlipCameraButton:(id)a3;
- (void)didTapJoinLeaveButton:(id)a3;
- (void)didTapMuteButton:(id)a3;
- (void)didTapScreenShareButton:(id)a3;
- (void)didTapToggleCameraButton:(id)a3;
- (void)didTapToggleCinematicFramingButton:(id)a3;
- (void)embedEffectsBrowserViewController:(id)a3;
- (void)handleLegacyCallStatusDidChangeNotification:(id)a3;
- (void)loadView;
- (void)setAudioIsEnabled:(BOOL)a3;
- (void)setCinematicFramingIsAvailable:(BOOL)a3;
- (void)setCinematicFramingIsEnabled:(BOOL)a3;
- (void)setEffectsAreAvailable:(BOOL)a3;
- (void)setEffectsAreEnabled:(BOOL)a3;
- (void)setIsExpanded:(BOOL)a3;
- (void)setIsScreenSharing:(BOOL)a3;
- (void)setShouldShowLeaveButton:(BOOL)a3;
- (void)setVideoButtonIsEnabled:(BOOL)a3;
- (void)setVideoIsEnabled:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAudioRouteButtonFor:(id)a3;
- (void)updateControlsVisibilityForExpandedState:(BOOL)a3;
- (void)updateToRepresentLegacyCall:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation InCallControlsViewController

- (BOOL)isExpanded
{
  return InCallControlsViewController.isExpanded.getter() & 1;
}

- (void)setIsExpanded:(BOOL)a3
{
  v4 = self;
  InCallControlsViewController.isExpanded.setter(a3);
}

- (BOOL)audioIsEnabled
{
  return InCallControlsViewController.audioIsEnabled.getter() & 1;
}

- (void)setAudioIsEnabled:(BOOL)a3
{
  v4 = self;
  InCallControlsViewController.audioIsEnabled.setter(a3);
}

- (BOOL)videoIsEnabled
{
  return InCallControlsViewController.videoIsEnabled.getter() & 1;
}

- (void)setVideoIsEnabled:(BOOL)a3
{
  v4 = self;
  InCallControlsViewController.videoIsEnabled.setter(a3);
}

- (BOOL)isScreenSharing
{
  return InCallControlsViewController.isScreenSharing.getter() & 1;
}

- (void)setIsScreenSharing:(BOOL)a3
{
  v4 = self;
  InCallControlsViewController.isScreenSharing.setter(a3);
}

- (BOOL)cinematicFramingIsAvailable
{
  return InCallControlsViewController.cinematicFramingIsAvailable.getter() & 1;
}

- (void)setCinematicFramingIsAvailable:(BOOL)a3
{
  v4 = self;
  InCallControlsViewController.cinematicFramingIsAvailable.setter(a3);
}

- (BOOL)cinematicFramingIsEnabled
{
  return InCallControlsViewController.cinematicFramingIsEnabled.getter() & 1;
}

- (void)setCinematicFramingIsEnabled:(BOOL)a3
{
  v4 = self;
  InCallControlsViewController.cinematicFramingIsEnabled.setter(a3);
}

- (BOOL)effectsAreAvailable
{
  return InCallControlsViewController.effectsAreAvailable.getter() & 1;
}

- (void)setEffectsAreAvailable:(BOOL)a3
{
  v4 = self;
  InCallControlsViewController.effectsAreAvailable.setter(a3);
}

- (BOOL)effectsAreEnabled
{
  return InCallControlsViewController.effectsAreEnabled.getter() & 1;
}

- (void)setEffectsAreEnabled:(BOOL)a3
{
  v4 = self;
  InCallControlsViewController.effectsAreEnabled.setter(a3);
}

- (BOOL)shouldShowLeaveButton
{
  return InCallControlsViewController.shouldShowLeaveButton.getter() & 1;
}

- (void)setShouldShowLeaveButton:(BOOL)a3
{
  v4 = self;
  InCallControlsViewController.shouldShowLeaveButton.setter(a3);
}

- (UIView)audioButton
{
  v2 = InCallControlsViewController.audioButton.getter();
  return (UIView *)v2;
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = InCallControlsViewController.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x1C87730B0](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC15ConversationKit28InCallControlsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  InCallControlsViewController.init(coder:)();
}

- (void)embedEffectsBrowserViewController:(id)a3
{
  uint64_t v4 = (UIViewController *)a3;
  uint64_t v5 = self;
  InCallControlsViewController.embedEffectsBrowserViewController(_:)(v4);
}

- (void)loadView
{
  v2 = self;
  InCallControlsViewController.loadView()();
}

- (void)viewDidLoad
{
  v2 = self;
  InCallControlsViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  InCallControlsViewController.viewDidAppear(_:)(a3);
}

- (void)willMoveToParentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  InCallControlsViewController.willMove(toParent:)((UIViewController_optional *)a3);
}

- (void)didMoveToParentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  InCallControlsViewController.didMove(toParent:)((UIViewController_optional *)a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  InCallControlsViewController.traitCollectionDidChange(_:)(v9);
}

- (void)updateViewConstraints
{
  v2 = self;
  InCallControlsViewController.updateViewConstraints()();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  InCallControlsViewController.viewDidLayoutSubviews()();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)didTapEffectsButton:(id)a3
{
  id v4 = a3;
  id v5 = self;
  InCallControlsViewController.didTapEffectsButton(_:)(v4);
}

- (void)didTapFlipCameraButton:(id)a3
{
  id v4 = a3;
  id v5 = self;
  InCallControlsViewController.didTapFlipCameraButton(_:)(v4, (uint64_t)"User tapped flip camera button in in-call controls", 50, 4uLL);
}

- (void)didTapJoinLeaveButton:(id)a3
{
  id v4 = a3;
  id v5 = self;
  InCallControlsViewController.didTapJoinLeaveButton(_:)(v4);
}

- (void)didTapToggleCameraButton:(id)a3
{
  id v4 = a3;
  id v5 = self;
  InCallControlsViewController.didTapFlipCameraButton(_:)(v4, (uint64_t)"User tapped toggle video button in in-call controls", 51, 6uLL);
}

- (void)didTapScreenShareButton:(id)a3
{
  id v4 = a3;
  id v5 = self;
  InCallControlsViewController.didTapFlipCameraButton(_:)(v4, (uint64_t)"User tapped toggle screen share in in-call controls", 51, 0xFuLL);
}

- (void)didTapToggleCinematicFramingButton:(id)a3
{
  id v4 = a3;
  id v5 = self;
  InCallControlsViewController.didTapFlipCameraButton(_:)(v4, (uint64_t)"User tapped toggle center stage button in in-call controls", 58, 7uLL);
}

- (void)didTapMuteButton:(id)a3
{
  id v4 = a3;
  id v5 = self;
  InCallControlsViewController.didTapFlipCameraButton(_:)(v4, (uint64_t)"User tapped mute audio toggle button in in-call controls", 56, 5uLL);
}

- (void)updateControlsVisibilityForExpandedState:(BOOL)a3
{
  id v4 = self;
  InCallControlsViewController.updateControlsVisibility(forExpandedState:)(a3);
}

- (void)updateAudioRouteButtonFor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  InCallControlsViewController.updateAudioRouteButton(for:)();
}

- (void)updateToRepresentLegacyCall:(id)a3
{
  id v4 = a3;
  id v5 = self;
  InCallControlsViewController.updateToRepresentLegacyCall(_:)();
}

- (id)accessibilityHotdog
{
  v2 = InCallControlsViewController.accessibilityHotdog()();
  return v2;
}

- (id)accessibilityJoinLeaveButton
{
  v2 = InCallControlsViewController.accessibilityJoinLeaveButton()(&OBJC_IVAR____TtC15ConversationKit18InCallControlsView_joinLeaveButton);
  return v2;
}

- (id)accessibilityEffectsButton
{
  v2 = InCallControlsViewController.accessibilityJoinLeaveButton()(&OBJC_IVAR____TtC15ConversationKit18InCallControlsView_effectsButton);
  return v2;
}

- (id)accessibilityEffectsLabel
{
  v2 = InCallControlsViewController.accessibilityEffectsLabel()(&OBJC_IVAR____TtC15ConversationKit18InCallControlsView_effectsButton);
  return v2;
}

- (id)accessibilityCameraButton
{
  v2 = InCallControlsViewController.accessibilityJoinLeaveButton()(&OBJC_IVAR____TtC15ConversationKit18InCallControlsView_flipCameraButton);
  return v2;
}

- (id)accessibilityCameraLabel
{
  v2 = InCallControlsViewController.accessibilityEffectsLabel()(&OBJC_IVAR____TtC15ConversationKit18InCallControlsView_flipCameraButton);
  return v2;
}

- (id)accessibilityMuteAudioButton
{
  v2 = InCallControlsViewController.accessibilityJoinLeaveButton()(&OBJC_IVAR____TtC15ConversationKit18InCallControlsView_muteButton);
  return v2;
}

- (id)accessibilityMuteAudioLabel
{
  v2 = InCallControlsViewController.accessibilityEffectsLabel()(&OBJC_IVAR____TtC15ConversationKit18InCallControlsView_muteButton);
  return v2;
}

- (id)accessibilityRouteButton
{
  v2 = InCallControlsViewController.accessibilityJoinLeaveButton()(&OBJC_IVAR____TtC15ConversationKit18InCallControlsView_audioRouteButton);
  return v2;
}

- (id)accessibilityRouteLabel
{
  v2 = InCallControlsViewController.accessibilityEffectsLabel()(&OBJC_IVAR____TtC15ConversationKit18InCallControlsView_audioRouteButton);
  return v2;
}

- (id)accessibilityDisableVideoButton
{
  v2 = InCallControlsViewController.accessibilityJoinLeaveButton()(&OBJC_IVAR____TtC15ConversationKit18InCallControlsView_toggleCameraButton);
  return v2;
}

- (id)accessibilityDisableVideoLabel
{
  v2 = InCallControlsViewController.accessibilityEffectsLabel()(&OBJC_IVAR____TtC15ConversationKit18InCallControlsView_toggleCameraButton);
  return v2;
}

- (_TtC15ConversationKit28InCallControlsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  InCallControlsViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_tableViewSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_collectionViewController));
  _s15ConversationKit11ParticipantVWOhTm_5((uint64_t)self + OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_localParticipant, (void (*)(void))type metadata accessor for Participant);
  outlined consume of InCallControlsViewController.ViewContent?(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_viewContent), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_viewContent), *(void **)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_viewContent), *(void **)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_viewContent), *(uint64_t *)((char *)&self->super._view + OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_viewContent), *(void **)((char *)&self->super._tabBarItem+ OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_viewContent), *(void **)((char *)&self->super._tab + OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_viewContent));
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_delegate);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_participantDelegate);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_participantsViewControllerDelegate);
  id v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit28InCallControlsViewController_menuHostViewController;
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)v3);
}

- (void)handleLegacyCallStatusDidChangeNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  InCallControlsViewController.handleLegacyCallStatusDidChangeNotification(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)videoButtonIsEnabled
{
  v2 = self;
  unsigned __int8 v3 = InCallControlsViewController.videoButtonIsEnabled.getter();

  return v3 & 1;
}

- (void)setVideoButtonIsEnabled:(BOOL)a3
{
  uint64_t v4 = self;
  InCallControlsViewController.videoButtonIsEnabled.setter(a3);
}

@end