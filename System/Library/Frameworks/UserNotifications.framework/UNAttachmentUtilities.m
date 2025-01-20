@interface UNAttachmentUtilities
+ (id)_systemDirectoryURL;
+ (void)_deleteFile:(id)a3;
+ (void)_processAttachment:(id)a3;
+ (void)deleteAttachmentFilesInContentsIfNecessary:(id)a3;
+ (void)deleteAttachmentFilesInRequestsIfNecessary:(id)a3;
@end

@implementation UNAttachmentUtilities

+ (void)deleteAttachmentFilesInRequestsIfNecessary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "content", (void)v12);
        if (v11) {
          [v5 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [a1 deleteAttachmentFilesInContentsIfNecessary:v5];
}

+ (void)deleteAttachmentFilesInContentsIfNecessary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v18 + 1) + 8 * v8) attachments];
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v15;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v15 != v12) {
                objc_enumerationMutation(v9);
              }
              [a1 _processAttachment:*(void *)(*((void *)&v14 + 1) + 8 * v13++)];
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
          }
          while (v11);
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }
}

+ (void)_processAttachment:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 URL];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v7 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
    uint64_t v8 = [v7 URL];
    if (v8
      && (uint64_t v35 = 2,
          [v6 getRelationship:&v35 ofDirectoryAtURL:v8 toItemAtURL:v5 error:0], !v35))
    {
      v26 = UNLogAttachmentsService;
      if (os_log_type_enabled((os_log_t)UNLogAttachmentsService, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v38 = v5;
        _os_log_impl(&dword_1AE729000, v26, OS_LOG_TYPE_DEFAULT, "Contained in the bundle: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      id v30 = a1;
      uint64_t v9 = [v7 dataContainerURL];
      uint64_t v10 = [v7 groupContainerURLs];
      uint64_t v11 = [v10 allValues];

      uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v13 = v12;
      if (v9) {
        [v12 addObject:v9];
      }
      v29 = (void *)v9;
      if (v11) {
        [v13 addObjectsFromArray:v11];
      }
      v28 = (void *)v11;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v32;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v32 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v31 + 1) + 8 * i);
            uint64_t v35 = 2;
            [v6 getRelationship:&v35 ofDirectoryAtURL:v19 toItemAtURL:v5 error:0];
            if (!v35)
            {
              v25 = UNLogAttachmentsService;
              if (os_log_type_enabled((os_log_t)UNLogAttachmentsService, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v38 = v5;
                _os_log_impl(&dword_1AE729000, v25, OS_LOG_TYPE_DEFAULT, "Contained in a group container. Deleting file: %{public}@", buf, 0xCu);
              }
              [v30 _deleteFile:v5];
              long long v20 = v14;
              goto LABEL_26;
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

      long long v20 = [v30 _systemDirectoryURL];
      uint64_t v35 = 2;
      [v6 getRelationship:&v35 ofDirectoryAtURL:v20 toItemAtURL:v5 error:0];
      if (v35)
      {
        long long v21 = [v5 path];
        int v22 = [v6 isWritableFileAtPath:v21];

        if (v22)
        {
          v23 = UNLogAttachmentsService;
          if (os_log_type_enabled((os_log_t)UNLogAttachmentsService, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v38 = v5;
            _os_log_impl(&dword_1AE729000, v23, OS_LOG_TYPE_DEFAULT, "File is writable. Deleting file: %{public}@", buf, 0xCu);
          }
          [v30 _deleteFile:v5];
        }
      }
      else
      {
        v27 = UNLogAttachmentsService;
        if (os_log_type_enabled((os_log_t)UNLogAttachmentsService, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v38 = v5;
          _os_log_impl(&dword_1AE729000, v27, OS_LOG_TYPE_DEFAULT, "Contained in the System directory: %{public}@", buf, 0xCu);
        }
      }
LABEL_26:
    }
    goto LABEL_28;
  }
  uint64_t v24 = (void *)UNLogAttachmentsService;
  if (os_log_type_enabled((os_log_t)UNLogAttachmentsService, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v24;
    uint64_t v7 = [v4 identifier];
    *(_DWORD *)buf = 138543362;
    v38 = v7;
    _os_log_impl(&dword_1AE729000, v6, OS_LOG_TYPE_DEFAULT, "No attachment URL for %{public}@", buf, 0xCu);
LABEL_28:
  }
}

+ (id)_systemDirectoryURL
{
  if (_systemDirectoryURL_onceToken != -1) {
    dispatch_once(&_systemDirectoryURL_onceToken, &__block_literal_global);
  }
  v2 = (void *)_systemDirectoryURL_systemDirectoryURL;

  return v2;
}

void __44__UNAttachmentUtilities__systemDirectoryURL__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  BSSystemRootDirectory();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v1 = [v4 stringByAppendingPathComponent:@"System"];
  uint64_t v2 = [v0 fileURLWithPath:v1];
  v3 = (void *)_systemDirectoryURL_systemDirectoryURL;
  _systemDirectoryURL_systemDirectoryURL = v2;
}

+ (void)_deleteFile:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = 0;
  [v4 removeItemAtURL:v3 error:&v9];
  id v5 = v9;

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v7 = [v6 bundlePath];

    uint64_t v8 = (void *)UNLogAttachmentsService;
    if (os_log_type_enabled((os_log_t)UNLogAttachmentsService, OS_LOG_TYPE_FAULT)) {
      +[UNAttachmentUtilities _deleteFile:v3];
    }
  }
}

+ (void)_deleteFile:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a3 absoluteString];
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_fault_impl(&dword_1AE729000, v5, OS_LOG_TYPE_FAULT, "[Notification Attachment] Failed to delete an attachment file. Bundle: '%{public}@', Attachment: '%{public}@'", (uint8_t *)&v7, 0x16u);
}

@end