@interface BRCBookmark
+ (id)createName;
+ (void)unlinkAliasAtPath:(id)a3;
- (BOOL)_resolveDataWithError:(id *)a3;
- (BOOL)_resolveTargetWithError:(id *)a3;
- (BOOL)containsItemID;
- (BOOL)resolveWithError:(id *)a3;
- (BRCBookmark)initWithRelpath:(id)a3;
- (BRCBookmark)initWithTarget:(id)a3 owningAppLibrary:(id)a4 path:(id)a5 session:(id)a6;
- (BRCLocalItem)target;
- (BRCServerZone)targetServerZone;
- (id)writeUnderParent:(id)a3 name:(id)a4 error:(id *)a5;
- (int)_validateSignatureWithFd:(int)a3;
- (void)_computeSignature:(unsigned __int8)a3[32];
- (void)containsItemID;
@end

@implementation BRCBookmark

- (BOOL)containsItemID
{
  if (!self->_targetResolved)
  {
    v4 = brc_bread_crumbs();
    v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCBookmark containsItemID]();
    }
  }
  return self->_containsItemID;
}

- (BRCServerZone)targetServerZone
{
  if (!self->_targetResolved)
  {
    v5 = brc_bread_crumbs();
    v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCBookmark containsItemID]();
    }
  }
  targetServerZone = self->_targetServerZone;
  return targetServerZone;
}

- (BRCLocalItem)target
{
  if (!self->_targetResolved)
  {
    v5 = brc_bread_crumbs();
    v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCBookmark containsItemID]();
    }
  }
  target = self->_target;
  return target;
}

- (void)_computeSignature:(unsigned __int8)a3[32]
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = [(BRCAccountSession *)self->_session ubiquityTokenSalt];
  v6 = (const char *)[v5 UTF8String];

  id v7 = [(BRCAppLibrary *)self->_appLibrary appLibraryID];
  v8 = (const char *)[v7 UTF8String];

  size_t v9 = strlen(v6);
  CCHmac(2u, v6, v9, [(NSData *)self->_bookmarkData bytes], [(NSData *)self->_bookmarkData length], macOut);
  size_t v10 = strlen(v8);
  CCHmac(2u, v8, v10, macOut, 0x20uLL, a3);
}

- (int)_validateSignatureWithFd:(int)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (fgetxattr(a3, "com.apple.clouddocs.security", value, 0x20uLL, 0, 0) != 32) {
    return 81;
  }
  [(BRCBookmark *)self _computeSignature:v6];
  int8x16_t v4 = vorrq_s8(veorq_s8(value[1], v6[1]), veorq_s8(value[0], v6[0]));
  if (vorr_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL))) {
    return 80;
  }
  else {
    return 0;
  }
}

- (BRCBookmark)initWithRelpath:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BRCBookmark;
  id v5 = [(BRCBookmark *)&v32 init];
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v6 = [v4 session];
  session = v5->_session;
  v5->_session = (BRCAccountSession *)v6;

  uint64_t v8 = [v4 appLibrary];
  appLibrary = v5->_appLibrary;
  v5->_appLibrary = (BRCAppLibrary *)v8;

  if (!v8)
  {
    v17 = brc_bread_crumbs();
    v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[BRCBookmark initWithRelpath:]();
    }

    goto LABEL_23;
  }
  if (([v4 isBRAlias] & 1) == 0)
  {
    v26 = brc_bread_crumbs();
    v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      -[BRCBookmark initWithRelpath:].cold.4();
    }
  }
  if (([v4 isBRAlias] & 1) == 0)
  {
    v19 = brc_bread_crumbs();
    v20 = brc_default_log();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
      -[BRCBookmark initWithRelpath:]();
    }

    goto LABEL_22;
  }
  size_t v10 = (void *)MEMORY[0x1E4F1CB10];
  v11 = [v4 physicalURL];
  id v31 = 0;
  uint64_t v12 = [v10 bookmarkDataWithContentsOfURL:v11 error:&v31];
  id v13 = v31;
  bookmarkData = v5->_bookmarkData;
  v5->_bookmarkData = (NSData *)v12;

  if (!v5->_bookmarkData)
  {
    v21 = brc_bread_crumbs();
    v22 = brc_default_log();
    if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      id v34 = v4;
      __int16 v35 = 2112;
      id v36 = v13;
      __int16 v37 = 2112;
      v38 = v21;
      _os_log_error_impl(&dword_1D353B000, v22, (os_log_type_t)0x90u, "[ERROR] Unable to get bookmark data on bookmark at %@: %@%@", buf, 0x20u);
    }

    goto LABEL_21;
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __31__BRCBookmark_initWithRelpath___block_invoke;
  v28[3] = &unk_1E6993E30;
  v15 = v5;
  v29 = v15;
  id v30 = v4;
  if (([v30 performOnOpenFileDescriptor:v28 error:0] & 1) == 0)
  {
    v23 = brc_bread_crumbs();
    v24 = brc_default_log();
    if (os_log_type_enabled(v24, (os_log_type_t)0x90u)) {
      -[BRCBookmark initWithRelpath:]();
    }

LABEL_21:
LABEL_22:
    id v5 = 0;
LABEL_23:
    v16 = 0;
    goto LABEL_24;
  }

  v15->_dataResolved = 1;
LABEL_8:
  id v5 = v5;
  v16 = v5;
LABEL_24:

  return v16;
}

uint64_t __31__BRCBookmark_initWithRelpath___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _validateSignatureWithFd:a2];
  if (v3 == 80) {
    [(id)objc_opt_class() unlinkAliasAtPath:*(void *)(a1 + 40)];
  }
  return v3;
}

- (BRCBookmark)initWithTarget:(id)a3 owningAppLibrary:(id)a4 path:(id)a5 session:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11 && ![v11 isDocument] || v13 && (objc_msgSend(v13, "isDocument") & 1) == 0)
  {
    v20 = brc_bread_crumbs();
    v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BRCBookmark initWithTarget:owningAppLibrary:path:session:]();
    }

    v19 = 0;
  }
  else
  {
    id v26 = v14;
    v15 = [v11 appLibrary];
    int v16 = [v15 isEqualToAppLibrary:v12];

    if (v16)
    {
      v17 = brc_bread_crumbs();
      v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        -[BRCBookmark initWithTarget:owningAppLibrary:path:session:]();
      }

      v19 = 0;
    }
    else
    {
      v27.receiver = self;
      v27.super_class = (Class)BRCBookmark;
      v22 = [(BRCBookmark *)&v27 init];
      v19 = v22;
      if (v22)
      {
        objc_storeStrong((id *)&v22->_session, a6);
        objc_storeStrong((id *)&v19->_appLibrary, a4);
        objc_storeStrong((id *)&v19->_target, a3);
        uint64_t v23 = [v11 serverZone];
        targetServerZone = v19->_targetServerZone;
        v19->_targetServerZone = (BRCServerZone *)v23;

        objc_storeStrong((id *)&v19->_targetRelpath, a5);
        v19->_targetResolved = 1;
      }
    }
    id v14 = v26;
  }

  return v19;
}

- (BOOL)_resolveTargetWithError:(id *)a3
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v6 = *MEMORY[0x1E4F1C550];
  uint64_t v7 = *MEMORY[0x1E4F1C700];
  v114[0] = *MEMORY[0x1E4F1C550];
  v114[1] = v7;
  uint64_t v9 = *MEMORY[0x1E4F1CEB0];
  uint64_t v115 = *MEMORY[0x1E4F1D560];
  uint64_t v8 = v115;
  uint64_t v116 = v9;
  uint64_t v96 = v9;
  uint64_t v10 = *MEMORY[0x1E4F1CDD0];
  uint64_t v11 = *MEMORY[0x1E4F1C6E8];
  uint64_t v117 = *MEMORY[0x1E4F1CDD0];
  uint64_t v118 = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:6];
  id v13 = [v5 resourceValuesForKeys:v12 fromBookmarkData:self->_bookmarkData];

  id v14 = [v13 objectForKeyedSubscript:v7];
  id v103 = 0;
  v104 = 0;
  v102 = 0;
  v15 = [v13 objectForKeyedSubscript:v8];
  if ([v15 hasPrefix:@"docs.icloud.com:"])
  {
    uint64_t v94 = v10;
    id v16 = [v15 substringFromIndex:objc_msgSend(@"docs.icloud.com:", "length")];
    if ([v16 parseBookmarkDataWithAccountSession:self->_session docID:&v103 itemID:&v102 mangledID:&v104 unsaltedBookmarkData:0 error:a3])
    {
      id v17 = v103;
      v18 = [v13 objectForKeyedSubscript:v6];
      v19 = v18;
      if (v17)
      {
        if (v18)
        {
          id v20 = v103;
          v21 = [v13 objectForKeyedSubscript:v6];
          LOBYTE(v20) = objc_msgSend(v20, "br_isEqualToNumber:", v21);

          if (v20)
          {
LABEL_38:

            v45 = [(BRCAccountSession *)self->_session appLibraryByMangledID:v104];
            appLibrary = self->_appLibrary;
            self->_appLibrary = v45;

            id v16 = [(BRCAccountSession *)self->_session clientZoneByMangledID:v104];
            if (!v16)
            {
              brc_bread_crumbs();
              v47 = (char *)objc_claimAutoreleasedReturnValue();
              v48 = brc_default_log();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v107 = v104;
                __int16 v108 = 2112;
                v109 = v47;
                _os_log_impl(&dword_1D353B000, v48, OS_LOG_TYPE_DEFAULT, "[WARNING] no target container %@ for bookmark%@", buf, 0x16u);
              }
            }
            if (v102)
            {
              objc_msgSend(v16, "itemByItemID:");
              v49 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
              target = self->_target;
              self->_target = v49;

              if (!self->_target)
              {
                v51 = brc_bread_crumbs();
                v52 = brc_default_log();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  v107 = v102;
                  __int16 v108 = 2112;
                  v109 = v104;
                  __int16 v110 = 2112;
                  id v111 = v51;
                  _os_log_impl(&dword_1D353B000, v52, OS_LOG_TYPE_DEFAULT, "[WARNING] no target itemID for %@ in container %@%@", buf, 0x20u);
                }
              }
              self->_containsItemID = 1;
            }
            v53 = self->_target;
            if (!v53 && v103)
            {
              objc_msgSend(v16, "itemByDocumentID:", objc_msgSend(v103, "unsignedIntValue"));
              v54 = (BRCLocalItem *)objc_claimAutoreleasedReturnValue();
              v55 = self->_target;
              self->_target = v54;

              if (self->_target)
              {
LABEL_55:
                if (!self->_appLibrary)
                {
                  v58 = self->_target;
                  if (v58)
                  {
                    v59 = [(BRCLocalItem *)v58 appLibrary];
                    v60 = (char *)self->_appLibrary;
                    self->_appLibrary = v59;
                  }
                  else
                  {
                    brc_bread_crumbs();
                    v60 = (char *)objc_claimAutoreleasedReturnValue();
                    v74 = brc_default_log();
                    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v107 = v60;
                      _os_log_impl(&dword_1D353B000, v74, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't resolve target app library%@", buf, 0xCu);
                    }
                  }
                }
                v75 = [v16 serverZone];
                targetServerZone = self->_targetServerZone;
                self->_targetServerZone = v75;

                LOBYTE(a3) = 1;
                self->_targetResolved = 1;
                goto LABEL_96;
              }
              v56 = brc_bread_crumbs();
              v57 = brc_default_log();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                v107 = (const char *)v103;
                __int16 v108 = 2112;
                v109 = v104;
                __int16 v110 = 2112;
                id v111 = v56;
                _os_log_impl(&dword_1D353B000, v57, OS_LOG_TYPE_DEFAULT, "[WARNING] no target docID for %@ in container %@%@", buf, 0x20u);
              }

              v53 = self->_target;
            }
            if (v53) {
              goto LABEL_55;
            }
            v91 = v15;
            v93 = a3;
            v61 = [v13 objectForKeyedSubscript:v11];
            v62 = [v13 objectForKeyedSubscript:v96];
            uint64_t v63 = [v13 objectForKeyedSubscript:v94];
            v64 = (void *)v63;
            if (!self->_appLibrary)
            {
LABEL_87:
              v81 = brc_bread_crumbs();
              v82 = brc_default_log();
              if (os_log_type_enabled(v82, (os_log_type_t)0x90u)) {
                -[BRCBookmark _resolveTargetWithError:]();
              }

              v83 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 18);
              if (v83)
              {
                v84 = v62;
                v85 = brc_bread_crumbs();
                v86 = brc_default_log();
                if (os_log_type_enabled(v86, (os_log_type_t)0x90u))
                {
                  v89 = "(passed to caller)";
                  *(_DWORD *)buf = 136315906;
                  v107 = "-[BRCBookmark _resolveTargetWithError:]";
                  __int16 v108 = 2080;
                  if (!v93) {
                    v89 = "(ignored by caller)";
                  }
                  v109 = v89;
                  __int16 v110 = 2112;
                  id v111 = v83;
                  __int16 v112 = 2112;
                  v113 = v85;
                  _os_log_error_impl(&dword_1D353B000, v86, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
                }

                v62 = v84;
              }
              if (v93) {
                id *v93 = v83;
              }

LABEL_95:
              LOBYTE(a3) = 0;
              v15 = v91;
              goto LABEL_96;
            }
            if (v63 && v61)
            {
              v97 = v62;
              v65 = -[BRCRelativePath initWithFileID:session:]([BRCRelativePath alloc], "initWithFileID:session:", [v62 unsignedLongLongValue], self->_session);
              if ([(BRCRelativePath *)v65 resolveAndKeepOpenMustExist:1 error:0])
              {
                v66 = [(BRCRelativePath *)v65 pathWithChildAtPath:v61];
                if ([v66 resolveAndKeepOpenMustExist:1 error:0])
                {
                  int v95 = [v66 documentID];
                  int v67 = [v103 unsignedIntValue];
                  [v66 close];
                  [(BRCRelativePath *)v65 close];

                  v62 = v97;
                  if (v95 == v67) {
                    goto LABEL_85;
                  }
                  goto LABEL_83;
                }
                [(BRCRelativePath *)v65 close];
              }
              v62 = v97;
            }
LABEL_83:
            v78 = -[BRCRelativePath initWithFileID:session:]([BRCRelativePath alloc], "initWithFileID:session:", [v64 unsignedLongLongValue], self->_session);
            if ([(BRCRelativePath *)v78 resolveAndKeepOpenMustExist:1 error:0])
            {
              unsigned int v79 = [(BRCRelativePath *)v78 documentID];
              int v80 = [v103 unsignedIntValue];
              [(BRCRelativePath *)v78 close];

              if (v79 == v80)
              {
LABEL_85:

                v15 = v91;
                goto LABEL_55;
              }
            }
            else
            {
            }
            goto LABEL_87;
          }
        }
        brc_bread_crumbs();
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v23 = brc_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          -[BRCBookmark _resolveTargetWithError:]();
        }
      }
      else
      {
        id v22 = v103;
        id v103 = v18;
      }
LABEL_37:

      goto LABEL_38;
    }
LABEL_26:
    LOBYTE(a3) = 0;
    goto LABEL_96;
  }
  v24 = [v13 objectForKeyedSubscript:v6];
  id v25 = v103;
  id v103 = v24;

  if (v14 && v103)
  {
    v92 = a3;
    uint64_t v94 = v10;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v26 = [(BRCAccountSession *)self->_session roots];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v98 objects:v105 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v99;
      v91 = v15;
LABEL_13:
      uint64_t v30 = 0;
      while (1)
      {
        if (*(void *)v99 != v29) {
          objc_enumerationMutation(v26);
        }
        id v31 = objc_msgSend(*(id *)(*((void *)&v98 + 1) + 8 * v30), "absolutePath", v91);
        objc_msgSend(v14, "br_pathRelativeToPath:", v31);
        id v16 = (id)objc_claimAutoreleasedReturnValue();

        if (v16) {
          break;
        }
        if (v28 == ++v30)
        {
          uint64_t v28 = [v26 countByEnumeratingWithState:&v98 objects:v105 count:16];
          v15 = v91;
          if (v28) {
            goto LABEL_13;
          }
          goto LABEL_19;
        }
      }

      uint64_t v41 = [v16 rangeOfString:@"/"];
      if (v42)
      {
        id v22 = [v16 substringToIndex:v41];
        v43 = (char *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithMangledString:v22];
        v44 = v104;
        v104 = v43;

        v15 = v91;
        a3 = v92;
        goto LABEL_37;
      }
      v68 = brc_bread_crumbs();
      v69 = brc_default_log();
      v70 = v92;
      if (os_log_type_enabled(v69, (os_log_type_t)0x90u)) {
        -[BRCBookmark _resolveTargetWithError:].cold.4();
      }

      v71 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 18);
      if (v71)
      {
        v72 = brc_bread_crumbs();
        v73 = brc_default_log();
        if (os_log_type_enabled(v73, (os_log_type_t)0x90u))
        {
          v90 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v107 = "-[BRCBookmark _resolveTargetWithError:]";
          __int16 v108 = 2080;
          if (!v92) {
            v90 = "(ignored by caller)";
          }
          v109 = v90;
          __int16 v110 = 2112;
          id v111 = v71;
          __int16 v112 = 2112;
          v113 = v72;
          _os_log_error_impl(&dword_1D353B000, v73, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

        v70 = v92;
      }
      if (v70) {
        id *v70 = v71;
      }

      goto LABEL_95;
    }
LABEL_19:

    objc_super v32 = brc_bread_crumbs();
    v33 = brc_default_log();
    if (os_log_type_enabled(v33, (os_log_type_t)0x90u)) {
      -[BRCBookmark _resolveTargetWithError:]();
    }

    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 18);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      id v34 = brc_bread_crumbs();
      __int16 v35 = brc_default_log();
      if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
      {
        v88 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v107 = "-[BRCBookmark _resolveTargetWithError:]";
        __int16 v108 = 2080;
        if (!v92) {
          v88 = "(ignored by caller)";
        }
        v109 = v88;
        __int16 v110 = 2112;
        id v111 = v16;
        __int16 v112 = 2112;
        v113 = v34;
        _os_log_error_impl(&dword_1D353B000, v35, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (v92)
    {
      id v16 = v16;
      LOBYTE(a3) = 0;
      id *v92 = v16;
      goto LABEL_96;
    }
    goto LABEL_26;
  }
  id v36 = brc_bread_crumbs();
  __int16 v37 = brc_default_log();
  if (os_log_type_enabled(v37, (os_log_type_t)0x90u)) {
    -[BRCBookmark _resolveTargetWithError:].cold.5();
  }

  objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 22);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v38 = brc_bread_crumbs();
    uint64_t v39 = brc_default_log();
    if (os_log_type_enabled(v39, (os_log_type_t)0x90u))
    {
      v77 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v107 = "-[BRCBookmark _resolveTargetWithError:]";
      __int16 v108 = 2080;
      if (!a3) {
        v77 = "(ignored by caller)";
      }
      v109 = v77;
      __int16 v110 = 2112;
      id v111 = v16;
      __int16 v112 = 2112;
      v113 = v38;
      _os_log_error_impl(&dword_1D353B000, v39, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a3)
  {
    id v16 = v16;
    v40 = a3;
    LOBYTE(a3) = 0;
    id *v40 = v16;
  }
LABEL_96:

  return (char)a3;
}

- (BOOL)_resolveDataWithError:(id *)a3
{
  v24[4] = *MEMORY[0x1E4F143B8];
  id v5 = [(BRCRelativePath *)self->_targetRelpath physicalURL];
  if (!v5)
  {
    uint64_t v6 = [[BRCItemToPathLookup alloc] initWithItem:self->_target];
    uint64_t v7 = [(BRCItemToPathLookup *)v6 byFileSystemID];
    id v5 = [v7 physicalURL];

    [(BRCItemToPathLookup *)v6 closePaths];
    if (!v5)
    {
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 2);
        id v5 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v5 = 0;
      }
      goto LABEL_6;
    }
  }
  target = self->_target;
  if (target)
  {
    uint64_t v9 = [(BRCLocalItem *)target bookmarkData];
    if (v9)
    {
LABEL_5:
      objc_msgSend(v5, "br_preCacheBookmarkData:versionEtag:", v9, 0);
      uint64_t v10 = *MEMORY[0x1E4F1D560];
      v24[0] = *MEMORY[0x1E4F1C550];
      v24[1] = v10;
      uint64_t v11 = *MEMORY[0x1E4F1CEB0];
      v24[2] = *MEMORY[0x1E4F1CDD0];
      v24[3] = v11;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
      id v13 = [v5 bookmarkDataWithOptions:67109888 includingResourceValuesForKeys:v12 relativeToURL:v5 error:a3];
      bookmarkData = self->_bookmarkData;
      self->_bookmarkData = v13;

LABEL_6:
      BOOL v15 = self->_bookmarkData != 0;
      self->_dataResolved = v15;
      goto LABEL_15;
    }
  }
  else
  {
    id v16 = +[BRCPathToItemLookup lookupForRelativePath:self->_targetRelpath];
    id v17 = NSString;
    targetRelpath = self->_targetRelpath;
    v19 = [v16 clientZone];
    id v20 = [v19 serverZone];
    uint64_t v9 = [v17 bookmarkDataWithRelativePath:targetRelpath serverZone:v20];

    if (v9) {
      goto LABEL_5;
    }
  }
  v21 = brc_bread_crumbs();
  id v22 = brc_default_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
    -[BRCBookmark _resolveDataWithError:]();
  }

  self->_dataResolved = 0;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 2);
    BOOL v15 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_15:

  return v15;
}

- (BOOL)resolveWithError:(id *)a3
{
  if (self->_targetResolved)
  {
    if (self->_dataResolved)
    {
      return 1;
    }
    else
    {
      return -[BRCBookmark _resolveDataWithError:](self, "_resolveDataWithError:");
    }
  }
  else
  {
    if (!self->_dataResolved)
    {
      uint64_t v6 = brc_bread_crumbs();
      uint64_t v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[BRCBookmark resolveWithError:]();
      }
    }
    return [(BRCBookmark *)self _resolveTargetWithError:a3];
  }
}

- (id)writeUnderParent:(id)a3 name:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 physicalURL];
  uint64_t v11 = [v10 URLByAppendingPathComponent:v9];

  unsigned int v25 = 0;
  id v12 = 0;
  if ([MEMORY[0x1E4F1CB10] writeBookmarkData:self->_bookmarkData toURL:v11 options:0 error:a5])
  {
    id v12 = [MEMORY[0x1E4F1CB10] bookmarkDataWithContentsOfURL:v11 error:a5];
    bookmarkData = self->_bookmarkData;
    self->_bookmarkData = v12;

    if (v12)
    {
      [(BRCBookmark *)self _computeSignature:value];
      id v14 = v11;
      if (setxattr((const char *)[v14 fileSystemRepresentation], "com.apple.clouddocs.security", value, 0x20uLL, 0, 0) < 0)
      {
        p_super = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
        if (p_super)
        {
          v18 = brc_bread_crumbs();
          v19 = brc_default_log();
          if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
          {
            uint64_t v23 = "(passed to caller)";
            *(_DWORD *)buf = 136315906;
            uint64_t v27 = "-[BRCBookmark writeUnderParent:name:error:]";
            __int16 v28 = 2080;
            if (!a5) {
              uint64_t v23 = "(ignored by caller)";
            }
            uint64_t v29 = v23;
            __int16 v30 = 2112;
            id v31 = p_super;
            __int16 v32 = 2112;
            v33 = v18;
            _os_log_error_impl(&dword_1D353B000, v19, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
          }
        }
        if (a5)
        {
          p_super = p_super;
          id v12 = 0;
          *a5 = p_super;
        }
        else
        {
          id v12 = 0;
        }
      }
      else
      {
        id v12 = [v8 pathWithChildAtPath:v9];
        if ([(NSData *)v12 resolveMustExist:1 error:&v25])
        {
          p_super = brc_bread_crumbs();
          id v16 = brc_default_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            id v17 = self->_bookmarkData;
            *(_DWORD *)buf = 138412802;
            uint64_t v27 = (const char *)v17;
            __int16 v28 = 2112;
            uint64_t v29 = v14;
            __int16 v30 = 2112;
            id v31 = p_super;
            _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] wrote %@ at %@%@", buf, 0x20u);
          }
        }
        else
        {
          id v16 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", v25);
          if (v16)
          {
            id v20 = brc_bread_crumbs();
            v21 = brc_default_log();
            if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
            {
              v24 = "(passed to caller)";
              *(_DWORD *)buf = 136315906;
              uint64_t v27 = "-[BRCBookmark writeUnderParent:name:error:]";
              __int16 v28 = 2080;
              if (!a5) {
                v24 = "(ignored by caller)";
              }
              uint64_t v29 = v24;
              __int16 v30 = 2112;
              id v31 = v16;
              __int16 v32 = 2112;
              v33 = v20;
              _os_log_error_impl(&dword_1D353B000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
            }
          }
          if (a5)
          {
            id v16 = v16;
            *a5 = v16;
          }
          p_super = &v12->super;
          id v12 = 0;
        }
      }
    }
  }

  return v12;
}

+ (id)createName
{
  id v2 = [NSString alloc];
  uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [v3 UUIDString];
  id v5 = (void *)[v2 initWithFormat:@".%@.alias", v4];

  return v5;
}

+ (void)unlinkAliasAtPath:(id)a3
{
  id v3 = a3;
  id v4 = [v3 appLibrary];
  id v5 = [v4 db];
  [v5 assertOnQueue];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__BRCBookmark_unlinkAliasAtPath___block_invoke;
  v7[3] = &unk_1E6994A60;
  id v8 = v3;
  id v6 = v3;
  [v6 performOnOpenParentFileDescriptor:v7 error:0];
}

uint64_t __33__BRCBookmark_unlinkAliasAtPath___block_invoke(uint64_t a1, int a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = (uint64_t *)(a1 + 32);
  id v4 = [*(id *)(a1 + 32) filename];
  int v5 = BRCUnlinkAt(a2, v4, 0);

  if (v5 < 0)
  {
    int v8 = *__error();
    id v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      uint64_t v12 = *v3;
      int v13 = *__error();
      int v14 = 138413058;
      uint64_t v15 = v12;
      __int16 v16 = 1024;
      int v17 = v13;
      __int16 v18 = 1024;
      int v19 = v8;
      __int16 v20 = 2112;
      v21 = v9;
      _os_log_error_impl(&dword_1D353B000, v10, (os_log_type_t)0x90u, "[ERROR] Unable to unlink bookmark at %@ %{errno}d %{errno}d%@", (uint8_t *)&v14, 0x22u);
    }

    *__error() = v8;
  }
  else
  {
    id v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __33__BRCBookmark_unlinkAliasAtPath___block_invoke_cold_1(v3, (uint64_t)v6, v7);
    }
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetRelpath, 0);
  objc_storeStrong((id *)&self->_targetServerZone, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_bookmarkData, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)containsItemID
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _targetResolved%@", v2, v3, v4, v5, v6);
}

- (void)initWithRelpath:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: not in a container%@", v2, v3, v4, v5, v6);
}

- (void)initWithRelpath:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] Invalid signature for bookmark at %@%@");
}

- (void)initWithRelpath:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] Not a bookmark at %@%@");
}

- (void)initWithRelpath:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: path.isBRAlias%@", v2, v3, v4, v5, v6);
}

- (void)initWithTarget:owningAppLibrary:path:session:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: not allowing an alias in the same app library as its target%@", v2, v3, v4, v5, v6);
}

- (void)initWithTarget:owningAppLibrary:path:session:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: somebody doesn't understand what bookmarks are for!%@", v2, v3, v4, v5, v6);
}

- (void)_resolveTargetWithError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] the bookmark doesn't resolve: %@%@");
}

- (void)_resolveTargetWithError:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: props[NSURLDocumentIdentifierKey] && [docID br_isEqualToNumber:props[NSURLDocumentIdentifierKey]]%@", v2, v3, v4, v5, v6);
}

- (void)_resolveTargetWithError:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] the path isn't within iCloud: %@%@");
}

- (void)_resolveTargetWithError:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] the path isn't within a container: %@%@");
}

- (void)_resolveTargetWithError:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] bookmark is lacking path or document-id: %@%@");
}

- (void)_resolveDataWithError:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: cannot create bookmark data%@", v2, v3, v4, v5, v6);
}

- (void)resolveWithError:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _dataResolved%@", v2, v3, v4, v5, v6);
}

void __33__BRCBookmark_unlinkAliasAtPath___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Unlinked bookmark at %@%@", (uint8_t *)&v4, 0x16u);
}

@end