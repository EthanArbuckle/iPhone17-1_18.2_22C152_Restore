@interface GSPermanentStorage
+ (id)storageIDForItemAtURL:(id)a3 error:(id *)a4;
+ (id)storagePrefixForFileDescriptor:(int)a3 error:(id *)a4;
- (BOOL)_refreshRemoteIDWithFileDescriptor:(int)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)mergeAdditionUserInfo:(id)a3 value:(id)a4 error:(id *)a5;
- (BOOL)replaceDocumentWithContentsOfAddition:(id)a3 preservingCurrentVersionWithCreationInfo:(id)a4 createdAddition:(id *)a5 error:(id *)a6;
- (BOOL)replaceDocumentWithContentsOfItemAtURL:(id)a3 preservingCurrentVersionWithCreationInfo:(id)a4 createdAddition:(id *)a5 error:(id *)a6;
- (BOOL)setAdditionConflictResolved:(id)a3 value:(BOOL)a4 error:(id *)a5;
- (BOOL)setAdditionDisplayName:(id)a3 value:(id)a4 error:(id *)a5;
- (BOOL)setAdditionOptions:(id)a3 value:(unint64_t)a4 error:(id *)a5;
- (BOOL)transferToItemAtURL:(id)a3 error:(id *)a4;
- (GSDocumentIdentifier)documentID;
- (GSPermanentStorage)init;
- (GSPermanentStorage)initWithFileDescriptor:(int)a3 documentID:(id)a4 forItemAtURL:(id)a5 error:(id *)a6;
- (GSStagingPrefix)stagingPrefix;
- (NSCopying)persistentIdentifier;
- (NSData)privExtension;
- (NSData)pubExtension;
- (NSURL)documentURL;
- (id)URLforReplacingItemWithError:(id *)a3;
- (id)_calculateSpecForAdditionRemoval:(id)a3;
- (id)_removalErrorDictionaryCreation:(id)a3 withAdditions:(id)a4;
- (id)additionWithName:(id)a3 inNameSpace:(id)a4 error:(id *)a5;
- (id)additionsWithNames:(id)a3 inNameSpace:(id)a4 error:(id *)a5;
- (id)description;
- (id)enumeratorForAdditionsInNameSpace:(id)a3 withOptions:(unint64_t)a4 withoutOptions:(unint64_t)a5 ordering:(int)a6;
- (id)getAdditionDictionary:(id)a3 error:(id *)a4;
- (id)prepareAdditionCreationWithItemAtURL:(id)a3 byMoving:(BOOL)a4 creationInfo:(id)a5 error:(id *)a6;
- (id)setAdditionNameSpace:(id)a3 value:(id)a4 error:(id *)a5;
- (id)stagingURLforCreatingAdditionWithError:(id *)a3;
- (int64_t)remoteID;
- (unint64_t)hash;
- (unint64_t)storageID;
- (void)_connectionWithDaemonWasLost;
- (void)_invalidate;
- (void)cleanupStagingURL:(id)a3;
- (void)createAdditionStagedAtURL:(id)a3 creationInfo:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)finalize;
- (void)removeAdditions:(id)a3 completionHandler:(id)a4;
- (void)removeAllAdditionsForNamespaces:(id)a3 completionHandler:(id)a4;
- (void)setDocumentURL:(id)a3;
- (void)setPrivExtension:(id)a3;
- (void)setPubExtension:(id)a3;
- (void)setStagingPrefix:(id)a3;
@end

@implementation GSPermanentStorage

- (GSDocumentIdentifier)documentID
{
  return self->_documentID;
}

+ (id)storagePrefixForFileDescriptor:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  v6 = +[GSDaemonProxySync proxy];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v5 closeOnDealloc:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__GSPermanentStorage_storagePrefixForFileDescriptor_error___block_invoke;
  v11[3] = &unk_1E6C9F1B0;
  id v8 = v6;
  id v12 = v8;
  [v8 permanentStoragePrefixForHandle:v7 reply:v11];
  v9 = [v8 result];
  if (a4)
  {
    *a4 = [v8 error];
  }

  return v9;
}

uint64_t __59__GSPermanentStorage_storagePrefixForFileDescriptor_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleObjResult:a2 error:a3];
}

+ (id)storageIDForItemAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = open((const char *)[v5 fileSystemRepresentation], 0);
  if ((v6 & 0x80000000) != 0)
  {
    id v12 = NSString;
    v13 = [v5 path];
    id v10 = [v12 stringWithFormat:@"unable to open \"%@\"", v13];

    int v14 = *__error();
    v15 = gs_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      _RemoveTreeInternal_cold_1();
    }

    if (a4)
    {
      _GSErrorForErrno(v14, v10);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    uint64_t v7 = v6;
    id v8 = +[GSDaemonProxySync proxy];
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v7 closeOnDealloc:1];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __50__GSPermanentStorage_storageIDForItemAtURL_error___block_invoke;
    v17[3] = &unk_1E6C9F1D8;
    id v10 = v8;
    id v18 = v10;
    [v10 permanentStorageIDForHandle:v9 reply:v17];
    v11 = [v10 result];
    if (a4)
    {
      *a4 = [v10 error];
    }
  }
  return v11;
}

void __50__GSPermanentStorage_storageIDForItemAtURL_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (a3)
  {
    v4 = *(void **)(a1 + 32);
    [v4 handleObjResult:0 error:a3];
  }
  else
  {
    id v6 = [NSNumber numberWithUnsignedLongLong:a2];
    id v5 = [v6 stringValue];
    [v3 handleObjResult:v5 error:0];
  }
}

- (GSPermanentStorage)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = _NSMethodExceptionProem();
  [v3 raise:v4, @"%@: cannot use -init for initialization", v5 format];

  return 0;
}

- (GSPermanentStorage)initWithFileDescriptor:(int)a3 documentID:(id)a4 forItemAtURL:(id)a5 error:(id *)a6
{
  uint64_t v9 = *(void *)&a3;
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)GSPermanentStorage;
  v13 = [(GSPermanentStorage *)&v16 init];
  int v14 = v13;
  if (v13)
  {
    v13->_pubHandle = -1;
    v13->_privHandle = -1;
    objc_storeStrong((id *)&v13->_documentURL, a5);
    objc_storeStrong((id *)&v14->_documentID, a4);
    if (![(GSPermanentStorage *)v14 _refreshRemoteIDWithFileDescriptor:v9 error:a6])
    {

      int v14 = 0;
    }
  }

  return v14;
}

- (NSData)pubExtension
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_pubExtension;
  objc_sync_exit(v2);

  return v3;
}

- (void)setPubExtension:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  if ((v6->_pubHandle & 0x8000000000000000) == 0)
  {
    sandbox_extension_release();
    v6->_pubHandle = -1;
  }
  objc_storeStrong((id *)&v6->_pubExtension, a3);
  if (v6->_pubExtension)
  {
    [(NSData *)v6->_pubExtension bytes];
    uint64_t v7 = sandbox_extension_consume();
    v6->_pubHandle = v7;
    if (v7 < 0)
    {
      id v8 = gs_default_log();
      if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      {
        pubExtension = v6->_pubExtension;
        int v10 = *__error();
        id v11 = __error();
        id v12 = strerror(*v11);
        int v13 = 138412802;
        int v14 = pubExtension;
        __int16 v15 = 1024;
        int v16 = v10;
        __int16 v17 = 2080;
        id v18 = v12;
        _os_log_error_impl(&dword_1DC715000, v8, (os_log_type_t)0x90u, "[ERROR] Failed consuming extension %@; error %d (%s)",
          (uint8_t *)&v13,
          0x1Cu);
      }
    }
  }
  objc_sync_exit(v6);
}

- (NSData)privExtension
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_privExtension;
  objc_sync_exit(v2);

  return v3;
}

- (void)setPrivExtension:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  if ((v6->_privHandle & 0x8000000000000000) == 0)
  {
    sandbox_extension_release();
    v6->_privHandle = -1;
  }
  objc_storeStrong((id *)&v6->_privExtension, a3);
  if (v6->_privExtension)
  {
    [(NSData *)v6->_privExtension bytes];
    uint64_t v7 = sandbox_extension_consume();
    v6->_privHandle = v7;
    if (v7 < 0)
    {
      id v8 = gs_default_log();
      if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      {
        privExtension = v6->_privExtension;
        int v10 = *__error();
        id v11 = __error();
        id v12 = strerror(*v11);
        int v13 = 138412802;
        int v14 = privExtension;
        __int16 v15 = 1024;
        int v16 = v10;
        __int16 v17 = 2080;
        id v18 = v12;
        _os_log_error_impl(&dword_1DC715000, v8, (os_log_type_t)0x90u, "[ERROR] Failed consuming extension %@; error %d (%s)",
          (uint8_t *)&v13,
          0x1Cu);
      }
    }
  }
  objc_sync_exit(v6);
}

- (BOOL)_refreshRemoteIDWithFileDescriptor:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = +[GSDaemonProxySync proxy];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v5 closeOnDealloc:0];
  unint64_t v9 = atomic_fetch_add(&gPermanentStorageCurrentID, 1uLL) + 1;
  self->_remoteID = v9;
  documentID = self->_documentID;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  __int16 v17 = __63__GSPermanentStorage__refreshRemoteIDWithFileDescriptor_error___block_invoke;
  id v18 = &unk_1E6C9F200;
  uint64_t v19 = self;
  id v11 = v7;
  id v20 = v11;
  [v11 permanentStorageOpenForHandle:v8 withRemoteID:v9 andDocumentID:documentID reply:&v15];
  id v12 = objc_msgSend(v11, "result", v15, v16, v17, v18, v19);
  if (a4)
  {
    *a4 = [v11 error];
  }
  if (v12)
  {
    BOOL v13 = self->_remoteID != 0;
  }
  else
  {
    BOOL v13 = 0;
    self->_remoteID = 0;
  }

  return v13;
}

void __63__GSPermanentStorage__refreshRemoteIDWithFileDescriptor_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v11 = a3;
  id v9 = a4;
  id v10 = a5;
  if (a2)
  {
    *(void *)(*(void *)(a1 + 32) + 40) = [a2 longLongValue];
    if (v11) {
      objc_msgSend(*(id *)(a1 + 32), "setPubExtension:");
    }
    if (v9) {
      [*(id *)(a1 + 32) setPrivExtension:v9];
    }
  }
  [*(id *)(a1 + 40) handleBoolResult:a2 != 0 error:v10];
}

- (int64_t)remoteID
{
  int64_t result = self->_remoteID;
  if (!result)
  {
    uint64_t v4 = self;
    objc_sync_enter(v4);
    if (!self->_remoteID)
    {
      uint64_t v5 = open([(NSURL *)v4->_documentURL fileSystemRepresentation], 33024);
      if ((v5 & 0x80000000) == 0)
      {
        [(GSPermanentStorage *)v4 _refreshRemoteIDWithFileDescriptor:v5 error:0];
        close(v5);
      }
    }
    objc_sync_exit(v4);

    return self->_remoteID;
  }
  return result;
}

- (void)_connectionWithDaemonWasLost
{
  self->_remoteID = 0;
}

- (void)_invalidate
{
  [(GSPermanentStorage *)self setPubExtension:0];
  [(GSPermanentStorage *)self setPrivExtension:0];
  unint64_t remoteID = self->_remoteID;
  if (remoteID)
  {
    if (_invalidate_onceToken != -1) {
      dispatch_once(&_invalidate_onceToken, &__block_literal_global_2);
    }
    self->_unint64_t remoteID = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__GSPermanentStorage__invalidate__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = remoteID;
    dispatch_async((dispatch_queue_t)_invalidate_invalidationQueue, block);
  }
}

void __33__GSPermanentStorage__invalidate__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.genstore.invalidation-queue", v2);
  v1 = (void *)_invalidate_invalidationQueue;
  _invalidate_invalidationQueue = (uint64_t)v0;
}

void __33__GSPermanentStorage__invalidate__block_invoke_2(uint64_t a1)
{
  GSDaemonProxy(0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 permanentStorageClose:*(void *)(a1 + 32)];
}

- (void)finalize
{
  [(GSPermanentStorage *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)GSPermanentStorage;
  [(GSPermanentStorage *)&v3 finalize];
}

- (void)dealloc
{
  [(GSPermanentStorage *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)GSPermanentStorage;
  [(GSPermanentStorage *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (GSPermanentStorage *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(GSDocumentIdentifier *)self->_documentID isEqual:v4->_documentID];
  }

  return v5;
}

- (unint64_t)hash
{
  return [(GSDocumentIdentifier *)self->_documentID hash];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<GSPermanentStorage %p { %@ url:%@ }>", self, self->_documentID, self->_documentURL];
}

- (id)getAdditionDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = +[GSDaemonProxySync proxy];
  int64_t v8 = [(GSPermanentStorage *)self remoteID];
  id v9 = [v6 nameSpace];
  id v10 = [v6 name];

  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __50__GSPermanentStorage_getAdditionDictionary_error___block_invoke;
  __int16 v17 = &unk_1E6C9F248;
  id v18 = self;
  id v11 = v7;
  id v19 = v11;
  [v11 getAdditionInStorage:v8 andNameSpace:v9 named:v10 completionHandler:&v14];

  id v12 = objc_msgSend(v11, "result", v14, v15, v16, v17, v18);
  if (a4)
  {
    *a4 = [v11 error];
  }

  return v12;
}

void __50__GSPermanentStorage_getAdditionDictionary_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v12 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9) {
    [*(id *)(a1 + 32) setPubExtension:v9];
  }
  if (v10) {
    [*(id *)(a1 + 32) setPrivExtension:v10];
  }
  [*(id *)(a1 + 40) handleObjResult:v12 error:v11];
}

- (BOOL)setAdditionOptions:(id)a3 value:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = +[GSDaemonProxySync proxy];
  objc_initWeak(&location, v9);
  int64_t v10 = [(GSPermanentStorage *)self remoteID];
  id v11 = [v8 nameSpace];
  id v12 = [v8 name];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __53__GSPermanentStorage_setAdditionOptions_value_error___block_invoke;
  id v19 = &unk_1E6C9F270;
  objc_copyWeak(&v20, &location);
  [v9 setAdditionOptionsInStorage:v10 nameSpace:v11 additionName:v12 value:a4 reply:&v16];

  BOOL v13 = objc_msgSend(v9, "result", v16, v17, v18, v19);
  if (a5)
  {
    *a5 = [v9 error];
  }
  char v14 = [v13 BOOLValue];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v14;
}

void __53__GSPermanentStorage_setAdditionOptions_value_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained handleBoolResult:a2 error:v5];
}

- (BOOL)setAdditionDisplayName:(id)a3 value:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = +[GSDaemonProxySync proxy];
  objc_initWeak(&location, v10);
  int64_t v11 = [(GSPermanentStorage *)self remoteID];
  id v12 = [v8 nameSpace];
  BOOL v13 = [v8 name];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __57__GSPermanentStorage_setAdditionDisplayName_value_error___block_invoke;
  id v20 = &unk_1E6C9F270;
  objc_copyWeak(&v21, &location);
  [v10 setAdditionDisplayNameInStorage:v11 nameSpace:v12 additionName:v13 value:v9 reply:&v17];

  char v14 = objc_msgSend(v10, "result", v17, v18, v19, v20);
  if (a5)
  {
    *a5 = [v10 error];
  }
  char v15 = [v14 BOOLValue];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v15;
}

void __57__GSPermanentStorage_setAdditionDisplayName_value_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained handleBoolResult:a2 error:v5];
}

- (BOOL)setAdditionConflictResolved:(id)a3 value:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = +[GSDaemonProxySync proxy];
  objc_initWeak(&location, v9);
  int64_t v10 = [(GSPermanentStorage *)self remoteID];
  int64_t v11 = [v8 nameSpace];
  id v12 = [v8 name];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __62__GSPermanentStorage_setAdditionConflictResolved_value_error___block_invoke;
  id v19 = &unk_1E6C9F270;
  objc_copyWeak(&v20, &location);
  [v9 setAdditionConflictResolvedInStorage:v10 nameSpace:v11 additionName:v12 value:v6 reply:&v16];

  BOOL v13 = objc_msgSend(v9, "result", v16, v17, v18, v19);
  if (a5)
  {
    *a5 = [v9 error];
  }
  char v14 = [v13 BOOLValue];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v14;
}

void __62__GSPermanentStorage_setAdditionConflictResolved_value_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained handleBoolResult:a2 error:v5];
}

- (id)setAdditionNameSpace:(id)a3 value:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = +[GSDaemonProxySync proxy];
  objc_initWeak(&location, v10);
  int64_t v11 = [(GSPermanentStorage *)self remoteID];
  id v12 = [v8 nameSpace];
  BOOL v13 = [v8 name];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __55__GSPermanentStorage_setAdditionNameSpace_value_error___block_invoke;
  id v19 = &unk_1E6C9F298;
  objc_copyWeak(&v20, &location);
  [v10 setAdditionNameSpaceInStorage:v11 nameSpace:v12 additionName:v13 value:v9 completionHandler:&v16];

  char v14 = objc_msgSend(v10, "result", v16, v17, v18, v19);
  if (a5)
  {
    *a5 = [v10 error];
  }
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v14;
}

void __55__GSPermanentStorage_setAdditionNameSpace_value_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained handleObjResult:v6 error:v5];
}

- (BOOL)mergeAdditionUserInfo:(id)a3 value:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = +[GSDaemonProxySync proxy];
  int64_t v11 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v9 format:200 options:0 error:a5];

  if (v11)
  {
    int64_t v12 = [(GSPermanentStorage *)self remoteID];
    BOOL v13 = [v8 nameSpace];
    char v14 = [v8 name];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __56__GSPermanentStorage_mergeAdditionUserInfo_value_error___block_invoke;
    v19[3] = &unk_1E6C9F2C0;
    id v15 = v10;
    id v20 = v15;
    [v15 mergeAdditionInfoValueInStorage:v12 nameSpace:v13 additionName:v14 value:v11 reply:v19];

    uint64_t v16 = [v15 result];
    if (a5)
    {
      *a5 = [v15 error];
    }
    char v17 = [v16 BOOLValue];
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

uint64_t __56__GSPermanentStorage_mergeAdditionUserInfo_value_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleBoolResult:a2 error:a3];
}

- (id)stagingURLforCreatingAdditionWithError:(id *)a3
{
  objc_super v3 = [(GSStagingPrefix *)self->_stagingPrefix stagingPathforCreatingAdditionWithError:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)URLforReplacingItemWithError:(id *)a3
{
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [v5 URLForDirectory:99 inDomain:1 appropriateForURL:self->_documentURL create:1 error:a3];

  return v6;
}

- (void)cleanupStagingURL:(id)a3
{
  stagingPrefix = self->_stagingPrefix;
  id v4 = [a3 path];
  [(GSStagingPrefix *)stagingPrefix cleanupStagingPath:v4];
}

- (id)prepareAdditionCreationWithItemAtURL:(id)a3 byMoving:(BOOL)a4 creationInfo:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = v10;
  BOOL v13 = v12;
  if (v8)
  {
    id v14 = v12;
    int v15 = open((const char *)[v14 fileSystemRepresentation], 0);
    if (v15 < 0)
    {
      v29 = NSString;
      v30 = [v14 path];
      uint64_t v18 = [v29 stringWithFormat:@"Unable to open %@", v30];

      int v31 = *__error();
      v32 = gs_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        _RemoveTreeInternal_cold_1();
      }

      if (!a6) {
        goto LABEL_19;
      }
      id v20 = _GSErrorForErrno(v31, v18);
      goto LABEL_18;
    }
    int v16 = v15;
    int v17 = GSGetDocumentID(v15, 0);
    close(v16);
    if (self->_documentID->documentID == v17)
    {
      uint64_t v18 = [NSString stringWithFormat:@"Can't add a generation to the forward facing file by moving the forward facing file to be that new generation."];
      id v19 = gs_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[GSPermanentStorage prepareAdditionCreationWithItemAtURL:byMoving:creationInfo:error:]((uint64_t)v18, v19);
      }

      if (!a6) {
        goto LABEL_19;
      }
      id v20 = _GSErrorForStatus(104, v18, 0);
LABEL_18:
      *a6 = v20;
LABEL_19:

LABEL_32:
      id v23 = 0;
      goto LABEL_39;
    }
  }
  stagingPrefix = self->_stagingPrefix;
  v22 = [v13 path];
  LOBYTE(stagingPrefix) = [(GSStagingPrefix *)stagingPrefix isStagedPath:v22];

  if ((stagingPrefix & 1) == 0)
  {
    uint64_t v24 = [(GSPermanentStorage *)self stagingURLforCreatingAdditionWithError:a6];
    if (!v24)
    {
      id v23 = 0;
      id v14 = v13;
      goto LABEL_39;
    }
    v25 = (void *)v24;
    v26 = [v11 objectForKey:@"kGSAdditionName"];
    v27 = v26;
    if (v26)
    {
      id v28 = v26;
    }
    else
    {
      id v28 = [v13 lastPathComponent];
    }
    v33 = v28;

    v34 = [v11 objectForKeyedSubscript:@"kGSAdditionKeepFileID"];
    uint64_t v35 = [v34 BOOLValue];

    v36 = [v25 URLByAppendingPathComponent:v33];

    v37 = (std::__fs::filesystem::path *)[v13 fileSystemRepresentation];
    id v14 = v36;
    if (!GSStageTree(v37, (std::__fs::filesystem::path *)[v14 fileSystemRepresentation], v8, v35, a6))
    {
      id v43 = v25;
      _RemoveTree((char *)[v43 fileSystemRepresentation], 0, 0);

      goto LABEL_32;
    }

LABEL_24:
    id v14 = v14;
    v38 = (char *)[v14 fileSystemRepresentation];
    v39 = GSAdditionComputePOSIXName(v11, self->_documentURL, v14, a6);
    if (v39)
    {
      v40 = v39;
      if (!GSSetOriginalPOSIXName(v38, v39, a6))
      {
        id v23 = 0;
        v41 = v40;
        goto LABEL_38;
      }
      v41 = GSAdditionComputeDN(v11, self->_documentURL, v14, a6);

      if (v41 && GSSetOriginalDisplayName(v38, v41, a6))
      {
        v42 = GSAdditionValidateUInfo(v11, a6);
        if (v42 && GSSetInfoDictionary(v38, v42, a6)) {
          id v23 = v14;
        }
        else {
          id v23 = 0;
        }

        goto LABEL_38;
      }
    }
    else
    {
      v41 = 0;
    }
    id v23 = 0;
LABEL_38:

    goto LABEL_39;
  }
  id v14 = v13;
  id v23 = 0;
  if (GSArchiveTree((char *)[v14 fileSystemRepresentation], 0, 0, a6)) {
    goto LABEL_24;
  }
LABEL_39:

  return v23;
}

- (void)createAdditionStagedAtURL:(id)a3 creationInfo:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = v8;
  uint64_t v12 = open((const char *)[v11 fileSystemRepresentation], 256);
  if ((v12 & 0x80000000) != 0)
  {
    uint64_t v18 = [NSString stringWithFormat:@"Unable to open %@", v11];
    int v19 = *__error();
    id v20 = gs_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      _RemoveTreeInternal_cold_1();
    }

    id v21 = _GSErrorForErrno(v19, v18);

    v10[2](v10, 0, v21);
    stagingPrefix = self->_stagingPrefix;
    BOOL v13 = [v11 path];
    [(GSStagingPrefix *)stagingPrefix cleanupStagingPath:v13];
  }
  else
  {
    BOOL v13 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v12 closeOnDealloc:1];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __79__GSPermanentStorage_createAdditionStagedAtURL_creationInfo_completionHandler___block_invoke;
    v26[3] = &unk_1E6C9F2E8;
    id v14 = v10;
    id v28 = v14;
    v26[4] = self;
    id v15 = v11;
    id v27 = v15;
    int v16 = GSDaemonProxy(v26);
    int64_t v17 = [(GSPermanentStorage *)self remoteID];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __79__GSPermanentStorage_createAdditionStagedAtURL_creationInfo_completionHandler___block_invoke_2;
    v23[3] = &unk_1E6C9F310;
    v23[4] = self;
    v25 = v14;
    id v24 = v15;
    [v16 createAdditionInStorage:v17 stagedFileDescriptor:v13 creationInfo:v9 completionHandler:v23];
  }
}

void __79__GSPermanentStorage_createAdditionStagedAtURL_creationInfo_completionHandler___block_invoke(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  id v2 = (void *)a1[5];
  objc_super v3 = *(void **)(a1[4] + 16);
  id v4 = [v2 path];
  [v3 cleanupStagingPath:v4];
}

void __79__GSPermanentStorage_createAdditionStagedAtURL_creationInfo_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v16 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9) {
    [*(id *)(a1 + 32) setPubExtension:v9];
  }
  if (v10) {
    [*(id *)(a1 + 32) setPrivExtension:v10];
  }
  if (v16) {
    id v12 = [[GSAddition alloc] _initWithStorage:*(void *)(a1 + 32) andDictionary:v16];
  }
  else {
    id v12 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  BOOL v13 = *(void **)(a1 + 40);
  id v14 = *(void **)(*(void *)(a1 + 32) + 16);
  id v15 = [v13 path];
  [v14 cleanupStagingPath:v15];
}

- (BOOL)replaceDocumentWithContentsOfAddition:(id)a3 preservingCurrentVersionWithCreationInfo:(id)a4 createdAddition:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (v11)
  {
    id v12 = GSAdditionSaveBlocking(self, self->_documentURL, 0, v11, a6);
    if (!v12)
    {
      BOOL v16 = 0;
      goto LABEL_11;
    }
    BOOL v13 = v12;
    if (a5) {
      *a5 = v12;
    }
  }
  GSRestoreAdditionInternal(self->_documentURL, v10, a6);
  id v14 = (NSURL *)objc_claimAutoreleasedReturnValue();
  id v15 = v14;
  BOOL v16 = v14 != 0;
  if (v14 && self->_documentURL != v14) {
    [(GSPermanentStorage *)self setDocumentURL:v14];
  }

LABEL_11:
  return v16;
}

- (BOOL)replaceDocumentWithContentsOfItemAtURL:(id)a3 preservingCurrentVersionWithCreationInfo:(id)a4 createdAddition:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (v11)
  {
    id v12 = GSAdditionSaveBlocking(self, self->_documentURL, 0, v11, a6);
    if (!v12)
    {
LABEL_11:
      BOOL v16 = 0;
      goto LABEL_12;
    }
    BOOL v13 = v12;
    if (a5) {
      *a5 = v12;
    }
  }
  if (![(NSURL *)self->_documentURL checkResourceIsReachableAndReturnError:a6])goto LABEL_11; {
  GSReplaceDocumentInternal(self->_documentURL, v10, a6);
  }
  id v14 = (NSURL *)objc_claimAutoreleasedReturnValue();
  id v15 = v14;
  BOOL v16 = v14 != 0;
  if (v14 && self->_documentURL != v14) {
    [(GSPermanentStorage *)self setDocumentURL:v14];
  }

LABEL_12:
  return v16;
}

- (id)additionWithName:(id)a3 inNameSpace:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[GSDaemonProxySync proxy];
  int64_t v11 = [(GSPermanentStorage *)self remoteID];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  int64_t v17 = __57__GSPermanentStorage_additionWithName_inNameSpace_error___block_invoke;
  uint64_t v18 = &unk_1E6C9F248;
  int v19 = self;
  id v12 = v10;
  id v20 = v12;
  [v12 getAdditionInStorage:v11 andNameSpace:v8 named:v9 completionHandler:&v15];

  BOOL v13 = objc_msgSend(v12, "result", v15, v16, v17, v18, v19);
  if (a5)
  {
    *a5 = [v12 error];
  }

  return v13;
}

void __57__GSPermanentStorage_additionWithName_inNameSpace_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v13 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9) {
    [*(id *)(a1 + 32) setPubExtension:v9];
  }
  if (v10) {
    [*(id *)(a1 + 32) setPrivExtension:v10];
  }
  if (v13)
  {
    id v12 = [[GSAddition alloc] _initWithStorage:*(void *)(a1 + 32) andDictionary:v13];
    [*(id *)(a1 + 40) handleObjResult:v12 error:0];
  }
  else
  {
    [*(id *)(a1 + 40) handleObjResult:0 error:v11];
  }
}

- (id)additionsWithNames:(id)a3 inNameSpace:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[GSDaemonProxySync proxy];
  int64_t v11 = [(GSPermanentStorage *)self remoteID];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  int64_t v17 = __59__GSPermanentStorage_additionsWithNames_inNameSpace_error___block_invoke;
  uint64_t v18 = &unk_1E6C9F338;
  int v19 = self;
  id v12 = v10;
  id v20 = v12;
  [v12 getAdditionsInStorage:v11 andNameSpace:v8 named:v9 completionHandler:&v15];

  id v13 = objc_msgSend(v12, "result", v15, v16, v17, v18, v19);
  if (a5)
  {
    *a5 = [v12 error];
  }

  return v13;
}

void __59__GSPermanentStorage_additionsWithNames_inNameSpace_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10) {
    [*(id *)(a1 + 32) setPubExtension:v10];
  }
  if (v11) {
    [*(id *)(a1 + 32) setPrivExtension:v11];
  }
  if (v9)
  {
    id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      id v21 = v11;
      id v22 = v10;
      id v17 = 0;
      uint64_t v18 = *(void *)v24;
      do
      {
        uint64_t v19 = 0;
        id v20 = v17;
        do
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v14);
          }
          id v17 = [[GSAddition alloc] _initWithStorage:*(void *)(a1 + 32) andDictionary:*(void *)(*((void *)&v23 + 1) + 8 * v19)];

          [v13 addObject:v17];
          ++v19;
          id v20 = v17;
        }
        while (v16 != v19);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v16);

      id v11 = v21;
      id v10 = v22;
    }

    [*(id *)(a1 + 40) handleObjResult:v13 error:0];
  }
  else
  {
    [*(id *)(a1 + 40) handleObjResult:0 error:v12];
  }
}

- (id)enumeratorForAdditionsInNameSpace:(id)a3 withOptions:(unint64_t)a4 withoutOptions:(unint64_t)a5 ordering:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = [[GSPermanentAdditionEnumerator alloc] initWithStorage:self nameSpace:v10 withOptions:a4 withoutOptions:a5 ordering:v6];

  return v11;
}

- (id)_calculateSpecForAdditionRemoval:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "nameSpace", (void)v15);
        id v12 = [v4 objectForKey:v11];
        if (!v12)
        {
          id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v4 setObject:v12 forKey:v11];
        }
        id v13 = [v10 name];
        [v12 addObject:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_removalErrorDictionaryCreation:(id)a3 withAdditions:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  id v8 = 0;
  if (v5 && v6)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v21 = v7;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          long long v15 = [v14 nameSpace];
          long long v16 = [v5 objectForKey:v15];

          long long v17 = [v14 name];
          long long v18 = [v16 objectForKey:v17];

          if (v18)
          {
            uint64_t v19 = [v14 persistentIdentifier];
            [v8 setObject:v18 forKey:v19];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }

    uint64_t v7 = v21;
  }

  return v8;
}

- (void)removeAdditions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    id v8 = [(GSPermanentStorage *)self _calculateSpecForAdditionRemoval:v6];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__GSPermanentStorage_removeAdditions_completionHandler___block_invoke;
    v15[3] = &unk_1E6C9F360;
    id v9 = v7;
    id v16 = v9;
    uint64_t v10 = GSDaemonProxy(v15);
    int64_t v11 = [(GSPermanentStorage *)self remoteID];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__GSPermanentStorage_removeAdditions_completionHandler___block_invoke_2;
    v12[3] = &unk_1E6C9F388;
    id v14 = v9;
    v12[4] = self;
    id v13 = v6;
    [v10 removeAdditionsInStorage:v11 removalSpec:v8 completionHandler:v12];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

uint64_t __56__GSPermanentStorage_removeAdditions_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__GSPermanentStorage_removeAdditions_completionHandler___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a1[5];
  uint64_t v4 = a1[6];
  id v6 = (void *)a1[4];
  id v7 = a3;
  id v8 = [v6 _removalErrorDictionaryCreation:a2 withAdditions:v5];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v8, v7);
}

- (void)removeAllAdditionsForNamespaces:(id)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      uint64_t v13 = MEMORY[0x1E4F1CBF0];
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          [v8 setObject:v13 forKey:*(void *)(*((void *)&v23 + 1) + 8 * v14++)];
        }
        while (v11 != v14);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v8 = 0;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __72__GSPermanentStorage_removeAllAdditionsForNamespaces_completionHandler___block_invoke;
  v21[3] = &unk_1E6C9F360;
  id v15 = v7;
  id v22 = v15;
  id v16 = GSDaemonProxy(v21);
  int64_t v17 = [(GSPermanentStorage *)self remoteID];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__GSPermanentStorage_removeAllAdditionsForNamespaces_completionHandler___block_invoke_2;
  v19[3] = &unk_1E6C9F3B0;
  id v20 = v15;
  id v18 = v15;
  [v16 removeAdditionsInStorage:v17 removalSpec:v8 completionHandler:v19];
}

uint64_t __72__GSPermanentStorage_removeAllAdditionsForNamespaces_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__GSPermanentStorage_removeAllAdditionsForNamespaces_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)transferToItemAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v16 = open((const char *)[v6 fileSystemRepresentation], 0);
  if (v16 < 0)
  {
    uint64_t v12 = [NSString stringWithFormat:@"opening %@ failed", v6];
    int v13 = *__error();
    uint64_t v14 = gs_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      _RemoveTreeInternal_cold_1();
    }

    if (a4)
    {
      _GSErrorForErrno(v13, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    BOOL v8 = 0;
  }
  else
  {
    int v7 = fsctl([(NSURL *)self->_documentURL fileSystemRepresentation], 0x80046820uLL, &v16, 0);
    BOOL v8 = v7 == 0;
    if (v7)
    {
      id v9 = [NSString stringWithFormat:@"fsctl(%@, TRANSFER_DOCUMENT_ID, %@) failed", self->_documentURL, v6];
      int v10 = *__error();
      uint64_t v11 = gs_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        _RemoveTreeInternal_cold_1();
      }

      if (a4)
      {
        _GSErrorForErrno(v10, v9);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      [(GSPermanentStorage *)self setDocumentURL:v6];
    }
    close(v16);
  }

  return v8;
}

- (NSURL)documentURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDocumentURL:(id)a3
{
}

- (GSStagingPrefix)stagingPrefix
{
  return self->_stagingPrefix;
}

- (void)setStagingPrefix:(id)a3
{
}

- (NSCopying)persistentIdentifier
{
  return (NSCopying *)self->_documentID;
}

- (unint64_t)storageID
{
  return self->_storageID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privExtension, 0);
  objc_storeStrong((id *)&self->_pubExtension, 0);
  objc_storeStrong((id *)&self->_documentURL, 0);
  objc_storeStrong((id *)&self->_stagingPrefix, 0);
  objc_storeStrong((id *)&self->_documentID, 0);
}

- (void)prepareAdditionCreationWithItemAtURL:(uint64_t)a1 byMoving:(NSObject *)a2 creationInfo:error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 1024;
  int v5 = 104;
  _os_log_debug_impl(&dword_1DC715000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] %@; status %d", (uint8_t *)&v2, 0x12u);
}

@end