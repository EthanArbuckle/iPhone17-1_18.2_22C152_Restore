@interface PeoplePickerViewController
- (_TtC15ConversationKit26PeoplePickerViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit26PeoplePickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)menuForPillView:(id)a3;
- (id)searchController:(id)a3 composeRecipientForAddress:(id)a4;
- (id)searchController:(id)a3 contextMenuConfigurationForRecipient:(id)a4;
- (id)searchController:(id)a3 preferredRecipientForRecipient:(id)a4;
- (id)searchController:(id)a3 tintColorForRecipient:(id)a4;
- (unint64_t)searchController:(id)a3 presentationOptionsForRecipient:(id)a4;
- (void)cancelButtonTapped;
- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3 anchoredToView:(id)a4;
- (void)handleIDSStatusChangedWithNotification:(id)a3;
- (void)keyboardWillHideWithNotification:(id)a3;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)providersChangedForProviderManager:(id)a3;
- (void)searchController:(id)a3 didAddRecipient:(id)a4;
- (void)searchController:(id)a3 didEndDisplayingRowForRecipient:(id)a4;
- (void)searchController:(id)a3 didRemoveRecipient:(id)a4;
- (void)searchController:(id)a3 didTapTableAccessoryForRecipient:(id)a4;
- (void)searchController:(id)a3 willDisplayRowForRecipient:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willDismissViewAnimated:(BOOL)a3;
@end

@implementation PeoplePickerViewController

- (_TtC15ConversationKit26PeoplePickerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  PeoplePickerViewController.init(coder:)();
}

- (_TtC15ConversationKit26PeoplePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  PeoplePickerViewController.init(nibName:bundle:)();
}

- (void)viewDidLoad
{
  v2 = self;
  PeoplePickerViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  PeoplePickerViewController.viewWillAppear(_:)(a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  PeoplePickerViewController.viewWillTransition(to:with:)((uint64_t)a4, width, height);
  swift_unknownObjectRelease();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  PeoplePickerViewController.viewDidDisappear(_:)(a3);
}

- (void)willDismissViewAnimated:(BOOL)a3
{
  v4 = self;
  PeoplePickerViewController.willDismissViewAnimated(_:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_availableRecipientTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_unavailableRecipientTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_gondolaRecipientTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_restrictedRecipientTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_callProviderManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_senderIdentityPillView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_searchController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_reporter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_videoButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_audioButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_addPeopleButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_stackView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_selectedSenderIdentity));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_actionBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_currentConversation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_currentConversationLink));
  outlined consume of UIView??(*(id *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController____lazy_storage___smsAccount));
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_stagedActivity));
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  outlined destroy of NSRunLoop.SchedulerOptions?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit26PeoplePickerViewController_linkShareCoordinator, (uint64_t *)&demangling cache variable for type metadata for LinkShareCoordinatorProtocol?);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (void)keyboardWillHideWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  PeoplePickerViewController.keyboardWillShow(notification:)(v4);
}

- (void)handleIDSStatusChangedWithNotification:(id)a3
{
  id v4 = a3;
  id v5 = self;
  PeoplePickerViewController.handleIDSStatusChanged(notification:)();
}

- (void)cancelButtonTapped
{
  v2 = self;
  PeoplePickerViewController.cancelButtonTapped()();
}

- (id)menuForPillView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  PeoplePickerViewController.menu(for:)();
  v7 = v6;

  return v7;
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4 = a3;
  id v5 = self;
  PeoplePickerViewController.providersChanged(for:)(v4);
}

- (id)searchController:(id)a3 composeRecipientForAddress:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a3;
  v7 = self;
  id v8 = PeoplePickerViewController.searchController(_:composeRecipientForAddress:)();

  swift_bridgeObjectRelease();
  return v8;
}

- (void)searchController:(id)a3 didAddRecipient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  PeoplePickerViewController.searchController(_:didAdd:)((uint64_t)v8, v7);
}

- (void)searchController:(id)a3 didRemoveRecipient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  PeoplePickerViewController.searchController(_:didRemove:)((uint64_t)v8, v7);
}

- (void)searchController:(id)a3 willDisplayRowForRecipient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  PeoplePickerViewController.searchController(_:willDisplayRowFor:)((uint64_t)v8, v7);
}

- (void)searchController:(id)a3 didEndDisplayingRowForRecipient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  PeoplePickerViewController.searchController(_:didEndDisplayingRowFor:)((uint64_t)v8, v7);
}

- (id)searchController:(id)a3 preferredRecipientForRecipient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = PeoplePickerViewController.searchController(_:preferredRecipientFor:)((uint64_t)v8, v7);

  return v9;
}

- (id)searchController:(id)a3 tintColorForRecipient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = (void *)PeoplePickerViewController.searchController(_:tintColorFor:)((uint64_t)v8, v7);

  return v9;
}

- (unint64_t)searchController:(id)a3 presentationOptionsForRecipient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  unint64_t v9 = PeoplePickerViewController.searchController(_:presentationOptionsFor:)((uint64_t)v8, v7);

  return v9;
}

- (void)searchController:(id)a3 didTapTableAccessoryForRecipient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  PeoplePickerViewController.searchController(_:didTapTableAccessoryFor:)((uint64_t)v8, v7);
}

- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3 anchoredToView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  PeoplePickerViewController.didTapTextViewAccessoryButton(for:anchoredTo:)((uint64_t)v8, v7);
}

- (id)searchController:(id)a3 contextMenuConfigurationForRecipient:(id)a4
{
  return 0;
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6 = (MFMessageComposeViewController *)a3;
  id v7 = self;
  PeoplePickerViewController.messageComposeViewController(_:didFinishWith:)(v6, (MessageComposeResult)a4);
}

@end