@interface CNContactContentContainerViewController
+ (id)BOOLStateRestorationProperties;
+ (id)descriptorForRequiredKeys;
+ (id)descriptorForRequiredKeysForContact:(id)a3;
+ (id)descriptorForRequiredKeysWithDescription:(id)a3;
+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4;
+ (int64_t)tableViewStyle;
- (BOOL)_canShowWhileLocked;
- (BOOL)allowsActions;
- (BOOL)allowsActionsModel;
- (BOOL)allowsAddToFavorites;
- (BOOL)allowsAddingToAddressBook;
- (BOOL)allowsCardActions;
- (BOOL)allowsConferencing;
- (BOOL)allowsContactBlocking;
- (BOOL)allowsContactBlockingAndReporting;
- (BOOL)allowsDeletion;
- (BOOL)allowsDisplayModePickerActions;
- (BOOL)allowsEditInApp;
- (BOOL)allowsEditPhoto;
- (BOOL)allowsEditing;
- (BOOL)allowsPropertyActions;
- (BOOL)allowsSendMessage;
- (BOOL)allowsSettingLinkedContactsAsPreferred;
- (BOOL)allowsSharing;
- (BOOL)alwaysEditing;
- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 propertyIdentifier:(id)a6;
- (BOOL)didSetFirstResponder;
- (BOOL)didSetNewContact;
- (BOOL)editingChangeRequiresAuthorization;
- (BOOL)editingProposedInformation;
- (BOOL)hasPendingChanges;
- (BOOL)hideCardActions;
- (BOOL)ignoresParentalRestrictions;
- (BOOL)isMailVIP;
- (BOOL)isOutOfProcess;
- (BOOL)isPresentingModalViewController;
- (BOOL)isSuggestedContact;
- (BOOL)isSupressingViewConfigurationUpdates;
- (BOOL)needsReload;
- (BOOL)outOfProcessSetupComplete;
- (BOOL)reloadDataIfNeeded;
- (BOOL)runningPPT;
- (BOOL)saveChanges;
- (BOOL)saveWasAuthorized;
- (BOOL)shouldDrawNavigationBar;
- (BOOL)shouldIgnoreContactStoreDidChangeNotification;
- (BOOL)shouldShowLinkedContacts;
- (BOOL)showContactBlockingFirst;
- (BOOL)showingMeContact;
- (BOOL)supportsDrafts;
- (CGRect)centeredSourceRect:(CGRect)a3 inContactView:(id)a4;
- (CNContactContentContainerViewController)initWithContact:(id)a3;
- (CNContactContentContainerViewController)initWithEnvironment:(id)a3;
- (CNContactContentContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CNContactContentDisplayViewController)displayContactViewController;
- (CNContactContentEditViewController)editContactViewController;
- (CNContactEditAuthorizationManager)editAuthorizationManager;
- (CNContactFormatter)contactFormatter;
- (CNContactViewCache)contactViewCache;
- (CNContactViewControllerPPTDelegate)pptDelegate;
- (CNContactViewHostProtocol)delegate;
- (CNUIContactsEnvironment)environment;
- (CNUIUserActivityManager)activityManager;
- (NSArray)activatedConstraints;
- (NSLayoutConstraint)headerHeightConstraint;
- (UIKeyCommand)cancelCommand;
- (UIKeyCommand)editCommand;
- (UIKeyCommand)saveCommand;
- (id)_removeUnauthorizedKeysFromContact:(id)a3;
- (id)_updateContact:(id)a3 withMissingKeysFromRequiredKeys:(id)a4;
- (id)alternateName;
- (id)cardBottomGroup;
- (id)cardFaceTimeGroup;
- (id)cardFooterGroup;
- (id)cardTopGroup;
- (id)contact;
- (id)contactDelegate;
- (id)contactHeaderView;
- (id)contactStore;
- (id)contactView;
- (id)contactViewConfiguration;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (id)displayGroups;
- (id)displayHeaderView;
- (id)displayedProperties;
- (id)importantMessage;
- (id)initialPrompt;
- (id)linkedPoliciesByContactIdentifier;
- (id)managedConfiguration;
- (id)message;
- (id)missingRequiredKeys;
- (id)navigationItemController;
- (id)originalContacts;
- (id)personHeaderView;
- (id)personHeaderViewController;
- (id)policy;
- (id)presentingDelegate;
- (id)primaryProperty;
- (id)prohibitedPropertyKeys;
- (id)propertyGroups;
- (id)recentsData;
- (id)saveContactExecutor;
- (id)saveLinkedContactsExecutor;
- (id)verifiedInfoMessage;
- (id)warningMessage;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3;
- (int64_t)mode;
- (void)_didCompleteWithContact:(id)a3;
- (void)_refetchContact;
- (void)addActionWithTitle:(id)a3 menuProvider:(id)a4 inGroup:(id)a5 destructive:(BOOL)a6;
- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 inGroup:(id)a6;
- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 inGroup:(id)a6 destructive:(BOOL)a7;
- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 menuProvider:(id)a6 inGroup:(id)a7 destructive:(BOOL)a8;
- (void)applicationLeftForeground:(id)a3;
- (void)applyChangesToNavigationItemFromItem:(id)a3;
- (void)clearMapsDataIfEdited;
- (void)contactDisplayViewController:(id)a3 didChangeToEditMode:(BOOL)a4;
- (void)contactDisplayViewControllerWillDismissFullscreen:(id)a3;
- (void)contactDisplayViewControllerWillPresentFullscreen:(id)a3;
- (void)contactEditViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)contactEditViewControllerWillDismissFullscreen:(id)a3;
- (void)contactEditViewControllerWillPresentFullscreen:(id)a3;
- (void)contactNavigationItemProvider:(id)a3 didUpdateNavigationItem:(id)a4 doneButtonItem:(id)a5;
- (void)createDisplayViewControllerIfNeeded;
- (void)createEditingViewControllerIfNeeded;
- (void)createdNewContact:(id)a3;
- (void)dealloc;
- (void)didChangeToEditMode:(BOOL)a3;
- (void)didUpdateContactViewConfiguration;
- (void)editCancel;
- (void)editCancel:(id)a3;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)favoritesDidChangeWithNotification:(id)a3;
- (void)finishEditing:(id)a3;
- (void)performAuthorizedSetEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)performConfirmedCancel;
- (void)prepareContactDidAppearForPPT;
- (void)presentConfirmCancelAlertController;
- (void)reloadCardGroup:(id)a3 forTableView:(id)a4;
- (void)reloadDataPreservingChanges:(BOOL)a3;
- (void)reloadUnifiedContact;
- (void)removeActionWithTarget:(id)a3 selector:(SEL)a4 inGroup:(id)a5;
- (void)sender:(id)a3 dismissViewController:(id)a4;
- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (void)sender:(id)a3 presentViewController:(id)a4;
- (void)setActivatedConstraints:(id)a3;
- (void)setAllowsActions:(BOOL)a3;
- (void)setAllowsActionsModel:(BOOL)a3;
- (void)setAllowsAddToFavorites:(BOOL)a3;
- (void)setAllowsAddingToAddressBook:(BOOL)a3;
- (void)setAllowsCardActions:(BOOL)a3;
- (void)setAllowsConferencing:(BOOL)a3;
- (void)setAllowsContactBlocking:(BOOL)a3;
- (void)setAllowsContactBlockingAndReporting:(BOOL)a3;
- (void)setAllowsDeletion:(BOOL)a3;
- (void)setAllowsDisplayModePickerActions:(BOOL)a3;
- (void)setAllowsEditInApp:(BOOL)a3;
- (void)setAllowsEditPhoto:(BOOL)a3;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setAllowsPropertyActions:(BOOL)a3;
- (void)setAllowsSendMessage:(BOOL)a3;
- (void)setAllowsSettingLinkedContactsAsPreferred:(BOOL)a3;
- (void)setAllowsSharing:(BOOL)a3;
- (void)setAlternateName:(id)a3;
- (void)setAlwaysEditing:(BOOL)a3;
- (void)setBackgroundColorIfNeededForPresentedViewController:(id)a3;
- (void)setCancelCommand:(id)a3;
- (void)setCancelKeyboardShortcutEnabled:(BOOL)a3;
- (void)setCardFaceTimeGroup:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactDelegate:(id)a3;
- (void)setContactFormatter:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContactViewConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidSetFirstResponder:(BOOL)a3;
- (void)setDidSetNewContact:(BOOL)a3;
- (void)setDisplayContactViewController:(id)a3;
- (void)setDisplayGroups:(id)a3;
- (void)setDisplayedProperties:(id)a3;
- (void)setEditAuthorizationManager:(id)a3;
- (void)setEditCommand:(id)a3;
- (void)setEditContactViewController:(id)a3;
- (void)setEditKeyboardShortcutEnabled:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEditingProposedInformation:(BOOL)a3;
- (void)setHeaderHeightConstraint:(id)a3;
- (void)setHideCardActions:(BOOL)a3;
- (void)setIgnoresParentalRestrictions:(BOOL)a3;
- (void)setImportantMessage:(id)a3;
- (void)setInitialPrompt:(id)a3;
- (void)setIsMailVIP:(BOOL)a3;
- (void)setIsSupressingViewConfigurationUpdates:(BOOL)a3;
- (void)setLinkedPoliciesByContactIdentifier:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMissingRequiredKeys:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setNeedsReload;
- (void)setNeedsReloadLazy;
- (void)setOriginalContacts:(id)a3;
- (void)setOutOfProcessSetupComplete:(BOOL)a3;
- (void)setPersonHeaderView:(id)a3;
- (void)setPersonHeaderViewController:(id)a3;
- (void)setPolicy:(id)a3;
- (void)setPptDelegate:(id)a3;
- (void)setPresentingDelegate:(id)a3;
- (void)setPrimaryProperty:(id)a3;
- (void)setProhibitedPropertyKeys:(id)a3;
- (void)setRecentsData:(id)a3;
- (void)setRunningPPT:(BOOL)a3;
- (void)setSaveCommand:(id)a3;
- (void)setSaveContactExecutor:(id)a3;
- (void)setSaveKeyboardShortcutEnabled:(BOOL)a3;
- (void)setSaveLinkedContactsExecutor:(id)a3;
- (void)setShouldDrawNavigationBar:(BOOL)a3;
- (void)setShouldIgnoreContactStoreDidChangeNotification:(BOOL)a3;
- (void)setShouldShowLinkedContacts:(BOOL)a3;
- (void)setShowContactBlockingFirst:(BOOL)a3;
- (void)setShowingMeContact:(BOOL)a3;
- (void)setSupportsDrafts:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setVerifiedInfoMessage:(id)a3;
- (void)setWarningMessage:(id)a3;
- (void)setupConstraints;
- (void)setupWithOptions:(id)a3 readyBlock:(id)a4;
- (void)toggleEditing;
- (void)toggleEditing:(id)a3;
- (void)updateViewConstraints;
- (void)updateWindowTitleForAppearing:(BOOL)a3;
- (void)updatedExistingContact:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CNContactContentContainerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_contactViewCache, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_cancelCommand, 0);
  objc_storeStrong((id *)&self->_editCommand, 0);
  objc_storeStrong((id *)&self->_saveCommand, 0);
  objc_storeStrong((id *)&self->_headerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_activatedConstraints, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_editAuthorizationManager, 0);
  objc_storeStrong((id *)&self->_editContactViewController, 0);
  objc_storeStrong((id *)&self->_displayContactViewController, 0);
  objc_storeStrong((id *)&self->_displayGroups, 0);
  objc_storeStrong((id *)&self->_propertyGroups, 0);
  objc_storeStrong((id *)&self->_recentsData, 0);
  objc_destroyWeak((id *)&self->_contactDelegate);
  objc_storeStrong((id *)&self->_cardFaceTimeGroup, 0);
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_saveLinkedContactsExecutor, 0);
  objc_storeStrong((id *)&self->_saveContactExecutor, 0);
  objc_storeStrong((id *)&self->_initialPrompt, 0);
  objc_storeStrong((id *)&self->_missingRequireedKeys, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_linkedPoliciesByContactIdentifier, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_originalContacts, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_contactViewConfiguration, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_destroyWeak((id *)&self->_pptDelegate);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_displayedProperties, 0);
}

- (void)setSupportsDrafts:(BOOL)a3
{
  self->_supportsDrafts = a3;
}

- (BOOL)supportsDrafts
{
  return self->_supportsDrafts;
}

- (void)setDidSetNewContact:(BOOL)a3
{
  self->_didSetNewContact = a3;
}

- (BOOL)didSetNewContact
{
  return self->_didSetNewContact;
}

- (void)setRunningPPT:(BOOL)a3
{
  self->_runningPPT = a3;
}

- (BOOL)runningPPT
{
  return self->_runningPPT;
}

- (CNUIUserActivityManager)activityManager
{
  return self->_activityManager;
}

- (CNContactViewCache)contactViewCache
{
  return self->_contactViewCache;
}

- (CNUIContactsEnvironment)environment
{
  return self->_environment;
}

- (void)setCancelCommand:(id)a3
{
}

- (UIKeyCommand)cancelCommand
{
  return self->_cancelCommand;
}

- (void)setEditCommand:(id)a3
{
}

- (UIKeyCommand)editCommand
{
  return self->_editCommand;
}

- (void)setSaveCommand:(id)a3
{
}

- (UIKeyCommand)saveCommand
{
  return self->_saveCommand;
}

- (void)setDidSetFirstResponder:(BOOL)a3
{
  self->_didSetFirstResponder = a3;
}

- (BOOL)didSetFirstResponder
{
  return self->_didSetFirstResponder;
}

- (void)setOutOfProcessSetupComplete:(BOOL)a3
{
  self->_outOfProcessSetupComplete = a3;
}

- (BOOL)outOfProcessSetupComplete
{
  return self->_outOfProcessSetupComplete;
}

- (void)setHeaderHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)headerHeightConstraint
{
  return self->_headerHeightConstraint;
}

- (void)setActivatedConstraints:(id)a3
{
}

- (NSArray)activatedConstraints
{
  return self->_activatedConstraints;
}

- (void)setContactFormatter:(id)a3
{
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setEditAuthorizationManager:(id)a3
{
}

- (CNContactEditAuthorizationManager)editAuthorizationManager
{
  return self->_editAuthorizationManager;
}

- (void)setIsSupressingViewConfigurationUpdates:(BOOL)a3
{
  self->_isSupressingViewConfigurationUpdates = a3;
}

- (BOOL)isSupressingViewConfigurationUpdates
{
  return self->_isSupressingViewConfigurationUpdates;
}

- (void)setEditContactViewController:(id)a3
{
}

- (CNContactContentEditViewController)editContactViewController
{
  return self->_editContactViewController;
}

- (void)setDisplayContactViewController:(id)a3
{
}

- (CNContactContentDisplayViewController)displayContactViewController
{
  return self->_displayContactViewController;
}

- (void)setDisplayGroups:(id)a3
{
}

- (id)displayGroups
{
  return self->_displayGroups;
}

- (id)propertyGroups
{
  return self->_propertyGroups;
}

- (void)setRecentsData:(id)a3
{
}

- (id)recentsData
{
  return self->_recentsData;
}

- (void)setContactDelegate:(id)a3
{
}

- (id)contactDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactDelegate);

  return WeakRetained;
}

- (void)setCardFaceTimeGroup:(id)a3
{
}

- (id)cardFaceTimeGroup
{
  return self->_cardFaceTimeGroup;
}

- (void)setProhibitedPropertyKeys:(id)a3
{
}

- (id)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (void)setShouldIgnoreContactStoreDidChangeNotification:(BOOL)a3
{
  self->_shouldIgnoreContactStoreDidChangeNotification = a3;
}

- (BOOL)shouldIgnoreContactStoreDidChangeNotification
{
  return self->_shouldIgnoreContactStoreDidChangeNotification;
}

- (void)setSaveLinkedContactsExecutor:(id)a3
{
}

- (id)saveLinkedContactsExecutor
{
  return self->_saveLinkedContactsExecutor;
}

- (void)setSaveContactExecutor:(id)a3
{
}

- (id)saveContactExecutor
{
  return self->_saveContactExecutor;
}

- (void)setInitialPrompt:(id)a3
{
}

- (id)initialPrompt
{
  return self->_initialPrompt;
}

- (void)setShouldDrawNavigationBar:(BOOL)a3
{
  self->_shouldDrawNavigationBar = a3;
}

- (BOOL)shouldDrawNavigationBar
{
  return self->_shouldDrawNavigationBar;
}

- (void)setMissingRequiredKeys:(id)a3
{
}

- (id)missingRequiredKeys
{
  return self->_missingRequireedKeys;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (id)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setLinkedPoliciesByContactIdentifier:(id)a3
{
}

- (id)linkedPoliciesByContactIdentifier
{
  return self->_linkedPoliciesByContactIdentifier;
}

- (void)setPolicy:(id)a3
{
}

- (id)policy
{
  return self->_policy;
}

- (void)setAllowsEditInApp:(BOOL)a3
{
  self->_allowsEditInApp = a3;
}

- (BOOL)allowsEditInApp
{
  return self->_allowsEditInApp;
}

- (void)setShowingMeContact:(BOOL)a3
{
  self->_showingMeContact = a3;
}

- (BOOL)showingMeContact
{
  return self->_showingMeContact;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setOriginalContacts:(id)a3
{
}

- (id)contactStore
{
  return self->_contactStore;
}

- (id)contact
{
  return self->_contact;
}

- (void)setContactViewConfiguration:(id)a3
{
}

- (id)contactViewConfiguration
{
  return self->_contactViewConfiguration;
}

- (void)setPresentingDelegate:(id)a3
{
}

- (id)presentingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingDelegate);

  return WeakRetained;
}

- (void)setPptDelegate:(id)a3
{
}

- (CNContactViewControllerPPTDelegate)pptDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pptDelegate);

  return (CNContactViewControllerPPTDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactViewHostProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactViewHostProtocol *)WeakRetained;
}

- (void)applicationLeftForeground:(id)a3
{
  v4 = +[CNUIContactsEnvironment currentEnvironment];
  id v6 = [v4 authorizationContext];

  if ([v6 isFullAccessGranted]
    && [(CNContactContentContainerViewController *)self isEditing]
    && [(CNContactContentContainerViewController *)self hasPendingChanges]
    && [(CNContactContentContainerViewController *)self mode] == 3)
  {
    v5 = [(CNContactContentContainerViewController *)self editContactViewController];
    [v5 saveNewContactDraft];
  }
}

- (void)setEditKeyboardShortcutEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CNContactContentContainerViewController *)self editCommand];

  if (v3)
  {
    if (!v5)
    {
      id v6 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"l" modifierFlags:0x100000 action:sel_toggleEditing_];
      [(CNContactContentContainerViewController *)self setEditCommand:v6];

      v7 = CNContactsUIBundle();
      v8 = [v7 localizedStringForKey:@"EDIT_CONTACT_KEYBOARD_DISCOVERY" value:&stru_1ED8AC728 table:@"Localized"];
      v9 = [(CNContactContentContainerViewController *)self editCommand];
      [v9 setDiscoverabilityTitle:v8];

      id v11 = [(CNContactContentContainerViewController *)self editCommand];
      [(CNContactContentContainerViewController *)self addKeyCommand:v11];
    }
  }
  else if (v5)
  {
    v10 = [(CNContactContentContainerViewController *)self editCommand];
    [(CNContactContentContainerViewController *)self removeKeyCommand:v10];

    [(CNContactContentContainerViewController *)self setEditCommand:0];
  }
}

- (void)setCancelKeyboardShortcutEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CNContactContentContainerViewController *)self cancelCommand];

  if (v3)
  {
    if (!v5)
    {
      id v6 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B08] modifierFlags:0 action:sel_editCancel_];
      [(CNContactContentContainerViewController *)self setCancelCommand:v6];

      id v8 = [(CNContactContentContainerViewController *)self cancelCommand];
      [(CNContactContentContainerViewController *)self addKeyCommand:v8];
    }
  }
  else if (v5)
  {
    v7 = [(CNContactContentContainerViewController *)self cancelCommand];
    [(CNContactContentContainerViewController *)self removeKeyCommand:v7];

    [(CNContactContentContainerViewController *)self setCancelCommand:0];
  }
}

- (void)setSaveKeyboardShortcutEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CNContactContentContainerViewController *)self saveCommand];

  if (v3)
  {
    if (!v5)
    {
      id v6 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"s" modifierFlags:0x100000 action:sel_toggleEditing_];
      [(CNContactContentContainerViewController *)self setSaveCommand:v6];

      v7 = CNContactsUIBundle();
      id v8 = [v7 localizedStringForKey:@"SAVE_CONTACT_KEYBOARD_DISCOVERY" value:&stru_1ED8AC728 table:@"Localized"];
      v9 = [(CNContactContentContainerViewController *)self saveCommand];
      [v9 setDiscoverabilityTitle:v8];

      id v11 = [(CNContactContentContainerViewController *)self saveCommand];
      [(CNContactContentContainerViewController *)self addKeyCommand:v11];
    }
  }
  else if (v5)
  {
    v10 = [(CNContactContentContainerViewController *)self saveCommand];
    [(CNContactContentContainerViewController *)self removeKeyCommand:v10];

    [(CNContactContentContainerViewController *)self setSaveCommand:0];
  }
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNContactContentContainerViewController;
  [(CNContactContentContainerViewController *)&v18 encodeRestorableStateWithCoder:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = +[CNContactContentContainerViewController BOOLStateRestorationProperties];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [(CNContactContentContainerViewController *)self valueForKey:v10];
        if (v11) {
          [v4 encodeObject:v11 forKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }

  v12 = [(CNContactContentContainerViewController *)self contact];
  v13 = [v12 identifier];

  if (v13) {
    [v4 encodeObject:v13 forKey:@"Identifier"];
  }
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    v5 = [(CNContactContentContainerViewController *)self displayContactViewController];
    [v5 setMode:a3];

    editContactViewController = self->_editContactViewController;
    if (editContactViewController)
    {
      [(CNContactContentEditViewController *)editContactViewController setMode:a3];
    }
  }
}

- (void)reloadUnifiedContact
{
  BOOL v3 = [(CNContactContentContainerViewController *)self contact];
  id v4 = objc_opt_class();

  v5 = [(CNContactContentContainerViewController *)self contact];
  id v8 = [v5 linkedContacts];

  uint64_t v6 = v8;
  if (v8)
  {
    uint64_t v7 = [v4 unifyContacts:v8];
    [(CNContactContentContainerViewController *)self setContact:v7];

    uint64_t v6 = v8;
  }
}

- (void)updatedExistingContact:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(CNContactContentContainerViewController *)self contact];
  }
  uint64_t v6 = v5;
  [(CNContactContentContainerViewController *)self setContact:v5];
  [(CNContactContentContainerViewController *)self _didCompleteWithContact:v6];
}

- (void)createdNewContact:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    [(CNContactContentContainerViewController *)self setPrimaryProperty:0];
    [(CNContactContentContainerViewController *)self setContact:v6];
    [(CNContactContentContainerViewController *)self setMode:1];
    id v4 = [(CNContactContentContainerViewController *)self displayContactViewController];
    [v4 setMode:1];

    id v5 = [(CNContactContentContainerViewController *)self displayContactViewController];
    [v5 setNeedsReload];

    [(CNContactContentContainerViewController *)self setIsSupressingViewConfigurationUpdates:1];
    [(CNContactContentContainerViewController *)self setAllowsEditing:1];
    [(CNContactContentContainerViewController *)self setAllowsAddingToAddressBook:0];
    [(CNContactContentContainerViewController *)self setAllowsAddToFavorites:1];
    [(CNContactContentContainerViewController *)self setIsSupressingViewConfigurationUpdates:0];
    [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
  }
  [(CNContactContentContainerViewController *)self _didCompleteWithContact:v6];
}

- (void)_didCompleteWithContact:(id)a3
{
  id v10 = a3;
  id v4 = [(CNContactContentContainerViewController *)self contactDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNContactContentContainerViewController *)self contactDelegate];
    [v6 contactViewController:self didCompleteWithContact:v10];
  }
  id v7 = [(CNContactContentContainerViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(CNContactContentContainerViewController *)self delegate];
    [v9 didCompleteWithContact:v10];
  }
}

- (id)_removeUnauthorizedKeysFromContact:(id)a3
{
  id v4 = a3;
  char v5 = [(CNContactContentContainerViewController *)self missingRequiredKeys];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = (void *)[v4 mutableCopy];
    char v8 = [(CNContactContentContainerViewController *)self missingRequiredKeys];
    [v7 removeKeys:v8];

    [v7 setFrozenSelfAsSnapshot];
    id v4 = v7;
  }

  return v4;
}

- (id)_updateContact:(id)a3 withMissingKeysFromRequiredKeys:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 areKeysAvailable:v7 useIgnorableKeys:0 findMissingKeys:1];
  v9 = [v8 first];
  int v10 = [v9 BOOLValue];

  if (v10)
  {
    id v11 = v6;
  }
  else
  {
    v12 = [v8 second];
    [(CNContactContentContainerViewController *)self setMissingRequiredKeys:v12];

    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__2393;
    v28 = __Block_byref_object_dispose__2394;
    id v29 = 0;
    id v13 = objc_alloc(MEMORY[0x1E4F1B908]);
    long long v14 = [(CNContactContentContainerViewController *)self missingRequiredKeys];
    long long v15 = (void *)[v13 initWithKeysToFetch:v14];

    long long v16 = (void *)MEMORY[0x1E4F1B8F8];
    long long v17 = [v6 identifier];
    v30[0] = v17;
    objc_super v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    v19 = [v16 predicateForContactsWithIdentifiers:v18];
    [v15 setPredicate:v19];

    objc_msgSend(v15, "setUnifyResults:", objc_msgSend(v6, "isUnified"));
    uint64_t v20 = [(CNContactContentContainerViewController *)self contactStore];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __90__CNContactContentContainerViewController__updateContact_withMissingKeysFromRequiredKeys___block_invoke;
    v23[3] = &unk_1E549B878;
    v23[4] = &v24;
    [v20 enumerateContactsWithFetchRequest:v15 error:0 usingBlock:v23];

    v21 = (void *)[v6 mutableCopy];
    [v21 overwriteStateFromContact:v25[5]];
    id v11 = [v21 freeze];

    _Block_object_dispose(&v24, 8);
  }

  return v11;
}

void __90__CNContactContentContainerViewController__updateContact_withMissingKeysFromRequiredKeys___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (BOOL)needsReload
{
  return self->_needsReload;
}

- (BOOL)reloadDataIfNeeded
{
  if (!self->_needsReload || self->_animating) {
    return 0;
  }
  [(CNContactContentContainerViewController *)self reloadDataPreservingChanges:0];
  return 1;
}

- (void)setNeedsReloadLazy
{
  self->_needsReload = 1;
}

- (void)setNeedsReload
{
  self->_needsReload = 1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CNContactContentContainerViewController_setNeedsReload__block_invoke;
  block[3] = &unk_1E549B488;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __57__CNContactContentContainerViewController_setNeedsReload__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadDataIfNeeded];
}

- (BOOL)isSuggestedContact
{
  v2 = [(CNContactContentContainerViewController *)self contact];
  char v3 = [v2 isSuggested];

  return v3;
}

- (void)contactEditViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    char v5 = [(CNContactContentContainerViewController *)self displayContactViewController];
    [v5 setContact:v6];
  }
  [(CNContactContentContainerViewController *)self setEditing:0];
  [(CNContactContentContainerViewController *)self _didCompleteWithContact:v6];
}

- (void)contactEditViewControllerWillDismissFullscreen:(id)a3
{
  if ([(CNContactContentContainerViewController *)self isEditing])
  {
    id v4 = [(CNContactContentContainerViewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(CNContactContentContainerViewController *)self delegate];
      [v6 isPresentingFullscreen:0];
    }
  }
}

- (void)contactEditViewControllerWillPresentFullscreen:(id)a3
{
  if ([(CNContactContentContainerViewController *)self isEditing])
  {
    id v4 = [(CNContactContentContainerViewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(CNContactContentContainerViewController *)self delegate];
      [v6 isPresentingFullscreen:1];
    }
  }
}

- (void)contactDisplayViewController:(id)a3 didChangeToEditMode:(BOOL)a4
{
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 propertyIdentifier:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = [(CNContactContentContainerViewController *)self contactDelegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    long long v14 = [(CNContactContentContainerViewController *)self contactDelegate];
    char v15 = [v14 contactViewController:self shouldPerformDefaultActionForContact:v9 propertyKey:v10 propertyIdentifier:v11];
  }
  else
  {
    char v15 = 1;
  }
  long long v16 = [(CNContactContentContainerViewController *)self delegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    uint64_t v18 = [(CNContactContentContainerViewController *)self _removeUnauthorizedKeysFromContact:v9];

    v19 = [(CNContactContentContainerViewController *)self delegate];
    char v15 = [v19 shouldPerformDefaultActionForContact:v18 propertyKey:v10 propertyIdentifier:v11];

    id v9 = (id)v18;
  }

  return v15;
}

- (void)contactDisplayViewControllerWillDismissFullscreen:(id)a3
{
  if (([(CNContactContentContainerViewController *)self isEditing] & 1) == 0)
  {
    id v4 = [(CNContactContentContainerViewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(CNContactContentContainerViewController *)self delegate];
      [v6 isPresentingFullscreen:0];
    }
  }
}

- (void)contactDisplayViewControllerWillPresentFullscreen:(id)a3
{
  if (([(CNContactContentContainerViewController *)self isEditing] & 1) == 0)
  {
    id v4 = [(CNContactContentContainerViewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(CNContactContentContainerViewController *)self delegate];
      [v6 isPresentingFullscreen:1];
    }
  }
}

- (BOOL)isPresentingModalViewController
{
  v2 = [(CNContactContentContainerViewController *)self presentedViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__CNContactContentContainerViewController_sender_dismissViewController_completionHandler___block_invoke;
  v9[3] = &unk_1E549B710;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  [a4 dismissViewControllerAnimated:1 completion:v9];
}

uint64_t __90__CNContactContentContainerViewController_sender_dismissViewController_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[1322])
  {
    [v2 _endDisablingInterfaceAutorotation];
    *(unsigned char *)(*(void *)(a1 + 32) + 1322) = 0;
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)sender:(id)a3 dismissViewController:(id)a4
{
}

- (void)setBackgroundColorIfNeededForPresentedViewController:(id)a3
{
  id v20 = a3;
  id v4 = +[CNContactStyle currentStyle];
  char v5 = [v4 backgroundColor];
  if (v5)
  {
    id v6 = +[CNContactStyle currentStyle];
    id v7 = [v6 backgroundColor];
    id v8 = [MEMORY[0x1E4FB1618] clearColor];
    char v9 = [v7 isEqual:v8];

    char v10 = v9 ^ 1;
  }
  else
  {
    char v10 = 1;
  }

  id v11 = [(CNContactContentContainerViewController *)self view];
  v12 = [v11 superview];
  char v13 = [v12 backgroundColor];
  long long v14 = [MEMORY[0x1E4FB1618] clearColor];
  char v15 = [v13 isEqual:v14];

  if ((v10 & 1) == 0 && (v15 & 1) == 0)
  {
    long long v16 = [(CNContactContentContainerViewController *)self view];
    char v17 = [v16 superview];
    uint64_t v18 = [v17 backgroundColor];
    v19 = [v20 view];
    [v19 setBackgroundColor:v18];
  }
}

- (void)performConfirmedCancel
{
  id v2 = [(CNContactContentContainerViewController *)self editContactViewController];
  [v2 performConfirmedCancel];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  BOOL v3 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", a3);
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && CNUIIsDDActionsService()) {
    return -1;
  }
  else {
    return -2;
  }
}

- (CGRect)centeredSourceRect:(CGRect)a3 inContactView:(id)a4
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  if (([(CNContactContentContainerViewController *)self isEditing] & 1) == 0)
  {
    [v9 layoutMargins];
    double v11 = v10;
    [v9 layoutMargins];
    double width = width - (v11 + v12);
    [v9 layoutMargins];
    double v14 = v13;
    char v15 = +[CNContactStyle currentStyle];
    [v15 sectionContentInset];
    double x = x + v14 - v16;
  }
  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.double width = v19;
  result.origin.CGFloat y = v18;
  result.origin.double x = v17;
  return result;
}

- (void)sender:(id)a3 presentViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[CNContactStyle currentStyle];
  objc_msgSend(v7, "setModalTransitionStyle:", objc_msgSend(v8, "modalTransitionStyle"));

  objc_opt_class();
  id v29 = v6;
  if (objc_opt_isKindOfClass()) {
    id v9 = v29;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if ([(CNContactContentContainerViewController *)self isEditing]) {
    [(CNContactContentContainerViewController *)self displayContactViewController];
  }
  else {
  double v11 = [(CNContactContentContainerViewController *)self editContactViewController];
  }
  double v12 = [v11 contactView];

  double v13 = [v7 popoverPresentationController];
  [v13 setSourceView:v10];

  [v10 bounds];
  -[CNContactContentContainerViewController centeredSourceRect:inContactView:](self, "centeredSourceRect:inContactView:", v12);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = [v7 popoverPresentationController];
  objc_msgSend(v22, "setSourceRect:", v15, v17, v19, v21);

  v23 = [v7 popoverPresentationController];
  [v23 setPermittedArrowDirections:15];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v24 = [v7 presentationController];
    [v24 setDelegate:self];
  }
  if (!self->_disablingRotation)
  {
    v25 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v25 userInterfaceIdiom])
    {
LABEL_14:

      goto LABEL_15;
    }
    uint64_t v26 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v26 _referenceBounds];
    if (CGRectGetHeight(v31) <= 667.0 || [v7 modalPresentationStyle])
    {

      goto LABEL_14;
    }
    uint64_t v27 = [v7 supportedInterfaceOrientations];
    uint64_t v28 = [(CNContactContentContainerViewController *)self supportedInterfaceOrientations];

    if (v27 != v28)
    {
      [(CNContactContentContainerViewController *)self _beginDisablingInterfaceAutorotation];
      self->_disablingRotation = 1;
    }
  }
LABEL_15:
  [(CNContactContentContainerViewController *)self setBackgroundColorIfNeededForPresentedViewController:v7];
  [(CNContactContentContainerViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)didChangeToEditMode:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CNContactContentContainerViewController *)self isEditing] != a3)
  {
    [(CNContactContentContainerViewController *)self setEditing:v3 animated:0];
  }
}

- (void)didUpdateContactViewConfiguration
{
  if (![(CNContactContentContainerViewController *)self isSupressingViewConfigurationUpdates])
  {
    BOOL v3 = [(CNContactContentContainerViewController *)self displayContactViewController];
    [v3 contactViewConfigurationDidUpdate];

    if (self->_editContactViewController)
    {
      id v4 = [(CNContactContentContainerViewController *)self editContactViewController];
      [v4 contactViewConfigurationDidUpdate];
    }
  }
}

- (void)setupWithOptions:(id)a3 readyBlock:(id)a4
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CNUILogContactCard();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_debug_impl(&dword_18B625000, v8, OS_LOG_TYPE_DEBUG, "setupWithOptions: %@", (uint8_t *)&buf, 0xCu);
  }

  id v9 = [v6 objectForKeyedSubscript:@"Properties"];
  [(CNContactContentContainerViewController *)self setIsSupressingViewConfigurationUpdates:1];
  if ([(CNContactContentContainerViewController *)self isOutOfProcess])
  {
    [(CNContactContentContainerViewController *)self setOutOfProcessSetupComplete:0];
    if ([MEMORY[0x1E4F1B8F8] suggestionsEnabled]) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = 1;
    }
    double v11 = [(CNContactContentContainerViewController *)self managedConfiguration];

    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F1B980]);
      double v13 = [(CNContactContentContainerViewController *)self environment];
      double v14 = [v13 cnEnvironment];
      double v15 = [(CNContactContentContainerViewController *)self managedConfiguration];
      double v16 = (void *)[v12 initWithEnvironment:v14 options:v10 managedConfiguration:v15];
      [(CNContactContentContainerViewController *)self setContactStore:v16];
    }
    else
    {
      double v13 = [MEMORY[0x1E4F1B980] storeWithOptions:v10];
      [(CNContactContentContainerViewController *)self setContactStore:v13];
    }
  }
  double v17 = objc_msgSend(v9, "objectForKeyedSubscript:", @"runningPPT", v7);
  -[CNContactContentContainerViewController setRunningPPT:](self, "setRunningPPT:", [v17 BOOLValue]);

  double v18 = [v9 objectForKeyedSubscript:@"showingMeContact"];
  -[CNContactContentContainerViewController setShowingMeContact:](self, "setShowingMeContact:", [v18 BOOLValue]);

  double v19 = [v6 objectForKeyedSubscript:@"ignoresParentalRestrictions"];
  uint64_t v20 = [v19 BOOLValue];
  double v21 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v21 setIgnoresParentalRestrictions:v20];

  v54 = v6;
  v22 = [v6 objectForKeyedSubscript:@"prohibitedPropertyKeys"];
  v23 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v23 setProhibitedPropertyKeys:v22];

  uint64_t v24 = [v9 objectForKeyedSubscript:@"warningMessage"];
  v25 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v25 setWarningMessage:v24];

  long long v61 = 0u;
  long long v62 = 0u;
  *(void *)&long long buf = @"allowsDeletion";
  *((void *)&buf + 1) = @"allowsCardActions";
  v66 = @"alwaysEditing";
  v67 = @"personHeaderView";
  v68 = @"allowsActions";
  v69 = @"verifiedInfoMessage";
  v70 = @"allowsEditInApp";
  v71 = @"shouldShowLinkedContacts";
  long long v59 = 0u;
  long long v60 = 0u;
  v72 = @"parentContainer";
  v73 = @"allowsDisplayModePickerActions";
  v74 = @"allowsAddToFavorites";
  v75 = @"ignoresParentalRestrictions";
  v76 = @"primaryProperty";
  v77 = @"allowsAddingToAddressBook";
  v78 = @"alternateName";
  v79 = @"allowsEditPhoto";
  v80 = @"allowsNamePicking";
  v81 = @"showsInlineActions";
  v82 = @"showsSharedProfile";
  v83 = @"showsGroupMembership";
  v84 = @"displayedProperties";
  v85 = @"editingProposedInformation";
  v86 = @"allowsContactBlocking";
  v87 = @"allowsContactBlockingAndReporting";
  v88 = @"allowsSharing";
  v89 = @"highlightedProperties";
  v90 = @"highlightedPropertyImportant";
  v91 = @"allowsConferencing";
  v92 = @"importantMessage";
  v93 = @"allowsEditing";
  v94 = @"personHeaderViewController";
  v95 = @"personHeaderViewDelegate";
  v96 = @"shouldDrawNavigationBar";
  v97 = @"message";
  v98 = @"layoutPositionallyAfterNavBar";
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&buf count:35];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v60 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v59 + 1) + 8 * i);
        v32 = [v9 objectForKeyedSubscript:v31];
        if (v32)
        {
          v33 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
          [v33 setValue:v32 forKey:v31];
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v59 objects:v64 count:16];
    }
    while (v28);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  *(void *)&long long buf = @"mode";
  *((void *)&buf + 1) = @"parentGroup";
  v66 = @"originalContacts";
  v67 = @"recentsData";
  v68 = @"showingMeContact";
  v69 = @"runningPPT";
  v70 = @"contact";
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&buf count:7];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v56 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = *(void *)(*((void *)&v55 + 1) + 8 * j);
        v40 = [v9 objectForKeyedSubscript:v39];
        if (v40) {
          [(CNContactContentContainerViewController *)self setValue:v40 forKey:v39];
        }
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v36);
  }

  v41 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  if ([v41 alwaysEditing])
  {

    v42 = v53;
  }
  else
  {
    v43 = [v9 objectForKeyedSubscript:@"isEditing"];
    int v44 = [v43 BOOLValue];

    v42 = v53;
    if (!v44) {
      goto LABEL_33;
    }
  }
  [(CNContactContentContainerViewController *)self createEditingViewControllerIfNeeded];
  [(CNContactContentContainerViewController *)self setEditing:1 animated:0];
LABEL_33:
  v45 = [CNContactEditAuthorizationManager alloc];
  v46 = [(CNContactContentContainerViewController *)self contact];
  v47 = [(CNContactContentContainerViewController *)self contactStore];
  v48 = [(CNContactEditAuthorizationManager *)v45 initWithContact:v46 contactStore:v47];
  [(CNContactContentContainerViewController *)self setEditAuthorizationManager:v48];

  v49 = [(CNContactContentContainerViewController *)self editAuthorizationManager];
  v50 = [(CNContactContentContainerViewController *)self displayContactViewController];
  [v50 setEditAuthorizationManager:v49];

  [(CNContactContentContainerViewController *)self setIsSupressingViewConfigurationUpdates:0];
  v51 = [(CNContactContentContainerViewController *)self displayContactViewController];
  [v51 contactViewConfigurationDidUpdate];

  if (self->_editContactViewController)
  {
    v52 = [(CNContactContentContainerViewController *)self editContactViewController];
    [v52 contactViewConfigurationDidUpdate];
  }
  if ([(CNContactContentContainerViewController *)self isOutOfProcess]) {
    [(CNContactContentContainerViewController *)self setOutOfProcessSetupComplete:1];
  }
  if (v42) {
    v42[2](v42, 0);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNContactContentContainerViewController;
  [(CNContactContentContainerViewController *)&v4 viewWillDisappear:a3];
  [(CNContactContentContainerViewController *)self updateWindowTitleForAppearing:0];
}

- (void)prepareContactDidAppearForPPT
{
  if ([(CNContactContentContainerViewController *)self runningPPT])
  {
    objc_initWeak(&location, self);
    BOOL v3 = (void *)*MEMORY[0x1E4FB2608];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __72__CNContactContentContainerViewController_prepareContactDidAppearForPPT__block_invoke;
    v4[3] = &unk_1E549B600;
    objc_copyWeak(&v5, &location);
    [v3 installCACommitCompletionBlock:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __72__CNContactContentContainerViewController_prepareContactDidAppearForPPT__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained pptDelegate];
  [v1 viewDidAppearForContactViewController:WeakRetained];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNContactContentContainerViewController;
  [(CNContactContentContainerViewController *)&v4 viewDidAppear:a3];
  if (self->_needsRefetch)
  {
    [(CNContactContentContainerViewController *)self _refetchContact];
    self->_needsRefetch = 0;
  }
  if (![(CNContactContentContainerViewController *)self alwaysEditing]) {
    [(CNContactContentContainerViewController *)self becomeFirstResponder];
  }
  [(CNContactContentContainerViewController *)self updateWindowTitleForAppearing:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactContentContainerViewController;
  [(CNContactContentContainerViewController *)&v3 viewWillAppear:a3];
}

- (void)updateViewConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactContentContainerViewController;
  [(CNContactContentContainerViewController *)&v3 updateViewConstraints];
  [(CNContactContentContainerViewController *)self setupConstraints];
}

- (void)setupConstraints
{
  objc_super v3 = (void *)MEMORY[0x1E4F28DC8];
  objc_super v4 = [(CNContactContentContainerViewController *)self activatedConstraints];
  [v3 deactivateConstraints:v4];

  id v61 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [(CNContactContentContainerViewController *)self displayContactViewController];
  id v6 = [v5 view];
  id v7 = [v6 superview];
  id v8 = [(CNContactContentContainerViewController *)self view];

  if (v7 == v8)
  {
    id v9 = [(CNContactContentContainerViewController *)self view];
    uint64_t v10 = [v9 leadingAnchor];
    double v11 = [(CNContactContentContainerViewController *)self displayContactViewController];
    id v12 = [v11 view];
    double v13 = [v12 leadingAnchor];
    double v14 = [v10 constraintEqualToAnchor:v13];
    [v61 addObject:v14];

    double v15 = [(CNContactContentContainerViewController *)self view];
    double v16 = [v15 trailingAnchor];
    double v17 = [(CNContactContentContainerViewController *)self displayContactViewController];
    double v18 = [v17 view];
    double v19 = [v18 trailingAnchor];
    uint64_t v20 = [v16 constraintEqualToAnchor:v19];
    [v61 addObject:v20];

    double v21 = [(CNContactContentContainerViewController *)self view];
    v22 = [v21 topAnchor];
    v23 = [(CNContactContentContainerViewController *)self displayContactViewController];
    uint64_t v24 = [v23 view];
    v25 = [v24 topAnchor];
    uint64_t v26 = [v22 constraintEqualToAnchor:v25];
    [v61 addObject:v26];

    uint64_t v27 = [(CNContactContentContainerViewController *)self view];
    uint64_t v28 = [v27 bottomAnchor];
    uint64_t v29 = [(CNContactContentContainerViewController *)self displayContactViewController];
    v30 = [v29 view];
    uint64_t v31 = [v30 bottomAnchor];
    v32 = [v28 constraintEqualToAnchor:v31];
    [v61 addObject:v32];
  }
  if (self->_editContactViewController)
  {
    v33 = [(CNContactContentContainerViewController *)self editContactViewController];
    v34 = [v33 view];
    uint64_t v35 = [v34 superview];
    uint64_t v36 = [(CNContactContentContainerViewController *)self view];

    if (v35 == v36)
    {
      uint64_t v37 = [(CNContactContentContainerViewController *)self view];
      v38 = [v37 leadingAnchor];
      uint64_t v39 = [(CNContactContentContainerViewController *)self editContactViewController];
      v40 = [v39 view];
      v41 = [v40 leadingAnchor];
      v42 = [v38 constraintEqualToAnchor:v41];
      [v61 addObject:v42];

      v43 = [(CNContactContentContainerViewController *)self view];
      int v44 = [v43 trailingAnchor];
      v45 = [(CNContactContentContainerViewController *)self editContactViewController];
      v46 = [v45 view];
      v47 = [v46 trailingAnchor];
      v48 = [v44 constraintEqualToAnchor:v47];
      [v61 addObject:v48];

      v49 = [(CNContactContentContainerViewController *)self view];
      v50 = [v49 topAnchor];
      v51 = [(CNContactContentContainerViewController *)self editContactViewController];
      v52 = [v51 view];
      v53 = [v52 topAnchor];
      v54 = [v50 constraintEqualToAnchor:v53];
      [v61 addObject:v54];

      long long v55 = [(CNContactContentContainerViewController *)self view];
      long long v56 = [v55 bottomAnchor];
      long long v57 = [(CNContactContentContainerViewController *)self editContactViewController];
      long long v58 = [v57 view];
      long long v59 = [v58 bottomAnchor];
      long long v60 = [v56 constraintEqualToAnchor:v59];
      [v61 addObject:v60];
    }
  }
  [(CNContactContentContainerViewController *)self setActivatedConstraints:v61];
  [MEMORY[0x1E4F28DC8] activateConstraints:v61];
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)CNContactContentContainerViewController;
  [(CNContactContentContainerViewController *)&v16 viewDidLoad];
  uint64_t v3 = *MEMORY[0x1E4F5A298];
  objc_super v4 = [(CNContactContentContainerViewController *)self initialPrompt];
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if ((v3 & 1) == 0)
  {
    id v5 = [(CNContactContentContainerViewController *)self initialPrompt];
    id v6 = [(CNContactContentContainerViewController *)self navigationItem];
    [v6 setPrompt:v5];
  }
  if ([(CNContactContentContainerViewController *)self shouldDrawNavigationBar])
  {
    id v7 = [(CNContactContentContainerViewController *)self navigationItem];
    [v7 _setBackgroundHidden:0];
  }
  [(CNContactContentContainerViewController *)self reloadDataIfNeeded];
  [(CNContactContentContainerViewController *)self createDisplayViewControllerIfNeeded];
  id v8 = [(CNContactContentContainerViewController *)self displayContactViewController];
  [(CNContactContentContainerViewController *)self addChildViewController:v8];

  id v9 = [(CNContactContentContainerViewController *)self view];
  uint64_t v10 = [(CNContactContentContainerViewController *)self displayContactViewController];
  double v11 = [v10 view];
  [v9 addSubview:v11];

  id v12 = [(CNContactContentContainerViewController *)self displayContactViewController];
  double v13 = [v12 view];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v14 = [(CNContactContentContainerViewController *)self displayContactViewController];
  [v14 didMoveToParentViewController:self];

  double v15 = [(CNContactContentContainerViewController *)self view];
  [v15 setNeedsUpdateConstraints];
}

- (BOOL)saveChanges
{
  if ([(CNContactContentContainerViewController *)self isEditing]) {
    [(CNContactContentContainerViewController *)self editContactViewController];
  }
  else {
  uint64_t v3 = [(CNContactContentContainerViewController *)self displayContactViewController];
  }
  char v4 = [v3 saveChanges];

  return v4;
}

- (void)clearMapsDataIfEdited
{
}

- (void)performAuthorizedSetEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = CNUILogContactCard();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18B625000, v7, OS_LOG_TYPE_DEFAULT, "[CNContactContentViewController] Entering Edit Mode", buf, 2u);
    }

    [(CNContactContentContainerViewController *)self createEditingViewControllerIfNeeded];
    if ([(CNContactContentContainerViewController *)self didSetNewContact])
    {
      [(CNContactContentContainerViewController *)self setDidSetNewContact:0];
      id v9 = [(CNContactContentContainerViewController *)self editContactViewController];
      uint64_t v10 = [(CNContactContentContainerViewController *)self contact];
      [v9 setContact:v10];

      double v11 = [(CNContactContentContainerViewController *)self editContactViewController];
      [v11 contactViewConfigurationDidUpdate];
    }
    id v12 = [(CNContactContentContainerViewController *)self displayContactViewController];
    double v13 = [v12 view];

    double v14 = [(CNContactContentContainerViewController *)self editContactViewController];
    double v15 = [v14 view];

    uint64_t v16 = [(CNContactContentContainerViewController *)self editContactViewController];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18B625000, v7, OS_LOG_TYPE_DEFAULT, "[CNContactContentViewController] Leaving Edit Mode", buf, 2u);
    }

    double v17 = [(CNContactContentContainerViewController *)self editContactViewController];
    double v13 = [v17 view];

    double v18 = [(CNContactContentContainerViewController *)self displayContactViewController];
    double v15 = [v18 view];

    uint64_t v16 = [(CNContactContentContainerViewController *)self displayContactViewController];
  }
  double v19 = (void *)v16;
  uint64_t v20 = [v15 superview];
  double v21 = [(CNContactContentContainerViewController *)self view];

  if (v20 != v21)
  {
    v22 = [(CNContactContentContainerViewController *)self editContactViewController];
    v23 = [v22 view];

    if (v15 == v23)
    {
      v25 = [(CNContactContentContainerViewController *)self editContactViewController];
      [(CNContactContentContainerViewController *)self addChildViewController:v25];

      uint64_t v26 = [(CNContactContentContainerViewController *)self view];
      uint64_t v27 = [(CNContactContentContainerViewController *)self editContactViewController];
      uint64_t v28 = [v27 view];
      [v26 addSubview:v28];

      uint64_t v29 = [(CNContactContentContainerViewController *)self editContactViewController];
      v30 = [v29 view];
      [v30 setTranslatesAutoresizingMaskIntoConstraints:0];

      uint64_t v24 = [(CNContactContentContainerViewController *)self editContactViewController];
      [v24 didMoveToParentViewController:self];
    }
    else
    {
      uint64_t v24 = [(CNContactContentContainerViewController *)self view];
      [v24 addSubview:v15];
    }

    uint64_t v31 = [(CNContactContentContainerViewController *)self view];
    [v31 setNeedsUpdateConstraints];
  }
  v32 = [v19 effectiveNavigationItem];
  v33 = [v19 doneButtonItem];
  [(CNContactContentContainerViewController *)self contactNavigationItemProvider:v19 didUpdateNavigationItem:v32 doneButtonItem:v33];

  v34 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v35 = [(CNContactContentContainerViewController *)self view];
  if (v4) {
    double v36 = 0.25;
  }
  else {
    double v36 = 0.0;
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __80__CNContactContentContainerViewController_performAuthorizedSetEditing_animated___block_invoke;
  v42[3] = &unk_1E549B800;
  id v37 = v13;
  id v43 = v37;
  id v38 = v15;
  id v44 = v38;
  v45 = self;
  [v34 transitionWithView:v35 duration:5242880 options:v42 animations:0 completion:v36];

  uint64_t v39 = [(CNContactContentContainerViewController *)self contactDelegate];
  char v40 = objc_opt_respondsToSelector();

  if (v40)
  {
    v41 = [(CNContactContentContainerViewController *)self contactDelegate];
    [v41 contactViewController:self didChangeToEditMode:v5];
  }
}

uint64_t __80__CNContactContentContainerViewController_performAuthorizedSetEditing_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  [*(id *)(a1 + 40) setAlpha:1.0];
  id v2 = *(void **)(a1 + 48);

  return [v2 setupConstraints];
}

- (BOOL)editingChangeRequiresAuthorization
{
  if ([(CNContactContentContainerViewController *)self isEditing]) {
    return 0;
  }
  BOOL v4 = [(CNContactContentContainerViewController *)self editAuthorizationManager];
  char v5 = [v4 shouldPromptForPasscodeAuthorization];

  return v5;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(CNContactContentContainerViewController *)self isEditing] != a3)
  {
    if ([(CNContactContentContainerViewController *)self editingChangeRequiresAuthorization])
    {
      objc_initWeak(&location, self);
      id v7 = [(CNContactContentContainerViewController *)self editAuthorizationManager];
      BOOL v8 = [(CNContactContentContainerViewController *)self navigationItem];
      id v9 = [v8 rightBarButtonItem];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __63__CNContactContentContainerViewController_setEditing_animated___block_invoke;
      v11[3] = &unk_1E5496B60;
      objc_copyWeak(&v12, &location);
      BOOL v13 = v5;
      BOOL v14 = v4;
      [v7 authorizeForViewController:self sender:v9 animated:v4 completionBlock:v11];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)CNContactContentContainerViewController;
      [(CNContactContentContainerViewController *)&v10 setEditing:v5 animated:v4];
      [(CNContactContentContainerViewController *)self performAuthorizedSetEditing:v5 animated:v4];
    }
  }
}

void __63__CNContactContentContainerViewController_setEditing_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 == 2)
  {
    id v5 = WeakRetained;
    [WeakRetained performAuthorizedSetEditing:*(unsigned __int8 *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 41)];
    id WeakRetained = v5;
  }
}

- (void)finishEditing:(id)a3
{
  if ([(CNContactContentContainerViewController *)self isEditing])
  {
    id v4 = [(CNContactContentContainerViewController *)self editContactViewController];
    [v4 finishEditing];
  }
}

- (void)toggleEditing:(id)a3
{
  id v4 = a3;
  if ([(CNContactContentContainerViewController *)self isEditing]) {
    [(CNContactContentContainerViewController *)self finishEditing:v4];
  }
  else {
    [(CNContactContentContainerViewController *)self setEditing:[(CNContactContentContainerViewController *)self isEditing] ^ 1];
  }
}

- (void)toggleEditing
{
}

- (void)editCancel:(id)a3
{
  if ([(CNContactContentContainerViewController *)self isEditing])
  {
    id v4 = [(CNContactContentContainerViewController *)self editContactViewController];
    [v4 editCancel];
  }
}

- (void)editCancel
{
}

- (BOOL)saveWasAuthorized
{
  id v2 = [(CNContactContentContainerViewController *)self editAuthorizationManager];
  char v3 = [v2 saveWasAuthorized];

  return v3;
}

- (void)presentConfirmCancelAlertController
{
  id v2 = [(CNContactContentContainerViewController *)self delegate];
  [v2 presentCancelConfirmationAlert];
}

- (BOOL)hasPendingChanges
{
  return [(CNContactContentEditViewController *)self->_editContactViewController hasPendingChanges];
}

- (void)updateWindowTitleForAppearing:(BOOL)a3
{
  if (a3)
  {
    id v10 = [(CNContactContentContainerViewController *)self title];
    if (!v10)
    {
      id v4 = [(CNContactContentContainerViewController *)self navigationController];
      id v10 = [v4 title];

      if (!v10)
      {
        id v5 = [(CNContactContentContainerViewController *)self contactFormatter];
        id v6 = [(CNContactContentContainerViewController *)self contact];
        id v10 = [v5 stringFromContact:v6];
      }
    }
    id v7 = [(CNContactContentContainerViewController *)self view];
    BOOL v8 = [v7 window];
    id v9 = [v8 windowScene];
    [v9 setTitle:v10];
  }
  else
  {
    id v10 = [(CNContactContentContainerViewController *)self view];
    id v7 = [v10 window];
    BOOL v8 = [v7 windowScene];
    [v8 setTitle:0];
  }
}

- (id)navigationItemController
{
  id v2 = self;
  char v3 = v2;
  if (v2)
  {
    id v4 = v2;
    while (1)
    {
      id v5 = [(CNContactContentContainerViewController *)v4 parentViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }
      uint64_t v7 = [(CNContactContentContainerViewController *)v4 parentViewController];

      id v4 = (CNContactContentContainerViewController *)v7;
      if (!v7) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    id v4 = v3;
  }

  return v4;
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  if (a3 == 4)
  {
    if ([(CNContactContentContainerViewController *)self isEditing])
    {
      id v4 = [(CNContactContentContainerViewController *)self displayContactViewController];
      id v5 = [v4 contactView];
    }
    else
    {
      id v5 = [(CNContactContentEditViewController *)self->_editContactViewController contactView];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)reloadCardGroup:(id)a3 forTableView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNContactContentContainerViewController *)self displayContactViewController];
  [v8 reloadCardGroup:v7 forTableView:v6];
}

- (void)removeActionWithTarget:(id)a3 selector:(SEL)a4 inGroup:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(CNContactContentContainerViewController *)self displayContactViewController];
  [v10 removeActionWithTarget:v9 selector:a4 inGroup:v8];
}

- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 inGroup:(id)a6
{
}

- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 inGroup:(id)a6 destructive:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(CNContactContentContainerViewController *)self displayContactViewController];
  [v15 addActionWithTitle:v14 target:v13 selector:a5 inGroup:v12 destructive:v7];
}

- (void)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 menuProvider:(id)a6 inGroup:(id)a7 destructive:(BOOL)a8
{
  BOOL v8 = a8;
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  id v15 = [(CNContactContentContainerViewController *)self displayContactViewController];
  [v15 addActionWithTitle:v14 menuProvider:v13 inGroup:v12 destructive:v8];
}

- (void)addActionWithTitle:(id)a3 menuProvider:(id)a4 inGroup:(id)a5 destructive:(BOOL)a6
{
}

- (void)reloadDataPreservingChanges:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CNContactContentContainerViewController *)self isViewLoaded]
    && (![(CNContactContentContainerViewController *)self isOutOfProcess]
     || [(CNContactContentContainerViewController *)self outOfProcessSetupComplete]))
  {
    self->_needsReload = 0;
    id v5 = [(CNContactContentContainerViewController *)self displayContactViewController];
    [v5 reloadDataPreservingChanges:v3];

    if (self->_editContactViewController)
    {
      id v6 = [(CNContactContentContainerViewController *)self editContactViewController];
      [v6 reloadDataPreservingChanges:v3];
    }
  }
}

- (id)originalContacts
{
  v5[1] = *MEMORY[0x1E4F143B8];
  originalContacts = self->_originalContacts;
  if (originalContacts)
  {
    BOOL v3 = originalContacts;
  }
  else if (self->_contact)
  {
    v5[0] = self->_contact;
    BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    BOOL v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (void)_refetchContact
{
  v36[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CNContactContentContainerViewController *)self contact];
  id v4 = [(CNContactContentViewController *)self parentContainer];
  if (v3)
  {
    id v5 = [MEMORY[0x1E4F5A6D8] unifiedMeContactMonitor];
    id v6 = [(CNContactContentContainerViewController *)self contact];
    int v7 = [v5 isMeContact:v6];

    BOOL v8 = CNUILogContactCard();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        id v10 = [v3 identifier];
        *(_DWORD *)long long buf = 138543362;
        uint64_t v28 = v10;
        _os_log_impl(&dword_18B625000, v8, OS_LOG_TYPE_DEFAULT, "Refetching contact, is it the me card, identifier %{public}@", buf, 0xCu);
      }
      double v11 = [(CNContactContentContainerViewController *)self contactStore];
      id v12 = [(id)objc_opt_class() descriptorForRequiredKeysForContact:v3];
      v36[0] = v12;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
      id v26 = 0;
      id v14 = [v11 _crossPlatformUnifiedMeContactWithKeysToFetch:v13 error:&v26];
      id v15 = v26;
    }
    else
    {
      if (v9)
      {
        uint64_t v16 = [v3 identifier];
        *(_DWORD *)long long buf = 138543362;
        uint64_t v28 = v16;
        _os_log_impl(&dword_18B625000, v8, OS_LOG_TYPE_DEFAULT, "Refetching contact, is it not the me card, identifier %{public}@", buf, 0xCu);
      }
      double v11 = [(CNContactContentContainerViewController *)self contactStore];
      id v12 = [v3 identifier];
      id v13 = [(id)objc_opt_class() descriptorForRequiredKeysForContact:v3];
      uint64_t v35 = v13;
      double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
      id v25 = 0;
      id v14 = [v11 unifiedContactWithIdentifier:v12 keysToFetch:v17 error:&v25];
      id v15 = v25;
    }
    double v18 = [(CNContactContentContainerViewController *)self contactViewCache];
    double v19 = [v18 containerForContact:v14];

    if (v15 || !v14)
    {
      v22 = CNUILogContactCard();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = [v3 identifier];
        uint64_t v24 = [(CNContactContentContainerViewController *)self contactStore];
        *(_DWORD *)long long buf = 138413058;
        uint64_t v28 = v23;
        __int16 v29 = 2112;
        id v30 = v15;
        __int16 v31 = 2112;
        v32 = v24;
        __int16 v33 = 2112;
        v34 = v3;
        _os_log_error_impl(&dword_18B625000, v22, OS_LOG_TYPE_ERROR, "Error refetching contact with identifier %@, %@, store %@, full contact %@", buf, 0x2Au);
      }
    }
    else
    {
      int v20 = [v14 isEqual:v3];
      char v21 = [v19 isEqual:v4];
      if (!v20 || (v21 & 1) == 0) {
        [(CNContactContentContainerViewController *)self setContact:v14];
      }
    }
  }
}

- (void)favoritesDidChangeWithNotification:(id)a3
{
  if (([(CNContactContentContainerViewController *)self isEditing] & 1) == 0)
  {
    [(CNContactContentContainerViewController *)self reloadDataPreservingChanges:0];
  }
}

- (void)setContact:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v4 = (CNContact *)a3;
  id v5 = v4;
  self->_needsRefetch = 0;
  if (self->_contact == v4) {
    goto LABEL_15;
  }
  id v6 = [(CNContact *)v4 identifier];
  int v7 = [(CNContact *)self->_contact identifier];
  char v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0) {
    [(CNContactContentContainerViewController *)self setDidSetNewContact:1];
  }
  BOOL v9 = [(CNContactContentContainerViewController *)self environment];
  id v10 = [v9 defaultSchedulerProvider];

  [v10 suspendBackgroundScheduler];
  double v11 = [v10 afterCACommitScheduler];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  void v30[2] = __54__CNContactContentContainerViewController_setContact___block_invoke;
  v30[3] = &unk_1E549B488;
  id v12 = v10;
  id v31 = v12;
  [v11 performBlock:v30];

  id v13 = [(CNContactContentContainerViewController *)self contactViewCache];
  [v13 resetCache];

  LODWORD(v11) = [(CNContactContentContainerViewController *)self isOutOfProcess];
  uint64_t v14 = [(id)objc_opt_class() descriptorForRequiredKeys];
  id v15 = (void *)v14;
  if (v11)
  {
    v35[0] = v14;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    uint64_t v17 = [(CNContactContentContainerViewController *)self _updateContact:v5 withMissingKeysFromRequiredKeys:v16];

    id v5 = (void *)v17;
  }
  else
  {
    uint64_t v34 = v14;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    [v5 assertKeysAreAvailable:v16];
  }

  double v18 = [(CNContactContentContainerViewController *)self displayContactViewController];
  [v18 setContact:v5];

  [(CNContactContentEditViewController *)self->_editContactViewController setContact:v5];
  double v19 = [(CNContactContentContainerViewController *)self editAuthorizationManager];
  [v19 updateWithContact:v5];

  uint64_t v20 = [(CNContactContentViewController *)self parentContainer];
  if (!v20) {
    goto LABEL_10;
  }
  char v21 = (void *)v20;
  uint64_t v22 = [(CNContactContentViewController *)self parentContainer];
  if (!v22)
  {
LABEL_11:

    goto LABEL_12;
  }
  v23 = (void *)v22;
  int v24 = [v5 hasBeenPersisted];

  if (v24)
  {
LABEL_10:
    char v21 = [(CNContactContentContainerViewController *)self contactViewCache];
    id v25 = [v21 containerForContact:v5];
    [(CNContactContentViewController *)self setParentContainer:v25];

    goto LABEL_11;
  }
LABEL_12:
  objc_storeStrong((id *)&self->_contact, v5);
  id v26 = CNUILogContactCard();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = [v5 identifier];
    *(_DWORD *)long long buf = 138543362;
    __int16 v33 = v27;
    _os_log_impl(&dword_18B625000, v26, OS_LOG_TYPE_DEFAULT, "[CNContactContentViewController] setting contact with identifier %{public}@", buf, 0xCu);
  }
  uint64_t v28 = +[CNUIDataCollector sharedCollector];
  __int16 v29 = [(CNContactContentContainerViewController *)self contact];
  [v28 logContactShown:v29];

  [(CNContactContentContainerViewController *)self prepareContactDidAppearForPPT];
LABEL_15:
}

uint64_t __54__CNContactContentContainerViewController_setContact___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resumeBackgroundScheduler];
}

- (id)cardFooterGroup
{
  id v2 = [(CNContactContentContainerViewController *)self displayContactViewController];
  BOOL v3 = [v2 cardFooterGroup];

  return v3;
}

- (id)cardBottomGroup
{
  id v2 = [(CNContactContentContainerViewController *)self displayContactViewController];
  BOOL v3 = [v2 cardBottomGroup];

  return v3;
}

- (id)cardTopGroup
{
  id v2 = [(CNContactContentContainerViewController *)self displayContactViewController];
  BOOL v3 = [v2 cardTopGroup];

  return v3;
}

- (id)personHeaderViewController
{
  id v2 = [(CNContactContentContainerViewController *)self displayContactViewController];
  BOOL v3 = [v2 personHeaderViewController];

  return v3;
}

- (void)setPersonHeaderViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentContainerViewController *)self displayContactViewController];
  [v5 setPersonHeaderViewController:v4];
}

- (id)personHeaderView
{
  id v2 = [(CNContactContentContainerViewController *)self personHeaderViewController];
  BOOL v3 = [v2 view];
  id v4 = [v3 subviews];
  id v5 = [v4 firstObject];

  return v5;
}

- (void)setPersonHeaderView:(id)a3
{
  id firstValue = a3;
  if (firstValue)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
    id v5 = [v4 view];
    [v5 addSubview:firstValue];

    id v6 = [MEMORY[0x1E4F1CA48] array];
    int v7 = _NSDictionaryOfVariableBindings(&cfstr_Personheadervi.isa, firstValue, 0);
    [firstValue setTranslatesAutoresizingMaskIntoConstraints:0];
    char v8 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[personHeaderView]|" options:0 metrics:0 views:v7];
    [v6 addObjectsFromArray:v8];

    BOOL v9 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[personHeaderView]|" options:0 metrics:0 views:v7];
    [v6 addObjectsFromArray:v9];

    [MEMORY[0x1E4F28DC8] activateConstraints:v6];
    [(CNContactContentContainerViewController *)self setPersonHeaderViewController:v4];
  }
  else
  {
    [(CNContactContentContainerViewController *)self setPersonHeaderViewController:0];
  }
}

- (id)primaryProperty
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  BOOL v3 = [v2 primaryProperty];

  return v3;
}

- (void)setPrimaryProperty:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setPrimaryProperty:v4];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (id)verifiedInfoMessage
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  BOOL v3 = [v2 verifiedInfoMessage];

  return v3;
}

- (void)setVerifiedInfoMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setVerifiedInfoMessage:v4];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (id)importantMessage
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  BOOL v3 = [v2 importantMessage];

  return v3;
}

- (void)setImportantMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setImportantMessage:v4];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (id)warningMessage
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  BOOL v3 = [v2 warningMessage];

  return v3;
}

- (void)setWarningMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setWarningMessage:v4];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (id)message
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  BOOL v3 = [v2 message];

  return v3;
}

- (void)setMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setMessage:v4];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (id)alternateName
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  BOOL v3 = [v2 alternateName];

  return v3;
}

- (void)setAlternateName:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setAlternateName:v4];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)showContactBlockingFirst
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 showContactBlockingFirst];

  return v3;
}

- (void)setShowContactBlockingFirst:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setShowContactBlockingFirst:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)isMailVIP
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 isMailVIP];

  return v3;
}

- (void)setIsMailVIP:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setIsMailVIP:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)hideCardActions
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 hideCardActions];

  return v3;
}

- (void)setHideCardActions:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setHideCardActions:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)editingProposedInformation
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 editingProposedInformation];

  return v3;
}

- (void)setEditingProposedInformation:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setEditingProposedInformation:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)ignoresParentalRestrictions
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 ignoresParentalRestrictions];

  return v3;
}

- (void)setIgnoresParentalRestrictions:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setIgnoresParentalRestrictions:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)allowsEditPhoto
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 allowsEditPhoto];

  return v3;
}

- (void)setAllowsEditPhoto:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setAllowsEditPhoto:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)allowsDisplayModePickerActions
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 allowsDisplayModePickerActions];

  return v3;
}

- (void)setAllowsDisplayModePickerActions:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setAllowsDisplayModePickerActions:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)allowsActionsModel
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 allowsActionsModel];

  return v3;
}

- (void)setAllowsActionsModel:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setAllowsActionsModel:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)allowsDeletion
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 allowsDeletion];

  return v3;
}

- (void)setAllowsDeletion:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setAllowsDeletion:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)allowsSettingLinkedContactsAsPreferred
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 allowsSettingLinkedContactsAsPreferred];

  return v3;
}

- (void)setAllowsSettingLinkedContactsAsPreferred:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setAllowsSettingLinkedContactsAsPreferred:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)shouldShowLinkedContacts
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 shouldShowLinkedContacts];

  return v3;
}

- (void)setShouldShowLinkedContacts:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setShouldShowLinkedContacts:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)allowsAddingToAddressBook
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 allowsAddingToAddressBook];

  return v3;
}

- (void)setAllowsAddingToAddressBook:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setAllowsAddingToAddressBook:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)allowsContactBlockingAndReporting
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 allowsContactBlockingAndReporting];

  return v3;
}

- (void)setAllowsContactBlockingAndReporting:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setAllowsContactBlockingAndReporting:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)allowsContactBlocking
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 allowsContactBlocking];

  return v3;
}

- (void)setAllowsContactBlocking:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setAllowsContactBlocking:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)allowsSendMessage
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 allowsSendMessage];

  return v3;
}

- (void)setAllowsSendMessage:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setAllowsSendMessage:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)allowsAddToFavorites
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 allowsAddToFavorites];

  return v3;
}

- (void)setAllowsAddToFavorites:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setAllowsAddToFavorites:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)allowsSharing
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 allowsSharing];

  return v3;
}

- (void)setAllowsSharing:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setAllowsSharing:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)allowsConferencing
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 allowsConferencing];

  return v3;
}

- (void)setAllowsConferencing:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setAllowsConferencing:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)allowsCardActions
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 allowsCardActions];

  return v3;
}

- (void)setAllowsCardActions:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setAllowsCardActions:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)allowsPropertyActions
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 allowsPropertyActions];

  return v3;
}

- (void)setAllowsPropertyActions:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setAllowsPropertyActions:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)allowsActions
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 allowsActions];

  return v3;
}

- (void)setAllowsActions:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setAllowsActions:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)alwaysEditing
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 alwaysEditing];

  return v3;
}

- (void)setAlwaysEditing:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setAlwaysEditing:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (BOOL)allowsEditing
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  char v3 = [v2 allowsEditing];

  return v3;
}

- (void)setAllowsEditing:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v5 setAllowsEditing:v3];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (id)displayedProperties
{
  id v2 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  BOOL v3 = [v2 displayedProperties];

  return v3;
}

- (void)setDisplayedProperties:(id)a3
{
  id v14 = a3;
  id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  id v6 = [v5 displayedProperties];

  int v7 = v14;
  if (v6 != v14)
  {
    if ([v14 count])
    {
      char v8 = [v14 objectAtIndexedSubscript:0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        id v10 = [MEMORY[0x1E4F28B00] currentHandler];
        [v10 handleFailureInMethod:a2, self, @"CNContactContentContainerViewController.m", 352, @"Properties should be strings, are you still using old AB properties?" object file lineNumber description];
      }
    }
    if (v14)
    {
      uint64_t v11 = [v14 copy];
    }
    else
    {
      uint64_t v11 = +[CNContactView allCardProperties];
    }
    id v12 = (void *)v11;
    id v13 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
    [v13 setDisplayedProperties:v12];

    [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
    int v7 = v14;
  }
}

- (void)applyChangesToNavigationItemFromItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentContainerViewController *)self navigationItemController];
  id v8 = [v5 navigationItem];

  id v6 = [v4 leftBarButtonItems];
  [v8 setLeftBarButtonItems:v6];

  int v7 = [v4 rightBarButtonItems];

  [v8 setRightBarButtonItems:v7];
}

- (void)contactNavigationItemProvider:(id)a3 didUpdateNavigationItem:(id)a4 doneButtonItem:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(CNContactContentContainerViewController *)self isEditing])
  {
    BOOL v10 = 0;
  }
  else
  {
    id v11 = [(CNContactContentContainerViewController *)self displayContactViewController];
    BOOL v10 = v11 == v20;
  }
  if ([(CNContactContentContainerViewController *)self isEditing])
  {
    id v12 = [(CNContactContentContainerViewController *)self editContactViewController];
    BOOL v13 = v12 == v20;
  }
  else
  {
    BOOL v13 = 0;
  }
  if (v10 || v13)
  {
    [(CNContactContentContainerViewController *)self applyChangesToNavigationItemFromItem:v8];
    id v14 = [(CNContactContentContainerViewController *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      uint64_t v16 = [(CNContactContentContainerViewController *)self delegate];
      uint64_t v17 = [(CNContactContentContainerViewController *)self isEditing];
      uint64_t v18 = [v9 isEnabled];
      double v19 = [v9 title];
      [v16 updateEditing:v17 doneButtonEnabled:v18 doneButtonText:v19];
    }
  }
}

- (id)displayHeaderView
{
  id v2 = [(CNContactContentContainerViewController *)self displayContactViewController];
  BOOL v3 = [v2 contactHeaderView];

  return v3;
}

- (id)contactHeaderView
{
  if ([(CNContactContentContainerViewController *)self isEditing]) {
    [(CNContactContentContainerViewController *)self displayContactViewController];
  }
  else {
  BOOL v3 = [(CNContactContentContainerViewController *)self editContactViewController];
  }
  id v4 = [v3 contactHeaderView];

  return v4;
}

- (id)contactView
{
  if ([(CNContactContentContainerViewController *)self isEditing]) {
    [(CNContactContentContainerViewController *)self displayContactViewController];
  }
  else {
  BOOL v3 = [(CNContactContentContainerViewController *)self editContactViewController];
  }
  id v4 = [v3 contactView];

  return v4;
}

- (BOOL)isOutOfProcess
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  displayContactViewController = self->_displayContactViewController;
  self->_displayContactViewController = 0;

  editContactViewController = self->_editContactViewController;
  self->_editContactViewController = 0;

  v5.receiver = self;
  v5.super_class = (Class)CNContactContentContainerViewController;
  [(CNContactContentContainerViewController *)&v5 dealloc];
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  if (v5
    || ([(CNContactContentContainerViewController *)self title],
        (BOOL v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = [(CNContactContentContainerViewController *)self title];
    char v7 = [v5 isEqual:v6];

    if (!v5)
    {

      if (v7) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
    if ((v7 & 1) == 0)
    {
LABEL_5:
      v8.receiver = self;
      v8.super_class = (Class)CNContactContentContainerViewController;
      [(CNContactContentContainerViewController *)&v8 setTitle:v5];
      [(CNContactContentContainerViewController *)self didChangeToShowTitle:v5 != 0];
    }
  }
LABEL_6:
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
  id v5 = a3;
  id v6 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
  [v6 setContactStore:v5];

  [(CNContactContentContainerViewController *)self didUpdateContactViewConfiguration];
}

- (void)createEditingViewControllerIfNeeded
{
  if (!self->_editContactViewController)
  {
    BOOL v3 = [CNContactContentEditViewController alloc];
    id v4 = [(CNContactContentContainerViewController *)self contact];
    id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
    id v6 = [(CNContactContentEditViewController *)v3 initWithContact:v4 contactViewConfiguration:v5];
    editContactViewController = self->_editContactViewController;
    self->_editContactViewController = v6;

    [(CNContactContentEditViewController *)self->_editContactViewController setDelegate:self];
    objc_super v8 = self->_editContactViewController;
    [(CNContactContentEditViewController *)v8 setNavigationItemDelegate:self];
  }
}

- (void)createDisplayViewControllerIfNeeded
{
  if (!self->_displayContactViewController)
  {
    BOOL v3 = [CNContactContentDisplayViewController alloc];
    id v4 = [(CNContactContentContainerViewController *)self contact];
    id v5 = [(CNContactContentContainerViewController *)self contactViewConfiguration];
    id v6 = [(CNContactContentDisplayViewController *)v3 initWithContact:v4 contactViewConfiguration:v5];
    displayContactViewController = self->_displayContactViewController;
    self->_displayContactViewController = v6;

    [(CNContactContentDisplayViewController *)self->_displayContactViewController setDelegate:self];
    objc_super v8 = self->_displayContactViewController;
    [(CNContactContentDisplayViewController *)v8 setNavigationItemDelegate:self];
  }
}

- (CNContactContentContainerViewController)initWithContact:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContactContentContainerViewController *)self initWithNibName:0 bundle:0];
  id v6 = v5;
  if (v5)
  {
    [(CNContactContentContainerViewController *)v5 setContact:v4];
    char v7 = v6;
  }

  return v6;
}

- (CNContactContentContainerViewController)initWithEnvironment:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CNContactContentContainerViewController;
  id v6 = [(CNContactContentViewController *)&v20 initWithEnvironment:v5];
  objc_storeStrong((id *)&v6->_environment, a3);
  objc_storeWeak((id *)&v6->_presentingDelegate, v6);
  uint64_t v7 = +[CNContactView allCardProperties];
  displayedProperties = v6->_displayedProperties;
  v6->_displayedProperties = (NSArray *)v7;

  id v9 = [[CNContactContentViewControllerConfiguration alloc] initForOutOfProcess:[(CNContactContentContainerViewController *)v6 isOutOfProcess]];
  contactViewConfiguration = v6->_contactViewConfiguration;
  v6->_contactViewConfiguration = v9;

  uint64_t v11 = [MEMORY[0x1E4F1B910] sharedFullNameFormatter];
  contactFormatter = v6->_contactFormatter;
  v6->_contactFormatter = (CNContactFormatter *)v11;

  [(CNContactContentContainerViewController *)v6 setNeedsReloadLazy];
  [(CNContactContentContainerViewController *)v6 setRestorationIdentifier:@"ContactCard"];
  [(CNContactContentContainerViewController *)v6 setRestorationClass:objc_opt_class()];
  BOOL v13 = [(CNContactContentContainerViewController *)v6 navigationItem];
  [v13 _setBackgroundHidden:1];

  id v14 = [(CNContactContentContainerViewController *)v6 navigationItem];
  [v14 setLargeTitleDisplayMode:2];

  char v15 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  uint64_t v16 = [v15 featureFlags];
  v6->_supportsDrafts = [v16 isFeatureEnabled:18];

  if ([(CNContactContentContainerViewController *)v6 supportsDrafts])
  {
    uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v6 selector:sel_applicationLeftForeground_ name:*MEMORY[0x1E4FB2738] object:0];

    uint64_t v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v6 selector:sel_applicationLeftForeground_ name:*MEMORY[0x1E4FB2740] object:0];
  }
  return v6;
}

- (CNContactContentContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = +[CNUIContactsEnvironment currentEnvironment];
  id v6 = [(CNContactContentContainerViewController *)self initWithEnvironment:v5];

  return v6;
}

+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  uint64_t v7 = (void *)MEMORY[0x1E4F1B8F8];
  objc_super v8 = +[CNContactContentViewController descriptorForRequiredKeys];
  v26[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  BOOL v10 = [v7 contactWithStateRestorationCoder:v5 store:v6 keys:v9];

  if (v10)
  {
    id v20 = v6;
    uint64_t v11 = [[CNContactContentViewController alloc] initWithContact:v10];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = [a1 BOOLStateRestorationProperties];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v18 = [v5 decodeObjectOfClass:objc_opt_class() forKey:v17];
          if (v18) {
            [(CNContactContentViewController *)v11 setValue:v18 forKey:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    id v6 = v20;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)BOOLStateRestorationProperties
{
  return &unk_1ED915A28;
}

+ (id)descriptorForRequiredKeysWithDescription:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__CNContactContentContainerViewController_descriptorForRequiredKeysWithDescription___block_invoke;
  block[3] = &unk_1E549B488;
  id v9 = v3;
  uint64_t v4 = descriptorForRequiredKeysWithDescription__cn_once_token_3;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&descriptorForRequiredKeysWithDescription__cn_once_token_3, block);
  }
  id v6 = (id)descriptorForRequiredKeysWithDescription__cn_once_object_3;

  return v6;
}

void __84__CNContactContentContainerViewController_descriptorForRequiredKeysWithDescription___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v2 = +[CNContactContentDisplayViewController descriptorForRequiredKeys];
  v7[0] = v2;
  id v3 = +[CNContactContentEditViewController descriptorForRequiredKeys];
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  uint64_t v5 = [MEMORY[0x1E4F1B8F8] descriptorWithKeyDescriptors:v4 description:*(void *)(a1 + 32)];

  id v6 = (void *)descriptorForRequiredKeysWithDescription__cn_once_object_3;
  descriptorForRequiredKeysWithDescription__cn_once_object_3 = v5;
}

+ (int64_t)tableViewStyle
{
  return 1;
}

+ (id)descriptorForRequiredKeys
{
  id v3 = [NSString stringWithUTF8String:"+[CNContactContentContainerViewController descriptorForRequiredKeys]"];
  uint64_t v4 = [a1 descriptorForRequiredKeysWithDescription:v3];

  return v4;
}

+ (id)descriptorForRequiredKeysForContact:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 descriptorForRequiredKeys];
  id v6 = [v4 availableKeyDescriptor];

  v12[0] = v5;
  v12[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  objc_super v8 = (void *)MEMORY[0x1E4F1B8F8];
  id v9 = [NSString stringWithUTF8String:"+[CNContactContentContainerViewController descriptorForRequiredKeysForContact:]"];
  BOOL v10 = [v8 descriptorWithKeyDescriptors:v7 description:v9];

  return v10;
}

@end