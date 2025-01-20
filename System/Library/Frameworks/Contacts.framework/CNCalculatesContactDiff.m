@interface CNCalculatesContactDiff
+ (BOOL)shouldSaveDuplicateProperty:(id)a3 value1:(id)a4 value2:(id)a5;
+ (id)backgroundColorRelatedKeys;
+ (id)diffContact:(id)a3 to:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)imageMetadataLog;
+ (void)addMultiValueUpdateTo:(id)a3 forProperty:(id)a4 contact1:(id)a5 contact2:(id)a6;
+ (void)addSingleValueUpdateTo:(id)a3 forProperty:(id)a4 contact1:(id)a5 contact2:(id)a6;
+ (void)cleanOrphanedCropUpdates:(id)a3 withContact1:(id)a4 contact2:(id)a5;
+ (void)clearBackgroundColorInUpdates:(id)a3 forContact:(id)a4;
+ (void)clearWallpaperURIInUpdates:(id)a3 forContact:(id)a4;
@end

@implementation CNCalculatesContactDiff

+ (id)imageMetadataLog
{
  if (imageMetadataLog_cn_once_token_0 != -1) {
    dispatch_once(&imageMetadataLog_cn_once_token_0, &__block_literal_global_33);
  }
  v2 = (void *)imageMetadataLog_cn_once_object_0;

  return v2;
}

uint64_t __43__CNCalculatesContactDiff_imageMetadataLog__block_invoke()
{
  imageMetadataLog_cn_once_object_0 = (uint64_t)os_log_create("com.apple.contacts", "image-metadata");

  return MEMORY[0x1F41817F8]();
}

+ (id)diffContact:(id)a3 to:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v47 = a5;
  if (v10 == v11)
  {
    id v30 = [MEMORY[0x1E4F1C978] array];
  }
  else
  {
    v43 = a6;
    id v44 = a1;
    v45 = [MEMORY[0x1E4F1CA48] array];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = +[CN writableContactProperties];
    uint64_t v12 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v49;
LABEL_4:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v49 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v48 + 1) + 8 * v15);
        if (v10)
        {
          v17 = [*(id *)(*((void *)&v48 + 1) + 8 * v15) key];
          v57 = v17;
          v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
          int v19 = [v10 areKeysAvailable:v18];

          if (!v11) {
            goto LABEL_14;
          }
        }
        else
        {
          int v19 = 1;
          if (!v11)
          {
LABEL_14:
            int v22 = 1;
            goto LABEL_15;
          }
        }
        v20 = [v16 key];
        v56 = v20;
        v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
        int v22 = [v11 areKeysAvailable:v21];

        if (v10 && v19 != v22)
        {
          if (([v47 ignoreUnavailableKeys] & 1) == 0)
          {
            if (v22) {
              v31 = v10;
            }
            else {
              v31 = v11;
            }
            id v32 = v31;
            v33 = v32;
            if (v43)
            {
              if (v32 == v10) {
                v34 = v11;
              }
              else {
                v34 = v10;
              }
              v53[1] = v34;
              v54[0] = @"CNInvalidRecords";
              v53[0] = v32;
              v35 = (void *)MEMORY[0x1E4F1C978];
              id v36 = v34;
              v37 = [v35 arrayWithObjects:v53 count:2];
              v55[0] = v37;
              v54[1] = @"CNKeyPaths";
              v38 = [v16 key];
              v52 = v38;
              v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
              v55[1] = v39;
              v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:2];

              v41 = +[CNErrorFactory errorWithCode:1000 userInfo:v40];

              id *v43 = v41;
            }

            id v30 = 0;
            v26 = v45;
            goto LABEL_35;
          }
          goto LABEL_20;
        }
LABEL_15:
        if ((v19 & v22) == 1)
        {
          v23 = [v47 ignoredKeys];
          v24 = [v16 key];
          char v25 = [v23 containsObject:v24];

          if ((v25 & 1) == 0)
          {
            if ([v16 isMultiValue]) {
              [v44 addMultiValueUpdateTo:v45 forProperty:v16 contact1:v10 contact2:v11];
            }
            else {
              [v44 addSingleValueUpdateTo:v45 forProperty:v16 contact1:v10 contact2:v11];
            }
          }
        }
LABEL_20:
        if (v13 == ++v15)
        {
          uint64_t v13 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
          if (v13) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    v26 = v45;
    [v44 cleanOrphanedCropUpdates:v45 withContact1:v10 contact2:v11];
    [v44 clearWallpaperURIInUpdates:v45 forContact:v11];
    v27 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    v28 = [v27 featureFlags];
    int v29 = [v28 isFeatureEnabled:3];

    if (v29) {
      [v44 clearBackgroundColorInUpdates:v45 forContact:v11];
    }
    id v30 = v45;
LABEL_35:
  }

  return v30;
}

+ (void)addSingleValueUpdateTo:(id)a3 forProperty:(id)a4 contact1:(id)a5 contact2:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [v10 CNValueForContact:a5];
  uint64_t v13 = [v10 CNValueForContact:v11];

  if (![v10 isValue:v12 equalToEmptyEquivalentOrValue:v13]
    || [a1 shouldSaveDuplicateProperty:v10 value1:v12 value2:v13])
  {
    uint64_t v14 = +[CNContactUpdate updateWithValue:v13 property:v10];
    [v15 addObject:v14];
  }
}

+ (BOOL)shouldSaveDuplicateProperty:(id)a3 value1:(id)a4 value2:(id)a5
{
  id v6 = a5;
  v7 = [a3 key];

  if (v7 == @"cropRect")
  {
    [v6 rectValue];
    BOOL v8 = !CGRectIsEmpty(v10);
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (void)addMultiValueUpdateTo:(id)a3 forProperty:(id)a4 contact1:(id)a5 contact2:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v10 key];
  uint64_t v14 = [v11 valueForKey:v13];

  id v15 = [v10 key];
  v16 = [v12 valueForKey:v15];

  v17 = +[CNMultiValueDiff diffMultiValue:v14 toMultiValue:v16];
  if (([v17 isEmpty] & 1) == 0)
  {
    v18 = +[CNContactUpdate updateMultiValueWithDiff:v17 property:v10];
    int v19 = [v11 isUnified];
    int v20 = [v12 isUnified];
    if (v19)
    {
      id v28 = v9;
      if ((v20 & 1) == 0) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"A contact and its snapshot should both be unified."];
      }
      v27 = v18;
      [v18 diff];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v26 = long long v32 = 0u;
      v21 = [v26 updates];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v30;
        do
        {
          uint64_t v25 = 0;
          do
          {
            if (*(void *)v30 != v24) {
              objc_enumerationMutation(v21);
            }
            [*(id *)(*((void *)&v29 + 1) + 8 * v25++) setIgnoreIdentifiers:1];
          }
          while (v23 != v25);
          uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v23);
      }

      v18 = v27;
      id v9 = v28;
    }
    else if (v20)
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"A contact and its snapshot should both be non-unified."];
    }
    [v9 addObject:v18];
  }
}

+ (void)cleanOrphanedCropUpdates:(id)a3 withContact1:(id)a4 contact2:(id)a5
{
  id v16 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_msgSend(v16, "_cn_firstObjectPassingTest:", &__block_literal_global_17);
  if (v9)
  {
    if ((objc_msgSend(v16, "_cn_any:", &__block_literal_global_19) & 1) == 0)
    {
      id v10 = [v9 property];
      id v11 = [v9 property];
      id v12 = [v11 CNValueForContact:v7];
      uint64_t v13 = [v9 property];
      uint64_t v14 = [v13 CNValueForContact:v8];
      int v15 = [v10 isValue:v12 equalToEmptyEquivalentOrValue:v14];

      if (v15) {
        [v16 removeObject:v9];
      }
    }
  }
}

BOOL __74__CNCalculatesContactDiff_cleanOrphanedCropUpdates_withContact1_contact2___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 property];
  v3 = [v2 key];
  BOOL v4 = v3 == @"cropRect";

  return v4;
}

BOOL __74__CNCalculatesContactDiff_cleanOrphanedCropUpdates_withContact1_contact2___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 property];
  v3 = [v2 key];
  BOOL v4 = v3 == @"imageData";

  return v4;
}

+ (void)clearWallpaperURIInUpdates:(id)a3 forContact:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(v5, "_cn_firstObjectPassingTest:", &__block_literal_global_21);
  if (!v7 && objc_msgSend(v5, "_cn_any:", &__block_literal_global_23))
  {
    id v8 = +[CN wallpaperURIDescription];
    id v9 = +[CNContactUpdate updateWithValue:0 property:v8];

    [v5 addObject:v9];
    id v10 = [(id)objc_opt_class() imageMetadataLog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v6 identifier];
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_impl(&dword_1909E3000, v10, OS_LOG_TYPE_DEFAULT, "Cleared wallpaper URI for contact identifier %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
}

BOOL __65__CNCalculatesContactDiff_clearWallpaperURIInUpdates_forContact___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 property];
  v3 = [v2 key];
  BOOL v4 = v3 == @"wallpaperURI";

  return v4;
}

BOOL __65__CNCalculatesContactDiff_clearWallpaperURIInUpdates_forContact___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 property];
  BOOL v4 = [v3 key];

  id v5 = [v2 property];

  id v6 = [v5 key];
  BOOL v8 = v4 == @"wallpaper" || v6 == @"wallpaperMetadata";

  return v8;
}

+ (void)clearBackgroundColorInUpdates:(id)a3 forContact:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = objc_msgSend(v6, "_cn_firstObjectPassingTest:", &__block_literal_global_25);
  if (!v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__CNCalculatesContactDiff_clearBackgroundColorInUpdates_forContact___block_invoke_2;
    v13[3] = &__block_descriptor_40_e8_B16__0_8l;
    v13[4] = a1;
    if (objc_msgSend(v6, "_cn_any:", v13))
    {
      id v9 = +[CN imageBackgroundColorsDataDescription];
      id v10 = +[CNContactUpdate updateWithValue:0 property:v9];

      [v6 addObject:v10];
      id v11 = [(id)objc_opt_class() imageMetadataLog];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = [v7 identifier];
        *(_DWORD *)buf = 138543362;
        int v15 = v12;
        _os_log_impl(&dword_1909E3000, v11, OS_LOG_TYPE_DEFAULT, "Cleared image background colors for contact identifier %{public}@", buf, 0xCu);
      }
    }
  }
}

BOOL __68__CNCalculatesContactDiff_clearBackgroundColorInUpdates_forContact___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 property];
  v3 = [v2 key];
  BOOL v4 = v3 == @"imageBackgroundColorsData";

  return v4;
}

uint64_t __68__CNCalculatesContactDiff_clearBackgroundColorInUpdates_forContact___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 property];
  BOOL v4 = [v3 key];

  id v5 = [*(id *)(a1 + 32) backgroundColorRelatedKeys];
  uint64_t v6 = [v5 containsObject:v4];

  return v6;
}

+ (id)backgroundColorRelatedKeys
{
  if (backgroundColorRelatedKeys_cn_once_token_3 != -1) {
    dispatch_once(&backgroundColorRelatedKeys_cn_once_token_3, &__block_literal_global_27);
  }
  id v2 = (void *)backgroundColorRelatedKeys_cn_once_object_3;

  return v2;
}

void __53__CNCalculatesContactDiff_backgroundColorRelatedKeys__block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v3[0] = @"imageType";
  v3[1] = @"imageData";
  v3[2] = @"thumbnailImageData";
  v3[3] = @"cropRect";
  v3[4] = @"wallpaper";
  v3[5] = @"wallpaperMetadata";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:6];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)backgroundColorRelatedKeys_cn_once_object_3;
  backgroundColorRelatedKeys_cn_once_object_3 = v1;
}

@end