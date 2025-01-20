@interface ParticipantListViewController
- (BOOL)_canShowWhileLocked;
- (_TtC15ConversationKit29ParticipantListViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit29ParticipantListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)accessibilityParticipantCollectionView;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation ParticipantListViewController

- (_TtC15ConversationKit29ParticipantListViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  ParticipantListViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  ParticipantListViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  ParticipantListViewController.viewDidAppear(_:)(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  ParticipantListViewController.viewDidLayoutSubviews()();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  v2 = self;
  ParticipantListViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29ParticipantListViewController_collectionViewDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29ParticipantListViewController_participantListLayout));
  outlined consume of ConversationControlsRecipe.View?(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15ConversationKit29ParticipantListViewController_viewContent), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15ConversationKit29ParticipantListViewController_viewContent));
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29ParticipantListViewController_participantsViewControllerDelegate);
  id v3 = (char *)self
     + OBJC_IVAR____TtC15ConversationKit29ParticipantListViewController_participantListViewControllerDelegate;
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)v3);
}

- (id)accessibilityParticipantCollectionView
{
  v2 = ParticipantListViewController.accessibilityParticipantCollectionView()();
  return v2;
}

- (_TtC15ConversationKit29ParticipantListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  ParticipantListViewController.init(nibName:bundle:)();
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  ParticipantListViewController.collectionView(_:willDisplay:forItemAt:)((uint64_t)v14, v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  ParticipantListViewController.collectionView(_:didEndDisplaying:forItemAt:)((uint64_t)v14, v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

@end