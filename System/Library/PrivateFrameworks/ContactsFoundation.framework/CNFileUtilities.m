@interface CNFileUtilities
+ (CNProcessSharedLock)fileLock;
+ (id)initializeFileLock;
+ (id)os_log;
+ (id)requestSharedLockDirectoryURLWithFileServices:(id)a3;
+ (id)sharedInstance;
+ (id)sharedLockDirectoryURLWithFileServices:(id)a3;
+ (void)initializeFileLock;
- (BOOL)isFileAtUrlOnARemoteFileSystem:(id)a3;
- (CNFileUtilities)init;
- (CNFileUtilities)initWithFileServices:(id)a3;
- (id)proxyLockUrlForFileAtUrl:(id)a3;
- (id)sharedLockDirectoryUrl;
- (id)sharedLockUrlWithName:(id)a3;
@end

@implementation CNFileUtilities

+ (id)os_log
{
  if (os_log_cn_once_token_1_2 != -1) {
    dispatch_once(&os_log_cn_once_token_1_2, &__block_literal_global_19);
  }
  v2 = (void *)os_log_cn_once_object_1_2;

  return v2;
}

uint64_t __25__CNFileUtilities_os_log__block_invoke()
{
  os_log_cn_once_object_1_2 = (uint64_t)os_log_create("com.apple.contacts", "file-utilites");

  return MEMORY[0x1F41817F8]();
}

+ (id)sharedInstance
{
  if (sharedInstance_cn_once_token_2 != -1) {
    dispatch_once(&sharedInstance_cn_once_token_2, &__block_literal_global_4_0);
  }
  v2 = (void *)sharedInstance_cn_once_object_2;

  return v2;
}

uint64_t __33__CNFileUtilities_sharedInstance__block_invoke()
{
  sharedInstance_cn_once_object_2 = objc_alloc_init(CNFileUtilities);

  return MEMORY[0x1F41817F8]();
}

- (CNFileUtilities)init
{
  v3 = +[CNFileServices sharedInstance];
  v4 = [(CNFileUtilities *)self initWithFileServices:v3];

  return v4;
}

- (CNFileUtilities)initWithFileServices:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNFileUtilities;
  v6 = [(CNFileUtilities *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_services, a3);
    v8 = v7;
  }

  return v7;
}

+ (CNProcessSharedLock)fileLock
{
  v3 = +[CNUserDefaults standardPreferences];
  int v4 = [v3 userHasOptedOutOfPreference:@"com.apple.private.contacts.disable-file-lock"];

  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__CNFileUtilities_fileLock__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (fileLock_cn_once_token_3 != -1) {
      dispatch_once(&fileLock_cn_once_token_3, block);
    }
    id v5 = &fileLock_cn_once_object_3;
  }
  else
  {
    if (fileLock_cn_once_token_4 != -1) {
      dispatch_once(&fileLock_cn_once_token_4, &__block_literal_global_12_0);
    }
    id v5 = &fileLock_cn_once_object_4;
  }
  v6 = (void *)*v5;

  return (CNProcessSharedLock *)v6;
}

uint64_t __27__CNFileUtilities_fileLock__block_invoke(uint64_t a1)
{
  fileLock_cn_once_object_3 = [*(id *)(a1 + 32) initializeFileLock];

  return MEMORY[0x1F41817F8]();
}

uint64_t __27__CNFileUtilities_fileLock__block_invoke_2()
{
  fileLock_cn_once_object_4 = objc_alloc_init(CNDoNothingLock);

  return MEMORY[0x1F41817F8]();
}

+ (id)initializeFileLock
{
  v2 = +[CNFileUtilities sharedInstance];
  v3 = [v2 sharedLockUrlWithName:@"database.lock"];

  int v4 = [v3 path];
  id v5 = +[CNProcessSharedLock recursiveSharedLockWithLockFilePath:v4];
  id v10 = 0;
  char v6 = [v5 open:&v10];
  id v7 = v10;
  if ((v6 & 1) == 0)
  {
    v8 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      +[CNFileUtilities initializeFileLock];
    }

    id v5 = 0;
  }

  return v5;
}

- (BOOL)isFileAtUrlOnARemoteFileSystem:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 path];
  uint64_t v5 = [v4 fileSystemRepresentation];

  bzero(v9, 0x878uLL);
  p_services = &self->_services;
  if (([(CNFileServices *)self->_services statfs:v5 :v9] & 0x80000000) == 0) {
    return (v9[65] & 0x10) == 0;
  }
  v8 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    [(CNFileUtilities *)v5 isFileAtUrlOnARemoteFileSystem:v8];
  }

  return 0;
}

- (id)sharedLockDirectoryUrl
{
  v3 = objc_opt_class();
  services = self->_services;

  return (id)[v3 sharedLockDirectoryURLWithFileServices:services];
}

+ (id)sharedLockDirectoryURLWithFileServices:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__CNFileUtilities_sharedLockDirectoryURLWithFileServices___block_invoke;
  v9[3] = &unk_1E569FFF8;
  id v10 = v4;
  id v11 = a1;
  uint64_t v5 = sharedLockDirectoryURLWithFileServices__cn_once_token_7;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&sharedLockDirectoryURLWithFileServices__cn_once_token_7, v9);
  }
  id v7 = (id)sharedLockDirectoryURLWithFileServices__cn_once_object_7;

  return v7;
}

void __58__CNFileUtilities_sharedLockDirectoryURLWithFileServices___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 40) requestSharedLockDirectoryURLWithFileServices:*(void *)(a1 + 32)];
  uint64_t v1 = [v3 copy];
  v2 = (void *)sharedLockDirectoryURLWithFileServices__cn_once_object_7;
  sharedLockDirectoryURLWithFileServices__cn_once_object_7 = v1;
}

+ (id)requestSharedLockDirectoryURLWithFileServices:(id)a3
{
  id v3 = dlopen("/System/Library/PrivateFrameworks/AppSandbox.framework/AppSandbox", 5);
  id v4 = (void (*)(void))dlsym(v3, "AppSandboxUtilAddressBookLockPathURL");
  uint64_t v5 = v4();
  id v6 = (void *)[v5 copy];

  dlclose(v3);

  return v6;
}

- (id)sharedLockUrlWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNFileUtilities *)self sharedLockDirectoryUrl];
  id v6 = [v5 URLByAppendingPathComponent:v4 isDirectory:0];

  return v6;
}

- (id)proxyLockUrlForFileAtUrl:(id)a3
{
  id v4 = [a3 path];
  uint64_t v5 = [v4 stringByResolvingSymlinksInPath];
  id v6 = [v5 stringByStandardizingPath];

  id v7 = [v6 stringByAppendingString:@"_lock"];

  v8 = [v7 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

  v9 = [(CNFileUtilities *)self sharedLockUrlWithName:v8];

  return v9;
}

- (void).cxx_destruct
{
}

+ (void)initializeFileLock
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_19091D000, log, OS_LOG_TYPE_FAULT, "Unable to open file lock: %@ %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)isFileAtUrlOnARemoteFileSystem:(NSObject *)a3 .cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v5 = [*a2 errnoValue];
  int v6 = 136315394;
  uint64_t v7 = a1;
  __int16 v8 = 1024;
  int v9 = v5;
  _os_log_error_impl(&dword_19091D000, a3, OS_LOG_TYPE_ERROR, "Could not statfs file at path: %s: %d", (uint8_t *)&v6, 0x12u);
}

@end