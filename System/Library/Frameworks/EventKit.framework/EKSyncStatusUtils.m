@interface EKSyncStatusUtils
+ (id)_permittedClassesForArchivingLastSyncErrorUserInfo;
+ (id)dataFromErrorUserInfo:(id)a3;
+ (id)errorUserInfoFromData:(id)a3;
@end

@implementation EKSyncStatusUtils

+ (id)dataFromErrorUserInfo:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = [(id)objc_opt_class() _permittedClassesForArchivingLastSyncErrorUserInfo];
    id v9 = 0;
    v5 = [MEMORY[0x1E4F577D8] archiveDictionary:v3 permittedClasses:v4 error:&v9];

    id v6 = v9;
    if (!v5)
    {
      v7 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        +[EKSyncStatusUtils dataFromErrorUserInfo:]((uint64_t)v6, v7);
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)errorUserInfoFromData:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = [(id)objc_opt_class() _permittedClassesForArchivingLastSyncErrorUserInfo];
    id v9 = 0;
    v5 = [MEMORY[0x1E4F577D8] unarchiveDictionaryFromData:v3 permittedClasses:v4 error:&v9];

    id v6 = v9;
    if (!v5)
    {
      v7 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
        +[EKSyncStatusUtils errorUserInfoFromData:]((uint64_t)v6, v7);
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_permittedClassesForArchivingLastSyncErrorUserInfo
{
  if (_permittedClassesForArchivingLastSyncErrorUserInfo_onceToken != -1) {
    dispatch_once(&_permittedClassesForArchivingLastSyncErrorUserInfo_onceToken, &__block_literal_global_56);
  }
  v2 = (void *)_permittedClassesForArchivingLastSyncErrorUserInfo_permittedClasses;

  return v2;
}

void __71__EKSyncStatusUtils__permittedClassesForArchivingLastSyncErrorUserInfo__block_invoke()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:7];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  id v3 = (void *)_permittedClassesForArchivingLastSyncErrorUserInfo_permittedClasses;
  _permittedClassesForArchivingLastSyncErrorUserInfo_permittedClasses = v2;
}

+ (void)dataFromErrorUserInfo:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Could not archive last sync user info, error = %@", (uint8_t *)&v2, 0xCu);
}

+ (void)errorUserInfoFromData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Could not unarchive last sync user info, error = %@", (uint8_t *)&v2, 0xCu);
}

@end