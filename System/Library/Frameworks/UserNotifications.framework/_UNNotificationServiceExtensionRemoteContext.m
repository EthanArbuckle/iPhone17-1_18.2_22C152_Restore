@interface _UNNotificationServiceExtensionRemoteContext
- (UNNotificationServiceExtension)extensionInstance;
- (_UNNotificationServiceExtensionRemoteContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (id)_stageAttachmentsForNotificationContent:(id)a3;
- (void)deleteAttachmentFilesInContentIfNecessary:(id)a3;
- (void)didReceiveNotificationRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)serviceExtensionPerformCleanup;
- (void)serviceExtensionTimeWillExpire;
- (void)setExtensionInstance:(id)a3;
@end

@implementation _UNNotificationServiceExtensionRemoteContext

- (_UNNotificationServiceExtensionRemoteContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)_UNNotificationServiceExtensionRemoteContext;
  v5 = [(_UNNotificationServiceExtensionRemoteContext *)&v11 initWithInputItems:a3 listenerEndpoint:a4 contextUUID:a5];
  v6 = v5;
  if (v5)
  {
    atomic_store(0, (unsigned __int8 *)&v5->_hasRepliedFlag);
    v7 = (void *)UNLogServiceExtension;
    if (os_log_type_enabled((os_log_t)UNLogServiceExtension, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = [(_UNNotificationServiceExtensionRemoteContext *)v6 _UUID];
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_log_impl(&dword_1AE729000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Service extension context initialized", buf, 0xCu);
    }
  }
  return v6;
}

- (void)didReceiveNotificationRequest:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(_UNNotificationServiceExtensionRemoteContext *)self extensionInstance];
  v9 = (void *)UNLogServiceExtension;
  if (os_log_type_enabled((os_log_t)UNLogServiceExtension, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_super v11 = [(_UNNotificationServiceExtensionRemoteContext *)self _UUID];
    v12 = [v6 identifier];
    v13 = objc_msgSend(v12, "un_logDigest");
    *(_DWORD *)buf = 138543618;
    v20 = v11;
    __int16 v21 = 2114;
    v22 = v13;
    _os_log_impl(&dword_1AE729000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request replacement content for notification request %{public}@", buf, 0x16u);
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __100___UNNotificationServiceExtensionRemoteContext_didReceiveNotificationRequest_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E5F05F48;
  v16[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v14 = v7;
  id v15 = v6;
  [v8 didReceiveNotificationRequest:v15 withContentHandler:v16];
}

- (void)deleteAttachmentFilesInContentIfNecessary:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v6 = a3;
    v3 = (void *)MEMORY[0x1E4F1C978];
    id v4 = a3;
    v5 = [v3 arrayWithObjects:&v6 count:1];
    +[UNAttachmentUtilities deleteAttachmentFilesInContentsIfNecessary:](UNAttachmentUtilities, "deleteAttachmentFilesInContentsIfNecessary:", v5, v6, v7);
  }
}

- (void)serviceExtensionTimeWillExpire
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [(_UNNotificationServiceExtensionRemoteContext *)self extensionInstance];
  id v4 = (void *)UNLogServiceExtension;
  if (os_log_type_enabled((os_log_t)UNLogServiceExtension, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    id v6 = [(_UNNotificationServiceExtensionRemoteContext *)self _UUID];
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1AE729000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Service extension time will expire", (uint8_t *)&v7, 0xCu);
  }
  [v3 serviceExtensionTimeWillExpire];
}

- (void)serviceExtensionPerformCleanup
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = (void *)UNLogServiceExtension;
  if (os_log_type_enabled((os_log_t)UNLogServiceExtension, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    v5 = [(_UNNotificationServiceExtensionRemoteContext *)self _UUID];
    int v6 = 138543362;
    int v7 = v5;
    _os_log_impl(&dword_1AE729000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cleaning up extension", (uint8_t *)&v6, 0xCu);
  }
  [(_UNNotificationServiceExtensionRemoteContext *)self setExtensionInstance:0];
  [(_UNNotificationServiceExtensionRemoteContext *)self completeRequestReturningItems:0 completionHandler:0];
}

- (id)_stageAttachmentsForNotificationContent:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  v3 = [v34 attachments];
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = (void *)MEMORY[0x1E4F1CB10];
  int v6 = NSTemporaryDirectory();
  int v7 = [v5 fileURLWithPath:v6 isDirectory:1];

  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v9 = v3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v42;
    uint64_t v37 = *(void *)v42;
    v38 = v8;
    id v35 = v9;
    do
    {
      uint64_t v13 = 0;
      uint64_t v39 = v11;
      do
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v41 + 1) + 8 * v13);
        id v15 = [v14 URL];
        uint64_t v40 = 2;
        [v4 getRelationship:&v40 ofDirectoryAtURL:v7 toItemAtURL:v15 error:0];
        if (v40)
        {
          [v8 addObject:v14];
        }
        else
        {
          v16 = [MEMORY[0x1E4F29128] UUID];
          id v17 = [v16 UUIDString];
          id v18 = [v7 URLByAppendingPathComponent:v17];

          v19 = [v15 pathExtension];
          v20 = [v18 URLByAppendingPathExtension:v19];

          int v21 = [v4 moveItemAtURL:v15 toURL:v20 error:0];
          if (v21)
          {
            v22 = [UNNotificationAttachment alloc];
            uint64_t v23 = [v14 identifier];
            [v14 type];
            v24 = v7;
            v26 = v25 = v4;
            v27 = [v14 options];
            v28 = [(UNNotificationAttachment *)v22 initWithIdentifier:v23 URL:v20 type:v26 options:v27];

            id v4 = v25;
            int v7 = v24;
            id v9 = v35;

            uint64_t v8 = v38;
            [v38 addObject:v28];
          }
          v29 = (void *)UNLogServiceExtension;
          if (os_log_type_enabled((os_log_t)UNLogServiceExtension, OS_LOG_TYPE_DEFAULT))
          {
            v30 = v29;
            v31 = [(_UNNotificationServiceExtensionRemoteContext *)self _UUID];
            *(_DWORD *)buf = 138543618;
            v46 = v31;
            __int16 v47 = 1024;
            int v48 = v21;
            _os_log_impl(&dword_1AE729000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handled temporary attachment %{BOOL}d", buf, 0x12u);

            uint64_t v8 = v38;
          }

          uint64_t v12 = v37;
          uint64_t v11 = v39;
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v11);
  }

  v32 = (void *)[v34 mutableCopy];
  [v32 setAttachments:v8];

  return v32;
}

- (UNNotificationServiceExtension)extensionInstance
{
  return self->_extensionInstance;
}

- (void)setExtensionInstance:(id)a3
{
}

- (void).cxx_destruct
{
}

@end