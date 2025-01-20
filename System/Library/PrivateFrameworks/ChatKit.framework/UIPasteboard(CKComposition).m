@interface UIPasteboard(CKComposition)
+ (id)__ck_pasteboardTypeListRTFD;
- (CKMediaObjectManager)__ck_mediaObjectManager;
- (uint64_t)__ck_canCreateComposition;
- (void)__ck_compositionWithContext:()CKComposition completionHandler:;
@end

@implementation UIPasteboard(CKComposition)

+ (id)__ck_pasteboardTypeListRTFD
{
  v3[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F225C0];
  v3[0] = *MEMORY[0x1E4F226B0];
  v3[1] = v0;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];

  return v1;
}

- (uint64_t)__ck_canCreateComposition
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (([a1 hasStrings] & 1) != 0
    || ([a1 hasURLs] & 1) != 0
    || ([a1 hasImages] & 1) != 0)
  {
    return 1;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v4 addObject:@"com.apple.MobileSMS.PluginPayload"];
  [v4 addObject:@"com.apple.cloudkit.sharingsupport.pre"];
  [v4 addObject:@"com.apple.cloudkit.sharingsupport.post"];
  [v4 addObject:*MEMORY[0x1E4F309D0]];
  v5 = objc_msgSend(a1, "__ck_mediaObjectManager");
  v6 = [v5 allUTITypes];
  [v4 addObjectsFromArray:v6];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v7 = objc_msgSend(MEMORY[0x1E4F42C50], "__ck_pasteboardTypeListRTFD");
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        [v4 removeObject:*(void *)(*((void *)&v33 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v9);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v12 = [a1 pasteboardTypes];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    LOBYTE(v2) = 0;
    uint64_t v15 = *(void *)v30;
    while (2)
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        if ((v2 & 1) != 0
          || (CFStringRef v17 = *(const __CFString **)(*((void *)&v29 + 1) + 8 * j),
              QLPreviewControllerSupportsContentType())
          && (objc_msgSend(MEMORY[0x1E4F42C50], "__ck_pasteboardTypeListRTFD"),
              v18 = objc_claimAutoreleasedReturnValue(),
              int v19 = [v18 containsObject:v17],
              v18,
              !v19))
        {
          uint64_t v2 = 1;
          goto LABEL_36;
        }
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v20 = objc_msgSend(v4, "allObjects", 0);
        uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v37 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v26;
          while (2)
          {
            for (uint64_t k = 0; k != v22; ++k)
            {
              if (*(void *)v26 != v23) {
                objc_enumerationMutation(v20);
              }
              if (UTTypeEqual(v17, *(CFStringRef *)(*((void *)&v25 + 1) + 8 * k)))
              {
                uint64_t v2 = 1;
                goto LABEL_31;
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v37 count:16];
            if (v22) {
              continue;
            }
            break;
          }
        }
        uint64_t v2 = 0;
LABEL_31:
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
LABEL_36:

  return v2;
}

- (void)__ck_compositionWithContext:()CKComposition completionHandler:
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [a1 itemProviders];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__UIPasteboard_CKComposition____ck_compositionWithContext_completionHandler___block_invoke;
  v10[3] = &unk_1E56261E8;
  id v11 = v6;
  id v9 = v6;
  +[CKComposition compositionFromNonCollaborationItemProviders:v8 builderContext:v7 completionHandler:v10];
}

- (CKMediaObjectManager)__ck_mediaObjectManager
{
  return +[CKMediaObjectManager sharedInstance];
}

@end