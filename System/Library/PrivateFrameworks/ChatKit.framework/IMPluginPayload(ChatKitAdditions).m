@interface IMPluginPayload(ChatKitAdditions)
- (id)__ck_photoCompositionMediaObjectsWithKeyToTrasferGUIDMap:()ChatKitAdditions;
- (id)__ck_photoCompositionString;
- (id)__ck_superFormatStringTransferGUIDs:()ChatKitAdditions mediaObjects:;
- (id)cleansedCopy;
- (uint64_t)__ck_photoCompositionMediaObjects;
@end

@implementation IMPluginPayload(ChatKitAdditions)

- (id)cleansedCopy
{
  v1 = (void *)[a1 copy];
  v2 = [NSString stringGUID];
  [v1 setMessageGUID:v2];

  [v1 setDatasource:0];

  return v1;
}

- (uint64_t)__ck_photoCompositionMediaObjects
{
  return objc_msgSend(a1, "__ck_photoCompositionMediaObjectsWithKeyToTrasferGUIDMap:", 0);
}

- (id)__ck_photoCompositionMediaObjectsWithKeyToTrasferGUIDMap:()ChatKitAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = objc_msgSend(a1, "attachments", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [v11 mediaObjectFromPayloadWithKeyToTrasferGUIDMap:v4];
          if (v12)
          {
            v13 = (void *)v12;
            [v5 addObject:v12];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)__ck_photoCompositionString
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v14 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = [a1 attachments];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    uint64_t v6 = *MEMORY[0x1E4F6C110];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          v10 = [v9 mediaObjectFromPayload];

          if (v10)
          {
            v19 = @"MediaObjectForTextAttachment";
            uint64_t v20 = v10;
            v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
            uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6 attributes:v11];
            [v14 appendAttributedString:v12];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v4);
  }

  return v14;
}

- (id)__ck_superFormatStringTransferGUIDs:()ChatKitAdditions mediaObjects:
{
  v61[2] = *MEMORY[0x1E4F143B8];
  v51 = [MEMORY[0x1E4F1CA48] array];
  v52 = [MEMORY[0x1E4F1CA48] array];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  uint64_t v6 = [a1 breadcrumbText];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v9 = *MEMORY[0x1E4F6C130];
    v60[0] = *MEMORY[0x1E4F6C138];
    v10 = [a1 breadcrumbText];
    v60[1] = *MEMORY[0x1E4F6C140];
    v61[0] = v10;
    v61[1] = &unk_1EDF16E80;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
    uint64_t v12 = (void *)[v8 initWithString:v9 attributes:v11];

    [v5 appendAttributedString:v12];
  }
  v48 = v5;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v13 = [a1 attachments];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v54;
    uint64_t v50 = *MEMORY[0x1E4F6C110];
    uint64_t v49 = *MEMORY[0x1E4F6C188];
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v54 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = v18;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v20 = [a1 attributionInfo];
          }
          else
          {
            uint64_t v20 = 0;
          }
          uint64_t v22 = +[CKMediaObjectManager sharedInstance];
          LOBYTE(v45) = [a1 shouldHideAttachments];
          v21 = [v22 mediaObjectWithFileURL:v19 filename:0 transcoderUserInfo:0 attributionInfo:v20 adaptiveImageGlyphContentIdentifier:0 adaptiveImageGlyphContentDescription:0 hideAttachment:v45];

          if (!v21) {
            goto LABEL_19;
          }
LABEL_16:
          [v52 addObject:v21];
          v23 = [v21 transferGUID];
          [v51 addObject:v23];
          id v24 = objc_alloc(MEMORY[0x1E4F28B18]);
          uint64_t v57 = v49;
          v58 = v23;
          v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
          v26 = (void *)[v24 initWithString:v50 attributes:v25];

          if (v26)
          {
            [v48 appendAttributedString:v26];
          }
          goto LABEL_19;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v21 = 0;
          goto LABEL_19;
        }
        v21 = [v18 mediaObjectFromPayload];
        if (v21) {
          goto LABEL_16;
        }
LABEL_19:
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v53 objects:v59 count:16];
    }
    while (v15);
  }

  uint64_t v27 = [a1 text];
  v28 = (void *)MEMORY[0x1E4F6CC10];
  if (v27)
  {
    v29 = (void *)v27;
    v30 = [a1 pluginBundleID];
    char v31 = [v30 isEqualToString:*v28];

    if ((v31 & 1) == 0)
    {
      v32 = [a1 text];
      [v48 appendAttributedString:v32];
    }
  }
  v33 = [a1 url];

  if (v33)
  {
    id v34 = objc_alloc(MEMORY[0x1E4F28B18]);
    v35 = [a1 url];
    v36 = [v35 absoluteString];
    v37 = (void *)[v34 initWithString:v36];
    [v48 appendAttributedString:v37];
  }
  v38 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v39 = [v38 isRichLinkImprovementsEnabled];

  if (v39)
  {
    v40 = [a1 pluginBundleID];
    int v41 = [v40 isEqualToString:*v28];

    if (v41)
    {
      uint64_t v42 = [v48 length];
      objc_msgSend(v48, "addAttribute:value:range:", *MEMORY[0x1E4F6D4F8], MEMORY[0x1E4F1CC38], 0, v42);
    }
  }
  if (a4) {
    *a4 = (id)[v52 copy];
  }
  if (a3) {
    *a3 = (id)[v51 copy];
  }
  v43 = objc_msgSend(v48, "__im_attributedStringByAssigningMessagePartNumbers");

  return v43;
}

@end