@interface CRFileSystemController
+ (id)sharedSingleton;
- (BOOL)cleanupFileSystemForRepair;
- (BOOL)clearRepairBackup:(id *)a3;
- (BOOL)setupAlternativeFDRPath:(id)a3;
- (BOOL)syncAlternativeFDRPath;
- (BOOL)syncFDRDataAtPath:(id)a3 toPath:(id)a4;
- (CRFileSystemController)init;
- (id)_init;
- (id)setupFileSystemForRepair;
- (int64_t)commitToFileSystem;
@end

@implementation CRFileSystemController

- (CRFileSystemController)init
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(sel_sharedSingleton);
  v9 = NSStringFromSelector(a2);
  objc_msgSend_raise_format_(v4, v10, v5, @"Use +[%@ %@] instead of -%@.", v7, v8, v9);

  return 0;
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)CRFileSystemController;
  v2 = [(CRFileSystemController *)&v10 init];
  v3 = v2;
  if (v2)
  {
    tmpFDRDataPathStr = v2->tmpFDRDataPathStr;
    v2->tmpFDRDataPathStr = 0;

    activeFDRDataPathStr = v3->activeFDRDataPathStr;
    v3->activeFDRDataPathStr = 0;

    defaultFDRPathStr = v3->defaultFDRPathStr;
    v3->defaultFDRPathStr = 0;

    alternativeFDRPathStr = v3->alternativeFDRPathStr;
    v3->alternativeFDRPathStr = (NSString *)@"/private/var/hardware/FactoryData/System/Library/Caches/Repair";

    alternativeFDRRealPathStr = v3->alternativeFDRRealPathStr;
    v3->alternativeFDRRealPathStr = (NSString *)@"/private/var/tmp/com.apple.corerepaird/FactoryData";
  }
  return v3;
}

+ (id)sharedSingleton
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_21FC20EA4;
  block[3] = &unk_26452A940;
  block[4] = a1;
  if (qword_26AC13410 != -1) {
    dispatch_once(&qword_26AC13410, block);
  }
  v2 = (void *)qword_26AC13448;
  return v2;
}

- (BOOL)syncAlternativeFDRPath
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, v2, v3);
  p_alternativeFDRRealPathStr = &self->alternativeFDRRealPathStr;
  int v9 = objc_msgSend_fileExistsAtPath_(v5, v7, (uint64_t)self->alternativeFDRRealPathStr, v8);

  if (!v9) {
    return 1;
  }
  objc_super v10 = handleForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    alternativeFDRRealPathStr = self->alternativeFDRRealPathStr;
    defaultFDRPathStr = self->defaultFDRPathStr;
    *(_DWORD *)buf = 138412546;
    v40 = alternativeFDRRealPathStr;
    __int16 v41 = 2112;
    v42 = defaultFDRPathStr;
    _os_log_impl(&dword_21FBF2000, v10, OS_LOG_TYPE_DEFAULT, "Syncing %@ to %@ ...", buf, 0x16u);
  }

  char v14 = objc_msgSend_syncFDRDataAtPath_toPath_(self, v13, (uint64_t)self->alternativeFDRRealPathStr, (uint64_t)self->defaultFDRPathStr);
  v15 = handleForCategory(0);
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *p_alternativeFDRRealPathStr;
      *(_DWORD *)buf = 138412290;
      v40 = v17;
      _os_log_impl(&dword_21FBF2000, v16, OS_LOG_TYPE_DEFAULT, "%@ exists, deleting...", buf, 0xCu);
    }

    v21 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v18, v19, v20);
    uint64_t v22 = (uint64_t)*p_alternativeFDRRealPathStr;
    id v38 = 0;
    char v24 = objc_msgSend_removeItemAtPath_error_(v21, v23, v22, (uint64_t)&v38);
    v16 = v38;

    if (v24)
    {
      v28 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v25, v26, v27);
      alternativeFDRPathStr = self->alternativeFDRPathStr;
      v37 = v16;
      objc_msgSend_removeItemAtPath_error_(v28, v30, (uint64_t)alternativeFDRPathStr, (uint64_t)&v37);
      v31 = v37;

      v32 = handleForCategory(0);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = self->alternativeFDRPathStr;
        *(_DWORD *)buf = 138412546;
        v40 = v33;
        __int16 v41 = 2112;
        v42 = v31;
        _os_log_impl(&dword_21FBF2000, v32, OS_LOG_TYPE_DEFAULT, "Delete %@, error: %@", buf, 0x16u);
      }

      BOOL v34 = 1;
      v16 = v31;
      goto LABEL_11;
    }
    v36 = handleForCategory(0);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_21FC61A70();
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    sub_21FC61AD8();
  }
  BOOL v34 = 0;
LABEL_11:

  return v34;
}

- (BOOL)setupAlternativeFDRPath:(id)a3
{
  uint64_t v135 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"enableStagedSeal", v6);
  if (v7
    && (objc_super v10 = (void *)v7,
        objc_msgSend_objectForKeyedSubscript_(v4, v8, @"enableStagedSeal", v9),
        v11 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v11,
        v10,
        (isKindOfClass & 1) != 0))
  {
    v13 = objc_msgSend_objectForKeyedSubscript_(v4, v8, @"enableStagedSeal", v9);
    int v17 = objc_msgSend_BOOLValue(v13, v14, v15, v16);
  }
  else
  {
    int v17 = 0;
  }
  uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v4, v8, @"ignoreStagedData", v9);
  if (v18
    && (uint64_t v22 = (void *)v18,
        objc_msgSend_objectForKeyedSubscript_(v4, v19, @"ignoreStagedData", v21),
        v23 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v24 = objc_opt_isKindOfClass(),
        v23,
        v22,
        (v24 & 1) != 0))
  {
    v25 = objc_msgSend_objectForKeyedSubscript_(v4, v19, @"ignoreStagedData", v21);
    int v29 = objc_msgSend_BOOLValue(v25, v26, v27, v28);
  }
  else
  {
    int v29 = 0;
  }
  v30 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v19, v20, v21);
  alternativeFDRPathStr = self->alternativeFDRPathStr;
  id v128 = 0;
  objc_msgSend_removeItemAtPath_error_(v30, v32, (uint64_t)alternativeFDRPathStr, (uint64_t)&v128);
  v33 = (NSString *)v128;

  BOOL v34 = handleForCategory(0);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = self->alternativeFDRPathStr;
    *(_DWORD *)buf = 138412546;
    v130 = v35;
    __int16 v131 = 2112;
    v132 = v33;
    _os_log_impl(&dword_21FBF2000, v34, OS_LOG_TYPE_DEFAULT, "Delete %@, error: %@", buf, 0x16u);
  }

  v39 = objc_msgSend_sharedDataAccessor(MEMORY[0x263F53618], v36, v37, v38);
  v127 = v33;
  __int16 v41 = (NSString *)objc_msgSend_copyPathForPersistentData_error_(v39, v40, 100, (uint64_t)&v127);
  v42 = v127;

  defaultFDRPathStr = self->defaultFDRPathStr;
  self->defaultFDRPathStr = v41;

  v44 = handleForCategory(0);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    v45 = self->defaultFDRPathStr;
    *(_DWORD *)buf = 138412290;
    v130 = v45;
    _os_log_impl(&dword_21FBF2000, v44, OS_LOG_TYPE_DEFAULT, "defaultFDRPathStr is %@", buf, 0xCu);
  }

  if (v29)
  {
    v49 = handleForCategory(0);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v49, OS_LOG_TYPE_DEFAULT, "Deleting staged FDR data ...", buf, 2u);
    }

    v53 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v50, v51, v52);
    p_alternativeFDRRealPathStr = &self->alternativeFDRRealPathStr;
    int v57 = objc_msgSend_fileExistsAtPath_(v53, v55, (uint64_t)self->alternativeFDRRealPathStr, v56);

    if (v57)
    {
      v58 = handleForCategory(0);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = *p_alternativeFDRRealPathStr;
        *(_DWORD *)buf = 138412290;
        v130 = v59;
        _os_log_impl(&dword_21FBF2000, v58, OS_LOG_TYPE_DEFAULT, "%@ exists, deleting...", buf, 0xCu);
      }

      v63 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v60, v61, v62);
      uint64_t v64 = (uint64_t)*p_alternativeFDRRealPathStr;
      v126 = v42;
      char v66 = objc_msgSend_removeItemAtPath_error_(v63, v65, v64, (uint64_t)&v126);
      v67 = v126;

      if ((v66 & 1) == 0)
      {
        v68 = handleForCategory(0);
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
          sub_21FC61A70();
        }
        goto LABEL_50;
      }
      v42 = v67;
    }
  }
  if (v17)
  {
    v68 = objc_msgSend_stringByDeletingLastPathComponent(self->alternativeFDRRealPathStr, v46, v47, v48);
    v72 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v69, v70, v71);
    char v75 = objc_msgSend_fileExistsAtPath_(v72, v73, (uint64_t)v68, v74);

    if ((v75 & 1) == 0)
    {
      v79 = handleForCategory(0);
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v130 = v68;
        _os_log_impl(&dword_21FBF2000, v79, OS_LOG_TYPE_DEFAULT, "Create directory at %@", buf, 0xCu);
      }

      v83 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v80, v81, v82);
      v125 = v42;
      char v85 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v83, v84, (uint64_t)v68, 1, 0, &v125);
      v67 = v125;

      if ((v85 & 1) == 0)
      {
        v120 = handleForCategory(0);
        if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR)) {
          sub_21FC61B48();
        }
        goto LABEL_49;
      }
      v42 = v67;
    }
    v86 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v76, v77, v78);
    char v89 = objc_msgSend_fileExistsAtPath_(v86, v87, (uint64_t)self->alternativeFDRRealPathStr, v88);

    if (v89)
    {
LABEL_32:

      goto LABEL_33;
    }
    v90 = handleForCategory(0);
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      v91 = self->defaultFDRPathStr;
      alternativeFDRRealPathStr = self->alternativeFDRRealPathStr;
      *(_DWORD *)buf = 138412546;
      v130 = v91;
      __int16 v131 = 2112;
      v132 = alternativeFDRRealPathStr;
      _os_log_impl(&dword_21FBF2000, v90, OS_LOG_TYPE_DEFAULT, "Copy %@ to %@", buf, 0x16u);
    }

    v96 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v93, v94, v95);
    v97 = self->defaultFDRPathStr;
    v98 = self->alternativeFDRRealPathStr;
    v124 = v42;
    char v100 = objc_msgSend_copyItemAtPath_toPath_error_(v96, v99, (uint64_t)v97, (uint64_t)v98, &v124);
    v67 = v124;

    if (v100)
    {
      v42 = v67;
      goto LABEL_32;
    }
    v120 = handleForCategory(0);
    if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
    {
      v121 = self->defaultFDRPathStr;
      v122 = self->alternativeFDRRealPathStr;
      *(_DWORD *)buf = 138412802;
      v130 = v121;
      __int16 v131 = 2112;
      v132 = v122;
      __int16 v133 = 2112;
      v134 = v67;
      _os_log_error_impl(&dword_21FBF2000, v120, OS_LOG_TYPE_ERROR, "Failed to copy %@ to %@, error: %@", buf, 0x20u);
    }
LABEL_49:

LABEL_50:
    BOOL v116 = 0;
    goto LABEL_38;
  }
LABEL_33:
  v101 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v46, v47, v48);
  int v104 = objc_msgSend_fileExistsAtPath_(v101, v102, (uint64_t)self->alternativeFDRRealPathStr, v103);

  if (!v104)
  {
    BOOL v116 = 1;
    goto LABEL_40;
  }
  v105 = handleForCategory(0);
  if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
  {
    v106 = self->alternativeFDRPathStr;
    v107 = self->alternativeFDRRealPathStr;
    *(_DWORD *)buf = 138412546;
    v130 = v106;
    __int16 v131 = 2112;
    v132 = v107;
    _os_log_impl(&dword_21FBF2000, v105, OS_LOG_TYPE_DEFAULT, "Symlink %@ to %@", buf, 0x16u);
  }

  v111 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v108, v109, v110);
  v112 = self->alternativeFDRPathStr;
  v113 = self->alternativeFDRRealPathStr;
  v123 = v42;
  char v115 = objc_msgSend_createSymbolicLinkAtPath_withDestinationPath_error_(v111, v114, (uint64_t)v112, (uint64_t)v113, &v123);
  v67 = v123;

  if ((v115 & 1) == 0)
  {
    v68 = handleForCategory(0);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      v118 = self->alternativeFDRPathStr;
      v119 = self->alternativeFDRRealPathStr;
      *(_DWORD *)buf = 138412802;
      v130 = v118;
      __int16 v131 = 2112;
      v132 = v119;
      __int16 v133 = 2112;
      v134 = v67;
      _os_log_error_impl(&dword_21FBF2000, v68, OS_LOG_TYPE_ERROR, "Failed to create symlink %@ to %@, error: %@", buf, 0x20u);
    }
    goto LABEL_50;
  }
  BOOL v116 = 1;
LABEL_38:
  v42 = v67;
LABEL_40:

  return v116;
}

- (id)setupFileSystemForRepair
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  bzero(v91, 0x400uLL);
  uint64_t v6 = objc_msgSend_sharedDataAccessor(MEMORY[0x263F53618], v3, v4, v5);
  id v84 = 0;
  uint64_t v8 = (NSString *)objc_msgSend_copyPathForPersistentData_error_(v6, v7, 100, (uint64_t)&v84);
  id v9 = v84;
  activeFDRDataPathStr = self->activeFDRDataPathStr;
  self->activeFDRDataPathStr = v8;

  char v14 = self->activeFDRDataPathStr;
  if (!v14)
  {
    v65 = handleForCategory(0);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
      sub_21FC61BF4((uint64_t)v9, v65);
    }
    uint64_t v20 = 0;
    goto LABEL_39;
  }
  uint64_t v15 = (const char *)objc_msgSend_UTF8String(v14, v11, v12, v13);
  ssize_t v16 = readlink(v15, v91, 0x3FFuLL);
  ssize_t v19 = v16;
  if (v16)
  {
    v91[v16] = 0;
    uint64_t v20 = objc_msgSend_stringWithUTF8String_(NSString, v17, (uint64_t)v91, v18);
  }
  else
  {
    uint64_t v20 = 0;
  }
  uint64_t v21 = handleForCategory(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = self->activeFDRDataPathStr;
    *(_DWORD *)buf = 138412290;
    uint64_t v86 = (uint64_t)v22;
    _os_log_impl(&dword_21FBF2000, v21, OS_LOG_TYPE_DEFAULT, "FDR data path is %@", buf, 0xCu);
  }

  v23 = handleForCategory(0);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v86 = (uint64_t)v20;
    __int16 v87 = 2048;
    uint64_t v88 = (NSString *)v19;
    _os_log_impl(&dword_21FBF2000, v23, OS_LOG_TYPE_DEFAULT, "FDR data Real path is %@ (%ld)", buf, 0x16u);
  }

  if (v20 && objc_msgSend_length(v20, v24, v25, v26))
  {
    if (objc_msgSend_isAbsolutePath(v20, v24, v25, v26))
    {
      int v29 = v20;
      v30 = self->activeFDRDataPathStr;
      self->activeFDRDataPathStr = v29;
    }
    else
    {
      v31 = NSURL;
      v32 = objc_msgSend_URLWithString_(NSURL, v27, (uint64_t)self->activeFDRDataPathStr, v28);
      v30 = objc_msgSend_URLWithString_relativeToURL_(v31, v33, (uint64_t)v20, (uint64_t)v32);

      objc_msgSend_absoluteString(v30, v34, v35, v36);
      uint64_t v37 = (NSString *)objc_claimAutoreleasedReturnValue();
      uint64_t v38 = self->activeFDRDataPathStr;
      self->activeFDRDataPathStr = v37;
    }
  }
  v39 = NSString;
  v40 = objc_msgSend_stringByDeletingLastPathComponent(self->activeFDRDataPathStr, v24, v25, v26);
  objc_msgSend_stringWithFormat_(v39, v41, @"%@/%s", v42, v40, "Backup");
  uint64_t v43 = (NSString *)objc_claimAutoreleasedReturnValue();
  p_tmpFDRDataPathStr = (uint64_t *)&self->tmpFDRDataPathStr;
  tmpFDRDataPathStr = self->tmpFDRDataPathStr;
  self->tmpFDRDataPathStr = v43;

  v46 = handleForCategory(0);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v47 = *p_tmpFDRDataPathStr;
    *(_DWORD *)buf = 138412290;
    uint64_t v86 = v47;
    _os_log_impl(&dword_21FBF2000, v46, OS_LOG_TYPE_DEFAULT, "Temporary FDR Directory is %@", buf, 0xCu);
  }

  uint64_t v51 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v48, v49, v50);
  int v54 = objc_msgSend_fileExistsAtPath_(v51, v52, *p_tmpFDRDataPathStr, v53);

  if (v54)
  {
    v55 = handleForCategory(0);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v56 = *p_tmpFDRDataPathStr;
      *(_DWORD *)buf = 138412290;
      uint64_t v86 = v56;
      _os_log_impl(&dword_21FBF2000, v55, OS_LOG_TYPE_DEFAULT, "%@ directory exists, deleting...", buf, 0xCu);
    }

    v60 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v57, v58, v59);
    uint64_t v61 = *p_tmpFDRDataPathStr;
    id v83 = v9;
    char v63 = objc_msgSend_removeItemAtPath_error_(v60, v62, v61, (uint64_t)&v83);
    id v64 = v83;

    if ((v63 & 1) == 0)
    {
      v65 = handleForCategory(0);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
        sub_21FC61A70();
      }
      id v9 = v64;
LABEL_39:

      v79 = handleForCategory(0);
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
        sub_21FC61BB0(v79);
      }

      id v77 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    id v64 = v9;
  }
  char v66 = handleForCategory(0);
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v67 = *p_tmpFDRDataPathStr;
    *(_DWORD *)buf = 138412290;
    uint64_t v86 = v67;
    _os_log_impl(&dword_21FBF2000, v66, OS_LOG_TYPE_DEFAULT, "Copying persistent FDR data to temporary directory: %@", buf, 0xCu);
  }

  uint64_t v71 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v68, v69, v70);
  v72 = self->activeFDRDataPathStr;
  v73 = self->tmpFDRDataPathStr;
  id v82 = v64;
  char v75 = objc_msgSend_copyItemAtPath_toPath_error_(v71, v74, (uint64_t)v72, (uint64_t)v73, &v82);
  id v9 = v82;

  v76 = handleForCategory(0);
  v65 = v76;
  if ((v75 & 1) == 0)
  {
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      v80 = self->activeFDRDataPathStr;
      uint64_t v81 = self->tmpFDRDataPathStr;
      *(_DWORD *)buf = 138412802;
      uint64_t v86 = (uint64_t)v80;
      __int16 v87 = 2112;
      uint64_t v88 = v81;
      __int16 v89 = 2112;
      id v90 = v9;
      _os_log_error_impl(&dword_21FBF2000, v65, OS_LOG_TYPE_ERROR, "Failed to copy %@ to %@, error: %@", buf, 0x20u);
    }
    goto LABEL_39;
  }
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v65, OS_LOG_TYPE_DEFAULT, "FileSystem setup for repair successfully", buf, 2u);
  }

  id v77 = (id)*p_tmpFDRDataPathStr;
LABEL_31:

  return v77;
}

- (int64_t)commitToFileSystem
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = handleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    tmpFDRDataPathStr = self->tmpFDRDataPathStr;
    activeFDRDataPathStr = self->activeFDRDataPathStr;
    int v9 = 138412546;
    objc_super v10 = tmpFDRDataPathStr;
    __int16 v11 = 2112;
    uint64_t v12 = activeFDRDataPathStr;
    _os_log_impl(&dword_21FBF2000, v3, OS_LOG_TYPE_DEFAULT, "Syncing %@ to %@ ...", (uint8_t *)&v9, 0x16u);
  }

  if (objc_msgSend_syncFDRDataAtPath_toPath_(self, v6, (uint64_t)self->tmpFDRDataPathStr, (uint64_t)self->activeFDRDataPathStr))return 0; {
  uint64_t v8 = handleForCategory(0);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_21FC61AD8();
  }

  return -17;
}

- (BOOL)cleanupFileSystemForRepair
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, v2, v3);
  tmpFDRDataPathStr = self->tmpFDRDataPathStr;
  p_tmpFDRDataPathStr = &self->tmpFDRDataPathStr;
  int v10 = objc_msgSend_fileExistsAtPath_(v5, v8, (uint64_t)tmpFDRDataPathStr, v9);

  if (!v10)
  {
    id v20 = 0;
LABEL_9:
    BOOL v22 = 1;
    goto LABEL_10;
  }
  __int16 v11 = handleForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *p_tmpFDRDataPathStr;
    *(_DWORD *)buf = 138412290;
    uint64_t v26 = v12;
    _os_log_impl(&dword_21FBF2000, v11, OS_LOG_TYPE_DEFAULT, "%@ directory exists, deleting...", buf, 0xCu);
  }

  ssize_t v16 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v13, v14, v15);
  uint64_t v17 = (uint64_t)*p_tmpFDRDataPathStr;
  id v24 = 0;
  char v19 = objc_msgSend_removeItemAtPath_error_(v16, v18, v17, (uint64_t)&v24);
  id v20 = v24;

  if (v19) {
    goto LABEL_9;
  }
  uint64_t v21 = handleForCategory(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_21FC61A70();
  }

  BOOL v22 = 0;
LABEL_10:

  return v22;
}

- (BOOL)clearRepairBackup:(id *)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, (uint64_t)a3, v3);
  alternativeFDRPathStr = self->alternativeFDRPathStr;
  id v47 = 0;
  objc_msgSend_removeItemAtPath_error_(v6, v8, (uint64_t)alternativeFDRPathStr, (uint64_t)&v47);
  id v9 = v47;

  int v10 = handleForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = self->alternativeFDRPathStr;
    *(_DWORD *)buf = 138412546;
    uint64_t v49 = v11;
    __int16 v50 = 2112;
    id v51 = v9;
    _os_log_impl(&dword_21FBF2000, v10, OS_LOG_TYPE_DEFAULT, "Delete %@, error: %@", buf, 0x16u);
  }

  uint64_t v15 = objc_msgSend_sharedDataAccessor(MEMORY[0x263F53618], v12, v13, v14);
  id v46 = v9;
  uint64_t v17 = objc_msgSend_copyPathForPersistentData_error_(v15, v16, 100, (uint64_t)&v46);
  id v18 = v46;

  if (!v17)
  {
    v44 = handleForCategory(0);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_21FC61C6C(v44);
    }
    uint64_t v26 = 0;
LABEL_19:

    BOOL v42 = 0;
    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  BOOL v22 = NSString;
  v23 = objc_msgSend_stringByDeletingLastPathComponent(v17, v19, v20, v21);
  objc_msgSend_stringWithFormat_(v22, v24, @"%@/%s", v25, v23, "Backup");
  uint64_t v26 = (NSString *)objc_claimAutoreleasedReturnValue();

  v30 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v27, v28, v29);
  int v33 = objc_msgSend_fileExistsAtPath_(v30, v31, (uint64_t)v26, v32);

  if (v33)
  {
    BOOL v34 = handleForCategory(0);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v49 = v26;
      _os_log_impl(&dword_21FBF2000, v34, OS_LOG_TYPE_DEFAULT, "%@ directory exists, deleting...", buf, 0xCu);
    }

    uint64_t v38 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v35, v36, v37);
    id v45 = v18;
    char v40 = objc_msgSend_removeItemAtPath_error_(v38, v39, (uint64_t)v26, (uint64_t)&v45);
    id v41 = v45;

    if (v40)
    {
      BOOL v42 = 1;
      id v18 = v41;
      if (!a3) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    v44 = handleForCategory(0);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_21FC61CB0();
    }
    id v18 = v41;
    goto LABEL_19;
  }
  BOOL v42 = 1;
  if (a3) {
LABEL_11:
  }
    *a3 = v18;
LABEL_12:

  return v42;
}

- (BOOL)syncFDRDataAtPath:(id)a3 toPath:(id)a4
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  id v77 = a3;
  id v79 = a4;
  uint64_t v98 = 0;
  v99 = &v98;
  uint64_t v100 = 0x3032000000;
  v101 = sub_21FC22B38;
  v102 = sub_21FC22B48;
  id v103 = (id)objc_opt_new();
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x3032000000;
  uint64_t v95 = sub_21FC22B38;
  v96 = sub_21FC22B48;
  id v97 = (id)objc_opt_new();
  uint64_t v8 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v5, v6, v7);
  v76 = objc_msgSend_contentsOfDirectoryAtPath_error_(v8, v9, (uint64_t)v79, 0);

  v91[0] = MEMORY[0x263EF8330];
  v91[1] = 3221225472;
  v91[2] = sub_21FC22B50;
  v91[3] = &unk_26452AA38;
  v91[4] = &v98;
  objc_msgSend_enumerateObjectsUsingBlock_(v76, v10, (uint64_t)v91, v11);
  long long v89 = 0u;
  long long v90 = 0u;
  long long v88 = 0u;
  long long v87 = 0u;
  id obj = (id)v99[5];
  id v13 = 0;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v87, (uint64_t)v109, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v88;
    while (2)
    {
      uint64_t v16 = 0;
      uint64_t v17 = v13;
      do
      {
        if (*(void *)v88 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v87 + 1) + 8 * v16);
        char v19 = (void *)MEMORY[0x223C5C2A0]();
        v23 = objc_msgSend_mutableCopy(v79, v20, v21, v22);
        objc_msgSend_appendString_(v23, v24, @"/", v25);
        objc_msgSend_appendString_(v23, v26, v18, v27);
        v31 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v28, v29, v30);
        id v86 = v17;
        int v33 = objc_msgSend_removeItemAtPath_error_(v31, v32, (uint64_t)v23, (uint64_t)&v86);
        id v13 = v86;

        if (v33)
        {
          BOOL v34 = handleForCategory(0);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v106 = v23;
            _os_log_debug_impl(&dword_21FBF2000, v34, OS_LOG_TYPE_DEBUG, "Successfully deleted: %@", buf, 0xCu);
          }
        }
        else
        {
          BOOL v34 = handleForCategory(0);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v106 = v23;
            __int16 v107 = 2112;
            id v108 = v13;
            _os_log_error_impl(&dword_21FBF2000, v34, OS_LOG_TYPE_ERROR, "Failed to delete file: %@ error: %@", buf, 0x16u);
          }
        }

        if (!v33)
        {
          LOBYTE(v71) = 0;
          goto LABEL_31;
        }
        ++v16;
        uint64_t v17 = v13;
      }
      while (v14 != v16);
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v87, (uint64_t)v109, 16);
      if (v14) {
        continue;
      }
      break;
    }
  }

  v39 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v36, v37, v38);
  char v75 = objc_msgSend_contentsOfDirectoryAtPath_error_(v39, v40, (uint64_t)v77, 0);

  v85[0] = MEMORY[0x263EF8330];
  v85[1] = 3221225472;
  v85[2] = sub_21FC22BB8;
  v85[3] = &unk_26452AA38;
  v85[4] = &v92;
  objc_msgSend_enumerateObjectsUsingBlock_(v75, v41, (uint64_t)v85, v42);
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = (id)v93[5];
  uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v81, (uint64_t)v104, 16);
  if (v44)
  {
    uint64_t v45 = *(void *)v82;
LABEL_16:
    uint64_t v46 = 0;
    id v47 = v13;
    while (1)
    {
      if (*(void *)v82 != v45) {
        objc_enumerationMutation(obj);
      }
      uint64_t v48 = *(void *)(*((void *)&v81 + 1) + 8 * v46);
      uint64_t v49 = (void *)MEMORY[0x223C5C2A0]();
      uint64_t v53 = objc_msgSend_mutableCopy(v77, v50, v51, v52);
      objc_msgSend_appendString_(v53, v54, @"/", v55);
      objc_msgSend_appendString_(v53, v56, v48, v57);
      uint64_t v61 = objc_msgSend_mutableCopy(v79, v58, v59, v60);
      objc_msgSend_appendString_(v61, v62, @"/", v63);
      objc_msgSend_appendString_(v61, v64, v48, v65);
      uint64_t v69 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v66, v67, v68);
      id v80 = v47;
      int v71 = objc_msgSend_copyItemAtPath_toPath_error_(v69, v70, (uint64_t)v53, (uint64_t)v61, &v80);
      id v13 = v80;

      if (v71)
      {
        v72 = handleForCategory(0);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v106 = v61;
          _os_log_debug_impl(&dword_21FBF2000, v72, OS_LOG_TYPE_DEBUG, "Successfully added: %@", buf, 0xCu);
        }
      }
      else
      {
        v72 = handleForCategory(0);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v106 = v53;
          __int16 v107 = 2112;
          id v108 = v13;
          _os_log_error_impl(&dword_21FBF2000, v72, OS_LOG_TYPE_ERROR, "Failed to add file: %@ error: %@", buf, 0x16u);
        }
      }

      if (!v71) {
        break;
      }
      ++v46;
      id v47 = v13;
      if (v44 == v46)
      {
        uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v73, (uint64_t)&v81, (uint64_t)v104, 16);
        LOBYTE(v71) = 1;
        if (v44) {
          goto LABEL_16;
        }
        break;
      }
    }
  }
  else
  {
    LOBYTE(v71) = 1;
  }
  v76 = v75;
LABEL_31:

  _Block_object_dispose(&v92, 8);
  _Block_object_dispose(&v98, 8);

  return v71;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->tmpFDRDataPathStr, 0);
  objc_storeStrong((id *)&self->alternativeFDRRealPathStr, 0);
  objc_storeStrong((id *)&self->alternativeFDRPathStr, 0);
  objc_storeStrong((id *)&self->defaultFDRPathStr, 0);
  objc_storeStrong((id *)&self->activeFDRDataPathStr, 0);
}

@end