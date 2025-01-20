@interface CNPhotoPickerAnimojiProvider
+ (id)providerItemForAvatarRecord:(id)a3;
+ (id)providerItemForAvatarRecord:(id)a3 imageProvider:(id)a4 renderingQueue:(id)a5 callbackQueue:(id)a6;
- (AVTAvatarStore)avatarStore;
- (BOOL)canCreateMemoji;
- (CNPhotoPickerAnimojiProvider)initWithVisualIdentity:(id)a3;
- (CNPhotoPickerAnimojiProvider)initWithVisualIdentity:(id)a3 avatarStore:(id)a4;
- (NSString)identifier;
- (id)loadItemsForSize:(CGSize)a3 scale:(double)a4 RTL:(BOOL)a5 renderingQueue:(id)a6 callbackQueue:(id)a7 itemDelegate:(id)a8;
- (void)setIdentifier:(id)a3;
@end

@implementation CNPhotoPickerAnimojiProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarStore, 0);

  objc_storeStrong((id *)&self->identifier, 0);
}

- (AVTAvatarStore)avatarStore
{
  return self->_avatarStore;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->identifier;
}

- (BOOL)canCreateMemoji
{
  v2 = [(CNPhotoPickerAnimojiProvider *)self avatarStore];
  char v3 = [v2 canCreateAvatar];

  return v3;
}

- (id)loadItemsForSize:(CGSize)a3 scale:(double)a4 RTL:(BOOL)a5 renderingQueue:(id)a6 callbackQueue:(id)a7 itemDelegate:(id)a8
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v34 = a6;
  id v11 = a7;
  id v12 = a8;
  uint64_t v13 = [getAVTAvatarFetchRequestClass() requestForPredefinedAvatars];
  v14 = [(CNPhotoPickerAnimojiProvider *)self avatarStore];
  id v40 = 0;
  v33 = (void *)v13;
  v15 = [v14 avatarsForFetchRequest:v13 error:&v40];
  id v16 = v40;

  if (+[CNPhotoPickerCapabilities allowsAvatarStoreAccess])
  {
    v17 = [getAVTAvatarFetchRequestClass() requestForCustomAvatars];
    v18 = [(CNPhotoPickerAnimojiProvider *)self avatarStore];
    id v39 = v16;
    v19 = [v18 avatarsForFetchRequest:v17 error:&v39];
    id v20 = v39;

    v21 = objc_msgSend(v19, "_cn_reversed");

    uint64_t v22 = [v21 arrayByAddingObjectsFromArray:v15];

    v15 = (void *)v22;
    v32 = v20;
  }
  else
  {
    v32 = v16;
  }
  v23 = [MEMORY[0x1E4F1CA48] array];
  id v24 = objc_alloc_init((Class)getAVTAvatarRecordImageProviderClass());
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v25 = v15;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v36 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = [(id)objc_opt_class() providerItemForAvatarRecord:*(void *)(*((void *)&v35 + 1) + 8 * i) imageProvider:v24 renderingQueue:v34 callbackQueue:v11];
        [v30 setDelegate:v12];
        [v23 addObject:v30];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v27);
  }

  return v23;
}

- (CNPhotoPickerAnimojiProvider)initWithVisualIdentity:(id)a3 avatarStore:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CNPhotoPickerAnimojiProvider;
  v7 = [(CNPhotoPickerAnimojiProvider *)&v14 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_avatarStore, a4);
    v9 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v10 = [v9 UUIDString];
    identifier = v8->identifier;
    v8->identifier = (NSString *)v10;

    id v12 = v8;
  }

  return v8;
}

- (CNPhotoPickerAnimojiProvider)initWithVisualIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v5 = (void *)getAVTAvatarStoreClass_softClass_16041;
  uint64_t v14 = getAVTAvatarStoreClass_softClass_16041;
  if (!getAVTAvatarStoreClass_softClass_16041)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getAVTAvatarStoreClass_block_invoke_16042;
    v10[3] = &unk_1E549AD00;
    v10[4] = &v11;
    __getAVTAvatarStoreClass_block_invoke_16042((uint64_t)v10);
    v5 = (void *)v12[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v11, 8);
  v7 = (void *)[[v6 alloc] initWithDomainIdentifier:@"CNAvatarStoreDomainContacts"];
  v8 = [(CNPhotoPickerAnimojiProvider *)self initWithVisualIdentity:v4 avatarStore:v7];

  return v8;
}

+ (id)providerItemForAvatarRecord:(id)a3 imageProvider:(id)a4 renderingQueue:(id)a5 callbackQueue:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2050000000;
  uint64_t v13 = (void *)getAVTRenderingScopeClass_softClass;
  uint64_t v22 = getAVTRenderingScopeClass_softClass;
  if (!getAVTRenderingScopeClass_softClass)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __getAVTRenderingScopeClass_block_invoke;
    v18[3] = &unk_1E549AD00;
    v18[4] = &v19;
    __getAVTRenderingScopeClass_block_invoke((uint64_t)v18);
    uint64_t v13 = (void *)v20[3];
  }
  id v14 = v13;
  _Block_object_dispose(&v19, 8);
  v15 = [v14 gridThumbnailScope];
  id v16 = [[CNPhotoPickerAnimojiProviderItem alloc] initWithAvatarRecord:v9 imageProvider:v10 renderingScope:v15 renderingQueue:v11 callbackQueue:v12];

  return v16;
}

+ (id)providerItemForAvatarRecord:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)getAVTAvatarRecordImageProviderClass());
  id v6 = +[CNUIContactsEnvironment currentEnvironment];
  v7 = [v6 defaultSchedulerProvider];
  v8 = (void *)[v7 newSerialSchedulerWithName:@"com.apple.ContactsUI.PhotoPickerAnimojiProvider.renderingQueue"];
  id v9 = [v7 mainThreadScheduler];
  id v10 = [a1 providerItemForAvatarRecord:v4 imageProvider:v5 renderingQueue:v8 callbackQueue:v9];

  return v10;
}

@end