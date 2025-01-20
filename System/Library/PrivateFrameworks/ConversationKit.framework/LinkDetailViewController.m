@interface LinkDetailViewController
- (_TtC15ConversationKit24LinkDetailViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit24LinkDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)didTapDeleteLinkButton;
- (void)didTapJoin;
- (void)viewDidLoad;
@end

@implementation LinkDetailViewController

- (_TtC15ConversationKit24LinkDetailViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  LinkDetailViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  LinkDetailViewController.viewDidLoad()();
}

- (_TtC15ConversationKit24LinkDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  LinkDetailViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController____lazy_storage___dataSource));
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController____lazy_storage___supplementaryViewProvider));
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController____lazy_storage___cellProvider));
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController_cellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<LinkDetailParticipantCollectionViewCell, LinkDetailViewController.Item>?);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController_deleteCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<LinkDetailActionCollectionViewCell, LinkDetailViewController.Item>?);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController_shareCellRegistration, &demangling cache variable for type metadata for UICollectionView.CellRegistration<LinkDetailActionCollectionViewCell, LinkDetailViewController.Item>?);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController_linkDetailHeaderSupplementaryViewRegistration, &demangling cache variable for type metadata for UICollectionView.SupplementaryRegistration<LinkDetailHeaderView>?);
  id v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController_cellBackgroundConfiguration;
  type metadata accessor for UIBackgroundConfiguration();
  OUTLINED_FUNCTION_0();
  (*(void (**)(char *))(v4 + 8))(v3);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController_linkShareCoordinator));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController_avatarController));
  id v5 = (char *)self + OBJC_IVAR____TtC15ConversationKit24LinkDetailViewController_detailControllerFactory;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

- (void)didTapDeleteLinkButton
{
  v2 = self;
  LinkDetailViewController.didTapDeleteLinkButton()();
}

- (void)didTapJoin
{
  v2 = self;
  LinkDetailViewController.didTapJoin()();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  LinkDetailViewController.collectionView(_:didSelectItemAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end