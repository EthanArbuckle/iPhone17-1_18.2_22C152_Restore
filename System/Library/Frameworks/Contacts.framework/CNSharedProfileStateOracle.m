@interface CNSharedProfileStateOracle
+ (BOOL)contactIsInAutoUpdateState:(id)a3;
+ (BOOL)isAutoUpdateState:(unint64_t)a3;
+ (BOOL)isFeatureEnabled;
+ (BOOL)isTinker;
+ (BOOL)nicknameHasValidVisualIdentityData:(id)a3;
+ (BOOL)nicknames:(id)a3 areValidForContact:(id)a4;
+ (BOOL)shouldAutoUpdateUndeterminedWithPhoto;
+ (BOOL)shouldAutoUpdateUndeterminedWithoutPhoto;
+ (BOOL)shouldBypassPersistenceCheck;
+ (BOOL)shouldSaveCurrentPoster:(id)a3 toRecentsForContact:(id)a4;
+ (id)descriptionForActionType:(unint64_t)a3;
+ (id)descriptionForUpdateState:(unint64_t)a3;
+ (id)descriptorForRequiredKeys;
+ (id)log;
+ (id)refetchedContactIfNeededWithRequiredKeys:(id)a3 contactStore:(id)a4;
+ (unint64_t)effectiveStateForContact:(id)a3;
+ (unint64_t)globalSharedProfileUpdateState;
- (BOOL)canShowRevertToPreviousBannerForEffectiveState:(unint64_t)a3;
- (BOOL)contactRequiresUpdateForActionType:(unint64_t)a3;
- (BOOL)currentNicknameHasValidVisualIdentityData;
- (BOOL)didPendingNicknameChangePhotoOrWallpaper;
- (BOOL)didPhotoOrWallpaperChangeFrom:(id)a3 to:(id)a4;
- (BOOL)effectiveStateForContactIsAutoUpdate;
- (BOOL)isRevertBannerExpired;
- (BOOL)isRevertToPreviousExpired;
- (BOOL)pendingNicknameHasValidVisualIdentityData;
- (BOOL)saveUpdatedContact:(id)a3 error:(id *)a4;
- (BOOL)shouldContactBeRefetched;
- (BOOL)shouldPerformTransitionAnimation;
- (CNContact)contact;
- (CNContactImageStore)recentContactImageStore;
- (CNContactPosterStore)recentPosterStore;
- (CNContactStore)contactStore;
- (CNSharedProfileStateOracle)initWithContact:(id)a3 contactStore:(id)a4;
- (CNSharedProfileStateOracle)initWithContact:(id)a3 contactStore:(id)a4 archivedNickname:(id)a5 currentNickname:(id)a6 pendingNickname:(id)a7;
- (CNUnfairLock)contactLock;
- (IMNickname)archivedNickname;
- (IMNickname)currentNickname;
- (IMNickname)pendingNickname;
- (IMNicknameProvider)nicknameProvider;
- (double)revertBannerMaxDisplayInterval;
- (double)revertToPreviousMaxDisplayInterval;
- (id)availableActionTypesForEffectiveState;
- (id)lastRecentContactImage;
- (id)lastRecentPoster;
- (id)targetProfileForActionType:(unint64_t)a3;
- (id)updateContactAndNicknamesForActionType:(unint64_t)a3 error:(id *)a4;
- (id)updateContactAndNicknamesForAutoUpdateWithError:(id *)a3;
- (id)updateContactAndNicknamesForDeclinedActionType:(unint64_t)a3 error:(id *)a4;
- (id)updateContactForActionType:(unint64_t)a3 error:(id *)a4;
- (id)updateContactForAutoUpdateWithError:(id *)a3;
- (id)updateContactForDeclinedActionType:(unint64_t)a3 error:(id *)a4;
- (unint64_t)avatarViewAnimationTypeForEffectiveState;
- (unint64_t)bannerActionTypeForEffectiveState;
- (unint64_t)effectiveStateForContact;
- (void)markArchivedNicknameAsIgnored;
- (void)saveContactImage:(id)a3;
- (void)saveContactImage:(id)a3 withPairedPoster:(id)a4;
- (void)saveContactPoster:(id)a3;
- (void)saveCurrentAvatarPosterPairToRecents;
- (void)setArchivedNickname:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setCurrentNickname:(id)a3;
- (void)setNicknameProvider:(id)a3;
- (void)setPendingNickname:(id)a3;
- (void)setRecentContactImageStore:(id)a3;
- (void)setRecentPosterStore:(id)a3;
- (void)setShouldContactBeRefetched:(BOOL)a3;
- (void)updateOracleContactAndNicknamesWithUpdatedContact:(id)a3;
@end

@implementation CNSharedProfileStateOracle

+ (BOOL)isAutoUpdateState:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

+ (BOOL)contactIsInAutoUpdateState:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() effectiveStateForContact:v3];

  v5 = objc_opt_class();

  return [v5 isAutoUpdateState:v4];
}

+ (unint64_t)effectiveStateForContact:(id)a3
{
  id v3 = a3;
  if (![(id)objc_opt_class() isFeatureEnabled]) {
    goto LABEL_4;
  }
  if (!v3) {
    goto LABEL_10;
  }
  if ([(id)objc_opt_class() isTinker])
  {
LABEL_4:
    unint64_t v4 = 2;
    goto LABEL_11;
  }
  if (![v3 isKeyAvailable:@"sharedPhotoDisplayPreference"])
  {
LABEL_10:
    unint64_t v4 = 0;
    goto LABEL_11;
  }
  unint64_t v4 = [v3 sharedPhotoDisplayPreference];
  switch(v4)
  {
    case 0uLL:
      if ([v3 isKeyAvailable:@"imageDataAvailable"]
        && [v3 imageDataAvailable])
      {
        int v5 = [(id)objc_opt_class() shouldAutoUpdateUndeterminedWithPhoto];
      }
      else
      {
        int v5 = [(id)objc_opt_class() shouldAutoUpdateUndeterminedWithoutPhoto];
      }
      if (v5) {
        unint64_t v4 = 3;
      }
      else {
        unint64_t v4 = 2;
      }
      break;
    case 1uLL:
    case 2uLL:
    case 3uLL:
      break;
    default:
      goto LABEL_10;
  }
LABEL_11:

  return v4;
}

+ (BOOL)shouldAutoUpdateUndeterminedWithoutPhoto
{
  return 1;
}

+ (BOOL)isTinker
{
  return 0;
}

+ (BOOL)isFeatureEnabled
{
  v2 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v3 = [v2 featureFlags];
  char v4 = [v3 isFeatureEnabled:15];

  return v4;
}

+ (id)log
{
  if (log_cn_once_token_0 != -1) {
    dispatch_once(&log_cn_once_token_0, &__block_literal_global_0);
  }
  v2 = (void *)log_cn_once_object_0;

  return v2;
}

uint64_t __33__CNSharedProfileStateOracle_log__block_invoke()
{
  log_cn_once_object_0 = (uint64_t)os_log_create("com.apple.contacts", "CNSharedProfileStateOracle");

  return MEMORY[0x1F41817F8]();
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1, &__block_literal_global_59);
  }
  v2 = (void *)descriptorForRequiredKeys_cn_once_object_1;

  return v2;
}

void __55__CNSharedProfileStateOracle_descriptorForRequiredKeys__block_invoke()
{
  v5[21] = *MEMORY[0x1E4F143B8];
  v0 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0, @"identifier", @"linkIdentifier"];
  v5[4] = @"thumbnailImageData";
  v5[5] = @"cropRect";
  v5[6] = @"memojiMetadata";
  v5[7] = @"fullscreenImageData";
  v5[8] = @"imageDataAvailable";
  v5[9] = @"imageType";
  v5[2] = v0;
  v5[3] = @"imageData";
  v5[10] = @"imageHash";
  v5[11] = @"imageData";
  v5[12] = @"sharedPhotoDisplayPreference";
  v5[13] = @"watchWallpaperImageData";
  v5[14] = @"wallpaper";
  v5[15] = @"phoneNumbers";
  v5[16] = @"emailAddresses";
  v5[17] = @"instantMessageAddresses";
  v5[18] = @"socialProfiles";
  v5[19] = @"postalAddresses";
  v5[20] = @"sensitiveContentConfiguration";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:21];

  v2 = [NSString stringWithUTF8String:"+[CNSharedProfileStateOracle descriptorForRequiredKeys]_block_invoke"];
  uint64_t v3 = +[CNContact descriptorWithKeyDescriptors:v1 description:v2];

  char v4 = (void *)descriptorForRequiredKeys_cn_once_object_1;
  descriptorForRequiredKeys_cn_once_object_1 = v3;
}

- (CNSharedProfileStateOracle)initWithContact:(id)a3 contactStore:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  v8 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v9 = [v8 nicknameProvider];
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  v12 = [v11 imNicknameProvider];
  char v13 = objc_opt_respondsToSelector();

  v14 = 0;
  v15 = 0;
  v16 = 0;
  if (v13)
  {
    v17 = [v11 imNicknameProvider];
    v18 = [v17 allNicknamesForContact:v6];

    v19 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412546;
      v23 = v18;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl(&dword_1909E3000, v19, OS_LOG_TYPE_DEFAULT, "Fetching all nicknames %@ for %@", (uint8_t *)&v22, 0x16u);
    }

    v16 = [v18 objectForKey:@"pendingNickname"];
    v14 = [v18 objectForKey:@"currentNickname"];
    v15 = [v18 objectForKey:@"archivedNickname"];
  }
  v20 = [(CNSharedProfileStateOracle *)self initWithContact:v6 contactStore:v7 archivedNickname:v15 currentNickname:v14 pendingNickname:v16];

  return v20;
}

- (CNSharedProfileStateOracle)initWithContact:(id)a3 contactStore:(id)a4 archivedNickname:(id)a5 currentNickname:(id)a6 pendingNickname:(id)a7
{
  v56[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v46 = a4;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v47.receiver = self;
  v47.super_class = (Class)CNSharedProfileStateOracle;
  v17 = [(CNSharedProfileStateOracle *)&v47 init];
  if (v17)
  {
    id v42 = v13;
    uint64_t v18 = *MEMORY[0x1E4F5A2A8];
    id v40 = a7;
    id v41 = v12;
    v19 = (void (**)(uint64_t, id))(*MEMORY[0x1E4F5A2A8] + 16);
    v44 = v14;
    v20 = (*v19)(*MEMORY[0x1E4F5A2A8], v14);
    v56[0] = v20;
    v21 = (*v19)(v18, v15);
    v56[1] = v21;
    v43 = v16;
    int v22 = (*v19)(v18, v16);
    v56[2] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:3];
    __int16 v24 = objc_msgSend(v23, "_cn_filter:", *MEMORY[0x1E4F5A280]);

    id v12 = v41;
    id v25 = a6;

    if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0
      && ([(id)objc_opt_class() nicknames:v24 areValidForContact:v41] & 1) == 0)
    {
      uint64_t v26 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v37 = [v44 handle];
        v38 = [v15 handle];
        v39 = [v43 handle];
        *(_DWORD *)buf = 138478595;
        v49 = v37;
        __int16 v50 = 2113;
        v51 = v38;
        __int16 v52 = 2113;
        v53 = v39;
        __int16 v54 = 2113;
        id v55 = v41;
        _os_log_error_impl(&dword_1909E3000, v26, OS_LOG_TYPE_ERROR, "Error intializing state oracle using nicknames (%{private}@, %{private}@, %{private}@) for contact %{private}@", buf, 0x2Au);
      }
    }
    objc_storeStrong((id *)&v17->_contact, a3);
    v17->_shouldContactBeRefetched = 1;
    v27 = (CNUnfairLock *)objc_alloc_init(MEMORY[0x1E4F5A558]);
    contactLock = v17->_contactLock;
    v17->_contactLock = v27;

    objc_storeStrong((id *)&v17->_contactStore, v46);
    objc_storeStrong((id *)&v17->_archivedNickname, a5);
    objc_storeStrong((id *)&v17->_currentNickname, v25);
    objc_storeStrong((id *)&v17->_pendingNickname, v40);
    objc_opt_class();
    v29 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    v30 = [v29 nicknameProvider];
    if (objc_opt_isKindOfClass()) {
      v31 = v30;
    }
    else {
      v31 = 0;
    }
    id v32 = v31;

    uint64_t v33 = [v32 imNicknameProvider];

    nicknameProvider = v17->_nicknameProvider;
    v17->_nicknameProvider = (IMNicknameProvider *)v33;

    v35 = v17;
    id v13 = v42;
    id v16 = v43;
    id v14 = v44;
  }

  return v17;
}

- (CNContact)contact
{
  v2 = [(CNSharedProfileStateOracle *)self contactLock];
  uint64_t v3 = CNResultWithLock();

  return (CNContact *)v3;
}

id __37__CNSharedProfileStateOracle_contact__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldContactBeRefetched])
  {
    v2 = objc_opt_class();
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = v3[1];
    int v5 = [v3 contactStore];
    uint64_t v6 = [v2 refetchedContactIfNeededWithRequiredKeys:v4 contactStore:v5];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 8);
    *(void *)(v7 + 8) = v6;

    *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  }
  v9 = *(void **)(*(void *)(a1 + 32) + 8);

  return v9;
}

- (void)setContact:(id)a3
{
  id v4 = a3;
  int v5 = [(CNSharedProfileStateOracle *)self contactLock];
  id v6 = v4;
  CNRunWithLock();
}

void __41__CNSharedProfileStateOracle_setContact___block_invoke(uint64_t a1)
{
}

- (CNContactImageStore)recentContactImageStore
{
  v2 = cn_objectResultWithObjectLock();

  return (CNContactImageStore *)v2;
}

id __53__CNSharedProfileStateOracle_recentContactImageStore__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 64);
  if (!v2)
  {
    uint64_t v3 = objc_alloc_init(CNContactImageStore);
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(void **)(v4 + 64);
    *(void *)(v4 + 64) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 64);
  }

  return v2;
}

- (CNContactPosterStore)recentPosterStore
{
  v2 = cn_objectResultWithObjectLock();

  return (CNContactPosterStore *)v2;
}

id __47__CNSharedProfileStateOracle_recentPosterStore__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 72);
  if (!v2)
  {
    uint64_t v3 = objc_alloc_init(CNContactPosterStore);
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(void **)(v4 + 72);
    *(void *)(v4 + 72) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 72);
  }

  return v2;
}

+ (BOOL)nicknames:(id)a3 areValidForContact:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(CNSharedProfileContactHandleHelper);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "handle", (void)v17);
        BOOL v14 = [(CNSharedProfileContactHandleHelper *)v7 contact:v6 containsHandleString:v13];

        if (!v14)
        {
          BOOL v15 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_11:

  return v15;
}

+ (id)refetchedContactIfNeededWithRequiredKeys:(id)a3 contactStore:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (([(id)objc_opt_class() isFeatureEnabled] & 1) == 0)
  {
    id v12 = v5;
    goto LABEL_24;
  }
  if (!v6)
  {
    id v13 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      +[CNSharedProfileStateOracle refetchedContactIfNeededWithRequiredKeys:contactStore:]();
    }
    goto LABEL_11;
  }
  CNAuthorizationStatus v7 = +[CNContactStore authorizationStatusForEntityType:0];
  id v8 = objc_opt_class();
  if (v7 != CNAuthorizationStatusAuthorized)
  {
    id v13 = [v8 log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[CNSharedProfileStateOracle refetchedContactIfNeededWithRequiredKeys:contactStore:].cold.4();
    }
LABEL_11:

    id v12 = 0;
    goto LABEL_24;
  }
  uint64_t v9 = [v8 descriptorForRequiredKeys];
  v26[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  int v11 = [v5 areKeysAvailable:v10];

  if (v11)
  {
    id v12 = v5;
  }
  else
  {
    BOOL v14 = [v5 availableKeyDescriptor];
    if (v14)
    {
      v25[0] = v9;
      BOOL v15 = [v5 availableKeyDescriptor];
      v25[1] = v15;
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    }
    else
    {
      __int16 v24 = v9;
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    }
    long long v17 = [v5 identifier];
    id v23 = 0;
    id v12 = [v6 unifiedContactWithIdentifier:v17 keysToFetch:v16 error:&v23];
    id v18 = v23;

    long long v19 = [(id)objc_opt_class() log];
    long long v20 = v19;
    if (v12)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        +[CNSharedProfileStateOracle refetchedContactIfNeededWithRequiredKeys:contactStore:]();
      }

      id v21 = v12;
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        +[CNSharedProfileStateOracle refetchedContactIfNeededWithRequiredKeys:contactStore:](v18);
      }
    }
  }

LABEL_24:

  return v12;
}

- (BOOL)effectiveStateForContactIsAutoUpdate
{
  unint64_t v2 = [(CNSharedProfileStateOracle *)self effectiveStateForContact];
  uint64_t v3 = objc_opt_class();

  return [v3 isAutoUpdateState:v2];
}

- (unint64_t)effectiveStateForContact
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(CNSharedProfileStateOracle *)self contact];
  unint64_t v5 = [v3 effectiveStateForContact:v4];

  return v5;
}

- (id)availableActionTypesForEffectiveState
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (![(id)objc_opt_class() isFeatureEnabled]) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v3 = [(CNSharedProfileStateOracle *)self contact];

  if (!v3) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v4 = [(CNSharedProfileStateOracle *)self contact];
  char v5 = [v4 hasBeenPersisted];

  if (v5)
  {
    id v6 = [(CNSharedProfileStateOracle *)self archivedNickname];

    unint64_t v7 = [(CNSharedProfileStateOracle *)self effectiveStateForContact];
    BOOL v8 = [(CNSharedProfileStateOracle *)self isRevertToPreviousExpired];
    uint64_t v9 = [(CNSharedProfileStateOracle *)self currentNickname];
    uint64_t v10 = [(CNSharedProfileStateOracle *)self archivedNickname];
    int v11 = [v9 isEqualToNickname:v10 options:34];

    id v12 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 67109888;
      *(_DWORD *)long long v19 = v6 != 0;
      *(_WORD *)&v19[4] = 1024;
      *(_DWORD *)&v19[6] = v7 == 2;
      __int16 v20 = 1024;
      BOOL v21 = v8;
      __int16 v22 = 1024;
      int v23 = v11;
      _os_log_impl(&dword_1909E3000, v12, OS_LOG_TYPE_DEFAULT, "available action types: hasArchivedNicknameToRevertTo %d, currentlyAlwaysAsk %d, revertToPreviousExpired %d, previousDiffersFromCurrent %d", (uint8_t *)&v18, 0x1Au);
    }

    int v14 = v7 == 2 || v6 == 0 || v8;
    if (v14 | v11 ^ 1) {
      BOOL v15 = &unk_1EE089698;
    }
    else {
      BOOL v15 = &unk_1EE089680;
    }
    id v16 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      *(void *)long long v19 = v15;
      _os_log_impl(&dword_1909E3000, v16, OS_LOG_TYPE_DEFAULT, "Available action types: %@", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    id v16 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1909E3000, v16, OS_LOG_TYPE_DEFAULT, "Cannot show photo preference actions for an unsaved contact", (uint8_t *)&v18, 2u);
    }
    BOOL v15 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

- (unint64_t)bannerActionTypeForEffectiveState
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ([(id)objc_opt_class() isFeatureEnabled])
  {
    uint64_t v3 = [(CNSharedProfileStateOracle *)self contact];

    if (v3)
    {
      uint64_t v4 = [(CNSharedProfileStateOracle *)self contact];
      char v5 = [v4 hasBeenPersisted];

      if ((v5 & 1) == 0)
      {
        id v12 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v36) = 0;
          _os_log_impl(&dword_1909E3000, v12, OS_LOG_TYPE_DEFAULT, "Cannot show banners for an unsaved contact", (uint8_t *)&v36, 2u);
        }
        unint64_t v11 = 0;
        goto LABEL_40;
      }
      unint64_t v6 = [(CNSharedProfileStateOracle *)self effectiveStateForContact];
      unint64_t v7 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v8 = [(CNSharedProfileStateOracle *)self contact];
        uint64_t v9 = [v8 identifier];
        uint64_t v10 = [(id)objc_opt_class() descriptionForUpdateState:v6];
        int v36 = 138543618;
        *(void *)v37 = v9;
        *(_WORD *)&v37[8] = 2112;
        *(void *)&v37[10] = v10;
        _os_log_impl(&dword_1909E3000, v7, OS_LOG_TYPE_DEFAULT, "Looking up banner action type for contact (%{public}@) with effective state: %@", (uint8_t *)&v36, 0x16u);
      }
      if (v6 != 3)
      {
        if (v6 == 2)
        {
          int v18 = [(CNSharedProfileStateOracle *)self pendingNickname];

          if (v18)
          {
            long long v19 = [(CNSharedProfileStateOracle *)self pendingNickname];
            char v20 = objc_opt_respondsToSelector();

            if (v20)
            {
              BOOL v21 = [(CNSharedProfileStateOracle *)self pendingNickname];
              int v22 = [v21 isIgnored];
            }
            else
            {
              int v22 = 0;
            }
            v29 = [(id)objc_opt_class() log];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              v30 = [(CNSharedProfileStateOracle *)self contact];
              v31 = [v30 identifier];
              int v36 = 67109378;
              *(_DWORD *)v37 = v22;
              *(_WORD *)&v37[4] = 2114;
              *(void *)&v37[6] = v31;
              _os_log_impl(&dword_1909E3000, v29, OS_LOG_TYPE_DEFAULT, "Looking up banner action type: pendingIsIgnored %d for contact (%{public}@)", (uint8_t *)&v36, 0x12u);
            }
            if (v22) {
              unint64_t v11 = 0;
            }
            else {
              unint64_t v11 = 3;
            }
            goto LABEL_38;
          }
          uint64_t v26 = [(id)objc_opt_class() log];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = [(CNSharedProfileStateOracle *)self contact];
            v28 = [v27 identifier];
            int v36 = 138543362;
            *(void *)v37 = v28;
            _os_log_impl(&dword_1909E3000, v26, OS_LOG_TYPE_DEFAULT, "Looking up banner action type: pendingNickname is nil for contact (%{public}@)", (uint8_t *)&v36, 0xCu);
          }
        }
        else if (v6 == 1)
        {
          unint64_t v11 = [(CNSharedProfileStateOracle *)self canShowRevertToPreviousBannerForEffectiveState:1];
          goto LABEL_38;
        }
        unint64_t v11 = 0;
LABEL_38:
        id v12 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = [(id)objc_opt_class() descriptionForActionType:v11];
          uint64_t v33 = [(CNSharedProfileStateOracle *)self contact];
          v34 = [v33 identifier];
          int v36 = 138412546;
          *(void *)v37 = v32;
          *(_WORD *)&v37[8] = 2114;
          *(void *)&v37[10] = v34;
          _os_log_impl(&dword_1909E3000, v12, OS_LOG_TYPE_DEFAULT, "Returning banner action type: %@ for contact (%{public}@)", (uint8_t *)&v36, 0x16u);
        }
LABEL_40:

        return v11;
      }
      id v13 = [(CNSharedProfileStateOracle *)self lastRecentContactImage];
      uint64_t v14 = [(CNSharedProfileStateOracle *)self lastRecentPoster];
      BOOL v15 = (void *)v14;
      if (v13)
      {
        int v16 = [v13 ignoredForRevert] ^ 1;
        if (v15)
        {
LABEL_16:
          int v17 = [v15 ignoredForRevert] ^ 1;
LABEL_22:
          int v23 = [(id)objc_opt_class() log];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = [(CNSharedProfileStateOracle *)self contact];
            id v25 = [v24 identifier];
            int v36 = 67109634;
            *(_DWORD *)v37 = v16;
            *(_WORD *)&v37[4] = 1024;
            *(_DWORD *)&v37[6] = v17;
            *(_WORD *)&v37[10] = 2114;
            *(void *)&v37[12] = v25;
            _os_log_impl(&dword_1909E3000, v23, OS_LOG_TYPE_DEFAULT, "Looking up banner action type: recentAvatarAvailableForRevert %d, recentPosterAvailableForRevert %d for contact (%{public}@)", (uint8_t *)&v36, 0x18u);
          }
          if ((v16 | v17)) {
            unint64_t v11 = 2;
          }
          else {
            unint64_t v11 = [(CNSharedProfileStateOracle *)self canShowRevertToPreviousBannerForEffectiveState:3];
          }

          goto LABEL_38;
        }
      }
      else
      {
        int v16 = 0;
        if (v14) {
          goto LABEL_16;
        }
      }
      int v17 = 0;
      goto LABEL_22;
    }
  }
  return 0;
}

- (BOOL)canShowRevertToPreviousBannerForEffectiveState:(unint64_t)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int v4 = [(id)objc_opt_class() isAutoUpdateState:a3];
  if (!v4) {
    return v4;
  }
  char v5 = [(CNSharedProfileStateOracle *)self archivedNickname];

  if (!v5)
  {
    BOOL v21 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = [(CNSharedProfileStateOracle *)self contact];
      int v23 = [v22 identifier];
      int v26 = 138543362;
      v27 = v23;
      _os_log_impl(&dword_1909E3000, v21, OS_LOG_TYPE_DEFAULT, "No archived nickname found for contact (%{public}@), cannot show revert to previous banner", (uint8_t *)&v26, 0xCu);
    }
    goto LABEL_15;
  }
  unint64_t v6 = [(CNSharedProfileStateOracle *)self archivedNickname];
  unint64_t v7 = [(CNSharedProfileStateOracle *)self currentNickname];
  int v8 = [v6 isEqualToNickname:v7 options:2];

  uint64_t v9 = [(CNSharedProfileStateOracle *)self archivedNickname];
  uint64_t v10 = [(CNSharedProfileStateOracle *)self currentNickname];
  int v11 = [v9 isEqualToNickname:v10 options:32];

  id v12 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(CNSharedProfileStateOracle *)self contact];
    uint64_t v14 = [v13 identifier];
    int v26 = 138543874;
    v27 = v14;
    __int16 v28 = 1024;
    int v29 = v8;
    __int16 v30 = 1024;
    BOOL v31 = v11;
    _os_log_impl(&dword_1909E3000, v12, OS_LOG_TYPE_DEFAULT, "Contact (%{public}@) archived vs current: photoDiffers %d, wallpaperDiffers %d", (uint8_t *)&v26, 0x18u);
  }
  if (((v8 | v11) & 1) == 0)
  {
    uint64_t v24 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1909E3000, v24, OS_LOG_TYPE_DEFAULT, "Not offering revert banner, no photo or wallpaper changes from current to archived", (uint8_t *)&v26, 2u);
    }

LABEL_15:
    LOBYTE(v4) = 0;
    return v4;
  }
  BOOL v15 = [(CNSharedProfileStateOracle *)self archivedNickname];
  int v16 = [v15 isIgnored];

  BOOL v17 = [(CNSharedProfileStateOracle *)self isRevertBannerExpired];
  int v18 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    long long v19 = [(CNSharedProfileStateOracle *)self contact];
    char v20 = [v19 identifier];
    int v26 = 138543874;
    v27 = v20;
    __int16 v28 = 1024;
    int v29 = v16;
    __int16 v30 = 1024;
    BOOL v31 = v17;
    _os_log_impl(&dword_1909E3000, v18, OS_LOG_TYPE_DEFAULT, "Contact (%{public}@) archivedIsIgnored %d, archivedIsExpired %d", (uint8_t *)&v26, 0x18u);
  }
  LOBYTE(v4) = (v16 | v17) ^ 1;
  return v4;
}

- (id)targetProfileForActionType:(unint64_t)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (![(id)objc_opt_class() isFeatureEnabled])
  {
    char v5 = 0;
    goto LABEL_61;
  }
  char v5 = [(CNSharedProfileStateOracle *)self contact];

  if (!v5) {
    goto LABEL_61;
  }
  if (![(CNSharedProfileStateOracle *)self contactRequiresUpdateForActionType:a3])
  {
    int v16 = [CNSharedProfile alloc];
    BOOL v17 = [(CNSharedProfileStateOracle *)self contact];
    char v5 = [(CNSharedProfile *)v16 initWithContact:v17];

    goto LABEL_61;
  }
  switch(a3)
  {
    case 3uLL:
      if ([(CNSharedProfileStateOracle *)self effectiveStateForContact] == 2)
      {
        int v18 = [(CNSharedProfileStateOracle *)self pendingNickname];
        if (v18)
        {
          long long v19 = [(CNSharedProfileStateOracle *)self currentNickname];
          BOOL v20 = v19 == 0;
        }
        else
        {
          BOOL v20 = 0;
        }

        uint64_t v38 = [(CNSharedProfileStateOracle *)self pendingNickname];
        if (v38
          && ((v39 = (void *)v38,
               [(CNSharedProfileStateOracle *)self currentNickname],
               id v40 = objc_claimAutoreleasedReturnValue(),
               v40,
               v39,
               !v40)
            ? (int v41 = 1)
            : (int v41 = v20),
              v41 != 1))
        {
          v44 = [(CNSharedProfileStateOracle *)self pendingNickname];
          int v45 = [v44 hasObservedTransition];

          if (v45) {
            goto LABEL_47;
          }
        }
        else if (v20)
        {
LABEL_47:
          id v42 = [CNSharedProfile alloc];
          v43 = [(CNSharedProfileStateOracle *)self pendingNickname];
          char v5 = [(CNSharedProfile *)v42 initWithNickname:v43];

          BOOL v15 = [(id)objc_opt_class() log];
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_57;
          }
          uint64_t v24 = [(CNSharedProfileStateOracle *)self contact];
          __int16 v28 = [v24 identifier];
          int v53 = 138543362;
          __int16 v54 = (CNSharedProfile *)v28;
          int v29 = "Contact (%{public}@) has a pending nickname ready, using pendingNickname as target Latest Photo";
          goto LABEL_55;
        }
        char v5 = [(CNSharedProfileStateOracle *)self currentNickname];

        if (!v5) {
          goto LABEL_58;
        }
        id v46 = [CNSharedProfile alloc];
        objc_super v47 = [(CNSharedProfileStateOracle *)self currentNickname];
        char v5 = [(CNSharedProfile *)v46 initWithNickname:v47];

        BOOL v15 = [(id)objc_opt_class() log];
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_57;
        }
        uint64_t v24 = [(CNSharedProfileStateOracle *)self contact];
        __int16 v28 = [v24 identifier];
        int v53 = 138543362;
        __int16 v54 = (CNSharedProfile *)v28;
        int v29 = "Contact (%{public}@) has a current nickname with no pending nickname ready, using currentNickname as target Latest Photo";
      }
      else
      {
        char v5 = [(CNSharedProfileStateOracle *)self currentNickname];

        if (!v5) {
          goto LABEL_58;
        }
        int v26 = [CNSharedProfile alloc];
        v27 = [(CNSharedProfileStateOracle *)self currentNickname];
        char v5 = [(CNSharedProfile *)v26 initWithNickname:v27];

        BOOL v15 = [(id)objc_opt_class() log];
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_57;
        }
        uint64_t v24 = [(CNSharedProfileStateOracle *)self contact];
        __int16 v28 = [v24 identifier];
        int v53 = 138543362;
        __int16 v54 = (CNSharedProfile *)v28;
        int v29 = "Contact (%{public}@) using currentNickname as target Latest Photo";
      }
LABEL_55:
      _os_log_impl(&dword_1909E3000, v15, OS_LOG_TYPE_DEFAULT, v29, (uint8_t *)&v53, 0xCu);
LABEL_56:

      goto LABEL_57;
    case 2uLL:
      unint64_t v21 = [(CNSharedProfileStateOracle *)self effectiveStateForContact];
      if (v21 == 1) {
        goto LABEL_22;
      }
      if (v21 != 3)
      {
        __int16 v30 = [CNSharedProfile alloc];
        BOOL v31 = [(CNSharedProfileStateOracle *)self contact];
        char v5 = [(CNSharedProfile *)v30 initWithContact:v31];

        BOOL v15 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = [(CNSharedProfileStateOracle *)self contact];
          uint64_t v33 = [v32 identifier];
          v34 = [(id)objc_opt_class() descriptionForActionType:2];
          int v53 = 138543618;
          __int16 v54 = v33;
          __int16 v55 = 2112;
          v56 = v34;
          _os_log_impl(&dword_1909E3000, v15, OS_LOG_TYPE_DEFAULT, "Defaulting to using current contact (%{public}@) photo as target photo for action type: %@ ", (uint8_t *)&v53, 0x16u);
        }
        goto LABEL_57;
      }
      int v22 = [(CNSharedProfileStateOracle *)self contact];
      uint64_t v23 = [v22 sharedPhotoDisplayPreference];

      if (v23)
      {
LABEL_22:
        BOOL v15 = [(CNSharedProfileStateOracle *)self lastRecentContactImage];
        uint64_t v24 = [(CNSharedProfileStateOracle *)self lastRecentPoster];
        if (v15) {
          int v25 = [v15 ignoredForRevert] ^ 1;
        }
        else {
          int v25 = 0;
        }
        if (v24) {
          int v35 = [v24 ignoredForRevert] ^ 1;
        }
        else {
          int v35 = 0;
        }
        if ((v25 | v35))
        {
          char v5 = [[CNSharedProfile alloc] initWithRecentContactImage:v15 recentPoster:v24];
          __int16 v28 = [(id)objc_opt_class() log];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            int v36 = [(CNSharedProfileStateOracle *)self contact];
            v37 = [v36 identifier];
            int v53 = 138543362;
            __int16 v54 = v37;
            _os_log_impl(&dword_1909E3000, v28, OS_LOG_TYPE_DEFAULT, "Contact (%{public}@) has a recent avatar or poster, using recent as target Custom Photo", (uint8_t *)&v53, 0xCu);
          }
        }
        else
        {
          __int16 v28 = [(id)objc_opt_class() log];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            -[CNSharedProfileStateOracle targetProfileForActionType:](self);
          }
          char v5 = 0;
        }
        goto LABEL_56;
      }
      v48 = [CNSharedProfile alloc];
      v49 = [(CNSharedProfileStateOracle *)self contact];
      char v5 = [(CNSharedProfile *)v48 initWithContact:v49];

      BOOL v15 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = [(CNSharedProfileStateOracle *)self contact];
        __int16 v28 = [v24 identifier];
        int v53 = 138543362;
        __int16 v54 = (CNSharedProfile *)v28;
        int v29 = "Contact (%{public}@) is in an undetermined update state, using the existing contact photo as target Custom Photo";
        goto LABEL_55;
      }
LABEL_57:

      goto LABEL_58;
    case 1uLL:
      char v5 = [(CNSharedProfileStateOracle *)self archivedNickname];

      if (!v5) {
        goto LABEL_58;
      }
      unint64_t v6 = [CNSharedProfile alloc];
      unint64_t v7 = [(CNSharedProfileStateOracle *)self archivedNickname];
      char v5 = [(CNSharedProfile *)v6 initWithNickname:v7];

      int v8 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [(CNSharedProfileStateOracle *)self contact];
        uint64_t v10 = [v9 identifier];
        int v53 = 138543362;
        __int16 v54 = v10;
        _os_log_impl(&dword_1909E3000, v8, OS_LOG_TYPE_DEFAULT, "Contact (%{public}@) has an archived nickname, using archivedNickname as target Previous Photo", (uint8_t *)&v53, 0xCu);
      }
      int v11 = [(CNSharedProfileStateOracle *)self currentNickname];

      if (!v11) {
        goto LABEL_58;
      }
      id v12 = [(CNSharedProfileStateOracle *)self currentNickname];
      id v13 = [(CNSharedProfileStateOracle *)self archivedNickname];
      BOOL v14 = [(CNSharedProfileStateOracle *)self didPhotoOrWallpaperChangeFrom:v12 to:v13];

      if (v14) {
        goto LABEL_58;
      }
      BOOL v15 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[CNSharedProfileStateOracle targetProfileForActionType:](self);
      }
      goto LABEL_57;
  }
  char v5 = 0;
LABEL_58:
  __int16 v50 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    v51 = [(id)objc_opt_class() descriptionForActionType:a3];
    int v53 = 138412546;
    __int16 v54 = v5;
    __int16 v55 = 2112;
    v56 = v51;
    _os_log_impl(&dword_1909E3000, v50, OS_LOG_TYPE_DEFAULT, "Returning target shared profile %@ for action type %@", (uint8_t *)&v53, 0x16u);
  }
LABEL_61:

  return v5;
}

- (BOOL)shouldPerformTransitionAnimation
{
  *(void *)&v34[5] = *MEMORY[0x1E4F143B8];
  int v3 = [(id)objc_opt_class() isFeatureEnabled];
  if (!v3) {
    return v3;
  }
  int v4 = [(CNSharedProfileStateOracle *)self contact];

  if (!v4) {
    goto LABEL_19;
  }
  if (([(id)objc_opt_class() shouldBypassPersistenceCheck] & 1) == 0)
  {
    char v5 = [(CNSharedProfileStateOracle *)self contact];
    char v6 = [v5 hasBeenPersisted];

    if ((v6 & 1) == 0)
    {
      int v18 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_1909E3000, v18, OS_LOG_TYPE_DEFAULT, "Cannot show an animation for an unsaved contact", (uint8_t *)&v33, 2u);
      }

      goto LABEL_19;
    }
  }
  unint64_t v7 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [(CNSharedProfileStateOracle *)self contact];
    uint64_t v9 = [v8 identifier];
    int v33 = 138412290;
    *(void *)v34 = v9;
    _os_log_impl(&dword_1909E3000, v7, OS_LOG_TYPE_DEFAULT, "Checking for shouldPerformTransitionAnimation for contact <%@>", (uint8_t *)&v33, 0xCu);
  }
  BOOL v10 = [(CNSharedProfileStateOracle *)self didPendingNicknameChangePhotoOrWallpaper];
  int v11 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 67109120;
    v34[0] = v10;
    _os_log_impl(&dword_1909E3000, v11, OS_LOG_TYPE_DEFAULT, "Pending nickname didPendingNicknameChangePhotoOrWallpaper: %d", (uint8_t *)&v33, 8u);
  }

  if (!v10) {
    goto LABEL_19;
  }
  id v12 = [(CNSharedProfileStateOracle *)self pendingNickname];

  id v13 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 67109120;
    v34[0] = 1;
    _os_log_impl(&dword_1909E3000, v13, OS_LOG_TYPE_DEFAULT, "shouldPerformTransitionAnimation: pendingHasChangedPhotoOrWallpaper: %d", (uint8_t *)&v33, 8u);
  }

  if (!v12) {
    goto LABEL_19;
  }
  if (![(CNSharedProfileStateOracle *)self effectiveStateForContactIsAutoUpdate])
  {
    BOOL v14 = [(CNSharedProfileStateOracle *)self pendingNickname];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      int v16 = [(CNSharedProfileStateOracle *)self pendingNickname];
      int v17 = [v16 hasObservedTransition];
    }
    else
    {
      int v17 = 0;
    }
    long long v19 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 67109120;
      v34[0] = v17;
      _os_log_impl(&dword_1909E3000, v19, OS_LOG_TYPE_DEFAULT, "shouldPerformTransitionAnimation: hasObservedTransition: %d", (uint8_t *)&v33, 8u);
    }

    if (v17)
    {
LABEL_19:
      LOBYTE(v3) = 0;
      return v3;
    }
  }
  BOOL v20 = [(CNSharedProfileStateOracle *)self contact];
  if ([v20 imageDataAvailable])
  {
    int v21 = 0;
  }
  else
  {
    int v22 = [(CNSharedProfileStateOracle *)self pendingNickname];
    uint64_t v23 = [v22 avatar];
    int v21 = [v23 hasImage] ^ 1;
  }
  uint64_t v24 = *MEMORY[0x1E4F5A268];
  int v25 = [(CNSharedProfileStateOracle *)self contact];
  int v26 = [v25 wallpaper];
  v27 = [v26 posterArchiveData];
  if ((*(unsigned int (**)(uint64_t, void *))(v24 + 16))(v24, v27))
  {
    __int16 v28 = [(CNSharedProfileStateOracle *)self pendingNickname];
    int v29 = [v28 wallpaper];
    int v30 = [v29 wallpaperExists] ^ 1;
  }
  else
  {
    int v30 = 0;
  }

  BOOL v31 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 67109376;
    v34[0] = v30;
    LOWORD(v34[1]) = 1024;
    *(_DWORD *)((char *)&v34[1] + 2) = v21;
    _os_log_impl(&dword_1909E3000, v31, OS_LOG_TYPE_DEFAULT, "shouldPerformTransitionAnimation: noWallpaperToTransition: %d, noAvatarToTransition :%d", (uint8_t *)&v33, 0xEu);
  }

  LOBYTE(v3) = v21 & v30 ^ 1;
  return v3;
}

- (unint64_t)avatarViewAnimationTypeForEffectiveState
{
  if ([(id)objc_opt_class() isFeatureEnabled]
    && ([(CNSharedProfileStateOracle *)self contact],
        int v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3)
    && [(CNSharedProfileStateOracle *)self shouldPerformTransitionAnimation]
    && (unint64_t v4 = [(CNSharedProfileStateOracle *)self effectiveStateForContact], v4 <= 3))
  {
    return qword_190B90380[v4];
  }
  else
  {
    return 2;
  }
}

- (BOOL)contactRequiresUpdateForActionType:(unint64_t)a3
{
  int v5 = [(id)objc_opt_class() isFeatureEnabled];
  if (v5)
  {
    BOOL v6 = [(CNSharedProfileStateOracle *)self effectiveStateForContact] != 1;
    char v7 = a3 != 3 || v6;
    if (a3) {
      LOBYTE(v5) = v7;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)updateContactForActionType:(unint64_t)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v7 = [(id)objc_opt_class() isFeatureEnabled];
  int v8 = [(CNSharedProfileStateOracle *)self contact];
  uint64_t v9 = v8;
  if (v7)
  {

    if (v9)
    {
      BOOL v10 = [(CNSharedProfileStateOracle *)self contact];
      char v11 = [v10 hasBeenPersisted];

      if (v11)
      {
        if ([(CNSharedProfileStateOracle *)self contactRequiresUpdateForActionType:a3])
        {
          id v12 = [(CNSharedProfileStateOracle *)self targetProfileForActionType:a3];
          id v13 = [(CNSharedProfileStateOracle *)self contact];
          BOOL v14 = (void *)[v13 mutableCopy];

          switch(a3)
          {
            case 0uLL:
              long long v19 = [(id)objc_opt_class() log];
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v27) = 0;
                _os_log_impl(&dword_1909E3000, v19, OS_LOG_TYPE_DEFAULT, "Trying to update contact for action type None", (uint8_t *)&v27, 2u);
              }

              break;
            case 1uLL:
            case 2uLL:
              [v14 updateWithSharedProfile:v12];
              char v15 = v14;
              uint64_t v16 = 2;
              goto LABEL_15;
            case 3uLL:
              [v14 updateWithSharedProfile:v12];
              char v15 = v14;
              uint64_t v16 = 1;
LABEL_15:
              [v15 setSharedPhotoDisplayPreference:v16];
              break;
            default:
              break;
          }
          BOOL v20 = [(CNSharedProfileStateOracle *)self saveUpdatedContact:v14 error:a4];
          int v21 = [(id)objc_opt_class() log];
          int v22 = v21;
          if (v20)
          {
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v23 = [(CNSharedProfileStateOracle *)self contact];
              uint64_t v24 = [v23 identifier];
              int v25 = [(id)objc_opt_class() descriptionForActionType:a3];
              int v27 = 138543618;
              __int16 v28 = v24;
              __int16 v29 = 2112;
              int v30 = v25;
              _os_log_impl(&dword_1909E3000, v22, OS_LOG_TYPE_DEFAULT, "Saved updated contact: %{public}@ for actionType %@", (uint8_t *)&v27, 0x16u);
            }
            uint64_t v9 = [v14 freeze];
          }
          else
          {
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              -[CNSharedProfileStateOracle updateContactForActionType:error:]((uint64_t)self, a3);
            }

            uint64_t v9 = 0;
          }
        }
        else
        {
          uint64_t v9 = [(CNSharedProfileStateOracle *)self contact];
        }
      }
      else
      {
        int v17 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = [(id)objc_opt_class() descriptionForActionType:a3];
          int v27 = 138412290;
          __int16 v28 = v18;
          _os_log_impl(&dword_1909E3000, v17, OS_LOG_TYPE_DEFAULT, "Cannot update an unsaved contact for actionType %@", (uint8_t *)&v27, 0xCu);
        }
        uint64_t v9 = 0;
      }
    }
  }

  return v9;
}

- (id)updateContactAndNicknamesForActionType:(unint64_t)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  int v7 = [(id)objc_opt_class() isFeatureEnabled];
  int v8 = [(CNSharedProfileStateOracle *)self contact];
  uint64_t v9 = v8;
  if (!v7) {
    goto LABEL_24;
  }

  if (!v9) {
    goto LABEL_24;
  }
  BOOL v10 = [(CNSharedProfileStateOracle *)self contact];
  char v11 = [v10 hasBeenPersisted];

  id v12 = [(id)objc_opt_class() log];
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      BOOL v14 = [(CNSharedProfileStateOracle *)self contact];
      char v15 = [v14 identifier];
      uint64_t v16 = [(id)objc_opt_class() descriptionForActionType:a3];
      int v36 = 138543618;
      v37 = v15;
      __int16 v38 = 2112;
      v39 = v16;
      _os_log_impl(&dword_1909E3000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to update contact (%{public}@) and nicknames for actionType: %@", (uint8_t *)&v36, 0x16u);
    }
    uint64_t v9 = [(CNSharedProfileStateOracle *)self updateContactForActionType:a3 error:a4];
    if (a3 == 3)
    {
      int v26 = [(CNSharedProfileStateOracle *)self contact];
      uint64_t v27 = [v26 sharedPhotoDisplayPreference];

      unint64_t v28 = [(CNSharedProfileStateOracle *)self effectiveStateForContact];
      if (!v27 || v28 == 2) {
        [(CNSharedProfileStateOracle *)self saveCurrentAvatarPosterPairToRecents];
      }
      __int16 v29 = [(CNSharedProfileStateOracle *)self nicknameProvider];
      char v30 = objc_opt_respondsToSelector();

      if ((v30 & 1) == 0) {
        goto LABEL_21;
      }
      long long v19 = [(CNSharedProfileStateOracle *)self nicknameProvider];
      BOOL v20 = [(CNSharedProfileStateOracle *)self pendingNickname];
      int v21 = [v20 handle];
      int v22 = v19;
      uint64_t v23 = v21;
      uint64_t v24 = 1;
    }
    else
    {
      if (a3 != 1) {
        goto LABEL_21;
      }
      if ([(CNSharedProfileStateOracle *)self effectiveStateForContact] == 2) {
        [(CNSharedProfileStateOracle *)self saveCurrentAvatarPosterPairToRecents];
      }
      int v17 = [(CNSharedProfileStateOracle *)self nicknameProvider];
      char v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) == 0) {
        goto LABEL_21;
      }
      long long v19 = [(CNSharedProfileStateOracle *)self nicknameProvider];
      BOOL v20 = [(CNSharedProfileStateOracle *)self archivedNickname];
      int v21 = [v20 handle];
      int v22 = v19;
      uint64_t v23 = v21;
      uint64_t v24 = 2;
    }
    [v22 bannerActionTapped:v23 IMNicknameBannerAction:v24];

LABEL_21:
    [(CNSharedProfileStateOracle *)self updateOracleContactAndNicknamesWithUpdatedContact:v9];
    uint64_t v31 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = [(CNSharedProfileStateOracle *)self contact];
      int v33 = [v32 identifier];
      v34 = [(id)objc_opt_class() descriptionForActionType:a3];
      int v36 = 138543618;
      v37 = v33;
      __int16 v38 = 2112;
      v39 = v34;
      _os_log_impl(&dword_1909E3000, v31, OS_LOG_TYPE_DEFAULT, "Updated contact (%{public}@) and nicknames for actionType: %@", (uint8_t *)&v36, 0x16u);
    }
    goto LABEL_24;
  }
  if (v13)
  {
    int v25 = [(id)objc_opt_class() descriptionForActionType:a3];
    int v36 = 138412290;
    v37 = v25;
    _os_log_impl(&dword_1909E3000, v12, OS_LOG_TYPE_DEFAULT, "Cannot update an unsaved contact for actionType %@", (uint8_t *)&v36, 0xCu);
  }
  uint64_t v9 = [(CNSharedProfileStateOracle *)self contact];
LABEL_24:

  return v9;
}

- (id)updateContactForAutoUpdateWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v5 = [(id)objc_opt_class() isFeatureEnabled];
  BOOL v6 = [(CNSharedProfileStateOracle *)self contact];
  int v7 = v6;
  if (!v5) {
    goto LABEL_22;
  }

  if (!v7) {
    goto LABEL_22;
  }
  int v8 = [(CNSharedProfileStateOracle *)self contact];
  char v9 = [v8 hasBeenPersisted];

  if (v9)
  {
    BOOL v10 = [(CNSharedProfileStateOracle *)self contact];
    char v11 = (void *)[v10 mutableCopy];

    id v12 = [(CNSharedProfileStateOracle *)self contact];
    uint64_t v13 = [v12 sharedPhotoDisplayPreference];

    if (v13)
    {
LABEL_14:
      int v21 = [CNSharedProfile alloc];
      uint64_t v22 = [(CNSharedProfileStateOracle *)self pendingNickname];
      uint64_t v23 = [(CNSharedProfile *)v21 initWithNickname:v22];

      [v11 updateWithSharedProfile:v23];
      LOBYTE(v22) = [(CNSharedProfileStateOracle *)self saveUpdatedContact:v11 error:a3];
      uint64_t v24 = [(id)objc_opt_class() log];
      int v25 = v24;
      if (v22)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = [(CNSharedProfileStateOracle *)self contact];
          uint64_t v27 = [v26 identifier];
          int v29 = 138543362;
          char v30 = v27;
          _os_log_impl(&dword_1909E3000, v25, OS_LOG_TYPE_DEFAULT, "Saved updated contact: %{public}@ for auto-update", (uint8_t *)&v29, 0xCu);
        }
        int v7 = [v11 freeze];
      }
      else
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[CNSharedProfileStateOracle updateContactForAutoUpdateWithError:]();
        }

        int v7 = 0;
      }

      goto LABEL_22;
    }
    BOOL v14 = [(CNSharedProfileStateOracle *)self contact];
    if ([v14 imageDataAvailable])
    {
    }
    else
    {
      uint64_t v16 = *MEMORY[0x1E4F5A268];
      int v17 = [(CNSharedProfileStateOracle *)self contact];
      char v18 = [v17 wallpaper];
      long long v19 = [v18 posterArchiveData];
      LOBYTE(v16) = (*(uint64_t (**)(uint64_t, void *))(v16 + 16))(v16, v19);

      if (v16)
      {
        uint64_t v20 = 1;
LABEL_13:
        [v11 setSharedPhotoDisplayPreference:v20];
        [(CNSharedProfileStateOracle *)self saveCurrentAvatarPosterPairToRecents];
        goto LABEL_14;
      }
    }
    uint64_t v20 = 3;
    goto LABEL_13;
  }
  char v15 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl(&dword_1909E3000, v15, OS_LOG_TYPE_DEFAULT, "Cannot update an unsaved contact for autoupdate", (uint8_t *)&v29, 2u);
  }

  int v7 = [(CNSharedProfileStateOracle *)self contact];
LABEL_22:

  return v7;
}

- (id)updateContactAndNicknamesForAutoUpdateWithError:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v5 = [(id)objc_opt_class() isFeatureEnabled];
  BOOL v6 = [(CNSharedProfileStateOracle *)self contact];
  int v7 = v6;
  if (!v5) {
    goto LABEL_20;
  }

  if (!v7) {
    goto LABEL_20;
  }
  int v8 = [(CNSharedProfileStateOracle *)self contact];
  char v9 = [v8 hasBeenPersisted];

  BOOL v10 = [(id)objc_opt_class() log];
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((v9 & 1) == 0)
  {
    if (v11)
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1909E3000, v10, OS_LOG_TYPE_DEFAULT, "Cannot update an unsaved contact for autoupdate", (uint8_t *)&v22, 2u);
    }

    goto LABEL_16;
  }
  if (v11)
  {
    id v12 = [(CNSharedProfileStateOracle *)self contact];
    uint64_t v13 = [v12 identifier];
    int v22 = 138543362;
    uint64_t v23 = v13;
    _os_log_impl(&dword_1909E3000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to update contact (%{public}@) and nicknames for auto-update", (uint8_t *)&v22, 0xCu);
  }
  if ([(CNSharedProfileStateOracle *)self effectiveStateForContactIsAutoUpdate])
  {
    if ([(CNSharedProfileStateOracle *)self didPendingNicknameChangePhotoOrWallpaper])
    {
      int v7 = [(CNSharedProfileStateOracle *)self updateContactForAutoUpdateWithError:a3];
      BOOL v14 = [(CNSharedProfileStateOracle *)self nicknameProvider];
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        uint64_t v16 = [(CNSharedProfileStateOracle *)self nicknameProvider];
        int v17 = [(CNSharedProfileStateOracle *)self pendingNickname];
        char v18 = [v17 handle];
        [v16 markTransitionAsObservedForHandleID:v18 isAutoUpdate:1];
      }
      [(CNSharedProfileStateOracle *)self updateOracleContactAndNicknamesWithUpdatedContact:v7];
      long long v19 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        uint64_t v23 = v7;
        _os_log_impl(&dword_1909E3000, v19, OS_LOG_TYPE_DEFAULT, "Updated contact and nicknames for auto-update, with result: %@", (uint8_t *)&v22, 0xCu);
      }

      goto LABEL_20;
    }
LABEL_16:
    int v7 = [(CNSharedProfileStateOracle *)self contact];
    goto LABEL_20;
  }
  uint64_t v20 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[CNSharedProfileStateOracle updateContactAndNicknamesForAutoUpdateWithError:](self);
  }

  int v7 = 0;
LABEL_20:

  return v7;
}

- (id)updateContactForDeclinedActionType:(unint64_t)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v7 = [(id)objc_opt_class() isFeatureEnabled];
  int v8 = [(CNSharedProfileStateOracle *)self contact];
  char v9 = v8;
  if (v7)
  {

    if (v9)
    {
      BOOL v10 = [(CNSharedProfileStateOracle *)self contact];
      char v11 = [v10 hasBeenPersisted];

      if (v11)
      {
        unint64_t v12 = [(CNSharedProfileStateOracle *)self effectiveStateForContact];
        uint64_t v13 = [(CNSharedProfileStateOracle *)self contact];
        BOOL v14 = (void *)[v13 mutableCopy];

        if (a3 == 2 && v12 == 3)
        {
          [v14 setSharedPhotoDisplayPreference:1];
          BOOL v15 = [(CNSharedProfileStateOracle *)self saveUpdatedContact:v14 error:a4];
          uint64_t v16 = [(id)objc_opt_class() log];
          int v17 = v16;
          if (!v15)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              -[CNSharedProfileStateOracle updateContactForDeclinedActionType:error:]();
            }

            char v9 = 0;
            goto LABEL_17;
          }
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            char v18 = [(CNSharedProfileStateOracle *)self contact];
            long long v19 = [v18 identifier];
            uint64_t v20 = [(id)objc_opt_class() descriptionForActionType:2];
            int v24 = 138543618;
            int v25 = v19;
            __int16 v26 = 2112;
            uint64_t v27 = v20;
            _os_log_impl(&dword_1909E3000, v17, OS_LOG_TYPE_DEFAULT, "Saved updated contact: %{public}@ for declined actionType %@", (uint8_t *)&v24, 0x16u);
          }
        }
        char v9 = [v14 freeze];
LABEL_17:

        goto LABEL_18;
      }
      int v21 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = [(id)objc_opt_class() descriptionForActionType:a3];
        int v24 = 138412290;
        int v25 = v22;
        _os_log_impl(&dword_1909E3000, v21, OS_LOG_TYPE_DEFAULT, "Cannot update an unsaved contact for declined actionType %@", (uint8_t *)&v24, 0xCu);
      }
      char v9 = [(CNSharedProfileStateOracle *)self contact];
    }
  }
LABEL_18:

  return v9;
}

- (id)updateContactAndNicknamesForDeclinedActionType:(unint64_t)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int v7 = [(id)objc_opt_class() isFeatureEnabled];
  int v8 = [(CNSharedProfileStateOracle *)self contact];
  char v9 = v8;
  if (!v7) {
    goto LABEL_19;
  }

  if (!v9) {
    goto LABEL_19;
  }
  BOOL v10 = [(CNSharedProfileStateOracle *)self contact];
  char v11 = [v10 hasBeenPersisted];

  unint64_t v12 = [(id)objc_opt_class() log];
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      BOOL v14 = [(CNSharedProfileStateOracle *)self contact];
      BOOL v15 = [v14 identifier];
      uint64_t v16 = [(id)objc_opt_class() descriptionForActionType:a3];
      int v26 = 138543618;
      uint64_t v27 = v15;
      __int16 v28 = 2112;
      int v29 = v16;
      _os_log_impl(&dword_1909E3000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to decline update for contact (%{public}@) and nicknames for actionType: %@", (uint8_t *)&v26, 0x16u);
    }
    char v9 = [(CNSharedProfileStateOracle *)self updateContactForDeclinedActionType:a3 error:a4];
    if (a3 == 3)
    {
      char v18 = [(CNSharedProfileStateOracle *)self nicknameProvider];
      long long v19 = [(CNSharedProfileStateOracle *)self pendingNickname];
      uint64_t v20 = [v19 handle];
      [v18 bannerActionTapped:v20 IMNicknameBannerAction:3];
    }
    else
    {
      if (a3 != 2)
      {
        if (a3 == 1) {
          [(CNSharedProfileStateOracle *)self markArchivedNicknameAsIgnored];
        }
        goto LABEL_16;
      }
      char v18 = [(CNSharedProfileStateOracle *)self lastRecentContactImage];
      [v18 setIgnoredForRevert:1];
      [(CNSharedProfileStateOracle *)self saveContactImage:v18];
      long long v19 = [(CNSharedProfileStateOracle *)self lastRecentPoster];
      [v19 setIgnoredForRevert:1];
      [(CNSharedProfileStateOracle *)self saveContactPoster:v19];
      [(CNSharedProfileStateOracle *)self markArchivedNicknameAsIgnored];
    }

LABEL_16:
    [(CNSharedProfileStateOracle *)self updateOracleContactAndNicknamesWithUpdatedContact:v9];
    int v21 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = [(CNSharedProfileStateOracle *)self contact];
      uint64_t v23 = [v22 identifier];
      int v24 = [(id)objc_opt_class() descriptionForActionType:a3];
      int v26 = 138543618;
      uint64_t v27 = v23;
      __int16 v28 = 2112;
      int v29 = v24;
      _os_log_impl(&dword_1909E3000, v21, OS_LOG_TYPE_DEFAULT, "Updated contact (%{public}@) and nicknames for declined actionType: %@", (uint8_t *)&v26, 0x16u);
    }
    goto LABEL_19;
  }
  if (v13)
  {
    int v17 = [(id)objc_opt_class() descriptionForActionType:a3];
    int v26 = 138412290;
    uint64_t v27 = v17;
    _os_log_impl(&dword_1909E3000, v12, OS_LOG_TYPE_DEFAULT, "Cannot update an unsaved contact for declined actionType %@", (uint8_t *)&v26, 0xCu);
  }
  char v9 = [(CNSharedProfileStateOracle *)self contact];
LABEL_19:

  return v9;
}

- (void)markArchivedNicknameAsIgnored
{
  id v5 = [(CNSharedProfileStateOracle *)self nicknameProvider];
  int v3 = [(CNSharedProfileStateOracle *)self archivedNickname];
  unint64_t v4 = [v3 handle];
  [v5 bannerActionTapped:v4 IMNicknameBannerAction:4];
}

- (BOOL)saveUpdatedContact:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(id)objc_opt_class() isFeatureEnabled])
  {
    int v7 = [(CNSharedProfileStateOracle *)self contact];
    char v8 = [v7 hasBeenPersisted];

    if ((v8 & 1) == 0)
    {
      char v9 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1909E3000, &v9->super, OS_LOG_TYPE_DEFAULT, "Cannot update an unsaved contact", (uint8_t *)&v17, 2u);
      }
      char v14 = 0;
      goto LABEL_16;
    }
    char v9 = objc_alloc_init(CNSaveRequest);
    [(CNSaveRequest *)v9 updateContact:v6];
    BOOL v10 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      char v11 = [(CNSharedProfileStateOracle *)self contact];
      unint64_t v12 = [v11 identifier];
      int v17 = 138543362;
      char v18 = v12;
      _os_log_impl(&dword_1909E3000, v10, OS_LOG_TYPE_DEFAULT, "Saving contact with identifier %{public}@", (uint8_t *)&v17, 0xCu);
    }
    BOOL v13 = [(CNSharedProfileStateOracle *)self contactStore];
    char v14 = [v13 executeSaveRequest:v9 error:a4];

    if (v14)
    {
      BOOL v15 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1909E3000, v15, OS_LOG_TYPE_DEFAULT, "Updated oracle contact and nicknames following a contact save", (uint8_t *)&v17, 2u);
      }
    }
    else
    {
      if (!a4)
      {
LABEL_16:

        goto LABEL_17;
      }
      BOOL v15 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[CNSharedProfileStateOracle saveUpdatedContact:error:](a4);
      }
    }

    goto LABEL_16;
  }
  char v14 = 0;
LABEL_17:

  return v14;
}

- (void)updateOracleContactAndNicknamesWithUpdatedContact:(id)a3
{
  id v11 = a3;
  if ([(id)objc_opt_class() isFeatureEnabled])
  {
    [(CNSharedProfileStateOracle *)self setContact:v11];
    unint64_t v4 = [(CNSharedProfileStateOracle *)self nicknameProvider];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(CNSharedProfileStateOracle *)self nicknameProvider];
      int v7 = [v6 allNicknamesForContact:v11];

      char v8 = [v7 objectForKey:@"pendingNickname"];
      [(CNSharedProfileStateOracle *)self setPendingNickname:v8];

      char v9 = [v7 objectForKey:@"currentNickname"];
      [(CNSharedProfileStateOracle *)self setCurrentNickname:v9];

      BOOL v10 = [v7 objectForKey:@"archivedNickname"];
      [(CNSharedProfileStateOracle *)self setArchivedNickname:v10];
    }
  }
}

+ (id)descriptionForActionType:(unint64_t)a3
{
  if (descriptionForActionType__cn_once_token_61 != -1) {
    dispatch_once(&descriptionForActionType__cn_once_token_61, &__block_literal_global_93);
  }
  unint64_t v4 = NSNumber;
  id v5 = (id)descriptionForActionType__cn_once_object_61;
  id v6 = [v4 numberWithUnsignedInteger:a3];
  int v7 = [v5 objectForKeyedSubscript:v6];

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))()) {
    char v8 = v7;
  }
  else {
    char v8 = @"UnknownAction";
  }

  return v8;
}

void __55__CNSharedProfileStateOracle_descriptionForActionType___block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v3[0] = &unk_1EE089170;
  v3[1] = &unk_1EE089140;
  v4[0] = @"None";
  v4[1] = @"RevertToPrevious";
  v3[2] = &unk_1EE089158;
  v3[3] = &unk_1EE089128;
  v4[2] = @"RevertToCustom";
  v4[3] = @"UpdateToLatest";
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  uint64_t v1 = [v0 copy];
  unint64_t v2 = (void *)descriptionForActionType__cn_once_object_61;
  descriptionForActionType__cn_once_object_61 = v1;
}

+ (id)descriptionForUpdateState:(unint64_t)a3
{
  if (descriptionForUpdateState__cn_once_token_62 != -1) {
    dispatch_once(&descriptionForUpdateState__cn_once_token_62, &__block_literal_global_114);
  }
  unint64_t v4 = NSNumber;
  id v5 = (id)descriptionForUpdateState__cn_once_object_62;
  id v6 = [v4 numberWithUnsignedInteger:a3];
  int v7 = [v5 objectForKeyedSubscript:v6];

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))()) {
    char v8 = v7;
  }
  else {
    char v8 = @"UnknownState";
  }

  return v8;
}

void __56__CNSharedProfileStateOracle_descriptionForUpdateState___block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v3[0] = &unk_1EE089170;
  v3[1] = &unk_1EE089140;
  v4[0] = @"Undetermined";
  v4[1] = @"ExplicitAutoUpdate";
  v3[2] = &unk_1EE089158;
  v3[3] = &unk_1EE089128;
  v4[2] = @"AlwaysAsk";
  v4[3] = @"ImplicitAutoUpdate";
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:4];
  uint64_t v1 = [v0 copy];
  unint64_t v2 = (void *)descriptionForUpdateState__cn_once_object_62;
  descriptionForUpdateState__cn_once_object_62 = v1;
}

+ (BOOL)shouldBypassPersistenceCheck
{
  return 0;
}

+ (BOOL)shouldAutoUpdateUndeterminedWithPhoto
{
  return [(id)objc_opt_class() globalSharedProfileUpdateState] == 1;
}

+ (unint64_t)globalSharedProfileUpdateState
{
  return 1;
}

- (BOOL)didPendingNicknameChangePhotoOrWallpaper
{
  int v3 = [(CNSharedProfileStateOracle *)self pendingNickname];

  if (!v3) {
    return 0;
  }
  unint64_t v4 = [(CNSharedProfileStateOracle *)self pendingNickname];
  id v5 = [(CNSharedProfileStateOracle *)self currentNickname];
  BOOL v6 = [(CNSharedProfileStateOracle *)self didPhotoOrWallpaperChangeFrom:v4 to:v5];

  return v6;
}

- (BOOL)didPhotoOrWallpaperChangeFrom:(id)a3 to:(id)a4
{
  return [a3 isEqualToNickname:a4 options:34];
}

- (BOOL)isRevertBannerExpired
{
  int v3 = [MEMORY[0x1E4F1C9C8] now];
  unint64_t v4 = [(CNSharedProfileStateOracle *)self archivedNickname];
  id v5 = [v4 archivedDate];
  [v3 timeIntervalSinceDate:v5];
  double v7 = v6;
  [(CNSharedProfileStateOracle *)self revertBannerMaxDisplayInterval];
  LOBYTE(self) = v7 > v8;

  return (char)self;
}

- (double)revertBannerMaxDisplayInterval
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:@"CNSharedProfileRevertBannerDisplayIntervalOverride"];
  double v4 = v3;

  if (v4 <= 0.0) {
    return 86400.0;
  }
  id v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    double v8 = v4;
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_DEFAULT, "Using override revert banner display interval: %.2f", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (BOOL)isRevertToPreviousExpired
{
  double v3 = [MEMORY[0x1E4F1C9C8] now];
  double v4 = [(CNSharedProfileStateOracle *)self archivedNickname];
  id v5 = [v4 archivedDate];
  [v3 timeIntervalSinceDate:v5];
  double v7 = v6;
  [(CNSharedProfileStateOracle *)self revertToPreviousMaxDisplayInterval];
  LOBYTE(self) = v7 > v8;

  return (char)self;
}

- (double)revertToPreviousMaxDisplayInterval
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:@"CNSharedProfilePreviousPhotoDisplayIntervalOverride"];
  double v4 = v3;

  if (v4 <= 0.0) {
    return 691200.0;
  }
  id v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    double v8 = v4;
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_DEFAULT, "Using override Revert to Previous display interval: %.2f", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (BOOL)currentNicknameHasValidVisualIdentityData
{
  double v3 = objc_opt_class();
  double v4 = [(CNSharedProfileStateOracle *)self currentNickname];
  LOBYTE(v3) = [v3 nicknameHasValidVisualIdentityData:v4];

  return (char)v3;
}

- (BOOL)pendingNicknameHasValidVisualIdentityData
{
  double v3 = objc_opt_class();
  double v4 = [(CNSharedProfileStateOracle *)self pendingNickname];
  LOBYTE(v3) = [v3 nicknameHasValidVisualIdentityData:v4];

  return (char)v3;
}

+ (BOOL)nicknameHasValidVisualIdentityData:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (v3)
  {
    id v5 = [v3 avatar];

    double v6 = (uint64_t *)MEMORY[0x1E4F5A268];
    if (!v5) {
      goto LABEL_7;
    }
    uint64_t v7 = *MEMORY[0x1E4F5A268];
    double v8 = [v4 avatar];
    uint64_t v9 = [v8 imageData];
    LODWORD(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v9);

    if (v7)
    {
      BOOL v10 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[CNSharedProfileStateOracle nicknameHasValidVisualIdentityData:]();
      }

      char v11 = 1;
    }
    else
    {
LABEL_7:
      char v11 = 0;
    }
    unint64_t v12 = [v4 wallpaper];

    if (!v12) {
      goto LABEL_13;
    }
    uint64_t v13 = *v6;
    char v14 = [v4 wallpaper];
    BOOL v15 = [v14 wallpaperData];
    LODWORD(v13) = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v15);

    if (v13)
    {
      uint64_t v16 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[CNSharedProfileStateOracle nicknameHasValidVisualIdentityData:]();
      }

      char v17 = 1;
    }
    else
    {
LABEL_13:
      char v17 = 0;
    }
    char v18 = v11 & v17 ^ 1;
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (id)lastRecentContactImage
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(CNSharedProfileStateOracle *)self recentContactImageStore];
  double v4 = [(CNSharedProfileStateOracle *)self contact];
  id v5 = [v4 identifier];
  v11[0] = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v7 = +[CNContactImageFetchRequest recentImagesRequestForContactIdenfitiers:v6];

  double v8 = [v3 performFetchRequest:v7 error:0];
  uint64_t v9 = [v8 firstObject];

  return v9;
}

- (id)lastRecentPoster
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(CNSharedProfileStateOracle *)self recentPosterStore];
  double v4 = [(CNSharedProfileStateOracle *)self contact];
  id v5 = [v4 identifier];
  v11[0] = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v7 = +[CNContactPosterFetchRequest recentPostersRequestForContactIdenfitiers:v6];

  double v8 = [v3 performFetchRequest:v7 error:0];
  uint64_t v9 = [v8 firstObject];

  return v9;
}

+ (BOOL)shouldSaveCurrentPoster:(id)a3 toRecentsForContact:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  int v7 = [v6 contentIsSensitive];
  uint64_t v8 = *MEMORY[0x1E4F5A268];
  uint64_t v9 = [v6 posterData];

  int v10 = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  char v11 = [v5 sensitiveContentConfiguration];

  uint64_t v12 = [v11 override];
  if (v12 == 1) {
    int v13 = 1;
  }
  else {
    int v13 = (v7 | v10) ^ 1;
  }
  char v14 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v16[0] = 67109888;
    v16[1] = v13;
    __int16 v17 = 1024;
    int v18 = v7;
    __int16 v19 = 1024;
    int v20 = v7;
    __int16 v21 = 1024;
    BOOL v22 = v12 == 1;
    _os_log_impl(&dword_1909E3000, v14, OS_LOG_TYPE_INFO, "Poster should be saved to recents: %d | sensitive: %d, emptyData: %d, override: %d", (uint8_t *)v16, 0x1Au);
  }

  return v13;
}

- (void)saveCurrentAvatarPosterPairToRecents
{
  id v14 = [MEMORY[0x1E4F1C9C8] now];
  id v3 = [(CNSharedProfileStateOracle *)self contact];
  double v4 = [v3 imageData];

  if (v4)
  {
    id v5 = [CNContactImage alloc];
    id v6 = [(CNSharedProfileStateOracle *)self contact];
    [v6 cropRect];
    uint64_t v7 = -[CNContactImage initWithImageData:cropRect:lastUsedDate:](v5, "initWithImageData:cropRect:lastUsedDate:", v4, v14);
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [(CNSharedProfileStateOracle *)self contact];
  uint64_t v9 = [v8 wallpaper];
  int v10 = [v9 posterArchiveData];

  if (v10) {
    char v11 = [[CNContactPoster alloc] initWithPosterData:v10 lastUsedDate:v14];
  }
  else {
    char v11 = 0;
  }
  uint64_t v12 = [(CNSharedProfileStateOracle *)self contact];
  int v13 = [v12 wallpaper];
  -[CNContactPoster setContentIsSensitive:](v11, "setContentIsSensitive:", [v13 contentIsSensitive]);

  if ((unint64_t)v11 | v7)
  {
    if (v7) {
      [(CNSharedProfileStateOracle *)self saveContactImage:v7 withPairedPoster:v11];
    }
    else {
      [(CNSharedProfileStateOracle *)self saveContactPoster:v11];
    }
  }
}

- (void)saveContactImage:(id)a3
{
}

- (void)saveContactImage:(id)a3 withPairedPoster:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    [v6 setPairedPoster:v7];
  }
  else
  {
    uint64_t v8 = [v6 pairedPoster];
    [v6 setPairedPoster:v8];
  }
  uint64_t v9 = [(CNSharedProfileStateOracle *)self recentContactImageStore];
  int v10 = [(CNSharedProfileStateOracle *)self contact];
  uint64_t v11 = [v10 identifier];
  uint64_t v12 = +[CNContactImageSaveRequest saveRequestToCreateImage:v6 forContactIdentifier:v11];

  id v15 = 0;
  LOBYTE(v11) = [v9 performSaveRequest:v12 error:&v15];
  id v13 = v15;
  if ((v11 & 1) == 0)
  {
    id v14 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CNSharedProfileStateOracle saveContactImage:withPairedPoster:](v13);
    }
  }
}

- (void)saveContactPoster:(id)a3
{
  id v4 = a3;
  id v5 = [(CNSharedProfileStateOracle *)self recentPosterStore];
  uint64_t v6 = [(CNSharedProfileStateOracle *)self contact];
  id v7 = [(id)v6 identifier];
  uint64_t v8 = +[CNContactPosterSaveRequest saveRequestToCreatePoster:v4 forContactIdentifier:v7];

  id v11 = 0;
  LOBYTE(v6) = [v5 performSaveRequest:v8 error:&v11];
  id v9 = v11;
  if ((v6 & 1) == 0)
  {
    int v10 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CNSharedProfileStateOracle saveContactPoster:](v9);
    }
  }
}

- (IMNickname)archivedNickname
{
  return self->_archivedNickname;
}

- (void)setArchivedNickname:(id)a3
{
}

- (IMNickname)currentNickname
{
  return self->_currentNickname;
}

- (void)setCurrentNickname:(id)a3
{
}

- (IMNickname)pendingNickname
{
  return self->_pendingNickname;
}

- (void)setPendingNickname:(id)a3
{
}

- (BOOL)shouldContactBeRefetched
{
  return self->_shouldContactBeRefetched;
}

- (void)setShouldContactBeRefetched:(BOOL)a3
{
  self->_shouldContactBeRefetched = a3;
}

- (CNUnfairLock)contactLock
{
  return self->_contactLock;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (void)setRecentContactImageStore:(id)a3
{
}

- (void)setRecentPosterStore:(id)a3
{
}

- (IMNicknameProvider)nicknameProvider
{
  return self->_nicknameProvider;
}

- (void)setNicknameProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nicknameProvider, 0);
  objc_storeStrong((id *)&self->_recentPosterStore, 0);
  objc_storeStrong((id *)&self->_recentContactImageStore, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contactLock, 0);
  objc_storeStrong((id *)&self->_pendingNickname, 0);
  objc_storeStrong((id *)&self->_currentNickname, 0);
  objc_storeStrong((id *)&self->_archivedNickname, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

+ (void)refetchedContactIfNeededWithRequiredKeys:contactStore:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1909E3000, v0, OS_LOG_TYPE_FAULT, "Contact store cannot be nil for shared profile state oracle", v1, 2u);
}

+ (void)refetchedContactIfNeededWithRequiredKeys:(void *)a1 contactStore:.cold.2(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1909E3000, v2, v3, "Failed to find matching contact with error: %@", v4, v5, v6, v7, v8);
}

+ (void)refetchedContactIfNeededWithRequiredKeys:contactStore:.cold.3()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1909E3000, v1, OS_LOG_TYPE_DEBUG, "Fetched contact %@ matching %@", v2, 0x16u);
}

+ (void)refetchedContactIfNeededWithRequiredKeys:contactStore:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1909E3000, v0, v1, "Unable to refetch contact, not authorized", v2, v3, v4, v5, v6);
}

- (void)targetProfileForActionType:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 contact];
  uint64_t v2 = [v1 identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1909E3000, v3, v4, "Contact (%{public}@) has an archived and current nickname containing the same photo and wallpaper, this will result in an action that shows no change", v5, v6, v7, v8, v9);
}

- (void)targetProfileForActionType:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 contact];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1909E3000, v2, v3, "No recent avatar or poster available for contact %@", v4, v5, v6, v7, v8);
}

- (void)updateContactForActionType:(uint64_t)a1 error:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [(id)objc_opt_class() descriptionForActionType:a2];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1909E3000, v3, v4, "Error updating contact for actionType %@", v5, v6, v7, v8, v9);
}

- (void)updateContactForAutoUpdateWithError:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1909E3000, v0, v1, "Error updating contact for auto-update", v2, v3, v4, v5, v6);
}

- (void)updateContactAndNicknamesForAutoUpdateWithError:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 contact];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1909E3000, v2, v3, "Attempting to auto-update a contact %@ without auto-update enabled", v4, v5, v6, v7, v8);
}

- (void)updateContactForDeclinedActionType:error:.cold.1()
{
  uint64_t v0 = [(id)objc_opt_class() descriptionForActionType:2];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1909E3000, v1, v2, "Error updating contact for declined actionType %@", v3, v4, v5, v6, v7);
}

- (void)saveUpdatedContact:(id *)a1 error:.cold.1(id *a1)
{
  uint64_t v1 = [*a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1909E3000, v2, v3, "Error saving contact: %@", v4, v5, v6, v7, v8);
}

+ (void)nicknameHasValidVisualIdentityData:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1909E3000, v0, v1, "Nickname contains a wallpaper object containing no data", v2, v3, v4, v5, v6);
}

+ (void)nicknameHasValidVisualIdentityData:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1909E3000, v0, v1, "Nickname contains an avatar image object containing no data", v2, v3, v4, v5, v6);
}

- (void)saveContactImage:(void *)a1 withPairedPoster:.cold.1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1909E3000, v2, v3, "Failed to save contact image to recents, %@", v4, v5, v6, v7, v8);
}

- (void)saveContactPoster:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1909E3000, v2, v3, "Failed to save contact poster to recents, %@", v4, v5, v6, v7, v8);
}

@end