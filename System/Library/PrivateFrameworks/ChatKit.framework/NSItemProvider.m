@interface NSItemProvider
@end

@implementation NSItemProvider

uint64_t __80__NSItemProvider_MapUtils____ck_itemProviderForAppleMapsCoordinateURL_vCardURL___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

void __58__NSItemProvider_MapUtils____ck_loadDataForAppleMapVCard___block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:3];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v3 = (void *)__ck_loadDataForAppleMapVCard__sUnarchiveClasses;
  __ck_loadDataForAppleMapVCard__sUnarchiveClasses = v2;
}

void __58__NSItemProvider_MapUtils____ck_loadDataForAppleMapVCard___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v7;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Loading data for location from NSItemProvider failed with error: %@", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v22 = 0;
    v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:__ck_loadDataForAppleMapVCard__sUnarchiveClasses fromData:v5 error:&v22];
    id v9 = v22;
    id v10 = v9;
    if (!v8 || v9)
    {
      if (IMOSLoggingEnabled())
      {
        v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v10;
          _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Unexpected nil unarchiving location info with error: %@", buf, 0xCu);
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      v11 = (void *)MEMORY[0x1E4F1C9B8];
      v12 = [v8 objectForKeyedSubscript:@"com.apple.messages.mapvcard"];
      id v21 = 0;
      v13 = [v11 dataWithContentsOfURL:v12 options:1 error:&v21];
      id v10 = v21;

      if (!v13 || v10)
      {
        if (IMOSLoggingEnabled())
        {
          v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v24 = v10;
            _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Unable to archive vCardData with error: %@", buf, 0xCu);
          }
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
      else
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __58__NSItemProvider_MapUtils____ck_loadDataForAppleMapVCard___block_invoke_69;
        block[3] = &unk_1E5622EC8;
        id v20 = *(id *)(a1 + 32);
        id v18 = v13;
        id v19 = v8;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
    }
  }
}

void __58__NSItemProvider_MapUtils____ck_loadDataForAppleMapVCard___block_invoke_69(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"com.apple.messages.mapvcard.name"];
  (*(void (**)(uint64_t, uint64_t, id, void))(v2 + 16))(v2, v1, v3, 0);
}

@end