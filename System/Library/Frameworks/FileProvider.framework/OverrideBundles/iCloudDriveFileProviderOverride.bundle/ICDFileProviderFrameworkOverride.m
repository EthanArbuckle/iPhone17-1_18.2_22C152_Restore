@interface ICDFileProviderFrameworkOverride
+ (BOOL)_isURLExcludedFromSync:(id)a3 syncRoot:(id)a4 error:(id *)a5;
- (id)bookmarkPrefix;
- (int64_t)overridePriority;
- (void)FPDocumentURLFromUniversalBookmarkableString:(id)a3 completionHandler:(id)a4;
- (void)FPStateForDomainWithID:(id)a3 completionHandler:(id)a4;
- (void)FPUniversalBookmarkableStringFromDocumentURL:(id)a3 completionHandler:(id)a4;
- (void)FPValuesForAttributes:(id)a3 forItemAtURL:(id)a4 completionHandler:(id)a5;
@end

@implementation ICDFileProviderFrameworkOverride

- (int64_t)overridePriority
{
  return 101;
}

- (id)bookmarkPrefix
{
  return @"docs.icloud.com:";
}

+ (BOOL)_isURLExcludedFromSync:(id)a3 syncRoot:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = objc_msgSend(v7, "br_realpathURL");
  v10 = objc_msgSend(v8, "br_realpathURL");

  if (v9 && v10)
  {
    while (1)
    {
      v11 = [v10 path];
      v12 = [v9 path];
      char v13 = [v11 isEqualToString:v12];

      if (v13)
      {
        id v18 = 0;
        goto LABEL_17;
      }
      v14 = (void *)MEMORY[0x24567B2F0]();
      v15 = [v9 lastPathComponent];
      if (objc_msgSend(v15, "br_isExcludedWithMaximumDepth:", 1))
      {
        id v18 = 0;
LABEL_14:

        BOOL v19 = 1;
        goto LABEL_18;
      }
      id v21 = 0;
      char v16 = objc_msgSend(v9, "br_isIgnoredByFileProviderWithError:", &v21);
      id v17 = v21;
      id v18 = v17;
      if (v16) {
        goto LABEL_14;
      }
      if (v17) {
        break;
      }
      id v18 = [v9 URLByDeletingLastPathComponent];

      v9 = v18;
      if (!v18) {
        goto LABEL_17;
      }
    }

    if (a5)
    {
      id v18 = v18;
      BOOL v19 = 0;
      *a5 = v18;
      goto LABEL_18;
    }
LABEL_17:
    BOOL v19 = 0;
LABEL_18:
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:", 2);
    BOOL v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (void)FPValuesForAttributes:(id)a3 forItemAtURL:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = (void *)MEMORY[0x24567B2F0]();
  v10 = objc_msgSend(a4, "br_realpathURL");
  if (objc_msgSend(v10, "br_isExistWithNonMateralizingIOPolicy:", 1))
  {
    id v36 = 0;
    v11 = objc_msgSend(v10, "br_getSyncRootWithError:", &v36);
    id v12 = v36;
    if (v12)
    {
      char v13 = v12;
    }
    else
    {
      if (geteuid())
      {
        if (!v11)
        {
          (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
          goto LABEL_30;
        }
        uint64_t v14 = *MEMORY[0x263EFF710];
        if ([v7 containsObject:*MEMORY[0x263EFF710]])
        {
          v15 = objc_opt_new();
          id v35 = 0;
          BOOL v16 = +[ICDFileProviderFrameworkOverride _isURLExcludedFromSync:v10 syncRoot:v11 error:&v35];
          id v17 = v35;
          char v13 = v17;
          if (v16)
          {
            uint64_t v18 = MEMORY[0x263EFFA80];
          }
          else
          {
            if (v17)
            {
              (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
LABEL_28:

              goto LABEL_30;
            }
            uint64_t v18 = MEMORY[0x263EFFA88];
          }
          [v15 setObject:v18 forKey:v14];
          uint64_t v31 = objc_msgSend(v7, "br_copy_if:", &unk_26F8A50E8);

          id v7 = (id)v31;
LABEL_12:
          uint64_t v19 = *MEMORY[0x263EFF7E8];
          int v20 = [v7 containsObject:*MEMORY[0x263EFF7E8]];
          int v21 = v20;
          if (v15 || !v20)
          {
            if (v15) {
              goto LABEL_18;
            }
          }
          else if (objc_msgSend(v10, "br_isInSyncedLocation"))
          {
            v22 = [MEMORY[0x263F32618] sharedReachabilityMonitor];
            int v23 = [v22 isNetworkReachable];

            if (!v23)
            {
              v15 = objc_opt_new();
LABEL_18:
              if ([v7 count])
              {
                uint64_t v24 = *MEMORY[0x263EFF7D8];
                v33 = v11;
                if (v21 && ([v7 containsObject:v24] & 1) == 0)
                {
                  uint64_t v25 = [v7 arrayByAddingObject:v24];

                  id v7 = (id)v25;
                }
                v26 = [MEMORY[0x263F05448] sharedConnection];
                id v34 = v13;
                v27 = [v26 valuesForAttributes:v7 forItemAtURL:v10 error:&v34];
                id v32 = v34;

                [v15 addEntriesFromDictionary:v27];
                v28 = [v27 valueForKey:v24];
                v29 = v28;
                if (v28 && ([v28 BOOLValue] & 1) == 0)
                {
                  v30 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4355 userInfo:0];
                  [v15 setValue:v30 forKey:v19];
                }
                (*((void (**)(id, void *, void))v8 + 2))(v8, v15, 0);

                v11 = v33;
                goto LABEL_30;
              }
              (*((void (**)(id, void *, void))v8 + 2))(v8, v15, 0);
              goto LABEL_28;
            }
          }
          (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);

LABEL_30:
          goto LABEL_31;
        }
      }
      char v13 = 0;
    }
    v15 = 0;
    goto LABEL_12;
  }
  (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
LABEL_31:
}

- (void)FPStateForDomainWithID:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 hasPrefix:@"com.apple.CloudDocs.iCloudDriveFileProvider"] & 1) != 0
    || ([v5 hasPrefix:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"] & 1) != 0)
  {
    id v7 = [MEMORY[0x263F325A0] defaultConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_243361430;
    v15[3] = &unk_26517EB88;
    id v8 = v6;
    id v16 = v8;
    v9 = [v7 remoteObjectProxyWithErrorHandler:v15];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_243361448;
    v12[3] = &unk_26517EBB0;
    id v13 = v8;
    uint64_t v14 = 10;
    [v9 getSyncState:10 reply:v12];
  }
  else
  {
    v10 = brc_bread_crumbs();
    v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_243361728((uint64_t)v5, (uint64_t)v10, v11);
    }

    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)FPUniversalBookmarkableStringFromDocumentURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_24336151C;
  v8[3] = &unk_26517EBD8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  objc_msgSend(a3, "br_bookmarkableStringWithEtag:onlyAllowItemKnowByServer:completion:", 0, 1, v8);
}

- (void)FPDocumentURLFromUniversalBookmarkableString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICDFileProviderFrameworkOverride *)self bookmarkPrefix];
  char v9 = [v6 hasPrefix:v8];

  if (v9)
  {
    v10 = [(ICDFileProviderFrameworkOverride *)self bookmarkPrefix];
    uint64_t v11 = objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v10, "length"));

    id v12 = NSURL;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_243361718;
    v13[3] = &unk_26517EC00;
    id v14 = v7;
    objc_msgSend(v12, "br_documentURLFromBookmarkableString:completion:", v11, v13);

    id v6 = (id)v11;
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

@end