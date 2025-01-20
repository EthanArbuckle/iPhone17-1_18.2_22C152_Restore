@interface LSDatabaseContext
+ (LSDatabaseContext)sharedDatabaseContext;
+ (id)new;
- (BOOL)canAccess;
- (BOOL)isAccessing;
- (BOOL)startAccessingCurrentUserSessionReturningError:(id *)a3;
- (BOOL)startAccessingReturningError:(id *)a3;
- (BOOL)startAccessingSystemScopeReturningError:(id *)a3;
- (BOOL)startAccessingWithOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)startAccessingWithUserID:(unsigned int)a3 error:(id *)a4;
- (BOOL)startAccessingWithUserID:(unsigned int)a3 options:(unint64_t)a4 error:(id *)a5;
- (LSDatabaseContext)init;
- (NSData)currentPersistentIdentifier;
- (id)_init;
- (id)addDatabaseChangeObserver4WebKit:(id)a3;
- (void)accessCurrentUserSessionUsingBlock:(id)a3;
- (void)accessSystemScopeUsingBlock:(id)a3;
- (void)accessUsingBlock:(id)a3;
- (void)accessWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)accessWithUserID:(unsigned int)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)accessWithUserID:(unsigned int)a3 usingBlock:(id)a4;
- (void)getSystemContentDatabaseObject4WebKit:(id)a3;
- (void)observeDatabaseChange4WebKit:(id)a3;
- (void)releaseObservedDatabase4WebKit;
- (void)removeDatabaseChangeObserver4WebKit:(id)a3;
@end

@implementation LSDatabaseContext

- (BOOL)canAccess
{
  return _LSCurrentProcessMayMapDatabase() != 0;
}

+ (LSDatabaseContext)sharedDatabaseContext
{
  if (+[LSDatabaseContext sharedDatabaseContext]::once != -1) {
    dispatch_once(&+[LSDatabaseContext sharedDatabaseContext]::once, &__block_literal_global_25);
  }
  v2 = (void *)+[LSDatabaseContext sharedDatabaseContext]::result;

  return (LSDatabaseContext *)v2;
}

- (void)observeDatabaseChange4WebKit:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3 && object_getClass(a3) == (Class)MEMORY[0x1E4F14590])
  {
    string = (FSNode *)xpc_dictionary_get_string(a3, "path");
    if (string) {
      string = [[FSNode alloc] initWithFileSystemRepresentation:string flags:0 error:0];
    }
    v5 = xpc_dictionary_get_value(a3, "store");
    if (v5) {
      v6 = (const void *)_CSStoreCreateWithXPCRepresentation();
    }
    else {
      v6 = 0;
    }

    v7 = xpc_dictionary_get_value(a3, "insecureProcessID");
    v8 = v7;
    if (v7 && object_getClass(v7) == (Class)MEMORY[0x1E4F145F8])
    {
      int value = xpc_uint64_get_value(v8);

      BOOL v10 = v6 == 0;
      if (string && v6)
      {
        v11 = LaunchServices::DatabaseContext::getLog(v9);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = value;
          v12 = "Replacing local LS database with a copy pushed by process %llu.";
          v13 = v11;
          uint32_t v14 = 12;
          goto LABEL_18;
        }
LABEL_19:

        unsigned int v16 = _CFGetEUID();
        id v22 = 0;
        v17 = _LSDatabaseCreate(string, v16, v6, &v22);
        v18 = (LaunchServices::DatabaseContext *)v22;
        v19 = v18;
        if (v17)
        {
          *(void *)buf = v17;
          _LSContextObserveChange((void **)buf);
        }
        else
        {
          v21 = LaunchServices::DatabaseContext::getLog(v18);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v19;
            _os_log_impl(&dword_182959000, v21, OS_LOG_TYPE_INFO, "Could not replace the local LS database with a pushed copy: %@", buf, 0xCu);
          }
        }
LABEL_29:
        CFRelease(v6);
LABEL_30:

        return;
      }
    }
    else
    {

      BOOL v10 = v6 == 0;
      if (string && v6)
      {
        v11 = LaunchServices::DatabaseContext::getLog(v9);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v12 = "Replacing local LS database with a copy pushed by an unspecified process.";
          v13 = v11;
          uint32_t v14 = 2;
LABEL_18:
          _os_log_impl(&dword_182959000, v13, OS_LOG_TYPE_INFO, v12, buf, v14);
          goto LABEL_19;
        }
        goto LABEL_19;
      }
    }
    v20 = LaunchServices::DatabaseContext::getLog(v9);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182959000, v20, OS_LOG_TYPE_INFO, "Could not replace the local LS database with a pushed copy because the pushed XPC object was malformed.", buf, 2u);
    }

    if (v10) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
}

- (void)getSystemContentDatabaseObject4WebKit:(id)a3
{
  v6[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
  v6[1] = (void (*)(void, void))3221225472;
  v6[2] = (void (*)(void, void))__81__LSDatabaseContext_WebKitChangeTracking__getSystemContentDatabaseObject4WebKit___block_invoke;
  v6[3] = (void (*)(void, void))&unk_1E522BD18;
  v6[4] = (void (*)(void, void))a3;
  v4 = +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)_LSDReadService, v6);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__LSDatabaseContext_WebKitChangeTracking__getSystemContentDatabaseObject4WebKit___block_invoke_2;
  v5[3] = &unk_1E522E5C8;
  v5[4] = a3;
  [v4 getSystemContentStoreWithCompletionHandler:v5];
}

- (BOOL)startAccessingReturningError:(id *)a3
{
  return _LSDatabaseContextStartAccessing(0, 0, a3);
}

void __42__LSDatabaseContext_sharedDatabaseContext__block_invoke()
{
  id v0 = [[LSDatabaseContext alloc] _init];
  v1 = (void *)+[LSDatabaseContext sharedDatabaseContext]::result;
  +[LSDatabaseContext sharedDatabaseContext]::result = (uint64_t)v0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)LSDatabaseContext;
  return [(LSDatabaseContext *)&v3 init];
}

void __81__LSDatabaseContext_WebKitChangeTracking__getSystemContentDatabaseObject4WebKit___block_invoke_2(uint64_t a1, const __CSStore *a2, FSNode *a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = getXPCObjectForNodeAndStore(a3, a2);
  }
  id v6 = (id)v5;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSData)currentPersistentIdentifier
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = *(uint64_t **)LaunchServices::DatabaseContext::getPerThreadStateReference((LaunchServices::DatabaseContext *)self);
  if (!v2) {
    goto LABEL_3;
  }
  memset(v8, 0, 28);
  int CatalogTable = _CSStoreGetCatalogTable();
  _LSPersistentIdentifierDataMake(v2, CatalogTable, 0, (uint64_t)v8);
  uint64_t SequenceNumber = _LSDatabaseGetSequenceNumber();
  *(_OWORD *)v7 = v8[0];
  *(_OWORD *)&v7[12] = *(_OWORD *)((char *)v8 + 12);
  *(void *)&v7[28] = SequenceNumber;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v7 length:36];
  if (!v5)
  {
LABEL_3:
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9B8], "data", *(_OWORD *)v7, *(void *)&v7[16], *(_OWORD *)&v7[24]);
  }

  return (NSData *)v5;
}

+ (id)new
{
}

- (LSDatabaseContext)init
{
}

- (BOOL)startAccessingWithOptions:(unint64_t)a3 error:(id *)a4
{
  return _LSDatabaseContextStartAccessing(0, a3, a4);
}

- (BOOL)startAccessingWithUserID:(unsigned int)a3 error:(id *)a4
{
  unsigned int v5 = a3;
  return _LSDatabaseContextStartAccessing(&v5, 0, a4);
}

- (BOOL)startAccessingWithUserID:(unsigned int)a3 options:(unint64_t)a4 error:(id *)a5
{
  unsigned int v6 = a3;
  return _LSDatabaseContextStartAccessing(&v6, a4, a5);
}

- (BOOL)isAccessing
{
  return *((void *)LaunchServices::DatabaseContext::getPerThreadStateReference((LaunchServices::DatabaseContext *)self)
         + 4) > 0;
}

- (id)addDatabaseChangeObserver4WebKit:(id)a3
{
  uint32_t v14 = *(void ***)LaunchServices::DatabaseContext::getPerThreadStateReference((LaunchServices::DatabaseContext *)self);
  id v15 = 0;
  char v16 = 0;
  id v17 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v4 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v14, v4, 0);

  if (v5)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76__LSDatabaseContext_WebKitChangeTracking__addDatabaseChangeObserver4WebKit___block_invoke;
    v13[3] = &unk_1E522E5A0;
    v13[4] = a3;
    unsigned int v6 = (void (**)(void, void))MEMORY[0x18530F950](v13);
    v7 = +[_LSDServiceDomain defaultServiceDomain]();
    v8 = _LSContextAddChangeObserver(v5, v7, v6);

    if (v8) {
      v6[2](v6, v5);
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;
  if (v14 && v16) {
    _LSContextDestroy(v14);
  }
  id v10 = v15;
  uint32_t v14 = 0;
  id v15 = 0;

  char v16 = 0;
  id v11 = v17;
  id v17 = 0;

  return v9;
}

void __76__LSDatabaseContext_WebKitChangeTracking__addDatabaseChangeObserver4WebKit___block_invoke(uint64_t a1, uint64_t *a2)
{
  _LSDatabaseGetNode(*a2);
  unsigned int v6 = (FSNode *)objc_claimAutoreleasedReturnValue();
  v4 = getXPCObjectForNodeAndStore(v6, *(const __CSStore **)(*a2 + 8));
  uint64_t v5 = (void *)MEMORY[0x18530F680]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeDatabaseChangeObserver4WebKit:(id)a3
{
}

uint64_t __81__LSDatabaseContext_WebKitChangeTracking__getSystemContentDatabaseObject4WebKit___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)releaseObservedDatabase4WebKit
{
  id v9 = 0;
  unsigned int v6 = 0;
  id v7 = 0;
  char v8 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v2 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  objc_super v3 = (LSSessionKey **)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&v6, v2, 0);

  if (v3) {
    _LSContextReleaseObservedChange(v3);
  }
  if (v6 && v8) {
    _LSContextDestroy(v6);
  }
  id v4 = v7;
  unsigned int v6 = 0;
  id v7 = 0;

  char v8 = 0;
  id v5 = v9;
  id v9 = 0;
}

- (void)accessUsingBlock:(id)a3
{
}

- (void)accessWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
}

- (void)accessWithUserID:(unsigned int)a3 usingBlock:(id)a4
{
  unsigned int v4 = a3;
  _LSDatabaseContextAccessUsingBlock(&v4, 0, (uint64_t)a4);
}

- (void)accessWithUserID:(unsigned int)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  unsigned int v5 = a3;
  _LSDatabaseContextAccessUsingBlock(&v5, a4, (uint64_t)a5);
}

- (BOOL)startAccessingSystemScopeReturningError:(id *)a3
{
  systemIfExistsElseDefaultServiceDomain();
  unsigned int v4 = (LaunchServices::DatabaseContext *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = _LSDatabaseContextStartAccessingWithDomain(v4, 0, a3);

  return (char)a3;
}

- (void)accessSystemScopeUsingBlock:(id)a3
{
  systemIfExistsElseDefaultServiceDomain();
  unsigned int v4 = (LaunchServices::DatabaseContext *)objc_claimAutoreleasedReturnValue();
  _LSDatabaseContextAccessWithDomainUsingBlock(v4, 0, (uint64_t)a3);
}

- (BOOL)startAccessingCurrentUserSessionReturningError:(id *)a3
{
  +[_LSDServiceDomain currentUserSessionDomain]();
  unsigned int v4 = (LaunchServices::DatabaseContext *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = _LSDatabaseContextStartAccessingWithDomain(v4, 0, a3);

  return (char)a3;
}

- (void)accessCurrentUserSessionUsingBlock:(id)a3
{
  +[_LSDServiceDomain currentUserSessionDomain]();
  unsigned int v4 = (LaunchServices::DatabaseContext *)objc_claimAutoreleasedReturnValue();
  _LSDatabaseContextAccessWithDomainUsingBlock(v4, 0, (uint64_t)a3);
}

@end