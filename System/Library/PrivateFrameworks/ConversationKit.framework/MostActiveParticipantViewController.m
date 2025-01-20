@interface MostActiveParticipantViewController
- (BOOL)_canShowWhileLocked;
- (_TtC15ConversationKit35MostActiveParticipantViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit35MostActiveParticipantViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)frontBoardInterfaceOrientation;
- (void)setFrontBoardInterfaceOrientation:(int64_t)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation MostActiveParticipantViewController

- (int64_t)frontBoardInterfaceOrientation
{
  return MostActiveParticipantViewController.frontBoardInterfaceOrientation.getter();
}

- (void)setFrontBoardInterfaceOrientation:(int64_t)a3
{
}

- (_TtC15ConversationKit35MostActiveParticipantViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  MostActiveParticipantViewController.init(coder:)();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  MostActiveParticipantViewController.viewDidLoad()();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  MostActiveParticipantViewController.viewDidLayoutSubviews()();
}

- (_TtC15ConversationKit35MostActiveParticipantViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  MostActiveParticipantViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  _s15ConversationKit11ParticipantV5StateOWOhTm_2((uint64_t)self + OBJC_IVAR____TtC15ConversationKit35MostActiveParticipantViewController_localParticipant, (void (*)(void))type metadata accessor for Participant);
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit35MostActiveParticipantViewController_focusedParticipant, &demangling cache variable for type metadata for Participant?);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit35MostActiveParticipantViewController_participantsViewControllerDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit35MostActiveParticipantViewController____lazy_storage___remoteParticipantView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit35MostActiveParticipantViewController____lazy_storage___localParticipantView));
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit35MostActiveParticipantViewController____lazy_storage___flashView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit35MostActiveParticipantViewController____lazy_storage___insulatingView);
  outlined consume of UIView??(v3);
}

@end