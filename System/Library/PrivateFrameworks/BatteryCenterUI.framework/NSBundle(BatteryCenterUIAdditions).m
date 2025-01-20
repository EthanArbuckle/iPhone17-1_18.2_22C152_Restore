@interface NSBundle(BatteryCenterUIAdditions)
- (id)bsui_imageForIconInfo:()BatteryCenterUIAdditions;
@end

@implementation NSBundle(BatteryCenterUIAdditions)

- (id)bsui_imageForIconInfo:()BatteryCenterUIAdditions
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1)
  {
    v7 = [a1 objectForInfoDictionaryKey:@"CFBundleIconFilesRightToLeft"];
    uint64_t v8 = objc_opt_class();
    id v9 = v7;
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        v10 = v9;
      }
      else {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
    id v11 = v10;

    if (v11) {
      [v6 addObjectsFromArray:v11];
    }
  }
  if (![v6 count])
  {
    v12 = [a1 objectForInfoDictionaryKey:@"CFBundleIconFiles"];
    uint64_t v13 = objc_opt_class();
    id v14 = v12;
    if (v13)
    {
      if (objc_opt_isKindOfClass()) {
        v15 = v14;
      }
      else {
        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
    }
    id v16 = v15;

    if (v16) {
      [v6 addObjectsFromArray:v16];
    }
  }
  if (![v6 count])
  {
    v17 = [a1 objectForInfoDictionaryKey:@"CFBundleIcons"];
    uint64_t v18 = objc_opt_class();
    id v19 = v17;
    if (v18)
    {
      if (objc_opt_isKindOfClass()) {
        v20 = v19;
      }
      else {
        v20 = 0;
      }
    }
    else
    {
      v20 = 0;
    }
    id v21 = v20;

    v22 = [v21 objectForKey:@"CFBundlePrimaryIcon"];

    uint64_t v23 = objc_opt_class();
    id v24 = v22;
    if (v23)
    {
      if (objc_opt_isKindOfClass()) {
        v25 = v24;
      }
      else {
        v25 = 0;
      }
    }
    else
    {
      v25 = 0;
    }
    id v26 = v25;

    v27 = [v26 objectForKey:@"CFBundleIconName"];

    uint64_t v28 = objc_opt_class();
    id v29 = v27;
    if (v28)
    {
      if (objc_opt_isKindOfClass()) {
        v30 = v29;
      }
      else {
        v30 = 0;
      }
    }
    else
    {
      v30 = 0;
    }
    id v31 = v30;

    if (v31) {
      [v6 addObject:v31];
    }
  }
  if ([v6 count]) {
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v32 = 0;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v33 = v6;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v44;
LABEL_43:
    uint64_t v37 = 0;
    while (1)
    {
      if (*(void *)v44 != v36) {
        objc_enumerationMutation(v33);
      }
      v38 = objc_msgSend(MEMORY[0x1E4FB1818], "imageNamed:inBundle:", *(void *)(*((void *)&v43 + 1) + 8 * v37), a1, (void)v43);
      [v38 size];
      if (v40 == a2 && v39 == a3) {
        break;
      }
      [v32 addObject:v38];

      if (v35 == ++v37)
      {
        uint64_t v35 = [v33 countByEnumeratingWithState:&v43 objects:v47 count:16];
        if (v35) {
          goto LABEL_43;
        }
        goto LABEL_52;
      }
    }

    if (v38) {
      goto LABEL_55;
    }
  }
  else
  {
LABEL_52:
  }
  v38 = objc_msgSend(v32, "lastObject", (void)v43);
LABEL_55:

  return v38;
}

@end