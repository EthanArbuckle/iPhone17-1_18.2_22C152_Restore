@interface NSItemProvider(MapUtils)
+ (id)__ck_itemProviderForAppleMapsCoordinateURL:()MapUtils vCardURL:;
- (void)__ck_loadDataForAppleMapVCard:()MapUtils;
@end

@implementation NSItemProvider(MapUtils)

+ (id)__ck_itemProviderForAppleMapsCoordinateURL:()MapUtils vCardURL:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    id v26 = 0;
    v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v6 options:1 error:&v26];
    id v9 = v26;
    v10 = v9;
    if (!v8 || v9)
    {
      if (IMOSLoggingEnabled())
      {
        v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v10;
          _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "Unexpected nil loading vCard data with error: %@", buf, 0xCu);
        }
      }
      id v18 = 0;
    }
    else
    {
      v11 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithContentsOfURL:v7];
      v12 = CKFrameworkBundle();
      v13 = [v12 localizedStringForKey:@"LOCATION_FILE_NAME" value:&stru_1EDE4CA38 table:@"ChatKit"];
      [v11 setSuggestedName:v13];

      v27[0] = @"com.apple.messages.mapvcard.name";
      v14 = [v7 lastPathComponent];
      v28[0] = v14;
      v28[1] = v7;
      v27[1] = @"com.apple.messages.mapvcard";
      v27[2] = @"com.apple.messages.maputi";
      v28[2] = @"com.apple.messages.maputi";
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];

      id v25 = 0;
      v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v15 requiringSecureCoding:1 error:&v25];
      id v17 = v25;
      v10 = v17;
      if (!v16 || v17)
      {
        if (IMOSLoggingEnabled())
        {
          v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v10;
            _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "Unexpected nil archiving vCard data with error: %@", buf, 0xCu);
          }
        }
        id v18 = 0;
      }
      else
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __80__NSItemProvider_MapUtils____ck_itemProviderForAppleMapsCoordinateURL_vCardURL___block_invoke;
        v23[3] = &unk_1E5621A58;
        id v24 = v16;
        [v11 registerDataRepresentationForTypeIdentifier:@"com.apple.messages.maputi" visibility:0 loadHandler:v23];
        id v18 = v11;
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Unexpected nil parameter", buf, 2u);
      }
    }
    id v18 = 0;
  }

  return v18;
}

- (void)__ck_loadDataForAppleMapVCard:()MapUtils
{
  id v4 = a3;
  if (__ck_loadDataForAppleMapVCard__onceToken != -1) {
    dispatch_once(&__ck_loadDataForAppleMapVCard__onceToken, &__block_literal_global_64);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__NSItemProvider_MapUtils____ck_loadDataForAppleMapVCard___block_invoke_2;
  v7[3] = &unk_1E5624F78;
  id v8 = v4;
  id v5 = v4;
  id v6 = (id)[a1 loadDataRepresentationForTypeIdentifier:@"com.apple.messages.maputi" completionHandler:v7];
}

@end