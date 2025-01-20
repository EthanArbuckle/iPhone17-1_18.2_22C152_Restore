@interface CKDirectoryPurger
+ (void)purgeDirectoryAtURL:(id)a3;
- (CKDirectoryPurger)initWithDirectoryURLs:(id)a3;
- (NSArray)urls;
- (id)shouldRemoveFileBlock;
- (id)shouldSkipFileBlock;
- (void)purge;
- (void)setShouldRemoveFileBlock:(id)a3;
- (void)setShouldSkipFileBlock:(id)a3;
@end

@implementation CKDirectoryPurger

+ (void)purgeDirectoryAtURL:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = a3;
    v4 = [CKDirectoryPurger alloc];
    v15[0] = v3;
    v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v15, 1);

    v9 = objc_msgSend_initWithDirectoryURLs_(v4, v7, (uint64_t)v6, v8);
    objc_msgSend_setShouldRemoveFileBlock_(v9, v10, (uint64_t)&unk_1ED7EF318, v11);
    objc_msgSend_purge(v9, v12, v13, v14);
  }
}

- (CKDirectoryPurger)initWithDirectoryURLs:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKDirectoryPurger;
  uint64_t v8 = [(CKDirectoryPurger *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_CKDeepCopy(v4, v5, v6, v7);
    urls = v8->_urls;
    v8->_urls = (NSArray *)v9;
  }
  return v8;
}

- (void)purge
{
  v141[3] = *MEMORY[0x1E4F143B8];
  objc_msgSend_shouldSkipFileBlock(self, a2, v2, v3);
  v108 = (unsigned int (**)(void))objc_claimAutoreleasedReturnValue();
  objc_msgSend_shouldRemoveFileBlock(self, v5, v6, v7);
  v107 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v8, v9, v10);
  uint64_t v11 = *MEMORY[0x1E4F1C628];
  uint64_t v113 = *MEMORY[0x1E4F1C6E8];
  v141[0] = *MEMORY[0x1E4F1C6E8];
  v141[1] = v11;
  uint64_t v111 = v11;
  uint64_t v110 = *MEMORY[0x1E4F1C540];
  v141[2] = *MEMORY[0x1E4F1C540];
  v100 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)v141, 3);
  id v103 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  objc_msgSend_setDateFormat_(v103, v13, @"yyyy-MM-dd HH:mm:ss", v14);
  long long v127 = 0u;
  long long v128 = 0u;
  long long v126 = 0u;
  long long v125 = 0u;
  objc_msgSend_urls(self, v15, v16, v17);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v125, (uint64_t)v140, 16);
  if (v101)
  {
    uint64_t v99 = *(void *)v126;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v126 != v99) {
          objc_enumerationMutation(obj);
        }
        uint64_t v102 = v20;
        v21 = objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v104, v19, *(void *)(*((void *)&v125 + 1) + 8 * v20), (uint64_t)v100, 0, &unk_1ED7F0778);
        long long v121 = 0u;
        long long v122 = 0u;
        long long v123 = 0u;
        long long v124 = 0u;
        id v112 = v21;
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v121, (uint64_t)v139, 16);
        if (v23)
        {
          uint64_t v25 = v23;
          uint64_t v26 = *(void *)v122;
          do
          {
            uint64_t v27 = 0;
            do
            {
              if (*(void *)v122 != v26) {
                objc_enumerationMutation(v112);
              }
              v28 = *(void **)(*((void *)&v121 + 1) + 8 * v27);
              id v119 = 0;
              id v120 = 0;
              int ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v28, v24, (uint64_t)&v120, v113, &v119);
              id v30 = v120;
              os_log_t v32 = (os_log_t)v119;
              if (!ResourceValue_forKey_error)
              {
                id v38 = 0;
                id v34 = 0;
                goto LABEL_29;
              }
              id v117 = 0;
              id v118 = 0;
              int v33 = objc_msgSend_getResourceValue_forKey_error_(v28, v31, (uint64_t)&v118, v111, &v117);
              id v34 = v118;
              v35 = v117;

              if (!v33)
              {
                id v38 = 0;
                os_log_t v32 = v35;
LABEL_29:
                if (ck_log_initialization_predicate != -1) {
                  dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
                }
                v66 = (void *)ck_log_facility_ck;
                if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
                {
                  v67 = v66;
                  v71 = objc_msgSend_CKSanitizedPath(v28, v68, v69, v70);
                  *(_DWORD *)buf = 138543618;
                  v130 = v71;
                  __int16 v131 = 2112;
                  os_log_t v132 = v32;
                  v72 = v67;
                  v73 = "Warn: Failed to get the resource value at %{public}@: %@";
LABEL_33:
                  _os_log_impl(&dword_18AF10000, v72, OS_LOG_TYPE_INFO, v73, buf, 0x16u);

                  goto LABEL_34;
                }
                goto LABEL_34;
              }
              id v115 = 0;
              id v116 = 0;
              char v37 = objc_msgSend_getResourceValue_forKey_error_(v28, v36, (uint64_t)&v116, v110, &v115);
              id v38 = v116;
              os_log_t v32 = (os_log_t)v115;

              if ((v37 & 1) == 0) {
                goto LABEL_29;
              }
              if (v30 && v34 && v38)
              {
                uint64_t v42 = objc_msgSend_level(v112, v39, v40, v41);
                v46 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v43, v44, v45);
                objc_msgSend_timeIntervalSinceDate_(v46, v47, (uint64_t)v38, v48);
                double v50 = v49;

                int v54 = objc_msgSend_BOOLValue(v34, v51, v52, v53);
                uint64_t v109 = v42;
                if (v108 && v108[2]())
                {
                  if (v54) {
                    objc_msgSend_skipDescendants(v112, v55, v56, v57);
                  }
                  if (ck_log_initialization_predicate != -1) {
                    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
                  }
                  v58 = (void *)ck_log_facility_ck;
                  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
                  {
                    log = v58;
                    v64 = objc_msgSend_path(v28, v59, v60, v61);
                    if (v54) {
                      v65 = @"d";
                    }
                    else {
                      v65 = @"f";
                    }
LABEL_55:
                    v92 = objc_msgSend_stringFromDate_(v103, v62, (uint64_t)v38, v63);
                    *(_DWORD *)buf = 138544386;
                    v130 = v64;
                    __int16 v131 = 2114;
                    os_log_t v132 = (os_log_t)v65;
                    __int16 v133 = 2048;
                    uint64_t v134 = v109;
                    __int16 v135 = 2114;
                    v136 = v92;
                    __int16 v137 = 2048;
                    uint64_t v138 = (uint64_t)v50;
                    _os_log_debug_impl(&dword_18AF10000, log, OS_LOG_TYPE_DEBUG, "Skipped %{public}@, %{public}@/%lu, creationDate:\"%{public}@\" (%llds)", buf, 0x34u);
                  }
                }
                else if (v107 && (v107[2]() & 1) != 0)
                {
                  if (v54) {
                    objc_msgSend_skipDescendants(v112, v74, v75, v76);
                  }
                  os_log_t v114 = v32;
                  char v77 = objc_msgSend_removeItemAtURL_error_(v104, v74, (uint64_t)v28, (uint64_t)&v114);
                  os_log_t loga = v114;

                  if (v77)
                  {
                    if (ck_log_initialization_predicate != -1) {
                      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
                    }
                    v78 = (void *)ck_log_facility_ck;
                    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
                    {
                      v79 = v78;
                      v85 = objc_msgSend_path(v28, v80, v81, v82);
                      if (v54) {
                        v86 = @"d";
                      }
                      else {
                        v86 = @"f";
                      }
                      v87 = objc_msgSend_stringFromDate_(v103, v83, (uint64_t)v38, v84);
                      *(_DWORD *)buf = 138544386;
                      v130 = v85;
                      __int16 v131 = 2114;
                      os_log_t v132 = (os_log_t)v86;
                      __int16 v133 = 2048;
                      uint64_t v134 = v109;
                      __int16 v135 = 2114;
                      v136 = v87;
                      __int16 v137 = 2048;
                      uint64_t v138 = (uint64_t)v50;
                      _os_log_impl(&dword_18AF10000, v79, OS_LOG_TYPE_INFO, "Removed %{public}@, %{public}@/%lu, creationDate:\"%{public}@\" (%llds)", buf, 0x34u);
                    }
                    os_log_t v32 = loga;
                  }
                  else
                  {
                    if (ck_log_initialization_predicate != -1) {
                      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
                    }
                    os_log_t v32 = loga;
                    v93 = (void *)ck_log_facility_ck;
                    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
                    {
                      v67 = v93;
                      v71 = objc_msgSend_CKSanitizedPath(v28, v94, v95, v96);
                      *(_DWORD *)buf = 138543618;
                      v130 = v71;
                      __int16 v131 = 2112;
                      os_log_t v132 = loga;
                      v72 = v67;
                      v73 = "Warn: Failed to remove %{public}@: %@";
                      goto LABEL_33;
                    }
                  }
                }
                else
                {
                  if (ck_log_initialization_predicate != -1) {
                    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
                  }
                  v88 = (void *)ck_log_facility_ck;
                  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
                  {
                    log = v88;
                    v64 = objc_msgSend_path(v28, v89, v90, v91);
                    if (v54) {
                      v65 = @"d";
                    }
                    else {
                      v65 = @"f";
                    }
                    goto LABEL_55;
                  }
                }
              }
LABEL_34:

              ++v27;
            }
            while (v25 != v27);
            uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v112, v24, (uint64_t)&v121, (uint64_t)v139, 16);
            uint64_t v25 = v97;
          }
          while (v97);
        }

        uint64_t v20 = v102 + 1;
      }
      while (v102 + 1 != v101);
      uint64_t v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v125, (uint64_t)v140, 16);
    }
    while (v101);
  }
}

- (id)shouldSkipFileBlock
{
  return self->_shouldSkipFileBlock;
}

- (void)setShouldSkipFileBlock:(id)a3
{
}

- (id)shouldRemoveFileBlock
{
  return self->_shouldRemoveFileBlock;
}

- (void)setShouldRemoveFileBlock:(id)a3
{
}

- (NSArray)urls
{
  return self->_urls;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong(&self->_shouldRemoveFileBlock, 0);

  objc_storeStrong(&self->_shouldSkipFileBlock, 0);
}

@end