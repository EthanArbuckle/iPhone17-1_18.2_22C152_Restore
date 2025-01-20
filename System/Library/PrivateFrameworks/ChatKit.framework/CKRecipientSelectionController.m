@interface CKRecipientSelectionController
- (BOOL)_configureSearchListControllerAsAPopover;
- (BOOL)_isToFieldPushedUp;
- (BOOL)_openStewieAppForEmergencyIfRequired;
- (BOOL)_openStewieAppForRoadsideIfRequired;
- (BOOL)_recipientIsGroup:(id)a3;
- (BOOL)_shouldDisableToField;
- (BOOL)_shouldEnableScrolling;
- (BOOL)_systemUnderLock;
- (BOOL)allowedByScreenTime;
- (BOOL)autocompleteResultsController:(id)a3 willOverrideImageDataForRecipient:(id)a4 completion:(id)a5;
- (BOOL)chooseSelectedSearchResultForComposeRecipientView:(id)a3 context:(unint64_t)a4;
- (BOOL)collapseSelectedSearchResultForComposeRecipientView:(id)a3;
- (BOOL)composeRecipientViewShowingSearchResults:(id)a3;
- (BOOL)didShowOneTimeErrorAlert;
- (BOOL)expandSelectedSearchResultForComposeRecipientView:(id)a3;
- (BOOL)finishedComposingRecipients;
- (BOOL)forceMMS;
- (BOOL)hasEmailRecipientsInAddresses:(id)a3;
- (BOOL)hasFailediMessageRecipients;
- (BOOL)hasIDSResultsForAllRecipients:(id)a3;
- (BOOL)hasPendingiMessageRecipients;
- (BOOL)hasTimedOutRecipients;
- (BOOL)hasUnreachableEmergencyRecipient;
- (BOOL)homogenizePreferredServiceForiMessage;
- (BOOL)isBeingPresentedInMacDetailsView;
- (BOOL)isDisambiguating;
- (BOOL)isEditable;
- (BOOL)isGameCenterRecipient:(id)a3;
- (BOOL)isMAIDGroupsEnabled;
- (BOOL)isPeoplePickerHidden;
- (BOOL)isSearchResultsHidden;
- (BOOL)lastSentMessageWasNotDeliveredForConversation:(id)a3;
- (BOOL)presentSearchResultsForComposeRecipientView:(id)a3;
- (BOOL)preventAtomization;
- (BOOL)shouldShowVerifiedIconForRecipient:(id)a3;
- (BOOL)shouldSuppressSearchResultsTable;
- (BOOL)toFieldIsFirstResponder;
- (CGPoint)scrollSearchListControllerToTopContentOffset;
- (CKAlertController)alternateAddressesAlertController;
- (CKComposeRecipientView)toField;
- (CKDetailsContactsManager)contactsManager;
- (CKManualUpdater)addressBookNotificationUpdater;
- (CKPendingConversation)conversation;
- (CKRecipientAvailabilities)expandedRecipientAvailabilities;
- (CKRecipientSearchListController)searchListController;
- (CKRecipientSelectionController)init;
- (CKRecipientSelectionController)initWithConversation:(id)a3;
- (CKRecipientSelectionControllerDelegate)delegate;
- (CNComposeRecipient)recentContactForPresentedCNCard;
- (CNContactPickerViewController)contactPickerViewController;
- (CNContactStore)contactStore;
- (CoreTelephonyClient)coreTelephonyClient;
- (NSMutableDictionary)recipientAvailabilities;
- (NSMutableDictionary)recipientAvailibityTimers;
- (STConversationContext)currentConversationContext;
- (UIEdgeInsets)_additionalSearchResultsEdgeInsets;
- (UIEdgeInsets)_navigationBarInsets;
- (UIEdgeInsets)layoutMarginsForComposeRecipientView:(id)a3;
- (UILabel)toFieldPlaceholderLabel;
- (UIScrollView)toFieldScrollingView;
- (UIView)headerDecorationView;
- (UIView)separator;
- (UIView)toFieldContainerView;
- (char)_availibilityForRecipient:(id)a3 onService:(id)a4;
- (char)_satelliteConnectedColorOverrideForRecipient:(id)a3 inConversation:(id)a4;
- (char)serviceColorForRecipientAddresses:(id)a3;
- (char)serviceTypeForRecipient:(id)a3;
- (double)_macToFieldHeight;
- (double)_toolbarHeightForNumberOfRows:(unint64_t)a3;
- (double)additionalCatalystTopInset;
- (double)collapsedHeight;
- (double)fieldHeightOffset;
- (double)preferredMacToolbarHeight;
- (id)_addressForRecipient:(id)a3;
- (id)_alternateAddressesForRecipient:(id)a3;
- (id)_alternateiMessagableAddressesForRecipient:(id)a3;
- (id)_canonicalRecipientAddresses;
- (id)_expandedRecipientsForGroupRecipient:(id)a3;
- (id)_recipientCausingTooManyRecipientsError;
- (id)_serviceForRecipientPresentationOptions;
- (id)_toFieldCollapsedTextColor;
- (id)autocompleteResultsController:(id)a3 preferredRecipientForRecipients:(id)a4;
- (id)chatForIMHandle:(id)a3;
- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4;
- (id)composeRecipientView:(id)a3 composeRecipientForContact:(id)a4;
- (id)composeRecipientView:(id)a3 contextMenuConfigurationForAtom:(id)a4;
- (id)conversationForRecipients:(id)a3;
- (id)expandedRecipientsForGroupRecipient:(id)a3;
- (id)gameCenterPickerBlock;
- (id)handleForRecipientNormalizedAddress:(id)a3;
- (id)handlesForScreenTimePolicyCheck;
- (id)preferredColorTypeForExistingConversation:(id)a3;
- (id)preferredRecipientForExistingConversationOfRecipients:(id)a3;
- (id)preferredRecipientForNewContact:(id)a3;
- (id)preferredRecipientForPendingUnifiedContact:(id)a3;
- (id)preferredRecipientForRecipients:(id)a3;
- (id)preferredRecipientForRecipients:(id)a3 forServiceType:(char)a4;
- (id)recipientIsDuetSuggestion:(id)a3;
- (id)recipients;
- (int64_t)_userInterfaceStyleOverride;
- (int64_t)searchListController:(id)a3 idStatusForIDSID:(id)a4;
- (unint64_t)_atomPresentationOptionsForRecipient:(id)a3;
- (unint64_t)numberOfRowsInToField;
- (void)_adjustToFieldPositionIfNecessary;
- (void)_adjustToFieldSeparatorInsetsIfNecessary;
- (void)_dismissPeoplePicker;
- (void)_handleAddressBookChangedNotification:(id)a3;
- (void)_handleAddressBookPartialChangedNotification:(id)a3;
- (void)_handleContactStoreBatchLoadCompleteNotification:(id)a3;
- (void)_handleConversationPreferredServiceDidChangeNotification:(id)a3;
- (void)_handleIDSResultsWhenSearchTableIsHidden:(id)a3;
- (void)_handleKeyTransparencyStatusChangedNotification:(id)a3;
- (void)_handleRecipientAvailabilityTimeout:(id)a3;
- (void)_handleRecipientViewChanged:(id)a3;
- (void)_hideSearchField;
- (void)_presentBusinessChatNotSupportedError;
- (void)_refreshActionSheet;
- (void)_removeAvailabilityTimeoutTimerForRecipient:(id)a3;
- (void)_removeRecent;
- (void)_resetSearchResultsInsets;
- (void)_showActionSheetForRecipient:(id)a3 animated:(BOOL)a4;
- (void)_showContactCardForRecipient:(id)a3 sourceView:(id)a4;
- (void)_showDetailsForGroup:(id)a3;
- (void)_showDetailsForRecipient:(id)a3 canDelete:(BOOL)a4;
- (void)_showOneTimeErrorAlertForAddedRecipient:(id)a3 service:(id)a4 withError:(int64_t)a5;
- (void)_showSearchField;
- (void)_startAvailabilityTimeoutTimerForRecipient:(id)a3;
- (void)_updateAddressBookProperties;
- (void)_updateRecipientViewLayouts;
- (void)_updateSearchResultsTable;
- (void)_updateShowingSearch;
- (void)_updateToField;
- (void)_updateToFieldRecipientsData;
- (void)_updateYOriginSearchListController;
- (void)addRecipient:(id)a3;
- (void)addRecipients:(id)a3;
- (void)autocompleteGroupDetailViewController:(id)a3 didAskToRemoveGroup:(id)a4;
- (void)autocompleteGroupDetailViewController:(id)a3 didTapComposeRecipient:(id)a4;
- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4;
- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5;
- (void)autocompleteResultsController:(id)a3 tintColorForRecipient:(id)a4 completion:(id)a5;
- (void)bringComposeRecipientViewToFront;
- (void)colorTypeForRecipient:(id)a3 completion:(id)a4;
- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 didChangeSize:(CGSize)a4;
- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4;
- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 didSelectRecipients:(id)a4;
- (void)composeRecipientView:(id)a3 disambiguateRecipientForAtom:(id)a4;
- (void)composeRecipientView:(id)a3 showPersonCardForAtom:(id)a4;
- (void)composeRecipientView:(id)a3 textDidChange:(id)a4;
- (void)composeRecipientViewRequestAddRecipient:(id)a3;
- (void)composeRecipientViewReturnPressed:(id)a3;
- (void)composeRecipientViewTabPressed:(id)a3;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)dismissSearchResultsForComposeRecipientView:(id)a3;
- (void)handlePendingRecipient:(id)a3;
- (void)invalidateOutstandingIDStatusRequests;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentAlternateAddressesAlertForRecipient:(id)a3;
- (void)recipientViewDidBecomeFirstResponder:(id)a3;
- (void)recipientViewDidResignFirstResponder:(id)a3;
- (void)refreshAvailabilityForRecipients:(id)a3 context:(id)a4;
- (void)refreshComposeSendingServiceForAddresses:(id)a3 context:(id)a4 withCompletionBlock:(id)a5;
- (void)refreshComposeSendingServiceForAddresses:(id)a3 withCompletionBlock:(id)a4;
- (void)removeRecipient:(id)a3;
- (void)reset;
- (void)resetSearchResults;
- (void)scrollSearchListControllerToTop:(BOOL)a3;
- (void)searchListController:(id)a3 destinationsUpdated:(id)a4;
- (void)searchListControllerDidScroll:(id)a3;
- (void)selectNextSearchResultForComposeRecipientView:(id)a3;
- (void)selectPreviousSearchResultForComposeRecipientView:(id)a3;
- (void)sendUpdateRecipientForAtom:(id)a3;
- (void)setAddressBookNotificationUpdater:(id)a3;
- (void)setAllowedByScreenTime:(BOOL)a3;
- (void)setAlternateAddressesAlertController:(id)a3;
- (void)setContactPickerViewController:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContactsManager:(id)a3;
- (void)setConversation:(id)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setCurrentConversationContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidShowOneTimeErrorAlert:(BOOL)a3;
- (void)setEditable:(BOOL)a3;
- (void)setExpandedRecipientAvailabilities:(id)a3;
- (void)setForceMMS:(BOOL)a3;
- (void)setGameCenterPickedHandles:(id)a3 playerNames:(id)a4;
- (void)setGameCenterPickerBlock:(id)a3;
- (void)setHeaderDecorationView:(id)a3;
- (void)setIsDisambiguating:(BOOL)a3;
- (void)setNumberOfRowsInToField:(unint64_t)a3;
- (void)setPeoplePickerHidden:(BOOL)a3;
- (void)setPreventAtomization:(BOOL)a3;
- (void)setRecentContactForPresentedCNCard:(id)a3;
- (void)setRecipientAvailabilities:(id)a3;
- (void)setRecipientAvailibityTimers:(id)a3;
- (void)setSearchListController:(id)a3;
- (void)setSearchResultsHidden:(BOOL)a3;
- (void)setSeparator:(id)a3;
- (void)setToField:(id)a3;
- (void)setToFieldPlaceholderLabel:(id)a3;
- (void)setToFieldScrollingView:(id)a3;
- (void)stopCheckingRecipientAvailabilityAndRemoveAllTimers;
- (void)tintColorForRecipient:(id)a3 completion:(id)a4;
- (void)updateScreenTimePolicy;
- (void)viewDidAppearDeferredSetup;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CKRecipientSelectionController

- (BOOL)isMAIDGroupsEnabled
{
  return MEMORY[0x1F4124070](self, a2);
}

- (void)dealloc
{
  v3 = [(CKRecipientSelectionController *)self currentConversationContext];

  if (v3)
  {
    v4 = [(CKRecipientSelectionController *)self currentConversationContext];
    [v4 removeObserver:self forKeyPath:@"allowedByScreenTime"];
  }
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_recipientSelectionControllerDidChange object:0];
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  [(CKRecipientSelectionController *)self invalidateOutstandingIDStatusRequests];
  [(CKRecipientSelectionController *)self stopCheckingRecipientAvailabilityAndRemoveAllTimers];
  v6 = [(CKRecipientSelectionController *)self toField];
  [v6 setDelegate:0];

  v7 = [(CKRecipientSelectionController *)self toField];
  [v7 setLayoutDelegate:0];

  v8 = [(CKRecipientSelectionController *)self searchListController];

  if (v8)
  {
    v9 = [(CKRecipientSelectionController *)self searchListController];
    v10 = [v9 view];
    [v10 removeFromSuperview];

    v11 = [(CKRecipientSelectionController *)self searchListController];
    [(CKRecipientSelectionController *)self removeChildViewController:v11];

    v12 = [(CKRecipientSelectionController *)self searchListController];
    [v12 setDelegate:0];
  }
  self->_numberOfRowsInToField = 1;
  v13.receiver = self;
  v13.super_class = (Class)CKRecipientSelectionController;
  [(CKRecipientSelectionController *)&v13 dealloc];
}

- (CKRecipientSelectionController)init
{
  return [(CKRecipientSelectionController *)self initWithNibName:0 bundle:0];
}

- (CKRecipientSelectionController)initWithConversation:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CKRecipientSelectionController;
  v5 = [(CKRecipientSelectionController *)&v19 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    v5->_forceMMS = 0;
    uint64_t v7 = [v4 copyForPendingConversation];
    conversation = v6->_conversation;
    v6->_conversation = (CKPendingConversation *)v7;

    v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v10 = [v9 isLazuliEnabled];

    if (v10)
    {
      v11 = objc_alloc_init(CKRecipientAvailabilities);
      uint64_t v12 = 1136;
    }
    else
    {
      v11 = (CKRecipientAvailabilities *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v12 = 1128;
    }
    objc_super v13 = *(Class *)((char *)&v6->super.super.super.super.isa + v12);
    *(Class *)((char *)&v6->super.super.super.super.isa + v12) = (Class)v11;

    v6->_allowedByScreenTime = 1;
    v14 = [[CKDetailsContactsManager alloc] initWithConversation:v6->_conversation delegate:v6];
    contactsManager = v6->_contactsManager;
    v6->_contactsManager = v14;

    v6->_numberOfRowsInToField = 1;
    v16 = (CoreTelephonyClient *)objc_alloc_init(MEMORY[0x1E4F23A80]);
    coreTelephonyClient = v6->_coreTelephonyClient;
    v6->_coreTelephonyClient = v16;
  }
  return v6;
}

- (void)loadView
{
  v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 recipientSelectionViewRequiresMainScreenBounds];

  if (v4)
  {
    v5 = [CKRecipientSelectionView alloc];
    v6 = [MEMORY[0x1E4F42D90] mainScreen];
    [(CKRecipientSelectionView *)v6 bounds];
    uint64_t v7 = -[CKRecipientSelectionView initWithFrame:](v5, "initWithFrame:");
    [(CKRecipientSelectionController *)self setView:v7];
  }
  else
  {
    v6 = objc_alloc_init(CKRecipientSelectionView);
    [(CKRecipientSelectionController *)self setView:v6];
  }

  v8 = [(CKRecipientSelectionController *)self view];
  [v8 setAutoresizingMask:18];

  v9 = [(CKRecipientSelectionController *)self view];
  int v10 = [MEMORY[0x1E4F428B8] clearColor];
  [v9 setBackgroundColor:v10];

  v11 = [(CKRecipientSelectionController *)self view];
  [v11 setClipsToBounds:1];

  if (CKIsRunningInMacCatalyst())
  {
    [(CKRecipientSelectionController *)self _macToFieldHeight];
    double v13 = v12;
  }
  else
  {
    v14 = +[CKUIBehavior sharedBehaviors];
    [v14 toFieldPreferredHeight];
    double v13 = v15;
  }
  if ([(CKRecipientSelectionController *)self isBeingPresentedInMacDetailsView])
  {
    v16 = +[CKUIBehavior sharedBehaviors];
    [v16 detailsToFieldPreferredHeight];
    double v13 = v17;
  }
  v18 = [CKComposeRecipientView alloc];
  objc_super v19 = [(CKRecipientSelectionController *)self view];
  [v19 frame];
  v20 = -[CKComposeRecipientView initWithFrame:](v18, "initWithFrame:", 0.0, 0.0);
  toField = self->_toField;
  self->_toField = v20;

  [(CKRecipientSelectionController *)self setNumberOfRowsInToField:1];
  if (CKIsRunningInMacCatalyst())
  {
    v22 = objc_opt_new();
    v23 = [v22 UUIDString];
    [(CKComposeRecipientView *)self->_toField setFocusGroupIdentifier:v23];

    v24 = [(CNComposeRecipientTextView *)self->_toField textView];
    [v24 setFocusGroupIdentifier:0];
  }
  if (CKIsRunningInMacCatalyst()) {
    uint64_t v25 = 2;
  }
  else {
    uint64_t v25 = 18;
  }
  v26 = [(CKRecipientSelectionController *)self toField];
  [v26 setAutoresizingMask:v25];

  if (loadView_onceToken != -1) {
    dispatch_once(&loadView_onceToken, &__block_literal_global_8);
  }
  if (CKIsRunningInMacCatalyst()
    && ![(CKRecipientSelectionController *)self isBeingPresentedInMacDetailsView])
  {
    v27 = [(CKRecipientSelectionController *)self toField];
    v28 = [v27 labelView];
    [v28 setAttributedText:loadView_toText];
  }
  else
  {
    v27 = [(CKRecipientSelectionController *)self toField];
    v28 = [(id)loadView_toText string];
    [v27 setLabel:v28];
  }

  v29 = +[CKUIBehavior sharedBehaviors];
  uint64_t v30 = [v29 canAccessContacts] ^ 1;
  v31 = [(CKRecipientSelectionController *)self toField];
  v32 = [v31 addButton];
  [v32 setHidden:v30];

  v33 = [(CKRecipientSelectionController *)self toField];
  v34 = [v33 textView];
  v35 = +[CKUIBehavior sharedBehaviors];
  v36 = [v35 theme];
  objc_msgSend(v34, "setKeyboardAppearance:", objc_msgSend(v36, "keyboardAppearance"));

  int64_t v37 = [(CKRecipientSelectionController *)self _userInterfaceStyleOverride];
  if (v37) {
    [(CKRecipientSelectionController *)self setOverrideUserInterfaceStyle:v37];
  }
  [(CKRecipientSelectionController *)self setEditable:1];
  v38 = [(CKRecipientSelectionController *)self toField];
  [v38 setDelegate:self];

  v39 = [(CKRecipientSelectionController *)self toField];
  [v39 setLayoutDelegate:self];

  v40 = +[CKUIBehavior sharedBehaviors];
  [v40 toFieldScrollViewInsets];
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;

  if (CKIsRunningInMacCatalyst())
  {
    double v42 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v44 = *MEMORY[0x1E4F1DAD8];
  }
  double v47 = v13;
  if (CKIsRunningInMacCatalyst())
  {
    [(CKRecipientSelectionController *)self preferredMacToolbarHeight];
    double v47 = v48;
  }
  v49 = [(CKRecipientSelectionController *)self view];
  [v49 frame];
  double v51 = v50 - v46;

  v52 = -[CKUIScrollView1xAdaptable initWithFrame:]([CKUIScrollView1xAdaptable alloc], "initWithFrame:", v44, v42, v51, v47);
  toFieldScrollingView = self->_toFieldScrollingView;
  self->_toFieldScrollingView = &v52->super;

  v54 = [(CKRecipientSelectionController *)self toFieldScrollingView];
  [v54 setAutoresizingMask:v25];

  v55 = [(CKRecipientSelectionController *)self toFieldScrollingView];
  [v55 setBackgroundColor:0];

  v56 = [(CKRecipientSelectionController *)self toFieldScrollingView];
  [v56 setContentInsetAdjustmentBehavior:2];

  v57 = [(CKRecipientSelectionController *)self toFieldScrollingView];
  [v57 setShowsHorizontalScrollIndicator:0];

  LODWORD(v54) = CKIsRunningInMacCatalyst();
  v58 = [(CKRecipientSelectionController *)self toFieldScrollingView];
  v59 = v58;
  if (v54)
  {
    [v58 setAlwaysBounceVertical:1];

    v60 = [(CKRecipientSelectionController *)self toFieldScrollingView];
    [v60 setShowsHorizontalScrollIndicator:0];

    v61 = [(CKRecipientSelectionController *)self toFieldScrollingView];
    [v61 setScrollEnabled:0];

    v62 = [(CKRecipientSelectionController *)self toFieldScrollingView];
    [v62 setShowsVerticalScrollIndicator:0];

    v63 = [(CKRecipientSelectionController *)self toFieldScrollingView];
    [v63 setAutomaticallyAdjustsScrollIndicatorInsets:0];
  }
  else
  {
    [v58 setScrollsToTop:0];

    v64 = [(CKRecipientSelectionController *)self toFieldScrollingView];
    [v64 setBounces:0];

    v63 = [(CKRecipientSelectionController *)self toFieldScrollingView];
    [v63 setAutoresizesSubviews:0];
  }

  v65 = [(CKRecipientSelectionController *)self toFieldScrollingView];
  v66 = [(CKRecipientSelectionController *)self toField];
  [v65 addSubview:v66];

  v67 = [(CKRecipientSelectionController *)self toField];
  v68 = [(CKRecipientSelectionController *)self toFieldScrollingView];
  [v68 bounds];
  objc_msgSend(v67, "setFrame:");

  id v99 = [(CKRecipientSelectionController *)self toFieldScrollingView];
  [v99 bounds];
  double v70 = v69;
  double v72 = v71;
  double v74 = v73;
  double v76 = v75;
  v77 = -[CKContainerView1xAdaptable initWithFrame:]([CKContainerView1xAdaptable alloc], "initWithFrame:", v69, v71, v73, v75);
  toFieldContainerView = self->_toFieldContainerView;
  self->_toFieldContainerView = &v77->super;

  v79 = [(CKRecipientSelectionController *)self toFieldContainerView];
  [v79 setAutoresizingMask:2];

  v80 = [(CKRecipientSelectionController *)self toFieldContainerView];
  [v80 addSubview:v99];

  v81 = [(CKRecipientSelectionController *)self view];
  uint64_t v82 = [(CKRecipientSelectionController *)self toFieldContainerView];
  [v81 addSubview:v82];

  v83 = [(CKRecipientSelectionController *)self delegate];
  LOBYTE(v82) = objc_opt_respondsToSelector();

  if (v82)
  {
    v84 = [(CKRecipientSelectionController *)self delegate];
    v85 = [v84 headerDecorationViewForRecipientSelectionConroller:self];
    headerDecorationView = self->_headerDecorationView;
    self->_headerDecorationView = v85;

    if (self->_headerDecorationView)
    {
      [(CKRecipientSelectionController *)self _navigationBarInsets];
      double v88 = v76 + v87;
      [(UIView *)self->_headerDecorationView setAutoresizingMask:2];
      -[UIView setFrame:](self->_headerDecorationView, "setFrame:", v70, v72, v74, v88);
      v89 = [(CKRecipientSelectionController *)self view];
      [v89 addSubview:self->_headerDecorationView];

      v90 = [(CKRecipientSelectionController *)self view];
      [v90 sendSubviewToBack:self->_headerDecorationView];
    }
  }
  if ([(CKRecipientSelectionController *)self isBeingPresentedInMacDetailsView])
  {
    id v91 = objc_alloc(MEMORY[0x1E4F42FF0]);
    v92 = [(CKRecipientSelectionController *)self view];
    [v92 frame];
    double v94 = v93;
    if (CKPixelWidth_once_0 != -1) {
      dispatch_once(&CKPixelWidth_once_0, &__block_literal_global_907);
    }
    v95 = objc_msgSend(v91, "initWithFrame:", 0.0, v13, v94, *(double *)&CKPixelWidth_sPixel_0);

    [v95 setAutoresizingMask:2];
    v96 = [MEMORY[0x1E4F428B8] opaqueSeparatorColor];
    [v95 setBackgroundColor:v96];

    [(CKRecipientSelectionController *)self setSeparator:v95];
    v97 = [(CKRecipientSelectionController *)self toFieldContainerView];
    v98 = [(CKRecipientSelectionController *)self separator];
    [v97 addSubview:v98];
  }
  [(CKRecipientSelectionController *)self setPeoplePickerHidden:1];
}

void __42__CKRecipientSelectionController_loadView__block_invoke()
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4FB06F8];
  v0 = +[CKUIBehavior sharedBehaviors];
  v1 = [v0 navbarToLabelFont];
  v16[0] = v1;
  v15[1] = *MEMORY[0x1E4FB0700];
  v2 = [MEMORY[0x1E4F428B8] grayColor];
  v16[1] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  int v4 = (void *)loadView_attributes;
  loadView_attributes = v3;

  id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
  v6 = CKFrameworkBundle();
  uint64_t v7 = [v6 localizedStringForKey:@"TO" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v8 = [v5 initWithString:v7 attributes:loadView_attributes];
  v9 = (void *)loadView_toText;
  loadView_toText = v8;

  id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
  v11 = CKFrameworkBundle();
  double v12 = [v11 localizedStringForKey:@"No Recipients" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v13 = [v10 initWithString:v12 attributes:loadView_attributes];
  v14 = (void *)loadView_placeHolderText;
  loadView_placeHolderText = v13;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CKRecipientSelectionController;
  [(CKRecipientSelectionController *)&v5 viewDidLoad];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleRecipientViewChanged_ name:*MEMORY[0x1E4F5A0C0] object:self->_toField];
  [v3 addObserver:self selector:sel__handleIDSResultsWhenSearchTableIsHidden_ name:@"CKIDSResultsFinishedWhenSearchTableIsHiddenNotification" object:0];
  [v3 addObserver:self selector:sel__handleConversationPreferredServiceDidChangeNotification_ name:@"CKConversationPreferredServiceChangedNotification" object:0];
  [v3 addObserver:self selector:sel__handleAddressBookChangedNotification_ name:*MEMORY[0x1E4F6CA50] object:0];
  [v3 addObserver:self selector:sel__handleAddressBookPartialChangedNotification_ name:*MEMORY[0x1E4F6CA60] object:0];
  [v3 addObserver:self selector:sel__handleKeyTransparencyStatusChangedNotification_ name:*MEMORY[0x1E4F6B998] object:0];
  [v3 addObserver:self selector:sel__handleContactStoreBatchLoadCompleteNotification_ name:*MEMORY[0x1E4F6D1D0] object:0];
  [(CKRecipientSelectionController *)self _updateAddressBookProperties];
  int v4 = [[CKManualUpdater alloc] initWithTarget:self action:sel__updateToFieldRecipientsData];
  [(CKRecipientSelectionController *)self setAddressBookNotificationUpdater:v4];
}

- (void)viewDidAppearDeferredSetup
{
  v31.receiver = self;
  v31.super_class = (Class)CKRecipientSelectionController;
  [(CKViewController *)&v31 viewDidAppearDeferredSetup];
  uint64_t v3 = [(CKRecipientSelectionController *)self searchListController];

  if (!v3)
  {
    int v4 = [[CKRecipientSearchListController alloc] initWithStyle:CKIsRunningInMacCatalyst() != 0];
    [(CNAutocompleteResultsTableViewController *)v4 setDelegate:self];
    objc_super v5 = [(CKRecipientSelectionController *)self view];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    if ([(CKRecipientSelectionController *)self isBeingPresentedInMacDetailsView])
    {
      v14 = [(CKRecipientSelectionController *)self toField];
      [v14 frame];
      double v9 = v9 + v15;
    }
    v16 = +[CKUIBehavior sharedBehaviors];
    int v17 = [v16 recipientSelectionSearchControllerRequiresFlexibleMargins];

    if (v17)
    {
      v18 = [(CKRecipientSearchListController *)v4 view];
      [v18 setAutoresizingMask:18];
    }
    objc_super v19 = +[CKUIBehavior sharedBehaviors];
    int v20 = [v19 recipientSelectionSearchControllerHidesInfoButton];

    if (v20) {
      [(CNAutocompleteResultsTableViewController *)v4 setShouldHideInfoButton:1];
    }
    v21 = [(CKRecipientSearchListController *)v4 view];
    objc_msgSend(v21, "setFrame:", v7, v9, v11, v13);

    v22 = [(CKRecipientSearchListController *)v4 tableView];
    [v22 setHidden:1];

    if (CKIsRunningInMacCatalyst())
    {
      v23 = [(CKComposeRecipientView *)self->_toField focusGroupIdentifier];
      v24 = [(CKRecipientSearchListController *)v4 tableView];
      [v24 setFocusGroupIdentifier:v23];
    }
    if ([(CKRecipientSelectionController *)self homogenizePreferredServiceForiMessage])
    {
      uint64_t v25 = [MEMORY[0x1E4F6BDC0] smsEnabled];
    }
    else
    {
      uint64_t v25 = 0;
    }
    [(CKRecipientSearchListController *)v4 setSmsEnabled:v25];
    v26 = [(CKRecipientSelectionController *)self recipients];
    [(CKRecipientSearchListController *)v4 setEnteredRecipients:v26];

    v27 = +[CKUIBehavior sharedBehaviors];
    if ([v27 presentsAutocompleteInAPopover])
    {
      BOOL v28 = [(CKRecipientSelectionController *)self isBeingPresentedInMacDetailsView];

      if (!v28) {
        goto LABEL_18;
      }
    }
    else
    {
    }
    [(CKRecipientSelectionController *)self addChildViewController:v4];
    v29 = [(CKRecipientSelectionController *)self view];
    uint64_t v30 = [(CKRecipientSearchListController *)v4 view];
    [v29 addSubview:v30];

    [(CKRecipientSearchListController *)v4 didMoveToParentViewController:self];
    [(CKRecipientSelectionController *)self bringComposeRecipientViewToFront];
LABEL_18:
    [(CKRecipientSelectionController *)self setSearchListController:v4];
    [(CKRecipientSelectionController *)self _updateToField];
    [(CKRecipientSelectionController *)self _resetSearchResultsInsets];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKRecipientSelectionController;
  [(CKViewController *)&v6 viewWillDisappear:a3];
  int v4 = [(CKRecipientSelectionController *)self undoManager];
  [v4 removeAllActions];

  objc_super v5 = [(CKRecipientSelectionController *)self toField];
  [v5 parentWillClose];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKRecipientSelectionController;
  [(CKViewController *)&v6 viewDidDisappear:a3];
  [(CKRecipientSelectionController *)self setPreventAtomization:0];
  int v4 = [(CKRecipientSelectionController *)self currentConversationContext];
  [v4 removeObserver:self forKeyPath:@"allowedByScreenTime"];

  [(CKRecipientSelectionController *)self setCurrentConversationContext:0];
  objc_super v5 = [(CKRecipientSelectionController *)self toField];
  [v5 parentDidClose];
}

- (int64_t)_userInterfaceStyleOverride
{
  uint64_t v3 = [(CKRecipientSelectionController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  objc_super v5 = [(CKRecipientSelectionController *)self delegate];
  int64_t v6 = [v5 userInterfaceStyleOverrideForRecipientSelectionConroller:self];

  return v6;
}

- (UIEdgeInsets)_additionalSearchResultsEdgeInsets
{
  uint64_t v3 = [(CKRecipientSelectionController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    objc_super v5 = [(CKRecipientSelectionController *)self delegate];
    [v5 additionalSearchResultsEdgeInsetsForRecipientSelectionController:self];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F437F8];
    double v9 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CKRecipientSelectionController;
  [(CKRecipientSelectionController *)&v3 viewWillLayoutSubviews];
  [(CKRecipientSelectionController *)self _updateToField];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CKRecipientSelectionController;
  id v7 = a4;
  -[CKRecipientSelectionController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__CKRecipientSelectionController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5621550;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

uint64_t __85__CKRecipientSelectionController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateToField];
  v2 = *(void **)(a1 + 32);

  return [v2 _resetSearchResultsInsets];
}

- (void)didMoveToParentViewController:(id)a3
{
  [(CKRecipientSelectionController *)self _updateToField];

  [(CKRecipientSelectionController *)self _resetSearchResultsInsets];
}

- (BOOL)isBeingPresentedInMacDetailsView
{
  return 0;
}

- (void)bringComposeRecipientViewToFront
{
  id v4 = [(CKRecipientSelectionController *)self view];
  objc_super v3 = [(CKRecipientSelectionController *)self toFieldContainerView];
  [v4 bringSubviewToFront:v3];
}

- (double)additionalCatalystTopInset
{
  double v3 = 0.0;
  if (CKIsRunningInMacCatalyst()
    && ![(CKRecipientSelectionController *)self isBeingPresentedInMacDetailsView])
  {
    id v4 = +[CKUIBehavior sharedBehaviors];
    if ([v4 useMacToolbar])
    {
      [(CKRecipientSelectionController *)self preferredMacToolbarHeight];
      double v6 = v5;
    }
    else
    {
      id v7 = +[CKUIBehavior sharedBehaviors];
      [v7 marzNavigationBarHeight];
      double v6 = v8;
    }
    objc_super v9 = +[CKUIBehavior sharedBehaviors];
    [v9 toFieldPreferredHeight];
    double v11 = v10;
    [(CKRecipientSelectionController *)self fieldHeightOffset];
    double v13 = v11 + v12;
    double v14 = +[CKUIBehavior sharedBehaviors];
    [v14 toFieldInterItemSpacing];
    double v16 = v6 - (v13 + v15);

    return fmax(v16, 0.0);
  }
  return v3;
}

- (double)fieldHeightOffset
{
  double v3 = [(CKRecipientSelectionController *)self toFieldContainerView];
  [v3 frame];
  double v5 = v4;

  double v6 = 0.0;
  if (v5 != 0.0)
  {
    id v7 = [(CKRecipientSelectionController *)self toFieldContainerView];
    [v7 frame];
    double v9 = v8;
    double v10 = +[CKUIBehavior sharedBehaviors];
    [v10 toFieldPreferredHeight];
    double v6 = v9 - v11;
  }
  return v6;
}

- (double)_macToFieldHeight
{
  unint64_t v3 = [(CKRecipientSelectionController *)self numberOfRowsInToField];

  [(CKRecipientSelectionController *)self _toolbarHeightForNumberOfRows:v3];
  return result;
}

- (double)preferredMacToolbarHeight
{
  unint64_t v3 = [(CKRecipientSelectionController *)self toField];
  uint64_t v4 = [v3 numberOfRowsOfTextInField];
  unint64_t v5 = [(CKRecipientSelectionController *)self numberOfRowsInToField];

  if (v4 != v5)
  {
    double v6 = [(CKRecipientSelectionController *)self toField];
    -[CKRecipientSelectionController setNumberOfRowsInToField:](self, "setNumberOfRowsInToField:", [v6 numberOfRowsOfTextInField]);
  }
  if ([(CKRecipientSelectionController *)self numberOfRowsInToField] < 2
    || [(CKRecipientSelectionController *)self numberOfRowsInToField] > 3)
  {
    if ([(CKRecipientSelectionController *)self numberOfRowsInToField] <= 3) {
      unint64_t v7 = 1;
    }
    else {
      unint64_t v7 = 3;
    }
  }
  else
  {
    unint64_t v7 = [(CKRecipientSelectionController *)self numberOfRowsInToField];
  }

  [(CKRecipientSelectionController *)self _toolbarHeightForNumberOfRows:v7];
  return result;
}

- (BOOL)_shouldEnableScrolling
{
  return ([(CKRecipientSelectionController *)self numberOfRowsInToField] < 2
       || [(CKRecipientSelectionController *)self numberOfRowsInToField] >= 4)
      && [(CKRecipientSelectionController *)self numberOfRowsInToField] > 3;
}

- (double)_toolbarHeightForNumberOfRows:(unint64_t)a3
{
  uint64_t v4 = +[CKUIBehavior sharedBehaviors];
  [v4 defaultToolbarHeight];
  double v6 = v5;
  if (a3 >= 2)
  {
    [MEMORY[0x1E4F5A0C8] defaultHeight];
    double v6 = v6 + (double)(a3 - 1) * (v7 + 6.0);
  }

  return v6;
}

- (void)_handleRecipientViewChanged:(id)a3
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_recipientSelectionControllerDidChange object:0];

  [(CKRecipientSelectionController *)self performSelector:sel_recipientSelectionControllerDidChange withObject:0 afterDelay:0.0];
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    [(UILabel *)self->_toFieldPlaceholderLabel setHidden:1];
  }
  else
  {
    double v7 = [v11 recipients];
    -[UILabel setHidden:](self->_toFieldPlaceholderLabel, "setHidden:", [v7 count] != 0);
  }
  [(CKRecipientSelectionController *)self _adjustToFieldPositionIfNecessary];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained recipientSelectionController:self textDidChange:v6];

  [(CKRecipientSelectionController *)self _updateSearchResultsTable];
  double v9 = [(CKRecipientSelectionController *)self alternateAddressesAlertController];

  if (v9)
  {
    double v10 = [(CKRecipientSelectionController *)self alternateAddressesAlertController];
    [v10 dismissViewControllerAnimated:1 completion:0];

    [(CKRecipientSelectionController *)self setAlternateAddressesAlertController:0];
  }
}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  double v7 = [v12 text];
  if ([v7 length])
  {
    [(UILabel *)self->_toFieldPlaceholderLabel setHidden:1];
  }
  else
  {
    double v8 = [v12 recipients];
    -[UILabel setHidden:](self->_toFieldPlaceholderLabel, "setHidden:", [v8 count] != 0);
  }
  if ([(CKRecipientSelectionController *)self isGameCenterRecipient:v6])
  {
    double v9 = [v12 atomViewForRecipient:v6];
    [v9 setPresentationOptions:8];
    double v10 = [MEMORY[0x1E4F428B8] grayColor];
    [v9 setTintColor:v10];
  }
  [(CKRecipientSelectionController *)self updateScreenTimePolicy];
  id v11 = [v6 IDSCanonicalAddress];
  [(CKRecipientSelectionController *)self didAddRecipient:v11];
}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  double v7 = [v13 text];
  if ([v7 length])
  {
    [(UILabel *)self->_toFieldPlaceholderLabel setHidden:1];
  }
  else
  {
    double v8 = [v13 recipients];
    -[UILabel setHidden:](self->_toFieldPlaceholderLabel, "setHidden:", [v8 count] != 0);
  }
  double v9 = +[CKAdaptivePresentationController sharedInstance];
  [v9 dismissViewControllerAnimated:1 completion:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v11 = [(CKRecipientSelectionController *)self toField];
  id v12 = [v11 text];
  [WeakRetained recipientSelectionController:self textDidChange:v12];

  [(CKRecipientSelectionController *)self removeRecipient:v6];
  [(CKRecipientSelectionController *)self updateScreenTimePolicy];
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!CKIsRunningInMacCatalyst()
    || ![(CKRecipientSelectionController *)self isSearchResultsHidden])
  {
    [v6 clearText];
    double v8 = [(CKRecipientSelectionController *)self searchListController];
    [v8 cancelSearch];

    [(CKRecipientSelectionController *)self _updateShowingSearch];
  }
  double v9 = [v7 componentsSeparatedByString:@"\n"];
  if ([v9 count])
  {
    id v18 = v7;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(id *)(*((void *)&v19 + 1) + 8 * i);
          if ([v15 length] && CKIsValidAddress(v15))
          {
            double v16 = +[CKRecipientGenerator sharedRecipientGenerator];
            double v17 = [v16 recipientWithAddress:v15];
            [(CKRecipientSelectionController *)self addRecipient:v17];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    id v7 = v18;
  }
}

- (void)composeRecipientViewReturnPressed:(id)a3
{
  id v4 = [(CKRecipientSelectionController *)self delegate];
  [v4 recipientSelectionControllerReturnPressed:self];
}

- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4
{
  id v4 = a4;
  double v5 = +[CKRecipientGenerator sharedRecipientGenerator];
  id v6 = [v5 recipientWithAddress:v4];

  return v6;
}

- (void)composeRecipientViewTabPressed:(id)a3
{
  id v4 = [(CKRecipientSelectionController *)self delegate];
  [v4 recipientSelectionControllerTabPressed:self];
}

- (id)composeRecipientView:(id)a3 composeRecipientForContact:(id)a4
{
  id v4 = a4;
  double v5 = +[CKRecipientGenerator sharedRecipientGenerator];
  id v6 = [v5 recipientWithContact:v4];

  return v6;
}

- (void)composeRecipientView:(id)a3 didChangeSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v7 = *MEMORY[0x1E4F1DAD8];
  double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v9 = [(CKRecipientSelectionController *)self toFieldContainerView];
  [v9 frame];
  double v11 = v10;

  if (CKIsRunningInMacCatalyst())
  {
    uint64_t v12 = [(CKRecipientSelectionController *)self toField];
    unint64_t v13 = [v12 numberOfRowsOfTextInField];

    if (v13 <= 1)
    {
      [(CKRecipientSelectionController *)self composeRecipientViewOriginY];
      double v8 = v14;
    }
  }
  id v15 = [(CKRecipientSelectionController *)self toField];
  objc_msgSend(v15, "setFrame:", v7, v8, v11, height);

  double v16 = [(CKRecipientSelectionController *)self toFieldScrollingView];
  [v16 contentSize];
  double v18 = v17;
  double v20 = v19;

  if (width != v18 || height != v20)
  {
    long long v21 = [(CKRecipientSelectionController *)self toFieldScrollingView];
    objc_msgSend(v21, "setContentSize:", width, height);

    [(CKRecipientSelectionController *)self _updateRecipientViewLayouts];
    long long v22 = [(CKRecipientSelectionController *)self delegate];
    [v22 recipientSelectionControllerDidChangeSize:self];

    if (CKIsRunningInMacCatalyst())
    {
      BOOL v23 = [(CKRecipientSelectionController *)self _shouldEnableScrolling];
      uint64_t v24 = [(CKRecipientSelectionController *)self toFieldScrollingView];
      [v24 setScrollEnabled:v23];

      BOOL v25 = [(CKRecipientSelectionController *)self _shouldEnableScrolling];
      v26 = [(CKRecipientSelectionController *)self toFieldScrollingView];
      [v26 setShowsVerticalScrollIndicator:v25];
    }
  }

  [(CKRecipientSelectionController *)self _updateYOriginSearchListController];
}

- (BOOL)_systemUnderLock
{
  int v2 = CKIsRunningInMessagesViewService();
  if (v2)
  {
    LOBYTE(v2) = CKIsScreenLocked();
  }
  return v2;
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  id v4 = a3;
  if (![(CKRecipientSelectionController *)self _systemUnderLock])
  {
    double v5 = [(CKRecipientSelectionController *)self toField];
    id v6 = [v4 text];
    [(CKRecipientSelectionController *)self composeRecipientView:v5 didFinishEnteringAddress:v6];

    [(CKRecipientSelectionController *)self setPeoplePickerHidden:0];
    double v7 = [(CKRecipientSelectionController *)self firstResponder];
    [v7 reloadInputViews];

    if (self->_gameCenterPickerBlock)
    {
      double v8 = [(CKRecipientSelectionController *)self toField];
      double v9 = [v8 inputAccessoryView];
      [v9 setHidden:1];

      double v10 = [(CKRecipientSelectionController *)self delegate];
      [v10 recipientSelectionControllerRequestDismissKeyboard:self];

      (*((void (**)(void))self->_gameCenterPickerBlock + 2))();
    }
    else
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __74__CKRecipientSelectionController_composeRecipientViewRequestAddRecipient___block_invoke;
      aBlock[3] = &unk_1E5621578;
      aBlock[4] = self;
      double v11 = _Block_copy(aBlock);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __74__CKRecipientSelectionController_composeRecipientViewRequestAddRecipient___block_invoke_2;
      v21[3] = &unk_1E56215A0;
      v21[4] = self;
      uint64_t v12 = _Block_copy(v21);
      unint64_t v13 = [(CKRecipientSelectionController *)self contactPickerViewController];
      [v13 setModalPresentationStyle:7];

      double v14 = [(CKRecipientSelectionController *)self contactPickerViewController];
      id v15 = [v14 popoverPresentationController];
      [v15 setPermittedArrowDirections:1];

      double v16 = +[CKUIBehavior sharedBehaviors];
      if ([v16 useMacToolbar])
      {
        double v17 = self;
      }
      else
      {
        double v17 = [(CKRecipientSelectionController *)self navigationController];
      }
      double v18 = v17;

      double v19 = +[CKAdaptivePresentationController sharedInstance];
      double v20 = [(CKRecipientSelectionController *)self contactPickerViewController];
      [v19 presentViewController:v20 fromViewController:v18 presentationHandler:v11 dismissalHandler:v12 animated:1 completion:0];
    }
  }
}

id __74__CKRecipientSelectionController_composeRecipientViewRequestAddRecipient___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = [*(id *)(a1 + 32) toFieldContainerView];
  [v6 frame];
  *a2 = v7;
  a2[1] = v8;
  a2[2] = v9;
  a2[3] = v10;

  id result = [*(id *)(a1 + 32) view];
  *a3 = result;
  return result;
}

uint64_t __74__CKRecipientSelectionController_composeRecipientViewRequestAddRecipient___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissPeoplePicker];
}

- (BOOL)_recipientIsGroup:(id)a3
{
  return [a3 isGroup];
}

- (id)_expandedRecipientsForGroupRecipient:(id)a3
{
  return (id)[a3 children];
}

- (void)composeRecipientView:(id)a3 disambiguateRecipientForAtom:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (CKIsRunningInMacCatalyst())
  {
    [(CKRecipientSelectionController *)self setIsDisambiguating:0];
    uint64_t v7 = [v6 recipient];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v9 = [v6 recipient];
      [(CKRecipientSelectionController *)self _showContactCardForRecipient:v9 sourceView:v10];
    }
  }
  else
  {
    [(CKRecipientSelectionController *)self sendUpdateRecipientForAtom:v6];
    [(CKRecipientSelectionController *)self setIsDisambiguating:1];
  }
}

- (void)sendUpdateRecipientForAtom:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 recipient];
  double v5 = [(CKRecipientSelectionController *)self searchListController];
  v7[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v5 updateRecipients:v6 disambiguatingRecipient:v4];

  [(CKRecipientSelectionController *)self _showSearchField];
}

- (void)composeRecipientView:(id)a3 showPersonCardForAtom:(id)a4
{
  id v9 = a4;
  double v5 = [v9 recipient];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v7 = [v9 recipient];
    [(CKRecipientSelectionController *)self _showDetailsForRecipient:v7 canDelete:0];
    uint64_t v8 = [(CKRecipientSelectionController *)self delegate];
    [v8 recipientSelectionControllerDidPushABViewController:self];
  }
}

- (void)composeRecipientView:(id)a3 didSelectRecipients:(id)a4
{
  id v8 = a4;
  if ([(CKRecipientSelectionController *)self isDisambiguating])
  {
    [(CKRecipientSelectionController *)self setIsDisambiguating:0];
    [(CKRecipientSelectionController *)self _hideSearchField];
  }
  BOOL v5 = [v8 count] == 1;
  id v6 = v8;
  if (v5)
  {
    uint64_t v7 = [v8 objectAtIndex:0];
    if (![(CKRecipientSelectionController *)self homogenizePreferredServiceForiMessage]&& ![(CKRecipientSelectionController *)self _recipientIsGroup:v7])
    {
      [(CKRecipientSelectionController *)self _showActionSheetForRecipient:v7 animated:1];
    }

    id v6 = v8;
  }
}

- (void)recipientViewDidBecomeFirstResponder:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(CKRecipientSelectionController *)self _shouldDisableToField];
  if (v4)
  {
    BOOL v5 = [(CKRecipientSelectionController *)self toField];
    id v6 = [v5 addButton];
    [v6 setHidden:1];
  }
  else if (![(CKRecipientSelectionController *)self isEditable])
  {
    goto LABEL_5;
  }
  [v8 setEditable:!v4];
LABEL_5:
  uint64_t v7 = [(CKRecipientSelectionController *)self delegate];
  [v7 recipientSelectionControllerDidBecomeFirstResponder:self];
}

- (void)recipientViewDidResignFirstResponder:(id)a3
{
  [a3 setEditable:0];
  id v4 = [(CKRecipientSelectionController *)self addressBookNotificationUpdater];
  [v4 updateIfNeeded];
}

- (id)composeRecipientView:(id)a3 contextMenuConfigurationForAtom:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKRecipientSelectionController *)self toField];

  if (v8 != v6) {
    goto LABEL_2;
  }
  double v11 = [v7 recipient];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  unint64_t v13 = [CKDetailsContactsManager alloc];
  double v14 = [(CKRecipientSelectionController *)self conversation];
  id v15 = [(CKDetailsContactsManager *)v13 initWithConversation:v14 delegate:self];
  [(CKRecipientSelectionController *)self setContactsManager:v15];

  if (isKindOfClass)
  {
    double v16 = [MEMORY[0x1E4F1CA48] array];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v42 = v7;
    double v17 = [v7 recipient];
    double v18 = [v17 children];

    uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v46 != v21) {
            objc_enumerationMutation(v18);
          }
          BOOL v23 = [*(id *)(*((void *)&v45 + 1) + 8 * i) normalizedAddress];
          uint64_t v24 = +[CKEntity entityForAddress:v23];
          [v16 addObject:v24];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v20);
    }

    BOOL v25 = [(CKRecipientSelectionController *)self conversation];
    v26 = [v25 recipients];
    int v27 = [v26 isEqualToArray:v16];

    if (v27)
    {
      BOOL v28 = [(CKRecipientSelectionController *)self conversation];
      v29 = [(CKRecipientSelectionController *)self contactsManager];
      id v9 = +[CKContextMenuGenerator menuForNamedGroupConversation:v28 andContactsManager:v29];
    }
    else
    {
      id v9 = 0;
    }

    id v7 = v42;
  }
  else
  {
    uint64_t v30 = [(CKRecipientSelectionController *)self contactsManager];
    int v31 = [v30 conformsToProtocol:&unk_1EE096660];

    if (!v31) {
      goto LABEL_2;
    }
    uint64_t v32 = [v7 recipient];
    if (!v32) {
      goto LABEL_2;
    }
    v33 = (void *)v32;
    v34 = [v7 recipient];
    v35 = [v34 normalizedAddress];

    if (!v35)
    {
LABEL_2:
      id v9 = 0;
      goto LABEL_3;
    }
    v36 = [v7 recipient];
    int64_t v37 = [v36 normalizedAddress];
    v38 = +[CKEntity entityForAddress:v37];

    v39 = [(CKRecipientSelectionController *)self contactsManager];
    id v9 = [v39 contextMenuForEntity:v38 atom:v7];
  }
  if (v9)
  {
    v40 = (void *)MEMORY[0x1E4F428F0];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __87__CKRecipientSelectionController_composeRecipientView_contextMenuConfigurationForAtom___block_invoke;
    v43[3] = &unk_1E56212E0;
    id v44 = v9;
    id v41 = v9;
    id v9 = [v40 configurationWithIdentifier:0 previewProvider:0 actionProvider:v43];
  }
LABEL_3:

  return v9;
}

id __87__CKRecipientSelectionController_composeRecipientView_contextMenuConfigurationForAtom___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)composeRecipientViewShowingSearchResults:(id)a3
{
  id v4 = [(CKRecipientSelectionController *)self searchListController];
  if ([v4 isSearchResultsHidden])
  {
    char v5 = 0;
  }
  else
  {
    id v6 = [(CKRecipientSelectionController *)self searchListController];
    char v5 = [v6 hasSearchResults];
  }
  return v5;
}

- (BOOL)presentSearchResultsForComposeRecipientView:(id)a3
{
  unint64_t v3 = [(CKRecipientSelectionController *)self searchListController];
  char v4 = [v3 hasSearchResults];

  return v4;
}

- (void)dismissSearchResultsForComposeRecipientView:(id)a3
{
  [a3 clearText];
  char v4 = [(CKRecipientSelectionController *)self searchListController];
  [v4 cancelSearch];

  [(CKRecipientSelectionController *)self _updateShowingSearch];
}

- (void)selectNextSearchResultForComposeRecipientView:(id)a3
{
  id v3 = [(CKRecipientSelectionController *)self searchListController];
  [v3 selectNextSearchResult];
}

- (void)selectPreviousSearchResultForComposeRecipientView:(id)a3
{
  id v3 = [(CKRecipientSelectionController *)self searchListController];
  [v3 selectPreviousSearchResult];
}

- (BOOL)chooseSelectedSearchResultForComposeRecipientView:(id)a3 context:(unint64_t)a4
{
  id v6 = [(CKRecipientSelectionController *)self searchListController];
  int v7 = [v6 confirmSelectedRecipient];

  if (a4 == 1 && v7)
  {
    id v8 = [(CKRecipientSelectionController *)self delegate];
    [v8 recipientSelectionControllerShouldResignFirstResponder:self];
  }
  return v7;
}

- (BOOL)expandSelectedSearchResultForComposeRecipientView:(id)a3
{
  char v4 = [(CKRecipientSelectionController *)self searchListController];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = [(CKRecipientSelectionController *)self searchListController];
  char v7 = [v6 expandSelectedRecipient];

  return v7;
}

- (BOOL)collapseSelectedSearchResultForComposeRecipientView:(id)a3
{
  char v4 = [(CKRecipientSelectionController *)self searchListController];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = [(CKRecipientSelectionController *)self searchListController];
  char v7 = [v6 collapseSelectedRecipient];

  return v7;
}

- (UIEdgeInsets)layoutMarginsForComposeRecipientView:(id)a3
{
  id v4 = a3;
  [(CKRecipientSelectionController *)self systemMinimumLayoutMargins];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [v4 effectiveUserInterfaceLayoutDirection];

  if (v13) {
    double v14 = v12;
  }
  else {
    double v14 = v8;
  }
  if (v13) {
    double v15 = v8;
  }
  else {
    double v15 = v12;
  }
  double v16 = +[CKUIBehavior sharedBehaviors];
  [v16 additionalComposeRecipientLayoutMargins];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = v6 + v18;
  double v26 = v15 + v24;
  double v27 = v10 + v22;
  double v28 = v14 + v20;
  result.right = v26;
  result.bottom = v27;
  result.left = v28;
  result.top = v25;
  return result;
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (IMOSLoggingEnabled())
  {
    double v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      double v11 = [(CKRecipientSelectionController *)self toField];
      double v12 = [v11 text];
      *(_DWORD *)buf = 134218240;
      unint64_t v37 = a5;
      __int16 v38 = 2048;
      uint64_t v39 = [v12 length];
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Selected recipient at index %ld, searchText length %ld", buf, 0x16u);
    }
  }
  uint64_t v13 = [(CKRecipientSelectionController *)self toField];
  [v13 clearText];

  [(CKRecipientSelectionController *)self _updateShowingSearch];
  double v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v15 = [v14 stewieEnabled];

  if (v15)
  {
    if ([v9 kind] == 6)
    {
      BOOL v16 = [(CKRecipientSelectionController *)self _openStewieAppForEmergencyIfRequired];
    }
    else
    {
      if ([v9 kind] != 7) {
        goto LABEL_11;
      }
      BOOL v16 = [(CKRecipientSelectionController *)self _openStewieAppForRoadsideIfRequired];
    }
    if (v16) {
      goto LABEL_34;
    }
  }
LABEL_11:
  BOOL v17 = [(CKRecipientSelectionController *)self _recipientIsGroup:v9];
  if (!v17)
  {
    if (![(CKRecipientSelectionController *)self isMAIDGroupsEnabled]) {
      goto LABEL_29;
    }
    int v19 = 0;
    goto LABEL_16;
  }
  int v18 = [(CKRecipientSelectionController *)self shouldAtomizeToConversationName];
  if ([(CKRecipientSelectionController *)self isMAIDGroupsEnabled])
  {
    int v19 = v18 ^ 1;
LABEL_16:
    BOOL v20 = [v9 sourceType] == 256 && v17;
    if ((v19 | v20)) {
      goto LABEL_20;
    }
LABEL_29:
    [(CKRecipientSelectionController *)self addRecipient:v9];
    double v25 = [v9 address];
    BOOL v26 = v25 == 0;

    if (v26) {
      [(CKRecipientSelectionController *)self handlePendingRecipient:v9];
    }
    goto LABEL_31;
  }
  if (v18) {
    goto LABEL_29;
  }
LABEL_20:
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  double v21 = -[CKRecipientSelectionController _expandedRecipientsForGroupRecipient:](self, "_expandedRecipientsForGroupRecipient:", v9, 0);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v21);
        }
        [(CKRecipientSelectionController *)self addRecipient:*(void *)(*((void *)&v31 + 1) + 8 * i)];
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v22);
  }

LABEL_31:
  double v27 = [(CKRecipientSelectionController *)self toField];
  char v28 = [v27 isFirstResponder];

  if ((v28 & 1) == 0)
  {
    v29 = [(CKRecipientSelectionController *)self toField];
    [v29 becomeFirstResponder];
  }
  uint64_t v30 = [(CKRecipientSelectionController *)self searchListController];
  [v30 didSelectRecipient:v9 atIndex:a5];

LABEL_34:
}

- (BOOL)_openStewieAppForEmergencyIfRequired
{
  id v3 = [MEMORY[0x1E4F6BC48] sharedInstance];
  int v4 = [v3 isStewieEmergencyActive];

  if (v4)
  {
    double v5 = +[CKConversationList sharedConversationList];
    id v6 = [v5 conversationForExistingChatWithChatIdentifier:*MEMORY[0x1E4F6E348]];

    int v7 = IMOSLoggingEnabled();
    if (v6)
    {
      if (v7)
      {
        id v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Opening emergency conversation", buf, 2u);
        }
      }
      id v9 = [(CKRecipientSelectionController *)self searchListController];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __70__CKRecipientSelectionController__openStewieAppForEmergencyIfRequired__block_invoke;
      void v16[3] = &unk_1E5620AF8;
      v16[4] = self;
      id v6 = v6;
      id v17 = v6;
      [v9 dismissViewControllerAnimated:1 completion:v16];
    }
    else if (v7)
    {
      double v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "No emergency conversation found", buf, 2u);
      }
    }
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F23A48]);
    [v6 setReason:2];
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    coreTelephonyClient = self->_coreTelephonyClient;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__CKRecipientSelectionController__openStewieAppForEmergencyIfRequired__block_invoke_301;
    v13[3] = &unk_1E56215F0;
    objc_copyWeak(&v14, (id *)buf);
    [(CoreTelephonyClient *)coreTelephonyClient requestStewieWithContext:v6 completion:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }

  return v4 ^ 1;
}

void __70__CKRecipientSelectionController__openStewieAppForEmergencyIfRequired__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1000));
  [WeakRetained showConversation:*(void *)(a1 + 40) animate:1];
}

void __70__CKRecipientSelectionController__openStewieAppForEmergencyIfRequired__block_invoke_301(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Opening Stewie SOS application", buf, 2u);
    }
  }
  if (v3)
  {
    double v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __70__CKRecipientSelectionController__openStewieAppForEmergencyIfRequired__block_invoke_301_cold_1(v3);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__CKRecipientSelectionController__openStewieAppForEmergencyIfRequired__block_invoke_302;
  block[3] = &unk_1E56215C8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v7);
}

void __70__CKRecipientSelectionController__openStewieAppForEmergencyIfRequired__block_invoke_302(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:0 completion:0];
}

- (BOOL)_openStewieAppForRoadsideIfRequired
{
  id v3 = [MEMORY[0x1E4F6BC48] sharedInstance];
  int v4 = [v3 isStewieRoadsideActive];

  if (v4)
  {
    double v5 = +[CKConversationList sharedConversationList];
    id v6 = [MEMORY[0x1E4F6BC48] sharedInstance];
    id v7 = [v6 mostRecentlyUsedRoadsideChatIdentifier];
    id v8 = [v5 conversationForExistingChatWithChatIdentifier:v7];

    int v9 = IMOSLoggingEnabled();
    if (v8)
    {
      if (v9)
      {
        double v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Opening most recent roadside conversation", buf, 2u);
        }
      }
      double v11 = [(CKRecipientSelectionController *)self searchListController];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __69__CKRecipientSelectionController__openStewieAppForRoadsideIfRequired__block_invoke;
      v18[3] = &unk_1E5620AF8;
      v18[4] = self;
      id v8 = v8;
      id v19 = v8;
      [v11 dismissViewControllerAnimated:1 completion:v18];
    }
    else if (v9)
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "No roadside conversation found", buf, 2u);
      }
    }
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F23A48]);
    [v8 setReason:7];
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    coreTelephonyClient = self->_coreTelephonyClient;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __69__CKRecipientSelectionController__openStewieAppForRoadsideIfRequired__block_invoke_304;
    v15[3] = &unk_1E56215F0;
    objc_copyWeak(&v16, (id *)buf);
    [(CoreTelephonyClient *)coreTelephonyClient requestStewieWithContext:v8 completion:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }

  return v4 ^ 1;
}

void __69__CKRecipientSelectionController__openStewieAppForRoadsideIfRequired__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1000));
  [WeakRetained showConversation:*(void *)(a1 + 40) animate:1];
}

void __69__CKRecipientSelectionController__openStewieAppForRoadsideIfRequired__block_invoke_304(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Opening Stewie Roadside application", buf, 2u);
    }
  }
  if (v3)
  {
    double v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __69__CKRecipientSelectionController__openStewieAppForRoadsideIfRequired__block_invoke_304_cold_1(v3);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__CKRecipientSelectionController__openStewieAppForRoadsideIfRequired__block_invoke_305;
  block[3] = &unk_1E56215C8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v7);
}

void __69__CKRecipientSelectionController__openStewieAppForRoadsideIfRequired__block_invoke_305(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:0 completion:0];
}

- (void)_handleIDSResultsWhenSearchTableIsHidden:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "We received an IDS query results when search table is visible. Checkinf if there are any penidng atoms we should update.", buf, 2u);
    }
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v5 = [(CKRecipientSelectionController *)self toField];
  id v6 = [v5 recipients];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        double v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        double v11 = [v10 address];
        BOOL v12 = v11 == 0;

        if (v12)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              BOOL v20 = v10;
              _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Found a pending recipient: %@. We will try to resolve it with the new IDS results.", buf, 0xCu);
            }
          }
          [(CKRecipientSelectionController *)self handlePendingRecipient:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v7);
  }
}

- (void)handlePendingRecipient:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Trying to updating pending state for recipient: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  id v6 = [(CKRecipientSelectionController *)self preferredRecipientForPendingUnifiedContact:v4];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F5A178]);
    uint64_t v8 = [v4 children];
    int v9 = (void *)[v7 initWithChildren:v8 defaultChild:v6];

    double v10 = [v6 normalizedAddress];
    [v9 setAddress:v10];

    double v11 = [(CKRecipientSelectionController *)self toField];
    [v11 removeRecipient:v4];

    BOOL v12 = [(CKRecipientSelectionController *)self toField];
    [v12 addRecipient:v9];

    uint64_t v13 = [(CKRecipientSelectionController *)self toField];
    [v13 invalidateAtomPresentationOptionsForRecipient:v6];

    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        id v17 = v9;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Replaced old pending recipient with new recipient: %@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    long long v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = 0;
      _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "We didn't find existing conversation or new recipient didn't finish resolving all IDS: %@.", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (id)preferredRecipientForPendingUnifiedContact:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Looking for preffered recipient for the pending recipient: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  id v6 = [v4 children];
  id v7 = [(CKRecipientSelectionController *)self preferredRecipientForExistingConversationOfRecipients:v6];

  if (!v7)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "No recipient in existing conversations. Looking for best handle for new contact: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    int v9 = [v4 children];
    id v7 = [(CKRecipientSelectionController *)self preferredRecipientForNewContact:v9];
  }
  if (IMOSLoggingEnabled())
  {
    double v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Returning preffered recipient: %@", (uint8_t *)&v12, 0xCu);
    }
  }

  return v7;
}

- (char)serviceTypeForRecipient:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F6E730] supportsBusinessChat];
  id v6 = [v4 normalizedAddress];
  id v7 = [v4 IDSCanonicalAddressForAddress:v6];

  uint64_t v8 = [(CKRecipientSelectionController *)self searchListController];
  int64_t v9 = [(CKRecipientSelectionController *)self searchListController:v8 idStatusForIDSID:v7];

  if (IMOSLoggingEnabled())
  {
    double v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      double v11 = [v4 normalizedAddress];
      *(_DWORD *)buf = 138412546;
      __int16 v38 = v11;
      __int16 v39 = 2048;
      int64_t v40 = v9;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "IDS status for recipinet address %@ is %ld", buf, 0x16u);
    }
  }
  if (v9 == 2)
  {
    LOBYTE(v16) = 0;
  }
  else if (v9 != 1 {
         || (([MEMORY[0x1E4F6BDB8] iMessageService],
  }
              int v12 = objc_claimAutoreleasedReturnValue(),
              int v13 = objc_msgSend(v12, "__ck_serviceType"),
              v12,
              int v14 = MEMORY[0x192FBA6A0](v7),
              !v5)
           ? (int v15 = 0)
           : (int v15 = 4),
             !v14 ? (int v16 = v13) : (int v16 = v15),
             v16 == 1))
  {
    id v17 = [(CKRecipientSelectionController *)self searchListController];
    int v18 = [v17 smsEnabled];

    if (v18)
    {
      id v19 = +[CKConversationList sharedConversationList];
      BOOL v20 = [(CKRecipientSelectionController *)self searchListController];
      double v21 = [v20 defaultiMessageAccount];
      uint64_t v22 = [v4 normalizedAddress];
      uint64_t v23 = IMStripFormattingFromAddress();
      double v24 = [v21 imHandleWithID:v23 alreadyCanonical:0];

      if (v24)
      {
        v36 = v24;
        double v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
        BOOL v26 = [v19 conversationForHandles:v25 displayName:0 joinedChatsOnly:1 create:0];

        if (v26)
        {
          double v27 = [v26 sendingService];
          if (IMOSLoggingEnabled())
          {
            CKLogCStringForType(19);
            char v28 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              __int16 v38 = v24;
              __int16 v39 = 2112;
              int64_t v40 = (int64_t)v27;
              _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_INFO, "Updating service color in recipient search list for handle: %@, with service: %@", buf, 0x16u);
            }
          }
          if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
          {
            long long v34 = v24;
            v35 = v27;
            _CKLogExternal();
          }
          LOBYTE(v16) = objc_msgSend(v27, "__ck_serviceType", v34, v35);
          int v29 = [v24 isBusiness];
          if (v5) {
            char v30 = 4;
          }
          else {
            char v30 = 0;
          }
          if (v29) {
            LOBYTE(v16) = v30;
          }

          goto LABEL_37;
        }
      }
      else if (IMOSLoggingEnabled())
      {
        long long v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          long long v32 = [v4 normalizedAddress];
          *(_DWORD *)buf = 138412290;
          __int16 v38 = v32;
          _os_log_impl(&dword_18EF18000, v31, OS_LOG_TYPE_INFO, "ServiceTypeForRecipient: Handle is nil for recipient address: %@", buf, 0xCu);
        }
      }
      LOBYTE(v16) = 1;
LABEL_37:

      goto LABEL_38;
    }
    LOBYTE(v16) = 1;
  }
LABEL_38:

  return v16;
}

- (id)expandedRecipientsForGroupRecipient:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isGroup])
  {
    uint64_t v4 = [v3 children];
  }
  else
  {
    v7[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  int v5 = (void *)v4;

  return v5;
}

- (char)serviceColorForRecipientAddresses:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = -1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__CKRecipientSelectionController_serviceColorForRecipientAddresses___block_invoke;
  v6[3] = &unk_1E5620C90;
  v6[4] = self;
  v6[5] = &v7;
  [v4 enumerateObjectsUsingBlock:v6];
  LOBYTE(self) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

void __68__CKRecipientSelectionController_serviceColorForRecipientAddresses___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v6 searchListController];
  uint64_t v8 = [v6 searchListController:v7 idStatusForIDSID:v12];

  if (v8 == 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
LABEL_7:
    *a4 = 1;
    goto LABEL_12;
  }
  if (v8 != 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -1;
    goto LABEL_7;
  }
  if (MEMORY[0x192FBA6A0](v12))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    char v10 = 6;
LABEL_10:
    *(unsigned char *)(v9 + 24) = v10;
    goto LABEL_12;
  }
  if (MEMORY[0x192FBA6F0](v12))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    char v10 = 12;
    goto LABEL_10;
  }
  double v11 = [MEMORY[0x1E4F6BDB8] iMessageService];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v11, "__ck_displayColor");

LABEL_12:
}

- (id)conversationForRecipients:(id)a3
{
  id v4 = a3;
  int v5 = +[CKConversationList sharedConversationList];
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  int v18 = __60__CKRecipientSelectionController_conversationForRecipients___block_invoke;
  id v19 = &unk_1E5621500;
  BOOL v20 = self;
  id v7 = v6;
  id v21 = v7;
  [v4 enumerateObjectsUsingBlock:&v16];

  uint64_t v8 = objc_msgSend(v5, "conversationForHandles:displayName:joinedChatsOnly:create:", v7, 0, 1, 0, v16, v17, v18, v19, v20);
  if ([v7 count] != 1) {
    goto LABEL_5;
  }
  uint64_t v9 = [v8 chat];
  char v10 = [v9 lastFinishedMessageItem];

  double v11 = [v10 handle];
  id v12 = [v7 firstObject];
  int v13 = [v12 ID];

  if (!v10 || [v11 isEqualToString:v13])
  {

LABEL_5:
    id v14 = v8;
    goto LABEL_6;
  }

  id v14 = 0;
LABEL_6:

  return v14;
}

void __60__CKRecipientSelectionController_conversationForRecipients___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 searchListController];
  id v6 = [v5 defaultiMessageAccount];
  id v7 = [v4 normalizedAddress];

  uint64_t v8 = IMStripFormattingFromAddress();
  id v10 = [v6 imHandleWithID:v8 alreadyCanonical:0];

  uint64_t v9 = v10;
  if (v10)
  {
    [*(id *)(a1 + 40) addObject:v10];
    uint64_t v9 = v10;
  }
}

- (BOOL)lastSentMessageWasNotDeliveredForConversation:(id)a3
{
  id v3 = [a3 chat];
  char v4 = [v3 shouldForceServerStatusRefresh];

  return v4;
}

- (BOOL)hasEmailRecipientsInAddresses:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (IMStringIsEmail())
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)colorTypeForRecipient:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  long long v8 = [(CKRecipientSelectionController *)self expandedRecipientsForGroupRecipient:v6];
  long long v9 = objc_msgSend(v8, "__imArrayByApplyingBlock:", &__block_literal_global_316);
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  char v34 = [(CKRecipientSelectionController *)self serviceColorForRecipientAddresses:v9];
  if ([v9 count])
  {
    long long v10 = [v9 firstObject];
  }
  else
  {
    long long v10 = 0;
  }
  int v11 = [MEMORY[0x1E4F6EA38] isInternationalSpamFilteringEnabled];
  if (v10) {
    int v12 = v11;
  }
  else {
    int v12 = 0;
  }
  int v29 = v8;
  if (v12 != 1)
  {
    if (*((unsigned __int8 *)v32 + 24) != 255) {
      goto LABEL_15;
    }
    int v14 = 0;
LABEL_13:
    int v15 = [(CKRecipientSelectionController *)self searchListController];
    int v16 = [v15 smsEnabled];

    if ((v16 | v14)) {
      goto LABEL_14;
    }
LABEL_15:
    double v24 = +[CKUIBehavior sharedBehaviors];
    double v25 = [v24 theme];
    id v23 = [v25 recipientTextColorForColorType:*((char *)v32 + 24)];

    v7[2](v7, v23);
    goto LABEL_16;
  }
  int v13 = [MEMORY[0x1E4F6EA38] receiverIsCandidateForHawking:v10];
  int v14 = v13;
  if (*((unsigned __int8 *)v32 + 24) == 255) {
    goto LABEL_13;
  }
  if (!v13) {
    goto LABEL_15;
  }
LABEL_14:
  [(CKRecipientSelectionController *)self hasEmailRecipientsInAddresses:v9];
  uint64_t v17 = [(CKRecipientSelectionController *)self conversationForRecipients:v8];
  id v26 = v6;
  [(CKRecipientSelectionController *)self lastSentMessageWasNotDeliveredForConversation:v17];
  int v18 = [v17 chat];
  [v18 receivedResponseForChat];

  id v19 = [v17 chat];
  BOOL v20 = [v17 chat];
  double v27 = [v20 lastAddressedHandleID];
  char v28 = [v17 chat];
  id v21 = [v28 lastAddressedSIMID];
  [v17 forceMMS];
  uint64_t v22 = [v17 chat];
  [v22 isDowngraded];
  id v23 = v17;
  char v30 = v7;
  IMChatCalculateServiceForSendingNewComposeMaybeForce();

  id v6 = v26;
LABEL_16:

  _Block_object_dispose(&v31, 8);
}

uint64_t __67__CKRecipientSelectionController_colorTypeForRecipient_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 IDSCanonicalAddress];
}

void __67__CKRecipientSelectionController_colorTypeForRecipient_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([*(id *)(a1 + 32) isBusinessConversation])
  {
    char v3 = 6;
  }
  else if ([*(id *)(a1 + 32) isStewieConversation])
  {
    char v3 = 12;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F6BDC0] iMessageService];
    if (v4 == v9)
    {

      char v3 = 1;
    }
    else
    {
      id v5 = [MEMORY[0x1E4F6BDC0] iMessageLiteService];
      char v3 = v5 == v9;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  id v6 = +[CKUIBehavior sharedBehaviors];
  id v7 = [v6 theme];
  long long v8 = [v7 recipientTextColorForColorType:*(char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)preferredColorTypeForExistingConversation:(id)a3
{
  id v3 = a3;
  id v4 = [v3 sendingService];
  if ([v3 isBusinessConversation])
  {
    uint64_t v5 = 6;
  }
  else if ([v3 isStewieConversation])
  {
    uint64_t v5 = 12;
  }
  else
  {
    uint64_t v5 = objc_msgSend(v4, "__ck_displayColor");
  }
  id v6 = +[CKUIBehavior sharedBehaviors];
  id v7 = [v6 theme];
  long long v8 = [v7 recipientTextColorForColorType:v5];

  return v8;
}

- (id)preferredRecipientForExistingConversationOfRecipients:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy__3;
  int v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Looking for existing conversation for these recipients: %@", buf, 0xCu);
    }
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__CKRecipientSelectionController_preferredRecipientForExistingConversationOfRecipients___block_invoke;
  v8[3] = &unk_1E5621640;
  v8[4] = self;
  void v8[5] = &v9;
  [v4 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __88__CKRecipientSelectionController_preferredRecipientForExistingConversationOfRecipients___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  long long v8 = [*(id *)(a1 + 32) handleForRecipientNormalizedAddress:v7];
  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 32) chatForIMHandle:v8];
    long long v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 chatIdentifier];
      int v12 = [v8 ID];
      int v13 = [v11 isEqualToString:v12];

      if (v13)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
        if (IMOSLoggingEnabled())
        {
          id v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            int v15 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            int v20 = 138412290;
            id v21 = v15;
            _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Found recipient from existing chat. Preferred recipient: %@", (uint8_t *)&v20, 0xCu);
          }
        }
        *a4 = 1;
        goto LABEL_21;
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          id v18 = [v10 chatIdentifier];
          id v19 = [v8 ID];
          int v20 = 138412546;
          id v21 = v18;
          __int16 v22 = 2112;
          id v23 = v19;
          _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "We didn't find a match of the chat identifier: %@ and handle ID = %@ ", (uint8_t *)&v20, 0x16u);
        }
LABEL_20:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412290;
        id v21 = v8;
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "There was no chat found for handle: %@", (uint8_t *)&v20, 0xCu);
      }
      goto LABEL_20;
    }
LABEL_21:

    goto LABEL_22;
  }
  if (IMOSLoggingEnabled())
  {
    long long v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v16 = [v7 normalizedAddress];
      int v20 = 138412290;
      id v21 = v16;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "There was no handle found for recipient normalized address: %@", (uint8_t *)&v20, 0xCu);
    }
    goto LABEL_21;
  }
LABEL_22:
}

- (id)handleForRecipientNormalizedAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKRecipientSelectionController *)self searchListController];
  id v6 = [v5 defaultiMessageAccount];
  id v7 = [v4 normalizedAddress];

  long long v8 = IMStripFormattingFromAddress();
  uint64_t v9 = [v6 imHandleWithID:v8 alreadyCanonical:0];

  return v9;
}

- (id)chatForIMHandle:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F6BC40];
  id v4 = a3;
  uint64_t v5 = [v3 sharedRegistry];
  id v6 = [v5 existingChatForIMHandle:v4 allowRetargeting:0 fixChatHandle:0];

  return v6;
}

- (char)_satelliteConnectedColorOverrideForRecipient:(id)a3 inConversation:(id)a4
{
  id v4 = objc_msgSend(a4, "sendingService", a3);
  uint64_t v5 = [MEMORY[0x1E4F6BDC0] iMessageLiteService];

  if (v4 == v5)
  {
    char v7 = 1;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F6BDC0] satelliteSMSService];

    if (v4 == v6) {
      char v7 = 0;
    }
    else {
      char v7 = -1;
    }
  }

  return v7;
}

- (void)tintColorForRecipient:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = (void (**)(id, void *))a4;
  long long v8 = +[CKUIBehavior sharedBehaviors];
  uint64_t v9 = [v8 theme];
  long long v10 = [v9 recipientTextColorForColorType:0xFFFFFFFFLL];

  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v6;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Request for setting color for: %@.", buf, 0xCu);
    }
  }
  int v12 = [(CKRecipientSelectionController *)self expandedRecipientsForGroupRecipient:v6];
  int v13 = [(CKRecipientSelectionController *)self conversationForRecipients:v12];
  id v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v15 = [v14 isCarrierPigeonEnabled];

  if (v15
    && ([MEMORY[0x1E4F6BC48] sharedInstance],
        id v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v16 isSatelliteConnectionActive],
        v16,
        v17))
  {
    uint64_t v18 = [(CKRecipientSelectionController *)self _satelliteConnectedColorOverrideForRecipient:v6 inConversation:v13];
    id v19 = +[CKUIBehavior sharedBehaviors];
    int v20 = [v19 theme];
    id v21 = [v20 recipientTextColorForColorType:v18];
    v7[2](v7, v21);
  }
  else if (v13 {
         && (([v6 isNotAChildOfUnifiedRecipient] & 1) != 0
  }
          || [v6 isUnnamedGroup]))
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v6;
        _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "There is existing conversation with recipient: %@. We will set the color from the conversaion.", buf, 0xCu);
      }
    }
    uint64_t v23 = [(CKRecipientSelectionController *)self preferredColorTypeForExistingConversation:v13];

    v7[2](v7, (void *)v23);
    long long v10 = (void *)v23;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v6;
        _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_INFO, "There is no existing conversation with recipient: %@", buf, 0xCu);
      }
    }
    double v25 = [v6 children];
    BOOL v26 = [(CKRecipientSelectionController *)self hasIDSResultsForAllRecipients:v25];

    int v27 = IMOSLoggingEnabled();
    if (v26)
    {
      if (v27)
      {
        char v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v6;
          _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_INFO, "Setting color from the IDS results for: %@ ", buf, 0xCu);
        }
      }
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __67__CKRecipientSelectionController_tintColorForRecipient_completion___block_invoke;
      v30[3] = &unk_1E5621668;
      uint64_t v31 = v7;
      [(CKRecipientSelectionController *)self colorTypeForRecipient:v6 completion:v30];
    }
    else
    {
      if (v27)
      {
        int v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v6;
          _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, "No IDS results: %@.", buf, 0xCu);
        }
      }
      v7[2](v7, v10);
    }
  }
}

uint64_t __67__CKRecipientSelectionController_tintColorForRecipient_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)autocompleteResultsController:(id)a3 tintColorForRecipient:(id)a4 completion:(id)a5
{
}

- (id)recipientIsDuetSuggestion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = a3;
  id v4 = (id)[v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v17;
    *(void *)&long long v5 = 138412290;
    long long v15 = v5;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (IMOSLoggingEnabled())
        {
          uint64_t v9 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v15;
            id v21 = v8;
            _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Checking for DUET results for  recipient: %@", buf, 0xCu);
          }
        }
        BOOL v10 = (objc_msgSend(v8, "sourceType", v15, (void)v16) & 0x10) == 0;
        int v11 = IMOSLoggingEnabled();
        if (!v10)
        {
          if (v11)
          {
            int v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Result is from Duet.", buf, 2u);
            }
          }
          id v4 = v8;
          goto LABEL_23;
        }
        if (v11)
        {
          int v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Result is not from Duet.", buf, 2u);
          }
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_23:

  return v4;
}

- (id)preferredRecipientForRecipients:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    long long v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Searching for preferred recipient for unified recipient: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  if (v4 && [v4 count])
  {
    uint64_t v6 = [(CKRecipientSelectionController *)self preferredRecipientForExistingConversationOfRecipients:v4];
    if (v6
      || ([(CKRecipientSelectionController *)self preferredRecipientForNewContact:v4], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      if (IMOSLoggingEnabled())
      {
        char v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "We found preferred handle for new contact from IDS. Invalidate the to filed.", (uint8_t *)&v11, 2u);
        }
      }
      long long v8 = [(CKRecipientSelectionController *)self toField];
      [v8 invalidateAtomPresentationOptionsForRecipient:v6];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "No recipients to search for. Returning nil for preferred recipient.", (uint8_t *)&v11, 2u);
      }
    }
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)autocompleteResultsController:(id)a3 preferredRecipientForRecipients:(id)a4
{
  return [(CKRecipientSelectionController *)self preferredRecipientForRecipients:a4];
}

- (id)preferredRecipientForNewContact:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    long long v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Looking for preferred recipient for new contact: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  if ([(CKRecipientSelectionController *)self hasIDSResultsForAllRecipients:v4])
  {
    uint64_t v6 = [(CKRecipientSelectionController *)self preferredRecipientForRecipients:v4 forServiceType:2];
    if (IMOSLoggingEnabled())
    {
      char v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Selected preferred recipient for iMessage: %@", (uint8_t *)&v14, 0xCu);
      }
    }
    if (!v6)
    {
      uint64_t v6 = [(CKRecipientSelectionController *)self preferredRecipientForRecipients:v4 forServiceType:3];
      if (IMOSLoggingEnabled())
      {
        long long v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          int v14 = 138412290;
          id v15 = v6;
          _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Selected preferred recipient for SMS: %@", (uint8_t *)&v14, 0xCu);
        }
      }
      if (!v6)
      {
        uint64_t v6 = [(CKRecipientSelectionController *)self preferredRecipientForRecipients:v4 forServiceType:4];
        if (IMOSLoggingEnabled())
        {
          uint64_t v9 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            int v14 = 138412290;
            id v15 = v6;
            _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Selected preferred recipient for Bussiness chat: %@", (uint8_t *)&v14, 0xCu);
          }
        }
        if (!v6)
        {
          uint64_t v6 = [(CKRecipientSelectionController *)self preferredRecipientForRecipients:v4 forServiceType:0];
          if (IMOSLoggingEnabled())
          {
            BOOL v10 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              int v14 = 138412290;
              id v15 = v6;
              _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Selected preferred recipient for invalid service type: %@", (uint8_t *)&v14, 0xCu);
            }
          }
        }
      }
    }
    if (IMOSLoggingEnabled())
    {
      int v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Returning preferred recipient: %@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "IDS didn't resolve for all handles. Return nil for preffered handle.", (uint8_t *)&v14, 2u);
      }
    }
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)preferredRecipientForRecipients:(id)a3 forServiceType:(char)a4
{
  int v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    id v10 = 0;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (-[CKRecipientSelectionController serviceTypeForRecipient:](self, "serviceTypeForRecipient:", v13, (void)v17) == v4)
        {
          if ([v13 isPhone])
          {
            id v15 = v13;

            goto LABEL_20;
          }
          if ([v13 isEmail]) {
            BOOL v14 = v10 == 0;
          }
          else {
            BOOL v14 = 0;
          }
          if (v14)
          {
            id v10 = v13;

            id v9 = v10;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v9 = 0;
    id v10 = 0;
  }

  id v9 = v9;
  id v15 = v9;
LABEL_20:

  return v15;
}

- (BOOL)hasIDSResultsForAllRecipients:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    long long v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Checking if we have IDS results for : %@ ", buf, 0xCu);
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v24;
    *(void *)&long long v8 = 138412546;
    long long v22 = v8;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "normalizedAddress", v22, (void)v23);
        uint64_t v13 = [v11 IDSCanonicalAddressForAddress:v12];

        BOOL v14 = [(CKRecipientSelectionController *)self searchListController];
        int64_t v15 = [(CKRecipientSelectionController *)self searchListController:v14 idStatusForIDSID:v13];

        int v16 = IMOSLoggingEnabled();
        if (!v15)
        {
          if (v16)
          {
            long long v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v22;
              id v28 = v13;
              __int16 v29 = 2048;
              int64_t v30 = 0;
              _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "IDS status for address: %@ is IDSIDStatusUnknown: %ld", buf, 0x16u);
            }
          }
          BOOL v19 = 0;
          goto LABEL_27;
        }
        if (v16)
        {
          long long v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v22;
            id v28 = v13;
            __int16 v29 = 2048;
            int64_t v30 = v15;
            _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "IDS status for address %@ is %ld", buf, 0x16u);
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    long long v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "IDS status is resolved for all recipients.", buf, 2u);
    }
  }
  BOOL v19 = 1;
LABEL_27:

  return v19;
}

- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4
{
  id v5 = a4;
  if ([v5 isGroup]) {
    [(CKRecipientSelectionController *)self _showDetailsForGroup:v5];
  }
  else {
    [(CKRecipientSelectionController *)self _showDetailsForRecipient:v5 canDelete:1];
  }
}

- (void)searchListControllerDidScroll:(id)a3
{
  id v6 = [(CNComposeRecipientTextView *)self->_toField textView];
  if ([v6 isFirstResponder])
  {
    char v4 = [MEMORY[0x1E4F42B08] isInHardwareKeyboardMode];

    if ((v4 & 1) == 0)
    {
      [(CKRecipientSelectionController *)self setPreventAtomization:1];
      id v5 = [(CKRecipientSelectionController *)self delegate];
      [v5 recipientSelectionControllerRequestDismissKeyboard:self];

      [(CKRecipientSelectionController *)self setPreventAtomization:0];
    }
  }
  else
  {
  }
}

- (void)refreshAvailabilityForRecipients:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v9 = [v8 isLazuliEnabled];

  if (v9)
  {
    id v10 = [(CKRecipientSelectionController *)self conversation];
    uint64_t v11 = [v10 serviceReachabilityContextForRefreshContext:v7];

    id v12 = [(CKRecipientSelectionController *)self expandedRecipientAvailabilities];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __75__CKRecipientSelectionController_refreshAvailabilityForRecipients_context___block_invoke;
    v13[3] = &unk_1E56216B0;
    id v14 = v6;
    id v15 = v7;
    int v16 = self;
    [v12 refreshAvailabilityForRecipients:v14 context:v11 resultHandler:v13];
  }
}

void __75__CKRecipientSelectionController_refreshAvailabilityForRecipients_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v34 = v8;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Availability request finished for recipients: %@", buf, 0xCu);
    }
  }
  if ([v6 isFinal])
  {
    int v9 = [MEMORY[0x1E4F6BDC0] rcsService];
    id v10 = [v9 internalName];
    if ([v5 isEqualToString:v10])
    {
      uint64_t v11 = [*(id *)(a1 + 40) preconditionsIgnoredForServices];
      if (![v11 count])
      {
        int v13 = [*(id *)(a1 + 40) isForPendingConversation];

        if (!v13)
        {
          id v12 = 0;
LABEL_11:
          if ([v6 isFinal]) {
            [*(id *)(a1 + 48) recipientAvailibilitiesDidUpdate];
          }
LABEL_13:

          goto LABEL_14;
        }
        id v14 = [*(id *)(a1 + 48) conversation];
        id v15 = [v14 chat];
        int v16 = [v15 participants];
        int v9 = objc_msgSend(v16, "__imArrayByApplyingBlock:", &__block_literal_global_325_0);

        long long v17 = [*(id *)(a1 + 48) expandedRecipientAvailabilities];
        long long v18 = [MEMORY[0x1E4F6BDC0] rcsService];
        BOOL v19 = [v18 internalName];
        id v12 = [v17 recipientsWithoutResults:v9 onService:v19];

        if (v12)
        {
          if ([v12 count])
          {
            long long v20 = [*(id *)(a1 + 48) conversation];
            uint64_t v32 = [v20 sendingService];

            if (v32)
            {
              uint64_t v31 = (void *)[*(id *)(a1 + 40) copy];
              id v21 = [v31 preconditionsIgnoredForServices];
              long long v22 = (void *)[v21 mutableCopy];
              long long v23 = v22;
              if (v22) {
                id v24 = v22;
              }
              else {
                id v24 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              }
              long long v25 = v24;

              long long v26 = (void *)MEMORY[0x1E4F1CAD0];
              int v27 = [v32 internalName];
              id v28 = [MEMORY[0x1E4F6BDC0] rcsService];
              __int16 v29 = [v28 internalName];
              int64_t v30 = objc_msgSend(v26, "setWithObjects:", v27, v29, 0);
              [v25 unionSet:v30];

              [v31 setPreconditionsIgnoredForServices:v25];
              [*(id *)(a1 + 48) refreshAvailabilityForRecipients:v12 context:v31];

              goto LABEL_13;
            }
          }
        }
LABEL_10:

        goto LABEL_11;
      }
    }
    id v12 = 0;
    goto LABEL_10;
  }
LABEL_14:
}

id __75__CKRecipientSelectionController_refreshAvailabilityForRecipients_context___block_invoke_322(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 ID];

  if (v3)
  {
    char v4 = [v2 ID];
    id v3 = IMChatCanonicalIDSIDsForAddress();
  }

  return v3;
}

- (void)searchListController:(id)a3 destinationsUpdated:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F6E778];
  id v6 = a4;
  id v7 = [v5 sharedFeatureFlags];
  int v8 = [v7 isLazuliEnabled];

  if (v8)
  {
    id v9 = [(CKRecipientSelectionController *)self expandedRecipientAvailabilities];
    [v9 addEntriesFromIDSResults:v6];
  }
  else
  {
    id v9 = [(CKRecipientSelectionController *)self recipientAvailabilities];
    [v9 addEntriesFromDictionary:v6];
  }
}

- (int64_t)searchListController:(id)a3 idStatusForIDSID:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v7 = [v6 isLazuliEnabled];

  if (v7)
  {
    int v8 = [(CKRecipientSelectionController *)self expandedRecipientAvailabilities];
    int64_t v9 = [v8 idStatusForRecipient:v5 service:*MEMORY[0x1E4F6E1B0]];
  }
  else
  {
    id v10 = [(CKRecipientSelectionController *)self recipientAvailabilities];
    uint64_t v11 = [v10 objectForKey:v5];

    if (!v11)
    {
      int64_t v9 = 0;
      goto LABEL_7;
    }
    int v8 = [(CKRecipientSelectionController *)self recipientAvailabilities];
    id v12 = [v8 objectForKey:v5];
    int64_t v9 = [v12 integerValue];
  }
LABEL_7:

  return v9;
}

- (void)autocompleteGroupDetailViewController:(id)a3 didAskToRemoveGroup:(id)a4
{
  [(CKRecipientSelectionController *)self setRecentContactForPresentedCNCard:a4];

  [(CKRecipientSelectionController *)self _removeRecent];
}

- (void)autocompleteGroupDetailViewController:(id)a3 didTapComposeRecipient:(id)a4
{
}

- (CNContactStore)contactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    char v4 = [MEMORY[0x1E4F6E6D8] sharedInstance];
    id v5 = [v4 getContactStore];
    id v6 = self->_contactStore;
    self->_contactStore = v5;

    contactStore = self->_contactStore;
  }

  return contactStore;
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v9 = a4;
  id v5 = +[CKRecipientGenerator sharedRecipientGenerator];
  id v6 = [v5 recipientWithContactProperty:v9];

  if (!v6)
  {
    int v7 = [(CKRecipientSelectionController *)self toField];
    int v8 = [v9 contact];
    id v6 = [(CKRecipientSelectionController *)self composeRecipientView:v7 composeRecipientForContact:v8];
  }
  [(CKRecipientSelectionController *)self addRecipient:v6];
  [(CKRecipientSelectionController *)self _dismissPeoplePicker];
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v5 = a4;
  id v6 = [(CKRecipientSelectionController *)self toField];
  id v7 = [(CKRecipientSelectionController *)self composeRecipientView:v6 composeRecipientForContact:v5];

  [(CKRecipientSelectionController *)self addRecipient:v7];
  [(CKRecipientSelectionController *)self _dismissPeoplePicker];
}

- (void)_dismissPeoplePicker
{
  if (self->_contactPickerViewController)
  {
    id v3 = +[CKAdaptivePresentationController sharedInstance];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54__CKRecipientSelectionController__dismissPeoplePicker__block_invoke;
    v5[3] = &unk_1E5620C40;
    v5[4] = self;
    [v3 dismissViewControllerAnimated:1 completion:v5];

    [(CKRecipientSelectionController *)self setPeoplePickerHidden:1];
    contactPickerViewController = self->_contactPickerViewController;
    self->_contactPickerViewController = 0;
  }
}

void __54__CKRecipientSelectionController__dismissPeoplePicker__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) firstResponder];
  [v2 reloadInputViews];

  id v4 = [*(id *)(a1 + 32) toField];
  id v3 = [v4 textView];
  [v3 becomeFirstResponder];
}

- (void)setGameCenterPickerBlock:(id)a3
{
  id v4 = _Block_copy(a3);
  id gameCenterPickerBlock = self->_gameCenterPickerBlock;
  self->_id gameCenterPickerBlock = v4;

  if (!self->_toFieldPlaceholderLabel)
  {
    id v6 = [(CKRecipientSelectionController *)self toField];
    id v7 = [v6 textView];
    [v7 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    id v14 = [(CKRecipientSelectionController *)self toField];
    id v15 = [v14 labelView];
    [v15 bounds];
    double v17 = v16;

    long long v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v9, v11, v13, v17);
    [(CKRecipientSelectionController *)self setToFieldPlaceholderLabel:v18];

    [(CKRecipientSelectionController *)self systemMinimumLayoutMargins];
    double v20 = v19;
    id v21 = [(CKRecipientSelectionController *)self toField];
    [v21 titleLabelBaselineAlignmentRectForLabel:self->_toFieldPlaceholderLabel];
    double v23 = v22;
    double v25 = v24;
    id v48 = v26;

    int v27 = [(CKRecipientSelectionController *)self toField];
    id v28 = [v27 addButton];
    [v28 frame];
    double v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;

    unint64_t v37 = [(CKRecipientSelectionController *)self toField];
    [v37 safeAreaInsets];
    double v39 = v20 + v38;

    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
    {
      v51.origin.x = v30;
      v51.origin.y = v32;
      v51.size.double width = v34;
      v51.size.double height = v36;
      double MaxX = CGRectGetMaxX(v51);
      double v41 = v39 + *(double *)&v48 - MaxX;
    }
    else
    {
      double MaxX = v23 + v39;
      double v41 = v30 - (v23 + v39);
    }
    -[UILabel setFrame:](self->_toFieldPlaceholderLabel, "setFrame:", MaxX, v25, v41, v17);
    [(UILabel *)self->_toFieldPlaceholderLabel setAutoresizingMask:18];
    id v42 = [(CKRecipientSelectionController *)self toField];
    double v43 = [v42 textView];
    id v44 = [v43 font];
    [(UILabel *)self->_toFieldPlaceholderLabel setFont:v44];

    long long v45 = [MEMORY[0x1E4F428B8] lightGrayColor];
    [(UILabel *)self->_toFieldPlaceholderLabel setTextColor:v45];

    long long v46 = CKFrameworkBundle();
    long long v47 = [v46 localizedStringForKey:@"GAME_CENTER_TO_FIELD_PLACEHOLDER" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [(UILabel *)self->_toFieldPlaceholderLabel setText:v47];

    [(UILabel *)self->_toFieldPlaceholderLabel setUserInteractionEnabled:0];
    id v49 = [(CKRecipientSelectionController *)self toField];
    [v49 addSubview:self->_toFieldPlaceholderLabel];
  }
}

- (void)setGameCenterPickedHandles:(id)a3 playerNames:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] || objc_msgSend(v7, "count"))
  {
    double v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count") + objc_msgSend(v6, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v33;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8 * v13);
          id v15 = [(CKRecipientSelectionController *)self toField];
          double v16 = [(CKRecipientSelectionController *)self composeRecipientView:v15 composeRecipientForAddress:v14];

          [v8 addObject:v16];
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v11);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v17 = v7;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v29;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v28 + 1) + 8 * v21);
          id v23 = objc_alloc(MEMORY[0x1E4F5A140]);
          double v24 = objc_msgSend(v23, "initWithContact:address:kind:", 0, v22, 5, (void)v28);
          [v8 addObject:v24];

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v19);
    }

    [(CKRecipientSelectionController *)self addRecipients:v8];
    double v25 = [(CKRecipientSelectionController *)self _canonicalRecipientAddresses];
    [(CKRecipientSelectionController *)self refreshComposeSendingServiceForAddresses:v25 withCompletionBlock:0];
  }
  [(CKRecipientSelectionController *)self _dismissPeoplePicker];
  long long v26 = [(CKRecipientSelectionController *)self toField];
  int v27 = [v26 inputAccessoryView];
  [v27 setHidden:0];
}

- (BOOL)isGameCenterRecipient:(id)a3
{
  return self->_gameCenterPickerBlock && [a3 kind] == 5;
}

- (void)reset
{
  id v3 = [(CKRecipientSelectionController *)self toField];
  [v3 reset];

  [(CKRecipientSelectionController *)self setSearchResultsHidden:1];
  [(CKRecipientSelectionController *)self setPeoplePickerHidden:1];
  [(CKRecipientSelectionController *)self stopCheckingRecipientAvailabilityAndRemoveAllTimers];
  self->_didShowOneTimeErrorAlert = 0;
  id v4 = [(CKRecipientSelectionController *)self recipients];
  id v5 = (void *)[v4 copy];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__CKRecipientSelectionController_reset__block_invoke;
  v11[3] = &unk_1E56216D8;
  v11[4] = self;
  [v5 enumerateObjectsUsingBlock:v11];
  id v6 = [(CKRecipientSelectionController *)self searchListController];
  id v7 = [v6 tableView];
  [v7 setAlpha:1.0];

  double v8 = [(CKRecipientSelectionController *)self searchListController];
  [v8 invalidateSearchManager];

  id v9 = [(CKRecipientSelectionController *)self searchListController];
  [v9 setEnteredRecipients:0];

  uint64_t v10 = [(CKRecipientSelectionController *)self searchListController];
  [v10 setSuppressGroupSuggestions:0];
}

uint64_t __39__CKRecipientSelectionController_reset__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeRecipient:a2];
}

- (id)recipients
{
  id v2 = [(CKRecipientSelectionController *)self toField];
  id v3 = [v2 recipients];

  return v3;
}

- (void)setConversation:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_conversation = &self->_conversation;
  if (([(CKPendingConversation *)*p_conversation isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)p_conversation, a3);
    id v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v8 = [v7 isKeyTransparencyEnabled];

    if (v8)
    {
      id v9 = [v5 chat];
      [v9 fetchKTStatus];
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v5;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Adopting pending conversation %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)addRecipients:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v14 = v4;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v10 = [v9 address];
          BOOL v11 = v10 == 0;

          if (v11 && IMOSLoggingEnabled())
          {
            id v12 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v20 = v9;
              _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "-[CKRecipientSelectionController addRecipient] adding recipient %@ with nil address, this will set atom to pending state...", buf, 0xCu);
            }
          }
          uint64_t v13 = [(CKRecipientSelectionController *)self toField];
          [v13 addRecipient:v9];
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v6);
    }

    id v4 = v14;
  }
}

- (BOOL)isSearchResultsHidden
{
  id v3 = [(CKRecipientSelectionController *)self searchListController];

  if (!v3) {
    return 1;
  }
  id v4 = [(CKRecipientSelectionController *)self searchListController];
  char v5 = [v4 isSearchResultsHidden];

  return v5;
}

- (void)setEditable:(BOOL)a3
{
  if (self->_editable != a3)
  {
    self->_editable = a3;
    id v4 = [(CKRecipientSelectionController *)self toField];
    [v4 setEditable:self->_editable];

    char v5 = [(CKRecipientSelectionController *)self toField];
    [v5 setUserInteractionEnabled:self->_editable];

    uint64_t v6 = [(CKRecipientSelectionController *)self toField];
    [v6 setEnabled:self->_editable];

    [(CKRecipientSelectionController *)self _updateToField];
  }
}

- (BOOL)toFieldIsFirstResponder
{
  id v2 = [(CKRecipientSelectionController *)self toField];
  id v3 = [v2 textView];
  char v4 = [v3 isFirstResponder];

  return v4;
}

- (void)setSearchResultsHidden:(BOOL)a3
{
  if (a3)
  {
    [(CKRecipientSelectionController *)self _hideSearchField];
  }
  else
  {
    id v6 = [(CKRecipientSelectionController *)self toField];
    char v4 = [v6 textView];
    if ([v4 isFirstResponder])
    {
      BOOL v5 = [(CKRecipientSelectionController *)self isPeoplePickerHidden];

      if (v5)
      {
        [(CKRecipientSelectionController *)self _showSearchField];
      }
    }
    else
    {
    }
  }
}

- (void)invalidateOutstandingIDStatusRequests
{
  id v2 = [(CKRecipientSelectionController *)self searchListController];
  [v2 invalidateOutstandingIDStatusRequests];
}

- (BOOL)finishedComposingRecipients
{
  id v3 = [(CKRecipientSelectionController *)self toField];
  char v4 = [v3 textView];
  int v5 = [v4 isFirstResponder];

  if (!v5) {
    return 1;
  }
  id v6 = [(CKRecipientSelectionController *)self toField];
  uint64_t v7 = [v6 text];

  if (v7) {
    char v8 = [v7 isEqualToString:&stru_1EDE4CA38];
  }
  else {
    char v8 = 1;
  }

  return v8;
}

- (BOOL)hasFailediMessageRecipients
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if (![(CKRecipientSelectionController *)self homogenizePreferredServiceForiMessage])
  {
    id v3 = [(CKRecipientSelectionController *)self recipients];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__CKRecipientSelectionController_hasFailediMessageRecipients__block_invoke;
    v6[3] = &unk_1E5621640;
    v6[4] = self;
    v6[5] = &v7;
    [v3 enumerateObjectsUsingBlock:v6];
  }
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __61__CKRecipientSelectionController_hasFailediMessageRecipients__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isGameCenterRecipient:") & 1) == 0)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = [MEMORY[0x1E4F6BDB8] iMessageService];
    LODWORD(v6) = [v6 _availibilityForRecipient:v8 onService:v7];

    if (!v6)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

- (BOOL)hasUnreachableEmergencyRecipient
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F61740] sharedInstance];
  if ([v3 supportsSMS])
  {

LABEL_13:
    LOBYTE(v6) = 0;
    return v6;
  }
  int v4 = [MEMORY[0x1E4F6BDC0] smsEnabled];

  if (!v4) {
    goto LABEL_13;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v5 = [(CKRecipientSelectionController *)self recipients];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) rawAddress];
        char IsEmergencyPhoneNumber = IMStringIsEmergencyPhoneNumber();

        if (IsEmergencyPhoneNumber)
        {
          LOBYTE(v6) = 1;
          goto LABEL_15;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v6;
}

- (BOOL)hasPendingiMessageRecipients
{
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  char v16 = ![(CKRecipientSelectionController *)self finishedComposingRecipients];
  id v3 = [(CKRecipientSelectionController *)self toField];
  int v4 = [v3 recipients];
  if ([v4 count] == 1)
  {
    int v5 = [(CKRecipientSelectionController *)self toField];
    uint64_t v6 = [v5 recipients];
    uint64_t v7 = [v6 firstObject];
    int v8 = [v7 isGroup];
  }
  else
  {
    int v8 = 0;
  }

  if (!*((unsigned char *)v14 + 24)
    && (([(CKRecipientSelectionController *)self homogenizePreferredServiceForiMessage] | v8) & 1) == 0)
  {
    uint64_t v9 = [(CKRecipientSelectionController *)self recipients];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__CKRecipientSelectionController_hasPendingiMessageRecipients__block_invoke;
    v12[3] = &unk_1E5621640;
    v12[4] = self;
    v12[5] = &v13;
    [v9 enumerateObjectsUsingBlock:v12];
  }
  char v10 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v10;
}

void __62__CKRecipientSelectionController_hasPendingiMessageRecipients__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isGameCenterRecipient:") & 1) == 0)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = [MEMORY[0x1E4F6BDB8] iMessageService];
    LODWORD(v6) = [v6 _availibilityForRecipient:v8 onService:v7];

    if (v6 == -1)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

- (void)stopCheckingRecipientAvailabilityAndRemoveAllTimers
{
  id v3 = [(CKRecipientSelectionController *)self recipientAvailibityTimers];
  int v4 = [v3 allValues];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_339_0];

  id v5 = [(CKRecipientSelectionController *)self recipientAvailibityTimers];
  [v5 removeAllObjects];
}

uint64_t __85__CKRecipientSelectionController_stopCheckingRecipientAvailabilityAndRemoveAllTimers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (double)collapsedHeight
{
  [MEMORY[0x1E4F5A168] preferredHeight];
  double v4 = v3;
  id v5 = +[CKUIBehavior sharedBehaviors];
  int v6 = [v5 recipientSelectionCollapsedHeightIncludesNavigationBar];
  double v7 = 0.0;
  if (v6) {
    [(CKRecipientSelectionController *)self _navigationBarInsets];
  }
  double v8 = v4 + v7;

  return v8;
}

- (void)refreshComposeSendingServiceForAddresses:(id)a3 context:(id)a4 withCompletionBlock:(id)a5
{
  double v8 = (CKPendingConversationStatusRefreshContext *)a4;
  id v9 = a5;
  char v10 = (void *)MEMORY[0x1E4F6E778];
  id v11 = a3;
  long long v12 = [v10 sharedFeatureFlags];
  int v13 = [v12 isLazuliEnabled];

  if (v13)
  {
    if (!v8) {
      double v8 = objc_alloc_init(CKPendingConversationStatusRefreshContext);
    }
    long long v14 = [(CKPendingConversationStatusRefreshContext *)v8 availabilities];

    if (!v14)
    {
      uint64_t v15 = [(CKRecipientSelectionController *)self expandedRecipientAvailabilities];
      [(CKPendingConversationStatusRefreshContext *)v8 setAvailabilities:v15];
    }
    char v16 = [(CKRecipientSelectionController *)self conversation];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __103__CKRecipientSelectionController_refreshComposeSendingServiceForAddresses_context_withCompletionBlock___block_invoke;
    v22[3] = &unk_1E5621720;
    uint64_t v17 = &v23;
    v22[4] = self;
    id v23 = v9;
    id v18 = v9;
    [v16 refreshComposeSendingServiceForAddresses:v11 context:v8 withCompletionBlock:v22];
  }
  else
  {
    char v16 = [(CKRecipientSelectionController *)self conversation];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __103__CKRecipientSelectionController_refreshComposeSendingServiceForAddresses_context_withCompletionBlock___block_invoke_2;
    v20[3] = &unk_1E5621748;
    uint64_t v17 = &v21;
    v20[4] = self;
    id v21 = v9;
    id v19 = v9;
    [v16 refreshComposeSendingServiceForAddresses:v11 withCompletionBlock:v20];
  }
}

void __103__CKRecipientSelectionController_refreshComposeSendingServiceForAddresses_context_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  id v15 = a2;
  id v13 = a3;
  if (a5) {
    [*(id *)(a1 + 32) recipientAvailibilitiesDidUpdate];
  }
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, id, id, uint64_t, uint64_t, uint64_t))(v14 + 16))(v14, v15, v13, a4, a6, a7);
  }
}

void __103__CKRecipientSelectionController_refreshComposeSendingServiceForAddresses_context_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v12 = a2;
  id v9 = a3;
  char v10 = [*(id *)(a1 + 32) recipientAvailabilities];
  [v10 addEntriesFromDictionary:v9];

  [*(id *)(a1 + 32) recipientAvailibilitiesDidUpdate];
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id, id, uint64_t, uint64_t, uint64_t))(v11 + 16))(v11, v12, v9, a4, 1, a5);
  }
}

- (void)refreshComposeSendingServiceForAddresses:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  double v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __95__CKRecipientSelectionController_refreshComposeSendingServiceForAddresses_withCompletionBlock___block_invoke;
    v8[3] = &unk_1E5621770;
    id v9 = v6;
    [(CKRecipientSelectionController *)self refreshComposeSendingServiceForAddresses:a3 context:0 withCompletionBlock:v8];
  }
  else
  {
    [(CKRecipientSelectionController *)self refreshComposeSendingServiceForAddresses:a3 context:0 withCompletionBlock:0];
  }
}

uint64_t __95__CKRecipientSelectionController_refreshComposeSendingServiceForAddresses_withCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addRecipient:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (([MEMORY[0x1E4F6E730] supportsBusinessChat] & 1) != 0
      || ([v4 rawAddress],
          id v5 = objc_claimAutoreleasedReturnValue(),
          IMChatCanonicalIDSIDsForAddress(),
          id v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = MEMORY[0x192FBA6A0](),
          v6,
          v5,
          !v7))
    {
      double v8 = [(CKRecipientSelectionController *)self toField];
      [v8 addRecipient:v4];

      id v9 = [(CKRecipientSelectionController *)self _canonicalRecipientAddresses];
      char v10 = [(CKRecipientSelectionController *)self conversation];
      uint64_t v11 = [v10 sendingService];
      id v12 = [MEMORY[0x1E4F6BDC0] iMessageService];

      if (v11 == v12)
      {
        id v18 = 0;
      }
      else
      {
        id v13 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v14 = [MEMORY[0x1E4F6BDC0] iMessageService];
        id v15 = [v14 internalName];
        char v16 = [MEMORY[0x1E4F6BDC0] rcsService];
        uint64_t v17 = [v16 internalName];
        id v18 = objc_msgSend(v13, "setWithObjects:", v15, v17, 0);
      }
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        uint64_t v20 = [v4 autocompleteResult];
        id v21 = [v20 identifier];

        uint64_t v22 = [MEMORY[0x1E4F6BC40] sharedRegistry];
        id v23 = [v22 existingChatWithGUID:v21];

        if (v23)
        {
          double v24 = [MEMORY[0x1E4F6BDC8] sharedController];
          double v25 = [v24 reachabilityContextForChat:v23];
        }
        else
        {
          double v25 = 0;
        }
      }
      else
      {
        double v25 = 0;
      }
      long long v26 = [CKPendingConversationStatusRefreshContext alloc];
      int v27 = [(CKRecipientSelectionController *)self expandedRecipientAvailabilities];
      long long v28 = [(CKPendingConversationStatusRefreshContext *)v26 initWithAvailabilities:v27];

      [(CKPendingConversationStatusRefreshContext *)v28 setCustomContext:v25];
      [(CKPendingConversationStatusRefreshContext *)v28 setIsForPendingConversation:(isKindOfClass & 1) == 0];
      [(CKPendingConversationStatusRefreshContext *)v28 setPreconditionsIgnoredForServices:v18];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __47__CKRecipientSelectionController_addRecipient___block_invoke;
      v29[3] = &unk_1E5621798;
      v29[4] = self;
      id v30 = v4;
      [(CKRecipientSelectionController *)self refreshComposeSendingServiceForAddresses:v9 context:v28 withCompletionBlock:v29];
    }
    else
    {
      [(CKRecipientSelectionController *)self _presentBusinessChatNotSupportedError];
    }
  }
}

uint64_t __47__CKRecipientSelectionController_addRecipient___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  if (a6 == 1 && a5)
  {
    uint64_t v7 = result;
    [*(id *)(result + 32) _showOneTimeErrorAlertForAddedRecipient:*(void *)(result + 40) service:a2 withError:1];
    double v8 = *(void **)(v7 + 32);
    return [v8 _adjustToFieldPositionIfNecessary];
  }
  return result;
}

- (void)removeRecipient:(id)a3
{
  id v4 = a3;
  [(CKRecipientSelectionController *)self _removeAvailabilityTimeoutTimerForRecipient:v4];
  id v5 = [(CKRecipientSelectionController *)self toField];
  [v5 removeRecipient:v4];

  id v6 = [(CKRecipientSelectionController *)self _canonicalRecipientAddresses];
  [(CKRecipientSelectionController *)self refreshComposeSendingServiceForAddresses:v6 withCompletionBlock:0];
}

- (id)_canonicalRecipientAddresses
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(CKRecipientSelectionController *)self recipients];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [v9 composeRecipients];
        }
        else if ([v9 isGroup])
        {
          uint64_t v10 = [v9 children];
        }
        else
        {
          if ([(CKRecipientSelectionController *)self isGameCenterRecipient:v9])
          {
            uint64_t v11 = 0;
            goto LABEL_14;
          }
          id v18 = v9;
          uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
        }
        uint64_t v11 = (void *)v10;
LABEL_14:
        id v12 = objc_msgSend(v11, "__imArrayByApplyingBlock:", &__block_literal_global_347_0);
        [v3 addObjectsFromArray:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

uint64_t __62__CKRecipientSelectionController__canonicalRecipientAddresses__block_invoke(uint64_t a1, void *a2)
{
  return [a2 IDSCanonicalAddress];
}

- (BOOL)_shouldDisableToField
{
  double v3 = [(CKRecipientSelectionController *)self conversation];
  char v4 = [v3 isBusinessConversation];

  uint64_t v5 = [(CKRecipientSelectionController *)self conversation];
  LOBYTE(v3) = v4 | [v5 isStewieConversation];

  return (char)v3;
}

- (void)_updateToField
{
  double v3 = [(CKRecipientSelectionController *)self toField];
  char v4 = [(CKRecipientSelectionController *)self _toFieldCollapsedTextColor];
  [v3 setInactiveTextColor:v4];

  uint64_t v5 = [(CKRecipientSelectionController *)self toField];
  uint64_t v6 = [v5 addButton];
  uint64_t v7 = [(CKRecipientSelectionController *)self conversation];
  objc_msgSend(v6, "setEnabled:", objc_msgSend(v7, "canInsertMoreRecipients"));

  double v8 = [(CKRecipientSelectionController *)self toField];
  [v8 invalidateAtomPresentationOptions];

  if ([(CKRecipientSelectionController *)self _shouldDisableToField])
  {
    id v9 = [(CKRecipientSelectionController *)self toField];
    uint64_t v10 = [v9 addButton];
    [v10 setHidden:1];

    uint64_t v11 = [(CKRecipientSelectionController *)self toField];
    id v12 = [v11 textView];
    [v12 setEditable:0];
  }
  [(CKRecipientSelectionController *)self _refreshActionSheet];
  id v13 = [(CKRecipientSelectionController *)self searchListController];

  if (v13)
  {
    long long v14 = [(CKRecipientSelectionController *)self searchListController];
    long long v15 = [(CKRecipientSelectionController *)self recipients];
    [v14 setEnteredRecipients:v15];
  }
  long long v16 = [(CKRecipientSelectionController *)self toFieldContainerView];
  [v16 frame];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  if (CKIsRunningInMacCatalyst())
  {
    id v23 = +[CKUIBehavior sharedBehaviors];
    [v23 toFieldXOffset];
    double v18 = v24;

    double v25 = 0.0;
  }
  else
  {
    [(CKRecipientSelectionController *)self _navigationBarInsets];
    double v25 = v26;
  }
  int v27 = [(CKRecipientSelectionController *)self toFieldContainerView];
  objc_msgSend(v27, "setFrame:", v18, v25, v20, v22);

  long long v28 = [(CKRecipientSelectionController *)self toField];
  [v28 frame];
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  if (CKIsRunningInMacCatalyst())
  {
    [(CKRecipientSelectionController *)self composeRecipientViewOriginY];
    double v32 = v35;
  }
  CGFloat v36 = [(CKRecipientSelectionController *)self toField];
  objc_msgSend(v36, "setFrame:", v30, v32, v20, v34);

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __48__CKRecipientSelectionController__updateToField__block_invoke;
  v37[3] = &unk_1E5620C40;
  v37[4] = self;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v37];
  [(CKRecipientSelectionController *)self _adjustToFieldSeparatorInsetsIfNecessary];
}

uint64_t __48__CKRecipientSelectionController__updateToField__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _adjustToFieldPositionIfNecessary];
}

- (id)_addressForRecipient:(id)a3
{
  return (id)[a3 normalizedAddress];
}

- (void)_updateToFieldRecipientsData
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v3 = [(CKRecipientSelectionController *)self toField];
  [v3 clearText];

  char v4 = [(CKRecipientSelectionController *)self recipients];
  uint64_t v5 = (void *)[v4 copy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        id v12 = +[CKRecipientGenerator sharedRecipientGenerator];
        id v13 = [(CKRecipientSelectionController *)self _addressForRecipient:v11];
        long long v14 = [v12 recipientWithAddress:v13];

        if (v14)
        {
          [(CKRecipientSelectionController *)self removeRecipient:v11];
          [(CKRecipientSelectionController *)self addRecipient:v14];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [(CKRecipientSelectionController *)self _updateToField];
}

- (void)_updateYOriginSearchListController
{
  double v3 = [(CKRecipientSelectionController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = [(CKRecipientSelectionController *)self separator];
  [v12 frame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  if ([(CKRecipientSelectionController *)self isBeingPresentedInMacDetailsView])
  {
    double v21 = [(CKRecipientSelectionController *)self toField];
    [v21 frame];
    double v7 = v22;

    id v23 = [(CKRecipientSelectionController *)self toField];
    [v23 frame];
    double v16 = v24;
  }
  double v25 = [(CKRecipientSelectionController *)self searchListController];
  double v26 = [v25 view];
  objc_msgSend(v26, "setFrame:", v5, v7, v9, v11);

  id v27 = [(CKRecipientSelectionController *)self separator];
  objc_msgSend(v27, "setFrame:", v14, v16, v18, v20);
}

- (id)_serviceForRecipientPresentationOptions
{
  id v2 = [(CKRecipientSelectionController *)self conversation];
  double v3 = [v2 sendingService];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F6BDB8] iMessageService];
  }
  double v6 = v5;

  return v6;
}

- (unint64_t)_atomPresentationOptionsForRecipient:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 address];

  if (v5)
  {
    if ([MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled])
    {
      double v6 = [(CKRecipientSelectionController *)self currentConversationContext];

      if (v6)
      {
        double v7 = [(CKRecipientSelectionController *)self currentConversationContext];
        double v8 = [v7 allowedByContactsHandle];
        double v9 = [v4 normalizedAddress];
        double v10 = [v8 objectForKey:v9];

        if (v10 && ![v10 BOOLValue])
        {

          unint64_t v28 = 0x2000;
          goto LABEL_87;
        }
      }
    }
    double v11 = [(CKRecipientSelectionController *)self conversation];
    double v70 = [v11 sendingService];

    id v12 = [(CKRecipientSelectionController *)self _serviceForRecipientPresentationOptions];
    int v69 = [(CKRecipientSelectionController *)self _availibilityForRecipient:v4 onService:v12];

    double v13 = [MEMORY[0x1E4F6BDB8] iMessageService];
    int v14 = [(CKRecipientSelectionController *)self _availibilityForRecipient:v4 onService:v13];

    double v15 = [v4 rawAddress];
    double v16 = IMChatCanonicalIDSIDsForAddress();
    double v17 = [v16 _stripFZIDPrefix];
    int v18 = MEMORY[0x192FBA6E0]();

    double v19 = [(CKRecipientSelectionController *)self toField];
    double v20 = [v19 recipients];
    if ([v20 count] == 1)
    {
      double v21 = [(CKRecipientSelectionController *)self toField];
      double v22 = [v21 recipients];
      id v23 = [v22 firstObject];
      char v24 = [v23 isGroup];

      if (v24)
      {
        int v25 = 1;
        int v26 = 1;
        goto LABEL_20;
      }
    }
    else
    {
    }
    double v29 = [(CKRecipientSelectionController *)self delegate];
    if ([v29 recipientSelectionIsGroup:self]) {
      int v25 = 1;
    }
    else {
      int v25 = [v4 isGroup];
    }

    int v26 = 0;
LABEL_20:
    double v30 = [MEMORY[0x1E4F6BC48] sharedInstance];
    int v31 = [v30 isSatelliteConnectionActive];

    if (v25 & v31)
    {
      uint64_t v32 = 0x10000;
LABEL_79:
      if ([(CKRecipientSelectionController *)self shouldShowVerifiedIconForRecipient:v4])
      {
        unint64_t v28 = v32 | 0x100000;
      }
      else
      {
        unint64_t v28 = v32;
      }
      if (IMOSLoggingEnabled())
      {
        v67 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v76 = v28;
          _os_log_impl(&dword_18EF18000, v67, OS_LOG_TYPE_INFO, "atomPresentationOptionsForRecipient returning %lu", buf, 0xCu);
        }
      }
      goto LABEL_87;
    }
    if ([(CKRecipientSelectionController *)self isGameCenterRecipient:v4])
    {
      uint64_t v32 = 8;
      goto LABEL_79;
    }
    if (objc_msgSend(v70, "__ck_isRCS"))
    {
      double v33 = [(CKRecipientSelectionController *)self expandedRecipientAvailabilities];
      double v34 = [v4 IDSCanonicalAddress];
      int v35 = [v33 hasResultsForRecipient:v34];

      if (v35)
      {
        buf[0] = 0;
        CGFloat v36 = [(CKRecipientSelectionController *)self expandedRecipientAvailabilities];
        unint64_t v37 = [v4 IDSCanonicalAddress];
        uint64_t v38 = [v70 name];
        double v39 = [v36 reachabilityForRecipient:v37 service:v38 isFinal:buf];

        int64_t v40 = [(CKRecipientSelectionController *)self expandedRecipientAvailabilities];
        double v41 = [v4 IDSCanonicalAddress];
        id v42 = [v40 reachabilityForRecipient:v41 service:*MEMORY[0x1E4F6E1A0]];

        if (v69 != -1) {
          [(CKRecipientSelectionController *)self _removeAvailabilityTimeoutTimerForRecipient:v4];
        }
        if (v39 && ((int v43 = [v39 isReachable], buf[0]) ? (v44 = 1) : (v44 = v43), v44 == 1))
        {
          if ([v39 isReachable])
          {
            uint64_t v32 = 2;
          }
          else if ([v42 isReachable])
          {
            uint64_t v32 = 2;
          }
          else
          {
            uint64_t v32 = 1;
          }
        }
        else
        {
          uint64_t v32 = 6;
        }

        goto LABEL_79;
      }
    }
    if (self->_forceMMS)
    {
      uint64_t v32 = 2;
      goto LABEL_79;
    }
    if ((v26 | [(CKRecipientSelectionController *)self homogenizePreferredServiceForiMessage]) == 1)
    {
      int v45 = objc_msgSend(v70, "__ck_isMadrid");
      if (v14 == 1) {
        int v46 = 1;
      }
      else {
        int v46 = v45;
      }
      if (v46) {
        uint64_t v32 = 0;
      }
      else {
        uint64_t v32 = 2;
      }
      long long v47 = [v4 children];
      uint64_t v48 = [v47 indexOfObjectPassingTest:&__block_literal_global_351_0];

      int v49 = [v4 isGroup];
      if ((objc_msgSend(v70, "__ck_isMadrid") & 1) == 0)
      {
        int v50 = v48 == 0x7FFFFFFFFFFFFFFFLL ? 0 : v25;
        if ((v49 | v18) ^ 1 | v50) {
          uint64_t v32 = 1;
        }
      }
      goto LABEL_79;
    }
    int v51 = v69;
    if (v69 != -1)
    {
      [(CKRecipientSelectionController *)self _removeAvailabilityTimeoutTimerForRecipient:v4];
      int v51 = v69;
    }
    if (v14 == 1)
    {
      if ((v18 & 1) == 0)
      {
        int v52 = 0;
        uint64_t v32 = objc_msgSend(v70, "__ck_isMadrid") ^ 1;
        goto LABEL_74;
      }
      goto LABEL_64;
    }
    if (v51 == -1)
    {
      v53 = [(CKRecipientSelectionController *)self recipientAvailibityTimers];
      v54 = [v53 objectForKey:v4];

      if (v54)
      {
        int v55 = [v54 isValid];
        int v52 = v55 ^ 1;
        if (v55) {
          uint64_t v32 = 4;
        }
        else {
          uint64_t v32 = 1;
        }
      }
      else
      {
        [(CKRecipientSelectionController *)self _startAvailabilityTimeoutTimerForRecipient:v4];
        int v52 = 0;
        uint64_t v32 = 4;
      }
    }
    else
    {
      if ((_BYTE)v51)
      {
LABEL_64:
        int v52 = 0;
        uint64_t v32 = 0;
        goto LABEL_74;
      }
      int v52 = 1;
      if (v18) {
        uint64_t v32 = 2;
      }
      else {
        uint64_t v32 = 1;
      }
    }
LABEL_74:
    v56 = +[CKUIBehavior sharedBehaviors];
    int v57 = v52 & [v56 shouldAutomaticallyCheckAvailabilityOfAlternateAddresses];

    if (v57 == 1)
    {
      v58 = [(CKRecipientSelectionController *)self _alternateAddressesForRecipient:v4];
      v59 = objc_msgSend(v58, "__imArrayByApplyingBlock:", &__block_literal_global_354);
      v60 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v61 = [v60 isLazuliEnabled];

      if (v61)
      {
        v62 = [CKPendingConversationStatusRefreshContext alloc];
        v63 = [(CKRecipientSelectionController *)self expandedRecipientAvailabilities];
        v64 = [(CKPendingConversationStatusRefreshContext *)v62 initWithAvailabilities:v63];

        v65 = [(CKRecipientSelectionController *)self conversation];
        v73[0] = MEMORY[0x1E4F143A8];
        v73[1] = 3221225472;
        v73[2] = __71__CKRecipientSelectionController__atomPresentationOptionsForRecipient___block_invoke_3;
        v73[3] = &unk_1E5621800;
        v73[4] = self;
        id v74 = v4;
        [v65 refreshStatusForAddresses:v59 context:v64 withCompletionBlock:v73];
      }
      else
      {
        v66 = [(CKRecipientSelectionController *)self conversation];
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = __71__CKRecipientSelectionController__atomPresentationOptionsForRecipient___block_invoke_4;
        v71[3] = &unk_1E5621828;
        v71[4] = self;
        id v72 = v4;
        [v66 refreshStatusForAddresses:v59 withCompletionBlock:v71];
      }
    }
    goto LABEL_79;
  }
  if (IMOSLoggingEnabled())
  {
    id v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v76 = (unint64_t)v4;
      _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "Recipient (%@) address is nil. Set atom state to pending...", buf, 0xCu);
    }
  }
  unint64_t v28 = 4;
LABEL_87:

  return v28;
}

uint64_t __71__CKRecipientSelectionController__atomPresentationOptionsForRecipient___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 rawAddress];
  double v3 = IMChatCanonicalIDSIDsForAddress();
  id v4 = [v3 _stripFZIDPrefix];
  uint64_t IsEmail = IMStringIsEmail();

  return IsEmail;
}

uint64_t __71__CKRecipientSelectionController__atomPresentationOptionsForRecipient___block_invoke_2()
{
  return IMChatCanonicalIDSIDsForAddress();
}

void __71__CKRecipientSelectionController__atomPresentationOptionsForRecipient___block_invoke_3(uint64_t a1, void *a2, void *a3, int a4, int a5)
{
  id v10 = a2;
  id v9 = a3;
  if (a4) {
    [*(id *)(a1 + 32) _removeAvailabilityTimeoutTimerForRecipient:*(void *)(a1 + 40)];
  }
  if (a5) {
    [*(id *)(a1 + 32) _updateToField];
  }
}

void __71__CKRecipientSelectionController__atomPresentationOptionsForRecipient___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  double v6 = *(void **)(a1 + 32);
  id v7 = a3;
  double v8 = [v6 recipientAvailabilities];
  id v12 = (id)[v8 copy];

  id v9 = [*(id *)(a1 + 32) recipientAvailabilities];
  [v9 addEntriesFromDictionary:v7];

  if (a4) {
    [*(id *)(a1 + 32) _removeAvailabilityTimeoutTimerForRecipient:*(void *)(a1 + 40)];
  }
  id v10 = [*(id *)(a1 + 32) recipientAvailabilities];
  char v11 = [v12 isEqualToDictionary:v10];

  if ((v11 & 1) == 0) {
    [*(id *)(a1 + 32) _updateToField];
  }
}

- (BOOL)shouldShowVerifiedIconForRecipient:(id)a3
{
  id v4 = a3;
  id v5 = [(CKRecipientSelectionController *)self conversation];
  double v6 = [v5 chat];
  BOOL v7 = +[CKContactKeyVerificationRecipientsHelper shouldShowVerifiedIconForRecipient:v4 inChat:v6];

  return v7;
}

- (void)_handleKeyTransparencyStatusChangedNotification:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isKeyTransparencyEnabled];

  if (v6)
  {
    BOOL v7 = [v4 userInfo];
    double v8 = [v7 objectForKey:*MEMORY[0x1E4F6B988]];

    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        int v25 = v8;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Status changed for handles: %@", buf, 0xCu);
      }
    }
    id v10 = [(CKRecipientSelectionController *)self recipients];
    char v11 = [(CKRecipientSelectionController *)self conversation];
    id v12 = +[CKContactKeyVerificationRecipientsHelper recipientsToUpdateForUpdatedCKVHandles:v8 recipients:v10 inConversation:v11];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v20;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * v16);
          int v18 = [(CKRecipientSelectionController *)self toField];
          [v18 invalidateAtomPresentationOptionsForRecipient:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }
  }
}

- (id)_toFieldCollapsedTextColor
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (![(CKRecipientSelectionController *)self hasFailediMessageRecipients]
    && ![(CKRecipientSelectionController *)self hasTimedOutRecipients])
  {
    if ([(CKRecipientSelectionController *)self hasPendingiMessageRecipients])
    {
      char v13 = 1;
      goto LABEL_27;
    }
    uint64_t v14 = [(CKRecipientSelectionController *)self conversation];
    char v15 = [v14 isBusinessConversation];

    if (v15)
    {
      char v13 = 6;
      goto LABEL_27;
    }
    uint64_t v16 = [(CKRecipientSelectionController *)self conversation];
    char v17 = [v16 isStewieConversation];

    if (v17)
    {
      char v13 = 12;
      goto LABEL_27;
    }
    int v18 = [(CKRecipientSelectionController *)self conversation];
    if ((unint64_t)[v18 recipientCount] <= 1)
    {
    }
    else
    {
      long long v19 = [MEMORY[0x1E4F6BC48] sharedInstance];
      char v20 = [v19 isSatelliteConnectionActive];

      if (v20)
      {
        char v13 = -1;
        goto LABEL_27;
      }
    }
    double v3 = [(CKRecipientSelectionController *)self conversation];
    int v25 = [v3 sendingService];
    char v13 = objc_msgSend(v25, "__ck_displayColor");

LABEL_18:
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v13 = 3;
    goto LABEL_27;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  double v3 = [(CKRecipientSelectionController *)self recipients];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v9 = [v8 IDSCanonicalAddress];
        int v10 = [v9 _appearsToBeEmail];

        if (v10)
        {
          char v11 = [MEMORY[0x1E4F6BDB8] iMessageService];
          int v12 = [(CKRecipientSelectionController *)self _availibilityForRecipient:v8 onService:v11];

          if (!v12)
          {
            char v13 = 3;
            goto LABEL_18;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v5) {
        continue;
      }
      break;
    }
    char v13 = 0;
    goto LABEL_18;
  }

  char v13 = 0;
LABEL_27:
  long long v21 = +[CKUIBehavior sharedBehaviors];
  long long v22 = [v21 theme];
  id v23 = [v22 recipientTextColorForColorType:v13];

  return v23;
}

- (void)_handleAddressBookChangedNotification:(id)a3
{
  uint64_t v4 = [(CKRecipientSelectionController *)self addressBookNotificationUpdater];
  [v4 setNeedsUpdate];

  uint64_t v5 = [(CKRecipientSelectionController *)self toField];
  uint64_t v6 = [v5 textView];
  char v7 = [v6 isEditing];

  if ((v7 & 1) == 0)
  {
    id v8 = [(CKRecipientSelectionController *)self addressBookNotificationUpdater];
    [v8 updateIfNeeded];
  }
}

- (void)_handleContactStoreBatchLoadCompleteNotification:(id)a3
{
  uint64_t v4 = [(CKRecipientSelectionController *)self addressBookNotificationUpdater];
  [v4 setNeedsUpdate];

  uint64_t v5 = [(CKRecipientSelectionController *)self toField];
  uint64_t v6 = [v5 textView];
  char v7 = [v6 isEditing];

  if ((v7 & 1) == 0)
  {
    id v8 = [(CKRecipientSelectionController *)self addressBookNotificationUpdater];
    [v8 updateIfNeeded];
  }
}

- (void)_handleAddressBookPartialChangedNotification:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F6CA90]];

  char v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6CA80]];

  if ([v6 length]
    && ([v8 isEqualToString:*MEMORY[0x1E4F6CA68]] & 1) == 0
    && ([v8 isEqualToString:*MEMORY[0x1E4F6CA70]] & 1) == 0
    && ([v8 isEqualToString:*MEMORY[0x1E4F6CA78]] & 1) == 0)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = [(CKRecipientSelectionController *)self recipients];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [(CKRecipientSelectionController *)self _addressForRecipient:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          int v15 = [v6 isEqualToString:v14];

          if (v15)
          {
            [(CKRecipientSelectionController *)self _handleAddressBookChangedNotification:v4];
            goto LABEL_15;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
}

- (void)_handleConversationPreferredServiceDidChangeNotification:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v7 = [v4 object];
    id v8 = [v7 chat];
    if (v8)
    {
    }
    else
    {
      id v9 = [(CKRecipientSelectionController *)self conversation];
      uint64_t v10 = [v9 chat];

      if (!v10) {
        goto LABEL_11;
      }
    }
    uint64_t v11 = [(CKRecipientSelectionController *)self conversation];
    uint64_t v12 = [v11 chat];
    char v13 = [v4 object];
    uint64_t v14 = [v13 chat];
    char v15 = [v12 isEqual:v14];

    if ((v15 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        long long v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          long long v17 = [v4 object];
          long long v18 = [v17 chat];
          long long v19 = [v18 chatIdentifier];
          char v20 = [(CKRecipientSelectionController *)self conversation];
          uint64_t v21 = [v20 chat];
          long long v22 = [v21 chatIdentifier];
          int v26 = 138412546;
          long long v27 = v19;
          __int16 v28 = 2112;
          long long v29 = v22;
          _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "notification.object %@ conversation.chat %@", (uint8_t *)&v26, 0x16u);
        }
      }
      id v23 = [(CKRecipientSelectionController *)self conversation];
      char v24 = [v23 handles];
      int v25 = objc_msgSend(v24, "__imArrayByApplyingBlock:", &__block_literal_global_360);

      [(CKRecipientSelectionController *)self refreshComposeSendingServiceForAddresses:v25 withCompletionBlock:0];
    }
  }
LABEL_11:
  [(CKRecipientSelectionController *)self _updateToField];
  [(CKRecipientSelectionController *)self conversationPreferredServiceDidChange];
}

id __91__CKRecipientSelectionController__handleConversationPreferredServiceDidChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 ID];
  double v3 = IMChatCanonicalIDSIDsForAddress();

  return v3;
}

- (char)_availibilityForRecipient:(id)a3 onService:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 rawAddress];
  id v9 = IMChatCanonicalIDSIDsForAddress();

  int v10 = IMOSLoggingEnabled();
  if (!v9)
  {
    if (v10)
    {
      long long v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        long long v19 = [v6 rawAddress];
        int v25 = 138412546;
        int v26 = v19;
        __int16 v27 = 2112;
        id v28 = v6;
        _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "IMChatCanonicalIDSIDsForAddress returned nil idsAddress for %@ / %@", (uint8_t *)&v25, 0x16u);
      }
    }
LABEL_19:
    char v21 = -1;
    goto LABEL_20;
  }
  if (v10)
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [v6 rawAddress];
      int v25 = 138412802;
      int v26 = v12;
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2048;
      uint64_t v30 = 0;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "IDSIDStatus for %@ / %@ returned %ld", (uint8_t *)&v25, 0x20u);
    }
  }
  char v13 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v14 = [v13 isLazuliEnabled];

  if (v14)
  {
    char v15 = [(CKRecipientSelectionController *)self expandedRecipientAvailabilities];
    long long v16 = [v7 internalName];
    uint64_t v17 = [v15 idStatusForRecipient:v9 service:v16];
  }
  else
  {
    char v15 = [(CKRecipientSelectionController *)self recipientAvailabilities];
    long long v16 = [v15 objectForKey:v9];
    uint64_t v17 = [v16 integerValue];
  }
  uint64_t v20 = v17;

  if (v20 == 2) {
    goto LABEL_17;
  }
  if (v20 != 1) {
    goto LABEL_19;
  }
  if ([MEMORY[0x1E4F6E730] supportsBusinessChat] & 1) == 0 && (MEMORY[0x192FBA6A0](v9))
  {
LABEL_17:
    char v21 = 0;
    goto LABEL_20;
  }
  char v21 = 1;
LABEL_20:
  if (IMOSLoggingEnabled())
  {
    long long v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = [v6 rawAddress];
      int v25 = 138412802;
      int v26 = v23;
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2048;
      uint64_t v30 = v21;
      _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "availibilityForRecipient %@ / %@ returned as %ld", (uint8_t *)&v25, 0x20u);
    }
  }

  return v21;
}

- (void)_startAvailabilityTimeoutTimerForRecipient:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CKRecipientSelectionController *)self recipientAvailibityTimers];

  if (!v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    [(CKRecipientSelectionController *)self setRecipientAvailibityTimers:v6];
  }
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v4 forKey:@"recipient"];
  id v8 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__handleRecipientAvailabilityTimeout_ selector:v7 userInfo:0 repeats:30.0];
  id v9 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v9 addTimer:v8 forMode:*MEMORY[0x1E4F1C3A0]];

  int v10 = [(CKRecipientSelectionController *)self recipientAvailibityTimers];
  [v10 setObject:v8 forKey:v4];

  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [v4 address];
      int v13 = 138412290;
      int v14 = v12;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Started availability timer for %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)_removeAvailabilityTimeoutTimerForRecipient:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CKRecipientSelectionController *)self recipientAvailibityTimers];
  id v6 = [v5 objectForKey:v4];

  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v4 address];
      int v9 = [v6 isValid];
      int v10 = @"NO";
      if (v9) {
        int v10 = @"YES";
      }
      int v13 = 138412546;
      int v14 = v8;
      __int16 v15 = 2112;
      long long v16 = v10;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Cancelling availability timer for %@ (was valid: %@)", (uint8_t *)&v13, 0x16u);
    }
  }
  if (v6)
  {
    uint64_t v11 = [(CKRecipientSelectionController *)self recipientAvailibityTimers];
    [v11 removeObjectForKey:v4];

    [v6 invalidate];
  }
  uint64_t v12 = [(CKRecipientSelectionController *)self delegate];
  [v12 recipientSelectionController:self didFinishAvailaiblityLookupForRecipient:v4];
}

- (void)_handleRecipientAvailabilityTimeout:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:@"recipient"];
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v6 address];
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v8;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Timeout of availability timer for %@", buf, 0xCu);
    }
  }
  if (CKShowInternalErrors())
  {
    int v9 = [v6 rawAddress];
    int v10 = NSString;
    uint64_t v11 = CKFrameworkBundle();
    uint64_t v12 = [v11 localizedStringForKey:@"RECIPIENT_AVAILABILITY_TIMEOUT_ERROR_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    int v13 = objc_msgSend(v10, "stringWithFormat:", v12, v9);

    int v14 = [MEMORY[0x1E4F42738] sharedApplication];
    LODWORD(v12) = [v14 userInterfaceLayoutDirection] == 1;

    if (v12) {
      __int16 v15 = @"\u200F";
    }
    else {
      __int16 v15 = @"\u200E";
    }
    long long v16 = [(__CFString *)v15 stringByAppendingString:v13];

    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v16 forKey:*MEMORY[0x1E4F28568]];
    long long v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.MobileSMS.CKRecipientAvailabilityTimeout" code:1 userInfo:v17];
    CKShowError(v18, self);
  }
  [v4 invalidate];
  [(CKRecipientSelectionController *)self _updateToField];
}

- (BOOL)hasTimedOutRecipients
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if (![(CKRecipientSelectionController *)self homogenizePreferredServiceForiMessage])
  {
    double v3 = [(CKRecipientSelectionController *)self recipients];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__CKRecipientSelectionController_hasTimedOutRecipients__block_invoke;
    v6[3] = &unk_1E5621640;
    v6[4] = self;
    v6[5] = &v7;
    [v3 enumerateObjectsUsingBlock:v6];
  }
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __55__CKRecipientSelectionController_hasTimedOutRecipients__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = [v6 recipientAvailibityTimers];
  uint64_t v11 = [v8 objectForKey:v7];

  uint64_t v9 = v11;
  if (v11)
  {
    char v10 = [v11 isValid];
    uint64_t v9 = v11;
    if ((v10 & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

- (id)_recipientCausingTooManyRecipientsError
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  char v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  double v3 = [(CKRecipientSelectionController *)self recipients];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__CKRecipientSelectionController__recipientCausingTooManyRecipientsError__block_invoke;
  v6[3] = &unk_1E5621640;
  v6[4] = self;
  v6[5] = &v7;
  [v3 enumerateObjectsWithOptions:2 usingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __73__CKRecipientSelectionController__recipientCausingTooManyRecipientsError__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [MEMORY[0x1E4F6BDB8] iMessageService];
  LODWORD(v7) = [v7 _availibilityForRecipient:v9 onService:v8];

  if (!v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_showOneTimeErrorAlertForAddedRecipient:(id)a3 service:(id)a4 withError:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = v9;
  if (a5 != 1 || self->_didShowOneTimeErrorAlert) {
    goto LABEL_32;
  }
  if (v9)
  {
    if (objc_msgSend(v9, "__ck_isiMessage"))
    {
LABEL_5:
      uint64_t v11 = CKFrameworkBundle();
      id v12 = [v11 localizedStringForKey:@"ADDRESS_LIST_FULL" value:&stru_1EDE4CA38 table:@"ChatKit"];

      int v13 = [MEMORY[0x1E4F6BDB8] iMessageService];
      int v14 = [(CKConversation *)self->_conversation lastAddressedHandle];
      __int16 v15 = [(CKConversation *)self->_conversation lastAddressedSIMID];
      uint64_t v16 = objc_msgSend(v13, "__ck_maxRecipientCountForHandle:simID:", v14, v15);

      uint64_t v17 = (void *)MEMORY[0x1E4F28EE0];
      long long v18 = [NSNumber numberWithInteger:v16];
      long long v19 = [v17 localizedStringFromNumber:v18 numberStyle:1];

      uint64_t v20 = NSString;
      uint64_t v21 = CKFrameworkBundle();
      long long v22 = [v21 localizedStringForKey:@"ERR_TOO_MANY_RECIPIENTS_FOR_IMESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      id v23 = objc_msgSend(v20, "stringWithFormat:", v22, v19);

      char v24 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v25 = [v24 userInterfaceLayoutDirection];

      if (v25 == 1) {
        int v26 = @"\u200F";
      }
      else {
        int v26 = @"\u200E";
      }
      __int16 v27 = [(__CFString *)v26 stringByAppendingString:v23];
      goto LABEL_29;
    }
  }
  else
  {
    id v28 = [(CKPendingConversation *)self->_conversation previousSendingService];
    char v29 = objc_msgSend(v28, "__ck_isiMessage");

    if (v29) {
      goto LABEL_5;
    }
  }
  if ([(CKRecipientSelectionController *)self _availibilityForRecipient:v8 onService:v10])
  {
    id v30 = [(CKRecipientSelectionController *)self _recipientCausingTooManyRecipientsError];
  }
  else
  {
    id v30 = v8;
  }
  id v23 = v30;
  uint64_t v31 = [MEMORY[0x1E4F6BDC0] smsService];
  int v32 = [(CKRecipientSelectionController *)self _availibilityForRecipient:v8 onService:v31];

  if (v32 == 1)
  {
    id v33 = [MEMORY[0x1E4F6BDC0] smsService];
  }
  else if (v10)
  {
    id v33 = v10;
  }
  else
  {
    id v33 = [(CKPendingConversation *)self->_conversation previousSendingService];
  }
  double v34 = v33;
  int v35 = [v23 compositeName];
  CGFloat v36 = [(CKConversation *)self->_conversation lastAddressedHandle];
  unint64_t v37 = [(CKConversation *)self->_conversation lastAddressedSIMID];
  v59 = v34;
  uint64_t v38 = objc_msgSend(v34, "__ck_maxRecipientCountForHandle:simID:", v36, v37);

  double v39 = (void *)MEMORY[0x1E4F28EE0];
  int64_t v40 = [NSNumber numberWithInteger:v38];
  long long v19 = [v39 localizedStringFromNumber:v40 numberStyle:1];

  if (v35 && ([v35 isEqualToString:&stru_1EDE4CA38] & 1) == 0)
  {
    id v42 = NSString;
    int v43 = CKFrameworkBundle();
    int v44 = [v43 localizedStringForKey:@"CANNOT_ADD_RECIPIENT_NAME" value:&stru_1EDE4CA38 table:@"ChatKit"];
    double v41 = objc_msgSend(v42, "stringWithFormat:", v44, v35);

    int v45 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v46 = [v45 userInterfaceLayoutDirection];

    if (v46 == 1) {
      long long v47 = @"\u200F";
    }
    else {
      long long v47 = @"\u200E";
    }
    id v12 = [(__CFString *)v47 stringByAppendingString:v41];
  }
  else
  {
    double v41 = CKFrameworkBundle();
    id v12 = [v41 localizedStringForKey:@"CANNOT_ADD_RECIPIENT" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }

  uint64_t v48 = NSString;
  int v49 = CKFrameworkBundle();
  int v50 = [v49 localizedStringForKey:@"ERR_ALL_RECIPIENTS_NEED_IMESSAGE_OR_RCS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  int v51 = objc_msgSend(v48, "stringWithFormat:", v50, v19);

  int v52 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v53 = [v52 userInterfaceLayoutDirection];

  if (v53 == 1) {
    v54 = @"\u200F";
  }
  else {
    v54 = @"\u200E";
  }
  __int16 v27 = [(__CFString *)v54 stringByAppendingString:v51];

LABEL_29:
  int v55 = CKFrameworkBundle();
  v56 = [v55 localizedStringForKey:@"OK" value:&stru_1EDE4CA38 table:@"ChatKit"];

  id location = 0;
  objc_initWeak(&location, self);
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __92__CKRecipientSelectionController__showOneTimeErrorAlertForAddedRecipient_service_withError___block_invoke;
  v60[3] = &unk_1E5621850;
  objc_copyWeak(&v61, &location);
  int v57 = CKCreateAlertControllerWithError(0, v12, v27, v56, v60);
  v58 = v57;
  if (v57) {
    [v57 presentFromViewController:self animated:1 completion:0];
  }
  self->_didShowOneTimeErrorAlert = 1;

  objc_destroyWeak(&v61);
  objc_destroyWeak(&location);

LABEL_32:
}

void __92__CKRecipientSelectionController__showOneTimeErrorAlertForAddedRecipient_service_withError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained toField];
  id v2 = [v1 textView];
  [v2 becomeFirstResponder];
}

- (void)_presentBusinessChatNotSupportedError
{
  double v3 = CKFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"CANNOT_USE_MESSAGES_FOR_BUSINESS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v5 = CKFrameworkBundle();
  id v6 = [v5 localizedStringForKey:@"BUSINESS_CHAT_IS_CURRENTLY_NOT_SUPPORTED" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v10 = +[CKAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];

  uint64_t v7 = CKFrameworkBundle();
  id v8 = [v7 localizedStringForKey:@"OK" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v9 = +[CKAlertAction actionWithTitle:v8 style:0 handler:0];

  [v10 addAction:v9];
  [v10 setPreferredAction:v9];
  [v10 presentFromViewController:self animated:1 completion:0];
}

- (void)_refreshActionSheet
{
  id v13 = +[CKUIBehavior sharedBehaviors];
  if ([v13 shouldRefreshAlternateAddressesSheet])
  {
    double v3 = +[CKUIBehavior sharedBehaviors];
    int v4 = [v3 shouldAutomaticallyCheckAvailabilityOfAlternateAddresses];

    if (!v4) {
      return;
    }
    uint64_t v5 = [(CKRecipientSelectionController *)self toField];
    id v6 = [(CKRecipientSelectionController *)self toField];
    uint64_t v7 = [v6 textView];
    uint64_t v8 = [v7 selectedRange];
    objc_msgSend(v5, "atomViewsInRange:", v8, v9);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    if ([v13 count] == 1)
    {
      id v10 = [v13 objectAtIndex:0];
      uint64_t v11 = [v10 recipient];

      if (v11)
      {
        id v12 = [v10 recipient];
        [(CKRecipientSelectionController *)self _showActionSheetForRecipient:v12 animated:0];
      }
    }
  }
}

- (void)presentAlternateAddressesAlertForRecipient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKRecipientSelectionController *)self _alternateiMessagableAddressesForRecipient:v4];
  if ([v4 isEmail]) {
    [v4 uncommentedAddress];
  }
  else {
  id v30 = [v4 commentedAddress];
  }
  id v6 = NSString;
  uint64_t v7 = CKFrameworkBundle();
  uint64_t v8 = [v7 localizedStringForKey:@"ADDRESS_NOT_REGISTERED_WITH_MADRID" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v9 = CKFrameworkBundle();
  id v10 = [v9 localizedStringForKey:@"MADRID" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v11 = objc_msgSend(v6, "stringWithFormat:", v8, v30, v10);

  id v12 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v13 = [v12 userInterfaceLayoutDirection];

  if (v13 == 1) {
    int v14 = @"\u200F";
  }
  else {
    int v14 = @"\u200E";
  }
  int v32 = [(__CFString *)v14 stringByAppendingString:v11];

  __int16 v15 = +[CKAlertController alertControllerWithTitle:v32 message:0 preferredStyle:0];
  uint64_t v16 = [(CKRecipientSelectionController *)self toField];
  uint64_t v17 = [v16 atomViewForRecipient:v4];

  long long v18 = [v5 allKeys];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __77__CKRecipientSelectionController_presentAlternateAddressesAlertForRecipient___block_invoke;
  v38[3] = &unk_1E56218A0;
  id v39 = v15;
  id v40 = v5;
  double v41 = self;
  id v19 = v4;
  id v42 = v19;
  id v31 = v5;
  id v20 = v15;
  [v18 enumerateObjectsUsingBlock:v38];

  uint64_t v21 = CKFrameworkBundle();
  long long v22 = [v21 localizedStringForKey:@"REMOVE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __77__CKRecipientSelectionController_presentAlternateAddressesAlertForRecipient___block_invoke_3;
  v36[3] = &unk_1E56218C8;
  v36[4] = self;
  id v37 = v19;
  id v23 = v19;
  char v24 = +[CKAlertAction actionWithTitle:v22 style:2 handler:v36];
  [v20 addAction:v24];

  uint64_t v25 = CKFrameworkBundle();
  int v26 = [v25 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __77__CKRecipientSelectionController_presentAlternateAddressesAlertForRecipient___block_invoke_4;
  v33[3] = &unk_1E56218C8;
  id v34 = v17;
  int v35 = self;
  id v27 = v17;
  id v28 = +[CKAlertAction actionWithTitle:v26 style:1 handler:v33];
  [v20 addAction:v28];

  char v29 = [v20 popoverPresentationController];
  [v29 setSourceView:v27];

  [v20 presentFromViewController:self animated:1 completion:0];
  [v27 setSelected:1 animated:1];
  [(CKRecipientSelectionController *)self setAlternateAddressesAlertController:v20];
}

void __77__CKRecipientSelectionController_presentAlternateAddressesAlertForRecipient___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = NSString;
  uint64_t v5 = CKFrameworkBundle();
  id v6 = [v5 localizedStringForKey:@"USE_ALTERNATE_MADRID_ADDRESS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v7 = objc_msgSend(v4, "stringWithFormat:", v6, v3);

  uint64_t v8 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v9 = [v8 userInterfaceLayoutDirection];

  if (v9 == 1) {
    id v10 = @"\u200F";
  }
  else {
    id v10 = @"\u200E";
  }
  uint64_t v11 = [(__CFString *)v10 stringByAppendingString:v7];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__CKRecipientSelectionController_presentAlternateAddressesAlertForRecipient___block_invoke_2;
  void v16[3] = &unk_1E5621878;
  id v12 = *(void **)(a1 + 32);
  id v17 = *(id *)(a1 + 40);
  id v18 = v3;
  uint64_t v13 = *(void **)(a1 + 56);
  uint64_t v19 = *(void *)(a1 + 48);
  id v20 = v13;
  id v14 = v3;
  __int16 v15 = +[CKAlertAction actionWithTitle:v11 style:0 handler:v16];
  [v12 addAction:v15];
}

void __77__CKRecipientSelectionController_presentAlternateAddressesAlertForRecipient___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) removeRecipient:*(void *)(a1 + 56)];
  [*(id *)(a1 + 48) addRecipient:v2];
}

uint64_t __77__CKRecipientSelectionController_presentAlternateAddressesAlertForRecipient___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeRecipient:*(void *)(a1 + 40)];
}

void __77__CKRecipientSelectionController_presentAlternateAddressesAlertForRecipient___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setSelected:0 animated:1];
  id v3 = [*(id *)(a1 + 40) toField];
  id v2 = [v3 textView];
  [v2 becomeFirstResponder];
}

- (void)_showActionSheetForRecipient:(id)a3 animated:(BOOL)a4
{
  id v10 = a3;
  uint64_t v5 = [MEMORY[0x1E4F6BDB8] iMessageService];
  int v6 = [(CKRecipientSelectionController *)self _availibilityForRecipient:v10 onService:v5];

  if (!v6 && !CKIsRunningInMacCatalyst())
  {
    uint64_t v7 = [(CKRecipientSelectionController *)self conversation];
    uint64_t v8 = [v7 sendingService];
    int v9 = objc_msgSend(v8, "__ck_isiMessage");

    if (v9) {
      [(CKRecipientSelectionController *)self presentAlternateAddressesAlertForRecipient:v10];
    }
  }
}

- (id)_alternateAddressesForRecipient:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v5 = [v3 contact];
  int v6 = [v5 phoneNumbers];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v25 + 1) + 8 * i) value];
        id v12 = [v11 stringValue];
        [v4 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v13 = objc_msgSend(v3, "contact", 0);
  id v14 = [v13 emailAddresses];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = [*(id *)(*((void *)&v21 + 1) + 8 * j) value];
        [v4 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  return v4;
}

- (id)_alternateiMessagableAddressesForRecipient:(id)a3
{
  id v4 = [(CKRecipientSelectionController *)self _alternateAddressesForRecipient:a3];
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  int v6 = [MEMORY[0x1E4F6BDC0] iMessageService];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__CKRecipientSelectionController__alternateiMessagableAddressesForRecipient___block_invoke;
  v12[3] = &unk_1E56218F0;
  v12[4] = self;
  id v13 = v6;
  id v7 = v5;
  id v14 = v7;
  id v8 = v6;
  [v4 enumerateObjectsUsingBlock:v12];
  uint64_t v9 = v14;
  id v10 = v7;

  return v10;
}

void __77__CKRecipientSelectionController__alternateiMessagableAddressesForRecipient___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[CKRecipientGenerator sharedRecipientGenerator];
  id v6 = [v4 recipientWithAddress:v3];

  if ([v6 isEmail]) {
    [v6 uncommentedAddress];
  }
  else {
  uint64_t v5 = [v6 commentedAddress];
  }
  if ([*(id *)(a1 + 32) _availibilityForRecipient:v6 onService:*(void *)(a1 + 40)] == 1) {
    [*(id *)(a1 + 48) setObject:v6 forKey:v5];
  }
}

- (void)_showDetailsForGroup:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F5A0E0];
  id v5 = a3;
  id v7 = objc_alloc_init(v4);
  [v7 setGroup:v5];

  [v7 setDelegate:self];
  [(CKRecipientSelectionController *)self setPreventAtomization:1];
  id v6 = [(CKRecipientSelectionController *)self navigationController];
  [v6 pushViewController:v7 animated:1];
}

- (void)_showDetailsForRecipient:(id)a3 canDelete:(BOOL)a4
{
  BOOL v4 = a4;
  v44[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 contact];
  if (!v7)
  {
    uint64_t v15 = [v6 rawAddress];
    uint64_t v9 = IMStripFormattingFromAddress();

    uint64_t v16 = [MEMORY[0x1E4F6BBD8] sharedInstance];
    uint64_t v17 = objc_msgSend(v16, "__ck_bestAccountForAddress:", v9);
    id v14 = [v17 imHandleWithID:v9 alreadyCanonical:0];

    if ([v14 isChatBot])
    {
      id v13 = [[CKChatBotInfoController alloc] initWithHandle:v14 fallbackHandle:v9];
LABEL_16:
      id v7 = 0;
      goto LABEL_17;
    }
    id v18 = [[CKEntity alloc] initWithIMHandle:v14];
    uint64_t v19 = [v6 address];
    int v32 = IMStripFormattingFromAddress();

    id v20 = [v14 cnContactWithKeys:MEMORY[0x1E4F1CBF0]];
    id location = 0;
    p_id location = &location;
    uint64_t v40 = 0x3032000000;
    double v41 = __Block_byref_object_copy__3;
    id v42 = __Block_byref_object_dispose__3;
    id v43 = 0;
    char v37 = 0;
    id v13 = [(CKEntity *)v18 personViewControllerWithDelegate:self isUnknown:&v37];
    [(CKChatBotInfoController *)v13 setAllowsActions:0];
    if (v4 && [v6 isRemovableFromSearchResults])
    {
      [(CKRecipientSelectionController *)self setRecentContactForPresentedCNCard:v6];
      if (!v37)
      {
LABEL_13:
        if (p_location[5])
        {
          long long v25 = [(CKEntity *)v18 propertyType];
          [(CKChatBotInfoController *)v13 highlightPropertyWithKey:v25 identifier:p_location[5]];
        }
        _Block_object_dispose(&location, 8);

        goto LABEL_16;
      }
      long long v21 = [(CKChatBotInfoController *)v13 contentViewController];
      long long v22 = CKFrameworkBundle();
      uint64_t v31 = [v22 localizedStringForKey:@"REMOVE_RECENT" value:&stru_1EDE4CA38 table:@"ChatKit"];
      long long v23 = [v21 cardBottomGroup];
      [v21 addActionWithTitle:v31 target:self selector:sel__removeRecent inGroup:v23 destructive:1];
    }
    else
    {
      long long v24 = [(CKEntity *)v18 propertyType];
      long long v21 = [v20 valueForKey:v24];

      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __69__CKRecipientSelectionController__showDetailsForRecipient_canDelete___block_invoke;
      v33[3] = &unk_1E5621918;
      id v34 = v18;
      id v35 = v32;
      CGFloat v36 = &location;
      [v21 enumerateObjectsUsingBlock:v33];

      long long v22 = v34;
    }

    goto LABEL_13;
  }
  id v8 = [MEMORY[0x1E4F1BBA8] descriptorForRequiredKeys];
  v44[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];

  if (([v7 areKeysAvailable:v9] & 1) == 0)
  {
    id v10 = [(CKRecipientSelectionController *)self contactStore];
    uint64_t v11 = [v7 identifier];
    uint64_t v12 = [v10 unifiedContactWithIdentifier:v11 keysToFetch:v9 error:0];

    id v7 = (void *)v12;
  }
  id v13 = [MEMORY[0x1E4F1BBA8] viewControllerForUnknownContact:v7];
  id v14 = [MEMORY[0x1E4F1B980] storeWithOptions:3];
  [(CKChatBotInfoController *)v13 setContactStore:v14];
LABEL_17:

  [(CKRecipientSelectionController *)self setPreventAtomization:1];
  if (CKIsRunningInMacCatalyst())
  {
    id location = 0;
    id v26 = objc_initWeak(&location, self);
    long long v27 = [(CKRecipientSelectionController *)self searchListController];
    long long v28 = [v27 tableView];

    [(CKRecipientSelectionController *)self _showContactCardForRecipient:v6 sourceView:v28];
    objc_destroyWeak(&location);
  }
  else
  {
    char v29 = [(CKRecipientSelectionController *)self navigationController];
    if (v29)
    {
      id v30 = [(CKRecipientSelectionController *)self navigationController];
      [v30 pushViewController:v13 animated:1];
    }
  }
}

void __69__CKRecipientSelectionController__showDetailsForRecipient_canDelete___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  id v6 = [*(id *)(a1 + 32) propertyType];
  int v7 = [v6 isEqual:*MEMORY[0x1E4F1AEE0]];
  id v8 = [v15 value];
  uint64_t v9 = v8;
  if (v7)
  {
    uint64_t v10 = [v8 stringValue];

    uint64_t v9 = (void *)v10;
  }

  uint64_t v11 = IMStripFormattingFromAddress();

  if ([v11 isEqualToString:*(void *)(a1 + 40)])
  {
    uint64_t v12 = [v15 identifier];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *a4 = 1;
  }
}

- (void)_showContactCardForRecipient:(id)a3 sourceView:(id)a4
{
  BOOL v4 = [a3 rawAddress];
  IMStripFormattingFromAddress();
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [MEMORY[0x1E4F6BBD8] sharedInstance];
  id v6 = objc_msgSend(v5, "__ck_bestAccountForAddress:", v13);
  int v7 = [v6 imHandleWithID:v13 alreadyCanonical:0];

  id v8 = [v7 cnContactWithKeys:MEMORY[0x1E4F1CBF0]];
  if (CKIsRunningInMacCatalyst()
    && [MEMORY[0x1E4F6E6D8] isCNContactAKnownContact:v8])
  {
    uint64_t v9 = [MEMORY[0x1E4F28E78] stringWithString:@"addressbook://"];
    uint64_t v10 = [v8 identifier];
    [v9 appendString:v10];

    uint64_t v11 = (void *)*MEMORY[0x1E4F43630];
    uint64_t v12 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
    [v11 openURL:v12 withCompletionHandler:0];
  }
}

- (void)_removeRecent
{
  id v3 = [(CKRecipientSelectionController *)self recentContactForPresentedCNCard];

  if (v3)
  {
    BOOL v4 = [(CKRecipientSelectionController *)self searchListController];
    id v5 = [(CKRecipientSelectionController *)self recentContactForPresentedCNCard];
    [v4 removeRecipient:v5];
  }
  id v7 = [(CKRecipientSelectionController *)self navigationController];
  id v6 = (id)[v7 popViewControllerAnimated:1];
}

- (void)_updateRecipientViewLayouts
{
  id v3 = [(CKRecipientSelectionController *)self toFieldScrollingView];
  [v3 contentSize];
  double v5 = v4;

  id v6 = [(CKRecipientSelectionController *)self toFieldContainerView];
  [v6 frame];
  uint64_t v8 = v7;
  double v10 = v9;
  uint64_t v12 = v11;

  id v13 = [(CKRecipientSelectionController *)self toFieldScrollingView];
  [v13 frame];
  double v15 = v14;

  uint64_t v16 = [(CKRecipientSelectionController *)self toField];
  uint64_t v17 = [v16 textView];
  if ([v17 isFirstResponder]) {
    int v18 = 1;
  }
  else {
    int v18 = ![(CKRecipientSelectionController *)self isSearchResultsHidden];
  }

  if (CKIsRunningInMacCatalyst())
  {
    [(CKRecipientSelectionController *)self preferredMacToolbarHeight];
    double v20 = v19;
  }
  else
  {
    long long v21 = +[CKUIBehavior sharedBehaviors];
    [v21 toFieldPreferredHeight];
    double v23 = v22;

    double v20 = v5;
    if (v18)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained visibleInputAndEntryViewHeightToAvoidForRecipientSelectionController:self];
      double v26 = v25;

      long long v27 = [(CKRecipientSelectionController *)self view];
      [v27 bounds];
      double v29 = v28;
      [(CKRecipientSelectionController *)self composeRecipientViewOriginY];
      double v31 = v29 - v30 - v26;

      if (v5 >= v31) {
        double v32 = v31;
      }
      else {
        double v32 = v5;
      }
      if (v32 >= v23) {
        double v20 = v32;
      }
      else {
        double v20 = v23;
      }
    }
  }
  int v33 = CKIsRunningInMacCatalyst();
  double v34 = 0.0;
  if (!v33) {
    double v34 = v10;
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __61__CKRecipientSelectionController__updateRecipientViewLayouts__block_invoke;
  v35[3] = &unk_1E5621940;
  BOOL v36 = v5 != v15;
  v35[4] = self;
  v35[5] = v8;
  *(double *)&v35[6] = v34;
  v35[7] = v12;
  *(double *)&v35[8] = v20;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v35 animations:0.200000003];
}

uint64_t __61__CKRecipientSelectionController__updateRecipientViewLayouts__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    id v2 = [*(id *)(a1 + 32) toFieldContainerView];
    objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

    id v3 = [*(id *)(a1 + 32) toFieldScrollingView];
    double v4 = [*(id *)(a1 + 32) toFieldContainerView];
    [v4 bounds];
    objc_msgSend(v3, "setFrame:");

    double v5 = [*(id *)(a1 + 32) toFieldScrollingView];
    objc_msgSend(v5, "__ck_scrollToBottom:", 1);
  }
  id v6 = [*(id *)(a1 + 32) searchListController];
  uint64_t v7 = [v6 tableView];
  int v8 = objc_msgSend(v7, "__ck_isScrolledToTop");

  uint64_t result = [*(id *)(a1 + 32) _resetSearchResultsInsets];
  if (v8)
  {
    double v10 = *(void **)(a1 + 32);
    return [v10 scrollSearchListControllerToTop:1];
  }
  return result;
}

- (void)_adjustToFieldPositionIfNecessary
{
  id v3 = [(CKRecipientSelectionController *)self toFieldContainerView];
  [v3 frame];
  CGFloat v5 = v4;
  double v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  uint64_t v12 = +[CKUIBehavior sharedBehaviors];
  int v13 = [v12 recipientSelectionShouldSlideToField];

  if (!v13) {
    goto LABEL_14;
  }
  double v14 = [(CKRecipientSelectionController *)self toField];
  double v15 = [v14 text];
  if (![v15 length]) {
    goto LABEL_8;
  }
  uint64_t v16 = [(CKRecipientSelectionController *)self toField];
  if ((unint64_t)[v16 numberOfRowsOfTextInField] <= 1)
  {

LABEL_8:
LABEL_9:
    double v29 = [(CKRecipientSelectionController *)self toField];
    double v30 = [v29 text];
    if ([v30 length])
    {
      double v31 = [(CKRecipientSelectionController *)self toField];
      uint64_t v32 = [v31 numberOfRowsOfTextInField];

      if (v32 != 1) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    [(CKRecipientSelectionController *)self _navigationBarInsets];
    double v7 = v33;
    goto LABEL_14;
  }
  uint64_t v17 = [(CKRecipientSelectionController *)self conversation];
  int v18 = [v17 canInsertMoreRecipients];

  if (!v18) {
    goto LABEL_9;
  }
  double v19 = [(CKRecipientSelectionController *)self toField];
  [v19 offsetForRowWithTextField];
  double v21 = v20;

  double v22 = [(CKRecipientSelectionController *)self toField];
  [v22 bounds];
  double v24 = v23;
  double v25 = [(CKRecipientSelectionController *)self toFieldContainerView];
  [v25 bounds];
  double v27 = v26;

  if (v21 != 0.0)
  {
    [(CKRecipientSelectionController *)self _navigationBarInsets];
    double v7 = v28 - (v21 - (v24 - v27) + 2.0);
  }
LABEL_14:
  double v34 = [(CKRecipientSelectionController *)self toFieldContainerView];
  [v34 frame];
  v39.origin.x = v5;
  v39.origin.y = v7;
  v39.size.double width = v9;
  v39.size.double height = v11;
  BOOL v35 = CGRectEqualToRect(v38, v39);

  if (!v35)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__CKRecipientSelectionController__adjustToFieldPositionIfNecessary__block_invoke;
    aBlock[3] = &unk_1E5621968;
    aBlock[4] = self;
    *(CGFloat *)&void aBlock[5] = v5;
    *(double *)&aBlock[6] = v7;
    *(CGFloat *)&aBlock[7] = v9;
    *(CGFloat *)&aBlock[8] = v11;
    BOOL v36 = _Block_copy(aBlock);
    [MEMORY[0x1E4F42FF0] animateWithDuration:v36 animations:0.200000003];
  }
}

void __67__CKRecipientSelectionController__adjustToFieldPositionIfNecessary__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) toFieldContainerView];
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  [*(id *)(a1 + 32) _resetSearchResultsInsets];
  [*(id *)(a1 + 32) scrollSearchListControllerToTop:1];
  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 recipientSelectionControllerDidChangeSize:*(void *)(a1 + 32)];
}

- (void)_adjustToFieldSeparatorInsetsIfNecessary
{
  if (IMSharedHelperDeviceHasMultipleActiveSubscriptions())
  {
    id v3 = [(CKRecipientSelectionController *)self toField];
    [v3 separatorDirectionalEdgeInsets];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;

    double v10 = [(CKRecipientSelectionController *)self toField];
    [v10 _textButtonMargin];
    double v12 = v11;
    int v13 = [(CKRecipientSelectionController *)self toField];
    [v13 safeAreaInsets];
    double v15 = v12 + v14;

    if (v15 != 0.0)
    {
      id v16 = [(CKRecipientSelectionController *)self toField];
      objc_msgSend(v16, "setSeparatorDirectionalEdgeInsets:", v5, v15, v7, v9);
    }
  }
}

- (BOOL)_isToFieldPushedUp
{
  id v2 = self;
  id v3 = [(CKRecipientSelectionController *)self toFieldContainerView];
  [v3 origin];
  double v5 = v4;
  [(CKRecipientSelectionController *)v2 _navigationBarInsets];
  LOBYTE(v2) = v5 < v6;

  return (char)v2;
}

- (void)_resetSearchResultsInsets
{
  if (CKIsRunningInMacCatalyst())
  {
    id v3 = +[CKUIBehavior sharedBehaviors];
    [v3 popoverPadding];
    double v5 = v4;

    double v6 = [(CKRecipientSelectionController *)self searchListController];
    double v7 = [v6 tableView];
    double v8 = 0.0;
    objc_msgSend(v7, "_setSectionContentInset:", 0.0, v5, 0.0, v5);

    double v9 = v5;
    double v10 = 0.0;
    if ([(CKRecipientSelectionController *)self isBeingPresentedInMacDetailsView]) {
      return;
    }
  }
  else
  {
    double v11 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    [(CKRecipientSelectionController *)self _navigationBarInsets];
    double v15 = v14;
    id v16 = [(CKRecipientSelectionController *)self toFieldContainerView];
    [v16 origin];
    double v18 = v15 - v17;

    double v19 = [(CKRecipientSelectionController *)self toFieldContainerView];
    [v19 bounds];
    double v21 = v20 - v18;

    [(CKRecipientSelectionController *)self _additionalSearchResultsEdgeInsets];
    double v5 = v21 + v22;
    double v8 = v11 + v23;
    double v9 = v12 + v24;
    double v10 = v13 + v25;
  }
  id v26 = [(CKRecipientSelectionController *)self searchListController];
  objc_msgSend(v26, "setAdditionalSafeAreaInsets:", v5, v8, v9, v10);
}

- (void)_updateShowingSearch
{
  id v3 = [(CKRecipientSelectionController *)self conversation];
  int v4 = [v3 canInsertMoreRecipients];

  if (v4)
  {
    double v5 = [(CKRecipientSelectionController *)self searchListController];
    if ([v5 hasSearchResults]) {
      BOOL v6 = [(CKRecipientSelectionController *)self shouldSuppressSearchResultsTable];
    }
    else {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 1;
  }
  uint64_t v7 = v6 & ~[(CKRecipientSelectionController *)self alwaysShowSearchResultsTable];

  [(CKRecipientSelectionController *)self setSearchResultsHidden:v7];
}

- (void)_showSearchField
{
  if (![(CKRecipientSelectionController *)self isSearchResultsHidden]) {
    goto LABEL_11;
  }
  id v3 = [(CKRecipientSelectionController *)self searchListController];
  int v4 = [v3 tableView];
  [v4 setHidden:0];

  double v5 = [(CKRecipientSelectionController *)self firstResponder];
  [v5 reloadInputViewsWithoutReset];

  BOOL v6 = +[CKUIBehavior sharedBehaviors];
  if ([v6 presentsAutocompleteInAPopover])
  {
    BOOL v7 = [(CKRecipientSelectionController *)self isBeingPresentedInMacDetailsView];

    if (!v7)
    {
      if ([(CKRecipientSelectionController *)self _configureSearchListControllerAsAPopover])
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __50__CKRecipientSelectionController__showSearchField__block_invoke;
        v21[3] = &unk_1E5620C40;
        v21[4] = self;
        [MEMORY[0x1E4F42FF8] _performWithoutDeferringTransitions:v21];
      }
      goto LABEL_8;
    }
  }
  else
  {
  }
  double v8 = [(CKRecipientSelectionController *)self view];
  double v9 = [(CKRecipientSelectionController *)self searchListController];
  double v10 = [v9 tableView];
  [v8 bringSubviewToFront:v10];

LABEL_8:
  double v11 = [(CKRecipientSelectionController *)self headerDecorationView];

  if (v11)
  {
    double v12 = [(CKRecipientSelectionController *)self view];
    double v13 = [(CKRecipientSelectionController *)self headerDecorationView];
    [v12 bringSubviewToFront:v13];
  }
  double v14 = [(CKRecipientSelectionController *)self view];
  double v15 = [(CKRecipientSelectionController *)self toFieldContainerView];
  [v14 bringSubviewToFront:v15];

  [(CKRecipientSelectionController *)self bringComposeRecipientViewToFront];
  id v16 = [(CKRecipientSelectionController *)self searchListController];
  double v17 = [v16 tableView];
  [v17 setScrollsToTop:1];

  double v18 = [(CKRecipientSelectionController *)self delegate];
  [v18 recipientSelectionControllerSearchListDidShowOrHide:self];

LABEL_11:
  double v19 = +[CKUIBehavior sharedBehaviors];
  if ([v19 presentsAutocompleteInAPopover]
    && ![(CKRecipientSelectionController *)self isSearchResultsHidden])
  {
    BOOL v20 = [(CKRecipientSelectionController *)self isBeingPresentedInMacDetailsView];

    if (!v20) {
      [(CKRecipientSelectionController *)self _updateSearchListControllerPopOverSizing];
    }
  }
  else
  {
  }
}

void __50__CKRecipientSelectionController__showSearchField__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) searchListController];
  id v3 = [v2 popoverPresentationController];
  int v4 = [v3 sourceView];

  if (v4)
  {
    double v5 = *(void **)(a1 + 32);
    BOOL v6 = [v5 searchListController];
    [v5 presentViewController:v6 animated:1 completion:&__block_literal_global_451_0];
  }
  else if (IMOSLoggingEnabled())
  {
    BOOL v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v8 = 0;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "ContactSearchAutocomplete : Source view for search results popover is nil, will not present", v8, 2u);
    }
  }
}

- (void)_hideSearchField
{
  if (![(CKRecipientSelectionController *)self isSearchResultsHidden])
  {
    id v3 = [(CKRecipientSelectionController *)self searchListController];

    if (v3)
    {
      int v4 = [(CKRecipientSelectionController *)self searchListController];
      double v5 = [v4 tableView];
      BOOL v6 = 1;
      [v5 setHidden:1];

      BOOL v7 = [(CKRecipientSelectionController *)self firstResponder];
      [v7 reloadInputViewsWithoutReset];

      double v8 = [(CKRecipientSelectionController *)self searchListController];
      double v9 = [v8 tableView];
      [v9 setScrollsToTop:0];

      double v10 = [(CKRecipientSelectionController *)self delegate];
      [v10 recipientSelectionControllerSearchListDidShowOrHide:self];

      double v11 = [(CKRecipientSelectionController *)self searchListController];
      if (v11)
      {
        double v12 = [(CKRecipientSelectionController *)self presentedViewController];
        double v13 = [(CKRecipientSelectionController *)self searchListController];
        BOOL v6 = v12 != v13;
      }
      id v15 = +[CKUIBehavior sharedBehaviors];
      if (![v15 presentsAutocompleteInAPopover] || v6)
      {
      }
      else
      {
        BOOL v14 = [(CKRecipientSelectionController *)self isBeingPresentedInMacDetailsView];

        if (!v14)
        {
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __50__CKRecipientSelectionController__hideSearchField__block_invoke;
          void v16[3] = &unk_1E5620C40;
          void v16[4] = self;
          [MEMORY[0x1E4F42FF8] _performWithoutDeferringTransitions:v16];
        }
      }
    }
  }
}

void __50__CKRecipientSelectionController__hideSearchField__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) searchListController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)_configureSearchListControllerAsAPopover
{
  return 0;
}

- (UIEdgeInsets)_navigationBarInsets
{
  id v3 = [(CKRecipientSelectionController *)self delegate];

  if (v3)
  {
    int v4 = [(CKRecipientSelectionController *)self delegate];
    [v4 navigationBarInsetsForRecipientSelectionController:self];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F437F8];
    double v8 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)_updateSearchResultsTable
{
  id v3 = [(CKRecipientSelectionController *)self toField];
  int v4 = [v3 text];
  uint64_t v5 = [v4 length];

  if (!v5) {
    [(CKRecipientSelectionController *)self resetSearchResults];
  }
  double v6 = [(CKRecipientSelectionController *)self toField];
  double v7 = [v6 text];
  if (![v7 length]) {
    goto LABEL_12;
  }
  double v8 = [(CKRecipientSelectionController *)self conversation];
  if (([v8 canInsertMoreRecipients] & 1) == 0)
  {

LABEL_12:
    goto LABEL_13;
  }
  double v9 = +[CKUIBehavior sharedBehaviors];
  int v10 = [v9 canAccessContacts];

  if (v10)
  {
    double v11 = [(CKRecipientSelectionController *)self searchListController];
    double v12 = [(CKRecipientSelectionController *)self toField];
    double v13 = [v12 text];
    [v11 searchWithText:v13];

    [(CKRecipientSelectionController *)self scrollSearchListControllerToTop:0];
    id v17 = [(CKRecipientSelectionController *)self toField];
    double v14 = [v17 text];
    if ((unint64_t)[v14 length] <= 1)
    {
    }
    else
    {
      double v15 = [(CKRecipientSelectionController *)self searchListController];
      int v16 = [v15 hasSearchResults];

      if (v16)
      {
        [(CKRecipientSelectionController *)self setSearchResultsHidden:0];
      }
    }
    return;
  }
LABEL_13:
  if (([(CKRecipientSelectionController *)self alwaysShowSearchResultsTable] & 1) == 0) {
    [(CKRecipientSelectionController *)self setSearchResultsHidden:1];
  }

  [(CKRecipientSelectionController *)self invalidateOutstandingIDStatusRequests];
}

- (void)resetSearchResults
{
  id v2 = [(CKRecipientSelectionController *)self searchListController];
  [v2 setSearchResults:0];
}

- (void)_updateAddressBookProperties
{
  CKPreferredAddressTypes();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if ([v6 count] == 2
    && [v6 containsObject:*MEMORY[0x1E4F1AEE0]]
    && ([v6 containsObject:*MEMORY[0x1E4F1ADC8]] & 1) != 0)
  {
    uint64_t v3 = 7;
  }
  else if ([v6 count] == 1)
  {
    if ([v6 containsObject:*MEMORY[0x1E4F1AEE0]]) {
      uint64_t v3 = 6;
    }
    else {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  if (self->_toField)
  {
    int v4 = [(CKRecipientSelectionController *)self toField];
    uint64_t v5 = [v4 textView];
    [v5 setKeyboardType:v3];
  }
}

- (CNContactPickerViewController)contactPickerViewController
{
  contactPickerViewController = self->_contactPickerViewController;
  if (!contactPickerViewController)
  {
    int v4 = objc_alloc_init(CKCNContactPickerViewController);
    int64_t v5 = [(CKRecipientSelectionController *)self _userInterfaceStyleOverride];
    if (v5) {
      [(CKCNContactPickerViewController *)v4 setOverrideUserInterfaceStyle:v5];
    }
    id v6 = CKPreferredContactsProperties([(CNContactPickerViewController *)v4 setDelegate:self]);
    [(CNContactPickerViewController *)v4 setDisplayedPropertyKeys:v6];

    double v7 = [(CKCNContactPickerViewController *)v4 navigationItem];
    double v8 = CKFrameworkBundle();
    double v9 = [v8 localizedStringForKey:@"NEW_MESSAGE_PROMPT" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v7 setPrompt:v9];

    int v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(emailAddresses.@count > 0) OR (phoneNumbers.@count > 0)"];
    [(CNContactPickerViewController *)v4 setPredicateForEnablingContact:v10];

    double v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(emailAddresses.@count + phoneNumbers.@count) == 1"];
    [(CNContactPickerViewController *)v4 setPredicateForSelectionOfContact:v11];

    double v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(property == 'emailAddresses') OR (property == 'phoneNumbers')"];
    [(CNContactPickerViewController *)v4 setPredicateForSelectionOfProperty:v12];

    double v13 = self->_contactPickerViewController;
    self->_contactPickerViewController = &v4->super;

    contactPickerViewController = self->_contactPickerViewController;
  }

  return contactPickerViewController;
}

- (void)scrollSearchListControllerToTop:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(CKRecipientSelectionController *)self searchListController];
  int64_t v5 = [v6 tableView];
  [(CKRecipientSelectionController *)self scrollSearchListControllerToTopContentOffset];
  objc_msgSend(v5, "setContentOffset:animated:", v3);
}

- (CGPoint)scrollSearchListControllerToTopContentOffset
{
  BOOL v3 = [(CKRecipientSelectionController *)self searchListController];
  int v4 = [v3 tableView];
  [v4 contentOffset];
  double v6 = v5;

  double v7 = [(CKRecipientSelectionController *)self searchListController];
  double v8 = [v7 tableView];
  [v8 adjustedContentInset];
  double v10 = -v9;

  double v11 = v6;
  double v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (id)handlesForScreenTimePolicyCheck
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled])
  {
    BOOL v3 = objc_opt_new();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    int v4 = [(CKRecipientSelectionController *)self toField];
    double v5 = [v4 recipients];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) normalizedAddress];
          if (v10) {
            [v3 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    double v11 = (void *)[v3 copy];
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (void)updateScreenTimePolicy
{
  if ([MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled])
  {
    BOOL v3 = [(CKRecipientSelectionController *)self currentConversationContext];
    [v3 removeObserver:self forKeyPath:@"allowedByScreenTime"];

    [(CKRecipientSelectionController *)self setCurrentConversationContext:0];
    int v4 = [(CKRecipientSelectionController *)self handlesForScreenTimePolicyCheck];
    double v5 = [MEMORY[0x1E4F6BCB0] sharedInstance];
    id v9 = 0;
    uint64_t v6 = [v5 allowedToShowConversationWithHandleIDs:v4 sync:1 context:&v9];
    id v7 = v9;
    [(CKRecipientSelectionController *)self setAllowedByScreenTime:v6];

    [(CKRecipientSelectionController *)self setCurrentConversationContext:v7];
    uint64_t v8 = [(CKRecipientSelectionController *)self currentConversationContext];
    [v8 addObserver:self forKeyPath:@"allowedByScreenTime" options:1 context:ctxAllowedByScreenTime];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  double v11 = v10;
  if ((void *)ctxAllowedByScreenTime == a6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__CKRecipientSelectionController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5620AF8;
    id v14 = v10;
    long long v15 = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CKRecipientSelectionController;
    [(CKRecipientSelectionController *)&v12 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
}

void __81__CKRecipientSelectionController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "setAllowedByScreenTime:", objc_msgSend(v2, "allowedByScreenTime"));
  [*(id *)(a1 + 40) _updateToField];
}

- (BOOL)autocompleteResultsController:(id)a3 willOverrideImageDataForRecipient:(id)a4 completion:(id)a5
{
  id v6 = a4;
  id v7 = (void (**)(id, void *))a5;
  if ([v6 isGroup])
  {
    uint64_t v8 = [v6 autocompleteResult];
    id v9 = [v8 identifier];

    id v10 = +[CKConversationList sharedConversationList];
    double v11 = [v10 conversationForExistingChatWithGUID:v9];

    int v12 = [v11 isGroupConversation];
    if (v12)
    {
      long long v13 = [v11 conversationVisualIdentityWithKeys:MEMORY[0x1E4F1CBF0] requestedNumberOfContactsToFetch:0];
      id v14 = [v13 groupPhoto];
      v7[2](v7, v14);
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (CKRecipientSelectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKRecipientSelectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKPendingConversation)conversation
{
  return self->_conversation;
}

- (CKComposeRecipientView)toField
{
  return self->_toField;
}

- (void)setToField:(id)a3
{
}

- (UIView)toFieldContainerView
{
  return self->_toFieldContainerView;
}

- (void)setContactStore:(id)a3
{
}

- (CKRecipientSearchListController)searchListController
{
  return self->_searchListController;
}

- (void)setSearchListController:(id)a3
{
}

- (BOOL)isPeoplePickerHidden
{
  return self->_peoplePickerHidden;
}

- (void)setPeoplePickerHidden:(BOOL)a3
{
  self->_peoplePickerHidden = a3;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (STConversationContext)currentConversationContext
{
  return self->_currentConversationContext;
}

- (void)setCurrentConversationContext:(id)a3
{
}

- (BOOL)allowedByScreenTime
{
  return self->_allowedByScreenTime;
}

- (void)setAllowedByScreenTime:(BOOL)a3
{
  self->_allowedByScreenTime = a3;
}

- (BOOL)forceMMS
{
  return self->_forceMMS;
}

- (void)setForceMMS:(BOOL)a3
{
  self->_forceMMS = a3;
}

- (id)gameCenterPickerBlock
{
  return self->_gameCenterPickerBlock;
}

- (UIScrollView)toFieldScrollingView
{
  return self->_toFieldScrollingView;
}

- (void)setToFieldScrollingView:(id)a3
{
}

- (UILabel)toFieldPlaceholderLabel
{
  return self->_toFieldPlaceholderLabel;
}

- (void)setToFieldPlaceholderLabel:(id)a3
{
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
}

- (void)setContactPickerViewController:(id)a3
{
}

- (CNComposeRecipient)recentContactForPresentedCNCard
{
  return self->_recentContactForPresentedCNCard;
}

- (void)setRecentContactForPresentedCNCard:(id)a3
{
}

- (BOOL)isDisambiguating
{
  return self->_isDisambiguating;
}

- (void)setIsDisambiguating:(BOOL)a3
{
  self->_isDisambiguating = a3;
}

- (CKManualUpdater)addressBookNotificationUpdater
{
  return self->_addressBookNotificationUpdater;
}

- (void)setAddressBookNotificationUpdater:(id)a3
{
}

- (BOOL)preventAtomization
{
  return self->_preventAtomization;
}

- (void)setPreventAtomization:(BOOL)a3
{
  self->_preventAtomization = a3;
}

- (BOOL)didShowOneTimeErrorAlert
{
  return self->_didShowOneTimeErrorAlert;
}

- (void)setDidShowOneTimeErrorAlert:(BOOL)a3
{
  self->_didShowOneTimeErrorAlert = a3;
}

- (UIView)headerDecorationView
{
  return self->_headerDecorationView;
}

- (void)setHeaderDecorationView:(id)a3
{
}

- (BOOL)homogenizePreferredServiceForiMessage
{
  return self->_homogenizePreferredServiceForiMessage;
}

- (BOOL)shouldSuppressSearchResultsTable
{
  return self->_shouldSuppressSearchResultsTable;
}

- (NSMutableDictionary)recipientAvailibityTimers
{
  return self->_recipientAvailibityTimers;
}

- (void)setRecipientAvailibityTimers:(id)a3
{
}

- (NSMutableDictionary)recipientAvailabilities
{
  return self->_recipientAvailabilities;
}

- (void)setRecipientAvailabilities:(id)a3
{
}

- (CKRecipientAvailabilities)expandedRecipientAvailabilities
{
  return self->_expandedRecipientAvailabilities;
}

- (void)setExpandedRecipientAvailabilities:(id)a3
{
}

- (unint64_t)numberOfRowsInToField
{
  return self->_numberOfRowsInToField;
}

- (void)setNumberOfRowsInToField:(unint64_t)a3
{
  self->_numberOfRowsInToField = a3;
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (CKDetailsContactsManager)contactsManager
{
  return self->_contactsManager;
}

- (void)setContactsManager:(id)a3
{
}

- (CKAlertController)alternateAddressesAlertController
{
  return self->_alternateAddressesAlertController;
}

- (void)setAlternateAddressesAlertController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateAddressesAlertController, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_expandedRecipientAvailabilities, 0);
  objc_storeStrong((id *)&self->_recipientAvailabilities, 0);
  objc_storeStrong((id *)&self->_recipientAvailibityTimers, 0);
  objc_storeStrong((id *)&self->_headerDecorationView, 0);
  objc_storeStrong((id *)&self->_addressBookNotificationUpdater, 0);
  objc_storeStrong((id *)&self->_recentContactForPresentedCNCard, 0);
  objc_storeStrong((id *)&self->_contactPickerViewController, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_toFieldPlaceholderLabel, 0);
  objc_storeStrong((id *)&self->_toFieldScrollingView, 0);
  objc_storeStrong(&self->_gameCenterPickerBlock, 0);
  objc_storeStrong((id *)&self->_currentConversationContext, 0);
  objc_storeStrong((id *)&self->_searchListController, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_toFieldContainerView, 0);
  objc_storeStrong((id *)&self->_toField, 0);
  objc_storeStrong((id *)&self->_conversation, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __70__CKRecipientSelectionController__openStewieAppForEmergencyIfRequired__block_invoke_301_cold_1(void *a1)
{
  id v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_0(&dword_18EF18000, v2, v3, "Request Stewie error: %@", v4, v5, v6, v7, 2u);
}

void __69__CKRecipientSelectionController__openStewieAppForRoadsideIfRequired__block_invoke_304_cold_1(void *a1)
{
  id v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_0(&dword_18EF18000, v2, v3, "Request Stewie error: %@", v4, v5, v6, v7, 2u);
}

@end