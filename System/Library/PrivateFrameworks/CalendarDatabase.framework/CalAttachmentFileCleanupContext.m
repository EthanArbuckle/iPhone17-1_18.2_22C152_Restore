@interface CalAttachmentFileCleanupContext
- (CalAttachmentFileCleanupContext)initWithExternalID:(id)a3 storeUUID:(id)a4 database:(CalDatabase *)a5;
- (CalAttachmentFileCleanupContext)initWithStore:(void *)a3;
- (id)description;
- (void)addAttachmentToDelete:(id)a3;
- (void)cleanup;
- (void)markStoreAsDeleted;
@end

@implementation CalAttachmentFileCleanupContext

- (CalAttachmentFileCleanupContext)initWithStore:(void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CalAttachmentFileCleanupContext;
  v4 = [(CalAttachmentFileCleanupContext *)&v9 init];
  if (v4)
  {
    v5 = CalCopyDatabaseForRecord();
    uint64_t v6 = _CalAttachmentFileCopyAttachmentContainerForStore((uint64_t)a3, (uint64_t)v5);
    storeAttachmentContainer = v4->_storeAttachmentContainer;
    v4->_storeAttachmentContainer = (NSURL *)v6;

    if (v5) {
      CFRelease(v5);
    }
  }
  return v4;
}

- (CalAttachmentFileCleanupContext)initWithExternalID:(id)a3 storeUUID:(id)a4 database:(CalDatabase *)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CalAttachmentFileCleanupContext;
  v10 = [(CalAttachmentFileCleanupContext *)&v14 init];
  if (v10)
  {
    uint64_t v11 = _CalAttachmentFileCopyAttachmentContainerForStoreProperties(v8, v9, (uint64_t)a5);
    storeAttachmentContainer = v10->_storeAttachmentContainer;
    v10->_storeAttachmentContainer = (NSURL *)v11;
  }
  return v10;
}

- (void)addAttachmentToDelete:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_deleteEntireContainer)
  {
    attachmentUUIDsToDelete = self->_attachmentUUIDsToDelete;
    id v9 = v5;
    if (!attachmentUUIDsToDelete)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v8 = self->_attachmentUUIDsToDelete;
      self->_attachmentUUIDsToDelete = v7;

      attachmentUUIDsToDelete = self->_attachmentUUIDsToDelete;
    }
    id v4 = (id)[(NSMutableArray *)attachmentUUIDsToDelete addObject:v9];
    id v5 = v9;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)markStoreAsDeleted
{
  self->_deleteEntireContainer = 1;
  self->_attachmentUUIDsToDelete = 0;
  MEMORY[0x1F41817F8]();
}

- (void)cleanup
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = v3;
  if (!self->_deleteEntireContainer)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obj = self->_attachmentUUIDsToDelete;
    uint64_t v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (!v13) {
      goto LABEL_22;
    }
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v31;
    *(void *)&long long v14 = 138412546;
    long long v27 = v14;
LABEL_7:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v31 != v16) {
        objc_enumerationMutation(obj);
      }
      -[NSURL URLByAppendingPathComponent:](self->_storeAttachmentContainer, "URLByAppendingPathComponent:", *(void *)(*((void *)&v30 + 1) + 8 * v17), v27);
      v18 = (NSURL *)objc_claimAutoreleasedReturnValue();
      id v29 = 0;
      char v19 = [v4 removeItemAtURL:v18 error:&v29];
      v20 = (NSMutableArray *)v29;
      uint64_t v21 = CDBLogHandle;
      if (v19)
      {
        if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v18;
          v22 = v21;
          os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
          v24 = "Deleted attachment at path %@";
          uint32_t v25 = 12;
LABEL_15:
          _os_log_impl(&dword_1A8E81000, v22, v23, v24, buf, v25);
        }
      }
      else if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v27;
        v37 = v18;
        __int16 v38 = 2112;
        v39 = v20;
        v22 = v21;
        os_log_type_t v23 = OS_LOG_TYPE_ERROR;
        v24 = "Failed to delete attachment at path %@: %@";
        uint32_t v25 = 22;
        goto LABEL_15;
      }

      if (v15 == ++v17)
      {
        uint64_t v15 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (!v15) {
          goto LABEL_22;
        }
        goto LABEL_7;
      }
    }
  }
  storeAttachmentContainer = self->_storeAttachmentContainer;
  id v34 = 0;
  char v6 = [v3 removeItemAtURL:storeAttachmentContainer error:&v34];
  obj = (NSMutableArray *)v34;
  uint64_t v7 = CDBLogHandle;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = self->_storeAttachmentContainer;
      *(_DWORD *)buf = 138412290;
      v37 = v8;
      id v9 = "Deleted attachments for deleted store at path %@";
      v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_21:
      _os_log_impl(&dword_1A8E81000, v10, v11, v9, buf, v12);
    }
  }
  else if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
  {
    v26 = self->_storeAttachmentContainer;
    *(_DWORD *)buf = 138412546;
    v37 = v26;
    __int16 v38 = 2112;
    v39 = obj;
    id v9 = "Failed to delete attachments for deleted store at path %@: %@";
    v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_21;
  }
LABEL_22:
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)CalAttachmentFileCleanupContext;
  id v4 = [(CalAttachmentFileCleanupContext *)&v9 description];
  storeAttachmentContainer = self->_storeAttachmentContainer;
  char v6 = [NSNumber numberWithBool:self->_deleteEntireContainer];
  uint64_t v7 = [v3 stringWithFormat:@"[%@], _storeAttachmentContainer: [%@], _deleteEntireContainer: [%@], _attachmentUUIDsToDelete: [%@]", v4, storeAttachmentContainer, v6, self->_attachmentUUIDsToDelete];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentUUIDsToDelete, 0);
  objc_storeStrong((id *)&self->_storeAttachmentContainer, 0);
}

@end