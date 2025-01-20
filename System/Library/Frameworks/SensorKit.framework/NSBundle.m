@interface NSBundle
+ (void)sk_bundleWithIdentifier:(void *)a3 partnerAppDirectoryURL:;
- (uint64_t)sr_bundleTypeWithPartnerAppDirectoryURL:(void *)a1;
@end

@implementation NSBundle

+ (void)sk_bundleWithIdentifier:(void *)a3 partnerAppDirectoryURL:
{
  v35[2] = *MEMORY[0x263EF8340];
  self;
  if (_MergedGlobals_6 != -1) {
    dispatch_once(&_MergedGlobals_6, &__block_literal_global_7);
  }
  v5 = qword_26AB1A100;
  if (os_log_type_enabled((os_log_t)qword_26AB1A100, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v30 = (uint64_t)a2;
    _os_log_impl(&dword_21FCA3000, v5, OS_LOG_TYPE_INFO, "Looking for %{public}@ in LaunchServices", buf, 0xCu);
  }
  uint64_t v27 = 0;
  v6 = objc_msgSend(MEMORY[0x263F01878], "sr_applicationRecordWithIdentifier:error:", a2, &v27);
  if (!v6)
  {
    if (_MergedGlobals_6 != -1) {
      dispatch_once(&_MergedGlobals_6, &__block_literal_global_7);
    }
    v7 = qword_26AB1A100;
    if (os_log_type_enabled((os_log_t)qword_26AB1A100, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = (uint64_t)a2;
      __int16 v31 = 2114;
      uint64_t v32 = v27;
      _os_log_impl(&dword_21FCA3000, v7, OS_LOG_TYPE_DEFAULT, "No application record found for %{public}@ because %{public}@", buf, 0x16u);
    }
  }
  uint64_t v8 = objc_msgSend((id)objc_msgSend(v6, "URL"), "path");
  if (!v8)
  {
    if (_MergedGlobals_6 != -1) {
      dispatch_once(&_MergedGlobals_6, &__block_literal_global_7);
    }
    v9 = qword_26AB1A100;
    if (os_log_type_enabled((os_log_t)qword_26AB1A100, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = (uint64_t)a2;
      __int16 v31 = 2114;
      uint64_t v32 = (uint64_t)a3;
      _os_log_impl(&dword_21FCA3000, v9, OS_LOG_TYPE_INFO, "Searching for study bundle %{public}@ in %{public}@", buf, 0x16u);
    }
    uint64_t v10 = [a2 stringByAppendingPathExtension:@"bundle"];
    uint64_t v11 = [NSURL fileURLWithPath:v10 isDirectory:0 relativeToURL:a3];
    uint64_t v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleWithURL:", v11), "bundlePath");
    if (!v8)
    {
      if (_MergedGlobals_6 != -1) {
        dispatch_once(&_MergedGlobals_6, &__block_literal_global_7);
      }
      v17 = qword_26AB1A100;
      if (os_log_type_enabled((os_log_t)qword_26AB1A100, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v30 = (uint64_t)a2;
        __int16 v31 = 2114;
        uint64_t v32 = (uint64_t)a3;
        __int16 v33 = 2114;
        v34 = @"loadedStudies.plist";
        _os_log_impl(&dword_21FCA3000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ not found in %{public}@. Trying %{public}@", buf, 0x20u);
      }
      uint64_t v18 = [NSURL fileURLWithPath:@"loadedStudies.plist" isDirectory:0 relativeToURL:a3];
      if (_MergedGlobals_6 != -1) {
        dispatch_once(&_MergedGlobals_6, &__block_literal_global_7);
      }
      v19 = qword_26AB1A100;
      if (os_log_type_enabled((os_log_t)qword_26AB1A100, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v30 = (uint64_t)a2;
        __int16 v31 = 2114;
        uint64_t v32 = v18;
        _os_log_impl(&dword_21FCA3000, v19, OS_LOG_TYPE_INFO, "Searching for %{public}@ in plist %{public}@", buf, 0x16u);
      }
      if (v18)
      {
        uint64_t v28 = 0;
        v20 = (void *)[NSDictionary dictionaryWithContentsOfURL:v18 error:&v28];
        if (v28)
        {
          if (_MergedGlobals_6 != -1) {
            dispatch_once(&_MergedGlobals_6, &__block_literal_global_7);
          }
          v21 = qword_26AB1A100;
          if (!os_log_type_enabled((os_log_t)qword_26AB1A100, OS_LOG_TYPE_ERROR)) {
            goto LABEL_17;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v30 = v18;
          v22 = "Error creating dictionary from %{public}@";
        }
        else
        {
          v23 = objc_msgSend((id)objc_msgSend(v20, "objectForKeyedSubscript:", @"studies"), "objectForKeyedSubscript:", a2);
          if (!v23)
          {
            if (_MergedGlobals_6 != -1) {
              dispatch_once(&_MergedGlobals_6, &__block_literal_global_7);
            }
            v26 = qword_26AB1A100;
            if (os_log_type_enabled((os_log_t)qword_26AB1A100, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v30 = (uint64_t)a2;
              __int16 v31 = 2114;
              uint64_t v32 = v18;
              _os_log_impl(&dword_21FCA3000, v26, OS_LOG_TYPE_DEFAULT, "No %{public}@ was found in %{public}@", buf, 0x16u);
            }
            goto LABEL_17;
          }
          uint64_t v24 = [(id)objc_msgSend(NSString stringWithFormat:@"%@-v%@", a2, objc_msgSend(v23, "stringValue")), "stringByAppendingPathExtension:", @"bundle"];
          v25 = NSString;
          v35[0] = [a3 path];
          v35[1] = v24;
          uint64_t v8 = objc_msgSend(v25, "pathWithComponents:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v35, 2));
          if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:", v8))
          {
            if (!v8) {
              goto LABEL_17;
            }
            goto LABEL_16;
          }
          if (_MergedGlobals_6 != -1) {
            dispatch_once(&_MergedGlobals_6, &__block_literal_global_7);
          }
          v21 = qword_26AB1A100;
          if (!os_log_type_enabled((os_log_t)qword_26AB1A100, OS_LOG_TYPE_ERROR)) {
            goto LABEL_17;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v30 = v8;
          v22 = "Failed to locate bundle %{public}@";
        }
      }
      else
      {
        if (_MergedGlobals_6 != -1) {
          dispatch_once(&_MergedGlobals_6, &__block_literal_global_7);
        }
        v21 = qword_26AB1A100;
        if (!os_log_type_enabled((os_log_t)qword_26AB1A100, OS_LOG_TYPE_ERROR)) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 138543362;
        uint64_t v30 = 0;
        v22 = "Failed to location %{public}@";
      }
      _os_log_error_impl(&dword_21FCA3000, v21, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);
      goto LABEL_17;
    }
  }
LABEL_16:
  v12 = (void *)[MEMORY[0x263F086E0] bundleWithPath:v8];
  if (v12)
  {
LABEL_18:
    if (_MergedGlobals_6 != -1) {
      dispatch_once(&_MergedGlobals_6, &__block_literal_global_7);
    }
    v13 = qword_26AB1A100;
    if (os_log_type_enabled((os_log_t)qword_26AB1A100, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [v12 bundleURL];
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = (uint64_t)a2;
      __int16 v31 = 2114;
      uint64_t v32 = v14;
      _os_log_impl(&dword_21FCA3000, v13, OS_LOG_TYPE_INFO, "Found bundle for %{public}@ at %{public}@", buf, 0x16u);
    }
    return v12;
  }
LABEL_17:
  v12 = (void *)[MEMORY[0x263F086E0] bundleWithIdentifier:a2];
  if (v12) {
    goto LABEL_18;
  }
  if (_MergedGlobals_6 != -1) {
    dispatch_once(&_MergedGlobals_6, &__block_literal_global_7);
  }
  v15 = qword_26AB1A100;
  if (os_log_type_enabled((os_log_t)qword_26AB1A100, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v30 = (uint64_t)a2;
    _os_log_error_impl(&dword_21FCA3000, v15, OS_LOG_TYPE_ERROR, "Failed to find bundle for %{public}@", buf, 0xCu);
  }
  return 0;
}

uint64_t __51__NSBundle_SensorKitPrivate__sk_requiredCategories__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = isValidString(a2);
  if (result)
  {
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      v7 = (void *)[a3 objectForKeyedSubscript:@"Required"];
      objc_opt_class();
      uint64_t result = objc_opt_isKindOfClass();
      if (result)
      {
        uint64_t result = [v7 BOOLValue];
        if (result)
        {
          uint64_t v8 = *(void **)(a1 + 32);
          return [v8 addObject:a2];
        }
      }
    }
  }
  return result;
}

uint64_t __61__NSBundle_SensorKitPrivate__sk_perCategoryDetailDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = isValidString(a2);
  if (result)
  {
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      v7 = (void *)[a3 objectForKeyedSubscript:@"Description"];
      uint64_t v8 = [*(id *)(a1 + 32) objectForInfoDictionaryKey:v7];
      if (v8) {
        v7 = (void *)v8;
      }
      uint64_t result = isValidString(v7);
      if (result)
      {
        v9 = *(void **)(a1 + 40);
        return [v9 setObject:v7 forKeyedSubscript:a2];
      }
    }
  }
  return result;
}

- (uint64_t)sr_bundleTypeWithPartnerAppDirectoryURL:(void *)a1
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  uint64_t v15 = 0;
  if ([a1 bundleIdentifier])
  {
    if (objc_msgSend(MEMORY[0x263F01878], "sr_applicationRecordWithIdentifier:error:", objc_msgSend(a1, "bundleIdentifier"), &v15))
    {
      if (_MergedGlobals_6 != -1) {
        dispatch_once(&_MergedGlobals_6, &__block_literal_global_7);
      }
      v4 = qword_26AB1A100;
      if (os_log_type_enabled((os_log_t)qword_26AB1A100, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = [a1 bundleIdentifier];
        *(_DWORD *)buf = 138543362;
        uint64_t v17 = v5;
        _os_log_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_INFO, "Detected %{public}@ as app bundle type", buf, 0xCu);
      }
      return 2;
    }
    if (_MergedGlobals_6 != -1) {
      dispatch_once(&_MergedGlobals_6, &__block_literal_global_7);
    }
    uint64_t v8 = qword_26AB1A100;
    if (os_log_type_enabled((os_log_t)qword_26AB1A100, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [a1 bundleIdentifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      uint64_t v19 = v15;
      _os_log_impl(&dword_21FCA3000, v8, OS_LOG_TYPE_DEFAULT, "No application record found for %{public}@ because %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (_MergedGlobals_6 != -1) {
      dispatch_once(&_MergedGlobals_6, &__block_literal_global_7);
    }
    v7 = qword_26AB1A100;
    if (os_log_type_enabled((os_log_t)qword_26AB1A100, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = [a1 bundleURL];
      _os_log_error_impl(&dword_21FCA3000, v7, OS_LOG_TYPE_ERROR, "No bundle identifier found for bundle URL: %{public}@", buf, 0xCu);
    }
  }
  if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(NSURL, "fileURLWithPath:isDirectory:relativeToURL:", objc_msgSend((id)objc_msgSend(a1, "bundleURL"), "lastPathComponent"), 1, a2), "path"), "isEqualToString:", objc_msgSend((id)objc_msgSend(a1, "bundleURL"), "path")))
  {
    if (_MergedGlobals_6 != -1) {
      dispatch_once(&_MergedGlobals_6, &__block_literal_global_7);
    }
    v12 = qword_26AB1A100;
    if (os_log_type_enabled((os_log_t)qword_26AB1A100, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [a1 bundleIdentifier];
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v14;
      _os_log_error_impl(&dword_21FCA3000, v12, OS_LOG_TYPE_ERROR, "Failed to detect a bundle type for %{public}@", buf, 0xCu);
    }
    return 0;
  }
  if (_MergedGlobals_6 != -1) {
    dispatch_once(&_MergedGlobals_6, &__block_literal_global_7);
  }
  uint64_t v10 = qword_26AB1A100;
  uint64_t v6 = 1;
  if (os_log_type_enabled((os_log_t)qword_26AB1A100, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = [a1 bundleIdentifier];
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v11;
    uint64_t v6 = 1;
    _os_log_impl(&dword_21FCA3000, v10, OS_LOG_TYPE_INFO, "Detected %{public}@ as study bundle type", buf, 0xCu);
  }
  return v6;
}

@end