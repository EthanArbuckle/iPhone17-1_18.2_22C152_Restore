@interface CNContactNavigationController
+ (id)keyCommandForNewContact;
+ (id)newContactFormatter;
+ (void)moveViewController:(id)a3 toParent:(id)a4;
- (BOOL)accountsAndGroupsViewController:(id)a3 shouldEnableItemWithIdentifier:(id)a4;
- (BOOL)allowsCanceling;
- (BOOL)allowsCardDeletion;
- (BOOL)allowsCardEditing;
- (BOOL)allowsContactBlocking;
- (BOOL)allowsContactBlockingAndReporting;
- (BOOL)allowsDone;
- (BOOL)allowsLargeTitles;
- (BOOL)canAddContacts;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)contactListViewController:(id)a3 canSelectContact:(id)a4;
- (BOOL)contactListViewController:(id)a3 shouldSelectContact:(id)a4 atIndexPath:(id)a5;
- (BOOL)contactSuggestionViewController:(id)a3 shouldSelectContact:(id)a4 atIndexPath:(id)a5;
- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4;
- (BOOL)hasPendingShowCard;
- (BOOL)hideGroupsButton;
- (BOOL)hideMailToGroupButton;
- (BOOL)hidesSearchableSources;
- (BOOL)ignoresMapsData;
- (BOOL)isContactProviderDataSource;
- (BOOL)isDisplayingAddNewContactViewController;
- (BOOL)isPresentedContactViewControllerVisible;
- (BOOL)isSinglePickerOnVisionOS;
- (BOOL)shouldDisplayMeContactBanner;
- (BOOL)shouldFlipDirectionWhenChangingSelectionWithKey:(id)a3;
- (BOOL)shouldShowAccountsAndGroups;
- (BOOL)shouldShowAddToGroupPicker;
- (BOOL)shouldShowGroupsBackButton;
- (BOOL)shouldShowLeftCancelAndRightAddButton;
- (BOOL)shouldShowLeftCancelAndRightDoneButton;
- (BOOL)shouldShowLeftDoneAndRightAddButton;
- (BOOL)shouldShowLeftDoneAndRightEditButton;
- (BOOL)shouldShowMailButton;
- (BOOL)shouldShowRightAddAndCancelButton;
- (BOOL)shouldShowRightAddButton;
- (BOOL)shouldShowRightCancelButton;
- (CNAccountsAndGroupsDataSource)accountsAndGroupsDataSource;
- (CNAccountsAndGroupsViewController)accountsAndGroupsViewController;
- (CNContactDataSource)dataSource;
- (CNContactListStyleApplier)contactListStyleApplier;
- (CNContactNavigationController)initWithDataSource:(id)a3;
- (CNContactNavigationController)initWithDataSource:(id)a3 allowsLargeTitles:(BOOL)a4;
- (CNContactNavigationController)initWithDataSource:(id)a3 contactFormatter:(id)a4 applyGroupFilterFromPreferences:(BOOL)a5 environment:(id)a6 allowsLargeTitles:(BOOL)a7;
- (CNContactNavigationController)initWithDataSource:(id)a3 environment:(id)a4 allowsLargeTitles:(BOOL)a5;
- (CNContactStore)contactStore;
- (CNContactStoreDataSource)nonServerDataSource;
- (CNContactStyle)contactStyle;
- (CNContactViewController)presentedContactViewController;
- (CNContactViewController)reusableContactViewController;
- (CNManagedConfiguration)managedConfiguration;
- (CNScheduler)backgroundScheduler;
- (CNScheduler)mainThreadScheduler;
- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager;
- (CNUIUserActivityManager)activityManager;
- (NSArray)prohibitedPropertyKeys;
- (NSNumber)shouldShowAccountsAndGroupsCachedValue;
- (NSString)contactPickerTargetGroupIdentifier;
- (UIAlertController)facebookContactsAlertController;
- (UIBarButtonItem)addContactBarButtonItem;
- (UIBarButtonItem)mailButtonItem;
- (UIKeyCommand)addKeyCommand;
- (id)addContactPresenter;
- (id)allContactIdentifiers;
- (id)contactListViewController;
- (id)currentlyDisplayedContact;
- (id)firstVisibleContact;
- (id)nextResponderForContactListViewController:(id)a3;
- (id)parentGroupForCurrentFilter;
- (id)popViewControllerAnimated:(BOOL)a3;
- (id)reuseableContactViewControllerConfiguredForContact:(id)a3 mode:(int64_t)a4;
- (id)targetContainerForNewContactWithTargetGroup:(id)a3;
- (id)targetGroupForNewContact;
- (id)tipKitContext;
- (id)userActivityRepresentingCurrentlyDisplayedContact;
- (id)userActivityRepresentingGroupsView;
- (int)limitedAccessPickerType;
- (int64_t)hostIdiom;
- (int64_t)leftButtonBehavior;
- (int64_t)rightButtonBehavior;
- (unint64_t)limitedAccessContactCaption;
- (void)_cnui_presentViewController:(id)a3 animated:(BOOL)a4 dismissingPresentedController:(BOOL)a5 shouldHideContactListIfNeeded:(BOOL)a6;
- (void)_updateUserActivity;
- (void)accountsAndGroupsViewControllerDidCancel:(id)a3;
- (void)accountsAndGroupsViewControllerDidChangeList:(id)a3;
- (void)accountsAndGroupsViewControllerDidFinish:(id)a3;
- (void)accountsAndGroupsViewControllerDidGoBack:(id)a3;
- (void)accountsAndGroupsViewControllerDidUpdateSelection:(id)a3;
- (void)addContact:(id)a3;
- (void)addContact:(id)a3 animated:(BOOL)a4;
- (void)applicationDidResume;
- (void)beginSearch:(id)a3;
- (void)cancel:(id)a3;
- (void)cancelSearch:(id)a3;
- (void)checkForFacebookContactsWithDelay:(double)a3 allowAlert:(BOOL)a4;
- (void)clearServerSearchIfNeeded:(id)a3;
- (void)contactListViewController:(id)a3 didSelectContact:(id)a4;
- (void)contactListViewController:(id)a3 didSelectContact:(id)a4 shouldScrollToContact:(BOOL)a5;
- (void)contactListViewController:(id)a3 shouldPresentContact:(id)a4 shouldScrollToContact:(BOOL)a5;
- (void)contactListViewController:(id)a3 updatedSelectedContact:(id)a4;
- (void)contactListViewControllerSelectedAddContactToList:(id)a3 withSourceView:(id)a4;
- (void)contactPicker:(id)a3 didCompleteWithNewContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContacts:(id)a4;
- (void)contactStyleCurrentStyleDidChange:(id)a3;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)contactViewController:(id)a3 didCompleteWithNewContactFromPickerNewContactRow:(id)a4;
- (void)contactViewController:(id)a3 didDeleteContact:(id)a4;
- (void)dataSourceChangedForContactListViewController:(id)a3;
- (void)dealloc;
- (void)deleteContact:(id)a3;
- (void)didFinishLimitedAccessSelection;
- (void)didResetLimitedAccessSelectionTo:(id)a3;
- (void)didUpdateLimitedAccessSelection:(id)a3;
- (void)dismissSearchAndSelectContact:(id)a3 allowsMultiSelection:(BOOL)a4;
- (void)done:(id)a3;
- (void)editLimitedAccess;
- (void)executeAddContact;
- (void)mailContacts:(id)a3;
- (void)notifyOtherFacebookContactsAlertDidSelectAction;
- (void)observeOtherFacebookContactsAlert;
- (void)otherFacebookContactsAlertDidSelectActionWithNotification:(id)a3;
- (void)popToContactListAndSaveChanges:(BOOL)a3;
- (void)popToContactListAndSaveChanges:(BOOL)a3 animated:(BOOL)a4;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)presentAddContactViewController:(id)a3 animated:(BOOL)a4;
- (void)presentAddToGroupPickerWithSourceView:(id)a3;
- (void)presentErrorAlertWithTitle:(id)a3 message:(id)a4 animated:(BOOL)a5;
- (void)presentGroupsViewController:(id)a3;
- (void)presentGroupsViewControllerAnimated:(BOOL)a3;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)refreshMailButtonEnabled;
- (void)resetContactViewController;
- (void)scrollToContact:(id)a3 animated:(BOOL)a4;
- (void)searchForString:(id)a3;
- (void)searchForString:(id)a3 makeSearchBarFirstResponder:(BOOL)a4;
- (void)selectNextContact:(id)a3;
- (void)selectPreviousContact:(id)a3;
- (void)setAccountsAndGroupsDataSource:(id)a3;
- (void)setAccountsAndGroupsViewController:(id)a3;
- (void)setActivityManager:(id)a3;
- (void)setAddContactBarButtonItem:(id)a3;
- (void)setAddKeyCommand:(id)a3;
- (void)setAllowsCanceling:(BOOL)a3;
- (void)setAllowsCardDeletion:(BOOL)a3;
- (void)setAllowsCardEditing:(BOOL)a3;
- (void)setAllowsContactBlocking:(BOOL)a3;
- (void)setAllowsContactBlockingAndReporting:(BOOL)a3;
- (void)setAllowsDone:(BOOL)a3;
- (void)setAllowsLargeTitles:(BOOL)a3;
- (void)setContactListStyleApplier:(id)a3;
- (void)setContactPickerTargetGroupIdentifier:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContactStyle:(id)a3;
- (void)setFacebookContactsAlertController:(id)a3;
- (void)setGroupsAndContainersSaveManager:(id)a3;
- (void)setHasPendingShowCard:(BOOL)a3;
- (void)setHideGroupsButton:(BOOL)a3;
- (void)setHideMailToGroupButton:(BOOL)a3;
- (void)setHidesSearchableSources:(BOOL)a3;
- (void)setHostIdiom:(int64_t)a3;
- (void)setIgnoresMapsData:(BOOL)a3;
- (void)setLeftButtonBehavior:(int64_t)a3;
- (void)setLimitedAccessContactCaption:(unint64_t)a3;
- (void)setLimitedAccessPickerType:(int)a3;
- (void)setMailButtonItem:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setNonServerDataSource:(id)a3;
- (void)setPresentedContactViewController:(id)a3;
- (void)setProhibitedPropertyKeys:(id)a3;
- (void)setReusableContactViewController:(id)a3;
- (void)setRightButtonBehavior:(int64_t)a3;
- (void)setShouldDisplayMeContactBanner:(BOOL)a3;
- (void)setShouldShowAccountsAndGroupsCachedValue:(id)a3;
- (void)setUpAccountAndGroupsViewIfNeeded;
- (void)setUpLargeTitles;
- (void)showAllContactsList;
- (void)showAllContactsListAnimated:(BOOL)a3;
- (void)showCardForContact:(id)a3 animated:(BOOL)a4;
- (void)showCardForContact:(id)a3 animated:(BOOL)a4 scrollToContact:(BOOL)a5;
- (void)showCardForContact:(id)a3 resetFilter:(BOOL)a4 resetSearch:(BOOL)a5 fallbackToFirstContact:(BOOL)a6 scrollToContact:(BOOL)a7 animated:(BOOL)a8;
- (void)showCardForContact:(id)a3 resetFilter:(BOOL)a4 resetSearch:(BOOL)a5 fallbackToFirstContact:(BOOL)a6 scrollToContact:(BOOL)a7 animated:(BOOL)a8 dismissingPresentedController:(BOOL)a9;
- (void)showCardForContact:(id)a3 resetFilter:(BOOL)a4 resetSearch:(BOOL)a5 fallbackToFirstContact:(BOOL)a6 scrollToContact:(BOOL)a7 animated:(BOOL)a8 dismissingPresentedController:(BOOL)a9 shouldHideContactListIfNeeded:(BOOL)a10;
- (void)showCardForContactAfterIndexPath:(id)a3;
- (void)showCardForContactBeforeIndexPath:(id)a3;
- (void)showCardForContactIfPossible:(id)a3;
- (void)showNewDraftContact:(id)a3 animated:(BOOL)a4;
- (void)startEditingPresentedContact;
- (void)toggleEditContact:(id)a3;
- (void)toggleGroupsPanel:(id)a3;
- (void)updateLeftNavigationButtonAnimated:(BOOL)a3;
- (void)updateNavigationButtonsAnimated:(BOOL)a3;
- (void)updateNavigationButtonsAnimated:(BOOL)a3 viewWillAppear:(BOOL)a4;
- (void)updateNavigationButtonsInSearchMode:(BOOL)a3;
- (void)updateNavigationButtonsInSearchMode:(BOOL)a3 animated:(BOOL)a4;
- (void)updateUserActivityState:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CNContactNavigationController

- (BOOL)contactListViewController:(id)a3 canSelectContact:(id)a4
{
  id v5 = a4;
  v6 = [(CNContactNavigationController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(CNContactNavigationController *)self delegate];
    char v9 = [v8 contactNavigationController:self canSelectContact:v5];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (void)setHideGroupsButton:(BOOL)a3
{
  self->_hideGroupsButton = a3;
  [(CNContactNavigationController *)self updateLeftNavigationButtonAnimated:0];
}

- (void)updateNavigationButtonsAnimated:(BOOL)a3
{
}

- (void)applicationDidResume
{
}

- (void)updateNavigationButtonsInSearchMode:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v37[1] = *MEMORY[0x1E4F143B8];
  if (a3 && [(CNContactNavigationController *)self allowsCanceling])
  {
    if (![(CNContactNavigationController *)self shouldShowLeftCancelAndRightDoneButton]&& [(CNContactNavigationController *)self shouldShowRightCancelButton])
    {
      goto LABEL_5;
    }
    int64_t v6 = 1;
  }
  else if ([(CNContactNavigationController *)self shouldShowLeftCloseAndRightGroupsButton])
  {
    int64_t v6 = 6;
  }
  else if ([(CNContactNavigationController *)self shouldShowLeftCancelAndRightDoneButton])
  {
    int64_t v6 = 3;
  }
  else if ([(CNContactNavigationController *)self shouldShowLeftDoneAndRightAddButton])
  {
    int64_t v6 = 5;
  }
  else if ([(CNContactNavigationController *)self shouldShowLeftDoneAndRightEditButton])
  {
    int64_t v6 = 9;
  }
  else if ([(CNContactNavigationController *)self shouldShowLeftCancelAndRightAddButton])
  {
    int64_t v6 = 4;
  }
  else if ([(CNContactNavigationController *)self shouldShowRightAddAndCancelButton])
  {
    int64_t v6 = 8;
  }
  else
  {
    if ([(CNContactNavigationController *)self shouldShowRightCancelButton])
    {
LABEL_5:
      int64_t v6 = 2;
      goto LABEL_22;
    }
    BOOL v7 = [(CNContactNavigationController *)self shouldShowRightAddButton];
    int64_t v6 = 7;
    if (!v7) {
      int64_t v6 = 0;
    }
  }
LABEL_22:
  if (self->_rightButtonBehavior != v6)
  {
    self->_rightButtonBehavior = v6;
    switch(v6)
    {
      case 1:
      case 3:
        v18 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_done_];
        v35 = v18;
        v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];

        if ([(CNContactNavigationController *)self limitedAccessPickerType] != 2) {
          goto LABEL_39;
        }
        v19 = [v10 objectAtIndexedSubscript:0];
        [v19 setEnabled:0];
        goto LABEL_38;
      case 2:
        v19 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel_];
        v36 = v19;
        v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
        goto LABEL_38;
      case 4:
      case 5:
      case 7:
        v12 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:4 target:self action:sel_addContact_];
        v34 = v12;
        v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];

        uint64_t v13 = [v10 firstObject];
        goto LABEL_41;
      case 6:
        id v20 = objc_alloc(MEMORY[0x1E4FB14A8]);
        v19 = CNContactsUIBundle();
        v21 = [v19 localizedStringForKey:@"LISTS" value:&stru_1ED8AC728 table:@"Localized"];
        v22 = (void *)[v20 initWithTitle:v21 style:0 target:self action:sel_presentGroupsViewController_];
        v37[0] = v22;
        v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];

LABEL_38:
        goto LABEL_39;
      case 8:
        v23 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel_];
        v33[0] = v23;
        v24 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:4 target:self action:sel_addContact_];
        v33[1] = v24;
        v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];

        uint64_t v13 = [v10 lastObject];
LABEL_41:
        v16 = (void *)v13;
        v15 = [(id)objc_opt_class() keyCommandForNewContact];
        goto LABEL_42;
      case 9:
        v30 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:2 target:self action:sel_editLimitedAccess];
        v32 = v30;
        v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];

        v16 = [v10 firstObject];
        v15 = 0;
        goto LABEL_42;
      default:
        v10 = 0;
LABEL_39:
        v15 = 0;
        v16 = 0;
LABEL_42:
        [(CNContactNavigationController *)self setAddContactBarButtonItem:v16];
        v25 = [(CNContactNavigationController *)self addKeyCommand];

        if (v25)
        {
          v26 = [(CNContactNavigationController *)self addKeyCommand];
          [(CNContactNavigationController *)self removeKeyCommand:v26];
        }
        if (v15) {
          [(CNContactNavigationController *)self addKeyCommand:v15];
        }
        [(CNContactNavigationController *)self setAddKeyCommand:v15];
        if ([(CNContactNavigationController *)self shouldShowMailButton])
        {
          v27 = [(CNContactNavigationController *)self mailButtonItem];
          uint64_t v28 = [v10 arrayByAddingObject:v27];

          v10 = (void *)v28;
        }
        v17 = [(CNContactNavigationController *)self contactListViewController];
        v29 = [v17 navigationItem];
        [v29 setRightBarButtonItems:v10 animated:v4];

        break;
    }
    goto LABEL_49;
  }
  v8 = [(CNContactNavigationController *)self contactListViewController];
  char v9 = [v8 navigationItem];
  v10 = [v9 rightBarButtonItems];

  if (self->_mailButtonItem) {
    int v11 = objc_msgSend(v10, "containsObject:");
  }
  else {
    int v11 = 0;
  }
  if (v11 != [(CNContactNavigationController *)self shouldShowMailButton])
  {
    if ([(CNContactNavigationController *)self shouldShowMailButton])
    {
      v14 = [(CNContactNavigationController *)self mailButtonItem];
      v15 = [v10 arrayByAddingObject:v14];
    }
    else
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __78__CNContactNavigationController_updateNavigationButtonsInSearchMode_animated___block_invoke;
      v31[3] = &unk_1E54982C0;
      v31[4] = self;
      v15 = objc_msgSend(v10, "_cn_filter:", v31);
    }
    v16 = [(CNContactNavigationController *)self contactListViewController];
    v17 = [v16 navigationItem];
    [v17 setRightBarButtonItems:v15];
LABEL_49:
  }
  [(CNContactNavigationController *)self refreshMailButtonEnabled];
  [(CNContactNavigationController *)self updateLeftNavigationButtonAnimated:v4];
}

- (void)updateLeftNavigationButtonAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([MEMORY[0x1E4FB1438] shouldMakeUIForDefaultPNG])
  {
    int64_t v5 = 0;
    goto LABEL_10;
  }
  if ([(CNContactNavigationController *)self shouldShowGroupsBackButton])
  {
    int64_t v5 = 1;
    goto LABEL_10;
  }
  if ([(CNContactNavigationController *)self shouldShowLeftCancelAndRightDoneButton])
  {
    goto LABEL_6;
  }
  if ([(CNContactNavigationController *)self shouldShowLeftDoneAndRightAddButton]
    || [(CNContactNavigationController *)self shouldShowLeftDoneAndRightEditButton])
  {
    int64_t v5 = 3;
  }
  else
  {
    if ([(CNContactNavigationController *)self shouldShowLeftCancelAndRightAddButton])
    {
LABEL_6:
      int64_t v5 = 2;
      goto LABEL_10;
    }
    if ([(CNContactNavigationController *)self shouldShowLeftCloseAndRightGroupsButton])
    {
      int64_t v5 = 4;
    }
    else
    {
      int64_t v5 = 0;
    }
  }
LABEL_10:
  if (self->_leftButtonBehavior != v5)
  {
    self->_leftButtonBehavior = v5;
    int64_t v6 = [(CNContactNavigationController *)self contactListViewController];
    BOOL v7 = [v6 navigationItem];
    [v7 setHidesBackButton:1];

    switch(v5)
    {
      case 1:
        v8 = [(CNContactNavigationController *)self contactListViewController];
        char v9 = [v8 navigationItem];
        [v9 setHidesBackButton:0];

        goto LABEL_13;
      case 2:
        id v10 = objc_alloc(MEMORY[0x1E4FB14A8]);
        int v11 = sel_cancel_;
        uint64_t v12 = 1;
        goto LABEL_17;
      case 3:
        id v10 = objc_alloc(MEMORY[0x1E4FB14A8]);
        int v11 = sel_done_;
        uint64_t v12 = 0;
        goto LABEL_17;
      case 4:
        id v10 = objc_alloc(MEMORY[0x1E4FB14A8]);
        int v11 = sel_cancel_;
        uint64_t v12 = 24;
LABEL_17:
        id v15 = (id)[v10 initWithBarButtonSystemItem:v12 target:self action:v11];
        break;
      default:
LABEL_13:
        id v15 = 0;
        break;
    }
    uint64_t v13 = [(CNContactNavigationController *)self contactListViewController];
    v14 = [v13 navigationItem];
    [v14 setLeftBarButtonItem:v15 animated:v3];
  }
}

- (CNContactDataSource)dataSource
{
  v2 = [(CNContactNavigationController *)self contactListViewController];
  BOOL v3 = [v2 dataSource];

  return (CNContactDataSource *)v3;
}

- (id)contactListViewController
{
  return self->_contactListViewController;
}

- (BOOL)shouldShowGroupsBackButton
{
  if ([(CNContactNavigationController *)self isSinglePickerOnVisionOS])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    BOOL v3 = [(CNContactNavigationController *)self shouldShowAccountsAndGroups];
    if (v3) {
      LOBYTE(v3) = ![(CNContactNavigationController *)self hideGroupsButton];
    }
  }
  return v3;
}

- (BOOL)isSinglePickerOnVisionOS
{
  if ([(CNContactNavigationController *)self hostIdiom] == 6)
  {
    BOOL v3 = [(CNContactNavigationController *)self contactListViewController];
    int v4 = [v3 allowsMultiSelection] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (int64_t)hostIdiom
{
  return self->_hostIdiom;
}

- (BOOL)hideGroupsButton
{
  return self->_hideGroupsButton;
}

- (BOOL)shouldShowRightCancelButton
{
  BOOL v3 = [(CNContactNavigationController *)self allowsCanceling];
  if (v3) {
    LOBYTE(v3) = ![(CNContactNavigationController *)self hideGroupsButton]
  }
              && [(CNContactNavigationController *)self limitedAccessPickerType] != 1;
  return v3;
}

- (BOOL)shouldShowRightAddButton
{
  BOOL v3 = [(CNContactNavigationController *)self allowsCardEditing];
  if (v3)
  {
    LOBYTE(v3) = [(CNContactNavigationController *)self canAddContacts];
  }
  return v3;
}

- (BOOL)shouldShowRightAddAndCancelButton
{
  if (![(CNContactNavigationController *)self allowsCanceling]
    || ![(CNContactNavigationController *)self shouldShowRightAddButton])
  {
    return 0;
  }

  return [(CNContactNavigationController *)self shouldShowGroupsBackButton];
}

- (BOOL)shouldShowLeftDoneAndRightEditButton
{
  return [(CNContactNavigationController *)self limitedAccessPickerType] == 5;
}

- (BOOL)shouldShowLeftDoneAndRightAddButton
{
  BOOL v3 = [(CNContactNavigationController *)self allowsDone];
  if (v3)
  {
    BOOL v3 = [(CNContactNavigationController *)self shouldShowRightAddButton];
    if (v3) {
      LOBYTE(v3) = ![(CNContactNavigationController *)self shouldShowGroupsBackButton];
    }
  }
  return v3;
}

- (BOOL)shouldShowLeftCancelAndRightDoneButton
{
  BOOL v3 = [(CNContactNavigationController *)self allowsCanceling];
  if (v3)
  {
    LOBYTE(v3) = [(CNContactNavigationController *)self allowsDone];
  }
  return v3;
}

- (BOOL)shouldShowLeftCancelAndRightAddButton
{
  BOOL v3 = [(CNContactNavigationController *)self allowsCanceling];
  if (v3)
  {
    BOOL v3 = [(CNContactNavigationController *)self shouldShowRightAddButton];
    if (v3) {
      LOBYTE(v3) = ![(CNContactNavigationController *)self shouldShowGroupsBackButton];
    }
  }
  return v3;
}

- (BOOL)allowsCanceling
{
  return self->_allowsCanceling;
}

- (void)refreshMailButtonEnabled
{
  if ([(CNContactNavigationController *)self shouldShowMailButton])
  {
    id v6 = [(CNContactListViewController *)self->_contactListViewController originalDataSource];
    BOOL v3 = [v6 contacts];
    if ([v3 count])
    {
      int v4 = [(CNContactListViewController *)self->_contactListViewController originalDataSource];
      int64_t v5 = [v4 contacts];
      -[UIBarButtonItem setEnabled:](self->_mailButtonItem, "setEnabled:", (unint64_t)[v5 count] < 0x65);
    }
    else
    {
      [(UIBarButtonItem *)self->_mailButtonItem setEnabled:0];
    }
  }
}

- (int)limitedAccessPickerType
{
  return self->_limitedAccessPickerType;
}

- (BOOL)canAddContacts
{
  BOOL v3 = [(CNContactNavigationController *)self dataSource];
  int v4 = [v3 filter];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v5 = [(CNContactNavigationController *)self dataSource];
    id v6 = [v5 filter];
    BOOL v7 = ([v6 isServerFilter] & 1) == 0
      && [MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] == 3;
  }
  else
  {
    BOOL v7 = [MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] == 3;
  }

  return v7;
}

- (BOOL)isContactProviderDataSource
{
  objc_opt_class();
  BOOL v3 = [(CNContactNavigationController *)self dataSource];
  if (objc_opt_isKindOfClass()) {
    int v4 = v3;
  }
  else {
    int v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [v5 filteredContainer];
    BOOL v7 = [v6 type] == 1003;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)shouldShowMailButton
{
  objc_opt_class();
  BOOL v3 = [(CNContactListViewController *)self->_contactListViewController originalDataSource];
  if (objc_opt_isKindOfClass()) {
    int v4 = v3;
  }
  else {
    int v4 = 0;
  }
  id v5 = v4;

  if (v5 && ![(CNContactNavigationController *)self hideMailToGroupButton])
  {
    if ([v5 filterShowsSingleGroup]) {
      char v6 = 1;
    }
    else {
      char v6 = [v5 filterShowsSingleExchangeFolder];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)hideMailToGroupButton
{
  return self->_hideMailToGroupButton;
}

- (BOOL)allowsDone
{
  return self->_allowsDone;
}

- (BOOL)allowsCardEditing
{
  if (self->_allowsCardEditing) {
    return ![(CNContactNavigationController *)self isContactProviderDataSource];
  }
  else {
    return 0;
  }
}

- (CNContactNavigationController)initWithDataSource:(id)a3 contactFormatter:(id)a4 applyGroupFilterFromPreferences:(BOOL)a5 environment:(id)a6 allowsLargeTitles:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  v86[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v85.receiver = self;
  v85.super_class = (Class)CNContactNavigationController;
  id v15 = [(CNContactNavigationController *)&v85 initWithNibName:0 bundle:0];
  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = [v12 store];
      contactStore = v15->_contactStore;
      v15->_contactStore = (CNContactStore *)v16;

      if (v9)
      {
        v18 = +[CNContactStoreFilter contactStoreFilterFromPreferencesWithContactStore:v15->_contactStore];
        if (v18) {
          [v12 setFilter:v18];
        }
      }
      v19 = [[CNAccountsAndGroupsDataSource alloc] initWithStore:v15->_contactStore];
      [(CNContactNavigationController *)v15 setAccountsAndGroupsDataSource:v19];

      id v20 = [[CNUIGroupsAndContainersSaveManager alloc] initWithContactStore:v15->_contactStore];
      uint64_t v21 = 1568;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v12 store];
      }
      else {
      id v20 = [v14 inProcessContactStore];
      }
      uint64_t v21 = 1448;
    }
    v22 = *(Class *)((char *)&v15->super.super.super.super.isa + v21);
    *(Class *)((char *)&v15->super.super.super.super.isa + v21) = (Class)v20;

    v23 = [v14 defaultSchedulerProvider];
    uint64_t v24 = [v23 backgroundSchedulerWithQualityOfService:2];
    backgroundScheduler = v15->_backgroundScheduler;
    v15->_backgroundScheduler = (CNScheduler *)v24;

    v26 = [v14 defaultSchedulerProvider];
    uint64_t v27 = [v26 mainThreadScheduler];
    mainThreadScheduler = v15->_mainThreadScheduler;
    v15->_mainThreadScheduler = (CNScheduler *)v27;

    v29 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v30 = [v29 bundleIdentifier];

    id v31 = objc_alloc(MEMORY[0x1E4F5A440]);
    v32 = [MEMORY[0x1E4F5A448] sharedConnection];
    v79 = (void *)v30;
    uint64_t v33 = [v31 initWithBundleIdentifier:v30 managedProfileConnection:v32];
    managedConfiguration = v15->_managedConfiguration;
    v15->_managedConfiguration = (CNManagedConfiguration *)v33;

    if (!v13)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1B910]);
      [v13 setStyle:0];
      [v13 setEmphasizesPrimaryNameComponent:1];
      [v13 setFallbackStyle:-1];
    }
    if (objc_opt_respondsToSelector()) {
      [v12 setContactFormatter:v13];
    }
    [(CNContactNavigationController *)v15 setAllowsLargeTitles:v7];
    v35 = +[CNContactStyle currentStyle];
    [(CNContactNavigationController *)v15 setContactStyle:v35];

    v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v36 addObserver:v15 selector:sel_contactStyleCurrentStyleDidChange_ name:@"CNContactStyleCurrentStyleDidChangeNotification" object:0];

    id v82 = v12;
    v37 = [[CNContactListViewController alloc] initWithDataSource:v12 environment:v14 shouldUseLargeTitle:v7];
    id v81 = v13;
    [(CNContactListViewController *)v37 setContactFormatter:v13];
    [(CNContactListViewController *)v37 setDelegate:v15];
    v38 = [(CNContactNavigationController *)v15 contactListStyleApplier];
    [(CNContactListViewController *)v37 setContactListStyleApplier:v38];

    v39 = [(CNContactListViewController *)v37 navigationItem];
    [v39 setHidesBackButton:1];

    v40 = [(CNContactListViewController *)v37 navigationItem];
    [v40 setStyle:0];

    if (CNUIIsMobilePhone() || CNUIIsContacts()) {
      [(CNContactListViewController *)v37 setAllowsMultiSelectContextMenus:1];
    }
    id v80 = v14;
    uint64_t v41 = [v14 inProcessActivityManager];
    activityManager = v15->_activityManager;
    v15->_activityManager = (CNUIUserActivityManager *)v41;

    objc_storeStrong((id *)&v15->_contactListViewController, v37);
    v86[0] = v37;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:1];
    [(CNContactNavigationController *)v15 setViewControllers:v43];

    v44 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"f" modifierFlags:0x100000 action:sel_beginSearch_];
    v45 = CNContactsUIBundle();
    v46 = [v45 localizedStringForKey:@"BEGIN_SEARCH_KEYBOARD_DISCOVERY" value:&stru_1ED8AC728 table:@"Localized"];
    [v44 setDiscoverabilityTitle:v46];

    v78 = v44;
    [(CNContactNavigationController *)v15 addKeyCommand:v44];
    v47 = objc_msgSend(MEMORY[0x1E4FB18D0], "keyCommandWithInput:modifierFlags:action:", @"[", 0x100000);
    v48 = CNContactsUIBundle();
    v49 = [v48 localizedStringForKey:@"SELECT_PREVIOUS_CONTACT_KEYBOARD_DISCOVERY" value:&stru_1ED8AC728 table:@"Localized"];
    [v47 setDiscoverabilityTitle:v49];

    v77 = v47;
    [(CNContactNavigationController *)v15 addKeyCommand:v47];
    v50 = objc_msgSend(MEMORY[0x1E4FB18D0], "keyCommandWithInput:modifierFlags:action:", @"]", 0x100000);
    v51 = CNContactsUIBundle();
    v52 = [v51 localizedStringForKey:@"SELECT_NEXT_CONTACT_KEYBOARD_DISCOVERY" value:&stru_1ED8AC728 table:@"Localized"];
    [v50 setDiscoverabilityTitle:v52];

    v76 = v50;
    [(CNContactNavigationController *)v15 addKeyCommand:v50];
    v53 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"s" modifierFlags:1310720 action:sel_toggleGroupsPanel_];
    v54 = CNContactsUIBundle();
    v55 = [v54 localizedStringForKey:@"TOGGLE_GROUPS_PANEL_KEYBOARD_DISCOVERY" value:&stru_1ED8AC728 table:@"Localized"];
    [v53 setDiscoverabilityTitle:v55];

    v75 = v53;
    [(CNContactNavigationController *)v15 addKeyCommand:v53];
    v56 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"l" modifierFlags:0x100000 action:sel_toggleEditContact_];
    v57 = CNContactsUIBundle();
    v58 = [v57 localizedStringForKey:@"EDIT_CONTACT_KEYBOARD_DISCOVERY" value:&stru_1ED8AC728 table:@"Localized"];
    [v56 setDiscoverabilityTitle:v58];

    [(CNContactNavigationController *)v15 addKeyCommand:v56];
    v74 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\b" modifierFlags:0x100000 action:sel_deleteContact_];
    -[CNContactNavigationController addKeyCommand:](v15, "addKeyCommand:");
    v59 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\b" modifierFlags:0 action:sel_deleteContact_];
    v60 = CNContactsUIBundle();
    v61 = [v60 localizedStringForKey:@"DELETE_SELECTED_CONTACT_KEYBOARD_DISCOVERY" value:&stru_1ED8AC728 table:@"Localized"];
    [v59 setDiscoverabilityTitle:v61];

    [(CNContactNavigationController *)v15 addKeyCommand:v59];
    v62 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"L" modifierFlags:1179648 action:sel_mergeUnifyContacts_];
    v63 = CNContactsUIBundle();
    v64 = [v63 localizedStringForKey:@"MERGE_UNIFY_SELECTED_CONTACTS_KEYBOARD_DISCOVERY" value:&stru_1ED8AC728 table:@"Localized"];
    [v62 setDiscoverabilityTitle:v64];

    [(CNContactNavigationController *)v15 addKeyCommand:v62];
    v65 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"V" modifierFlags:0x100000 action:sel_pasteContacts_];
    v66 = CNContactsUIBundle();
    v67 = [v66 localizedStringForKey:@"PASTE_CONTACTS_KEYBOARD_DISCOVERY" value:&stru_1ED8AC728 table:@"Localized"];
    [v65 setDiscoverabilityTitle:v67];

    [v65 setWantsPriorityOverSystemBehavior:1];
    [(CNContactNavigationController *)v15 addKeyCommand:v65];
    v68 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B90] modifierFlags:0 action:sel_selectNextContact_];
    [(CNContactNavigationController *)v15 addKeyCommand:v68];

    v69 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B78] modifierFlags:0 action:sel_selectPreviousContact_];
    [(CNContactNavigationController *)v15 addKeyCommand:v69];

    v70 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    v71 = [v70 featureFlags];
    LODWORD(v66) = [v71 isFeatureEnabled:18];

    if (v66)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __131__CNContactNavigationController_initWithDataSource_contactFormatter_applyGroupFilterFromPreferences_environment_allowsLargeTitles___block_invoke;
      block[3] = &unk_1E549B488;
      v84 = v15;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    v72 = v15;

    id v13 = v81;
    id v12 = v82;
    id v14 = v80;
  }

  return v15;
}

- (void)setContactStyle:(id)a3
{
  objc_storeStrong((id *)&self->_contactStyle, a3);
  id v5 = a3;
  id v7 = +[CNContactListStyleProvider contactListStyleWithContactStyle:v5];
  char v6 = [[CNContactListStyleApplier alloc] initWithContactListStyle:v7];
  [(CNContactNavigationController *)self setContactListStyleApplier:v6];

  LODWORD(v6) = [v5 shouldPresentInCurrentContext];
  [(CNContactNavigationController *)self _setBuiltinTransitionStyle:v6];
}

- (void)setContactListStyleApplier:(id)a3
{
  objc_storeStrong((id *)&self->_contactListStyleApplier, a3);
  id v5 = a3;
  [(CNContactListViewController *)self->_contactListViewController setContactListStyleApplier:v5];
}

- (void)setAllowsLargeTitles:(BOOL)a3
{
  self->_allowsLargeTitles = a3;
}

- (void)setAccountsAndGroupsDataSource:(id)a3
{
}

- (CNContactListStyleApplier)contactListStyleApplier
{
  return self->_contactListStyleApplier;
}

- (void)setAddKeyCommand:(id)a3
{
}

- (void)setAddContactBarButtonItem:(id)a3
{
}

- (UIKeyCommand)addKeyCommand
{
  return self->_addKeyCommand;
}

- (CNAccountsAndGroupsViewController)accountsAndGroupsViewController
{
  accountsAndGroupsViewController = self->_accountsAndGroupsViewController;
  if (!accountsAndGroupsViewController)
  {
    int v4 = (CNAccountsAndGroupsViewController *)objc_opt_new();
    id v5 = [(CNContactNavigationController *)self nonServerDataSource];
    if (v5) {
      [(CNContactNavigationController *)self nonServerDataSource];
    }
    else {
    char v6 = [(CNContactListViewController *)self->_contactListViewController dataSource];
    }
    id v7 = [v6 filter];
    v8 = [(CNContactNavigationController *)self accountsAndGroupsDataSource];
    [v8 setFilter:v7];

    BOOL v9 = [(CNContactNavigationController *)self accountsAndGroupsDataSource];
    [v9 reload];

    id v10 = [(CNContactNavigationController *)self accountsAndGroupsDataSource];
    [(CNAccountsAndGroupsViewController *)v4 setDataSource:v10];

    [(CNAccountsAndGroupsViewController *)v4 setDelegate:self];
    int v11 = [(CNContactNavigationController *)self managedConfiguration];
    [(CNAccountsAndGroupsViewController *)v4 setManagedConfiguration:v11];

    id v12 = [(CNAccountsAndGroupsViewController *)v4 navigationItem];
    [v12 setHidesBackButton:1];

    id v13 = [(CNAccountsAndGroupsViewController *)v4 navigationItem];
    [v13 setStyle:0];

    id v14 = self->_accountsAndGroupsViewController;
    self->_accountsAndGroupsViewController = v4;

    accountsAndGroupsViewController = self->_accountsAndGroupsViewController;
  }

  return accountsAndGroupsViewController;
}

- (BOOL)shouldShowAccountsAndGroups
{
  v2 = [(CNContactNavigationController *)self accountsAndGroupsDataSource];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CNAccountsAndGroupsDataSource)accountsAndGroupsDataSource
{
  return self->_accountsAndGroupsDataSource;
}

- (CNContactStoreDataSource)nonServerDataSource
{
  return self->_nonServerDataSource;
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

+ (id)keyCommandForNewContact
{
  v2 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"n" modifierFlags:0x100000 action:sel_addContact_];
  BOOL v3 = CNContactsUIBundle();
  int v4 = [v3 localizedStringForKey:@"ADD_CONTACT_KEYBOARD_DISCOVERY" value:&stru_1ED8AC728 table:@"Localized"];
  [v2 setDiscoverabilityTitle:v4];

  return v2;
}

- (void)setAllowsCardEditing:(BOOL)a3
{
  self->_allowsCardEditing = a3;
}

- (void)setAllowsCardDeletion:(BOOL)a3
{
  self->_allowsCardDeletion = a3;
}

- (void)setUpLargeTitles
{
  BOOL v3 = [(CNContactNavigationController *)self allowsLargeTitles];
  int v4 = [(CNContactNavigationController *)self navigationController];
  id v5 = [v4 navigationBar];
  [v5 setPrefersLargeTitles:v3];

  BOOL v6 = [(CNContactNavigationController *)self allowsLargeTitles];
  id v7 = [(CNContactNavigationController *)self navigationBar];
  [v7 setPrefersLargeTitles:v6];
}

- (BOOL)allowsLargeTitles
{
  return self->_allowsLargeTitles;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactNavigationController *)self contactListViewController];
  BOOL v6 = [(CNContactNavigationController *)self tipKitContext];
  [v5 setTipKitContext:v6];

  v14.receiver = self;
  v14.super_class = (Class)CNContactNavigationController;
  [(CNContactNavigationController *)&v14 viewWillAppear:v3];
  [(CNContactNavigationController *)self setUpLargeTitles];
  [(CNContactNavigationController *)self updateNavigationButtonsAnimated:0 viewWillAppear:1];
  id v7 = [(CNContactNavigationController *)self navigationBar];
  v8 = [(CNContactNavigationController *)self view];
  [v8 bounds];
  [v7 _setRequestedMaxBackButtonWidth:v9 / 3.0];

  id v10 = [(CNContactNavigationController *)self navigationController];
  int v11 = [v10 navigationBar];
  id v12 = [(CNContactNavigationController *)self view];
  [v12 bounds];
  [v11 _setRequestedMaxBackButtonWidth:v13 / 3.0];
}

- (void)updateNavigationButtonsAnimated:(BOOL)a3 viewWillAppear:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(CNContactNavigationController *)self visibleViewController];
  v8 = [v7 viewIfLoaded];
  double v9 = [v8 window];

  if (v9 || v4)
  {
    BOOL v10 = [(CNContactListViewController *)self->_contactListViewController isSearching];
    [(CNContactNavigationController *)self updateNavigationButtonsInSearchMode:v10 animated:v5];
  }
}

- (id)tipKitContext
{
  return 0;
}

+ (id)newContactFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1B910]);
  [v2 setStyle:0];
  [v2 setEmphasizesPrimaryNameComponent:1];
  [v2 setFallbackStyle:-1];
  return v2;
}

- (void)checkForFacebookContactsWithDelay:(double)a3 allowAlert:(BOOL)a4
{
  id v7 = [(CNContactNavigationController *)self backgroundScheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke;
  v9[3] = &unk_1E5499510;
  v9[4] = self;
  BOOL v10 = a4;
  id v8 = (id)[v7 afterDelay:v9 performBlock:a3];
}

- (CNScheduler)backgroundScheduler
{
  return self->_backgroundScheduler;
}

- (void)setAllowsContactBlocking:(BOOL)a3
{
  self->_allowsContactBlocking = a3;
}

- (CNContactNavigationController)initWithDataSource:(id)a3 allowsLargeTitles:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[CNUIContactsEnvironment currentEnvironment];
  id v8 = [(CNContactNavigationController *)self initWithDataSource:v6 environment:v7 allowsLargeTitles:v4];

  return v8;
}

- (CNContactNavigationController)initWithDataSource:(id)a3 environment:(id)a4 allowsLargeTitles:(BOOL)a5
{
  return [(CNContactNavigationController *)self initWithDataSource:a3 contactFormatter:0 applyGroupFilterFromPreferences:1 environment:a4 allowsLargeTitles:a5];
}

void __131__CNContactNavigationController_initWithDataSource_contactFormatter_applyGroupFilterFromPreferences_environment_allowsLargeTitles___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentedContactViewController];

  if (!v2)
  {
    BOOL v3 = +[CNUIDraftSupport loadNewContactDraft];
    if (v3)
    {
      BOOL v4 = v3;
      [*(id *)(a1 + 32) showNewDraftContact:v3 animated:1];
      BOOL v3 = v4;
    }
  }
}

- (CNContactViewController)presentedContactViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedContactViewController);

  return (CNContactViewController *)WeakRetained;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactNavigationController;
  [(CNContactNavigationController *)&v3 viewDidLoad];
  [(CNContactNavigationController *)self setUpAccountAndGroupsViewIfNeeded];
}

- (void)setUpAccountAndGroupsViewIfNeeded
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([(CNContactNavigationController *)self shouldShowGroupsBackButton])
  {
    objc_super v3 = [(CNContactNavigationController *)self delegate];
    char v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) == 0
      || ([(CNContactNavigationController *)self delegate],
          BOOL v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 contactNavigationControllerShouldManageGroupsController:self],
          v5,
          v6))
    {
      if ([(CNContactNavigationController *)self isSinglePickerOnVisionOS])
      {
        id v7 = [(CNContactNavigationController *)self contactListViewController];
        v11[0] = v7;
        id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
        [(CNContactNavigationController *)self setViewControllers:v8];
      }
      else
      {
        id v7 = [(CNContactNavigationController *)self accountsAndGroupsViewController];
        id v8 = [(CNContactNavigationController *)self contactListViewController];
        v10[1] = v8;
        double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
        [(CNContactNavigationController *)self setViewControllers:v9];
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_contactPickerTargetGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_addContactBarButtonItem, 0);
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_contactListStyleApplier, 0);
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, 0);
  objc_storeStrong((id *)&self->_mailButtonItem, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_mainThreadScheduler, 0);
  objc_storeStrong((id *)&self->_backgroundScheduler, 0);
  objc_destroyWeak((id *)&self->_facebookContactsAlertController);
  objc_storeStrong((id *)&self->_addKeyCommand, 0);
  objc_destroyWeak((id *)&self->_presentedContactViewController);
  objc_storeStrong((id *)&self->_nonServerDataSource, 0);
  objc_storeStrong((id *)&self->_accountsAndGroupsDataSource, 0);
  objc_storeStrong((id *)&self->_accountsAndGroupsViewController, 0);
  objc_storeStrong((id *)&self->_shouldShowAccountsAndGroupsCachedValue, 0);
  objc_storeStrong((id *)&self->_reusableContactViewController, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contactStyle, 0);

  objc_storeStrong((id *)&self->_contactListViewController, 0);
}

- (void)setHostIdiom:(int64_t)a3
{
  self->_hostIdiom = a3;
}

- (NSString)contactPickerTargetGroupIdentifier
{
  return self->_contactPickerTargetGroupIdentifier;
}

- (void)setHideMailToGroupButton:(BOOL)a3
{
  self->_hideMailToGroupButton = a3;
}

- (UIBarButtonItem)addContactBarButtonItem
{
  return self->_addContactBarButtonItem;
}

- (void)setProhibitedPropertyKeys:(id)a3
{
}

- (NSArray)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (void)setLimitedAccessContactCaption:(unint64_t)a3
{
  self->_limitedAccessContactCaption = a3;
}

- (unint64_t)limitedAccessContactCaption
{
  return self->_limitedAccessContactCaption;
}

- (void)setLimitedAccessPickerType:(int)a3
{
  self->_limitedAccessPickerType = a3;
}

- (void)setIgnoresMapsData:(BOOL)a3
{
  self->_ignoresMapsData = a3;
}

- (BOOL)ignoresMapsData
{
  return self->_ignoresMapsData;
}

- (void)setGroupsAndContainersSaveManager:(id)a3
{
}

- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager
{
  return self->_groupsAndContainersSaveManager;
}

- (void)setMailButtonItem:(id)a3
{
}

- (void)setActivityManager:(id)a3
{
}

- (CNUIUserActivityManager)activityManager
{
  return self->_activityManager;
}

- (void)setHasPendingShowCard:(BOOL)a3
{
  self->_hasPendingShowCard = a3;
}

- (BOOL)hasPendingShowCard
{
  return self->_hasPendingShowCard;
}

- (CNScheduler)mainThreadScheduler
{
  return self->_mainThreadScheduler;
}

- (void)setFacebookContactsAlertController:(id)a3
{
}

- (UIAlertController)facebookContactsAlertController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_facebookContactsAlertController);

  return (UIAlertController *)WeakRetained;
}

- (void)setPresentedContactViewController:(id)a3
{
}

- (void)setNonServerDataSource:(id)a3
{
}

- (void)setRightButtonBehavior:(int64_t)a3
{
  self->_rightButtonBehavior = a3;
}

- (int64_t)rightButtonBehavior
{
  return self->_rightButtonBehavior;
}

- (void)setLeftButtonBehavior:(int64_t)a3
{
  self->_leftButtonBehavior = a3;
}

- (int64_t)leftButtonBehavior
{
  return self->_leftButtonBehavior;
}

- (void)setAccountsAndGroupsViewController:(id)a3
{
}

- (void)setShouldShowAccountsAndGroupsCachedValue:(id)a3
{
}

- (NSNumber)shouldShowAccountsAndGroupsCachedValue
{
  return self->_shouldShowAccountsAndGroupsCachedValue;
}

- (void)setReusableContactViewController:(id)a3
{
}

- (CNContactViewController)reusableContactViewController
{
  return self->_reusableContactViewController;
}

- (void)setContactStore:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setAllowsContactBlockingAndReporting:(BOOL)a3
{
  self->_allowsContactBlockingAndReporting = a3;
}

- (BOOL)allowsContactBlockingAndReporting
{
  return self->_allowsContactBlockingAndReporting;
}

- (BOOL)allowsContactBlocking
{
  return self->_allowsContactBlocking;
}

- (void)setAllowsDone:(BOOL)a3
{
  self->_allowsDone = a3;
}

- (void)setAllowsCanceling:(BOOL)a3
{
  self->_allowsCanceling = a3;
}

- (CNContactStyle)contactStyle
{
  return self->_contactStyle;
}

- (id)userActivityRepresentingGroupsView
{
  id v2 = [(CNContactNavigationController *)self accountsAndGroupsViewController];
  objc_super v3 = [v2 userActivity];

  return v3;
}

- (id)userActivityRepresentingCurrentlyDisplayedContact
{
  id v2 = [(CNContactNavigationController *)self presentedContactViewController];
  objc_super v3 = [v2 contentViewController];
  char v4 = [v3 userActivity];

  return v4;
}

- (void)notifyOtherFacebookContactsAlertDidSelectAction
{
  objc_super v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self name:@"com.apple.ContactsUI.UserSelectedFacebookAction" object:0];

  id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 postNotificationName:@"com.apple.ContactsUI.UserSelectedFacebookAction" object:0 userInfo:0 deliverImmediately:1];
}

- (void)otherFacebookContactsAlertDidSelectActionWithNotification:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F28C40], "defaultCenter", a3);
  [v4 removeObserver:self name:@"com.apple.ContactsUI.UserSelectedFacebookAction" object:0];

  BOOL v5 = [(CNContactNavigationController *)self facebookContactsAlertController];
  [v5 dismissViewControllerAnimated:1 completion:0];

  [(CNContactNavigationController *)self setFacebookContactsAlertController:0];
}

- (void)observeOtherFacebookContactsAlert
{
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 addObserver:self selector:sel_otherFacebookContactsAlertDidSelectActionWithNotification_ name:@"com.apple.ContactsUI.UserSelectedFacebookAction" object:0 suspensionBehavior:4];
}

void __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contactStore];
  id v3 = [v2 addressBook];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_2;
  v5[3] = &unk_1E54983B0;
  v5[4] = *(void *)(a1 + 32);
  char v6 = *(unsigned char *)(a1 + 40);
  id v4 = (id)[v3 performAsynchronousWorkWithInvalidatedAddressBook:v5];
}

void __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v5 = a3;
  [*(id *)(a1 + 32) observeOtherFacebookContactsAlert];
  char v6 = (void *)[objc_alloc(MEMORY[0x1E4F49890]) initWithAddressBook:a2];
  if ([v6 canMergeFacebookContacts] && *(unsigned char *)(a1 + 40))
  {
    id v7 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_3;
    v10[3] = &unk_1E549AFF8;
    id v8 = v6;
    uint64_t v9 = *(void *)(a1 + 32);
    id v11 = v8;
    uint64_t v12 = v9;
    double v13 = v5;
    [v7 performBlock:v10];
  }
  else
  {
    v5[2](v5);
  }
}

void __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_3(id *a1)
{
  id v2 = CNContactsUIBundle();
  id v3 = [v2 localizedStringForKey:@"KEEP_FACEBOOK_CONTACTS_ALERT_TITLE" value:&stru_1ED8AC728 table:@"Localized"];

  uint64_t v4 = *MEMORY[0x1E4F5A298];
  BOOL v5 = [a1[4] destinationDescription];
  int v6 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  id v7 = NSString;
  id v8 = CNContactsUIBundle();
  uint64_t v9 = v8;
  if (v6)
  {
    BOOL v10 = [v8 localizedStringForKey:@"KEEP_FACEBOOK_CONTACTS_ON_DEVICE_MESSAGE" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v11 = [a1[4] facebookContactsCount];
    uint64_t v12 = [MEMORY[0x1E4FB16C8] currentDevice];
    double v13 = [v12 model];
    objc_super v14 = objc_msgSend(v7, "localizedStringWithFormat:", v10, v11, v13);
  }
  else
  {
    BOOL v10 = [v8 localizedStringForKey:@"KEEP_FACEBOOK_CONTACTS_WITH_ACCOUNT_MESSAGE" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v15 = [a1[4] facebookContactsCount];
    uint64_t v12 = [a1[4] destinationDescription];
    objc_super v14 = objc_msgSend(v7, "localizedStringWithFormat:", v10, v15, v12);
  }

  uint64_t v16 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v3 message:v14 preferredStyle:1];
  v17 = (void *)MEMORY[0x1E4FB1410];
  v18 = CNContactsUIBundle();
  v19 = [v18 localizedStringForKey:@"DELETE" value:&stru_1ED8AC728 table:@"Localized"];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_4;
  v32[3] = &unk_1E54997B0;
  int8x16_t v27 = *((int8x16_t *)a1 + 2);
  id v20 = (id)v27.i64[0];
  int8x16_t v33 = vextq_s8(v27, v27, 8uLL);
  id v34 = a1[6];
  uint64_t v21 = [v17 actionWithTitle:v19 style:2 handler:v32];
  [v16 addAction:v21];

  v22 = (void *)MEMORY[0x1E4FB1410];
  v23 = CNContactsUIBundle();
  uint64_t v24 = [v23 localizedStringForKey:@"KEEP" value:&stru_1ED8AC728 table:@"Localized"];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_6;
  v29[3] = &unk_1E54997B0;
  int8x16_t v28 = *((int8x16_t *)a1 + 2);
  id v25 = (id)v28.i64[0];
  int8x16_t v30 = vextq_s8(v28, v28, 8uLL);
  id v31 = a1[6];
  v26 = [v22 actionWithTitle:v24 style:0 handler:v29];
  [v16 addAction:v26];

  [a1[5] setFacebookContactsAlertController:v16];
  [a1[5] presentViewController:v16 animated:1 completion:0];
}

void __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_4(id *a1)
{
  [a1[4] notifyOtherFacebookContactsAlertDidSelectAction];
  id v2 = [a1[4] backgroundScheduler];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_5;
  v3[3] = &unk_1E549B710;
  id v4 = a1[5];
  id v5 = a1[6];
  [v2 performBlock:v3];
}

void __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_6(id *a1)
{
  [a1[4] notifyOtherFacebookContactsAlertDidSelectAction];
  id v2 = [a1[4] backgroundScheduler];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_7;
  v3[3] = &unk_1E549B710;
  id v4 = a1[5];
  id v5 = a1[6];
  [v2 performBlock:v3];
}

uint64_t __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) mergeFacebookContacts];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

uint64_t __78__CNContactNavigationController_checkForFacebookContactsWithDelay_allowAlert___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) deleteFacebookContacts];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)toggleEditContact:(id)a3
{
  id v4 = [(CNContactNavigationController *)self presentedContactViewController];

  if (v4)
  {
    id v5 = [(CNContactNavigationController *)self presentedContactViewController];
    [v5 toggleEditing];
  }
}

- (void)toggleGroupsPanel:(id)a3
{
  id v7 = [(CNContactNavigationController *)self contactStyle];
  if ([v7 usesInsetPlatterStyle])
  {
    BOOL v4 = [(CNContactNavigationController *)self shouldShowAccountsAndGroups];

    if (!v4) {
      return;
    }
    id v5 = [(CNContactNavigationController *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0) {
      return;
    }
    id v7 = [(CNContactNavigationController *)self delegate];
    [v7 toggleGroupsPanel];
  }
}

- (BOOL)shouldFlipDirectionWhenChangingSelectionWithKey:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 input];
  if ([v4 isEqualToString:*MEMORY[0x1E4FB2B78]])
  {
    char v5 = 1;
  }
  else
  {
    char v6 = [v3 input];
    char v5 = [v6 isEqualToString:*MEMORY[0x1E4FB2B90]];
  }
  if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1) {
    BOOL v7 = v5;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)selectPreviousContact:(id)a3
{
  BOOL v4 = [(CNContactNavigationController *)self shouldFlipDirectionWhenChangingSelectionWithKey:a3];
  id v9 = [(CNContactNavigationController *)self contactListViewController];
  char v5 = [v9 visibleListViewController];
  char v6 = [v5 collectionView];
  BOOL v7 = [v6 indexPathsForSelectedItems];
  id v8 = [v7 firstObject];
  if (v4) {
    [(CNContactNavigationController *)self showCardForContactAfterIndexPath:v8];
  }
  else {
    [(CNContactNavigationController *)self showCardForContactBeforeIndexPath:v8];
  }
}

- (void)selectNextContact:(id)a3
{
  BOOL v4 = [(CNContactNavigationController *)self shouldFlipDirectionWhenChangingSelectionWithKey:a3];
  id v9 = [(CNContactNavigationController *)self contactListViewController];
  char v5 = [v9 visibleListViewController];
  char v6 = [v5 collectionView];
  BOOL v7 = [v6 indexPathsForSelectedItems];
  id v8 = [v7 firstObject];
  if (v4) {
    [(CNContactNavigationController *)self showCardForContactBeforeIndexPath:v8];
  }
  else {
    [(CNContactNavigationController *)self showCardForContactAfterIndexPath:v8];
  }
}

- (id)targetContainerForNewContactWithTargetGroup:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CNContactNavigationController *)self groupsAndContainersSaveManager];
    char v6 = [v4 identifier];
    BOOL v7 = [v5 containerForGroupIdentifier:v6];
LABEL_3:

    goto LABEL_4;
  }
  id v9 = [(CNContactNavigationController *)self nonServerDataSource];
  if (v9)
  {
    id v5 = [(CNContactNavigationController *)self nonServerDataSource];
  }
  else
  {
    objc_opt_class();
    BOOL v10 = [(CNContactNavigationController *)self dataSource];
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    id v5 = v11;
  }
  if (v5)
  {
    uint64_t v12 = [v5 filter];
    double v13 = [v12 containerIdentifiers];
    char v6 = [v13 anyObject];

    if (v6)
    {
      objc_super v14 = [(CNContactNavigationController *)self groupsAndContainersSaveManager];
      BOOL v7 = [v14 containerForContainerIdentifier:v6];
    }
    else
    {
      BOOL v7 = 0;
    }
    goto LABEL_3;
  }
  BOOL v7 = 0;
LABEL_4:

  return v7;
}

- (id)parentGroupForCurrentFilter
{
  id v3 = [(CNContactNavigationController *)self nonServerDataSource];
  if (v3)
  {
    id v4 = [(CNContactNavigationController *)self nonServerDataSource];
  }
  else
  {
    objc_opt_class();
    id v5 = [(CNContactNavigationController *)self dataSource];
    if (objc_opt_isKindOfClass()) {
      char v6 = v5;
    }
    else {
      char v6 = 0;
    }
    id v4 = v6;
  }
  if (v4)
  {
    BOOL v7 = [v4 filteredGroup];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)targetGroupForNewContact
{
  id v3 = [(CNContactNavigationController *)self contactListViewController];
  id v4 = [v3 collectionView];
  id v5 = [v4 indexPathsForSelectedItems];
  uint64_t v6 = [v5 count];

  BOOL v7 = [(CNContactNavigationController *)self contactPickerTargetGroupIdentifier];

  if (!v7 || v6)
  {
    BOOL v10 = [(CNContactNavigationController *)self parentGroupForCurrentFilter];
  }
  else
  {
    id v8 = [(CNContactNavigationController *)self groupsAndContainersSaveManager];
    id v9 = [(CNContactNavigationController *)self contactPickerTargetGroupIdentifier];
    BOOL v10 = [v8 groupForGroupIdentifier:v9];
  }

  return v10;
}

- (void)executeAddContact
{
  [(CNContactNavigationController *)self addContact:0 animated:1];
  id v3 = [(CNContactNavigationController *)self activityManager];
  [v3 publishRequestToCreateContact:0];
}

- (id)allContactIdentifiers
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(CNContactNavigationController *)self nonServerDataSource];
  if (v4)
  {
    id v5 = [(CNContactNavigationController *)self nonServerDataSource];
  }
  else
  {
    objc_opt_class();
    uint64_t v6 = [(CNContactNavigationController *)self dataSource];
    if (objc_opt_isKindOfClass()) {
      BOOL v7 = v6;
    }
    else {
      BOOL v7 = 0;
    }
    id v5 = v7;
  }
  if (v5)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obuint64_t j = [v5 contacts];
    uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v25 = *(void *)v31;
      uint64_t v24 = *MEMORY[0x1E4F1AE88];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v35 = v24;
          uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
          id v13 = v5;
          objc_super v14 = [v5 completeContactFromContact:v11 fromMainStoreOnly:0 keysToFetch:v12];

          uint64_t v15 = [v14 identifier];
          [v3 addObject:v15];

          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v16 = [v14 linkedContacts];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v27 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = [*(id *)(*((void *)&v26 + 1) + 8 * j) identifier];
                [v3 addObject:v21];
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v18);
          }

          id v5 = v13;
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v9);
    }
  }

  return v3;
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  uint64_t v6 = [(CNContactNavigationController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CNContactNavigationController *)self delegate];
    [v8 showContactList];
  }
}

- (void)presentAddToGroupPickerWithSourceView:(id)a3
{
  id v34 = a3;
  id v4 = objc_alloc_init(CNContactPickerViewController);
  [(CNContactPickerViewController *)v4 setDelegate:self];
  [(CNContactPickerViewController *)v4 setMode:2];
  id v5 = [(CNContactNavigationController *)self groupsAndContainersSaveManager];
  uint64_t v6 = [(CNContactNavigationController *)self parentGroupForCurrentFilter];
  char v7 = [(CNContactNavigationController *)self managedConfiguration];
  id v8 = [v5 mdmUnauthorizedContactIdentifiersForTargetGroup:v6 withManagedConfiguration:v7];

  uint64_t v9 = (void *)MEMORY[0x1E4F28F60];
  BOOL v10 = [(CNContactNavigationController *)self allContactIdentifiers];
  uint64_t v11 = [v10 allObjects];
  uint64_t v12 = [v8 allObjects];
  id v13 = [v9 predicateWithFormat:@"!(identifier IN %@) AND !(identifier in %@)", v11, v12];
  [(CNContactPickerViewController *)v4 setPredicateForEnablingContact:v13];

  [(CNContactPickerViewController *)v4 setShouldAllowSearchForMultiSelect:1];
  [(CNContactPickerViewController *)v4 setShouldDisplayAddNewContactRow:1];
  [(CNContactPickerViewController *)v4 setOnlyRealContacts:1];
  objc_super v14 = [(CNContactNavigationController *)self parentGroupForCurrentFilter];
  uint64_t v15 = [v14 identifier];
  [(CNContactPickerViewController *)v4 setTargetGroupIdentifier:v15];

  uint64_t v16 = *MEMORY[0x1E4F5A2A0];
  uint64_t v17 = [(CNContactNavigationController *)self parentGroupForCurrentFilter];
  uint64_t v18 = [v17 name];
  LODWORD(v16) = (*(uint64_t (**)(uint64_t, void *))(v16 + 16))(v16, v18);

  if (v16)
  {
    uint64_t v19 = [(CNContactNavigationController *)self parentGroupForCurrentFilter];
    id v20 = [v19 name];

    if (+[CNUIStringUtilities composedCharacterCountForString:v20] >= 31)
    {
      uint64_t v21 = objc_msgSend(v20, "_cn_truncateAtLength:addEllipsisIfTrunctated:", 30, 1);

      id v20 = (void *)v21;
    }
    v22 = NSString;
    v23 = CNContactsUIBundle();
    uint64_t v24 = [v23 localizedStringForKey:@"ADD_CONTACTS_TO_GROUP_PROMPT-%@" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v25 = objc_msgSend(v22, "localizedStringWithFormat:", v24, v20);
    [(CNContactPickerViewController *)v4 setPrompt:v25];
  }
  [(CNContactPickerViewController *)v4 setModalPresentationStyle:7];
  if (v34)
  {
    long long v26 = [(CNContactPickerViewController *)v4 popoverPresentationController];
    [v26 setSourceView:v34];

    long long v27 = [(CNContactPickerViewController *)v4 popoverPresentationController];
    [v27 setDelegate:self];
  }
  else
  {
    long long v28 = [(CNContactNavigationController *)self addContactBarButtonItem];
    long long v29 = [(CNContactPickerViewController *)v4 popoverPresentationController];
    [v29 setBarButtonItem:v28];

    long long v27 = [(CNContactPickerViewController *)v4 popoverPresentationController];
    [v27 setPermittedArrowDirections:1];
  }

  long long v30 = +[CNUIContactsEnvironment currentEnvironment];
  int v31 = [v30 runningInContactsAppOniPad];

  if (v31)
  {
    long long v32 = [(CNContactNavigationController *)self view];
    [v32 frame];
    -[CNContactPickerViewController setPreferredContentSize:](v4, "setPreferredContentSize:", v33, 812.0);
  }
  [(CNContactNavigationController *)self presentViewController:v4 animated:1 completion:0];
}

- (BOOL)shouldShowAddToGroupPicker
{
  objc_opt_class();
  id v3 = [(CNContactNavigationController *)self dataSource];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5) {
    char v6 = [v5 filterShowsSingleGroup];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void)editLimitedAccess
{
  id v3 = [(CNContactNavigationController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CNContactNavigationController *)self delegate];
    [v5 contactNavigationControllerShouldEditLimitedAccess:self];
  }
}

- (void)addContact:(id)a3
{
  char v4 = [(CNContactNavigationController *)self splitViewController];

  if (v4)
  {
    id v5 = [(CNContactNavigationController *)self splitViewController];
    char v6 = [v5 view];
    [v6 endEditing:1];
  }
  char v7 = [(CNContactNavigationController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(CNContactNavigationController *)self delegate];
    int v10 = [v9 contactNavigationControllerShouldAddNewContact:self];

    if (!v10) {
      return;
    }
    goto LABEL_10;
  }
  if (![(CNContactNavigationController *)self shouldShowAddToGroupPicker])
  {
LABEL_10:
    [(CNContactNavigationController *)self executeAddContact];
    return;
  }

  [(CNContactNavigationController *)self presentAddToGroupPickerWithSourceView:0];
}

- (void)deleteContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactNavigationController *)self contactListViewController];
  [v5 deleteContact:v4];
}

- (void)cancelSearch:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactNavigationController *)self contactListViewController];
  [v5 cancelSearch:v4];
}

- (void)beginSearch:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactNavigationController *)self contactListViewController];
  [v5 beginSearch:v4];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  char v7 = [(CNContactNavigationController *)self firstResponder];
  if (v7 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (BOOL isEqual = sel_isEqual(a3, sel_selectNextContact_),
        BOOL v9 = sel_isEqual(a3, sel_selectPreviousContact_),
        BOOL v10 = 0,
        !isEqual)
    && !v9)
  {
    v12.receiver = self;
    v12.super_class = (Class)CNContactNavigationController;
    BOOL v10 = [(CNContactNavigationController *)&v12 canPerformAction:a3 withSender:v6];
  }

  return v10;
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
  v7.receiver = self;
  v7.super_class = (Class)CNContactNavigationController;
  id v5 = [(CNContactNavigationController *)&v7 popViewControllerAnimated:v3];

  return v5;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void *)MEMORY[0x1E4F39CF8];
  id v7 = a3;
  [v6 setFrameStallSkipRequest:1];
  v8.receiver = self;
  v8.super_class = (Class)CNContactNavigationController;
  [(CNContactNavigationController *)&v8 pushViewController:v7 animated:v4];
}

- (void)searchForString:(id)a3 makeSearchBarFirstResponder:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CNContactNavigationController *)self showAllContactsListAnimated:0];
  id v7 = [(CNContactNavigationController *)self contactListViewController];
  [v7 startSearchingForString:v6 setSearchBarAsFirstResponder:v4];
}

- (void)searchForString:(id)a3
{
}

- (void)showAllContactsListAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactNavigationController *)self contactListViewController];
  if ([v5 isViewLoaded])
  {
    id v6 = [(CNContactNavigationController *)self contactListViewController];
    id v7 = [v6 view];
    objc_super v8 = [v7 window];

    if (v8) {
      return;
    }
  }
  else
  {
  }
  BOOL v9 = [(CNContactNavigationController *)self viewControllers];
  BOOL v10 = [(CNContactNavigationController *)self contactListViewController];
  int v11 = [v9 containsObject:v10];

  if (v11)
  {
    [(CNContactNavigationController *)self popToContactListAndSaveChanges:1 animated:v3];
  }
  else
  {
    objc_super v12 = [(CNContactNavigationController *)self accountsAndGroupsViewController];
    [v12 selectAllContacts];

    id v13 = [(CNContactNavigationController *)self accountsAndGroupsViewController];
    [(CNContactNavigationController *)self accountsAndGroupsViewControllerDidFinish:v13];
  }
}

- (void)showAllContactsList
{
}

- (void)popToContactListAndSaveChanges:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(CNContactNavigationController *)self addContactPresenter];
  objc_super v8 = [v7 presentedViewController];
  if (v8)
  {
    if (!v5) {
      goto LABEL_3;
    }
LABEL_11:
    objc_super v12 = [(CNContactNavigationController *)self reusableContactViewController];
    id v13 = [v12 contentViewController];
    [v13 saveChanges];

    if (v8) {
      goto LABEL_4;
    }
LABEL_12:
    objc_super v14 = [(CNContactNavigationController *)self contactListViewController];
    id v15 = (id)[(CNContactNavigationController *)self popToViewController:v14 animated:v4];

    goto LABEL_13;
  }
  objc_super v8 = [(CNContactNavigationController *)self presentedViewController];
  if (v5) {
    goto LABEL_11;
  }
LABEL_3:
  if (!v8) {
    goto LABEL_12;
  }
LABEL_4:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v9 = [v8 viewControllers];
    BOOL v10 = [v9 objectAtIndexedSubscript:0];

    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v11 = [v10 contentViewController];
        [v11 saveChanges];
      }
    }
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__CNContactNavigationController_popToContactListAndSaveChanges_animated___block_invoke;
  v16[3] = &unk_1E5499510;
  v16[4] = self;
  BOOL v17 = v4;
  [v8 dismissViewControllerAnimated:v4 completion:v16];
LABEL_13:
}

void __73__CNContactNavigationController_popToContactListAndSaveChanges_animated___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [v2 contactListViewController];
  id v3 = (id)[v2 popToViewController:v4 animated:*(unsigned __int8 *)(a1 + 40)];
}

- (void)popToContactListAndSaveChanges:(BOOL)a3
{
}

- (BOOL)isDisplayingAddNewContactViewController
{
  id v2 = [(CNContactNavigationController *)self addContactPresenter];
  objc_opt_class();
  id v3 = [v2 presentedViewController];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    objc_opt_class();
    id v6 = [v5 topViewController];
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    if (v8) {
      BOOL v9 = [v8 mode] == 3;
    }
    else {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)CNContactNavigationController;
  -[CNContactNavigationController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  id v6 = [(CNContactNavigationController *)self navigationBar];
  double v7 = width / 3.0;
  [v6 _setRequestedMaxBackButtonWidth:v7];

  id v8 = [(CNContactNavigationController *)self navigationController];
  BOOL v9 = [v8 navigationBar];
  [v9 _setRequestedMaxBackButtonWidth:v7];
}

- (BOOL)accountsAndGroupsViewController:(id)a3 shouldEnableItemWithIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(CNContactNavigationController *)self contactPickerTargetGroupIdentifier];
  char v7 = [v5 isEqualToString:v6];

  return v7 ^ 1;
}

- (void)accountsAndGroupsViewControllerDidGoBack:(id)a3
{
  id v4 = [(CNContactNavigationController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNContactNavigationController *)self delegate];
    [v6 contactNavigationControllerDidGoBack:self];
  }
}

- (void)accountsAndGroupsViewControllerDidCancel:(id)a3
{
  id v4 = [(CNContactNavigationController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNContactNavigationController *)self delegate];
    [v6 contactNavigationControllerDidCancel:self];
  }
}

- (void)accountsAndGroupsViewControllerDidUpdateSelection:(id)a3
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 dataSource];
  char v7 = [v6 filter];

  id v8 = [v5 dataSource];

  BOOL v9 = [v8 serverFilter];

  if (!v9)
  {
    uint64_t v21 = [(CNContactNavigationController *)self contactListViewController];
    [v21 cancelSearch:0];

    v22 = [(CNContactNavigationController *)self nonServerDataSource];

    if (v22)
    {
      uint64_t v16 = [(CNContactNavigationController *)self nonServerDataSource];
      v23 = [(CNContactListViewController *)self->_contactListViewController dataSource];
      uint64_t v24 = [v23 contactFormatter];
      [(CNContactAsyncDataSource *)v16 setContactFormatter:v24];

      [(CNContactListViewController *)self->_contactListViewController setDataSource:v16];
    }
    else
    {
      uint64_t v16 = [(CNContactListViewController *)self->_contactListViewController dataSource];
    }
    uint64_t v25 = [(CNContactAsyncDataSource *)v16 filter];
    long long v26 = [v25 limitedAccessIdentifiers];
    [v7 setLimitedAccessIdentifiers:v26];

    long long v27 = [(CNContactAsyncDataSource *)v16 filter];
    objc_msgSend(v7, "setLimitedAccessFilterMode:", objc_msgSend(v27, "limitedAccessFilterMode"));

    [(CNContactAsyncDataSource *)v16 setFilter:v7];
    uint64_t v28 = [(CNContactAsyncDataSource *)v16 delegate];
    if (!v28) {
      goto LABEL_13;
    }
    long long v29 = (void *)v28;
    if ([(CNContactListViewController *)self->_contactListViewController isViewLoaded])
    {
      long long v30 = [(CNContactListViewController *)self->_contactListViewController view];
      int v31 = [v30 window];

      if (!v31)
      {
LABEL_13:
        [(CNContactAsyncDataSource *)v16 reload];
        [(CNContactListViewController *)self->_contactListViewController setDataSource:v16];
LABEL_16:
        long long v32 = [(CNContactAsyncDataSource *)v16 store];
        [v7 saveToPreferencesWithContactStore:v32];

        [(CNContactNavigationController *)self setNonServerDataSource:0];
        goto LABEL_17;
      }
    }
    else
    {
    }
    [(CNContactAsyncDataSource *)v16 reloadAsynchronously];
    goto LABEL_16;
  }
  objc_super v10 = [(CNContactNavigationController *)self nonServerDataSource];

  if (!v10)
  {
    int v11 = [(CNContactNavigationController *)self dataSource];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v36 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v37 = [(CNContactNavigationController *)self dataSource];
      [v36 handleFailureInMethod:a2, self, @"CNContactNavigationController.m", 1552, @"Datasource %@ is not of expected type: CNContactStoreDataSource", v37 object file lineNumber description];
    }
    id v13 = [(CNContactNavigationController *)self dataSource];
    [(CNContactNavigationController *)self setNonServerDataSource:v13];
  }
  objc_super v14 = [CNContactAsyncDataSource alloc];
  id v15 = [(CNContactNavigationController *)self contactStore];
  uint64_t v16 = [(CNContactAsyncDataSource *)v14 initWithStore:v15];

  BOOL v17 = [(CNContactListViewController *)self->_contactListViewController dataSource];
  uint64_t v18 = [v17 contactFormatter];
  [(CNContactAsyncDataSource *)v16 setContactFormatter:v18];

  [(CNContactAsyncDataSource *)v16 setFilter:v9];
  uint64_t v19 = +[CNContactViewController descriptorForRequiredKeys];
  v38[0] = v19;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
  [(CNContactAsyncDataSource *)v16 setAllKeysToFetchForTransientContacts:v20];

  [(CNContactAsyncDataSource *)v16 reload];
  [(CNContactListViewController *)self->_contactListViewController setDataSource:v16];
LABEL_17:

  double v33 = [(CNContactNavigationController *)self delegate];
  char v34 = objc_opt_respondsToSelector();

  if (v34)
  {
    uint64_t v35 = [(CNContactNavigationController *)self delegate];
    [v35 contactNavigationControllerClearContactSelection:self];
  }
  [(CNContactListViewController *)self->_contactListViewController setDelegate:self];
  [(CNContactNavigationController *)self updateNavigationButtonsAnimated:0 viewWillAppear:1];
}

- (void)accountsAndGroupsViewControllerDidChangeList:(id)a3
{
}

- (void)accountsAndGroupsViewControllerDidFinish:(id)a3
{
  id v15 = a3;
  id v4 = [(CNContactNavigationController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNContactNavigationController *)self delegate];
    [v6 showContactList];
  }
  else
  {
    char v7 = [(CNContactNavigationController *)self contactListViewController];
    if ([v7 isViewLoaded])
    {
      id v8 = [(CNContactNavigationController *)self contactListViewController];
      BOOL v9 = [v8 view];
      objc_super v10 = [v9 window];

      if (v10) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    if ([(CNContactNavigationController *)self isSinglePickerOnVisionOS])
    {
      id v11 = [(CNContactNavigationController *)self popViewControllerAnimated:1];
      goto LABEL_11;
    }
    id v6 = [(CNContactNavigationController *)self contactListViewController];
    [(CNContactNavigationController *)self pushViewController:v6 animated:1];
  }

LABEL_11:
  objc_super v12 = [v15 dataSource];
  id v13 = [v12 serverFilter];

  if (v13)
  {
    objc_super v14 = [(CNContactNavigationController *)self contactListViewController];
    [v14 startSearching];
  }
}

- (void)contactViewController:(id)a3 didDeleteContact:(id)a4
{
  id v10 = a4;
  char v5 = [(CNContactNavigationController *)self contactListViewController];
  [v5 reloadContacts];

  id v6 = [(CNContactNavigationController *)self contactListViewController];
  [v6 setDidDeleteContact:1];

  char v7 = [(CNContactNavigationController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    BOOL v9 = [(CNContactNavigationController *)self delegate];
    [v9 contactNavigationController:self didDeleteContact:v10];
  }
}

- (void)contactViewController:(id)a3 didCompleteWithNewContactFromPickerNewContactRow:(id)a4
{
  id v14 = a4;
  id v6 = [a3 parentViewController];
  [v6 dismissViewControllerAnimated:1 completion:0];

  if (v14)
  {
    char v7 = [(CNContactNavigationController *)self contactListViewController];
    char v8 = [v7 collectionView];
    BOOL v9 = [v8 indexPathsForSelectedItems];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      id v11 = [(CNContactNavigationController *)self contactListViewController];
      [v11 selectContact:v14 animated:0 scrollPosition:1];
    }
    else
    {
      objc_super v12 = [(CNContactNavigationController *)self delegate];
      char v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) == 0) {
        goto LABEL_7;
      }
      id v11 = [(CNContactNavigationController *)self delegate];
      [v11 contactNavigationController:self didCompleteWithNewContact:v14];
    }
  }
LABEL_7:
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  char v7 = [(CNContactNavigationController *)self contactListViewController];
  int v8 = [v7 shouldDisplayAddNewContactRow];

  uint64_t v9 = [v15 mode];
  uint64_t v10 = v9;
  if (v8 && v9 == 3)
  {
    [(CNContactNavigationController *)self contactViewController:v15 didCompleteWithNewContactFromPickerNewContactRow:v6];
  }
  else
  {
    uint64_t v11 = [v15 mode];
    if (v6 && v11 == 3)
    {
      objc_super v12 = [(CNContactNavigationController *)self contactListViewController];
      [v12 reloadContacts];

      [(CNContactNavigationController *)self showCardForContact:v6 resetFilter:0 resetSearch:1 fallbackToFirstContact:0 scrollToContact:0 animated:1];
      char v13 = [(CNContactNavigationController *)self contactListViewController];
      [v13 selectContact:v6 animated:1 scrollPosition:0];
    }
    if (v10 == 3 || ![(CNContactNavigationController *)self allowsCardEditing])
    {
      id v14 = [v15 parentViewController];
      [v14 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  id v5 = a4;
  id v6 = [(CNContactNavigationController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int v8 = [(CNContactNavigationController *)self delegate];
    char v9 = [v8 contactNavigationController:self shouldPerformDefaultActionForContactProperty:v5];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (void)didResetLimitedAccessSelectionTo:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactNavigationController *)self contactListViewController];
  [v5 didResetLimitedAccessSelectionTo:v4];
}

- (void)didFinishLimitedAccessSelection
{
}

- (void)didUpdateLimitedAccessSelection:(id)a3
{
  id v14 = a3;
  id v4 = [(CNContactNavigationController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNContactNavigationController *)self delegate];
    [v6 contactNavigationController:self didUpdateLimitedAccessSelection:v14];

    if ([(CNContactNavigationController *)self limitedAccessPickerType] == 2)
    {
      char v7 = [(CNContactNavigationController *)self contactListViewController];
      int v8 = [v7 navigationItem];
      char v9 = [v8 rightBarButtonItems];
      uint64_t v10 = [v9 objectAtIndexedSubscript:0];

      uint64_t v11 = [v14 count];
      objc_super v12 = [(CNContactListViewController *)self->_contactListViewController originalDataSource];
      char v13 = [v12 contacts];
      objc_msgSend(v10, "setEnabled:", v11 != objc_msgSend(v13, "count"));
    }
  }
}

- (id)nextResponderForContactListViewController:(id)a3
{
  if ([(CNContactNavigationController *)self isPresentedContactViewControllerVisible])
  {
    id v4 = [(CNContactNavigationController *)self presentedContactViewController];
    char v5 = [v4 contentViewController];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)contactPicker:(id)a3 didCompleteWithNewContact:(id)a4
{
  if (a4)
  {
    id v7 = a4;
    char v5 = [(CNContactNavigationController *)self contactListViewController];
    [v5 reloadContacts];

    id v6 = [(CNContactNavigationController *)self contactListViewController];
    [v6 selectContact:v7 animated:1 scrollPosition:1];

    [(CNContactNavigationController *)self showCardForContact:v7 animated:1];
  }
}

- (void)contactPicker:(id)a3 didSelectContacts:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v25 = a4;
  if ([v25 count])
  {
    id v6 = [(CNContactNavigationController *)self groupsAndContainersSaveManager];

    if (v6)
    {
      v23 = [(CNContactNavigationController *)self parentGroupForCurrentFilter];
      if (v23)
      {
        id v7 = [(CNContactNavigationController *)self groupsAndContainersSaveManager];
        int v8 = [v23 identifier];
        long long v26 = [v7 containerForGroupIdentifier:v8];

        if (v26)
        {
          id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v11 = v25;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v34;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v34 != v13) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * v14);
                uint64_t v16 = [(CNContactNavigationController *)self groupsAndContainersSaveManager];
                int v17 = [v16 isAuthorizedToAddContact:v15 toContainer:v26 ignoresParentalRestrictions:0];

                if (v17) {
                  uint64_t v18 = v9;
                }
                else {
                  uint64_t v18 = v10;
                }
                [v18 addObject:v15];
                ++v14;
              }
              while (v12 != v14);
              uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
            }
            while (v12);
          }

          uint64_t v19 = *MEMORY[0x1E4F5A258];
          if (((*(uint64_t (**)(void, id))(*MEMORY[0x1E4F5A258] + 16))(*MEMORY[0x1E4F5A258], v9) & 1) == 0)
          {
            id v20 = [(CNContactNavigationController *)self groupsAndContainersSaveManager];
            id v21 = (id)[v20 addContacts:v9 toGroup:v23 inContainer:v26 moveWasAuthorized:1];
          }
          if (((*(uint64_t (**)(uint64_t, id))(v19 + 16))(v19, v10) & 1) == 0)
          {
            objc_initWeak(&location, self);
            v22 = [(CNContactNavigationController *)self groupsAndContainersSaveManager];
            v27[0] = MEMORY[0x1E4F143A8];
            v27[1] = 3221225472;
            v27[2] = __65__CNContactNavigationController_contactPicker_didSelectContacts___block_invoke;
            v27[3] = &unk_1E5498388;
            objc_copyWeak(&v31, &location);
            id v28 = v10;
            id v29 = v23;
            id v30 = v26;
            [v22 authorizeForViewController:self sender:self animated:1 completionBlock:v27];

            objc_destroyWeak(&v31);
            objc_destroyWeak(&location);
          }
        }
      }
    }
  }
}

void __65__CNContactNavigationController_contactPicker_didSelectContacts___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (a2 == 2)
  {
    id v7 = WeakRetained;
    char v5 = [WeakRetained groupsAndContainersSaveManager];
    id v6 = (id)[v5 addContacts:*(void *)(a1 + 32) toGroup:*(void *)(a1 + 40) inContainer:*(void *)(a1 + 48) moveWasAuthorized:1];

    id WeakRetained = v7;
  }
}

- (void)contactListViewControllerSelectedAddContactToList:(id)a3 withSourceView:(id)a4
{
}

- (void)dataSourceChangedForContactListViewController:(id)a3
{
  if (([a3 isHandlingSearch] & 1) == 0)
  {
    [(CNContactNavigationController *)self refreshMailButtonEnabled];
  }
}

- (void)contactListViewController:(id)a3 shouldPresentContact:(id)a4 shouldScrollToContact:(BOOL)a5
{
}

- (void)contactListViewController:(id)a3 updatedSelectedContact:(id)a4
{
  id v14 = a4;
  char v5 = [(CNContactNavigationController *)self reusableContactViewController];
  id v6 = [v5 view];
  id v7 = [v6 window];

  int v8 = [(CNContactNavigationController *)self reusableContactViewController];
  id v9 = [v8 contact];
  id v10 = [v9 identifier];
  id v11 = [v14 identifier];
  char v12 = [v10 isEqual:v11];

  if (!v7 || (v12 & 1) == 0)
  {
    LOWORD(v13) = 1;
    -[CNContactNavigationController showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:dismissingPresentedController:shouldHideContactListIfNeeded:](self, "showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:dismissingPresentedController:shouldHideContactListIfNeeded:", v14, 0, 0, 0, 0, 1, v13);
  }
}

- (void)contactListViewController:(id)a3 didSelectContact:(id)a4
{
}

- (void)contactListViewController:(id)a3 didSelectContact:(id)a4 shouldScrollToContact:(BOOL)a5
{
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__CNContactNavigationController_contactListViewController_didSelectContact_shouldScrollToContact___block_invoke;
  aBlock[3] = &unk_1E5498360;
  aBlock[4] = self;
  id v8 = v7;
  id v23 = v8;
  BOOL v24 = a5;
  id v9 = (void (**)(void))_Block_copy(aBlock);
  id v10 = [(CNContactNavigationController *)self contactListViewController];
  int v11 = [v10 isSearching];

  if (!v11) {
    goto LABEL_8;
  }
  char v12 = [(CNContactNavigationController *)self contactListViewController];
  int v13 = [v12 allowsMultiSelection];

  id v14 = [(CNContactNavigationController *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    if ((v13 & 1) == 0)
    {
      uint64_t v16 = [(CNContactNavigationController *)self delegate];
      char v17 = [v16 contactNavigationControllerShouldDismissSearchOnSelection:self];

      if ((v17 & 1) == 0) {
        goto LABEL_8;
      }
    }
  }
  else if (!v13)
  {
    goto LABEL_8;
  }
  uint64_t v18 = [(CNContactNavigationController *)self contactListViewController];
  -[CNContactNavigationController dismissSearchAndSelectContact:allowsMultiSelection:](self, "dismissSearchAndSelectContact:allowsMultiSelection:", v8, [v18 allowsMultiSelection]);

LABEL_8:
  uint64_t v19 = [(CNContactNavigationController *)self transitionCoordinator];
  if (v19)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __98__CNContactNavigationController_contactListViewController_didSelectContact_shouldScrollToContact___block_invoke_2;
    v20[3] = &unk_1E5498338;
    id v21 = v9;
    [v19 animateAlongsideTransition:0 completion:v20];
  }
  else
  {
    v9[2](v9);
  }
}

void __98__CNContactNavigationController_contactListViewController_didSelectContact_shouldScrollToContact___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    char v5 = [v4 delegate];
    char v6 = [v5 contactNavigationController:*(void *)(a1 + 32) shouldShowCardForContact:*(void *)(a1 + 40)];

    if ((v6 & 1) == 0) {
      return;
    }
    goto LABEL_15;
  }
  id v7 = [v4 splitViewController];
  char v8 = [v7 isCollapsed];

  if (v8) {
    goto LABEL_15;
  }
  id v9 = [*(id *)(a1 + 32) reusableContactViewController];
  id v10 = [v9 view];
  int v11 = [v10 window];

  char v12 = [*(id *)(a1 + 32) splitViewController];
  if ([v12 displayMode] == 3)
  {
    BOOL v13 = 1;
  }
  else
  {
    id v14 = [*(id *)(a1 + 32) splitViewController];
    if ([v14 displayMode] == 5)
    {
      BOOL v13 = 1;
    }
    else
    {
      char v15 = [*(id *)(a1 + 32) splitViewController];
      BOOL v13 = [v15 displayMode] == 6;
    }
  }

  uint64_t v16 = [*(id *)(a1 + 32) reusableContactViewController];
  char v17 = [v16 contact];
  uint64_t v18 = [v17 identifier];
  uint64_t v19 = [*(id *)(a1 + 40) identifier];
  int v20 = [v18 isEqual:v19];

  if (!v11 || v13 || !v20)
  {
LABEL_15:
    id v21 = *(void **)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 40);
    uint64_t v23 = *(unsigned __int8 *)(a1 + 48);
    [v21 showCardForContact:v22 animated:1 scrollToContact:v23];
  }
}

uint64_t __98__CNContactNavigationController_contactListViewController_didSelectContact_shouldScrollToContact___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)contactSuggestionViewController:(id)a3 shouldSelectContact:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(CNContactNavigationController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    BOOL v13 = [(CNContactNavigationController *)self delegate];
    char v14 = [v13 contactSuggestionViewController:v8 shouldSelectContact:v9 atIndexPath:v10];
  }
  else
  {
    char v14 = 1;
  }

  return v14;
}

- (BOOL)contactListViewController:(id)a3 shouldSelectContact:(id)a4 atIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(CNContactNavigationController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    int v11 = [(CNContactNavigationController *)self delegate];
    char v12 = [v11 contactNavigationController:self shouldSelectContact:v7 atIndexPath:v8];
  }
  else
  {
    char v12 = 1;
  }

  return v12;
}

- (void)resetContactViewController
{
  char v3 = [(CNContactNavigationController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [(CNContactNavigationController *)self delegate];

    if (v5 != self)
    {
      id v6 = [(CNContactNavigationController *)self delegate];
      [v6 resetContactViewController];
    }
  }
}

- (void)startEditingPresentedContact
{
  char v3 = [(CNContactNavigationController *)self presentedContactViewController];

  if (v3)
  {
    id v4 = [(CNContactNavigationController *)self presentedContactViewController];
    [v4 setEditing:1 animated:1];
  }
}

- (id)currentlyDisplayedContact
{
  char v3 = [(CNContactNavigationController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [(CNContactNavigationController *)self delegate];
    id v6 = [v5 displayedContact];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)showCardForContactIfPossible:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(CNContactNavigationController *)self isPresentedContactViewControllerVisible];
  char v5 = v10;
  if (v4)
  {
    id v6 = [(CNContactNavigationController *)self presentedViewController];
    if (v6)
    {

LABEL_9:
      char v5 = v10;
      goto LABEL_10;
    }
    id v7 = [(CNContactNavigationController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id v8 = [(CNContactNavigationController *)self delegate];
      int v9 = [v8 contactNavigationControllerShouldShowContactsOnKeyCommands:self];

      char v5 = v10;
      if (!v9) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    [(CNContactNavigationController *)self showCardForContact:v10 resetFilter:0 resetSearch:1 fallbackToFirstContact:1 scrollToContact:1 animated:0];
    goto LABEL_9;
  }
LABEL_10:
}

- (BOOL)isPresentedContactViewControllerVisible
{
  id v2 = [(CNContactNavigationController *)self presentedContactViewController];
  char v3 = [v2 parentViewController];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)showCardForContactBeforeIndexPath:(id)a3
{
  id v4 = a3;
  char v5 = [(CNContactNavigationController *)self contactListViewController];
  id v6 = [v5 visibleListViewController];
  uint64_t v7 = [v6 globalIndexForCollectionViewIndexPath:v4];

  if (!v4 || v7)
  {
    BOOL v8 = !v7 || v7 == 0x7FFFFFFFFFFFFFFFLL;
    BOOL v9 = v8 || v4 == 0;
    unint64_t v10 = v9 ? 0 : v7 - 1;
    int v11 = [(CNContactNavigationController *)self dataSource];
    char v12 = [v11 contacts];
    unint64_t v13 = [v12 count];

    if (v10 < v13)
    {
      id v16 = [(CNContactNavigationController *)self dataSource];
      char v14 = [v16 contacts];
      char v15 = [v14 objectAtIndexedSubscript:v10];
      [(CNContactNavigationController *)self showCardForContactIfPossible:v15];
    }
  }
}

- (void)showCardForContactAfterIndexPath:(id)a3
{
  id v4 = a3;
  char v5 = [(CNContactNavigationController *)self contactListViewController];
  id v6 = [v5 visibleListViewController];
  uint64_t v7 = [v6 globalIndexForCollectionViewIndexPath:v4];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL || v4 == 0) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = v7 + 1;
  }
  unint64_t v10 = [(CNContactNavigationController *)self dataSource];
  int v11 = [v10 contacts];
  unint64_t v12 = [v11 count];

  if (v9 < v12)
  {
    id v15 = [(CNContactNavigationController *)self dataSource];
    unint64_t v13 = [v15 contacts];
    char v14 = [v13 objectAtIndexedSubscript:v9];
    [(CNContactNavigationController *)self showCardForContactIfPossible:v14];
  }
}

- (void)_cnui_presentViewController:(id)a3 animated:(BOOL)a4 dismissingPresentedController:(BOOL)a5 shouldHideContactListIfNeeded:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  objc_opt_class();
  id v27 = v10;
  if (objc_opt_isKindOfClass()) {
    int v11 = v27;
  }
  else {
    int v11 = 0;
  }
  id v12 = v11;

  [(CNContactNavigationController *)self setPresentedContactViewController:v12];
  unint64_t v13 = [(CNContactNavigationController *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  id v15 = [(CNContactNavigationController *)self delegate];
  id v16 = v15;
  if (v14)
  {
    char v17 = [v15 contactNavigationController:self presentViewController:v27 animated:v8 dismissingPresentedController:v7 shouldHideContactListIfNeeded:v6];
LABEL_8:
    char v19 = v17;

    if (([v27 isViewLoaded] & 1) == 0)
    {
      int v20 = v27;
      if (v19) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
    int v20 = v27;
LABEL_10:
    id v21 = [v20 view];
    uint64_t v22 = [v21 window];

    int v20 = v27;
    if ((v19 & 1) != 0 || v22) {
      goto LABEL_23;
    }
LABEL_22:
    [(CNContactNavigationController *)self pushViewController:v20 animated:v8];
    goto LABEL_23;
  }
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    id v16 = [(CNContactNavigationController *)self delegate];
    char v17 = [v16 contactNavigationController:self presentViewController:v27 animated:v8];
    goto LABEL_8;
  }
  if (![(CNContactNavigationController *)self isPresentedContactViewControllerVisible])
  {
    char v26 = [v27 isViewLoaded];
    int v20 = v27;
    if ((v26 & 1) == 0) {
      goto LABEL_22;
    }
    char v19 = 0;
    goto LABEL_10;
  }
  uint64_t v23 = [(CNContactNavigationController *)self presentedViewController];

  if (v23)
  {
    BOOL v24 = [(CNContactNavigationController *)self presentedViewController];
    [v24 dismissViewControllerAnimated:0 completion:0];
  }
  char v25 = [v27 isViewLoaded];
  int v20 = v27;
  if (v25)
  {
    char v19 = 1;
    goto LABEL_10;
  }
LABEL_23:

  MEMORY[0x1F4181820]();
}

- (void)showCardForContact:(id)a3 animated:(BOOL)a4
{
}

- (void)showCardForContact:(id)a3 animated:(BOOL)a4 scrollToContact:(BOOL)a5
{
}

- (id)reuseableContactViewControllerConfiguredForContact:(id)a3 mode:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(CNContactNavigationController *)self reusableContactViewController];
  if (v7)
  {
    BOOL v8 = v7;
    if ([(CNContactViewController *)v7 isEditing])
    {
      unint64_t v9 = [(CNContactViewController *)v8 contentViewController];
      [v9 saveChanges];

      id v10 = [(CNContactViewController *)v8 contentViewController];
      [v10 setEditing:0 animated:0];

      [(CNContactViewController *)v8 setEditing:0 animated:0];
    }
    [(CNContactViewController *)v8 setContact:v6 additionalContact:0 mode:a4];
  }
  else
  {
    BOOL v8 = [[CNContactViewController alloc] initWithMode:a4];
    [(CNContactViewController *)v8 setContact:v6];
    [(CNContactNavigationController *)self setReusableContactViewController:v8];
  }

  return v8;
}

- (void)showCardForContact:(id)a3 resetFilter:(BOOL)a4 resetSearch:(BOOL)a5 fallbackToFirstContact:(BOOL)a6 scrollToContact:(BOOL)a7 animated:(BOOL)a8 dismissingPresentedController:(BOOL)a9 shouldHideContactListIfNeeded:(BOOL)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  BOOL v12 = a6;
  BOOL v13 = a4;
  v48[1] = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  if ([(CNContactNavigationController *)self hasPendingShowCard])
  {
    NSLog(&cfstr_AlreadyPending.isa);

    return;
  }
  [(CNContactNavigationController *)self setHasPendingShowCard:1];
  if (v13)
  {
    id v15 = [(CNContactNavigationController *)self contactListViewController];
    id v16 = [v15 dataSource];
    [v16 setFilter:0];
    goto LABEL_7;
  }
  id v17 = v35;
  if (v35 && v12)
  {
    char v18 = [(CNContactListViewController *)self->_contactListViewController dataSource];
    id v15 = [v18 indexPathForContact:v35];

    if (v15) {
      goto LABEL_11;
    }
    id v16 = v35;
    id v35 = 0;
LABEL_7:

LABEL_11:
    id v17 = v35;
  }
  if (!v17 && v12)
  {
    char v19 = [(CNContactListViewController *)self->_contactListViewController dataSource];
    int v20 = [v19 contacts];
    id v36 = [v20 firstObject];

    id v17 = v36;
    if (v36) {
      goto LABEL_17;
    }
    id v21 = [(CNContactListViewController *)self->_contactListViewController originalDataSource];
    uint64_t v22 = [v21 contacts];
    id v37 = [v22 firstObject];

    id v17 = v37;
  }
  if (v17)
  {
LABEL_17:
    uint64_t v23 = +[CNContactViewController descriptorForRequiredKeys];
    v48[0] = v23;
    BOOL v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
    char v25 = [v38 areKeysAvailable:v24];

    if (v25)
    {
      char v26 = v38;
      if (!v11) {
        goto LABEL_22;
      }
    }
    else
    {
      id v27 = [(CNContactNavigationController *)self dataSource];
      id v28 = +[CNContactViewController descriptorForRequiredKeys];
      v47 = v28;
      id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
      uint64_t v30 = [v27 completeContactFromContact:v38 fromMainStoreOnly:0 keysToFetch:v29];

      char v26 = (void *)v30;
      if (!v11)
      {
LABEL_22:
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __184__CNContactNavigationController_showCardForContact_resetFilter_resetSearch_fallbackToFirstContact_scrollToContact_animated_dismissingPresentedController_shouldHideContactListIfNeeded___block_invoke;
        aBlock[3] = &unk_1E5498310;
        aBlock[4] = self;
        id v32 = v26;
        id v43 = v32;
        BOOL v44 = v10;
        BOOL v45 = a9;
        BOOL v46 = a10;
        long long v33 = (void (**)(void))_Block_copy(aBlock);
        long long v34 = [(CNContactNavigationController *)self transitionCoordinator];
        if (v34)
        {
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __184__CNContactNavigationController_showCardForContact_resetFilter_resetSearch_fallbackToFirstContact_scrollToContact_animated_dismissingPresentedController_shouldHideContactListIfNeeded___block_invoke_3;
          v40[3] = &unk_1E5498338;
          uint64_t v41 = v33;
          [v34 animateAlongsideTransition:0 completion:v40];
        }
        else
        {
          v33[2](v33);
        }

        return;
      }
    }
    id v31 = [(CNContactListViewController *)self->_contactListViewController visibleListViewController];
    [v31 selectContact:v39 animated:v10 scrollPosition:0];

    char v26 = v39;
    goto LABEL_22;
  }

  [(CNContactNavigationController *)self setHasPendingShowCard:0];
}

uint64_t __184__CNContactNavigationController_showCardForContact_resetFilter_resetSearch_fallbackToFirstContact_scrollToContact_animated_dismissingPresentedController_shouldHideContactListIfNeeded___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) ignoresMapsData] & 1) != 0
    || ([*(id *)(a1 + 40) mapsData],
        id v2 = objc_claimAutoreleasedReturnValue(),
        v2,
        !v2))
  {
    if ([*(id *)(a1 + 40) isUnknown])
    {
      if ([*(id *)(a1 + 40) isSuggestedMe]) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = 2;
      }
    }
    else
    {
      uint64_t v10 = 1;
    }
    BOOL v11 = [*(id *)(a1 + 32) delegate];
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0
      || ([*(id *)(a1 + 32) delegate],
          BOOL v13 = objc_claimAutoreleasedReturnValue(),
          [v13 contactNavigationController:*(void *)(a1 + 32) contactViewControllerForContact:*(void *)(a1 + 40) preferredMode:v10], id v3 = (id)objc_claimAutoreleasedReturnValue(), v13, !v3))
    {
      id v3 = [*(id *)(a1 + 32) reuseableContactViewControllerConfiguredForContact:*(void *)(a1 + 40) mode:v10];
    }
    if ([MEMORY[0x1E4F1B8F8] quickActionsEnabled]) {
      objc_msgSend(v3, "setActions:", objc_msgSend(v3, "actions") | 0x200);
    }
    [v3 setDelegate:*(void *)(a1 + 32)];
    char v14 = [*(id *)(a1 + 32) contactStore];
    [v3 setContactStore:v14];

    [v3 setShouldShowLinkedContacts:1];
    objc_msgSend(v3, "setAllowsEditing:", objc_msgSend(*(id *)(a1 + 32), "allowsCardEditing"));
    id v15 = [*(id *)(*(void *)(a1 + 32) + 1416) contactFormatter];
    [v3 setContactFormatter:v15];

    id v16 = [*(id *)(a1 + 32) dataSource];
    id v6 = [v16 preferredForNameMeContactIdentifier];

    id v17 = [*(id *)(a1 + 40) allLinkedIdentifiers];
    objc_msgSend(v3, "setShowingMeContact:", objc_msgSend(v17, "containsObject:", v6));

    [v3 setContact:*(void *)(a1 + 40)];
    if ([*(id *)(a1 + 32) allowsCardDeletion]) {
      objc_msgSend(v3, "setActions:", objc_msgSend(v3, "actions") | 0x100);
    }
    if ([*(id *)(a1 + 32) allowsContactBlocking]) {
      objc_msgSend(v3, "setActions:", objc_msgSend(v3, "actions") | 0x80);
    }
    if ([*(id *)(a1 + 32) allowsContactBlockingAndReporting]) {
      objc_msgSend(v3, "setActions:", objc_msgSend(v3, "actions") | 0x800);
    }
    objc_msgSend(*(id *)(a1 + 32), "_cnui_presentViewController:animated:dismissingPresentedController:shouldHideContactListIfNeeded:", v3, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(unsigned __int8 *)(a1 + 50));
  }
  else
  {
    id v3 = objc_alloc_init((Class)getMUPlaceViewControllerConfigurationClass[0]());
    [v3 setOptions:16];
    [v3 setContactsNavigationController:*(void *)(a1 + 32)];
    id v4 = (void *)[objc_alloc((Class)getMUPlaceViewControllerClass[0]()) initWithConfiguration:v3];
    char v5 = [v4 navigationItem];
    [v5 setLargeTitleDisplayMode:2];

    id v6 = objc_alloc_init((Class)getMKLocalSearchRequestClass[0]());
    BOOL v7 = [*(id *)(a1 + 40) mapsData];
    [v6 _setContactsDataString:v7];

    BOOL v8 = (void *)[objc_alloc((Class)getMKLocalSearchClass[0]()) initWithRequest:v6];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    id v21 = __184__CNContactNavigationController_showCardForContact_resetFilter_resetSearch_fallbackToFirstContact_scrollToContact_animated_dismissingPresentedController_shouldHideContactListIfNeeded___block_invoke_2;
    uint64_t v22 = &unk_1E54982E8;
    id v23 = v4;
    id v24 = *(id *)(a1 + 40);
    id v9 = v4;
    [v8 startWithCompletionHandler:&v19];
    objc_msgSend(*(id *)(a1 + 32), "_cnui_presentViewController:animated:dismissingPresentedController:shouldHideContactListIfNeeded:", v9, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(unsigned __int8 *)(a1 + 50), v19, v20, v21, v22);
  }
  return [*(id *)(a1 + 32) setHasPendingShowCard:0];
}

uint64_t __184__CNContactNavigationController_showCardForContact_resetFilter_resetSearch_fallbackToFirstContact_scrollToContact_animated_dismissingPresentedController_shouldHideContactListIfNeeded___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __184__CNContactNavigationController_showCardForContact_resetFilter_resetSearch_fallbackToFirstContact_scrollToContact_animated_dismissingPresentedController_shouldHideContactListIfNeeded___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!a3)
  {
    id v10 = v5;
    id v6 = [v5 mapItems];
    BOOL v7 = [v6 firstObject];

    id v5 = v10;
    if (v7)
    {
      BOOL v8 = [v10 mapItems];
      id v9 = [v8 firstObject];

      [*(id *)(a1 + 32) setMapItem:v9 contact:*(void *)(a1 + 40)];
      id v5 = v10;
    }
  }
}

- (void)showCardForContact:(id)a3 resetFilter:(BOOL)a4 resetSearch:(BOOL)a5 fallbackToFirstContact:(BOOL)a6 scrollToContact:(BOOL)a7 animated:(BOOL)a8 dismissingPresentedController:(BOOL)a9
{
  BYTE1(v9) = 1;
  LOBYTE(v9) = a9;
  -[CNContactNavigationController showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:dismissingPresentedController:shouldHideContactListIfNeeded:](self, "showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:dismissingPresentedController:shouldHideContactListIfNeeded:", a3, a4, a5, a6, a7, a8, v9);
}

- (void)showCardForContact:(id)a3 resetFilter:(BOOL)a4 resetSearch:(BOOL)a5 fallbackToFirstContact:(BOOL)a6 scrollToContact:(BOOL)a7 animated:(BOOL)a8
{
  LOBYTE(v8) = 1;
  [(CNContactNavigationController *)self showCardForContact:a3 resetFilter:a4 resetSearch:a5 fallbackToFirstContact:a6 scrollToContact:a7 animated:a8 dismissingPresentedController:v8];
}

- (void)dismissSearchAndSelectContact:(id)a3 allowsMultiSelection:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = [(CNContactNavigationController *)self contactListViewController];
  [v7 cancelSearch:0];

  if (!a4)
  {
    uint64_t v8 = [(CNContactNavigationController *)self contactListViewController];
    [v8 deselectAllSelectedIndexPathsAnimated:0];
  }
  uint64_t v9 = [(CNContactNavigationController *)self contactListViewController];
  [v9 setCellStateSelected:1 forContact:v6 animated:0];

  id v11 = [(CNContactNavigationController *)self contactListViewController];
  id v10 = [v6 identifier];

  [v11 scrollTopToContactWithIdentifier:v10 animated:1];
}

- (void)showNewDraftContact:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = +[CNContactViewController viewControllerForNewDraftContact:a3];
  id v6 = [(CNContactNavigationController *)self contactStore];
  [v14 setContactStore:v6];

  [v14 setDelegate:self];
  BOOL v7 = [(CNContactNavigationController *)self prohibitedPropertyKeys];
  [v14 setProhibitedPropertyKeys:v7];

  uint64_t v8 = [(CNContactNavigationController *)self targetGroupForNewContact];
  uint64_t v9 = [(CNContactNavigationController *)self targetContainerForNewContactWithTargetGroup:v8];
  [v14 setParentContainer:v9];
  [v14 setParentGroup:v8];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v14];
  id v11 = [(CNContactNavigationController *)self contactStyle];
  char v12 = [v11 usesInsetPlatterStyle];

  if ((v12 & 1) == 0) {
    [v10 setModalPresentationStyle:3];
  }
  BOOL v13 = [(CNContactNavigationController *)self addContactPresenter];
  [v13 presentAddContactViewController:v10 animated:v4];
}

- (void)addContact:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = +[CNContactViewController viewControllerForNewContact:a3];
  id v6 = [(CNContactNavigationController *)self contactStore];
  [v14 setContactStore:v6];

  [v14 setDelegate:self];
  BOOL v7 = [(CNContactNavigationController *)self prohibitedPropertyKeys];
  [v14 setProhibitedPropertyKeys:v7];

  uint64_t v8 = [(CNContactNavigationController *)self targetGroupForNewContact];
  uint64_t v9 = [(CNContactNavigationController *)self targetContainerForNewContactWithTargetGroup:v8];
  [v14 setParentContainer:v9];
  [v14 setParentGroup:v8];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v14];
  id v11 = [(CNContactNavigationController *)self contactStyle];
  char v12 = [v11 usesInsetPlatterStyle];

  if ((v12 & 1) == 0) {
    [v10 setModalPresentationStyle:3];
  }
  BOOL v13 = [(CNContactNavigationController *)self addContactPresenter];
  [v13 presentAddContactViewController:v10 animated:v4];
}

- (void)presentAddContactViewController:(id)a3 animated:(BOOL)a4
{
}

- (id)addContactPresenter
{
  id v3 = [(CNContactNavigationController *)self parentViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 conformsToProtocol:&unk_1ED98D920])
  {
    BOOL v4 = [(CNContactNavigationController *)self parentViewController];
  }
  else
  {
    BOOL v4 = self;
  }
  id v5 = v4;

  return v5;
}

- (void)cancel:(id)a3
{
  BOOL v4 = [(CNContactNavigationController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNContactNavigationController *)self delegate];
    [v6 contactNavigationControllerDidCancel:self];
  }
}

- (void)done:(id)a3
{
  BOOL v4 = [(CNContactNavigationController *)self contactListViewController];
  int v5 = [v4 isSearching];

  if (v5)
  {
    id v8 = [(CNContactNavigationController *)self contactListViewController];
    [v8 searchForString:0 animated:1 completionBlock:0];
  }
  else
  {
    id v6 = [(CNContactNavigationController *)self delegate];
    int v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0) {
      return;
    }
    id v8 = [(CNContactNavigationController *)self delegate];
    [v8 contactNavigationControllerDidComplete:self];
  }
}

- (void)presentGroupsViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CNContactNavigationController *)self isSinglePickerOnVisionOS])
  {
    id v11 = [(CNContactNavigationController *)self accountsAndGroupsViewController];
    [(CNContactNavigationController *)self pushViewController:v11 animated:1];
  }
  else
  {
    int v5 = [(CNContactNavigationController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id v6 = [(CNContactNavigationController *)self delegate];
      int v7 = [v6 contactNavigationControllerShouldShowGroupsViewController:self];

      if (!v7) {
        return;
      }
    }
    else
    {
    }
    id v8 = [(CNContactNavigationController *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0)
    {
      id v10 = (id)[(CNContactNavigationController *)self popToRootViewControllerAnimated:v3];
      return;
    }
    id v11 = [(CNContactNavigationController *)self delegate];
    [v11 showGroupsAnimated:1];
  }
}

- (void)presentGroupsViewController:(id)a3
{
  BOOL v4 = [(CNContactNavigationController *)self contactListViewController];
  int v5 = [v4 isSearching];

  if (v5)
  {
    id v6 = [(CNContactNavigationController *)self contactListViewController];
    [v6 cancelSearch:0];
  }

  [(CNContactNavigationController *)self presentGroupsViewControllerAnimated:1];
}

- (void)clearServerSearchIfNeeded:(id)a3
{
  BOOL v4 = [(CNContactNavigationController *)self accountsAndGroupsDataSource];
  int v5 = [v4 serverFilter];

  if (v5)
  {
    id v6 = [(CNContactNavigationController *)self accountsAndGroupsDataSource];
    [v6 removeServerFilter];

    int v7 = [(CNContactNavigationController *)self accountsAndGroupsViewController];
    [(CNContactNavigationController *)self accountsAndGroupsViewControllerDidUpdateSelection:v7];

    id v8 = [(CNContactNavigationController *)self accountsAndGroupsViewController];
    [v8 reloadData];
  }
}

- (void)presentErrorAlertWithTitle:(id)a3 message:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  int v7 = (void *)MEMORY[0x1E4FB1410];
  id v8 = CNContactsUIBundle();
  char v9 = [v8 localizedStringForKey:@"OKAY" value:&stru_1ED8AC728 table:@"Localized"];
  id v10 = [v7 actionWithTitle:v9 style:0 handler:0];

  [v11 addAction:v10];
  [(CNContactNavigationController *)self presentViewController:v11 animated:v5 completion:0];
}

- (void)mailContacts:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  BOOL v4 = [(CNContactNavigationController *)self dataSource];
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = v5;

  if (!v6)
  {
    char v12 = CNContactsUIBundle();
    BOOL v13 = [v12 localizedStringForKey:@"EMAIL_GROUP_FAILURE" value:&stru_1ED8AC728 table:@"Localized"];
    [(CNContactNavigationController *)self presentErrorAlertWithTitle:0 message:v13 animated:1];

    id v14 = CNUILogContactList();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    id v15 = "Data source is not of type CNContactStoreDataSource";
LABEL_17:
    _os_log_impl(&dword_18B625000, v14, OS_LOG_TYPE_INFO, v15, buf, 2u);
    goto LABEL_24;
  }
  int v7 = [v6 filteredGroup];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E4F1B8F8];
    char v9 = [v6 filteredGroup];
    id v10 = [v9 identifier];
    uint64_t v11 = [v8 predicateForContactsInGroupWithIdentifier:v10];
  }
  else
  {
    id v16 = [v6 filteredContainer];

    if (!v16)
    {
LABEL_15:
      id v29 = CNContactsUIBundle();
      uint64_t v30 = [v29 localizedStringForKey:@"EMAIL_GROUP_FAILURE" value:&stru_1ED8AC728 table:@"Localized"];
      [(CNContactNavigationController *)self presentErrorAlertWithTitle:0 message:v30 animated:1];

      id v14 = CNUILogContactList();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      id v15 = "Not viewing a single group";
      goto LABEL_17;
    }
    id v17 = (void *)MEMORY[0x1E4F1B8F8];
    char v9 = [v6 filteredContainer];
    id v10 = [v9 identifier];
    uint64_t v11 = [v17 predicateForContactsInContainerWithIdentifier:v10];
  }
  id v14 = v11;

  if (!v14) {
    goto LABEL_15;
  }
  char v18 = [(CNContactNavigationController *)self dataSource];
  uint64_t v19 = [v18 store];
  uint64_t v20 = [MEMORY[0x1E4F1BA28] descriptorForRequiredKeys];
  v40[0] = v20;
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  id v35 = 0;
  uint64_t v22 = [v19 unifiedContactsMatchingPredicate:v14 keysToFetch:v21 error:&v35];
  id v23 = v35;

  if (v22)
  {
    id v24 = objc_alloc_init(MEMORY[0x1E4F1BA28]);
    char v25 = [v24 mailUrlForContacts:v22 needsEmailAddresses:0];
    if (v25)
    {
      char v26 = +[CNUIContactsEnvironment currentEnvironment];
      id v27 = [v26 applicationWorkspace];
      uint64_t v36 = *MEMORY[0x1E4F22320];
      uint64_t v37 = MEMORY[0x1E4F1CC38];
      id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      [v27 openSensitiveURLInBackground:v25 withOptions:v28];
    }
    else
    {
      long long v33 = CNContactsUIBundle();
      long long v34 = [v33 localizedStringForKey:@"EMAIL_GROUP_FAILURE" value:&stru_1ED8AC728 table:@"Localized"];
      [(CNContactNavigationController *)self presentErrorAlertWithTitle:0 message:v34 animated:1];

      char v26 = CNUILogContactList();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B625000, v26, OS_LOG_TYPE_INFO, "Failed to create mail URL", buf, 2u);
      }
    }
  }
  else
  {
    id v31 = CNContactsUIBundle();
    id v32 = [v31 localizedStringForKey:@"EMAIL_GROUP_FAILURE" value:&stru_1ED8AC728 table:@"Localized"];
    [(CNContactNavigationController *)self presentErrorAlertWithTitle:0 message:v32 animated:1];

    id v24 = CNUILogContactList();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v23;
      _os_log_impl(&dword_18B625000, v24, OS_LOG_TYPE_INFO, "Failed to fetch contacts with keys for mailing, error: %@", buf, 0xCu);
    }
  }

LABEL_24:
}

- (UIBarButtonItem)mailButtonItem
{
  if (!self->_mailButtonItem && ![(CNContactNavigationController *)self hideMailToGroupButton])
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
    BOOL v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"envelope"];
    BOOL v5 = (UIBarButtonItem *)[v3 initWithImage:v4 style:0 target:self action:sel_mailContacts_];
    mailButtonItem = self->_mailButtonItem;
    self->_mailButtonItem = v5;

    [(UIBarButtonItem *)self->_mailButtonItem setAccessibilityIdentifier:@"EmailGroupButton"];
    int v7 = CNContactsUIBundle();
    id v8 = [v7 localizedStringForKey:@"EMAIL_GROUP_ACCESSIBILITY_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
    [(UIBarButtonItem *)self->_mailButtonItem setAccessibilityLabel:v8];

    char v9 = [(CNContactNavigationController *)self dataSource];
    id v10 = [v9 contacts];
    -[UIBarButtonItem setEnabled:](self->_mailButtonItem, "setEnabled:", [v10 count] != 0);
  }
  uint64_t v11 = self->_mailButtonItem;

  return v11;
}

- (void)setManagedConfiguration:(id)a3
{
  id v6 = a3;
  if ((-[CNManagedConfiguration isEqual:](self->_managedConfiguration, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_managedConfiguration, a3);
    BOOL v5 = [(CNContactNavigationController *)self accountsAndGroupsViewController];
    [v5 setManagedConfiguration:v6];
  }
}

- (void)setContactPickerTargetGroupIdentifier:(id)a3
{
  id v12 = a3;
  if (!-[NSString isEqualToString:](self->_contactPickerTargetGroupIdentifier, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_contactPickerTargetGroupIdentifier, a3);
    BOOL v5 = [(CNContactNavigationController *)self groupsAndContainersSaveManager];
    id v6 = [v5 acAccountForGroupIdentifier:v12];

    if (v6)
    {
      int v7 = (void *)MEMORY[0x1E4F1CAD0];
      id v8 = [v6 identifier];
      char v9 = [v7 setWithObject:v8];
      id v10 = [(CNContactNavigationController *)self accountsAndGroupsViewController];
      uint64_t v11 = [v10 dataSource];
      [v11 setTargetAccountExternalIdentifiers:v9];
    }
  }
}

- (void)updateNavigationButtonsInSearchMode:(BOOL)a3
{
}

- (BOOL)allowsCardDeletion
{
  if (self->_allowsCardDeletion) {
    return ![(CNContactNavigationController *)self isContactProviderDataSource];
  }
  else {
    return 0;
  }
}

BOOL __78__CNContactNavigationController_updateNavigationButtonsInSearchMode_animated___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 mailButtonItem];

  return v4 != v3;
}

- (BOOL)hidesSearchableSources
{
  id v2 = [(CNContactNavigationController *)self accountsAndGroupsDataSource];
  char v3 = [v2 hidesSearchableSources];

  return v3;
}

- (void)setHidesSearchableSources:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CNContactNavigationController *)self accountsAndGroupsDataSource];
  [v4 setHidesSearchableSources:v3];
}

- (BOOL)shouldDisplayMeContactBanner
{
  return [(CNContactListViewController *)self->_contactListViewController shouldDisplayMeContactBanner];
}

- (void)setShouldDisplayMeContactBanner:(BOOL)a3
{
}

- (void)contactStyleCurrentStyleDidChange:(id)a3
{
  mainThreadScheduler = self->_mainThreadScheduler;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__CNContactNavigationController_contactStyleCurrentStyleDidChange___block_invoke;
  v4[3] = &unk_1E549B488;
  v4[4] = self;
  [(CNScheduler *)mainThreadScheduler performBlock:v4];
}

void __67__CNContactNavigationController_contactStyleCurrentStyleDidChange___block_invoke(uint64_t a1)
{
  id v2 = +[CNContactStyle currentStyle];
  [*(id *)(a1 + 32) setContactStyle:v2];
}

- (void)scrollToContact:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  id v7 = [(CNContactNavigationController *)self contactListViewController];
  id v6 = [v5 identifier];

  [v7 scrollTopToContactWithIdentifier:v6 animated:0];
}

- (id)firstVisibleContact
{
  BOOL v3 = [(CNContactNavigationController *)self dataSource];
  id v4 = [v3 contacts];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(CNContactNavigationController *)self contactListViewController];
    id v7 = [v6 visibleListViewController];
    id v8 = [v7 collectionView];

    [v8 contentOffset];
    double v10 = v9;
    uint64_t v11 = [(CNContactNavigationController *)self contactListViewController];
    id v12 = [v11 visibleListViewController];
    [v12 contactListHeaderHeight];
    double v14 = v13;

    [v8 center];
    double v16 = v15;
    id v17 = [(CNContactNavigationController *)self navigationBar];
    [v17 frame];
    double v19 = v18;

    uint64_t v20 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    id v21 = [v8 layoutAttributesForItemAtIndexPath:v20];

    [v21 frame];
    double v23 = v22;
    double v25 = v24;
    char v26 = [v8 collectionViewLayout];
    id v27 = objc_msgSend(v26, "layoutAttributesForElementsInRect:", v16, v10 + v14 + v19, v23, v25);

    id v28 = objc_msgSend(v27, "_cn_map:", &__block_literal_global_24229);
    id v29 = 0;
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
    {
      uint64_t v30 = [v28 objectAtIndexedSubscript:0];
      id v31 = [(CNContactNavigationController *)self contactListViewController];
      unint64_t v32 = [v31 globalIndexForCollectionViewIndexPath:v30];

      id v29 = 0;
      if (v32 != 0x7FFFFFFFFFFFFFFFLL)
      {
        long long v33 = [(CNContactNavigationController *)self dataSource];
        long long v34 = [v33 contacts];
        unint64_t v35 = [v34 count];

        if (v32 >= v35)
        {
          id v29 = 0;
        }
        else
        {
          uint64_t v36 = [(CNContactNavigationController *)self dataSource];
          uint64_t v37 = [v36 contacts];
          id v29 = [v37 objectAtIndexedSubscript:v32];
        }
      }
    }
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

uint64_t __52__CNContactNavigationController_firstVisibleContact__block_invoke(uint64_t a1, void *a2)
{
  return [a2 indexPath];
}

- (void)updateUserActivityState:(id)a3
{
  id v18 = a3;
  uint64_t v4 = [(CNContactNavigationController *)self firstVisibleContact];
  if ([(CNContactNavigationController *)self isPresentedContactViewControllerVisible])
  {
    uint64_t v5 = [(CNContactNavigationController *)self presentedContactViewController];
    id v6 = [v5 contentViewController];
    uint64_t v7 = [v6 contact];
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = [(CNContactNavigationController *)self contactListViewController];
  double v9 = [v8 currentSearchString];

  if (v4 | v7)
  {
    if (!v4 && v7) {
      uint64_t v4 = (uint64_t)(id)v7;
    }
    goto LABEL_10;
  }
  uint64_t v4 = 0;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))() & 1) == 0)
  {
LABEL_10:
    double v10 = [(CNContactNavigationController *)self accountsAndGroupsViewController];
    if ([v10 isViewLoaded])
    {
      uint64_t v11 = [(CNContactNavigationController *)self accountsAndGroupsViewController];
      id v12 = [v11 view];
      double v13 = [v12 window];
      BOOL v14 = v13 != 0;
    }
    else
    {
      BOOL v14 = 0;
    }

    double v15 = [(CNContactNavigationController *)self activityManager];
    double v16 = [(CNContactNavigationController *)self contactListViewController];
    id v17 = [v16 currentSearchString];
    [v15 updateUserActivityState:v18 withContentsOfListTopContact:v4 displayedContact:v7 searchString:v17 isShowingGroups:v14];
  }
}

- (void)_updateUserActivity
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (CNUIIsContacts() || CNUIIsMobilePhone())
  {
    BOOL v3 = CNUILogContactList();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v5 = [v4 bundleIdentifier];
      int v15 = 138412290;
      double v16 = v5;
      _os_log_impl(&dword_18B625000, v3, OS_LOG_TYPE_INFO, "Activity continuity - running in %@", (uint8_t *)&v15, 0xCu);
    }
    id v6 = [(CNContactNavigationController *)self activityManager];
    uint64_t v7 = [v6 makeActivityAdvertisingViewingList];

    id v8 = [(CNContactNavigationController *)self userActivity];
    double v9 = v8;
    if (v7)
    {

      if (!v9)
      {
        [(CNContactNavigationController *)self setUserActivity:v7];
        double v10 = [(CNContactNavigationController *)self userActivity];
        [v10 becomeCurrent];

        uint64_t v11 = CNUILogContactList();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = [(CNContactNavigationController *)self userActivity];
          int v15 = 138412546;
          double v16 = self;
          __int16 v17 = 2112;
          id v18 = v12;
          _os_log_impl(&dword_18B625000, v11, OS_LOG_TYPE_INFO, "Activity continuity -  %@ created %@", (uint8_t *)&v15, 0x16u);
        }
      }
    }
    else
    {
      [v8 resignCurrent];

      double v13 = CNUILogContactList();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        BOOL v14 = [(CNContactNavigationController *)self userActivity];
        int v15 = 138412546;
        double v16 = self;
        __int16 v17 = 2112;
        id v18 = v14;
        _os_log_impl(&dword_18B625000, v13, OS_LOG_TYPE_INFO, "Activity continuity -  %@ removed %@", (uint8_t *)&v15, 0x16u);
      }
      [(CNContactNavigationController *)self setUserActivity:0];
    }
  }
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNContactNavigationController;
  [(CNContactNavigationController *)&v4 dealloc];
}

- (CNContactNavigationController)initWithDataSource:(id)a3
{
  return [(CNContactNavigationController *)self initWithDataSource:a3 allowsLargeTitles:0];
}

+ (void)moveViewController:(id)a3 toParent:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 willMoveToParentViewController:0];
  [v6 removeFromParentViewController];
  [v5 addChildViewController:v6];
  [v6 didMoveToParentViewController:v5];
  uint64_t v7 = [v5 view];
  id v8 = [v6 view];
  [v7 addSubview:v8];

  double v9 = [v5 view];
  double v10 = [v9 topAnchor];
  uint64_t v11 = [v6 view];
  id v12 = [v11 topAnchor];
  double v13 = [v10 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  BOOL v14 = [v5 view];
  int v15 = [v14 bottomAnchor];
  double v16 = [v6 view];
  __int16 v17 = [v16 bottomAnchor];
  id v18 = [v15 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  uint64_t v19 = [v5 view];
  uint64_t v20 = [v19 leadingAnchor];
  id v21 = [v6 view];
  double v22 = [v21 leadingAnchor];
  double v23 = [v20 constraintEqualToAnchor:v22];
  [v23 setActive:1];

  double v24 = [v5 view];
  double v25 = [v24 trailingAnchor];
  char v26 = [v6 view];
  id v27 = [v26 trailingAnchor];
  id v28 = [v25 constraintEqualToAnchor:v27];
  [v28 setActive:1];

  id v29 = [v6 view];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v30 = [v6 title];

  [v5 setTitle:v30];
}

@end