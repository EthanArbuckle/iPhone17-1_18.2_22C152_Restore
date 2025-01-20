@interface CKDPackageDirectoryPurger
+ (id)sharedPurger;
+ (void)schedulePeriodicPurgesInDirectory:(id)a3;
- (NSMutableArray)rootDirectories;
- (OS_dispatch_queue)queue;
- (id)initInternal;
- (void)addRootDirectory:(id)a3;
- (void)purgeAll;
- (void)purgeDirectory:(id)a3;
- (void)purgeRootDirectory:(id)a3;
- (void)registerXPCActivity;
@end

@implementation CKDPackageDirectoryPurger

- (id)initInternal
{
  v10.receiver = self;
  v10.super_class = (Class)CKDPackageDirectoryPurger;
  v2 = [(CKDPackageDirectoryPurger *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.cloudkit.packagepurger", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    rootDirectories = v2->_rootDirectories;
    v2->_rootDirectories = v7;
  }
  return v2;
}

- (void)registerXPCActivity
{
  if (qword_1EBBCDCD0 != -1) {
    dispatch_once(&qword_1EBBCDCD0, &unk_1F20438B0);
  }
}

- (void)purgeAll
{
  objc_initWeak(&location, self);
  dispatch_queue_t v5 = objc_msgSend_queue(self, v3, v4);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1C4E9CD2C;
  v6[3] = &unk_1E64F09E0;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)purgeDirectory:(id)a3
{
}

- (void)purgeRootDirectory:(id)a3
{
  v80[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v6 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v4, v5);
  uint64_t v7 = *MEMORY[0x1E4F1C6E8];
  uint64_t v8 = *MEMORY[0x1E4F1C628];
  v80[0] = *MEMORY[0x1E4F1C6E8];
  v80[1] = v8;
  uint64_t v63 = v8;
  uint64_t v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)v80, 2);
  v59 = v3;
  v12 = objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E4F1CB10], v11, (uint64_t)v3, 1);
  v57 = (void *)v10;
  v58 = v6;
  v14 = objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v6, v13, (uint64_t)v12, v10, 0, &unk_1F2043910);

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v15 = v14;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v69, v79, 16);
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v70;
    uint64_t v61 = *MEMORY[0x1E4F1A648];
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v70 != v20) {
          objc_enumerationMutation(v15);
        }
        v22 = *(void **)(*((void *)&v69 + 1) + 8 * v21);
        id v67 = 0;
        id v68 = 0;
        int ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v22, v18, (uint64_t)&v68, v7, &v67);
        id v24 = v68;
        id v25 = v67;
        v27 = v25;
        if (!ResourceValue_forKey_error)
        {
          v48 = 0;
          id v33 = v25;
LABEL_23:
          if (*MEMORY[0x1E4F1A550] != -1) {
            dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
          }
          v49 = (void *)*MEMORY[0x1E4F1A500];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
          {
            v50 = v49;
            v53 = objc_msgSend_CKSanitizedPath(v22, v51, v52);
            *(_DWORD *)buf = 138412802;
            v74 = v59;
            __int16 v75 = 2112;
            v76 = v53;
            __int16 v77 = 2112;
            id v78 = v33;
            _os_log_error_impl(&dword_1C4CFF000, v50, OS_LOG_TYPE_ERROR, "Error enumerating %@ for package purges, failed to get the resource value at %@: %@", buf, 0x20u);
          }
          goto LABEL_30;
        }
        uint64_t v28 = v19;
        uint64_t v29 = v20;
        uint64_t v30 = v7;
        id v31 = v15;
        id v65 = 0;
        id v66 = 0;
        char v32 = objc_msgSend_getResourceValue_forKey_error_(v22, v26, (uint64_t)&v66, v63, &v65);
        id v64 = v66;
        id v33 = v65;

        if ((v32 & 1) == 0)
        {
          id v15 = v31;
          uint64_t v7 = v30;
          uint64_t v20 = v29;
          uint64_t v19 = v28;
          v48 = v64;
          goto LABEL_23;
        }
        id v15 = v31;
        if (v24)
        {
          if (!v64)
          {
            uint64_t v7 = v30;
            uint64_t v20 = v29;
            uint64_t v19 = v28;
            v48 = 0;
            goto LABEL_30;
          }
          char v62 = objc_msgSend_BOOLValue(v64, v34, v35);
          uint64_t v7 = v30;
          uint64_t v20 = v29;
          uint64_t v19 = v28;
          if ((objc_msgSend_isEqualToString_(v24, v36, v61) & 1) != 0
            || objc_msgSend_isEqualToString_(v24, v37, @"com.apple.cloudkit.UploadPackages"))
          {
            if ((v62 & 1) == 0)
            {
              v54 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v37, v38);
              objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v54, v55, (uint64_t)a2, self, @"CKDPackageDirectoryPurger.m", 103, @"Expected: %@ to be a directory", v22);
            }
            if (*MEMORY[0x1E4F1A550] != -1) {
              dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
            }
            v39 = *MEMORY[0x1E4F1A500];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v74 = v22;
              _os_log_debug_impl(&dword_1C4CFF000, v39, OS_LOG_TYPE_DEBUG, "Purging packages in: %@", buf, 0xCu);
            }
            v42 = objc_msgSend_path(v22, v40, v41);
            objc_msgSend_purgeDirectory_(self, v43, (uint64_t)v42);

            objc_msgSend_skipDescendants(v15, v44, v45);
          }
          if ((unint64_t)objc_msgSend_level(v15, v37, v38) >= 3) {
            objc_msgSend_skipDescendants(v15, v46, v47);
          }
        }
        else
        {
          uint64_t v7 = v30;
          uint64_t v20 = v29;
          uint64_t v19 = v28;
        }
        v48 = v64;
LABEL_30:

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v69, v79, 16);
    }
    while (v19);
  }
}

- (void)addRootDirectory:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v7 = objc_msgSend_queue(self, v5, v6);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4E9D4C4;
  block[3] = &unk_1E64F0A08;
  id v8 = v4;
  id v12 = v8;
  objc_copyWeak(&v13, &location);
  dispatch_async(v7, block);

  objc_msgSend_purgeAll(self, v9, v10);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
}

+ (id)sharedPurger
{
  if (qword_1EBBCFD08 != -1) {
    dispatch_once(&qword_1EBBCFD08, &unk_1F2043930);
  }
  v2 = (void *)qword_1EBBCFD10;
  return v2;
}

+ (void)schedulePeriodicPurgesInDirectory:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  objc_msgSend_sharedPurger(v4, v5, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addRootDirectory_(v8, v7, (uint64_t)v3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableArray)rootDirectories
{
  return self->_rootDirectories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootDirectories, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end