@interface EKEventAttendeePicker
+ (BOOL)_participantHasResponded:(id)a3;
+ (id)_addressForRecipient:(id)a3;
- (BOOL)_zeroKeyworkSearchEnabled;
- (BOOL)chooseSelectedSearchResultForComposeRecipientView:(id)a3 context:(unint64_t)a4;
- (BOOL)collapseSelectedSearchResultForComposeRecipientView:(id)a3;
- (BOOL)composeRecipientViewShowingSearchResults:(id)a3;
- (BOOL)expandSelectedSearchResultForComposeRecipientView:(id)a3;
- (BOOL)getSupplementalGroupsForSearchQuery:(id)a3 completionHandler:(id)a4;
- (BOOL)hasChanges;
- (BOOL)recipientViewShouldIgnoreFirstResponderChanges:(id)a3;
- (BOOL)shouldSuggestFamilySharees;
- (BOOL)showAvailability;
- (Class)_CNContactPickerViewController;
- (Class)_CNContactViewController;
- (EKEventAttendeePicker)initWithFrame:(CGRect)a3 event:(id)a4 calendar:(id)a5 overriddenEventStartDate:(id)a6 overriddenEventEndDate:(id)a7;
- (EKEventAttendeePickerDelegate)addressValidationDelegate;
- (NSArray)addresses;
- (NSArray)filterOutFamilySharees;
- (NSArray)recipients;
- (NSString)remainingText;
- (NSString)searchAccountID;
- (double)_maxScrollerHeight;
- (id)_lookUpRecipientForAddress:(id)a3;
- (id)_searchManager;
- (id)_searchResultsView;
- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4;
- (id)peoplePickerPrompt;
- (unint64_t)presentationOptionsForRecipient:(id)a3;
- (void)_adjustLayoutOfSubviews;
- (void)_copyRecipientsFromComposeView;
- (void)_hideSearchResultsViewAndCancelOutstandingSearches:(BOOL)a3;
- (void)_invalidateAtomPresentationOptionsForAllRecipients;
- (void)_refreshSearchResults;
- (void)_requestAvailabilityForRecipients:(id)a3;
- (void)_setAtomPresentationOption:(unint64_t)a3 forRecipient:(id)a4;
- (void)_setRecipientsOnComposeView;
- (void)_showSearchResultsView;
- (void)_updateFetchContextChosenAddresses;
- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4;
- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5;
- (void)commitRemainingText;
- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4;
- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4;
- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 textDidChange:(id)a4;
- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3;
- (void)composeRecipientViewRequestAddRecipient:(id)a3;
- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4;
- (void)consumeCorecipientSearchResults:(id)a3 taskID:(id)a4;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)contactViewControllerDidExecuteClearRecentsDataAction:(id)a3;
- (void)dealloc;
- (void)finishedSearchingForAutocompleteResults;
- (void)finishedSearchingForCorecipients;
- (void)finishedTaskWithID:(id)a3;
- (void)loadView;
- (void)scrollComposeViewToEnd;
- (void)searchForCorecipients;
- (void)searchWithText:(id)a3;
- (void)selectNextSearchResultForComposeRecipientView:(id)a3;
- (void)selectPreviousSearchResultForComposeRecipientView:(id)a3;
- (void)setAddressValidationDelegate:(id)a3;
- (void)setFilterOutFamilySharees:(id)a3;
- (void)setHasChanges:(BOOL)a3;
- (void)setRecipients:(id)a3;
- (void)setSearchAccountID:(id)a3;
- (void)setShouldSuggestFamilySharees:(BOOL)a3;
- (void)updateMaxAttendeeInfoText;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation EKEventAttendeePicker

- (EKEventAttendeePicker)initWithFrame:(CGRect)a3 event:(id)a4 calendar:(id)a5 overriddenEventStartDate:(id)a6 overriddenEventEndDate:(id)a7
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v49.receiver = self;
  v49.super_class = (Class)EKEventAttendeePicker;
  v20 = [(EKEventAttendeePicker *)&v49 init];
  v21 = v20;
  if (v20)
  {
    id v48 = v19;
    v20->_initialFrame.origin.CGFloat x = x;
    v20->_initialFrame.origin.CGFloat y = y;
    v20->_initialFrame.size.CGFloat width = width;
    v20->_initialFrame.size.CGFloat height = height;
    p_event = (id *)&v20->_event;
    objc_storeStrong((id *)&v20->_event, a4);
    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    recipientAddressesToRecipients = v21->_recipientAddressesToRecipients;
    v21->_recipientAddressesToRecipients = v23;

    objc_storeStrong((id *)&v21->_overriddenEventStartDate, a6);
    objc_storeStrong((id *)&v21->_overriddenEventEndDate, a7);
    v21->_hasChanges = 0;
    v25 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    availabilityQueue = v21->_availabilityQueue;
    v21->_availabilityQueue = v25;

    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    v47 = [v16 title];
    v29 = (void *)[[NSString alloc] initWithFormat:@"%@-%@", v28, v47];
    [(NSOperationQueue *)v21->_availabilityQueue setName:v29];
    EKWeakLinkClass();
    uint64_t v30 = objc_opt_new();
    fetchContext = v21->_fetchContext;
    v21->_fetchContext = (CNAutocompleteFetchContext *)v30;

    v32 = [v16 title];
    [(CNAutocompleteFetchContext *)v21->_fetchContext setTitle:v32];

    if (v18)
    {
      [(CNAutocompleteFetchContext *)v21->_fetchContext setDate:v18];
    }
    else
    {
      v33 = [v16 startDate];
      [(CNAutocompleteFetchContext *)v21->_fetchContext setDate:v33];
    }
    v34 = [v16 location];
    [(CNAutocompleteFetchContext *)v21->_fetchContext setLocationUUID:v34];

    id v35 = v17;
    if (v16)
    {
      id v36 = [v16 calendar];
    }
    else
    {
      id v36 = v17;
    }
    v37 = v36;
    v38 = [v36 source];
    v39 = [v38 sourceIdentifier];
    [(CNAutocompleteFetchContext *)v21->_fetchContext setSendingAddressAccountIdentifier:v39];

    v40 = [v37 selfIdentityEmail];
    [(CNAutocompleteFetchContext *)v21->_fetchContext setSendingAddress:v40];

    uint64_t v41 = objc_opt_new();
    searchResults = v21->_searchResults;
    v21->_searchResults = (NSMutableArray *)v41;

    v43 = [*p_event calendar];
    uint64_t v44 = [v43 maxAttendees];
    v45 = [*p_event roomAttendees];
    v21->_maxNumberOfAttendees = v44 + ~[v45 count];

    id v17 = v35;
    id v19 = v48;
  }

  return v21;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_availabilityQueue cancelAllOperations];
  [(CNComposeRecipientTextView *)self->_composeRecipientView setDelegate:0];
  if (self->_lastSearchId) {
    -[CNAutocompleteSearchManager cancelTaskWithID:](self->_searchManager, "cancelTaskWithID:");
  }
  v3.receiver = self;
  v3.super_class = (Class)EKEventAttendeePicker;
  [(EKEventAttendeePicker *)&v3 dealloc];
}

- (void)loadView
{
  objc_initWeak(&location, self);
  objc_super v3 = -[EKEventAttendeePickerBGView initWithFrame:]([EKEventAttendeePickerBGView alloc], "initWithFrame:", self->_initialFrame.origin.x, self->_initialFrame.origin.y, self->_initialFrame.size.width, self->_initialFrame.size.height);
  [(EKEventAttendeePickerBGView *)v3 setAutoresizingMask:18];
  v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(EKEventAttendeePickerBGView *)v3 setBackgroundColor:v4];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __33__EKEventAttendeePicker_loadView__block_invoke;
  v22[3] = &unk_1E6087918;
  objc_copyWeak(&v23, &location);
  [(EKEventAttendeePickerBGView *)v3 setBoundsChangeCallback:v22];
  [(EKEventAttendeePicker *)self setView:v3];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v5 = (void *)getCNAutocompleteResultsTableViewControllerClass_softClass;
  uint64_t v29 = getCNAutocompleteResultsTableViewControllerClass_softClass;
  if (!getCNAutocompleteResultsTableViewControllerClass_softClass)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __getCNAutocompleteResultsTableViewControllerClass_block_invoke;
    v25[3] = &unk_1E6087D90;
    v25[4] = &v26;
    __getCNAutocompleteResultsTableViewControllerClass_block_invoke((uint64_t)v25);
    v5 = (void *)v27[3];
  }
  v6 = v5;
  _Block_object_dispose(&v26, 8);
  v7 = (CNAutocompleteResultsTableViewController *)[[v6 alloc] initWithStyle:1];
  autocompleteTableViewController = self->_autocompleteTableViewController;
  self->_autocompleteTableViewController = v7;

  [(CNAutocompleteResultsTableViewController *)self->_autocompleteTableViewController setDelegate:self];
  [getCNComposeRecipientTextViewClass() preferredHeight];
  double v10 = v9;
  double width = self->_initialFrame.size.width;
  v12 = (CNComposeRecipientTextView *)objc_msgSend(objc_alloc((Class)getCNComposeRecipientTextViewClass()), "initWithFrame:", 0.0, 0.0, width, v9);
  composeRecipientView = self->_composeRecipientView;
  self->_composeRecipientView = v12;

  [(CNComposeRecipientTextView *)self->_composeRecipientView setAutoresizingMask:2];
  v14 = [MEMORY[0x1E4FB1618] clearColor];
  [(CNComposeRecipientTextView *)self->_composeRecipientView setBackgroundColor:v14];

  v15 = self->_composeRecipientView;
  id v16 = [MEMORY[0x1E4F1C978] array];
  [(CNComposeRecipientTextView *)v15 setAddresses:v16];

  [(CNComposeRecipientTextView *)self->_composeRecipientView setDelegate:self];
  id v17 = self->_composeRecipientView;
  id v18 = EventKitUIBundle();
  id v19 = [v18 localizedStringForKey:@"To:" value:&stru_1F0CC2140 table:0];
  [(CNComposeRecipientTextView *)v17 setLabel:v19];

  v20 = (UIScrollView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1BE0]), "initWithFrame:", 0.0, 0.0, self->_initialFrame.size.width, v10);
  recipientScrollView = self->_recipientScrollView;
  self->_recipientScrollView = v20;

  -[UIScrollView setContentSize:](self->_recipientScrollView, "setContentSize:", width, v10);
  [(UIScrollView *)self->_recipientScrollView setAutoresizingMask:2];
  [(UIScrollView *)self->_recipientScrollView addSubview:self->_composeRecipientView];
  [(EKEventAttendeePickerBGView *)v3 addSubview:self->_recipientScrollView];
  [(CNComposeRecipientTextView *)self->_composeRecipientView setMaxRecipients:self->_maxNumberOfAttendees];
  [(EKEventAttendeePicker *)self _setRecipientsOnComposeView];
  if ([(EKEventAttendeePicker *)self _zeroKeyworkSearchEnabled]) {
    [(EKEventAttendeePicker *)self searchForCorecipients];
  }
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
}

void __33__EKEventAttendeePicker_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _adjustLayoutOfSubviews];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)EKEventAttendeePicker;
  [(EKEventAttendeePicker *)&v4 viewDidLoad];
  [(CNComposeRecipientTextView *)self->_composeRecipientView becomeFirstResponder];
  [(EKEventAttendeePicker *)self _invalidateAtomPresentationOptionsForAllRecipients];
  if ([(EKEventAttendeePicker *)self shouldSuggestFamilySharees])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __36__EKEventAttendeePicker_viewDidLoad__block_invoke;
    v3[3] = &unk_1E6088B50;
    v3[4] = self;
    [MEMORY[0x1E4F25568] requestFamilyShareesWithCompletion:v3];
  }
}

void __36__EKEventAttendeePicker_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v30 = a3;
  v34 = [MEMORY[0x1E4F1CA48] array];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v4;
  uint64_t v35 = [obj countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v35)
  {
    uint64_t v5 = 0;
    uint64_t v32 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v41 != v32) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1E4F5A070];
        double v9 = [v7 firstName];
        double v10 = [v7 lastName];
        v11 = [v8 nameComponentsWithFirstName:v9 lastName:v10 nickname:0 nameSuffix:0];

        v12 = (void *)MEMORY[0x1E4F5A088];
        v13 = [v7 emailAddress];
        v14 = [v7 name];
        v15 = [v12 calDAVResultWithAddress:v13 displayName:v14 nameComponents:v11 resultType:0 groupMembersProvider:0 userInfo:0];

        id v16 = [getCNComposeRecipientClass_1() composeRecipientWithAutocompleteResult:v15];
        [v34 addObject:v16];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v17 = [*(id *)(a1 + 32) filterOutFamilySharees];
        uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v53 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v37;
          while (2)
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v37 != v19) {
                objc_enumerationMutation(v17);
              }
              if ([*(id *)(*((void *)&v36 + 1) + 8 * j) isEqualToSharee:v7])
              {

                ++v5;
                goto LABEL_16;
              }
            }
            uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v53 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }

LABEL_16:
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v40 objects:v54 count:16];
    }
    while (v35);
  }
  else
  {
    uint64_t v5 = 0;
  }

  if (v5 != [obj count])
  {
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2050000000;
    v21 = (void *)getCNComposeRecipientGroupClass_softClass;
    uint64_t v52 = getCNComposeRecipientGroupClass_softClass;
    if (!getCNComposeRecipientGroupClass_softClass)
    {
      uint64_t v44 = MEMORY[0x1E4F143A8];
      uint64_t v45 = 3221225472;
      v46 = __getCNComposeRecipientGroupClass_block_invoke;
      v47 = &unk_1E6087D90;
      id v48 = &v49;
      __getCNComposeRecipientGroupClass_block_invoke((uint64_t)&v44);
      v21 = (void *)v50[3];
    }
    v22 = v21;
    _Block_object_dispose(&v49, 8);
    id v23 = [v22 alloc];
    v24 = EventKitUIBundle();
    v25 = [v24 localizedStringForKey:@"My iCloud Family" value:&stru_1F0CC2140 table:0];
    uint64_t v26 = (void *)[v23 initWithChildren:v34 displayString:v25];

    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2050000000;
    v27 = (void *)getCNComposeRecipientOriginContextClass_softClass;
    uint64_t v52 = getCNComposeRecipientOriginContextClass_softClass;
    if (!getCNComposeRecipientOriginContextClass_softClass)
    {
      uint64_t v44 = MEMORY[0x1E4F143A8];
      uint64_t v45 = 3221225472;
      v46 = __getCNComposeRecipientOriginContextClass_block_invoke;
      v47 = &unk_1E6087D90;
      id v48 = &v49;
      __getCNComposeRecipientOriginContextClass_block_invoke((uint64_t)&v44);
      v27 = (void *)v50[3];
    }
    uint64_t v28 = v27;
    _Block_object_dispose(&v49, 8);
    id v29 = objc_alloc_init(v28);
    [v29 setSearchTerm:&stru_1F0CC2140];
    [v29 setResultType:16];
    [v26 setOriginContext:v29];
    [*(id *)(*(void *)(a1 + 32) + 1152) insertObject:v26 atIndex:0];
    [*(id *)(a1 + 32) _refreshSearchResults];
  }
}

- (void)viewLayoutMarginsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)EKEventAttendeePicker;
  [(EKEventAttendeePicker *)&v4 viewLayoutMarginsDidChange];
  objc_super v3 = [(EKEventAttendeePicker *)self view];
  [v3 layoutMargins];
  [(CNComposeRecipientTextView *)self->_composeRecipientView setLayoutMargins:"setLayoutMargins:"];
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventAttendeePicker;
  [(EKEventAttendeePicker *)&v3 viewSafeAreaInsetsDidChange];
  [(EKEventAttendeePicker *)self _adjustLayoutOfSubviews];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CNComposeRecipientTextView *)self->_composeRecipientView becomeFirstResponder];
  v5.receiver = self;
  v5.super_class = (Class)EKEventAttendeePicker;
  [(EKEventAttendeePicker *)&v5 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(EKEventAttendeePicker *)self scrollComposeViewToEnd];
  v5.receiver = self;
  v5.super_class = (Class)EKEventAttendeePicker;
  [(EKEventAttendeePicker *)&v5 viewDidAppear:v3];
}

- (void)commitRemainingText
{
}

- (NSString)remainingText
{
  return (NSString *)[(CNComposeRecipientTextView *)self->_composeRecipientView text];
}

- (NSArray)addresses
{
  return (NSArray *)[(CNComposeRecipientTextView *)self->_composeRecipientView addresses];
}

- (NSArray)recipients
{
  if (self->_composeRecipientView)
  {
    v2 = [(CNComposeRecipientTextView *)self->_composeRecipientView recipients];
  }
  else
  {
    v2 = (void *)[(NSArray *)self->_recipients copy];
  }

  return (NSArray *)v2;
}

- (void)setRecipients:(id)a3
{
  objc_super v4 = (NSArray *)[a3 copy];
  recipients = self->_recipients;
  self->_recipients = v4;

  self->_hasChanges = 0;
  if (self->_composeRecipientView)
  {
    [(EKEventAttendeePicker *)self _setRecipientsOnComposeView];
  }
}

- (void)_setRecipientsOnComposeView
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [(CNComposeRecipientTextView *)self->_composeRecipientView setAddresses:0];
  self->_suppressAvailabilityRequests = 1;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v3 = self->_recipients;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        -[CNComposeRecipientTextView addRecipient:](self->_composeRecipientView, "addRecipient:", *(void *)(*((void *)&v17 + 1) + 8 * v7++), (void)v17);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v5);
  }

  self->_suppressAvailabilityRequests = 0;
  [(NSMutableDictionary *)self->_recipientAddressesToRecipients removeAllObjects];
  [(NSOperationQueue *)self->_availabilityQueue cancelAllOperations];
  [(EKEventAttendeePicker *)self _requestAvailabilityForRecipients:self->_recipients];
  v8 = [(CNComposeRecipientTextView *)self->_composeRecipientView uncommentedAddresses];
  double v9 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    double v10 = v9;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    fetchContext = self->_fetchContext;
    *(_DWORD *)buf = 138412802;
    v22 = v12;
    __int16 v23 = 2112;
    v24 = fetchContext;
    __int16 v25 = 2112;
    uint64_t v26 = v8;
    _os_log_impl(&dword_1B3F4C000, v10, OS_LOG_TYPE_DEBUG, "[%@] Setting fetch context [%@] otherAddressesAlreadyChosen to [%@]", buf, 0x20u);
  }
  v14 = [(EKEvent *)self->_event attendees];
  v15 = [v14 CalMap:&__block_literal_global_58];

  id v16 = [v8 arrayByAddingObjectsFromArray:v15];
  [(CNAutocompleteFetchContext *)self->_fetchContext setOtherAddressesAlreadyChosen:v16];

  [(EKEventAttendeePicker *)self updateMaxAttendeeInfoText];
  [(EKEventAttendeePicker *)self scrollComposeViewToEnd];
}

id __52__EKEventAttendeePicker__setRecipientsOnComposeView__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 URL];
  BOOL v3 = [v2 resourceSpecifier];

  return v3;
}

- (id)_lookUpRecipientForAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_recipientAddressesToRecipients objectForKey:v4];
  if (!v5)
  {
    uint64_t v6 = EKUtils_AdjustedAttendeeAddress();
    uint64_t v5 = [(NSMutableDictionary *)self->_recipientAddressesToRecipients objectForKey:v6];
  }

  return v5;
}

- (void)_requestAvailabilityForRecipients:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(EKEventAttendeePicker *)self showAvailability])
  {
    if (v4 && [v4 count])
    {
      BOOL suppressAvailabilityRequests = self->_suppressAvailabilityRequests;
      uint64_t v6 = kEKUILogHandle;
      BOOL v7 = os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG);
      if (suppressAvailabilityRequests)
      {
        if (v7)
        {
          *(_WORD *)buf = 0;
          v8 = "Suppressing availability requests.  Will not look up availability for recipients.";
          double v9 = v6;
LABEL_11:
          uint32_t v11 = 2;
          goto LABEL_12;
        }
      }
      else
      {
        if (v7)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_DEBUG, "Preparing to request availability for recipients.", buf, 2u);
        }
        uint64_t v13 = [v4 count];
        v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v13];
        if ([(EKEvent *)self->_event isStartDateDirty]) {
          char v15 = 1;
        }
        else {
          char v15 = [(EKEvent *)self->_event isEndDateDirty];
        }
        id v16 = [(EKEvent *)self->_event calendar];
        long long v17 = [v16 source];
        long long v18 = [v17 constraints];
        char v19 = [v18 supportsIgnoringEventsInAvailabilityRequests];

        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke;
        v40[3] = &unk_1E608ADB8;
        v40[4] = self;
        char v42 = v15;
        char v43 = v19;
        id v20 = v14;
        id v41 = v20;
        [v4 enumerateObjectsUsingBlock:v40];
        [(EKEventAttendeePicker *)self _invalidateAtomPresentationOptionsForAllRecipients];
        if ([v20 count])
        {
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke_61;
          aBlock[3] = &unk_1E60893A0;
          aBlock[4] = self;
          v33 = _Block_copy(aBlock);
          overriddenEventStartDate = self->_overriddenEventStartDate;
          if (overriddenEventStartDate)
          {
            v22 = overriddenEventStartDate;
          }
          else
          {
            v22 = [(EKEvent *)self->_event startDate];
          }
          v24 = v22;
          overriddenEventEndDate = self->_overriddenEventEndDate;
          if (overriddenEventEndDate)
          {
            uint64_t v26 = overriddenEventEndDate;
          }
          else
          {
            uint64_t v26 = [(EKEvent *)self->_event endDateUnadjustedForLegacyClients];
          }
          v27 = v26;
          id v28 = objc_alloc(MEMORY[0x1E4F25608]);
          id v29 = [(EKEvent *)self->_event calendar];
          id v30 = [v29 source];
          v31 = (EKEventAttendeePicker *)[v28 initWithSource:v30 startDate:v24 endDate:v27 ignoredEvent:self->_event addresses:v20 resultsBlock:v33];

          objc_initWeak(&location, v31);
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke_66;
          v34[3] = &unk_1E6089290;
          objc_copyWeak(&v37, &location);
          id v35 = v20;
          long long v36 = self;
          [(EKEventAttendeePicker *)v31 setCompletionBlock:v34];
          uint64_t v32 = kEKUILogHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v45 = v31;
            _os_log_impl(&dword_1B3F4C000, v32, OS_LOG_TYPE_DEBUG, "Adding availability operation: [%@]", buf, 0xCu);
          }
          [(NSOperationQueue *)self->_availabilityQueue addOperation:v31];

          objc_destroyWeak(&v37);
          objc_destroyWeak(&location);
        }
        else
        {
          __int16 v23 = kEKUILogHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B3F4C000, v23, OS_LOG_TYPE_DEBUG, "There are no recipients for which to issue an availability request.", buf, 2u);
          }
        }
      }
    }
    else
    {
      uint64_t v12 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v8 = "No recipients were given.  Will not look up availability for recipients.";
        double v9 = v12;
        goto LABEL_11;
      }
    }
  }
  else
  {
    uint64_t v10 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v45 = self;
      v8 = "[%@] says not to show availability.  Will not look up availability for recipients.";
      double v9 = v10;
      uint32_t v11 = 12;
LABEL_12:
      _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_DEBUG, v8, buf, v11);
    }
  }
}

void __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [(id)objc_opt_class() _addressForRecipient:v3];
  if (v4)
  {
    if (*(unsigned char *)(a1 + 48)
      || ![(id)objc_opt_class() _participantHasResponded:v3]
      || *(unsigned char *)(a1 + 49))
    {
      uint64_t v5 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        int v9 = 138412546;
        id v10 = v4;
        __int16 v11 = 2112;
        id v12 = v3;
        _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_DEBUG, "Will use address [%@] to get availability for recipient [%@]", (uint8_t *)&v9, 0x16u);
      }
      [*(id *)(a1 + 40) addObject:v4];
      [*(id *)(*(void *)(a1 + 32) + 1096) setObject:v3 forKey:v4];
      uint64_t v6 = 512;
    }
    else
    {
      v8 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        int v9 = 138412290;
        id v10 = v3;
        _os_log_impl(&dword_1B3F4C000, v8, OS_LOG_TYPE_DEBUG, "This event's source does not support ignoring events in availability requests and the participant has already responded.  The attendee will likely be marked as busy because they've already responded, but that can be misleading if they've accepted.  Will not get availability for recipient: [%@]", (uint8_t *)&v9, 0xCu);
      }
      uint64_t v6 = 0;
    }
  }
  else
  {
    BOOL v7 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_ERROR, "No address found.  Will not get availability for recipient: [%@]", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v6 = 4096;
  }
  [*(id *)(a1 + 32) _setAtomPresentationOption:v6 forRecipient:v3];
}

void __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke_61(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke_2;
  v6[3] = &unk_1E6087D68;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke_3;
  v4[3] = &unk_1E60893C8;
  v4[4] = *(void *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v4];
  return [*(id *)(a1 + 40) _invalidateAtomPresentationOptionsForAllRecipients];
}

void __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) _lookUpRecipientForAddress:v5];
  if (v7)
  {
    if ([MEMORY[0x1E4F254B8] spansIncludeBusyPeriod:v6]) {
      uint64_t v8 = 2048;
    }
    else {
      uint64_t v8 = 1024;
    }
    [*(id *)(a1 + 32) _setAtomPresentationOption:v8 forRecipient:v7];
  }
  else
  {
    int v9 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_ERROR, "No recipient found for original address: [%@].  Will not update atom presentation options for a recipient.", (uint8_t *)&v10, 0xCu);
    }
  }
}

void __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke_66(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    id v3 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    *(_DWORD *)buf = 138412290;
    id v17 = WeakRetained;
    _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_DEBUG, "Availability operation completed: [%@]", buf, 0xCu);
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = [v5 error];

  id v7 = objc_loadWeakRetained((id *)(a1 + 48));
  LOBYTE(v5) = [v7 isCancelled];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke_67;
  v11[3] = &unk_1E608A860;
  id v12 = v6;
  char v15 = (char)v5;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v13 = v8;
  uint64_t v14 = v9;
  id v10 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

uint64_t __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke_67(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = kEKUILogHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    id v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    id v30 = v3;
    uint64_t v4 = "Error encountered during availability request: [%@]";
    id v5 = v2;
    uint32_t v6 = 12;
    goto LABEL_7;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v7 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      uint64_t v4 = "An availability operation was cancelled.";
      id v5 = v7;
      uint32_t v6 = 2;
LABEL_7:
      _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_DEBUG, v4, buf, v6);
    }
  }
LABEL_8:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v26;
    *(void *)&long long v10 = 138412802;
    long long v23 = v10;
    id v24 = v8;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        char v15 = objc_msgSend(*(id *)(a1 + 48), "_lookUpRecipientForAddress:", v14, v23);
        if (v15)
        {
          id v16 = [*(id *)(*(void *)(a1 + 48) + 1112) objectForKey:v15];
          id v17 = v16;
          if (v16 && [v16 unsignedIntegerValue] == 512)
          {
            uint64_t v18 = (void *)kEKUILogHandle;
            if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
            {
              char v19 = v18;
              id v20 = +[EKUIMailUtilities atomPresentationOptionsAsString:4096];
              *(_DWORD *)buf = v23;
              id v30 = v15;
              __int16 v31 = 2112;
              uint64_t v32 = v14;
              __int16 v33 = 2112;
              v34 = v20;
              _os_log_impl(&dword_1B3F4C000, v19, OS_LOG_TYPE_DEBUG, "Setting the icon for recipient [%@] with address [%@] to [%@] because the availability request associated with this recipient has completed and the spinner is still being shown.", buf, 0x20u);

              id v8 = v24;
            }
            [*(id *)(a1 + 48) _setAtomPresentationOption:4096 forRecipient:v15];
          }
        }
        else
        {
          v21 = kEKUILogHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v30 = v14;
            _os_log_impl(&dword_1B3F4C000, v21, OS_LOG_TYPE_DEBUG, "Could not find recipient for address [%@].  Will not possibly adjust availability icon.", buf, 0xCu);
          }
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v11);
  }

  return [*(id *)(a1 + 48) _invalidateAtomPresentationOptionsForAllRecipients];
}

+ (id)_addressForRecipient:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_getAssociatedObject(v3, &kEKUI_CNComposeReciepentParticipantKey_0);
  id v5 = v4;
  if (v4)
  {
    uint32_t v6 = [v4 URL];
    uint64_t v7 = [v6 absoluteString];

    goto LABEL_8;
  }
  uint64_t v7 = [v3 normalizedAddress];
  if (v7)
  {
    if (![v3 kind] || objc_msgSend(v3, "kind") == 1)
    {

LABEL_7:
      uint64_t v7 = [v3 normalizedAddress];
      goto LABEL_8;
    }
    uint64_t v9 = [v3 kind];

    if (v9 == 4) {
      goto LABEL_7;
    }
    uint64_t v7 = 0;
  }
LABEL_8:

  return v7;
}

+ (BOOL)_participantHasResponded:(id)a3
{
  id v3 = objc_getAssociatedObject(a3, &kEKUI_CNComposeReciepentParticipantKey_0);
  uint64_t v4 = v3;
  if (v3) {
    char HasResponded = EKUIAttendeeUtils_AttendeeHasResponded(v3);
  }
  else {
    char HasResponded = 0;
  }

  return HasResponded;
}

- (void)_setAtomPresentationOption:(unint64_t)a3 forRecipient:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  atomPresentationOptionsByRecipient = self->_atomPresentationOptionsByRecipient;
  if (!atomPresentationOptionsByRecipient)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = self->_atomPresentationOptionsByRecipient;
    self->_atomPresentationOptionsByRecipient = v8;

    atomPresentationOptionsByRecipient = self->_atomPresentationOptionsByRecipient;
  }
  long long v10 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)atomPresentationOptionsByRecipient setObject:v10 forKey:v6];

  uint64_t v11 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = v11;
    id v13 = +[EKUIMailUtilities atomPresentationOptionsAsString:a3];
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v13;
    _os_log_impl(&dword_1B3F4C000, v12, OS_LOG_TYPE_DEBUG, "Atom presentation of recipient [%@] set to [%@]", (uint8_t *)&v14, 0x16u);
  }
}

- (void)_invalidateAtomPresentationOptionsForAllRecipients
{
}

- (void)_copyRecipientsFromComposeView
{
  id v5 = [(CNComposeRecipientTextView *)self->_composeRecipientView recipients];
  id v3 = (NSArray *)[v5 copy];
  recipients = self->_recipients;
  self->_recipients = v3;
}

- (id)_searchResultsView
{
  searchResultsView = self->_searchResultsView;
  if (!searchResultsView)
  {
    uint64_t v4 = [(EKEventAttendeePicker *)self view];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;

    [getCNComposeRecipientTextViewClass() preferredHeight];
    double v10 = v9;
    uint64_t v11 = [(CNAutocompleteResultsTableViewController *)self->_autocompleteTableViewController tableView];
    uint64_t v12 = self->_searchResultsView;
    self->_searchResultsView = v11;

    -[UITableView setFrame:](self->_searchResultsView, "setFrame:", 0.0, v10, v6, v8 - v10);
    [(UITableView *)self->_searchResultsView setAutoresizingMask:18];
    [(UITableView *)self->_searchResultsView setKeyboardDismissMode:1];
    searchResultsView = self->_searchResultsView;
  }

  return searchResultsView;
}

- (void)_hideSearchResultsViewAndCancelOutstandingSearches:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v5 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    double v6 = v5;
    double v7 = (objc_class *)objc_opt_class();
    double v8 = NSStringFromClass(v7);
    int v12 = 138412290;
    id v13 = v8;
    _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_DEBUG, "[%@] Hiding search results view and canceling outstanding searches", (uint8_t *)&v12, 0xCu);
  }
  self->_showingSearchField = 0;
  double v9 = self->_searchResults;
  objc_sync_enter(v9);
  [(NSMutableArray *)self->_searchResults removeAllObjects];
  objc_sync_exit(v9);

  [(CNAutocompleteResultsTableViewController *)self->_autocompleteTableViewController invalidatePreferredRecipients];
  if (v3 && self->_lastSearchId)
  {
    double v10 = [(EKEventAttendeePicker *)self _searchManager];
    [v10 cancelTaskWithID:self->_lastSearchId];

    lastSearchId = self->_lastSearchId;
    self->_lastSearchId = 0;
  }
  [(EKEventAttendeePicker *)self _adjustLayoutOfSubviews];
  [(UITableView *)self->_searchResultsView removeFromSuperview];
  [(CNComposeRecipientTextView *)self->_composeRecipientView setSeparatorHidden:0];
}

- (void)_showSearchResultsView
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = v3;
    double v5 = (objc_class *)objc_opt_class();
    double v6 = NSStringFromClass(v5);
    int v10 = 138412290;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_DEBUG, "[%@] Showing search results view", (uint8_t *)&v10, 0xCu);
  }
  self->_showingSearchField = 1;
  double v7 = [(EKEventAttendeePicker *)self _searchResultsView];
  double v8 = [v7 superview];

  if (!v8)
  {
    double v9 = [(EKEventAttendeePicker *)self view];
    [v9 addSubview:v7];
  }
  [(CNComposeRecipientTextView *)self->_composeRecipientView setSeparatorHidden:1];
  [(EKEventAttendeePicker *)self _adjustLayoutOfSubviews];
}

- (double)_maxScrollerHeight
{
  BOOL v3 = [(EKEventAttendeePicker *)self view];
  [v3 bounds];
  double Height = CGRectGetHeight(v8);

  if (![(UIViewController *)self isPresentedInsidePopover])
  {
    [MEMORY[0x1E4FB18E0] defaultSize];
    if (v5 < Height)
    {
      [MEMORY[0x1E4FB18E0] defaultSize];
      return Height - v6;
    }
  }
  return Height;
}

- (BOOL)_zeroKeyworkSearchEnabled
{
  BOOL v3 = [(EKEventAttendeePicker *)self recipients];
  if ([v3 count])
  {
    BOOL IsCompact = 1;
  }
  else
  {
    double v5 = [(EKEventAttendeePicker *)self view];
    if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v5))
    {
      BOOL IsCompact = 1;
    }
    else
    {
      double v6 = [(EKEventAttendeePicker *)self view];
      BOOL IsCompact = EKUICurrentHeightSizeClassIsCompact(v6);
    }
  }

  return IsCompact;
}

- (void)updateMaxAttendeeInfoText
{
  int64_t maxNumberOfAttendees = self->_maxNumberOfAttendees;
  uint64_t v4 = [(CNComposeRecipientTextView *)self->_composeRecipientView recipients];
  uint64_t v5 = [v4 count];

  if (maxNumberOfAttendees < 1 || (double)maxNumberOfAttendees * 0.9 >= (double)v5)
  {
    composeRecipientView = self->_composeRecipientView;
    [(CNComposeRecipientTextView *)composeRecipientView setComposeFieldInfoText:&stru_1F0CC2140];
  }
  else
  {
    double v6 = EventKitUIBundle();
    id v10 = [v6 localizedStringForKey:@"(%d / %d) invitees" value:&stru_1F0CC2140 table:0];

    double v7 = self->_composeRecipientView;
    CGRect v8 = objc_msgSend(NSString, "localizedStringWithFormat:", v10, v5, maxNumberOfAttendees);
    [(CNComposeRecipientTextView *)v7 setComposeFieldInfoText:v8];
  }
}

- (void)scrollComposeViewToEnd
{
  if (([(CNComposeRecipientTextView *)self->_composeRecipientView isFirstResponder] & 1) == 0) {
    [(CNComposeRecipientTextView *)self->_composeRecipientView becomeFirstResponder];
  }
  [(UIScrollView *)self->_recipientScrollView contentSize];
  double v4 = v3;
  [(UIScrollView *)self->_recipientScrollView frame];
  recipientScrollView = self->_recipientScrollView;

  -[UIScrollView setContentOffset:animated:](recipientScrollView, "setContentOffset:animated:", 0, 0.0, v4 - v5);
}

- (id)_searchManager
{
  searchManager = self->_searchManager;
  if (searchManager)
  {
LABEL_2:
    double v4 = searchManager;
    goto LABEL_7;
  }
  if (self->_ABAccessDenied) {
    goto LABEL_4;
  }
  if ((unint64_t)([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] - 1) > 1)
  {
    if (!self->_ABAccessDenied)
    {
      uint64_t v13 = 0;
      uint64_t v14 = &v13;
      uint64_t v15 = 0x2050000000;
      double v6 = (void *)getCNAutocompleteSearchManagerClass_softClass;
      uint64_t v16 = getCNAutocompleteSearchManagerClass_softClass;
      if (!getCNAutocompleteSearchManagerClass_softClass)
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __getCNAutocompleteSearchManagerClass_block_invoke;
        v12[3] = &unk_1E6087D90;
        v12[4] = &v13;
        __getCNAutocompleteSearchManagerClass_block_invoke((uint64_t)v12);
        double v6 = (void *)v14[3];
      }
      double v7 = v6;
      _Block_object_dispose(&v13, 8);
      CGRect v8 = (CNAutocompleteSearchManager *)[[v7 alloc] initWithAutocompleteSearchType:3];
      double v9 = self->_searchManager;
      self->_searchManager = v8;

      [(CNAutocompleteSearchManager *)self->_searchManager setFetchDelegate:self];
      searchManager = self->_searchManager;
      if (self->_searchAccountID)
      {
        [(CNAutocompleteSearchManager *)searchManager setSearchTypes:27];
        id v10 = self->_searchManager;
        uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObject:self->_searchAccountID];
        [(CNAutocompleteSearchManager *)v10 setSearchAccountIDs:v11];

        searchManager = self->_searchManager;
      }
      goto LABEL_2;
    }
LABEL_4:
    double v4 = 0;
    goto LABEL_7;
  }
  double v4 = 0;
  self->_ABAccessDenied = 1;
LABEL_7:

  return v4;
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__EKEventAttendeePicker_consumeAutocompleteSearchResults_taskID___block_invoke;
  block[3] = &unk_1E6087548;
  id v11 = v7;
  uint64_t v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __65__EKEventAttendeePicker_consumeAutocompleteSearchResults_taskID___block_invoke(id *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t result = [a1[4] isEqual:*((void *)a1[5] + 128)];
  if (result)
  {
    uint64_t result = [a1[6] count];
    if (result)
    {
      double v3 = (void *)kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        double v4 = v3;
        double v5 = (objc_class *)objc_opt_class();
        id v6 = NSStringFromClass(v5);
        id v7 = a1[6];
        int v9 = 138412546;
        id v10 = v6;
        __int16 v11 = 2112;
        id v12 = v7;
        _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_DEBUG, "[%@] Consuming autocomplete results: %@", (uint8_t *)&v9, 0x16u);
      }
      id v8 = *((id *)a1[5] + 144);
      objc_sync_enter(v8);
      [*((id *)a1[5] + 144) addObjectsFromArray:a1[6]];
      objc_sync_exit(v8);

      return [a1[5] _refreshSearchResults];
    }
  }
  return result;
}

- (void)consumeCorecipientSearchResults:(id)a3 taskID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__EKEventAttendeePicker_consumeCorecipientSearchResults_taskID___block_invoke;
  block[3] = &unk_1E6087548;
  id v11 = v7;
  id v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __64__EKEventAttendeePicker_consumeCorecipientSearchResults_taskID___block_invoke(id *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t result = [a1[4] isEqual:*((void *)a1[5] + 128)];
  if (result)
  {
    uint64_t result = [a1[6] count];
    if (result)
    {
      double v3 = (void *)kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        double v4 = v3;
        double v5 = (objc_class *)objc_opt_class();
        id v6 = NSStringFromClass(v5);
        id v7 = a1[6];
        int v9 = 138412546;
        id v10 = v6;
        __int16 v11 = 2112;
        id v12 = v7;
        _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_DEBUG, "[%@] Consuming corecipient results: %@", (uint8_t *)&v9, 0x16u);
      }
      id v8 = *((id *)a1[5] + 144);
      objc_sync_enter(v8);
      [*((id *)a1[5] + 144) addObjectsFromArray:a1[6]];
      objc_sync_exit(v8);

      return [a1[5] _refreshSearchResults];
    }
  }
  return result;
}

- (void)finishedSearchingForAutocompleteResults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__EKEventAttendeePicker_finishedSearchingForAutocompleteResults__block_invoke;
  block[3] = &unk_1E6087570;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

unsigned char *__64__EKEventAttendeePicker_finishedSearchingForAutocompleteResults__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    double v3 = v2;
    double v4 = (objc_class *)objc_opt_class();
    double v5 = NSStringFromClass(v4);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 1152);
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_DEBUG, "[%@] Finished searching for autocomplete results with final results: %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 1152) count];
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (!v7) {
    return (unsigned char *)[result _hideSearchResultsViewAndCancelOutstandingSearches:0];
  }
  if (result[1008]) {
    return (unsigned char *)[result _refreshSearchResults];
  }
  return result;
}

- (void)finishedSearchingForCorecipients
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__EKEventAttendeePicker_finishedSearchingForCorecipients__block_invoke;
  block[3] = &unk_1E6087570;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

unsigned char *__57__EKEventAttendeePicker_finishedSearchingForCorecipients__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    double v3 = v2;
    double v4 = (objc_class *)objc_opt_class();
    double v5 = NSStringFromClass(v4);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 1152);
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1B3F4C000, v3, OS_LOG_TYPE_DEBUG, "[%@] Finished searching for autocomplete results with final results: %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 1152) count];
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (!v7) {
    return (unsigned char *)[result _hideSearchResultsViewAndCancelOutstandingSearches:0];
  }
  if (result[1008]) {
    return (unsigned char *)[result _refreshSearchResults];
  }
  return result;
}

- (void)finishedTaskWithID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__EKEventAttendeePicker_finishedTaskWithID___block_invoke;
  v6[3] = &unk_1E6087D68;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __44__EKEventAttendeePicker_finishedTaskWithID___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqual:*(void *)(*(void *)(a1 + 40) + 1024)])
  {
    uint64_t v2 = *(void *)(a1 + 40);
    double v3 = *(void **)(v2 + 1024);
    *(void *)(v2 + 1024) = 0;
  }
}

- (void)_refreshSearchResults
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_searchResults count] && !self->_showingSearchField) {
    [(EKEventAttendeePicker *)self _showSearchResultsView];
  }
  double v3 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    id v4 = v3;
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    searchResults = self->_searchResults;
    int v8 = 138412546;
    int v9 = v6;
    __int16 v10 = 2112;
    __int16 v11 = searchResults;
    _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_DEBUG, "[%@] Refreshing search results: %@", (uint8_t *)&v8, 0x16u);
  }
  [(CNAutocompleteResultsTableViewController *)self->_autocompleteTableViewController setRecipients:self->_searchResults];
}

- (void)searchWithText:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = v5;
    id v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    fetchContext = self->_fetchContext;
    int v15 = 138412802;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    __int16 v19 = 2112;
    id v20 = fetchContext;
    _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_DEBUG, "[%@] Beginning text search with text [%@] context [%@]", (uint8_t *)&v15, 0x20u);
  }
  if (self->_lastSearchId)
  {
    __int16 v10 = [(EKEventAttendeePicker *)self _searchManager];
    [v10 cancelTaskWithID:self->_lastSearchId];
  }
  __int16 v11 = self->_searchResults;
  objc_sync_enter(v11);
  [(NSMutableArray *)self->_searchResults removeAllObjects];
  objc_sync_exit(v11);

  uint64_t v12 = [(EKEventAttendeePicker *)self _searchManager];
  uint64_t v13 = [v12 searchForText:v4 withAutocompleteFetchContext:self->_fetchContext consumer:self];
  lastSearchId = self->_lastSearchId;
  self->_lastSearchId = v13;
}

- (void)searchForCorecipients
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    id v4 = v3;
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    fetchContext = self->_fetchContext;
    int v14 = 138412546;
    int v15 = v6;
    __int16 v16 = 2112;
    __int16 v17 = fetchContext;
    _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_DEBUG, "[%@] Beginning context search with context: %@", (uint8_t *)&v14, 0x16u);
  }
  if (self->_lastSearchId)
  {
    int v8 = [(EKEventAttendeePicker *)self _searchManager];
    [v8 cancelTaskWithID:self->_lastSearchId];

    lastSearchId = self->_lastSearchId;
    self->_lastSearchId = 0;
  }
  __int16 v10 = self->_searchResults;
  objc_sync_enter(v10);
  [(NSMutableArray *)self->_searchResults removeAllObjects];
  objc_sync_exit(v10);

  if ([(EKEventAttendeePicker *)self _zeroKeyworkSearchEnabled])
  {
    __int16 v11 = [(EKEventAttendeePicker *)self _searchManager];
    uint64_t v12 = [v11 searchForCorecipientsWithAutocompleteFetchContext:self->_fetchContext consumer:self];
    uint64_t v13 = self->_lastSearchId;
    self->_lastSearchId = v12;
  }
  else
  {
    [(EKEventAttendeePicker *)self _hideSearchResultsViewAndCancelOutstandingSearches:0];
  }
}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  id v7 = [v5 arrayWithObjects:&v8 count:1];

  -[EKEventAttendeePicker _requestAvailabilityForRecipients:](self, "_requestAvailabilityForRecipients:", v7, v8, v9);
  [(EKEventAttendeePicker *)self _updateFetchContextChosenAddresses];
  [(EKEventAttendeePicker *)self scrollComposeViewToEnd];
  [(EKEventAttendeePicker *)self updateMaxAttendeeInfoText];
  [(EKEventAttendeePicker *)self _copyRecipientsFromComposeView];
  if ([(EKEventAttendeePicker *)self _appearState] == 2) {
    [(EKEventAttendeePicker *)self _invalidateAtomPresentationOptionsForAllRecipients];
  }
  self->_hasChanges = 1;
}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  [a3 removeRecipient:a4];
  [(EKEventAttendeePicker *)self _updateFetchContextChosenAddresses];
  [(EKEventAttendeePicker *)self updateMaxAttendeeInfoText];
  [(EKEventAttendeePicker *)self _copyRecipientsFromComposeView];

  [(EKEventAttendeePicker *)self _invalidateAtomPresentationOptionsForAllRecipients];
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 clearText];
  [(EKEventAttendeePicker *)self _hideSearchResultsViewAndCancelOutstandingSearches:1];
  [v7 addAddress:v6];
}

- (void)_adjustLayoutOfSubviews
{
  [(CNComposeRecipientTextView *)self->_composeRecipientView frame];
  double Height = CGRectGetHeight(v34);
  [getCNComposeRecipientTextViewClass() preferredHeight];
  double v5 = v4;
  [(EKEventAttendeePicker *)self _maxScrollerHeight];
  double v7 = v6 * 0.333;
  if (Height <= v7) {
    double v7 = Height;
  }
  if (Height >= v5) {
    double v8 = v7;
  }
  else {
    double v8 = v5;
  }
  uint64_t v9 = [(EKEventAttendeePicker *)self view];
  [v9 safeAreaInsets];
  double v11 = v8 + v10;

  [(UIScrollView *)self->_recipientScrollView frame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  uint64_t v18 = [(EKEventAttendeePicker *)self _searchResultsView];
  [v18 setAlpha:0.0];
  __int16 v19 = [v18 superview];

  if (v19)
  {
    [v18 frame];
    double MaxY = CGRectGetMaxY(v35);
    v36.origin.CGFloat x = v13;
    v36.origin.CGFloat y = v15;
    v36.size.double width = v17;
    v36.size.CGFloat height = v11;
    if (MaxY <= CGRectGetMaxY(v36))
    {
      uint64_t v21 = [(EKEventAttendeePicker *)self view];
      [v21 frame];
      double MaxY = v22;
    }
    v37.origin.CGFloat x = v13;
    v37.origin.CGFloat y = v15;
    v37.size.double width = v17;
    v37.size.CGFloat height = v11;
    double MinX = CGRectGetMinX(v37);
    v38.origin.CGFloat x = v13;
    v38.origin.CGFloat y = v15;
    v38.size.double width = v17;
    v38.size.CGFloat height = v11;
    double v24 = CGRectGetMaxY(v38);
    v39.origin.CGFloat x = v13;
    v39.origin.CGFloat y = v15;
    v39.size.double width = v17;
    v39.size.CGFloat height = v11;
    double Width = CGRectGetWidth(v39);
    v40.origin.CGFloat x = v13;
    v40.origin.CGFloat y = v15;
    v40.size.double width = v17;
    v40.size.CGFloat height = v11;
    objc_msgSend(v18, "setFrame:", MinX, v24, Width, MaxY - CGRectGetMaxY(v40));
  }
  long long v26 = (void *)MEMORY[0x1E4FB1EB0];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __48__EKEventAttendeePicker__adjustLayoutOfSubviews__block_invoke;
  v28[3] = &unk_1E608ADE0;
  CGFloat v30 = v13;
  CGFloat v31 = v15;
  CGFloat v32 = v17;
  double v33 = v11;
  v28[4] = self;
  id v29 = v18;
  id v27 = v18;
  [v26 animateWithDuration:v28 animations:0.2];
}

uint64_t __48__EKEventAttendeePicker__adjustLayoutOfSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 992) contentOffset];
  double v3 = v2;
  double v5 = v4;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 992), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  [*(id *)(*(void *)(a1 + 32) + 992) contentSize];
  double v7 = v6;
  [*(id *)(*(void *)(a1 + 32) + 992) frame];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 992), "setContentOffset:animated:", 0, v3, fmin(v5, v7 - v8));
  uint64_t v9 = *(void **)(a1 + 40);

  return [v9 setAlpha:1.0];
}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  double height = a4.height;
  CGFloat width = a4.width;
  [(CNComposeRecipientTextView *)self->_composeRecipientView bounds];
  CGFloat v7 = CGRectGetHeight(v16);
  uint64_t v9 = 3221225472;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  double v10 = __57__EKEventAttendeePicker_composeHeaderView_didChangeSize___block_invoke;
  double v11 = &unk_1E608AE08;
  double v12 = self;
  CGFloat v13 = width;
  double v14 = height;
  BOOL v15 = height > v7;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:&v8 animations:0.2];
  [(EKEventAttendeePicker *)self _adjustLayoutOfSubviews];
}

uint64_t __57__EKEventAttendeePicker_composeHeaderView_didChangeSize___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 984) frame];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 984), "setFrame:");
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 992), "setContentSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  if (*(unsigned char *)(a1 + 56))
  {
    double v3 = *(void **)(a1 + 32);
    return [v3 scrollComposeViewToEnd];
  }
  return result;
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id v5 = a4;
  if ([v5 length]) {
    [(EKEventAttendeePicker *)self searchWithText:v5];
  }
  else {
    [(EKEventAttendeePicker *)self searchForCorecipients];
  }
}

- (id)peoplePickerPrompt
{
  double v2 = EventKitUIBundle();
  double v3 = [v2 localizedStringForKey:@"Add invitees to this Event." value:&stru_1F0CC2140 table:0];

  return v3;
}

- (BOOL)showAvailability
{
  double v2 = [(EKEvent *)self->_event calendar];
  double v3 = [v2 source];
  double v4 = [v3 constraints];
  char v5 = [v4 supportsAvailabilityRequests];

  return v5;
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  [(EKEventAttendeePicker *)self _CNContactPickerViewController];
  id v14 = (id)objc_opt_new();
  [v14 setDelegate:self];
  [v14 setModalPresentationStyle:18];
  double v4 = [(EKEvent *)self->_event calendar];
  char v5 = [v4 constraints];
  int v6 = [v5 supportsPhoneNumbers];

  if (v6) {
    CGFloat v7 = @"emailAddresses.@count > 0 || phoneNumbers.@count > 0";
  }
  else {
    CGFloat v7 = @"emailAddresses.@count > 0";
  }
  if (v6) {
    uint64_t v8 = @"(emailAddresses.@count == 1) || (emailAddresses.@count == 0 && phoneNumbers.@count == 1)";
  }
  else {
    uint64_t v8 = @"emailAddresses.@count == 1";
  }
  if (v6) {
    uint64_t v9 = @"(key == 'emailAddresses') || (key == 'phoneNumbers')";
  }
  else {
    uint64_t v9 = @"(key == 'emailAddresses')";
  }
  double v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:v7];
  [v14 setPredicateForEnablingContact:v10];

  double v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:v8];
  [v14 setPredicateForSelectionOfContact:v11];

  double v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:v9];
  [v14 setPredicateForSelectionOfProperty:v12];

  CGFloat v13 = [(EKEventAttendeePicker *)self navigationController];
  [v13 presentModalViewController:v14 withTransition:8];
}

- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3
{
  double v4 = [(EKEventAttendeePicker *)self navigationController];
  [v4 dismissViewControllerAnimated:1 completion:0];

  composeRecipientView = self->_composeRecipientView;

  [(CNComposeRecipientTextView *)composeRecipientView becomeFirstResponder];
}

- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4
{
  id v4 = a4;
  char v5 = objc_msgSend(objc_alloc((Class)getCNComposeRecipientClass_1()), "initWithContact:address:kind:", 0, v4, objc_msgSend(v4, "cal_isPhoneNumber"));

  return v5;
}

- (BOOL)recipientViewShouldIgnoreFirstResponderChanges:(id)a3
{
  return 1;
}

- (unint64_t)presentationOptionsForRecipient:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_atomPresentationOptionsByRecipient objectForKey:v4];

  if (v5)
  {
    int v6 = [(NSMutableDictionary *)self->_atomPresentationOptionsByRecipient objectForKey:v4];
    unint64_t v5 = [v6 unsignedIntegerValue];
  }
  unint64_t maxNumberOfAttendees = self->_maxNumberOfAttendees;
  if ([(NSArray *)self->_recipients count] > maxNumberOfAttendees
    && -[NSArray indexOfObject:inRange:](self->_recipients, "indexOfObject:inRange:", v4, maxNumberOfAttendees, [(NSArray *)self->_recipients count] - maxNumberOfAttendees) != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = 1;
    goto LABEL_14;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addressValidationDelegate);

  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_addressValidationDelegate);
    double v10 = [v4 normalizedAddress];
    uint64_t v11 = [v9 eventAttendeePicker:self getValidationStatusForAddress:v10];

    switch(v11)
    {
      case 3:
        goto LABEL_9;
      case 2:
        break;
      case 1:
LABEL_9:
        v5 |= 8uLL;
        break;
      default:
        v5 |= 8uLL;
        id v12 = objc_loadWeakRetained((id *)&self->_addressValidationDelegate);
        CGFloat v13 = [v4 normalizedAddress];
        [v12 eventAttendeePicker:self cacheValidationStatus:1 forAddress:v13];

        break;
    }
  }
  id v14 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    BOOL v15 = v14;
    CGRect v16 = +[EKUIMailUtilities atomPresentationOptionsAsString:v5];
    int v18 = 138412546;
    __int16 v19 = v16;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl(&dword_1B3F4C000, v15, OS_LOG_TYPE_DEBUG, "Returning presentation options [%@] for recipient: [%@]", (uint8_t *)&v18, 0x16u);
  }
LABEL_14:

  return v5;
}

- (BOOL)composeRecipientViewShowingSearchResults:(id)a3
{
  return self->_showingSearchField;
}

- (void)selectNextSearchResultForComposeRecipientView:(id)a3
{
}

- (BOOL)expandSelectedSearchResultForComposeRecipientView:(id)a3
{
  return [(CNAutocompleteResultsTableViewController *)self->_autocompleteTableViewController expandSelectedRecipient];
}

- (BOOL)collapseSelectedSearchResultForComposeRecipientView:(id)a3
{
  return [(CNAutocompleteResultsTableViewController *)self->_autocompleteTableViewController collapseSelectedRecipient];
}

- (void)selectPreviousSearchResultForComposeRecipientView:(id)a3
{
}

- (BOOL)chooseSelectedSearchResultForComposeRecipientView:(id)a3 context:(unint64_t)a4
{
  return [(CNAutocompleteResultsTableViewController *)self->_autocompleteTableViewController confirmSelectedRecipient];
}

- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 contact];
  if (!v6)
  {
    CGFloat v7 = (void *)MEMORY[0x1E4F57778];
    uint64_t v8 = [v5 displayString];
    id v9 = [v7 personNameComponentsFromString:v8];

    id v6 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    double v10 = [v9 familyName];
    [v6 setFamilyName:v10];

    uint64_t v11 = [v9 givenName];
    [v6 setGivenName:v11];

    id v12 = (void *)MEMORY[0x1E4F1BA20];
    uint64_t v13 = *MEMORY[0x1E4F1B700];
    id v14 = [v5 address];
    BOOL v15 = [v12 labeledValueWithLabel:v13 value:v14];
    v30[0] = v15;
    CGRect v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    [v6 setEmailAddresses:v16];
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F1B990]);
  [v17 setIncludeIncludeManagedAppleIDs:1];
  [v17 setIncludeSuggestedContacts:1];
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F1B980]) initWithConfiguration:v17];
  __int16 v19 = [(objc_class *)[(EKEventAttendeePicker *)self _CNContactViewController] viewControllerForUnknownContact:v6];
  [v19 setContactStore:v18];
  [v19 setHidesBottomBarWhenPushed:1];
  [v19 setModalPresentationStyle:3];
  [v19 setDisplayMode:1];
  [v19 setAllowsEditing:0];
  [v5 sourceType];
  __int16 v20 = [v5 autocompleteResult];
  id v21 = [v20 recentsIdentifier];

  if (v21)
  {
    uint64_t v22 = (objc_class *)EKWeakLinkClass();
    long long v23 = EKWeakLinkStringConstant();
    id v24 = [v22 alloc];
    long long v25 = [v5 autocompleteResult];
    long long v26 = [v25 recentsIdentifier];
    id v27 = (void *)[v24 initWithRecentContactID:v26 domain:v23];
    [v19 setRecentsData:v27];

    [v19 setDelegate:self];
  }
  displayedRecipient = self->_displayedRecipient;
  self->_displayedRecipient = (CNComposeRecipient *)v5;

  id v29 = [(EKEventAttendeePicker *)self navigationController];
  [v29 pushViewController:v19 animated:1];
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  if (a4)
  {
    composeRecipientView = self->_composeRecipientView;
    id v8 = a4;
    [(CNComposeRecipientTextView *)composeRecipientView clearText];
    [(CNComposeRecipientTextView *)self->_composeRecipientView addRecipient:v8];
    id v9 = [(EKEventAttendeePicker *)self _searchManager];
    [v9 didSelectRecipient:v8 atIndex:a5];

    [(EKEventAttendeePicker *)self _hideSearchResultsViewAndCancelOutstandingSearches:1];
    [(EKEventAttendeePicker *)self _updateFetchContextChosenAddresses];
    [(EKEventAttendeePicker *)self searchForCorecipients];
  }
}

- (void)_updateFetchContextChosenAddresses
{
  id v3 = [(CNComposeRecipientTextView *)self->_composeRecipientView uncommentedAddresses];
  [(CNAutocompleteFetchContext *)self->_fetchContext setOtherAddressesAlreadyChosen:v3];
}

- (void)contactViewControllerDidExecuteClearRecentsDataAction:(id)a3
{
  [(CNAutocompleteResultsTableViewController *)self->_autocompleteTableViewController invalidateSearchResultRecipient:self->_displayedRecipient];
  displayedRecipient = self->_displayedRecipient;
  self->_displayedRecipient = 0;

  id v6 = [(EKEventAttendeePicker *)self navigationController];
  id v5 = (id)[v6 popViewControllerAnimated:1];
}

- (void)contactPickerDidCancel:(id)a3
{
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v19 = a4;
  id v5 = [v19 emailAddresses];
  uint64_t v6 = [v5 count];

  if (v6 == 1)
  {
    CGFloat v7 = [v19 emailAddresses];
    id v8 = [v7 firstObject];

    id v9 = objc_alloc((Class)getCNComposeRecipientClass_1());
    double v10 = [v8 value];
    uint64_t v11 = (void *)[v9 initWithContact:v19 address:v10 kind:0];
  }
  else
  {
    uint64_t v11 = [v19 phoneNumbers];
    if ([v11 count] != 1) {
      goto LABEL_8;
    }
    id v12 = [(EKEvent *)self->_event calendar];
    uint64_t v13 = [v12 constraints];
    int v14 = [v13 supportsPhoneNumbers];

    if (!v14) {
      goto LABEL_9;
    }
    BOOL v15 = [v19 phoneNumbers];
    id v8 = [v15 firstObject];

    double v10 = [v8 value];
    id v16 = objc_alloc((Class)getCNComposeRecipientClass_1());
    id v17 = [v10 stringValue];
    uint64_t v11 = (void *)[v16 initWithContact:v19 address:v17 kind:1];
  }
  if (!v11) {
    goto LABEL_9;
  }
  int v18 = [v19 CalDisplayName];
  [v11 setDisplayString:v18];

  [(CNComposeRecipientTextView *)self->_composeRecipientView addRecipient:v11];
LABEL_8:

LABEL_9:
  [(EKEventAttendeePicker *)self composeRecipientViewDidFinishPickingRecipient:self->_composeRecipientView];
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v18 = a4;
  id v5 = [v18 key];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F1ADC8]];

  if (v6)
  {
    id v7 = objc_alloc((Class)getCNComposeRecipientClass_1());
    id v8 = [v18 contact];
    id v9 = [v18 value];
    double v10 = (void *)[v7 initWithContact:v8 address:v9 kind:0];
  }
  else
  {
    double v10 = [v18 key];
    if (![v10 isEqualToString:*MEMORY[0x1E4F1AEE0]]) {
      goto LABEL_8;
    }
    uint64_t v11 = [(EKEvent *)self->_event calendar];
    id v12 = [v11 constraints];
    int v13 = [v12 supportsPhoneNumbers];

    if (!v13) {
      goto LABEL_9;
    }
    id v8 = [v18 value];
    id v14 = objc_alloc((Class)getCNComposeRecipientClass_1());
    id v9 = [v18 contact];
    BOOL v15 = [v8 stringValue];
    double v10 = (void *)[v14 initWithContact:v9 address:v15 kind:1];
  }
  if (!v10) {
    goto LABEL_9;
  }
  id v16 = [v18 contact];
  id v17 = [v16 CalDisplayName];
  [v10 setDisplayString:v17];

  [(CNComposeRecipientTextView *)self->_composeRecipientView addRecipient:v10];
LABEL_8:

LABEL_9:
  [(EKEventAttendeePicker *)self composeRecipientViewDidFinishPickingRecipient:self->_composeRecipientView];
}

- (BOOL)getSupplementalGroupsForSearchQuery:(id)a3 completionHandler:(id)a4
{
  return 0;
}

- (Class)_CNContactViewController
{
  return (Class)EKWeakLinkClass();
}

- (Class)_CNContactPickerViewController
{
  return (Class)EKWeakLinkClass();
}

- (NSString)searchAccountID
{
  return self->_searchAccountID;
}

- (void)setSearchAccountID:(id)a3
{
}

- (EKEventAttendeePickerDelegate)addressValidationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addressValidationDelegate);

  return (EKEventAttendeePickerDelegate *)WeakRetained;
}

- (void)setAddressValidationDelegate:(id)a3
{
}

- (BOOL)hasChanges
{
  return self->_hasChanges;
}

- (void)setHasChanges:(BOOL)a3
{
  self->_hasChanges = a3;
}

- (BOOL)shouldSuggestFamilySharees
{
  return self->_shouldSuggestFamilySharees;
}

- (void)setShouldSuggestFamilySharees:(BOOL)a3
{
  self->_shouldSuggestFamilySharees = a3;
}

- (NSArray)filterOutFamilySharees
{
  return self->_filterOutFamilySharees;
}

- (void)setFilterOutFamilySharees:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterOutFamilySharees, 0);
  objc_destroyWeak((id *)&self->_addressValidationDelegate);
  objc_storeStrong((id *)&self->_searchAccountID, 0);
  objc_storeStrong((id *)&self->_displayedRecipient, 0);
  objc_storeStrong((id *)&self->_fetchContext, 0);
  objc_storeStrong((id *)&self->_autocompleteTableViewController, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_overriddenEventEndDate, 0);
  objc_storeStrong((id *)&self->_overriddenEventStartDate, 0);
  objc_storeStrong((id *)&self->_atomPresentationOptionsByRecipient, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_recipientAddressesToRecipients, 0);
  objc_storeStrong((id *)&self->_availabilityQueue, 0);
  objc_storeStrong((id *)&self->_lastSearchId, 0);
  objc_storeStrong((id *)&self->_keyboard, 0);
  objc_storeStrong((id *)&self->_searchResultsView, 0);
  objc_storeStrong((id *)&self->_recipientScrollView, 0);
  objc_storeStrong((id *)&self->_composeRecipientView, 0);

  objc_storeStrong((id *)&self->_recipients, 0);
}

@end