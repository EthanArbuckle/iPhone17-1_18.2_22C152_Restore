@interface CKDBatchFetchUserPrivacySettingsOperation
+ (id)appPermissionGroupsFromContainerPrivacySettings:(id)a3;
- (BOOL)shouldCheckAppVersion;
- (NSArray)containerPrivacySettings;
- (id)activityCreate;
- (int)operationType;
- (void)main;
- (void)setContainerPrivacySettings:(id)a3;
@end

@implementation CKDBatchFetchUserPrivacySettingsOperation

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/batch-get-user-privacy-settings", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)shouldCheckAppVersion
{
  return 0;
}

- (int)operationType
{
  return 405;
}

- (void)main
{
  v3 = [CKDBatchFetchUserPrivacySettingsURLRequest alloc];
  v5 = objc_msgSend_initWithOperation_(v3, v4, (uint64_t)self);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v5);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = sub_1C4F33704;
  v15 = &unk_1E64F0170;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  objc_msgSend_setCompletionBlock_(v5, v6, (uint64_t)&v12);
  objc_msgSend_setRequest_(self, v7, (uint64_t)v5, v12, v13, v14, v15);
  v10 = objc_msgSend_container(self, v8, v9);
  objc_msgSend_performRequest_(v10, v11, (uint64_t)v5);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

+ (id)appPermissionGroupsFromContainerPrivacySettings:(id)a3
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  v100 = objc_opt_new();
  v5 = (void *)v4;
  v91 = objc_opt_new();
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  obuint64_t j = v3;
  uint64_t v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v117, v125, 16);
  if (v98)
  {
    uint64_t v96 = *(void *)v118;
    do
    {
      for (uint64_t i = 0; i != v98; ++i)
      {
        if (*(void *)v118 != v96) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v117 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend_containerID(v10, v7, v8);
        if (v12)
        {
          objc_msgSend_setObject_forKeyedSubscript_(v91, v11, (uint64_t)v10, v12);
          long long v115 = 0u;
          long long v116 = 0u;
          long long v113 = 0u;
          long long v114 = 0u;
          v15 = objc_msgSend_applicationBundleIDs(v10, v13, v14);
          uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v113, v124, 16);
          if (v17)
          {
            uint64_t v19 = v17;
            uint64_t v20 = *(void *)v114;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v114 != v20) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v22 = *(void *)(*((void *)&v113 + 1) + 8 * j);
                v24 = objc_msgSend_objectForKeyedSubscript_(v5, v18, v22);
                if (!v24)
                {
                  v24 = objc_opt_new();
                  objc_msgSend_setObject_forKeyedSubscript_(v5, v25, (uint64_t)v24, v22);
                }
                objc_msgSend_addObject_(v24, v23, (uint64_t)v12);
                v28 = objc_msgSend_objectForKeyedSubscript_(v100, v26, (uint64_t)v12);
                if (!v28)
                {
                  v28 = objc_opt_new();
                  objc_msgSend_setObject_forKeyedSubscript_(v100, v29, (uint64_t)v28, v12);
                }
                objc_msgSend_addObject_(v28, v27, v22);
              }
              uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v113, v124, 16);
            }
            while (v19);
          }
        }
      }
      uint64_t v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v117, v125, 16);
    }
    while (v98);
  }

  id v88 = (id)objc_opt_new();
  if (objc_msgSend_count(v5, v30, v31))
  {
    v92 = v5;
    do
    {
      v34 = objc_msgSend_allKeys(v5, v32, v33);
      uint64_t v37 = objc_msgSend_lastObject(v34, v35, v36);

      v38 = objc_opt_new();
      v39 = objc_opt_new();
      v97 = objc_opt_new();
      objc_msgSend_addObject_(v38, v40, v37);
      v89 = (void *)v37;
      objc_msgSend_addObject_(v39, v41, v37);
      if (objc_msgSend_count(v38, v42, v43))
      {
        uint64_t v45 = 0;
        do
        {
          uint64_t v94 = v45;
          v93 = objc_msgSend_objectAtIndexedSubscript_(v38, v44, v45);
          v47 = objc_msgSend_objectForKeyedSubscript_(v5, v46, (uint64_t)v93);
          long long v109 = 0u;
          long long v110 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          id v95 = v47;
          uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v48, (uint64_t)&v109, v123, 16);
          if (v49)
          {
            uint64_t v51 = v49;
            uint64_t v99 = *(void *)v110;
            do
            {
              for (uint64_t k = 0; k != v51; ++k)
              {
                if (*(void *)v110 != v99) {
                  objc_enumerationMutation(v95);
                }
                uint64_t v53 = *(void *)(*((void *)&v109 + 1) + 8 * k);
                v54 = objc_msgSend_objectForKeyedSubscript_(v100, v50, v53);
                long long v105 = 0u;
                long long v106 = 0u;
                long long v107 = 0u;
                long long v108 = 0u;
                uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v55, (uint64_t)&v105, v122, 16);
                if (v56)
                {
                  uint64_t v58 = v56;
                  uint64_t v59 = *(void *)v106;
                  do
                  {
                    for (uint64_t m = 0; m != v58; ++m)
                    {
                      if (*(void *)v106 != v59) {
                        objc_enumerationMutation(v54);
                      }
                      uint64_t v61 = *(void *)(*((void *)&v105 + 1) + 8 * m);
                      if ((objc_msgSend_containsObject_(v39, v57, v61) & 1) == 0)
                      {
                        objc_msgSend_addObject_(v38, v57, v61);
                        objc_msgSend_addObject_(v39, v62, v61);
                      }
                    }
                    uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v57, (uint64_t)&v105, v122, 16);
                  }
                  while (v58);
                }
                objc_msgSend_addObject_(v97, v57, v53);
                objc_msgSend_removeObjectForKey_(v100, v63, v53);
              }
              uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v50, (uint64_t)&v109, v123, 16);
            }
            while (v51);
          }
          v5 = v92;
          objc_msgSend_removeObjectForKey_(v92, v50, (uint64_t)v93);

          uint64_t v45 = v94 + 1;
        }
        while (v94 + 1 < (unint64_t)objc_msgSend_count(v38, v64, v65));
      }
      v66 = objc_opt_new();
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      id v67 = v97;
      uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v68, (uint64_t)&v101, v121, 16);
      if (v69)
      {
        uint64_t v71 = v69;
        uint64_t v72 = 0;
        uint64_t v73 = *(void *)v102;
        do
        {
          for (uint64_t n = 0; n != v71; ++n)
          {
            if (*(void *)v102 != v73) {
              objc_enumerationMutation(v67);
            }
            v75 = objc_msgSend_objectForKeyedSubscript_(v91, v70, *(void *)(*((void *)&v101 + 1) + 8 * n));
            if (objc_msgSend_discoverable(v75, v76, v77) == 1) {
              uint64_t v72 = 1;
            }
          }
          uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v70, (uint64_t)&v101, v121, 16);
        }
        while (v71);
      }
      else
      {
        uint64_t v72 = 0;
      }

      objc_msgSend_setEnabledPermissions_(v66, v78, v72);
      v81 = objc_msgSend_allObjects(v67, v79, v80);
      objc_msgSend_setContainerIDs_(v66, v82, (uint64_t)v81);

      objc_msgSend_setApplicationBundleIDs_(v66, v83, (uint64_t)v38);
      objc_msgSend_addObject_(v88, v84, (uint64_t)v66);

      v5 = v92;
    }
    while (objc_msgSend_count(v92, v85, v86));
  }

  return v88;
}

- (NSArray)containerPrivacySettings
{
  return self->_containerPrivacySettings;
}

- (void)setContainerPrivacySettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end