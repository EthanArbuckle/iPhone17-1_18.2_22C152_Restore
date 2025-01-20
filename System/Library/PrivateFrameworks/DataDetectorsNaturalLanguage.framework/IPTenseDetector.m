@interface IPTenseDetector
+ (int64_t)tenseOfString:(id)a3 languageID:(id)a4;
@end

@implementation IPTenseDetector

+ (int64_t)tenseOfString:(id)a3 languageID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v6 hasPrefix:@"zh"])
  {
    if ([v6 hasPrefix:@"ja"])
    {
      if (([v5 containsString:@"だった"] & 1) == 0
        && ([v5 containsString:@"でした"] & 1) == 0
        && ([v5 containsString:@"ました"] & 1) == 0
        && ([v5 containsString:@"あった"] & 1) == 0
        && ([v5 containsString:@"いた"] & 1) == 0
        && ([v5 containsString:@"した"] & 1) == 0
        && ([v5 containsString:@"おられた"] & 1) == 0
        && ([v5 containsString:@"くれた"] & 1) == 0
        && ([v5 containsString:@"された"] & 1) == 0
        && ([v5 containsString:@"されてた"] & 1) == 0
        && ([v5 containsString:@"されていた"] & 1) == 0
        && ([v5 containsString:@"した"] & 1) == 0
        && ([v5 containsString:@"ました"] & 1) == 0
        && ([v5 containsString:@"していた"] & 1) == 0
        && ([v5 containsString:@"してた"] & 1) == 0
        && ([v5 containsString:@"とった"] & 1) == 0
        && ([v5 containsString:@"なった"] & 1) == 0
        && ([v5 containsString:@"会った"] & 1) == 0
        && ([v5 containsString:@"入った"] & 1) == 0
        && ([v5 containsString:@"出た"] & 1) == 0
        && ([v5 containsString:@"出られた"] & 1) == 0
        && ([v5 containsString:@"思った"] & 1) == 0
        && ([v5 containsString:@"終えた"] & 1) == 0
        && ([v5 containsString:@"終わった"] & 1) == 0
        && ([v5 containsString:@"行った"] & 1) == 0
        && ([v5 containsString:@"見せた"] & 1) == 0
        && ([v5 containsString:@"見た"] & 1) == 0
        && ([v5 containsString:@"かった"] & 1) == 0)
      {
        if (([v5 containsString:@"です"] & 1) != 0
          || ([v5 containsString:@"にしてます"] & 1) != 0)
        {
          goto LABEL_8;
        }
        v12 = @"にしています";
        goto LABEL_44;
      }
LABEL_38:
      int64_t v7 = 0;
      goto LABEL_49;
    }
    if (tenseOfString_languageID__onceToken == -1)
    {
      if (!v5) {
        goto LABEL_48;
      }
    }
    else
    {
      dispatch_once(&tenseOfString_languageID__onceToken, &__block_literal_global_1);
      if (!v5) {
        goto LABEL_48;
      }
    }
    if ([v5 length])
    {
      id v8 = (id)tenseOfString_languageID__tagger;
      objc_sync_enter(v8);
      [(id)tenseOfString_languageID__tagger setString:v5];
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2020000000;
      uint64_t v26 = 3;
      v21[0] = 0;
      v21[1] = v21;
      v21[2] = 0x3032000000;
      v21[3] = __Block_byref_object_copy__0;
      v21[4] = __Block_byref_object_dispose__0;
      id v22 = 0;
      v19[0] = 0;
      v19[1] = v19;
      v19[2] = 0x2020000000;
      char v20 = 0;
      v9 = (void *)tenseOfString_languageID__tagger;
      uint64_t v10 = [v5 length];
      uint64_t v11 = *MEMORY[0x263F08DE0];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __44__IPTenseDetector_tenseOfString_languageID___block_invoke_180;
      v14[3] = &unk_264722DC0;
      id v15 = v5;
      v16 = v21;
      v17 = v19;
      v18 = &v23;
      objc_msgSend(v9, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v10, v11, 6, v14);
      [(id)tenseOfString_languageID__tagger setString:&stru_26D895C60];
      int64_t v7 = v24[3];

      _Block_object_dispose(v19, 8);
      _Block_object_dispose(v21, 8);

      _Block_object_dispose(&v23, 8);
      objc_sync_exit(v8);

      goto LABEL_49;
    }
LABEL_48:
    int64_t v7 = 3;
    goto LABEL_49;
  }
  if (([v5 containsString:@"了"] & 1) != 0
    || ([v5 containsString:@"过节"] & 1) == 0
    && ([v5 containsString:@"过"] & 1) != 0
    || ([v5 containsString:@"過節"] & 1) == 0
    && ([v5 containsString:@"過"] & 1) != 0)
  {
    goto LABEL_38;
  }
  if ([v5 containsString:@"将"])
  {
LABEL_8:
    int64_t v7 = 2;
    goto LABEL_49;
  }
  v12 = @"要";
LABEL_44:
  if ([v5 containsString:v12]) {
    int64_t v7 = 2;
  }
  else {
    int64_t v7 = 3;
  }
LABEL_49:

  return v7;
}

void __44__IPTenseDetector_tenseOfString_languageID___block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  id v0 = objc_alloc(MEMORY[0x263F08948]);
  v4[0] = *MEMORY[0x263F08DE0];
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 initWithTagSchemes:v1 options:6];
  v3 = (void *)tenseOfString_languageID__tagger;
  tenseOfString_languageID__tagger = v2;
}

void __44__IPTenseDetector_tenseOfString_languageID___block_invoke_180(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v20 = a2;
  v12 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
  v13 = [v12 lowercaseString];

  int v14 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqualToString:@"CS"];
  id v15 = v20;
  if (!v14 || (v16 = [v20 isEqualToString:@"VBN"], id v15 = v20, (v16 & 1) == 0))
  {
    if (![&unk_26D8CDA38 containsObject:v15])
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
        && (([v20 isEqualToString:@"VBP"] & 1) != 0
         || [v20 isEqualToString:@"VBZ"]))
      {
        goto LABEL_12;
      }
      if (![&unk_26D8CDA68 containsObject:v20])
      {
        if (![&unk_26D8CDA80 containsObject:v20]) {
          goto LABEL_18;
        }
        uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v18 = 2;
        goto LABEL_17;
      }
LABEL_14:
      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v18 = 1;
LABEL_17:
      *(void *)(v17 + 24) = v18;
      goto LABEL_18;
    }
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqualToString:@"RB"]&& objc_msgSend(v20, "isEqualToString:", @"VBZ")&& !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    goto LABEL_14;
  }
  if (([&unk_26D8CDA50 containsObject:v13] & 1) == 0)
  {
LABEL_12:
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    *a7 = 1;
  }
LABEL_18:
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
LABEL_19:
    LOBYTE(v19) = 1;
    goto LABEL_23;
  }
  int v19 = [&unk_26D8CDA98 containsObject:v13];
  if (v19)
  {
    if ([v20 isEqualToString:@"VBP"]) {
      goto LABEL_19;
    }
    LOBYTE(v19) = [v20 isEqualToString:@"VBS"];
  }
LABEL_23:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v19;
}

@end