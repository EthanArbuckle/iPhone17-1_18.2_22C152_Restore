@interface InCallControlsCollectionViewController
- (BOOL)_canShowWhileLocked;
- (_TtC15ConversationKit38InCallControlsCollectionViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit38InCallControlsCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)blockStatusDidUpdate;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)didTapPTTLeaveChannelButton:(id)a3;
- (void)handleContentSizeCategoryDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation InCallControlsCollectionViewController

- (_TtC15ConversationKit38InCallControlsCollectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  InCallControlsCollectionViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  InCallControlsCollectionViewController.viewDidLoad()();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)blockStatusDidUpdate
{
  v2 = self;
  InCallControlsCollectionViewController.blockStatusDidUpdate()();
}

- (void)handleContentSizeCategoryDidChange:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Notification?);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for Notification();
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = type metadata accessor for Notification();
    uint64_t v9 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v7, v9, 1, v8);
  v10 = self;
  InCallControlsCollectionViewController.handleContentSizeCategoryDidChange(_:)();

  outlined destroy of SystemUpdateNotice?((uint64_t)v7, &demangling cache variable for type metadata for Notification?);
}

- (_TtC15ConversationKit38InCallControlsCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  InCallControlsCollectionViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_features));
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_menuHostViewController);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController____lazy_storage___featureFlags));
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_activity, &demangling cache variable for type metadata for Activity?);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_conversation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_controlsManager));
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_participantsViewControllerDelegate);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_inCallControlsCollectionViewControllerDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_dataSource));
  swift_release();
  swift_release();
  outlined destroy of SystemUpdateNotice?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_sectionHeaderViewRegistration, &demangling cache variable for type metadata for UICollectionView.SupplementaryRegistration<InCallControlsSectionHeaderView>?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_activityCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsActivityCell, UUID>?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_titleCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsTitleCell, UUID>?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_statusCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsStatusCell, UUID>?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_participantCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsParticipantCell, UUID>?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_addParticipantCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsAddParticipantCell, UUID>?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_shareLinkCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsShareLinkCell, UUID>?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_ignoreLMIRequestsCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsIgnoreLMIRequestsCell, UUID>?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_toggleCaptionsCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsToggleCaptionsCell, UUID>?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_fallbackCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<UICollectionViewListCell, UUID>?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_openMessagesCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsOpenMessagesCell, UUID>?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_blockUnknownCallerCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsBlockCell, UUID>?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_reportUnknownCallerCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsReportCell, UUID>?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_pttTitleCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsPTTTitleCell, UUID>?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_leavePTTChannelCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsPTTLeaveChannelCell, UUID>?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_leaveChannelFooterViewRegistration, &demangling cache variable for type metadata for UICollectionView.SupplementaryRegistration<InCallControlsPTTLeaveChannelFooterView>?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38InCallControlsCollectionViewController_openPTTAppCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<InCallControlsPTTOpenAppCell, UUID>?);
}

- (void)didTapPTTLeaveChannelButton:(id)a3
{
  id v4 = a3;
  id v5 = self;
  InCallControlsCollectionViewController.didTapPTTLeaveChannelButton(_:)((uint64_t)v4);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  InCallControlsCollectionViewController.collectionView(_:didSelectItemAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end