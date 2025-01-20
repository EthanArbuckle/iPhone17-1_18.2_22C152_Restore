@interface CNContactPickerContentViewController
+ (id)descriptorForContactPropertiesSupportingPredicateEvaluation;
+ (id)log;
- (BOOL)allowsCancel;
- (BOOL)allowsDeletion;
- (BOOL)allowsDone;
- (BOOL)allowsEditing;
- (BOOL)allowsNamePicking;
- (BOOL)allowsSearchForMultiSelect;
- (BOOL)clientHasContactsAccess;
- (BOOL)clientWantsMultipleContacts;
- (BOOL)clientWantsMultipleProperties;
- (BOOL)clientWantsSingleContact;
- (BOOL)clientWantsSingleProperty;
- (BOOL)contactNavigationController:(id)a3 canSelectContact:(id)a4;
- (BOOL)contactNavigationController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5;
- (BOOL)contactNavigationController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4;
- (BOOL)contactNavigationController:(id)a3 shouldSelectContact:(id)a4 atIndexPath:(id)a5;
- (BOOL)contactNavigationController:(id)a3 shouldShowCardForContact:(id)a4;
- (BOOL)contactNavigationControllerShouldAddNewContact:(id)a3;
- (BOOL)contactNavigationControllerShouldDismissSearchOnSelection:(id)a3;
- (BOOL)contactNavigationControllerShouldShowContactsOnKeyCommands:(id)a3;
- (BOOL)contactSuggestionViewController:(id)a3 shouldSelectContact:(id)a4 atIndexPath:(id)a5;
- (BOOL)hasPickerPrivacyUI;
- (BOOL)hidesPromptInLandscape;
- (BOOL)hidesSearchableSources;
- (BOOL)ignoresParentalRestrictions;
- (BOOL)onlyRealContacts;
- (BOOL)shouldDisplayAddNewContactRow;
- (BOOL)shouldDisplaySuggestionsController;
- (BOOL)shouldHideDuplicates;
- (BOOL)showsGroupMembership;
- (BOOL)showsInlineActions;
- (BOOL)showsSharedProfile;
- (CNAccessAuthorization)accessAuthorization;
- (CNContactNavigationController)contactNavigationController;
- (CNContactPickerContentDelegate)delegate;
- (CNContactPickerContentViewController)init;
- (CNContactStoreDataSource)dataSource;
- (CNContainer)parentContainer;
- (CNManagedConfiguration)managedConfiguration;
- (FAFamilyMember)familyMember;
- (NSArray)displayedPropertyKeys;
- (NSArray)prohibitedPropertyKeys;
- (NSArray)suggestedContacts;
- (NSArray)suggestionsIgnoredContactIdentifiers;
- (NSArray)suggestionsInteractionDomains;
- (NSMutableArray)contactProperties;
- (NSPredicate)predicateForEnablingContact;
- (NSPredicate)predicateForSelectionOfContact;
- (NSPredicate)predicateForSelectionOfProperty;
- (NSSet)limitedAccessContactSelection;
- (NSString)bannerTitle;
- (NSString)bannerValue;
- (NSString)limitedAccessAppBundleId;
- (NSString)limitedAccessAppName;
- (NSString)limitedAccessInitialSearchQuery;
- (NSString)prompt;
- (NSString)targetGroupIdentifier;
- (UIBarButtonItem)addContactBarButtonItem;
- (id)_validatePredicatesWithError:(id *)a3;
- (id)descriptorsForKeysRequiredByDelegate;
- (int)limitedAccessPickerType;
- (int64_t)cardActions;
- (int64_t)hostIdiom;
- (unint64_t)limitedAccessContactCaption;
- (void)_selectedContact:(id)a3;
- (void)_selectedContacts:(id)a3;
- (void)_selectedProperties:(id)a3;
- (void)_selectedProperty:(id)a3;
- (void)_updatePromptWithViewSize:(CGSize)a3 transitionCoordinator:(id)a4;
- (void)contactNavigationController:(id)a3 didCompleteWithNewContact:(id)a4;
- (void)contactNavigationController:(id)a3 didUpdateLimitedAccessSelection:(id)a4;
- (void)contactNavigationControllerDidCancel:(id)a3;
- (void)contactNavigationControllerDidComplete:(id)a3;
- (void)contactNavigationControllerDidGoBack:(id)a3;
- (void)contactNavigationControllerShouldEditLimitedAccess:(id)a3;
- (void)invalidateSelectionAnimated:(BOOL)a3;
- (void)setAccessAuthorization:(id)a3;
- (void)setAllowsCancel:(BOOL)a3;
- (void)setAllowsDeletion:(BOOL)a3;
- (void)setAllowsDone:(BOOL)a3;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setAllowsNamePicking:(BOOL)a3;
- (void)setAllowsSearchForMultiSelect:(BOOL)a3;
- (void)setBannerTitle:(id)a3;
- (void)setBannerValue:(id)a3;
- (void)setCardActions:(int64_t)a3;
- (void)setClientHasContactsAccess:(BOOL)a3;
- (void)setClientWantsMultipleContacts:(BOOL)a3;
- (void)setClientWantsMultipleProperties:(BOOL)a3;
- (void)setClientWantsSingleContact:(BOOL)a3;
- (void)setClientWantsSingleProperty:(BOOL)a3;
- (void)setContactNavigationController:(id)a3;
- (void)setContactProperties:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayedPropertyKeys:(id)a3;
- (void)setFamilyMember:(id)a3;
- (void)setHasPickerPrivacyUI:(BOOL)a3;
- (void)setHidesPromptInLandscape:(BOOL)a3;
- (void)setHidesSearchableSources:(BOOL)a3;
- (void)setHostIdiom:(int64_t)a3;
- (void)setIgnoresParentalRestrictions:(BOOL)a3;
- (void)setLimitedAccessAppBundleId:(id)a3;
- (void)setLimitedAccessAppName:(id)a3;
- (void)setLimitedAccessContactCaption:(unint64_t)a3;
- (void)setLimitedAccessContactSelection:(id)a3;
- (void)setLimitedAccessInitialSearchQuery:(id)a3;
- (void)setLimitedAccessPickerType:(int)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setOnlyRealContacts:(BOOL)a3;
- (void)setParentContainer:(id)a3;
- (void)setPredicateForEnablingContact:(id)a3;
- (void)setPredicateForSelectionOfContact:(id)a3;
- (void)setPredicateForSelectionOfProperty:(id)a3;
- (void)setProhibitedPropertyKeys:(id)a3;
- (void)setPrompt:(id)a3;
- (void)setShouldDisplayAddNewContactRow:(BOOL)a3;
- (void)setShouldDisplaySuggestionsController:(BOOL)a3;
- (void)setShouldHideDuplicates:(BOOL)a3;
- (void)setShowsGroupMembership:(BOOL)a3;
- (void)setShowsInlineActions:(BOOL)a3;
- (void)setShowsSharedProfile:(BOOL)a3;
- (void)setSuggestedContacts:(id)a3;
- (void)setSuggestionsIgnoredContactIdentifiers:(id)a3;
- (void)setSuggestionsInteractionDomains:(id)a3;
- (void)setTargetGroupIdentifier:(id)a3;
- (void)setupWithOptions:(id)a3 readyBlock:(id)a4;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CNContactPickerContentViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessAuthorization, 0);
  objc_storeStrong((id *)&self->_limitedAccessInitialSearchQuery, 0);
  objc_storeStrong((id *)&self->_limitedAccessAppBundleId, 0);
  objc_storeStrong((id *)&self->_limitedAccessAppName, 0);
  objc_storeStrong((id *)&self->_limitedAccessContactSelection, 0);
  objc_storeStrong((id *)&self->_suggestedContacts, 0);
  objc_storeStrong((id *)&self->_suggestionsInteractionDomains, 0);
  objc_storeStrong((id *)&self->_suggestionsIgnoredContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_predicateForSelectionOfProperty, 0);
  objc_storeStrong((id *)&self->_predicateForSelectionOfContact, 0);
  objc_storeStrong((id *)&self->_predicateForEnablingContact, 0);
  objc_storeStrong((id *)&self->_bannerValue, 0);
  objc_storeStrong((id *)&self->_bannerTitle, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_targetGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_displayedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_parentContainer, 0);
  objc_storeStrong((id *)&self->_contactProperties, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_contactNavigationController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setAccessAuthorization:(id)a3
{
}

- (CNAccessAuthorization)accessAuthorization
{
  return self->_accessAuthorization;
}

- (void)setHostIdiom:(int64_t)a3
{
  self->_hostIdiom = a3;
}

- (int64_t)hostIdiom
{
  return self->_hostIdiom;
}

- (void)setLimitedAccessContactCaption:(unint64_t)a3
{
  self->_limitedAccessContactCaption = a3;
}

- (unint64_t)limitedAccessContactCaption
{
  return self->_limitedAccessContactCaption;
}

- (void)setLimitedAccessInitialSearchQuery:(id)a3
{
}

- (NSString)limitedAccessInitialSearchQuery
{
  return self->_limitedAccessInitialSearchQuery;
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

- (void)setShouldHideDuplicates:(BOOL)a3
{
  self->_shouldHideDuplicates = a3;
}

- (BOOL)shouldHideDuplicates
{
  return self->_shouldHideDuplicates;
}

- (void)setSuggestedContacts:(id)a3
{
}

- (NSArray)suggestedContacts
{
  return self->_suggestedContacts;
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

- (void)setProhibitedPropertyKeys:(id)a3
{
}

- (NSArray)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (void)setFamilyMember:(id)a3
{
}

- (FAFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setPredicateForSelectionOfProperty:(id)a3
{
}

- (NSPredicate)predicateForSelectionOfProperty
{
  return self->_predicateForSelectionOfProperty;
}

- (void)setPredicateForSelectionOfContact:(id)a3
{
}

- (NSPredicate)predicateForSelectionOfContact
{
  return self->_predicateForSelectionOfContact;
}

- (void)setPredicateForEnablingContact:(id)a3
{
}

- (NSPredicate)predicateForEnablingContact
{
  return self->_predicateForEnablingContact;
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

- (void)setShowsGroupMembership:(BOOL)a3
{
  self->_showsGroupMembership = a3;
}

- (BOOL)showsGroupMembership
{
  return self->_showsGroupMembership;
}

- (void)setShowsSharedProfile:(BOOL)a3
{
  self->_showsSharedProfile = a3;
}

- (BOOL)showsSharedProfile
{
  return self->_showsSharedProfile;
}

- (void)setShowsInlineActions:(BOOL)a3
{
  self->_showsInlineActions = a3;
}

- (BOOL)showsInlineActions
{
  return self->_showsInlineActions;
}

- (void)setAllowsNamePicking:(BOOL)a3
{
  self->_allowsNamePicking = a3;
}

- (BOOL)allowsNamePicking
{
  return self->_allowsNamePicking;
}

- (void)setAllowsSearchForMultiSelect:(BOOL)a3
{
  self->_allowsSearchForMultiSelect = a3;
}

- (BOOL)allowsSearchForMultiSelect
{
  return self->_allowsSearchForMultiSelect;
}

- (void)setAllowsDone:(BOOL)a3
{
  self->_allowsDone = a3;
}

- (BOOL)allowsDone
{
  return self->_allowsDone;
}

- (void)setAllowsDeletion:(BOOL)a3
{
  self->_allowsDeletion = a3;
}

- (BOOL)allowsDeletion
{
  return self->_allowsDeletion;
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

- (void)setDisplayedPropertyKeys:(id)a3
{
}

- (NSArray)displayedPropertyKeys
{
  return self->_displayedPropertyKeys;
}

- (void)setParentContainer:(id)a3
{
}

- (CNContainer)parentContainer
{
  return self->_parentContainer;
}

- (void)setContactProperties:(id)a3
{
}

- (NSMutableArray)contactProperties
{
  return self->_contactProperties;
}

- (void)setDataSource:(id)a3
{
}

- (CNContactStoreDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setContactNavigationController:(id)a3
{
}

- (CNContactNavigationController)contactNavigationController
{
  return self->_contactNavigationController;
}

- (void)setClientHasContactsAccess:(BOOL)a3
{
  self->_clientHasContactsAccess = a3;
}

- (BOOL)clientHasContactsAccess
{
  return self->_clientHasContactsAccess;
}

- (void)setClientWantsMultipleProperties:(BOOL)a3
{
  self->_clientWantsMultipleProperties = a3;
}

- (BOOL)clientWantsMultipleProperties
{
  return self->_clientWantsMultipleProperties;
}

- (void)setClientWantsMultipleContacts:(BOOL)a3
{
  self->_clientWantsMultipleContacts = a3;
}

- (BOOL)clientWantsMultipleContacts
{
  return self->_clientWantsMultipleContacts;
}

- (void)setClientWantsSingleProperty:(BOOL)a3
{
  self->_clientWantsSingleProperty = a3;
}

- (BOOL)clientWantsSingleProperty
{
  return self->_clientWantsSingleProperty;
}

- (void)setClientWantsSingleContact:(BOOL)a3
{
  self->_clientWantsSingleContact = a3;
}

- (BOOL)clientWantsSingleContact
{
  return self->_clientWantsSingleContact;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactPickerContentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactPickerContentDelegate *)WeakRetained;
}

- (void)contactNavigationControllerShouldEditLimitedAccess:(id)a3
{
  id v4 = a3;
  id v6 = [(CNContactPickerContentViewController *)self delegate];
  v5 = [v4 contactListViewController];

  [v6 contactListViewControllerShouldEditLimitedAccessSelection:v5];
}

- (void)contactNavigationController:(id)a3 didUpdateLimitedAccessSelection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(CNContactPickerContentViewController *)self delegate];
  v8 = [v7 contactListViewController];

  [v9 didUpdateLimitedAccessSelection:v6 contactListViewController:v8];
}

- (void)_selectedProperties:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        v11 = [(CNContactPickerContentViewController *)self dataSource];
        v12 = [v10 contact];
        v13 = [(CNContactPickerContentViewController *)self descriptorsForKeysRequiredByDelegate];
        v14 = [v11 completeContactFromContact:v12 fromMainStoreOnly:1 keysToFetch:v13];

        v15 = (void *)MEMORY[0x1E4F1B970];
        v16 = [v10 key];
        v17 = [v10 identifier];
        v18 = [v15 contactPropertyWithContact:v14 propertyKey:v16 identifier:v17];

        [v5 addObject:v18];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  v19 = [(CNContactPickerContentViewController *)self delegate];
  [v19 pickerDidSelectContacts:0 properties:v5];
}

- (void)_selectedContacts:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
        v12 = [(CNContactPickerContentViewController *)self dataSource];
        v13 = [(CNContactPickerContentViewController *)self descriptorsForKeysRequiredByDelegate];
        v14 = [v12 completeContactFromContact:v11 fromMainStoreOnly:1 keysToFetch:v13];

        [v5 addObject:v14];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v15 = [(CNContactPickerContentViewController *)self delegate];
  [v15 pickerDidSelectContacts:v5 properties:0];
}

- (void)_selectedProperty:(id)a3
{
  id v4 = a3;
  v5 = [(CNContactPickerContentViewController *)self dataSource];
  id v6 = [v4 contact];
  uint64_t v7 = [(CNContactPickerContentViewController *)self descriptorsForKeysRequiredByDelegate];
  id v13 = [v5 completeContactFromContact:v6 fromMainStoreOnly:1 keysToFetch:v7];

  uint64_t v8 = (void *)MEMORY[0x1E4F1B970];
  uint64_t v9 = [v4 key];
  uint64_t v10 = [v4 identifier];

  uint64_t v11 = [v8 contactPropertyWithContact:v13 propertyKey:v9 identifier:v10];

  v12 = [(CNContactPickerContentViewController *)self delegate];
  [v12 pickerDidSelectContact:0 property:v11];
}

- (void)_selectedContact:(id)a3
{
  id v4 = a3;
  v5 = [(CNContactPickerContentViewController *)self dataSource];
  id v6 = [(CNContactPickerContentViewController *)self descriptorsForKeysRequiredByDelegate];
  id v8 = [v5 completeContactFromContact:v4 fromMainStoreOnly:1 keysToFetch:v6];

  uint64_t v7 = [(CNContactPickerContentViewController *)self delegate];
  [v7 pickerDidSelectContact:v8 property:0];
}

- (id)descriptorsForKeysRequiredByDelegate
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = +[CNContactContentViewController descriptorForRequiredKeys];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (void)contactNavigationControllerDidGoBack:(id)a3
{
  id v3 = [(CNContactPickerContentViewController *)self delegate];
  [v3 pickerDidGoBack];
}

- (void)contactNavigationControllerDidCancel:(id)a3
{
  id v3 = [(CNContactPickerContentViewController *)self delegate];
  [v3 pickerDidCancel];
}

- (void)contactNavigationController:(id)a3 didCompleteWithNewContact:(id)a4
{
  id v5 = a4;
  id v6 = [(CNContactPickerContentViewController *)self delegate];
  [v6 pickerDidCompleteWithNewContact:v5];
}

- (void)contactNavigationControllerDidComplete:(id)a3
{
  if (self->_contactProperties)
  {
    contactProperties = self->_contactProperties;
    [(CNContactPickerContentViewController *)self _selectedProperties:contactProperties];
  }
  else
  {
    id v8 = [a3 contactListViewController];
    if (+[CNLimitedAccessPickerSupport isPickerLimitedAccess:[(CNContactPickerContentViewController *)self limitedAccessPickerType]])
    {
      id v5 = [v8 limitedAccessTotalSelectedContacts];
      id v6 = [v8 limitedAccessAppBundleId];
      uint64_t v7 = +[CNLimitedAccessPickerSupport contactsFromIdentifiers:v5 withBundleId:v6];
    }
    else
    {
      uint64_t v7 = [v8 selectedContacts];
    }
    [(CNContactPickerContentViewController *)self _selectedContacts:v7];
  }
}

- (BOOL)contactNavigationController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5
{
  id v6 = a4;
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  uint64_t v10 = [(CNContactPickerContentViewController *)self displayedPropertyKeys];
  [v9 setDisplayedPropertyKeys:v10];

  uint64_t v11 = [(CNContactPickerContentViewController *)self prohibitedPropertyKeys];
  [v9 setProhibitedPropertyKeys:v11];

  objc_msgSend(v9, "setIgnoresParentalRestrictions:", -[CNContactPickerContentViewController ignoresParentalRestrictions](self, "ignoresParentalRestrictions"));
  objc_msgSend(v9, "setAllowsNamePicking:", -[CNContactPickerContentViewController allowsNamePicking](self, "allowsNamePicking"));
  objc_msgSend(v9, "setShowsInlineActions:", -[CNContactPickerContentViewController showsInlineActions](self, "showsInlineActions"));
  objc_msgSend(v9, "setShowsSharedProfile:", -[CNContactPickerContentViewController showsSharedProfile](self, "showsSharedProfile"));
  objc_msgSend(v9, "setShowsGroupMembership:", -[CNContactPickerContentViewController showsGroupMembership](self, "showsGroupMembership"));
  int64_t v12 = [(CNContactPickerContentViewController *)self cardActions];
  id v13 = [v9 contact];
  int v14 = [v13 isSuggested];

  if (v14) {
    v12 |= 0x20uLL;
  }
  if ([(CNContactPickerContentViewController *)self allowsDeletion]) {
    uint64_t v15 = v12 | 0x100;
  }
  else {
    uint64_t v15 = v12;
  }
  [v9 setActions:v15];

  return 0;
}

- (BOOL)contactNavigationControllerShouldDismissSearchOnSelection:(id)a3
{
  return 1;
}

- (BOOL)contactNavigationController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CNContactPickerContentViewController *)self clientWantsSingleProperty]
    && ((-[CNContactPickerContentViewController predicateForSelectionOfProperty](self, "predicateForSelectionOfProperty"), v8 = objc_claimAutoreleasedReturnValue(), v8, !v8)|| (-[CNContactPickerContentViewController predicateForSelectionOfProperty](self, "predicateForSelectionOfProperty"), id v9 = objc_claimAutoreleasedReturnValue(), v10 = [v9 evaluateWithObject:v7], v9, v10)))
  {
    [(CNContactPickerContentViewController *)self _selectedProperty:v7];
    BOOL v11 = 0;
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)contactNavigationControllerShouldShowContactsOnKeyCommands:(id)a3
{
  return 0;
}

- (BOOL)contactNavigationController:(id)a3 shouldShowCardForContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isSuggested] & 1) != 0 || (objc_msgSend(v7, "hasSuggestedProperties")) {
    goto LABEL_3;
  }
  if ([(CNContactPickerContentViewController *)self clientWantsMultipleContacts]
    || [(CNContactPickerContentViewController *)self clientWantsMultipleProperties])
  {
LABEL_11:
    BOOL v8 = 0;
    goto LABEL_12;
  }
  id v9 = [(CNContactPickerContentViewController *)self predicateForSelectionOfContact];

  if (v9)
  {
    int v10 = [(CNContactPickerContentViewController *)self predicateForSelectionOfContact];
    int v11 = [v10 evaluateWithObject:v7];

    if (v11) {
      goto LABEL_10;
    }
  }
  else if ([(CNContactPickerContentViewController *)self clientWantsSingleContact])
  {
LABEL_10:
    [(CNContactPickerContentViewController *)self _selectedContact:v7];
    goto LABEL_11;
  }
LABEL_3:
  BOOL v8 = 1;
LABEL_12:

  return v8;
}

- (BOOL)contactNavigationController:(id)a3 shouldSelectContact:(id)a4 atIndexPath:(id)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v62 = a5;
  if (([v9 isSuggested] & 1) == 0
    && ([(CNContactPickerContentViewController *)self predicateForSelectionOfProperty],
        (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0)
    && (int v11 = (void *)v10,
        BOOL v12 = [(CNContactPickerContentViewController *)self clientWantsMultipleProperties], v11, v12))
  {
    id v13 = [v8 contactListViewController];
    uint64_t v14 = [v13 collectionView];

    v61 = (void *)v14;
    uint64_t v15 = [(id)v14 indexPathsForSelectedItems];
    LOBYTE(v14) = [v15 containsObject:v62];

    if (v14)
    {
      BOOL v16 = 1;
    }
    else
    {
      long long v18 = [MEMORY[0x1E4F1B8F8] multiValuePropertiesSupportingPredicateValidation];
      long long v19 = [(CNContactPickerContentViewController *)self contactNavigationController];
      v20 = [v19 dataSource];
      uint64_t v21 = [v20 completeContactFromContact:v9 fromMainStoreOnly:0 keysToFetch:v18];

      long long v22 = [(CNContactPickerContentViewController *)self predicateForSelectionOfProperty];
      long long v23 = [v21 validPropertiesByEvaluatingPredicate:v22 onMultiValueProperties:v18];

      if ([v23 count])
      {
        if (!self->_contactProperties)
        {
          long long v24 = [MEMORY[0x1E4F1CA48] array];
          [(CNContactPickerContentViewController *)self setContactProperties:v24];
        }
        if ([v23 count] == 1)
        {
          v25 = [v23 firstObject];
          [(NSMutableArray *)self->_contactProperties addObject:v25];

          BOOL v16 = 1;
        }
        else
        {
          v53 = v21;
          v54 = v18;
          v60 = self;
          id v55 = v9;
          id v56 = v8;
          uint64_t v26 = [v61 cellForItemAtIndexPath:v62];
          v58 = [v26 backgroundColor];
          v27 = [MEMORY[0x1E4FB1618] systemGray6Color];
          v59 = v26;
          [v26 setBackgroundColor:v27];

          v28 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
          long long v75 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          v52 = v23;
          id obj = v23;
          uint64_t v29 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v76;
            do
            {
              for (uint64_t i = 0; i != v30; ++i)
              {
                if (*(void *)v76 != v31) {
                  objc_enumerationMutation(obj);
                }
                v33 = *(void **)(*((void *)&v75 + 1) + 8 * i);
                v34 = [v33 label];
                if (v34)
                {
                  v35 = [MEMORY[0x1E4F1BA20] localizedStringForLabel:v34];
                }
                else
                {
                  v36 = (void *)MEMORY[0x1E4F1B8F8];
                  v37 = [v33 key];
                  v35 = [v36 localizedStringForKey:v37];
                }
                v38 = (void *)MEMORY[0x1E4FB1410];
                v39 = [v33 value];
                v67[0] = MEMORY[0x1E4F143A8];
                v67[1] = 3221225472;
                v67[2] = __100__CNContactPickerContentViewController_contactNavigationController_shouldSelectContact_atIndexPath___block_invoke;
                v67[3] = &unk_1E549AFA8;
                id v68 = v59;
                id v69 = v58;
                id v70 = v61;
                id v71 = v62;
                v72 = v60;
                v73 = v33;
                id v40 = v28;
                id v74 = v40;
                v41 = [v38 _actionWithTitle:v39 descriptiveText:v35 image:0 style:0 handler:v67 shouldDismissHandler:&__block_literal_global_60_59942];
                [v40 addAction:v41];
              }
              uint64_t v30 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
            }
            while (v30);
          }

          v42 = (void *)MEMORY[0x1E4FB1410];
          v43 = CNContactsUIBundle();
          v44 = [v43 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
          v63[0] = MEMORY[0x1E4F143A8];
          v63[1] = 3221225472;
          v63[2] = __100__CNContactPickerContentViewController_contactNavigationController_shouldSelectContact_atIndexPath___block_invoke_3;
          v63[3] = &unk_1E549B738;
          id v64 = v59;
          id v65 = v58;
          id v45 = v28;
          id v66 = v45;
          id v46 = v58;
          id v47 = v59;
          v48 = [v42 actionWithTitle:v44 style:1 handler:v63];
          [v45 addAction:v48];

          v49 = [v45 popoverPresentationController];
          v50 = v49;
          if (v49)
          {
            [v49 setSourceView:v61];
            v51 = [v61 layoutAttributesForItemAtIndexPath:v62];
            [v51 frame];
            objc_msgSend(v50, "setSourceRect:");
          }
          [(CNContactPickerContentViewController *)v60 presentViewController:v45 animated:1 completion:0];

          BOOL v16 = 0;
          id v9 = v55;
          id v8 = v56;
          uint64_t v21 = v53;
          long long v18 = v54;
          long long v23 = v52;
        }
      }
      else
      {
        BOOL v16 = 0;
      }
    }
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

uint64_t __100__CNContactPickerContentViewController_contactNavigationController_shouldSelectContact_atIndexPath___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) selectItemAtIndexPath:*(void *)(a1 + 56) animated:0 scrollPosition:0];
  [*(id *)(*(void *)(a1 + 64) + 1032) addObject:*(void *)(a1 + 72)];
  v2 = *(void **)(a1 + 80);

  return [v2 dismissViewControllerAnimated:1 completion:0];
}

uint64_t __100__CNContactPickerContentViewController_contactNavigationController_shouldSelectContact_atIndexPath___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 48);

  return [v2 dismissViewControllerAnimated:1 completion:0];
}

uint64_t __100__CNContactPickerContentViewController_contactNavigationController_shouldSelectContact_atIndexPath___block_invoke_2()
{
  return 0;
}

- (BOOL)contactSuggestionViewController:(id)a3 shouldSelectContact:(id)a4 atIndexPath:(id)a5
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v72 = a5;
  uint64_t v10 = [(CNContactPickerContentViewController *)self predicateForSelectionOfProperty];
  if (v10
    && (int v11 = (void *)v10,
        v12 = -[CNContactPickerContentViewController clientWantsMultipleProperties](self, "clientWantsMultipleProperties"), v11, v12)&& ([v8 selectedContacts], id v13 = objc_claimAutoreleasedReturnValue(), v14 = objc_msgSend(v13, "containsObject:", v9), v13, (v14 & 1) == 0))
  {
    id v71 = [v8 collectionView];
    long long v17 = [MEMORY[0x1E4F1B8F8] multiValuePropertiesSupportingPredicateValidation];
    long long v18 = [(CNContactPickerContentViewController *)self contactNavigationController];
    long long v19 = [v18 dataSource];
    v20 = [v19 completeContactFromContact:v9 fromMainStoreOnly:0 keysToFetch:v17];

    uint64_t v21 = [(CNContactPickerContentViewController *)self predicateForSelectionOfProperty];
    long long v22 = [v20 validPropertiesByEvaluatingPredicate:v21 onMultiValueProperties:v17];

    if ([v22 count])
    {
      if (!self->_contactProperties)
      {
        long long v23 = [MEMORY[0x1E4F1CA48] array];
        [(CNContactPickerContentViewController *)self setContactProperties:v23];
      }
      if ([v22 count] == 1)
      {
        long long v24 = [v22 firstObject];
        [(NSMutableArray *)self->_contactProperties addObject:v24];

        BOOL v15 = 1;
      }
      else
      {
        id v65 = v20;
        id v66 = v17;
        id v70 = self;
        id v67 = v9;
        id v68 = v8;
        v25 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id v64 = v22;
        id obj = v22;
        uint64_t v26 = [obj countByEnumeratingWithState:&v81 objects:v85 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v82;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v82 != v28) {
                objc_enumerationMutation(obj);
              }
              uint64_t v30 = *(void **)(*((void *)&v81 + 1) + 8 * i);
              uint64_t v31 = [v30 label];
              if (v31)
              {
                v32 = [MEMORY[0x1E4F1BA20] localizedStringForLabel:v31];
              }
              else
              {
                v33 = (void *)MEMORY[0x1E4F1B8F8];
                v34 = [v30 key];
                v32 = [v33 localizedStringForKey:v34];
              }
              v35 = (void *)MEMORY[0x1E4FB1410];
              v36 = [v30 value];
              v75[0] = MEMORY[0x1E4F143A8];
              v75[1] = 3221225472;
              v75[2] = __104__CNContactPickerContentViewController_contactSuggestionViewController_shouldSelectContact_atIndexPath___block_invoke;
              v75[3] = &unk_1E549AF60;
              id v76 = v71;
              id v77 = v72;
              long long v78 = v70;
              v79 = v30;
              id v37 = v25;
              id v80 = v37;
              v38 = [v35 _actionWithTitle:v36 descriptiveText:v32 image:0 style:0 handler:v75 shouldDismissHandler:&__block_literal_global_54_59954];
              [v37 addAction:v38];
            }
            uint64_t v27 = [obj countByEnumeratingWithState:&v81 objects:v85 count:16];
          }
          while (v27);
        }

        v39 = (void *)MEMORY[0x1E4FB1410];
        id v40 = CNContactsUIBundle();
        v41 = [v40 localizedStringForKey:@"CANCEL" value:&stru_1ED8AC728 table:@"Localized"];
        v73[0] = MEMORY[0x1E4F143A8];
        v73[1] = 3221225472;
        v73[2] = __104__CNContactPickerContentViewController_contactSuggestionViewController_shouldSelectContact_atIndexPath___block_invoke_3;
        v73[3] = &unk_1E549B590;
        id v42 = v25;
        id v74 = v42;
        v43 = [v39 actionWithTitle:v41 style:1 handler:v73];
        [v42 addAction:v43];

        v44 = [v42 popoverPresentationController];
        id v45 = v44;
        v20 = v65;
        if (v44)
        {
          [v44 setSourceView:v71];
          id v46 = [v71 layoutAttributesForItemAtIndexPath:v72];
          [v46 frame];
          double v48 = v47;
          double v50 = v49;
          double v52 = v51;
          double v54 = v53;
          id v55 = [v71 superview];
          objc_msgSend(v71, "convertRect:toView:", v55, v48, v50, v52, v54);
          double v57 = v56;
          double v59 = v58;
          double v61 = v60;
          double v63 = v62;

          objc_msgSend(v45, "setSourceRect:", v57, v59, v61, v63);
        }
        [(CNContactPickerContentViewController *)v70 presentViewController:v42 animated:1 completion:0];

        BOOL v15 = 0;
        id v9 = v67;
        id v8 = v68;
        long long v17 = v66;
        long long v22 = v64;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

uint64_t __104__CNContactPickerContentViewController_contactSuggestionViewController_shouldSelectContact_atIndexPath___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) selectItemAtIndexPath:*(void *)(a1 + 40) animated:0 scrollPosition:0];
  [*(id *)(*(void *)(a1 + 48) + 1032) addObject:*(void *)(a1 + 56)];
  v2 = *(void **)(a1 + 64);

  return [v2 dismissViewControllerAnimated:1 completion:0];
}

uint64_t __104__CNContactPickerContentViewController_contactSuggestionViewController_shouldSelectContact_atIndexPath___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

uint64_t __104__CNContactPickerContentViewController_contactSuggestionViewController_shouldSelectContact_atIndexPath___block_invoke_2()
{
  return 0;
}

- (BOOL)contactNavigationController:(id)a3 canSelectContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CNContactPickerContentViewController *)self dataSource];
  id v9 = [v8 keysToFetch];
  char v10 = [v7 areKeysAvailable:v9];

  if ((v10 & 1) == 0)
  {
    int v11 = [(CNContactPickerContentViewController *)self contactNavigationController];
    BOOL v12 = [v11 dataSource];
    id v13 = [(CNContactPickerContentViewController *)self dataSource];
    char v14 = [v13 keysToFetch];
    uint64_t v15 = [v12 completeContactFromContact:v7 fromMainStoreOnly:0 keysToFetch:v14];

    id v7 = (id)v15;
  }
  BOOL v16 = [(CNContactPickerContentViewController *)self predicateForEnablingContact];

  if (v16)
  {
    long long v17 = [(CNContactPickerContentViewController *)self predicateForEnablingContact];
    char v18 = [v17 evaluateWithObject:v7];
  }
  else
  {
    char v18 = 1;
  }

  return v18;
}

- (BOOL)contactNavigationControllerShouldAddNewContact:(id)a3
{
  id v4 = [(CNContactPickerContentViewController *)self familyMember];

  if (v4)
  {
    id v5 = [(CNContactPickerContentViewController *)self delegate];
    [v5 pickerDidSelectAddNewContact];
  }
  return v4 == 0;
}

- (void)invalidateSelectionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [(CNContactPickerContentViewController *)self contactNavigationController];
  id v5 = [v4 contactListViewController];
  id v6 = [v5 collectionView];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = objc_msgSend(v6, "indexPathsForSelectedItems", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [v6 deselectItemAtIndexPath:*(void *)(*((void *)&v12 + 1) + 8 * v11++) animated:v3];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (UIBarButtonItem)addContactBarButtonItem
{
  v2 = [(CNContactPickerContentViewController *)self contactNavigationController];
  BOOL v3 = [v2 addContactBarButtonItem];

  return (UIBarButtonItem *)v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)CNContactPickerContentViewController;
  id v7 = a4;
  -[CNContactPickerContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[CNContactPickerContentViewController _updatePromptWithViewSize:transitionCoordinator:](self, "_updatePromptWithViewSize:transitionCoordinator:", v7, width, height, v8.receiver, v8.super_class);
}

- (void)_updatePromptWithViewSize:(CGSize)a3 transitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = [(CNContactPickerContentViewController *)self prompt];

  if (v7
    && (width <= height
     || ![(CNContactPickerContentViewController *)self hidesPromptInLandscape]))
  {
    id v10 = [(CNContactPickerContentViewController *)self prompt];
  }
  else
  {
    id v10 = 0;
  }
  objc_super v8 = [(CNContactNavigationController *)self->_contactNavigationController contactListViewController];
  uint64_t v9 = [v8 navigationItem];
  [v9 setPrompt:v10];
}

- (id)_validatePredicatesWithError:(id *)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1BA90]);
  id v7 = [(id)objc_opt_class() descriptorForContactPropertiesSupportingPredicateEvaluation];
  v23[0] = v7;
  objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  [v6 setAllowedKeys:v8];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__CNContactPickerContentViewController__validatePredicatesWithError___block_invoke;
  aBlock[3] = &unk_1E549AF38;
  aBlock[4] = self;
  id v9 = v6;
  id v19 = v9;
  id v10 = v5;
  id v20 = v10;
  uint64_t v11 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
  v11[2](v11, @"predicateForEnablingContact");
  v11[2](v11, @"predicateForSelectionOfContact");
  long long v12 = [v9 usedKeys];
  [v9 setAllowedKeys:&unk_1ED915C20];
  v11[2](v11, @"predicateForSelectionOfProperty");
  uint64_t v13 = [v10 count];
  if (a3 && v13)
  {
    long long v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F1AFD8];
    uint64_t v21 = *MEMORY[0x1E4F1AFE0];
    id v22 = v10;
    BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    *a3 = [v14 errorWithDomain:v15 code:300 userInfo:v16];
  }

  return v12;
}

void __69__CNContactPickerContentViewController__validatePredicatesWithError___block_invoke(id *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [a1[4] valueForKey:v3];
  if (v4)
  {
    [a1[5] setPredicate:v4];
    id v5 = a1[5];
    id v9 = 0;
    char v6 = [v5 validateWithError:&v9];
    id v7 = v9;
    if (v6)
    {
      [v4 allowEvaluation];
    }
    else
    {
      objc_super v8 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v11 = v3;
        __int16 v12 = 2112;
        id v13 = v7;
        _os_log_error_impl(&dword_18B625000, v8, OS_LOG_TYPE_ERROR, "Invalid %@: %@, removing it.", buf, 0x16u);
      }

      if (v7) {
        [a1[6] addObject:v7];
      }
      [a1[4] setValue:0 forKey:v3];
    }
  }
}

- (void)setupWithOptions:(id)a3 readyBlock:(id)a4
{
  uint64_t v204 = *MEMORY[0x1E4F143B8];
  char v6 = (NSString *)a3;
  v194 = (void (**)(id, id))a4;
  id v7 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v203 = v6;
    _os_log_debug_impl(&dword_18B625000, v7, OS_LOG_TYPE_DEBUG, "setupWithOptions: %@", buf, 0xCu);
  }

  objc_super v8 = [(NSString *)v6 objectForKeyedSubscript:@"Properties"];
  long long v197 = 0u;
  long long v198 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  id v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"predicateForEnablingContact", @"predicateForSelectionOfContact", @"predicateForSelectionOfProperty", @"displayedPropertyKeys", @"cardActions", @"hidesSearchableSources", @"onlyRealContacts", @"allowsEditing", @"allowsCancel", @"allowsDone", @"allowsNamePicking", @"prompt", @"hidesPromptInLandscape", @"bannerTitle", @"bannerValue", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v197 objects:v201 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v198;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v198 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v197 + 1) + 8 * i);
        uint64_t v15 = [v8 objectForKeyedSubscript:v14];
        if (v15) {
          [(CNContactPickerContentViewController *)self setValue:v15 forKey:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v197 objects:v201 count:16];
    }
    while (v11);
  }

  id v196 = 0;
  v195 = [(CNContactPickerContentViewController *)self _validatePredicatesWithError:&v196];
  id v193 = v196;
  BOOL v16 = [(NSString *)v6 objectForKeyedSubscript:@"ClientWantsSingleContact"];
  -[CNContactPickerContentViewController setClientWantsSingleContact:](self, "setClientWantsSingleContact:", [v16 BOOLValue]);

  uint64_t v17 = [(NSString *)v6 objectForKeyedSubscript:@"ClientWantsSingleProperty"];
  -[CNContactPickerContentViewController setClientWantsSingleProperty:](self, "setClientWantsSingleProperty:", [v17 BOOLValue]);

  char v18 = [(NSString *)v6 objectForKeyedSubscript:@"ClientWantsMultipleContacts"];
  -[CNContactPickerContentViewController setClientWantsMultipleContacts:](self, "setClientWantsMultipleContacts:", [v18 BOOLValue]);

  id v19 = [(NSString *)v6 objectForKeyedSubscript:@"ClientWantsMultipleProperties"];
  -[CNContactPickerContentViewController setClientWantsMultipleProperties:](self, "setClientWantsMultipleProperties:", [v19 BOOLValue]);

  id v20 = [(NSString *)v6 objectForKeyedSubscript:@"ClientHasContactsAccess"];
  -[CNContactPickerContentViewController setClientHasContactsAccess:](self, "setClientHasContactsAccess:", [v20 BOOLValue]);

  uint64_t v21 = [(NSString *)v6 objectForKeyedSubscript:@"familyMember"];
  [(CNContactPickerContentViewController *)self setFamilyMember:v21];

  id v22 = [(NSString *)v6 objectForKeyedSubscript:@"parentContainer"];
  [(CNContactPickerContentViewController *)self setParentContainer:v22];

  long long v23 = [(NSString *)v6 objectForKeyedSubscript:@"ignoresParentalRestrictions"];
  -[CNContactPickerContentViewController setIgnoresParentalRestrictions:](self, "setIgnoresParentalRestrictions:", [v23 BOOLValue]);

  long long v24 = [(NSString *)v6 objectForKeyedSubscript:@"prohibitedPropertyKeys"];
  [(CNContactPickerContentViewController *)self setProhibitedPropertyKeys:v24];

  v25 = [(NSString *)v6 objectForKeyedSubscript:@"allowsDeletion"];
  -[CNContactPickerContentViewController setAllowsDeletion:](self, "setAllowsDeletion:", [v25 BOOLValue]);

  uint64_t v26 = [(NSString *)v6 objectForKeyedSubscript:@"allowsNamePicking"];
  -[CNContactPickerContentViewController setAllowsNamePicking:](self, "setAllowsNamePicking:", [v26 BOOLValue]);

  uint64_t v27 = [(NSString *)v6 objectForKeyedSubscript:@"hostIdiom"];
  -[CNContactPickerContentViewController setHostIdiom:](self, "setHostIdiom:", (int)[v27 intValue]);

  [(CNContactPickerContentViewController *)self setShowsInlineActions:0];
  [(CNContactPickerContentViewController *)self setShowsSharedProfile:0];
  [(CNContactPickerContentViewController *)self setShowsGroupMembership:0];
  uint64_t v28 = [(NSString *)v6 objectForKeyedSubscript:@"allowsSearchForMultiSelect"];
  -[CNContactPickerContentViewController setAllowsSearchForMultiSelect:](self, "setAllowsSearchForMultiSelect:", [v28 BOOLValue]);

  uint64_t v29 = [(NSString *)v6 objectForKeyedSubscript:@"shouldDisplaySuggestionsController"];
  -[CNContactPickerContentViewController setShouldDisplaySuggestionsController:](self, "setShouldDisplaySuggestionsController:", [v29 BOOLValue]);

  uint64_t v30 = [(NSString *)v6 objectForKeyedSubscript:@"suggestionsIgnoredContactIdentifiers"];
  [(CNContactPickerContentViewController *)self setSuggestionsIgnoredContactIdentifiers:v30];

  uint64_t v31 = [(NSString *)v6 objectForKeyedSubscript:@"suggestionsInteractionDomains"];
  [(CNContactPickerContentViewController *)self setSuggestionsInteractionDomains:v31];

  v32 = [(NSString *)v6 objectForKeyedSubscript:@"suggestedContacts"];
  [(CNContactPickerContentViewController *)self setSuggestedContacts:v32];

  v33 = [(NSString *)v6 objectForKeyedSubscript:@"shouldDisplayAddNewContactRow"];
  -[CNContactPickerContentViewController setShouldDisplayAddNewContactRow:](self, "setShouldDisplayAddNewContactRow:", [v33 BOOLValue]);

  v34 = [(NSString *)v6 objectForKeyedSubscript:@"targetGroupIdentifier"];
  [(CNContactPickerContentViewController *)self setTargetGroupIdentifier:v34];

  v35 = [(NSString *)v6 objectForKeyedSubscript:@"shouldHideDuplicates"];
  -[CNContactPickerContentViewController setShouldHideDuplicates:](self, "setShouldHideDuplicates:", [v35 BOOLValue]);

  v36 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v37 = [v36 featureFlags];
  int v38 = [v37 isFeatureEnabled:9];

  BOOL v39 = 0;
  if (v38)
  {
    id v40 = [(NSString *)v6 objectForKeyedSubscript:@"limitedAccessContactSelection"];
    [(CNContactPickerContentViewController *)self setLimitedAccessContactSelection:v40];

    v41 = [(NSString *)v6 objectForKeyedSubscript:@"limitedAccessPickerType"];
    -[CNContactPickerContentViewController setLimitedAccessPickerType:](self, "setLimitedAccessPickerType:", [v41 integerValue]);

    BOOL v39 = +[CNLimitedAccessPickerSupport isPickerLimitedAccess:[(CNContactPickerContentViewController *)self limitedAccessPickerType]];
    id v42 = [(NSString *)v6 objectForKeyedSubscript:@"limitedAccessAppName"];
    [(CNContactPickerContentViewController *)self setLimitedAccessAppName:v42];

    v43 = [(NSString *)v6 objectForKeyedSubscript:@"limitedAccessAppBundleId"];
    [(CNContactPickerContentViewController *)self setLimitedAccessAppBundleId:v43];

    v44 = [(NSString *)v6 objectForKeyedSubscript:@"hasPickerPrivacyUI"];
    -[CNContactPickerContentViewController setHasPickerPrivacyUI:](self, "setHasPickerPrivacyUI:", [v44 BOOLValue]);

    id v45 = +[CNUIContactsEnvironment currentEnvironment];
    id v46 = [v45 authorizationContext];

    if (!v39 && v46 && ([v46 isFullAccessGranted] & 1) == 0) {
      [(CNContactPickerContentViewController *)self setHasPickerPrivacyUI:1];
    }
    double v47 = [(NSString *)v6 objectForKeyedSubscript:@"limitedAccessSearchQuery"];
    [(CNContactPickerContentViewController *)self setLimitedAccessInitialSearchQuery:v47];

    double v48 = [(NSString *)v6 objectForKeyedSubscript:@"limitedAccessContactCaption"];
    -[CNContactPickerContentViewController setLimitedAccessContactCaption:](self, "setLimitedAccessContactCaption:", [v48 integerValue]);

    if (v39)
    {
      double v49 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        limitedAccessAppBundleId = self->_limitedAccessAppBundleId;
        *(_DWORD *)buf = 138412290;
        v203 = limitedAccessAppBundleId;
        _os_log_debug_impl(&dword_18B625000, v49, OS_LOG_TYPE_DEBUG, "[Contact Picker Content View Controller] Bundle ID: %@", buf, 0xCu);
      }

      id v50 = objc_alloc(MEMORY[0x1E4F5A440]);
      double v51 = [(CNContactPickerContentViewController *)self limitedAccessAppBundleId];
      double v52 = [MEMORY[0x1E4F5A448] sharedConnection];
      double v53 = (void *)[v50 initWithBundleIdentifier:v51 managedProfileConnection:v52];
      [(CNContactPickerContentViewController *)self setManagedConfiguration:v53];
    }
  }
  BOOL v54 = [(CNContactPickerContentViewController *)self clientWantsMultipleContacts]
     || [(CNContactPickerContentViewController *)self clientWantsMultipleProperties];
  id v55 = [(CNContactPickerContentViewController *)self contactNavigationController];

  if (!v55)
  {
    if ([MEMORY[0x1E4F1B8F8] suggestionsEnabled])
    {
      if ([(CNContactPickerContentViewController *)self onlyRealContacts]) {
        uint64_t v56 = 1;
      }
      else {
        uint64_t v56 = 3;
      }
    }
    else
    {
      uint64_t v56 = 1;
    }
    double v57 = [(CNContactPickerContentViewController *)self managedConfiguration];

    if (v57)
    {
      id v58 = objc_alloc(MEMORY[0x1E4F1B980]);
      double v59 = [MEMORY[0x1E4F1B9A0] currentEnvironment];
      double v60 = [(CNContactPickerContentViewController *)self managedConfiguration];
      uint64_t v61 = [v58 initWithEnvironment:v59 options:v56 managedConfiguration:v60];
    }
    else
    {
      double v62 = [(CNContactPickerContentViewController *)self familyMember];

      double v63 = (void *)MEMORY[0x1E4F1B980];
      if (v62)
      {
        id v64 = [(CNContactPickerContentViewController *)self familyMember];
        uint64_t v61 = [v63 storeForFamilyMember:v64];
      }
      else
      {
        uint64_t v61 = [MEMORY[0x1E4F1B980] storeWithOptions:v56];
      }
    }
    v191 = (void *)v61;
    id v65 = [[CNContactStoreDataSource alloc] initWithStore:v61];
    [(CNContactStoreDataSource *)v65 setKeysToFetch:v195];
    id v66 = [(CNContactPickerContentViewController *)self managedConfiguration];
    [(CNContactStoreDataSource *)v65 setManagedConfiguration:v66];

    if ([v195 count]) {
      uint64_t v67 = 1;
    }
    else {
      uint64_t v67 = v39;
    }
    [(CNContactStoreDataSource *)v65 setFetchUnified:v67];
    id v68 = [[CNContactNavigationController alloc] initWithDataSource:v65];
    [(CNContactNavigationController *)v68 setDelegate:self];
    id v69 = [(CNContactNavigationController *)v68 contactListViewController];
    [v69 setDisableContextMenus:1];

    id v70 = [(CNContactPickerContentViewController *)self managedConfiguration];

    if (v70)
    {
      id v71 = [(CNContactPickerContentViewController *)self managedConfiguration];
      [(CNContactNavigationController *)v68 setManagedConfiguration:v71];
    }
    id v72 = [(CNContactPickerContentViewController *)self parentContainer];

    if (v72)
    {
      v73 = (void *)MEMORY[0x1E4F1CAD0];
      id v74 = [(CNContactPickerContentViewController *)self parentContainer];
      long long v75 = [v74 identifier];
      id v76 = [v73 setWithObject:v75];
      id v77 = [(CNContactStoreDataSource *)v65 filter];
      [v77 setContainerIdentifiers:v76];
    }
    if (!+[CNLimitedAccessPickerSupport shouldLimitedAccessPickerNeedContactsFilter:[(CNContactPickerContentViewController *)self limitedAccessPickerType]])goto LABEL_55; {
    long long v78 = [(CNContactPickerContentViewController *)self limitedAccessContactSelection];
    }
    v79 = [(CNContactStoreDataSource *)v65 filter];
    [v79 setLimitedAccessIdentifiers:v78];

    if ([(CNContactPickerContentViewController *)self limitedAccessPickerType] == 5)
    {
      BOOL v190 = v54;
      id v80 = NSString;
      long long v81 = CNContactsUIBundle();
      long long v82 = [v81 localizedStringForKey:@"LIMITED_CONTACTS_SELECTED_TITLE-%@" value:&stru_1ED8AC728 table:@"Localized"];
      uint64_t v83 = [(CNContactPickerContentViewController *)self limitedAccessAppName];
      long long v84 = (void *)v83;
    }
    else
    {
      if ([(CNContactPickerContentViewController *)self limitedAccessPickerType] != 2) {
        goto LABEL_49;
      }
      BOOL v190 = v54;
      id v80 = NSString;
      long long v81 = CNContactsUIBundle();
      long long v82 = [v81 localizedStringForKey:@"SELECTED_COUNT" value:&stru_1ED8AC728 table:@"Localized"];
      long long v84 = [(CNContactPickerContentViewController *)self limitedAccessContactSelection];
      uint64_t v83 = [v84 count];
    }
    v85 = objc_msgSend(v80, "localizedStringWithFormat:", v82, v83);
    uint64_t v86 = [(CNContactStoreDataSource *)v65 filter];
    [v86 setCustomDisplayName:v85];

    BOOL v54 = v190;
LABEL_49:
    if ([(CNContactPickerContentViewController *)self limitedAccessPickerType] == 6)
    {
      v87 = [(CNContactStoreDataSource *)v65 filter];
      v88 = v87;
      uint64_t v89 = 2;
    }
    else
    {
      if ([(CNContactPickerContentViewController *)self limitedAccessPickerType] != 2
        && [(CNContactPickerContentViewController *)self limitedAccessPickerType] != 5)
      {
        goto LABEL_55;
      }
      v87 = [(CNContactStoreDataSource *)v65 filter];
      v88 = v87;
      uint64_t v89 = 1;
    }
    [v87 setLimitedAccessFilterMode:v89];

LABEL_55:
    v90 = [(CNContactStoreDataSource *)v65 filter];
    v91 = (void *)[v90 copy];
    v92 = [(CNContactNavigationController *)v68 contactListViewController];
    v93 = [v92 dataSource];
    [v93 setFilter:v91];

    v94 = [(CNContactNavigationController *)v68 contactListViewController];
    [v94 setShouldAllowDrags:0];

    v95 = [(CNContactNavigationController *)v68 contactListViewController];
    [v95 setShouldAllowDrops:0];

    BOOL v96 = [(CNContactPickerContentViewController *)self allowsSearchForMultiSelect];
    v97 = [(CNContactNavigationController *)v68 contactListViewController];
    [v97 setShouldAllowSearchForMultiSelect:v96];

    v98 = [(CNContactPickerContentViewController *)self prohibitedPropertyKeys];
    [(CNContactNavigationController *)v68 setProhibitedPropertyKeys:v98];

    [(CNContactNavigationController *)v68 setIgnoresMapsData:1];
    [(CNContactNavigationController *)v68 setHideMailToGroupButton:1];
    v99 = [(CNContactPickerContentViewController *)self familyMember];
    if (v99)
    {
      [(CNContactNavigationController *)v68 setHideGroupsButton:1];
    }
    else
    {
      v100 = [(CNContactPickerContentViewController *)self parentContainer];
      if (v100) {
        BOOL v101 = 1;
      }
      else {
        BOOL v101 = +[CNLimitedAccessPickerSupport isPickerLimitedAccessSummary:[(CNContactPickerContentViewController *)self limitedAccessPickerType]];
      }
      [(CNContactNavigationController *)v68 setHideGroupsButton:v101];
    }
    v102 = [(CNContactPickerContentViewController *)self targetGroupIdentifier];
    [(CNContactNavigationController *)v68 setContactPickerTargetGroupIdentifier:v102];

    v103 = [(CNContactNavigationController *)v68 contactListViewController];
    [v103 setShouldDisplayGroupsGrid:0];

    v104 = [(CNContactPickerContentViewController *)self suggestedContacts];
    v105 = [(CNContactNavigationController *)v68 contactListViewController];
    [v105 setSuggestedContacts:v104];

    v106 = [(CNContactPickerContentViewController *)self suggestionsIgnoredContactIdentifiers];
    v107 = [(CNContactNavigationController *)v68 contactListViewController];
    [v107 setSuggestionsIgnoredContactIdentifiers:v106];

    v108 = [(CNContactPickerContentViewController *)self suggestionsInteractionDomains];
    v109 = [(CNContactNavigationController *)v68 contactListViewController];
    [v109 setSuggestionsInteractionDomains:v108];

    BOOL v110 = [(CNContactPickerContentViewController *)self shouldDisplaySuggestionsController];
    v111 = [(CNContactNavigationController *)v68 contactListViewController];
    [v111 setShouldDisplaySuggestionsController:v110];

    v112 = [(CNContactNavigationController *)v68 contactListViewController];
    [v112 setAllowsEditingActions:0];

    v113 = [(CNContactNavigationController *)v68 contactListViewController];
    [v113 setAllowsListEditing:0];

    BOOL v114 = [(CNContactPickerContentViewController *)self shouldDisplayAddNewContactRow];
    v115 = [(CNContactNavigationController *)v68 contactListViewController];
    [v115 setShouldDisplayAddNewContactRow:v114];

    BOOL v116 = [(CNContactPickerContentViewController *)self shouldHideDuplicates];
    v117 = [(CNContactNavigationController *)v68 contactListViewController];
    [v117 setShouldHideDuplicates:v116];

    v118 = [(CNContactPickerContentViewController *)self limitedAccessContactSelection];
    v119 = [(CNContactNavigationController *)v68 contactListViewController];
    [v119 setLimitedAccessContactSelection:v118];

    uint64_t v120 = [(CNContactPickerContentViewController *)self limitedAccessPickerType];
    v121 = [(CNContactNavigationController *)v68 contactListViewController];
    [v121 setLimitedAccessPickerType:v120];

    v122 = [(CNContactPickerContentViewController *)self limitedAccessAppName];
    v123 = [(CNContactNavigationController *)v68 contactListViewController];
    [v123 setLimitedAccessAppName:v122];

    v124 = [(CNContactPickerContentViewController *)self limitedAccessAppBundleId];
    v125 = [(CNContactNavigationController *)v68 contactListViewController];
    [v125 setLimitedAccessAppBundleId:v124];

    BOOL v126 = [(CNContactPickerContentViewController *)self hasPickerPrivacyUI];
    v127 = [(CNContactNavigationController *)v68 contactListViewController];
    [v127 setHasPickerPrivacyUI:v126];

    unint64_t v128 = [(CNContactPickerContentViewController *)self limitedAccessContactCaption];
    v129 = [(CNContactNavigationController *)v68 contactListViewController];
    [v129 setLimitedAccessContactCaption:v128];

    [(CNContactNavigationController *)v68 setHostIdiom:[(CNContactPickerContentViewController *)self hostIdiom]];
    v130 = [(CNContactPickerContentViewController *)self parentContainer];

    if (!v130)
    {
      v131 = [(CNContactNavigationController *)v68 accountsAndGroupsViewController];
      [v131 selectAllContacts];

      v132 = [(CNContactNavigationController *)v68 contactListViewController];
      [v132 reloadTitle];
    }
    [(CNContactPickerContentViewController *)self setDataSource:v65];
    [(CNContactPickerContentViewController *)self setContactNavigationController:v68];
  }
  BOOL v133 = [(CNContactPickerContentViewController *)self allowsCancel];
  v134 = [(CNContactPickerContentViewController *)self contactNavigationController];
  [v134 setAllowsCanceling:v133];

  BOOL v135 = [(CNContactPickerContentViewController *)self allowsEditing];
  v136 = [(CNContactPickerContentViewController *)self contactNavigationController];
  [v136 setAllowsCardEditing:v135];

  BOOL v137 = [(CNContactPickerContentViewController *)self hidesSearchableSources];
  v138 = [(CNContactPickerContentViewController *)self contactNavigationController];
  [v138 setHidesSearchableSources:v137];

  uint64_t v139 = [(CNContactPickerContentViewController *)self limitedAccessPickerType];
  v140 = [(CNContactPickerContentViewController *)self contactNavigationController];
  [v140 setLimitedAccessPickerType:v139];

  unint64_t v141 = [(CNContactPickerContentViewController *)self limitedAccessContactCaption];
  v142 = [(CNContactPickerContentViewController *)self contactNavigationController];
  [v142 setLimitedAccessContactCaption:v141];

  if ([(CNContactPickerContentViewController *)self limitedAccessPickerType] == 6)
  {
    uint64_t v143 = [(CNContactPickerContentViewController *)self limitedAccessInitialSearchQuery];
    if (v143)
    {
      v144 = (void *)v143;
      v145 = [(CNContactPickerContentViewController *)self limitedAccessInitialSearchQuery];
      uint64_t v146 = [v145 length];

      if (v146)
      {
        v147 = [(CNContactPickerContentViewController *)self contactNavigationController];
        v148 = [(CNContactPickerContentViewController *)self limitedAccessInitialSearchQuery];
        [v147 searchForString:v148 makeSearchBarFirstResponder:0];
      }
    }
  }
  if (v54)
  {
    if ([(CNContactPickerContentViewController *)self limitedAccessPickerType] == 1)
    {
      [(CNContactPickerContentViewController *)self setAllowsDone:0];
      v149 = [(CNContactPickerContentViewController *)self contactNavigationController];
      v150 = [v149 accountsAndGroupsViewController];
      [v150 setIsLimitedAccessOnboarding:1];
    }
    else
    {
      [(CNContactPickerContentViewController *)self setAllowsDone:1];
    }
    v151 = [(CNContactPickerContentViewController *)self contactNavigationController];
    v152 = [v151 contactListViewController];
    [v152 setupForMultiSelection];
  }
  BOOL v153 = [(CNContactPickerContentViewController *)self allowsDone];
  v154 = [(CNContactPickerContentViewController *)self contactNavigationController];
  [v154 setAllowsDone:v153];

  BOOL v155 = [(CNContactPickerContentViewController *)self allowsDone];
  v156 = [(CNContactPickerContentViewController *)self contactNavigationController];
  v157 = [v156 accountsAndGroupsViewController];
  [v157 setAllowsDone:v155];

  BOOL v158 = [(CNContactPickerContentViewController *)self allowsCancel];
  v159 = [(CNContactPickerContentViewController *)self contactNavigationController];
  uint64_t v160 = [v159 accountsAndGroupsViewController];
  [(id)v160 setAllowsCanceling:v158];

  v161 = [(CNContactPickerContentViewController *)self contactNavigationController];
  v162 = [v161 accountsAndGroupsViewController];
  [v162 setAllowsEditing:0];

  v163 = [(CNContactPickerContentViewController *)self childViewControllers];
  v164 = [(CNContactPickerContentViewController *)self contactNavigationController];
  LOBYTE(v160) = [v163 containsObject:v164];

  if ((v160 & 1) == 0) {
    [(UIViewController *)self cnui_addChildViewController:self->_contactNavigationController];
  }
  v165 = [(CNContactPickerContentViewController *)self view];
  [v165 bounds];
  -[CNContactPickerContentViewController _updatePromptWithViewSize:transitionCoordinator:](self, "_updatePromptWithViewSize:transitionCoordinator:", 0, v166, v167);

  v168 = [(NSString *)v6 objectForKeyedSubscript:@"ScrollContact"];
  if (v168)
  {
    v169 = [(CNContactNavigationController *)self->_contactNavigationController dataSource];
    v170 = [v169 store];
    if (v170)
    {
      v192 = v169;
      v171 = [(CNContactPickerContentViewController *)self contactNavigationController];
      v172 = [v171 contactListViewController];
      v173 = [v172 contactFormatter];

      v189 = v173;
      v174 = [v173 stringFromContact:v168];
      if ([v174 length])
      {
        v175 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingName:v174];
        v176 = [v170 unifiedContactsMatchingPredicate:v175 keysToFetch:MEMORY[0x1E4F1CBF0] error:0];
      }
      else
      {
        v175 = 0;
        v176 = 0;
      }
      if (![v176 count])
      {
        v177 = [v168 familyName];
        uint64_t v178 = [v177 length];

        if (v178)
        {
          v179 = (void *)MEMORY[0x1E4F1B8F8];
          v180 = [v168 familyName];
          uint64_t v181 = [v179 predicateForContactsMatchingName:v180];

          uint64_t v182 = [v170 unifiedContactsMatchingPredicate:v181 keysToFetch:MEMORY[0x1E4F1CBF0] error:0];

          v175 = (void *)v181;
          v176 = (void *)v182;
        }
      }
      if ([v176 count])
      {
        v183 = [v176 firstObject];
        v184 = [v192 indexPathForContact:v183];
      }
      else
      {
        v184 = 0;
      }

      v169 = v192;
      if (v184)
      {
        v185 = [(CNContactNavigationController *)self->_contactNavigationController contactListViewController];
        v186 = [v185 collectionView];
        [v186 scrollToItemAtIndexPath:v184 atScrollPosition:2 animated:0];
      }
    }
  }
  v187 = [(CNContactPickerContentViewController *)self navigationItem];
  [v187 setLargeTitleDisplayMode:2];

  if (v194) {
    v194[2](v194, v193);
  }
}

- (CNContactPickerContentViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)CNContactPickerContentViewController;
  v2 = [(CNContactPickerContentViewController *)&v5 init];
  id v3 = [(CNContactPickerContentViewController *)v2 view];
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, 100.0, 100.0);

  return v2;
}

+ (id)descriptorForContactPropertiesSupportingPredicateEvaluation
{
  return +[CNContactContentViewController descriptorForRequiredKeys];
}

+ (id)log
{
  if (log_cn_once_token_1_60007 != -1) {
    dispatch_once(&log_cn_once_token_1_60007, &__block_literal_global_60008);
  }
  v2 = (void *)log_cn_once_object_1_60009;

  return v2;
}

void __43__CNContactPickerContentViewController_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.ui", "CNContactPickerContentViewController");
  v1 = (void *)log_cn_once_object_1_60009;
  log_cn_once_object_1_60009 = (uint64_t)v0;
}

@end