@interface MCMPOSIXUser
+ (BOOL)_isRoleUserWithUID:(unsigned int)a3 homeDirectoryURL:(id)a4;
+ (MCMPOSIXUser)posixUserWithName:(id)a3;
+ (MCMPOSIXUser)posixUserWithUID:(unsigned int)a3;
+ (id)_getCachedUID:(unsigned int)a3 flush:(BOOL)a4 onCacheMiss:(id)a5;
+ (id)_posixUserWithPasswdPtr:(passwd *)a3;
+ (id)_posixUserWithUID:(unsigned int)a3 name:(id)a4 useUID:(BOOL)a5;
+ (id)currentPOSIXUser;
+ (id)nobody;
+ (id)root;
+ (void)flush;
- (BOOL)hasUseableHomeDirectory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPOSIXUser:(id)a3;
- (BOOL)isRoleUser;
- (BOOL)isRoot;
- (MCMPOSIXUser)initWithUID:(unsigned int)a3 primaryGID:(unsigned int)a4 homeDirectoryURL:(id)a5 unvalidatedHomeDirectoryURL:(id)a6 name:(id)a7 roleUser:(BOOL)a8;
- (NSString)name;
- (NSURL)homeDirectoryURL;
- (NSURL)unvalidatedHomeDirectoryURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)fullDescription;
- (unint64_t)hash;
- (unsigned)UID;
- (unsigned)primaryGID;
@end

@implementation MCMPOSIXUser

- (unsigned)UID
{
  return self->_UID;
}

- (BOOL)isRoleUser
{
  return self->_roleUser;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MCMPOSIXUser *)a3;
  BOOL v5 = self == v4;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(MCMPOSIXUser *)self isEqualToPOSIXUser:v4];
    }
  }

  return v5;
}

- (BOOL)isEqualToPOSIXUser:(id)a3
{
  return self->_UID == *((_DWORD *)a3 + 3);
}

+ (MCMPOSIXUser)posixUserWithUID:(unsigned int)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__MCMPOSIXUser_posixUserWithUID___block_invoke;
  v7[3] = &__block_descriptor_40_e22___MCMPOSIXUser_12__0I8l;
  v7[4] = a1;
  v4 = [a1 _getCachedUID:*(void *)&a3 flush:0 onCacheMiss:v7];
  if (!v4)
  {
    BOOL v5 = container_log_handle_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      unsigned int v9 = a3;
      _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, "Could not generate posix user details for uid=%{public}u", buf, 8u);
    }
  }

  return (MCMPOSIXUser *)v4;
}

+ (id)_getCachedUID:(unsigned int)a3 flush:(BOOL)a4 onCacheMiss:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  v7 = (void (**)(id, void))a5;
  if (_getCachedUID_flush_onCacheMiss__onceToken != -1) {
    dispatch_once(&_getCachedUID_flush_onCacheMiss__onceToken, &__block_literal_global_13481);
  }
  id v8 = (id)_getCachedUID_flush_onCacheMiss__cache;
  objc_sync_enter(v8);
  if (v5) {
    [(id)_getCachedUID_flush_onCacheMiss__cache removeAllObjects];
  }
  unsigned int v9 = (void *)_getCachedUID_flush_onCacheMiss__cache;
  uint64_t v10 = [NSNumber numberWithUnsignedInt:v6];
  v11 = [v9 objectForKeyedSubscript:v10];

  if (v7)
  {
    if (!v11)
    {
      v11 = v7[2](v7, v6);
      if (v11)
      {
        v12 = (void *)_getCachedUID_flush_onCacheMiss__cache;
        v13 = [NSNumber numberWithUnsignedInt:v6];
        [v12 setObject:v11 forKeyedSubscript:v13];
      }
    }
  }
  objc_sync_exit(v8);

  return v11;
}

- (unsigned)primaryGID
{
  return self->_primaryGID;
}

- (id)description
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__MCMPOSIXUser_description__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (v5)
  {
    *(_DWORD *)(v5 + 12) = self->_UID;
    *(_DWORD *)(v5 + 16) = self->_primaryGID;
    uint64_t v7 = [(NSString *)self->_name copyWithZone:a3];
    id v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;

    uint64_t v9 = [(NSURL *)self->_homeDirectoryURL copyWithZone:a3];
    uint64_t v10 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = v9;

    *(unsigned char *)(v6 + 8) = self->_root;
    *(unsigned char *)(v6 + 9) = self->_roleUser;
    *(unsigned char *)(v6 + 10) = self->_useableHomeDirectory;
  }
  return (id)v6;
}

- (NSURL)homeDirectoryURL
{
  return self->_homeDirectoryURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_unvalidatedHomeDirectoryURL, 0);

  objc_storeStrong((id *)&self->_homeDirectoryURL, 0);
}

id __27__MCMPOSIXUser_description__block_invoke(uint64_t a1, char a2)
{
  v4 = NSString;
  uint64_t v5 = [*(id *)(a1 + 32) UID];
  uint64_t v6 = [*(id *)(a1 + 32) primaryGID];
  uint64_t v7 = *(void **)(a1 + 32);
  if (a2)
  {
    id v8 = [v7 homeDirectoryURL];
    uint64_t v9 = [v8 path];
    uint64_t v10 = [*(id *)(a1 + 32) name];
    v11 = [v9 stringByRedactingHomeContent:v10];
    v12 = [v4 stringWithFormat:@"(%u|%u|%@|%@)", v5, v6, @"~~", v11];
  }
  else
  {
    id v8 = [v7 name];
    uint64_t v9 = [*(id *)(a1 + 32) homeDirectoryURL];
    uint64_t v10 = [v9 path];
    v12 = [v4 stringWithFormat:@"(%u|%u|%@|%@)", v5, v6, v8, v10];
  }

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)hasUseableHomeDirectory
{
  return self->_useableHomeDirectory;
}

- (BOOL)isRoot
{
  return self->_root;
}

- (NSURL)unvalidatedHomeDirectoryURL
{
  return self->_unvalidatedHomeDirectoryURL;
}

- (MCMPOSIXUser)initWithUID:(unsigned int)a3 primaryGID:(unsigned int)a4 homeDirectoryURL:(id)a5 unvalidatedHomeDirectoryURL:(id)a6 name:(id)a7 roleUser:(BOOL)a8
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)MCMPOSIXUser;
  v18 = [(MCMPOSIXUser *)&v24 init];
  v19 = v18;
  if (v18)
  {
    v18->_UID = a3;
    v18->_primaryGID = a4;
    objc_storeStrong((id *)&v18->_homeDirectoryURL, a5);
    objc_storeStrong((id *)&v19->_unvalidatedHomeDirectoryURL, a6);
    objc_storeStrong((id *)&v19->_name, a7);
    v19->_root = a3 == 0;
    v19->_roleUser = a8;
    if (v16)
    {
      v20 = [v16 path];
      if ([v20 hasPrefix:@"/var/empty"])
      {
        v19->_useableHomeDirectory = 0;
      }
      else
      {
        v21 = [v16 path];
        if ([v21 hasPrefix:@"/private/var/empty"])
        {
          v19->_useableHomeDirectory = 0;
        }
        else
        {
          v22 = [v16 path];
          v19->_useableHomeDirectory = [v22 hasPrefix:@"/System/Volumes/Data/private/var/empty"] ^ 1;
        }
      }
    }
    else
    {
      v19->_useableHomeDirectory = 0;
    }
  }

  return v19;
}

- (unint64_t)hash
{
  return self->_UID;
}

- (id)fullDescription
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v3 = [MCMLazyDescription alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__MCMPOSIXUser_fullDescription__block_invoke;
  v6[3] = &unk_1E6A80A78;
  v6[4] = self;
  v4 = [(MCMLazyDescription *)v3 initWithDescriber:v6];

  return v4;
}

id __31__MCMPOSIXUser_fullDescription__block_invoke(uint64_t a1, char a2)
{
  v4 = NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v7 UID];
  uint64_t v9 = [*(id *)(a1 + 32) primaryGID];
  uint64_t v10 = *(void **)(a1 + 32);
  if (a2)
  {
    v11 = [v10 homeDirectoryURL];
    v12 = [v11 path];
    v13 = [*(id *)(a1 + 32) name];
    v14 = [v12 stringByRedactingHomeContent:v13];
    objc_msgSend(v4, "stringWithFormat:", @"<%@: %p; UID = %u, primaryGID = %u, name = [%@], homeDirectoryURL = [%@]>",
      v6,
      v7,
      v8,
      v9,
      @"~~",
    id v15 = v14);
  }
  else
  {
    v11 = [v10 name];
    v12 = [*(id *)(a1 + 32) homeDirectoryURL];
    v13 = [v12 path];
    objc_msgSend(v4, "stringWithFormat:", @"<%@: %p; UID = %u, primaryGID = %u, name = [%@], homeDirectoryURL = [%@]>",
      v6,
      v7,
      v8,
      v9,
      v11,
    id v15 = v13);
  }

  return v15;
}

+ (BOOL)_isRoleUserWithUID:(unsigned int)a3 homeDirectoryURL:(id)a4
{
  return a3 < 0x1F5;
}

uint64_t __48__MCMPOSIXUser__getCachedUID_flush_onCacheMiss___block_invoke()
{
  _getCachedUID_flush_onCacheMiss__cache = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];

  return MEMORY[0x1F41817F8]();
}

+ (id)_posixUserWithPasswdPtr:(passwd *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  bzero(v27, 0x401uLL);
  if (a3)
  {
    uint64_t v5 = [NSString stringWithUTF8String:a3->pw_name];
    pw_dir = a3->pw_dir;
    if (!pw_dir)
    {
      uint64_t v7 = 0;
      v13 = 0;
      uint64_t v15 = 1;
LABEL_16:
      v19 = (void *)[objc_alloc((Class)a1) initWithUID:a3->pw_uid primaryGID:a3->pw_gid homeDirectoryURL:v13 unvalidatedHomeDirectoryURL:v7 name:v5 roleUser:v15];
      goto LABEL_21;
    }
    uint64_t v7 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:pw_dir isDirectory:1 relativeToURL:0];
    uint64_t v8 = [NSString stringWithFileSystemRepresentation:a3->pw_dir];
    uint64_t v9 = [v8 stringByRedactingHomeContent:v5];

    if (!container_realpath())
    {
      id v16 = container_log_handle_for_category();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [NSString stringWithUTF8String:v27];
        v18 = [v17 stringByRedactingHomeContent:v5];
        int v23 = 138543618;
        objc_super v24 = v9;
        __int16 v25 = 2114;
        v26 = v18;
        _os_log_impl(&dword_1D7739000, v16, OS_LOG_TYPE_DEFAULT, "container_realpath([%{public}@]) → [%{public}@]", (uint8_t *)&v23, 0x16u);
      }
      v13 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v27 isDirectory:1 relativeToURL:0];
      goto LABEL_15;
    }
    int v10 = *__error();
    v11 = container_log_handle_for_category();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v10 == 2)
    {
      if (v12)
      {
        int v23 = 138543362;
        objc_super v24 = v9;
        _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "User home directory at [%{public}@] does not exist", (uint8_t *)&v23, 0xCu);
      }

      v13 = 0;
LABEL_15:
      uint64_t v15 = [a1 _isRoleUserWithUID:a3->pw_uid homeDirectoryURL:v7];

      goto LABEL_16;
    }
    if (v12)
    {
      int v22 = *__error();
      int v23 = 138543618;
      objc_super v24 = v9;
      __int16 v25 = 1026;
      LODWORD(v26) = v22;
      _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "container_realpath([%{public}@]) failed: %{public, darwin.errno}d", (uint8_t *)&v23, 0x12u);
    }
  }
  else
  {
    v14 = container_log_handle_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v23) = 0;
      _os_log_fault_impl(&dword_1D7739000, v14, OS_LOG_TYPE_FAULT, "NULL passwd", (uint8_t *)&v23, 2u);
    }

    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  v13 = 0;
  v19 = 0;
LABEL_21:
  id v20 = v19;

  return v20;
}

+ (id)_posixUserWithUID:(unsigned int)a3 name:(id)a4 useUID:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  size_t v9 = sysconf(71);
  if (v9)
  {
    size_t v10 = v9;
    v11 = (char *)malloc_type_calloc(1uLL, v9, 0x4D0EC876uLL);
    memset(&v17, 0, sizeof(v17));
    id v16 = 0;
    if (v5) {
      int v12 = getpwuid_r(a3, &v17, v11, v10, &v16);
    }
    else {
      int v12 = getpwnam_r((const char *)[v8 UTF8String], &v17, v11, v10, &v16);
    }
    v14 = 0;
    if (!v12 && v16)
    {
      v14 = [a1 _posixUserWithPasswdPtr:&v17];
    }
    free(v11);
  }
  else
  {
    v13 = container_log_handle_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v17.pw_name) = 0;
      _os_log_fault_impl(&dword_1D7739000, v13, OS_LOG_TYPE_FAULT, "Could not get _SC_GETPW_R_SIZE_MAX sysconf.", (uint8_t *)&v17, 2u);
    }

    v14 = 0;
  }

  return v14;
}

+ (void)flush
{
  id v2 = (id)[a1 _getCachedUID:0 flush:1 onCacheMiss:0];
}

+ (id)root
{
  return (id)[a1 posixUserWithUID:0];
}

+ (id)nobody
{
  return (id)[a1 posixUserWithUID:4294967294];
}

id __33__MCMPOSIXUser_posixUserWithUID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _posixUserWithUID:a2 name:&stru_1F2EF6598 useUID:1];
  if (v2)
  {
    v3 = container_log_handle_for_category();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [v2 fullDescription];
      int v6 = 138543362;
      uint64_t v7 = v4;
      _os_log_impl(&dword_1D7739000, v3, OS_LOG_TYPE_DEFAULT, "Created new POSIX user: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }

  return v2;
}

+ (MCMPOSIXUser)posixUserWithName:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [a1 _posixUserWithUID:0 name:v4 useUID:0];
  if (!v5)
  {
    int v6 = container_log_handle_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_error_impl(&dword_1D7739000, v6, OS_LOG_TYPE_ERROR, "Could not generate posix user details for user=%{public}@", (uint8_t *)&v8, 0xCu);
    }
  }

  return (MCMPOSIXUser *)v5;
}

+ (id)currentPOSIXUser
{
  uint64_t v3 = geteuid();

  return (id)[a1 posixUserWithUID:v3];
}

@end