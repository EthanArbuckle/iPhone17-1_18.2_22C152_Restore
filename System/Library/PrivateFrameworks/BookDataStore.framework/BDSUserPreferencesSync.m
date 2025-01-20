@interface BDSUserPreferencesSync
+ (NSArray)syncedPreferenceKeys;
+ (id)objectFromGroupPreferencesForKey:(id)a3;
+ (void)copyChangedGroupPreferencesToLocalContainer;
+ (void)copyChangedLocalPreferencesToGroupContainer;
+ (void)copyChangedLocalPreferencesToGroupContainerWithAppSuiteName:(id)a3 container:(id)a4 groupName:(id)a5 groupContainer:(id)a6;
@end

@implementation BDSUserPreferencesSync

+ (NSArray)syncedPreferenceKeys
{
  if (qword_26AD77668 != -1) {
    dispatch_once(&qword_26AD77668, &unk_26E971F90);
  }
  v2 = (void *)qword_26AD77670;
  return (NSArray *)v2;
}

+ (id)objectFromGroupPreferencesForKey:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263EFFA40]);
  v12 = objc_msgSend_containerIdentifier(BDSAppGroupContainer, v5, v6, v7, v8, v9, v10, v11);
  v20 = objc_msgSend_containerURL(BDSAppGroupContainer, v13, v14, v15, v16, v17, v18, v19);
  v26 = objc_msgSend__initWithSuiteName_container_(v4, v21, (uint64_t)v12, (uint64_t)v20, v22, v23, v24, v25);

  v33 = objc_msgSend_stringByAppendingString_(@"watchSynced-", v27, (uint64_t)v3, v28, v29, v30, v31, v32);
  v40 = objc_msgSend_objectForKey_(v26, v34, (uint64_t)v33, v35, v36, v37, v38, v39);

  return v40;
}

+ (void)copyChangedGroupPreferencesToLocalContainer
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v11 = objc_msgSend_containerIdentifier(BDSAppGroupContainer, v4, v5, v6, v7, v8, v9, v10);
  uint64_t v19 = objc_msgSend_containerURL(BDSAppGroupContainer, v12, v13, v14, v15, v16, v17, v18);
  uint64_t v25 = objc_msgSend__initWithSuiteName_container_(v3, v20, (uint64_t)v11, (uint64_t)v19, v21, v22, v23, v24);

  v33 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v26, v27, v28, v29, v30, v31, v32);
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  objc_msgSend_syncedPreferenceKeys(a1, v34, v35, v36, v37, v38, v39, v40);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v89, (uint64_t)v99, 16, v42, v43, v44);
  if (v45)
  {
    uint64_t v53 = v45;
    uint64_t v54 = *(void *)v90;
    *(void *)&long long v52 = 138412290;
    long long v87 = v52;
    do
    {
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v90 != v54) {
          objc_enumerationMutation(obj);
        }
        uint64_t v56 = *(void *)(*((void *)&v89 + 1) + 8 * i);
        v57 = objc_msgSend_stringByAppendingString_(@"watchSynced-", v46, v56, v47, v48, v49, v50, v51, v87);
        v64 = objc_msgSend_objectForKey_(v25, v58, (uint64_t)v57, v59, v60, v61, v62, v63);
        v71 = objc_msgSend_objectForKey_(v33, v65, v56, v66, v67, v68, v69, v70);
        v78 = v71;
        if (v71) {
          BOOL v79 = 1;
        }
        else {
          BOOL v79 = v64 == 0;
        }
        if (v79 && (!v71 || (objc_msgSend_isEqual_(v71, v72, (uint64_t)v64, v73, v74, v75, v76, v77) & 1) != 0))
        {
          v80 = BDSCloudKitAudiobookLog();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v87;
            uint64_t v94 = v56;
            _os_log_impl(&dword_2360BC000, v80, OS_LOG_TYPE_INFO, "Preference %@ was unchanged", buf, 0xCu);
          }
        }
        else
        {
          v81 = BDSCloudKitAudiobookLog();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v94 = v56;
            __int16 v95 = 2112;
            v96 = v64;
            __int16 v97 = 2112;
            v98 = v78;
            _os_log_impl(&dword_2360BC000, v81, OS_LOG_TYPE_DEFAULT, "Synced preference %@ changed in group, copying value locally (new value %@, old value %@)", buf, 0x20u);
          }

          objc_msgSend_setObject_forKey_(v33, v82, (uint64_t)v64, v56, v83, v84, v85, v86);
        }
      }
      uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v46, (uint64_t)&v89, (uint64_t)v99, 16, v49, v50, v51);
    }
    while (v53);
  }
}

+ (void)copyChangedLocalPreferencesToGroupContainer
{
}

+ (void)copyChangedLocalPreferencesToGroupContainerWithAppSuiteName:(id)a3 container:(id)a4 groupName:(id)a5 groupContainer:(id)a6
{
  uint64_t v159 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = BDSCloudKitAudiobookLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v152 = (uint64_t)v10;
    __int16 v153 = 2112;
    id v154 = v11;
    __int16 v155 = 2112;
    id v156 = v12;
    __int16 v157 = 2112;
    id v158 = v13;
    _os_log_impl(&dword_2360BC000, v14, OS_LOG_TYPE_DEFAULT, "Checking local preferences with appSuite: %@ container: %@ groupName: %@ groupContainer: %@", buf, 0x2Au);
  }

  id v15 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v23 = v15;
  if (v12 && v13)
  {
    uint64_t v31 = objc_msgSend__initWithSuiteName_container_(v15, v16, (uint64_t)v12, (uint64_t)v13, v19, v20, v21, v22, v13, v12);
  }
  else
  {
    uint64_t v32 = objc_msgSend_containerIdentifier(BDSAppGroupContainer, v16, v17, v18, v19, v20, v21, v22, v13, v12);
    uint64_t v40 = objc_msgSend_containerURL(BDSAppGroupContainer, v33, v34, v35, v36, v37, v38, v39);
    uint64_t v31 = objc_msgSend__initWithSuiteName_container_(v23, v41, (uint64_t)v32, (uint64_t)v40, v42, v43, v44, v45);
  }
  v142 = v11;
  v143 = v10;
  if (v10 && v11)
  {
    id v46 = objc_alloc(MEMORY[0x263EFFA40]);
    uint64_t v52 = objc_msgSend__initWithSuiteName_container_(v46, v47, (uint64_t)v10, (uint64_t)v11, v48, v49, v50, v51);
  }
  else
  {
    uint64_t v52 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v24, v25, v26, v27, v28, v29, v30);
  }
  uint64_t v53 = (void *)v52;
  id v145 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  objc_msgSend_syncedPreferenceKeys(a1, v54, v55, v56, v57, v58, v59, v60);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v61, (uint64_t)&v146, (uint64_t)v150, 16, v62, v63, v64);
  if (v65)
  {
    uint64_t v72 = v65;
    uint64_t v73 = *(void *)v147;
    do
    {
      for (uint64_t i = 0; i != v72; ++i)
      {
        if (*(void *)v147 != v73) {
          objc_enumerationMutation(obj);
        }
        uint64_t v75 = *(void *)(*((void *)&v146 + 1) + 8 * i);
        uint64_t v76 = objc_msgSend_stringByAppendingString_(@"watchSynced-", v66, v75, v67, v68, v69, v70, v71);
        uint64_t v83 = objc_msgSend_objectForKey_(v31, v77, (uint64_t)v76, v78, v79, v80, v81, v82);
        long long v90 = objc_msgSend_objectForKey_(v53, v84, v75, v85, v86, v87, v88, v89);
        __int16 v97 = v90;
        if (v90) {
          BOOL v98 = 1;
        }
        else {
          BOOL v98 = v83 == 0;
        }
        if (v98 && (!v90 || (objc_msgSend_isEqual_(v90, v91, (uint64_t)v83, v92, v93, v94, v95, v96) & 1) != 0))
        {
          v99 = BDSCloudKitAudiobookLog();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v152 = v75;
            _os_log_impl(&dword_2360BC000, v99, OS_LOG_TYPE_INFO, "Preference %@ was unchanged", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v100 = BDSCloudKitAudiobookLog();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v152 = v75;
            __int16 v153 = 2112;
            id v154 = v97;
            __int16 v155 = 2112;
            id v156 = v83;
            _os_log_impl(&dword_2360BC000, v100, OS_LOG_TYPE_DEFAULT, "Synced preference %@ changed locally, copying value to group container (new value %@, old value %@)", buf, 0x20u);
          }

          objc_msgSend_setObject_forKey_(v31, v101, (uint64_t)v97, (uint64_t)v76, v102, v103, v104, v105);
          objc_msgSend_addObject_(v145, v106, (uint64_t)v76, v107, v108, v109, v110, v111);
        }
      }
      uint64_t v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v66, (uint64_t)&v146, (uint64_t)v150, 16, v69, v70, v71);
    }
    while (v72);
  }

  if (objc_msgSend_count(v145, v112, v113, v114, v115, v116, v117, v118))
  {
    v119 = BDSCloudKitAudiobookLog();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v152 = (uint64_t)v145;
      _os_log_impl(&dword_2360BC000, v119, OS_LOG_TYPE_INFO, "Updating npsManager with sync keys: %@", buf, 0xCu);
    }

    v127 = objc_msgSend_containerIdentifier(BDSAppGroupContainer, v120, v121, v122, v123, v124, v125, v126);
    v135 = objc_msgSend_containerIdentifier(BDSAppGroupContainer, v128, v129, v130, v131, v132, v133, v134);
    id v136 = objc_alloc_init(MEMORY[0x263F57528]);
    objc_msgSend_synchronizeUserDefaultsDomain_keys_container_appGroupContainer_(v136, v137, (uint64_t)v127, (uint64_t)v145, @"com.apple.iBooks", (uint64_t)v135, v138, v139);
  }
}

@end