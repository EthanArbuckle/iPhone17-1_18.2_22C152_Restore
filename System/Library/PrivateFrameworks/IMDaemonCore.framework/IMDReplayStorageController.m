@interface IMDReplayStorageController
- (BOOL)storeDictionary:(id)a3 error:(id *)a4;
- (IDSKVStore)store;
- (IMDReplayStorageController)initWithFilePath:(id)a3;
- (NSString)filePath;
- (id)copyNextBatchWithSize:(unint64_t)a3 iterationContext:(id *)a4;
- (void)dealloc;
- (void)deleteReplayDB;
- (void)setStore:(id)a3;
@end

@implementation IMDReplayStorageController

- (IMDReplayStorageController)initWithFilePath:(id)a3
{
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)IMDReplayStorageController;
    v4 = [(IMDReplayStorageController *)&v7 init];
    if (v4)
    {
      v4->_filePath = (NSString *)a3;
      v4->_store = (IDSKVStore *)[objc_alloc(MEMORY[0x1E4F6B810]) initWithPath:a3 storeName:@"IMDReplayStorageController" dataProtectionClass:2];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "passing in nil filePath to initWithFilePath", buf, 2u);
      }
    }
    return 0;
  }
  return v4;
}

- (BOOL)storeDictionary:(id)a3 error:(id *)a4
{
  objc_sync_enter(self);
  if (a3) {
    goto LABEL_2;
  }
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "IMDReplayStorageController was asked to store nil dictionary", v10, 2u);
    }
  }
  if (!a4)
  {
LABEL_2:
    [(IDSKVStore *)self->_store persistData:JWEncodeDictionary() forKey:0 error:0];
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
    *a4 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMDReplayMessageStorageControllerErrorDomain" code:0 userInfo:0];
  }
  objc_sync_exit(self);
  return v7;
}

- (id)copyNextBatchWithSize:(unint64_t)a3 iterationContext:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if (a4 && *a4)
  {
    -[IDSKVStore deleteBatchWithContext:error:](self->_store, "deleteBatchWithContext:error:", [*a4 deleteContext], 0);
    *a4 = 0;
  }
  uint64_t v19 = 0;
  BOOL v7 = (void *)[(IDSKVStore *)self->_store datasUpToLimit:a3 deleteContext:&v19 error:0];
  if (v7)
  {
    if (a4)
    {
      v8 = objc_alloc_init(IMDReplayStorageIterationContext);
      *a4 = v8;
      [(IMDReplayStorageIterationContext *)v8 setDeleteContext:v19];
    }
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v10 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v7);
          }
          v13 = (void *)MEMORY[0x1E016A370]();
          [v9 addObject:JWDecodeDictionary()];
        }
        uint64_t v10 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }
  }
  else
  {
    v9 = 0;
  }
  objc_sync_exit(self);
  return v9;
}

- (void)deleteReplayDB
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      filePath = self->_filePath;
      int v5 = 138412290;
      v6 = filePath;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Deleting replay db with path %@", (uint8_t *)&v5, 0xCu);
    }
  }
  [(IDSKVStore *)self->_store deleteDatabase];
  objc_sync_exit(self);
}

- (void)dealloc
{
  objc_sync_enter(self);

  objc_sync_exit(self);
  v3.receiver = self;
  v3.super_class = (Class)IMDReplayStorageController;
  [(IMDReplayStorageController *)&v3 dealloc];
}

- (NSString)filePath
{
  return self->_filePath;
}

- (IDSKVStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

@end