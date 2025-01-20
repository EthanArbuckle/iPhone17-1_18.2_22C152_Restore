@interface BRFileProviderFrameworkOverride
- (BOOL)FPAreUTIsImportable:(id)a3 toFolderItem:(id)a4;
- (BOOL)FPFilterActions:(id)a3 forDroppingItems:(id)a4 underItem:(id)a5;
- (BOOL)FPURLIsInFileProvider:(id)a3;
- (BOOL)_doesUTI:(id)a3 conformsToUTIs:(id)a4;
- (id)FPBookmarkableStringFromDocumentURL:(id)a3 error:(id *)a4;
- (id)FPDocumentURLFromBookmarkableString:(id)a3 error:(id *)a4;
- (id)FPTrashURLForItemAtURL:(id)a3 error:(id *)a4;
- (id)_URLForItem:(id)a3;
- (id)_acceptableUTIsForFolderItem:(id)a3;
- (id)bookmarkPrefix;
- (int64_t)overridePriority;
- (void)FPBookmarkableStringFromDocumentURL:(id)a3 completionHandler:(id)a4;
- (void)FPDocumentURLFromBookmarkableString:(id)a3 completionHandler:(id)a4;
- (void)FPDocumentURLFromUniversalBookmarkableString:(id)a3 completionHandler:(id)a4;
- (void)FPEvictItemAtURL:(id)a3 completionHandler:(id)a4;
- (void)FPFetchLatestVersionForFileAtURL:(id)a3 completionHandler:(id)a4;
- (void)FPGetPausedFilesList:(id)a3 completionHandler:(id)a4;
- (void)FPPauseSyncForFileAtURL:(id)a3 timeout:(double)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (void)FPResumeSyncForFileAtURL:(id)a3 resumeOptions:(unint64_t)a4 completionHandler:(id)a5;
- (void)FPStateForDomainWithID:(id)a3 completionHandler:(id)a4;
- (void)FPUniversalBookmarkableStringFromDocumentURL:(id)a3 completionHandler:(id)a4;
@end

@implementation BRFileProviderFrameworkOverride

- (id)bookmarkPrefix
{
  return @"docs.icloud.com:";
}

- (int64_t)overridePriority
{
  return 100;
}

- (BOOL)FPURLIsInFileProvider:(id)a3
{
  return objc_msgSend(a3, "br_isInSyncedLocation");
}

- (void)FPBookmarkableStringFromDocumentURL:(id)a3 completionHandler:(id)a4
{
  id v9 = 0;
  v6 = (void (**)(id, void *, id))a4;
  v7 = [(BRFileProviderFrameworkOverride *)self FPBookmarkableStringFromDocumentURL:a3 error:&v9];
  id v8 = v9;
  v6[2](v6, v7, v8);
}

- (id)FPBookmarkableStringFromDocumentURL:(id)a3 error:(id *)a4
{
  v5 = objc_msgSend(a3, "br_cachedBookmarkData");
  if (v5)
  {
    v6 = [(BRFileProviderFrameworkOverride *)self bookmarkPrefix];
    v7 = [v6 stringByAppendingString:v5];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)FPDocumentURLFromBookmarkableString:(id)a3 completionHandler:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = [(BRFileProviderFrameworkOverride *)self bookmarkPrefix];
  char v8 = [v11 hasPrefix:v7];

  if (v8)
  {
    id v9 = [(BRFileProviderFrameworkOverride *)self bookmarkPrefix];
    uint64_t v10 = objc_msgSend(v11, "substringFromIndex:", objc_msgSend(v9, "length"));

    objc_msgSend(NSURL, "br_documentURLFromBookmarkableString:completion:", v10, v6);
    id v11 = (id)v10;
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (id)FPDocumentURLFromBookmarkableString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(BRFileProviderFrameworkOverride *)self bookmarkPrefix];
  int v8 = [v6 hasPrefix:v7];

  if (v8)
  {
    id v9 = [(BRFileProviderFrameworkOverride *)self bookmarkPrefix];
    uint64_t v10 = objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v9, "length"));

    id v11 = objc_msgSend(NSURL, "br_documentURLFromBookmarkableString:error:", v10, a4);
    id v6 = (id)v10;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_URLForItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 fileURL];

  if (v4)
  {
    v5 = [v3 fileURL];
  }
  else
  {
    id v6 = [v3 itemIdentifier];

    if ([v6 isEqualToString:*MEMORY[0x263F053F0]])
    {
      v7 = [MEMORY[0x263F32588] allContainersByContainerID];
      int v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F324E8]];

      v5 = [v8 url];
    }
    else
    {
      id v9 = [MEMORY[0x263F325B8] fileObjectIDWithString:v6];
      if (v9)
      {
        id v12 = 0;
        v5 = objc_msgSend(NSURL, "br_documentURLFromFileObjectID:error:", v9, &v12);
        id v10 = v12;
      }
      else
      {
        id v10 = 0;
        v5 = 0;
      }
    }
  }

  return v5;
}

- (id)_acceptableUTIsForFolderItem:(id)a3
{
  id v3 = [(BRFileProviderFrameworkOverride *)self _URLForItem:a3];
  v4 = objc_msgSend(v3, "br_cloudDocsContainer");
  v5 = [v4 documentsTypes];
  id v6 = [v5 valueForKeyPath:@"@distinctUnionOfArrays.LSItemContentTypes"];

  return v6;
}

- (BOOL)_doesUTI:(id)a3 conformsToUTIs:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v5 = (__CFString *)a3;
  id v6 = a4;
  if ([v6 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          if (UTTypeConformsTo(v5, *(CFStringRef *)(*((void *)&v12 + 1) + 8 * i)))
          {
            LOBYTE(v8) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (BOOL)FPFilterActions:(id)a3 forDroppingItems:(id)a4 underItem:(id)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v9 providerIdentifier];
  if ([v10 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"])
  {
  }
  else
  {
    id v11 = [v9 providerIdentifier];
    int v12 = [v11 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"];

    if (!v12)
    {
      BOOL v37 = 0;
      goto LABEL_31;
    }
  }
  [(BRFileProviderFrameworkOverride *)self _acceptableUTIsForFolderItem:v9];
  v40 = id v39 = v8;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v8;
  uint64_t v46 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v46)
  {
    uint64_t v45 = *(void *)v50;
    uint64_t v47 = *MEMORY[0x263F05030];
    uint64_t v43 = *MEMORY[0x263F04FD0];
    v44 = v7;
    while (2)
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v50 != v45) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        long long v15 = (void *)MEMORY[0x24567AD10]();
        if (![v7 count])
        {
          goto LABEL_29;
        }
        v16 = [v14 providerIdentifier];
        if ([v16 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"])
        {
        }
        else
        {
          uint64_t v17 = [v14 providerIdentifier];
          char v18 = [v17 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"];

          if ((v18 & 1) == 0) {
            [v7 removeObject:v47];
          }
        }
        if ((objc_msgSend(v14, "isFolder", v39) & 1) == 0)
        {
          v19 = [v14 typeIdentifier];
          BOOL v20 = [(BRFileProviderFrameworkOverride *)self _doesUTI:v19 conformsToUTIs:v40];

          if (!v20)
          {
            [v7 removeObject:v47];
            [v7 removeObject:v43];
          }
        }
        v21 = [v14 userInfo];
        v22 = [v21 objectForKeyedSubscript:@"ro"];
        int v23 = [v22 BOOLValue];

        v24 = [v14 userInfo];
        v25 = [v24 objectForKeyedSubscript:@"up"];
        int v48 = [v25 BOOLValue];

        id v26 = v9;
        v27 = [v9 userInfo];
        v28 = [v27 objectForKeyedSubscript:@"ro"];
        int v29 = [v28 BOOLValue];

        v30 = [v14 userInfo];
        v31 = [v30 objectForKey:@"pzid"];

        v32 = [v14 userInfo];
        v33 = [v32 objectForKeyedSubscript:@"zid"];

        v34 = [v14 userInfo];
        v35 = [v34 objectForKeyedSubscript:@"s"];
        if ([v35 BOOLValue]) {
          int v36 = objc_msgSend(v31, "br_isEqualToNumber:", v33) ^ 1;
        }
        else {
          int v36 = 0;
        }

        id v7 = v44;
        if (v29)
        {
          [v44 removeObject:v47];
          [v44 removeObject:v43];
        }
        if (((v23 ^ 1 | v36) & 1) == 0 && ((v48 ^ 1) & 1) == 0) {
          [v44 removeObject:v47];
        }

        id v9 = v26;
      }
      uint64_t v46 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (v46) {
        continue;
      }
      break;
    }
  }
LABEL_29:

  BOOL v37 = 1;
  id v8 = v39;
LABEL_31:

  return v37;
}

- (BOOL)FPAreUTIsImportable:(id)a3 toFolderItem:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 providerIdentifier];
  if ([v8 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProvider"])
  {
  }
  else
  {
    id v9 = [v7 providerIdentifier];
    int v10 = [v9 isEqualToString:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"];

    if (!v10)
    {
      BOOL v17 = 1;
      goto LABEL_16;
    }
  }
  id v11 = [(BRFileProviderFrameworkOverride *)self _acceptableUTIsForFolderItem:v7];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        if (!-[BRFileProviderFrameworkOverride _doesUTI:conformsToUTIs:](self, "_doesUTI:conformsToUTIs:", *(void *)(*((void *)&v19 + 1) + 8 * i), v11, (void)v19))
        {
          BOOL v17 = 0;
          goto LABEL_14;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 1;
LABEL_14:

LABEL_16:
  return v17;
}

- (void)FPUniversalBookmarkableStringFromDocumentURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_243355D00;
  v8[3] = &unk_26517E390;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  objc_msgSend(a3, "br_bookmarkableStringWithEtag:onlyAllowItemKnowByServer:completion:", 0, 1, v8);
}

- (void)FPDocumentURLFromUniversalBookmarkableString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BRFileProviderFrameworkOverride *)self bookmarkPrefix];
  char v9 = [v6 hasPrefix:v8];

  if (v9)
  {
    int v10 = [(BRFileProviderFrameworkOverride *)self bookmarkPrefix];
    uint64_t v11 = objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v10, "length"));

    id v12 = NSURL;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_243355EFC;
    v13[3] = &unk_26517E3B8;
    id v14 = v7;
    objc_msgSend(v12, "br_documentURLFromBookmarkableString:completion:", v11, v13);

    id v6 = (id)v11;
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (id)FPTrashURLForItemAtURL:(id)a3 error:(id *)a4
{
  v4 = objc_msgSend(a3, "br_cloudDocsContainer");
  v5 = [v4 trashURL];

  return v5;
}

- (void)FPPauseSyncForFileAtURL:(id)a3 timeout:(double)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  if (objc_msgSend(v9, "br_isInSyncedLocation"))
  {
    uint64_t v11 = [MEMORY[0x263F325A0] defaultConnection];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_2433560EC;
    v17[3] = &unk_26517E3E0;
    id v12 = v10;
    id v18 = v12;
    uint64_t v13 = [v11 remoteObjectProxyWithErrorHandler:v17];

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_243356104;
    v15[3] = &unk_26517E3E0;
    id v16 = v12;
    [v13 pauseSyncForFileAtURL:v9 timeout:a5 options:v15 reply:a4];
  }
  else
  {
    id v14 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:", v9);
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

- (void)FPResumeSyncForFileAtURL:(id)a3 resumeOptions:(unint64_t)a4 completionHandler:(id)a5
{
  char v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if (objc_msgSend(v7, "br_isInSyncedLocation"))
  {
    id v9 = [MEMORY[0x263F325A0] defaultConnection];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = sub_243356328;
    v18[3] = &unk_26517E3E0;
    id v10 = v8;
    id v19 = v10;
    uint64_t v11 = [v9 remoteObjectProxyWithErrorHandler:v18];

    BOOL v12 = (v6 & 6) != 0;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = sub_243356340;
    v14[3] = &unk_26517E408;
    id v16 = v10;
    BOOL v17 = v12;
    id v15 = v7;
    [v11 resumeSyncForFileAtURL:v15 dropLocalChanges:v12 reply:v14];
  }
  else
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:", v7);
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v13);
  }
}

- (void)FPGetPausedFilesList:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F325A0] defaultConnection];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_24335661C;
  v18[3] = &unk_26517E3E0;
  id v19 = v6;
  id v8 = v6;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v18];

  id v10 = objc_alloc(MEMORY[0x263F325D0]);
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = sub_24335662C;
  id v16 = &unk_26517E430;
  id v17 = v5;
  id v11 = v5;
  BOOL v12 = (void *)[v10 initWithCallback:&v13];
  objc_msgSend(v9, "getPausedFilesList:reply:", v12, v8, v13, v14, v15, v16);
}

- (void)FPFetchLatestVersionForFileAtURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend(v5, "br_isInSyncedLocation"))
  {
    id v7 = [MEMORY[0x263F325A0] defaultConnection];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = sub_243356830;
    v14[3] = &unk_26517E3E0;
    id v8 = v6;
    id v15 = v8;
    id v9 = [v7 remoteObjectProxyWithErrorHandler:v14];

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_243356848;
    v11[3] = &unk_26517E458;
    id v13 = v8;
    id v12 = v5;
    [v9 fetchLatestVersionForFileAtURL:v12 reply:v11];
  }
  else
  {
    id v10 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorPathOutsideAnyCloudDocsAppLibraryAtURL:", v5);
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v10);
  }
}

- (void)FPEvictItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  BRSynchronousEvictItemAtURLWithOptions();
}

- (void)FPStateForDomainWithID:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 hasPrefix:@"com.apple.CloudDocs.MobileDocumentsFileProvider"] & 1) != 0
    || ([v5 hasPrefix:@"com.apple.CloudDocs.MobileDocumentsFileProviderManaged"] & 1) != 0)
  {
    id v7 = [MEMORY[0x263F325A0] defaultConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_243356E0C;
    v15[3] = &unk_26517E3E0;
    id v8 = v6;
    id v16 = v8;
    id v9 = [v7 remoteObjectProxyWithErrorHandler:v15];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_243356E24;
    v12[3] = &unk_26517E4A8;
    id v13 = v8;
    uint64_t v14 = 10;
    [v9 getSyncState:10 reply:v12];
  }
  else
  {
    id v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_243356F60();
    }

    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

@end