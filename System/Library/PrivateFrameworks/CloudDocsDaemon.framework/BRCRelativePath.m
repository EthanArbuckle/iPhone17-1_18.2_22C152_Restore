@interface BRCRelativePath
+ (int)locateByFileID:(unint64_t)a3 session:(id)a4;
- (BOOL)_fixupRelativePath;
- (BOOL)_resolveAndKeepOpenMustExist:(BOOL)a3 allowResolveInPkg:(BOOL)a4 error:(int *)a5;
- (BOOL)_resolveRootWhenExists:(BOOL)a3;
- (BOOL)_shouldKeepBasePathOpen;
- (BOOL)_shouldKeepBasePathOpenWithoutOpenedFD;
- (BOOL)exists;
- (BOOL)flock:(int)a3;
- (BOOL)hasFinderTags;
- (BOOL)isBRAlias;
- (BOOL)isBundle;
- (BOOL)isBusy;
- (BOOL)isDocument;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRelativePath:(id)a3;
- (BOOL)isExcluded;
- (BOOL)isExecutable;
- (BOOL)isFault;
- (BOOL)isFile;
- (BOOL)isFileWithFinderInfoAliasBit;
- (BOOL)isFinderAlias;
- (BOOL)isHiddenExtension;
- (BOOL)isHiddenFile;
- (BOOL)isInPackage;
- (BOOL)isPackageRoot;
- (BOOL)isResolved;
- (BOOL)isRoot;
- (BOOL)isSymLink;
- (BOOL)isUnixDir;
- (BOOL)isUnresolvableDueToProtection;
- (BOOL)isWritable;
- (BOOL)performOnOpenFileDescriptor:(id)a3 error:(int *)a4;
- (BOOL)performOnOpenParentFileDescriptor:(id)a3 error:(int *)a4;
- (BOOL)resolveAndKeepOpenMustExist:(BOOL)a3 allowResolveInPkg:(BOOL)a4 error:(int *)a5;
- (BOOL)resolveAndKeepOpenMustExist:(BOOL)a3 error:(int *)a4;
- (BOOL)resolveMustExist:(BOOL)a3 error:(int *)a4;
- (BRCAccountSession)session;
- (BRCAppLibrary)appLibrary;
- (BRCBookmark)bookmark;
- (BRCGenerationID)generationID;
- (BRCRelativePath)init;
- (BRCRelativePath)initWithAbsolutePath:(id)a3 session:(id)a4;
- (BRCRelativePath)initWithFileID:(unint64_t)a3 root:(id)a4 session:(id)a5;
- (BRCRelativePath)initWithFileID:(unint64_t)a3 session:(id)a4;
- (BRCRelativePath)initWithPath:(id)a3 appLibrary:(id)a4;
- (BRCRelativePath)initWithRootPath:(id)a3 session:(id)a4;
- (BRCRelativePath)pathWithChildAtPath:(id)a3;
- (BRCRelativePath)root;
- (BRFileObjectID)fileObjectID;
- (BRFileObjectID)parentFileObjectID;
- (NSData)quarantineInfo;
- (NSData)xattrs;
- (NSNumber)itemSyncPausedExpireTS;
- (NSString)absolutePath;
- (NSString)faultDisplayName;
- (NSString)filename;
- (NSString)itemSyncPausedByBundleID;
- (NSString)logicalName;
- (NSString)pathRelativeToPackageRoot;
- (NSString)pathRelativeToRoot;
- (NSString)sharedItemBookmark;
- (NSString)symlinkContent;
- (NSURL)physicalURL;
- (id)_initWithPath:(id)a3 relativeToRoot:(id)a4;
- (id)basePath;
- (id)description;
- (id)logicalURL;
- (id)logicalURLWithLogicalName:(id)a3;
- (id)pathOfPackageRoot;
- (id)refreshFromPathMustExist:(BOOL)a3;
- (id)relativePath;
- (int)_resolveBasePath:(BOOL)a3;
- (int)_resolvePathTypeAndContainer;
- (int)_resolveSymlinkRelativeTo:(int)a3 path:(id)a4;
- (int)_resolveWhenDoesntExist;
- (int)_resolveWhenExists;
- (int)deviceID;
- (int64_t)birthTime;
- (int64_t)modificationTime;
- (int64_t)size;
- (unint64_t)fileID;
- (unint64_t)hash;
- (unint64_t)parentFileID;
- (unint64_t)parentHash;
- (unsigned)documentID;
- (unsigned)fileType;
- (unsigned)fsGenerationID;
- (unsigned)hardlinkCount;
- (unsigned)itemScope;
- (unsigned)type;
- (void)_close;
- (void)_resolveWhenDoesntExist;
- (void)_resolveWhenExists;
- (void)bookmark;
- (void)close;
- (void)dealloc;
- (void)isPackageRoot;
- (void)isResolved;
- (void)logicalName;
- (void)pathOfPackageRoot;
- (void)setAppLibrary:(id)a3;
- (void)setItemScope:(unsigned __int8)a3;
- (void)setType:(unsigned __int16)a3;
- (void)size;
- (void)symlinkContent;
- (void)type;
@end

@implementation BRCRelativePath

- (BRCRelativePath)init
{
  v5.receiver = self;
  v5.super_class = (Class)BRCRelativePath;
  v2 = [(BRCRelativePath *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_fd = -100;
    brc_mutex_init_recursive(&v2->_mutex.pthread);
  }
  return v3;
}

- (BRCRelativePath)initWithRootPath:(id)a3 session:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend(v7, "br_isAbsolutePath"))
  {
    if (v8) {
      goto LABEL_3;
    }
    goto LABEL_9;
  }
  v12 = brc_bread_crumbs();
  v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    -[BRCRelativePath initWithRootPath:session:]();
  }

  if (!v8)
  {
LABEL_9:
    v14 = brc_bread_crumbs();
    v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath initWithRootPath:session:]();
    }
  }
LABEL_3:
  v9 = [(BRCRelativePath *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a4);
    objc_storeStrong((id *)&v10->_absolutePath, a3);
  }

  return v10;
}

- (id)_initWithPath:(id)a3 relativeToRoot:(id)a4
{
  id v7 = a3;
  id v8 = (id *)a4;
  v9 = [(BRCRelativePath *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, v8[34]);
    if (!v10->_session)
    {
      v17 = brc_bread_crumbs();
      v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        -[BRCRelativePath _initWithPath:relativeToRoot:]();
      }
    }
    if (objc_msgSend(v7, "br_isAbsolutePath"))
    {
      v11 = [v8 absolutePath];
      uint64_t v12 = objc_msgSend(v7, "br_pathRelativeToPath:", v11);
      relativePath = v10->_relativePath;
      v10->_relativePath = (NSString *)v12;

      if ([(NSString *)v10->_relativePath length])
      {
LABEL_8:
        objc_storeStrong((id *)&v10->_basePath, a4);
        goto LABEL_9;
      }
      v14 = v10->_relativePath;
      v10->_relativePath = 0;

      uint64_t v15 = 16;
    }
    else
    {
      uint64_t v15 = 24;
    }
    objc_storeStrong((id *)((char *)&v10->super.isa + v15), a3);
    goto LABEL_8;
  }
LABEL_9:

  return v10;
}

- (BRCRelativePath)initWithAbsolutePath:(id)a3 session:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(BRCRelativePath *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a4);
    if (!v10->_session)
    {
      v14 = brc_bread_crumbs();
      uint64_t v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[BRCRelativePath _initWithPath:relativeToRoot:]();
      }
    }
    if ((objc_msgSend(v7, "br_isAbsolutePath") & 1) == 0)
    {
      v16 = brc_bread_crumbs();
      v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[BRCRelativePath initWithRootPath:session:]();
      }
    }
    objc_storeStrong((id *)&v10->_absolutePath, a3);
    uint64_t v11 = [v8 roots];
    roots = v10->_roots;
    v10->_roots = (NSSet *)v11;
  }
  return v10;
}

- (BRCRelativePath)initWithPath:(id)a3 appLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((objc_msgSend(v6, "br_isAbsolutePath") & 1) == 0)
  {
    id v8 = [v7 mangledID];
    v9 = [v8 mangledIDString];
    uint64_t v10 = [v9 stringByAppendingPathComponent:v6];

    id v6 = (id)v10;
  }
  uint64_t v11 = [v7 root];
  uint64_t v12 = [(BRCRelativePath *)self _initWithPath:v6 relativeToRoot:v11];

  return v12;
}

- (BRCRelativePath)initWithFileID:(unint64_t)a3 session:(id)a4
{
  return [(BRCRelativePath *)self initWithFileID:a3 root:0 session:a4];
}

- (BRCRelativePath)initWithFileID:(unint64_t)a3 root:(id)a4 session:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (!a3)
  {
    v19 = brc_bread_crumbs();
    v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath initWithFileID:root:session:]();
    }
  }
  uint64_t v10 = [(BRCRelativePath *)self init];
  if (v10)
  {
    if (v8) {
      [MEMORY[0x1E4F1CAD0] setWithObject:v8];
    }
    else {
    uint64_t v11 = [v9 roots];
    }
    objc_storeStrong((id *)&v10->_session, a5);
    if (!v10->_session)
    {
      v21 = brc_bread_crumbs();
      v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        -[BRCRelativePath _initWithPath:relativeToRoot:]();
      }
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v17, "fileID", (void)v23) == a3)
          {
            objc_storeStrong((id *)&v10->_basePath, v17);
            goto LABEL_17;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_17:

    v10->_fileID = a3;
    if (!v10->_basePath) {
      objc_storeStrong((id *)&v10->_roots, v11);
    }
  }
  return v10;
}

+ (int)locateByFileID:(unint64_t)a3 session:(id)a4
{
  if (!a3) {
    return 2;
  }
  id v5 = a4;
  id v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFileID:a3 session:v5];

  int v9 = 0;
  if ([v6 resolveMustExist:1 error:&v9]) {
    int v7 = 0;
  }
  else {
    int v7 = v9;
  }

  return v7;
}

- (BRCRelativePath)pathWithChildAtPath:(id)a3
{
  id v4 = a3;
  if (![(BRCRelativePath *)self exists])
  {
    int v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathWithChildAtPath:]();
    }
  }
  if (![(BRCRelativePath *)self isUnixDir])
  {
    int v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathWithChildAtPath:]();
    }
  }
  id v5 = [[BRCRelativePath alloc] _initWithPath:v4 relativeToRoot:self];

  return (BRCRelativePath *)v5;
}

- (id)pathOfPackageRoot
{
  if (![(BRCRelativePath *)self isInPackage])
  {
    id v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathOfPackageRoot]();
    }
  }
  if ([(BRCRelativePath *)self isInPackage])
  {
    v3 = self->_basePath;
    if ([(BRCRelativePath *)v3 isPackageRoot])
    {
      id v4 = v3;
    }
    else
    {
      do
      {
        id v4 = v3->_basePath;

        v3 = v4;
      }
      while (![(BRCRelativePath *)v4 isPackageRoot]);
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] closing fd:%d%@", (uint8_t *)v4, 0x12u);
}

- (id)basePath
{
  p_mutex = &self->_mutex;
  brc_mutex_lock(&self->_mutex.pthread);
  id v4 = self->_basePath;
  brc_mutex_unlock(&p_mutex->pthread);
  return v4;
}

- (BRCRelativePath)root
{
  v2 = self;
  int v3 = [(BRCRelativePath *)v2 basePath];

  if (v3)
  {
    do
    {
      id v4 = [(BRCRelativePath *)v2 basePath];

      __int16 v5 = [(BRCRelativePath *)v4 basePath];

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    id v4 = v2;
  }
  return v4;
}

- (NSURL)physicalURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  int v3 = [(BRCRelativePath *)self absolutePath];
  id v4 = [v2 fileURLWithPath:v3];

  return (NSURL *)v4;
}

- (id)logicalURLWithLogicalName:(id)a3
{
  id v4 = a3;
  __int16 v5 = [(BRCRelativePath *)self absolutePath];
  uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
  uint64_t v7 = v6;
  if (v4)
  {
    id v8 = [v5 stringByDeletingLastPathComponent];
    uint64_t v9 = [v8 stringByAppendingPathComponent:v4];

    id v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
    __int16 v5 = (void *)v9;
  }
  else
  {
    id v10 = v6;
  }
  _CFURLPromiseSetPhysicalURL();

  return v10;
}

- (id)logicalURL
{
  if ([(BRCRelativePath *)self exists] && [(BRCRelativePath *)self isFault])
  {
    uint64_t v3 = [(BRCRelativePath *)self logicalName];
  }
  else
  {
    uint64_t v3 = [(BRCRelativePath *)self filename];
  }
  id v4 = (void *)v3;
  __int16 v5 = [(BRCRelativePath *)self logicalURLWithLogicalName:v3];

  return v5;
}

- (BOOL)isDocument
{
  if ([(BRCRelativePath *)self isInPackage]) {
    return 0;
  }
  if ([(BRCRelativePath *)self isFile])
  {
    if (*((unsigned char *)self + 192)) {
      return 0;
    }
    return ![(BRCRelativePath *)self isSymLink];
  }
  else
  {
    return [(BRCRelativePath *)self isPackageRoot];
  }
}

- (BOOL)isFault
{
  BOOL v3 = [(BRCRelativePath *)self isDocument];
  if (v3)
  {
    id v4 = [(BRCRelativePath *)self filename];
    char v5 = objc_msgSend(v4, "br_isSideFaultName");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isBundle
{
  if (![(BRCRelativePath *)self exists])
  {
    id v4 = brc_bread_crumbs();
    char v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathWithChildAtPath:]();
    }
  }
  return (*((unsigned __int8 *)self + 191) >> 2) & 1;
}

- (BOOL)isUnixDir
{
  if (![(BRCRelativePath *)self exists])
  {
    id v4 = brc_bread_crumbs();
    char v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathWithChildAtPath:]();
    }
  }
  return (self->_mode & 0xF000) == 0x4000;
}

- (BOOL)isFile
{
  if (![(BRCRelativePath *)self exists])
  {
    id v4 = brc_bread_crumbs();
    char v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathWithChildAtPath:]();
    }
  }
  return (self->_mode & 0xF000) == 0x8000;
}

- (BOOL)isPackageRoot
{
  if (![(BRCRelativePath *)self isResolved])
  {
    id v4 = brc_bread_crumbs();
    char v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath isPackageRoot]();
    }
  }
  return (*((unsigned __int8 *)self + 191) >> 3) & 1;
}

- (BOOL)isInPackage
{
  if (![(BRCRelativePath *)self isResolved])
  {
    id v4 = brc_bread_crumbs();
    char v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath isPackageRoot]();
    }
  }
  return (*((unsigned __int8 *)self + 191) >> 1) & 1;
}

- (BOOL)isRoot
{
  return !self->_basePath && self->_roots == 0;
}

- (unsigned)type
{
  if (![(BRCRelativePath *)self isResolved])
  {
    id v4 = brc_bread_crumbs();
    char v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath type]();
    }
  }
  unsigned __int16 result = self->_type;
  if (!result)
  {
    uint64_t v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath type]();
    }

    return self->_type;
  }
  return result;
}

- (unsigned)itemScope
{
  if (![(BRCRelativePath *)self isResolved])
  {
    id v4 = brc_bread_crumbs();
    char v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath type]();
    }
  }
  return self->_itemScope;
}

- (BOOL)isResolved
{
  p_mutex = &self->_mutex;
  brc_mutex_lock(&self->_mutex.pthread);
  if (!self->_absolutePath || !self->_relativePath || !self->_parentFileID)
  {
    if (!self->_basePath
      || ([(BRCRelativePath *)self basePath],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = [v9 isResolved],
          v9,
          (v10 & 1) != 0))
    {
      BOOL v8 = 0;
      goto LABEL_19;
    }
    uint64_t v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath isResolved]();
    }
    BOOL v8 = 0;
LABEL_18:

    goto LABEL_19;
  }
  if (![(BRCRelativePath *)self isRoot])
  {
    id v4 = [(BRCRelativePath *)self basePath];
    char v5 = [v4 isResolved];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = brc_bread_crumbs();
      uint64_t v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[BRCRelativePath isResolved].cold.4();
      }
    }
  }
  if (([(NSString *)self->_absolutePath br_isAbsolutePath] & 1) == 0)
  {
    uint64_t v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath isResolved]();
    }
  }
  if ([(NSString *)self->_relativePath br_isAbsolutePath])
  {
    uint64_t v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath isResolved]();
    }
    BOOL v8 = 1;
    goto LABEL_18;
  }
  BOOL v8 = 1;
LABEL_19:
  brc_mutex_unlock(&p_mutex->pthread);
  return v8;
}

- (BOOL)isExcluded
{
  return *((unsigned char *)self + 191) & 1;
}

- (BOOL)isUnresolvableDueToProtection
{
  return (*((unsigned __int8 *)self + 192) >> 5) & 1;
}

- (BOOL)isSymLink
{
  if (![(BRCRelativePath *)self isResolved])
  {
    id v4 = brc_bread_crumbs();
    char v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath isPackageRoot]();
    }
  }
  return (self->_mode & 0xF000) == 40960;
}

- (BOOL)exists
{
  if (![(BRCRelativePath *)self isResolved])
  {
    id v4 = brc_bread_crumbs();
    char v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath isPackageRoot]();
    }
  }
  return self->_fileID != 0;
}

- (BRCAppLibrary)appLibrary
{
  if (![(BRCRelativePath *)self isResolved])
  {
    char v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath type]();
    }
  }
  appLibrary = self->_appLibrary;
  return appLibrary;
}

- (NSString)absolutePath
{
  p_mutex = &self->_mutex;
  brc_mutex_lock(&self->_mutex.pthread);
  id v4 = self->_absolutePath;
  if (!v4 && ![(BRCRelativePath *)self isResolved])
  {
    uint64_t v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath type]();
    }
  }
  brc_mutex_unlock(&p_mutex->pthread);
  return v4;
}

- (id)relativePath
{
  p_mutex = &self->_mutex;
  brc_mutex_lock(&self->_mutex.pthread);
  id v4 = self->_relativePath;
  brc_mutex_unlock(&p_mutex->pthread);
  return v4;
}

- (NSString)pathRelativeToRoot
{
  if (![(BRCRelativePath *)self isResolved])
  {
    char v10 = brc_bread_crumbs();
    uint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath type]();
    }
  }
  p_mutex = &self->_mutex;
  brc_mutex_lock(&self->_mutex.pthread);
  id v4 = self->_relativePath;
  if (![(BRCRelativePath *)self isRoot])
  {
    char v5 = self->_basePath;
    if ([(BRCRelativePath *)v5 isRoot])
    {
      uint64_t v6 = (uint64_t)v4;
      uint64_t v7 = v5;
    }
    else
    {
      do
      {
        BOOL v8 = [(BRCRelativePath *)v5 relativePath];
        uint64_t v6 = [v8 stringByAppendingPathComponent:v4];

        uint64_t v7 = [(BRCRelativePath *)v5 basePath];

        char v5 = v7;
        id v4 = (NSString *)v6;
      }
      while (![(BRCRelativePath *)v7 isRoot]);
    }

    id v4 = (NSString *)v6;
  }
  brc_mutex_unlock(&p_mutex->pthread);
  return v4;
}

- (NSString)pathRelativeToPackageRoot
{
  p_mutex = &self->_mutex;
  brc_mutex_lock(&self->_mutex.pthread);
  if (![(BRCRelativePath *)self isInPackage])
  {
    char v10 = brc_bread_crumbs();
    uint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathOfPackageRoot]();
    }
  }
  if ([(BRCRelativePath *)self isInPackage])
  {
    id v4 = self->_relativePath;
    char v5 = self->_basePath;
    if ([(BRCRelativePath *)v5 isPackageRoot])
    {
      uint64_t v6 = v4;
      uint64_t v7 = v5;
    }
    else
    {
      do
      {
        BOOL v8 = [(BRCRelativePath *)v5 relativePath];
        uint64_t v6 = [v8 stringByAppendingPathComponent:v4];

        uint64_t v7 = [(BRCRelativePath *)v5 basePath];

        char v5 = v7;
        id v4 = v6;
      }
      while (![(BRCRelativePath *)v7 isPackageRoot]);
    }
    brc_mutex_unlock(&p_mutex->pthread);
  }
  else
  {
    brc_mutex_unlock(&p_mutex->pthread);
    uint64_t v6 = 0;
  }
  return v6;
}

- (NSString)filename
{
  p_mutex = &self->_mutex;
  brc_mutex_lock(&self->_mutex.pthread);
  if (![(BRCRelativePath *)self isResolved])
  {
    BOOL v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath type]();
    }
  }
  NSUInteger v4 = [(NSString *)self->_relativePath length];
  uint64_t v5 = 24;
  if (!v4) {
    uint64_t v5 = 16;
  }
  uint64_t v6 = [*(id *)((char *)&self->super.isa + v5) lastPathComponent];
  brc_mutex_unlock(&p_mutex->pthread);
  return (NSString *)v6;
}

- (NSString)logicalName
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(BRCRelativePath *)self isFault]
    || ([(BRCRelativePath *)self filename],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = _CFURLIsPromiseName(),
        v3,
        v4))
  {
    if (![(BRCRelativePath *)self isFault])
    {
      uint64_t v9 = brc_bread_crumbs();
      char v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[BRCRelativePath logicalName]();
      }
    }
    int fd = self->_fd;
    if (fd < 0)
    {
      uint64_t v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[BRCRelativePath logicalName]();
      }

      int fd = self->_fd;
    }
    ssize_t v6 = fgetxattr(fd, "com.apple.icloud.itemName", value, 0x2FEuLL, 0, 0);
    if (v6 < 0)
    {
      uint64_t v7 = 0;
    }
    else
    {
      value[v6] = 0;
      uint64_t v7 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", value);
    }
  }
  else
  {
    uint64_t v7 = [(BRCRelativePath *)self filename];
  }
  return (NSString *)v7;
}

- (NSString)symlinkContent
{
  if (![(BRCRelativePath *)self isSymLink])
  {
    uint64_t v5 = brc_bread_crumbs();
    ssize_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath symlinkContent]();
    }
  }
  symlinkContent = self->_symlinkContent;
  return symlinkContent;
}

- (unsigned)hardlinkCount
{
  if (![(BRCRelativePath *)self exists])
  {
    int v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathWithChildAtPath:]();
    }
  }
  return self->_nlink;
}

- (unint64_t)fileID
{
  if (![(BRCRelativePath *)self exists])
  {
    int v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathWithChildAtPath:]();
    }
  }
  return self->_fileID;
}

- (BRFileObjectID)fileObjectID
{
  if (![(BRCRelativePath *)self exists])
  {
    uint64_t v5 = brc_bread_crumbs();
    ssize_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathWithChildAtPath:]();
    }
  }
  if ([(BRCRelativePath *)self isDocument]) {
    BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F594C8]) initWithDocID:self->_documentID];
  }
  else {
    BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F594E0]) initWithFileID:self->_fileID];
  }
  return (BRFileObjectID *)v3;
}

- (unint64_t)parentFileID
{
  if (![(BRCRelativePath *)self isResolved])
  {
    int v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath type]();
    }
  }
  return self->_parentFileID;
}

- (BRFileObjectID)parentFileObjectID
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F594E0]) initWithFileID:self->_parentFileID];
  return (BRFileObjectID *)v2;
}

- (unsigned)documentID
{
  if (![(BRCRelativePath *)self exists])
  {
    int v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathWithChildAtPath:]();
    }
  }
  return self->_documentID;
}

- (int)deviceID
{
  if (![(BRCRelativePath *)self isResolved])
  {
    int v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath type]();
    }
  }
  return self->_deviceID;
}

- (int64_t)size
{
  if (![(BRCRelativePath *)self exists])
  {
    int v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathWithChildAtPath:]();
    }
  }
  if (![(BRCRelativePath *)self isFile])
  {
    ssize_t v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath size]();
    }
  }
  return self->_size;
}

- (int64_t)birthTime
{
  if (![(BRCRelativePath *)self exists])
  {
    int v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathWithChildAtPath:]();
    }
  }
  return self->_birthtime.tv_sec;
}

- (int64_t)modificationTime
{
  if (![(BRCRelativePath *)self exists])
  {
    int v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathWithChildAtPath:]();
    }
  }
  return self->_mtime.tv_sec;
}

- (unsigned)fsGenerationID
{
  if (![(BRCRelativePath *)self exists])
  {
    int v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathWithChildAtPath:]();
    }
  }
  return self->_fsGenerationID;
}

- (BRCGenerationID)generationID
{
  if (![(BRCRelativePath *)self exists])
  {
    uint64_t v7 = brc_bread_crumbs();
    BOOL v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathWithChildAtPath:]();
    }
  }
  generationID = self->_generationID;
  if (!generationID)
  {
    int v4 = [[BRCGenerationID alloc] initWithRelativePath:self];
    uint64_t v5 = self->_generationID;
    self->_generationID = v4;

    generationID = self->_generationID;
  }
  return generationID;
}

- (BOOL)isWritable
{
  if (![(BRCRelativePath *)self exists])
  {
    int v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathWithChildAtPath:]();
    }
  }
  return (self->_mode >> 7) & 1;
}

- (BOOL)isExecutable
{
  if (![(BRCRelativePath *)self exists])
  {
    int v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathWithChildAtPath:]();
    }
  }
  return (self->_mode >> 6) & 1;
}

- (BOOL)isHiddenExtension
{
  if (![(BRCRelativePath *)self exists])
  {
    int v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathWithChildAtPath:]();
    }
  }
  return (self->_finderInfo[9] >> 4) & 1;
}

- (BOOL)isHiddenFile
{
  if (![(BRCRelativePath *)self exists])
  {
    int v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathWithChildAtPath:]();
    }
  }
  return (self->_finderInfo[8] >> 6) & 1;
}

- (BOOL)isBusy
{
  if (![(BRCRelativePath *)self exists])
  {
    int v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathWithChildAtPath:]();
    }
  }
  return (*((unsigned __int8 *)self + 191) >> 6) & 1;
}

- (BOOL)isFileWithFinderInfoAliasBit
{
  BOOL v3 = [(BRCRelativePath *)self isFile];
  if (v3) {
    LOBYTE(v3) = *((char *)self + 191) < 0;
  }
  return v3;
}

- (BOOL)isFinderAlias
{
  BOOL v3 = [(BRCRelativePath *)self isFileWithFinderInfoAliasBit];
  if (v3) {
    LOBYTE(v3) = (*((unsigned char *)self + 192) & 1) == 0;
  }
  return v3;
}

- (BOOL)isBRAlias
{
  BOOL v3 = [(BRCRelativePath *)self isFileWithFinderInfoAliasBit];
  if (v3) {
    LOBYTE(v3) = *((unsigned char *)self + 192) & 1;
  }
  return v3;
}

- (unsigned)fileType
{
  if (![(BRCRelativePath *)self exists])
  {
    int v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathWithChildAtPath:]();
    }
  }
  return bswap32(*(_DWORD *)self->_finderInfo);
}

- (BOOL)hasFinderTags
{
  if (![(BRCRelativePath *)self exists])
  {
    int v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath pathWithChildAtPath:]();
    }
  }
  return (*((unsigned __int8 *)self + 191) >> 5) & 1;
}

- (int)_resolveBasePath:(BOOL)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if ((self->_fd & 0x80000000) == 0)
  {
    v45 = brc_bread_crumbs();
    v46 = brc_default_log();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath _resolveBasePath:].cold.9();
    }
  }
  p_basePath = &self->_basePath;
  basePath = self->_basePath;
  if (basePath)
  {
    int v52 = 0;
    goto LABEL_4;
  }
  v47 = brc_bread_crumbs();
  v48 = brc_default_log();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT)) {
    -[BRCRelativePath _resolveBasePath:].cold.8();
  }

  basePath = *p_basePath;
  int v52 = 0;
  if (basePath)
  {
LABEL_4:
    while (basePath->_fd < 0)
    {
      BOOL v6 = [(BRCRelativePath *)basePath isRoot];
      basePath = *p_basePath;
      if (v6) {
        break;
      }
      if ([(BRCRelativePath *)basePath isPackageRoot])
      {
        basePath = *p_basePath;
        break;
      }
      if (self->_relativePath)
      {
        -[NSString stringByAppendingPathComponent:](self->_basePath->_relativePath, "stringByAppendingPathComponent:");
        uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        relativePath = self->_relativePath;
        self->_relativePath = v7;
      }
      objc_storeStrong((id *)&self->_basePath, (*p_basePath)->_basePath);
      basePath = *p_basePath;
    }
    if ([(BRCRelativePath *)basePath resolveAndKeepOpenMustExist:1 error:&v52])
    {
      uint64_t v9 = *p_basePath;
      if ((*p_basePath)->_fd < 0)
      {
        [(BRCRelativePath *)v9 close];
        v18 = brc_bread_crumbs();
        v19 = brc_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[BRCRelativePath _resolveBasePath:]();
        }

        return 2;
      }
      else
      {
        BOOL v10 = [(BRCRelativePath *)v9 isUnixDir];
        uint64_t v11 = *p_basePath;
        if (v10)
        {
          id v12 = [(BRCRelativePath *)v11 absolutePath];
          p_relativePath = &self->_relativePath;
          uint64_t v14 = [v12 stringByAppendingPathComponent:self->_relativePath];
          if (!objc_msgSend(v14, "br_isInPackage")
            || [(BRCRelativePath *)*p_basePath isPackageRoot]
            || [(BRCRelativePath *)*p_basePath isInPackage])
          {
            int v15 = 0;
          }
          else
          {
            long long v24 = *p_basePath;
            long long v25 = objc_msgSend(v14, "br_pathOfPackageRoot");
            if ([v12 isEqualToString:v25])
            {
              long long v26 = brc_bread_crumbs();
              v27 = brc_default_log();
              if (os_log_type_enabled(v27, (os_log_type_t)0x90u)) {
                -[BRCRelativePath _resolveBasePath:].cold.4();
              }

              uint64_t v28 = brc_bread_crumbs();
              v29 = brc_default_log();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
                -[BRCRelativePath _resolveBasePath:]();
              }

              int v15 = 62;
            }
            else
            {
              v30 = [[BRCRelativePath alloc] initWithAbsolutePath:v25 session:self->_session];
              v31 = self->_basePath;
              self->_basePath = v30;

              objc_msgSend(v14, "br_pathRelativeToPackageRoot");
              v32 = (NSString *)objc_claimAutoreleasedReturnValue();
              v33 = self->_relativePath;
              self->_relativePath = v32;

              [(BRCRelativePath *)self->_basePath resolveAndKeepOpenMustExist:1 error:&v52];
              v34 = brc_bread_crumbs();
              v35 = brc_default_log();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                v43 = *p_relativePath;
                v44 = *p_basePath;
                *(_DWORD *)buf = 138412802;
                v54 = (BRCRelativePath *)v43;
                __int16 v55 = 2112;
                *(void *)v56 = v44;
                *(_WORD *)&v56[8] = 2112;
                *(void *)&v56[10] = v34;
                _os_log_debug_impl(&dword_1D353B000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] new base for '%@' - %@%@", buf, 0x20u);
              }

              [(BRCRelativePath *)v24 close];
              if (v52)
              {
                v36 = brc_bread_crumbs();
                v37 = brc_default_log();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                {
                  v51 = *p_basePath;
                  *(_DWORD *)buf = 138412802;
                  v54 = v51;
                  __int16 v55 = 1024;
                  *(_DWORD *)v56 = v52;
                  *(_WORD *)&v56[4] = 2112;
                  *(void *)&v56[6] = v36;
                  _os_log_debug_impl(&dword_1D353B000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] can't resolve package root %@ %{errno}d%@", buf, 0x1Cu);
                }

                int v15 = v52;
              }
              else
              {
                v38 = *p_basePath;
                if ((*p_basePath)->_fd < 0)
                {
                  [(BRCRelativePath *)v38 close];
                  v39 = brc_bread_crumbs();
                  v40 = brc_default_log();
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
                    -[BRCRelativePath _resolveBasePath:].cold.5();
                  }

                  int v15 = 2;
                }
                else if ([(BRCRelativePath *)v38 isUnixDir])
                {
                  int v15 = 0;
                }
                else
                {
                  [(BRCRelativePath *)*p_basePath close];
                  v41 = brc_bread_crumbs();
                  v42 = brc_default_log();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
                    -[BRCRelativePath _resolveBasePath:].cold.6();
                  }

                  int v15 = 20;
                }
              }
            }
          }
        }
        else
        {
          [(BRCRelativePath *)v11 close];
          v20 = brc_bread_crumbs();
          v21 = brc_default_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            -[BRCRelativePath _resolveBasePath:].cold.7();
          }

          return 20;
        }
      }
    }
    else
    {
      v16 = brc_bread_crumbs();
      v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        long long v23 = *p_basePath;
        *(_DWORD *)buf = 138412802;
        v54 = v23;
        __int16 v55 = 1024;
        *(_DWORD *)v56 = v52;
        *(_WORD *)&v56[4] = 2112;
        *(void *)&v56[6] = v16;
        _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] can't resolve base path %@ %{errno}d%@", buf, 0x1Cu);
      }

      return v52;
    }
  }
  else
  {
    v49 = brc_bread_crumbs();
    v50 = brc_default_log();
    if (os_log_type_enabled(v50, (os_log_type_t)0x90u)) {
      -[BRCRelativePath _resolveBasePath:]();
    }

    return 22;
  }
  return v15;
}

- (int)_resolvePathTypeAndContainer
{
  id v10 = 0;
  if ([(BRCRelativePath *)self isInPackage])
  {
    BOOL v3 = [(BRCRelativePath *)self pathOfPackageRoot];
    self->_type = [v3 type];
    self->_itemScope = [v3 itemScope];
    id v4 = [v3 appLibrary];
    id v10 = v4;

LABEL_6:
    [(BRCRelativePath *)self setAppLibrary:v4];
    int v6 = 0;
    goto LABEL_7;
  }
  session = self->_session;
  if (!session)
  {
    BOOL v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath _initWithPath:relativeToRoot:]();
    }

    session = self->_session;
  }
  int v6 = [(BRCAccountSession *)session resolvePathAdditionalMetadata:self appLibrary:&v10];
  if (!v6)
  {
    id v4 = v10;
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

- (BOOL)_resolveRootWhenExists:(BOOL)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!self->_roots) {
    return 1;
  }
  BOOL v3 = a3;
  if ([(BRCRelativePath *)self isResolved]) {
    return 1;
  }
  if (self->_relativePath)
  {
    v34 = brc_bread_crumbs();
    v35 = brc_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath _resolveRootWhenExists:].cold.4();
    }
  }
  p_basePath = (id *)&self->_basePath;
  if (self->_basePath)
  {
    v36 = brc_bread_crumbs();
    v37 = brc_default_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath _resolveRootWhenExists:]();
    }
  }
  absolutePath = self->_absolutePath;
  if (v3)
  {
    BOOL v8 = absolutePath;
  }
  else
  {
    BOOL v8 = [(NSString *)absolutePath br_realpath];
  }
  uint64_t v9 = v8;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v10 = self->_roots;
  uint64_t v11 = [(NSSet *)v10 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v16 = [v15 absolutePath];
        v17 = [(NSString *)v9 br_pathRelativeToPath:v16];

        if (v17)
        {
          objc_storeStrong((id *)&self->_basePath, v15);
          int v38 = 0;
          if ([(BRCRelativePath *)self _shouldKeepBasePathOpenWithoutOpenedFD]
            && ([*p_basePath resolveAndKeepOpenMustExist:1 error:&v38] & 1) == 0)
          {
            v18 = brc_bread_crumbs();
            v19 = brc_default_log();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              v33 = (NSString *)*p_basePath;
              *(_DWORD *)buf = 138412802;
              v44 = v33;
              __int16 v45 = 1024;
              *(_DWORD *)v46 = v38;
              *(_WORD *)&v46[4] = 2112;
              *(void *)&v46[6] = v18;
              _os_log_debug_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] can't open %@' %{errno}d%@", buf, 0x1Cu);
            }

            v20 = brc_bread_crumbs();
            v21 = brc_default_log();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
              -[BRCRelativePath _resolveRootWhenExists:]();
            }
          }
          if (([*p_basePath resolveAndKeepOpenMustExist:1 error:&v38] & 1) == 0)
          {
            v22 = brc_bread_crumbs();
            long long v23 = brc_default_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              v32 = (NSString *)*p_basePath;
              *(_DWORD *)buf = 138412802;
              v44 = v32;
              __int16 v45 = 1024;
              *(_DWORD *)v46 = v38;
              *(_WORD *)&v46[4] = 2112;
              *(void *)&v46[6] = v22;
              _os_log_debug_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] can't open %@' %{errno}d%@", buf, 0x1Cu);
            }

            long long v24 = brc_bread_crumbs();
            long long v25 = brc_default_log();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
              -[BRCRelativePath _resolveRootWhenExists:]();
            }
          }
          goto LABEL_31;
        }
      }
      uint64_t v12 = [(NSSet *)v10 countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_31:

  id v26 = *p_basePath;
  BOOL v5 = *p_basePath != 0;
  if (!v26)
  {
    v27 = brc_bread_crumbs();
    uint64_t v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      roots = self->_roots;
      v30 = self->_absolutePath;
      *(_DWORD *)buf = 138412802;
      v44 = v30;
      __int16 v45 = 2112;
      *(void *)v46 = roots;
      *(_WORD *)&v46[8] = 2112;
      *(void *)&v46[10] = v27;
      _os_log_debug_impl(&dword_1D353B000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] resolved-path:'%@' outside of requested roots:'%@'%@", buf, 0x20u);
    }
  }
  return v5;
}

- (BOOL)_fixupRelativePath
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_relativePath = (id *)&self->_relativePath;
  relativePath = self->_relativePath;
  if (!relativePath) {
    relativePath = self->_absolutePath;
  }
  BOOL v5 = relativePath;
  basePath = self->_basePath;
  if (basePath)
  {
    absolutePath = self->_absolutePath;
    id v8 = [(BRCRelativePath *)basePath absolutePath];
    uint64_t v9 = [(NSString *)absolutePath br_pathRelativeToPath:v8];
    id v10 = self->_relativePath;
    self->_relativePath = v9;
  }
  else
  {
    id v8 = *p_relativePath;
    id *p_relativePath = &stru_1F2AC7720;
  }

  if (*p_relativePath) {
    goto LABEL_12;
  }
  uint64_t v11 = brc_bread_crumbs();
  uint64_t v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = self->_absolutePath;
    uint64_t v14 = [(BRCRelativePath *)self->_basePath absolutePath];
    int v17 = 138412802;
    v18 = v13;
    __int16 v19 = 2112;
    v20 = v14;
    __int16 v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEFAULT, "[NOTICE] resolved-path:'%@' outside of base path:'%@'%@", (uint8_t *)&v17, 0x20u);
  }
  if (([(NSString *)v5 br_isAbsolutePath] & 1) == 0)
  {
    objc_storeStrong(p_relativePath, relativePath);
LABEL_12:
    BOOL v15 = 1;
    goto LABEL_13;
  }
  BOOL v15 = 0;
LABEL_13:

  return v15;
}

- (int)_resolveWhenExists
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  int fd = self->_fd;
  if (fd < 0)
  {
    v66 = brc_bread_crumbs();
    v67 = brc_default_log();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath logicalName]();
    }

    int fd = self->_fd;
  }
  long long v69 = xmmword_1D3887528;
  uint64_t v70 = 513;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v82 = 0u;
  memset(v81, 0, sizeof(v81));
  if (fgetattrlist(fd, &v69, v81, 0x47CuLL, 0x20u) < 0)
  {
    int v14 = *__error();
    BOOL v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
    {
      int v48 = self->_fd;
      relativePath = self->_relativePath;
      if (!relativePath) {
        relativePath = self->_absolutePath;
      }
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v72 = v48;
      *(_WORD *)&v72[4] = 2112;
      *(void *)&v72[6] = relativePath;
      *(_WORD *)&v72[14] = 1024;
      *(_DWORD *)&v72[16] = v14;
      *(_WORD *)&v72[20] = 2112;
      *(void *)&v72[22] = v15;
      _os_log_error_impl(&dword_1D353B000, v16, (os_log_type_t)0x90u, "[ERROR] fgetattrlist(%d) at '%@' failed %{errno}d%@", buf, 0x22u);
    }

    *__error() = v14;
    return *__error();
  }
  else
  {
    int v4 = WORD4(v81[4]) & 0xF000;
    if (v4 != 0x4000 && v4 != 0x8000 && v4 != 40960)
    {
      long long v39 = brc_bread_crumbs();
      long long v40 = brc_default_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        int v51 = aPcDBLSW[WORD4(v81[4]) >> 12];
        *(_DWORD *)buf = 67111938;
        if ((WORD4(v81[4]) & 0x100) != 0) {
          int v52 = 114;
        }
        else {
          int v52 = 45;
        }
        *(_DWORD *)v72 = v51;
        *(_WORD *)&v72[4] = 1024;
        if ((BYTE8(v81[4]) & 0x80) != 0) {
          int v53 = 119;
        }
        else {
          int v53 = 45;
        }
        *(_DWORD *)&v72[6] = v52;
        *(_WORD *)&v72[10] = 1024;
        if ((BYTE8(v81[4]) & 0x40) != 0) {
          int v54 = 120;
        }
        else {
          int v54 = 45;
        }
        *(_DWORD *)&v72[12] = v53;
        if ((BYTE8(v81[4]) & 0x20) != 0) {
          int v55 = 114;
        }
        else {
          int v55 = 45;
        }
        *(_WORD *)&v72[16] = 1024;
        if ((BYTE8(v81[4]) & 0x10) != 0) {
          int v56 = 119;
        }
        else {
          int v56 = 45;
        }
        *(_DWORD *)&v72[18] = v54;
        if ((BYTE8(v81[4]) & 8) != 0) {
          int v57 = 120;
        }
        else {
          int v57 = 45;
        }
        *(_WORD *)&v72[22] = 1024;
        if ((BYTE8(v81[4]) & 4) != 0) {
          int v58 = 114;
        }
        else {
          int v58 = 45;
        }
        *(_DWORD *)&v72[24] = v55;
        if ((BYTE8(v81[4]) & 2) != 0) {
          int v59 = 119;
        }
        else {
          int v59 = 45;
        }
        *(_WORD *)&v72[28] = 1024;
        if (BYTE8(v81[4])) {
          int v60 = 120;
        }
        else {
          int v60 = 45;
        }
        *(_DWORD *)&v72[30] = v56;
        *(_WORD *)&v72[34] = 1024;
        *(_DWORD *)&v72[36] = v57;
        __int16 v73 = 1024;
        *(_DWORD *)v74 = v58;
        *(_WORD *)&v74[4] = 1024;
        *(_DWORD *)&v74[6] = v59;
        __int16 v75 = 1024;
        int v76 = v60;
        __int16 v77 = 2112;
        v78 = self;
        __int16 v79 = 2112;
        v80 = v39;
        _os_log_debug_impl(&dword_1D353B000, v40, OS_LOG_TYPE_DEBUG, "[DEBUG] Inappropriate file type %c%c%c%c%c%c%c%c%c%c for %@%@", buf, 0x52u);
      }

      goto LABEL_41;
    }
    if (v4 != 40960 && !v82 || BRCIsBusyDate(*((uint64_t *)&v81[0] + 1)))
    {
      BOOL v5 = brc_bread_crumbs();
      int v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        absolutePath = self->_relativePath;
        if (!absolutePath) {
          absolutePath = self->_absolutePath;
        }
        *(_DWORD *)buf = 138413570;
        *(void *)v72 = absolutePath;
        *(_WORD *)&v72[8] = 2048;
        *(void *)&v72[10] = *((void *)&v82 + 1);
        *(_WORD *)&v72[18] = 1024;
        *(_DWORD *)&v72[20] = DWORD1(v82);
        *(_WORD *)&v72[24] = 1024;
        *(_DWORD *)&v72[26] = v82;
        *(_WORD *)&v72[30] = 2048;
        *(void *)&v72[32] = *((void *)&v81[0] + 1);
        __int16 v73 = 2112;
        *(void *)v74 = v5;
        _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Busy file at '%@' fileID:%llu docID:%u gen:%u bt:%llu%@", buf, 0x36u);
      }

      *((unsigned char *)self + 191) |= 0x40u;
    }
    int v7 = BRCIsLegacyUbiquityFault(self->_fd, SBYTE12(v81[4]), SWORD4(v81[4]), (_DWORD *)&v81[2] + 2);
    id v8 = (char *)&v83 + SDWORD2(v83) + 8;
    if (v7)
    {
      int v9 = v7;
      basePath = self->_basePath;
      if (basePath && (uint64_t v11 = self->_relativePath) != 0)
      {
        int v12 = basePath->_fd;
        uint64_t v13 = v11;
      }
      else
      {
        objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", (char *)&v83 + SDWORD2(v83) + 8);
        uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue();
        int v12 = -1;
      }
      if ((BRCUnlinkAt(v12, v13, ((WORD4(v81[4]) & 0xF000) == 0x4000) << 7) & 0x80000000) != 0)
      {
        int v41 = *__error();
        long long v42 = brc_bread_crumbs();
        v43 = brc_default_log();
        if (os_log_type_enabled(v43, (os_log_type_t)0x90u))
        {
          v61 = "UF_COMPRESSED";
          *(_DWORD *)buf = 136315906;
          if (v9 == 2) {
            v61 = "brok";
          }
          *(void *)v72 = v61;
          *(_WORD *)&v72[8] = 2080;
          *(void *)&v72[10] = v8;
          *(_WORD *)&v72[18] = 1024;
          *(_DWORD *)&v72[20] = v41;
          *(_WORD *)&v72[24] = 2112;
          *(void *)&v72[26] = v42;
          _os_log_error_impl(&dword_1D353B000, v43, (os_log_type_t)0x90u, "[ERROR] failed to unlink legacy ubiquity %s fault at '%s' %{errno}d%@", buf, 0x26u);
        }

        *__error() = v41;
      }
      else
      {
        v18 = brc_bread_crumbs();
        __int16 v19 = brc_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = "UF_COMPRESSED";
          *(_DWORD *)buf = 136315650;
          if (v9 == 2) {
            v20 = "brok";
          }
          *(void *)v72 = v20;
          *(_WORD *)&v72[8] = 2080;
          *(void *)&v72[10] = v8;
          *(_WORD *)&v72[18] = 2112;
          *(void *)&v72[20] = v18;
          _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEFAULT, "[NOTICE] cleaned up legacy ubiquity %s fault at '%s'%@", buf, 0x20u);
        }
      }
      return 14;
    }
    self->_deviceID = DWORD1(v81[0]);
    self->_fileID = *((void *)&v82 + 1);
    unsigned __int16 v21 = WORD4(v81[4]);
    self->_flags = HIDWORD(v81[4]);
    *(int32x2_t *)&self->_documentID = vrev64_s32(*(int32x2_t *)&v82);
    self->_mode = v21;
    int busy = BRCIsBusyDate(*((uint64_t *)&v81[0] + 1));
    __int16 v23 = WORD4(v81[4]);
    if (busy && (WORD4(v81[4]) & 0xF000) == 0x4000 && (*((unsigned char *)self + 191) & 0xA) == 0)
    {
      time_t v24 = time(0);
      time_t v25 = *((void *)&v81[1] + 1);
      if (v24 < *((uint64_t *)&v81[1] + 1)) {
        time_t v25 = time(0);
      }
      *((void *)&v81[0] + 1) = v25;
      __int16 v23 = WORD4(v81[4]);
    }
    timespec v26 = *(timespec *)((char *)&v81[1] + 8);
    self->_birthtime = *(timespec *)((char *)v81 + 8);
    self->_mtime = v26;
    unint64_t v27 = v83;
    int64_t v28 = *(void *)((char *)&v84 + 4);
    BOOL v29 = (v23 & 0xF000) == 0x8000;
    unsigned int v30 = v84;
    if (!v29)
    {
      int64_t v28 = 0;
      unsigned int v30 = 1;
    }
    self->_size = v28;
    self->_parentFileID = v27;
    self->_nlink = v30;
    objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", v8);
    v31 = (NSString *)objc_claimAutoreleasedReturnValue();
    v32 = self->_absolutePath;
    self->_absolutePath = v31;

    long long v33 = *(_OWORD *)((char *)&v81[3] + 8);
    *(_OWORD *)self->_finderInfo = *(_OWORD *)((char *)&v81[2] + 8);
    *(_OWORD *)&self->_finderInfo[16] = v33;
    unsigned int v34 = LOBYTE(v81[3]);
    char v35 = v81[3] & 0x80 | *((unsigned char *)self + 191) & 0x7F;
    *((unsigned char *)self + 191) = v35;
    if ((WORD4(v81[4]) & 0xF000) == 0x4000) {
      *((unsigned char *)self + 191) = v35 & 0xFB | (v34 >> 3) & 4;
    }
    if (![(BRCRelativePath *)self _resolveRootWhenExists:1]) {
      goto LABEL_41;
    }
    v36 = self->_basePath;
    if (v36 && (int v37 = DWORD1(v81[0]), v37 != [(BRCRelativePath *)v36 deviceID]))
    {
      v44 = brc_bread_crumbs();
      __int16 v45 = brc_default_log();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        int v46 = [(BRCRelativePath *)self->_basePath deviceID];
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v72 = v46;
        *(_WORD *)&v72[4] = 1024;
        *(_DWORD *)&v72[6] = DWORD1(v81[0]);
        *(_WORD *)&v72[10] = 2112;
        *(void *)&v72[12] = self;
        *(_WORD *)&v72[20] = 2112;
        *(void *)&v72[22] = v44;
        _os_log_impl(&dword_1D353B000, v45, OS_LOG_TYPE_DEFAULT, "[NOTICE] root-dev:%d != dev:%d %@%@", buf, 0x22u);
      }

      return 18;
    }
    else
    {
      if ((BYTE1(v81[3]) & 0xE) != 0) {
        LOBYTE(v38) = *((unsigned char *)self + 191) | 0x20;
      }
      else {
        int v38 = *((unsigned char *)self + 191) & 0xDF | (32
      }
                                             * (fgetxattr(self->_fd, "com.apple.metadata:_kMDItemUserTags", 0, 0, 0, 0) > 0));
      *((unsigned char *)self + 191) = v38;
      if (![(BRCRelativePath *)self _fixupRelativePath]) {
        return 33;
      }
      int result = [(BRCRelativePath *)self _resolvePathTypeAndContainer];
      if (!result)
      {
        int v47 = *((char *)self + 191);
        if ((v47 & 0x80000000) == 0) {
          return 0;
        }
        if ((v47 & 2) != 0)
        {
          v62 = brc_bread_crumbs();
          v63 = brc_default_log();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
            -[BRCRelativePath _resolveWhenExists]();
          }
          goto LABEL_98;
        }
        if ((WORD4(v81[4]) & 0xF000) == 0x4000)
        {
          v62 = brc_bread_crumbs();
          v63 = brc_default_log();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
            -[BRCRelativePath _resolveWhenExists]();
          }
LABEL_98:

          goto LABEL_41;
        }
        if (fgetxattr(self->_fd, "com.apple.clouddocs.security", 0, 0, 0, 0) == -1)
        {
          if (*__error() == 93)
          {
            int result = 0;
            *((unsigned char *)self + 192) &= ~1u;
            return result;
          }
          v62 = brc_bread_crumbs();
          v63 = brc_default_log();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            int v68 = *__error();
            *(_DWORD *)buf = 136315650;
            *(void *)v72 = v8;
            *(_WORD *)&v72[8] = 1024;
            *(_DWORD *)&v72[10] = v68;
            *(_WORD *)&v72[14] = 2112;
            *(void *)&v72[16] = v62;
            _os_log_impl(&dword_1D353B000, v63, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't read xattr at '%s' %{errno}d%@", buf, 0x1Cu);
          }
          goto LABEL_98;
        }
        *((unsigned char *)self + 192) |= 1u;
        v64 = [[BRCBookmark alloc] initWithRelpath:self];
        bookmark = self->_bookmark;
        self->_bookmark = v64;

        if (self->_bookmark) {
          return 0;
        }
LABEL_41:
        *((unsigned char *)self + 191) |= 1u;
        return 45;
      }
    }
  }
  return result;
}

- (int)_resolveWhenDoesntExist
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if ((self->_fd & 0x80000000) == 0)
  {
    unsigned int v30 = brc_bread_crumbs();
    v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath _resolveBasePath:].cold.9();
    }
  }
  basePath = self->_basePath;
  if (basePath && basePath->_fd < 0)
  {
    v32 = brc_bread_crumbs();
    long long v33 = brc_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath _resolveWhenDoesntExist]();
    }
  }
  if ([(BRCRelativePath *)self _resolveRootWhenExists:0])
  {
    if (!self->_basePath || (p_absolutePath = &self->_relativePath, (absolutePath = self->_relativePath) == 0))
    {
      p_absolutePath = &self->_absolutePath;
      absolutePath = self->_absolutePath;
    }
    int v6 = [(NSString *)absolutePath stringByDeletingLastPathComponent];
    int v7 = [(NSString *)*p_absolutePath lastPathComponent];
    id v8 = self->_basePath;
    if (!v8)
    {
      uint64_t v35 = 0;
      long long v34 = xmmword_1D3887540;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      memset(v40, 0, sizeof(v40));
      goto LABEL_20;
    }
    if (self->_relativePath)
    {
      int v9 = [v6 isEqualToString:&stru_1F2AC7720];
      id v8 = self->_basePath;
      if (v9)
      {
        self->_parentFileID = v8->_fileID;
        self->_deviceID = v8->_deviceID;
        id v10 = [(NSString *)v8->_absolutePath stringByAppendingPathComponent:self->_relativePath];
        uint64_t v11 = self->_absolutePath;
        self->_absolutePath = v10;

        goto LABEL_23;
      }
      uint64_t v35 = 0;
      long long v34 = xmmword_1D3887540;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      memset(v40, 0, sizeof(v40));
      if (!v8) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v35 = 0;
      long long v34 = xmmword_1D3887540;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      memset(v40, 0, sizeof(v40));
    }
    if (self->_relativePath)
    {
      int fd = v8->_fd;
      id v14 = v6;
      if (getattrlistat(fd, (const char *)objc_msgSend(v14, "br_fileSystemRepresentation", v34, v35), &v34, v40, 0x41CuLL, 0x21uLL) < 0)
      {
        int v12 = *__error();
        BOOL v15 = brc_bread_crumbs();
        v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          int v17 = self->_basePath->_fd;
          uint64_t v18 = objc_msgSend(v14, "br_fileSystemRepresentation");
          __int16 v19 = strerror(v12);
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)int v37 = v17;
          *(_WORD *)&v37[4] = 2080;
          *(void *)&v37[6] = v18;
          *(_WORD *)&v37[14] = 2080;
          *(void *)&v37[16] = v19;
          __int16 v38 = 1024;
          LODWORD(v39[0]) = v12;
          WORD2(v39[0]) = 2112;
          *(void *)((char *)v39 + 6) = v15;
          v20 = "[DEBUG] getattrlistat(%d, %s) failed with %s(%d)%@";
          unsigned __int16 v21 = v16;
          uint32_t v22 = 44;
LABEL_34:
          _os_log_debug_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEBUG, v20, buf, v22);
          goto LABEL_30;
        }
        goto LABEL_30;
      }
      goto LABEL_21;
    }
LABEL_20:
    id v23 = v6;
    if (getattrlist((const char *)objc_msgSend(v23, "fileSystemRepresentation", v34, v35), &v34, v40, 0x41CuLL, 0x21u) < 0)
    {
      int v12 = *__error();
      BOOL v15 = brc_bread_crumbs();
      v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v28 = [v23 fileSystemRepresentation];
        BOOL v29 = strerror(v12);
        *(_DWORD *)buf = 136315906;
        *(void *)int v37 = v28;
        *(_WORD *)&v37[8] = 2080;
        *(void *)&v37[10] = v29;
        *(_WORD *)&v37[18] = 1024;
        *(_DWORD *)&v37[20] = v12;
        __int16 v38 = 2112;
        v39[0] = v15;
        v20 = "[DEBUG] getattrlist(%s) failed with %s(%d)%@";
        unsigned __int16 v21 = v16;
        uint32_t v22 = 38;
        goto LABEL_34;
      }
LABEL_30:

LABEL_31:
      return v12;
    }
LABEL_21:
    if (DWORD2(v40[0]) == 2)
    {
      self->_parentFileID = *(void *)((char *)v40 + 12);
      self->_deviceID = DWORD1(v40[0]);
      time_t v24 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", (char *)&v40[1] + SDWORD1(v40[1]) + 4);
      time_t v25 = [v24 stringByAppendingPathComponent:v7];
      timespec v26 = self->_absolutePath;
      self->_absolutePath = v25;

LABEL_23:
      if ([(BRCRelativePath *)self _fixupRelativePath]) {
        int v12 = [(BRCRelativePath *)self _resolvePathTypeAndContainer];
      }
      else {
        int v12 = 33;
      }
      goto LABEL_31;
    }
    BOOL v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[BRCRelativePath _resolveWhenDoesntExist]();
    }
    int v12 = 20;
    goto LABEL_30;
  }
  *((unsigned char *)self + 191) |= 1u;
  return 2;
}

- (int)_resolveSymlinkRelativeTo:(int)a3 path:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  int v25 = 0;
  uint64_t v24 = 0;
  long long v22 = xmmword_1D3887558;
  uint64_t v23 = 0;
  BOOL v5 = [v4 pathComponents];
  int v6 = [v5 reverseObjectEnumerator];
  int v7 = [v6 allObjects];
  id v8 = (void *)[v7 mutableCopy];

  if (![v8 count])
  {
LABEL_17:
    int v17 = 0;
    goto LABEL_24;
  }
  int v20 = 0;
  unint64_t v9 = 0;
  while (1)
  {
    id v10 = [v8 lastObject];
    [v8 removeLastObject];
    if ([v10 isEqualToString:@".."])
    {
      if (!v9) {
        goto LABEL_18;
      }
      do
        uint64_t v11 = &v27[--v9];
      while (*(v11 - 1) != 47);
      v27[v9 - 1] = 0;
      goto LABEL_16;
    }
    unint64_t v12 = v9
        + snprintf(&v27[v9 - 1], v9 - 1025, "/%s", (const char *)[v10 fileSystemRepresentation]);
    if (v12 > 0x400)
    {
      int v17 = 63;
      goto LABEL_23;
    }
    if (getattrlistat(a3, v27, &v22, &v24, 0xCuLL, 0x21uLL) < 0) {
      goto LABEL_19;
    }
    if (HIDWORD(v24) != self->_deviceID)
    {
      int v17 = 18;
      goto LABEL_23;
    }
    if (v25 != 5)
    {
      unint64_t v9 = v12;
      goto LABEL_16;
    }
    if (v20 > 31) {
      break;
    }
    if ((BRCReadlinkAt(a3, v27, v28, 1024) & 0x80000000) != 0)
    {
LABEL_19:
      int v17 = *__error();
      goto LABEL_23;
    }
    if (v28[0] == 47)
    {
LABEL_18:
      int v17 = 45;
      goto LABEL_23;
    }
    ++v20;
    v27[v9 - 1] = 0;
    uint64_t v13 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", v28);

    id v14 = [v13 pathComponents];
    BOOL v15 = [v14 reverseObjectEnumerator];
    v16 = [v15 allObjects];
    [v8 addObjectsFromArray:v16];

    id v4 = v13;
LABEL_16:

    if (![v8 count]) {
      goto LABEL_17;
    }
  }
  int v17 = 62;
LABEL_23:

LABEL_24:
  return v17;
}

- (BOOL)_resolveAndKeepOpenMustExist:(BOOL)a3 allowResolveInPkg:(BOOL)a4 error:(int *)a5
{
  uint64_t v168 = *MEMORY[0x1E4F143B8];
  int v164 = 0;
  if ((self->_fd & 0x80000000) == 0)
  {
    BOOL v6 = 1;
    if ((int)atomic_fetch_add(&self->_openRefCount, 1u) <= -2)
    {
      int v7 = brc_bread_crumbs();
      id v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:]();
      }

      return 1;
    }
    return v6;
  }
  BOOL v10 = a4;
  BOOL v11 = a3;
  if ([(BRCRelativePath *)self isResolved] && ![(BRCRelativePath *)self exists] && v11)
  {
    BOOL v6 = 0;
    if (a5) {
      *a5 = 2;
    }
    return v6;
  }
  LODWORD(v12) = [(BRCRelativePath *)self _shouldKeepBasePathOpen];
  if (v12) {
    [(BRCRelativePath *)self->_basePath resolveAndKeepOpenMustExist:1 error:0];
  }
  if (!self->_basePath
    || (int v13 = [(BRCRelativePath *)self _resolveBasePath:v10], (v164 = v13) == 0))
  {
    relativePath = self->_relativePath;
    if (relativePath)
    {
      basePath = self->_basePath;
      if (basePath)
      {
        if (basePath->_fd < 0)
        {
          v139 = brc_bread_crumbs();
          v140 = brc_default_log();
          if (os_log_type_enabled(v140, OS_LOG_TYPE_FAULT)) {
            -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:]7();
          }

          relativePath = self->_relativePath;
        }
        if ([(NSString *)relativePath length])
        {
          buf[0] = 0;
          int ProtectionStatus = BRCOpenAtAndGetProtectionStatus(self->_basePath->_fd, [(NSString *)self->_relativePath fileSystemRepresentation], 2129924, 0, buf);
          self->_int fd = ProtectionStatus;
          if (buf[0]) {
            *((unsigned char *)self + 192) |= 0x10u;
          }
        }
        else
        {
          int ProtectionStatus = dup(self->_basePath->_fd);
          self->_int fd = ProtectionStatus;
        }
        if (ProtectionStatus < 0)
        {
          if (*__error() <= 0)
          {
            v146 = brc_bread_crumbs();
            v147 = brc_default_log();
            if (os_log_type_enabled(v147, OS_LOG_TYPE_FAULT)) {
              -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:]1();
            }
          }
          int v45 = *__error();
          if (!v45) {
            int v45 = 22;
          }
          int v164 = v45;
          if (v45 == 2)
          {
            unsigned int v30 = brc_bread_crumbs();
            v31 = brc_default_log();
            if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_48;
            }
            v131 = self->_relativePath;
            int fd = self->_basePath->_fd;
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v167 = fd;
            *(_WORD *)&v167[4] = 2112;
            *(void *)&v167[6] = v131;
            *(_WORD *)&v167[14] = 1024;
            *(_DWORD *)&v167[16] = v164;
            *(_WORD *)&v167[20] = 2112;
            *(void *)&v167[22] = v30;
            long long v33 = "[DEBUG] openat(%d, '%@') failed %{errno}d%@";
            long long v34 = v31;
            uint32_t v35 = 34;
            goto LABEL_195;
          }
          int v49 = *__error();
          long long v50 = brc_bread_crumbs();
          long long v51 = brc_default_log();
          if (!os_log_type_enabled(v51, (os_log_type_t)0x90u)) {
            goto LABEL_59;
          }
          long long v52 = self->_relativePath;
          int v53 = self->_basePath->_fd;
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v167 = v53;
          *(_WORD *)&v167[4] = 2112;
          *(void *)&v167[6] = v52;
          *(_WORD *)&v167[14] = 1024;
          *(_DWORD *)&v167[16] = v49;
          *(_WORD *)&v167[20] = 2112;
          *(void *)&v167[22] = v50;
          long long v54 = "[ERROR] openat(%d, '%@') failed %{errno}d%@";
          long long v55 = v51;
          uint32_t v56 = 34;
LABEL_197:
          _os_log_error_impl(&dword_1D353B000, v55, (os_log_type_t)0x90u, v54, buf, v56);
LABEL_59:

          *__error() = v49;
          goto LABEL_67;
        }
        goto LABEL_67;
      }
    }
    absolutePath = self->_absolutePath;
    if (absolutePath)
    {
      if (([(NSString *)absolutePath br_isAbsolutePath] & 1) == 0)
      {
        v141 = brc_bread_crumbs();
        v142 = brc_default_log();
        if (os_log_type_enabled(v142, OS_LOG_TYPE_FAULT)) {
          -[BRCRelativePath isResolved]();
        }
      }
      long long v22 = [(NSString *)self->_absolutePath fileSystemRepresentation];
      int v28 = BRCOpenAt(0xFFFFFFFFLL, v22, 32772, v23, v24, v25, v26, v27, v154);
      self->_int fd = v28;
      if (v28 < 0)
      {
        if (*__error() <= 0)
        {
          v148 = brc_bread_crumbs();
          v149 = brc_default_log();
          if (os_log_type_enabled(v149, OS_LOG_TYPE_FAULT)) {
            -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:]1();
          }
        }
        unsigned int v29 = *__error();
        if (!v29) {
          unsigned int v29 = 22;
        }
        int v164 = v29;
        if (v29 <= 2)
        {
          unsigned int v30 = brc_bread_crumbs();
          v31 = brc_default_log();
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
LABEL_48:

            goto LABEL_67;
          }
          v32 = self->_absolutePath;
          *(_DWORD *)buf = 138412802;
          *(void *)v167 = v32;
          *(_WORD *)&v167[8] = 1024;
          *(_DWORD *)&v167[10] = v164;
          *(_WORD *)&v167[14] = 2112;
          *(void *)&v167[16] = v30;
          long long v33 = "[DEBUG] open('%@') failed %{errno}d%@";
          long long v34 = v31;
          uint32_t v35 = 28;
LABEL_195:
          _os_log_debug_impl(&dword_1D353B000, v34, OS_LOG_TYPE_DEBUG, v33, buf, v35);
          goto LABEL_48;
        }
        int v49 = *__error();
        long long v50 = brc_bread_crumbs();
        long long v51 = brc_default_log();
        if (!os_log_type_enabled(v51, (os_log_type_t)0x90u)) {
          goto LABEL_59;
        }
        v133 = self->_absolutePath;
        *(_DWORD *)buf = 138412802;
        *(void *)v167 = v133;
        *(_WORD *)&v167[8] = 1024;
        *(_DWORD *)&v167[10] = v49;
        *(_WORD *)&v167[14] = 2112;
        *(void *)&v167[16] = v50;
        long long v54 = "[ERROR] open('%@') failed %{errno}d%@";
        long long v55 = v51;
        uint32_t v56 = 28;
        goto LABEL_197;
      }
LABEL_67:
      long long v60 = self->_basePath;
      if (v60)
      {
        char v61 = *((unsigned char *)v60 + 191);
        if ((v61 & 2) != 0)
        {
          long long v63 = (char *)self + 191;
          char v62 = *((unsigned char *)self + 191);
        }
        else
        {
          long long v63 = (char *)self + 191;
          char v62 = *((unsigned char *)self + 191);
          if ((v61 & 8) == 0)
          {
            char v64 = 0;
            goto LABEL_74;
          }
        }
        char v64 = 2;
      }
      else
      {
        char v64 = 0;
        long long v63 = (char *)self + 191;
        char v62 = *((unsigned char *)self + 191);
      }
LABEL_74:
      *((unsigned char *)self + 191) = v64 | v62 & 0xFD;
      long long v65 = self->_relativePath;
      if (!v65) {
        long long v65 = self->_absolutePath;
      }
      v16 = v65;
      if (self->_fd < 0)
      {
        int v67 = v164;
        char v68 = v164 != 2 || v11;
        if (v68)
        {
          self->_int fd = -v164;
        }
        else
        {
          int v67 = [(BRCRelativePath *)self _resolveWhenDoesntExist];
          int v164 = v67;
        }
        long long v69 = self->_basePath;
        if (v69 && (*((unsigned char *)v69 + 191) & 0xA) == 0)
        {
          [(BRCRelativePath *)self->_basePath close];
          if (v164) {
            goto LABEL_89;
          }
        }
        else
        {
          LOBYTE(v12) = 1;
          if (v67) {
            goto LABEL_89;
          }
        }
      }
      else
      {
        long long v66 = self;
        if ((int)atomic_fetch_add(&v66->_openRefCount, 1u) <= -2)
        {
          v137 = brc_bread_crumbs();
          v138 = brc_default_log();
          if (os_log_type_enabled(v138, OS_LOG_TYPE_FAULT)) {
            -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:]();
          }
        }
        int v164 = [(BRCRelativePath *)v66 _resolveWhenExists];
        if (v164)
        {
          [(BRCRelativePath *)v66 _close];
LABEL_89:
          id v14 = 0;
          BOOL v15 = 0;
          id v17 = 0;
          goto LABEL_151;
        }
      }
      int v70 = [(NSString *)v16 br_isAbsolutePath];
      uint64_t v71 = 24;
      if (v70) {
        uint64_t v71 = 16;
      }
      id v17 = *(id *)((char *)&self->super.isa + v71);
      if (([v17 isEqualToString:v16] & 1) == 0)
      {
        v72 = brc_bread_crumbs();
        __int16 v73 = brc_default_log();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)v167 = v16;
          *(_WORD *)&v167[8] = 2112;
          *(void *)&v167[10] = self;
          *(_WORD *)&v167[18] = 2112;
          *(void *)&v167[20] = v72;
          _os_log_debug_impl(&dword_1D353B000, v73, OS_LOG_TYPE_DEBUG, "[DEBUG] resolved '%@' to %@%@", buf, 0x20u);
        }
      }
      if ((*v63 & 2) != 0)
      {
        char v78 = v12;
        __int16 v79 = [(BRCRelativePath *)self pathOfPackageRoot];
        self->_type = [v79 type];
      }
      else
      {
        v74 = self->_basePath;
        if (v74)
        {
          __int16 v75 = [(BRCRelativePath *)v74 absolutePath];
          id v14 = [v75 stringByAppendingPathComponent:self->_relativePath];

          if ((self->_mode & 0xF000) == 0x4000
            && ((objc_msgSend(v14, "br_isPackageRoot") & 1) != 0
             || (self->_finderInfo[8] & 0x20) != 0 && (objc_msgSend(v14, "br_isInPackage") & 1) == 0))
          {
            long long v103 = [v14 lastPathComponent];
            BOOL v15 = objc_msgSend(v103, "br_pathExtension");

            int v104 = objc_msgSend(v15, "brc_isBlacklistedPackageExtension");
            char v105 = *v63;
            char v78 = v12;
            if (v104) {
              char v106 = v105 & 0xF7;
            }
            else {
              char v106 = v105 | 8;
            }
            char *v63 = v106;
LABEL_112:
            p_absolutePath = (id *)&self->_absolutePath;
            if ((self->_mode & 0xF000) != 0xA000) {
              goto LABEL_118;
            }
            if ((*v63 & 2) != 0)
            {
              long long v82 = [(BRCRelativePath *)self pathOfPackageRoot];
              v163[0] = MEMORY[0x1E4F143A8];
              v163[1] = 3221225472;
              v163[2] = __72__BRCRelativePath__resolveAndKeepOpenMustExist_allowResolveInPkg_error___block_invoke;
              v163[3] = &unk_1E6994A60;
              v163[4] = self;
              char v83 = [v82 performOnOpenFileDescriptor:v163 error:&v164];

              if (v83)
              {
LABEL_118:
                if ([(BRCRelativePath *)self->_basePath isPackageRoot])
                {
                  long long v84 = [(BRCRelativePath *)self->_basePath filename];
                  long long v85 = objc_msgSend(v84, "br_pathExtension");

                  if (v85)
                  {
                    BOOL v15 = v85;
                    if (![v85 compare:@"pkpass" options:1]) {
                      goto LABEL_128;
                    }
                  }
                  else
                  {
                    BOOL v15 = 0;
                  }
                }
                long long v86 = self->_relativePath;
                long long v87 = +[BRCUserDefaults defaultsForMangledID:0];
                LODWORD(v86) = -[NSString br_isExcludedWithMaximumDepth:](v86, "br_isExcludedWithMaximumDepth:", [v87 maxRelativePathDepth]);

                if (v86)
                {
                  long long v88 = brc_bread_crumbs();
                  long long v89 = brc_default_log();
                  if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG)) {
                    -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:]();
                  }

                  [(BRCRelativePath *)self _close];
                  *((unsigned char *)self + 191) |= 1u;
                  int v164 = 45;
                  goto LABEL_150;
                }
LABEL_128:
                if ((self->_fd & 0x80000000) == 0)
                {
                  LOBYTE(v12) = v78;
                  if (![(BRCRelativePath *)self isDocument] || self->_documentID)
                  {
LABEL_131:
                    if ((self->_fd & 0x80000000) == 0 && (*v63 & 0xC) == 8)
                    {
                      long long v90 = brc_bread_crumbs();
                      long long v91 = brc_default_log();
                      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG)) {
                        -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.5();
                      }

                      long long v92 = +[BRCUserDefaults defaultsForMangledID:0];
                      if ([v92 shouldFixupBundleBitOnPackages])
                      {
                        char v158 = v12;
                        long long v93 = [(BRCRelativePath *)self filename];
                        uint64_t v94 = objc_msgSend(v93, "br_pathExtension");

                        if (!v94) {
                          goto LABEL_138;
                        }
                        long long v95 = [v92 extensionsSkippingBundleBitFixup];
                        long long v96 = [(BRCRelativePath *)self filename];
                        objc_msgSend(v96, "br_pathExtension");
                        v98 = long long v97 = v92;
                        char v155 = [v95 containsObject:v98];

                        long long v92 = v97;
                        if ((v155 & 1) == 0)
                        {
LABEL_138:
                          *((unsigned char *)self + 191) |= 4u;
                          self->_finderInfo[8] |= 0x20u;
                          if (fsetxattr(self->_fd, "com.apple.FinderInfo", self->_finderInfo, 0x20uLL, 0, 0))
                          {
                            long long v99 = brc_bread_crumbs();
                            long long v100 = brc_default_log();
                            if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
                            {
                              long long v101 = __error();
                              long long v102 = strerror(*v101);
                              *(_DWORD *)buf = 138412802;
                              *(void *)v167 = self;
                              *(_WORD *)&v167[8] = 2080;
                              *(void *)&v167[10] = v102;
                              *(_WORD *)&v167[18] = 2112;
                              *(void *)&v167[20] = v99;
                              _os_log_impl(&dword_1D353B000, v100, OS_LOG_TYPE_DEFAULT, "[WARNING] failed fixing up bundle bit at %@ - %s%@", buf, 0x20u);
                            }
                          }
                          else
                          {
                            long long v99 = brc_bread_crumbs();
                            long long v100 = brc_default_log();
                            if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG)) {
                              -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.4();
                            }
                          }
                        }
                        LOBYTE(v12) = v158;
                      }
                      else
                      {
                        uint64_t v94 = (uint64_t)v15;
                      }

                      BOOL v15 = (void *)v94;
                    }
                    goto LABEL_151;
                  }
                  if ([(BRCRelativePath *)self isFault])
                  {
                    int v113 = flock(self->_basePath->_fd, 6);
                    unsigned int v114 = 0;
                    if (v113 < 0)
                    {
                      while (*__error() == 35 && v114 <= 9)
                      {
                        ++v114;
                        usleep(0x3E8u);
                        int v113 = flock(self->_basePath->_fd, 6);
                        if ((v113 & 0x80000000) == 0) {
                          goto LABEL_161;
                        }
                      }
                    }
                    else
                    {
LABEL_161:
                      if (!v113)
                      {
                        v156 = brc_bread_crumbs();
                        uint64_t v12 = brc_default_log();
                        if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
                        {
                          id v115 = *p_absolutePath;
                          *(_DWORD *)buf = 134218498;
                          *(double *)v167 = (double)v114 * 0.1;
                          *(_WORD *)&v167[8] = 2112;
                          *(void *)&v167[10] = v115;
                          *(_WORD *)&v167[18] = 2112;
                          *(void *)&v167[20] = v156;
                          _os_log_impl(&dword_1D353B000, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Waited for %f seconds before acquiring lock on the parent folder to re-check faults %@ docID%@", buf, 0x20u);
                        }

                        flock(self->_basePath->_fd, 8);
                        LOBYTE(v12) = v78;
                        goto LABEL_178;
                      }
                    }
                    if (*__error() != 35)
                    {
                      int v159 = *__error();
                      v117 = brc_bread_crumbs();
                      v118 = brc_default_log();
                      if (os_log_type_enabled(v118, OS_LOG_TYPE_FAULT))
                      {
                        v143 = self->_basePath;
                        *(_DWORD *)buf = 138412802;
                        *(void *)v167 = v143;
                        *(_WORD *)&v167[8] = 1024;
                        *(_DWORD *)&v167[10] = v159;
                        *(_WORD *)&v167[14] = 2112;
                        *(void *)&v167[16] = v117;
                        _os_log_fault_impl(&dword_1D353B000, v118, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Really unexpected flock(%@) error  %{errno}d%@", buf, 0x1Cu);
                      }
                    }
                    v119 = brc_bread_crumbs();
                    v120 = brc_default_log();
                    if (os_log_type_enabled(v120, OS_LOG_TYPE_FAULT))
                    {
                      [(BRCRelativePath *)self->_basePath absolutePath];
                      uint64_t v12 = v160 = v12;
                      v136 = self->_absolutePath;
                      *(_DWORD *)buf = 138412802;
                      *(void *)v167 = v12;
                      *(_WORD *)&v167[8] = 2112;
                      *(void *)&v167[10] = v136;
                      *(_WORD *)&v167[18] = 2112;
                      *(void *)&v167[20] = v119;
                      _os_log_fault_impl(&dword_1D353B000, v120, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to acquire exclusive lock on %@, will assign docID to fault %@ anyway%@", buf, 0x20u);

                      LOBYTE(v12) = v160;
                    }
                  }
LABEL_178:
                  *(void *)&v165[16] = 0;
                  *(_OWORD *)v165 = xmmword_1D3887570;
                  unsigned int v162 = 0;
                  uint64_t v161 = 0;
                  if (!BRCGetOrAllocateDocID(self->_fd)
                    || fgetattrlist(self->_fd, v165, &v161, 0xCuLL, 0x20u) < 0)
                  {
                    int v126 = *__error();
                    if (!v126) {
                      int v126 = 2;
                    }
                    int v164 = v126;
                    int v127 = *__error();
                    v128 = brc_bread_crumbs();
                    v129 = brc_default_log();
                    if (os_log_type_enabled(v129, (os_log_type_t)0x90u))
                    {
                      *(_DWORD *)buf = 138412802;
                      *(void *)v167 = self;
                      *(_WORD *)&v167[8] = 1024;
                      *(_DWORD *)&v167[10] = v127;
                      *(_WORD *)&v167[14] = 2112;
                      *(void *)&v167[16] = v128;
                      _os_log_error_impl(&dword_1D353B000, v129, (os_log_type_t)0x90u, "[ERROR] failed allocating documentID for %@ %{errno}d%@", buf, 0x1Cu);
                    }

                    *__error() = v127;
                    [(BRCRelativePath *)self _close];
                    *((unsigned char *)self + 191) |= 1u;
                    if ((*((unsigned char *)self + 192) & 0x10) != 0) {
                      *((unsigned char *)self + 192) |= 0x20u;
                    }
                    goto LABEL_151;
                  }
                  unsigned int v121 = v162;
                  self->_flags = HIDWORD(v161);
                  self->_documentID = v121;
                  if (!v121)
                  {
                    v122 = brc_bread_crumbs();
                    v123 = brc_default_log();
                    if (os_log_type_enabled(v123, OS_LOG_TYPE_FAULT)) {
                      -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.6();
                    }

                    if (!self->_documentID)
                    {
                      v124 = brc_bread_crumbs();
                      v125 = brc_default_log();
                      if (os_log_type_enabled(v125, (os_log_type_t)0x90u)) {
                        -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:]();
                      }

                      int v164 = 45;
                      [(BRCRelativePath *)self _close];
                      *((unsigned char *)self + 191) |= 1u;
                      goto LABEL_151;
                    }
                  }
                  goto LABEL_131;
                }
LABEL_150:
                LOBYTE(v12) = v78;
                goto LABEL_151;
              }
            }
            else
            {
              if (self->_fd < 0)
              {
                int v107 = 9;
              }
              else
              {
                if ((BRCReadlinkAt(-1, (const char *)[*p_absolutePath fileSystemRepresentation], (char *)buf, 1024) & 0x80000000) == 0)
                {
                  objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", buf);
                  v80 = (NSString *)objc_claimAutoreleasedReturnValue();
                  symlinkContent = self->_symlinkContent;
                  self->_symlinkContent = v80;

                  int v164 = 0;
                  goto LABEL_118;
                }
                int v107 = *__error();
              }
              int v164 = v107;
            }
            long long v108 = brc_bread_crumbs();
            uint64_t v109 = brc_default_log();
            if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
            {
              id v130 = *p_absolutePath;
              *(_DWORD *)buf = 138412802;
              *(void *)v167 = v130;
              *(_WORD *)&v167[8] = 1024;
              *(_DWORD *)&v167[10] = v164;
              *(_WORD *)&v167[14] = 2112;
              *(void *)&v167[16] = v108;
              _os_log_debug_impl(&dword_1D353B000, v109, OS_LOG_TYPE_DEBUG, "[DEBUG] resolved-path:'%@' symlink doesn't resolve %{errno}d%@", buf, 0x1Cu);
            }

            int v164 = 45;
            [(BRCRelativePath *)self _close];
            goto LABEL_150;
          }
          if (!v10 && objc_msgSend(v14, "br_isInPackage"))
          {
            int v76 = brc_bread_crumbs();
            __int16 v77 = brc_default_log();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG)) {
              -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.7();
            }

            [(BRCRelativePath *)self _close];
            BOOL v15 = 0;
            *((unsigned char *)self + 191) |= 1u;
            int v164 = 2;
            goto LABEL_151;
          }
          char v78 = v12;
LABEL_111:
          BOOL v15 = 0;
          goto LABEL_112;
        }
        char v78 = v12;
      }
      id v14 = 0;
      goto LABEL_111;
    }
    p_fileID = &self->_fileID;
    if (!self->_fileID)
    {
      v144 = brc_bread_crumbs();
      v145 = brc_default_log();
      if (os_log_type_enabled(v145, OS_LOG_TYPE_FAULT)) {
        -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:]3();
      }
    }
    int v37 = [(BRCAccountSession *)self->_session volume];
    self->_int fd = BRCOpenByID([v37 deviceID], self->_fileID, 2129924);

    int v38 = self->_fd;
    if (v38 < 0)
    {
      if (*__error() <= 0)
      {
        v150 = brc_bread_crumbs();
        v151 = brc_default_log();
        if (os_log_type_enabled(v151, OS_LOG_TYPE_FAULT)) {
          -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:]1();
        }
      }
      int v46 = *__error();
      if (!v46) {
        int v46 = 22;
      }
      int v164 = v46;
      if (v46 == 1)
      {
        long long v47 = brc_bread_crumbs();
        long long v48 = brc_default_log();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
          -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:]0();
        }
      }
      else
      {
        if (v46 != 2)
        {
          int v57 = *__error();
          long long v58 = brc_bread_crumbs();
          long long v59 = brc_default_log();
          if (os_log_type_enabled(v59, (os_log_type_t)0x90u))
          {
            unint64_t v135 = *p_fileID;
            *(_DWORD *)buf = 134218498;
            *(void *)v167 = v135;
            *(_WORD *)&v167[8] = 1024;
            *(_DWORD *)&v167[10] = v57;
            *(_WORD *)&v167[14] = 2112;
            *(void *)&v167[16] = v58;
            _os_log_error_impl(&dword_1D353B000, v59, (os_log_type_t)0x90u, "[ERROR] BRCOpenByID(%lld) failed %{errno}d%@", buf, 0x1Cu);
          }

          *__error() = v57;
          goto LABEL_66;
        }
        long long v47 = brc_bread_crumbs();
        long long v48 = brc_default_log();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
          -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:].cold.9();
        }
      }
    }
    else
    {
      if (fcntl(v38, 50, buf) < 0)
      {
        if (*__error() <= 0)
        {
          v152 = brc_bread_crumbs();
          v153 = brc_default_log();
          if (os_log_type_enabled(v153, OS_LOG_TYPE_FAULT)) {
            -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:]1();
          }
        }
        int v39 = *__error();
        if (!v39) {
          int v39 = 22;
        }
        int v164 = v39;
        int v40 = *__error();
        long long v41 = brc_bread_crumbs();
        long long v42 = brc_default_log();
        if (os_log_type_enabled(v42, (os_log_type_t)0x90u))
        {
          unint64_t v134 = *p_fileID;
          *(_DWORD *)v165 = 134218498;
          *(void *)&v165[4] = v134;
          *(_WORD *)&v165[12] = 1024;
          *(_DWORD *)&v165[14] = v40;
          *(_WORD *)&v165[18] = 2112;
          *(void *)&v165[20] = v41;
          _os_log_error_impl(&dword_1D353B000, v42, (os_log_type_t)0x90u, "[ERROR] fcntl(%lld, F_GETPATH) failed %{errno}d%@", v165, 0x1Cu);
        }

        *__error() = v40;
        close(self->_fd);
        self->_int fd = -1;
      }
      objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", buf);
      long long v43 = (NSString *)objc_claimAutoreleasedReturnValue();
      long long v44 = self->_absolutePath;
      self->_absolutePath = v43;
    }
LABEL_66:
    LOBYTE(v11) = 1;
    goto LABEL_67;
  }
  id v14 = 0;
  BOOL v15 = 0;
  v16 = 0;
  id v17 = 0;
  self->_int fd = -v13;
LABEL_151:
  int v110 = v164;
  if (a5) {
    *a5 = v164;
  }
  char v111 = v12 ^ 1;
  if (!v110) {
    char v111 = 1;
  }
  if ((v111 & 1) == 0)
  {
    [(BRCRelativePath *)self->_basePath close];
    int v110 = v164;
  }
  BOOL v6 = v110 == 0;

  return v6;
}

uint64_t __72__BRCRelativePath__resolveAndKeepOpenMustExist_allowResolveInPkg_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) pathRelativeToPackageRoot];
  uint64_t v5 = [*(id *)(a1 + 32) _resolveSymlinkRelativeTo:a2 path:v4];
  if (!v5)
  {
    if ((BRCReadlinkAt(a2, (const char *)[v4 fileSystemRepresentation], v10, 1024) & 0x80000000) != 0)
    {
      uint64_t v5 = *__error();
    }
    else
    {
      uint64_t v6 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", v10);
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(void **)(v7 + 48);
      *(void *)(v7 + 48) = v6;

      uint64_t v5 = 0;
    }
  }

  return v5;
}

- (BOOL)resolveAndKeepOpenMustExist:(BOOL)a3 error:(int *)a4
{
  return [(BRCRelativePath *)self resolveAndKeepOpenMustExist:a3 allowResolveInPkg:0 error:a4];
}

- (BOOL)resolveAndKeepOpenMustExist:(BOOL)a3 allowResolveInPkg:(BOOL)a4 error:(int *)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  p_mutex = &self->_mutex;
  brc_mutex_lock(&self->_mutex.pthread);
  if (self->_fd < 0)
  {
    BOOL v10 = [(BRCRelativePath *)self _resolveAndKeepOpenMustExist:v7 allowResolveInPkg:v6 error:a5];
  }
  else
  {
    BOOL v10 = 1;
    if ((int)atomic_fetch_add(&self->_openRefCount, 1u) <= -2)
    {
      uint64_t v11 = brc_bread_crumbs();
      uint64_t v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:]();
      }

      BOOL v10 = 1;
    }
  }
  brc_mutex_unlock(&p_mutex->pthread);
  return v10;
}

- (id)refreshFromPathMustExist:(BOOL)a3
{
  BOOL v3 = a3;
  [(BRCRelativePath *)self close];
  if ((self->_fd & 0x80000000) == 0)
  {
    id v8 = brc_bread_crumbs();
    unint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath _resolveBasePath:].cold.9();
    }
  }
  self->_parentFileID = 0;
  self->_fileID = 0;
  BOOL v5 = [(BRCRelativePath *)self resolveAndKeepOpenMustExist:v3 error:0];
  BOOL v6 = 0;
  if (v5) {
    BOOL v6 = self;
  }
  return v6;
}

- (BOOL)_shouldKeepBasePathOpen
{
  return self->_fd < 0
      && [(BRCRelativePath *)self _shouldKeepBasePathOpenWithoutOpenedFD];
}

- (BOOL)_shouldKeepBasePathOpenWithoutOpenedFD
{
  if (![(BRCRelativePath *)self isResolved] || [(BRCRelativePath *)self exists]) {
    return 0;
  }
  return [(BRCRelativePath *)self isInPackage];
}

- (void)_close
{
  if ((self->_fd & 0x80000000) == 0)
  {
    int add = atomic_fetch_add(&self->_openRefCount, 0xFFFFFFFF);
    if (add <= 0)
    {
      BOOL v6 = brc_bread_crumbs();
      BOOL v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[BRCRelativePath _resolveAndKeepOpenMustExist:allowResolveInPkg:error:]();
      }
    }
    else if (add == 1)
    {
      int v4 = *__error();
      close(self->_fd);
      *__error() = v4;
      self->_int fd = -100;
      basePath = self->_basePath;
      [(BRCRelativePath *)basePath close];
    }
  }
}

- (void)close
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !self.isResolved || self.exists%@", v2, v3, v4, v5, v6);
}

- (BOOL)resolveMustExist:(BOOL)a3 error:(int *)a4
{
  BOOL v5 = [(BRCRelativePath *)self resolveAndKeepOpenMustExist:a3 error:a4];
  if (v5) {
    [(BRCRelativePath *)self close];
  }
  return v5;
}

- (BOOL)flock:(int)a3
{
  int fd = self->_fd;
  if (fd < 0)
  {
    BOOL v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath logicalName]();
    }

    int fd = self->_fd;
  }
  return flock(fd, a3) == 0;
}

- (BOOL)performOnOpenFileDescriptor:(id)a3 error:(int *)a4
{
  uint8_t v6 = (uint64_t (**)(id, void))a3;
  int v10 = 0;
  if ([(BRCRelativePath *)self resolveAndKeepOpenMustExist:1 error:&v10])
  {
    int v10 = v6[2](v6, self->_fd);
    [(BRCRelativePath *)self close];
  }
  int v7 = v10;
  if (a4) {
    *a4 = v10;
  }
  BOOL v8 = v7 == 0;

  return v8;
}

- (BOOL)performOnOpenParentFileDescriptor:(id)a3 error:(int *)a4
{
  *(void *)&v56[11] = *MEMORY[0x1E4F143B8];
  uint8_t v6 = (uint64_t (**)(id, void))a3;
  if (![(BRCRelativePath *)self isResolved])
  {
    long long v50 = brc_bread_crumbs();
    long long v51 = brc_default_log();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath type]();
    }
  }
  if (!self->_parentFileID)
  {
    long long v52 = brc_bread_crumbs();
    int v53 = brc_default_log();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath performOnOpenParentFileDescriptor:error:]();
    }
  }
  basePath = self->_basePath;
  if (!basePath)
  {
    int v13 = 0;
    id v14 = 0;
    goto LABEL_15;
  }
  if (basePath->_fd <= 0)
  {
    BOOL v15 = [(BRCRelativePath *)self root];
    uint64_t fd = v15[49];
    if ((int)fd < 1)
    {
      uint64_t v27 = brc_bread_crumbs();
      int v28 = brc_default_log();
      if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
      {
        int v54 = 138412802;
        *(void *)long long v55 = v15;
        *(_WORD *)&v55[8] = 2112;
        *(void *)&v55[10] = self;
        *(_WORD *)&v55[18] = 2112;
        *(void *)&v55[20] = v27;
        _os_log_error_impl(&dword_1D353B000, v28, (os_log_type_t)0x90u, "[ERROR] the root is closed!\n  root: %@\n  self: %@%@", (uint8_t *)&v54, 0x20u);
      }

      int v13 = 0;
      id v12 = 0;
LABEL_22:

      int v26 = 1;
      id v14 = v12;
LABEL_23:
      id v12 = [(NSString *)self->_absolutePath stringByDeletingLastPathComponent];

      if ([v12 length])
      {
        id v12 = v12;
        unsigned int v29 = (const char *)[v12 fileSystemRepresentation];
        uint64_t v35 = BRCOpenAt(0xFFFFFFFFLL, v29, 33028, v30, v31, v32, v33, v34, v54);
        if ((v35 & 0x80000000) == 0)
        {
          uint64_t v25 = v35;
          v36 = brc_bread_crumbs();
          int v37 = brc_default_log();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            int v54 = 138412802;
            *(void *)long long v55 = v12;
            *(_WORD *)&v55[8] = 1024;
            *(_DWORD *)&v55[10] = v25;
            *(_WORD *)&v55[14] = 2112;
            *(void *)&v55[16] = v36;
            _os_log_debug_impl(&dword_1D353B000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] open('%@') succeeded, fd:%d%@", (uint8_t *)&v54, 0x1Cu);
          }

          int v11 = v6[2](v6, v25);
          if (!v26) {
            goto LABEL_29;
          }
          goto LABEL_28;
        }
        long long v43 = brc_bread_crumbs();
        long long v44 = brc_default_log();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
          -[BRCRelativePath performOnOpenParentFileDescriptor:error:]((uint64_t)v12, (uint64_t)v43, v44);
        }

        if (a4)
        {
          BOOL v39 = 0;
          int v42 = *__error();
          goto LABEL_40;
        }
      }
      else
      {
        int v40 = brc_bread_crumbs();
        long long v41 = brc_default_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          absolutePath = self->_absolutePath;
          relativePath = self->_relativePath;
          long long v48 = self->_basePath;
          int v54 = 138413058;
          *(void *)long long v55 = absolutePath;
          *(_WORD *)&v55[8] = 2112;
          *(void *)&v55[10] = relativePath;
          *(_WORD *)&v55[18] = 2112;
          *(void *)&v55[20] = v48;
          *(_WORD *)&v55[28] = 2112;
          *(void *)uint32_t v56 = v40;
          _os_log_debug_impl(&dword_1D353B000, v41, OS_LOG_TYPE_DEBUG, "[DEBUG] empty parentPath for abs:%@ rel:%@ base:%@%@", (uint8_t *)&v54, 0x2Au);
        }

        if (a4)
        {
          BOOL v39 = 0;
          int v42 = 22;
LABEL_40:
          *a4 = v42;
          goto LABEL_42;
        }
      }
      BOOL v39 = 0;
      goto LABEL_42;
    }
    id v17 = [(BRCRelativePath *)self pathRelativeToRoot];
    id v14 = [v17 stringByDeletingLastPathComponent];

    int v13 = (BRCRelativePath *)v15;
LABEL_12:
    if ([v14 length])
    {
      id v12 = v14;
      uint64_t v18 = (const char *)[v12 fileSystemRepresentation];
      uint64_t v24 = BRCOpenAt(fd, v18, 33028, v19, v20, v21, v22, v23, v54);
      if ((v24 & 0x80000000) == 0)
      {
        LODWORD(v25) = v24;
        int v11 = v6[2](v6, v24);
LABEL_28:
        int v38 = *__error();
        close(v25);
        *__error() = v38;
        goto LABEL_29;
      }
      brc_bread_crumbs();
      BOOL v15 = (unsigned int *)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        int v49 = *__error();
        int v54 = 67110146;
        *(_DWORD *)long long v55 = fd;
        *(_WORD *)&v55[4] = 2112;
        *(void *)&v55[6] = v12;
        *(_WORD *)&v55[14] = 2112;
        *(void *)&v55[16] = v13;
        *(_WORD *)&v55[24] = 1024;
        *(_DWORD *)&v55[26] = v49;
        v56[0] = 2112;
        *(void *)&v56[1] = v15;
        _os_log_debug_impl(&dword_1D353B000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] openat(%d, '%@') failed, base:%@ %{errno}d%@", (uint8_t *)&v54, 0x2Cu);
      }
      goto LABEL_22;
    }
LABEL_15:
    int v26 = 1;
    goto LABEL_23;
  }
  unint64_t parentFileID = self->_parentFileID;
  uint64_t v9 = [(BRCRelativePath *)basePath fileID];
  int v10 = self->_basePath;
  if (parentFileID != v9)
  {
    int v13 = v10;
    uint64_t fd = self->_basePath->_fd;
    id v14 = [(NSString *)self->_relativePath stringByDeletingLastPathComponent];
    if ((int)fd < 1) {
      goto LABEL_15;
    }
    goto LABEL_12;
  }
  if (v10->_fd < 0)
  {
    int v13 = 0;
    id v14 = 0;
    int v26 = 0;
    goto LABEL_23;
  }
  int v11 = ((uint64_t (*)(uint64_t (**)(id, void)))v6[2])(v6);
  id v12 = 0;
  int v13 = 0;
LABEL_29:
  if (a4) {
    *a4 = v11;
  }
  BOOL v39 = v11 == 0;
LABEL_42:

  return v39;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (BRCRelativePath *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(BRCRelativePath *)self isEqualToRelativePath:v4];
  }

  return v5;
}

- (BOOL)isEqualToRelativePath:(id)a3
{
  uint64_t v4 = (BRCRelativePath *)a3;
  BOOL v5 = v4;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else if (self->_basePath == v4->_basePath)
  {
    if ([(BRCRelativePath *)self isResolved] && [(BRCRelativePath *)v5 isResolved])
    {
      unint64_t v7 = [(BRCRelativePath *)self fileID];
      BOOL v6 = v7 == [(BRCRelativePath *)v5 fileID];
    }
    else
    {
      BOOL v6 = [(NSString *)self->_relativePath isEqualToString:v5->_relativePath];
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSString)faultDisplayName
{
  if (![(BRCRelativePath *)self isFault])
  {
    BOOL v6 = brc_bread_crumbs();
    unint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath logicalName]();
    }
  }
  uint64_t v3 = [(BRCRelativePath *)self physicalURL];
  uint64_t v4 = (void *)_CFURLCopyLogicalNameOfPromiseAtURL();

  return (NSString *)v4;
}

- (BRCBookmark)bookmark
{
  if (![(BRCRelativePath *)self isBRAlias])
  {
    BOOL v5 = brc_bread_crumbs();
    BOOL v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCRelativePath bookmark]();
    }
  }
  bookmark = self->_bookmark;
  return bookmark;
}

- (NSData)quarantineInfo
{
  return self->_quarantineInfo;
}

- (NSData)xattrs
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((*((unsigned char *)self + 192) & 4) == 0)
  {
    brc_mutex_lock(&self->_mutex.pthread);
    if ((*((unsigned char *)self + 192) & 4) == 0)
    {
      if (self->_fd < 0)
      {
        BOOL v15 = brc_bread_crumbs();
        v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[BRCRelativePath logicalName]();
        }
      }
      uint64_t v3 = [(BRCRelativePath *)self appLibrary];
      uint64_t v4 = [v3 mangledID];
      BOOL v5 = +[BRCUserDefaults defaultsForMangledID:v4];
      uint64_t v6 = [v5 maxXattrBlobSize];

      uint64_t fd = self->_fd;
      id v17 = 0;
      BOOL v8 = +[BRFieldXattrBlob loadXattrsFromFD:fd withMaximumSize:v6 error:&v17];
      id v9 = v17;
      xattrs = self->_xattrs;
      self->_xattrs = v8;

      if (v9)
      {
        int v11 = brc_bread_crumbs();
        id v12 = brc_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v19 = self;
          __int16 v20 = 2112;
          id v21 = v9;
          __int16 v22 = 2112;
          uint64_t v23 = v11;
          _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to resolve xattrs for %@: %@%@", buf, 0x20u);
        }
      }
      *((unsigned char *)self + 192) |= 4u;
    }
    brc_mutex_unlock(&self->_mutex.pthread);
  }
  int v13 = self->_xattrs;
  return v13;
}

- (NSString)sharedItemBookmark
{
  if ((*((unsigned char *)self + 192) & 8) == 0)
  {
    brc_mutex_lock(&self->_mutex.pthread);
    if ((*((unsigned char *)self + 192) & 8) == 0)
    {
      uint64_t v3 = BRCGetXattrValueForKeyOnFD(self->_fd, self->_absolutePath, @"com.apple.clouddocs.private.share-bookmark#B");
      uint64_t v4 = v3;
      if (v3)
      {
        BOOL v5 = v3;
      }
      else
      {
        BRCGetXattrValueForKeyOnFD(self->_fd, self->_absolutePath, @"com.apple.finder.copy.preserveinbackups.com.apple.clouddocs.private.share-bookmark#N");
        BOOL v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      sharedItemBookmark = self->_sharedItemBookmark;
      self->_sharedItemBookmark = v5;

      *((unsigned char *)self + 192) |= 8u;
    }
    brc_mutex_unlock(&self->_mutex.pthread);
  }
  unint64_t v7 = self->_sharedItemBookmark;
  return v7;
}

- (NSString)itemSyncPausedByBundleID
{
  if ((*((unsigned char *)self + 192) & 0x40) == 0)
  {
    brc_mutex_lock(&self->_mutex.pthread);
    if ((*((unsigned char *)self + 192) & 0x40) == 0)
    {
      BRCGetXattrValueForKeyOnFD(self->_fd, self->_absolutePath, @"com.apple.clouddocs.private.item-sync-paused-by-bundle-id#N");
      uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
      itemSyncPausedByBundleID = self->_itemSyncPausedByBundleID;
      self->_itemSyncPausedByBundleID = v3;

      *((unsigned char *)self + 192) |= 0x40u;
    }
    brc_mutex_unlock(&self->_mutex.pthread);
  }
  BOOL v5 = self->_itemSyncPausedByBundleID;
  return v5;
}

- (NSNumber)itemSyncPausedExpireTS
{
  if ((*((char *)self + 192) & 0x80000000) == 0)
  {
    brc_mutex_lock(&self->_mutex.pthread);
    if ((*((char *)self + 192) & 0x80000000) == 0)
    {
      uint64_t v3 = BRCGetXattrValueForKeyOnFD(self->_fd, self->_absolutePath, @"com.apple.clouddocs.private.item-sync-paused-expire-timestamp#N");
      uint64_t v4 = v3;
      if (v3)
      {
        objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));
        BOOL v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        itemSyncPausedExpireTS = self->_itemSyncPausedExpireTS;
        self->_itemSyncPausedExpireTS = v5;
      }
      else
      {
        itemSyncPausedExpireTS = self->_itemSyncPausedExpireTS;
        self->_itemSyncPausedExpireTS = 0;
      }

      *((unsigned char *)self + 192) |= 0x80u;
    }
    brc_mutex_unlock(&self->_mutex.pthread);
  }
  unint64_t v7 = self->_itemSyncPausedExpireTS;
  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_absolutePath hash];
}

- (unint64_t)parentHash
{
  uint64_t v2 = [(NSString *)self->_absolutePath stringByDeletingLastPathComponent];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  if (![(BRCRelativePath *)self isResolved])
  {
    id v17 = NSString;
    if (self->_absolutePath)
    {
      id v3 = [NSString stringWithFormat:@"path:'%@' unresolved", self->_absolutePath];
    }
    else
    {
      uint64_t v18 = [(BRCRelativePath *)self->_basePath absolutePath];
      id v3 = [v17 stringWithFormat:@"path:'%@/%@' unresolved", v18, self->_relativePath];
    }
    goto LABEL_44;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"path:'%@' parentFileID:%llu", self->_absolutePath, self->_parentFileID];
  if (![(BRCRelativePath *)self exists]) {
    goto LABEL_44;
  }
  objc_msgSend(v3, "appendFormat:", @" fileID:%llu", self->_fileID);
  objc_msgSend(v3, "appendFormat:", @" size:%llu", self->_size);
  objc_msgSend(v3, "appendFormat:", @" mtime:%lu", self->_mtime.tv_sec);
  unint64_t mode = self->_mode;
  uint64_t v5 = aPcDBLSW[mode >> 12];
  uint64_t v6 = 120;
  if (mode) {
    uint64_t v7 = 120;
  }
  else {
    uint64_t v7 = 45;
  }
  uint64_t v8 = 119;
  if ((mode & 2) != 0) {
    uint64_t v9 = 119;
  }
  else {
    uint64_t v9 = 45;
  }
  uint64_t v24 = v9;
  if ((mode & 4) != 0) {
    uint64_t v10 = 114;
  }
  else {
    uint64_t v10 = 45;
  }
  if ((mode & 8) != 0) {
    uint64_t v11 = 120;
  }
  else {
    uint64_t v11 = 45;
  }
  uint64_t v22 = v11;
  uint64_t v23 = v10;
  if ((mode & 0x10) != 0) {
    uint64_t v12 = 119;
  }
  else {
    uint64_t v12 = 45;
  }
  if ((mode & 0x20) != 0) {
    uint64_t v13 = 114;
  }
  else {
    uint64_t v13 = 45;
  }
  if ((mode & 0x40) == 0) {
    uint64_t v6 = 45;
  }
  if ((mode & 0x80) == 0) {
    uint64_t v8 = 45;
  }
  if ((mode & 0x100) != 0) {
    uint64_t v14 = 114;
  }
  else {
    uint64_t v14 = 45;
  }
  objc_msgSend(v3, "appendFormat:", @" mode:%c%c%c%c%c%c%c%c%c%c", v5, v14, v8, v6, v13, v12, v22, v23, v24, v7);
  quarantineInfo = self->_quarantineInfo;
  if (quarantineInfo) {
    objc_msgSend(v3, "appendFormat:", @" quarantine:%u", -[NSData br_qtnFlags](quarantineInfo, "br_qtnFlags"));
  }
  if ([(BRCRelativePath *)self isBRAlias])
  {
    v16 = @" br-alias";
LABEL_37:
    [v3 appendString:v16];
    goto LABEL_38;
  }
  if ([(BRCRelativePath *)self isFinderAlias])
  {
    v16 = @" finder-alias";
    goto LABEL_37;
  }
LABEL_38:
  if ([(BRCRelativePath *)self isDocument]) {
    objc_msgSend(v3, "appendFormat:", @" documentID:%u", self->_documentID);
  }
  LODWORD(v19) = self->_fd;
  if ((int)v19 < 0) {
    uint64_t v19 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v19 = v19;
  }
  objc_msgSend(v3, "appendFormat:", @" generationID:%u fd:%d refs:%u", self->_fsGenerationID, v19, atomic_load_explicit(&self->_openRefCount, memory_order_acquire));
  __int16 v20 = [(BRCAppLibrary *)self->_appLibrary appLibraryID];
  [v3 appendFormat:@" appLibrary:%@", v20];

LABEL_44:
  return v3;
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (void)setAppLibrary:(id)a3
{
}

- (void)setType:(unsigned __int16)a3
{
  self->_type = a3;
}

- (void)setItemScope:(unsigned __int8)a3
{
  self->_itemScope = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemSyncPausedExpireTS, 0);
  objc_storeStrong((id *)&self->_itemSyncPausedByBundleID, 0);
  objc_storeStrong((id *)&self->_sharedItemBookmark, 0);
  objc_storeStrong((id *)&self->_xattrs, 0);
  objc_storeStrong((id *)&self->_quarantineInfo, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_symlinkContent, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_relativePath, 0);
  objc_storeStrong((id *)&self->_absolutePath, 0);
  objc_storeStrong((id *)&self->_roots, 0);
}

- (void)initWithRootPath:session:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: session%@", v2, v3, v4, v5, v6);
}

- (void)initWithRootPath:session:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: path.br_isAbsolutePath%@", v2, v3, v4, v5, v6);
}

- (void)_initWithPath:relativeToRoot:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _session%@", v2, v3, v4, v5, v6);
}

- (void)initWithFileID:root:session:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: fileID != 0ULL%@", v2, v3, v4, v5, v6);
}

- (void)pathWithChildAtPath:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.isUnixDir%@", v2, v3, v4, v5, v6);
}

- (void)pathWithChildAtPath:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.exists%@", v2, v3, v4, v5, v6);
}

- (void)pathOfPackageRoot
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.isInPackage%@", v2, v3, v4, v5, v6);
}

- (void)isPackageRoot
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: [self isResolved]%@", v2, v3, v4, v5, v6);
}

- (void)type
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.isResolved%@", v2, v3, v4, v5, v6);
}

- (void)isResolved
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.isRoot || self.basePath.isResolved%@", v2, v3, v4, v5, v6);
}

- (void)logicalName
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.isFault%@", v2, v3, v4, v5, v6);
}

- (void)symlinkContent
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.isSymLink%@", v2, v3, v4, v5, v6);
}

- (void)size
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.isFile%@", v2, v3, v4, v5, v6);
}

- (void)_resolveBasePath:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] no base path%@", v1, 0xCu);
}

- (void)_resolveBasePath:.cold.2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_7_1(&dword_1D353B000, v0, v1, "[DEBUG] can't open base path %@ %{errno}d%@");
}

- (void)_resolveBasePath:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Detected unbound package resolution recursion for %@%@");
}

- (void)_resolveBasePath:.cold.4()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v1, v2, "[ERROR] relative package root path can not be equal to relative path = %@%@", (void)v3, DWORD2(v3));
}

- (void)_resolveBasePath:.cold.5()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_7_1(&dword_1D353B000, v0, v1, "[DEBUG] can't open package root %@ %{errno}d%@");
}

- (void)_resolveBasePath:.cold.6()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] package root %@ is not a directory%@", (void)v3, DWORD2(v3));
}

- (void)_resolveBasePath:.cold.7()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] base path %@ is not a directory%@", (void)v3, DWORD2(v3));
}

- (void)_resolveBasePath:.cold.8()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _basePath%@", v2, v3, v4, v5, v6);
}

- (void)_resolveBasePath:.cold.9()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _fd < 0%@", v2, v3, v4, v5, v6);
}

- (void)_resolveRootWhenExists:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: a root should always be openable%@", v2, v3, v4, v5, v6);
}

- (void)_resolveRootWhenExists:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !_basePath%@", v2, v3, v4, v5, v6);
}

- (void)_resolveRootWhenExists:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !_relativePath%@", v2, v3, v4, v5, v6);
}

- (void)_resolveWhenExists
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Inappropriate location or an alias at '%s'%@");
}

- (void)_resolveWhenDoesntExist
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _basePath == nil || _basePath->_fd >= 0%@", v2, v3, v4, v5, v6);
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: value >= 0%@", v2, v3, v4, v5, v6);
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] resolved-path:'%@' is excluded%@", (void)v3, DWORD2(v3));
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] Exclude document for which we couldn't allocate a documentID for %@%@");
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] fixed up bundle bit at %@%@");
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] package without the bundle bit at %@%@");
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.6()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _documentID > 0%@", v2, v3, v4, v5, v6);
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] absolute path is excluded because it is a package %@%@");
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.9()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] openbyid_np(%lld) failed: the file was unlinked%@", (void)v3, DWORD2(v3));
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.10()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] openbyid_np(%lld) failed: the file still exists, but we don't have access to it%@", (void)v3, DWORD2(v3));
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.11()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: errno > 0%@", v2, v3, v4, v5, v6);
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.13()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _fileID%@", v2, v3, v4, v5, v6);
}

- (void)_resolveAndKeepOpenMustExist:allowResolveInPkg:error:.cold.17()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _basePath->_fd >= 0%@", v2, v3, v4, v5, v6);
}

- (void)performOnOpenParentFileDescriptor:(NSObject *)a3 error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v6 = *__error();
  int v7 = 138412802;
  uint64_t v8 = a1;
  __int16 v9 = 1024;
  int v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] open('%@') failed %{errno}d%@", (uint8_t *)&v7, 0x1Cu);
}

- (void)performOnOpenParentFileDescriptor:error:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _parentFileID > 0%@", v2, v3, v4, v5, v6);
}

- (void)bookmark
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.isBRAlias%@", v2, v3, v4, v5, v6);
}

@end