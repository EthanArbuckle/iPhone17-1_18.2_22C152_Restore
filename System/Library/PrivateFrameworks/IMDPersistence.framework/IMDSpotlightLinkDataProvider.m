@interface IMDSpotlightLinkDataProvider
+ (id)attachmentPathsFromMessageRecord:(id)a3;
+ (id)decontainerizedPathString:(id)a3;
- (id)dataForGUID:(id)a3 error:(id *)a4;
- (id)typeIdentifier;
@end

@implementation IMDSpotlightLinkDataProvider

+ (id)decontainerizedPathString:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 pathComponents];
  v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [v5 indexOfObject:@"Library"];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v3;
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v3;
        _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Did not need to decontainerize path %@", (uint8_t *)&v12, 0xCu);
      }

      v7 = v3;
    }
  }
  else
  {
    objc_msgSend(v5, "removeObjectsInRange:", 0, v6);
    v9 = NSString;
    v10 = [&unk_1F0864FE0 arrayByAddingObjectsFromArray:v5];
    v7 = [v9 pathWithComponents:v10];
  }
  return v7;
}

+ (id)attachmentPathsFromMessageRecord:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1B3E8A120]();
  v5 = [v3 attachmentRecords];
  if (v5)
  {
    v23 = v4;
    id v24 = v3;
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v22 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (!v8) {
      goto LABEL_16;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v13 = objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags", v22);
        int v14 = [v13 isSpotlightDaemonDelegateEnabled];

        if (v14)
        {
          v15 = [v12 path];
          if (v15) {
            goto LABEL_9;
          }
        }
        else
        {
          v17 = objc_opt_class();
          v18 = [v12 path];
          v15 = [v17 decontainerizedPathString:v18];

          if (v15)
          {
LABEL_9:
            v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v15 isDirectory:0];
            goto LABEL_12;
          }
        }
        v16 = 0;
LABEL_12:
        v19 = [v16 absoluteString];
        uint64_t v20 = [v19 length];

        if (v20) {
          [v6 addObject:v16];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (!v9)
      {
LABEL_16:

        v4 = v23;
        id v3 = v24;
        v5 = v22;
        goto LABEL_18;
      }
    }
  }
  uint64_t v6 = 0;
LABEL_18:

  return v6;
}

- (id)typeIdentifier
{
  return @"com.apple.metadata-importer.linkMetadata";
}

- (id)dataForGUID:(id)a3 error:(id *)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v5 = (__CFString *)a3;
  uint64_t v6 = (__CFString *)IMDMessageRecordCopyMessageForGUID(v5);
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      v22 = v6;
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "Found message for data: %@", (uint8_t *)&v21, 0xCu);
    }
  }
  if ([(__CFString *)v6 cacheHasAttachments])
  {
    uint64_t v8 = [(id)objc_opt_class() attachmentPathsFromMessageRecord:v6];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v9 = [(__CFString *)v6 iMessageAppBundleID];
  uint64_t v10 = [(__CFString *)v6 iMessageAppData];
  int v11 = [(id)*MEMORY[0x1E4F6CC10] isEqual:v9];
  if (v10) {
    int v12 = v11;
  }
  else {
    int v12 = 0;
  }
  if (v12 != 1 || v8 == 0)
  {
    if (IMOSLoggingEnabled())
    {
      int v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v21 = 138412546;
        v22 = v9;
        __int16 v23 = 2112;
        id v24 = v10;
        _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "Failed to find data for spotlight because either bundleID was wrong (%@) or data was nil (%@)", (uint8_t *)&v21, 0x16u);
      }
    }
    v16 = 0;
  }
  else
  {
    v25[0] = @"attachmentPaths";
    v25[1] = @"payloadData";
    v26[0] = v8;
    v26[1] = v10;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
    v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v15 requiringSecureCoding:0 error:a4];
    if (IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        if (a4) {
          id v19 = *a4;
        }
        else {
          id v19 = 0;
        }
        int v21 = 138412546;
        v22 = v16;
        __int16 v23 = 2112;
        id v24 = v19;
        _os_log_impl(&dword_1AFB53000, v18, OS_LOG_TYPE_INFO, "Returning data %@ to spotlight with error %@", (uint8_t *)&v21, 0x16u);
      }
    }
  }

  return v16;
}

@end