@interface CNContactStoreContactsFetchResultSharedAvatarDecorator
+ (BOOL)enableSharedPhoto;
+ (CNKeyDescriptor)descriptorForRequiredKeys;
+ (id)allNicknamesForContact:(id)a3;
+ (id)log;
- (BOOL)doesKeysToFetchContainRequiredKeys;
- (BOOL)unifyContactsFromMainStore;
- (CNContactStoreContactsFetchResultSharedAvatarDecorator)initWithContacts:(id)a3 keysToFetch:(id)a4 unifyContactsFromMainStore:(BOOL)a5;
- (CNContactStoreContactsFetchResultSharedAvatarDecorator)initWithContactsFetchResult:(id)a3 keysToFetch:(id)a4 unifyContactsFromMainStore:(BOOL)a5;
- (NSArray)decoratedValue;
- (NSArray)keysToFetch;
- (NSArray)value;
- (id)decoratedContacts:(id)a3;
- (id)nicknameForContact:(id)a3;
- (id)sharedWallpaperForContact:(id)a3 withNickname:(id)a4;
- (id)sharedWatchWallpaperImageDataForContact:(id)a3 withNickname:(id)a4;
- (void)setDecoratedValue:(id)a3;
- (void)setKeysToFetch:(id)a3;
- (void)setUnifyContactsFromMainStore:(BOOL)a3;
- (void)setValue:(id)a3;
@end

@implementation CNContactStoreContactsFetchResultSharedAvatarDecorator

- (BOOL)doesKeysToFetchContainRequiredKeys
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(CNMutableContactKeyVector);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v4 = [(CNContactStoreContactsFetchResultSharedAvatarDecorator *)self keysToFetch];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "_cn_requiredKeys");
        [(CNMutableContactKeyVector *)v3 unionKeyVector:v10];

        v11 = objc_msgSend(v9, "_cn_optionalKeys");
        [(CNMutableContactKeyVector *)v3 unionKeyVector:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }

  if ([(CNContactKeyVector *)v3 containsKey:@"wallpaper"])
  {
    v12 = [(id)objc_opt_class() descriptorForRequiredKeys];
    v13 = objc_msgSend(v12, "_cn_requiredKeys");

    v22 = @"wallpaper";
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    v15 = [v13 keyVectorByRemovingKeys:v14];

    char v16 = [v15 isSubsetOfKeyVector:v3];
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (NSArray)keysToFetch
{
  return self->_keysToFetch;
}

+ (CNKeyDescriptor)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_0 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_0, &__block_literal_global_112);
  }
  v2 = (void *)descriptorForRequiredKeys_cn_once_object_0;

  return (CNKeyDescriptor *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysToFetch, 0);
  objc_storeStrong((id *)&self->_decoratedValue, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

void __83__CNContactStoreContactsFetchResultSharedAvatarDecorator_descriptorForRequiredKeys__block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"sharedPhotoDisplayPreference";
  v4[1] = @"wallpaper";
  v4[2] = @"phoneNumbers";
  v4[3] = @"emailAddresses";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  v1 = [NSString stringWithUTF8String:"+[CNContactStoreContactsFetchResultSharedAvatarDecorator descriptorForRequiredKeys]_block_invoke"];
  uint64_t v2 = +[CNContact descriptorWithKeyDescriptors:v0 description:v1];
  v3 = (void *)descriptorForRequiredKeys_cn_once_object_0;
  descriptorForRequiredKeys_cn_once_object_0 = v2;
}

+ (id)allNicknamesForContact:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  v4 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  uint64_t v5 = [v4 nicknameProvider];
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  v8 = [v7 imNicknameProvider];
  v9 = [v8 allNicknamesForContact:v3];

  return v9;
}

- (id)nicknameForContact:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [(id)objc_opt_class() allNicknamesForContact:v3];
  uint64_t v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v3;
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_INFO, "Fetching all nicknames %@ for %@", buf, 0x16u);
  }

  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v6 = (void *)getIMNicknameCurrentSymbolLoc_ptr;
  uint64_t v12 = getIMNicknameCurrentSymbolLoc_ptr;
  if (!getIMNicknameCurrentSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getIMNicknameCurrentSymbolLoc_block_invoke;
    v14 = &unk_1E56B45C0;
    v15 = &v9;
    __getIMNicknameCurrentSymbolLoc_block_invoke((uint64_t)buf);
    uint64_t v6 = (void *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v6)
  {
    -[CNGeminiManager channelIdentifierForMostRecentSMSFromPhoneNumbers:fromChannelIdentifiers:]();
    __break(1u);
  }
  id v7 = objc_msgSend(v4, "objectForKey:", *v6, v9);

  return v7;
}

id __76__CNContactStoreContactsFetchResultSharedAvatarDecorator_decoratedContacts___block_invoke(uint64_t a1, void *a2)
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (+[CNSharedProfileStateOracle contactIsInAutoUpdateState:v3])
  {
    v4 = [*(id *)(a1 + 32) nicknameForContact:v3];
    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 32) sharedWatchWallpaperImageDataForContact:v3 withNickname:v4];
      uint64_t v6 = [*(id *)(a1 + 32) sharedWallpaperForContact:v3 withNickname:v4];
      uint64_t v7 = *MEMORY[0x1E4F5A268];
      if ((*(unsigned int (**)(void, void *))(*MEMORY[0x1E4F5A268] + 16))(*MEMORY[0x1E4F5A268], v5)
        && ([(CNWallpaper *)v6 posterArchiveData],
            v8 = objc_claimAutoreleasedReturnValue(),
            int v9 = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8),
            v8,
            v9))
      {
        id v10 = v3;
      }
      else
      {
        uint64_t v11 = objc_alloc_init(CNMutableContact);
        [(CNMutableContact *)v11 setImplicitAugmentation:1];
        uint64_t v12 = [v4 wallpaper];
        v13 = [v12 metadata];

        if (v13)
        {
          if (!v6) {
            uint64_t v6 = objc_alloc_init(CNWallpaper);
          }
          uint64_t v14 = [(CNWallpaper *)v6 wallpaperIncludingIMWallpaperMetadata:v13];

          uint64_t v6 = (CNWallpaper *)v14;
        }
        [(CNMutableContact *)v11 setWatchWallpaperImageData:v5];
        [(CNMutableContact *)v11 setWallpaper:v6];
        [(CNMutableContact *)v11 setIsUsingSharedPhoto:1];

        v15 = [v3 keyVector];
        [(CNMutableContact *)v11 setAvailableKeyDescriptor:v15];

        if ([v3 isUnified])
        {
          uint64_t v16 = [v3 linkedContacts];
          v17 = [(CNMutableContact *)v11 freeze];
          long long v18 = [v16 arrayByAddingObject:v17];
        }
        else
        {
          v27[0] = v3;
          uint64_t v16 = [(CNMutableContact *)v11 freeze];
          v27[1] = v16;
          long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
        }

        long long v20 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          long long v21 = [v3 identifier];
          int v23 = 138412546;
          id v24 = v4;
          __int16 v25 = 2112;
          v26 = v21;
          _os_log_impl(&dword_1909E3000, v20, OS_LOG_TYPE_DEFAULT, "Applying nickname %@ to contact <%@>", (uint8_t *)&v23, 0x16u);
        }
        +[CN contactUnifyingContacts:includingMainStoreContacts:allowMutableContactFreeze:](CN, "contactUnifyingContacts:includingMainStoreContacts:allowMutableContactFreeze:", v18, [*(id *)(a1 + 32) unifyContactsFromMainStore], 1);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      long long v19 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138412290;
        id v24 = v3;
        _os_log_impl(&dword_1909E3000, v19, OS_LOG_TYPE_DEFAULT, "No nickname found for auto-updating contact %@", (uint8_t *)&v23, 0xCu);
      }

      id v10 = v3;
    }
  }
  else
  {
    id v10 = v3;
  }

  return v10;
}

+ (id)log
{
  if (log_cn_once_token_1_0 != -1) {
    dispatch_once(&log_cn_once_token_1_0, &__block_literal_global_38_2);
  }
  uint64_t v2 = (void *)log_cn_once_object_1_0;

  return v2;
}

- (CNContactStoreContactsFetchResultSharedAvatarDecorator)initWithContacts:(id)a3 keysToFetch:(id)a4 unifyContactsFromMainStore:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNContactStoreContactsFetchResultSharedAvatarDecorator;
  id v10 = [(CNContactStoreContactsFetchResultSharedAvatarDecorator *)&v15 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    value = v10->_value;
    v10->_value = (NSArray *)v11;

    objc_storeStrong((id *)&v10->_keysToFetch, a4);
    v10->_unifyContactsFromMainStore = a5;
    v13 = v10;
  }

  return v10;
}

- (NSArray)decoratedValue
{
  decoratedValue = self->_decoratedValue;
  if (!decoratedValue)
  {
    v4 = [(CNContactStoreContactsFetchResultSharedAvatarDecorator *)self value];
    uint64_t v5 = [(CNContactStoreContactsFetchResultSharedAvatarDecorator *)self decoratedContacts:v4];
    uint64_t v6 = self->_decoratedValue;
    self->_decoratedValue = v5;

    decoratedValue = self->_decoratedValue;
  }
  uint64_t v7 = decoratedValue;

  return v7;
}

- (NSArray)value
{
  return self->_value;
}

- (id)decoratedContacts:(id)a3
{
  id v4 = a3;
  if (([(id)objc_opt_class() enableSharedPhoto] & 1) != 0
    && [(CNContactStoreContactsFetchResultSharedAvatarDecorator *)self doesKeysToFetchContainRequiredKeys])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __76__CNContactStoreContactsFetchResultSharedAvatarDecorator_decoratedContacts___block_invoke;
    v8[3] = &unk_1E56B48C0;
    v8[4] = self;
    objc_msgSend(v4, "_cn_map:", v8);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = v4;
  }
  uint64_t v6 = v5;

  return v6;
}

+ (BOOL)enableSharedPhoto
{
  uint64_t v2 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v3 = [v2 featureFlags];
  char v4 = [v3 isFeatureEnabled:13];

  return v4;
}

uint64_t __61__CNContactStoreContactsFetchResultSharedAvatarDecorator_log__block_invoke()
{
  log_cn_once_object_1_0 = (uint64_t)os_log_create("com.apple.contacts", "avatar-decorator");

  return MEMORY[0x1F41817F8]();
}

- (CNContactStoreContactsFetchResultSharedAvatarDecorator)initWithContactsFetchResult:(id)a3 keysToFetch:(id)a4 unifyContactsFromMainStore:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [a3 value];
  id v10 = [(CNContactStoreContactsFetchResultSharedAvatarDecorator *)self initWithContacts:v9 keysToFetch:v8 unifyContactsFromMainStore:v5];

  return v10;
}

- (void)setValue:(id)a3
{
  BOOL v5 = (NSArray *)a3;
  p_value = &self->_value;
  if (self->_value != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_value, a3);
    decoratedValue = self->_decoratedValue;
    self->_decoratedValue = 0;

    BOOL v5 = v8;
  }

  MEMORY[0x1F41817F8](p_value, v5);
}

- (id)sharedWallpaperForContact:(id)a3 withNickname:(id)a4
{
  id v5 = a4;
  if (+[CNSharedProfileStateOracle contactIsInAutoUpdateState:a3])
  {
    uint64_t v6 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    uint64_t v7 = [v6 nicknameProvider];
    id v8 = [v7 sharedWallpaperForNickname:v5];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)sharedWatchWallpaperImageDataForContact:(id)a3 withNickname:(id)a4
{
  id v5 = a4;
  if (+[CNSharedProfileStateOracle contactIsInAutoUpdateState:a3])
  {
    uint64_t v6 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    uint64_t v7 = [v6 nicknameProvider];
    id v8 = [v7 sharedWatchWallpaperImageDataForNickname:v5];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)setDecoratedValue:(id)a3
{
}

- (void)setKeysToFetch:(id)a3
{
}

- (BOOL)unifyContactsFromMainStore
{
  return self->_unifyContactsFromMainStore;
}

- (void)setUnifyContactsFromMainStore:(BOOL)a3
{
  self->_unifyContactsFromMainStore = a3;
}

@end