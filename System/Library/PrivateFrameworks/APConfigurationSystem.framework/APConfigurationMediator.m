@interface APConfigurationMediator
+ (NSString)configSystemDirectoryPath;
+ (NSString)resourcesBundleDirectoryPath;
+ (id)_configSystemErrorWithDescription:(id)a3;
+ (id)_loadFromDefaultsForClass:(Class)a3 error:(id *)a4;
+ (id)_loadFromJSONForClass:(Class)a3 error:(id *)a4;
+ (id)_resourcesBundleDirectoryPathError:(id *)a3;
+ (id)configurationForClass:(Class)a3;
+ (id)configurationForClass:(Class)a3 usingCache:(BOOL)a4;
+ (void)_removeFileAtPath:(id)a3;
@end

@implementation APConfigurationMediator

+ (id)_loadFromJSONForClass:(Class)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v7 = objc_msgSend_defaultManager(MEMORY[0x263F08850], a2, (uint64_t)a3);
  v10 = objc_msgSend_configSystemDirectoryPath(APConfigurationMediator, v8, v9);
  v13 = objc_msgSend_path(a3, v11, v12);
  v15 = objc_msgSend_stringByAppendingPathComponent_(v13, v14, @"ConfigurationNode.json");
  v17 = objc_msgSend_stringByAppendingPathComponent_(v10, v16, (uint64_t)v15);

  if (objc_msgSend_fileExistsAtPath_(v7, v18, (uint64_t)v17))
  {
    v21 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], v19, (uint64_t)v17);
    if (v21)
    {
      v22 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], v20, (uint64_t)v21, 0, 0);
      if (v22)
      {
        id v23 = [a3 alloc];
        v26 = objc_msgSend_sharedInstance(APConfigurationCache, v24, v25);
        v28 = objc_msgSend_initWithConfig_notifier_(v23, v27, (uint64_t)v22, v26);
      }
      else
      {
        v33 = APLogForCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138477827;
          id v39 = (id)objc_opt_class();
          id v37 = v39;
          _os_log_impl(&dword_24718C000, v33, OS_LOG_TYPE_ERROR, "[%{private}@]: Error parsing JSON file.", buf, 0xCu);
        }
        objc_msgSend__removeFileAtPath_(a1, v34, (uint64_t)v17);
        v28 = objc_msgSend__loadFromDefaultsForClass_error_(a1, v35, (uint64_t)a3, a4);
      }
    }
    else
    {
      v29 = APLogForCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        id v39 = (id)objc_opt_class();
        id v30 = v39;
        _os_log_impl(&dword_24718C000, v29, OS_LOG_TYPE_ERROR, "[%{private}@]: Error getting data for JSON", buf, 0xCu);
      }
      objc_msgSend__removeFileAtPath_(a1, v31, (uint64_t)v17);
      v28 = objc_msgSend__loadFromDefaultsForClass_error_(a1, v32, (uint64_t)a3, a4);
    }
  }
  else
  {
    v28 = objc_msgSend__loadFromDefaultsForClass_error_(a1, v19, (uint64_t)a3, a4);
  }

  return v28;
}

+ (id)configurationForClass:(Class)a3 usingCache:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v7 = objc_alloc_init(a3);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v25 = APLogForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v69 = (id)objc_opt_class();
      id v26 = v69;
      _os_log_impl(&dword_24718C000, v25, OS_LOG_TYPE_ERROR, "[%{private}@]: Error, class is not Subclass of APConfiguration", buf, 0xCu);
    }
    APSimulateCrash();
    v27 = [APConfiguration alloc];
    v11 = objc_msgSend_dictionary(NSDictionary, v28, v29);
    objc_msgSend_sharedInstance(APConfigurationCache, v30, v31);
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_initWithConfig_notifier_(v27, v33, (uint64_t)v11, v32);
    goto LABEL_19;
  }
  v11 = objc_msgSend_path(a3, v9, v10);
  if (!objc_msgSend_length(v11, v12, v13))
  {
    v54 = APLogForCategory();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      v55 = objc_opt_class();
      id v56 = v55;
      v57 = NSStringFromClass(a3);
      *(_DWORD *)buf = 138478083;
      id v69 = v55;
      __int16 v70 = 2113;
      v71 = v57;
      _os_log_impl(&dword_24718C000, v54, OS_LOG_TYPE_ERROR, "[%{private}@]: Error, getting path for class %{private}@", buf, 0x16u);
    }
    APSimulateCrash();
    id v58 = [a3 alloc];
    objc_msgSend_dictionary(NSDictionary, v59, v60);
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend_sharedInstance(APConfigurationCache, v61, v62);
    v21 = objc_msgSend_initWithConfig_notifier_(v58, v64, (uint64_t)v32, v63);

    goto LABEL_19;
  }
  if (v4)
  {
    v16 = objc_msgSend_sharedInstance(APConfigurationCache, v14, v15);
    v19 = objc_msgSend_path(a3, v17, v18);
    v21 = objc_msgSend_configurationForPath_(v16, v20, (uint64_t)v19);

    if (v21)
    {
      id v23 = objc_msgSend_sharedInstance(APConfigurationCache, v14, v22);
      objc_msgSend_recentlyAccessedObject_(v23, v24, (uint64_t)v21);

      goto LABEL_20;
    }
  }
  id v67 = 0;
  v21 = objc_msgSend__loadFromJSONForClass_error_(a1, v14, (uint64_t)a3, &v67);
  id v32 = v67;
  if (v32)
  {
    v36 = APLogForCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      id v37 = objc_opt_class();
      id v38 = v37;
      v41 = objc_msgSend_localizedFailureReason(v32, v39, v40);
      v44 = objc_msgSend_userInfo(v32, v42, v43);
      *(_DWORD *)buf = 138478339;
      id v69 = v37;
      __int16 v70 = 2113;
      v71 = v41;
      __int16 v72 = 2113;
      v73 = v44;
      _os_log_impl(&dword_24718C000, v36, OS_LOG_TYPE_ERROR, "[%{private}@]: Failed to load file, error: %{private}@ %{private}@", buf, 0x20u);
    }
    APSimulateCrash();
    id v45 = [a3 alloc];
    v48 = objc_msgSend_dictionary(NSDictionary, v46, v47);
    v51 = objc_msgSend_sharedInstance(APConfigurationCache, v49, v50);
    uint64_t v53 = objc_msgSend_initWithConfig_notifier_(v45, v52, (uint64_t)v48, v51);

    v21 = (void *)v53;
    goto LABEL_18;
  }
  if (v4)
  {
    v48 = objc_msgSend_sharedInstance(APConfigurationCache, v34, v35);
    objc_msgSend_setConfiguration_(v48, v65, (uint64_t)v21);
LABEL_18:
  }
LABEL_19:

LABEL_20:
  return v21;
}

+ (NSString)configSystemDirectoryPath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  v5 = objc_msgSend_lastObject(v2, v3, v4);

  v8 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v6, v7);
  v11 = objc_msgSend_bundleIdentifier(v8, v9, v10);

  uint64_t v13 = objc_msgSend_stringByAppendingPathComponent_(v5, v12, (uint64_t)v11);
  uint64_t v15 = objc_msgSend_stringByAppendingPathComponent_(v13, v14, @"APCS");

  return (NSString *)v15;
}

+ (NSString)resourcesBundleDirectoryPath
{
  uint64_t v4 = 0;
  v2 = objc_msgSend__resourcesBundleDirectoryPathError_(a1, a2, (uint64_t)&v4);
  return (NSString *)v2;
}

+ (id)configurationForClass:(Class)a3
{
  return (id)MEMORY[0x270F9A6D0](a1, sel_configurationForClass_usingCache_, a3);
}

+ (id)_resourcesBundleDirectoryPathError:(id *)a3
{
  v5 = objc_msgSend_bundleWithIdentifier_(MEMORY[0x263F086E0], a2, @"com.apple.ap.APConfigurationSystem");
  uint64_t v7 = v5;
  if (v5)
  {
    v8 = objc_msgSend_pathForResource_ofType_(v5, v6, @"APCS", &stru_26FB57F48);
    uint64_t v10 = v8;
    if (v8)
    {
      id v11 = v8;
    }
    else if (a3)
    {
      objc_msgSend__configSystemErrorWithDescription_(a1, v9, @"Error Loading Default Bundle: Unable to get path to resources.");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (a3)
  {
    objc_msgSend__configSystemErrorWithDescription_(a1, v6, @"Error Loading Default Bundle: Unable to get bundle.");
    uint64_t v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)_loadFromDefaultsForClass:(Class)a3 error:(id *)a4
{
  uint64_t v9 = objc_msgSend__resourcesBundleDirectoryPathError_(a1, a2, (uint64_t)a4);
  if (v9)
  {
    uint64_t v10 = objc_msgSend_path(a3, v7, v8);
    uint64_t v12 = objc_msgSend_stringByAppendingPathComponent_(v9, v11, (uint64_t)v10);
    v14 = objc_msgSend_stringByAppendingPathComponent_(v12, v13, @"ConfigurationNode.json");

    v17 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v15, v16);
    if (objc_msgSend_fileExistsAtPath_(v17, v18, (uint64_t)v14))
    {
      v21 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], v19, (uint64_t)v14);
      if (v21)
      {
        id v23 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], v20, (uint64_t)v21, 0, 0);
        if (v23)
        {
          id v24 = [a3 alloc];
          v27 = objc_msgSend_sharedInstance(APConfigurationCache, v25, v26);
          uint64_t v29 = objc_msgSend_initWithConfig_notifier_(v24, v28, (uint64_t)v23, v27);
        }
        else if (a4)
        {
          objc_msgSend__configSystemErrorWithDescription_(a1, v22, @"Error Loading Default Bundle: Dictionary for default node is nil.");
          uint64_t v29 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v29 = 0;
        }
      }
      else if (a4)
      {
        objc_msgSend__configSystemErrorWithDescription_(a1, v20, @"Error Loading Default Bundle: Data for default node is nil.");
        uint64_t v29 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v29 = 0;
      }
    }
    else if (a4)
    {
      objc_msgSend__configSystemErrorWithDescription_(a1, v19, @"Error Loading Default Bundle: JSON file for Node doesn't exist.");
      uint64_t v29 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v29 = 0;
    }
  }
  else
  {
    uint64_t v29 = 0;
  }

  return v29;
}

+ (id)_configSystemErrorWithDescription:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v3 = (objc_class *)MEMORY[0x263F087E8];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v11 = *MEMORY[0x263F08320];
  v12[0] = v4;
  uint64_t v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v6, (uint64_t)v12, &v11, 1);

  uint64_t v9 = objc_msgSend_initWithDomain_code_userInfo_(v5, v8, @"CPConfigSystem", 0, v7);
  return v9;
}

+ (void)_removeFileAtPath:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_defaultManager(v3, v5, v6);
  id v19 = 0;
  objc_msgSend_removeItemAtPath_error_(v7, v8, (uint64_t)v4, &v19);

  id v9 = v19;
  if (v9)
  {
    uint64_t v10 = APLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      id v12 = v11;
      uint64_t v15 = objc_msgSend_localizedFailureReason(v9, v13, v14);
      uint64_t v18 = objc_msgSend_userInfo(v9, v16, v17);
      *(_DWORD *)buf = 138478339;
      v21 = v11;
      __int16 v22 = 2113;
      id v23 = v15;
      __int16 v24 = 2113;
      uint64_t v25 = v18;
      _os_log_impl(&dword_24718C000, v10, OS_LOG_TYPE_ERROR, "[%{private}@]: Failed delete corrupted file, error: %{private}@ %{private}@", buf, 0x20u);
    }
  }
}

@end