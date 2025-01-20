@interface NSURL
@end

@implementation NSURL

id __54__NSURL_DCURLUtilities__dc_queryItemsFromQueryString___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 componentsSeparatedByString:@"="];
  if ([v2 count])
  {
    v3 = [v2 objectAtIndexedSubscript:0];
    v4 = objc_msgSend(v2, "subarrayWithRange:", 1, objc_msgSend(v2, "count") - 1);
    v5 = [v4 componentsJoinedByString:@"="];
    v6 = [v5 stringByRemovingPercentEncoding];

    v7 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:v3 value:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __52__NSURL_WFFilePathDisplay__wf_displayPathComponents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    v7 = getWFFilesLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      v12 = "-[NSURL(WFFilePathDisplay) wf_displayPathComponents]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_216505000, v7, OS_LOG_TYPE_ERROR, "%s Could not fetch parent items due to error: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __52__NSURL_WFFilePathDisplay__wf_displayPathComponents__block_invoke_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 providerDomainID];
  if (([v3 isEqualToString:@"com.apple.FileProvider.LocalStorage"] & 1) == 0)
  {

LABEL_8:
    v9 = [v2 displayName];
    goto LABEL_9;
  }
  v4 = [v2 itemIdentifier];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  id v5 = (void *)getNSFileProviderRootContainerItemIdentifierSymbolLoc_ptr;
  uint64_t v16 = getNSFileProviderRootContainerItemIdentifierSymbolLoc_ptr;
  if (!getNSFileProviderRootContainerItemIdentifierSymbolLoc_ptr)
  {
    id v6 = FileProviderLibrary();
    v14[3] = (uint64_t)dlsym(v6, "NSFileProviderRootContainerItemIdentifier");
    getNSFileProviderRootContainerItemIdentifierSymbolLoc_ptr = v14[3];
    id v5 = (void *)v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v5)
  {
    int v11 = [MEMORY[0x263F08690] currentHandler];
    v12 = [NSString stringWithUTF8String:"NSString *getNSFileProviderRootContainerItemIdentifier(void)"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"NSURL+WFFilePathDisplay.m", 22, @"%s", dlerror());

    __break(1u);
    return;
  }
  int v7 = [v4 isEqualToString:*v5];

  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v8 = [MEMORY[0x263F85258] currentDevice];
  v9 = [v8 localStorageDisplayName];

LABEL_9:
  id v10 = v9;
}

@end