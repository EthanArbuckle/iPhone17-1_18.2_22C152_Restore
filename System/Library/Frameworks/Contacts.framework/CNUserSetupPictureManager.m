@interface CNUserSetupPictureManager
+ (BOOL)clearUserSetupPictureData;
+ (BOOL)hasUserSetupPictureData;
+ (BOOL)userSetupPictureDataIsFresh;
+ (id)log;
+ (id)userSetupPictureData;
+ (id)userSetupPictureFilePath;
+ (id)userSetupPicturePath;
+ (void)clearUserSetupPictureData;
+ (void)userSetupPictureData;
+ (void)userSetupPictureDataIsFresh;
@end

@implementation CNUserSetupPictureManager

+ (id)log
{
  if (log_cn_once_token_0_8 != -1) {
    dispatch_once(&log_cn_once_token_0_8, &__block_literal_global_99);
  }
  v2 = (void *)log_cn_once_object_0_8;

  return v2;
}

uint64_t __32__CNUserSetupPictureManager_log__block_invoke()
{
  log_cn_once_object_0_8 = (uint64_t)os_log_create("com.apple.contacts", "CNUserSetupPictureData");

  return MEMORY[0x1F41817F8]();
}

+ (id)userSetupPictureData
{
  if (![a1 hasUserSetupPictureData])
  {
LABEL_10:
    v9 = 0;
    goto LABEL_15;
  }
  if (([a1 userSetupPictureDataIsFresh] & 1) == 0)
  {
    v10 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1909E3000, v10, OS_LOG_TYPE_DEFAULT, "Setup user picture data is outdated. Removing.", buf, 2u);
    }

    [a1 clearUserSetupPictureData];
    goto LABEL_10;
  }
  v3 = (void *)MEMORY[0x1E4F1C9B8];
  v4 = [a1 userSetupPictureFilePath];
  id v19 = 0;
  v5 = [v3 dataWithContentsOfFile:v4 options:0 error:&v19];
  id v6 = v19;

  v7 = [(id)objc_opt_class() log];
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1909E3000, v8, OS_LOG_TYPE_DEFAULT, "Did read setup user picture data from disk", v18, 2u);
    }

    v9 = +[CNUserSetupPictureData userSetupPictureDataFromData:v5];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[CNUserSetupPictureManager userSetupPictureData];
    }

    [a1 clearUserSetupPictureData];
    v9 = 0;
  }

LABEL_15:

  return v9;
}

+ (BOOL)hasUserSetupPictureData
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [a1 userSetupPictureFilePath];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

+ (id)userSetupPictureFilePath
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CNUserSetupPictureManager_userSetupPictureFilePath__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (userSetupPictureFilePath_cn_once_token_4 != -1) {
    dispatch_once(&userSetupPictureFilePath_cn_once_token_4, block);
  }
  v2 = (void *)userSetupPictureFilePath_cn_once_object_4;

  return v2;
}

void __53__CNUserSetupPictureManager_userSetupPictureFilePath__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) userSetupPicturePath];
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"SetupUserPictureData"];
  v2 = (void *)userSetupPictureFilePath_cn_once_object_4;
  userSetupPictureFilePath_cn_once_object_4 = v1;
}

+ (id)userSetupPicturePath
{
  if (userSetupPicturePath_cn_once_token_5 != -1) {
    dispatch_once(&userSetupPicturePath_cn_once_token_5, &__block_literal_global_10_2);
  }
  v2 = (void *)userSetupPicturePath_cn_once_object_5;

  return v2;
}

void __49__CNUserSetupPictureManager_userSetupPicturePath__block_invoke()
{
  NSHomeDirectory();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"/Library/Application Support/AddressBook/.UserSetupDrafts/"];
  uint64_t v1 = (void *)userSetupPicturePath_cn_once_object_5;
  userSetupPicturePath_cn_once_object_5 = v0;
}

+ (BOOL)userSetupPictureDataIsFresh
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [a1 userSetupPictureFilePath];
  id v18 = 0;
  char v5 = [v3 attributesOfItemAtPath:v4 error:&v18];
  id v6 = v18;

  if (!v5)
  {
    v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[CNUserSetupPictureManager userSetupPictureDataIsFresh];
    }
    goto LABEL_6;
  }
  v7 = [v5 fileCreationDate];
  if (!v7)
  {
LABEL_6:
    BOOL v10 = 1;
    goto LABEL_7;
  }
  v8 = [MEMORY[0x1E4F1C9C8] date];
  [v8 timeIntervalSinceDate:v7];
  BOOL v10 = v9 < 604800.0;

LABEL_7:
  return v10;
}

+ (BOOL)clearUserSetupPictureData
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [a1 userSetupPicturePath];
  id v15 = 0;
  char v5 = [v3 removeItemAtPath:v4 error:&v15];
  id v6 = v15;

  if (v6)
  {
    v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[CNUserSetupPictureManager clearUserSetupPictureData];
    }
  }
  return v5;
}

+ (void)userSetupPictureData
{
}

+ (void)userSetupPictureDataIsFresh
{
}

+ (void)clearUserSetupPictureData
{
}

@end