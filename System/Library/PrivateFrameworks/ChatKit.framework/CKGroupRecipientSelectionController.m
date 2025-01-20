@interface CKGroupRecipientSelectionController
- (BOOL)_enableRecipientsAdditionBasedOnAvailability;
- (BOOL)alwaysShowSearchResultsTable;
- (BOOL)hasInvalidRecipientsForService:(id)a3;
- (BOOL)homogenizePreferredServiceForiMessage;
- (BOOL)isBeingPresentedInMacDetailsView;
- (BOOL)recipientSelectionIsGroup:(id)a3;
- (BOOL)shouldAutorotate;
- (BOOL)shouldSuppressSearchResultsTable;
- (CKGroupRecipientSelectionController)initWithConversation:(id)a3;
- (UIBarButtonItem)doneButton;
- (UIEdgeInsets)navigationBarInsetsForRecipientSelectionController:(id)a3;
- (double)topInsetForNavBar;
- (double)visibleInputAndEntryViewHeightToAvoidForRecipientSelectionController:(id)a3;
- (id)_orderedMutableGroupServices;
- (id)_serviceForRecipientPresentationOptions;
- (id)handlesForScreenTimePolicyCheck;
- (void)_checkAvailabilityAndAddToken;
- (void)_frecencySearch;
- (void)_updateNavigationButton;
- (void)composeRecipientViewReturnPressed:(id)a3;
- (void)didAddRecipient:(id)a3;
- (void)handleAddingHandles:(id)a3 conversation:(id)a4 viewController:(id)a5 allRecipientAddresses:(id)a6 completion:(id)a7;
- (void)handleCancelAction:(id)a3 completion:(id)a4;
- (void)handleDoneActionForConversation:(id)a3 viewController:(id)a4 completion:(id)a5;
- (void)loadView;
- (void)recipientAvailibilitiesDidUpdate;
- (void)recipientSelectionController:(id)a3 textDidChange:(id)a4;
- (void)recipientSelectionControllerDidChange;
- (void)recipientSelectionControllerRequestDismissKeyboard:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)viewDidAppearDeferredSetup;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CKGroupRecipientSelectionController

- (CKGroupRecipientSelectionController)initWithConversation:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CKGroupRecipientSelectionController;
  v3 = [(CKRecipientSelectionController *)&v14 initWithConversation:a3];
  v4 = v3;
  if (v3) {
    [(CKRecipientSelectionController *)v3 setDelegate:v3];
  }
  v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isLazuliEnabled];

  if (v6)
  {
    v7 = [(CKRecipientSelectionController *)v4 conversation];
    v8 = [v7 chat];

    if (v8)
    {
      v9 = [(CKRecipientSelectionController *)v4 conversation];
      v10 = [v9 chat];
      v11 = [v10 participants];
      v12 = objc_msgSend(v11, "__imArrayByApplyingBlock:", &__block_literal_global_244);

      [(CKRecipientSelectionController *)v4 refreshAvailabilityForRecipients:v12 context:0];
    }
  }
  return v4;
}

id __60__CKGroupRecipientSelectionController_initWithConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 ID];

  if (v3)
  {
    v4 = [v2 ID];
    v3 = IMChatCanonicalIDSIDsForAddress();
  }

  return v3;
}

- (void)loadView
{
  v9.receiver = self;
  v9.super_class = (Class)CKGroupRecipientSelectionController;
  [(CKRecipientSelectionController *)&v9 loadView];
  BOOL v3 = [(CKGroupRecipientSelectionController *)self isBeingPresentedInMacDetailsView];
  v4 = [(CKGroupRecipientSelectionController *)self view];
  if (v3) {
    [MEMORY[0x1E4F428B8] clearColor];
  }
  else {
  v5 = [MEMORY[0x1E4F428B8] _ckSystemBackgroundColor];
  }
  [v4 setBackgroundColor:v5];

  int v6 = [(CKRecipientSelectionController *)self toField];
  v7 = CKFrameworkBundle();
  v8 = [v7 localizedStringForKey:@"ADD" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v6 setLabel:v8];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKGroupRecipientSelectionController;
  [(CKViewController *)&v8 viewWillAppear:a3];
  if ([(CKGroupRecipientSelectionController *)self isBeingPresentedInMacDetailsView]) {
    [(CKGroupRecipientSelectionController *)self _checkAvailabilityAndAddToken];
  }
  else {
    [(CKGroupRecipientSelectionController *)self _updateNavigationButton];
  }
  if ([(CKGroupRecipientSelectionController *)self isBeingPresentedInMacDetailsView])
  {
    v4 = [(CKRecipientSelectionController *)self toField];
    v5 = [v4 addButton];
    [v5 setHidden:1];

    int v6 = [(CKRecipientSelectionController *)self toField];
    [v6 setShowsAddButtonWhenExpanded:0];
  }
  v7 = [(CKRecipientSelectionController *)self toField];
  [v7 becomeFirstResponder];
}

- (void)viewDidAppearDeferredSetup
{
  v17.receiver = self;
  v17.super_class = (Class)CKGroupRecipientSelectionController;
  [(CKRecipientSelectionController *)&v17 viewDidAppearDeferredSetup];
  BOOL v3 = [(CKRecipientSelectionController *)self searchListController];
  [v3 setSuppressGroupSuggestions:1];

  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v5 = [(CKRecipientSelectionController *)self conversation];
  int v6 = [v5 recipients];
  v7 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v6, "count"));

  objc_super v8 = [(CKRecipientSelectionController *)self conversation];
  objc_super v9 = [v8 recipients];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__CKGroupRecipientSelectionController_viewDidAppearDeferredSetup__block_invoke;
  v15[3] = &unk_1E562AEC0;
  id v10 = v7;
  id v16 = v10;
  [v9 enumerateObjectsUsingBlock:v15];

  v11 = [(CKRecipientSelectionController *)self searchListController];
  [v11 setPrefilteredRecipients:v10];

  if ([(CKGroupRecipientSelectionController *)self isBeingPresentedInMacDetailsView])
  {
    v12 = [(CKRecipientSelectionController *)self searchListController];
    v13 = [v12 view];
    objc_super v14 = [MEMORY[0x1E4F428B8] clearColor];
    [v13 setBackgroundColor:v14];
  }
  [(CKGroupRecipientSelectionController *)self _frecencySearch];
}

void __65__CKGroupRecipientSelectionController_viewDidAppearDeferredSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [CKIMComposeRecipient alloc];
  v5 = [v3 defaultIMHandle];

  int v6 = [(CKIMComposeRecipient *)v4 initWithHandle:v5];
  [*(id *)(a1 + 32) addObject:v6];
}

- (BOOL)shouldAutorotate
{
  id v2 = +[CKUIBehavior sharedBehaviors];
  char v3 = [v2 shouldSuppressRotationInNewCompose] ^ 1;

  return v3;
}

- (void)recipientSelectionControllerDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CKGroupRecipientSelectionController;
  [(CKRecipientSelectionController *)&v3 recipientSelectionControllerDidChange];
  if (![(CKGroupRecipientSelectionController *)self isBeingPresentedInMacDetailsView])[(CKGroupRecipientSelectionController *)self _updateNavigationButton]; {
  [(CKGroupRecipientSelectionController *)self _frecencySearch];
  }
}

- (void)recipientAvailibilitiesDidUpdate
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)CKGroupRecipientSelectionController;
  [(CKRecipientSelectionController *)&v23 recipientAvailibilitiesDidUpdate];
  if ([(CKGroupRecipientSelectionController *)self isBeingPresentedInMacDetailsView])
  {
    [(CKGroupRecipientSelectionController *)self _checkAvailabilityAndAddToken];
    return;
  }
  [(CKGroupRecipientSelectionController *)self _updateNavigationButton];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v3 = [(CKRecipientSelectionController *)self toField];
  id v4 = [v3 recipients];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (!v5) {
    goto LABEL_15;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v20;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v20 != v7) {
        objc_enumerationMutation(v4);
      }
      objc_super v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      id v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v11 = [v10 isLazuliEnabled];

      if (!v11)
      {
        v15 = [(CKRecipientSelectionController *)self recipientAvailabilities];
        id v16 = [v9 IDSCanonicalAddress];
        objc_super v17 = [v15 objectForKeyedSubscript:v16];

        if (!v17) {
          continue;
        }
LABEL_12:
        v18 = [(CKRecipientSelectionController *)self toField];
        [v18 invalidateAtomPresentationOptionsForRecipient:v9];

        continue;
      }
      v12 = [(CKRecipientSelectionController *)self expandedRecipientAvailabilities];
      v13 = [v9 IDSCanonicalAddress];
      char v14 = [v12 hasResultsForRecipient:v13];

      if (v14) {
        goto LABEL_12;
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  }
  while (v6);
LABEL_15:
}

- (BOOL)homogenizePreferredServiceForiMessage
{
  return 0;
}

- (BOOL)shouldSuppressSearchResultsTable
{
  return 0;
}

- (BOOL)alwaysShowSearchResultsTable
{
  return 1;
}

- (BOOL)isBeingPresentedInMacDetailsView
{
  return CKIsRunningInMacCatalyst() != 0;
}

- (void)didAddRecipient:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKGroupRecipientSelectionController;
  [(CKRecipientSelectionController *)&v16 didAddRecipient:v4];
  uint64_t v5 = [(CKRecipientSelectionController *)self conversation];
  uint64_t v6 = [v5 sendingService];
  uint64_t v7 = [MEMORY[0x1E4F6BDC0] iMessageService];

  if (v6 == v7)
  {
    v13 = 0;
  }
  else
  {
    objc_super v8 = (void *)MEMORY[0x1E4F1CAD0];
    objc_super v9 = [MEMORY[0x1E4F6BDC0] iMessageService];
    id v10 = [v9 internalName];
    int v11 = [MEMORY[0x1E4F6BDC0] rcsService];
    v12 = [v11 internalName];
    v13 = objc_msgSend(v8, "setWithObjects:", v10, v12, 0);
  }
  char v14 = objc_alloc_init(CKPendingConversationStatusRefreshContext);
  [(CKPendingConversationStatusRefreshContext *)v14 setPreconditionsIgnoredForServices:v13];
  [(CKPendingConversationStatusRefreshContext *)v14 setIsForPendingConversation:1];
  v17[0] = v4;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [(CKRecipientSelectionController *)self refreshAvailabilityForRecipients:v15 context:v14];
}

- (BOOL)recipientSelectionIsGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKRecipientSelectionController *)self recipients];
  if ((unint64_t)[v5 count] > 1)
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v6 = [v4 recipients];
    BOOL v7 = (unint64_t)[v6 count] > 1;
  }
  return v7;
}

- (double)visibleInputAndEntryViewHeightToAvoidForRecipientSelectionController:(id)a3
{
  return 0.0;
}

- (void)recipientSelectionController:(id)a3 textDidChange:(id)a4
{
  uint64_t v5 = [(CKRecipientSelectionController *)self toField];
  uint64_t v6 = [v5 text];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    [(CKGroupRecipientSelectionController *)self _frecencySearch];
  }
}

- (void)recipientSelectionControllerRequestDismissKeyboard:(id)a3
{
  id v4 = [(CKRecipientSelectionController *)self toField];
  objc_super v3 = [v4 textView];
  [v3 resignFirstResponder];
}

- (UIEdgeInsets)navigationBarInsetsForRecipientSelectionController:(id)a3
{
  double v3 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  [(CKGroupRecipientSelectionController *)self topInsetForNavBar];
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (double)topInsetForNavBar
{
  double v3 = [(CKGroupRecipientSelectionController *)self navigationController];
  double v4 = [v3 navigationBar];

  double v5 = [MEMORY[0x1E4F42738] sharedApplication];
  double v6 = [v5 statusBar];

  double v7 = [MEMORY[0x1E4F42738] sharedApplication];
  char v8 = [v7 isStatusBarHidden];

  double v9 = +[CKUIBehavior sharedBehaviors];
  int v10 = [v9 shouldInsetForStatusBar];

  if (v10)
  {
    double v11 = 0.0;
    if ((v8 & 1) == 0)
    {
      [v6 currentHeight];
      double v11 = v12;
    }
  }
  else
  {
    double v11 = 0.0;
    if ([v4 isTranslucent])
    {
      v13 = [(CKGroupRecipientSelectionController *)self view];
      [v13 safeAreaInsets];
      double v11 = v14;
    }
  }

  return v11;
}

- (void)_updateNavigationButton
{
  double v3 = [(CKRecipientSelectionController *)self recipients];
  uint64_t v4 = [v3 count];

  if (v4) {
    BOOL v5 = [(CKGroupRecipientSelectionController *)self _enableRecipientsAdditionBasedOnAvailability];
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = [(CKGroupRecipientSelectionController *)self doneButton];
  [v6 setEnabled:v5];
}

- (void)_checkAvailabilityAndAddToken
{
  if ([(CKGroupRecipientSelectionController *)self isBeingPresentedInMacDetailsView]
    && [(CKGroupRecipientSelectionController *)self _enableRecipientsAdditionBasedOnAvailability])
  {
    id v3 = [(CKRecipientSelectionController *)self delegate];
    [v3 recipientSelectionControllerReturnPressed:self];
  }
}

- (BOOL)_enableRecipientsAdditionBasedOnAvailability
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = [(CKRecipientSelectionController *)self recipients];
  uint64_t v32 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v32)
  {
    uint64_t v3 = *(void *)v35;
    unint64_t v4 = 0x1E4F6E000uLL;
    while (2)
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v35 != v3) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        double v7 = [*(id *)(v4 + 1912) sharedFeatureFlags];
        int v8 = [v7 isLazuliEnabled];

        v33 = v6;
        double v9 = [v6 IDSCanonicalAddress];
        if (v8)
        {
          int v10 = [(CKRecipientSelectionController *)self expandedRecipientAvailabilities];
          int v11 = [v10 hasResultsForRecipient:v9];

          double v12 = [(CKRecipientSelectionController *)self expandedRecipientAvailabilities];
          v13 = (void *)MEMORY[0x1E4F6E010];
          int v14 = [v12 hasIDStatus:1 forRecipient:v9 forServicesWithCapability:*MEMORY[0x1E4F6E010]];

          v15 = [(CKRecipientSelectionController *)self expandedRecipientAvailabilities];
          int v16 = [v15 hasIDStatus:2 forRecipient:v9 forServicesWithCapability:*v13];
        }
        else
        {
          objc_super v17 = [(CKRecipientSelectionController *)self recipientAvailabilities];
          v18 = [v17 objectForKey:v9];
          int v11 = v18 != 0;

          long long v19 = [(CKRecipientSelectionController *)self recipientAvailabilities];
          long long v20 = [v19 objectForKey:v9];
          int v14 = [v20 integerValue] == 1;

          v15 = [(CKRecipientSelectionController *)self recipientAvailabilities];
          [v15 objectForKey:v9];
          unint64_t v21 = v4;
          v23 = uint64_t v22 = v3;
          int v16 = [v23 integerValue] == 2;

          uint64_t v3 = v22;
          unint64_t v4 = v21;
        }

        if (v11 && ((v14 | v16) & 1) != 0)
        {
          BOOL v29 = 1;
          goto LABEL_23;
        }
        if ([MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled])
        {
          if (![(CKRecipientSelectionController *)self allowedByScreenTime])
          {
            v24 = [v33 normalizedAddress];

            if (v24)
            {
              uint64_t v25 = [(CKRecipientSelectionController *)self currentConversationContext];
              v26 = [v25 allowedByContactsHandle];
              v27 = [v33 normalizedAddress];
              v28 = [v26 objectForKey:v27];

              if (v28 && ![v28 BOOLValue])
              {

                goto LABEL_22;
              }
            }
          }
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v32) {
        continue;
      }
      break;
    }
  }
LABEL_22:
  BOOL v29 = 0;
LABEL_23:

  return v29;
}

- (void)_frecencySearch
{
  uint64_t v3 = [(CKRecipientSelectionController *)self searchListController];
  [v3 searchWithText:0];

  id v5 = [(CKRecipientSelectionController *)self searchListController];
  unint64_t v4 = [v5 tableView];
  objc_msgSend(v4, "__ck_scrollToTop:", 0);
}

- (id)handlesForScreenTimePolicyCheck
{
  if ([MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled])
  {
    v14.receiver = self;
    v14.super_class = (Class)CKGroupRecipientSelectionController;
    uint64_t v3 = [(CKRecipientSelectionController *)&v14 handlesForScreenTimePolicyCheck];
    unint64_t v4 = (void *)[v3 mutableCopy];

    if (!v4)
    {
      unint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    }
    id v5 = [(CKRecipientSelectionController *)self conversation];
    id v6 = [v5 chat];

    if (v6)
    {
      double v7 = [(CKRecipientSelectionController *)self conversation];
      int v8 = [v7 chat];
      double v9 = [v8 participants];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __70__CKGroupRecipientSelectionController_handlesForScreenTimePolicyCheck__block_invoke;
      v12[3] = &unk_1E562C0F8;
      id v13 = v4;
      objc_msgSend(v9, "__imForEach:", v12);
    }
    int v10 = (void *)[v4 copy];
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

void __70__CKGroupRecipientSelectionController_handlesForScreenTimePolicyCheck__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 ID];

  if (v3)
  {
    unint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v6 ID];
    [v4 addObject:v5];
  }
}

- (void)composeRecipientViewReturnPressed:(id)a3
{
  if ([(CKGroupRecipientSelectionController *)self _enableRecipientsAdditionBasedOnAvailability])
  {
    id v4 = [(CKRecipientSelectionController *)self delegate];
    [v4 recipientSelectionControllerReturnPressed:self];
  }
}

- (void)handleCancelAction:(id)a3 completion:(id)a4
{
  id v5 = a4;
  [(CKRecipientSelectionController *)self stopCheckingRecipientAvailabilityAndRemoveAllTimers];
  [(CKRecipientSelectionController *)self invalidateOutstandingIDStatusRequests];
  [(CKGroupRecipientSelectionController *)self dismissViewControllerAnimated:1 completion:0];
  (*((void (**)(id, void, void, void, void))v5 + 2))(v5, 0, 0, 0, 0);
}

- (void)handleDoneActionForConversation:(id)a3 viewController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  int v11 = [(CKRecipientSelectionController *)self toField];
  double v12 = [v11 recipients];

  id v13 = (void *)MEMORY[0x1E4F1CA48];
  objc_super v14 = [v8 recipientStrings];
  v15 = [v13 arrayWithArray:v14];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __97__CKGroupRecipientSelectionController_handleDoneActionForConversation_viewController_completion___block_invoke;
  v23[3] = &unk_1E56216D8;
  id v24 = v15;
  id v16 = v15;
  [v12 enumerateObjectsUsingBlock:v23];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __97__CKGroupRecipientSelectionController_handleDoneActionForConversation_viewController_completion___block_invoke_2;
  v20[3] = &unk_1E56286F0;
  id v21 = v8;
  id v22 = v17;
  id v18 = v17;
  id v19 = v8;
  [v16 enumerateObjectsUsingBlock:v20];
  [(CKGroupRecipientSelectionController *)self handleAddingHandles:v18 conversation:v19 viewController:v10 allRecipientAddresses:v16 completion:v9];
}

void __97__CKGroupRecipientSelectionController_handleDoneActionForConversation_viewController_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 address];
  [v2 addObject:v3];
}

void __97__CKGroupRecipientSelectionController_handleDoneActionForConversation_viewController_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 chat];
  id v6 = [v5 account];
  id v7 = [v6 imHandleWithID:v4 alreadyCanonical:0];

  [*(id *)(a1 + 40) addObject:v7];
}

- (id)_orderedMutableGroupServices
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F6BDC0] servicesWithCapabilityName:*MEMORY[0x1E4F6E090]];
  id v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_116_0];

  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Ranked service names for details view add resolution: %@", (uint8_t *)&v6, 0xCu);
    }
  }

  return v3;
}

uint64_t __67__CKGroupRecipientSelectionController__orderedMutableGroupServices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 serviceForSendingPriority];
  if (v6 <= [v5 serviceForSendingPriority])
  {
    uint64_t v8 = [v4 serviceForSendingPriority];
    uint64_t v7 = v8 < [v5 serviceForSendingPriority];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (void)handleAddingHandles:(id)a3 conversation:(id)a4 viewController:(id)a5 allRecipientAddresses:(id)a6 completion:(id)a7
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v45 = a5;
  id v46 = a6;
  v47 = (void (**)(id, uint64_t, id, id, CKGroupRecipientSelectionController *))a7;
  v48 = [(CKGroupRecipientSelectionController *)self _orderedMutableGroupServices];
  if (IMOSLoggingEnabled())
  {
    objc_super v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v48;
      _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Ranked service names for details view add resolution: %@", buf, 0xCu);
    }
  }
  char v58 = 0;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v12;
  uint64_t v15 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v55;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v55 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        id v19 = [(CKRecipientSelectionController *)self expandedRecipientAvailabilities];
        long long v20 = [v18 ID];
        id v21 = [v20 IDSFormattedDestinationID];
        id v22 = [v13 sendingService];
        objc_super v23 = [v22 name];
        id v24 = (id)[v19 reachabilityForRecipient:v21 service:v23 isFinal:&v58];

        if (!v58)
        {

          goto LABEL_37;
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  uint64_t v25 = [(CKRecipientSelectionController *)self conversation];
  int v26 = [v25 supportsMutatingGroupMembers];

  if (!v26) {
    goto LABEL_36;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v27 = v48;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v50 objects:v63 count:16];
  if (!v28)
  {
LABEL_26:

LABEL_36:
    v47[2](v47, 1, obj, v46, self);
    goto LABEL_37;
  }
  uint64_t v30 = *(void *)v51;
  *(void *)&long long v29 = 138412546;
  long long v44 = v29;
LABEL_16:
  uint64_t v31 = 0;
  while (1)
  {
    if (*(void *)v51 != v30) {
      objc_enumerationMutation(v27);
    }
    uint64_t v32 = *(void **)(*((void *)&v50 + 1) + 8 * v31);
    BOOL v33 = -[CKGroupRecipientSelectionController hasInvalidRecipientsForService:](self, "hasInvalidRecipientsForService:", v32, v44);
    if (IMOSLoggingEnabled())
    {
      long long v34 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v44;
        v60 = v32;
        __int16 v61 = 1024;
        LODWORD(v62) = v33;
        _os_log_impl(&dword_18EF18000, v34, OS_LOG_TYPE_INFO, "hasInvalidRecipientsForService: %@, %d", buf, 0x12u);
      }
    }
    if (!v33) {
      break;
    }
    if (v28 == ++v31)
    {
      uint64_t v28 = [v27 countByEnumeratingWithState:&v50 objects:v63 count:16];
      if (v28) {
        goto LABEL_16;
      }
      goto LABEL_26;
    }
  }
  id v35 = v32;

  if (!v35) {
    goto LABEL_36;
  }
  long long v36 = [(CKRecipientSelectionController *)self conversation];
  [v36 addRecipientHandles:obj];

  long long v37 = [(CKRecipientSelectionController *)self conversation];
  id v38 = [v37 sendingService];
  BOOL v39 = v35 == v38;

  if (!v39)
  {
    if (IMOSLoggingEnabled())
    {
      v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        v41 = [(CKRecipientSelectionController *)self conversation];
        v42 = [v41 sendingService];
        *(_DWORD *)buf = v44;
        v60 = v42;
        __int16 v61 = 2112;
        id v62 = v35;
        _os_log_impl(&dword_18EF18000, v40, OS_LOG_TYPE_INFO, "Current service %@, new participant(s) supported service %@. Refreshing service for sending...", buf, 0x16u);
      }
    }
    v43 = [(CKRecipientSelectionController *)self conversation];
    [v43 refreshServiceForSending];
  }
  [(CKGroupRecipientSelectionController *)self handleCancelAction:v45 completion:v47];

LABEL_37:
}

- (BOOL)hasInvalidRecipientsForService:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v4 = [(CKRecipientSelectionController *)self recipients];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v48;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v48 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v47 + 1) + 8 * i) IDSCanonicalAddress];
        id v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
        int v10 = [v9 isLazuliEnabled];

        if (v10)
        {
          int v11 = [(CKRecipientSelectionController *)self expandedRecipientAvailabilities];
          id v12 = [v42 name];
          uint64_t v13 = [v11 idStatusForRecipient:v8 service:v12];
        }
        else
        {
          int v11 = [(CKRecipientSelectionController *)self recipientAvailabilities];
          id v12 = [v11 objectForKeyedSubscript:v8];
          uint64_t v13 = [v12 integerValue];
        }
        uint64_t v14 = v13;

        if (v14 != 1)
        {

          BOOL v38 = 1;
          goto LABEL_34;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v47 objects:v56 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v16 = [v15 isLazuliEnabled];

  if (v16)
  {
    id v17 = [v42 name];
    id v18 = [MEMORY[0x1E4F6BDC0] iMessageService];
    id v19 = [v18 name];
    int v20 = [v17 isEqualToString:v19];

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v21 = [(CKRecipientSelectionController *)self conversation];
    id v22 = [v21 chat];
    objc_super v23 = [v22 participants];

    uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v55 count:16];
    if (v24)
    {
      char v41 = 0;
      uint64_t v26 = *(void *)v44;
      *(void *)&long long v25 = 138412546;
      long long v40 = v25;
      while (2)
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v44 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void **)(*((void *)&v43 + 1) + 8 * j);
          long long v29 = objc_msgSend(v28, "ID", v40);
          uint64_t v30 = IMChatCanonicalIDSIDsForAddress();

          if (v20)
          {
            uint64_t v31 = [v28 ID];
            char v32 = [v31 _appearsToBeEmail];

            if (v32)
            {

              goto LABEL_31;
            }
          }
          BOOL v33 = [(CKRecipientSelectionController *)self expandedRecipientAvailabilities];
          long long v34 = [v42 name];
          uint64_t v35 = [v33 idStatusForRecipient:v30 service:v34];

          if (v35 != 1)
          {
            if (IMOSLoggingEnabled())
            {
              long long v36 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                long long v37 = [v42 name];
                *(_DWORD *)buf = v40;
                long long v52 = v30;
                __int16 v53 = 2112;
                long long v54 = v37;
                _os_log_impl(&dword_18EF18000, v36, OS_LOG_TYPE_INFO, "Existing handle %@ was not reachable on service %@, cannot add.", buf, 0x16u);
              }
            }
            char v41 = 1;
          }
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v55 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }
    else
    {
      char v41 = 0;
    }

    BOOL v38 = v41 & 1;
  }
  else
  {
LABEL_31:
    BOOL v38 = 0;
  }
LABEL_34:

  return v38;
}

- (id)_serviceForRecipientPresentationOptions
{
  id v3 = [(CKRecipientSelectionController *)self conversation];
  id v4 = [v3 sendingService];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CKGroupRecipientSelectionController;
    id v6 = [(CKRecipientSelectionController *)&v9 _serviceForRecipientPresentationOptions];
  }
  uint64_t v7 = v6;

  return v7;
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end