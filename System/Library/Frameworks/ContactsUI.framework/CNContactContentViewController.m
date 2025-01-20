@interface CNContactContentViewController
+ (Class)classForContentViewControllerImpl;
+ (id)descriptorForRequiredKeys;
+ (id)descriptorForRequiredKeysWithDescription:(id)a3;
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
- (BOOL)allowsNamePicking;
- (BOOL)allowsPropertyActions;
- (BOOL)allowsSendMessage;
- (BOOL)allowsSettingLinkedContactsAsPreferred;
- (BOOL)allowsSharing;
- (BOOL)alwaysEditing;
- (BOOL)editingProposedInformation;
- (BOOL)hideCardActions;
- (BOOL)ignoresParentalRestrictions;
- (BOOL)isMailVIP;
- (BOOL)isSiri;
- (BOOL)shouldDrawNavigationBar;
- (BOOL)shouldIgnoreContactStoreDidChangeNotification;
- (BOOL)shouldShowLinkedContacts;
- (BOOL)showContactBlockingFirst;
- (BOOL)showingMeContact;
- (BOOL)showsGroupMembership;
- (BOOL)showsInlineActions;
- (BOOL)showsSharedProfile;
- (CNCardDefaultAppGroup)cardDefaultAppGroup;
- (CNCardFaceTimeGroup)cardFaceTimeGroup;
- (CNCardGroup)cardBottomGroup;
- (CNCardGroup)cardFooterGroup;
- (CNCardGroup)cardTopGroup;
- (CNContact)contact;
- (CNContactContentViewController)init;
- (CNContactContentViewController)initWithContact:(id)a3;
- (CNContactContentViewController)initWithEnvironment:(id)a3;
- (CNContactContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CNContactContentViewControllerConfiguration)contactViewConfiguration;
- (CNContactContentViewControllerDelegate)contactDelegate;
- (CNContactHeaderView)contactHeaderView;
- (CNContactRecentsReference)recentsData;
- (CNContactStore)contactStore;
- (CNContactView)contactView;
- (CNContactViewControllerCustomHeaderViewDelegate)personHeaderViewDelegate;
- (CNContainer)parentContainer;
- (CNGroup)parentGroup;
- (CNManagedConfiguration)managedConfiguration;
- (CNPolicy)policy;
- (CNPresenterDelegate)presentingDelegate;
- (CNUIContactSaveExecutor)saveContactExecutor;
- (CNUIContactSaveExecutor)saveLinkedContactsExecutor;
- (NSArray)cardActions;
- (NSArray)displayedProperties;
- (NSArray)missingRequiredKeys;
- (NSArray)originalContacts;
- (NSArray)prohibitedPropertyKeys;
- (NSAttributedString)verifiedInfoMessage;
- (NSDictionary)linkedPoliciesByContactIdentifier;
- (NSDictionary)propertyGroups;
- (NSMutableArray)displayGroups;
- (NSString)alternateName;
- (NSString)importantMessage;
- (NSString)initialPrompt;
- (NSString)message;
- (NSString)primaryProperty;
- (NSString)warningMessage;
- (UITableView)tableView;
- (UIView)personHeaderView;
- (UIViewController)personHeaderViewController;
- (int64_t)indexOfGroup:(id)a3;
- (int64_t)mode;
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
- (void)setAllowsNamePicking:(BOOL)a3;
- (void)setAllowsPropertyActions:(BOOL)a3;
- (void)setAllowsSendMessage:(BOOL)a3;
- (void)setAllowsSettingLinkedContactsAsPreferred:(BOOL)a3;
- (void)setAllowsSharing:(BOOL)a3;
- (void)setAlternateName:(id)a3;
- (void)setAlwaysEditing:(BOOL)a3;
- (void)setCardDefaultAppGroup:(id)a3;
- (void)setCardFaceTimeGroup:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactDelegate:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContactViewConfiguration:(id)a3;
- (void)setDisplayGroups:(id)a3;
- (void)setDisplayedProperties:(id)a3;
- (void)setEditingProposedInformation:(BOOL)a3;
- (void)setHideCardActions:(BOOL)a3;
- (void)setIgnoresParentalRestrictions:(BOOL)a3;
- (void)setImportantMessage:(id)a3;
- (void)setInitialPrompt:(id)a3;
- (void)setIsMailVIP:(BOOL)a3;
- (void)setIsSiri:(BOOL)a3;
- (void)setLinkedPoliciesByContactIdentifier:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMissingRequiredKeys:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setOriginalContacts:(id)a3;
- (void)setParentContainer:(id)a3;
- (void)setParentGroup:(id)a3;
- (void)setPersonHeaderView:(id)a3;
- (void)setPersonHeaderViewController:(id)a3;
- (void)setPersonHeaderViewDelegate:(id)a3;
- (void)setPolicy:(id)a3;
- (void)setPresentingDelegate:(id)a3;
- (void)setPrimaryProperty:(id)a3;
- (void)setProhibitedPropertyKeys:(id)a3;
- (void)setRecentsData:(id)a3;
- (void)setSaveContactExecutor:(id)a3;
- (void)setSaveLinkedContactsExecutor:(id)a3;
- (void)setShouldDrawNavigationBar:(BOOL)a3;
- (void)setShouldIgnoreContactStoreDidChangeNotification:(BOOL)a3;
- (void)setShouldShowLinkedContacts:(BOOL)a3;
- (void)setShowContactBlockingFirst:(BOOL)a3;
- (void)setShowingMeContact:(BOOL)a3;
- (void)setShowsGroupMembership:(BOOL)a3;
- (void)setShowsInlineActions:(BOOL)a3;
- (void)setShowsSharedProfile:(BOOL)a3;
- (void)setTableView:(id)a3;
- (void)setVerifiedInfoMessage:(id)a3;
- (void)setWarningMessage:(id)a3;
@end

@implementation CNContactContentViewController

+ (id)descriptorForRequiredKeys
{
  v2 = (void *)[a1 classForContentViewControllerImpl];

  return (id)[v2 descriptorForRequiredKeys];
}

+ (Class)classForContentViewControllerImpl
{
  v2 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v3 = [v2 featureFlags];
  [v3 isFeatureEnabled:4];

  v4 = objc_opt_class();

  return (Class)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayGroups, 0);
  objc_storeStrong((id *)&self->_cardDefaultAppGroup, 0);
  objc_storeStrong((id *)&self->_cardFaceTimeGroup, 0);
  objc_storeStrong((id *)&self->_propertyGroups, 0);
  objc_storeStrong((id *)&self->_recentsData, 0);
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_saveLinkedContactsExecutor, 0);
  objc_storeStrong((id *)&self->_saveContactExecutor, 0);
  objc_storeStrong((id *)&self->_initialPrompt, 0);
  objc_storeStrong((id *)&self->_originalContacts, 0);
  objc_storeStrong((id *)&self->_missingRequiredKeys, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_cardActions, 0);
  objc_storeStrong((id *)&self->_linkedPoliciesByContactIdentifier, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_contactViewConfiguration, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_destroyWeak((id *)&self->_contactDelegate);
  objc_storeStrong((id *)&self->_cardFooterGroup, 0);
  objc_storeStrong((id *)&self->_cardBottomGroup, 0);
  objc_storeStrong((id *)&self->_cardTopGroup, 0);
  objc_destroyWeak((id *)&self->_personHeaderViewDelegate);
  objc_storeStrong((id *)&self->_personHeaderViewController, 0);
  objc_storeStrong((id *)&self->_personHeaderView, 0);
  objc_storeStrong((id *)&self->_primaryProperty, 0);
  objc_storeStrong((id *)&self->_verifiedInfoMessage, 0);
  objc_storeStrong((id *)&self->_importantMessage, 0);
  objc_storeStrong((id *)&self->_warningMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_alternateName, 0);
  objc_storeStrong((id *)&self->_displayedProperties, 0);
  objc_storeStrong((id *)&self->_contactHeaderView, 0);
  objc_storeStrong((id *)&self->_contactView, 0);
  objc_storeStrong((id *)&self->_parentContainer, 0);
  objc_storeStrong((id *)&self->_parentGroup, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)setShowingMeContact:(BOOL)a3
{
  self->_showingMeContact = a3;
}

- (BOOL)showingMeContact
{
  return self->_showingMeContact;
}

- (void)setDisplayGroups:(id)a3
{
}

- (NSMutableArray)displayGroups
{
  return self->_displayGroups;
}

- (void)setCardDefaultAppGroup:(id)a3
{
}

- (CNCardDefaultAppGroup)cardDefaultAppGroup
{
  return self->_cardDefaultAppGroup;
}

- (void)setCardFaceTimeGroup:(id)a3
{
}

- (CNCardFaceTimeGroup)cardFaceTimeGroup
{
  return self->_cardFaceTimeGroup;
}

- (NSDictionary)propertyGroups
{
  return self->_propertyGroups;
}

- (void)setRecentsData:(id)a3
{
}

- (CNContactRecentsReference)recentsData
{
  return self->_recentsData;
}

- (void)setProhibitedPropertyKeys:(id)a3
{
}

- (NSArray)prohibitedPropertyKeys
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

- (CNUIContactSaveExecutor)saveLinkedContactsExecutor
{
  return self->_saveLinkedContactsExecutor;
}

- (void)setSaveContactExecutor:(id)a3
{
}

- (CNUIContactSaveExecutor)saveContactExecutor
{
  return self->_saveContactExecutor;
}

- (void)setInitialPrompt:(id)a3
{
}

- (NSString)initialPrompt
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

- (void)setAllowsEditInApp:(BOOL)a3
{
  self->_allowsEditInApp = a3;
}

- (BOOL)allowsEditInApp
{
  return self->_allowsEditInApp;
}

- (void)setOriginalContacts:(id)a3
{
}

- (NSArray)originalContacts
{
  return self->_originalContacts;
}

- (void)setMissingRequiredKeys:(id)a3
{
}

- (NSArray)missingRequiredKeys
{
  return self->_missingRequiredKeys;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setContactStore:(id)a3
{
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (NSArray)cardActions
{
  return self->_cardActions;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setLinkedPoliciesByContactIdentifier:(id)a3
{
}

- (NSDictionary)linkedPoliciesByContactIdentifier
{
  return self->_linkedPoliciesByContactIdentifier;
}

- (void)setPolicy:(id)a3
{
}

- (CNPolicy)policy
{
  return self->_policy;
}

- (void)setContactViewConfiguration:(id)a3
{
}

- (CNContactContentViewControllerConfiguration)contactViewConfiguration
{
  return self->_contactViewConfiguration;
}

- (void)setPresentingDelegate:(id)a3
{
}

- (CNPresenterDelegate)presentingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingDelegate);

  return (CNPresenterDelegate *)WeakRetained;
}

- (void)setContactDelegate:(id)a3
{
}

- (CNContactContentViewControllerDelegate)contactDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactDelegate);

  return (CNContactContentViewControllerDelegate *)WeakRetained;
}

- (CNCardGroup)cardFooterGroup
{
  return self->_cardFooterGroup;
}

- (CNCardGroup)cardBottomGroup
{
  return self->_cardBottomGroup;
}

- (CNCardGroup)cardTopGroup
{
  return self->_cardTopGroup;
}

- (void)setPersonHeaderViewDelegate:(id)a3
{
}

- (CNContactViewControllerCustomHeaderViewDelegate)personHeaderViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_personHeaderViewDelegate);

  return (CNContactViewControllerCustomHeaderViewDelegate *)WeakRetained;
}

- (void)setPersonHeaderViewController:(id)a3
{
}

- (UIViewController)personHeaderViewController
{
  return self->_personHeaderViewController;
}

- (void)setPersonHeaderView:(id)a3
{
}

- (UIView)personHeaderView
{
  return self->_personHeaderView;
}

- (void)setPrimaryProperty:(id)a3
{
}

- (NSString)primaryProperty
{
  return self->_primaryProperty;
}

- (void)setVerifiedInfoMessage:(id)a3
{
}

- (NSAttributedString)verifiedInfoMessage
{
  return self->_verifiedInfoMessage;
}

- (void)setImportantMessage:(id)a3
{
}

- (NSString)importantMessage
{
  return self->_importantMessage;
}

- (void)setWarningMessage:(id)a3
{
}

- (NSString)warningMessage
{
  return self->_warningMessage;
}

- (void)setMessage:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setAlternateName:(id)a3
{
}

- (NSString)alternateName
{
  return self->_alternateName;
}

- (void)setIsSiri:(BOOL)a3
{
  self->_isSiri = a3;
}

- (BOOL)isSiri
{
  return self->_isSiri;
}

- (void)setShowContactBlockingFirst:(BOOL)a3
{
  self->_showContactBlockingFirst = a3;
}

- (BOOL)showContactBlockingFirst
{
  return self->_showContactBlockingFirst;
}

- (void)setIsMailVIP:(BOOL)a3
{
  self->_isMailVIP = a3;
}

- (BOOL)isMailVIP
{
  return self->_isMailVIP;
}

- (void)setHideCardActions:(BOOL)a3
{
  self->_hideCardActions = a3;
}

- (BOOL)hideCardActions
{
  return self->_hideCardActions;
}

- (void)setEditingProposedInformation:(BOOL)a3
{
  self->_editingProposedInformation = a3;
}

- (BOOL)editingProposedInformation
{
  return self->_editingProposedInformation;
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

- (void)setAllowsActionsModel:(BOOL)a3
{
  self->_allowsActionsModel = a3;
}

- (BOOL)allowsActionsModel
{
  return self->_allowsActionsModel;
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

- (void)setAllowsDeletion:(BOOL)a3
{
  self->_allowsDeletion = a3;
}

- (BOOL)allowsDeletion
{
  return self->_allowsDeletion;
}

- (void)setAllowsSettingLinkedContactsAsPreferred:(BOOL)a3
{
  self->_allowsSettingLinkedContactsAsPreferred = a3;
}

- (BOOL)allowsSettingLinkedContactsAsPreferred
{
  return self->_allowsSettingLinkedContactsAsPreferred;
}

- (void)setShouldShowLinkedContacts:(BOOL)a3
{
  self->_shouldShowLinkedContacts = a3;
}

- (BOOL)shouldShowLinkedContacts
{
  return self->_shouldShowLinkedContacts;
}

- (void)setAllowsAddingToAddressBook:(BOOL)a3
{
  self->_allowsAddingToAddressBook = a3;
}

- (BOOL)allowsAddingToAddressBook
{
  return self->_allowsAddingToAddressBook;
}

- (void)setAllowsContactBlockingAndReporting:(BOOL)a3
{
  self->_allowsContactBlockingAndReporting = a3;
}

- (BOOL)allowsContactBlockingAndReporting
{
  return self->_allowsContactBlockingAndReporting;
}

- (void)setAllowsContactBlocking:(BOOL)a3
{
  self->_allowsContactBlocking = a3;
}

- (BOOL)allowsContactBlocking
{
  return self->_allowsContactBlocking;
}

- (void)setAllowsSendMessage:(BOOL)a3
{
  self->_allowsSendMessage = a3;
}

- (BOOL)allowsSendMessage
{
  return self->_allowsSendMessage;
}

- (void)setAllowsAddToFavorites:(BOOL)a3
{
  self->_allowsAddToFavorites = a3;
}

- (BOOL)allowsAddToFavorites
{
  return self->_allowsAddToFavorites;
}

- (void)setAllowsSharing:(BOOL)a3
{
  self->_allowsSharing = a3;
}

- (BOOL)allowsSharing
{
  return self->_allowsSharing;
}

- (void)setAllowsConferencing:(BOOL)a3
{
  self->_allowsConferencing = a3;
}

- (BOOL)allowsConferencing
{
  return self->_allowsConferencing;
}

- (void)setAllowsCardActions:(BOOL)a3
{
  self->_allowsCardActions = a3;
}

- (BOOL)allowsCardActions
{
  return self->_allowsCardActions;
}

- (void)setAllowsPropertyActions:(BOOL)a3
{
  self->_allowsPropertyActions = a3;
}

- (BOOL)allowsPropertyActions
{
  return self->_allowsPropertyActions;
}

- (void)setAllowsActions:(BOOL)a3
{
  self->_allowsActions = a3;
}

- (BOOL)allowsActions
{
  return self->_allowsActions;
}

- (void)setAlwaysEditing:(BOOL)a3
{
  self->_alwaysEditing = a3;
}

- (BOOL)alwaysEditing
{
  return self->_alwaysEditing;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (void)setDisplayedProperties:(id)a3
{
}

- (NSArray)displayedProperties
{
  return self->_displayedProperties;
}

- (CNContactHeaderView)contactHeaderView
{
  return self->_contactHeaderView;
}

- (CNContactView)contactView
{
  return self->_contactView;
}

- (void)setParentContainer:(id)a3
{
}

- (CNContainer)parentContainer
{
  return self->_parentContainer;
}

- (void)setParentGroup:(id)a3
{
}

- (CNGroup)parentGroup
{
  return self->_parentGroup;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (CNContactContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = +[CNUIContactsEnvironment currentEnvironment];
  v6 = [(CNContactContentViewController *)self initWithEnvironment:v5];

  return v6;
}

- (CNContactContentViewController)init
{
  v3 = +[CNUIContactsEnvironment currentEnvironment];
  v4 = [(CNContactContentViewController *)self initWithEnvironment:v3];

  return v4;
}

- (CNContactContentViewController)initWithContact:(id)a3
{
  id v4 = a3;
  v5 = +[CNUIContactsEnvironment currentEnvironment];
  v6 = [(CNContactContentViewController *)self initWithEnvironment:v5];

  if (v6) {
    [(CNContactContentViewController *)v6 setContact:v4];
  }

  return v6;
}

- (CNContactContentViewController)initWithEnvironment:(id)a3
{
  id v4 = a3;
  if (([(CNContactContentViewController *)self isMemberOfClass:objc_opt_class()] & 1) != 0
    || [(CNContactContentViewController *)self isMemberOfClass:objc_opt_class()])
  {
    v5 = (CNContactContentViewController *)objc_msgSend(objc_alloc(+[CNContactContentViewController classForContentViewControllerImpl](CNContactContentViewController, "classForContentViewControllerImpl")), "initWithEnvironment:", v4);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNContactContentViewController;
    v5 = [(CNContactContentViewController *)&v8 initWithNibName:0 bundle:0];
  }
  v6 = v5;

  return v6;
}

+ (id)descriptorForRequiredKeysWithDescription:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_msgSend(a1, "classForContentViewControllerImpl"), "descriptorForRequiredKeysWithDescription:", v4);

  return v5;
}

- (int64_t)indexOfGroup:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (UITableView)tableView
{
  return 0;
}

- (void)setTableView:(id)a3
{
}

@end