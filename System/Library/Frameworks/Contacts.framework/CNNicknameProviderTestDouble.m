@interface CNNicknameProviderTestDouble
- (BOOL)accountCanCreateSNaP;
- (BOOL)isNicknameSharingEnabled;
- (CNNicknameProviderTestDouble)init;
- (CNNicknameProviderTestDouble)initWithFilePathsForContacts:(id)a3;
- (NSMutableDictionary)contactForNickname;
- (NSMutableDictionary)filePathsForContacts;
- (id)avatarImageFileURLForNickname:(id)a3;
- (id)nicknameAsContactForContact:(id)a3;
- (id)nicknameForContact:(id)a3;
- (id)sharedAvatarImageDataForContact:(id)a3;
- (id)sharedWallpaperForNickname:(id)a3;
- (id)sharedWatchWallpaperImageDataForNickname:(id)a3;
- (id)wallpaperFileURLForNickname:(id)a3;
- (id)watchWallpaperImageDataFileURLForNickname:(id)a3;
- (unint64_t)sharingAudience;
- (void)addFilePath:(id)a3 forContact:(id)a4;
- (void)fetchPersonalNicknameAsContactWithCompletion:(id)a3;
- (void)setContactForNickname:(id)a3;
- (void)setFilePathsForContacts:(id)a3;
@end

@implementation CNNicknameProviderTestDouble

- (CNNicknameProviderTestDouble)init
{
  return [(CNNicknameProviderTestDouble *)self initWithFilePathsForContacts:MEMORY[0x1E4F1CC08]];
}

- (CNNicknameProviderTestDouble)initWithFilePathsForContacts:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNNicknameProviderTestDouble;
  v5 = [(CNNicknameProviderTestDouble *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    filePathsForContacts = v5->_filePathsForContacts;
    v5->_filePathsForContacts = (NSMutableDictionary *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    contactForNickname = v5->_contactForNickname;
    v5->_contactForNickname = (NSMutableDictionary *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)addFilePath:(id)a3 forContact:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(CNNicknameProviderTestDouble *)self filePathsForContacts];
  uint64_t v8 = [v6 identifier];

  [v9 setObject:v7 forKey:v8];
}

- (id)nicknameForContact:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2050000000;
  v5 = (void *)getIMNicknameClass_softClass;
  uint64_t v16 = getIMNicknameClass_softClass;
  if (!getIMNicknameClass_softClass)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __getIMNicknameClass_block_invoke;
    v12[3] = &unk_1E56B45C0;
    v12[4] = &v13;
    __getIMNicknameClass_block_invoke((uint64_t)v12);
    v5 = (void *)v14[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v13, 8);
  id v7 = (void *)[[v6 alloc] initWithMeContact:v4];
  uint64_t v8 = [v4 identifier];
  [v7 setRecordID:v8];

  id v9 = [(CNNicknameProviderTestDouble *)self contactForNickname];
  v10 = [v7 recordID];
  [v9 setObject:v4 forKey:v10];

  return v7;
}

- (id)avatarImageFileURLForNickname:(id)a3
{
  id v4 = a3;
  v5 = [(CNNicknameProviderTestDouble *)self filePathsForContacts];
  id v6 = [v4 recordID];

  id v7 = [v5 objectForKey:v6];

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    uint64_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)wallpaperFileURLForNickname:(id)a3
{
  id v4 = a3;
  v5 = [(CNNicknameProviderTestDouble *)self filePathsForContacts];
  id v6 = [v4 recordID];

  id v7 = [v5 objectForKey:v6];

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    uint64_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)watchWallpaperImageDataFileURLForNickname:(id)a3
{
  id v4 = a3;
  v5 = [(CNNicknameProviderTestDouble *)self filePathsForContacts];
  id v6 = [v4 recordID];

  id v7 = [v5 objectForKey:v6];

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    uint64_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)sharedAvatarImageDataForContact:(id)a3
{
  return 0;
}

- (BOOL)accountCanCreateSNaP
{
  return 1;
}

- (void)fetchPersonalNicknameAsContactWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = self;
  CNUnimplementedMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (BOOL)isNicknameSharingEnabled
{
  return 1;
}

- (id)sharedWallpaperForNickname:(id)a3
{
  v3 = [(CNNicknameProviderTestDouble *)self wallpaperFileURLForNickname:a3];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    v5 = [v4 fileManager];
    id v6 = [v5 dataWithContentsOfURL:v3];
    id v7 = [v6 value];

    uint64_t v8 = [[CNWallpaper alloc] initWithPosterArchiveData:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)sharedWatchWallpaperImageDataForNickname:(id)a3
{
  v3 = [(CNNicknameProviderTestDouble *)self watchWallpaperImageDataFileURLForNickname:a3];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    v5 = [v4 fileManager];
    id v6 = [v5 dataWithContentsOfURL:v3];
    id v7 = [v6 value];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (unint64_t)sharingAudience
{
  return 0;
}

- (id)nicknameAsContactForContact:(id)a3
{
  return 0;
}

- (NSMutableDictionary)filePathsForContacts
{
  return self->_filePathsForContacts;
}

- (void)setFilePathsForContacts:(id)a3
{
}

- (NSMutableDictionary)contactForNickname
{
  return self->_contactForNickname;
}

- (void)setContactForNickname:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactForNickname, 0);

  objc_storeStrong((id *)&self->_filePathsForContacts, 0);
}

@end