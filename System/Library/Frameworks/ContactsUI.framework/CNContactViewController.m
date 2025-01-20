@interface CNContactViewController
+ (CNContactViewController)viewControllerForContact:(CNContact *)contact;
+ (CNContactViewController)viewControllerForNewContact:(CNContact *)contact;
+ (CNContactViewController)viewControllerForUnknownContact:(CNContact *)contact;
+ (id)descriptorForRequiredKeys;
+ (id)viewControllerForEditedDraftContact:(id)a3;
+ (id)viewControllerForNewDraftContact:(id)a3;
+ (id)viewControllerForUpdatingContact:(id)a3 withPropertiesFromContact:(id)a4;
+ (id)viewControllerForUpdatingContact:(id)a3 withPublicAccountIdentity:(id)a4;
- (BOOL)_isDelayingPresentation;
- (BOOL)_shouldBeOutOfProcess;
- (BOOL)allowsActions;
- (BOOL)allowsDisplayModePickerActions;
- (BOOL)allowsEditPhoto;
- (BOOL)allowsEditing;
- (BOOL)allowsNamePicking;
- (BOOL)displayNavigationButtonsShouldUsePlatterStyle;
- (BOOL)editingProposedInformation;
- (BOOL)forcesTransparentBackground;
- (BOOL)hasCompletedSetup;
- (BOOL)highlightedPropertyImportant;
- (BOOL)ignoresParentalRestrictions;
- (BOOL)isModalInPresentation;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (BOOL)requiresSetup;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldDrawNavigationBar;
- (BOOL)shouldPerformDefaultActionForContact:(id)a3 propertyKey:(id)a4 propertyIdentifier:(id)a5;
- (BOOL)shouldShowLinkedContacts;
- (BOOL)shouldShowSharedProfileBanner;
- (BOOL)shouldUseModernNavigationBarHiding;
- (BOOL)showContactPhotoPosterCell;
- (BOOL)showingMeContact;
- (BOOL)showsGroupMembership;
- (BOOL)showsInlineActions;
- (BOOL)showsSharedProfile;
- (BOOL)usesBrandedCallHeaderFormat;
- (CNContact)additionalContact;
- (CNContact)contact;
- (CNContact)contentContact;
- (CNContactContentNavigationItemUpdater)navItemUpdater;
- (CNContactContentViewController)contentViewController;
- (CNContactContentViewController)viewController;
- (CNContactFormatter)contactFormatter;
- (CNContactRecentsReference)recentsData;
- (CNContactStore)contactStore;
- (CNContactViewController)initWithMode:(int64_t)a3;
- (CNContactViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CNContactViewControllerCustomHeaderViewDelegate)contactHeaderViewDelegate;
- (CNContactViewControllerPPTDelegate)pptDelegate;
- (CNContainer)parentContainer;
- (CNGroup)parentGroup;
- (CNPolicy)policy;
- (NSArray)displayedPropertyKeys;
- (NSArray)extraLeftBarButtonItems;
- (NSArray)extraRightBarButtonItems;
- (NSArray)preEditLeftBarButtonItems;
- (NSArray)prohibitedPropertyKeys;
- (NSAttributedString)verifiedInfoMessage;
- (NSString)alternateName;
- (NSString)highlightedPropertyIdentifier;
- (NSString)highlightedPropertyKey;
- (NSString)importantMessage;
- (NSString)initialPrompt;
- (NSString)message;
- (NSString)primaryPropertyKey;
- (NSString)staticIdentity;
- (NSString)warningMessage;
- (UINavigationItem)observedNavigationItem;
- (UIView)contactHeaderView;
- (UIViewController)contactHeaderViewController;
- (_UIAccessDeniedView)accessDeniedView;
- (_UIRemoteViewController)_containedRemoteViewController;
- (id)_contactPresentedViewController;
- (id)_primaryPropertyStringForContact:(id)a3;
- (id)confirmCancelAlertControllerAnchoredAtButtonItem:(id)a3;
- (id)currentNavigationController;
- (id)delegate;
- (id)navigationItemController;
- (id)platterBackBarButtonItem;
- (int64_t)actions;
- (int64_t)displayMode;
- (int64_t)editMode;
- (int64_t)mode;
- (void)_endDelayingPresentation;
- (void)_prepareViewController;
- (void)_setViewController:(id)a3;
- (void)_setupViewController;
- (void)configureNavigationItem:(id)a3;
- (void)dealloc;
- (void)didCompleteWithContact:(id)a3;
- (void)didDeleteContact:(id)a3;
- (void)didExecuteClearRecentsDataAction;
- (void)didExecuteDeleteFromDowntimeWhitelistAction;
- (void)didMoveToParentViewController:(id)a3;
- (void)didTapBlockAndReportForContact:(id)a3;
- (void)editCancel:(id)a3;
- (void)enableCancelKeyboardShortcut;
- (void)enableEditKeyboardShortcut;
- (void)enableSaveKeyboardShortcut;
- (void)highlightPropertyWithKey:(NSString *)key identifier:(NSString *)identifier;
- (void)highlightPropertyWithKey:(id)a3 identifier:(id)a4 important:(BOOL)a5;
- (void)isPresentingEditingController:(BOOL)a3;
- (void)isPresentingFullscreen:(BOOL)a3;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)popToPrevious:(id)a3;
- (void)presentCancelConfirmationAlert;
- (void)presentConfirmCancelAlertControllerAnchoredAtButtonItem:(id)a3;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)setActions:(int64_t)a3;
- (void)setAdditionalContact:(id)a3;
- (void)setAllowsActions:(BOOL)allowsActions;
- (void)setAllowsDisplayModePickerActions:(BOOL)a3;
- (void)setAllowsEditPhoto:(BOOL)a3;
- (void)setAllowsEditing:(BOOL)allowsEditing;
- (void)setAllowsNamePicking:(BOOL)a3;
- (void)setAlternateName:(NSString *)alternateName;
- (void)setContact:(CNContact *)contact;
- (void)setContact:(id)a3 additionalContact:(id)a4 mode:(int64_t)a5;
- (void)setContactFormatter:(id)a3;
- (void)setContactHeaderView:(id)a3;
- (void)setContactHeaderViewController:(id)a3;
- (void)setContactHeaderViewDelegate:(id)a3;
- (void)setContactStore:(CNContactStore *)contactStore;
- (void)setContentContact:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setDisplayMode:(int64_t)a3;
- (void)setDisplayedPropertyKeys:(NSArray *)displayedPropertyKeys;
- (void)setDoneButtonText:(id)a3 enabled:(BOOL)a4;
- (void)setEditMode:(int64_t)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEditingProposedInformation:(BOOL)a3;
- (void)setExtraLeftBarButtonItems:(id)a3;
- (void)setExtraRightBarButtonItems:(id)a3;
- (void)setForcesTransparentBackground:(BOOL)a3;
- (void)setHasCompletedSetup:(BOOL)a3;
- (void)setHighlightedPropertyIdentifier:(id)a3;
- (void)setHighlightedPropertyImportant:(BOOL)a3;
- (void)setHighlightedPropertyKey:(id)a3;
- (void)setIgnoresParentalRestrictions:(BOOL)a3;
- (void)setImportantMessage:(id)a3;
- (void)setInitialPrompt:(id)a3;
- (void)setMessage:(NSString *)message;
- (void)setNavItemUpdater:(id)a3;
- (void)setObservedNavigationItem:(id)a3;
- (void)setParentContainer:(CNContainer *)parentContainer;
- (void)setParentGroup:(CNGroup *)parentGroup;
- (void)setPptDelegate:(id)a3;
- (void)setPreEditLeftBarButtonItems:(id)a3;
- (void)setPrimaryPropertyKey:(id)a3;
- (void)setProhibitedPropertyKeys:(id)a3;
- (void)setRecentsData:(id)a3;
- (void)setRequiresSetup:(BOOL)a3;
- (void)setShouldDrawNavigationBar:(BOOL)a3;
- (void)setShouldShowLinkedContacts:(BOOL)shouldShowLinkedContacts;
- (void)setShouldShowSharedProfileBanner:(BOOL)a3;
- (void)setShouldUseModernNavigationBarHiding:(BOOL)a3;
- (void)setShowContactPhotoPosterCell:(BOOL)a3;
- (void)setShowingMeContact:(BOOL)a3;
- (void)setShowsGroupMembership:(BOOL)a3;
- (void)setShowsInlineActions:(BOOL)a3;
- (void)setShowsSharedProfile:(BOOL)a3;
- (void)setStaticIdentity:(id)a3;
- (void)setUsesBrandedCallHeaderFormat:(BOOL)a3;
- (void)setVerifiedInfoMessage:(id)a3;
- (void)setViewController:(id)a3;
- (void)setWarningMessage:(id)a3;
- (void)setupNavBarAppearance:(id)a3 asOpaqueWhenScrolled:(BOOL)a4;
- (void)toggleEditing;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)updateBackButtonIfNeeded;
- (void)updateEditNavigationItemsAnimated:(BOOL)a3 doneButtonEnabled:(BOOL)a4 doneButtonText:(id)a5;
- (void)updateEditing:(BOOL)a3 doneButtonEnabled:(BOOL)a4 doneButtonText:(id)a5;
- (void)viewDidAppear;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewServiceDidTerminate;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CNContactViewController

+ (id)descriptorForRequiredKeys
{
  return +[CNContactContentViewController descriptorForRequiredKeys];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contactHeaderViewDelegate);
  objc_storeStrong((id *)&self->_contactHeaderViewController, 0);
  objc_storeStrong((id *)&self->_contactHeaderView, 0);
  objc_storeStrong((id *)&self->_verifiedInfoMessage, 0);
  objc_storeStrong((id *)&self->_warningMessage, 0);
  objc_storeStrong((id *)&self->_importantMessage, 0);
  objc_storeStrong((id *)&self->_primaryPropertyKey, 0);
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_recentsData, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_staticIdentity, 0);
  objc_storeStrong((id *)&self->_initialPrompt, 0);
  objc_destroyWeak((id *)&self->_pptDelegate);
  objc_storeStrong((id *)&self->_additionalContact, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_navItemUpdater, 0);
  objc_storeStrong((id *)&self->_observedNavigationItem, 0);
  objc_storeStrong((id *)&self->_preEditLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_extraLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_extraRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_highlightedPropertyIdentifier, 0);
  objc_storeStrong((id *)&self->_highlightedPropertyKey, 0);
  objc_storeStrong((id *)&self->_accessDeniedView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_contentContact, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_alternateName, 0);
  objc_storeStrong((id *)&self->_parentContainer, 0);
  objc_storeStrong((id *)&self->_parentGroup, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayedPropertyKeys, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (BOOL)shouldShowSharedProfileBanner
{
  return self->_shouldShowSharedProfileBanner;
}

- (BOOL)shouldUseModernNavigationBarHiding
{
  return self->_shouldUseModernNavigationBarHiding;
}

- (void)setContactHeaderViewDelegate:(id)a3
{
}

- (CNContactViewControllerCustomHeaderViewDelegate)contactHeaderViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactHeaderViewDelegate);

  return (CNContactViewControllerCustomHeaderViewDelegate *)WeakRetained;
}

- (void)setContactHeaderViewController:(id)a3
{
}

- (UIViewController)contactHeaderViewController
{
  return self->_contactHeaderViewController;
}

- (void)setContactHeaderView:(id)a3
{
}

- (UIView)contactHeaderView
{
  return self->_contactHeaderView;
}

- (void)setVerifiedInfoMessage:(id)a3
{
}

- (NSAttributedString)verifiedInfoMessage
{
  return self->_verifiedInfoMessage;
}

- (void)setWarningMessage:(id)a3
{
}

- (NSString)warningMessage
{
  return self->_warningMessage;
}

- (void)setImportantMessage:(id)a3
{
}

- (NSString)importantMessage
{
  return self->_importantMessage;
}

- (BOOL)usesBrandedCallHeaderFormat
{
  return self->_usesBrandedCallHeaderFormat;
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

- (BOOL)forcesTransparentBackground
{
  return self->_forcesTransparentBackground;
}

- (void)setIgnoresParentalRestrictions:(BOOL)a3
{
  self->_ignoresParentalRestrictions = a3;
}

- (BOOL)ignoresParentalRestrictions
{
  return self->_ignoresParentalRestrictions;
}

- (void)setAllowsEditPhoto:(BOOL)a3
{
  self->_allowsEditPhoto = a3;
}

- (BOOL)allowsEditPhoto
{
  return self->_allowsEditPhoto;
}

- (void)setAllowsDisplayModePickerActions:(BOOL)a3
{
  self->_allowsDisplayModePickerActions = a3;
}

- (BOOL)allowsDisplayModePickerActions
{
  return self->_allowsDisplayModePickerActions;
}

- (void)setPrimaryPropertyKey:(id)a3
{
}

- (NSString)primaryPropertyKey
{
  return self->_primaryPropertyKey;
}

- (void)setProhibitedPropertyKeys:(id)a3
{
}

- (NSArray)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (void)setRecentsData:(id)a3
{
}

- (CNContactRecentsReference)recentsData
{
  return self->_recentsData;
}

- (void)setContactFormatter:(id)a3
{
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setActions:(int64_t)a3
{
  self->_actions = a3;
}

- (int64_t)actions
{
  return self->_actions;
}

- (void)setEditMode:(int64_t)a3
{
  self->_editMode = a3;
}

- (int64_t)editMode
{
  return self->_editMode;
}

- (void)setDisplayMode:(int64_t)a3
{
  self->_displayMode = a3;
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (void)setStaticIdentity:(id)a3
{
}

- (NSString)staticIdentity
{
  return self->_staticIdentity;
}

- (void)setShowContactPhotoPosterCell:(BOOL)a3
{
  self->_showContactPhotoPosterCell = a3;
}

- (BOOL)showContactPhotoPosterCell
{
  return self->_showContactPhotoPosterCell;
}

- (void)setShowingMeContact:(BOOL)a3
{
  self->_showingMeContact = a3;
}

- (BOOL)showingMeContact
{
  return self->_showingMeContact;
}

- (void)setEditingProposedInformation:(BOOL)a3
{
  self->_editingProposedInformation = a3;
}

- (BOOL)editingProposedInformation
{
  return self->_editingProposedInformation;
}

- (BOOL)shouldDrawNavigationBar
{
  return self->_shouldDrawNavigationBar;
}

- (NSString)initialPrompt
{
  return self->_initialPrompt;
}

- (void)setPptDelegate:(id)a3
{
}

- (CNContactViewControllerPPTDelegate)pptDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pptDelegate);

  return (CNContactViewControllerPPTDelegate *)WeakRetained;
}

- (void)setAdditionalContact:(id)a3
{
}

- (CNContact)additionalContact
{
  return self->_additionalContact;
}

- (CNPolicy)policy
{
  return self->_policy;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setViewController:(id)a3
{
}

- (CNContactContentViewController)viewController
{
  return self->_viewController;
}

- (void)setNavItemUpdater:(id)a3
{
}

- (CNContactContentNavigationItemUpdater)navItemUpdater
{
  return self->_navItemUpdater;
}

- (void)setObservedNavigationItem:(id)a3
{
}

- (UINavigationItem)observedNavigationItem
{
  return self->_observedNavigationItem;
}

- (void)setPreEditLeftBarButtonItems:(id)a3
{
}

- (NSArray)preEditLeftBarButtonItems
{
  return self->_preEditLeftBarButtonItems;
}

- (void)setHasCompletedSetup:(BOOL)a3
{
  self->_hasCompletedSetup = a3;
}

- (BOOL)hasCompletedSetup
{
  return self->_hasCompletedSetup;
}

- (BOOL)requiresSetup
{
  return self->_requiresSetup;
}

- (void)setExtraLeftBarButtonItems:(id)a3
{
}

- (NSArray)extraLeftBarButtonItems
{
  return self->_extraLeftBarButtonItems;
}

- (void)setExtraRightBarButtonItems:(id)a3
{
}

- (NSArray)extraRightBarButtonItems
{
  return self->_extraRightBarButtonItems;
}

- (void)setHighlightedPropertyImportant:(BOOL)a3
{
  self->_highlightedPropertyImportant = a3;
}

- (BOOL)highlightedPropertyImportant
{
  return self->_highlightedPropertyImportant;
}

- (void)setHighlightedPropertyIdentifier:(id)a3
{
}

- (NSString)highlightedPropertyIdentifier
{
  return self->_highlightedPropertyIdentifier;
}

- (void)setHighlightedPropertyKey:(id)a3
{
}

- (NSString)highlightedPropertyKey
{
  return self->_highlightedPropertyKey;
}

- (_UIAccessDeniedView)accessDeniedView
{
  return self->_accessDeniedView;
}

- (void)setContentViewController:(id)a3
{
}

- (void)setContentContact:(id)a3
{
}

- (CNContact)contentContact
{
  return self->_contentContact;
}

- (void)setShouldShowLinkedContacts:(BOOL)shouldShowLinkedContacts
{
  self->_shouldShowLinkedContacts = shouldShowLinkedContacts;
}

- (BOOL)shouldShowLinkedContacts
{
  return self->_shouldShowLinkedContacts;
}

- (void)setMessage:(NSString *)message
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setAlternateName:(NSString *)alternateName
{
}

- (NSString)alternateName
{
  return self->_alternateName;
}

- (void)setParentContainer:(CNContainer *)parentContainer
{
}

- (CNContainer)parentContainer
{
  return self->_parentContainer;
}

- (void)setParentGroup:(CNGroup *)parentGroup
{
}

- (CNGroup)parentGroup
{
  return self->_parentGroup;
}

- (void)setContactStore:(CNContactStore *)contactStore
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
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

- (void)setContact:(CNContact *)contact
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)didTapBlockAndReportForContact:(id)a3
{
  id v7 = a3;
  v4 = [(CNContactViewController *)self privateDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(CNContactViewController *)self privateDelegate];
    [v6 contactViewController:self didExecuteBlockAndReportContactAction:v7];

    [(CNContactViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)viewServiceDidTerminate
{
  [(CNContactViewController *)self didCompleteWithContact:0];

  [(CNContactViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)didExecuteDeleteFromDowntimeWhitelistAction
{
  v3 = [(CNContactViewController *)self privateDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CNContactViewController *)self privateDelegate];
    [v5 contactViewControllerDidExecuteDeleteFromDowntimeWhitelistAction:self];
  }
}

- (void)didExecuteClearRecentsDataAction
{
  v3 = [(CNContactViewController *)self privateDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CNContactViewController *)self privateDelegate];
    [v5 contactViewControllerDidExecuteClearRecentsDataAction:self];
  }
}

- (void)viewDidAppear
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"CNContactViewController.m", 1099, @"This should not be called, we pass the pptDelegate directly to the host view controller" object file lineNumber description];
}

- (void)isPresentingEditingController:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactViewController *)self privateDelegate];
  if (v3)
  {
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0) {
      return;
    }
    id v8 = [(CNContactViewController *)self privateDelegate];
    [v8 contactViewControllerForUnknownContactDidBeginAddingToContacts:self];
  }
  else
  {
    int v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0) {
      return;
    }
    id v8 = [(CNContactViewController *)self privateDelegate];
    [v8 contactViewControllerForUnknownContactDidEndAddingToContacts:self];
  }
}

- (void)isPresentingFullscreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CNContactViewController *)self navigationController];
  [v4 setNavigationBarHidden:v3 animated:0];
}

- (void)didDeleteContact:(id)a3
{
  id v7 = a3;
  id v4 = [(CNContactViewController *)self privateDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    if ([(CNContactViewController *)self editMode] != 2) {
      [(CNContactViewController *)self setEditing:0];
    }
    char v6 = [(CNContactViewController *)self privateDelegate];
    [v6 contactViewController:self didDeleteContact:v7];
  }
}

- (void)didCompleteWithContact:(id)a3
{
  id v7 = a3;
  id v4 = [(CNContactViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CNContactViewController *)self delegate];
    [v6 contactViewController:self didCompleteWithContact:v7];
  }
}

- (void)updateEditing:(BOOL)a3 doneButtonEnabled:(BOOL)a4 doneButtonText:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v12 = a5;
  if (![(CNContactViewController *)self shouldUseModernNavigationBarHiding]
    && !CNUIIsMessages()
    && [(CNContactViewController *)self isEditing] != v6)
  {
    id v8 = [(CNContactViewController *)self navigationItem];
    [(CNContactViewController *)self setupNavBarAppearance:v8 asOpaqueWhenScrolled:v6];
  }
  if ([(CNContactViewController *)self _shouldBeOutOfProcess])
  {
    if ([(CNContactViewController *)self isEditing] != v6)
    {
      [(CNContactViewController *)self setEditing:v6 animated:1];
      v9 = [(CNContactViewController *)self privateDelegate];
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        v11 = [(CNContactViewController *)self privateDelegate];
        [v11 contactViewController:self didChangeToEditMode:v6];
      }
    }
    [(CNContactViewController *)self updateEditNavigationItemsAnimated:1 doneButtonEnabled:v5 doneButtonText:v12];
  }
}

- (BOOL)shouldPerformDefaultActionForContact:(id)a3 propertyKey:(id)a4 propertyIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CNContactViewController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [MEMORY[0x1E4F1B970] contactPropertyWithContact:v8 propertyKey:v9 identifier:v10];
    v14 = [(CNContactViewController *)self delegate];
    char v15 = [v14 contactViewController:self shouldPerformDefaultActionForContactProperty:v13];
  }
  else
  {
    char v15 = 1;
  }

  return v15;
}

- (void)enableEditKeyboardShortcut
{
  id v3 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"l" modifierFlags:0x100000 action:sel_toggleEditing_];
  [(CNContactViewController *)self addKeyCommand:v3];
}

- (void)enableCancelKeyboardShortcut
{
  id v3 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B08] modifierFlags:0 action:sel_editCancel_];
  [(CNContactViewController *)self addKeyCommand:v3];
}

- (void)enableSaveKeyboardShortcut
{
  id v5 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"s" modifierFlags:0x100000 action:sel_toggleEditing_];
  id v3 = CNContactsUIBundle();
  id v4 = [v3 localizedStringForKey:@"SAVE_CONTACT_KEYBOARD_DISCOVERY" value:&stru_1ED8AC728 table:@"Localized"];
  [v5 setDiscoverabilityTitle:v4];

  [(CNContactViewController *)self addKeyCommand:v5];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CNContactViewController;
  [(CNContactViewController *)&v8 touchesBegan:a3 withEvent:a4];
  id v5 = [(CNContactViewController *)self splitViewController];

  if (v5)
  {
    BOOL v6 = [(CNContactViewController *)self splitViewController];
    id v7 = [v6 view];
    [v7 endEditing:1];
  }
}

- (id)currentNavigationController
{
  v2 = [(CNContactViewController *)self navigationItemController];
  id v3 = [v2 navigationController];

  id v4 = [v3 navigationBar];
  id v5 = [v4 backItem];
  if (v5)
  {

LABEL_3:
    id v6 = v3;
    goto LABEL_6;
  }
  id v7 = [v3 navigationController];
  objc_super v8 = [v7 navigationBar];
  id v9 = [v8 backItem];

  if (!v9) {
    goto LABEL_3;
  }
  id v6 = [v3 navigationController];
LABEL_6:
  id v10 = v6;

  return v10;
}

- (void)popToPrevious:(id)a3
{
  id v4 = [(CNContactViewController *)self currentNavigationController];
  id v3 = (id)[v4 popViewControllerAnimated:1];
}

- (id)platterBackBarButtonItem
{
  id v3 = [(CNContactViewController *)self traitCollection];
  BOOL v4 = [v3 layoutDirection] == 1;

  id v5 = [[CNPlatterBackBarButtonItem alloc] initWithTarget:self action:sel_popToPrevious_ isRTL:v4];

  return v5;
}

- (BOOL)displayNavigationButtonsShouldUsePlatterStyle
{
  id v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  BOOL v4 = [v3 featureFlags];
  if ([v4 isFeatureEnabled:15]) {
    BOOL v5 = ![(CNContactViewController *)self shouldDrawNavigationBar];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)configureNavigationItem:(id)a3
{
  id v4 = a3;
  [v4 setLargeTitleDisplayMode:2];
  [(CNContactViewController *)self setupNavBarAppearance:v4 asOpaqueWhenScrolled:0];

  if ([(CNContactViewController *)self displayNavigationButtonsShouldUsePlatterStyle])
  {
    if ([(CNContactViewController *)self isEditing]) {
      [MEMORY[0x1E4FB1618] tintColor];
    }
    else {
    id v8 = +[CNUIColorRepository contactCardStaticHeaderDefaultTintColor];
    }
    BOOL v5 = [(CNContactViewController *)self navigationItemController];
    id v6 = [v5 navigationItem];
    id v7 = [v6 navigationBar];
    [v7 setTintColor:v8];
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CNContactViewController;
  [(CNContactViewController *)&v19 didMoveToParentViewController:v4];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v5 = [(CNContactViewController *)self observedNavigationItem];
      id v6 = [(CNContactViewController *)self navigationItemController];
      id v7 = [v6 navigationItem];

      if (v5 != v7)
      {
        id v8 = [(CNContactViewController *)self observedNavigationItem];
        [v8 removeObserver:self forKeyPath:@"title"];

        id v9 = [(CNContactViewController *)self observedNavigationItem];
        [v9 removeObserver:self forKeyPath:@"titleView"];

        id v10 = [(CNContactViewController *)self navigationItemController];
        v11 = [v10 navigationItem];
        [(CNContactViewController *)self setObservedNavigationItem:v11];

        char v12 = [(CNContactViewController *)self observedNavigationItem];
        [v12 addObserver:self forKeyPath:@"title" options:1 context:0];

        v13 = [(CNContactViewController *)self observedNavigationItem];
        [v13 addObserver:self forKeyPath:@"titleView" options:1 context:0];
      }
      v14 = [v4 navigationItem];
      [(CNContactViewController *)self configureNavigationItem:v14];

      _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactViewController.m", 939, 4, @"%@ is added to a controller that's not a navigation controller, we'll update the parent navigation item %@ automatically,", v15, v16, v17, v18, (uint64_t)self);
    }
  }
}

- (void)updateEditNavigationItemsAnimated:(BOOL)a3 doneButtonEnabled:(BOOL)a4 doneButtonText:(id)a5
{
  BOOL v5 = a4;
  id v27 = [(CNContactViewController *)self navigationItemController];
  BOOL v8 = [(CNContactViewController *)self displayNavigationButtonsShouldUsePlatterStyle];
  id v9 = [(CNContactViewController *)self currentNavigationController];
  id v10 = [v9 navigationBar];
  v11 = [v10 backItem];

  if ([(CNContactViewController *)self isEditing])
  {
    char v12 = [(CNContactViewController *)self navItemUpdater];
    BYTE1(v25) = a3;
    LOBYTE(v25) = v5;
    id v13 = (id)objc_msgSend(v12, "updateEditingNavigationItemForController:actionTarget:isInSheet:isShowingNavBar:shouldUsePlatterStyle:isUpdatingContact:hasChanges:animated:", v27, self, -[UIViewController ab_isInSheet](self, "ab_isInSheet"), -[CNContactViewController shouldDrawNavigationBar](self, "shouldDrawNavigationBar"), v8, -[CNContactViewController mode](self, "mode") == 4, v25);
  }
  else
  {
    HIDWORD(v26) = v5;
    BOOL v14 = v11 != 0;
    char v12 = [(CNContactViewController *)self navItemUpdater];
    int64_t v15 = [(CNContactViewController *)self mode];
    BOOL v16 = [(CNContactViewController *)self allowsEditing];
    BOOL v17 = [(UIViewController *)self ab_isInSheet];
    BOOL v18 = [(CNContactViewController *)self shouldDrawNavigationBar];
    objc_super v19 = [(CNContactViewController *)self platterBackBarButtonItem];
    LOBYTE(v26) = a3;
    BYTE2(v25) = v8;
    BYTE1(v25) = v14;
    LOBYTE(v25) = v18;
    id v20 = (id)objc_msgSend(v12, "updateDisplayNavigationItemsForController:mode:actionTarget:allowsEditing:editButtonEnabled:isInSheet:isShowingNavBar:shouldShowBackButton:shouldUsePlatterStyle:platterBackBarButtonItem:animated:", v27, v15, self, v16, HIDWORD(v26), v17, v25, v19, v26);
  }
  if (v8)
  {
    if ([(CNContactViewController *)self isEditing]) {
      [MEMORY[0x1E4FB1618] tintColor];
    }
    else {
    v21 = +[CNUIColorRepository contactCardStaticHeaderDefaultTintColor];
    }
    v22 = [(CNContactViewController *)self navigationItemController];
    v23 = [v22 navigationItem];
    v24 = [v23 navigationBar];
    [v24 setTintColor:v21];
  }
}

- (void)updateBackButtonIfNeeded
{
  if (([(CNContactViewController *)self isEditing] & 1) == 0)
  {
    if ([(CNContactViewController *)self displayNavigationButtonsShouldUsePlatterStyle])
    {
      id v3 = [(CNContactViewController *)self currentNavigationController];
      id v4 = [v3 navigationBar];
      BOOL v5 = [v4 backItem];

      if (v5)
      {
        id v9 = [(CNContactViewController *)self navItemUpdater];
        id v6 = [(CNContactViewController *)self navigationItemController];
        int64_t v7 = [(CNContactViewController *)self mode];
        BOOL v8 = [(CNContactViewController *)self platterBackBarButtonItem];
        [v9 updateBackButtonForPlatterStyleForController:v6 mode:v7 platterBackBarButtonItem:v8 animated:0];
      }
    }
  }
}

- (void)setupNavBarAppearance:(id)a3 asOpaqueWhenScrolled:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  [v5 configureWithTransparentBackground];
  [v7 setScrollEdgeAppearance:v5];
  if (v4)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v6 configureWithDefaultBackground];
    [v7 setStandardAppearance:v6];
  }
  else
  {
    [v7 setStandardAppearance:v5];
  }
}

- (void)setDoneButtonText:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = [(CNContactViewController *)self navigationItemController];
  if (![(CNContactViewController *)self isEditing])
  {
    if (![(CNContactViewController *)self allowsEditing]) {
      goto LABEL_9;
    }
    id v7 = [v10 editButtonItem];
    [v7 setEnabled:1];
    goto LABEL_8;
  }
  id v6 = [v10 editButtonItem];
  [v6 setEnabled:v4];

  if (v4) {
    [(CNContactViewController *)self enableSaveKeyboardShortcut];
  }
  if ([(CNContactViewController *)self mode] == 4)
  {
    id v7 = CNContactsUIBundle();
    BOOL v8 = [v7 localizedStringForKey:@"UPDATE" value:&stru_1ED8AC728 table:@"Localized"];
    id v9 = [v10 editButtonItem];
    [v9 setTitle:v8];

LABEL_8:
  }
LABEL_9:
}

- (void)toggleEditing
{
  id v2 = [(CNContactViewController *)self viewController];
  [v2 toggleEditing];
}

- (void)editCancel:(id)a3
{
  id v3 = [(CNContactViewController *)self viewController];
  [v3 editCancel];
}

- (id)navigationItemController
{
  id v2 = self;
  id v3 = v2;
  if (v2)
  {
    BOOL v4 = v2;
    while (1)
    {
      id v5 = [(CNContactViewController *)v4 parentViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }
      uint64_t v7 = [(CNContactViewController *)v4 parentViewController];

      BOOL v4 = (CNContactViewController *)v7;
      if (!v7) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    BOOL v4 = v3;
  }

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CNContactViewController *)self hasCompletedSetup])
  {
    id v11 = [(CNContactViewController *)self observedNavigationItem];
    if (v11 == v9)
    {
      if ([v16 isEqualToString:@"title"])
      {
      }
      else
      {
        int v12 = [v16 isEqualToString:@"titleView"];

        if (!v12) {
          goto LABEL_10;
        }
      }
      id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
      id v13 = [MEMORY[0x1E4F1CA98] null];
      int v14 = [v11 isEqual:v13];

      if (v14)
      {

        id v11 = 0;
      }
      int64_t v15 = [(CNContactViewController *)self viewController];
      [v15 didChangeToShowTitle:v11 != 0];
    }
  }
LABEL_10:
}

- (void)_prepareViewController
{
  id v3 = [(CNContactViewController *)self _contactPresentedViewController];
  [v3 _beginDelayingPresentation:&__block_literal_global_53746 cancellationHandler:10.0];

  BOOL v4 = [(CNContactViewController *)self viewController];

  if (v4)
  {
    [(CNContactViewController *)self setRequiresSetup:1];
    [(CNContactViewController *)self setHasCompletedSetup:0];
  }
  else if ([(CNContactViewController *)self _shouldBeOutOfProcess])
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x3042000000;
    v7[3] = __Block_byref_object_copy__53747;
    v7[4] = __Block_byref_object_dispose__53748;
    objc_initWeak(&v8, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__CNContactViewController__prepareViewController__block_invoke_91;
    v6[3] = &unk_1E549A8A0;
    v6[4] = v7;
    +[CNContactViewHostViewController getViewController:v6];
    _Block_object_dispose(v7, 8);
    objc_destroyWeak(&v8);
  }
  else
  {
    id v5 = objc_alloc_init(CNContactContentViewController);
    [(CNContactViewController *)self _setViewController:v5];
  }
}

void __49__CNContactViewController__prepareViewController__block_invoke_91(uint64_t a1, void *a2)
{
  id v2 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setViewController:v3];
}

uint64_t __49__CNContactViewController__prepareViewController__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactViewController.m", 782, 3, @"Contact view delayed appearance timed out", a5, a6, a7, a8, vars0);
  return 1;
}

- (BOOL)_shouldBeOutOfProcess
{
  int64_t v3 = [(CNContactViewController *)self displayMode];
  if (v3 != 1)
  {
    BOOL v4 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    id v5 = [v4 entitlementVerifier];
    char v6 = [v5 currentProcessHasBooleanEntitlement:*MEMORY[0x1E4F5A210] error:0];

    if ([(CNContactViewController *)self displayMode] == 2) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = v6 ^ 1;
    }
  }
  return v3;
}

- (void)_setupViewController
{
  v120[24] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [(CNContactViewController *)self contact];
  [(CNContactViewController *)self setContentContact:v5];

  char v6 = [(CNContactViewController *)self contact];
  if (v6)
  {
    uint64_t v7 = [(CNContactViewController *)self contact];
    v119 = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v119 count:1];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  id v9 = [(CNContactViewController *)self contact];
  int v10 = [v9 isSuggested];

  if (v10 && [(CNContactViewController *)self mode] == 3)
  {
    id v11 = [(CNContactViewController *)self contact];
    int v12 = (void *)[v11 copyWithCuratingAllSuggestionsAndBirthdaySuggestion];
    [(CNContactViewController *)self setContentContact:v12];
  }
  id v13 = [MEMORY[0x1E4F1CA48] array];
  int v14 = [(CNContactViewController *)self additionalContact];

  v109 = (void *)v3;
  if (v14)
  {
    int64_t v15 = [(CNContactViewController *)self additionalContact];
    uint64_t v16 = [v8 arrayByAddingObject:v15];

    if ([v15 isSuggested])
    {
      uint64_t v17 = [v15 copyWithCuratingAllSuggestionsAndBirthdaySuggestion];

      int v10 = 1;
      int64_t v15 = (void *)v17;
    }
    BOOL v18 = [(CNContactViewController *)self contact];
    objc_super v19 = (void *)[v18 mutableCopy];

    id v20 = [v19 addAllPropertiesFromContact:v15];
    if (v20) {
      [v13 addObjectsFromArray:v20];
    }
    [(CNContactViewController *)self setContentContact:v19];

    id v8 = (void *)v16;
  }
  v21 = [(CNContactViewController *)self contactStore];

  if (!v21)
  {
    [(CNContactViewController *)self setActions:[(CNContactViewController *)self actions] & 0xFFFFFFFFFFFFFFDFLL];
    if (v10) {
      uint64_t v22 = 7;
    }
    else {
      uint64_t v22 = 1;
    }
    v23 = [MEMORY[0x1E4F1B980] storeWithOptions:v22];
    [(CNContactViewController *)self setContactStore:v23];
  }
  if (![(CNContactViewController *)self _shouldBeOutOfProcess])
  {
    v24 = [(CNContactViewController *)self contactStore];
    uint64_t v25 = [(CNContactViewController *)self viewController];
    [v25 setContactStore:v24];
  }
  uint64_t v26 = [(CNContactViewController *)self displayedPropertyKeys];

  if (v26)
  {
    id v27 = [(CNContactViewController *)self displayedPropertyKeys];
    [v4 setObject:v27 forKeyedSubscript:@"displayedProperties"];
  }
  uint64_t v28 = [(CNContactViewController *)self primaryPropertyKey];
  if (v28)
  {
    v29 = (void *)v28;
    int64_t v30 = [(CNContactViewController *)self mode];

    if (v30 == 2)
    {
      v31 = [(CNContactViewController *)self primaryPropertyKey];
      [v4 setObject:v31 forKeyedSubscript:@"primaryProperty"];
    }
  }
  v32 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactViewController allowsDisplayModePickerActions](self, "allowsDisplayModePickerActions"));
  [v4 setObject:v32 forKeyedSubscript:@"allowsDisplayModePickerActions"];

  v33 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactViewController allowsEditPhoto](self, "allowsEditPhoto"));
  [v4 setObject:v33 forKeyedSubscript:@"allowsEditPhoto"];

  v34 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactViewController allowsNamePicking](self, "allowsNamePicking"));
  [v4 setObject:v34 forKeyedSubscript:@"allowsNamePicking"];

  v35 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactViewController showsInlineActions](self, "showsInlineActions"));
  [v4 setObject:v35 forKeyedSubscript:@"showsInlineActions"];

  v36 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactViewController showsSharedProfile](self, "showsSharedProfile"));
  [v4 setObject:v36 forKeyedSubscript:@"showsSharedProfile"];

  v37 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactViewController showsGroupMembership](self, "showsGroupMembership"));
  [v4 setObject:v37 forKeyedSubscript:@"showsGroupMembership"];

  v38 = [(CNContactViewController *)self contactHeaderViewController];

  if (v38)
  {
    v39 = [(CNContactViewController *)self contactHeaderViewController];
    [v4 setObject:v39 forKeyedSubscript:@"personHeaderViewController"];
  }
  v40 = [(CNContactViewController *)self contactHeaderView];

  if (v40)
  {
    v41 = [(CNContactViewController *)self contactHeaderView];
    [v4 setObject:v41 forKeyedSubscript:@"personHeaderView"];
  }
  v42 = [(CNContactViewController *)self contactHeaderViewDelegate];

  if (v42)
  {
    v43 = [(CNContactViewController *)self contactHeaderViewDelegate];
    [v4 setObject:v43 forKeyedSubscript:@"personHeaderViewDelegate"];
  }
  v44 = objc_msgSend(NSNumber, "numberWithBool:", ((unint64_t)-[CNContactViewController actions](self, "actions") >> 5) & 1);
  [v4 setObject:v44 forKeyedSubscript:@"allowsAddingToAddressBook"];

  v45 = objc_msgSend(NSNumber, "numberWithBool:", ((unint64_t)-[CNContactViewController actions](self, "actions") >> 6) & 1);
  [v4 setObject:v45 forKeyedSubscript:@"allowsAddToFavorites"];

  v46 = objc_msgSend(NSNumber, "numberWithBool:", ((unint64_t)-[CNContactViewController actions](self, "actions") >> 7) & 1);
  [v4 setObject:v46 forKeyedSubscript:@"allowsContactBlocking"];

  v47 = objc_msgSend(NSNumber, "numberWithBool:", ((unint64_t)-[CNContactViewController actions](self, "actions") >> 11) & 1);
  [v4 setObject:v47 forKeyedSubscript:@"allowsContactBlockingAndReporting"];

  v48 = objc_msgSend(NSNumber, "numberWithBool:", ((unint64_t)-[CNContactViewController actions](self, "actions") >> 1) & 1);
  [v4 setObject:v48 forKeyedSubscript:@"allowsCardActions"];

  v49 = objc_msgSend(NSNumber, "numberWithBool:", ((unint64_t)-[CNContactViewController actions](self, "actions") >> 4) & 1);
  [v4 setObject:v49 forKeyedSubscript:@"allowsSharing"];

  v50 = objc_msgSend(NSNumber, "numberWithBool:", ((unint64_t)-[CNContactViewController actions](self, "actions") >> 2) & 1);
  [v4 setObject:v50 forKeyedSubscript:@"allowsConferencing"];

  v51 = objc_msgSend(NSNumber, "numberWithBool:", ((unint64_t)-[CNContactViewController actions](self, "actions") >> 8) & 1);
  [v4 setObject:v51 forKeyedSubscript:@"allowsDeletion"];

  v52 = objc_msgSend(NSNumber, "numberWithBool:", ((unint64_t)-[CNContactViewController actions](self, "actions") >> 10) & 1);
  [v4 setObject:v52 forKeyedSubscript:@"allowsEditInApp"];

  v53 = [(CNContactViewController *)self warningMessage];
  [v4 setObject:v53 forKeyedSubscript:@"warningMessage"];

  v54 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactViewController shouldDrawNavigationBar](self, "shouldDrawNavigationBar"));
  [v4 setObject:v54 forKeyedSubscript:@"shouldDrawNavigationBar"];

  v55 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactViewController editingProposedInformation](self, "editingProposedInformation"));
  [v4 setObject:v55 forKeyedSubscript:@"editingProposedInformation"];

  v56 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactViewController forcesTransparentBackground](self, "forcesTransparentBackground"));
  [v4 setObject:v56 forKeyedSubscript:@"forcesTransparentBackground"];

  v57 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactViewController usesBrandedCallHeaderFormat](self, "usesBrandedCallHeaderFormat"));
  [v4 setObject:v57 forKeyedSubscript:@"usesBrandedCallHeaderFormat"];

  v58 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactViewController shouldShowSharedProfileBanner](self, "shouldShowSharedProfileBanner"));
  [v4 setObject:v58 forKeyedSubscript:@"shouldShowSharedProfileBanner"];

  v59 = [(CNContactViewController *)self staticIdentity];
  [v4 setObject:v59 forKeyedSubscript:@"staticIdentity"];

  v60 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactViewController showContactPhotoPosterCell](self, "showContactPhotoPosterCell"));
  [v4 setObject:v60 forKeyedSubscript:@"showContactPhotoPosterCell"];

  if ([(CNContactViewController *)self isEditing]) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isEditing"];
  }
  if ([(id)*MEMORY[0x1E4FB2608] isRunningTest]) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"runningPPT"];
  }
  v61 = [(CNContactViewController *)self highlightedPropertyIdentifier];

  v110 = v13;
  if (v61)
  {
    v62 = (void *)MEMORY[0x1E4F1B970];
    v63 = [(CNContactViewController *)self contentContact];
    v64 = [(CNContactViewController *)self highlightedPropertyKey];
    [(CNContactViewController *)self highlightedPropertyIdentifier];
    v66 = v65 = v8;
    v67 = [v62 contactPropertyWithContactNoCopy:v63 propertyKey:v64 identifier:v66];

    id v8 = v65;
    id v13 = v110;

    [v110 addObject:v67];
  }
  if ([v13 count]) {
    [v4 setObject:v13 forKeyedSubscript:@"highlightedProperties"];
  }
  v68 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactViewController highlightedPropertyImportant](self, "highlightedPropertyImportant"));
  [v4 setObject:v68 forKeyedSubscript:@"highlightedPropertyImportant"];

  v69 = [(CNContactViewController *)self contentContact];
  [v4 setObject:v69 forKeyedSubscript:@"contact"];

  if ((unint64_t)[v8 count] > 1
    || ([v8 firstObject],
        v70 = objc_claimAutoreleasedReturnValue(),
        [(CNContactViewController *)self contentContact],
        v71 = objc_claimAutoreleasedReturnValue(),
        char v72 = [v70 isEqual:v71],
        v71,
        v70,
        (v72 & 1) == 0))
  {
    [v4 setObject:v8 forKeyedSubscript:@"originalContacts"];
  }
  v108 = v8;
  uint64_t v73 = *MEMORY[0x1E4F5A298];
  v74 = [(CNContactViewController *)self navigationItemController];
  v75 = [v74 navigationItem];
  v76 = [v75 title];
  LOBYTE(v73) = (*(uint64_t (**)(uint64_t, void *))(v73 + 16))(v73, v76);

  if ((v73 & 1) == 0) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"layoutPositionallyAfterNavBar"];
  }
  v77 = [(CNContactViewController *)self navigationItem];
  [(CNContactViewController *)self setupNavBarAppearance:v77 asOpaqueWhenScrolled:0];

  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  v120[0] = @"importantMessage";
  v120[1] = @"allowsConferencing";
  v120[2] = @"alternateName";
  v120[3] = @"message";
  v120[4] = @"shouldShowLinkedContacts";
  v120[5] = @"parentGroup";
  v120[6] = @"displayedPropertyKeys";
  v120[7] = @"allowsActions";
  v120[8] = @"allowsDeletion";
  v120[9] = @"allowsEditing";
  v120[10] = @"allowsNamePicking";
  v120[11] = @"showsInlineActions";
  v120[12] = @"showsSharedProfile";
  v120[13] = @"showsGroupMembership";
  v120[14] = @"mode";
  v120[15] = @"parentContainer";
  v120[16] = @"verifiedInfoMessage";
  v120[17] = @"allowsAddingToAddressBook";
  v120[18] = @"allowsAddToFavorites";
  v120[19] = @"allowsSharing";
  v120[20] = @"allowsContactBlocking";
  v120[21] = @"allowsContactBlockingAndReporting";
  v120[22] = @"showingMeContact";
  v120[23] = @"showContactPhotoPosterCell";
  v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:24];
  uint64_t v79 = [v78 countByEnumeratingWithState:&v114 objects:v118 count:16];
  if (v79)
  {
    uint64_t v80 = v79;
    uint64_t v81 = *(void *)v115;
    do
    {
      for (uint64_t i = 0; i != v80; ++i)
      {
        if (*(void *)v115 != v81) {
          objc_enumerationMutation(v78);
        }
        uint64_t v83 = *(void *)(*((void *)&v114 + 1) + 8 * i);
        v84 = [v4 objectForKeyedSubscript:v83];

        if (!v84)
        {
          v85 = [(CNContactViewController *)self valueForKey:v83];
          if (v85) {
            [v4 setObject:v85 forKeyedSubscript:v83];
          }
        }
      }
      uint64_t v80 = [v78 countByEnumeratingWithState:&v114 objects:v118 count:16];
    }
    while (v80);
  }

  v86 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v86 _peripheryInsets];
  v87 = NSStringFromUIEdgeInsets(v121);
  [v4 setObject:v87 forKeyedSubscript:@"mainScreenPeripheryInsets"];

  switch([(CNContactViewController *)self mode])
  {
    case 1:
      int64_t v88 = [(CNContactViewController *)self editMode];
      BOOL v89 = v88 == 2 || [(CNContactViewController *)self editMode] == 1;
      [v4 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"allowsAddingToAddressBook"];
      v97 = [NSNumber numberWithBool:v89];
      [v4 setObject:v97 forKeyedSubscript:@"allowsEditing"];

      v98 = [NSNumber numberWithBool:v88 == 2];
      v99 = @"alwaysEditing";
      goto LABEL_68;
    case 2:
      uint64_t v90 = MEMORY[0x1E4F1CC28];
      [v4 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"allowsEditing"];
      [v4 setObject:v90 forKeyedSubscript:@"allowsAddToFavorites"];
      v91 = [(CNContactViewController *)self recentsData];
      [v4 setObject:v91 forKeyedSubscript:@"recentsData"];

      v92 = [(CNContactViewController *)self primaryPropertyKey];

      if (v92)
      {
        v93 = [(CNContactViewController *)self contentContact];
        v94 = [(CNContactViewController *)self _primaryPropertyStringForContact:v93];

        if (v94) {
          [v4 setObject:v94 forKeyedSubscript:@"alternateName"];
        }
      }
      else
      {
        v107 = [(CNContactViewController *)self alternateName];

        if (v107)
        {
          v98 = [(CNContactViewController *)self alternateName];
          v99 = @"alternateName";
LABEL_68:
          [v4 setObject:v98 forKeyedSubscript:v99];
        }
      }
      break;
    case 3:
      uint64_t v95 = MEMORY[0x1E4F1CC38];
      [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"allowsEditing"];
      [v4 setObject:v95 forKeyedSubscript:@"alwaysEditing"];
      v96 = @"layoutPositionallyAfterNavBar";
      goto LABEL_65;
    case 4:
      uint64_t v95 = MEMORY[0x1E4F1CC38];
      [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"allowsEditing"];
      v96 = @"alwaysEditing";
      goto LABEL_65;
    case 5:
      uint64_t v95 = MEMORY[0x1E4F1CC28];
      [v4 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"allowsEditing"];
      [v4 setObject:v95 forKeyedSubscript:@"allowsCardActions"];
      v96 = @"allowsAddingToAddressBook";
LABEL_65:
      [v4 setObject:v95 forKeyedSubscript:v96];
      break;
    default:
      break;
  }
  [v109 setObject:v4 forKeyedSubscript:@"Properties"];
  v100 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v101 = [v100 entitlementVerifier];
  int v102 = [v101 currentProcessHasBooleanEntitlement:*MEMORY[0x1E4F5A220] error:0];

  if (v102)
  {
    v103 = objc_msgSend(NSNumber, "numberWithBool:", -[CNContactViewController ignoresParentalRestrictions](self, "ignoresParentalRestrictions"));
    [v109 setObject:v103 forKeyedSubscript:@"ignoresParentalRestrictions"];
  }
  v104 = [(CNContactViewController *)self prohibitedPropertyKeys];
  [v109 setObject:v104 forKeyedSubscript:@"prohibitedPropertyKeys"];

  v105 = [(CNContactViewController *)self viewController];
  v111[0] = MEMORY[0x1E4F143A8];
  v111[1] = 3221225472;
  v111[2] = __47__CNContactViewController__setupViewController__block_invoke;
  v111[3] = &unk_1E549A858;
  id v112 = v4;
  v113 = self;
  id v106 = v4;
  [v105 setupWithOptions:v109 readyBlock:v111];

  [(CNContactViewController *)self setRequiresSetup:0];
}

void __47__CNContactViewController__setupViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CNContactViewController__setupViewController__block_invoke_2;
  block[3] = &unk_1E549B800;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v3;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __47__CNContactViewController__setupViewController__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"alwaysEditing"];
  int v3 = [v2 isEqual:MEMORY[0x1E4F1CC38]];

  if (v3) {
    [*(id *)(a1 + 40) setEditing:1 animated:0];
  }
  id v4 = [*(id *)(a1 + 40) _contactPresentedViewController];
  [v4 _endDelayingPresentation];

  objc_msgSend(*(id *)(a1 + 40), "cnui_appropriatePresentationController");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v10 delegate];

  if (!v5) {
    [v10 setDelegate:*(void *)(a1 + 40)];
  }
  if (*(void *)(a1 + 48)) {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactViewController.m", 759, 3, @"Error when showing contact view: %@", v6, v7, v8, v9, *(void *)(a1 + 48));
  }
  [*(id *)(a1 + 40) setHasCompletedSetup:1];
}

- (void)setContact:(id)a3 additionalContact:(id)a4 mode:(int64_t)a5
{
  uint64_t v8 = (CNContact *)a3;
  uint64_t v9 = (CNContact *)a4;
  contact = self->_contact;
  self->_contact = v8;
  id v11 = v8;

  additionalContact = self->_additionalContact;
  self->_additionalContact = v9;

  self->_mode = a5;
  [(CNContactViewController *)self setRequiresSetup:1];

  [(CNContactViewController *)self setHasCompletedSetup:0];
}

- (void)_setViewController:(id)a3
{
  id v4 = a3;
  [v4 setDelegate:self];
  uint64_t v5 = [(CNContactViewController *)self pptDelegate];
  [v4 setPptDelegate:v5];

  [(CNContactViewController *)self setViewController:v4];
  [(CNContactViewController *)self _setupViewController];
  [(UIViewController *)self cnui_addChildViewController:v4];

  id v6 = [(CNContactViewController *)self viewController];
  [v6 preferredContentSize];
  -[CNContactViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)_endDelayingPresentation
{
  self->_ignoreViewWillBePresented = 1;
  v3.receiver = self;
  v3.super_class = (Class)CNContactViewController;
  [(CNContactViewController *)&v3 _endDelayingPresentation];
  self->_ignoreViewWillBePresented = 0;
}

- (BOOL)_isDelayingPresentation
{
  v5.receiver = self;
  v5.super_class = (Class)CNContactViewController;
  if ([(CNContactViewController *)&v5 _isDelayingPresentation]) {
    return 1;
  }
  if (!self->_ignoreViewWillBePresented && (objc_opt_respondsToSelector() & 1) != 0) {
    [(CNContactViewController *)self _viewWillBePresented];
  }
  v4.receiver = self;
  v4.super_class = (Class)CNContactViewController;
  return [(CNContactViewController *)&v4 _isDelayingPresentation];
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  objc_opt_class();
  objc_super v3 = [(CNContactViewController *)self viewController];
  if (objc_opt_isKindOfClass()) {
    objc_super v4 = v3;
  }
  else {
    objc_super v4 = 0;
  }
  id v5 = v4;

  return (_UIRemoteViewController *)v5;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNContactViewController;
  [(CNContactViewController *)&v5 viewDidDisappear:a3];
  objc_super v4 = [(CNContactViewController *)self navigationItem];
  [(CNContactViewController *)self setupNavBarAppearance:v4 asOpaqueWhenScrolled:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNContactViewController;
  [(CNContactViewController *)&v5 viewDidAppear:a3];
  if ([(id)*MEMORY[0x1E4FB2608] isPPTAvailable])
  {
    objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"PPTDidShowContact" object:self];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CNContactViewController;
  [(CNContactViewController *)&v12 viewWillAppear:a3];
  if ([(CNContactViewController *)self _shouldBeOutOfProcess])
  {
    objc_super v4 = [(CNContactViewController *)self navigationController];
    objc_super v5 = [v4 navigationBar];
    id v6 = [(CNContactViewController *)self view];
    [v6 bounds];
    [v5 _setRequestedMaxBackButtonWidth:v7 / 3.0];
  }
  uint64_t v8 = [(CNContactViewController *)self navigationController];
  uint64_t v9 = [v8 navigationBar];
  if ([v9 isTranslucent])
  {
  }
  else
  {
    id v10 = [(CNContactViewController *)self navigationItem];
    int v11 = [v10 _backgroundHidden];

    if (v11) {
      [(CNContactViewController *)self setExtendedLayoutIncludesOpaqueBars:1];
    }
  }
}

- (void)viewWillLayoutSubviews
{
  if ([(CNContactViewController *)self requiresSetup]) {
    [(CNContactViewController *)self _setupViewController];
  }
  v3.receiver = self;
  v3.super_class = (Class)CNContactViewController;
  [(CNContactViewController *)&v3 viewWillLayoutSubviews];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return ![(CNContactViewController *)self _shouldBeOutOfProcess];
}

- (void)loadView
{
  v11.receiver = self;
  v11.super_class = (Class)CNContactViewController;
  [(CNContactViewController *)&v11 loadView];
  if ([(CNContactViewController *)self forcesTransparentBackground])
  {
    uint64_t v3 = +[CNUIColorRepository transparentBackgroundColor];
LABEL_3:
    objc_super v4 = (void *)v3;
    objc_super v5 = [(CNContactViewController *)self view];
    [v5 setBackgroundColor:v4];
LABEL_6:

    goto LABEL_7;
  }
  id v6 = +[CNContactStyle currentStyle];
  double v7 = [v6 backgroundColor];

  uint64_t v8 = +[CNContactStyle currentStyle];
  objc_super v4 = v8;
  if (v7)
  {
    objc_super v5 = [v8 backgroundColor];
    uint64_t v9 = [(CNContactViewController *)self view];
    [v9 setBackgroundColor:v5];

    goto LABEL_6;
  }
  int v10 = [v8 usesOpaqueBackground];

  if (v10 && [(CNContactViewController *)self _shouldBeOutOfProcess])
  {
    uint64_t v3 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
    goto LABEL_3;
  }
LABEL_7:
  [(CNContactViewController *)self _viewWillBePresented];
}

- (CNContactContentViewController)contentViewController
{
  uint64_t v3 = [(CNContactViewController *)self viewController];

  if (!v3) {
    [(CNContactViewController *)self _prepareViewController];
  }

  return [(CNContactViewController *)self viewController];
}

- (id)confirmCancelAlertControllerAnchoredAtButtonItem:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CNContactViewController *)self contact];
  int v6 = [v5 hasBeenPersisted];
  double v7 = CNContactsUIBundle();
  uint64_t v8 = v7;
  if (v6) {
    uint64_t v9 = @"DISCARD_CHANGES_TITLE_EDIT_CONTACT";
  }
  else {
    uint64_t v9 = @"DISCARD_CHANGES_TITLE_NEW_CONTACT";
  }
  int v10 = [v7 localizedStringForKey:v9 value:&stru_1ED8AC728 table:@"Localized"];

  objc_super v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v10 message:0 preferredStyle:0];
  objc_super v12 = (void *)MEMORY[0x1E4FB1410];
  id v13 = CNContactsUIBundle();
  int v14 = [v13 localizedStringForKey:@"DISCARD_CHANGES_DISCARD_ACTION_TITE" value:&stru_1ED8AC728 table:@"Localized"];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __76__CNContactViewController_confirmCancelAlertControllerAnchoredAtButtonItem___block_invoke;
  v29[3] = &unk_1E549B590;
  v29[4] = self;
  int64_t v15 = [v12 actionWithTitle:v14 style:2 handler:v29];
  [v11 addAction:v15];

  uint64_t v16 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v17 = CNContactsUIBundle();
  BOOL v18 = [v17 localizedStringForKey:@"DISCARD_CHANGES_CANCEL_ACTION_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  objc_super v19 = [v16 actionWithTitle:v18 style:1 handler:0];
  [v11 addAction:v19];

  if (v4)
  {
    id v20 = [v11 popoverPresentationController];
    [v20 setBarButtonItem:v4];
  }
  else
  {
    v21 = [(CNContactViewController *)self view];
    uint64_t v22 = [v11 popoverPresentationController];
    [v22 setSourceView:v21];

    double v23 = *MEMORY[0x1E4F1DB28];
    double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    id v20 = [v11 popoverPresentationController];
    objc_msgSend(v20, "setSourceRect:", v23, v24, v25, v26);
  }

  id v27 = [v11 popoverPresentationController];
  [v27 setPermittedArrowDirections:1];

  return v11;
}

void __76__CNContactViewController_confirmCancelAlertControllerAnchoredAtButtonItem___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) viewController];
  [v1 performConfirmedCancel];
}

- (void)presentConfirmCancelAlertControllerAnchoredAtButtonItem:(id)a3
{
  id v4 = [(CNContactViewController *)self confirmCancelAlertControllerAnchoredAtButtonItem:a3];
  [(CNContactViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)presentCancelConfirmationAlert
{
  id v5 = [(CNContactViewController *)self navigationItemController];
  uint64_t v3 = [v5 navigationItem];
  id v4 = [v3 leftBarButtonItem];
  [(CNContactViewController *)self presentConfirmCancelAlertControllerAnchoredAtButtonItem:v4];
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  if (![(CNContactViewController *)self _shouldBeOutOfProcess])
  {
    id v4 = [(CNContactViewController *)self contentViewController];
    int v5 = [v4 hasPendingChanges];

    int v6 = [(CNContactViewController *)self contentViewController];
    id v7 = v6;
    if (v5) {
      [v6 presentConfirmCancelAlertController];
    }
    else {
      [v6 performConfirmedCancel];
    }
  }
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  if ([(CNContactViewController *)self _shouldBeOutOfProcess])
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    int v5 = [(CNContactViewController *)self contentViewController];
    int v4 = [v5 hasPendingChanges] ^ 1;
  }
  return v4;
}

- (BOOL)isModalInPresentation
{
  if ([(CNContactViewController *)self _shouldBeOutOfProcess])
  {
    uint64_t v3 = [(CNContactViewController *)self viewController];
    char v4 = [v3 isModalInPresentation];
  }
  else
  {
    uint64_t v3 = [(CNContactViewController *)self contentViewController];
    char v4 = [v3 hasPendingChanges];
  }
  BOOL v5 = v4;

  return v5;
}

- (void)setShouldShowSharedProfileBanner:(BOOL)a3
{
  if (self->_shouldShowSharedProfileBanner != a3)
  {
    BOOL v3 = a3;
    self->_shouldShowSharedProfileBanner = a3;
    id v4 = [(CNContactViewController *)self contentViewController];
    [v4 setShouldShowSharedProfileBanner:v3];
  }
}

- (void)setUsesBrandedCallHeaderFormat:(BOOL)a3
{
  if (self->_usesBrandedCallHeaderFormat != a3)
  {
    BOOL v3 = a3;
    self->_usesBrandedCallHeaderFormat = a3;
    id v4 = [(CNContactViewController *)self contentViewController];
    [v4 setUsesBrandedCallHeaderFormat:v3];
  }
}

- (void)setForcesTransparentBackground:(BOOL)a3
{
  if (self->_forcesTransparentBackground != a3)
  {
    BOOL v3 = a3;
    self->_forcesTransparentBackground = a3;
    id v4 = [(CNContactViewController *)self contentViewController];
    [v4 setForcesTransparentBackground:v3];
  }
}

- (void)setShouldUseModernNavigationBarHiding:(BOOL)a3
{
  if (self->_shouldUseModernNavigationBarHiding != a3)
  {
    self->_shouldUseModernNavigationBarHiding = a3;
    id v4 = [(CNContactViewController *)self navigationItem];
    [(CNContactViewController *)self configureNavigationItem:v4];
  }
}

- (void)setShouldDrawNavigationBar:(BOOL)a3
{
  if (self->_shouldDrawNavigationBar != a3)
  {
    self->_shouldDrawNavigationBar = a3;
    id v4 = [(CNContactViewController *)self navigationItem];
    [v4 _setBackgroundHidden:!self->_shouldDrawNavigationBar];
  }
}

- (void)setInitialPrompt:(id)a3
{
  p_initialPrompt = (id *)&self->_initialPrompt;
  id v8 = a3;
  if ((objc_msgSend(*p_initialPrompt, "isEqualToString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_initialPrompt, a3);
    id v6 = *p_initialPrompt;
    id v7 = [(CNContactViewController *)self navigationItem];
    [v7 setPrompt:v6];
  }
}

- (void)setRequiresSetup:(BOOL)a3
{
  if (self->_requiresSetup != a3)
  {
    self->_requiresSetup = a3;
    if ([(CNContactViewController *)self isViewLoaded])
    {
      id v4 = [(CNContactViewController *)self view];
      [v4 setNeedsLayout];
    }
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(CNContactViewController *)self isEditing] != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)CNContactViewController;
    [(CNContactViewController *)&v8 setEditing:v5 animated:v4];
    id v7 = [(CNContactViewController *)self viewController];
    [v7 didChangeToEditMode:v5];
  }
}

- (void)highlightPropertyWithKey:(NSString *)key identifier:(NSString *)identifier
{
}

- (void)highlightPropertyWithKey:(id)a3 identifier:(id)a4 important:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  [(CNContactViewController *)self setHighlightedPropertyKey:a3];
  [(CNContactViewController *)self setHighlightedPropertyIdentifier:v8];

  [(CNContactViewController *)self setHighlightedPropertyImportant:v5];
}

- (BOOL)allowsEditing
{
  return [(CNContactViewController *)self editMode] != 0;
}

- (void)setAllowsEditing:(BOOL)allowsEditing
{
  BOOL v3 = allowsEditing;
  int64_t v5 = [(CNContactViewController *)self editMode];
  if (v3)
  {
    if (v5) {
      return;
    }
    uint64_t v6 = 1;
  }
  else
  {
    if (!v5) {
      return;
    }
    uint64_t v6 = 0;
  }

  [(CNContactViewController *)self setEditMode:v6];
}

- (BOOL)allowsActions
{
  return ([(CNContactViewController *)self actions] & 0xFFFFFFFFFFFFFE5FLL) != 0;
}

- (void)setAllowsActions:(BOOL)allowsActions
{
  if (allowsActions) {
    int64_t v4 = 127;
  }
  else {
    int64_t v4 = [(CNContactViewController *)self actions] & 0x1A0;
  }
  [(CNContactViewController *)self setActions:v4];
  if ([(CNContactViewController *)self hasCompletedSetup])
  {
    [(CNContactViewController *)self setRequiresSetup:1];
  }
}

- (id)_primaryPropertyStringForContact:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CNContactViewController *)self primaryPropertyKey];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F1AEE0]];

  if (v6)
  {
    id v7 = [v4 phoneNumbers];
    id v8 = [v7 objectAtIndexedSubscript:0];

    uint64_t v9 = [v8 value];
    uint64_t v10 = [v9 formattedStringValue];
LABEL_7:
    int v14 = (void *)v10;

    goto LABEL_8;
  }
  objc_super v11 = [(CNContactViewController *)self primaryPropertyKey];
  int v12 = [v11 isEqualToString:*MEMORY[0x1E4F1ADC8]];

  if (v12)
  {
    id v13 = [v4 emailAddresses];
    id v8 = [v13 objectAtIndexedSubscript:0];

    int v14 = [v8 value];
LABEL_8:

    goto LABEL_9;
  }
  int64_t v15 = [(CNContactViewController *)self primaryPropertyKey];
  int v16 = [v15 isEqualToString:*MEMORY[0x1E4F1AF10]];

  if (v16)
  {
    uint64_t v17 = [v4 postalAddresses];
    id v8 = [v17 objectAtIndexedSubscript:0];

    uint64_t v9 = [v8 value];
    uint64_t v10 = [MEMORY[0x1E4F1BA88] stringFromPostalAddress:v9 style:0];
    goto LABEL_7;
  }
  int v14 = 0;
LABEL_9:

  return v14;
}

- (id)_contactPresentedViewController
{
  id v2 = self;
  BOOL v3 = [(CNContactViewController *)v2 delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    int64_t v5 = [(CNContactViewController *)v2 delegate];
    uint64_t v6 = [v5 contactPresentedViewController:v2];

    id v2 = (CNContactViewController *)v6;
  }

  return v2;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  char v4 = [(CNContactViewController *)self observedNavigationItem];
  [v4 removeObserver:self forKeyPath:@"title"];

  [(CNContactViewController *)self setObservedNavigationItem:0];
  [(CNContactContentViewController *)self->_contentViewController setContactDelegate:0];
  v5.receiver = self;
  v5.super_class = (Class)CNContactViewController;
  [(CNContactViewController *)&v5 dealloc];
}

- (CNContactViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[CNContactViewController initWithMode:](self, "initWithMode:", 1, a4);
}

- (CNContactViewController)initWithMode:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CNContactViewController;
  char v4 = [(CNContactViewController *)&v10 initWithNibName:0 bundle:0];
  objc_super v5 = v4;
  if (v4)
  {
    v4->_mode = a3;
    v4->_actions = 127;
    v4->_editMode = 1;
    v4->_allowsDisplayModePickerActions = 1;
    v4->_allowsEditPhoto = 1;
    v4->_forcesTransparentBackground = 0;
    v4->_showsInlineActions = 1;
    v4->_showsSharedProfile = 1;
    v4->_showsGroupMembership = 1;
    uint64_t v6 = objc_alloc_init(CNContactContentNavigationItemUpdater);
    navItemUpdater = v5->_navItemUpdater;
    v5->_navItemUpdater = v6;

    v5->_showContactPhotoPosterCell = 1;
    id v8 = [(CNContactViewController *)v5 navigationItem];
    [(CNContactViewController *)v5 configureNavigationItem:v8];
  }
  return v5;
}

+ (id)viewControllerForEditedDraftContact:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    objc_super v5 = [a1 descriptorForRequiredKeys];
    v11[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v4 assertKeysAreAvailable:v6];

    id v7 = (void *)[objc_alloc((Class)a1) initWithMode:4];
    id v8 = CNContactsUIBundle();
    uint64_t v9 = [v8 localizedStringForKey:@"CREATE_DRAFT_CONTACT_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
    [v7 setTitle:v9];

    [v7 setContact:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)viewControllerForNewDraftContact:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = v4;
    uint64_t v6 = (void *)[v4 copyWithDistinctIdentifier];

    id v7 = [a1 descriptorForRequiredKeys];
    v13[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v6 assertKeysAreAvailable:v8];

    uint64_t v9 = (void *)[objc_alloc((Class)a1) initWithMode:3];
    objc_super v10 = CNContactsUIBundle();
    objc_super v11 = [v10 localizedStringForKey:@"CREATE_DRAFT_CONTACT_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
    [v9 setTitle:v11];

    [v9 setContact:v6];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)viewControllerForUpdatingContact:(id)a3 withPublicAccountIdentity:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [a1 descriptorForRequiredKeys];
    v12[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v7 assertKeysAreAvailable:v9];

    objc_super v10 = (void *)[objc_alloc((Class)a1) initWithMode:4];
    [v10 setContact:v7];

    [v10 setStaticIdentity:v6];
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

+ (id)viewControllerForUpdatingContact:(id)a3 withPropertiesFromContact:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 descriptorForRequiredKeys];
  v14[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v7 assertKeysAreAvailable:v9];

  id v10 = objc_alloc((Class)a1);
  if ([v6 isSuggested]) {
    uint64_t v11 = 5;
  }
  else {
    uint64_t v11 = 4;
  }
  int v12 = (void *)[v10 initWithMode:v11];
  [v12 setContact:v7];

  [v12 setAdditionalContact:v6];

  return v12;
}

+ (CNContactViewController)viewControllerForNewContact:(CNContact *)contact
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = contact;
  objc_super v5 = [a1 descriptorForRequiredKeys];
  v11[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [(CNContact *)v4 assertKeysAreAvailable:v6];

  id v7 = (void *)[objc_alloc((Class)a1) initWithMode:3];
  id v8 = CNContactsUIBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"CREATE_NEW_CONTACT_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
  [v7 setTitle:v9];

  if (!v4) {
    id v4 = (CNContact *)objc_alloc_init(MEMORY[0x1E4F1BA40]);
  }
  [v7 setContact:v4];

  return (CNContactViewController *)v7;
}

+ (CNContactViewController)viewControllerForUnknownContact:(CNContact *)contact
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = contact;
  objc_super v5 = [a1 descriptorForRequiredKeys];
  v13[0] = (uint64_t)v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [(CNContact *)v4 assertKeysAreAvailable:v6];

  if (![(CNContact *)v4 isUnknown]) {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactViewController.m", 120, 3, @"Behavior of CNContactViewController created with viewControllerForUnknownContact: and passing a known contact is undefined. Please use +viewControllerForContact: instead.", v7, v8, v9, v10, v13[0]);
  }
  uint64_t v11 = (void *)[objc_alloc((Class)a1) initWithMode:2];
  [v11 setContact:v4];

  return (CNContactViewController *)v11;
}

+ (CNContactViewController)viewControllerForContact:(CNContact *)contact
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = contact;
  objc_super v5 = [a1 descriptorForRequiredKeys];
  v13[0] = (uint64_t)v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [(CNContact *)v4 assertKeysAreAvailable:v6];

  if ([(CNContact *)v4 isUnknown]) {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactViewController.m", 109, 3, @"Behavior of CNContactViewController created with viewControllerForContact: and passing an unknown contact is undefined. Please use +viewControllerForUnknownContact: instead.", v7, v8, v9, v10, v13[0]);
  }
  uint64_t v11 = (void *)[objc_alloc((Class)a1) initWithMode:1];
  [v11 setContact:v4];

  return (CNContactViewController *)v11;
}

@end