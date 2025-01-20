@interface SIIndexer
+ (__SIUserCtx)createUserContext:(id)a3;
+ (id)indexerWithPath:(id)a3 options:(unint64_t)a4;
+ (id)indexerWithPath:(id)a3 rootPath:(id)a4;
+ (id)indexerWithPath:(id)a3 rootPath:(id)a4 options:(unint64_t)a5;
+ (void)initialize;
+ (void)setLogLevel:(int)a3 forCategory:(char *)a4;
- (BOOL)_repairOid:(int64_t)a3 type:(int)a4 flags:(int)a5;
- (BOOL)inBatch;
- (BOOL)isAPFS;
- (BOOL)isCoreSpotlight;
- (BOOL)isFSOnly;
- (BOOL)isHFS;
- (BOOL)isOpen;
- (BOOL)isSpotlightIndex;
- (BOOL)isXcodeIndex;
- (BOOL)openWithOptions:(unint64_t)a3;
- (BOOL)permissions;
- (BOOL)persistentFileIDs;
- (BOOL)readOnly;
- (NSDictionary)indexProperties;
- (NSDictionary)propertyMap;
- (NSDictionary)propertyNumMap;
- (NSMutableDictionary)queryTasks;
- (NSObject)volumeObject;
- (NSString)bundleID;
- (NSString)domain;
- (NSString)path;
- (NSString)rootPath;
- (SDDirtyIdleTimer)dirtyIdleTimer;
- (SIIndexer)init;
- (TermIndex)termIndex;
- (_SIIndexCallbacks)indexCallbacks;
- (_SI_PersistentIDStore)psid;
- (__SI)index;
- (_opaque_pthread_rwlock_t)queryTasksRdWrLock;
- (id)allQueryTasks;
- (id)getAttributes:(id)a3 forOid:(int64_t)a4;
- (id)getQueryTaskForID:(id)a3;
- (id)oidPath:(int64_t)a3;
- (id)path:(int64_t)a3;
- (id)propertyName:(unint64_t)a3;
- (id)resultsForPommesUserQuery:(id)a3 withFields:(id)a4 maxCount:(int64_t)a5 languages:(id)a6 liftingRules:(id)a7 scope:(id)a8 pommesBundles:(id)a9;
- (id)termIndex:(unint64_t)a3;
- (int)_assertPower:(const char *)a3 line:(int)a4 function:(const char *)a5;
- (int)_preSync:(id *)a3;
- (int)_syncFinished:(BOOL)a3 docCounts:(id *)a4;
- (int)cancel;
- (int)device;
- (int)indexType;
- (int64_t)oidForPath:(const char *)a3 allowCreate:(BOOL)a4;
- (unint64_t)oidForDocID:(unint64_t)a3;
- (unint64_t)termIndexCount;
- (unsigned)addDocumentCount;
- (unsigned)addDocumentForSplitCount;
- (unsigned)completedBatchCount;
- (unsigned)completedDocumentCount;
- (unsigned)groupForDocID:(unint64_t)a3;
- (unsigned)relativeDocID:(unint64_t)a3;
- (void)_accountingStart:(const char *)a3;
- (void)_indexFinalize;
- (void)_reopen:(const char *)a3;
- (void)addRecords:(id)a3 forIDs:(unint64_t *)a4 completionHandler:(id)a5;
- (void)bulkSetCSAttributes:(id)a3 bundle:(id)a4;
- (void)close;
- (void)dealloc;
- (void)deleteFilesInDirectory:(int)a3;
- (void)deleteOID:(int64_t)a3;
- (void)fullMerge;
- (void)issueCommit;
- (void)iterateTermIndexes:(id)a3;
- (void)iterateTermIndexes:(int64_t)a3 block:(id)a4;
- (void)merge;
- (void)oidParents:(id)a3;
- (void)removeRecordsForIDs:(unint64_t *)a3 count:(unint64_t)a4 completionHandler:(id)a5;
- (void)rename:(const char *)a3 toPath:(const char *)a4;
- (void)setAddDocumentCount:(unsigned int)a3;
- (void)setAddDocumentForSplitCount:(unsigned int)a3;
- (void)setBundleID:(id)a3;
- (void)setCancel:(int)a3;
- (void)setCompletedBatchCount:(unsigned int)a3;
- (void)setCompletedDocumentCount:(unsigned int)a3;
- (void)setDirtyIdleTimer:(id)a3;
- (void)setDomain:(id)a3;
- (void)setInBatch:(BOOL)a3;
- (void)setIndexType:(int)a3;
- (void)setIsAPFS:(BOOL)a3;
- (void)setIsHFS:(BOOL)a3;
- (void)setIsOpen:(BOOL)a3;
- (void)setPath:(id)a3;
- (void)setPermissions:(BOOL)a3;
- (void)setPersistentFileIDs:(BOOL)a3;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)setPropertyMap:(id)a3;
- (void)setPropertyNumMap:(id)a3;
- (void)setPsid:(_SI_PersistentIDStore *)a3;
- (void)setQueryTask:(id)a3 forID:(id)a4;
- (void)setQueryTasks:(id)a3;
- (void)setQueryTasksRdWrLock:(_opaque_pthread_rwlock_t *)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setRootPath:(id)a3;
- (void)setTermIndex:(id)a3;
- (void)setVolumeObject:(id)a3;
- (void)split;
- (void)updateRecords:(id)a3 forIDs:(unint64_t *)a4 completionHandler:(id)a5;
- (void)verify;
- (void)waitFor:(int)a3;
@end

@implementation SIIndexer

+ (void)setLogLevel:(int)a3 forCategory:(char *)a4
{
  if ((a3 + 3) > 8) {
    return;
  }
  if (a4 && *a4)
  {
    if (!strcmp(a4, "general")) {
      goto LABEL_18;
    }
    if (strcmp(a4, "query"))
    {
      if (strcmp(a4, "scheduler")
        && strcmp(a4, "store")
        && strcmp(a4, "fetch")
        && strcmp(a4, "path")
        && strcmp(a4, "sdb")
        && strcmp(a4, "ci")
        && strcmp(a4, "state")
        && strcmp(a4, "power")
        && strcmp(a4, "qos"))
      {
        return;
      }
      goto LABEL_18;
    }
  }
  else
  {
    SISetLogging();
    SISetLogging();
    SISetLogging();
    SISetLogging();
    SISetLogging();
    SISetLogging();
    SISetLogging();
    SISetLogging();
    SISetLogging();
    SISetLogging();
  }
  SISetLogging();
LABEL_18:

  SISetLogging();
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[SIIndexer setLogLevel:3 forCategory:0];
  }
}

+ (__SIUserCtx)createUserContext:(id)a3
{
  return (__SIUserCtx *)SIUserCtxCreateWithLanguages();
}

+ (id)indexerWithPath:(id)a3 rootPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(SIIndexer);
  [(SIIndexer *)v7 setPath:v6];

  [(SIIndexer *)v7 setRootPath:v5];

  return v7;
}

+ (id)indexerWithPath:(id)a3 rootPath:(id)a4 options:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = objc_alloc_init(SIIndexer);
  [(SIIndexer *)v9 setPath:v8];

  [(SIIndexer *)v9 setRootPath:v7];
  [(SIIndexer *)v9 openWithOptions:a5];

  return v9;
}

+ (id)indexerWithPath:(id)a3 options:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(SIIndexer);
  [(SIIndexer *)v6 setPath:v5];

  [(SIIndexer *)v6 openWithOptions:a4];

  return v6;
}

- (SIIndexer)init
{
  v6.receiver = self;
  v6.super_class = (Class)SIIndexer;
  v2 = [(SIIndexer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    queryTasks = v2->_queryTasks;
    v2->_queryTasks = (NSMutableDictionary *)v3;

    pthread_rwlock_init(&v2->_queryTasksRdWrLock, 0);
  }
  return v2;
}

- (void)dealloc
{
  [(SIIndexer *)self close];
  pthread_rwlock_destroy(&self->_queryTasksRdWrLock);
  v3.receiver = self;
  v3.super_class = (Class)SIIndexer;
  [(SIIndexer *)&v3 dealloc];
}

- (void)deleteFilesInDirectory:(int)a3
{
  int v4 = dup(a3);
  id v5 = fdopendir(v4);
  if (v5)
  {
    objc_super v6 = v5;
    while (1)
    {
      id v7 = readdir(v6);
      if (!v7) {
        break;
      }
      if (v7->d_type != 4) {
        unlinkat(a3, v7->d_name, 0);
      }
    }
    closedir(v6);
  }
}

- (BOOL)openWithOptions:(unint64_t)a3
{
  unsigned int v3 = a3;
  if ((a3 & 0x30) == 0)
  {
    if (self->_readOnly) {
      unsigned int v5 = a3 | 0x20;
    }
    else {
      unsigned int v5 = a3;
    }
    if (self->_permissions) {
      unsigned int v3 = v5 | 0x10;
    }
    else {
      unsigned int v3 = v5;
    }
  }
  self->_readOnly = (v3 & 0x20) != 0;
  self->_permissions = (v3 & 0x10) != 0;
  if ((v3 & 0xF) == 0)
  {
    if ([(SIIndexer *)self isSpotlightIndex])
    {
      v3 |= 1u;
      if ((v3 & 0x80) != 0) {
        goto LABEL_41;
      }
    }
    else if ([(SIIndexer *)self isCoreSpotlight])
    {
      v3 |= 2u;
      if ((v3 & 0x80) != 0) {
        goto LABEL_41;
      }
    }
    else if ([(SIIndexer *)self isFSOnly])
    {
      v3 |= 4u;
      if ((v3 & 0x80) != 0) {
        goto LABEL_41;
      }
    }
    else
    {
      if ([(SIIndexer *)self isXcodeIndex]) {
        v3 |= 8u;
      }
      if ((v3 & 0x80) != 0) {
        goto LABEL_41;
      }
    }
LABEL_10:
    if ((v3 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_42;
  }
  if ((v3 & 0x80) == 0) {
    goto LABEL_10;
  }
LABEL_41:
  self->_persistentFileIDs = 1;
  if ((v3 & 0x100) == 0)
  {
LABEL_11:
    if ((v3 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_isHFS = 1;
  if ((v3 & 0x200) == 0)
  {
LABEL_12:
    if ((v3 & 4) == 0) {
      goto LABEL_13;
    }
LABEL_44:
    BOOL v15 = 0;
    self->_int indexType = 3;
    return v15;
  }
LABEL_43:
  self->_isAPFS = 1;
  if ((v3 & 4) != 0) {
    goto LABEL_44;
  }
LABEL_13:
  if ([(SIIndexer *)self isOpen]) {
    return 0;
  }
  objc_super v6 = +[NSFileManager defaultManager];
  id v7 = [(SIIndexer *)self path];
  char v35 = 0;
  unsigned int v8 = [v6 fileExistsAtPath:v7 isDirectory:&v35];
  if (!v8 || !v35)
  {
    if ((v3 & 0x40) != 0) {
      LOBYTE(v8) = [v6 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];
    }
    if ((v8 & 1) == 0)
    {
      NSLog(@"### Expected directory at %@", v7);
      goto LABEL_34;
    }
  }
  id v9 = v6;
  v10 = (char *)[v9 fileSystemRepresentationWithPath:v7];
  uint64_t v11 = open(v10, 0x8000);
  if (v11 == -1)
  {
    uint64_t v32 = *__error();
    NSLog(@"### Open %d error at %s", v32, v10);
LABEL_34:

    return 0;
  }
  uint64_t v12 = v11;
  self->_cancel = 0;
  if ((v3 & 2) != 0)
  {
    if (self->_readOnly)
    {
      CFStringRef v37 = @"kIndexOptionReadOnly";
      v16 = +[NSNumber numberWithBool:1];
      v38 = v16;
      v17 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    }
    else
    {
      v17 = 0;
    }
    self->_int indexType = 2;
    int v22 = SIOpenIndexAtPathWithCallbacks();

    goto LABEL_90;
  }
  self->_int indexType = (v3 >> 3) & 1;
  v13 = (_SIIndexCallbacks *)malloc_type_malloc(0x98uLL, 0x800407567D3B1uLL);
  *(_OWORD *)&v13->var12 = *(_OWORD *)&off_1000351F0;
  *(_OWORD *)&v13->var14 = *(_OWORD *)&off_100035200;
  *(_OWORD *)&v13->var16 = xmmword_100035210;
  *(_OWORD *)&v13->var4 = *(_OWORD *)off_1000351B0;
  *(_OWORD *)&v13->var6 = *(_OWORD *)off_1000351C0;
  *(_OWORD *)&v13->var8 = *(_OWORD *)&off_1000351D0;
  *(_OWORD *)&v13->var10 = *(_OWORD *)&off_1000351E0;
  *(_OWORD *)&v13->var0 = *(_OWORD *)off_100035190;
  *(_OWORD *)&v13->var2 = *(_OWORD *)off_1000351A0;
  v13->var18 = self;
  self->_indexCallbacks = v13;
  int indexType = self->_indexType;
  long long v34 = 0u;
  if ((indexType - 1) > 1)
  {
    memset(&v36, 0, sizeof(v36));
    if (!sub_10001D1D8(v10, &v36))
    {
      DWORD2(v34) = v36.st_dev;
      if (indexType == 3
        || (bzero(&__str, 0x400uLL),
            snprintf((char *)&__str, 0x400uLL, "%s/%s", v10, "psid.db"),
            sub_10001D1D8((char *)&__str, &v36))
        || v36.st_size <= 0)
      {
        bzero(&__str, 0x878uLL);
        statfs(v10, &__str);
      }
    }
  }
  self->_device = DWORD2(v34);
  psid = self->_psid;
  if (psid)
  {
    CFRelease(psid);
    self->_psid = 0;
  }
  int v20 = self->_indexType;
  if (v20)
  {
    if (v20 == 1)
    {
      v21 = (_SI_PersistentIDStore *)sub_10000D36C();
LABEL_61:
      v23 = v21;
      self->_psid = v21;
      goto LABEL_66;
    }
  }
  else if (self->_persistentFileIDs)
  {
    memset(&__str, 0, 144);
    if (!fstatat(v12, "psid.db", (stat *)&__str, 0))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100025DB0();
      }
      int v22 = -4;
      goto LABEL_72;
    }
    v21 = (_SI_PersistentIDStore *)sub_1000248E0(self->_volumeObject);
    goto LABEL_61;
  }
  v23 = (_SI_PersistentIDStore *)SIPersistentIDStoreCreate();
  self->_psid = v23;
  if (v23)
  {
    rootPath = self->_rootPath;
    if (rootPath)
    {
      if (!self->_indexType)
      {
        [(NSString *)rootPath UTF8String];
        SIPersistentIDStoreSetRootPath();
        v23 = self->_psid;
      }
    }
  }
LABEL_66:
  memset(&__str, 0, 24);
  v31 = v23;
  p_cancel = &self->_cancel;
  int v22 = SIOpenIndex();
  if ((v22 & 0x80000000) == 0)
  {
    if (!self->_readOnly) {
      SISetScanCount();
    }
    goto LABEL_90;
  }
LABEL_72:
  if ((v3 & 0x40) != 0 && !self->_readOnly)
  {
    v25 = self->_psid;
    if (v25)
    {
      CFRelease(v25);
      self->_psid = 0;
    }
    -[SIIndexer deleteFilesInDirectory:](self, "deleteFilesInDirectory:", v12, v31, p_cancel);
    if (!self->_indexCallbacks)
    {
      v26 = (_SIIndexCallbacks *)malloc_type_malloc(0x98uLL, 0x800407567D3B1uLL);
      *(_OWORD *)&v26->var12 = *(_OWORD *)&off_1000351F0;
      *(_OWORD *)&v26->var14 = *(_OWORD *)&off_100035200;
      *(_OWORD *)&v26->var16 = xmmword_100035210;
      *(_OWORD *)&v26->var4 = *(_OWORD *)off_1000351B0;
      *(_OWORD *)&v26->var6 = *(_OWORD *)off_1000351C0;
      *(_OWORD *)&v26->var8 = *(_OWORD *)&off_1000351D0;
      *(_OWORD *)&v26->var10 = *(_OWORD *)&off_1000351E0;
      *(_OWORD *)&v26->var0 = *(_OWORD *)off_100035190;
      *(_OWORD *)&v26->var2 = *(_OWORD *)off_1000351A0;
      v26->var18 = self;
      self->_indexCallbacks = v26;
    }
    int v27 = self->_indexType;
    if (v27)
    {
      if (v27 == 1)
      {
        v28 = (_SI_PersistentIDStore *)sub_10000D36C();
LABEL_83:
        self->_psid = v28;
LABEL_88:
        self->_cancel = 0;
        memset(&__str, 0, 24);
        int v22 = SICreateNewIndex();
        if ((v22 & 0x80000000) == 0)
        {
          SISetScanCount();
          SIInitialIndexingEnded();
          SISyncIndex();
        }
        goto LABEL_90;
      }
    }
    else if (self->_persistentFileIDs)
    {
      v28 = (_SI_PersistentIDStore *)sub_1000248E0(self->_volumeObject);
      goto LABEL_83;
    }
    v29 = (_SI_PersistentIDStore *)SIPersistentIDStoreCreate();
    self->_psid = v29;
    if (v29)
    {
      v30 = self->_rootPath;
      if (v30)
      {
        if (!self->_indexType)
        {
          [(NSString *)v30 UTF8String];
          SIPersistentIDStoreSetRootPath();
        }
      }
    }
    goto LABEL_88;
  }
LABEL_90:
  BOOL v15 = v22 >= 0;
  if ((v22 & 0x80000000) == 0) {
    self->_isOpen = 1;
  }

  close(v12);
  return v15;
}

- (void)close
{
  psid = self->_psid;
  if (psid)
  {
    CFRelease(psid);
    self->_psid = 0;
  }
  if ([(SIIndexer *)self isOpen])
  {
    [(SIIndexer *)self setIsOpen:0];
    index = self->_index;
    _SICloseIndex(index);
  }
}

- (BOOL)isFSOnly
{
  return [(SIIndexer *)self indexType] == 3;
}

- (BOOL)isCoreSpotlight
{
  return [(SIIndexer *)self indexType] == 2;
}

- (BOOL)isSpotlightIndex
{
  return [(SIIndexer *)self indexType] == 0;
}

- (BOOL)isXcodeIndex
{
  return [(SIIndexer *)self indexType] == 1;
}

- (unint64_t)termIndexCount
{
  unint64_t result = (unint64_t)self->_index;
  if (result) {
    return sub_10001E1F8(result);
  }
  return result;
}

- (id)path:(int64_t)a3
{
  unsigned int v5 = objc_opt_new();
  objc_super v6 = &off_100036BF8;
  id v7 = &CFAbsoluteTimeGetCurrent_ptr;
  unsigned int v8 = &CFAbsoluteTimeGetCurrent_ptr;
  int v22 = v5;
  do
  {
    id v9 = [(SIIndexer *)self getAttributes:v6 forOid:a3];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || [v9 count] != (id)3)
    {
      BOOL v13 = 1;
LABEL_9:
      objc_msgSend(v8[413], "stringWithFormat:", @"<%lld>", a3);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v10 = [v9 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_7;
    }
    uint64_t v11 = [v9 objectAtIndexedSubscript:2];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = v11;
LABEL_7:
      id v12 = v10;
      uint64_t v11 = v12;
      goto LABEL_13;
    }
    id v12 = 0;
LABEL_13:
    BOOL v13 = (a3 & 0xFFFFFFFFFFFFFFFDLL) == 0;
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      v14 = self;
      BOOL v15 = v8;
      v16 = v6;
      v17 = v7;
      v18 = [v9 objectAtIndexedSubscript:1];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        a3 = (int64_t)[v18 integerValue];
      }

      id v7 = v17;
      objc_super v6 = v16;
      unsigned int v8 = v15;
      self = v14;
      unsigned int v5 = v22;
    }

    if (!v12) {
      goto LABEL_9;
    }
LABEL_10:
    [v5 insertObject:v12 atIndex:0];
  }
  while (!v13);
  if ([v5 count]) {
    [v5 insertObject:&stru_100035E78 atIndex:0];
  }
  v19 = [v5 componentsJoinedByString:@"/"];

  return v19;
}

- (id)oidPath:(int64_t)a3
{
  return 0;
}

- (id)termIndex:(unint64_t)a3
{
  if ([(SIIndexer *)self termIndexCount] <= a3)
  {
    objc_super v6 = 0;
  }
  else
  {
    unsigned int v5 = [(SIIndexer *)self termIndex];
    objc_super v6 = v5;
    if (!v5 || [(TermIndex *)v5 cindex] != a3)
    {
      id v7 = [TermIndex alloc];
      index = self->_index;
      id v9 = [(SIIndexer *)self path];
      v10 = -[TermIndex initWithIndex:cindex:atPath:coreSpotlight:](v7, "initWithIndex:cindex:atPath:coreSpotlight:", index, a3, [v9 UTF8String], -[SIIndexer isCoreSpotlight](self, "isCoreSpotlight"));

      [(SIIndexer *)self setTermIndex:v10];
      objc_super v6 = v10;
    }
  }
  uint64_t v11 = v6;

  return v11;
}

- (void)iterateTermIndexes:(id)a3
{
  int v4 = (void (**)(id, void *, unsigned char *))a3;
  unint64_t v5 = [(SIIndexer *)self termIndexCount];
  char v10 = 0;
  if (v5)
  {
    unint64_t v6 = v5;
    unint64_t v7 = 0;
    do
    {
      unsigned int v8 = [(SIIndexer *)self termIndex:v7];
      if (v8) {
        v4[2](v4, v8, &v10);
      }

      ++v7;
      if (v10) {
        BOOL v9 = 1;
      }
      else {
        BOOL v9 = v7 >= v6;
      }
    }
    while (!v9);
  }
}

- (void)iterateTermIndexes:(int64_t)a3 block:(id)a4
{
  unint64_t v6 = (void (**)(id, void *, unsigned char *))a4;
  unint64_t v7 = [(SIIndexer *)self termIndex:a3];
  if (v7)
  {
    char v8 = 0;
    v6[2](v6, v7, &v8);
  }
  else
  {
    [(SIIndexer *)self iterateTermIndexes:v6];
  }
}

- (NSDictionary)indexProperties
{
  index = self->_index;
  if (index) {
    index = (void *)SICopyProperties();
  }

  return (NSDictionary *)index;
}

- (NSDictionary)propertyMap
{
  propertyMap = self->_propertyMap;
  if (!propertyMap)
  {
    propertyMap = self->_index;
    if (propertyMap)
    {
      int v4 = (NSDictionary *)_SICopyPropertyIDMap();
      unint64_t v5 = self->_propertyMap;
      self->_propertyMap = v4;

      propertyMap = self->_propertyMap;
    }
  }

  return (NSDictionary *)propertyMap;
}

- (NSDictionary)propertyNumMap
{
  propertyNumMap = self->_propertyNumMap;
  if (!propertyNumMap)
  {
    int v4 = [(SIIndexer *)self propertyMap];
    unint64_t v5 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v12 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (unint64_t)objc_msgSend(v11, "unsignedIntValue", (void)v17) & 0xFFFFFFF);
          BOOL v13 = [v6 objectForKeyedSubscript:v11];
          [v5 setObject:v13 forKeyedSubscript:v12];
        }
        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    v14 = (NSDictionary *)[v5 copy];
    BOOL v15 = self->_propertyNumMap;
    self->_propertyNumMap = v14;

    propertyNumMap = self->_propertyNumMap;
  }

  return propertyNumMap;
}

- (id)propertyName:(unint64_t)a3
{
  int v4 = [(SIIndexer *)self propertyNumMap];
  unint64_t v5 = +[NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKey:v5];

  return v6;
}

- (void)verify
{
  if ([(SIIndexer *)self isOpen] || [(SIIndexer *)self openWithOptions:0])
  {
    _SIConsistencyCheck();
    _SICheckIndexForDuplicateOids();
    index = self->_index;
    __SIIssueVerify(index, 0xFFFFLL);
  }
}

- (void)addRecords:(id)a3 forIDs:(unint64_t *)a4 completionHandler:(id)a5
{
  uint64_t v5 = __chkstk_darwin(self, a2, a3, a4, a5);
  id v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = v5;
  id v12 = v11;
  id v13 = v7;
  long long v34 = v12;
  id v14 = [v12 count];
  if (*(void *)(v10 + 136)) {
    BOOL v15 = v14 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    unsigned int v16 = 22;
    goto LABEL_33;
  }
  unint64_t v17 = (unint64_t)v14;
  long long v18 = v41;
  bzero(v41, 0x2008uLL);
  bzero(v40, 0x2008uLL);
  unsigned int v19 = [(id)v10 isXcodeIndex];
  if (v19) {
    long long v20 = v40;
  }
  else {
    long long v20 = 0;
  }
  if (v17 >= 0x401)
  {
    char v21 = v19;
    int v22 = malloc_type_malloc(8 * v17 + 8, 0x100004000313F17uLL);
    v23 = v22;
    if ((v21 & 1) == 0)
    {
      long long v20 = 0;
      atomic_fetch_add((atomic_uint *volatile)(v10 + 20), v17);
      atomic_fetch_add((atomic_uint *volatile)(v10 + 24), v17);
      char v24 = 1;
      long long v18 = v22;
      goto LABEL_17;
    }
    long long v20 = malloc_type_malloc(8 * v17 + 8, 0x100004000313F17uLL);
    long long v18 = v23;
  }
  atomic_fetch_add((atomic_uint *volatile)(v10 + 20), v17);
  atomic_fetch_add((atomic_uint *volatile)(v10 + 24), v17);
  void *v18 = 0;
  if (!v20)
  {
    char v24 = 1;
    goto LABEL_18;
  }
  char v24 = 0;
  v23 = v20;
LABEL_17:
  void *v23 = 0;
LABEL_18:
  uint64_t v25 = 0;
  while (1)
  {
    uint64_t v26 = *(void *)(v9 + 8 * v25);
    if (v26 < 2) {
      break;
    }
    v18[v25 + 1] = v26;
    if ((v24 & 1) == 0) {
      *(void *)&v20[8 * v25 + 8] = 2 * (v26 != 2);
    }
    if (v17 == ++v25)
    {
      id location = 0;
      objc_initWeak(&location, (id)v10);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10000E058;
      v35[3] = &unk_100035120;
      v37[1] = (id)v17;
      id v36 = v13;
      objc_copyWeak(v37, &location);
      int v27 = objc_retainBlock(v35);
      CFNullRef v39 = kCFNull;
      v28 = +[NSArray arrayWithObjects:&v39 count:1];
      v29 = [v28 arrayByAddingObjectsFromArray:v34];

      v30 = malloc_type_malloc(0x10uLL, 0xE0040E685C293uLL);
      uint64_t v31 = *(void *)(v10 + 136);
      id v32 = [v27 copy];
      void *v30 = v31;
      v30[1] = v32;
      if (SIBulkSetAttributes()) {
        unsigned int v16 = 0;
      }
      else {
        unsigned int v16 = 22;
      }

      objc_destroyWeak(v37);
      objc_destroyWeak(&location);
      goto LABEL_30;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100025E20();
  }
  unsigned int v16 = 22;
LABEL_30:
  if (v18 != (void *)v41)
  {
    free(v18);
    if ((v24 & 1) == 0) {
      free(v20);
    }
  }
LABEL_33:
  if (v13 && v16)
  {
    v33 = +[NSError errorWithDomain:@"SIIndexer" code:v16 userInfo:0];
    (*((void (**)(id, void *))v13 + 2))(v13, v33);
  }
}

- (void)updateRecords:(id)a3 forIDs:(unint64_t *)a4 completionHandler:(id)a5
{
  uint64_t v5 = __chkstk_darwin(self, a2, a3, a4, a5);
  id v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = v5;
  id v12 = v11;
  id v13 = v7;
  id v14 = [v12 count];
  if (*(void *)(v10 + 136)) {
    BOOL v15 = v14 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    unsigned int v16 = 22;
  }
  else
  {
    unint64_t v17 = (unint64_t)v14;
    long long v18 = v33;
    bzero(v33, 0x2008uLL);
    if (v17 >= 0x401) {
      long long v18 = malloc_type_malloc(8 * v17 + 8, 0x100004000313F17uLL);
    }
    uint64_t v19 = 0;
    atomic_fetch_add((atomic_uint *volatile)(v10 + 20), v17);
    atomic_fetch_add((atomic_uint *volatile)(v10 + 24), v17);
    void *v18 = 0;
    while (1)
    {
      uint64_t v20 = *(void *)(v9 + 8 * v19);
      if (v20 <= 1) {
        break;
      }
      v18[++v19] = v20;
      if (v17 == v19)
      {
        id location = 0;
        objc_initWeak(&location, (id)v10);
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10000E5A4;
        v28[3] = &unk_100035120;
        v30[1] = (id)v17;
        id v29 = v13;
        objc_copyWeak(v30, &location);
        char v21 = objc_retainBlock(v28);
        CFNullRef v32 = kCFNull;
        int v22 = +[NSArray arrayWithObjects:&v32 count:1];
        v23 = [v22 arrayByAddingObjectsFromArray:v12];

        char v24 = malloc_type_malloc(0x10uLL, 0xE0040E685C293uLL);
        uint64_t v25 = *(void *)(v10 + 136);
        id v26 = [v21 copy];
        *char v24 = v25;
        v24[1] = v26;
        if (SIBulkSetAttributes()) {
          unsigned int v16 = 0;
        }
        else {
          unsigned int v16 = 22;
        }

        objc_destroyWeak(v30);
        objc_destroyWeak(&location);
        goto LABEL_19;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100025E20();
    }
    unsigned int v16 = 22;
LABEL_19:
    if (v18 != (void *)v33) {
      free(v18);
    }
  }
  if (v13 && v16)
  {
    int v27 = +[NSError errorWithDomain:@"SIIndexer" code:v16 userInfo:0];
    (*((void (**)(id, void *))v13 + 2))(v13, v27);
  }
}

- (void)removeRecordsForIDs:(unint64_t *)a3 count:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v5 = __chkstk_darwin(self, a2, a3, a4, a5);
  unint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = (void *)v5;
  id v12 = v11;
  unsigned int v13 = 22;
  if (v7 && v10[17])
  {
    id v14 = v26;
    bzero(v26, 0x2008uLL);
    if (v7 >= 0x401) {
      id v14 = malloc_type_malloc(8 * v7 + 8, 0x100004000313F17uLL);
    }
    uint64_t v15 = 0;
    void *v14 = 0;
    while (1)
    {
      uint64_t v16 = *(void *)(v9 + 8 * v15);
      if (v16 <= 1) {
        break;
      }
      v14[++v15] = v16;
      if (v7 == v15)
      {
        id location = 0;
        objc_initWeak(&location, v10);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_10000EA08;
        v22[3] = &unk_100035120;
        v24[1] = (id)v7;
        id v23 = v12;
        objc_copyWeak(v24, &location);
        unint64_t v17 = objc_retainBlock(v22);
        long long v18 = malloc_type_malloc(0x10uLL, 0xE0040E685C293uLL);
        uint64_t v19 = v10[17];
        id v20 = [v17 copy];
        void *v18 = v19;
        v18[1] = v20;
        if (SIBulkSetAttributes()) {
          unsigned int v13 = 0;
        }
        else {
          unsigned int v13 = 22;
        }

        objc_destroyWeak(v24);
        objc_destroyWeak(&location);
        goto LABEL_15;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100025E20();
    }
    unsigned int v13 = 22;
LABEL_15:
    if (v14 != (void *)v26) {
      free(v14);
    }
  }
  if (v12 && v13)
  {
    char v21 = +[NSError errorWithDomain:@"SIIndexer" code:v13 userInfo:0];
    (*((void (**)(id, void *))v12 + 2))(v12, v21);
  }
}

- (void)issueCommit
{
  index = self->_index;
  if (index)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000EC24;
    v5[3] = &unk_100035148;
    v5[4] = self;
    unsigned int v3 = malloc_type_malloc(0x10uLL, 0xE0040E685C293uLL);
    id v4 = [v5 copy];
    *unsigned int v3 = index;
    v3[1] = v4;
    SISynchedOp();
  }
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  if (self->_index) {
    SISetProperty();
  }
}

- (void)split
{
  if ([(SIIndexer *)self isOpen])
  {
    _SIIssueSplit();
  }
}

- (void)merge
{
  if ([(SIIndexer *)self isOpen])
  {
    index = self->_index;
    __SIIssueMerge(index, 1);
  }
}

- (void)fullMerge
{
  if ([(SIIndexer *)self isOpen])
  {
    index = self->_index;
    __SIIssueFullMerge(index);
  }
}

- (void)oidParents:(id)a3
{
  id v4 = a3;
  if (([(SIIndexer *)self isSpotlightIndex] || [(SIIndexer *)self isCoreSpotlight])
    && ([(SIIndexer *)self isOpen] || [(SIIndexer *)self openWithOptions:0]))
  {
    _SIReverseStoreIterate();
  }
}

- (unsigned)relativeDocID:(unint64_t)a3
{
  uint64_t v5 = [(SIIndexer *)self termIndex];
  unint64_t v6 = v5;
  if (!v5
    || (unint64_t)[v5 base] >= a3
    || (unint64_t v7 = a3 - (void)[v6 base], v7 >= (unint64_t)objc_msgSend(v6, "doc_ids_limit")))
  {
    uint64_t v8 = sub_10001E1F8((uint64_t)self->_index);
    if (v8 < 1)
    {
LABEL_8:
      LODWORD(v7) = 0;
    }
    else
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      while (1)
      {
        id v11 = v6;
        unint64_t v6 = [(SIIndexer *)self termIndex:v10];

        unint64_t v12 = a3 - (void)[v6 base];
        if (v12 < (unint64_t)objc_msgSend(v6, "doc_ids_limit")) {
          break;
        }
        if (v9 == ++v10) {
          goto LABEL_8;
        }
      }
      LODWORD(v7) = v12;
    }
  }

  return v7;
}

- (unint64_t)oidForDocID:(unint64_t)a3
{
  uint64_t v5 = [(SIIndexer *)self termIndex];
  unint64_t v6 = v5;
  if (v5)
  {
    if ((unint64_t)[v5 base] < a3)
    {
      unint64_t v7 = a3 - (void)[v6 base];
      if (v7 < (unint64_t)objc_msgSend(v6, "doc_ids_limit"))
      {
        uint64_t v8 = v6;
        unint64_t v9 = v7;
LABEL_11:
        id v15 = [v8 oidForDocID:v9];
        goto LABEL_12;
      }
    }
  }
  uint64_t v10 = sub_10001E1F8((uint64_t)self->_index);
  if (v10 >= 1)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    while (1)
    {
      unsigned int v13 = v6;
      unint64_t v6 = [(SIIndexer *)self termIndex:v12];

      unint64_t v14 = a3 - (void)[v6 base];
      if (v14 < (unint64_t)objc_msgSend(v6, "doc_ids_limit")) {
        break;
      }
      if (v11 == ++v12) {
        goto LABEL_9;
      }
    }
    uint64_t v8 = v6;
    unint64_t v9 = v14;
    goto LABEL_11;
  }
LABEL_9:
  id v15 = 0;
LABEL_12:

  return (unint64_t)v15;
}

- (unsigned)groupForDocID:(unint64_t)a3
{
  uint64_t v5 = [(SIIndexer *)self termIndex];
  unint64_t v6 = v5;
  if (v5)
  {
    if ((unint64_t)[v5 base] < a3)
    {
      unint64_t v7 = a3 - (void)[v6 base];
      if (v7 < (unint64_t)objc_msgSend(v6, "doc_ids_limit"))
      {
        uint64_t v8 = v6;
        unint64_t v9 = v7;
LABEL_11:
        unsigned __int8 v15 = [v8 groupForDocID:v9];
        goto LABEL_12;
      }
    }
  }
  uint64_t v10 = sub_10001E1F8((uint64_t)self->_index);
  if (v10 >= 1)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    while (1)
    {
      unsigned int v13 = v6;
      unint64_t v6 = [(SIIndexer *)self termIndex:v12];

      unint64_t v14 = a3 - (void)[v6 base];
      if (v14 < (unint64_t)objc_msgSend(v6, "doc_ids_limit")) {
        break;
      }
      if (v11 == ++v12) {
        goto LABEL_9;
      }
    }
    uint64_t v8 = v6;
    unint64_t v9 = v14;
    goto LABEL_11;
  }
LABEL_9:
  unsigned __int8 v15 = 0;
LABEL_12:

  return v15;
}

- (int64_t)oidForPath:(const char *)a3 allowCreate:(BOOL)a4
{
  int64_t result = (int64_t)self->_psid;
  if (result) {
    return _SIPersistentIDStoreGetOIDForCPath();
  }
  return result;
}

- (void)rename:(const char *)a3 toPath:(const char *)a4
{
  if (self->_psid) {
    _SIPersistentIDStoreRename();
  }
}

- (void)deleteOID:(int64_t)a3
{
  if (self->_psid) {
    _SIPersistentIDStoreDelete();
  }
}

- (id)getAttributes:(id)a3 forOid:(int64_t)a4
{
  id v5 = a3;
  if (![v5 count])
  {
    unint64_t v6 = 0;
    goto LABEL_13;
  }
  if ([(SIIndexer *)self isOpen] || (unint64_t v6 = 0, [(SIIndexer *)self openWithOptions:0]))
  {
    unint64_t v7 = +[SIIndexer createUserContext:0];
    uint64_t v8 = (void *)SIGetAttributes();
    objc_opt_class();
    unint64_t v6 = 0;
    if (objc_opt_isKindOfClass())
    {
      if ([v8 count] != (id)2)
      {
LABEL_8:
        unint64_t v6 = 0;
        goto LABEL_9;
      }
      unint64_t v6 = [v8 objectAtIndexedSubscript:1];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        goto LABEL_8;
      }
    }
LABEL_9:
    if (v7) {
      CFRelease(v7);
    }
  }
LABEL_13:

  return v6;
}

- (int)_syncFinished:(BOOL)a3 docCounts:(id *)a4
{
  return 0;
}

- (int)_preSync:(id *)a3
{
  return 0;
}

- (void)_indexFinalize
{
  indexCallbacks = self->_indexCallbacks;
  if (indexCallbacks)
  {
    free(indexCallbacks);
    self->_indexCallbacks = 0;
  }
  self->_index = 0;
}

- (void)_reopen:(const char *)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    id v5 = a3;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Exit from bad index state %s", (uint8_t *)&v4, 0xCu);
  }
  exit(0);
}

- (BOOL)_repairOid:(int64_t)a3 type:(int)a4 flags:(int)a5
{
  return 1;
}

- (int)_assertPower:(const char *)a3 line:(int)a4 function:(const char *)a5
{
  return 0;
}

- (void)_accountingStart:(const char *)a3
{
  return 0;
}

- (void)setQueryTask:(id)a3 forID:(id)a4
{
  p_queryTasksRdWrLock = &self->_queryTasksRdWrLock;
  id v7 = a4;
  id v8 = a3;
  pthread_rwlock_wrlock(p_queryTasksRdWrLock);
  [(NSMutableDictionary *)self->_queryTasks setObject:v8 forKeyedSubscript:v7];

  pthread_rwlock_unlock(p_queryTasksRdWrLock);
}

- (id)getQueryTaskForID:(id)a3
{
  p_queryTasksRdWrLock = &self->_queryTasksRdWrLock;
  id v5 = a3;
  pthread_rwlock_rdlock(p_queryTasksRdWrLock);
  unint64_t v6 = [(NSMutableDictionary *)self->_queryTasks objectForKeyedSubscript:v5];

  pthread_rwlock_unlock(p_queryTasksRdWrLock);

  return v6;
}

- (id)allQueryTasks
{
  p_queryTasksRdWrLock = &self->_queryTasksRdWrLock;
  pthread_rwlock_rdlock(&self->_queryTasksRdWrLock);
  int v4 = [(NSMutableDictionary *)self->_queryTasks allValues];
  pthread_rwlock_unlock(p_queryTasksRdWrLock);

  return v4;
}

- (void)waitFor:(int)a3
{
  group = dispatch_group_create();
  dispatch_group_enter(group);
  SISynchedOp();
  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)bulkSetCSAttributes:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  unsigned int v13 = sub_10000F658;
  unint64_t v14 = &unk_100035170;
  unsigned __int8 v15 = self;
  id v16 = a4;
  id v17 = v6;
  id v18 = [objc_alloc((Class)NSConditionLock) initWithCondition:0];
  id v7 = v18;
  id v8 = v6;
  id v9 = v16;
  id v10 = [&v11 copy];
  _SIScheduleBackgroundOperation();

  objc_msgSend(v7, "lockWhenCondition:", 1, v11, v12, v13, v14, v15);
  [v7 unlock];
}

- (id)resultsForPommesUserQuery:(id)a3 withFields:(id)a4 maxCount:(int64_t)a5 languages:(id)a6 liftingRules:(id)a7 scope:(id)a8 pommesBundles:(id)a9
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v23 = a8;
  id v17 = a9;
  id v18 = (const void *)SIUserCtxCreateWithLanguages();
  +[NSString stringWithFormat:@"**=\"%@*\"cwdt", v13];
  char v24 = v14;
  CFAbsoluteTimeGetCurrent();
  uint64_t v25 = v13;
  if (SIQueryCreateWithParameters())
  {
    SIResultQueueCreate();
    SIExecuteQuery();
    uint64_t v19 = +[NSMutableDictionary dictionary];
    while (1)
    {
      while (1)
      {
        do
          id v20 = (_DWORD *)SIResultQueueDequeue();
        while (!v20);
        if (*v20 != 10) {
          break;
        }
        char v21 = (const void *)_MDPlistContainerCopyRootObject();
        NSLog(@"%@", v21);
        CFRelease(v21);
        SIResultBatchFree();
      }
      if (*v20 == 4) {
        break;
      }
      id v26 = v19;
      _MDStoreOIDArrayGetVectorCount();
      _MDStoreOIDArrayApplyFunction();
      SIResultBatchFree();
    }
    SIResultBatchFree();
    SICancel();
    SIResultQueueRelease();
    SIQueryRelease();
  }
  else
  {
    uint64_t v19 = 0;
  }
  if (v18) {
    CFRelease(v18);
  }

  return v19;
}

- (BOOL)isOpen
{
  return self->_isOpen;
}

- (void)setIsOpen:(BOOL)a3
{
  self->_isOpen = a3;
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (BOOL)persistentFileIDs
{
  return self->_persistentFileIDs;
}

- (void)setPersistentFileIDs:(BOOL)a3
{
  self->_persistentFileIDs = a3;
}

- (int)device
{
  return self->_device;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (SDDirtyIdleTimer)dirtyIdleTimer
{
  return self->_dirtyIdleTimer;
}

- (void)setDirtyIdleTimer:(id)a3
{
}

- (void)setPropertyMap:(id)a3
{
}

- (void)setPropertyNumMap:(id)a3
{
}

- (unsigned)addDocumentCount
{
  return atomic_load(&self->_addDocumentCount);
}

- (void)setAddDocumentCount:(unsigned int)a3
{
}

- (unsigned)addDocumentForSplitCount
{
  return atomic_load(&self->_addDocumentForSplitCount);
}

- (void)setAddDocumentForSplitCount:(unsigned int)a3
{
}

- (unsigned)completedDocumentCount
{
  return self->_completedDocumentCount;
}

- (void)setCompletedDocumentCount:(unsigned int)a3
{
  self->_completedDocumentCount = a3;
}

- (unsigned)completedBatchCount
{
  return self->_completedBatchCount;
}

- (void)setCompletedBatchCount:(unsigned int)a3
{
  self->_completedBatchCount = a3;
}

- (NSObject)volumeObject
{
  return self->_volumeObject;
}

- (void)setVolumeObject:(id)a3
{
}

- (TermIndex)termIndex
{
  return self->_termIndex;
}

- (void)setTermIndex:(id)a3
{
}

- (int)indexType
{
  return self->_indexType;
}

- (void)setIndexType:(int)a3
{
  self->_int indexType = a3;
}

- (_SI_PersistentIDStore)psid
{
  return self->_psid;
}

- (void)setPsid:(_SI_PersistentIDStore *)a3
{
  self->_psid = a3;
}

- (NSMutableDictionary)queryTasks
{
  return self->_queryTasks;
}

- (void)setQueryTasks:(id)a3
{
}

- (_opaque_pthread_rwlock_t)queryTasksRdWrLock
{
  long long v3 = *(_OWORD *)&self[1].__opaque[24];
  long long v4 = *(_OWORD *)&self[1].__opaque[40];
  long long v5 = *(_OWORD *)&self->__opaque[160];
  long long v6 = *(_OWORD *)&self[1].__sig;
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self->__opaque[176];
  *(_OWORD *)&retstr->__opaque[40] = v6;
  *(_OWORD *)&retstr->__opaque[56] = *(_OWORD *)&self[1].__opaque[8];
  *(_OWORD *)&retstr->__opaque[72] = v3;
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self->__opaque[144];
  *(_OWORD *)&retstr->__opaque[8] = v5;
  long long v7 = *(_OWORD *)&self[1].__opaque[88];
  long long v8 = *(_OWORD *)&self[1].__opaque[120];
  *(_OWORD *)&retstr->__opaque[152] = *(_OWORD *)&self[1].__opaque[104];
  *(_OWORD *)&retstr->__opaque[168] = v8;
  long long v9 = *(_OWORD *)&self[1].__opaque[56];
  long long v10 = *(_OWORD *)&self[1].__opaque[72];
  *(_OWORD *)&retstr->__opaque[88] = v4;
  *(_OWORD *)&retstr->__opaque[104] = v9;
  *(void *)&retstr->__opaque[184] = *(void *)&self[1].__opaque[136];
  *(_OWORD *)&retstr->__opaque[120] = v10;
  *(_OWORD *)&retstr->__opaque[136] = v7;
  return self;
}

- (void)setQueryTasksRdWrLock:(_opaque_pthread_rwlock_t *)a3
{
  *(_OWORD *)&self->_queryTasksRdWrLock.__sig = *(_OWORD *)&a3->__sig;
  long long v3 = *(_OWORD *)&a3->__opaque[8];
  long long v4 = *(_OWORD *)&a3->__opaque[24];
  long long v5 = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_queryTasksRdWrLock.__opaque[56] = *(_OWORD *)&a3->__opaque[56];
  *(_OWORD *)&self->_queryTasksRdWrLock.__opaque[40] = v5;
  *(_OWORD *)&self->_queryTasksRdWrLock.__opaque[24] = v4;
  *(_OWORD *)&self->_queryTasksRdWrLock.__opaque[8] = v3;
  long long v6 = *(_OWORD *)&a3->__opaque[72];
  long long v7 = *(_OWORD *)&a3->__opaque[88];
  long long v8 = *(_OWORD *)&a3->__opaque[120];
  *(_OWORD *)&self->_queryTasksRdWrLock.__opaque[104] = *(_OWORD *)&a3->__opaque[104];
  *(_OWORD *)&self->_queryTasksRdWrLock.__opaque[120] = v8;
  *(_OWORD *)&self->_queryTasksRdWrLock.__opaque[88] = v7;
  *(_OWORD *)&self->_queryTasksRdWrLock.__opaque[72] = v6;
  long long v9 = *(_OWORD *)&a3->__opaque[136];
  long long v10 = *(_OWORD *)&a3->__opaque[152];
  long long v11 = *(_OWORD *)&a3->__opaque[168];
  *(void *)&self->_queryTasksRdWrLock.__opaque[184] = *(void *)&a3->__opaque[184];
  *(_OWORD *)&self->_queryTasksRdWrLock.__opaque[152] = v10;
  *(_OWORD *)&self->_queryTasksRdWrLock.__opaque[168] = v11;
  *(_OWORD *)&self->_queryTasksRdWrLock.__opaque[136] = v9;
}

- (BOOL)permissions
{
  return self->_permissions;
}

- (void)setPermissions:(BOOL)a3
{
  self->_permissions = a3;
}

- (BOOL)isHFS
{
  return self->_isHFS;
}

- (void)setIsHFS:(BOOL)a3
{
  self->_isHFS = a3;
}

- (BOOL)isAPFS
{
  return self->_isAPFS;
}

- (void)setIsAPFS:(BOOL)a3
{
  self->_isAPFS = a3;
}

- (BOOL)inBatch
{
  return self->_inBatch;
}

- (void)setInBatch:(BOOL)a3
{
  self->_inBatch = a3;
}

- (int)cancel
{
  return self->_cancel;
}

- (void)setCancel:(int)a3
{
  self->_cancel = a3;
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (void)setRootPath:(id)a3
{
}

- (__SI)index
{
  return self->_index;
}

- (_SIIndexCallbacks)indexCallbacks
{
  return self->_indexCallbacks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_queryTasks, 0);
  objc_storeStrong((id *)&self->_termIndex, 0);
  objc_storeStrong((id *)&self->_volumeObject, 0);
  objc_storeStrong((id *)&self->_propertyNumMap, 0);
  objc_storeStrong((id *)&self->_propertyMap, 0);
  objc_storeStrong((id *)&self->_dirtyIdleTimer, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end