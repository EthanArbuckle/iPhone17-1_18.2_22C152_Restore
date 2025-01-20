@interface FlexUtilities
+ (id)_decodeItem:(id)a3 asClass:(Class)a4;
+ (id)_songFormatForBundleAtPath:(id)a3;
+ (id)backendForSongBundleURL:(id)a3;
+ (id)decodeItemsInArray:(id)a3 asClass:(Class)a4;
+ (id)decodeItemsInDict:(id)a3 asClass:(Class)a4;
+ (id)encodeItemsInArray:(id)a3;
+ (id)encodeItemsInDict:(id)a3;
+ (id)pathToBundledResourceWithName:(id)a3;
+ (id)songsFoundInDeepScanOfDirectory:(id)a3;
@end

@implementation FlexUtilities

+ (id)_decodeItem:(id)a3 asClass:(Class)a4
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = objc_msgSend_allKeys(v5, v6, v7, v8, v9);
      uint64_t v15 = objc_msgSend_count(v10, v11, v12, v13, v14);

      if (v15)
      {
        id v16 = [a4 alloc];
        id v20 = (id)objc_msgSend_initWithDictionary_(v16, v17, (uint64_t)v5, v18, v19);
LABEL_12:
        v25 = v20;
        goto LABEL_14;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend_decodeItemsInDict_asClass_(FlexUtilities, v21, (uint64_t)v5, (uint64_t)a4, v22);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend_decodeItemsInArray_asClass_(FlexUtilities, v23, (uint64_t)v5, (uint64_t)a4, v24);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        id v20 = v5;
        goto LABEL_12;
      }
    }
  }
  v25 = 0;
LABEL_14:

  return v25;
}

+ (id)decodeItemsInArray:(id)a3 asClass:(Class)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = objc_msgSend_array(MEMORY[0x263EFF980], v6, v7, v8, v9);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v32 = v5;
    id v11 = v5;
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v33, (uint64_t)v37, 16);
    if (v13)
    {
      uint64_t v16 = v13;
      uint64_t v17 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(v11);
          }
          uint64_t v22 = objc_msgSend__decodeItem_asClass_(FlexUtilities, v14, *(void *)(*((void *)&v33 + 1) + 8 * i), (uint64_t)a4, v15);
          if (v22)
          {
            objc_msgSend_addObject_(v10, v19, (uint64_t)v22, v20, v21);
          }
          else
          {
            v23 = objc_opt_new();
            objc_msgSend_addObject_(v10, v24, (uint64_t)v23, v25, v26);
          }
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v33, (uint64_t)v37, 16);
      }
      while (v16);
    }

    v30 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v27, (uint64_t)v10, v28, v29);

    id v5 = v32;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

+ (id)decodeItemsInDict:(id)a3 asClass:(Class)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v35 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v6, v7, v8, v9);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v14 = objc_msgSend_allKeys(v5, v10, v11, v12, v13);
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v36, (uint64_t)v40, 16);
    if (v16)
    {
      uint64_t v20 = v16;
      uint64_t v21 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v37 != v21) {
            objc_enumerationMutation(v14);
          }
          uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v24 = objc_msgSend_objectForKey_(v5, v17, v23, v18, v19);
          uint64_t v29 = objc_msgSend__decodeItem_asClass_(FlexUtilities, v25, (uint64_t)v24, (uint64_t)a4, v26);
          if (v29) {
            objc_msgSend_setObject_forKey_(v35, v27, (uint64_t)v29, v23, v28);
          }
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v36, (uint64_t)v40, 16);
      }
      while (v20);
    }

    long long v33 = objc_msgSend_dictionaryWithDictionary_(NSDictionary, v30, (uint64_t)v35, v31, v32);
  }
  else
  {
    long long v33 = 0;
  }

  return v33;
}

+ (id)encodeItemsInArray:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v8 = objc_msgSend_array(MEMORY[0x263EFF980], v4, v5, v6, v7);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v9 = v3;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v47, (uint64_t)v51, 16);
  if (!v11) {
    goto LABEL_24;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v48;
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v48 != v13) {
        objc_enumerationMutation(v9);
      }
      uint64_t v15 = *(void **)(*((void *)&v47 + 1) + 8 * v14);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v20 = objc_msgSend_encodeAsDictionary(v15, v16, v17, v18, v19);
LABEL_12:
        v30 = (void *)v20;
        if (v20) {
          objc_msgSend_addObject_(v8, v21, v20, v22, v23);
        }

        goto LABEL_15;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v20 = objc_msgSend_encodeItemsInDict_(FlexUtilities, v24, (uint64_t)v15, v25, v26);
        goto LABEL_12;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v20 = objc_msgSend_encodeItemsInArray_(FlexUtilities, v27, (uint64_t)v15, v28, v29);
        goto LABEL_12;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend_addObject_(v8, v32, MEMORY[0x263EFFA78], v33, v34, (void)v47);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
          objc_msgSend_addObject_(v8, v31, (uint64_t)v15, v35, v36, (void)v47);
        }
      }
LABEL_15:
      ++v14;
    }
    while (v12 != v14);
    uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v31, (uint64_t)&v47, (uint64_t)v51, 16);
    uint64_t v12 = v37;
  }
  while (v37);
LABEL_24:

  if (objc_msgSend_count(v8, v38, v39, v40, v41))
  {
    v45 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v42, (uint64_t)v8, v43, v44);
  }
  else
  {
    v45 = 0;
  }

  return v45;
}

+ (id)encodeItemsInDict:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v8 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v4, v5, v6, v7);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v13 = objc_msgSend_allKeys(v3, v9, v10, v11, v12, 0);
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v50, (uint64_t)v54, 16);
  if (!v15) {
    goto LABEL_21;
  }
  uint64_t v19 = v15;
  uint64_t v20 = *(void *)v51;
  do
  {
    uint64_t v21 = 0;
    do
    {
      if (*(void *)v51 != v20) {
        objc_enumerationMutation(v13);
      }
      uint64_t v22 = *(void *)(*((void *)&v50 + 1) + 8 * v21);
      uint64_t v23 = objc_msgSend_objectForKey_(v3, v16, v22, v17, v18);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v28 = objc_msgSend_encodeAsDictionary(v23, v24, v25, v26, v27);
LABEL_12:
        uint64_t v37 = (void *)v28;
        if (v28) {
          objc_msgSend_setObject_forKey_(v8, v29, v28, v22, v30);
        }

        goto LABEL_15;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v28 = objc_msgSend_encodeItemsInDict_(FlexUtilities, v31, (uint64_t)v23, v32, v33);
        goto LABEL_12;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v28 = objc_msgSend_encodeItemsInArray_(FlexUtilities, v34, (uint64_t)v23, v35, v36);
        goto LABEL_12;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
        objc_msgSend_setObject_forKey_(v8, v38, (uint64_t)v23, v22, v39);
      }
LABEL_15:

      ++v21;
    }
    while (v19 != v21);
    uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v50, (uint64_t)v54, 16);
    uint64_t v19 = v40;
  }
  while (v40);
LABEL_21:

  if (objc_msgSend_count(v8, v41, v42, v43, v44))
  {
    long long v48 = objc_msgSend_dictionaryWithDictionary_(NSDictionary, v45, (uint64_t)v8, v46, v47);
  }
  else
  {
    long long v48 = 0;
  }

  return v48;
}

+ (id)pathToBundledResourceWithName:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x263F086E0];
  uint64_t v5 = objc_opt_class();
  id v9 = objc_msgSend_bundleForClass_(v4, v6, v5, v7, v8);
  uint64_t v12 = objc_msgSend_pathForResource_ofType_(v9, v10, (uint64_t)v3, 0, v11);

  if (!v12)
  {
    uint64_t v17 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v13, v14, v15, v16);
    uint64_t v12 = objc_msgSend_pathForResource_ofType_(v17, v18, (uint64_t)v3, 0, v19);

    if (!v12)
    {
      uint64_t v23 = objc_msgSend_bundleWithIdentifier_(MEMORY[0x263F086E0], v20, @"com.apple.Memories", v21, v22);
      uint64_t v12 = objc_msgSend_pathForResource_ofType_(v23, v24, (uint64_t)v3, 0, v25);

      if (!v12)
      {
        uint64_t v26 = (void *)MEMORY[0x263F086E0];
        uint64_t v27 = objc_opt_class();
        uint64_t v31 = objc_msgSend_bundleForClass_(v26, v28, v27, v29, v30);
        uint64_t v35 = objc_msgSend_stringByAppendingPathComponent_(@"Assets", v32, (uint64_t)v3, v33, v34);
        uint64_t v12 = objc_msgSend_pathForResource_ofType_(v31, v36, (uint64_t)v35, 0, v37);
      }
    }
  }

  return v12;
}

+ (id)songsFoundInDeepScanOfDirectory:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v8 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v4, v5, v6, v7);
  uint64_t v9 = *MEMORY[0x263EFF750];
  uint64_t v10 = *MEMORY[0x263EFF6A8];
  uint64_t v14 = objc_msgSend_arrayWithObjects_(MEMORY[0x263EFF8C0], v11, *MEMORY[0x263EFF750], v12, v13, *MEMORY[0x263EFF6A8], 0);
  v45 = v3;
  uint64_t v16 = objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v8, v15, (uint64_t)v3, (uint64_t)v14, 4, 0);

  id v46 = (id)objc_opt_new();
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v16;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v50, (uint64_t)v54, 16);
  if (v18)
  {
    uint64_t v20 = v18;
    uint64_t v21 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v51 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        id v49 = 0;
        objc_msgSend_getResourceValue_forKey_error_(v23, v19, (uint64_t)&v49, v9, 0);
        id v24 = v49;
        id v48 = 0;
        objc_msgSend_getResourceValue_forKey_error_(v23, v25, (uint64_t)&v48, v10, 0);
        id v26 = v48;
        if (objc_msgSend_BOOLValue(v26, v27, v28, v29, v30))
        {
          uint64_t v35 = objc_msgSend_pathExtension(v23, v31, v32, v33, v34);
          int isEqualToString = objc_msgSend_isEqualToString_(v35, v36, @"smsbundle", v37, v38);

          if (isEqualToString)
          {
            uint64_t v43 = v46;
            if (!v46) {
              uint64_t v43 = objc_opt_new();
            }
            id v46 = v43;
            objc_msgSend_addObject_(v43, v40, (uint64_t)v23, v41, v42);
          }
        }
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v50, (uint64_t)v54, 16);
    }
    while (v20);
  }

  return v46;
}

+ (id)backendForSongBundleURL:(id)a3
{
  uint64_t v5 = objc_msgSend_path(a3, a2, (uint64_t)a3, v3, v4);
  uint64_t v9 = objc_msgSend__songFormatForBundleAtPath_(FlexUtilities, v6, (uint64_t)v5, v7, v8);
  if (objc_msgSend_isEqualToString_(v9, v10, @"LG", v11, v12))
  {
    uint64_t v16 = objc_msgSend_loadSongInFolderWithPath_(FlexSong, v13, (uint64_t)v5, v14, v15);
LABEL_5:
    uint64_t v20 = (void *)v16;
    goto LABEL_7;
  }
  if (objc_msgSend_isEqualToString_(v9, v13, @"ML", v14, v15))
  {
    uint64_t v16 = objc_msgSend_loadSongAtPath_(FlexMLSong, v17, (uint64_t)v5, v18, v19);
    goto LABEL_5;
  }
  uint64_t v20 = 0;
LABEL_7:

  return v20;
}

+ (id)_songFormatForBundleAtPath:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_stringByAppendingPathComponent_(v3, v4, @"metadata.smm", v5, v6);
  uint64_t v12 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v8, v9, v10, v11);
  int v16 = objc_msgSend_fileExistsAtPath_(v12, v13, (uint64_t)v7, v14, v15);

  if (v16)
  {
    uint64_t v21 = @"LG";
  }
  else
  {
    uint64_t v22 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v17, v18, v19, v20);
    id v58 = 0;
    uint64_t v25 = objc_msgSend_contentsOfDirectoryAtPath_error_(v22, v23, (uint64_t)v3, (uint64_t)&v58, v24);
    id v26 = v58;

    if (objc_msgSend_count(v25, v27, v28, v29, v30)) {
      BOOL v31 = v26 == 0;
    }
    else {
      BOOL v31 = 0;
    }
    if (v31)
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v32 = v25;
      uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v54, (uint64_t)v59, 16);
      if (v34)
      {
        uint64_t v39 = v34;
        id v52 = v26;
        long long v53 = v25;
        uint64_t v40 = *(void *)v55;
        uint64_t v21 = @"?";
        while (2)
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v55 != v40) {
              objc_enumerationMutation(v32);
            }
            uint64_t v42 = objc_msgSend_pathExtension(*(void **)(*((void *)&v54 + 1) + 8 * i), v35, v36, v37, v38, v52, v53, (void)v54);
            uint64_t v47 = objc_msgSend_lowercaseString(v42, v43, v44, v45, v46);

            if (objc_msgSend_isEqualToString_(v47, v48, @"metadata", v49, v50))
            {
              uint64_t v21 = @"ML";

              goto LABEL_18;
            }
          }
          uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v54, (uint64_t)v59, 16);
          if (v39) {
            continue;
          }
          break;
        }
LABEL_18:
        id v26 = v52;
        uint64_t v25 = v53;
      }
      else
      {
        uint64_t v21 = @"?";
      }
    }
    else
    {
      uint64_t v21 = @"?";
    }
  }
  return v21;
}

@end