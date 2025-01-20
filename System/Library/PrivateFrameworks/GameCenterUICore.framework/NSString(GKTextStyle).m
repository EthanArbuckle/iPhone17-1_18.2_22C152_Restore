@interface NSString(GKTextStyle)
- (id)_gkAttributedStringByApplyingStyle:()GKTextStyle;
- (id)_gkAttributedStringByApplyingStylesForTags:()GKTextStyle untaggedStyle:;
@end

@implementation NSString(GKTextStyle)

- (id)_gkAttributedStringByApplyingStyle:()GKTextStyle
{
  v4 = (objc_class *)MEMORY[0x263F086A0];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 attributes];

  v8 = (void *)[v6 initWithString:a1 attributes:v7];
  return v8;
}

- (id)_gkAttributedStringByApplyingStylesForTags:()GKTextStyle untaggedStyle:
{
  v83[20] = *MEMORY[0x263EF8340];
  id v42 = a3;
  id v41 = a4;
  v39 = [v41 attributes];
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  uint64_t v76 = 0;
  id v44 = (id)[objc_alloc(MEMORY[0x263F089B8]) initWithString:a1 attributes:v39];
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0xD810000000;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v60 = &unk_22604EBFB;
  uint64_t v72 = 0;
  uint64_t v5 = [(__CFString *)a1 length];
  id v6 = v58;
  v58[20] = (uint64_t)a1;
  v6[23] = 0;
  v6[24] = v5;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  v6[21] = (uint64_t)CharactersPtr;
  if (CharactersPtr) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  }
  v6[22] = (uint64_t)CStringPtr;
  v6[25] = 0;
  v6[26] = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __82__NSString_GKTextStyle___gkAttributedStringByApplyingStylesForTags_untaggedStyle___block_invoke;
  v52[3] = &unk_26478A5B0;
  v52[4] = &v53;
  v52[5] = 0;
  v52[6] = v5;
  v9 = (void *)MEMORY[0x22A644A10](v52);
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __82__NSString_GKTextStyle___gkAttributedStringByApplyingStylesForTags_untaggedStyle___block_invoke_2;
  v51[3] = &unk_26478A5D8;
  v51[4] = &v73;
  v51[5] = v83;
  v10 = (uint64_t (**)(void, void))MEMORY[0x22A644A10](v51);
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __82__NSString_GKTextStyle___gkAttributedStringByApplyingStylesForTags_untaggedStyle___block_invoke_3;
  v47[3] = &unk_26478A600;
  v49 = &v53;
  v50 = &v57;
  v11 = v9;
  v47[4] = a1;
  id v48 = v11;
  v12 = (void (**)(void, void, void))MEMORY[0x22A644A10](v47);
  int v13 = 0;
  v14 = 0;
  uint64_t v43 = 0;
  while (1)
  {
    if (!v13)
    {
      v12[2](v12, 60, 0);
      if (v10[2](v10, v54[3] - 1)) {
        goto LABEL_45;
      }
      int v13 = 1;
      goto LABEL_36;
    }
    if (v13 != 1)
    {
      if (((unsigned int (*)(void, uint64_t, void))v12[2])(v12, 60, 0)
        && ((unsigned int (*)(void, uint64_t, void))v12[2])(v12, 47, 0))
      {
        int v15 = v10[2](v10, v54[3] - 2);
      }
      else
      {
        v18 = *MEMORY[0x263F40328];
        if (!*MEMORY[0x263F40328])
        {
          id v19 = (id)GKOSLoggers();
          v18 = *MEMORY[0x263F40328];
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v78 = a1;
          _os_log_debug_impl(&dword_22600C000, v18, OS_LOG_TYPE_DEBUG, "no closing tag in string:%@", buf, 0xCu);
        }
        int v15 = 1;
      }
      uint64_t v20 = v54[3];
      id v45 = 0;
      char v21 = ((uint64_t (*)(void, uint64_t, id *))v12[2])(v12, 62, &v45);
      v22 = (__CFString *)v45;
      if (v21)
      {
        if (v15) {
          goto LABEL_30;
        }
        int v23 = v10[2](v10, v54[3]);
        if ([(__CFString *)v22 isEqualToString:v14]) {
          goto LABEL_31;
        }
        v24 = *MEMORY[0x263F40328];
        if (!*MEMORY[0x263F40328])
        {
          id v25 = (id)GKOSLoggers();
          v24 = *MEMORY[0x263F40328];
        }
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
LABEL_30:
          int v23 = 1;
LABEL_31:
          id v31 = [v42 objectForKeyedSubscript:v14];
          v32 = v31;
          if (v31 && v31 != v41)
          {
            v33 = [v31 attributes];
            objc_msgSend(v44, "setAttributes:range:", v33, v43, v20 - v43);
          }
          if (v23) {
            goto LABEL_45;
          }
          int v13 = 0;
          goto LABEL_36;
        }
        *(_DWORD *)buf = 138412802;
        v78 = v22;
        __int16 v79 = 2112;
        v80 = v14;
        __int16 v81 = 2112;
        v82[0] = a1;
        v26 = v24;
        v27 = "wrong closing tag name (got %@, expected %@) in string:%@";
        uint32_t v28 = 32;
      }
      else
      {
        v29 = *MEMORY[0x263F40328];
        if (!*MEMORY[0x263F40328])
        {
          id v30 = (id)GKOSLoggers();
          v29 = *MEMORY[0x263F40328];
        }
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_30;
        }
        *(_DWORD *)buf = 138412290;
        v78 = a1;
        v26 = v29;
        v27 = "malformed closing tag in string:%@";
        uint32_t v28 = 12;
      }
      _os_log_debug_impl(&dword_22600C000, v26, OS_LOG_TYPE_DEBUG, v27, buf, v28);
      goto LABEL_30;
    }
    id v46 = v14;
    char v16 = ((uint64_t (*)(void, uint64_t, id *))v12[2])(v12, 62, &v46);
    id v17 = v46;

    if ((v16 & 1) == 0) {
      break;
    }
    if (v10[2](v10, v54[3])) {
      goto LABEL_44;
    }
    uint64_t v43 = v54[3];
    int v13 = 2;
    v14 = v17;
LABEL_36:
    if (v11[2](v11)) {
      goto LABEL_45;
    }
  }
  v34 = (NSObject **)MEMORY[0x263F40328];
  v35 = *MEMORY[0x263F40328];
  if (!*MEMORY[0x263F40328])
  {
    id v36 = (id)GKOSLoggers();
    v35 = *v34;
  }
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v78 = a1;
    _os_log_debug_impl(&dword_22600C000, v35, OS_LOG_TYPE_DEBUG, "malformed tag in string:%@", buf, 0xCu);
  }
LABEL_44:
  v14 = v17;
LABEL_45:
  int64_t v37 = v74[3] & 0xFFFFFFFFFFFFFFFELL;
  if (v37 >= 2)
  {
    do
    {
      if (v83[v37 - 1] != v82[v37]) {
        objc_msgSend(v44, "deleteCharactersInRange:");
      }
      v37 -= 2;
    }
    while ((unint64_t)(v37 + 2) > 3);
  }

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v73, 8);

  return v44;
}

@end