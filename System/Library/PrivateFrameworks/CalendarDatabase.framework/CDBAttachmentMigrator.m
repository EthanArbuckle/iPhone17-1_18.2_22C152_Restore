@interface CDBAttachmentMigrator
+ (BOOL)_createNewContainerIfNeeded:(id)a3 error:(id *)a4;
+ (BOOL)_moveAttachmentWithInfo:(id)a3 error:(id *)a4;
+ (BOOL)_moveAttachmentsWithInfo:(id)a3 error:(id *)a4;
+ (id)_attachmentInfoForLegacyAttachmentURL:(id)a3 newAttachmentContainerForStore:(id)a4 newCalendarDataContainer:(id)a5 database:(CalDatabase *)a6 attachmentUUID:(id *)a7;
+ (id)_infoForAttachmentsInLegacyAttachmentContainerForStore:(id)a3 newAttachmentContainerForStore:(id)a4 newCalendarDataContainer:(id)a5 database:(CalDatabase *)a6;
+ (void)_moveAttachmentsForStore:(void *)a3 fromLegacyAttachmentContainer:(id)a4 calendarDataContainerProvider:(id)a5 database:(CalDatabase *)a6;
+ (void)_moveAttachmentsFromLegacyAttachmentContainer:(id)a3 calendarDataContainerProvider:(id)a4 database:(CalDatabase *)a5;
+ (void)_setFileSizeForAttachmentUUID:(id)a3 attachmentURL:(id)a4 database:(CalDatabase *)a5;
+ (void)_setFileSizeForAttachmentsWithInfo:(id)a3 database:(CalDatabase *)a4;
+ (void)_setLocalRelativePathForAttachmentUUID:(id)a3 localRelativePath:(id)a4 database:(CalDatabase *)a5;
+ (void)_updateLocalRelativeURLForAttachmentsWithInfo:(id)a3 database:(CalDatabase *)a4;
+ (void)migrateDataClassProtectionForAttachmentsInLegacyCalendarDataContainer:(id)a3;
+ (void)migrateWithLegacyCalendarDataContainer:(id)a3 calendarDataContainerProvider:(id)a4 database:(CalDatabase *)a5;
@end

@implementation CDBAttachmentMigrator

+ (void)migrateWithLegacyCalendarDataContainer:(id)a3 calendarDataContainerProvider:(id)a4 database:(CalDatabase *)a5
{
  id v8 = a4;
  id v9 = a3;
  [a1 migrateDataClassProtectionForAttachmentsInLegacyCalendarDataContainer:v9];
  v10 = [MEMORY[0x1E4F57670] legacyAttachmentContainerWithBaseURL:v9];

  [a1 _moveAttachmentsFromLegacyAttachmentContainer:v10 calendarDataContainerProvider:v8 database:a5];
  if ((CalDatabaseSave((uint64_t)a5) & 1) == 0)
  {
    v11 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A8E81000, v11, OS_LOG_TYPE_ERROR, "Could not save database.", v12, 2u);
    }
  }
}

+ (void)_moveAttachmentsFromLegacyAttachmentContainer:(id)a3 calendarDataContainerProvider:(id)a4 database:(CalDatabase *)a5
{
  id v14 = a3;
  id v8 = a4;
  CFArrayRef v9 = (const __CFArray *)CalDatabaseCopyOfAllStores((os_unfair_lock_s *)a5);
  if (v9)
  {
    CFArrayRef v10 = v9;
    CFIndex Count = CFArrayGetCount(v9);
    if (Count >= 1)
    {
      CFIndex v12 = Count;
      for (CFIndex i = 0; i != v12; ++i)
        objc_msgSend(a1, "_moveAttachmentsForStore:fromLegacyAttachmentContainer:calendarDataContainerProvider:database:", CFArrayGetValueAtIndex(v10, i), v14, v8, a5);
    }
    CFRelease(v10);
  }
}

+ (void)_moveAttachmentsForStore:(void *)a3 fromLegacyAttachmentContainer:(id)a4 calendarDataContainerProvider:(id)a5 database:(CalDatabase *)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  CFIndex v12 = (void *)CalStoreCopyUUID((uint64_t)a3);
  if (v12)
  {
    v13 = [v10 URLByAppendingPathComponent:v12];
    id v14 = v13;
    if (!v13)
    {
      v28 = CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v49 = v12;
        __int16 v50 = 2112;
        id v51 = v10;
        _os_log_impl(&dword_1A8E81000, v28, OS_LOG_TYPE_ERROR, "Could not get attachment container for store. store uuid = %{public}@, legacy attachment container = %@", buf, 0x16u);
      }
      goto LABEL_40;
    }
    v15 = [v13 path];
    if (!v15)
    {
      v29 = CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        id v49 = v12;
        __int16 v50 = 2112;
        id v51 = v10;
        _os_log_impl(&dword_1A8E81000, v29, OS_LOG_TYPE_INFO, "Could not get attachment container path for store. store uuid = %{public}@, legacy attachment container = %@", buf, 0x16u);
      }
      goto LABEL_39;
    }
    v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v47 = 0;
    if ([v16 fileExistsAtPath:v15 isDirectory:&v47])
    {
      if (v47)
      {
        v17 = [v11 containerForAccountIdentifier:0];
        if (v17)
        {
          v18 = [MEMORY[0x1E4F57670] attachmentContainerWithBaseURL:v17];
          v19 = v18;
          if (v18)
          {
            v44 = v17;
            uint64_t v20 = [v18 URLByAppendingPathComponent:v12];
            v45 = (void *)v20;
            if (v20)
            {
              uint64_t v21 = v20;
              v43 = v19;
              id v46 = 0;
              char v22 = [a1 _createNewContainerIfNeeded:v20 error:&v46];
              id v42 = v46;
              if (v22)
              {
                uint64_t v23 = v21;
                v17 = v44;
                v41 = [a1 _infoForAttachmentsInLegacyAttachmentContainerForStore:v14 newAttachmentContainerForStore:v23 newCalendarDataContainer:v44 database:a6];
                char v24 = objc_msgSend(a1, "_moveAttachmentsWithInfo:error:");
                id v40 = 0;
                if (v24)
                {
                  [a1 _updateLocalRelativeURLForAttachmentsWithInfo:v41 database:a6];
                  [a1 _setFileSizeForAttachmentsWithInfo:v41 database:a6];
                  v25 = v42;
                  v19 = v43;
                }
                else
                {
                  v39 = CDBLogHandle;
                  v25 = v42;
                  v19 = v43;
                  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138413058;
                    id v49 = v40;
                    __int16 v50 = 2112;
                    id v51 = v14;
                    __int16 v52 = 2112;
                    v53 = v43;
                    __int16 v54 = 2112;
                    v55 = v41;
                    _os_log_impl(&dword_1A8E81000, v39, OS_LOG_TYPE_ERROR, "Could not move attachments for store. error = %@, legacy attachment container for store = %@, new attachment container = %@, attachment info = %@", buf, 0x2Au);
                  }
                }
              }
              else
              {
                v38 = CDBLogHandle;
                v19 = v43;
                v17 = v44;
                v25 = v42;
                if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  id v49 = v42;
                  __int16 v50 = 2112;
                  id v51 = v45;
                  _os_log_impl(&dword_1A8E81000, v38, OS_LOG_TYPE_ERROR, "Could not create new attachment container for store if needed. error = %@, new attachment container for store = %@", buf, 0x16u);
                }
              }
            }
            else
            {
              v37 = CDBLogHandle;
              if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                id v49 = v12;
                __int16 v50 = 2112;
                id v51 = 0;
                _os_log_impl(&dword_1A8E81000, v37, OS_LOG_TYPE_ERROR, "Could not get new attachment container for store. store uuid = %{public}@, new attachment container = %@", buf, 0x16u);
              }
            }
          }
          else
          {
            v36 = CDBLogHandle;
            if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              id v49 = v12;
              __int16 v50 = 2112;
              id v51 = v17;
              _os_log_impl(&dword_1A8E81000, v36, OS_LOG_TYPE_ERROR, "Could not get new attachment container. store uuid = %{public}@, new calendar data container = %@", buf, 0x16u);
            }
          }
        }
        else
        {
          v35 = CDBLogHandle;
          if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v49 = v12;
            _os_log_impl(&dword_1A8E81000, v35, OS_LOG_TYPE_ERROR, "Could not get new calendar data container. store uuid = %{public}@", buf, 0xCu);
          }
        }

        goto LABEL_38;
      }
      uint64_t v34 = CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v49 = v12;
        __int16 v50 = 2112;
        id v51 = v15;
        v31 = "Legacy attachment container for store is not a directory. store uuid = %{public}@, legacy attachment conta"
              "iner for store path = %@";
        v32 = v34;
        os_log_type_t v33 = OS_LOG_TYPE_ERROR;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v30 = CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        id v49 = v12;
        __int16 v50 = 2112;
        id v51 = v15;
        v31 = "Legacy attachment container for store does not exist. store uuid = %{public}@, legacy attachment container"
              " for store path = %@";
        v32 = v30;
        os_log_type_t v33 = OS_LOG_TYPE_INFO;
LABEL_22:
        _os_log_impl(&dword_1A8E81000, v32, v33, v31, buf, 0x16u);
      }
    }
LABEL_38:

LABEL_39:
LABEL_40:

    goto LABEL_41;
  }
  v26 = (void *)CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
  {
    v27 = v26;
    *(_DWORD *)buf = 67109120;
    LODWORD(v49) = CalStoreGetUID();
    _os_log_impl(&dword_1A8E81000, v27, OS_LOG_TYPE_ERROR, "Could not get account persistent id for store. store uid = %d", buf, 8u);
  }
LABEL_41:
}

+ (void)_updateLocalRelativeURLForAttachmentsWithInfo:(id)a3 database:(CalDatabase *)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__CDBAttachmentMigrator__updateLocalRelativeURLForAttachmentsWithInfo_database___block_invoke;
  v4[3] = &__block_descriptor_48_e44_v32__0__NSString_8__CDBAttachmentInfo_16_B24l;
  v4[4] = a1;
  v4[5] = a4;
  [a3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __80__CDBAttachmentMigrator__updateLocalRelativeURLForAttachmentsWithInfo_database___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 localRelativePath];
  [*(id *)(a1 + 32) _setLocalRelativePathForAttachmentUUID:v5 localRelativePath:v6 database:*(void *)(a1 + 40)];
}

+ (void)_setLocalRelativePathForAttachmentUUID:(id)a3 localRelativePath:(id)a4 database:(CalDatabase *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  CFTypeRef v9 = CalDatabaseCopyAttachmentFileWithUUID((os_unfair_lock_s *)a5, (uint64_t)v7);
  if (v9)
  {
    id v10 = v9;
    CalAttachmentFileSetLocalRelativePath((uint64_t)v9);
    CFRelease(v10);
  }
  else
  {
    id v11 = (void *)CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      CFIndex v12 = v11;
      v13 = [v8 stringByDeletingPathExtension];
      int v14 = 138543618;
      id v15 = v7;
      __int16 v16 = 2114;
      v17 = v13;
      _os_log_impl(&dword_1A8E81000, v12, OS_LOG_TYPE_ERROR, "Could not get attachment. attachment uuid = %{public}@, local relative path = %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
}

+ (void)_setFileSizeForAttachmentsWithInfo:(id)a3 database:(CalDatabase *)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__CDBAttachmentMigrator__setFileSizeForAttachmentsWithInfo_database___block_invoke;
  v4[3] = &__block_descriptor_48_e44_v32__0__NSString_8__CDBAttachmentInfo_16_B24l;
  v4[4] = a1;
  v4[5] = a4;
  [a3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __69__CDBAttachmentMigrator__setFileSizeForAttachmentsWithInfo_database___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 url];
  [*(id *)(a1 + 32) _setFileSizeForAttachmentUUID:v5 attachmentURL:v6 database:*(void *)(a1 + 40)];
}

+ (void)_setFileSizeForAttachmentUUID:(id)a3 attachmentURL:(id)a4 database:(CalDatabase *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  CFTypeRef v9 = [v8 path];
  if (v9)
  {
    id v10 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl(&dword_1A8E81000, v10, OS_LOG_TYPE_INFO, "Setting file size for attachment uuid = %{public}@, attachment url = %@", buf, 0x16u);
    }
    id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v18 = 0;
    CFIndex v12 = [MEMORY[0x1E4F57670] getFileSizeForPath:v9 fileManager:v11 error:&v18];
    id v13 = v18;
    if (v12)
    {
      CFTypeRef v14 = CalDatabaseCopyAttachmentFileWithUUID((os_unfair_lock_s *)a5, (uint64_t)v7);
      if (v14)
      {
        id v15 = v14;
        CalAttachmentFileSetFileSize((uint64_t)v14);
        CFRelease(v15);
LABEL_12:

        goto LABEL_13;
      }
      __int16 v16 = CDBLogHandle;
      if (!os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 138543874;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v9;
      __int16 v23 = 2112;
      char v24 = v12;
      v17 = "Could not get attachment. attachment uuid = %{public}@, attachment path = %@, file size = %@";
    }
    else
    {
      __int16 v16 = CDBLogHandle;
      if (!os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 138412802;
      id v20 = v13;
      __int16 v21 = 2114;
      id v22 = v7;
      __int16 v23 = 2112;
      char v24 = v9;
      v17 = "Could not get file size. error = %@, attachment uuid = %{public}@, attachment path = %@";
    }
    _os_log_impl(&dword_1A8E81000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x20u);
    goto LABEL_12;
  }
LABEL_13:
}

+ (BOOL)_moveAttachmentsWithInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy_;
  CFTypeRef v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__CDBAttachmentMigrator__moveAttachmentsWithInfo_error___block_invoke;
  v9[3] = &unk_1E5D61FC8;
  v9[5] = &v16;
  v9[6] = a1;
  v9[4] = &v10;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
  if (a4) {
    *a4 = (id) v11[5];
  }
  char v7 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __56__CDBAttachmentMigrator__moveAttachmentsWithInfo_error___block_invoke(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = (void *)a1[6];
  uint64_t v7 = *(void *)(a1[4] + 8);
  id obj = *(id *)(v7 + 40);
  char v8 = [v6 _moveAttachmentWithInfo:a3 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if ((v8 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    *a4 = 1;
  }
}

+ (BOOL)_moveAttachmentWithInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 legacyURL];
  uint64_t v7 = [v5 url];

  char v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(a4) = [v8 moveItemAtURL:v6 toURL:v7 error:a4];

  return (char)a4;
}

+ (id)_infoForAttachmentsInLegacyAttachmentContainerForStore:(id)a3 newAttachmentContainerForStore:(id)a4 newCalendarDataContainer:(id)a5 database:(CalDatabase *)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  v28 = v10;
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v35 = 0;
  v27 = v13;
  CFTypeRef v14 = [v13 contentsOfDirectoryAtURL:v10 includingPropertiesForKeys:0 options:4 error:&v35];
  id v26 = v35;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v30 = 0;
        __int16 v21 = [a1 _attachmentInfoForLegacyAttachmentURL:v20 newAttachmentContainerForStore:v11 newCalendarDataContainer:v12 database:a6 attachmentUUID:&v30];
        id v22 = v30;
        if (v22) {
          BOOL v23 = v21 == 0;
        }
        else {
          BOOL v23 = 1;
        }
        if (!v23) {
          [v29 setObject:v21 forKeyedSubscript:v22];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v17);
  }

  char v24 = (void *)[v29 copy];
  return v24;
}

+ (id)_attachmentInfoForLegacyAttachmentURL:(id)a3 newAttachmentContainerForStore:(id)a4 newCalendarDataContainer:(id)a5 database:(CalDatabase *)a6 attachmentUUID:(id *)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  CFTypeRef v14 = [v11 path];
  id v15 = v14;
  if (!v14)
  {
    char v24 = 0;
    goto LABEL_21;
  }
  uint64_t v16 = [v14 lastPathComponent];
  uint64_t v17 = v16;
  if (v16)
  {
    uint64_t v18 = [v16 stringByDeletingPathExtension];
    char v19 = v18;
    if (v18)
    {
      id v20 = v18;
      *a7 = v20;
      CFTypeRef v21 = CalDatabaseCopyAttachmentFileWithUUID((os_unfair_lock_s *)a6, (uint64_t)v20);
      if (v21)
      {
        CFRelease(v21);
        id v22 = [v12 URLByAppendingPathComponent:v17];
        if (v22)
        {
          BOOL v23 = [MEMORY[0x1E4F57670] localRelativePathForLocalAbsoluteURL:v22 localBaseURL:v13];
          if (v23)
          {
            char v24 = [[CDBAttachmentInfo alloc] initWithLegacyURL:v11 url:v22 localRelativePath:v23];
          }
          else
          {
            id v26 = CDBLogHandle;
            if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
            {
              int v28 = 138412802;
              id v29 = v20;
              __int16 v30 = 2112;
              long long v31 = v22;
              __int16 v32 = 2112;
              id v33 = v13;
              _os_log_impl(&dword_1A8E81000, v26, OS_LOG_TYPE_ERROR, "Could not get new attachment local relative path. attachment uuid = %@ new attachment url = %@, new calendar data container = %@", (uint8_t *)&v28, 0x20u);
            }
            char v24 = 0;
          }
        }
        else
        {
          char v24 = 0;
        }

        goto LABEL_19;
      }
      uint64_t v25 = CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
      {
        int v28 = 138412290;
        id v29 = v20;
        _os_log_impl(&dword_1A8E81000, v25, OS_LOG_TYPE_INFO, "Could not get attachment for file name = %@", (uint8_t *)&v28, 0xCu);
      }
    }
    char v24 = 0;
LABEL_19:

    goto LABEL_20;
  }
  char v24 = 0;
LABEL_20:

LABEL_21:
  return v24;
}

+ (BOOL)_createNewContainerIfNeeded:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v7 = [v5 path];
  if (v7)
  {
    LOBYTE(v12) = 0;
    if ([v6 fileExistsAtPath:v7 isDirectory:&v12]) {
      BOOL v8 = v12 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8) {
      char v10 = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:a4];
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    CFTypeRef v9 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_1A8E81000, v9, OS_LOG_TYPE_ERROR, "New container path is nil. new attachment container = %@", (uint8_t *)&v12, 0xCu);
    }
    char v10 = 0;
  }

  return v10;
}

+ (void)migrateDataClassProtectionForAttachmentsInLegacyCalendarDataContainer:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A8E81000, v4, OS_LOG_TYPE_INFO, "Fixing up dataclass protection for calendar attachments", buf, 2u);
  }
  id v5 = [MEMORY[0x1E4F57670] legacyAttachmentContainerWithBaseURL:v3];
  id v6 = v5;
  if (v5)
  {
    uint64_t v18 = v5;
    id v19 = v3;
    uint64_t v7 = [v5 path];
    BOOL v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    CFTypeRef v9 = [v8 enumeratorAtPath:v7];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [v7 stringByAppendingPathComponent:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          char v20 = 0;
          if ([v8 fileExistsAtPath:v14 isDirectory:&v20]) {
            BOOL v15 = v20 == 0;
          }
          else {
            BOOL v15 = 0;
          }
          if (v15)
          {
            uint64_t v16 = CDBLogHandle;
            if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v26 = v14;
              _os_log_impl(&dword_1A8E81000, v16, OS_LOG_TYPE_INFO, "Setting dataclass protection for attachment: %@", buf, 0xCu);
            }
            CalAttachmentFileSetDataProtection(v14);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v11);
    }

    id v6 = v18;
    id v3 = v19;
  }
  else
  {
    uint64_t v17 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A8E81000, v17, OS_LOG_TYPE_ERROR, "Could not get legacy attachment container", buf, 2u);
    }
  }
}

@end