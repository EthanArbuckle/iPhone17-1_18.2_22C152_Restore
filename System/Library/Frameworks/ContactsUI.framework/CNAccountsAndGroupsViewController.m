@interface CNAccountsAndGroupsViewController
+ (id)allowedDropTypes;
+ (id)log;
- (BOOL)allowsCanceling;
- (BOOL)allowsDone;
- (BOOL)allowsEditing;
- (BOOL)canBecomeFirstResponder;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)editingCollectionViewRequiresAuthorization;
- (BOOL)isAnyListCellCurrentlyEditing;
- (BOOL)isCollectionViewEditing;
- (BOOL)isLimitedAccessOnboarding;
- (BOOL)isNotificationInternalSave:(id)a3;
- (BOOL)isVisible;
- (BOOL)needsReload;
- (BOOL)shouldEnableItem:(id)a3;
- (BOOL)shouldSetFirstResponder;
- (BOOL)shouldShowCancelButton;
- (BOOL)viewCanReload;
- (CNAccountsAndGroupsActionsProvider)actionsProvider;
- (CNAccountsAndGroupsAuthorizationContext)currentAuthorizationContext;
- (CNAccountsAndGroupsDataSource)dataSource;
- (CNAccountsAndGroupsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CNAccountsAndGroupsViewControllerDelegate)delegate;
- (CNContainerDataSource)containerDataSource;
- (CNManagedConfiguration)managedConfiguration;
- (CNUIEditAuthorizationController)editAuthorizationController;
- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager;
- (CNUIUserActivityManager)activityManager;
- (UIBarButtonItem)addGroupBarButtonItem;
- (UIBarButtonItem)cancelBarButtonItem;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (UIKeyCommand)addGroupKeyCommand;
- (UIViewController)potentiallyPresentedViewController;
- (_UIDiffableDataSourceOutlineSectionController)sectionController;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)currentlySelectedItem;
- (id)fakeBackButton;
- (id)groupsStyle;
- (id)layout;
- (id)menuForContainers;
- (id)multitaskingDragExclusionRects;
- (int64_t)buttonBehavior;
- (void)_updateUserActivity;
- (void)action:(id)a3 presentViewController:(id)a4;
- (void)addDefaultGroup:(id)a3;
- (void)authorizedAddContacts:(id)a3 toDestinationItem:(id)a4;
- (void)authorizedSetCollectionViewEditing:(BOOL)a3;
- (void)authorizedSetViewEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)cancel:(id)a3;
- (void)cellTextViewDidChangeHeight;
- (void)cleanUpItemIfNeeded:(id)a3;
- (void)clearNavigationButtonsIfNeeded;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)configureDataSource;
- (void)contactStoreDidChange:(id)a3;
- (void)dealloc;
- (void)deselectAllItems;
- (void)didTapCollectionView:(id)a3;
- (void)dismissKeyboard;
- (void)editAuthorizationController:(id)a3 authorizationDidFinishWithResult:(int64_t)a4;
- (void)expandSectionForAccountWithIdentifier:(id)a3;
- (void)goBack:(id)a3;
- (void)item:(id)a3 didEndEditingWithName:(id)a4;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)presentController:(id)a3 animated:(BOOL)a4;
- (void)presentErrorAlertWithMessage:(id)a3 animated:(BOOL)a4;
- (void)presentErrorAlertWithTitle:(id)a3 message:(id)a4 animated:(BOOL)a5;
- (void)reloadAddGroupButton;
- (void)reloadCollectionViewAddingPlaceholderItem:(id)a3 inSectionWithIdentifier:(id)a4;
- (void)reloadCollectionViewDeletingItem:(id)a3;
- (void)reloadCollectionViewForSectionWithIdentifier:(id)a3 settingFilterForEditingItem:(BOOL)a4 allowsReloadWhenEditing:(BOOL)a5;
- (void)reloadData;
- (void)removePlaceholderCellsIfNeededInSection:(id)a3 animated:(BOOL)a4;
- (void)resignAllFirstRespondersSavingCurrentlyEditing:(BOOL)a3;
- (void)restoreCurrentlyEditingGroupIfNeeded;
- (void)selectAllContacts;
- (void)setActionsProvider:(id)a3;
- (void)setAddGroupBarButtonItem:(id)a3;
- (void)setAddGroupKeyCommand:(id)a3;
- (void)setAllowsCanceling:(BOOL)a3;
- (void)setAllowsDone:(BOOL)a3;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setButtonBehavior:(int64_t)a3;
- (void)setCancelBarButtonItem:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setContainerDataSource:(id)a3;
- (void)setCurrentAuthorizationContext:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setEditAuthorizationController:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEditingForGroupItem:(id)a3;
- (void)setGroupsAndContainersSaveManager:(id)a3;
- (void)setIsLimitedAccessOnboarding:(BOOL)a3;
- (void)setIsVisible:(BOOL)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setNeedsReload:(BOOL)a3;
- (void)setPotentiallyPresentedViewController:(id)a3;
- (void)setSectionController:(id)a3;
- (void)setUpCollectionView;
- (void)showEditAuthorizationPaneWithAuthorizationContext:(id)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateNavigationButtons;
- (void)updateSelectionIfNeeded;
- (void)updateToolbarVisibility;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CNAccountsAndGroupsViewController

- (void)setManagedConfiguration:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setDataSource:(id)a3
{
  v5 = (CNAccountsAndGroupsDataSource *)a3;
  p_dataSource = &self->_dataSource;
  if (self->_dataSource != v5)
  {
    v20 = v5;
    objc_storeStrong((id *)&self->_dataSource, a3);
    if (v20)
    {
      v7 = [CNUIGroupsAndContainersSaveManager alloc];
      v8 = [(CNAccountsAndGroupsDataSource *)*p_dataSource store];
      v9 = [(CNUIGroupsAndContainersSaveManager *)v7 initWithContactStore:v8];
      groupsAndContainersSaveManager = self->_groupsAndContainersSaveManager;
      self->_groupsAndContainersSaveManager = v9;

      v11 = [CNContainerDataSource alloc];
      v12 = [(CNAccountsAndGroupsDataSource *)*p_dataSource store];
      v13 = [(CNContainerDataSource *)v11 initWithContactStore:v12];
      containerDataSource = self->_containerDataSource;
      self->_containerDataSource = v13;

      [(CNContainerDataSource *)self->_containerDataSource setIgnoresExchangeContainers:1];
      v15 = [[CNAccountsAndGroupsActionsProvider alloc] initWithDataSource:*p_dataSource saveManager:self->_groupsAndContainersSaveManager];
      actionsProvider = self->_actionsProvider;
      self->_actionsProvider = v15;

      [(CNAccountsAndGroupsActionsProvider *)self->_actionsProvider setDelegate:self];
    }
    else
    {
      v17 = self->_groupsAndContainersSaveManager;
      self->_groupsAndContainersSaveManager = 0;

      v18 = self->_containerDataSource;
      self->_containerDataSource = 0;

      v19 = self->_actionsProvider;
      self->_actionsProvider = 0;
    }
    v5 = v20;
  }
}

- (CNAccountsAndGroupsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)CNAccountsAndGroupsViewController;
  v4 = [(CNAccountsAndGroupsViewController *)&v19 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = CNContactsUIBundle();
    v6 = [v5 localizedStringForKey:@"LISTS" value:&stru_1ED8AC728 table:@"Localized"];
    [(CNAccountsAndGroupsViewController *)v4 setTitle:v6];

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v4 selector:sel_contactStoreDidChange_ name:*MEMORY[0x1E4F1AF80] object:0];

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v4 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v4 selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v4 selector:sel_keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];

    v4->_needsReload = 1;
    v4->_allowsEditing = 1;
    v11 = [MEMORY[0x1E4F28B50] mainBundle];
    v12 = [v11 bundleIdentifier];

    id v13 = objc_alloc(MEMORY[0x1E4F5A440]);
    v14 = [MEMORY[0x1E4F5A448] sharedConnection];
    uint64_t v15 = [v13 initWithBundleIdentifier:v12 managedProfileConnection:v14];
    managedConfiguration = v4->_managedConfiguration;
    v4->_managedConfiguration = (CNManagedConfiguration *)v15;

    v17 = v4;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_addGroupBarButtonItem, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_potentiallyPresentedViewController, 0);
  objc_storeStrong((id *)&self->_addGroupKeyCommand, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_actionsProvider, 0);
  objc_storeStrong((id *)&self->_currentAuthorizationContext, 0);
  objc_storeStrong((id *)&self->_containerDataSource, 0);
  objc_storeStrong((id *)&self->_editAuthorizationController, 0);
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)setCancelBarButtonItem:(id)a3
{
}

- (void)setAddGroupBarButtonItem:(id)a3
{
}

- (void)setDiffableDataSource:(id)a3
{
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return (UICollectionViewDiffableDataSource *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setSectionController:(id)a3
{
}

- (_UIDiffableDataSourceOutlineSectionController)sectionController
{
  return (_UIDiffableDataSourceOutlineSectionController *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setPotentiallyPresentedViewController:(id)a3
{
}

- (UIViewController)potentiallyPresentedViewController
{
  return self->_potentiallyPresentedViewController;
}

- (void)setAddGroupKeyCommand:(id)a3
{
}

- (void)setButtonBehavior:(int64_t)a3
{
  self->_buttonBehavior = a3;
}

- (int64_t)buttonBehavior
{
  return self->_buttonBehavior;
}

- (CNUIUserActivityManager)activityManager
{
  return self->_activityManager;
}

- (void)setActionsProvider:(id)a3
{
}

- (CNAccountsAndGroupsActionsProvider)actionsProvider
{
  return self->_actionsProvider;
}

- (void)setCurrentAuthorizationContext:(id)a3
{
}

- (CNAccountsAndGroupsAuthorizationContext)currentAuthorizationContext
{
  return self->_currentAuthorizationContext;
}

- (void)setContainerDataSource:(id)a3
{
}

- (CNContainerDataSource)containerDataSource
{
  return self->_containerDataSource;
}

- (void)setEditAuthorizationController:(id)a3
{
}

- (CNUIEditAuthorizationController)editAuthorizationController
{
  return self->_editAuthorizationController;
}

- (void)setGroupsAndContainersSaveManager:(id)a3
{
}

- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager
{
  return self->_groupsAndContainersSaveManager;
}

- (void)setIsVisible:(BOOL)a3
{
  self->_isVisible = a3;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void)setNeedsReload:(BOOL)a3
{
  self->_needsReload = a3;
}

- (BOOL)needsReload
{
  return self->_needsReload;
}

- (void)setIsLimitedAccessOnboarding:(BOOL)a3
{
  self->_isLimitedAccessOnboarding = a3;
}

- (BOOL)isLimitedAccessOnboarding
{
  return self->_isLimitedAccessOnboarding;
}

- (void)setAllowsDone:(BOOL)a3
{
  self->_allowsDone = a3;
}

- (BOOL)allowsDone
{
  return self->_allowsDone;
}

- (void)setAllowsCanceling:(BOOL)a3
{
  self->_allowsCanceling = a3;
}

- (BOOL)allowsCanceling
{
  return self->_allowsCanceling;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (CNAccountsAndGroupsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNAccountsAndGroupsViewControllerDelegate *)WeakRetained;
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (CNAccountsAndGroupsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)_updateUserActivity
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (CNUIIsContacts() || CNUIIsMobilePhone())
  {
    v3 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = [MEMORY[0x1E4F28B50] mainBundle];
      v5 = [v4 bundleIdentifier];
      int v16 = 138412290;
      v17 = v5;
      _os_log_impl(&dword_18B625000, v3, OS_LOG_TYPE_INFO, "Activity continuity - running in %@", (uint8_t *)&v16, 0xCu);
    }
    v6 = [(CNAccountsAndGroupsViewController *)self activityManager];
    v7 = [v6 makeActivityAdvertisingViewingGroups];

    v8 = [(CNAccountsAndGroupsViewController *)self userActivity];
    v9 = v8;
    if (v7)
    {

      if (!v9)
      {
        [(CNAccountsAndGroupsViewController *)self setUserActivity:v7];
        v10 = [(CNAccountsAndGroupsViewController *)self userActivity];
        [v10 becomeCurrent];

        v11 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = [(CNAccountsAndGroupsViewController *)self userActivity];
          int v16 = 138412546;
          v17 = self;
          __int16 v18 = 2112;
          objc_super v19 = v12;
          _os_log_impl(&dword_18B625000, v11, OS_LOG_TYPE_INFO, "Activity continuity -  %@ created %@", (uint8_t *)&v16, 0x16u);
        }
      }
      id v13 = [(CNAccountsAndGroupsViewController *)self userActivity];
      [v13 setNeedsSave:1];
    }
    else
    {
      [v8 resignCurrent];

      v14 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = [(CNAccountsAndGroupsViewController *)self userActivity];
        int v16 = 138412546;
        v17 = self;
        __int16 v18 = 2112;
        objc_super v19 = v15;
        _os_log_impl(&dword_18B625000, v14, OS_LOG_TYPE_INFO, "Activity continuity -  %@ removed %@", (uint8_t *)&v16, 0x16u);
      }
      [(CNAccountsAndGroupsViewController *)self setUserActivity:0];
    }
  }
}

- (void)action:(id)a3 presentViewController:(id)a4
{
  id v19 = a4;
  v5 = [v19 popoverPresentationController];
  v6 = [v5 sourceView];

  if (!v6)
  {
    v7 = [(CNAccountsAndGroupsViewController *)self collectionView];
    v8 = [v19 popoverPresentationController];
    [v8 setSourceView:v7];

    v9 = [(CNAccountsAndGroupsViewController *)self collectionView];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    __int16 v18 = [v19 popoverPresentationController];
    objc_msgSend(v18, "setSourceRect:", v11, v13, v15, v17);
  }
  [(CNAccountsAndGroupsViewController *)self presentController:v19 animated:1];
}

- (void)keyboardWillHide:(id)a3
{
  double v3 = *MEMORY[0x1E4FB2848];
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  id v7 = [(CNAccountsAndGroupsViewController *)self collectionView];
  objc_msgSend(v7, "setContentInset:", v3, v4, v5, v6);
}

- (void)keyboardWillShow:(id)a3
{
  double v4 = [a3 userInfo];
  double v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FB2BD8]];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  id v33 = [(CNAccountsAndGroupsViewController *)self collectionView];
  double v14 = [v33 window];
  objc_msgSend(v14, "convertRect:fromWindow:", 0, v7, v9, v11, v13);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  objc_msgSend(v33, "convertRect:fromView:", 0, v16, v18, v20, v22);
  double v24 = v23;
  v25 = [(CNAccountsAndGroupsViewController *)self collectionView];
  [v25 contentInset];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  v32 = [(CNAccountsAndGroupsViewController *)self collectionView];
  objc_msgSend(v32, "setContentInset:", v27, v29, v24, v31);
}

- (void)dismissKeyboard
{
  id v2 = [(CNAccountsAndGroupsViewController *)self view];
  [v2 endEditing:1];
}

- (void)didTapCollectionView:(id)a3
{
  id v4 = a3;
  double v5 = [(CNAccountsAndGroupsViewController *)self collectionView];
  [v4 locationInView:v5];
  double v7 = v6;

  double v8 = [(CNAccountsAndGroupsViewController *)self collectionView];
  [v8 bounds];
  double v10 = v9;

  double v11 = [(CNAccountsAndGroupsViewController *)self collectionView];
  double v12 = [v11 collectionViewLayout];
  objc_msgSend(v12, "layoutAttributesForElementsInRect:", 0.0, v7, v10, 1.0);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A258] + 16))()) {
    [(CNAccountsAndGroupsViewController *)self dismissKeyboard];
  }
}

- (void)showEditAuthorizationPaneWithAuthorizationContext:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(CNAccountsAndGroupsViewController *)self setCurrentAuthorizationContext:a3];
  double v6 = objc_alloc_init(CNUIEditAuthorizationController);
  [(CNAccountsAndGroupsViewController *)self setEditAuthorizationController:v6];

  double v7 = [(CNAccountsAndGroupsViewController *)self editAuthorizationController];
  [v7 setDelegate:self];

  double v8 = [(CNAccountsAndGroupsViewController *)self editAuthorizationController];
  [v8 setSender:self];

  double v9 = [(CNAccountsAndGroupsViewController *)self editAuthorizationController];
  [v9 setAnimated:v4];

  double v10 = [(CNAccountsAndGroupsViewController *)self editAuthorizationController];
  [v10 setGuardedViewController:self];

  id v11 = [(CNAccountsAndGroupsViewController *)self editAuthorizationController];
  [v11 presentAuthorizationUI];
}

- (void)presentErrorAlertWithTitle:(id)a3 message:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  double v7 = (void *)MEMORY[0x1E4FB1410];
  double v8 = CNContactsUIBundle();
  double v9 = [v8 localizedStringForKey:@"OKAY" value:&stru_1ED8AC728 table:@"Localized"];
  double v10 = [v7 actionWithTitle:v9 style:0 handler:0];

  [v11 addAction:v10];
  [(CNAccountsAndGroupsViewController *)self presentController:v11 animated:v5];
}

- (void)presentErrorAlertWithMessage:(id)a3 animated:(BOOL)a4
{
}

- (void)presentController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CNAccountsAndGroupsViewController *)self setPotentiallyPresentedViewController:v6];
  [(CNAccountsAndGroupsViewController *)self presentViewController:v6 animated:v4 completion:0];
}

- (void)editAuthorizationController:(id)a3 authorizationDidFinishWithResult:(int64_t)a4
{
  [(CNAccountsAndGroupsViewController *)self setEditAuthorizationController:0];
  id v6 = [(CNAccountsAndGroupsViewController *)self currentAuthorizationContext];

  if (v6)
  {
    if ((unint64_t)a4 >= 2)
    {
      if (a4 == 2)
      {
        double v10 = [(CNAccountsAndGroupsViewController *)self currentAuthorizationContext];
        uint64_t v11 = [v10 type];

        switch(v11)
        {
          case 0:
            id v18 = [(CNAccountsAndGroupsViewController *)self currentAuthorizationContext];
            double v12 = [v18 contactsToAddToDropDestination];
            id v13 = [(CNAccountsAndGroupsViewController *)self currentAuthorizationContext];
            double v14 = [v13 item];
            [(CNAccountsAndGroupsViewController *)self authorizedAddContacts:v12 toDestinationItem:v14];

            goto LABEL_11;
          case 1:
            id v18 = [(CNAccountsAndGroupsViewController *)self actionsProvider];
            double v9 = [(CNAccountsAndGroupsViewController *)self currentAuthorizationContext];
            double v15 = [v9 cell];
            [v18 authorizedEditGroupNameForCell:v15];
            goto LABEL_13;
          case 2:
            id v18 = [(CNAccountsAndGroupsViewController *)self actionsProvider];
            double v12 = [(CNAccountsAndGroupsViewController *)self currentAuthorizationContext];
            id v13 = [v12 item];
            double v16 = [(CNAccountsAndGroupsViewController *)self currentAuthorizationContext];
            double v17 = [v16 actionCompletionHandler];
            [v18 authorizedDeleteGroupForItem:v13 completionHandler:v17];

LABEL_11:
            goto LABEL_15;
          case 3:
            id v18 = [(CNAccountsAndGroupsViewController *)self actionsProvider];
            double v9 = [(CNAccountsAndGroupsViewController *)self currentAuthorizationContext];
            double v15 = [v9 containerItem];
            [v18 authorizedCreateGroupActionForContainerItem:v15];
LABEL_13:

            goto LABEL_14;
          case 4:
            [(CNAccountsAndGroupsViewController *)self authorizedSetViewEditing:1 animated:1];
            return;
          default:
            return;
        }
      }
    }
    else
    {
      double v7 = [(CNAccountsAndGroupsViewController *)self currentAuthorizationContext];
      double v8 = [v7 actionCompletionHandler];

      if (v8)
      {
        id v18 = [(CNAccountsAndGroupsViewController *)self currentAuthorizationContext];
        double v9 = [v18 actionCompletionHandler];
        v9[2](v9, 0);
LABEL_14:

LABEL_15:
      }
    }
  }
}

- (void)authorizedAddContacts:(id)a3 toDestinationItem:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(CNAccountsAndGroupsViewController *)self dataSource];
  double v9 = [v8 containerIdentifierForItem:v7];

  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    double v10 = [(CNAccountsAndGroupsViewController *)self dataSource];
    uint64_t v11 = [v10 groupIdentifierForGroupItem:v7];

    double v12 = [(CNAccountsAndGroupsViewController *)self groupsAndContainersSaveManager];
    id v13 = (id)[v12 addContacts:v6 toGroupWithIdentifier:v11 inContainerWithIdentifier:v9 moveWasAuthorized:1];

    double v14 = [(CNAccountsAndGroupsViewController *)self dataSource];
    double v15 = [v14 sectionIdentifierForItem:v7];

    if (v15) {
      [(CNAccountsAndGroupsViewController *)self reloadCollectionViewForSectionWithIdentifier:v15 settingFilterForEditingItem:0 allowsReloadWhenEditing:1];
    }
  }
  else
  {
    double v16 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      id v18 = v7;
      _os_log_error_impl(&dword_18B625000, v16, OS_LOG_TYPE_ERROR, "Could not add contacts to item: %@, container identifier is nil", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(CNAccountsAndGroupsViewController *)self diffableDataSource];
  id v7 = [v5 destinationIndexPath];
  double v8 = [v6 itemIdentifierForIndexPath:v7];

  double v9 = [(CNAccountsAndGroupsViewController *)self dataSource];
  double v10 = [v9 containerIdentifierForItem:v8];

  uint64_t v11 = [(CNAccountsAndGroupsViewController *)self groupsAndContainersSaveManager];
  double v12 = [v11 containerForContainerIdentifier:v10];

  id v13 = [(CNAccountsAndGroupsViewController *)self groupsAndContainersSaveManager];
  double v14 = [v13 acAccountForContainer:v12];

  if (v12)
  {
    v25 = v10;
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v18 = [v5 session];
    uint64_t v19 = objc_opt_class();
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __79__CNAccountsAndGroupsViewController_collectionView_performDropWithCoordinator___block_invoke;
    v26[3] = &unk_1E5497AC0;
    v26[4] = self;
    id v27 = v14;
    id v28 = v17;
    id v29 = v12;
    id v30 = v16;
    id v31 = v15;
    id v32 = v8;
    id v20 = v15;
    id v21 = v16;
    double v22 = v17;
    uint64_t v23 = v19;
    double v10 = v25;
    id v24 = (id)[v18 loadObjectsOfClass:v23 completion:v26];
  }
  else
  {
    double v22 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v8;
      _os_log_error_impl(&dword_18B625000, v22, OS_LOG_TYPE_ERROR, "Could not complete drop, failed to fetch container for destination item:%@", buf, 0xCu);
    }
  }
}

void __79__CNAccountsAndGroupsViewController_collectionView_performDropWithCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    uint64_t v19 = (id *)(a1 + 64);
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v21 + 1) + 8 * v6);
        double v8 = objc_msgSend(*(id *)(a1 + 32), "groupsAndContainersSaveManager", v19);
        uint64_t v9 = *(void *)(a1 + 40);
        double v10 = [*(id *)(a1 + 32) managedConfiguration];
        LODWORD(v9) = [v8 isMDMAuthorizedToAddContact:v7 toAccount:v9 withManagedConfiguration:v10];

        uint64_t v11 = (id *)(a1 + 48);
        if (v9)
        {
          double v12 = [*(id *)(a1 + 32) groupsAndContainersSaveManager];
          int v13 = [v12 isAuthorizedToAddContact:v7 toContainer:*(void *)(a1 + 56) ignoresParentalRestrictions:0];

          uint64_t v11 = v19;
          if (v13) {
            uint64_t v11 = (id *)(a1 + 72);
          }
        }
        [*v11 addObject:v7];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v4);
  }
  uint64_t v14 = *MEMORY[0x1E4F5A258];
  if (((*(uint64_t (**)(void, void))(*MEMORY[0x1E4F5A258] + 16))(*MEMORY[0x1E4F5A258], *(void *)(a1 + 48)) & 1) == 0)
  {
    id v15 = *(void **)(a1 + 32);
    id v16 = CNContactsUIBundle();
    id v17 = [v16 localizedStringForKey:@"DROP_FAILURE_MANAGED_ACCOUNT" value:&stru_1ED8AC728 table:@"Localized"];
    [v15 presentErrorAlertWithMessage:v17 animated:1];
  }
  if (((*(uint64_t (**)(uint64_t, void))(v14 + 16))(v14, *(void *)(a1 + 72)) & 1) == 0) {
    [*(id *)(a1 + 32) authorizedAddContacts:*(void *)(a1 + 72) toDestinationItem:*(void *)(a1 + 80)];
  }
  if (((*(uint64_t (**)(uint64_t, void))(v14 + 16))(v14, *(void *)(a1 + 64)) & 1) == 0)
  {
    id v18 = objc_alloc_init(CNAccountsAndGroupsAuthorizationContext);
    [(CNAccountsAndGroupsAuthorizationContext *)v18 setType:0];
    [(CNAccountsAndGroupsAuthorizationContext *)v18 setItem:*(void *)(a1 + 80)];
    [(CNAccountsAndGroupsAuthorizationContext *)v18 setContactsToAddToDropDestination:*(void *)(a1 + 64)];
    [*(id *)(a1 + 32) showEditAuthorizationPaneWithAuthorizationContext:v18 animated:1];
  }
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  uint64_t v7 = [(CNAccountsAndGroupsViewController *)self diffableDataSource];
  double v8 = [v7 itemIdentifierForIndexPath:v6];

  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  if (v10 && [v10 acceptsVCardDrop])
  {
    uint64_t v11 = [(CNAccountsAndGroupsViewController *)self dataSource];
    double v12 = [v11 containerIdentifierForItem:v10];

    if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
    {
      if ([v10 type] == 2)
      {
        if ([v10 containerType] == 2) {
          uint64_t v13 = 3;
        }
        else {
          uint64_t v13 = 2;
        }
      }
      else
      {
        uint64_t v13 = 2;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4FB15B8]) initWithDropOperation:v13 intent:2];

  return v14;
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v4 = a4;
  uint64_t v5 = [(id)objc_opt_class() allowedDropTypes];
  char v6 = [v4 hasItemsConformingToTypeIdentifiers:v5];

  return v6;
}

- (id)multitaskingDragExclusionRects
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F29238];
  uint64_t v3 = [(CNAccountsAndGroupsViewController *)self view];
  [v3 bounds];
  v11[0] = v4;
  v11[1] = v5;
  v11[2] = v6;
  v11[3] = v7;
  double v8 = [v2 valueWithBytes:v11 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  v12[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  return v9;
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  objc_msgSend(a4, "identifier", a3);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [(CNAccountsAndGroupsViewController *)self collectionView];
  uint64_t v7 = [v6 cellForItemAtIndexPath:v14];

  objc_opt_class();
  id v8 = v7;
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    uint64_t v11 = [(CNAccountsAndGroupsViewController *)self groupsStyle];
    double v12 = [v10 item];
    uint64_t v13 = [v11 cellAccessoriesForItem:v12];
    [v10 setAccessories:v13];
  }
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(CNAccountsAndGroupsViewController *)self collectionView];
  id v8 = [v7 cellForItemAtIndexPath:v6];

  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (v11 && ([v11 window], double v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    uint64_t v13 = [(CNAccountsAndGroupsViewController *)self groupsStyle];
    id v14 = [v11 item];
    id v15 = [v13 cellAccessoriesForItem:v14];
    [v11 setAccessories:v15];

    id v16 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
    uint64_t v17 = [(CNAccountsAndGroupsViewController *)self groupsStyle];
    id v18 = [(id)v17 backgroundColor];
    [v16 setBackgroundColor:v18];

    uint64_t v19 = [(CNAccountsAndGroupsViewController *)self groupsStyle];
    LOBYTE(v17) = [v19 isInset];

    if ((v17 & 1) == 0)
    {
      id v20 = (void *)MEMORY[0x1E4FB14C0];
      [v11 bounds];
      long long v21 = objc_msgSend(v20, "bezierPathWithRoundedRect:cornerRadius:");
      [v16 setVisiblePath:v21];
    }
    long long v22 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v11 parameters:v16];
  }
  else
  {
    long long v22 = 0;
  }

  return v22;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(CNAccountsAndGroupsViewController *)self collectionView];
  id v8 = [v7 cellForItemAtIndexPath:v6];

  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (v11 && ([v11 window], double v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    uint64_t v13 = [(CNAccountsAndGroupsViewController *)self groupsStyle];
    id v14 = [v11 item];
    id v15 = [v13 cellAccessoriesForContextMenuPreviewForItem:v14];
    [v11 setAccessories:v15];

    id v16 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
    uint64_t v17 = [(CNAccountsAndGroupsViewController *)self groupsStyle];
    id v18 = [v17 backgroundColor];
    [v16 setBackgroundColor:v18];

    uint64_t v19 = (void *)MEMORY[0x1E4FB14C0];
    [v11 bounds];
    id v20 = objc_msgSend(v19, "bezierPathWithRoundedRect:cornerRadius:");
    [v16 setVisiblePath:v20];

    long long v21 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v11 parameters:v16];
  }
  else
  {
    long long v21 = 0;
  }

  return v21;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 count] == 1)
  {
    id v9 = [v8 firstObject];
    if ([(CNAccountsAndGroupsViewController *)self allowsEditing]
      && ([(CNAccountsAndGroupsViewController *)self collectionView],
          id v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = [v10 isEditing],
          v10,
          (v11 & 1) == 0))
    {
      objc_opt_class();
      uint64_t v13 = [(CNAccountsAndGroupsViewController *)self diffableDataSource];
      id v14 = [v13 itemIdentifierForIndexPath:v9];
      if (objc_opt_isKindOfClass()) {
        id v15 = v14;
      }
      else {
        id v15 = 0;
      }
      id v16 = v15;

      objc_opt_class();
      uint64_t v17 = [v7 cellForItemAtIndexPath:v9];
      if (objc_opt_isKindOfClass()) {
        id v18 = v17;
      }
      else {
        id v18 = 0;
      }
      id v19 = v18;

      double v12 = 0;
      if (v16 && v19)
      {
        id v20 = [v16 identifier];
        long long v21 = [(CNAccountsAndGroupsViewController *)self dataSource];
        long long v22 = [v21 currentlyEditingGroupIdentifier];
        char v23 = [v20 isEqualToString:v22];

        if ((v23 & 1) != 0 || ![v16 canShowContextMenu])
        {
          double v12 = 0;
        }
        else
        {
          long long v24 = [(CNAccountsAndGroupsViewController *)self actionsProvider];
          double v12 = [v24 contextMenuConfigurationForItem:v16 cell:v19 atIndexPath:v9];
        }
      }
    }
    else
    {
      double v12 = 0;
    }
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  id v6 = [(CNAccountsAndGroupsViewController *)self diffableDataSource];
  id v7 = [v6 itemIdentifierForIndexPath:v5];

  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = [(CNAccountsAndGroupsViewController *)self dataSource];
    char v11 = [v10 currentlyEditingGroupIdentifier];
    double v12 = [v9 identifier];
    char v13 = [v11 isEqualToString:v12];

    char v14 = v13 ^ 1;
  }
  else
  {
    char v14 = 1;
  }

  return v14;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v5 = a4;
  objc_opt_class();
  id v8 = v5;
  if (objc_opt_isKindOfClass()) {
    id v6 = v8;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7) {
    [v7 prepareForDisplay];
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(CNAccountsAndGroupsViewController *)self diffableDataSource];
  id v19 = [v6 itemIdentifierForIndexPath:v5];

  id v7 = [(CNAccountsAndGroupsViewController *)self dataSource];
  id v8 = [v7 filter];

  id v9 = [(CNAccountsAndGroupsViewController *)self dataSource];
  [v9 setFilterForItem:v19];

  id v10 = [(CNAccountsAndGroupsViewController *)self dataSource];
  char v11 = [v10 filter];
  if ([v8 isEqual:v11])
  {
    double v12 = [(CNAccountsAndGroupsViewController *)self dataSource];
    char v13 = [v12 serverFilter];

    if (!v13) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  char v14 = [(CNAccountsAndGroupsViewController *)self delegate];
  [v14 accountsAndGroupsViewControllerDidUpdateSelection:self];

  id v15 = [(CNAccountsAndGroupsViewController *)self delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    uint64_t v17 = [(CNAccountsAndGroupsViewController *)self delegate];
    [v17 accountsAndGroupsViewControllerDidChangeList:self];
  }
LABEL_7:
  id v18 = [(CNAccountsAndGroupsViewController *)self delegate];
  [v18 accountsAndGroupsViewControllerDidFinish:self];

  [(CNAccountsAndGroupsViewController *)self resignAllFirstRespondersSavingCurrentlyEditing:0];
  if (([(CNAccountsAndGroupsViewController *)self isFirstResponder] & 1) == 0) {
    [(CNAccountsAndGroupsViewController *)self becomeFirstResponder];
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(CNAccountsAndGroupsViewController *)self diffableDataSource];
  id v7 = [v6 itemIdentifierForIndexPath:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v7 identifier];
    int v9 = [v8 isEqualToString:@"groupPlaceholderIdentifier"] ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)item:(id)a3 didEndEditingWithName:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(CNAccountsAndGroupsViewController *)self dataSource];
  id v8 = [v7 currentlyEditingGroupIdentifier];
  int v9 = [v13 identifier];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    char v11 = [(CNAccountsAndGroupsViewController *)self dataSource];
    [v11 setCurrentlyEditingGroupIdentifier:0];
  }
  double v12 = [(CNAccountsAndGroupsViewController *)self actionsProvider];
  [v12 updateItem:v13 withNewName:v6];
}

- (void)cellTextViewDidChangeHeight
{
  id v5 = [(CNAccountsAndGroupsViewController *)self diffableDataSource];
  uint64_t v3 = [(CNAccountsAndGroupsViewController *)self diffableDataSource];
  uint64_t v4 = [v3 snapshot];
  [v5 applySnapshot:v4 animatingDifferences:1];
}

- (BOOL)isCollectionViewEditing
{
  id v2 = [(CNAccountsAndGroupsViewController *)self collectionView];
  char v3 = [v2 isEditing];

  return v3;
}

- (void)selectAllContacts
{
  char v3 = [(CNAccountsAndGroupsViewController *)self dataSource];
  id v16 = [v3 showAllSectionItem];

  uint64_t v4 = [(CNAccountsAndGroupsViewController *)self dataSource];
  id v5 = [v4 sections];
  if ([v5 count] == 1)
  {
    id v6 = [(CNAccountsAndGroupsViewController *)self dataSource];
    id v7 = [v6 sections];
    id v8 = [v7 firstObject];
    int v9 = [v8 items];
    uint64_t v10 = [v9 count];

    if (!v10) {
      goto LABEL_5;
    }
    char v11 = [(CNAccountsAndGroupsViewController *)self dataSource];
    double v12 = [v11 sections];
    uint64_t v4 = [v12 firstObject];

    id v5 = [v4 items];
    uint64_t v13 = [v5 firstObject];

    id v16 = (id)v13;
  }

LABEL_5:
  char v14 = [(CNAccountsAndGroupsViewController *)self dataSource];
  [v14 setFilterForItem:v16];

  id v15 = [(CNAccountsAndGroupsViewController *)self delegate];
  [v15 accountsAndGroupsViewControllerDidUpdateSelection:self];

  [(CNAccountsAndGroupsViewController *)self updateSelectionIfNeeded];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNAccountsAndGroupsViewController;
  id v4 = a3;
  [(CNAccountsAndGroupsViewController *)&v8 traitCollectionDidChange:v4];
  uint64_t v5 = objc_msgSend(v4, "_splitViewControllerContext", v8.receiver, v8.super_class);

  id v6 = [(CNAccountsAndGroupsViewController *)self traitCollection];
  uint64_t v7 = [v6 _splitViewControllerContext];

  if (v5 != v7)
  {
    [(CNAccountsAndGroupsViewController *)self reloadData];
    [(CNAccountsAndGroupsViewController *)self updateNavigationButtons];
  }
}

- (BOOL)shouldEnableItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNAccountsAndGroupsViewController *)self delegate];
  id v6 = [v4 identifier];
  char v7 = [v5 accountsAndGroupsViewController:self shouldEnableItemWithIdentifier:v6];

  if ([(CNAccountsAndGroupsViewController *)self isEditing]) {
    char v8 = [v4 isEditable];
  }
  else {
    char v8 = 1;
  }
  char v9 = v7 & v8;

  return v9;
}

- (void)configureDataSource
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB2090]);
  uint64_t v4 = objc_opt_class();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __56__CNAccountsAndGroupsViewController_configureDataSource__block_invoke;
  v20[3] = &unk_1E5497A28;
  v20[4] = self;
  uint64_t v5 = (void *)[v3 initWithIdentifier:@"Header" cellClass:v4 handler:v20];
  id v6 = objc_alloc(MEMORY[0x1E4FB2090]);
  uint64_t v7 = objc_opt_class();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __56__CNAccountsAndGroupsViewController_configureDataSource__block_invoke_2;
  v19[3] = &unk_1E5497A50;
  v19[4] = self;
  char v8 = (void *)[v6 initWithIdentifier:@"List" cellClass:v7 handler:v19];
  id v9 = objc_alloc(MEMORY[0x1E4FB2098]);
  v22[0] = v5;
  v22[1] = v8;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  char v11 = (void *)[v9 initWithItemRenderers:v10];

  id v12 = objc_alloc_init(MEMORY[0x1E4FB20A0]);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__CNAccountsAndGroupsViewController_configureDataSource__block_invoke_3;
  v18[3] = &unk_1E5497A78;
  v18[4] = self;
  [v12 setWillCollapseItemHandler:v18];
  [v11 setHandlers:v12];
  [(CNAccountsAndGroupsViewController *)self setSectionController:v11];
  id v13 = objc_alloc(MEMORY[0x1E4FB1598]);
  char v14 = [(CNAccountsAndGroupsViewController *)self collectionView];
  long long v21 = v11;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  id v16 = (void *)[v13 initWithCollectionView:v14 sectionControllers:v15 rendererIdentifierProvider:&__block_literal_global_171];

  [(CNAccountsAndGroupsViewController *)self setDiffableDataSource:v16];
  uint64_t v17 = [(CNAccountsAndGroupsViewController *)self collectionView];
  [v17 setDelegate:self];
}

void __56__CNAccountsAndGroupsViewController_configureDataSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  char v8 = [v5 groupsStyle];
  id v9 = [v8 parentCellAccessories];
  [v6 setAccessories:v9];

  id v12 = [*(id *)(a1 + 32) groupsStyle];
  uint64_t v10 = [v7 title];

  char v11 = [v12 parentCellConfigurationUpdateHandlerWithText:v10];
  [v6 setConfigurationUpdateHandler:v11];
}

void __56__CNAccountsAndGroupsViewController_configureDataSource__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  id v5 = a2;
  [v11 setItem:v5];
  [v11 setDelegate:*(void *)(a1 + 32)];
  [v11 setIndentationWidth:0.0];
  id v6 = [*(id *)(a1 + 32) groupsStyle];
  id v7 = [v6 cellAccessoriesForItem:v5];
  [v11 setAccessories:v7];

  char v8 = [*(id *)(a1 + 32) groupsStyle];
  id v9 = [v8 cellConfigurationUpdateHandler];
  [v11 setConfigurationUpdateHandler:v9];

  uint64_t v10 = [*(id *)(a1 + 32) shouldEnableItem:v5];
  [v11 setUserInteractionEnabled:v10];
}

void __56__CNAccountsAndGroupsViewController_configureDataSource__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 resignAllFirstRespondersSavingCurrentlyEditing:0];
  [*(id *)(a1 + 32) removePlaceholderCellsIfNeededInSection:v4 animated:0];
}

__CFString *__56__CNAccountsAndGroupsViewController_configureDataSource__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    id v4 = @"Header";
  }
  else {
    id v4 = @"List";
  }

  return v4;
}

- (id)layout
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__CNAccountsAndGroupsViewController_layout__block_invoke;
  aBlock[3] = &unk_1E54979D8;
  aBlock[4] = self;
  id v3 = _Block_copy(aBlock);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__CNAccountsAndGroupsViewController_layout__block_invoke_2;
  v13[3] = &unk_1E54979D8;
  v13[4] = self;
  id v4 = _Block_copy(v13);
  id v5 = objc_alloc(MEMORY[0x1E4FB1580]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__CNAccountsAndGroupsViewController_layout__block_invoke_3;
  v10[3] = &unk_1E5497A00;
  v10[4] = self;
  id v11 = v3;
  id v12 = v4;
  id v6 = v4;
  id v7 = v3;
  char v8 = (void *)[v5 initWithSectionProvider:v10];

  return v8;
}

id __43__CNAccountsAndGroupsViewController_layout__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) allowsEditing])
  {
    objc_opt_class();
    id v4 = [*(id *)(a1 + 32) diffableDataSource];
    id v5 = [v4 itemIdentifierForIndexPath:v3];
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    objc_opt_class();
    char v8 = [*(id *)(a1 + 32) collectionView];
    id v9 = [v8 cellForItemAtIndexPath:v3];
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = v10;

    id v12 = 0;
    if (v7 && v11)
    {
      id v13 = (void *)MEMORY[0x1E4FB1CC0];
      char v14 = [*(id *)(a1 + 32) actionsProvider];
      id v15 = [v14 leadingActionsForItem:v7 cell:v11];
      id v12 = [v13 configurationWithActions:v15];

      [v12 setPerformsFirstActionWithFullSwipe:0];
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

id __43__CNAccountsAndGroupsViewController_layout__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) allowsEditing])
  {
    objc_opt_class();
    id v4 = [*(id *)(a1 + 32) diffableDataSource];
    id v5 = [v4 itemIdentifierForIndexPath:v3];
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    objc_opt_class();
    char v8 = [*(id *)(a1 + 32) collectionView];
    id v9 = [v8 cellForItemAtIndexPath:v3];
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = v10;

    id v12 = 0;
    if (v7 && v11)
    {
      id v13 = (void *)MEMORY[0x1E4FB1CC0];
      char v14 = [*(id *)(a1 + 32) actionsProvider];
      id v15 = [*(id *)(a1 + 32) collectionView];
      id v16 = objc_msgSend(v14, "trailingActionsForItem:cell:isCollectionViewEditing:", v7, v11, objc_msgSend(v15, "isEditing"));
      id v12 = [v13 configurationWithActions:v16];

      [v12 setPerformsFirstActionWithFullSwipe:0];
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

id __43__CNAccountsAndGroupsViewController_layout__block_invoke_3(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 dataSource];
  char v8 = [v7 sections];
  unint64_t v9 = [v8 count];

  if (v9 <= a2)
  {
    uint64_t v15 = 1;
  }
  else
  {
    uint64_t v10 = *MEMORY[0x1E4F5A298];
    id v11 = [*(id *)(a1 + 32) dataSource];
    id v12 = [v11 sections];
    id v13 = [v12 objectAtIndexedSubscript:a2];
    char v14 = [v13 title];
    uint64_t v15 = (*(unsigned int (**)(uint64_t, void *))(v10 + 16))(v10, v14) ^ 1;
  }
  id v16 = [*(id *)(a1 + 32) groupsStyle];
  uint64_t v17 = [v16 sectionConfigurationForLayoutEnvironment:v6 withLeadingActionsProvider:*(void *)(a1 + 40) withTrailingActionsProvider:*(void *)(a1 + 48) hasHeader:v15];

  return v17;
}

- (id)groupsStyle
{
  id v2 = [(CNAccountsAndGroupsViewController *)self traitCollection];
  id v3 = +[CNAccountsAndGroupsStyle styleForTraitCollection:v2];

  return v3;
}

- (BOOL)viewCanReload
{
  if ([(CNAccountsAndGroupsViewController *)self isViewLoaded]) {
    BOOL v3 = [(CNAccountsAndGroupsViewController *)self isVisible];
  }
  else {
    BOOL v3 = 0;
  }
  if ([(CNAccountsAndGroupsViewController *)self isEditing])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    uint64_t v5 = *MEMORY[0x1E4F5A2A0];
    id v6 = [(CNAccountsAndGroupsViewController *)self dataSource];
    id v7 = [v6 currentlyEditingGroupIdentifier];
    if ((*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v7)) {
      LOBYTE(v4) = 0;
    }
    else {
      int v4 = ![(CNAccountsAndGroupsViewController *)self isAnyListCellCurrentlyEditing];
    }
  }
  return v3 & v4;
}

- (BOOL)isNotificationInternalSave:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x1E4F1B788]];

  if (v6 && ([v6 BOOLValue] & 1) != 0)
  {
    char v7 = 0;
  }
  else
  {
    char v8 = [v4 userInfo];
    unint64_t v9 = [v8 objectForKey:*MEMORY[0x1E4F1B790]];

    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    id v12 = [(CNAccountsAndGroupsViewController *)self actionsProvider];
    id v13 = [v12 issuedSaveRequestIdentifiers];
    char v14 = [v11 setWithArray:v13];

    uint64_t v15 = *MEMORY[0x1E4F5A290];
    if (((*(uint64_t (**)(void, void *))(*MEMORY[0x1E4F5A290] + 16))(*MEMORY[0x1E4F5A290], v14) & 1) != 0
      || ((*(uint64_t (**)(uint64_t, void *))(v15 + 16))(v15, v10) & 1) != 0)
    {
      char v7 = 0;
    }
    else
    {
      char v7 = [v10 isSubsetOfSet:v14];
    }
  }
  return v7;
}

- (void)contactStoreDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CNUIContactsEnvironment currentEnvironment];
  id v6 = [v5 defaultSchedulerProvider];
  char v7 = [v6 mainThreadScheduler];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__CNAccountsAndGroupsViewController_contactStoreDidChange___block_invoke;
  v9[3] = &unk_1E549BF80;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 performBlock:v9];
}

void __59__CNAccountsAndGroupsViewController_contactStoreDidChange___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) viewCanReload];
  BOOL v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 dataSource];
    int v5 = [v4 hasChanges];

    if (v5 && ([*(id *)(a1 + 32) isNotificationInternalSave:*(void *)(a1 + 40)] & 1) == 0)
    {
      id v6 = *(void **)(a1 + 32);
      [v6 reloadData];
    }
  }
  else
  {
    [v3 setNeedsReload:1];
  }
}

- (void)deselectAllItems
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CNAccountsAndGroupsViewController *)self collectionView];
  id v4 = [v3 indexPathsForSelectedItems];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        id v11 = [(CNAccountsAndGroupsViewController *)self collectionView];
        [v11 deselectItemAtIndexPath:v10 animated:0];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (BOOL)isAnyListCellCurrentlyEditing
{
  char v2 = self;
  BOOL v3 = [(CNAccountsAndGroupsViewController *)self collectionView];
  id v4 = [v3 indexPathsForVisibleItems];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__CNAccountsAndGroupsViewController_isAnyListCellCurrentlyEditing__block_invoke;
  v6[3] = &unk_1E54988F8;
  v6[4] = v2;
  LOBYTE(v2) = objc_msgSend(v4, "_cn_any:", v6);

  return (char)v2;
}

uint64_t __66__CNAccountsAndGroupsViewController_isAnyListCellCurrentlyEditing__block_invoke(uint64_t a1, void *a2)
{
  char v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 collectionView];
  id v5 = [v4 cellForItemAtIndexPath:v3];

  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  if (v8) {
    uint64_t v9 = [v8 isCellEditing];
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)setEditingForGroupItem:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(CNAccountsAndGroupsViewController *)self diffableDataSource];
    id v6 = [v5 indexPathForItemIdentifier:v4];

    uint64_t v7 = [(CNAccountsAndGroupsViewController *)self dataSource];
    [v7 setCurrentlyEditingGroupIdentifier:0];

    if (v6)
    {
      id v8 = [(CNAccountsAndGroupsViewController *)self collectionView];
      [v8 scrollToItemAtIndexPath:v6 atScrollPosition:2 animated:0];

      dispatch_time_t v9 = dispatch_time(0, 500000000);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __60__CNAccountsAndGroupsViewController_setEditingForGroupItem___block_invoke;
      v10[3] = &unk_1E549BF80;
      v10[4] = self;
      id v11 = v6;
      dispatch_after(v9, MEMORY[0x1E4F14428], v10);
    }
  }
}

void __60__CNAccountsAndGroupsViewController_setEditingForGroupItem___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) collectionView];
  id v3 = [v2 cellForItemAtIndexPath:*(void *)(a1 + 40)];

  objc_opt_class();
  id v7 = v3;
  if (objc_opt_isKindOfClass()) {
    id v4 = v7;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) actionsProvider];
    [v6 authorizedEditGroupNameForCell:v5];
  }
}

- (void)restoreCurrentlyEditingGroupIfNeeded
{
  id v4 = [(CNAccountsAndGroupsViewController *)self dataSource];
  id v3 = [v4 currentlyEditingGroupItem];
  [(CNAccountsAndGroupsViewController *)self setEditingForGroupItem:v3];
}

- (id)currentlySelectedItem
{
  id v3 = [(CNAccountsAndGroupsViewController *)self diffableDataSource];
  id v4 = [v3 snapshot];
  id v5 = [v4 itemIdentifiers];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__CNAccountsAndGroupsViewController_currentlySelectedItem__block_invoke;
  v8[3] = &unk_1E549BAC0;
  v8[4] = self;
  id v6 = objc_msgSend(v5, "_cn_firstObjectPassingTest:", v8);

  return v6;
}

uint64_t __58__CNAccountsAndGroupsViewController_currentlySelectedItem__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) dataSource];
    uint64_t v8 = [v7 isFilterShowingItem:v6];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)updateSelectionIfNeeded
{
  id v3 = [(CNAccountsAndGroupsViewController *)self groupsStyle];
  char v4 = [v3 shouldShowCellSelection];

  if (v4)
  {
    id v5 = [(CNAccountsAndGroupsViewController *)self currentlySelectedItem];
    if (v5)
    {
      id v9 = v5;
      id v6 = [(CNAccountsAndGroupsViewController *)self diffableDataSource];
      id v7 = [v6 indexPathForItemIdentifier:v9];

      if (v7)
      {
        uint64_t v8 = [(CNAccountsAndGroupsViewController *)self collectionView];
        [v8 selectItemAtIndexPath:v7 animated:0 scrollPosition:0];
      }
      id v5 = v9;
    }
  }
  else
  {
    [(CNAccountsAndGroupsViewController *)self deselectAllItems];
  }
}

- (void)resignAllFirstRespondersSavingCurrentlyEditing:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNAccountsAndGroupsViewController *)self dataSource];
  id v9 = [v5 currentlyEditingGroupIdentifier];

  id v6 = [(CNAccountsAndGroupsViewController *)self view];
  [v6 endEditing:1];

  if (v3) {
    id v7 = v9;
  }
  else {
    id v7 = 0;
  }
  uint64_t v8 = [(CNAccountsAndGroupsViewController *)self dataSource];
  [v8 setCurrentlyEditingGroupIdentifier:v7];
}

- (void)expandSectionForAccountWithIdentifier:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CNAccountsAndGroupsViewController *)self dataSource];
  id v6 = [v5 sectionForIdentifier:v4];

  if (v6)
  {
    id v7 = [(CNAccountsAndGroupsViewController *)self sectionController];
    uint64_t v8 = [v7 snapshotForSection:v6];

    if (v8 && ([v8 isExpanded:v6] & 1) == 0)
    {
      v11[0] = v6;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      [v8 expandItems:v9];

      uint64_t v10 = [(CNAccountsAndGroupsViewController *)self sectionController];
      [v10 applySnapshot:v8 toSection:v6 animatingDifferences:1 completion:0];
    }
  }
}

- (void)reloadData
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  [(CNAccountsAndGroupsViewController *)self resignAllFirstRespondersSavingCurrentlyEditing:1];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v39 = self;
  BOOL v3 = [(CNAccountsAndGroupsViewController *)self dataSource];
  id v4 = [v3 sections];

  id obj = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v42;
    uint64_t v8 = *MEMORY[0x1E4F5A298];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v42 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v41 + 1) + 8 * v9);
        id v11 = objc_alloc_init(MEMORY[0x1E4FB1358]);
        long long v12 = [v10 title];
        int v13 = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v12);

        if (v13)
        {
          long long v14 = [v10 items];
          [v11 appendItems:v14];
        }
        else
        {
          v46 = v10;
          long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
          [v11 appendItems:v15];

          id v16 = [v10 items];
          [v11 appendItems:v16 intoParent:v10];

          v45 = v10;
          long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
          [v11 expandItems:v14];
        }

        uint64_t v17 = [(CNAccountsAndGroupsViewController *)v39 sectionController];
        [v17 applySnapshot:v11 toSection:v10 animatingDifferences:0 completion:0];

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v6);
  }

  id v18 = [(CNAccountsAndGroupsViewController *)v39 diffableDataSource];
  id v19 = [v18 snapshot];

  id v20 = [(CNAccountsAndGroupsViewController *)v39 sectionController];
  long long v21 = [v20 associatedSectionIdentifiers];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __47__CNAccountsAndGroupsViewController_reloadData__block_invoke;
  v40[3] = &unk_1E549A5C0;
  v40[4] = v39;
  long long v22 = objc_msgSend(v21, "_cn_filter:", v40);
  char v23 = [v22 allObjects];

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0) {
    [v19 deleteSectionsWithIdentifiers:v23];
  }
  long long v24 = [(CNAccountsAndGroupsViewController *)v39 dataSource];
  v25 = [v24 sections];
  uint64_t v26 = [v25 firstObject];

  if ([v26 isAllContactsGlobalSection])
  {
    id v27 = [v19 sectionIdentifiers];
    if ((unint64_t)[v27 count] < 2)
    {
LABEL_20:

      goto LABEL_21;
    }
    id v28 = [v19 sectionIdentifiers];
    id v29 = [v28 firstObject];
    if ([v29 isEqual:v26])
    {

LABEL_19:
      goto LABEL_20;
    }
    id v30 = [v19 sectionIdentifiers];
    int v31 = [v30 containsObject:v26];

    if (v31)
    {
      id v27 = [v19 sectionIdentifiers];
      id v28 = [v27 firstObject];
      [v19 moveSectionWithIdentifier:v26 beforeSectionWithIdentifier:v28];
      goto LABEL_19;
    }
  }
LABEL_21:
  id v32 = [v19 itemIdentifiers];
  [v19 reloadItemsWithIdentifiers:v32];

  id v33 = [(CNAccountsAndGroupsViewController *)v39 diffableDataSource];
  [v33 applySnapshot:v19 animatingDifferences:0];

  v34 = [(CNAccountsAndGroupsViewController *)v39 groupsStyle];
  uint64_t v35 = [v34 backgroundColor];

  v36 = [(CNAccountsAndGroupsViewController *)v39 view];
  [v36 setBackgroundColor:v35];

  v37 = [(CNAccountsAndGroupsViewController *)v39 collectionView];
  [v37 setBackgroundColor:v35];

  [(CNAccountsAndGroupsViewController *)v39 reloadAddGroupButton];
  [(CNAccountsAndGroupsViewController *)v39 updateSelectionIfNeeded];
  [(CNAccountsAndGroupsViewController *)v39 restoreCurrentlyEditingGroupIfNeeded];
}

uint64_t __47__CNAccountsAndGroupsViewController_reloadData__block_invoke(uint64_t a1, void *a2)
{
  char v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 dataSource];
  uint64_t v5 = [v4 sections];
  int v6 = [v5 containsObject:v3];

  return v6 ^ 1u;
}

- (void)reloadCollectionViewForSectionWithIdentifier:(id)a3 settingFilterForEditingItem:(BOOL)a4 allowsReloadWhenEditing:(BOOL)a5
{
  id v8 = a3;
  if (v8)
  {
    if (![(CNAccountsAndGroupsViewController *)self isEditing] || a5)
    {
      [(CNAccountsAndGroupsViewController *)self resignAllFirstRespondersSavingCurrentlyEditing:1];
      uint64_t v9 = +[CNUIContactsEnvironment currentEnvironment];
      uint64_t v10 = [v9 defaultSchedulerProvider];
      id v11 = [v10 mainThreadScheduler];

      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __134__CNAccountsAndGroupsViewController_reloadCollectionViewForSectionWithIdentifier_settingFilterForEditingItem_allowsReloadWhenEditing___block_invoke;
      v12[3] = &unk_1E5498360;
      v12[4] = self;
      id v13 = v8;
      BOOL v14 = a4;
      [v11 performBlock:v12];
    }
    else
    {
      [(CNAccountsAndGroupsViewController *)self setNeedsReload:1];
    }
  }
}

void __134__CNAccountsAndGroupsViewController_reloadCollectionViewForSectionWithIdentifier_settingFilterForEditingItem_allowsReloadWhenEditing___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) dataSource];
  [v2 reload];

  id v3 = [*(id *)(a1 + 32) dataSource];
  id v4 = [v3 sectionForIdentifier:*(void *)(a1 + 40)];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
    uint64_t v6 = *MEMORY[0x1E4F5A298];
    uint64_t v7 = [v4 title];
    LODWORD(v6) = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    if (v6)
    {
      id v8 = [v4 items];
      [v5 appendItems:v8];
    }
    else
    {
      v19[0] = v4;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      [v5 appendItems:v9];

      uint64_t v10 = [v4 items];
      [v5 appendItems:v10 intoParent:v4];

      id v18 = v4;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
      [v5 expandItems:v8];
    }

    id v11 = [*(id *)(a1 + 32) sectionController];
    [v11 applySnapshot:v5 toSection:v4 animatingDifferences:0];

    if (*(unsigned char *)(a1 + 48))
    {
      long long v12 = [*(id *)(a1 + 32) dataSource];
      id v13 = [v12 currentlyEditingGroupItem];

      if (v13)
      {
        BOOL v14 = [*(id *)(a1 + 32) dataSource];
        long long v15 = [*(id *)(a1 + 32) dataSource];
        id v16 = [v15 currentlyEditingGroupItem];
        [v14 setFilterForItem:v16];

        uint64_t v17 = [*(id *)(a1 + 32) delegate];
        [v17 accountsAndGroupsViewControllerDidUpdateSelection:*(void *)(a1 + 32)];
      }
    }
    [*(id *)(a1 + 32) updateSelectionIfNeeded];
    [*(id *)(a1 + 32) restoreCurrentlyEditingGroupIfNeeded];
  }
}

- (void)reloadCollectionViewAddingPlaceholderItem:(id)a3 inSectionWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CNAccountsAndGroupsViewController *)self resignAllFirstRespondersSavingCurrentlyEditing:0];
  if (v6 && v7)
  {
    id v8 = [(CNAccountsAndGroupsViewController *)self dataSource];
    uint64_t v9 = [v8 sectionForIdentifier:v7];

    if (v9)
    {
      uint64_t v10 = +[CNUIContactsEnvironment currentEnvironment];
      id v11 = [v10 defaultSchedulerProvider];
      long long v12 = [v11 mainThreadScheduler];

      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __103__CNAccountsAndGroupsViewController_reloadCollectionViewAddingPlaceholderItem_inSectionWithIdentifier___block_invoke;
      v13[3] = &unk_1E549B800;
      v13[4] = self;
      id v14 = v9;
      id v15 = v6;
      [v12 performBlock:v13];
    }
  }
}

void __103__CNAccountsAndGroupsViewController_reloadCollectionViewAddingPlaceholderItem_inSectionWithIdentifier___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) sectionController];
  id v3 = [v2 snapshotForSection:*(void *)(a1 + 40)];

  id v4 = [v3 items];
  id v5 = objc_msgSend(v4, "_cn_filter:", &__block_literal_global_143);

  [v3 deleteItems:v5];
  v11[0] = *(void *)(a1 + 48);
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v3 appendItems:v6 intoParent:*(void *)(a1 + 40)];

  id v7 = [*(id *)(a1 + 32) sectionController];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __103__CNAccountsAndGroupsViewController_reloadCollectionViewAddingPlaceholderItem_inSectionWithIdentifier___block_invoke_3;
  v9[3] = &unk_1E549BF80;
  uint64_t v8 = *(void *)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 48);
  [v7 applySnapshot:v3 toSection:v8 animatingDifferences:1 completion:v9];
}

uint64_t __103__CNAccountsAndGroupsViewController_reloadCollectionViewAddingPlaceholderItem_inSectionWithIdentifier___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEditingForGroupItem:*(void *)(a1 + 40)];
}

uint64_t __103__CNAccountsAndGroupsViewController_reloadCollectionViewAddingPlaceholderItem_inSectionWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  char v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:@"groupPlaceholderIdentifier"];

  return v3;
}

- (void)removePlaceholderCellsIfNeededInSection:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  id v7 = +[CNUIContactsEnvironment currentEnvironment];
  uint64_t v8 = [v7 defaultSchedulerProvider];
  uint64_t v9 = [v8 mainThreadScheduler];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __86__CNAccountsAndGroupsViewController_removePlaceholderCellsIfNeededInSection_animated___block_invoke;
  v11[3] = &unk_1E5498360;
  void v11[4] = self;
  id v12 = v6;
  BOOL v13 = a4;
  id v10 = v6;
  [v9 performBlock:v11];
}

void __86__CNAccountsAndGroupsViewController_removePlaceholderCellsIfNeededInSection_animated___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) sectionController];
  id v6 = [v2 snapshotForSection:*(void *)(a1 + 40)];

  uint64_t v3 = [v6 items];
  id v4 = objc_msgSend(v3, "_cn_filter:", &__block_literal_global_141);

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
  {
    [v6 deleteItems:v4];
    id v5 = [*(id *)(a1 + 32) sectionController];
    [v5 applySnapshot:v6 toSection:*(void *)(a1 + 40) animatingDifferences:*(unsigned __int8 *)(a1 + 48) completion:0];
  }
}

uint64_t __86__CNAccountsAndGroupsViewController_removePlaceholderCellsIfNeededInSection_animated___block_invoke_2(uint64_t a1, void *a2)
{
  char v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:@"groupPlaceholderIdentifier"];

  return v3;
}

- (void)cleanUpItemIfNeeded:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(CNAccountsAndGroupsViewController *)self diffableDataSource];
    id v12 = [v5 indexPathForItemIdentifier:v4];

    id v6 = v12;
    if (v12)
    {
      id v7 = [(CNAccountsAndGroupsViewController *)self collectionView];
      uint64_t v8 = [v7 cellForItemAtIndexPath:v12];

      if (v8)
      {
        objc_opt_class();
        id v9 = v8;
        if (objc_opt_isKindOfClass()) {
          id v10 = v9;
        }
        else {
          id v10 = 0;
        }
        id v11 = v10;

        if (v11) {
          [v11 endEditingName];
        }
      }
      id v6 = v12;
    }
  }
}

- (void)reloadCollectionViewDeletingItem:(id)a3
{
  id v4 = a3;
  [(CNAccountsAndGroupsViewController *)self resignAllFirstRespondersSavingCurrentlyEditing:0];
  if (v4)
  {
    id v5 = [(CNAccountsAndGroupsViewController *)self dataSource];
    int v6 = [v5 isFilterShowingItem:v4];

    id v7 = [(CNAccountsAndGroupsViewController *)self diffableDataSource];
    uint64_t v8 = [v7 snapshot];
    id v9 = [v8 itemIdentifiers];
    char v10 = [v9 containsObject:v4];

    if (v10)
    {
      [(CNAccountsAndGroupsViewController *)self cleanUpItemIfNeeded:v4];
      id v11 = +[CNUIContactsEnvironment currentEnvironment];
      id v12 = [v11 defaultSchedulerProvider];
      BOOL v13 = [v12 mainThreadScheduler];

      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __70__CNAccountsAndGroupsViewController_reloadCollectionViewDeletingItem___block_invoke;
      v15[3] = &unk_1E5498360;
      v15[4] = self;
      id v16 = v4;
      char v17 = v6;
      [v13 performBlock:v15];
    }
    else
    {
      id v14 = [(CNAccountsAndGroupsViewController *)self dataSource];
      [v14 reload];

      [(CNAccountsAndGroupsViewController *)self reloadData];
      if (v6) {
        [(CNAccountsAndGroupsViewController *)self selectAllContacts];
      }
    }
  }
}

void __70__CNAccountsAndGroupsViewController_reloadCollectionViewDeletingItem___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) diffableDataSource];
  uint64_t v3 = [v2 snapshot];

  v6[0] = *(void *)(a1 + 40);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v3 deleteItemsWithIdentifiers:v4];

  id v5 = [*(id *)(a1 + 32) diffableDataSource];
  [v5 applySnapshot:v3 animatingDifferences:1];

  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) selectAllContacts];
  }
}

- (void)goBack:(id)a3
{
  id v4 = [(CNAccountsAndGroupsViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNAccountsAndGroupsViewController *)self delegate];
    [v6 accountsAndGroupsViewControllerDidGoBack:self];
  }
}

- (void)cancel:(id)a3
{
  id v4 = [(CNAccountsAndGroupsViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNAccountsAndGroupsViewController *)self delegate];
    [v6 accountsAndGroupsViewControllerDidCancel:self];
  }
}

- (void)updateToolbarVisibility
{
  if ([(CNAccountsAndGroupsViewController *)self allowsEditing])
  {
    uint64_t v3 = [(CNAccountsAndGroupsViewController *)self groupsStyle];
    BOOL v4 = [v3 buttonBehavior] != 1;
  }
  else
  {
    BOOL v4 = 1;
  }
  id v5 = [(CNAccountsAndGroupsViewController *)self navigationController];
  [v5 setToolbarHidden:v4];
}

- (void)updateNavigationButtons
{
  v30[1] = *MEMORY[0x1E4F143B8];
  [(CNAccountsAndGroupsViewController *)self updateToolbarVisibility];
  int64_t buttonBehavior = self->_buttonBehavior;
  BOOL v4 = [(CNAccountsAndGroupsViewController *)self groupsStyle];
  uint64_t v5 = [v4 buttonBehavior];

  if (buttonBehavior != v5)
  {
    id v6 = [(CNAccountsAndGroupsViewController *)self groupsStyle];
    self->_int64_t buttonBehavior = [v6 buttonBehavior];

    if ([(CNAccountsAndGroupsViewController *)self allowsEditing])
    {
      addGroupBarButtonItem = self->_addGroupBarButtonItem;
      self->_addGroupBarButtonItem = 0;

      int64_t v8 = self->_buttonBehavior;
      if (v8 == 1)
      {
        id v19 = [(CNAccountsAndGroupsViewController *)self editButtonItem];
        id v20 = [(CNAccountsAndGroupsViewController *)self navigationItem];
        [v20 setRightBarButtonItem:v19];

        BOOL v21 = [(CNAccountsAndGroupsViewController *)self shouldShowCancelButton];
        if (v21)
        {
          long long v22 = [(CNAccountsAndGroupsViewController *)self cancelBarButtonItem];
        }
        else
        {
          long long v22 = 0;
        }
        char v23 = [(CNAccountsAndGroupsViewController *)self navigationItem];
        [v23 setLeftBarButtonItem:v22];

        if (v21) {
        id v12 = [(CNAccountsAndGroupsViewController *)self addGroupBarButtonItem];
        }
        id v29 = v12;
        long long v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
        [(CNAccountsAndGroupsViewController *)self setToolbarItems:v24];
      }
      else
      {
        if (v8 != 2)
        {
LABEL_22:
          v25 = [MEMORY[0x1E4FB1618] systemBlueColor];
          uint64_t v26 = [(CNAccountsAndGroupsViewController *)self navigationController];
          id v27 = [v26 navigationBar];
          [v27 setTintColor:v25];

          [(CNAccountsAndGroupsViewController *)self reloadAddGroupButton];
          return;
        }
        id v9 = [(CNAccountsAndGroupsViewController *)self addGroupBarButtonItem];
        char v10 = [(CNAccountsAndGroupsViewController *)self navigationItem];
        [v10 setRightBarButtonItem:v9];

        id v11 = [(CNAccountsAndGroupsViewController *)self editButtonItem];
        v30[0] = v11;
        id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];

        if ([(CNAccountsAndGroupsViewController *)self shouldShowCancelButton])
        {
          BOOL v13 = [(CNAccountsAndGroupsViewController *)self cancelBarButtonItem];
          uint64_t v14 = [v12 arrayByAddingObject:v13];

          id v12 = (void *)v14;
        }
        id v15 = [(CNAccountsAndGroupsViewController *)self navigationItem];
        [v15 setLeftBarButtonItems:v12];

        [(CNAccountsAndGroupsViewController *)self setToolbarItems:0];
      }

      goto LABEL_22;
    }
    id v16 = [(CNAccountsAndGroupsViewController *)self navigationItem];
    [v16 setRightBarButtonItem:0];

    BOOL v17 = [(CNAccountsAndGroupsViewController *)self shouldShowCancelButton];
    if (v17)
    {
      [(CNAccountsAndGroupsViewController *)self cancelBarButtonItem];
      [(CNAccountsAndGroupsViewController *)self navigationItem];
    }
    else
    {
      [(CNAccountsAndGroupsViewController *)self navigationItem];
    id v18 = };
    [v18 setLeftBarButtonItem:v28];

    if (v17)
    {
    }
  }
}

- (void)clearNavigationButtonsIfNeeded
{
  int64_t buttonBehavior = self->_buttonBehavior;
  BOOL v4 = [(CNAccountsAndGroupsViewController *)self groupsStyle];
  uint64_t v5 = [v4 buttonBehavior];

  if (buttonBehavior != v5)
  {
    id v6 = [(CNAccountsAndGroupsViewController *)self navigationItem];
    [v6 setRightBarButtonItem:0];

    id v7 = [(CNAccountsAndGroupsViewController *)self navigationItem];
    [v7 setLeftBarButtonItem:0];
  }
}

- (UIBarButtonItem)cancelBarButtonItem
{
  cancelBarButtonItem = self->_cancelBarButtonItem;
  if (!cancelBarButtonItem)
  {
    BOOL isLimitedAccessOnboarding = self->_isLimitedAccessOnboarding;
    id v5 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v6 = v5;
    if (isLimitedAccessOnboarding)
    {
      id v7 = [(CNAccountsAndGroupsViewController *)self fakeBackButton];
      int64_t v8 = (UIBarButtonItem *)[v6 initWithCustomView:v7];
      id v9 = self->_cancelBarButtonItem;
      self->_cancelBarButtonItem = v8;
    }
    else
    {
      char v10 = (UIBarButtonItem *)[v5 initWithBarButtonSystemItem:1 target:self action:sel_cancel_];
      id v7 = self->_cancelBarButtonItem;
      self->_cancelBarButtonItem = v10;
    }

    cancelBarButtonItem = self->_cancelBarButtonItem;
  }

  return cancelBarButtonItem;
}

- (id)fakeBackButton
{
  uint64_t v3 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  BOOL v4 = NSString;
  id v5 = CNContactsUIBundle();
  id v6 = [v5 localizedStringForKey:@"LIMITED_BACK" value:&stru_1ED8AC728 table:@"Localized"];
  id v7 = [v4 stringWithFormat:@" %@", v6];
  [v3 setTitle:v7];

  int64_t v8 = [MEMORY[0x1E4FB1830] configurationWithWeight:7];
  id v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.backward" withConfiguration:v8];
  [v3 setImage:v9];

  id v10 = objc_alloc_init(MEMORY[0x1E4FB14D0]);
  [v10 setConfiguration:v3];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 addTarget:self action:sel_goBack_ forControlEvents:64];

  return v10;
}

- (BOOL)shouldShowCancelButton
{
  if ([(CNAccountsAndGroupsViewController *)self allowsCanceling]) {
    return 1;
  }

  return [(CNAccountsAndGroupsViewController *)self allowsDone];
}

- (id)menuForContainers
{
  uint64_t v3 = [(CNAccountsAndGroupsViewController *)self containerDataSource];
  BOOL v4 = [v3 containerPickerItems];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__CNAccountsAndGroupsViewController_menuForContainers__block_invoke;
  v8[3] = &unk_1E5497990;
  v8[4] = self;
  id v5 = objc_msgSend(v4, "_cn_map:", v8);

  id v6 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1ED8AC728 children:v5];

  return v6;
}

id __54__CNAccountsAndGroupsViewController_menuForContainers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x1E4FB13F0];
  id v5 = [v3 name];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__CNAccountsAndGroupsViewController_menuForContainers__block_invoke_2;
  v9[3] = &unk_1E549BFC8;
  v9[4] = *(void *)(a1 + 32);
  id v10 = v3;
  id v6 = v3;
  id v7 = [v4 actionWithTitle:v5 image:0 identifier:0 handler:v9];

  return v7;
}

void __54__CNAccountsAndGroupsViewController_menuForContainers__block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) actionsProvider];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) collectionView];
  objc_msgSend(v4, "createGroupActionForContainerItem:isCollectionViewEditing:", v2, objc_msgSend(v3, "isEditing"));
}

- (void)reloadAddGroupButton
{
  if ([(CNAccountsAndGroupsViewController *)self allowsEditing])
  {
    id v3 = [(CNAccountsAndGroupsViewController *)self containerDataSource];
    [v3 discoverContainers];

    id v4 = [(CNAccountsAndGroupsViewController *)self containerDataSource];
    id v5 = [v4 containerPickerItems];
    uint64_t v6 = [v5 count];

    id v7 = [(CNAccountsAndGroupsViewController *)self containerDataSource];
    int64_t v8 = [v7 containerPickerItems];
    unint64_t v9 = [v8 count];

    if (self->_addGroupBarButtonItem)
    {
      id v10 = [(CNAccountsAndGroupsViewController *)self addGroupBarButtonItem];
      [v10 setHidden:v6 == 0];

      if (v9 < 2)
      {
        id v11 = 0;
      }
      else
      {
        id v11 = [(CNAccountsAndGroupsViewController *)self menuForContainers];
      }
      id v12 = [(CNAccountsAndGroupsViewController *)self addGroupBarButtonItem];
      [v12 setMenu:v11];

      if (v9 < 2)
      {
        objc_initWeak(&location, self);
        uint64_t v14 = (void *)MEMORY[0x1E4FB13F0];
        uint64_t v24 = MEMORY[0x1E4F143A8];
        uint64_t v25 = 3221225472;
        uint64_t v26 = __57__CNAccountsAndGroupsViewController_reloadAddGroupButton__block_invoke;
        id v27 = &unk_1E54998E0;
        objc_copyWeak(&v28, &location);
        id v15 = [v14 actionWithHandler:&v24];
        id v16 = [(CNAccountsAndGroupsViewController *)self addGroupBarButtonItem];
        [v16 setPrimaryAction:v15];

        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
      }
      else
      {

        BOOL v13 = [(CNAccountsAndGroupsViewController *)self addGroupBarButtonItem];
        [v13 setPrimaryAction:0];
      }
      BOOL v17 = [(CNAccountsAndGroupsViewController *)self addGroupBarButtonItem];
      id v18 = CNContactsUIBundle();
      id v19 = [v18 localizedStringForKey:@"ADD_LIST" value:&stru_1ED8AC728 table:@"Localized"];
      [v17 setTitle:v19];
    }
    id v20 = [(CNAccountsAndGroupsViewController *)self keyCommands];
    BOOL v21 = [(CNAccountsAndGroupsViewController *)self addGroupKeyCommand];
    int v22 = [v20 containsObject:v21];

    if (v6)
    {
      if (v22) {
        return;
      }
      char v23 = [(CNAccountsAndGroupsViewController *)self addGroupKeyCommand];
      [(CNAccountsAndGroupsViewController *)self addKeyCommand:v23];
    }
    else
    {
      if (!v22) {
        return;
      }
      char v23 = [(CNAccountsAndGroupsViewController *)self addGroupKeyCommand];
      [(CNAccountsAndGroupsViewController *)self removeKeyCommand:v23];
    }
  }
}

void __57__CNAccountsAndGroupsViewController_reloadAddGroupButton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained addGroupBarButtonItem];
  [WeakRetained addDefaultGroup:v1];
}

- (UIBarButtonItem)addGroupBarButtonItem
{
  addGroupBarButtonItem = self->_addGroupBarButtonItem;
  if (!addGroupBarButtonItem)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v5 = CNContactsUIBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"ADD_LIST" value:&stru_1ED8AC728 table:@"Localized"];
    id v7 = (UIBarButtonItem *)[v4 initWithTitle:v6 menu:0];
    int64_t v8 = self->_addGroupBarButtonItem;
    self->_addGroupBarButtonItem = v7;

    addGroupBarButtonItem = self->_addGroupBarButtonItem;
  }

  return addGroupBarButtonItem;
}

- (void)addDefaultGroup:(id)a3
{
  id v4 = [(CNAccountsAndGroupsViewController *)self containerDataSource];
  id v5 = [v4 containerPickerItems];
  id v8 = [v5 firstObject];

  if (v8)
  {
    uint64_t v6 = [(CNAccountsAndGroupsViewController *)self actionsProvider];
    id v7 = [(CNAccountsAndGroupsViewController *)self collectionView];
    objc_msgSend(v6, "createGroupActionForContainerItem:isCollectionViewEditing:", v8, objc_msgSend(v7, "isEditing"));
  }
}

- (UIKeyCommand)addGroupKeyCommand
{
  addGroupKeyCommand = self->_addGroupKeyCommand;
  if (!addGroupKeyCommand)
  {
    id v4 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"n" modifierFlags:1179648 action:sel_addDefaultGroup_];
    id v5 = self->_addGroupKeyCommand;
    self->_addGroupKeyCommand = v4;

    uint64_t v6 = CNContactsUIBundle();
    id v7 = [v6 localizedStringForKey:@"ADD_LIST_KEYBOARD_DISCOVERY" value:&stru_1ED8AC728 table:@"Localized"];
    [(UIKeyCommand *)self->_addGroupKeyCommand setDiscoverabilityTitle:v7];

    addGroupKeyCommand = self->_addGroupKeyCommand;
  }

  return addGroupKeyCommand;
}

- (void)authorizedSetCollectionViewEditing:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = [(CNAccountsAndGroupsViewController *)self collectionView];
  [v5 setEditing:v3];

  if (!v3)
  {
    [(CNAccountsAndGroupsViewController *)self resignAllFirstRespondersSavingCurrentlyEditing:0];
    if ([(CNAccountsAndGroupsViewController *)self needsReload])
    {
      [(CNAccountsAndGroupsViewController *)self setNeedsReload:0];
      uint64_t v6 = [(CNAccountsAndGroupsViewController *)self dataSource];
      [v6 reload];

      [(CNAccountsAndGroupsViewController *)self reloadData];
    }
    else
    {
      [(CNAccountsAndGroupsViewController *)self updateSelectionIfNeeded];
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [(CNAccountsAndGroupsViewController *)self collectionView];
  id v8 = [v7 preparedCells];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
        objc_opt_class();
        id v14 = v13;
        if (objc_opt_isKindOfClass()) {
          id v15 = v14;
        }
        else {
          id v15 = 0;
        }
        id v16 = v15;

        [v16 setTextViewEnabled:v3];
        BOOL v17 = [v16 item];
        objc_msgSend(v16, "setUserInteractionEnabled:", -[CNAccountsAndGroupsViewController shouldEnableItem:](self, "shouldEnableItem:", v17));

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void)authorizedSetViewEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CNAccountsAndGroupsViewController;
  [(CNAccountsAndGroupsViewController *)&v6 setEditing:a3 animated:a4];
  [(CNAccountsAndGroupsViewController *)self authorizedSetCollectionViewEditing:v4];
}

- (BOOL)editingCollectionViewRequiresAuthorization
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CNAccountsAndGroupsViewController *)self containerDataSource];
  [v3 discoverContainers];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v4 = [(CNAccountsAndGroupsViewController *)self containerDataSource];
  id v5 = [v4 containers];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [(CNAccountsAndGroupsViewController *)self groupsAndContainersSaveManager];
        LODWORD(v10) = [v11 isAuthorizedToEditContainer:v10];

        if (!v10)
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a3
    && [(CNAccountsAndGroupsViewController *)self editingCollectionViewRequiresAuthorization])
  {
    uint64_t v7 = objc_alloc_init(CNAccountsAndGroupsAuthorizationContext);
    [(CNAccountsAndGroupsAuthorizationContext *)v7 setType:4];
    [(CNAccountsAndGroupsViewController *)self showEditAuthorizationPaneWithAuthorizationContext:v7 animated:1];
  }
  else
  {
    [(CNAccountsAndGroupsViewController *)self authorizedSetViewEditing:v5 animated:v4];
  }
}

- (void)setUpCollectionView
{
  v36[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1568]);
  BOOL v4 = [(CNAccountsAndGroupsViewController *)self layout];
  BOOL v5 = objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CNAccountsAndGroupsViewController *)self setCollectionView:v5];

  uint64_t v6 = [(CNAccountsAndGroupsViewController *)self collectionView];
  [v6 setDelegate:self];

  uint64_t v7 = [(CNAccountsAndGroupsViewController *)self collectionView];
  [v7 setDropDelegate:self];

  uint64_t v8 = [(CNAccountsAndGroupsViewController *)self collectionView];
  [v8 setKeyboardDismissMode:2];

  uint64_t v9 = [(CNAccountsAndGroupsViewController *)self collectionView];
  [v9 setSelectionFollowsFocus:1];

  [(CNAccountsAndGroupsViewController *)self configureDataSource];
  uint64_t v10 = [(CNAccountsAndGroupsViewController *)self view];
  uint64_t v11 = [(CNAccountsAndGroupsViewController *)self collectionView];
  [v10 addSubview:v11];

  BOOL v12 = [(CNAccountsAndGroupsViewController *)self collectionView];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v35 = [(CNAccountsAndGroupsViewController *)self collectionView];
  id v33 = [v35 leadingAnchor];
  v34 = [(CNAccountsAndGroupsViewController *)self view];
  id v32 = [v34 leadingAnchor];
  int v31 = [v33 constraintEqualToAnchor:v32];
  v36[0] = v31;
  id v30 = [(CNAccountsAndGroupsViewController *)self collectionView];
  id v28 = [v30 trailingAnchor];
  id v29 = [(CNAccountsAndGroupsViewController *)self view];
  id v27 = [v29 trailingAnchor];
  uint64_t v26 = [v28 constraintEqualToAnchor:v27];
  v36[1] = v26;
  uint64_t v25 = [(CNAccountsAndGroupsViewController *)self collectionView];
  BOOL v13 = [v25 topAnchor];
  long long v14 = [(CNAccountsAndGroupsViewController *)self view];
  long long v15 = [v14 topAnchor];
  long long v16 = [v13 constraintEqualToAnchor:v15];
  v36[2] = v16;
  long long v17 = [(CNAccountsAndGroupsViewController *)self collectionView];
  long long v18 = [v17 bottomAnchor];
  uint64_t v19 = [(CNAccountsAndGroupsViewController *)self view];
  long long v20 = [v19 bottomAnchor];
  long long v21 = [v18 constraintEqualToAnchor:v20];
  v36[3] = v21;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];

  [MEMORY[0x1E4F28DC8] activateConstraints:v24];
  int v22 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_didTapCollectionView_];
  [v22 setCancelsTouchesInView:0];
  uint64_t v23 = [(CNAccountsAndGroupsViewController *)self collectionView];
  [v23 addGestureRecognizer:v22];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNAccountsAndGroupsViewController;
  [(CNAccountsAndGroupsViewController *)&v4 dealloc];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNAccountsAndGroupsViewController;
  [(CNAccountsAndGroupsViewController *)&v4 viewDidDisappear:a3];
  [(CNAccountsAndGroupsViewController *)self setIsVisible:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNAccountsAndGroupsViewController;
  [(CNAccountsAndGroupsViewController *)&v8 viewWillDisappear:a3];
  objc_super v4 = [(CNAccountsAndGroupsViewController *)self collectionView];
  int v5 = [v4 isEditing];

  if (v5) {
    [(CNAccountsAndGroupsViewController *)self setEditing:0];
  }
  uint64_t v6 = [(CNAccountsAndGroupsViewController *)self potentiallyPresentedViewController];

  if (v6)
  {
    uint64_t v7 = [(CNAccountsAndGroupsViewController *)self potentiallyPresentedViewController];
    [v7 dismissViewControllerAnimated:0 completion:0];

    [(CNAccountsAndGroupsViewController *)self setPotentiallyPresentedViewController:0];
  }
}

- (BOOL)shouldSetFirstResponder
{
  id v3 = [(CNAccountsAndGroupsViewController *)self presentedViewController];

  objc_super v4 = [(CNAccountsAndGroupsViewController *)self splitViewController];
  int v5 = [v4 firstResponder];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    uint64_t v7 = [(CNAccountsAndGroupsViewController *)self splitViewController];
    objc_super v8 = [v7 firstResponder];
    objc_opt_class();
    int v6 = objc_opt_isKindOfClass() ^ 1;
  }
  return (v3 == 0) & v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNAccountsAndGroupsViewController;
  [(CNAccountsAndGroupsViewController *)&v7 viewDidAppear:a3];
  if ([(CNAccountsAndGroupsViewController *)self shouldSetFirstResponder]) {
    [(CNAccountsAndGroupsViewController *)self becomeFirstResponder];
  }
  [(CNAccountsAndGroupsViewController *)self setIsVisible:1];
  objc_super v4 = [(CNAccountsAndGroupsViewController *)self transitionCoordinator];
  int v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __51__CNAccountsAndGroupsViewController_viewDidAppear___block_invoke;
    v6[3] = &unk_1E5498AF8;
    v6[4] = self;
    [v4 animateAlongsideTransition:0 completion:v6];
  }
  else
  {
    [(CNAccountsAndGroupsViewController *)self updateToolbarVisibility];
  }
}

uint64_t __51__CNAccountsAndGroupsViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateToolbarVisibility];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNAccountsAndGroupsViewController;
  [(CNAccountsAndGroupsViewController *)&v6 viewIsAppearing:a3];
  objc_super v4 = [(CNAccountsAndGroupsViewController *)self groupsStyle];
  char v5 = [v4 shouldShowCellSelection];

  if ((v5 & 1) == 0) {
    [(CNAccountsAndGroupsViewController *)self deselectAllItems];
  }
  [(CNAccountsAndGroupsViewController *)self updateNavigationButtons];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CNAccountsAndGroupsViewController;
  [(CNAccountsAndGroupsViewController *)&v10 viewWillAppear:a3];
  objc_super v4 = [(CNAccountsAndGroupsViewController *)self dataSource];
  [v4 setCurrentlyEditingGroupIdentifier:0];

  if (self->_needsReload)
  {
    char v5 = [(CNAccountsAndGroupsViewController *)self dataSource];
    [v5 reload];

    [(CNAccountsAndGroupsViewController *)self reloadData];
    [(CNAccountsAndGroupsViewController *)self loadViewIfNeeded];
    self->_needsReload = 0;
  }
  else
  {
    [(CNAccountsAndGroupsViewController *)self reloadData];
  }
  objc_super v6 = [(CNAccountsAndGroupsViewController *)self transitionCoordinator];
  objc_super v7 = v6;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__CNAccountsAndGroupsViewController_viewWillAppear___block_invoke;
    v9[3] = &unk_1E5498AF8;
    v9[4] = self;
    [v6 animateAlongsideTransition:v9 completion:0];
  }
  else
  {
    [(CNAccountsAndGroupsViewController *)self clearNavigationButtonsIfNeeded];
  }
  if (self->_isLimitedAccessOnboarding)
  {
    objc_super v8 = [(CNAccountsAndGroupsViewController *)self navigationItem];
    [v8 setPrompt:&stru_1ED8AC728];
  }
}

uint64_t __52__CNAccountsAndGroupsViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearNavigationButtonsIfNeeded];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)CNAccountsAndGroupsViewController;
  [(CNAccountsAndGroupsViewController *)&v6 viewDidLoad];
  id v3 = +[CNUIContactsEnvironment currentEnvironment];
  objc_super v4 = [v3 inProcessActivityManager];
  activityManager = self->_activityManager;
  self->_activityManager = v4;

  [(CNAccountsAndGroupsViewController *)self _updateUserActivity];
  [(CNAccountsAndGroupsViewController *)self setUpCollectionView];
}

+ (id)allowedDropTypes
{
  return &unk_1ED915A70;
}

+ (id)log
{
  if (log_cn_once_token_1_15630 != -1) {
    dispatch_once(&log_cn_once_token_1_15630, &__block_literal_global_15631);
  }
  uint64_t v2 = (void *)log_cn_once_object_1_15632;

  return v2;
}

void __40__CNAccountsAndGroupsViewController_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNAccountsAndGroupsViewController");
  v1 = (void *)log_cn_once_object_1_15632;
  log_cn_once_object_1_15632 = (uint64_t)v0;
}

@end