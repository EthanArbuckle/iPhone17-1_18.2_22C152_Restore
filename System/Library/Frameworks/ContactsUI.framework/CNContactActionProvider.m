@interface CNContactActionProvider
- (CNCapabilitiesManager)capabilities;
- (CNContactAction)createReminderAction;
- (CNContactAction)disableGuardianRestrictionsAction;
- (CNContactAction)enableGuardianRestrictionsAction;
- (CNContactAction)shareContactAction;
- (CNContactAction)shareLocationAction;
- (CNContactAction)shareWithFamilyAction;
- (CNContactAction)stopSharingLocationAction;
- (CNContactAction)stopSharingWithFamilyAction;
- (CNContactActionProvider)initWithContact:(id)a3 inContainer:(id)a4 contactStore:(id)a5;
- (CNContactActionProvider)initWithContact:(id)a3 inContainer:(id)a4 contactStore:(id)a5 propertyGroupsDataSource:(id)a6 actionsDataSource:(id)a7 capabilities:(id)a8 environment:(id)a9;
- (CNContactAddFavoriteAction)addFavoriteAction;
- (CNContactAddLinkedCardAction)addLinkedCardAction;
- (CNContactAddStaticIdentityAction)addStaticIdentityAction;
- (CNContactAddToExistingContactAction)addToExistingContactAction;
- (CNContactCreateNewContactAction)createNewContactAction;
- (CNContactSelectContainersAction)containerSelectionAction;
- (CNContactStore)contactStore;
- (CNContainer)container;
- (CNMutableContact)contact;
- (CNPropertyActionDelegate)actionDelegate;
- (CNPropertyFaceTimeAction)faceTimeAction;
- (CNPropertyFaceTimeAction)faceTimeAudioAction;
- (CNPropertyGroupsDataSource)propertyGroupsDataSource;
- (CNPropertyLinkedCardsAction)linkedCardsAction;
- (CNPropertySendMessageAction)sendMessageAction;
- (CNPropertyStaticIdentityAction)staticIdentityAction;
- (CNUIContactsEnvironment)environment;
- (CNUIUserActionListDataSource)actionsDataSource;
- (id)_addCreateNewContactAction;
- (id)_addFavoriteActionWithConferencing:(BOOL)a3 telephony:(BOOL)a4;
- (id)_addLinkedCardAction;
- (id)_addToExistingContactAction;
- (id)_faceTimeAction;
- (id)_faceTimeAudioAction;
- (id)_linkedCardsAction;
- (id)_sendMessageActionAllowingEmailIDs:(BOOL)a3;
- (id)_shareContactAction;
- (id)appropriateLocationSharingActionWhenSharing:(BOOL)a3;
- (void)buildAddContactActions;
- (void)buildCommunicationLimitsActions;
- (void)buildContainerSelectionAction;
- (void)buildLinkedContactActions;
- (void)buildSharingLocationActionsWithShareLocationController:(id)a3;
- (void)buildStandardActions;
- (void)buildStaticIdentityActions;
- (void)setActionDelegate:(id)a3;
@end

@implementation CNContactActionProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_actionsDataSource, 0);
  objc_storeStrong((id *)&self->_propertyGroupsDataSource, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_disableGuardianRestrictionsAction, 0);
  objc_storeStrong((id *)&self->_enableGuardianRestrictionsAction, 0);
  objc_storeStrong((id *)&self->_stopSharingWithFamilyAction, 0);
  objc_storeStrong((id *)&self->_addStaticIdentityAction, 0);
  objc_storeStrong((id *)&self->_staticIdentityAction, 0);
  objc_storeStrong((id *)&self->_containerSelectionAction, 0);
  objc_storeStrong((id *)&self->_addToExistingContactAction, 0);
  objc_storeStrong((id *)&self->_createNewContactAction, 0);
  objc_storeStrong((id *)&self->_addLinkedCardAction, 0);
  objc_storeStrong((id *)&self->_linkedCardsAction, 0);
  objc_storeStrong((id *)&self->_stopSharingLocationAction, 0);
  objc_storeStrong((id *)&self->_shareLocationAction, 0);
  objc_storeStrong((id *)&self->_createReminderAction, 0);
  objc_storeStrong((id *)&self->_addFavoriteAction, 0);
  objc_storeStrong((id *)&self->_shareContactAction, 0);
  objc_storeStrong((id *)&self->_faceTimeAudioAction, 0);
  objc_storeStrong((id *)&self->_faceTimeAction, 0);
  objc_storeStrong((id *)&self->_sendMessageAction, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);

  objc_storeStrong((id *)&self->_shareWithFamilyAction, 0);
}

- (CNUIContactsEnvironment)environment
{
  return self->_environment;
}

- (CNCapabilitiesManager)capabilities
{
  return self->_capabilities;
}

- (CNUIUserActionListDataSource)actionsDataSource
{
  return self->_actionsDataSource;
}

- (CNPropertyGroupsDataSource)propertyGroupsDataSource
{
  return self->_propertyGroupsDataSource;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNContainer)container
{
  return self->_container;
}

- (CNMutableContact)contact
{
  return self->_contact;
}

- (CNContactAction)disableGuardianRestrictionsAction
{
  return self->_disableGuardianRestrictionsAction;
}

- (CNContactAction)enableGuardianRestrictionsAction
{
  return self->_enableGuardianRestrictionsAction;
}

- (CNContactAction)stopSharingWithFamilyAction
{
  return self->_stopSharingWithFamilyAction;
}

- (CNContactAddStaticIdentityAction)addStaticIdentityAction
{
  return self->_addStaticIdentityAction;
}

- (CNPropertyStaticIdentityAction)staticIdentityAction
{
  return self->_staticIdentityAction;
}

- (CNContactSelectContainersAction)containerSelectionAction
{
  return self->_containerSelectionAction;
}

- (CNContactAddToExistingContactAction)addToExistingContactAction
{
  return self->_addToExistingContactAction;
}

- (CNContactCreateNewContactAction)createNewContactAction
{
  return self->_createNewContactAction;
}

- (CNContactAddLinkedCardAction)addLinkedCardAction
{
  return self->_addLinkedCardAction;
}

- (CNPropertyLinkedCardsAction)linkedCardsAction
{
  return self->_linkedCardsAction;
}

- (CNContactAction)stopSharingLocationAction
{
  return self->_stopSharingLocationAction;
}

- (CNContactAction)shareLocationAction
{
  return self->_shareLocationAction;
}

- (CNContactAction)createReminderAction
{
  return self->_createReminderAction;
}

- (CNContactAddFavoriteAction)addFavoriteAction
{
  return self->_addFavoriteAction;
}

- (CNContactAction)shareContactAction
{
  return self->_shareContactAction;
}

- (CNPropertyFaceTimeAction)faceTimeAudioAction
{
  return self->_faceTimeAudioAction;
}

- (CNPropertyFaceTimeAction)faceTimeAction
{
  return self->_faceTimeAction;
}

- (CNPropertySendMessageAction)sendMessageAction
{
  return self->_sendMessageAction;
}

- (void)setActionDelegate:(id)a3
{
}

- (CNPropertyActionDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  return (CNPropertyActionDelegate *)WeakRetained;
}

- (CNContactAction)shareWithFamilyAction
{
  if ([MEMORY[0x1E4F1B8F8] downtimeWhitelistUIEnabled]) {
    v3 = self->_shareWithFamilyAction;
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (id)_addLinkedCardAction
{
  v3 = [CNContactAddLinkedCardAction alloc];
  v4 = [(CNContactActionProvider *)self contact];
  v5 = [(CNContactAction *)v3 initWithContact:v4];

  v6 = [(CNContactActionProvider *)self actionDelegate];
  [(CNContactAction *)v5 setDelegate:v6];

  return v5;
}

- (id)_linkedCardsAction
{
  v3 = [CNPropertyLinkedCardsAction alloc];
  v4 = [(CNContactActionProvider *)self contact];
  v5 = [(CNPropertyLinkedCardsAction *)v3 initWithContact:v4];

  v6 = [(CNContactActionProvider *)self actionDelegate];
  [(CNContactAction *)v5 setDelegate:v6];

  return v5;
}

- (id)_shareContactAction
{
  v3 = [(CNContactActionProvider *)self contact];
  char v4 = [v3 isSuggested];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v6 = [(CNContactActionProvider *)self contact];
    v7 = [v6 mainStoreLinkedContacts];
    if ([v6 isUnified])
    {
      v8 = [v6 linkedContacts];
      char v9 = [v8 isEqual:v7];

      if ((v9 & 1) == 0)
      {
        uint64_t v10 = [MEMORY[0x1E4F1B8F8] unifyContacts:v7];

        v6 = (void *)v10;
      }
    }
    v5 = [(CNContactAction *)[CNContactShareContactAction alloc] initWithContact:v6];
    v11 = [(CNContactActionProvider *)self actionDelegate];
    [(CNContactAction *)v5 setDelegate:v11];
  }

  return v5;
}

- (id)_faceTimeAudioAction
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v3 = [(CNContactActionProvider *)self propertyGroupsDataSource];
  uint64_t v4 = *MEMORY[0x1E4F1ADC8];
  v12[0] = *MEMORY[0x1E4F1AEE0];
  v12[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v6 = [v3 allDisplayPropertyItemsForPropertyKeys:v5];

  v7 = [CNPropertyFaceTimeAction alloc];
  v8 = [(CNContactActionProvider *)self contact];
  char v9 = [(CNPropertyFaceTimeAction *)v7 initWithContact:v8 propertyItems:v6];

  [(CNPropertyFaceTimeAction *)v9 setType:1];
  uint64_t v10 = [(CNContactActionProvider *)self actionDelegate];
  [(CNContactAction *)v9 setDelegate:v10];

  return v9;
}

- (id)_faceTimeAction
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v3 = [(CNContactActionProvider *)self propertyGroupsDataSource];
  uint64_t v4 = *MEMORY[0x1E4F1ADC8];
  v12[0] = *MEMORY[0x1E4F1AEE0];
  v12[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v6 = [v3 allDisplayPropertyItemsForPropertyKeys:v5];

  v7 = [CNPropertyFaceTimeAction alloc];
  v8 = [(CNContactActionProvider *)self contact];
  char v9 = [(CNPropertyFaceTimeAction *)v7 initWithContact:v8 propertyItems:v6];

  uint64_t v10 = [(CNContactActionProvider *)self actionDelegate];
  [(CNContactAction *)v9 setDelegate:v10];

  return v9;
}

- (id)_addFavoriteActionWithConferencing:(BOOL)a3 telephony:(BOOL)a4
{
  v17[4] = *MEMORY[0x1E4F143B8];
  v5 = [(CNContactActionProvider *)self propertyGroupsDataSource];
  uint64_t v6 = *MEMORY[0x1E4F1ADC8];
  v17[0] = *MEMORY[0x1E4F1AEE0];
  v17[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F1AE60];
  v17[2] = *MEMORY[0x1E4F1AF78];
  v17[3] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
  char v9 = [v5 allDisplayPropertyItemsForPropertyKeys:v8];

  uint64_t v10 = [CNContactAddFavoriteAction alloc];
  v11 = [(CNContactActionProvider *)self contact];
  v12 = [(CNContactActionProvider *)self environment];
  v13 = [v12 inProcessFavorites];
  v14 = [(CNContactAddFavoriteAction *)v10 initWithContact:v11 propertyItems:v9 favorites:v13];

  v15 = [(CNContactActionProvider *)self actionDelegate];
  [(CNContactAction *)v14 setDelegate:v15];

  return v14;
}

- (id)_sendMessageActionAllowingEmailIDs:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = [(CNContactActionProvider *)self propertyGroupsDataSource];
  if (v3)
  {
    uint64_t v6 = *MEMORY[0x1E4F1ADC8];
    uint64_t v19 = *MEMORY[0x1E4F1AEE0];
    uint64_t v20 = v6;
    uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
    v8 = &v19;
    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v18 = *MEMORY[0x1E4F1AEE0];
    uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
    v8 = &v18;
    uint64_t v9 = 1;
  }
  uint64_t v10 = objc_msgSend(v7, "arrayWithObjects:count:", v8, v9, v18, v19, v20);
  v11 = [v5 allDisplayPropertyItemsForPropertyKeys:v10];

  v12 = [CNPropertySendMessageAction alloc];
  v13 = [(CNContactActionProvider *)self contact];
  v14 = [(CNContactActionProvider *)self actionsDataSource];
  v15 = [(CNPropertySendMessageAction *)v12 initWithContact:v13 propertyItems:v11 actionDataSource:v14];

  v16 = [(CNContactActionProvider *)self actionDelegate];
  [(CNContactAction *)v15 setDelegate:v16];

  return v15;
}

- (id)_addToExistingContactAction
{
  BOOL v3 = [CNContactAddToExistingContactAction alloc];
  uint64_t v4 = [(CNContactActionProvider *)self contact];
  v5 = [(CNContactAction *)v3 initWithContact:v4];

  return v5;
}

- (id)_addCreateNewContactAction
{
  BOOL v3 = [CNContactCreateNewContactAction alloc];
  uint64_t v4 = [(CNContactActionProvider *)self contact];
  v5 = [(CNContactAction *)v3 initWithContact:v4];

  return v5;
}

- (id)appropriateLocationSharingActionWhenSharing:(BOOL)a3
{
  if (a3) {
    [(CNContactActionProvider *)self stopSharingLocationAction];
  }
  else {
  BOOL v3 = [(CNContactActionProvider *)self shareLocationAction];
  }

  return v3;
}

- (void)buildStaticIdentityActions
{
  BOOL v3 = [CNPropertyStaticIdentityAction alloc];
  uint64_t v4 = [(CNContactActionProvider *)self contact];
  v5 = [(CNPropertyAction *)v3 initWithContact:v4];
  staticIdentityAction = self->_staticIdentityAction;
  self->_staticIdentityAction = v5;

  uint64_t v7 = [(CNContactActionProvider *)self actionDelegate];
  [(CNContactAction *)self->_staticIdentityAction setDelegate:v7];

  v8 = [CNContactAddStaticIdentityAction alloc];
  uint64_t v9 = [(CNContactActionProvider *)self contact];
  uint64_t v10 = [(CNContactAction *)v8 initWithContact:v9];
  addStaticIdentityAction = self->_addStaticIdentityAction;
  self->_addStaticIdentityAction = v10;

  id v12 = [(CNContactActionProvider *)self actionDelegate];
  [(CNContactAction *)self->_addStaticIdentityAction setDelegate:v12];
}

- (void)buildContainerSelectionAction
{
  BOOL v3 = objc_alloc_init(CNContactSelectContainersAction);
  containerSelectionAction = self->_containerSelectionAction;
  self->_containerSelectionAction = v3;

  id v5 = [(CNContactActionProvider *)self actionDelegate];
  [(CNContactAction *)self->_containerSelectionAction setDelegate:v5];
}

- (void)buildCommunicationLimitsActions
{
  BOOL v3 = [CNContactShareWithFamilyAction alloc];
  uint64_t v4 = [(CNContactActionProvider *)self contact];
  id v5 = [(CNContactAction *)v3 initWithContact:v4];
  shareWithFamilyAction = self->_shareWithFamilyAction;
  self->_shareWithFamilyAction = v5;

  uint64_t v7 = [(CNContactActionProvider *)self actionDelegate];
  [(CNContactAction *)self->_shareWithFamilyAction setDelegate:v7];

  v8 = [CNContactStopSharingWithFamily alloc];
  uint64_t v9 = [(CNContactActionProvider *)self contact];
  uint64_t v10 = [(CNContactAction *)v8 initWithContact:v9];
  stopSharingWithFamilyAction = self->_stopSharingWithFamilyAction;
  self->_stopSharingWithFamilyAction = v10;

  id v12 = [(CNContactActionProvider *)self actionDelegate];
  [(CNContactAction *)self->_stopSharingWithFamilyAction setDelegate:v12];

  v13 = [CNContactEnableGuardianRestrictionsAction alloc];
  v14 = [(CNContactActionProvider *)self contact];
  v15 = [(CNContactActionProvider *)self container];
  v16 = [(CNContactActionProvider *)self contactStore];
  v17 = [(CNContactEnableGuardianRestrictionsAction *)v13 initWithContact:v14 inContainer:v15 contactStore:v16];
  enableGuardianRestrictionsAction = self->_enableGuardianRestrictionsAction;
  self->_enableGuardianRestrictionsAction = v17;

  uint64_t v19 = [CNContactDisableGuardianRestrictionsAction alloc];
  id v24 = [(CNContactActionProvider *)self contact];
  uint64_t v20 = [(CNContactActionProvider *)self container];
  uint64_t v21 = [(CNContactActionProvider *)self contactStore];
  v22 = [(CNContactDisableGuardianRestrictionsAction *)v19 initWithContact:v24 inContainer:v20 contactStore:v21];
  disableGuardianRestrictionsAction = self->_disableGuardianRestrictionsAction;
  self->_disableGuardianRestrictionsAction = v22;
}

- (void)buildAddContactActions
{
  BOOL v3 = [(CNContactActionProvider *)self contact];
  int v4 = [v3 isUnknown];

  if (v4)
  {
    id v5 = [(CNContactActionProvider *)self _addCreateNewContactAction];
    createNewContactAction = self->_createNewContactAction;
    self->_createNewContactAction = v5;

    uint64_t v7 = [(CNContactActionProvider *)self _addToExistingContactAction];
    addToExistingContactAction = self->_addToExistingContactAction;
    self->_addToExistingContactAction = v7;
  }
}

- (void)buildLinkedContactActions
{
  BOOL v3 = [(CNContactActionProvider *)self _linkedCardsAction];
  linkedCardsAction = self->_linkedCardsAction;
  self->_linkedCardsAction = v3;

  id v5 = [(CNContactActionProvider *)self _addLinkedCardAction];
  addLinkedCardAction = self->_addLinkedCardAction;
  self->_addLinkedCardAction = v5;
}

- (void)buildSharingLocationActionsWithShareLocationController:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__CNContactActionProvider_buildSharingLocationActionsWithShareLocationController___block_invoke;
  v6[3] = &unk_1E5499A38;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [v5 canShareWithCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __82__CNContactActionProvider_buildSharingLocationActionsWithShareLocationController___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained && a2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __82__CNContactActionProvider_buildSharingLocationActionsWithShareLocationController___block_invoke_2;
    v6[3] = &unk_1E549BF80;
    void v6[4] = WeakRetained;
    id v7 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __82__CNContactActionProvider_buildSharingLocationActionsWithShareLocationController___block_invoke_2(uint64_t a1)
{
  v2 = CNContactsUIBundle();
  BOOL v3 = [v2 localizedStringForKey:@"SHARE_LOCATION_STOP_SHARING_LABEL_TEXT" value:&stru_1ED8AC728 table:@"Localized"];
  uint64_t v4 = +[CNContactAction contactActionWithTitle:v3 target:*(void *)(a1 + 40) selector:sel_perform_ destructive:1];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v4;

  CNContactsUIBundle();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v11 localizedStringForKey:@"SHARE_LOCATION_LABEL_TEXT" value:&stru_1ED8AC728 table:@"Localized"];
  uint64_t v8 = +[CNContactAction contactActionWithTitle:v7 target:*(void *)(a1 + 40) selector:sel_perform_ destructive:0];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 72);
  *(void *)(v9 + 72) = v8;
}

- (void)buildStandardActions
{
  BOOL v3 = [(CNContactActionProvider *)self propertyGroupsDataSource];

  if (!v3) {
    return;
  }
  uint64_t v4 = [(CNContactActionProvider *)self actionsDataSource];

  if (!v4) {
    return;
  }
  uint64_t v5 = [(CNContactActionProvider *)self capabilities];

  if (!v5) {
    return;
  }
  id v41 = [(CNContactActionProvider *)self capabilities];
  unsigned int v39 = [v41 hasCellularTelephonyCapability];
  int v40 = [v41 areFavoritesAvailable];
  int v6 = [v41 isMMSConfigured];
  int v7 = [v41 isMadridConfigured];
  unsigned int v8 = [v41 isConferencingAvailable];
  int v37 = [v41 isFaceTimeAudioAvailable];
  int v9 = [v41 isMessagesAppAvailable];
  int v38 = [v41 isPhoneAppAvailable];
  int v10 = [v41 isFaceTimeAppAvailable];
  id v11 = [(CNContactActionProvider *)self contact];
  id v12 = [v11 phoneNumbers];
  uint64_t v13 = [v12 count];

  v14 = [(CNContactActionProvider *)self contact];
  v15 = [v14 emailAddresses];
  uint64_t v16 = [v15 count];

  v17 = [(CNContactActionProvider *)self contact];
  uint64_t v18 = [v17 socialProfiles];
  *((void *)&v36 + 1) = [v18 count];

  uint64_t v19 = [(CNContactActionProvider *)self contact];
  uint64_t v20 = [v19 instantMessageAddresses];
  *(void *)&long long v36 = [v20 count];

  if (([MEMORY[0x1E4F1B8F8] quickActionsEnabled] & 1) == 0 && v9)
  {
    char v21 = v13 ? v39 | v7 : 0;
    int v22 = v16 ? v6 | v7 : 0;
    if ((v21 & 1) != 0 || v22)
    {
      -[CNContactActionProvider _sendMessageActionAllowingEmailIDs:](self, "_sendMessageActionAllowingEmailIDs:");
      v23 = (CNPropertySendMessageAction *)objc_claimAutoreleasedReturnValue();
      sendMessageAction = self->_sendMessageAction;
      self->_sendMessageAction = v23;
    }
  }
  if (self->_faceTimeAction) {
    unsigned int v25 = 0;
  }
  else {
    unsigned int v25 = v8;
  }
  if (v25 == 1 && v13 | v16 && ((v10 ^ 1) & 1) == 0)
  {
    v26 = [(CNContactActionProvider *)self _faceTimeAction];
    faceTimeAction = self->_faceTimeAction;
    self->_faceTimeAction = v26;
  }
  if (self->_faceTimeAudioAction) {
    unsigned int v28 = 0;
  }
  else {
    unsigned int v28 = v8;
  }
  if (v28 == 1 && v13 | v16 && ((v10 ^ 1) & 1) == 0 && ((v37 ^ 1) & 1) == 0)
  {
    v29 = [(CNContactActionProvider *)self _faceTimeAudioAction];
    faceTimeAudioAction = self->_faceTimeAudioAction;
    self->_faceTimeAudioAction = v29;
  }
  v31 = [(CNContactActionProvider *)self _shareContactAction];
  shareContactAction = self->_shareContactAction;
  self->_shareContactAction = v31;

  if (v40)
  {
    addFavoriteAction = [(CNContactActionProvider *)self contact];
    if (([addFavoriteAction isUnknown] & 1) == 0)
    {
      if (v38 && v13 || (v13 | v16 ? (int v34 = v10) : (int v34 = 0), v34 == 1))
      {
      }
      else
      {

        if (v36 == 0) {
          goto LABEL_41;
        }
      }
      v35 = [(CNContactActionProvider *)self _addFavoriteActionWithConferencing:v10 & v8 telephony:v38 & v39];
      addFavoriteAction = self->_addFavoriteAction;
      self->_addFavoriteAction = v35;
    }
  }
LABEL_41:
}

- (CNContactActionProvider)initWithContact:(id)a3 inContainer:(id)a4 contactStore:(id)a5 propertyGroupsDataSource:(id)a6 actionsDataSource:(id)a7 capabilities:(id)a8 environment:(id)a9
{
  id v26 = a3;
  id v25 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v16 = a8;
  id v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)CNContactActionProvider;
  uint64_t v18 = [(CNContactActionProvider *)&v27 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_contact, a3);
    objc_storeStrong((id *)&v19->_container, a4);
    objc_storeStrong((id *)&v19->_contactStore, a5);
    objc_storeStrong((id *)&v19->_propertyGroupsDataSource, a6);
    objc_storeStrong((id *)&v19->_actionsDataSource, a7);
    objc_storeStrong((id *)&v19->_capabilities, a8);
    objc_storeStrong((id *)&v19->_environment, a9);
    uint64_t v20 = v19;
  }

  return v19;
}

- (CNContactActionProvider)initWithContact:(id)a3 inContainer:(id)a4 contactStore:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[CNUIContactsEnvironment currentEnvironment];
  id v12 = [(CNContactActionProvider *)self initWithContact:v10 inContainer:v9 contactStore:v8 propertyGroupsDataSource:0 actionsDataSource:0 capabilities:0 environment:v11];

  return v12;
}

@end