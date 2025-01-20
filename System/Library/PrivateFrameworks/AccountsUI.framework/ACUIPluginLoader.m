@interface ACUIPluginLoader
+ (id)pluginBundleWithName:(id)a3;
@end

@implementation ACUIPluginLoader

+ (id)pluginBundleWithName:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v37 = (id)[MEMORY[0x1E4F28CB8] defaultManager];
  id v36 = (id)[v37 URLsForDirectory:5 inDomains:8];
  if (v36 && [v36 count])
  {
    id v32 = 0;
    id v31 = (id)[NSString stringWithFormat:@"PreferenceBundles/AccountSettings/%@", location[0]];
    memset(__b, 0, sizeof(__b));
    id obj = v36;
    uint64_t v17 = [obj countByEnumeratingWithState:__b objects:v43 count:16];
    if (v17)
    {
      uint64_t v13 = *(void *)__b[2];
      uint64_t v14 = 0;
      unint64_t v15 = v17;
      while (1)
      {
        uint64_t v12 = v14;
        if (*(void *)__b[2] != v13) {
          objc_enumerationMutation(obj);
        }
        id v30 = *(id *)(__b[1] + 8 * v14);
        id v28 = (id)[v30 URLByAppendingPathComponent:v31];
        id v27 = 0;
        id v26 = 0;
        id v25 = 0;
        uint64_t v3 = *MEMORY[0x1E4F1C628];
        id v24 = 0;
        char v11 = [v28 getResourceValue:&v25 forKey:v3 error:&v24];
        objc_storeStrong(&v27, v25);
        objc_storeStrong(&v26, v24);
        if (v11)
        {
          char v21 = 0;
          char v21 = [v27 BOOLValue] & 1;
          if (v21)
          {
            id v4 = (id)[MEMORY[0x1E4F28B50] bundleWithURL:v28];
            id v5 = v32;
            id v32 = v4;

            int v33 = v32 ? 2 : 0;
          }
          else
          {
            os_log_t v20 = (os_log_t)_ACUILogSystem();
            os_log_type_t v19 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              v8 = v20;
              __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v41, (uint64_t)"+[ACUIPluginLoader pluginBundleWithName:]", 56, (uint64_t)v28);
              _os_log_debug_impl(&dword_1DDFE5000, v8, v19, "%s (%d) \"Skipping file at %@ because it isn't a directory\"", v41, 0x1Cu);
            }
            objc_storeStrong((id *)&v20, 0);
            int v33 = 3;
          }
        }
        else
        {
          os_log_t oslog = (os_log_t)_ACUILogSystem();
          os_log_type_t v22 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            v9 = oslog;
            os_log_type_t v10 = v22;
            __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v42, (uint64_t)"+[ACUIPluginLoader pluginBundleWithName:]", 39, (uint64_t)v28, (uint64_t)v26);
            _os_log_error_impl(&dword_1DDFE5000, v9, v10, "%s (%d) \"Couldn't get value for the directory at %@: %@\"", v42, 0x26u);
          }
          objc_storeStrong((id *)&oslog, 0);
          int v33 = 3;
        }
        objc_storeStrong(&v26, 0);
        objc_storeStrong(&v27, 0);
        objc_storeStrong(&v28, 0);
        if (v33)
        {
          if (v33 != 3) {
            break;
          }
        }
        ++v14;
        if (v12 + 1 >= v15)
        {
          uint64_t v14 = 0;
          unint64_t v15 = [obj countByEnumeratingWithState:__b objects:v43 count:16];
          if (!v15) {
            goto LABEL_25;
          }
        }
      }
    }
    else
    {
LABEL_25:
      int v33 = 0;
    }

    if (!v32)
    {
      os_log_t v18 = (os_log_t)_ACUILogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v40, (uint64_t)"+[ACUIPluginLoader pluginBundleWithName:]", 67, (uint64_t)location[0]);
        _os_log_impl(&dword_1DDFE5000, v18, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Couldn't find plugin for %@\"", v40, 0x1Cu);
      }
      objc_storeStrong((id *)&v18, 0);
    }
    id v39 = v32;
    int v33 = 1;
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
  }
  else
  {
    id v35 = _ACUILogSystem();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v44, (uint64_t)"+[ACUIPluginLoader pluginBundleWithName:]", 27);
      _os_log_error_impl(&dword_1DDFE5000, (os_log_t)v35, type, "%s (%d) \"Couldn't find the system library directory to search for plugins.\"", v44, 0x12u);
    }
    objc_storeStrong(&v35, 0);
    id v39 = 0;
    int v33 = 1;
  }
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  v6 = v39;
  return v6;
}

@end