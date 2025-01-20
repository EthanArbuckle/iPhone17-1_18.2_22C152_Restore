@interface ParticipantGridViewController
- (BOOL)_canShowWhileLocked;
- (_TtC15ConversationKit29ParticipantGridViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit29ParticipantGridViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)forceBumpPriority;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation ParticipantGridViewController

- (_TtC15ConversationKit29ParticipantGridViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  ParticipantGridViewController.init(coder:)();
}

- (void)loadView
{
  v2 = self;
  ParticipantGridViewController.loadView()();
}

- (void)viewDidLoad
{
  v2 = self;
  ParticipantGridViewController.viewDidLoad()();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)forceBumpPriority
{
  v2 = self;
  ParticipantGridViewController.forceBumpPriority()();
}

- (_TtC15ConversationKit29ParticipantGridViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  ParticipantGridViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29ParticipantGridViewController_forceAudioPriorityButton));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29ParticipantGridViewController_focusedParticipant, &demangling cache variable for type metadata for Participant?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29ParticipantGridViewController_sashedParticipant, &demangling cache variable for type metadata for Participant?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29ParticipantGridViewController_selectedParticipant, &demangling cache variable for type metadata for Participant?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29ParticipantGridViewController_fullScreenFocusedParticipant, &demangling cache variable for type metadata for Participant?);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29ParticipantGridViewController_participantsViewControllerDelegate);
  id v3 = (char *)self
     + OBJC_IVAR____TtC15ConversationKit29ParticipantGridViewController_participantGridViewControllerDelegate;
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)v3);
}

@end