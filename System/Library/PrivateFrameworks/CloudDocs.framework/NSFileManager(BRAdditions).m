@interface NSFileManager(BRAdditions)
- (BOOL)br_putBackTrashedItemAtURL:()BRAdditions resultingURL:error:;
- (BOOL)br_trashItemAtURL:()BRAdditions resultingURL:error:;
- (id)br_putBackURLForTrashedItemAtURL:()BRAdditions error:;
- (uint64_t)br_forceMoveItemAtURL:()BRAdditions toURL:error:;
- (uint64_t)br_movePromisedItemAtURL:()BRAdditions toURL:error:;
- (uint64_t)br_topLevelSharedFolderForURL:()BRAdditions error:;
- (void)br_setFavoriteRank:()BRAdditions onItemAtURL:;
- (void)br_setLastOpenDate:()BRAdditions onItemAtURL:;
- (void)br_setPutBackInfoOnItemAtURL:()BRAdditions;
@end

@implementation NSFileManager(BRAdditions)

- (uint64_t)br_movePromisedItemAtURL:()BRAdditions toURL:error:
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!BRIsFPFSEnabled(v9, v10))
  {
    memset(v115, 0, sizeof(v115));
    __brc_create_section(0, (uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 103, v115);
    v15 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 103);
    v16 = brc_default_log(1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v32 = (const char *)v115[0];
      v33 = [v8 path];
      v34 = [v9 path];
      *(_DWORD *)buf = 134218754;
      v121 = v32;
      __int16 v122 = 2112;
      uint64_t v123 = (uint64_t)v33;
      __int16 v124 = 2112;
      id v125 = v34;
      __int16 v126 = 2112;
      id v127 = v15;
      _os_log_debug_impl(&dword_19ED3F000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx moving from: %@\n       to:   %@\n%@", buf, 0x2Au);
    }
    id v11 = [v9 lastPathComponent];
    v17 = [v9 URLByDeletingLastPathComponent];
    v18 = objc_msgSend(v11, "br_sideFaultName");
    id v106 = [v17 URLByAppendingPathComponent:v18 isDirectory:0];

    if (([v9 checkResourceIsReachableAndReturnError:0] & 1) != 0
      || [v106 checkResourceIsReachableAndReturnError:0])
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F281F8], 516, @"%@ is reachable.", v9);
        *a5 = (const char *)(id)objc_claimAutoreleasedReturnValue();
      }
      brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 114);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = brc_default_log(0);
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
        -[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]();
      }
      uint64_t v14 = 0;
      goto LABEL_35;
    }
    id v114 = 0;
    char v21 = [v8 checkPromisedItemIsReachableAndReturnError:&v114];
    v22 = v114;
    v20 = v22;
    if ((v21 & 1) == 0)
    {
      if (a5)
      {
        v28 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v118 = *MEMORY[0x1E4F28A50];
        v119 = v22;
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v119 forKeys:&v118 count:1];
        *a5 = [v28 errorWithDomain:*MEMORY[0x1E4F281F8] code:4 userInfo:v29];
      }
      uint64_t v30 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 121);
      v26 = brc_default_log(0);
      v104 = v30;
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u)) {
        -[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:].cold.7();
      }
      id v19 = 0;
      goto LABEL_33;
    }
    if (objc_msgSend(v9, "br_isInTrash")) {
      objc_msgSend(a1, "br_setPutBackInfoOnItemAtURL:", v8);
    }
    if (_CFURLIsItemPromiseAtURL())
    {
      id v19 = v8;
    }
    else
    {
      uint64_t v35 = _CFURLPromiseCopyPhysicalURL();
      id v19 = (id)v35;
      if (!v35 || (id)v35 == v8 || [v8 checkResourceIsReachableAndReturnError:0])
      {
        if (objc_msgSend(v8, "br_isExternalDocumentReference"))
        {
          v104 = objc_msgSend(v8, "br_cloudDocsContainer");
          v26 = objc_msgSend(v9, "br_cloudDocsContainer");
          if (v26 != v104)
          {
            v36 = +[BRDaemonConnection defaultConnection];
            v37 = (void *)[v36 newLegacySyncProxy];

            v112[0] = MEMORY[0x1E4F143A8];
            v112[1] = 3221225472;
            v112[2] = __67__NSFileManager_BRAdditions__br_movePromisedItemAtURL_toURL_error___block_invoke;
            v112[3] = &unk_1E59AD448;
            id v38 = v37;
            id v113 = v38;
            [v38 moveBRSecurityBookmarkAtURL:v8 toURL:v9 reply:v112];
            if (a5)
            {
              *a5 = [v38 error];
            }
            v39 = [v38 error];
            uint64_t v14 = v39 == 0;

            goto LABEL_34;
          }
        }
        uint64_t v14 = [a1 moveItemAtURL:v8 toURL:v9 error:a5];
        goto LABEL_35;
      }
    }
    __int16 v23 = objc_msgSend(v8, "br_capabilityToMoveToURL:error:", v9, 0);
    if ((v23 & 0x204) != 0)
    {
      v104 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:description:", 13, @"The move between those locations is invalid");
      if (a5)
      {
        v24 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v116 = *MEMORY[0x1E4F28A50];
        v117 = v104;
        v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
        *a5 = [v24 errorWithDomain:*MEMORY[0x1E4F281F8] code:512 userInfo:v25];
      }
      v26 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 167);
      v27 = brc_default_log(0);
      if (os_log_type_enabled(v27, (os_log_type_t)0x90u)) {
        -[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:].cold.7();
      }

LABEL_33:
      uint64_t v14 = 0;
LABEL_34:

LABEL_35:
      __brc_leave_section((uint64_t)v115);

      goto LABEL_36;
    }
    if ((v23 & 0x35FB) == 0)
    {
      v94 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 170);
      v95 = brc_default_log(0);
      if (os_log_type_enabled(v95, OS_LOG_TYPE_FAULT)) {
        -[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:].cold.6((uint64_t)v94, v95);
      }
    }
    v41 = [v19 lastPathComponent];
    v42 = [v106 lastPathComponent];
    int v43 = [v41 isEqualToString:v42];

    if (v43)
    {
      id v105 = v19;
      v44 = (const std::__fs::filesystem::path *)[v105 fileSystemRepresentation];
      id v45 = v106;
      v46 = (const std::__fs::filesystem::path *)[v45 fileSystemRepresentation];
      rename(v44, v46, v47);
      if (!v48)
      {
        _CFURLPromiseSetPhysicalURL();
        uint64_t v14 = 1;
        id v19 = v105;
        goto LABEL_35;
      }
      v49 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
      brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 181);
      id v102 = (id)objc_claimAutoreleasedReturnValue();
      v50 = brc_default_log(1);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v99 = v50;
        uint64_t v51 = [v105 fileSystemRepresentation];
        uint64_t v52 = [v45 fileSystemRepresentation];
        *(_DWORD *)buf = 136315906;
        v121 = (const char *)v51;
        __int16 v122 = 2080;
        uint64_t v123 = v52;
        __int16 v124 = 2112;
        id v125 = v49;
        __int16 v126 = 2112;
        v50 = v99;
        id v127 = v102;
        _os_log_impl(&dword_19ED3F000, v99, OS_LOG_TYPE_DEFAULT, "[WARNING] Attempting rename by copy, since rename(%s, %s) failed with %@.%@", buf, 0x2Au);
      }
    }
    v53 = [MEMORY[0x1E4F28CB8] defaultManager];
    v104 = [v53 URLForDirectory:99 inDomain:1 appropriateForURL:v106 create:1 error:a5];

    if (!v104)
    {
      v26 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 187);
      v61 = brc_default_log(0);
      id v103 = v61;
      if (os_log_type_enabled(v61, (os_log_type_t)0x90u)) {
        -[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]((uint64_t)v26, v61);
      }
      goto LABEL_74;
    }
    v54 = [v9 lastPathComponent];
    id v103 = [v104 URLByAppendingPathComponent:v54];

    id v111 = 0;
    v55 = (void *)_CFURLCopyPropertiesOfPromiseAtURL();
    v100 = (void *)[v55 mutableCopy];

    if (v100)
    {
      uint64_t v56 = *MEMORY[0x1E4F1C6E8];
      v26 = [v100 objectForKeyedSubscript:*MEMORY[0x1E4F1C6E8]];
      [v100 setObject:v11 forKeyedSubscript:v56];
      if ([a1 copyItemAtURL:v19 toURL:v103 error:a5])
      {
        v57 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v100 format:200 options:0 error:a5];
        v107[0] = MEMORY[0x1E4F143A8];
        v107[1] = 3221225472;
        v107[2] = __67__NSFileManager_BRAdditions__br_movePromisedItemAtURL_toURL_error___block_invoke_14;
        v107[3] = &unk_1E59AD698;
        id v97 = v57;
        id v108 = v97;
        id v109 = v103;
        id v110 = v11;
        id v103 = v109;
        v58 = objc_msgSend(v109, "fp_withReadWriteAccess:", v107);
        if (v58)
        {
          v59 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 243);
          v60 = brc_default_log(0);
          if (os_log_type_enabled(v60, (os_log_type_t)0x90u)) {
            -[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:].cold.4();
          }

          [a1 removeItemAtURL:v104 error:0];
          goto LABEL_74;
        }

        id v103 = v103;
        LODWORD(v111) = open((const char *)[v103 fileSystemRepresentation], 260);
        if ((v111 & 0x80000000) == 0)
        {
          id v66 = [v106 URLByDeletingLastPathComponent];
          int v67 = open((const char *)[v66 fileSystemRepresentation], 16);

          v68 = (const char *)[v103 fileSystemRepresentation];
          id v101 = v106;
          if (renamex_np(v68, (const char *)[v101 fileSystemRepresentation], 4u) < 0)
          {
            v80 = [v101 path];
            _reportPosixWriteError(a5, @"Unable to make write promise at '%@'", v81, v82, v83, v84, v85, v86, (uint64_t)v80);
          }
          else
          {
            id v69 = v19;
            if ((fsctl((const char *)[v69 fileSystemRepresentation], 0x80046820uLL, &v111, 0) & 0x80000000) == 0)
            {
              [a1 removeItemAtURL:v69 error:0];
              if (!v26)
              {
                v70 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 275);
                v71 = brc_default_log(0);
                if (os_log_type_enabled(v71, (os_log_type_t)0x90u))
                {
                  v72 = [v8 path];
                  -[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:](v72, (uint64_t)v70, buf, v71);
                }
              }
              _CFURLPromiseSetPhysicalURL();
              uint64_t v14 = 1;
              goto LABEL_90;
            }
            v98 = [v69 path];
            v96 = [v101 path];
            _reportPosixWriteError(a5, @"Unable to transfer doc-id from '%@' to '%@'", v88, v89, v90, v91, v92, v93, (uint64_t)v98);

            [a1 removeItemAtURL:v101 error:0];
          }
          uint64_t v14 = 0;
LABEL_90:
          [a1 removeItemAtURL:v104 error:0];
          close(v67);
          close((int)v111);
          goto LABEL_75;
        }
        v73 = [v106 path];
        _reportPosixWriteError(a5, @"Unable to open fault at '%@'", v74, v75, v76, v77, v78, v79, (uint64_t)v73);

        [a1 removeItemAtURL:v104 error:0];
LABEL_74:
        uint64_t v14 = 0;
LABEL_75:

        goto LABEL_34;
      }
      v62 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 216);
      v63 = brc_default_log(0);
      if (os_log_type_enabled(v63, (os_log_type_t)0x90u)) {
        -[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:].cold.5();
      }

      [a1 removeItemAtURL:v104 error:0];
    }
    else
    {
      if (a5) {
        *a5 = (const char *)v111;
      }
      v64 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 206);
      v65 = brc_default_log(0);
      if (os_log_type_enabled(v65, (os_log_type_t)0x90u))
      {
        if (a5) {
          v87 = *a5;
        }
        else {
          v87 = 0;
        }
        *(_DWORD *)buf = 138412546;
        v121 = v87;
        __int16 v122 = 2112;
        uint64_t v123 = (uint64_t)v64;
        _os_log_error_impl(&dword_19ED3F000, v65, (os_log_type_t)0x90u, "[ERROR] Failed to copy properties of URL: %@%@", buf, 0x16u);
      }

      v26 = 0;
    }

    goto LABEL_74;
  }
  id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
  if (v11)
  {
    v12 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 91);
    v13 = brc_default_log(0);
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
    {
      v40 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v121 = "-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]";
      __int16 v122 = 2080;
      if (!a5) {
        v40 = "(ignored by caller)";
      }
      uint64_t v123 = (uint64_t)v40;
      __int16 v124 = 2112;
      id v125 = v11;
      __int16 v126 = 2112;
      id v127 = v12;
      _os_log_error_impl(&dword_19ED3F000, v13, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a5)
  {
    id v11 = v11;
    uint64_t v14 = 0;
    *a5 = (const char *)v11;
  }
  else
  {
    uint64_t v14 = 0;
  }
LABEL_36:

  return v14;
}

- (void)br_setPutBackInfoOnItemAtURL:()BRAdditions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (objc_msgSend(v3, "br_isInSyncedLocation"))
  {
    v4 = objc_msgSend(v3, "br_logicalURL");

    v5 = objc_msgSend(v4, "br_cloudDocsContainer");
    v6 = [v5 trashRestoreStringForURL:v4];
    v7 = [v4 URLByDeletingLastPathComponent];
    id v8 = objc_msgSend(v7, "br_itemID");

    id v9 = [v6 pathComponents];
    int v10 = [v9 containsObject:@".Trash"];

    if (v10)
    {
      id v11 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_setPutBackInfoOnItemAtURL:]", 308);
      v12 = brc_default_log(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[NSFileManager(BRAdditions) br_setPutBackInfoOnItemAtURL:]();
      }
    }
    else
    {
      uint64_t v14 = objc_msgSend(v4, "br_physicalURL");
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __59__NSFileManager_BRAdditions__br_setPutBackInfoOnItemAtURL___block_invoke;
      v16[3] = &unk_1E59AD6C0;
      v17 = v6;
      id v18 = v8;
      id v15 = (id)objc_msgSend(v14, "fp_withReadWriteAccess:", v16);

      id v11 = v17;
    }
  }
  else
  {
    v5 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_setPutBackInfoOnItemAtURL:]", 294);
    v6 = brc_default_log(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v3 path];
      *(_DWORD *)buf = 138412546;
      v20 = v13;
      __int16 v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_19ED3F000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't set the put back URL of something outside Mobile Docs: %@%@", buf, 0x16u);
    }
    v4 = v3;
  }
}

- (id)br_putBackURLForTrashedItemAtURL:()BRAdditions error:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (BRIsFPFSEnabled(v5, v6))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorMethodNotImplemented:", sel_br_putBackURLForTrashedItemAtURL_error_);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      id v8 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_putBackURLForTrashedItemAtURL:error:]", 334);
      id v9 = brc_default_log(0);
      if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      {
        v25 = "(passed to caller)";
        int v26 = 136315906;
        v27 = "-[NSFileManager(BRAdditions) br_putBackURLForTrashedItemAtURL:error:]";
        __int16 v28 = 2080;
        if (!a4) {
          v25 = "(ignored by caller)";
        }
        v29 = v25;
        __int16 v30 = 2112;
        id v31 = v7;
        __int16 v32 = 2112;
        v33 = v8;
        _os_log_error_impl(&dword_19ED3F000, v9, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v26, 0x2Au);
      }
    }
    if (a4)
    {
      id v7 = v7;
      id v10 = 0;
      *a4 = v7;
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v11 = objc_msgSend(v5, "br_physicalURL");
    id v12 = [v11 path];
    v13 = (const char *)[v12 fileSystemRepresentation];

    brc_xattr_get_fs_string(v13, "com.apple.trash.put-back.path#PS");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      uint64_t v14 = objc_msgSend(v5, "br_cloudDocsContainer");
      id v15 = [v14 documentsURL];

      if ([v7 length])
      {
        v16 = [v15 URLByAppendingPathComponent:v7];
        v17 = [v16 path];
        id v18 = [v17 pathComponents];
        int v19 = [v18 containsObject:@".Trash"];

        if (v19)
        {
          v20 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_putBackURLForTrashedItemAtURL:error:]", 348);
          __int16 v21 = brc_default_log(1);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            -[NSFileManager(BRAdditions) br_putBackURLForTrashedItemAtURL:error:](v16, (uint64_t)v20, v21);
          }

          id v10 = 0;
        }
        else
        {
          id v10 = v16;
        }
      }
      else
      {
        id v15 = v15;
        id v10 = v15;
      }
    }
    else
    {
      brc_xattr_get_fs_string(v13, "com.apple.trash.put-back.icloud-parent-id#PS");
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v22 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_putBackURLForTrashedItemAtURL:error:]", 356);
        uint64_t v23 = brc_default_log(1);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          -[NSFileManager(BRAdditions) br_putBackURLForTrashedItemAtURL:error:]();
        }
      }
      if (a4)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:0x7FFFFFFFFFFFFFFFLL userInfo:0];
        id v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v10 = 0;
      }
    }
  }

  return v10;
}

- (BOOL)br_trashItemAtURL:()BRAdditions resultingURL:error:
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (BRIsFPFSEnabled(v7, v8))
  {
    id v9 = [MEMORY[0x1E4F25D40] defaultManager];
    uint64_t v42 = 0;
    int v43 = &v42;
    uint64_t v44 = 0x3032000000;
    id v45 = __Block_byref_object_copy__0;
    v46 = __Block_byref_object_dispose__0;
    id v47 = 0;
    id obj = 0;
    id v10 = [v9 itemForURL:v7 error:&obj];
    objc_storeStrong(&v47, obj);
    id v11 = (void *)v43[5];
    if (v11)
    {
      id v12 = v11;
      v13 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_trashItemAtURL:resultingURL:error:]", 371);
      uint64_t v14 = brc_default_log(0);
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        v33 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[NSFileManager(BRAdditions) br_trashItemAtURL:resultingURL:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!a5) {
          v33 = "(ignored by caller)";
        }
        *(void *)&buf[14] = v33;
        *(_WORD *)&buf[22] = 2112;
        v58 = v12;
        LOWORD(v59) = 2112;
        *(void *)((char *)&v59 + 2) = v13;
        _os_log_error_impl(&dword_19ED3F000, v14, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

      if (a5) {
        *a5 = v12;
      }

      BOOL v15 = 0;
    }
    else
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v58 = __Block_byref_object_copy__0;
      *(void *)&long long v59 = __Block_byref_object_dispose__0;
      *((void *)&v59 + 1) = 0;
      id v24 = objc_alloc(MEMORY[0x1E4F25D98]);
      uint64_t v56 = v10;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
      int v26 = (void *)[v24 initWithItems:v25];

      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __67__NSFileManager_BRAdditions__br_trashItemAtURL_resultingURL_error___block_invoke;
      v40[3] = &unk_1E59AD6E8;
      v40[4] = buf;
      v40[5] = &v42;
      [v26 setTransformCompletionBlock:v40];
      id v27 = objc_alloc_init(MEMORY[0x1E4F28F08]);
      [v27 addOperation:v26];
      [v26 waitUntilFinished];
      __int16 v28 = (void *)v43[5];
      BOOL v15 = v28 == 0;
      if (v28)
      {
        id v29 = v28;
        __int16 v30 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_trashItemAtURL:resultingURL:error:]", 389);
        id v31 = brc_default_log(0);
        if (os_log_type_enabled(v31, (os_log_type_t)0x90u))
        {
          uint64_t v34 = "(passed to caller)";
          *(_DWORD *)int v48 = 136315906;
          v49 = "-[NSFileManager(BRAdditions) br_trashItemAtURL:resultingURL:error:]";
          __int16 v50 = 2080;
          if (!a5) {
            uint64_t v34 = "(ignored by caller)";
          }
          uint64_t v51 = v34;
          __int16 v52 = 2112;
          id v53 = v29;
          __int16 v54 = 2112;
          v55 = v30;
          _os_log_error_impl(&dword_19ED3F000, v31, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v48, 0x2Au);
        }

        if (a5) {
          *a5 = v29;
        }
      }
      else if (a4)
      {
        *a4 = *(id *)(*(void *)&buf[8] + 40);
      }

      _Block_object_dispose(buf, 8);
    }

    _Block_object_dispose(&v42, 8);
  }
  else
  {
    v16 = +[BRDaemonConnection defaultConnection];
    v17 = (void *)[v16 newLegacySyncProxy];

    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    v37 = __67__NSFileManager_BRAdditions__br_trashItemAtURL_resultingURL_error___block_invoke_36;
    id v38 = &unk_1E59AD710;
    id v9 = v17;
    id v39 = v9;
    [v9 trashItemAtURL:v7 reply:&v35];
    id v18 = objc_msgSend(v9, "result", v35, v36, v37, v38);
    int v19 = [v9 result];
    if (a4) {
      BOOL v20 = v19 == 0;
    }
    else {
      BOOL v20 = 1;
    }
    int v21 = !v20;

    if (v21)
    {
      objc_msgSend(v18, "br_addPhysicalProperty");
      *a4 = v18;
    }
    v22 = [v9 error];

    if (a5 && v22)
    {
      *a5 = [v9 error];
    }
    uint64_t v23 = [v9 error];
    BOOL v15 = v23 == 0;
  }
  return v15;
}

- (BOOL)br_putBackTrashedItemAtURL:()BRAdditions resultingURL:error:
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!BRIsFPFSEnabled(v8, v9))
  {
    memset(v29, 0, sizeof(v29));
    __brc_create_section(0, (uint64_t)"-[NSFileManager(BRAdditions) br_putBackTrashedItemAtURL:resultingURL:error:]", 436, v29);
    brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_putBackTrashedItemAtURL:resultingURL:error:]", 436);
    v17 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    id v18 = brc_default_log(1);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = v29[0];
      int v26 = [v8 path];
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v26;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v34 = v17;
      _os_log_debug_impl(&dword_19ED3F000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx restoring trashed item %@%@", buf, 0x20u);
    }
    int v19 = objc_msgSend(a1, "br_putBackURLForTrashedItemAtURL:error:", v8, a5);
    if (v19)
    {
      brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_putBackTrashedItemAtURL:resultingURL:error:]", 444);
      BOOL v20 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      int v21 = brc_default_log(1);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        id v27 = [v8 path];
        __int16 v28 = [v19 path];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v27;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v28;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v34 = v20;
        _os_log_debug_impl(&dword_19ED3F000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] moving %@ to %@%@", buf, 0x20u);
      }
      if (objc_msgSend(a1, "br_movePromisedItemAtURL:toURL:error:", v8, v19, a5))
      {
        if (a4) {
          *a4 = v19;
        }
        BOOL v16 = 1;
        goto LABEL_19;
      }
    }
    else
    {
      v22 = brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_putBackTrashedItemAtURL:resultingURL:error:]", 440);
      uint64_t v23 = brc_default_log(0);
      if (os_log_type_enabled(v23, (os_log_type_t)0x90u)) {
        -[NSFileManager(BRAdditions) br_putBackTrashedItemAtURL:resultingURL:error:]();
      }
    }
    BOOL v16 = 0;
LABEL_19:

    __brc_leave_section((uint64_t)v29);
    goto LABEL_20;
  }
  id v10 = [MEMORY[0x1E4F25D40] defaultManager];
  id v11 = [v10 itemForURL:v8 error:a5];

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F25DA0]);
    v37[0] = v11;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    uint64_t v14 = (void *)[v12 initWithItems:v13 restoreDirectory:0];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v34 = __Block_byref_object_copy__0;
    uint64_t v35 = __Block_byref_object_dispose__0;
    id v36 = 0;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __76__NSFileManager_BRAdditions__br_putBackTrashedItemAtURL_resultingURL_error___block_invoke;
    v30[3] = &unk_1E59AD738;
    id v31 = v8;
    __int16 v32 = buf;
    [v14 setUntrashCompletionBlock:v30];
    BOOL v15 = objc_opt_new();
    [v15 addOperation:v14];

    [v14 waitUntilFinished];
    BOOL v16 = *(void *)(*(void *)&buf[8] + 40) == 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v16 = 0;
  }

LABEL_20:
  return v16;
}

- (void)br_setLastOpenDate:()BRAdditions onItemAtURL:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    id v8 = objc_msgSend(v6, "br_physicalURL");
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__NSFileManager_BRAdditions__br_setLastOpenDate_onItemAtURL___block_invoke;
    v10[3] = &unk_1E59AD6C0;
    id v11 = v5;
    id v12 = v7;
    id v9 = (id)objc_msgSend(v8, "fp_withReadWriteAccess:", v10);
  }
}

- (void)br_setFavoriteRank:()BRAdditions onItemAtURL:
{
  id v5 = a3;
  id v6 = objc_msgSend(a4, "br_physicalURL");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__NSFileManager_BRAdditions__br_setFavoriteRank_onItemAtURL___block_invoke;
  v9[3] = &unk_1E59AD760;
  id v10 = v5;
  id v7 = v5;
  id v8 = (id)objc_msgSend(v6, "fp_withReadWriteAccess:", v9);
}

- (uint64_t)br_topLevelSharedFolderForURL:()BRAdditions error:
{
  return 0;
}

- (uint64_t)br_forceMoveItemAtURL:()BRAdditions toURL:error:
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v15 = 0;
    char v10 = [a1 removeItemAtURL:v9 error:&v15];
    id v11 = v15;
    id v12 = v11;
    if (v10 & 1) != 0 || (objc_msgSend(v11, "br_isCocoaErrorCode:", 4))
    {
      uint64_t v13 = [a1 moveItemAtURL:v8 toURL:v9 error:a5];
    }
    else
    {
      uint64_t v13 = 0;
      if (a5) {
        *a5 = v12;
      }
    }
  }
  else
  {
    uint64_t v13 = 1;
  }

  return v13;
}

- (void)br_movePromisedItemAtURL:()BRAdditions toURL:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19ED3F000, v0, v1, "[ERROR] %@ does not seem to be reachable%@");
}

- (void)br_movePromisedItemAtURL:()BRAdditions toURL:error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19ED3F000, a2, (os_log_type_t)0x90u, "[ERROR] Can't create temporary directory%@", (uint8_t *)&v2, 0xCu);
}

- (void)br_movePromisedItemAtURL:()BRAdditions toURL:error:.cold.3(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_19ED3F000, log, (os_log_type_t)0x90u, "[ERROR] no file name in fault at %@%@", buf, 0x16u);
}

- (void)br_movePromisedItemAtURL:()BRAdditions toURL:error:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19ED3F000, v0, v1, "[ERROR] writeToURL failed: %@%@");
}

- (void)br_movePromisedItemAtURL:()BRAdditions toURL:error:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_19ED3F000, v0, v1, "[ERROR] copyItem failed: %@%@");
}

- (void)br_movePromisedItemAtURL:()BRAdditions toURL:error:.cold.6(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: capability & BRMoveCapabilityMaskAllow%@", (uint8_t *)&v2, 0xCu);
}

- (void)br_movePromisedItemAtURL:()BRAdditions toURL:error:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19ED3F000, v0, v1, "[ERROR] %@%@");
}

- (void)br_setPutBackInfoOnItemAtURL:()BRAdditions .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] Preventing setting the put back info path when parented by .Trash: %@%@");
}

- (void)br_putBackURLForTrashedItemAtURL:()BRAdditions error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] not implemented: fallback to itemID %@%@");
}

- (void)br_putBackURLForTrashedItemAtURL:()BRAdditions error:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 path];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_19ED3F000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Preventing returning the put back info path when parented by .Trash: %@%@", (uint8_t *)&v6, 0x16u);
}

- (void)br_putBackTrashedItemAtURL:()BRAdditions resultingURL:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_19ED3F000, v0, v1, "[ERROR] couldn't find putback url: %@%@");
}

@end