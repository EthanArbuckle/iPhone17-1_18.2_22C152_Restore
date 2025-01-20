@interface _ASAccountSharingGroupMemberDataManager
+ (_ASAccountSharingGroupMemberDataManager)sharedManager;
- (CNContactStore)contactStore;
- (_ASAccountSharingGroupMemberData)groupMemberDataForPrimaryAccount;
- (_ASAccountSharingGroupMemberDataManager)init;
- (double)_screenScale;
- (id)KCSharingParticipantsFromGroupMembers:(id)a3;
- (id)_contactDisplayNameFromNameComponents:(id)a3;
- (id)_contactForCurrentUser;
- (id)_formattedAddressForAddress:(id)a3;
- (id)_renderingScopeForDiameter:(double)a3;
- (id)_shortContactDisplayNameFromNameComponents:(id)a3;
- (id)avatarImageForContact:(id)a3 diameter:(double)a4;
- (id)avatarImageForGroupMember:(id)a3 diameter:(double)a4;
- (id)avatarImageForPrimaryAccountOwnerWithDiameter:(double)a3;
- (id)avatarImageForUserHandle:(id)a3 diameter:(double)a4;
- (id)displayNameForOriginalContributorParticipantID:(id)a3 inGroupID:(id)a4;
- (id)fetchContactForUserHandle:(id)a3;
- (id)groupMemberDataForGroup:(id)a3;
- (id)groupMemberDataForGroupParticipants:(id)a3;
- (id)groupMemberDataForRecipients:(id)a3;
- (id)nameForOriginalContributorParticipantID:(id)a3 inGroupID:(id)a4;
- (id)placeholderAvatarImageWithDiameter:(double)a3;
- (void)_contactForCurrentUser;
- (void)_contactsUpdatedNotification:(id)a3;
@end

@implementation _ASAccountSharingGroupMemberDataManager

- (_ASAccountSharingGroupMemberDataManager)init
{
  v24.receiver = self;
  v24.super_class = (Class)_ASAccountSharingGroupMemberDataManager;
  v2 = [(_ASAccountSharingGroupMemberDataManager *)&v24 init];
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x263EFB210]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

    v5 = (CNAvatarImageRenderer *)objc_alloc_init(MEMORY[0x263EFEBA0]);
    avatarImageRenderer = v2->_avatarImageRenderer;
    v2->_avatarImageRenderer = v5;

    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    v7 = (void *)getAAUIProfilePictureStoreClass_softClass;
    uint64_t v29 = getAAUIProfilePictureStoreClass_softClass;
    if (!getAAUIProfilePictureStoreClass_softClass)
    {
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __getAAUIProfilePictureStoreClass_block_invoke;
      v25[3] = &unk_2643956C0;
      v25[4] = &v26;
      __getAAUIProfilePictureStoreClass_block_invoke((uint64_t)v25);
      v7 = (void *)v27[3];
    }
    v8 = v7;
    _Block_object_dispose(&v26, 8);
    id v9 = [v8 alloc];
    v10 = [(ACAccountStore *)v2->_accountStore aa_primaryAppleAccount];
    uint64_t v11 = [v9 initWithAppleAccount:v10 store:v2->_accountStore];
    profilePictureStore = v2->_profilePictureStore;
    v2->_profilePictureStore = (AAUIProfilePictureStore *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    avatarImageDiameterToRenderingScopes = v2->_avatarImageDiameterToRenderingScopes;
    v2->_avatarImageDiameterToRenderingScopes = (NSMutableDictionary *)v13;

    id v15 = objc_alloc_init(MEMORY[0x263EFEA68]);
    [@"com.apple.Passwords" UTF8String];
    v16 = (void *)tcc_identity_create();
    [v15 setAssumedIdentity:v16];

    uint64_t v17 = [objc_alloc(MEMORY[0x263EFEA58]) initWithConfiguration:v15];
    contactStore = v2->_contactStore;
    v2->_contactStore = (CNContactStore *)v17;

    v19 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    contactsCache = v2->_contactsCache;
    v2->_contactsCache = v19;

    v21 = [MEMORY[0x263F08A00] defaultCenter];
    [v21 addObserver:v2 selector:sel__contactsUpdatedNotification_ name:*MEMORY[0x263EFE118] object:0];

    v22 = v2;
  }

  return v2;
}

+ (_ASAccountSharingGroupMemberDataManager)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56___ASAccountSharingGroupMemberDataManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once != -1) {
    dispatch_once(&sharedManager_once, block);
  }
  v2 = (void *)sharedManager_sharedManager_0;

  return (_ASAccountSharingGroupMemberDataManager *)v2;
}

- (_ASAccountSharingGroupMemberData)groupMemberDataForPrimaryAccount
{
  v3 = [(ACAccountStore *)self->_accountStore aa_primaryAppleAccount];
  v4 = objc_alloc_init(_ASAccountSharingGroupMemberData);
  id v5 = objc_alloc_init(MEMORY[0x263F08A68]);
  v6 = objc_msgSend(v3, "aa_firstName");
  [v5 setGivenName:v6];

  v7 = objc_msgSend(v3, "aa_middleName");
  [v5 setMiddleName:v7];

  v8 = objc_msgSend(v3, "aa_lastName");
  [v5 setFamilyName:v8];

  id v9 = [(_ASAccountSharingGroupMemberDataManager *)self _contactDisplayNameFromNameComponents:v5];
  [(_ASAccountSharingGroupMemberData *)v4 setContactDisplayName:v9];

  v10 = [(_ASAccountSharingGroupMemberDataManager *)self _shortContactDisplayNameFromNameComponents:v5];
  [(_ASAccountSharingGroupMemberData *)v4 setShortContactDisplayName:v10];

  uint64_t v11 = [(_ASAccountSharingGroupMemberDataManager *)self avatarImageForPrimaryAccountOwnerWithDiameter:37.0];
  [(_ASAccountSharingGroupMemberData *)v4 setAvatarImageForGroupMemberCell:v11];

  v12 = [(_ASAccountSharingGroupMemberDataManager *)self _contactForCurrentUser];
  [(_ASAccountSharingGroupMemberData *)v4 setContact:v12];

  [(_ASAccountSharingGroupMemberData *)v4 setIsMeParticipant:1];
  uint64_t v13 = [v3 username];
  [(_ASAccountSharingGroupMemberData *)v4 setHandle:v13];

  v14 = [v3 username];
  id v15 = [(_ASAccountSharingGroupMemberDataManager *)self _formattedAddressForAddress:v14];
  [(_ASAccountSharingGroupMemberData *)v4 setHandleForDisplay:v15];

  v16 = [MEMORY[0x263F662D8] sharedProvider];
  uint64_t v17 = [v16 currentUserParticipantID];
  [(_ASAccountSharingGroupMemberData *)v4 setParticipantID:v17];

  return v4;
}

- (id)groupMemberDataForRecipients:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __72___ASAccountSharingGroupMemberDataManager_groupMemberDataForRecipients___block_invoke;
  v5[3] = &unk_264395A30;
  v5[4] = self;
  v3 = objc_msgSend(a3, "safari_mapObjectsUsingBlock:", v5);

  return v3;
}

- (id)groupMemberDataForGroup:(id)a3
{
  v4 = [a3 participants];
  id v5 = [(_ASAccountSharingGroupMemberDataManager *)self groupMemberDataForGroupParticipants:v4];

  return v5;
}

- (id)groupMemberDataForGroupParticipants:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __79___ASAccountSharingGroupMemberDataManager_groupMemberDataForGroupParticipants___block_invoke;
  v5[3] = &unk_264395A58;
  v5[4] = self;
  v3 = objc_msgSend(a3, "safari_mapObjectsUsingBlock:", v5);

  return v3;
}

- (id)displayNameForOriginalContributorParticipantID:(id)a3 inGroupID:(id)a4
{
  v4 = [(_ASAccountSharingGroupMemberDataManager *)self nameForOriginalContributorParticipantID:a3 inGroupID:a4];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    _WBSLocalizedString();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)nameForOriginalContributorParticipantID:(id)a3 inGroupID:(id)a4
{
  v27[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F662D8] sharedProvider];
  id v9 = [v8 cachedGroupWithID:v7];

  if (v9)
  {
    v10 = [v9 participants];
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    objc_super v24 = __93___ASAccountSharingGroupMemberDataManager_nameForOriginalContributorParticipantID_inGroupID___block_invoke;
    v25 = &unk_264395A80;
    id v26 = v6;
    uint64_t v11 = objc_msgSend(v10, "safari_firstObjectPassingTest:", &v22);

    if (v11)
    {
      v27[0] = v11;
      v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
      uint64_t v13 = [(_ASAccountSharingGroupMemberDataManager *)self groupMemberDataForGroupParticipants:v12];
      v14 = [v13 firstObject];

      if ([v14 isMeParticipant])
      {
        id v15 = NSString;
        v16 = _WBSLocalizedString();
        uint64_t v17 = [v14 displayName];
        v18 = objc_msgSend(v15, "localizedStringWithFormat:", v16, v17, v22, v23, v24, v25);
      }
      else
      {
        v18 = [v14 displayName];
      }
    }
    else
    {
      v20 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[_ASAccountSharingGroupMemberDataManager nameForOriginalContributorParticipantID:inGroupID:]();
      }
      v18 = 0;
    }
  }
  else
  {
    v19 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[_ASAccountSharingGroupMemberDataManager nameForOriginalContributorParticipantID:inGroupID:]();
    }
    v18 = 0;
  }

  return v18;
}

- (id)fetchContactForUserHandle:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([MEMORY[0x263F33620] isStringPhoneNumber:v4])
  {
    id v5 = (void *)MEMORY[0x263EFE9F8];
    id v6 = [MEMORY[0x263EFEB28] phoneNumberWithStringValue:v4];
    uint64_t v7 = [v5 predicateForContactsMatchingPhoneNumber:v6];
  }
  else
  {
    int v8 = [MEMORY[0x263F335C0] isStringEmailAddress:v4];
    id v9 = (void *)MEMORY[0x263EFE9F8];
    if (v8)
    {
      v10 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingEmailAddress:v4];
      goto LABEL_7;
    }
    v23[0] = v4;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    uint64_t v7 = [v9 predicateForContactsMatchingHandleStrings:v6];
  }
  v10 = (void *)v7;

LABEL_7:
  uint64_t v11 = [(NSCache *)self->_contactsCache objectForKey:v10];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    contactStore = self->_contactStore;
    id v15 = [MEMORY[0x263EFEBF8] descriptorForRequiredKeys];
    uint64_t v22 = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
    id v21 = 0;
    uint64_t v17 = [(CNContactStore *)contactStore unifiedContactsMatchingPredicate:v10 keysToFetch:v16 error:&v21];
    id v18 = v21;

    if ((unint64_t)[v17 count] >= 2)
    {
      v19 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[_ASAccountSharingGroupMemberDataManager fetchContactForUserHandle:]();
      }
    }
    id v13 = [v17 firstObject];
    if (v13) {
      [(NSCache *)self->_contactsCache setObject:v13 forKey:v10];
    }
  }

  return v13;
}

- (id)KCSharingParticipantsFromGroupMembers:(id)a3
{
  return (id)objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_2);
}

- (id)_contactDisplayNameFromNameComponents:(id)a3
{
  v3 = [MEMORY[0x263F08A78] localizedStringFromPersonNameComponents:a3 style:0 options:0];
  if ([v3 length]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)_shortContactDisplayNameFromNameComponents:(id)a3
{
  v3 = [MEMORY[0x263F08A78] localizedStringFromPersonNameComponents:a3 style:1 options:0];
  if ([v3 length]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (double)_screenScale
{
  v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 scale];
  double v4 = v3;

  return v4;
}

- (id)avatarImageForPrimaryAccountOwnerWithDiameter:(double)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = [(AAUIProfilePictureStore *)self->_profilePictureStore profilePictureForAccountOwnerWithoutMonogramFallback];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = objc_msgSend(v5, "imageByPreparingThumbnailOfSize:", a3, a3);
  }
  else
  {
    int v8 = (void *)MEMORY[0x263EFE9F8];
    id v9 = [(ACAccountStore *)self->_accountStore aa_primaryAppleAccount];
    v10 = objc_msgSend(v9, "aa_fullName");
    uint64_t v11 = [v8 contactWithDisplayName:v10 handleStrings:0];

    v12 = [(_ASAccountSharingGroupMemberDataManager *)self _renderingScopeForDiameter:a3];
    avatarImageRenderer = self->_avatarImageRenderer;
    v16[0] = v11;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    uint64_t v7 = [(CNAvatarImageRenderer *)avatarImageRenderer avatarImageForContacts:v14 scope:v12];
  }

  return v7;
}

- (id)avatarImageForUserHandle:(id)a3 diameter:(double)a4
{
  id v6 = [(_ASAccountSharingGroupMemberDataManager *)self fetchContactForUserHandle:a3];
  uint64_t v7 = [(_ASAccountSharingGroupMemberDataManager *)self avatarImageForContact:v6 diameter:a4];

  return v7;
}

- (id)avatarImageForGroupMember:(id)a3 diameter:(double)a4
{
  id v6 = [a3 contact];
  uint64_t v7 = [(_ASAccountSharingGroupMemberDataManager *)self avatarImageForContact:v6 diameter:a4];

  return v7;
}

- (id)avatarImageForContact:(id)a3 diameter:(double)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v6 = a3;
    uint64_t v7 = [(_ASAccountSharingGroupMemberDataManager *)self _renderingScopeForDiameter:a4];
    avatarImageRenderer = self->_avatarImageRenderer;
    v16[0] = v6;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    v10 = [(CNAvatarImageRenderer *)avatarImageRenderer avatarImageForContacts:v9 scope:v7];
  }
  else
  {
    uint64_t v11 = self->_avatarImageRenderer;
    id v12 = 0;
    id v13 = [(CNAvatarImageRenderer *)v11 placeholderImageProvider];

    [(_ASAccountSharingGroupMemberDataManager *)self _screenScale];
    v10 = objc_msgSend(v13, "imageForSize:scale:", a4, a4, v14);
  }

  return v10;
}

- (id)placeholderAvatarImageWithDiameter:(double)a3
{
  id v5 = [(CNAvatarImageRenderer *)self->_avatarImageRenderer placeholderImageProvider];
  [(_ASAccountSharingGroupMemberDataManager *)self _screenScale];
  uint64_t v7 = objc_msgSend(v5, "imageForSize:scale:", a3, a3, v6);

  return v7;
}

- (id)_renderingScopeForDiameter:(double)a3
{
  avatarImageDiameterToRenderingScopes = self->_avatarImageDiameterToRenderingScopes;
  double v6 = objc_msgSend(NSNumber, "numberWithDouble:");
  uint64_t v7 = [(NSMutableDictionary *)avatarImageDiameterToRenderingScopes objectForKeyedSubscript:v6];

  if (!v7)
  {
    BOOL v8 = [MEMORY[0x263F82370] defaultWritingDirectionForLanguage:0] == 2;
    id v9 = (void *)MEMORY[0x263EFEBB0];
    [(_ASAccountSharingGroupMemberDataManager *)self _screenScale];
    uint64_t v7 = objc_msgSend(v9, "scopeWithPointSize:scale:rightToLeft:style:", v8, 0, a3, a3, v10);
    uint64_t v11 = self->_avatarImageDiameterToRenderingScopes;
    id v12 = [NSNumber numberWithDouble:a3];
    [(NSMutableDictionary *)v11 setObject:v7 forKeyedSubscript:v12];
  }
  id v13 = v7;

  return v13;
}

- (id)_formattedAddressForAddress:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x263F33620] isStringPhoneNumber:v3] && objc_msgSend(v3, "length"))
  {
    double v4 = (void *)MEMORY[0x263F33620];
    id v5 = [MEMORY[0x263F33620] countryCodeForNumber:v3];
    id v6 = [v4 internationalizedFormattedNumber:v3 countryCode:v5];
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (id)_contactForCurrentUser
{
  v14[1] = *MEMORY[0x263EF8340];
  contactForCurrentUser = self->_contactForCurrentUser;
  if (contactForCurrentUser)
  {
    id v3 = contactForCurrentUser;
  }
  else
  {
    contactStore = self->_contactStore;
    id v6 = [MEMORY[0x263EFEBF8] descriptorForRequiredKeys];
    v14[0] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    id v13 = 0;
    BOOL v8 = [(CNContactStore *)contactStore _ios_meContactWithKeysToFetch:v7 error:&v13];
    id v9 = v13;
    double v10 = self->_contactForCurrentUser;
    self->_contactForCurrentUser = v8;

    if (v9)
    {
      uint64_t v11 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        [(_ASAccountSharingGroupMemberDataManager *)v11 _contactForCurrentUser];
      }
    }
    id v3 = self->_contactForCurrentUser;
  }

  return v3;
}

- (void)_contactsUpdatedNotification:(id)a3
{
  contactForCurrentUser = self->_contactForCurrentUser;
  self->_contactForCurrentUser = 0;

  contactsCache = self->_contactsCache;

  [(NSCache *)contactsCache removeAllObjects];
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsCache, 0);
  objc_storeStrong((id *)&self->_contactForCurrentUser, 0);
  objc_storeStrong((id *)&self->_profilePictureStore, 0);
  objc_storeStrong((id *)&self->_avatarImageDiameterToRenderingScopes, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_avatarImageRenderer, 0);

  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)nameForOriginalContributorParticipantID:inGroupID:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21918F000, v0, v1, "Failed to find group for group ID when looking up original contributor display name: %{private}@", v2, v3, v4, v5, v6);
}

- (void)nameForOriginalContributorParticipantID:inGroupID:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21918F000, v0, v1, "Failed to find original contributor while trying to get original contributor's name (participantID = %{private}@).", v2, v3, v4, v5, v6);
}

- (void)fetchContactForUserHandle:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21918F000, v0, v1, "Found multiple contacts matching handle %{private}@. Returning first match.", v2, v3, v4, v5, v6);
}

- (void)_contactForCurrentUser
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_21918F000, v3, OS_LOG_TYPE_ERROR, "Failed to get contact for current user with error: %{public}@", v5, 0xCu);
}

@end