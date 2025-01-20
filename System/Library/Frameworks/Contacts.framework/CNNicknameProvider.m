@interface CNNicknameProvider
+ (CNNicknameProvider)defaultProvider;
+ (id)log;
+ (id)makeDefaultProvider;
- (BOOL)isNicknameSharingEnabled;
- (CNNicknameProvider)init;
- (CNNicknameProvider)initWithIMNicknameProvider:(id)a3;
- (IMMeCardSharingStateController)sharingStateController;
- (IMNicknameProvider)imNicknameProvider;
- (id)avatarImageFileURLForContact:(id)a3;
- (id)avatarImageFileURLForNickname:(id)a3;
- (id)contactFromNickname:(id)a3;
- (id)nicknameAsContactForContact:(id)a3;
- (id)nicknameForContact:(id)a3;
- (id)sharedAvatarImageDataForContact:(id)a3;
- (id)sharedWallpaperForNickname:(id)a3;
- (id)sharedWatchWallpaperImageDataForNickname:(id)a3;
- (id)wallpaperFileURLForContact:(id)a3;
- (id)wallpaperFileURLForNickname:(id)a3;
- (id)watchWallpaperImageDataFileURLForContact:(id)a3;
- (id)watchWallpaperImageDataFileURLForNickname:(id)a3;
- (unint64_t)sharingAudience;
- (void)fetchPersonalNicknameAsContactWithCompletion:(id)a3;
- (void)nicknameStoreDidChange:(id)a3;
- (void)setImNicknameProvider:(id)a3;
- (void)setPersonalNicknameWithContact:(id)a3;
- (void)setPersonalNicknameWithSharingResult:(id)a3;
- (void)setSharingAudience:(unint64_t)a3;
- (void)setSharingEnabled:(BOOL)a3;
- (void)setSharingStateController:(id)a3;
@end

@implementation CNNicknameProvider

uint64_t __37__CNNicknameProvider_defaultProvider__block_invoke(uint64_t a1)
{
  defaultProvider_cn_once_object_1 = [*(id *)(a1 + 32) makeDefaultProvider];

  return MEMORY[0x1F41817F8]();
}

+ (id)makeDefaultProvider
{
  id v3 = objc_alloc_init((Class)getIMNicknameProviderClass());
  v4 = (void *)[objc_alloc((Class)a1) initWithIMNicknameProvider:v3];
  v5 = [v4 imNicknameProvider];
  [v5 setNicknameListener:v4];

  return v4;
}

- (CNNicknameProvider)initWithIMNicknameProvider:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNNicknameProvider;
  v6 = [(CNNicknameProvider *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_imNicknameProvider, a3);
    uint64_t v8 = [getIMMeCardSharingStateControllerClass() sharedInstance];
    sharingStateController = v7->_sharingStateController;
    v7->_sharingStateController = (IMMeCardSharingStateController *)v8;

    v10 = v7;
  }

  return v7;
}

- (IMNicknameProvider)imNicknameProvider
{
  return self->_imNicknameProvider;
}

+ (CNNicknameProvider)defaultProvider
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CNNicknameProvider_defaultProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultProvider_cn_once_token_1 != -1) {
    dispatch_once(&defaultProvider_cn_once_token_1, block);
  }
  v2 = (void *)defaultProvider_cn_once_object_1;

  return (CNNicknameProvider *)v2;
}

+ (id)log
{
  if (log_cn_once_token_0_10 != -1) {
    dispatch_once(&log_cn_once_token_0_10, &__block_literal_global_104);
  }
  v2 = (void *)log_cn_once_object_0_10;

  return v2;
}

uint64_t __25__CNNicknameProvider_log__block_invoke()
{
  log_cn_once_object_0_10 = (uint64_t)os_log_create("com.apple.contacts", "CNNicknameProvider");

  return MEMORY[0x1F41817F8]();
}

- (CNNicknameProvider)init
{
  if (init_cn_once_token_2 != -1) {
    dispatch_once(&init_cn_once_token_2, &__block_literal_global_38_0);
  }
  uint64_t v3 = init_cn_once_object_2;

  return [(CNNicknameProvider *)self initWithIMNicknameProvider:v3];
}

uint64_t __26__CNNicknameProvider_init__block_invoke()
{
  init_cn_once_object_2 = (uint64_t)objc_alloc_init((Class)getIMNicknameProviderClass());

  return MEMORY[0x1F41817F8]();
}

- (void)fetchPersonalNicknameAsContactWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CNNicknameProvider *)self imNicknameProvider];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__CNNicknameProvider_fetchPersonalNicknameAsContactWithCompletion___block_invoke;
  v7[3] = &unk_1E56B8620;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 nicknameForCurrentUserWithCompletionHandler:v7];
}

void __67__CNNicknameProvider_fetchPersonalNicknameAsContactWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    id v5 = [*(id *)(a1 + 32) contactFromNickname:a2];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
  }
  else
  {
    uint64_t v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    v3(v4);
  }
}

- (void)setPersonalNicknameWithSharingResult:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNNicknameProvider *)self isNicknameSharingEnabled];
  id v6 = [(id)objc_opt_class() log];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_1909E3000, v6, OS_LOG_TYPE_DEFAULT, "Updating nickname with sharing result", (uint8_t *)v10, 2u);
    }

    uint64_t v11 = 0;
    objc_super v12 = &v11;
    uint64_t v13 = 0x2050000000;
    id v8 = (void *)getIMNicknameControllerClass_softClass;
    uint64_t v14 = getIMNicknameControllerClass_softClass;
    if (!getIMNicknameControllerClass_softClass)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __getIMNicknameControllerClass_block_invoke;
      v10[3] = &unk_1E56B45C0;
      v10[4] = &v11;
      __getIMNicknameControllerClass_block_invoke((uint64_t)v10);
      id v8 = (void *)v12[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v11, 8);
    id v6 = [v9 sharedInstance];
    [v6 updatePersonalNicknameIfNecessaryWithMeCardSharingResult:v4];
  }
  else if (v7)
  {
    LOWORD(v10[0]) = 0;
    _os_log_impl(&dword_1909E3000, v6, OS_LOG_TYPE_DEFAULT, "Not updating nickname with sharing result, sharing is disabled", (uint8_t *)v10, 2u);
  }
}

- (void)setSharingAudience:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    unint64_t v7 = a3;
    _os_log_impl(&dword_1909E3000, v4, OS_LOG_TYPE_DEFAULT, "Updating Sharing Audience: %lu", (uint8_t *)&v6, 0xCu);
  }

  BOOL v5 = [getIMMeCardSharingStateControllerClass() sharedInstance];
  [v5 setSharingAudience:a3];
}

- (void)setSharingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1909E3000, v4, OS_LOG_TYPE_DEFAULT, "Updating Sharing Enabled: %d", (uint8_t *)v6, 8u);
  }

  BOOL v5 = [getIMMeCardSharingStateControllerClass() sharedInstance];
  [v5 setSharingEnabled:v3];
}

- (void)setPersonalNicknameWithContact:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_DEFAULT, "Setting personal nickname with contact: %@", (uint8_t *)&v7, 0xCu);
  }

  int v6 = [(CNNicknameProvider *)self imNicknameProvider];
  [v6 setPersonalNicknameWithContact:v4];
}

- (id)nicknameForContact:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CNNicknameProvider *)self imNicknameProvider];
  int v6 = [v5 currentNicknameForContact:v4];

  return v6;
}

- (id)nicknameAsContactForContact:(id)a3
{
  id v4 = [(CNNicknameProvider *)self nicknameForContact:a3];
  if (v4)
  {
    BOOL v5 = [(CNNicknameProvider *)self contactFromNickname:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)contactFromNickname:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(CNMutableContact);
  int v6 = [v4 firstName];
  [(CNMutableContact *)v5 setGivenName:v6];

  int v7 = [v4 lastName];
  [(CNMutableContact *)v5 setFamilyName:v7];

  id v8 = [(CNNicknameProvider *)self avatarImageFileURLForNickname:v4];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    v10 = [v9 fileManager];
    uint64_t v11 = [v10 dataWithContentsOfURL:v8];
    objc_super v12 = [v11 value];

    [(CNMutableContact *)v5 setImageData:v12];
    [(CNMutableContact *)v5 setThumbnailImageData:v12];
  }
  uint64_t v13 = [(CNNicknameProvider *)self sharedWallpaperForNickname:v4];
  [(CNMutableContact *)v5 setWallpaper:v13];

  uint64_t v14 = [(CNNicknameProvider *)self sharedWatchWallpaperImageDataForNickname:v4];
  [(CNMutableContact *)v5 setWatchWallpaperImageData:v14];

  v15 = [(CNMutableContact *)v5 freeze];

  return v15;
}

- (id)avatarImageFileURLForNickname:(id)a3
{
  BOOL v3 = [a3 avatar];
  id v4 = [v3 imageFilePath];

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    BOOL v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)wallpaperFileURLForNickname:(id)a3
{
  BOOL v3 = [a3 wallpaper];
  id v4 = [v3 filePath];

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    BOOL v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)watchWallpaperImageDataFileURLForNickname:(id)a3
{
  BOOL v3 = [a3 wallpaper];
  id v4 = [v3 lowResFilePath];

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    BOOL v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)avatarImageFileURLForContact:(id)a3
{
  id v4 = [(CNNicknameProvider *)self nicknameForContact:a3];
  BOOL v5 = [(CNNicknameProvider *)self avatarImageFileURLForNickname:v4];

  return v5;
}

- (id)wallpaperFileURLForContact:(id)a3
{
  id v4 = [(CNNicknameProvider *)self nicknameForContact:a3];
  BOOL v5 = [(CNNicknameProvider *)self wallpaperFileURLForNickname:v4];

  return v5;
}

- (id)watchWallpaperImageDataFileURLForContact:(id)a3
{
  id v4 = [(CNNicknameProvider *)self nicknameForContact:a3];
  BOOL v5 = [(CNNicknameProvider *)self watchWallpaperImageDataFileURLForNickname:v4];

  return v5;
}

- (id)sharedAvatarImageDataForContact:(id)a3
{
  BOOL v3 = [(CNNicknameProvider *)self nicknameForContact:a3];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    BOOL v5 = [v4 nicknameProvider];
    int v6 = [v5 avatarImageFileURLForNickname:v3];

    if (v6)
    {
      int v7 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
      id v8 = [v7 fileManager];
      uint64_t v9 = [v8 dataWithContentsOfURL:v6];
      v10 = [v9 value];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)sharedWatchWallpaperImageDataForNickname:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F5A3D8];
  id v4 = a3;
  BOOL v5 = [v3 currentEnvironment];
  int v6 = [v5 nicknameProvider];
  int v7 = [v6 watchWallpaperImageDataFileURLForNickname:v4];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    uint64_t v9 = [v8 fileManager];
    v10 = [v9 dataWithContentsOfURL:v7];
    uint64_t v11 = [v10 value];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)sharedWallpaperForNickname:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  BOOL v5 = [v4 nicknameProvider];
  int v6 = [v5 wallpaperFileURLForNickname:v3];

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    id v8 = [v7 fileManager];
    uint64_t v9 = [v8 dataWithContentsOfURL:v6];
    v10 = [v9 value];

    uint64_t v11 = [CNWallpaper alloc];
    objc_super v12 = [v3 wallpaper];
    uint64_t v13 = -[CNWallpaper initWithPosterArchiveData:contentIsSensitive:](v11, "initWithPosterArchiveData:contentIsSensitive:", v10, [v12 contentIsSensitive]);

    uint64_t v14 = [v3 wallpaper];
    v15 = [v14 metadata];

    if (v15)
    {
      v16 = [v3 wallpaper];
      v17 = [v16 metadata];
      uint64_t v18 = [(CNWallpaper *)v13 wallpaperIncludingIMWallpaperMetadata:v17];

      uint64_t v13 = (CNWallpaper *)v18;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (BOOL)isNicknameSharingEnabled
{
  uint64_t v2 = [(CNNicknameProvider *)self sharingStateController];
  char v3 = [v2 sharingEnabled];

  return v3;
}

- (unint64_t)sharingAudience
{
  uint64_t v2 = [(CNNicknameProvider *)self sharingStateController];
  unint64_t v3 = [v2 sharingAudience];

  return v3;
}

- (void)nicknameStoreDidChange:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 postNotificationName:@"CNNicknameStoreChangedNotification" object:0];
}

- (IMMeCardSharingStateController)sharingStateController
{
  return self->_sharingStateController;
}

- (void)setSharingStateController:(id)a3
{
}

- (void)setImNicknameProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imNicknameProvider, 0);

  objc_storeStrong((id *)&self->_sharingStateController, 0);
}

@end