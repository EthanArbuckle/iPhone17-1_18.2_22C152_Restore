@interface CKDetailsContactsManager
- (BOOL)_hasLinkedTelephoneNumbersForEntity:(id)a3;
- (BOOL)_isHandleActiveParticipantInTUConversation:(id)a3;
- (BOOL)_preferredRoutesDisabledViaServerBag;
- (BOOL)_showFaceTimeVideoButtonForEntity:(id)a3;
- (BOOL)_showMessageButtonForEntity:(id)a3;
- (BOOL)_showPhoneButtonForEntity:(id)a3;
- (BOOL)hasPreferredCallServiceForEntity:(id)a3;
- (BOOL)isFaceTimeAudioAvailableForEntity:(id)a3;
- (BOOL)isFaceTimeVideoAvailableForEntity:(id)a3;
- (BOOL)isTelephonyCallAvailableForEntity:(id)a3;
- (BOOL)shouldAlwaysShowCallMenuForEntity:(id)a3;
- (BOOL)showScreenSharingButtonForEntity:(id)a3;
- (CKConversation)conversation;
- (CKDetailsContactsManager)initWithConversation:(id)a3 delegate:(id)a4;
- (CKDetailsContactsManagerDelegate)delegate;
- (NSArray)contacts;
- (NSArray)contactsViewModels;
- (NSDictionary)facetimeAudioIDStatuses;
- (NSDictionary)facetimeIDStatuses;
- (NSDictionary)modernScreenSharingCapabilities;
- (NSDictionary)screenSharingIDSStatuses;
- (NSString)serviceAvailabilityKey;
- (id)_preferredCallServiceToIDMap;
- (id)callActionsForEntity:(id)a3;
- (id)callMenuForEntity:(id)a3;
- (id)contextMenuForEntity:(id)a3 atom:(id)a4;
- (id)contextMenuForUnknownRecipient:(id)a3 atom:(id)a4;
- (id)conversationContextMenuConfigForEntity:(id)a3 allowConversationRemoval:(BOOL)a4;
- (id)conversationContextMenuForEntity:(id)a3 allowConversationRemoval:(BOOL)a4;
- (id)conversationContextMenuForUnknownEntity:(id)a3 allowConversationRemoval:(BOOL)a4 showUnknownContactActionInPopover:(BOOL)a5 unknownContactActionHandler:(id)a6;
- (id)recipientsSortedByIsContact:(BOOL)a3 alphabetically:(BOOL)a4;
- (id)viewModelsSortedByIsContact:(BOOL)a3 alphabetically:(BOOL)a4;
- (int64_t)_facetimeAudioIDStatusForEntity:(id)a3;
- (int64_t)_facetimeIDStatusForEntity:(id)a3;
- (int64_t)_screenSharingStatusForEntity:(id)a3;
- (unint64_t)preferredCallServiceForID:(id)a3;
- (void)_callButtonPressedWithVideoEnabled:(BOOL)a3;
- (void)_conversationJoinStateDidChange:(id)a3;
- (void)_handleAddressBookChange:(id)a3;
- (void)_handleConversationPendingRecipientsDidChange:(id)a3;
- (void)_handleConversationRecipientsDidChange:(id)a3;
- (void)_handleLocationChanged:(id)a3;
- (void)_handleMultiwayStateChanged:(id)a3;
- (void)_performUpdateViewModels;
- (void)_refreshIDSStatusWithCompletion:(id)a3;
- (void)_setPreferredCallServiceToIDMap:(id)a3;
- (void)_startCallWithEntity:(id)a3 phoneAddress:(id)a4;
- (void)_startCommunicationForEntity:(id)a3 usePreferredRouteIfAvailable:(BOOL)a4;
- (void)_startFacetimeCommunicationForEntity:(id)a3 audioOnly:(BOOL)a4;
- (void)_startMessageWithEntity:(id)a3;
- (void)_updateViewModelsWithDelay:(BOOL)a3;
- (void)beginFacetimeCallWithVideo:(BOOL)a3;
- (void)callableAddressesForEntity:(id)a3 withResult:(id)a4;
- (void)dealloc;
- (void)inviteEntityToShareTheirScreen:(id)a3;
- (void)sendEmail;
- (void)setContactsViewModels:(id)a3;
- (void)setConversation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFacetimeAudioIDStatuses:(id)a3;
- (void)setFacetimeIDStatuses:(id)a3;
- (void)setModernScreenSharingCapabilities:(id)a3;
- (void)setPreferredCallService:(unint64_t)a3 forID:(id)a4;
- (void)setScreenSharingIDSStatuses:(id)a3;
- (void)setServiceAvailabilityKey:(id)a3;
- (void)shareMyScreenWithEntity:(id)a3;
- (void)startAudioCommunicationUsingPreferredRouteIfAvailable:(BOOL)a3;
- (void)startCommunicationForEntity:(id)a3 action:(unint64_t)a4 address:(id)a5;
- (void)startCommunicationForEntity:(id)a3 action:(unint64_t)a4 address:(id)a5 usePreferredRouteIfAvailable:(BOOL)a6;
- (void)startCommunicationForViewModel:(id)a3 action:(unint64_t)a4 address:(id)a5;
@end

@implementation CKDetailsContactsManager

- (CKDetailsContactsManager)initWithConversation:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CKDetailsContactsManager *)self init];
  v9 = v8;
  if (v8)
  {
    [(CKDetailsContactsManager *)v8 setConversation:v6];
    v10 = [NSString stringGUIDForObject:v9];
    [(CKDetailsContactsManager *)v9 setServiceAvailabilityKey:v10];

    [(CKDetailsContactsManager *)v9 setDelegate:v7];
    v11 = [MEMORY[0x1E4F61730] sharedInstance];
    v12 = [(CKDetailsContactsManager *)v9 serviceAvailabilityKey];
    [v11 addListenerID:v12 forService:0];

    v13 = [(CKDetailsContactsManager *)v9 serviceAvailabilityKey];
    [v11 addListenerID:v13 forService:2];

    v14 = [MEMORY[0x1E4F6AB38] sharedInstance];
    v15 = [(CKDetailsContactsManager *)v9 serviceAvailabilityKey];
    [v14 addListenerID:v15 forService:*MEMORY[0x1E4F6AA50]];

    v16 = [MEMORY[0x1E4F6AB38] sharedInstance];
    v17 = [(CKDetailsContactsManager *)v9 serviceAvailabilityKey];
    [v16 addListenerID:v17 forService:*MEMORY[0x1E4F6AA48]];

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v9 selector:sel__handleConversationRecipientsDidChange_ name:@"CKConversationParticipantsDidChangeNotification" object:v6];

    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v9 selector:sel__handleConversationRecipientsDidChange_ name:@"CKConversationJoinStateDidChangeNotification" object:v6];

    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v9 selector:sel__handleAddressBookChange_ name:*MEMORY[0x1E4F6CA50] object:0];

    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v9 selector:sel__handleLocationChanged_ name:*MEMORY[0x1E4F6BAF8] object:0];

    v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 addObserver:v9 selector:sel__handleConversationPendingRecipientsDidChange_ name:@"CKConversationPendingRecipientsUpdatedNotification" object:v6];

    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v9 selector:sel__handleMultiwayStateChanged_ name:*MEMORY[0x1E4F6B9C0] object:0];

    [(CKDetailsContactsManager *)v9 _updateViewModelsWithDelay:0];
    id location = 0;
    objc_initWeak(&location, v9);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __58__CKDetailsContactsManager_initWithConversation_delegate___block_invoke;
    v25[3] = &unk_1E56215C8;
    objc_copyWeak(&v26, &location);
    [(CKDetailsContactsManager *)v9 _refreshIDSStatusWithCompletion:v25];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v9;
}

void __58__CKDetailsContactsManager_initWithConversation_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateViewModelsWithDelay:1];
}

- (void)_updateViewModelsWithDelay:(BOOL)a3
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__performUpdateViewModels object:0];

  [(CKDetailsContactsManager *)self performSelector:sel__performUpdateViewModels withObject:0 afterDelay:0.0];
}

- (void)_performUpdateViewModels
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__81;
  v12 = __Block_byref_object_dispose__81;
  id v13 = 0;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = [(CKDetailsContactsManager *)self recipientsSortedByIsContact:1 alphabetically:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__CKDetailsContactsManager__performUpdateViewModels__block_invoke;
  v7[3] = &unk_1E5625F70;
  v7[4] = self;
  v7[5] = &v8;
  [v3 enumerateObjectsUsingBlock:v7];

  [(CKDetailsContactsManager *)self setContactsViewModels:v9[5]];
  v4 = [(CKDetailsContactsManager *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CKDetailsContactsManager *)self delegate];
    [v6 contactsManagerViewModelsDidChange:self];
  }
  _Block_object_dispose(&v8, 8);
}

void __52__CKDetailsContactsManager__performUpdateViewModels__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v53 = a2;
  v2 = [MEMORY[0x1E4F6BCB8] sharedInstance];
  v3 = [v53 defaultIMHandle];
  v4 = [v2 findMyLocationForHandleOrSibling:v3];
  v51 = [v4 fmfLocation];

  if (v51)
  {
    v50 = [v51 locationShortAddressWithAgeIncludeLocating];
  }
  else
  {
    v50 = 0;
  }
  if ([MEMORY[0x1E4F6C408] isEngramEnabled])
  {
    char v5 = [*(id *)(a1 + 32) conversation];
    id v6 = [v5 pendingRecipients];

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) conversation];
      uint64_t v8 = [v7 pendingRecipients];
      v9 = [v53 defaultIMHandle];
      int v10 = [v8 containsObject:v9];
    }
    else
    {
      int v10 = 0;
    }
    char v49 = v10;
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = @"NO";
        if (v10) {
          v12 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        v55 = v12;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "isPendingRecipient: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    char v49 = 0;
  }
  id v13 = [*(id *)(a1 + 32) conversation];
  v14 = [v13 chat];
  v15 = [v14 conversation];

  if (v15)
  {
    v16 = *(void **)(a1 + 32);
    v17 = [v53 rawAddress];
    unsigned int v48 = [v16 _isHandleActiveParticipantInTUConversation:v17];
  }
  else
  {
    unsigned int v48 = 0;
  }
  v18 = (void *)MEMORY[0x1E4F6BCC0];
  v19 = [*(id *)(a1 + 32) conversation];
  v20 = [v19 chat];
  v21 = [v20 conversation];
  LOBYTE(v18) = [v18 activeTUConversationHasActivitySession:v21];

  if (v18)
  {
    uint64_t v22 = 3;
  }
  else
  {
    v23 = [*(id *)(a1 + 32) conversation];
    v24 = [v23 chat];
    v25 = [v24 conversation];
    char v26 = [v25 isVideo];

    if (v26)
    {
      uint64_t v22 = 2;
    }
    else
    {
      v27 = [*(id *)(a1 + 32) conversation];
      v28 = [v27 chat];
      v29 = [v28 conversation];
      int v30 = [v29 isVideo];

      uint64_t v22 = v30 ^ 1u;
    }
  }
  uint64_t v47 = v22;
  BOOL v46 = v15 != 0;
  v31 = [CKDetailsContactsViewModel alloc];
  if (v50) {
    BOOL v32 = v51 != 0;
  }
  else {
    BOOL v32 = 0;
  }
  BOOL v45 = v32;
  uint64_t v33 = [*(id *)(a1 + 32) _showMessageButtonForEntity:v53];
  char v34 = [*(id *)(a1 + 32) _showFaceTimeVideoButtonForEntity:v53];
  char v35 = [*(id *)(a1 + 32) _showPhoneButtonForEntity:v53];
  char v36 = [*(id *)(a1 + 32) showScreenSharingButtonForEntity:v53];
  v37 = +[CKDetailsContactsViewModel descriptorForContactRequiredKeys];
  v38 = [v53 cnContactWithKeys:v37];
  v39 = [*(id *)(a1 + 32) conversation];
  char v40 = [v39 hasVerifiedBusiness];
  v41 = [*(id *)(a1 + 32) conversation];
  BYTE3(v44) = v46;
  BYTE2(v44) = [v41 isStewieConversation];
  BYTE1(v44) = v40;
  LOBYTE(v44) = v49;
  BYTE2(v43) = v36;
  BYTE1(v43) = v35;
  LOBYTE(v43) = v34;
  v42 = -[CKDetailsContactsViewModel initWithEntity:locationString:tuConversationStatusIsActive:callType:showsLocation:showsMessageButton:showsFaceTimeVideoButton:showsPhoneButton:showsScreenSharingButton:contact:isPendingRecipient:verified:isSatellite:showsTUConversationStatus:](v31, "initWithEntity:locationString:tuConversationStatusIsActive:callType:showsLocation:showsMessageButton:showsFaceTimeVideoButton:showsPhoneButton:showsScreenSharingButton:contact:isPendingRecipient:verified:isSatellite:showsTUConversationStatus:", v53, v50, v48, v47, v45, v33, v43, v38, v44);

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v42];
}

- (BOOL)_isHandleActiveParticipantInTUConversation:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(CKDetailsContactsManager *)self conversation];
  id v6 = [v5 chat];
  id v7 = [v6 activeParticipantsForTUConversation];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "handle", (void)v16);
        id v13 = [v12 value];
        char v14 = [v13 isEqualToString:v4];

        if (v14)
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (NSArray)contacts
{
  v2 = [(CKDetailsContactsManager *)self conversation];
  v3 = [v2 recipients];

  return (NSArray *)v3;
}

- (id)viewModelsSortedByIsContact:(BOOL)a3 alphabetically:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v5)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"entity.defaultIMHandle.isContact" ascending:0];
    [v7 addObject:v8];
  }
  if (v4)
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"entity.fullName" ascending:1 selector:sel_caseInsensitiveCompare_];
    [v7 addObject:v9];
  }
  uint64_t v10 = [(CKDetailsContactsManager *)self contactsViewModels];
  v11 = [v10 sortedArrayUsingDescriptors:v7];

  return v11;
}

- (id)recipientsSortedByIsContact:(BOOL)a3 alphabetically:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(CKDetailsContactsManager *)self conversation];
  id v7 = [v6 recipientsSortedByIsContact:v5 alphabetically:v4];

  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F61730] sharedInstance];
  BOOL v4 = [(CKDetailsContactsManager *)self serviceAvailabilityKey];
  [v3 removeListenerID:v4 forService:0];

  BOOL v5 = [(CKDetailsContactsManager *)self serviceAvailabilityKey];
  [v3 removeListenerID:v5 forService:2];

  id v6 = [MEMORY[0x1E4F6AB38] sharedInstance];
  id v7 = [(CKDetailsContactsManager *)self serviceAvailabilityKey];
  [v6 removeListenerID:v7 forService:*MEMORY[0x1E4F6AA50]];

  id v8 = [MEMORY[0x1E4F6AB38] sharedInstance];
  uint64_t v9 = [(CKDetailsContactsManager *)self serviceAvailabilityKey];
  [v8 removeListenerID:v9 forService:*MEMORY[0x1E4F6AA48]];

  uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 removeObserver:self];

  v11.receiver = self;
  v11.super_class = (Class)CKDetailsContactsManager;
  [(CKDetailsContactsManager *)&v11 dealloc];
}

- (void)_handleLocationChanged:(id)a3
{
  id v9 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [v9 fmfHandle];
    if (v4)
    {
      BOOL v5 = [(CKDetailsContactsManager *)self conversation];
      id v6 = [v5 chat];
      id v7 = [v6 allSiblingFMFHandles];
      int v8 = [v7 containsObject:v4];

      if (v8) {
        [(CKDetailsContactsManager *)self _updateViewModelsWithDelay:1];
      }
    }
  }
  else
  {
    BOOL v4 = 0;
  }
}

- (void)_handleConversationRecipientsDidChange:(id)a3
{
}

- (void)_conversationJoinStateDidChange:(id)a3
{
}

- (void)_handleConversationPendingRecipientsDidChange:(id)a3
{
}

- (void)_handleAddressBookChange:(id)a3
{
}

- (void)_handleMultiwayStateChanged:(id)a3
{
}

- (id)conversationContextMenuConfigForEntity:(id)a3 allowConversationRemoval:(BOOL)a4
{
  BOOL v4 = [(CKDetailsContactsManager *)self conversationContextMenuForEntity:a3 allowConversationRemoval:a4];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = (void *)MEMORY[0x1E4F428F0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __92__CKDetailsContactsManager_conversationContextMenuConfigForEntity_allowConversationRemoval___block_invoke;
    v9[3] = &unk_1E56212E0;
    id v10 = v4;
    id v7 = [v6 configurationWithIdentifier:0 previewProvider:0 actionProvider:v9];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id __92__CKDetailsContactsManager_conversationContextMenuConfigForEntity_allowConversationRemoval___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)conversationContextMenuForEntity:(id)a3 allowConversationRemoval:(BOOL)a4
{
  return [(CKDetailsContactsManager *)self conversationContextMenuForUnknownEntity:a3 allowConversationRemoval:a4 showUnknownContactActionInPopover:0 unknownContactActionHandler:0];
}

- (id)conversationContextMenuForUnknownEntity:(id)a3 allowConversationRemoval:(BOOL)a4 showUnknownContactActionInPopover:(BOOL)a5 unknownContactActionHandler:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v9 = a3;
  id v10 = objc_opt_new();
  objc_super v11 = [v9 defaultIMHandle];
  v12 = +[CKContextMenuGenerator recipientSubmenuForHandle:v11];
  if (v12) {
    [v10 addObject:v12];
  }
  id v13 = [(CKDetailsContactsManager *)self conversation];
  char v14 = +[CKContextMenuGenerator submenuForIndividualParticipantWithHandle:v11 forConversation:v13 includeAddToContactsAction:!v6 includeRemoveAction:v7];

  if (v14) {
    [v10 addObject:v14];
  }
  if ([(CKDetailsContactsManager *)self showScreenSharingButtonForEntity:v9])
  {
    v15 = [(CKDetailsContactsManager *)self conversation];
    long long v16 = +[CKContextMenuGenerator subMenuForScreenSharingOptionsWithHandle:v11 conversation:v15 andContactsManager:self];

    if (v16) {
      [v10 addObject:v16];
    }
  }
  long long v17 = objc_opt_new();
  if ([(CKDetailsContactsManager *)self _showFaceTimeVideoButtonForEntity:v9])
  {
    long long v18 = +[CKContextMenuGenerator menuActionToInitiateFaceTimeVideoWithHandle:v11 andContactsManager:self];
    long long v19 = +[CKContextMenuGenerator menuActionToInitiateFaceTimeAudioWithHandle:v11 andContactsManager:self];
    if (v18) {
      [v17 addObject:v18];
    }
    if (v19) {
      [v17 addObject:v19];
    }
  }
  v20 = +[CKContextMenuGenerator menuActionsToInitiateRelayPhoneCallWithHandle:v11];
  if ([v20 count]) {
    [v17 addObjectsFromArray:v20];
  }
  if ([v17 count])
  {
    uint64_t v21 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 image:0 identifier:0 options:1 children:v17];
    [v10 addObject:v21];
  }
  if ([v10 count])
  {
    uint64_t v22 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1EDE4CA38 children:v10];
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

- (id)contextMenuForEntity:(id)a3 atom:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [v7 defaultIMHandle];
  int v9 = [v8 isContact];

  if (v9) {
    [(CKDetailsContactsManager *)self conversationContextMenuForEntity:v7 allowConversationRemoval:0];
  }
  else {
  id v10 = [(CKDetailsContactsManager *)self contextMenuForUnknownRecipient:v7 atom:v6];
  }

  return v10;
}

- (id)contextMenuForUnknownRecipient:(id)a3 atom:(id)a4
{
  return 0;
}

- (void)sendEmail
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v3 = [(CKDetailsContactsManager *)self conversation];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1BA28]);
    BOOL v5 = [MEMORY[0x1E4F1BC18] descriptorForRequiredKeys];
    v21[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];

    id v7 = [(CKDetailsContactsManager *)self conversation];
    int v8 = [v7 chat];
    int v9 = [v8 participants];
    uint64_t v10 = [v9 count];

    objc_super v11 = [(CKDetailsContactsManager *)self conversation];
    v12 = [v11 conversationVisualIdentityWithKeys:v6 requestedNumberOfContactsToFetch:v10];

    id v13 = [v12 contacts];
    char v14 = [v4 mailUrlForContacts:v13];

    v15 = [MEMORY[0x1E4F42738] sharedApplication];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __37__CKDetailsContactsManager_sendEmail__block_invoke;
    v19[3] = &unk_1E5620BF0;
    id v20 = v14;
    id v16 = v14;
    [v15 openURL:v16 options:MEMORY[0x1E4F1CC08] completionHandler:v19];
  }
  else if (IMOSLoggingEnabled())
  {
    long long v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = 0;
      _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Cannot send email because no conversation", (uint8_t *)&v18, 2u);
    }
  }
}

void __37__CKDetailsContactsManager_sendEmail__block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      BOOL v5 = @"NO";
      uint64_t v6 = *(void *)(a1 + 32);
      if (a2) {
        BOOL v5 = @"YES";
      }
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Opened URL: %@ successfully: %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)callableAddressesForEntity:(id)a3 withResult:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void *, void *))a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  __int16 v9 = [v5 defaultIMHandle];
  uint64_t v10 = [v9 cnContactWithKeys:MEMORY[0x1E4F1CBF0]];

  uint64_t v11 = [v10 phoneNumbers];
  if ([v11 count])
  {
    v25 = v10;
    id v26 = v5;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v24 = v11;
    id obj = v11;
    uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          long long v17 = [v16 value];
          __int16 v18 = [v17 stringValue];

          [v7 addObject:v18];
          long long v19 = [v16 label];
          id v20 = [MEMORY[0x1E4F1BA20] localizedStringForLabel:v19];
          if (![(__CFString *)v20 length])
          {
            uint64_t v21 = v19;

            id v20 = v21;
          }
          if (![(__CFString *)v20 length])
          {

            id v20 = &stru_1EDE4CA38;
          }
          [v8 addObject:v20];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v13);
    }

    id v5 = v26;
    uint64_t v11 = v24;
    uint64_t v10 = v25;
  }
  uint64_t v22 = (void *)[v7 copy];
  v23 = (void *)[v8 copy];
  v6[2](v6, v22, v23);
}

- (BOOL)hasPreferredCallServiceForEntity:(id)a3
{
  id v4 = [a3 rawAddress];
  unint64_t v5 = [(CKDetailsContactsManager *)self preferredCallServiceForID:v4];

  return v5 != 0;
}

- (BOOL)shouldAlwaysShowCallMenuForEntity:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CKDetailsContactsManager *)self isFaceTimeAudioAvailableForEntity:v4];
  uint64_t v6 = [v4 propertyType];

  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__CKDetailsContactsManager_shouldAlwaysShowCallMenuForEntity___block_invoke;
  v10[3] = &unk_1E562CE40;
  v10[4] = &v11;
  [(CKDetailsContactsManager *)self callableAddressesForEntity:v4 withResult:v10];
  BOOL v7 = [(CKDetailsContactsManager *)self hasPreferredCallServiceForEntity:v4];
  if (v6 == (void *)*MEMORY[0x1E4F1AEE0]) {
    BOOL v8 = v5 && !v7;
  }
  else {
    BOOL v8 = *((unsigned char *)v12 + 24) != 0;
  }
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __62__CKDetailsContactsManager_shouldAlwaysShowCallMenuForEntity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        if (MEMORY[0x192FBA6E0](*(void *)(*((void *)&v8 + 1) + 8 * i)))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)callMenuForEntity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKDetailsContactsManager *)self callActionsForEntity:v4];
  if ([v5 count])
  {
    uint64_t v6 = [v4 propertyType];
    BOOL v7 = (void *)*MEMORY[0x1E4F1AEE0];

    if (v6 == v7)
    {
      long long v10 = [v4 defaultIMHandle];
      long long v8 = [v10 displayID];
    }
    else
    {
      long long v8 = 0;
    }
    long long v11 = (void *)MEMORY[0x1E4F42B80];
    uint64_t v12 = (void *)[v5 copy];
    long long v9 = [v11 menuWithTitle:v8 children:v12];
  }
  else
  {
    long long v9 = 0;
  }

  return v9;
}

- (id)callActionsForEntity:(id)a3
{
  id v4 = a3;
  uint64_t v39 = 0;
  char v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__81;
  uint64_t v43 = __Block_byref_object_dispose__81;
  id v44 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__81;
  v37[4] = __Block_byref_object_dispose__81;
  id v38 = 0;
  id location = 0;
  objc_initWeak(&location, self);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __49__CKDetailsContactsManager_callActionsForEntity___block_invoke;
  v35[3] = &unk_1E562CE68;
  v35[4] = &v39;
  v35[5] = v37;
  [(CKDetailsContactsManager *)self callableAddressesForEntity:v4 withResult:v35];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [v4 propertyType];

  if ([(CKDetailsContactsManager *)self isFaceTimeAudioAvailableForEntity:v4])
  {
    BOOL v7 = CKFrameworkBundle();
    long long v8 = [v7 localizedStringForKey:@"FACE_TIME_AUDIO" value:&stru_1EDE4CA38 table:@"ChatKit"];

    long long v9 = [MEMORY[0x1E4F42A80] systemImageNamed:@"phone"];
    long long v10 = (void *)MEMORY[0x1E4F426E8];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __49__CKDetailsContactsManager_callActionsForEntity___block_invoke_2;
    v31[3] = &unk_1E562CE90;
    id v32 = v4;
    objc_copyWeak(&v34, &location);
    uint64_t v33 = &v39;
    long long v11 = [v10 actionWithTitle:v8 image:v9 identifier:v8 handler:v31];
    [v5 addObject:v11];

    objc_destroyWeak(&v34);
  }
  if (v6 == (void *)*MEMORY[0x1E4F1AEE0])
  {
    uint64_t v13 = CKFrameworkBundle();
    char v14 = [v13 localizedStringForKey:@"VOICE_CALL" value:&stru_1EDE4CA38 table:@"ChatKit"];

    v15 = [MEMORY[0x1E4F42A80] systemImageNamed:@"phone"];
    id v16 = (void *)MEMORY[0x1E4F426E8];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __49__CKDetailsContactsManager_callActionsForEntity___block_invoke_3;
    v28[3] = &unk_1E56299E8;
    id v29 = v4;
    objc_copyWeak(&v30, &location);
    long long v17 = [v16 actionWithTitle:v14 image:v15 identifier:v14 handler:v28];
    [v5 addObject:v17];

    objc_destroyWeak(&v30);
  }
  else
  {
    uint64_t v12 = (void *)v40[5];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __49__CKDetailsContactsManager_callActionsForEntity___block_invoke_4;
    v23 = &unk_1E562CEB8;
    id v26 = v37;
    objc_copyWeak(&v27, &location);
    id v24 = v4;
    id v25 = v5;
    [v12 enumerateObjectsUsingBlock:&v20];

    objc_destroyWeak(&v27);
  }
  __int16 v18 = objc_msgSend(v5, "copy", v20, v21, v22, v23);

  objc_destroyWeak(&location);
  _Block_object_dispose(v37, 8);

  _Block_object_dispose(&v39, 8);

  return v18;
}

void __49__CKDetailsContactsManager_callActionsForEntity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [v5 copy];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

void __49__CKDetailsContactsManager_callActionsForEntity___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) rawAddress];

  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v4 = [*(id *)(a1 + 32) rawAddress];
    [WeakRetained setPreferredCallService:2 forID:v4];
  }
  id v7 = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) firstObject];
  [v7 startCommunicationForEntity:v5 action:1 address:v6];
}

void __49__CKDetailsContactsManager_callActionsForEntity___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) rawAddress];

  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = [*(id *)(a1 + 32) rawAddress];
    [WeakRetained setPreferredCallService:1 forID:v4];
  }
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v5 originalAddress];
  [v7 startCommunicationForEntity:v5 action:3 address:v6];
}

void __49__CKDetailsContactsManager_callActionsForEntity___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectAtIndex:a3];
  if (MEMORY[0x192FBA6E0](v5))
  {
    id v7 = @"phone";
LABEL_5:
    long long v8 = [MEMORY[0x1E4F42A80] systemImageNamed:v7];
    goto LABEL_7;
  }
  if (IMStringIsEmail())
  {
    id v7 = @"envelope";
    goto LABEL_5;
  }
  long long v8 = 0;
LABEL_7:
  uint64_t v9 = (void *)MEMORY[0x1E4F426E8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__CKDetailsContactsManager_callActionsForEntity___block_invoke_5;
  v12[3] = &unk_1E5629D10;
  objc_copyWeak(&v15, (id *)(a1 + 56));
  id v13 = *(id *)(a1 + 32);
  id v10 = v5;
  id v14 = v10;
  long long v11 = [v9 actionWithTitle:v10 image:v8 identifier:v10 handler:v12];
  [v11 setDiscoverabilityTitle:v6];
  if (MEMORY[0x192FBA6E0](v10)) {
    [*(id *)(a1 + 40) addObject:v11];
  }

  objc_destroyWeak(&v15);
}

void __49__CKDetailsContactsManager_callActionsForEntity___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained startCommunicationForEntity:*(void *)(a1 + 32) action:3 address:*(void *)(a1 + 40)];
}

- (void)startCommunicationForEntity:(id)a3 action:(unint64_t)a4 address:(id)a5
{
}

- (void)startCommunicationForEntity:(id)a3 action:(unint64_t)a4 address:(id)a5 usePreferredRouteIfAvailable:(BOOL)a6
{
  BOOL v6 = a6;
  id v14 = a3;
  id v10 = a5;
  switch(a4)
  {
    case 0uLL:
      long long v11 = self;
      id v12 = v14;
      uint64_t v13 = 0;
      goto LABEL_4;
    case 1uLL:
      long long v11 = self;
      id v12 = v14;
      uint64_t v13 = 1;
LABEL_4:
      [(CKDetailsContactsManager *)v11 _startFacetimeCommunicationForEntity:v12 audioOnly:v13];
      break;
    case 2uLL:
      [(CKDetailsContactsManager *)self _startCommunicationForEntity:v14 usePreferredRouteIfAvailable:v6];
      break;
    case 3uLL:
      [(CKDetailsContactsManager *)self _startCallWithEntity:v14 phoneAddress:v10];
      break;
    case 4uLL:
      [(CKDetailsContactsManager *)self _startMessageWithEntity:v14];
      break;
    case 5uLL:
      [(CKDetailsContactsManager *)self shareMyScreenWithEntity:v14];
      break;
    case 6uLL:
      [(CKDetailsContactsManager *)self inviteEntityToShareTheirScreen:v14];
      break;
    default:
      break;
  }
}

- (void)startCommunicationForViewModel:(id)a3 action:(unint64_t)a4 address:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  uint64_t v9 = [v11 entity];

  if (v9)
  {
    id v10 = [v11 entity];
    [(CKDetailsContactsManager *)self startCommunicationForEntity:v10 action:a4 address:v8];
  }
}

- (void)_startMessageWithEntity:(id)a3
{
  id v3 = NSString;
  id v4 = [a3 defaultIMHandle];
  id v5 = [v4 ID];
  [v3 stringWithFormat:@"sms://open?addresses=%@", v5];
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v6 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
  [(id)*MEMORY[0x1E4F43630] openURL:v6];
}

- (void)_startCommunicationForEntity:(id)a3 usePreferredRouteIfAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = +[CKFaceTimeUtilities isTelephonyAvailable];
  BOOL v8 = [(CKDetailsContactsManager *)self isFaceTimeAudioAvailableForEntity:v6];
  uint64_t v9 = [v6 propertyType];
  id v10 = (void *)*MEMORY[0x1E4F1AEE0];

  if (v8)
  {
    if (!v7 || v9 != v10) {
      goto LABEL_4;
    }
    if (v4)
    {
      uint64_t v13 = [v6 rawAddress];
      unint64_t v14 = [(CKDetailsContactsManager *)self preferredCallServiceForID:v13];

      if (v14 == 2)
      {
LABEL_4:
        [(CKDetailsContactsManager *)self _startFacetimeCommunicationForEntity:v6 audioOnly:1];
        goto LABEL_21;
      }
      if (v14 == 1)
      {
LABEL_10:
        id v12 = [v6 originalAddress];
        [(CKDetailsContactsManager *)self _startCallWithEntity:v6 phoneAddress:v12];

        goto LABEL_21;
      }
    }
    else
    {
      unint64_t v14 = 0;
    }
    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v17 = 134217984;
        unint64_t v18 = v14;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Tried to start a call via the transcript header call button, but preferredCallServiceType (%lu) wan't explicitly accounted for. Defaulting to the number attached to the transcript since this is a phone transcript.", (uint8_t *)&v17, 0xCu);
      }
    }
    id v16 = [v6 originalAddress];
    [(CKDetailsContactsManager *)self _startCallWithEntity:v6 phoneAddress:v16];
  }
  else
  {
    if (v9 == v10) {
      goto LABEL_10;
    }
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Tried to start a call via the transcript header call button, but this is a non-phone transcript and FT audio is unavailable. Unable to initiate a call.", (uint8_t *)&v17, 2u);
      }
    }
  }
LABEL_21:
}

- (void)_startCallWithEntity:(id)a3 phoneAddress:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [MEMORY[0x1E4FADA90] sharedInstance];
  uint64_t v9 = [v8 providerManager];
  id v10 = [v9 telephonyProvider];

  id v11 = (void *)[objc_alloc(MEMORY[0x1E4FADBC0]) initWithProvider:v10];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4FADBD8]) initWithType:2 value:v7];
  [v11 setHandle:v12];

  uint64_t v13 = [v6 cnContactWithKeys:MEMORY[0x1E4F1CBF0]];
  unint64_t v14 = [v13 identifier];
  [v11 setContactIdentifier:v14];

  [v11 setPerformDialAssist:1];
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    id v30 = v7;
    id v31 = v6;
    id v15 = [(CKDetailsContactsManager *)self conversation];
    id v16 = [v15 chat];
    uint64_t v17 = [v16 lastAddressedSIMID];

    id v29 = (void *)v17;
    unint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v17];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v19 = [v10 prioritizedSenderIdentities];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v25 = [v24 accountUUID];
          int v26 = [v25 isEqual:v18];

          if (v26)
          {
            id v27 = [v24 UUID];
            [v11 setLocalSenderIdentityUUID:v27];

            goto LABEL_12;
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    id v7 = v30;
    id v6 = v31;
  }
  long long v28 = [MEMORY[0x1E4FADA90] sharedInstance];
  [v28 launchAppForDialRequest:v11 completion:&__block_literal_global_280];
}

void __62__CKDetailsContactsManager__startCallWithEntity_phoneAddress___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2 && IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Error making telephony call: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)_startFacetimeCommunicationForEntity:(id)a3 audioOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 defaultIMHandle];
  BOOL v8 = (void *)v7;
  if (v7)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F6BCC0];
    uint64_t v15 = v7;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    id v11 = [(CKDetailsContactsManager *)self conversation];
    id v12 = [v11 chat];
    uint64_t v13 = [v12 lastAddressedHandleID];
    [v9 initiateTUConversationForParticipants:v10 senderAddress:v13 videoEnabled:!v4 groupID:0 displayName:0 screenShareType:0];
  }
  else if (IMOSLoggingEnabled())
  {
    unint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "No handle found for %@. FaceTime could not be initiated.", buf, 0xCu);
    }
  }
}

- (void)shareMyScreenWithEntity:(id)a3
{
  id v13 = a3;
  BOOL v4 = [(CKDetailsContactsManager *)self modernScreenSharingCapabilities];
  BOOL v5 = +[CKFaceTimeUtilities isModernScreenSharingAvailableForEntity:v13 capabilities:v4];

  if (v5)
  {
    id v6 = [(CKDetailsContactsManager *)self conversation];
    uint64_t v7 = [v6 chat];
    [v7 initiateTUConversationWithScreenShareType:1];
  }
  else
  {
    int v8 = CKIsRunningInMacCatalyst();
    uint64_t v9 = v13;
    if (!v8) {
      goto LABEL_9;
    }
    id v10 = [v13 defaultIMHandle];
    id v6 = [v10 cnContactWithKeys:MEMORY[0x1E4F1CBF0]];

    uint64_t v11 = [MEMORY[0x1E4F6E6D8] isCNContactAKnownContact:v6];
    if (v11) {
      [v6 identifier];
    }
    else {
    uint64_t v7 = [v13 rawAddress];
    }
    id v12 = [MEMORY[0x1E4F6BC98] sharedInstance];
    [v12 inviteHandleIDToShareMyScreen:v7 isContact:v11];
  }
  uint64_t v9 = v13;
LABEL_9:
}

- (void)inviteEntityToShareTheirScreen:(id)a3
{
  id v13 = a3;
  BOOL v4 = [(CKDetailsContactsManager *)self modernScreenSharingCapabilities];
  BOOL v5 = +[CKFaceTimeUtilities isModernScreenSharingAvailableForEntity:v13 capabilities:v4];

  if (v5)
  {
    id v6 = [(CKDetailsContactsManager *)self conversation];
    uint64_t v7 = [v6 chat];
    [v7 initiateTUConversationWithScreenShareType:2];
  }
  else
  {
    int v8 = CKIsRunningInMacCatalyst();
    uint64_t v9 = v13;
    if (!v8) {
      goto LABEL_9;
    }
    id v10 = [v13 defaultIMHandle];
    id v6 = [v10 cnContactWithKeys:MEMORY[0x1E4F1CBF0]];

    uint64_t v11 = [MEMORY[0x1E4F6E6D8] isCNContactAKnownContact:v6];
    if (v11) {
      [v6 identifier];
    }
    else {
    uint64_t v7 = [v13 rawAddress];
    }
    id v12 = [MEMORY[0x1E4F6BC98] sharedInstance];
    [v12 askHandleIDToShareTheirScreen:v7 isContact:v11];
  }
  uint64_t v9 = v13;
LABEL_9:
}

- (BOOL)_showPhoneButtonForEntity:(id)a3
{
  id v4 = a3;
  if (v4) {
    BOOL v5 = [(CKDetailsContactsManager *)self isTelephonyCallAvailableForEntity:v4]
  }
      || [(CKDetailsContactsManager *)self isFaceTimeAudioAvailableForEntity:v4];
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isTelephonyCallAvailableForEntity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = +[CKFaceTimeUtilities isTelephonyAvailable];
    id v6 = +[CKUIBehavior sharedBehaviors];
    int v7 = [v6 phoneIsAllowlisted];

    int v8 = [v4 propertyType];
    uint64_t v9 = (void *)*MEMORY[0x1E4F1AEE0];

    int v10 = v5 & v7;
    if (v10 == 1 && v8 != v9) {
      LOBYTE(v10) = [(CKDetailsContactsManager *)self _hasLinkedTelephoneNumbersForEntity:v4];
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)_showFaceTimeVideoButtonForEntity:(id)a3
{
  return a3
      && -[CKDetailsContactsManager isFaceTimeAudioAvailableForEntity:](self, "isFaceTimeAudioAvailableForEntity:");
}

- (BOOL)isFaceTimeVideoAvailableForEntity:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_6;
  }
  BOOL v5 = [(CKDetailsContactsManager *)self conversation];
  if (!+[CKFaceTimeUtilities isFaceTimeVideoAvailable:v5])
  {

    goto LABEL_6;
  }
  id v6 = +[CKUIBehavior sharedBehaviors];
  int v7 = [v6 faceTimeVideoIsAllowlisted];

  if (!v7)
  {
LABEL_6:
    BOOL v8 = 0;
    goto LABEL_7;
  }
  BOOL v8 = [(CKDetailsContactsManager *)self _facetimeIDStatusForEntity:v4] == 1;
LABEL_7:

  return v8;
}

- (BOOL)isFaceTimeAudioAvailableForEntity:(id)a3
{
  id v4 = a3;
  if (+[CKFaceTimeUtilities isFaceTimeAudioAvailable:self->_conversation])
  {
    BOOL v5 = +[CKUIBehavior sharedBehaviors];
    char v6 = [v5 faceTimeAudioIsAllowlisted];
  }
  else
  {
    char v6 = 0;
  }
  int v7 = [v4 IDSCanonicalAddress];
  BOOL v8 = [(CKDetailsContactsManager *)self facetimeAudioIDStatuses];
  uint64_t v9 = [v8 objectForKey:v7];

  if (v9)
  {
    int v10 = [(CKDetailsContactsManager *)self facetimeAudioIDStatuses];
    uint64_t v11 = [v10 objectForKey:v7];
    uint64_t v12 = [v11 integerValue];

    BOOL v13 = v12 == 1;
  }
  else
  {
    BOOL v13 = 0;
  }
  BOOL v14 = v6 & v13;

  return v14;
}

- (BOOL)showScreenSharingButtonForEntity:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CKDetailsContactsManager *)self modernScreenSharingCapabilities];
  BOOL v6 = +[CKFaceTimeUtilities isModernScreenSharingAvailableForEntity:v4 capabilities:v5];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else if (CKIsRunningInMacCatalyst())
  {
    BOOL v7 = [(CKDetailsContactsManager *)self _screenSharingStatusForEntity:v4] == 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_showMessageButtonForEntity:(id)a3
{
  id v3 = [(CKConversation *)self->_conversation recipients];
  BOOL v4 = (unint64_t)[v3 count] >= 2 && CKIsRunningInMacCatalyst() == 0;

  return v4;
}

- (BOOL)_hasLinkedTelephoneNumbersForEntity:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F6E6D8];
  BOOL v4 = [a3 defaultIMHandle];
  BOOL v5 = [v4 cnContactWithKeys:MEMORY[0x1E4F1CBF0]];
  BOOL v6 = [v3 phoneNumbersForCNContact:v5];

  LOBYTE(v4) = [v6 count] != 0;
  return (char)v4;
}

- (int64_t)_facetimeIDStatusForEntity:(id)a3
{
  BOOL v4 = [a3 IDSCanonicalAddress];
  BOOL v5 = [(CKDetailsContactsManager *)self facetimeIDStatuses];
  BOOL v6 = [v5 objectForKey:v4];

  if (v6)
  {
    BOOL v7 = [(CKDetailsContactsManager *)self facetimeIDStatuses];
    BOOL v8 = [v7 objectForKey:v4];
    int64_t v9 = [v8 integerValue];
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (int64_t)_facetimeAudioIDStatusForEntity:(id)a3
{
  BOOL v4 = [a3 IDSCanonicalAddress];
  BOOL v5 = [(CKDetailsContactsManager *)self facetimeAudioIDStatuses];
  BOOL v6 = [v5 objectForKey:v4];

  if (v6)
  {
    BOOL v7 = [(CKDetailsContactsManager *)self facetimeAudioIDStatuses];
    BOOL v8 = [v7 objectForKey:v4];
    int64_t v9 = [v8 integerValue];
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (int64_t)_screenSharingStatusForEntity:(id)a3
{
  id v4 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    BOOL v5 = [v4 IDSCanonicalAddress];
    BOOL v6 = [(CKDetailsContactsManager *)self screenSharingIDSStatuses];
    BOOL v7 = [v6 objectForKey:v5];

    if (v7)
    {
      BOOL v8 = [(CKDetailsContactsManager *)self screenSharingIDSStatuses];
      int64_t v9 = [v8 objectForKey:v5];
      int64_t v10 = [v9 integerValue];
    }
    else
    {
      int64_t v10 = 0;
    }
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (void)_refreshIDSStatusWithCompletion:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  BOOL v5 = [(CKDetailsContactsManager *)self conversation];
  BOOL v6 = [v5 recipients];
  BOOL v7 = objc_msgSend(v6, "__imArrayByApplyingBlock:", &__block_literal_global_128_1);

  if ([v7 count])
  {
    BOOL v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    int64_t v9 = (void *)MEMORY[0x1E4F6E7B8];
    int64_t v10 = [(CKDetailsContactsManager *)self serviceAvailabilityKey];
    uint64_t v11 = *MEMORY[0x1E4F6AA50];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __60__CKDetailsContactsManager__refreshIDSStatusWithCompletion___block_invoke_130;
    v36[3] = &unk_1E5623B88;
    v36[4] = self;
    uint64_t v12 = v8;
    uint64_t v37 = v12;
    LOBYTE(v9) = [v9 refreshIDStatusForDestinations:v7 service:v11 listenerID:v10 queue:MEMORY[0x1E4F14428] completionBlock:v36];

    if ((v9 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        BOOL v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v39 = "-[CKDetailsContactsManager _refreshIDSStatusWithCompletion:]";
          __int16 v40 = 2112;
          uint64_t v41 = @"NO";
          _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "%s leaving dispatch_group because executedRefreshForFaceTime: %@", buf, 0x16u);
        }
      }
      dispatch_group_leave(v12);
    }
    dispatch_group_enter(v12);
    BOOL v14 = (void *)MEMORY[0x1E4F6E7B8];
    uint64_t v15 = [(CKDetailsContactsManager *)self serviceAvailabilityKey];
    uint64_t v16 = *MEMORY[0x1E4F6AA48];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __60__CKDetailsContactsManager__refreshIDSStatusWithCompletion___block_invoke_132;
    v34[3] = &unk_1E5623B88;
    v34[4] = self;
    id v17 = v12;
    long long v35 = v17;
    LOBYTE(v14) = [v14 refreshIDStatusForDestinations:v7 service:v16 listenerID:v15 queue:MEMORY[0x1E4F14428] completionBlock:v34];

    if ((v14 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v39 = "-[CKDetailsContactsManager _refreshIDSStatusWithCompletion:]";
          __int16 v40 = 2112;
          uint64_t v41 = @"NO";
          _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "%s leaving dispatch_group because executedRefreshForCalling: %@", buf, 0x16u);
        }
      }
      dispatch_group_leave(v17);
    }
    uint64_t v19 = [(CKDetailsContactsManager *)self conversation];
    BOOL v20 = +[CKFaceTimeUtilities isModernScreenSharingAvailable:v19];

    if (v20)
    {
      dispatch_group_enter(v17);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __60__CKDetailsContactsManager__refreshIDSStatusWithCompletion___block_invoke_133;
      v32[3] = &unk_1E5623B88;
      v32[4] = self;
      long long v33 = v17;
      +[CKFaceTimeUtilities queryModernScreenSharingCapabilities:v7 completion:v32];
    }
    if (CKIsRunningInMacCatalyst())
    {
      dispatch_group_enter(v17);
      uint64_t v21 = (void *)MEMORY[0x1E4F6E7B8];
      uint64_t v22 = [(CKDetailsContactsManager *)self serviceAvailabilityKey];
      uint64_t v23 = *MEMORY[0x1E4F6AA70];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __60__CKDetailsContactsManager__refreshIDSStatusWithCompletion___block_invoke_2;
      v30[3] = &unk_1E5623B88;
      v30[4] = self;
      id v24 = v17;
      id v31 = v24;
      LOBYTE(v21) = [v21 refreshIDStatusForDestinations:v7 service:v23 listenerID:v22 queue:MEMORY[0x1E4F14428] completionBlock:v30];

      if ((v21 & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          id v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v39 = "-[CKDetailsContactsManager _refreshIDSStatusWithCompletion:]";
            __int16 v40 = 2112;
            uint64_t v41 = @"NO";
            _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "%s leaving dispatch_group because executedRefreshForScreenSharing: %@", buf, 0x16u);
          }
        }
        dispatch_group_leave(v24);
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__CKDetailsContactsManager__refreshIDSStatusWithCompletion___block_invoke_134;
    block[3] = &unk_1E5620F48;
    id v29 = v4;
    int v26 = (void *)MEMORY[0x1E4F14428];
    dispatch_group_notify(v17, MEMORY[0x1E4F14428], block);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v39 = "-[CKDetailsContactsManager _refreshIDSStatusWithCompletion:]";
        __int16 v40 = 2048;
        uint64_t v41 = (__CFString *)[v7 count];
        _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "%s executing completion block and early returning for addresses.count: %lu", buf, 0x16u);
      }
    }
    v4[2](v4);
  }
}

uint64_t __60__CKDetailsContactsManager__refreshIDSStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 IDSCanonicalAddress];
}

void __60__CKDetailsContactsManager__refreshIDSStatusWithCompletion___block_invoke_130(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setFacetimeIDStatuses:a2];
  id v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void __60__CKDetailsContactsManager__refreshIDSStatusWithCompletion___block_invoke_132(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setFacetimeAudioIDStatuses:a2];
  id v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void __60__CKDetailsContactsManager__refreshIDSStatusWithCompletion___block_invoke_133(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setModernScreenSharingCapabilities:a2];
  id v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void __60__CKDetailsContactsManager__refreshIDSStatusWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setScreenSharingIDSStatuses:a2];
  id v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

uint64_t __60__CKDetailsContactsManager__refreshIDSStatusWithCompletion___block_invoke_134(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)preferredCallServiceForID:(id)a3
{
  id v4 = a3;
  if (v4
    && ![(CKDetailsContactsManager *)self _preferredRoutesDisabledViaServerBag])
  {
    BOOL v6 = [(CKDetailsContactsManager *)self _preferredCallServiceToIDMap];
    BOOL v7 = [v6 objectForKey:v4];
    BOOL v8 = v7;
    if (v7)
    {
      unint64_t v9 = [v7 unsignedIntegerValue];
      if (v9 <= 2) {
        unint64_t v5 = v9;
      }
      else {
        unint64_t v5 = 0;
      }
    }
    else
    {
      unint64_t v5 = 0;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)setPreferredCallService:(unint64_t)a3 forID:(id)a4
{
  id v6 = a4;
  BOOL v7 = v6;
  if (a3 <= 2)
  {
    if (v6)
    {
      id v13 = v6;
      BOOL v8 = [(CKDetailsContactsManager *)self _preferredRoutesDisabledViaServerBag];
      BOOL v7 = v13;
      if (!v8)
      {
        unint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
        int64_t v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        uint64_t v11 = [v10 objectForKey:@"CKCallPreferredServiceToIDMap"];
        id v12 = (id)[v11 mutableCopy];

        if (!v12) {
          id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        if (a3) {
          [v12 setObject:v9 forKey:v13];
        }
        else {
          [v12 removeObjectForKey:v13];
        }
        [(CKDetailsContactsManager *)self _setPreferredCallServiceToIDMap:v12];

        BOOL v7 = v13;
      }
    }
  }
}

- (BOOL)_preferredRoutesDisabledViaServerBag
{
  id v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"madrid-disable-preferred-call-service"];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)_preferredCallServiceToIDMap
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"CKCallPreferredServiceToIDMap"];

  return v3;
}

- (void)_setPreferredCallServiceToIDMap:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v5 = [v3 standardUserDefaults];
  [v5 setObject:v4 forKey:@"CKCallPreferredServiceToIDMap"];
}

- (void)beginFacetimeCallWithVideo:(BOOL)a3
{
  id v3 = self;
  if (a3)
  {
    uint64_t v4 = 1;
LABEL_5:
    [(CKDetailsContactsManager *)self _callButtonPressedWithVideoEnabled:v4];
    return;
  }
  id v5 = [(CKDetailsContactsManager *)self conversation];
  id v6 = [v5 recipients];
  unint64_t v7 = [v6 count];

  self = v3;
  if (v7 >= 2)
  {
    uint64_t v4 = 0;
    goto LABEL_5;
  }

  [(CKDetailsContactsManager *)v3 startAudioCommunicationUsingPreferredRouteIfAvailable:1];
}

- (void)startAudioCommunicationUsingPreferredRouteIfAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CKDetailsContactsManager *)self conversation];
  id v7 = [v5 recipient];

  id v6 = v7;
  if (v7)
  {
    [(CKDetailsContactsManager *)self startCommunicationForEntity:v7 action:2 address:0 usePreferredRouteIfAvailable:v3];
    id v6 = v7;
  }
}

- (void)_callButtonPressedWithVideoEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CKDetailsContactsManager *)self conversation];
  id v6 = [v5 chat];
  id v11 = [v6 conversation];

  if (v11)
  {
    if ([v11 state])
    {
      +[CKFaceTimeUtilities showCallControlsForConversation:v11];
    }
    else
    {
      unint64_t v9 = [(CKDetailsContactsManager *)self conversation];
      int64_t v10 = [v9 chat];
      [v10 joinExistingTUConversation];
    }
  }
  else
  {
    id v7 = [(CKDetailsContactsManager *)self conversation];
    BOOL v8 = [v7 chat];
    [v8 initiateTUConversationWithVideoEnabled:v3];
  }
}

- (NSArray)contactsViewModels
{
  return self->_contactsViewModels;
}

- (void)setContactsViewModels:(id)a3
{
}

- (CKDetailsContactsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKDetailsContactsManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (NSString)serviceAvailabilityKey
{
  return self->_serviceAvailabilityKey;
}

- (void)setServiceAvailabilityKey:(id)a3
{
}

- (NSDictionary)facetimeIDStatuses
{
  return self->_facetimeIDStatuses;
}

- (void)setFacetimeIDStatuses:(id)a3
{
}

- (NSDictionary)facetimeAudioIDStatuses
{
  return self->_facetimeAudioIDStatuses;
}

- (void)setFacetimeAudioIDStatuses:(id)a3
{
}

- (NSDictionary)screenSharingIDSStatuses
{
  return self->_screenSharingIDSStatuses;
}

- (void)setScreenSharingIDSStatuses:(id)a3
{
}

- (NSDictionary)modernScreenSharingCapabilities
{
  return self->_modernScreenSharingCapabilities;
}

- (void)setModernScreenSharingCapabilities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modernScreenSharingCapabilities, 0);
  objc_storeStrong((id *)&self->_screenSharingIDSStatuses, 0);
  objc_storeStrong((id *)&self->_facetimeAudioIDStatuses, 0);
  objc_storeStrong((id *)&self->_facetimeIDStatuses, 0);
  objc_storeStrong((id *)&self->_serviceAvailabilityKey, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_contactsViewModels, 0);
}

@end