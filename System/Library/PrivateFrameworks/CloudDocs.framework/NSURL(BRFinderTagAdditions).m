@interface NSURL(BRFinderTagAdditions)
- (BOOL)br_setTagNames:()BRFinderTagAdditions error:;
- (uint64_t)br_getTagNames:()BRFinderTagAdditions error:;
@end

@implementation NSURL(BRFinderTagAdditions)

- (uint64_t)br_getTagNames:()BRFinderTagAdditions error:
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend(a1, "br_physicalURL");
  if (BRIsFPFSEnabled(v7, v8))
  {
    v9 = [MEMORY[0x1E4F25D40] defaultManager];
    id v10 = [v9 itemForURL:a1 error:a4];

    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v12 = [v10 tags];
      v13 = objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v12, "count"));

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      v14 = [v10 tags];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v50 objects:v62 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v51 != v16) {
              objc_enumerationMutation(v14);
            }
            v18 = [*(id *)(*((void *)&v50 + 1) + 8 * i) label];
            [v13 addObject:v18];
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v50 objects:v62 count:16];
        }
        while (v15);
      }

      id v19 = v13;
      *a3 = v19;
    }
LABEL_11:
    uint64_t v20 = 1;
LABEL_37:

    goto LABEL_38;
  }
  *a3 = 0;
  id v21 = [v7 path];
  ssize_t v22 = getxattr((const char *)[v21 fileSystemRepresentation], "com.apple.metadata:_kMDItemUserTags", 0, 0, 0, 1);

  if ((v22 & 0x8000000000000000) == 0)
  {
    id v10 = [MEMORY[0x1E4F1CA58] dataWithLength:v22];
    if (v10)
    {
      id v23 = [v7 path];
      v24 = (const char *)[v23 fileSystemRepresentation];
      id v10 = v10;
      ssize_t v25 = getxattr(v24, "com.apple.metadata:_kMDItemUserTags", (void *)[v10 mutableBytes], v22, 0, 1);

      if ((v25 & 0x8000000000000000) == 0)
      {
        v26 = (void *)MEMORY[0x1E4F28DC0];
        v27 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v28 = objc_opt_class();
        v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
        *a3 = [v26 unarchivedObjectOfClasses:v29 fromData:v10 error:0];

        if (![*a3 count]) {
          *a3 = 0;
        }
        goto LABEL_11;
      }
      v41 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v42 = *__error();
      v43 = [v7 path];
      v33 = objc_msgSend(v41, "br_errorWithPOSIXCode:description:", v42, @"couldn't copy %llu-byte xattr %s at '%@'", v22, "com.apple.metadata:_kMDItemUserTags", v43);

      if (v33)
      {
        v44 = brc_bread_crumbs((uint64_t)"-[NSURL(BRFinderTagAdditions) br_getTagNames:error:]", 78);
        v45 = brc_default_log(1);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          v49 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v55 = "-[NSURL(BRFinderTagAdditions) br_getTagNames:error:]";
          __int16 v56 = 2080;
          if (!a4) {
            v49 = "(ignored by caller)";
          }
          v57 = v49;
          __int16 v58 = 2112;
          id v59 = v33;
          __int16 v60 = 2112;
          v61 = v44;
          _os_log_debug_impl(&dword_19ED3F000, v45, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a4) {
        *a4 = v33;
      }
    }
    else
    {
      v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *__error();
      v32 = [v7 path];
      v33 = objc_msgSend(v30, "br_errorWithPOSIXCode:description:", v31, @"couldn't allocate %llu-byte buffer for xattr %s at '%@'", v22, "com.apple.metadata:_kMDItemUserTags", v32);

      if (v33)
      {
        v34 = brc_bread_crumbs((uint64_t)"-[NSURL(BRFinderTagAdditions) br_getTagNames:error:]", 73);
        v35 = brc_default_log(1);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          v47 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v55 = "-[NSURL(BRFinderTagAdditions) br_getTagNames:error:]";
          __int16 v56 = 2080;
          if (!a4) {
            v47 = "(ignored by caller)";
          }
          v57 = v47;
          __int16 v58 = 2112;
          id v59 = v33;
          __int16 v60 = 2112;
          v61 = v34;
          _os_log_debug_impl(&dword_19ED3F000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a4) {
        *a4 = v33;
      }
    }

LABEL_36:
    uint64_t v20 = 0;
    goto LABEL_37;
  }
  if (*__error() != 93)
  {
    v36 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v37 = *__error();
    v38 = [v7 path];
    objc_msgSend(v36, "br_errorWithPOSIXCode:description:", v37, @"couldn't get xattr %s at '%@'", "com.apple.metadata:_kMDItemUserTags", v38);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v39 = brc_bread_crumbs((uint64_t)"-[NSURL(BRFinderTagAdditions) br_getTagNames:error:]", 62);
      v40 = brc_default_log(1);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        v48 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v55 = "-[NSURL(BRFinderTagAdditions) br_getTagNames:error:]";
        __int16 v56 = 2080;
        if (!a4) {
          v48 = "(ignored by caller)";
        }
        v57 = v48;
        __int16 v58 = 2112;
        id v59 = v10;
        __int16 v60 = 2112;
        v61 = v39;
        _os_log_debug_impl(&dword_19ED3F000, v40, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4)
    {
      id v10 = v10;
      uint64_t v20 = 0;
      *a4 = v10;
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  uint64_t v20 = 1;
LABEL_38:

  return v20;
}

- (BOOL)br_setTagNames:()BRFinderTagAdditions error:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_msgSend(a1, "br_physicalURL");
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__NSURL_BRFinderTagAdditions__br_setTagNames_error___block_invoke;
  v14[3] = &unk_1E59AD760;
  id v15 = v6;
  id v8 = v6;
  objc_msgSend(v7, "fp_withReadWriteAccess:", v14);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    id v10 = brc_bread_crumbs((uint64_t)"-[NSURL(BRFinderTagAdditions) br_setTagNames:error:]", 132);
    id v11 = brc_default_log(0);
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      v13 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v17 = "-[NSURL(BRFinderTagAdditions) br_setTagNames:error:]";
      __int16 v18 = 2080;
      if (!a4) {
        v13 = "(ignored by caller)";
      }
      id v19 = v13;
      __int16 v20 = 2112;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_error_impl(&dword_19ED3F000, v11, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a4) {
    *a4 = v9;
  }

  return v9 == 0;
}

@end