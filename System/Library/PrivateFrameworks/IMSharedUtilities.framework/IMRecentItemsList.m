@interface IMRecentItemsList
+ (id)sharedInstance;
- (IMRecentItemsList)init;
- (id)_buildLRUCacheUsingArray:(id)a3 forDomain:(id)a4;
- (id)_guidForFileURL:(id)a3;
- (id)_recentsCacheForDomain:(id)a3;
- (int64_t)cacheSizeForDomain:(id)a3;
- (void)_addRecentDataPayloadEntry:(id)a3 toDomain:(id)a4;
- (void)_removeRecentDataPayloadEntry:(id)a3 forDomain:(id)a4;
- (void)_removeRecentDataPayloadEntryFromDisk:(id)a3 forDomain:(id)a4;
- (void)_saveRecentDataPayloadEntryToDisk:(id)a3 forDomain:(id)a4;
- (void)_updateRecentsCache:(id)a3 forDomain:(id)a4;
- (void)addRecentItemAtFileURL:(id)a3 GUID:(id)a4 infoDictionary:(id)a5 forDomain:(id)a6;
- (void)addRecentItemWithData:(id)a3 GUID:(id)a4 infoDictionary:(id)a5 forDomain:(id)a6;
- (void)dealloc;
- (void)deleteAllRecentItemsForDomain:(id)a3;
- (void)deleteRecentItemWithData:(id)a3 GUID:(id)a4 forDomain:(id)a5;
- (void)deleteRecentItemWithFileURL:(id)a3 GUID:(id)a4 forDomain:(id)a5;
- (void)deleteRecentsInFirstLaunch;
- (void)dispatchCacheUpdateWithBlock:(id)a3;
- (void)fetchRecentItemsForDomain:(id)a3 completion:(id)a4;
- (void)fetchRecentStickersWithCompletion:(id)a3;
@end

@implementation IMRecentItemsList

+ (id)sharedInstance
{
  if (qword_1EB4A66F0 != -1) {
    dispatch_once(&qword_1EB4A66F0, &unk_1EF2BF460);
  }
  return (id)qword_1EB4A6658;
}

- (IMRecentItemsList)init
{
  v4.receiver = self;
  v4.super_class = (Class)IMRecentItemsList;
  v2 = [(IMRecentItemsList *)&v4 init];
  if (v2) {
    v2->_diskWritingQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.private.IMSharedUtilities.IMRecents", 0);
  }
  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_diskWritingQueue);
  self->_diskWritingQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)IMRecentItemsList;
  [(IMRecentItemsList *)&v3 dealloc];
}

- (int64_t)cacheSizeForDomain:(id)a3
{
  if (qword_1E94FF530 != -1) {
    dispatch_once(&qword_1E94FF530, &unk_1EF2C0B40);
  }
  objc_super v4 = (void *)[(id)qword_1E94FF528 objectForKey:a3];

  return [v4 integerValue];
}

- (void)dispatchCacheUpdateWithBlock:(id)a3
{
  if (a3)
  {
    diskWritingQueue = self->_diskWritingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A07EF030;
    block[3] = &unk_1E5A11FC8;
    block[4] = a3;
    dispatch_async(diskWritingQueue, block);
  }
}

- (void)deleteRecentItemWithFileURL:(id)a3 GUID:(id)a4 forDomain:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A07EF1B4;
  v5[3] = &unk_1E5A11FF0;
  v5[4] = a4;
  v5[5] = self;
  v5[6] = a3;
  v5[7] = a5;
  [(IMRecentItemsList *)self dispatchCacheUpdateWithBlock:v5];
}

- (void)deleteRecentItemWithData:(id)a3 GUID:(id)a4 forDomain:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A07EF2A4;
  v5[3] = &unk_1E5A11FF0;
  v5[4] = a4;
  v5[5] = a3;
  v5[6] = self;
  v5[7] = a5;
  [(IMRecentItemsList *)self dispatchCacheUpdateWithBlock:v5];
}

- (void)deleteAllRecentItemsForDomain:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1A07EF374;
  v3[3] = &unk_1E5A10B08;
  v3[4] = a3;
  [(IMRecentItemsList *)self dispatchCacheUpdateWithBlock:v3];
}

- (void)deleteRecentsInFirstLaunch
{
  if ((IMGetCachedDomainBoolForKey() & 1) == 0)
  {
    IMSetDomainBoolForKey();
    v2 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v3 = [(id)IMSystemRootDirectory() stringByAppendingString:@"/var/mobile/Library/SMS/Recents/"];
    [v2 removeItemAtPath:v3 error:0];
  }
}

- (void)addRecentItemWithData:(id)a3 GUID:(id)a4 infoDictionary:(id)a5 forDomain:(id)a6
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1A07EF5F4;
  v6[3] = &unk_1E5A12018;
  v6[4] = a4;
  v6[5] = a3;
  v6[6] = a5;
  v6[7] = self;
  v6[8] = a6;
  [(IMRecentItemsList *)self dispatchCacheUpdateWithBlock:v6];
}

- (void)fetchRecentStickersWithCompletion:(id)a3
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3052000000;
  v12[3] = sub_1A077781C;
  v12[4] = sub_1A07776F8;
  v12[5] = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3052000000;
  v10[3] = sub_1A077781C;
  v10[4] = sub_1A07776F8;
  id v11 = 0;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3052000000;
  v8[3] = sub_1A077781C;
  v8[4] = sub_1A07776F8;
  uint64_t v9 = 0;
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 10);
  uint64_t v5 = MEMORY[0x1A6227920]("IMDAttachmentRecordCopyAttachmentStickers", @"IMDPersistence");
  diskWritingQueue = self->_diskWritingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A07EF84C;
  block[3] = &unk_1E5A12068;
  void block[5] = v12;
  block[6] = v8;
  block[7] = v10;
  block[8] = v5;
  block[4] = a3;
  dispatch_async(diskWritingQueue, block);
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v12, 8);
}

- (void)fetchRecentItemsForDomain:(id)a3 completion:(id)a4
{
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3052000000;
  v14[3] = sub_1A077781C;
  v14[4] = sub_1A07776F8;
  v14[5] = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3052000000;
  v12[3] = sub_1A077781C;
  v12[4] = sub_1A07776F8;
  id v13 = 0;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3052000000;
  v11[3] = sub_1A077781C;
  v11[4] = sub_1A07776F8;
  v11[5] = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3052000000;
  v10[3] = sub_1A077781C;
  v10[4] = sub_1A07776F8;
  void v10[5] = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3052000000;
  v9[3] = sub_1A077781C;
  v9[4] = sub_1A07776F8;
  v9[5] = 0;
  diskWritingQueue = self->_diskWritingQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1A07EFEEC;
  v8[3] = &unk_1E5A12090;
  v8[4] = self;
  void v8[5] = a3;
  v8[8] = v11;
  v8[9] = v9;
  v8[10] = v10;
  v8[11] = v12;
  v8[6] = a4;
  v8[7] = v14;
  dispatch_async(diskWritingQueue, v8);
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v14, 8);
}

- (void)_addRecentDataPayloadEntry:(id)a3 toDomain:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v32 = (void *)[a3 GUID];
  if (IMOSLoggingEnabled())
  {
    objc_super v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v49 = (uint64_t)a4;
      __int16 v50 = 2112;
      v51 = v32;
      __int16 v52 = 2112;
      uint64_t v53 = [a3 timestamp];
      _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Adding new recents entry in domain: %@ with GUID: %@ and timestamp: %@", buf, 0x20u);
    }
  }
  id obj = (id)objc_msgSend(-[IMRecentItemsList _recentsCacheForDomain:](self, "_recentsCacheForDomain:", a4), "mutableCopy");
  int v5 = IMOSLoggingEnabled();
  if (obj)
  {
    if (v5)
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v49 = (uint64_t)a4;
        _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "Updating existing Recents cache for domain: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (v5)
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v49 = (uint64_t)a4;
        _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Creating new Recents cache for domain: %@", buf, 0xCu);
      }
    }
    id obj = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  objc_msgSend(obj, "addObject:", objc_msgSend(a3, "asJSONObject"));
  id v8 = [(IMRecentItemsList *)self _buildLRUCacheUsingArray:obj forDomain:a4];
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [v8 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v49 = v10;
      _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Cache Size: %tu", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v49 = (uint64_t)v8;
      _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Cache contents: %@", buf, 0xCu);
    }
  }
  if (v8)
  {
    uint64_t v12 = [obj count];
    if (v12 != [v8 count])
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v13)
      {
        uint64_t v15 = *(void *)v42;
        *(void *)&long long v14 = 138412290;
        long long v27 = v14;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v42 != v15) {
              objc_enumerationMutation(obj);
            }
            v17 = *(void **)(*((void *)&v41 + 1) + 8 * v16);
            long long v37 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            uint64_t v18 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v46, 16, v27);
            if (v18)
            {
              uint64_t v19 = *(void *)v38;
LABEL_27:
              uint64_t v20 = 0;
              while (1)
              {
                if (*(void *)v38 != v19) {
                  objc_enumerationMutation(v8);
                }
                if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v20), "valueForKey:", @"guid"), "isEqualToString:", objc_msgSend(v17, "valueForKey:", @"guid")))break; {
                if (v18 == ++v20)
                }
                {
                  uint64_t v18 = [v8 countByEnumeratingWithState:&v37 objects:v46 count:16];
                  if (v18) {
                    goto LABEL_27;
                  }
                  goto LABEL_33;
                }
              }
            }
            else
            {
LABEL_33:
              if (IMOSLoggingEnabled())
              {
                v21 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  uint64_t v22 = [v17 valueForKey:@"guid"];
                  *(_DWORD *)buf = v27;
                  uint64_t v49 = v22;
                  _os_log_impl(&dword_1A0772000, v21, OS_LOG_TYPE_INFO, "Removing deprecated recents item: %@", buf, 0xCu);
                }
              }
              -[IMRecentItemsList _removeRecentDataPayloadEntryFromDisk:forDomain:](self, "_removeRecentDataPayloadEntryFromDisk:forDomain:", [v17 valueForKey:@"guid"], a4);
            }
            ++v16;
          }
          while (v16 != v13);
          uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
        }
        while (v13);
      }
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v23 = [v8 countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v34;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v34 != v24) {
            objc_enumerationMutation(v8);
          }
          if (objc_msgSend(v32, "isEqualToString:", objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v25), "valueForKey:", @"guid")))
          {
            if (IMOSLoggingEnabled())
            {
              v26 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A0772000, v26, OS_LOG_TYPE_INFO, "Saving new Recents Payload to disk", buf, 2u);
              }
            }
            [(IMRecentItemsList *)self _saveRecentDataPayloadEntryToDisk:a3 forDomain:a4];
          }
          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [v8 countByEnumeratingWithState:&v33 objects:v45 count:16];
      }
      while (v23);
    }
    [(IMRecentItemsList *)self _updateRecentsCache:v8 forDomain:a4];
  }
}

- (void)addRecentItemAtFileURL:(id)a3 GUID:(id)a4 infoDictionary:(id)a5 forDomain:(id)a6
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3052000000;
  v9[3] = sub_1A077781C;
  v9[4] = sub_1A07776F8;
  v9[5] = 0;
  if (a3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1A07F0C18;
    v7[3] = &unk_1E5A120B8;
    v7[4] = a4;
    v7[5] = a6;
    v7[6] = a3;
    v7[7] = self;
    v7[8] = a5;
    v7[9] = v9;
    [(IMRecentItemsList *)self dispatchCacheUpdateWithBlock:v7];
  }
  else if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "No file URL provided when adding recent", buf, 2u);
    }
  }
  _Block_object_dispose(v9, 8);
}

- (void)_removeRecentDataPayloadEntry:(id)a3 forDomain:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v19 = a4;
      __int16 v20 = 2112;
      uint64_t v21 = [a3 GUID];
      __int16 v22 = 2112;
      uint64_t v23 = [a3 timestamp];
      _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Updating cache with Data Payload entry for Domain: %@ with GUID: %@ and timestamp: %@", buf, 0x20u);
    }
  }
  id v8 = objc_msgSend(-[IMRecentItemsList _recentsCacheForDomain:](self, "_recentsCacheForDomain:", a4), "mutableCopy");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v12, "valueForKey:", @"guid"), "isEqualToString:", objc_msgSend(a3, "GUID")))
        {
          [v8 removeObject:v12];
          -[IMRecentItemsList _removeRecentDataPayloadEntryFromDisk:forDomain:](self, "_removeRecentDataPayloadEntryFromDisk:forDomain:", [a3 GUID], a4);
          [(IMRecentItemsList *)self _updateRecentsCache:v8 forDomain:a4];
          goto LABEL_14;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (void)_saveRecentDataPayloadEntryToDisk:(id)a3 forDomain:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v5 = (void *)FormattedDataFilePath(a4, (void *)[a3 GUID]);
  long long v14 = 0;
  IMSharedHelperEnsureDirectoryExistsAtPath([v5 stringByDeletingLastPathComponent]);
  if ([a3 messageItemInfo])
  {
    uint64_t v6 = [v5 stringByAppendingPathExtension:@"json"];
    v7 = objc_msgSend(MEMORY[0x1E4F28D90], "dataWithJSONObject:options:error:", objc_msgSend(a3, "messageItemInfo"), 0, &v14);
    if (!v7)
    {
      if (IMOSLoggingEnabled())
      {
        id v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          long long v16 = v14;
          _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Failed to save recent item info dictionary onto disk. Error: %@", buf, 0xCu);
        }
      }
    }
    [v7 writeToFile:v6 atomically:1];
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      long long v16 = v5;
      _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Creating a new Recents Item payload file at: %@", buf, 0xCu);
    }
  }
  if ([a3 payloadData])
  {
    char v10 = objc_msgSend((id)objc_msgSend(a3, "payloadData"), "writeToFile:atomically:", v5, 1);
    int v11 = IMOSLoggingEnabled();
    if (v10)
    {
      if (v11)
      {
        uint64_t v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Wrote data to disk successfully. Posting IMRecentItemsListUpdatedNotification", buf, 2u);
        }
      }
      notify_post((const char *)[@"com.apple.imagent.IMRecentItemsListUpdatedNotification" UTF8String]);
    }
    else if (v11)
    {
      long long v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "Failed to write data to disk", buf, 2u);
      }
    }
  }
}

- (void)_removeRecentDataPayloadEntryFromDisk:(id)a3 forDomain:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v5 = (void *)FormattedDataFilePath(a4, a3);
  uint64_t v6 = [v5 stringByAppendingPathExtension:@"json"];
  uint64_t v15 = 0;
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "isDeletableFileAtPath:", v5))return; {
  char v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtPath:error:", v5, &v15);
  }
  int v8 = IMOSLoggingEnabled();
  if (v7)
  {
    if (v8)
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v5;
        char v10 = "Successfully removed data payload: %@";
        int v11 = v9;
        uint32_t v12 = 12;
LABEL_9:
        _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, v10, buf, v12);
      }
    }
  }
  else if (v8)
  {
    long long v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      uint64_t v19 = v15;
      char v10 = "Failed to delete payload data from file %@. Error: %@";
      int v11 = v13;
      uint32_t v12 = 22;
      goto LABEL_9;
    }
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v6))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtPath:error:", v6, &v15);
    if (v15)
    {
      if (IMOSLoggingEnabled())
      {
        long long v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v17 = a3;
          __int16 v18 = 2112;
          uint64_t v19 = v15;
          _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "Failed to delete dictionary info for GUID %@. Error: %@", buf, 0x16u);
        }
      }
    }
  }
}

- (id)_buildLRUCacheUsingArray:(id)a3 forDomain:(id)a4
{
  id v18 = a4;
  long long v16 = self;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    objc_super v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Building Recents list as Least Recently Used Cache...", buf, 2u);
    }
  }
  int v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(a3, "count"));
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v21 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v21) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v5, "containsObject:", objc_msgSend(v9, "objectForKey:", @"guid", v16, v18)))
        {
          if ([v6 count])
          {
            unint64_t v10 = 0;
            do
            {
              int v11 = (void *)[v6 objectAtIndexedSubscript:v10];
              if (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", @"guid"), "isEqualToString:", objc_msgSend(v11, "objectForKeyedSubscript:", @"guid")))
              {
                uint64_t v12 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", @"timestamp"), "integerValue");
                if (v12 > objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", @"timestamp"), "integerValue"))objc_msgSend(v6, "replaceObjectAtIndex:withObject:", v10, v9); {
              }
                }
              ++v10;
            }
            while (v10 < [v6 count]);
          }
        }
        else
        {
          objc_msgSend(v5, "addObject:", objc_msgSend(v9, "objectForKey:", @"guid"));
          [v6 addObject:v9];
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }
  objc_msgSend(v6, "sortUsingComparator:", &unk_1EF2BFDA0, v16, v18);
  unint64_t v13 = [v17 cacheSizeForDomain:v19];
  if ([v6 count] <= v13) {
    unint64_t v13 = [v6 count];
  }
  long long v14 = objc_msgSend(v6, "subarrayWithRange:", 0, v13);

  return v14;
}

- (id)_recentsCacheForDomain:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  uint64_t v3 = FormattedRecentsCacheFilePath(a3);
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v3)) {
    goto LABEL_17;
  }
  if (IMOSLoggingEnabled())
  {
    objc_super v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Retrieving Recents cache from JSON file...", buf, 2u);
    }
  }
  uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3];
  if (v5)
  {
    id v6 = (void *)[MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:&v10];
    if (v6)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v12 = v10;
          _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Failed read JSON data from recents cache. Error: %@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
LABEL_17:
    if (IMOSLoggingEnabled())
    {
      int v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v3;
        _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "No data from parsing %@. This must be the first time we're creating a cache", buf, 0xCu);
      }
    }
    return 0;
  }
  return v6;
}

- (void)_updateRecentsCache:(id)a3 forDomain:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  uint64_t v5 = (void *)FormattedRecentsCacheFilePath(a4);
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "Updating Recents cache into JSON file: %@", buf, 0xCu);
    }
  }
  IMSharedHelperEnsureDirectoryExistsAtPath([v5 stringByDeletingLastPathComponent]);
  uint64_t v7 = (void *)[MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:0 error:&v15];
  if (!v15)
  {
    char v12 = [v7 writeToFile:v5 atomically:1];
    int v13 = IMOSLoggingEnabled();
    if (v12)
    {
      if (!v13) {
        return;
      }
      long long v14 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        return;
      }
      *(_WORD *)buf = 0;
      uint64_t v9 = "Successfully written JSON to file";
    }
    else
    {
      if (!v13) {
        return;
      }
      long long v14 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        return;
      }
      *(_WORD *)buf = 0;
      uint64_t v9 = "Failed to write recents cache into file!";
    }
    uint64_t v10 = v14;
    uint32_t v11 = 2;
    goto LABEL_16;
  }
  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      uint64_t v9 = "Failed to generate json object from recents cache for %@";
      uint64_t v10 = v8;
      uint32_t v11 = 12;
LABEL_16:
      _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, v9, buf, v11);
    }
  }
}

- (id)_guidForFileURL:(id)a3
{
  objc_super v4 = (void *)[a3 lastPathComponent];
  return (id)[NSString stringWithFormat:@"%@-%@", IMSharedHelperMD5HashOfFileAtPath(objc_msgSend(a3, "path")), objc_msgSend(v4, "stringByDeletingPathExtension")];
}

@end