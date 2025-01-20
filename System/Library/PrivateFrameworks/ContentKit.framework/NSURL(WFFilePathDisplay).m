@interface NSURL(WFFilePathDisplay)
- (id)wf_displayPath;
- (id)wf_displayPathComponents;
- (id)wf_localizedDisplayName;
@end

@implementation NSURL(WFFilePathDisplay)

- (id)wf_localizedDisplayName
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int v2 = [a1 startAccessingSecurityScopedResource];
  v3 = [MEMORY[0x263F054C0] defaultManager];
  id v21 = 0;
  v4 = [v3 itemForURL:a1 error:&v21];
  id v5 = v21;

  if (v2) {
    [a1 stopAccessingSecurityScopedResource];
  }
  if (v4)
  {
    v6 = [v4 providerDomainID];
    if ([v6 isEqualToString:@"com.apple.FileProvider.LocalStorage"])
    {
      v7 = [v4 itemIdentifier];
      int v8 = [v7 isEqualToString:*MEMORY[0x263F053F0]];

      if (v8)
      {
        v9 = [MEMORY[0x263F85258] currentDevice];
        id v10 = [v9 localStorageDisplayName];

LABEL_17:
        id v15 = v5;
        goto LABEL_19;
      }
    }
    else
    {
    }
    id v10 = [v4 displayName];
    goto LABEL_17;
  }
  v11 = [a1 URLByStandardizingPath];
  id v20 = 0;
  uint64_t v12 = *MEMORY[0x263EFF738];
  id v19 = 0;
  int v13 = [v11 getResourceValue:&v20 forKey:v12 error:&v19];
  id v14 = v20;
  id v15 = v19;

  if (v13) {
    BOOL v16 = v14 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    v17 = getWFFilesLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[NSURL(WFFilePathDisplay) wf_localizedDisplayName]";
      __int16 v24 = 2112;
      id v25 = v15;
      _os_log_impl(&dword_216505000, v17, OS_LOG_TYPE_ERROR, "%s Could not get localized name resource from URL: %@", buf, 0x16u);
    }

    id v10 = 0;
  }
  else
  {
    id v10 = v14;
  }

LABEL_19:
  return v10;
}

- (id)wf_displayPath
{
  v1 = objc_msgSend(a1, "wf_displayPathComponents");
  int v2 = [v1 componentsJoinedByString:@"/"];

  return v2;
}

- (id)wf_displayPathComponents
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v2 = [getFPItemManagerClass() defaultManager];
  id v18 = 0;
  v3 = [v2 itemForURL:a1 error:&v18];
  id v4 = v18;

  if (v3)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v20 = __Block_byref_object_copy__15282;
    id v21 = __Block_byref_object_dispose__15283;
    id v22 = 0;
    v6 = [getFPItemManagerClass() defaultManager];
    v7 = [v3 itemID];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __52__NSURL_WFFilePathDisplay__wf_displayPathComponents__block_invoke;
    v15[3] = &unk_264288A48;
    v17 = buf;
    int v8 = v5;
    BOOL v16 = v8;
    [v6 fetchParentsForItemID:v7 recursively:1 completionHandler:v15];

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    v9 = *(void **)(*(void *)&buf[8] + 40);
    if (v9)
    {
      id v10 = [v9 reverseObjectEnumerator];
      v11 = [v10 allObjects];
      uint64_t v12 = [v11 arrayByAddingObject:v3];

      int v13 = objc_msgSend(v12, "if_map:", &__block_literal_global_15284);
    }
    else
    {
      int v13 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    int v8 = getWFFilesLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[NSURL(WFFilePathDisplay) wf_displayPathComponents]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      _os_log_impl(&dword_216505000, v8, OS_LOG_TYPE_DEFAULT, "%s Item not found when creating display components with error: %@", buf, 0x16u);
    }
    int v13 = 0;
  }

  return v13;
}

@end