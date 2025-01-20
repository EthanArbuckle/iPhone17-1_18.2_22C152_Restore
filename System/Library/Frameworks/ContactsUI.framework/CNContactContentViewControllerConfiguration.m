@interface CNContactContentViewControllerConfiguration
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
- (BOOL)highlightedPropertyImportant;
- (BOOL)ignoresParentalRestrictions;
- (BOOL)isMailVIP;
- (BOOL)isOutOfProcess;
- (BOOL)layoutPositionallyAfterNavBar;
- (BOOL)shouldDrawNavigationBar;
- (BOOL)shouldShowLinkedContacts;
- (BOOL)showContactBlockingFirst;
- (BOOL)showsGroupMembership;
- (BOOL)showsInlineActions;
- (BOOL)showsSharedProfile;
- (CNContactContentViewControllerConfiguration)init;
- (CNContactFormatter)contactFormatter;
- (CNContactStore)contactStore;
- (CNPolicy)policy;
- (NSArray)displayedProperties;
- (NSArray)highlightedProperties;
- (NSArray)prohibitedPropertyKeys;
- (NSAttributedString)verifiedInfoMessage;
- (NSDictionary)linkedPoliciesByContactIdentifier;
- (NSString)alternateName;
- (NSString)importantMessage;
- (NSString)initialPrompt;
- (NSString)message;
- (NSString)primaryProperty;
- (NSString)warningMessage;
- (UIView)personHeaderView;
- (UIViewController)personHeaderViewController;
- (id)initForOutOfProcess:(BOOL)a3;
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
- (void)setContactFormatter:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setDisplayedProperties:(id)a3;
- (void)setEditingProposedInformation:(BOOL)a3;
- (void)setHideCardActions:(BOOL)a3;
- (void)setHighlightedProperties:(id)a3;
- (void)setHighlightedPropertyImportant:(BOOL)a3;
- (void)setIgnoresParentalRestrictions:(BOOL)a3;
- (void)setImportantMessage:(id)a3;
- (void)setInitialPrompt:(id)a3;
- (void)setIsMailVIP:(BOOL)a3;
- (void)setIsOutOfProcess:(BOOL)a3;
- (void)setLayoutPositionallyAfterNavBar:(BOOL)a3;
- (void)setLinkedPoliciesByContactIdentifier:(id)a3;
- (void)setMessage:(id)a3;
- (void)setPersonHeaderView:(id)a3;
- (void)setPersonHeaderViewController:(id)a3;
- (void)setPolicy:(id)a3;
- (void)setPrimaryProperty:(id)a3;
- (void)setProhibitedPropertyKeys:(id)a3;
- (void)setShouldDrawNavigationBar:(BOOL)a3;
- (void)setShouldShowLinkedContacts:(BOOL)a3;
- (void)setShowContactBlockingFirst:(BOOL)a3;
- (void)setShowsGroupMembership:(BOOL)a3;
- (void)setShowsInlineActions:(BOOL)a3;
- (void)setShowsSharedProfile:(BOOL)a3;
- (void)setVerifiedInfoMessage:(id)a3;
- (void)setWarningMessage:(id)a3;
@end

@implementation CNContactContentViewControllerConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialPrompt, 0);
  objc_storeStrong((id *)&self->_linkedPoliciesByContactIdentifier, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_highlightedProperties, 0);
  objc_storeStrong((id *)&self->_personHeaderViewController, 0);
  objc_storeStrong((id *)&self->_personHeaderView, 0);
  objc_storeStrong((id *)&self->_primaryProperty, 0);
  objc_storeStrong((id *)&self->_verifiedInfoMessage, 0);
  objc_storeStrong((id *)&self->_importantMessage, 0);
  objc_storeStrong((id *)&self->_warningMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_alternateName, 0);
  objc_storeStrong((id *)&self->_displayedProperties, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
}

- (void)setLayoutPositionallyAfterNavBar:(BOOL)a3
{
  self->_layoutPositionallyAfterNavBar = a3;
}

- (BOOL)layoutPositionallyAfterNavBar
{
  return self->_layoutPositionallyAfterNavBar;
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

- (void)setHighlightedPropertyImportant:(BOOL)a3
{
  self->_highlightedPropertyImportant = a3;
}

- (BOOL)highlightedPropertyImportant
{
  return self->_highlightedPropertyImportant;
}

- (void)setHighlightedProperties:(id)a3
{
}

- (NSArray)highlightedProperties
{
  return self->_highlightedProperties;
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

- (void)setContactFormatter:(id)a3
{
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactStore:(id)a3
{
}

- (void)setProhibitedPropertyKeys:(id)a3
{
}

- (NSArray)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (void)setIsOutOfProcess:(BOOL)a3
{
  self->_isOutOfProcess = a3;
}

- (BOOL)isOutOfProcess
{
  return self->_isOutOfProcess;
}

- (CNContactStore)contactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1B990]);
    if ([MEMORY[0x1E4F1B8F8] suggestionsEnabled]) {
      [v4 setIncludeSuggestedContacts:1];
    }
    v5 = (CNContactStore *)[objc_alloc(MEMORY[0x1E4F1B980]) initWithConfiguration:v4];
    v6 = self->_contactStore;
    self->_contactStore = v5;

    contactStore = self->_contactStore;
  }

  return contactStore;
}

- (id)initForOutOfProcess:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CNContactContentViewControllerConfiguration;
  id v4 = [(CNContactContentViewControllerConfiguration *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_isOutOfProcess = a3;
    uint64_t v6 = +[CNContactView allCardProperties];
    displayedProperties = v5->_displayedProperties;
    v5->_displayedProperties = (NSArray *)v6;

    v5->_allowsEditing = 1;
    v5->_allowsActions = 1;
    *(_DWORD *)&v5->_allowsCardActions = 16843009;
    *(_DWORD *)&v5->_allowsSendMessage = 16777217;
    v5->_allowsSettingLinkedContactsAsPreferred = 1;
    *(_DWORD *)&v5->_allowsActionsModel = 65793;
    *(_WORD *)&v5->_showsInlineActions = 257;
    v5->_showsGroupMembership = 1;
    *(_WORD *)&v5->_hideCardActions = 0;
    v5->_showContactBlockingFirst = 0;
    uint64_t v8 = [MEMORY[0x1E4F1B910] sharedFullNameFormatter];
    contactFormatter = v5->_contactFormatter;
    v5->_contactFormatter = (CNContactFormatter *)v8;
  }
  return v5;
}

- (CNContactContentViewControllerConfiguration)init
{
  return (CNContactContentViewControllerConfiguration *)[(CNContactContentViewControllerConfiguration *)self initForOutOfProcess:0];
}

@end