@interface CNContactPickerViewController
+ (id)descriptorForRequiredKeysForSuggestions;
- (BOOL)_isDelayingPresentation;
- (BOOL)_shouldBeOutOfProcess;
- (BOOL)allowsCancel;
- (BOOL)allowsDeletion;
- (BOOL)allowsDone;
- (BOOL)allowsEditing;
- (BOOL)allowsNamePicking;
- (BOOL)autocloses;
- (BOOL)hasPickerPrivacyUI;
- (BOOL)hidesPromptInLandscape;
- (BOOL)hidesSearchableSources;
- (BOOL)ignoresParentalRestrictions;
- (BOOL)isDefaultViewControllerVisible;
- (BOOL)onlyRealContacts;
- (BOOL)shouldAllowSearchForMultiSelect;
- (BOOL)shouldDisplayAddNewContactRow;
- (BOOL)shouldDisplaySuggestionsController;
- (CNContact)scrollContact;
- (CNContactPickerContentViewController)viewController;
- (CNContactPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CNContainer)parentContainer;
- (CNRegulatoryLogger)regulatoryLogger;
- (FAFamilyMember)familyMember;
- (NSArray)contactSuggestions;
- (NSArray)displayedPropertyKeys;
- (NSArray)prohibitedPropertyKeys;
- (NSArray)suggestionsIgnoredContactIdentifiers;
- (NSArray)suggestionsInteractionDomains;
- (NSPredicate)predicateForEnablingContact;
- (NSPredicate)predicateForSelectionOfContact;
- (NSPredicate)predicateForSelectionOfProperty;
- (NSSet)limitedAccessContactSelection;
- (NSString)bannerTitle;
- (NSString)bannerValue;
- (NSString)limitedAccessAppBundleId;
- (NSString)limitedAccessAppName;
- (NSString)limitedAccessSearchQuery;
- (NSString)prompt;
- (NSString)targetGroupIdentifier;
- (UIBarButtonItem)addContactBarButtonItem;
- (UINavigationController)navigationController;
- (_UIRemoteViewController)_containedRemoteViewController;
- (id)_pickerPresentedViewController;
- (id)delegate;
- (int)limitedAccessPickerType;
- (int64_t)behavior;
- (int64_t)cardActions;
- (int64_t)mode;
- (unint64_t)limitedAccessCaption;
- (void)_checkConsistencyFromOptions:(id)a3;
- (void)_emitPickerAnalyticsDidSelectItems:(BOOL)a3;
- (void)_endDelayingPresentation;
- (void)_prepareViewController;
- (void)_setViewController:(id)a3;
- (void)_setupViewController;
- (void)closePickerIfNeeded;
- (void)contactListViewControllerShouldEditLimitedAccessSelection:(id)a3;
- (void)dealloc;
- (void)didUpdateLimitedAccessSelection:(id)a3 contactListViewController:(id)a4;
- (void)invalidateSelectionAnimated:(BOOL)a3;
- (void)loadView;
- (void)notifyDelegateForCancellation;
- (void)pickerDidCancel;
- (void)pickerDidCompleteWithNewContact:(id)a3;
- (void)pickerDidGoBack;
- (void)pickerDidSelectAddNewContact;
- (void)pickerDidSelectContact:(id)a3 property:(id)a4;
- (void)pickerDidSelectContacts:(id)a3 properties:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)scrollToClosestContactMatching:(id)a3;
- (void)setAllowsCancel:(BOOL)a3;
- (void)setAllowsDeletion:(BOOL)a3;
- (void)setAllowsDone:(BOOL)a3;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setAllowsNamePicking:(BOOL)a3;
- (void)setAutocloses:(BOOL)a3;
- (void)setBannerTitle:(id)a3;
- (void)setBannerValue:(id)a3;
- (void)setBehavior:(int64_t)a3;
- (void)setCardActions:(int64_t)a3;
- (void)setContactSuggestions:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setDisplayedPropertyKeys:(NSArray *)displayedPropertyKeys;
- (void)setFamilyMember:(id)a3;
- (void)setHasPickerPrivacyUI:(BOOL)a3;
- (void)setHidesPromptInLandscape:(BOOL)a3;
- (void)setHidesSearchableSources:(BOOL)a3;
- (void)setIgnoresParentalRestrictions:(BOOL)a3;
- (void)setLimitedAccessAppBundleId:(id)a3;
- (void)setLimitedAccessAppName:(id)a3;
- (void)setLimitedAccessCaption:(unint64_t)a3;
- (void)setLimitedAccessContactSelection:(id)a3;
- (void)setLimitedAccessPickerType:(int)a3;
- (void)setLimitedAccessSearchQuery:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setOnlyRealContacts:(BOOL)a3;
- (void)setParentContainer:(id)a3;
- (void)setPredicateForEnablingContact:(NSPredicate *)predicateForEnablingContact;
- (void)setPredicateForSelectionOfContact:(NSPredicate *)predicateForSelectionOfContact;
- (void)setPredicateForSelectionOfProperty:(NSPredicate *)predicateForSelectionOfProperty;
- (void)setProhibitedPropertyKeys:(id)a3;
- (void)setPrompt:(id)a3;
- (void)setRegulatoryLogger:(id)a3;
- (void)setScrollContact:(id)a3;
- (void)setShouldAllowSearchForMultiSelect:(BOOL)a3;
- (void)setShouldDisplayAddNewContactRow:(BOOL)a3;
- (void)setShouldDisplaySuggestionsController:(BOOL)a3;
- (void)setSuggestionsIgnoredContactIdentifiers:(id)a3;
- (void)setSuggestionsInteractionDomains:(id)a3;
- (void)setTargetGroupIdentifier:(id)a3;
- (void)setViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation CNContactPickerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactSuggestions, 0);
  objc_storeStrong((id *)&self->_suggestionsInteractionDomains, 0);
  objc_storeStrong((id *)&self->_suggestionsIgnoredContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_bannerValue, 0);
  objc_storeStrong((id *)&self->_bannerTitle, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_targetGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_limitedAccessSearchQuery, 0);
  objc_storeStrong((id *)&self->_limitedAccessAppBundleId, 0);
  objc_storeStrong((id *)&self->_limitedAccessAppName, 0);
  objc_storeStrong((id *)&self->_limitedAccessContactSelection, 0);
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_parentContainer, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_regulatoryLogger, 0);
  objc_storeStrong((id *)&self->_scrollContact, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_predicateForSelectionOfProperty, 0);
  objc_storeStrong((id *)&self->_predicateForSelectionOfContact, 0);
  objc_storeStrong((id *)&self->_predicateForEnablingContact, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_displayedPropertyKeys, 0);
}

- (void)setAutocloses:(BOOL)a3
{
  self->_autocloses = a3;
}

- (BOOL)autocloses
{
  return self->_autocloses;
}

- (BOOL)isDefaultViewControllerVisible
{
  return self->_defaultViewControllerVisible;
}

- (void)setContactSuggestions:(id)a3
{
}

- (NSArray)contactSuggestions
{
  return self->_contactSuggestions;
}

- (void)setSuggestionsInteractionDomains:(id)a3
{
}

- (NSArray)suggestionsInteractionDomains
{
  return self->_suggestionsInteractionDomains;
}

- (void)setSuggestionsIgnoredContactIdentifiers:(id)a3
{
}

- (NSArray)suggestionsIgnoredContactIdentifiers
{
  return self->_suggestionsIgnoredContactIdentifiers;
}

- (void)setShouldDisplaySuggestionsController:(BOOL)a3
{
  self->_shouldDisplaySuggestionsController = a3;
}

- (BOOL)shouldDisplaySuggestionsController
{
  return self->_shouldDisplaySuggestionsController;
}

- (void)setBannerValue:(id)a3
{
}

- (NSString)bannerValue
{
  return self->_bannerValue;
}

- (void)setBannerTitle:(id)a3
{
}

- (NSString)bannerTitle
{
  return self->_bannerTitle;
}

- (void)setHidesPromptInLandscape:(BOOL)a3
{
  self->_hidesPromptInLandscape = a3;
}

- (BOOL)hidesPromptInLandscape
{
  return self->_hidesPromptInLandscape;
}

- (void)setPrompt:(id)a3
{
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setTargetGroupIdentifier:(id)a3
{
}

- (NSString)targetGroupIdentifier
{
  return self->_targetGroupIdentifier;
}

- (void)setShouldDisplayAddNewContactRow:(BOOL)a3
{
  self->_shouldDisplayAddNewContactRow = a3;
}

- (BOOL)shouldDisplayAddNewContactRow
{
  return self->_shouldDisplayAddNewContactRow;
}

- (void)setLimitedAccessCaption:(unint64_t)a3
{
  self->_limitedAccessCaption = a3;
}

- (unint64_t)limitedAccessCaption
{
  return self->_limitedAccessCaption;
}

- (void)setLimitedAccessSearchQuery:(id)a3
{
}

- (NSString)limitedAccessSearchQuery
{
  return self->_limitedAccessSearchQuery;
}

- (void)setHasPickerPrivacyUI:(BOOL)a3
{
  self->_hasPickerPrivacyUI = a3;
}

- (BOOL)hasPickerPrivacyUI
{
  return self->_hasPickerPrivacyUI;
}

- (void)setLimitedAccessAppBundleId:(id)a3
{
}

- (NSString)limitedAccessAppBundleId
{
  return self->_limitedAccessAppBundleId;
}

- (void)setLimitedAccessAppName:(id)a3
{
}

- (NSString)limitedAccessAppName
{
  return self->_limitedAccessAppName;
}

- (void)setLimitedAccessPickerType:(int)a3
{
  self->_limitedAccessPickerType = a3;
}

- (int)limitedAccessPickerType
{
  return self->_limitedAccessPickerType;
}

- (void)setLimitedAccessContactSelection:(id)a3
{
}

- (NSSet)limitedAccessContactSelection
{
  return self->_limitedAccessContactSelection;
}

- (void)setAllowsNamePicking:(BOOL)a3
{
  self->_allowsNamePicking = a3;
}

- (BOOL)allowsNamePicking
{
  return self->_allowsNamePicking;
}

- (void)setShouldAllowSearchForMultiSelect:(BOOL)a3
{
  self->_shouldAllowSearchForMultiSelect = a3;
}

- (BOOL)shouldAllowSearchForMultiSelect
{
  return self->_shouldAllowSearchForMultiSelect;
}

- (void)setAllowsDeletion:(BOOL)a3
{
  self->_allowsDeletion = a3;
}

- (BOOL)allowsDeletion
{
  return self->_allowsDeletion;
}

- (void)setAllowsDone:(BOOL)a3
{
  self->_allowsDone = a3;
}

- (BOOL)allowsDone
{
  return self->_allowsDone;
}

- (void)setAllowsCancel:(BOOL)a3
{
  self->_allowsCancel = a3;
}

- (BOOL)allowsCancel
{
  return self->_allowsCancel;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (void)setProhibitedPropertyKeys:(id)a3
{
}

- (NSArray)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (void)setIgnoresParentalRestrictions:(BOOL)a3
{
  self->_ignoresParentalRestrictions = a3;
}

- (BOOL)ignoresParentalRestrictions
{
  return self->_ignoresParentalRestrictions;
}

- (void)setOnlyRealContacts:(BOOL)a3
{
  self->_onlyRealContacts = a3;
}

- (BOOL)onlyRealContacts
{
  return self->_onlyRealContacts;
}

- (void)setHidesSearchableSources:(BOOL)a3
{
  self->_hidesSearchableSources = a3;
}

- (BOOL)hidesSearchableSources
{
  return self->_hidesSearchableSources;
}

- (void)setCardActions:(int64_t)a3
{
  self->_cardActions = a3;
}

- (int64_t)cardActions
{
  return self->_cardActions;
}

- (void)setBehavior:(int64_t)a3
{
  self->_behavior = a3;
}

- (int64_t)behavior
{
  return self->_behavior;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setParentContainer:(id)a3
{
}

- (CNContainer)parentContainer
{
  return self->_parentContainer;
}

- (void)setFamilyMember:(id)a3
{
}

- (FAFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)setRegulatoryLogger:(id)a3
{
}

- (CNRegulatoryLogger)regulatoryLogger
{
  return self->_regulatoryLogger;
}

- (void)setScrollContact:(id)a3
{
}

- (CNContact)scrollContact
{
  return self->_scrollContact;
}

- (void)setViewController:(id)a3
{
}

- (CNContactPickerContentViewController)viewController
{
  return self->_viewController;
}

- (void)setPredicateForSelectionOfProperty:(NSPredicate *)predicateForSelectionOfProperty
{
}

- (NSPredicate)predicateForSelectionOfProperty
{
  return self->_predicateForSelectionOfProperty;
}

- (void)setPredicateForSelectionOfContact:(NSPredicate *)predicateForSelectionOfContact
{
}

- (NSPredicate)predicateForSelectionOfContact
{
  return self->_predicateForSelectionOfContact;
}

- (void)setPredicateForEnablingContact:(NSPredicate *)predicateForEnablingContact
{
}

- (NSPredicate)predicateForEnablingContact
{
  return self->_predicateForEnablingContact;
}

- (void)setDelegate:(id)delegate
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDisplayedPropertyKeys:(NSArray *)displayedPropertyKeys
{
}

- (NSArray)displayedPropertyKeys
{
  return self->_displayedPropertyKeys;
}

- (void)_emitPickerAnalyticsDidSelectItems:(BOOL)a3
{
}

id __68__CNContactPickerViewController__emitPickerAnalyticsDidSelectItems___block_invoke(uint64_t a1)
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v11[0] = @"didSelectItems";
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v12[0] = v2;
  v11[1] = @"outOfProcess";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "_shouldBeOutOfProcess"));
  v12[1] = v3;
  v11[2] = @"callerBundleID";
  v4 = [*(id *)(a1 + 32) nibBundle];
  uint64_t v5 = [v4 bundleIdentifier];
  v6 = (void *)v5;
  v7 = @"Unknown";
  if (v5) {
    v7 = (__CFString *)v5;
  }
  v12[2] = v7;
  v11[3] = @"entityIsAuthorized";
  v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(MEMORY[0x1E4F1B980], "authorizationStatusForEntityType:", 0) == 3);
  v12[3] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v9;
}

- (void)contactListViewControllerShouldEditLimitedAccessSelection:(id)a3
{
  id v7 = a3;
  v4 = [(CNContactPickerViewController *)self delegate];
  if ([v4 conformsToProtocol:&unk_1ED98DA50]) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  if (objc_opt_respondsToSelector()) {
    [v6 contactListViewControllerShouldEditLimitedAccessSelection:v7];
  }
}

- (void)didUpdateLimitedAccessSelection:(id)a3 contactListViewController:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(CNContactPickerViewController *)self delegate];
  if ([v7 conformsToProtocol:&unk_1ED98DA50]) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  if (objc_opt_respondsToSelector()) {
    [v9 contactListViewController:v6 didUpdateLimitedAccessSelection:v10];
  }
}

- (void)pickerDidGoBack
{
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 433, 7, @"picker did go back", v2, v3, v4, v5, v9);
  id v7 = [(CNContactPickerViewController *)self delegate];
  if ([v7 conformsToProtocol:&unk_1ED98DA50]) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v10 = v8;

  if (objc_opt_respondsToSelector()) {
    [v10 contactPickerDidGoBack:self];
  }
  [(CNContactPickerViewController *)self closePickerIfNeeded];
}

- (void)pickerDidCancel
{
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 424, 7, @"picker did cancel", v2, v3, v4, v5, v7);
  [(CNContactPickerViewController *)self _emitPickerAnalyticsDidSelectItems:0];
  [(CNContactPickerViewController *)self notifyDelegateForCancellation];

  [(CNContactPickerViewController *)self closePickerIfNeeded];
}

- (void)pickerDidCompleteWithNewContact:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 406, 7, @"picker did finish with new contact: %@", v5, v6, v7, v8, (uint64_t)v4);
  [(CNContactPickerViewController *)self _emitPickerAnalyticsDidSelectItems:1];
  uint64_t v9 = [(CNContactPickerViewController *)self delegate];
  if ([v9 conformsToProtocol:&unk_1ED98DA50]) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v12 = [(CNContactPickerViewController *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    v14 = [(CNContactPickerViewController *)self delegate];
    v15 = v14;
    if (v13)
    {
      [v14 contactPicker:self didSelectContact:v4];
    }
    else
    {
      char v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) == 0) {
        goto LABEL_14;
      }
      if (v4)
      {
        v18[0] = v4;
        v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      }
      else
      {
        v15 = (void *)MEMORY[0x1E4F1CBF0];
      }
      v17 = [(CNContactPickerViewController *)self delegate];
      [v17 contactPicker:self didSelectContacts:v15];
    }
    goto LABEL_14;
  }
  [v11 contactPicker:self didCompleteWithNewContact:v4];
LABEL_14:
  [(CNContactPickerViewController *)self closePickerIfNeeded];
}

- (void)pickerDidSelectContacts:(id)a3 properties:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 384, 7, @"picker did select contacts: %@, properties: %@", v7, v8, v9, v10, (uint64_t)v18);
  [(CNContactPickerViewController *)self _emitPickerAnalyticsDidSelectItems:1];
  if (v6
    || ([(CNContactPickerViewController *)self delegate],
        id v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = objc_opt_respondsToSelector(),
        v11,
        (v12 & 1) == 0))
  {
    v15 = [(CNContactPickerViewController *)self delegate];
    char v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) == 0) {
      goto LABEL_7;
    }
    v17 = [(CNContactPickerViewController *)self regulatoryLogger];
    [v17 receivingContactsDataFromOOPContactPicker];

    v14 = [(CNContactPickerViewController *)self delegate];
    [v14 contactPicker:self didSelectContactProperties:v6];
  }
  else
  {
    char v13 = [(CNContactPickerViewController *)self regulatoryLogger];
    [v13 receivingContactsDataFromOOPContactPicker];

    v14 = [(CNContactPickerViewController *)self delegate];
    [v14 contactPicker:self didSelectContacts:v18];
  }

LABEL_7:
  [(CNContactPickerViewController *)self closePickerIfNeeded];
}

- (void)pickerDidSelectContact:(id)a3 property:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 364, 7, @"picker did select contact %@, property %@", v7, v8, v9, v10, (uint64_t)v17);
  [(CNContactPickerViewController *)self _emitPickerAnalyticsDidSelectItems:1];
  id v11 = [(CNContactPickerViewController *)self delegate];
  if (v6)
  {
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0) {
      goto LABEL_7;
    }
    char v13 = [(CNContactPickerViewController *)self regulatoryLogger];
    [v13 receivingContactsDataFromOOPContactPicker];

    v14 = [(CNContactPickerViewController *)self delegate];
    [v14 contactPicker:self didSelectContactProperty:v6];
  }
  else
  {
    char v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) == 0) {
      goto LABEL_7;
    }
    char v16 = [(CNContactPickerViewController *)self regulatoryLogger];
    [v16 receivingContactsDataFromOOPContactPicker];

    v14 = [(CNContactPickerViewController *)self delegate];
    [v14 contactPicker:self didSelectContact:v17];
  }

LABEL_7:
  [(CNContactPickerViewController *)self closePickerIfNeeded];
}

- (void)pickerDidSelectAddNewContact
{
  uint64_t v3 = [(CNContactPickerViewController *)self delegate];
  if ([v3 conformsToProtocol:&unk_1ED98DA50]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v6 = v4;

  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(CNContactPickerViewController *)self regulatoryLogger];
    [v5 receivingContactsDataFromOOPContactPicker];

    [v6 pickerDidSelectAddNewContact:self];
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 345, 7, @"picker did cancel by dismiss", v3, v4, v5, v6, v8);
  [(CNContactPickerViewController *)self _emitPickerAnalyticsDidSelectItems:0];

  [(CNContactPickerViewController *)self notifyDelegateForCancellation];
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  objc_opt_class();
  uint64_t v3 = [(CNContactPickerViewController *)self viewController];
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return (_UIRemoteViewController *)v5;
}

- (UIBarButtonItem)addContactBarButtonItem
{
  uint64_t v2 = [(CNContactPickerViewController *)self viewController];
  uint64_t v3 = [v2 addContactBarButtonItem];

  return (UIBarButtonItem *)v3;
}

- (UINavigationController)navigationController
{
  uint64_t v2 = [(CNContactPickerViewController *)self viewController];
  uint64_t v3 = [v2 navigationController];

  return (UINavigationController *)v3;
}

- (void)notifyDelegateForCancellation
{
  uint64_t v3 = [(CNContactPickerViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CNContactPickerViewController *)self delegate];
    [v5 contactPickerDidCancel:self];
  }
}

- (void)closePickerIfNeeded
{
  if ([(CNContactPickerViewController *)self autocloses])
  {
    id v3 = [(CNContactPickerViewController *)self _pickerPresentedViewController];
    if (([v3 isBeingDismissed] & 1) == 0) {
      [v3 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (void)_prepareViewController
{
  id v3 = [(CNContactPickerViewController *)self _pickerPresentedViewController];
  [v3 _beginDelayingPresentation:&__block_literal_global_57 cancellationHandler:10.0];

  char v4 = [(CNContactPickerViewController *)self viewController];

  if (v4)
  {
    [(CNContactPickerViewController *)self _setupViewController];
  }
  else if ([(CNContactPickerViewController *)self _shouldBeOutOfProcess])
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F5A4D8]) initWithAuditToken:0 assumedIdentity:0];
    [(CNContactPickerViewController *)self setRegulatoryLogger:v5];

    uint64_t v6 = [(CNContactPickerViewController *)self regulatoryLogger];
    [v6 displayingOOPContactPicker];

    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x3042000000;
    v9[3] = __Block_byref_object_copy__3938;
    v9[4] = __Block_byref_object_dispose__3939;
    objc_initWeak(&v10, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__CNContactPickerViewController__prepareViewController__block_invoke_69;
    v8[3] = &unk_1E5496DC8;
    v8[4] = v9;
    +[CNContactPickerHostViewController getViewController:v8];
    _Block_object_dispose(v9, 8);
    objc_destroyWeak(&v10);
  }
  else
  {
    uint64_t v7 = objc_alloc_init(CNContactPickerContentViewController);
    [(CNContactPickerViewController *)self _setViewController:v7];
  }
}

void __55__CNContactPickerViewController__prepareViewController__block_invoke_69(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setViewController:v3];
}

uint64_t __55__CNContactPickerViewController__prepareViewController__block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = @"NO";
  if (a2) {
    uint64_t v8 = @"YES";
  }
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 277, 3, @"Contact picker delayed appearance timed out - %@", a5, a6, a7, a8, (uint64_t)v8);
  return 1;
}

- (BOOL)_shouldBeOutOfProcess
{
  uint64_t v3 = [MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0];
  return [(CNContactPickerViewController *)self mode] != 2 || v3 != 3;
}

- (void)_setupViewController
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char v4 = NSNumber;
  id v5 = [(CNContactPickerViewController *)self delegate];
  uint64_t v6 = [v4 numberWithBool:objc_opt_respondsToSelector() & 1];
  [v3 setObject:v6 forKeyedSubscript:@"ClientWantsSingleContact"];

  uint64_t v7 = NSNumber;
  uint64_t v8 = [(CNContactPickerViewController *)self delegate];
  uint64_t v9 = [v7 numberWithBool:objc_opt_respondsToSelector() & 1];
  [v3 setObject:v9 forKeyedSubscript:@"ClientWantsSingleProperty"];

  id v10 = NSNumber;
  id v11 = [(CNContactPickerViewController *)self delegate];
  BOOL v12 = (objc_opt_respondsToSelector() & 1) != 0
     && [(CNContactPickerViewController *)self limitedAccessPickerType] != 5;
  char v13 = [v10 numberWithInt:v12];
  [v3 setObject:v13 forKeyedSubscript:@"ClientWantsMultipleContacts"];

  v14 = NSNumber;
  char v15 = [(CNContactPickerViewController *)self delegate];
  char v16 = [v14 numberWithBool:objc_opt_respondsToSelector() & 1];
  [v3 setObject:v16 forKeyedSubscript:@"ClientWantsMultipleProperties"];

  id v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(MEMORY[0x1E4F1B980], "authorizationStatusForEntityType:", 0) == 3);
  [v3 setObject:v17 forKeyedSubscript:@"ClientHasContactsAccess"];

  id v18 = [(CNContactPickerViewController *)self familyMember];
  [v3 setObject:v18 forKeyedSubscript:@"familyMember"];

  v19 = [(CNContactPickerViewController *)self parentContainer];
  [v3 setObject:v19 forKeyedSubscript:@"parentContainer"];

  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactPickerViewController allowsDeletion](self, "allowsDeletion"));
  [v3 setObject:v20 forKeyedSubscript:@"allowsDeletion"];

  v21 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactPickerViewController shouldAllowSearchForMultiSelect](self, "shouldAllowSearchForMultiSelect"));
  [v3 setObject:v21 forKeyedSubscript:@"allowsSearchForMultiSelect"];

  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactPickerViewController allowsNamePicking](self, "allowsNamePicking"));
  [v3 setObject:v22 forKeyedSubscript:@"allowsNamePicking"];

  v23 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactPickerViewController shouldDisplaySuggestionsController](self, "shouldDisplaySuggestionsController"));
  [v3 setObject:v23 forKeyedSubscript:@"shouldDisplaySuggestionsController"];

  v24 = [(CNContactPickerViewController *)self suggestionsIgnoredContactIdentifiers];
  [v3 setObject:v24 forKeyedSubscript:@"suggestionsIgnoredContactIdentifiers"];

  v25 = [(CNContactPickerViewController *)self suggestionsInteractionDomains];
  [v3 setObject:v25 forKeyedSubscript:@"suggestionsInteractionDomains"];

  v26 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactPickerViewController shouldDisplayAddNewContactRow](self, "shouldDisplayAddNewContactRow"));
  [v3 setObject:v26 forKeyedSubscript:@"shouldDisplayAddNewContactRow"];

  v27 = [(CNContactPickerViewController *)self targetGroupIdentifier];
  [v3 setObject:v27 forKeyedSubscript:@"targetGroupIdentifier"];

  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"shouldHideDuplicates"];
  v28 = NSNumber;
  v29 = [(CNContactPickerViewController *)self traitCollection];
  v30 = objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v29, "userInterfaceIdiom"));
  [v3 setObject:v30 forKeyedSubscript:@"hostIdiom"];

  v31 = [(CNContactPickerViewController *)self limitedAccessContactSelection];
  [v3 setObject:v31 forKeyedSubscript:@"limitedAccessContactSelection"];

  v32 = objc_msgSend(NSNumber, "numberWithInt:", -[CNContactPickerViewController limitedAccessPickerType](self, "limitedAccessPickerType"));
  [v3 setObject:v32 forKeyedSubscript:@"limitedAccessPickerType"];

  v33 = [(CNContactPickerViewController *)self limitedAccessAppName];
  [v3 setObject:v33 forKeyedSubscript:@"limitedAccessAppName"];

  v34 = [(CNContactPickerViewController *)self limitedAccessAppBundleId];
  if (v34)
  {
    v35 = [(CNContactPickerViewController *)self limitedAccessAppBundleId];
    [v3 setObject:v35 forKeyedSubscript:@"limitedAccessAppBundleId"];
  }
  else
  {
    v35 = [(CNContactPickerViewController *)self nibBundle];
    v36 = [v35 bundleIdentifier];
    [v3 setObject:v36 forKeyedSubscript:@"limitedAccessAppBundleId"];
  }
  v37 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactPickerViewController hasPickerPrivacyUI](self, "hasPickerPrivacyUI"));
  [v3 setObject:v37 forKeyedSubscript:@"hasPickerPrivacyUI"];

  v38 = [(CNContactPickerViewController *)self limitedAccessSearchQuery];
  [v3 setObject:v38 forKeyedSubscript:@"limitedAccessSearchQuery"];

  v39 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CNContactPickerViewController limitedAccessCaption](self, "limitedAccessCaption"));
  [v3 setObject:v39 forKeyedSubscript:@"limitedAccessContactCaption"];

  if ([(CNContactPickerViewController *)self shouldDisplaySuggestionsController])
  {
    v40 = [(CNContactPickerViewController *)self contactSuggestions];

    if (v40)
    {
      v41 = [(CNContactPickerViewController *)self contactSuggestions];
      [v3 setObject:v41 forKeyedSubscript:@"suggestedContacts"];
    }
  }
  v42 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v43 = [v42 entitlementVerifier];
  int v44 = [v43 currentProcessHasBooleanEntitlement:*MEMORY[0x1E4F5A220] error:0];

  if (v44)
  {
    v45 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactPickerViewController ignoresParentalRestrictions](self, "ignoresParentalRestrictions"));
    [v3 setObject:v45 forKeyedSubscript:@"ignoresParentalRestrictions"];
  }
  v46 = [(CNContactPickerViewController *)self prohibitedPropertyKeys];
  [v3 setObject:v46 forKeyedSubscript:@"prohibitedPropertyKeys"];

  v47 = [(CNContactPickerViewController *)self scrollContact];

  if (v47)
  {
    v48 = [(CNContactPickerViewController *)self scrollContact];
    [v3 setObject:v48 forKeyedSubscript:@"ScrollContact"];
  }
  [(CNContactPickerViewController *)self _checkConsistencyFromOptions:v3];
  v49 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v50 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"predicateForEnablingContact", @"predicateForSelectionOfContact", @"predicateForSelectionOfProperty", @"displayedPropertyKeys", @"cardActions", @"hidesSearchableSources", @"onlyRealContacts", @"allowsEditing", @"allowsCancel", @"allowsDone", @"allowsNamePicking", @"prompt", @"hidesPromptInLandscape", @"bannerTitle", @"bannerValue", 0);
  uint64_t v51 = [v50 countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(void *)v60 != v53) {
          objc_enumerationMutation(v50);
        }
        uint64_t v55 = *(void *)(*((void *)&v59 + 1) + 8 * i);
        v56 = [(CNContactPickerViewController *)self valueForKey:v55];
        if (v56) {
          [v49 setObject:v56 forKeyedSubscript:v55];
        }
      }
      uint64_t v52 = [v50 countByEnumeratingWithState:&v59 objects:v63 count:16];
    }
    while (v52);
  }

  [v3 setObject:v49 forKeyedSubscript:@"Properties"];
  v57 = [(CNContactPickerViewController *)self viewController];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __53__CNContactPickerViewController__setupViewController__block_invoke;
  v58[3] = &unk_1E5499BC8;
  v58[4] = self;
  [v57 setupWithOptions:v3 readyBlock:v58];
}

void __53__CNContactPickerViewController__setupViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__CNContactPickerViewController__setupViewController__block_invoke_2;
  v5[3] = &unk_1E549BF80;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __53__CNContactPickerViewController__setupViewController__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _pickerPresentedViewController];
  [v2 _endDelayingPresentation];

  objc_msgSend(*(id *)(a1 + 32), "cnui_appropriatePresentationController");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v8 delegate];

  if (!v3) {
    [v8 setDelegate:*(void *)(a1 + 32)];
  }
  if (*(void *)(a1 + 40)) {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 262, 3, @"Error when showing picker: %@", v4, v5, v6, v7, *(void *)(a1 + 40));
  }
}

- (void)_setViewController:(id)a3
{
  id v4 = a3;
  [v4 setDelegate:self];
  [(CNContactPickerViewController *)self setViewController:v4];
  [(UIViewController *)self cnui_addChildViewController:v4];

  [(CNContactPickerViewController *)self _setupViewController];
}

- (void)_endDelayingPresentation
{
  self->_ignoreViewWillBePresented = 1;
  v3.receiver = self;
  v3.super_class = (Class)CNContactPickerViewController;
  [(CNContactPickerViewController *)&v3 _endDelayingPresentation];
  self->_ignoreViewWillBePresented = 0;
}

- (BOOL)_isDelayingPresentation
{
  v5.receiver = self;
  v5.super_class = (Class)CNContactPickerViewController;
  if ([(CNContactPickerViewController *)&v5 _isDelayingPresentation]) {
    return 1;
  }
  if (!self->_ignoreViewWillBePresented && (objc_opt_respondsToSelector() & 1) != 0) {
    [(CNContactPickerViewController *)self _viewWillBePresented];
  }
  v4.receiver = self;
  v4.super_class = (Class)CNContactPickerViewController;
  return [(CNContactPickerViewController *)&v4 _isDelayingPresentation];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactPickerViewController;
  [(CNContactPickerViewController *)&v3 viewDidDisappear:a3];
  if ([(id)*MEMORY[0x1E4FB2608] isPPTAvailable]) {
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_36);
  }
}

void __50__CNContactPickerViewController_viewDidDisappear___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v0 postNotificationName:@"PeoplePickerDidHide" object:0 userInfo:0 deliverImmediately:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactPickerViewController;
  [(CNContactPickerViewController *)&v3 viewDidAppear:a3];
  if ([(id)*MEMORY[0x1E4FB2608] isPPTAvailable]) {
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_3955);
  }
}

void __47__CNContactPickerViewController_viewDidAppear___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v0 postNotificationName:@"PeoplePickerDidShow" object:0 userInfo:0 deliverImmediately:1];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactPickerViewController;
  [(CNContactPickerViewController *)&v3 loadView];
  [(CNContactPickerViewController *)self _viewWillBePresented];
}

- (void)invalidateSelectionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CNContactPickerViewController *)self viewController];
  [v4 invalidateSelectionAnimated:v3];
}

- (void)scrollToClosestContactMatching:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1BA40];
  id v5 = a3;
  id v8 = objc_alloc_init(v4);
  uint64_t v6 = [v5 givenName];
  [v8 setGivenName:v6];

  uint64_t v7 = [v5 familyName];

  [v8 setFamilyName:v7];
  [(CNContactPickerViewController *)self setScrollContact:v8];
}

- (void)_checkConsistencyFromOptions:(id)a3
{
  id v21 = a3;
  id v4 = [v21 objectForKeyedSubscript:@"ClientWantsSingleContact"];
  int v5 = [v4 BOOLValue];

  uint64_t v6 = [v21 objectForKeyedSubscript:@"ClientWantsSingleProperty"];
  int v7 = [v6 BOOLValue];

  id v8 = [v21 objectForKeyedSubscript:@"ClientWantsMultipleContacts"];
  int v9 = [v8 BOOLValue];

  id v10 = [v21 objectForKeyedSubscript:@"ClientWantsMultipleProperties"];
  int v11 = [v10 BOOLValue];

  uint64_t v12 = [(CNContactPickerViewController *)self predicateForSelectionOfContact];

  uint64_t v13 = [(CNContactPickerViewController *)self predicateForSelectionOfProperty];

  v14 = NSStringFromSelector(sel_contactPicker_didSelectContact_);
  v19 = NSStringFromSelector(sel_contactPicker_didSelectContactProperty_);
  if ((v5 | v7) == 1 && v9 | v11)
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 93, 4, @"Both single contact and multiple contacts delegate methods are implemented, the single variants will be ignored", v15, v16, v17, v18, v20);
    [v21 removeObjectForKey:@"ClientWantsSingleContact"];
    [v21 removeObjectForKey:@"ClientWantsSingleProperty"];
  }
  if (((v5 | v7 | v9 | v11) & 1) == 0)
  {
    if (!(v12 | v13)) {
      goto LABEL_14;
    }
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 101, 3, @"Selection predicates are set but the delegate does not implement %@ and %@. Those predicates will be ignored.", v15, v16, v17, v18, (uint64_t)v14);
    [(CNContactPickerViewController *)self setPredicateForSelectionOfContact:0];
    goto LABEL_11;
  }
  if ((v5 | v9 | v11))
  {
    if (((v7 | v11) & 1) == 0 && v13)
    {
      _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 114, 3, @"Property selection predicate is set but the delegate does not implement %@. The predicate will be ignored.", v15, v16, v17, v18, (uint64_t)v19);
LABEL_11:
      [(CNContactPickerViewController *)self setPredicateForSelectionOfProperty:0];
    }
  }
  else if (v12)
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPickerViewController.m", 108, 3, @"Person selection predicate is set but the delegate does not implement %@. The predicate will be ignored.", v15, v16, v17, v18, (uint64_t)v14);
    [(CNContactPickerViewController *)self setPredicateForSelectionOfContact:0];
  }
LABEL_14:
}

- (id)_pickerPresentedViewController
{
  uint64_t v2 = self;
  BOOL v3 = [(CNContactPickerViewController *)v2 delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    int v5 = [(CNContactPickerViewController *)v2 delegate];
    uint64_t v6 = [v5 contactPickerPresentedViewController:v2];

    uint64_t v2 = (CNContactPickerViewController *)v6;
  }

  return v2;
}

- (void)dealloc
{
  BOOL v3 = [(CNContactPickerViewController *)self viewController];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)CNContactPickerViewController;
  [(CNContactPickerViewController *)&v4 dealloc];
}

- (CNContactPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CNContactPickerViewController;
  objc_super v4 = [(CNContactPickerViewController *)&v6 initWithNibName:a3 bundle:a4];
  [(CNContactPickerViewController *)v4 setAllowsCancel:1];
  [(CNContactPickerViewController *)v4 setAutocloses:1];
  [(CNContactPickerViewController *)v4 setCardActions:0];
  return v4;
}

+ (id)descriptorForRequiredKeysForSuggestions
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v5[0] = v2;
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

@end