@interface FTRecentsListViewController
- (FTRecentsListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4;
- (void)beginEditing;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)contactStoreDidChange:(id)a3;
- (void)deleteAllRecents:(id)a3;
- (void)deleteButtonAction:(id)a3;
- (void)didConfirmForInterventionViewController:(id)a3;
- (void)didEnterBackgroundNotification:(id)a3;
- (void)didRejectForInterventionViewController:(id)a3;
- (void)didSelectAccessoryViewForLinkWithSender:(id)a3;
- (void)didSelectAccessoryViewForOngoingCallWithSender:(id)a3;
- (void)didSelectAccessoryViewForRecentCallWithSender:(id)a3;
- (void)didTapNewCallButton;
- (void)didTapNewLinkButtonFrom:(id)a3;
- (void)dismissContactsModal;
- (void)dismissMoreHelp;
- (void)endEditing;
- (void)presentOnboardingViewController;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willEnterForegroundNotification:(id)a3;
@end

@implementation FTRecentsListViewController

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
  RecentsListViewController.collectionView(_:willDisplay:forItemAt:)();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
}

- (void)scrollViewDidScroll:(id)a3
{
  v4 = (UIScrollView *)a3;
  v5 = self;
  RecentsListViewController.scrollViewDidScroll(_:)(v4);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  RecentsListViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  RecentsListViewController.viewDidLoad()();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  RecentsListViewController.viewWillLayoutSubviews()();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  RecentsListViewController.viewDidAppear(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  RecentsListViewController.viewWillDisappear(_:)(a3);
}

- (FTRecentsListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  RecentsListViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___FTRecentsListViewController_avatarViewControllerSettings));

  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR___FTRecentsListViewController_indexPathForMenu, &demangling cache variable for type metadata for IndexPath?);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___FTRecentsListViewController_meCardSharingSettingsViewControllerObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___FTRecentsListViewController_callItemBlockContactsDelegate));
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___FTRecentsListViewController_presentScreenTimeShield));
  swift_release();

  swift_release();
  swift_release();
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___FTRecentsListViewController____lazy_storage___supplementaryViewProvider));
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___FTRecentsListViewController____lazy_storage___cellProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___FTRecentsListViewController____lazy_storage___collectionView));
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR___FTRecentsListViewController____lazy_storage___cellBackgroundConfiguration, &demangling cache variable for type metadata for UIBackgroundConfiguration?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR___FTRecentsListViewController_cellRegistrationForRecentsCallItemCalls, &demangling cache variable for type metadata for UICollectionView.CellRegistration<RecentsCollectionViewCell, RecentsCallItem>?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR___FTRecentsListViewController_cellRegistrationForRecentsSensitveCallItemCalls, &demangling cache variable for type metadata for UICollectionView.CellRegistration<RecentsCollectionViewCell, RecentsCallItem>?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR___FTRecentsListViewController_cellRegistrationForRecentsCallItemOngoingCalls, &demangling cache variable for type metadata for UICollectionView.CellRegistration<RecentsCollectionViewCell, RecentsCallItem>?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR___FTRecentsListViewController_cellRegistrationForRecentsCallItemLinks, &demangling cache variable for type metadata for UICollectionView.CellRegistration<RecentsCollectionViewCell, RecentsCallItem>?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR___FTRecentsListViewController_sectionHeaderViewRegistrationForSupplementalView, &demangling cache variable for type metadata for UICollectionView.SupplementaryRegistration<UICollectionViewListCell>?);
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR___FTRecentsListViewController_headerButtonsViewRegistration, &demangling cache variable for type metadata for UICollectionView.SupplementaryRegistration<RecentsHeaderButtonsView>?);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___FTRecentsListViewController____lazy_storage___deleteButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___FTRecentsListViewController____lazy_storage___flexibleSpaceButtonItem));
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR___FTRecentsListViewController____lazy_storage___collectionLayoutConfiguration, &demangling cache variable for type metadata for UICollectionLayoutListConfiguration?);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___FTRecentsListViewController____lazy_storage___editMenu));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___FTRecentsListViewController____lazy_storage___avatarViewControllerDelegate));
  swift_bridgeObjectRelease();
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR___FTRecentsListViewController_messageUUIDForDeferredPresentation, (uint64_t *)&demangling cache variable for type metadata for UUID?);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___FTRecentsListViewController_onboardingController));
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR___FTRecentsListViewController_joinCallThrottlingIndexPath, &demangling cache variable for type metadata for IndexPath?);
}

- (void)deleteAllRecents:(id)a3
{
}

- (void)willEnterForegroundNotification:(id)a3
{
}

- (void)didEnterBackgroundNotification:(id)a3
{
}

- (void)didSelectAccessoryViewForOngoingCallWithSender:(id)a3
{
  v4 = (UIButton *)a3;
  id v5 = self;
  RecentsListViewController.didSelectAccessoryViewForOngoingCall(sender:)(v4);
}

- (void)didSelectAccessoryViewForRecentCallWithSender:(id)a3
{
  v4 = (UIButton *)a3;
  id v5 = self;
  RecentsListViewController.didSelectAccessoryViewForRecentCall(sender:)(v4);
}

- (void)didSelectAccessoryViewForLinkWithSender:(id)a3
{
  v4 = (UIButton *)a3;
  id v5 = self;
  RecentsListViewController.didSelectAccessoryViewForLink(sender:)(v4);
}

- (void)didTapNewCallButton
{
  v2 = self;
  RecentsListViewController.didTapNewCallButton()();
}

- (void)didTapNewLinkButtonFrom:(id)a3
{
  id v4 = a3;
  id v5 = self;
  RecentsListViewController.didTapNewLinkButton(from:)((uint64_t)v4);
}

- (void)presentOnboardingViewController
{
  v2 = self;
  RecentsListViewController.presentOnboardingViewController()();
}

- (void)beginEditing
{
  v2 = self;
  RecentsListViewController.beginEditing()();
}

- (void)endEditing
{
  v2 = self;
  RecentsListViewController.endEditing()();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  RecentsListViewController.collectionView(_:didSelectItemAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  RecentsListViewController.collectionView(_:didDeselectItemAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  uint64_t v12 = self;
  RecentsListViewController.collectionView(_:contextMenuConfigurationForItemAt:point:)();
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  uint64_t v6 = (UICollectionView *)a3;
  id v7 = a4;
  uint64_t v8 = self;
  id v10 = (void *)RecentsListViewController.collectionView(_:previewForHighlightingContextMenuWithConfiguration:)(v6, v9);

  return v10;
}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
}

- (void)didConfirmForInterventionViewController:(id)a3
{
}

- (void)didRejectForInterventionViewController:(id)a3
{
}

- (void)dismissMoreHelp
{
  v2 = self;
  RecentsListViewController.dismissMoreHelp()();
}

- (void)contactStoreDidChange:(id)a3
{
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v6 = self;
  RecentsListViewController.setEditing(_:animated:)(a3, a4);
}

- (void)deleteButtonAction:(id)a3
{
  id v4 = a3;
  id v5 = self;
  RecentsListViewController.deleteButtonAction(_:)();
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v5 = self;
  RecentsListViewController.scrollViewWillBeginDragging(_:)((UIScrollView *)v5);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = self;
  RecentsListViewController.scrollViewDidEndDecelerating(_:)((UIScrollView *)v5);
}

- (void)dismissContactsModal
{
  v2 = self;
  RecentsListViewController.dismissContactsModal()();
}

@end