@interface NSURL(UTIAdditions)
+ (id)__is_coreTypesURL;
- (BOOL)__is__conformsToUTI:()UTIAdditions;
- (BOOL)__is__getResourceValue:()UTIAdditions forKey:error:;
- (BOOL)__is_hasFileExtension:()UTIAdditions;
- (CFDictionaryRef)__is_resourceValuesForKeys:()UTIAdditions error:;
- (id)__is_typeIdentifier;
- (id)__is_volumeURL;
- (uint64_t)__has_ResourceFork;
- (uint64_t)__is__isAliasFile;
- (uint64_t)__is__isDirectory;
- (uint64_t)__is__isPackage;
- (uint64_t)__is__isSymLink;
- (uint64_t)__is__isVolume;
- (uint64_t)__is_accessFlags;
- (uint64_t)__is_fileExists;
- (uint64_t)__is_isAppExtension;
- (uint64_t)__is_isApplication;
- (uint64_t)__is_isBootVolume;
- (uint64_t)__is_isBundleWithUnregisteredPersonality;
- (uint64_t)__is_isOnBootVolume;
- (uint64_t)__is_locked;
@end

@implementation NSURL(UTIAdditions)

- (BOOL)__is__getResourceValue:()UTIAdditions forKey:error:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v8 = a4;
  v9 = +[ISDefaults sharedInstance];
  int v10 = [v9 logMissingURLCacheProperties];

  if (!v10)
  {
    id propertyValueTypeRefPtr = 0;
    *(void *)error = 0;
    goto LABEL_5;
  }
  id propertyValueTypeRefPtr = 0;
  if (_CFURLCopyResourcePropertyForKeyFromCache())
  {
    *a3 = propertyValueTypeRefPtr;
LABEL_11:
    BOOL v12 = 1;
    goto LABEL_12;
  }
  v14 = +[ISURLResourcePropertySpecification sharedInstance];
  v15 = [v14 allowedMissingProperties];
  char v16 = [v15 containsObject:v8];

  if (v16) {
    goto LABEL_11;
  }
  if ([(__CFURL *)a1 isFileReferenceURL])
  {
    v30 = 0;
    CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x1E4F1C700], &v30, 0);
    v18 = v30;
    if (!v30)
    {
      v18 = [(__CFURL *)a1 path];
    }
    v19 = _ISURLCacheLog();
    os_signpost_id_t v20 = os_signpost_id_make_with_pointer(v19, a1);

    if (v20)
    {
      v21 = _ISURLCacheLog();
      BOOL v22 = os_signpost_enabled(v21);

      if (v22)
      {
        v23 = _ISURLCacheLog();
        v24 = v23;
        if (v20 != -1 && os_signpost_enabled(v23))
        {
          *(_DWORD *)error = 138412802;
          *(void *)&error[4] = a1;
          __int16 v33 = 2112;
          v34 = v18;
          __int16 v35 = 2112;
          v36 = v8;
          _os_signpost_emit_with_name_impl(&dword_1AE771000, v24, OS_SIGNPOST_EVENT, v20, "cache miss", "URL %@ path %@ was missing expected cached values for key: %@", error, 0x20u);
        }
      }
    }
  }
  else
  {
    v25 = _ISURLCacheLog();
    os_signpost_id_t v26 = os_signpost_id_make_with_pointer(v25, a1);

    if (!v26) {
      goto LABEL_28;
    }
    v27 = _ISURLCacheLog();
    BOOL v28 = os_signpost_enabled(v27);

    if (!v28) {
      goto LABEL_28;
    }
    v29 = _ISURLCacheLog();
    v18 = v29;
    if (v26 != -1 && os_signpost_enabled(v29))
    {
      *(_DWORD *)error = 138412546;
      *(void *)&error[4] = a1;
      __int16 v33 = 2112;
      v34 = v8;
      _os_signpost_emit_with_name_impl(&dword_1AE771000, v18, OS_SIGNPOST_EVENT, v26, "cache miss", "URL %@ was missing expected cached values for key: %@", error, 0x16u);
    }
  }

LABEL_28:
  *(void *)error = 0;
LABEL_5:
  int v11 = CFURLCopyResourcePropertyForKey(a1, v8, &propertyValueTypeRefPtr, (CFErrorRef *)error);
  BOOL v12 = v11 != 0;
  if (v11)
  {
    id v13 = propertyValueTypeRefPtr;
    a5 = a3;
LABEL_9:
    *a5 = v13;
    goto LABEL_12;
  }
  if (a5)
  {
    id v13 = *(id *)error;
    if (*(void *)error) {
      goto LABEL_9;
    }
  }
LABEL_12:

  return v12;
}

- (CFDictionaryRef)__is_resourceValuesForKeys:()UTIAdditions error:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  CFArrayRef v6 = a3;
  CFErrorRef error = 0;
  v7 = +[ISDefaults sharedInstance];
  int v8 = [v7 logMissingURLCacheProperties];

  if (v8)
  {
    v9 = (void *)_CFURLCopyResourcePropertiesForKeysFromCache();
    int v10 = [MEMORY[0x1E4F1CA80] setWithArray:v6];
    if (v9)
    {
      int v11 = (void *)MEMORY[0x1E4F1CAD0];
      BOOL v12 = [v9 allKeys];
      id v13 = [v11 setWithArray:v12];

      if ([v10 isEqual:v13]) {
        goto LABEL_23;
      }
      [v10 minusSet:v13];
    }
    else
    {
      id v13 = 0;
    }
    v15 = +[ISURLResourcePropertySpecification sharedInstance];
    char v16 = [v15 allowedMissingProperties];
    [v10 minusSet:v16];

    if ([v10 count])
    {
      if ([a1 isFileReferenceURL])
      {
        id v31 = 0;
        objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v31, *MEMORY[0x1E4F1C700], 0);
        v17 = v31;
        if (!v17)
        {
          v17 = [a1 path];
        }
        v18 = _ISURLCacheLog();
        os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v18, a1);

        if (v19)
        {
          os_signpost_id_t v20 = _ISURLCacheLog();
          BOOL v21 = os_signpost_enabled(v20);

          if (v21)
          {
            BOOL v22 = _ISURLCacheLog();
            v23 = v22;
            if (v19 != -1 && os_signpost_enabled(v22))
            {
              *(_DWORD *)buf = 138412802;
              v34 = a1;
              __int16 v35 = 2112;
              v36 = v17;
              __int16 v37 = 2112;
              v38 = v10;
              _os_signpost_emit_with_name_impl(&dword_1AE771000, v23, OS_SIGNPOST_EVENT, v19, "cache miss", "URL %@ path %@ was missing expected cached values for keys: %@", buf, 0x20u);
            }
          }
        }
      }
      else
      {
        v24 = _ISURLCacheLog();
        os_signpost_id_t v25 = os_signpost_id_make_with_pointer(v24, a1);

        if (!v25) {
          goto LABEL_23;
        }
        os_signpost_id_t v26 = _ISURLCacheLog();
        BOOL v27 = os_signpost_enabled(v26);

        if (!v27) {
          goto LABEL_23;
        }
        BOOL v28 = _ISURLCacheLog();
        v17 = v28;
        if (v25 != -1 && os_signpost_enabled(v28))
        {
          *(_DWORD *)buf = 138412546;
          v34 = a1;
          __int16 v35 = 2112;
          v36 = v10;
          _os_signpost_emit_with_name_impl(&dword_1AE771000, v17, OS_SIGNPOST_EVENT, v25, "cache miss", "URL %@ was missing expected cached values for keys: %@", buf, 0x16u);
        }
      }
    }
LABEL_23:
    CFDictionaryRef v14 = CFURLCopyResourcePropertiesForKeys((CFURLRef)a1, v6, &error);

    goto LABEL_24;
  }
  CFDictionaryRef v14 = CFURLCopyResourcePropertiesForKeys((CFURLRef)a1, v6, &error);
LABEL_24:
  if (a4 && error)
  {
    *a4 = error;
  }
  else if (error)
  {
    v29 = _ISDefaultLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      -[NSURL(UTIAdditions) __is_resourceValuesForKeys:error:]((uint64_t)v6, (uint64_t *)&error, v29);
    }

    CFRelease(error);
  }

  return v14;
}

- (BOOL)__is__conformsToUTI:()UTIAdditions
{
  v4 = a3;
  CFStringRef inUTI = 0;
  objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &inUTI, *MEMORY[0x1E4F1C728], 0);
  if (inUTI) {
    BOOL v5 = UTTypeConformsTo(inUTI, v4) != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (uint64_t)__is__isDirectory
{
  id v5 = 0;
  int v1 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v5, *MEMORY[0x1E4F1C628], 0);
  id v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v2 = 0;
  }
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)__is__isPackage
{
  id v5 = 0;
  int v1 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v5, *MEMORY[0x1E4F1C658], 0);
  id v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v2 = 0;
  }
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)__is__isVolume
{
  id v5 = 0;
  int v1 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v5, *MEMORY[0x1E4F1C6A0], 0);
  id v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v2 = 0;
  }
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)__is__isAliasFile
{
  id v6 = 0;
  int v2 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v6, *MEMORY[0x1E4F1C610], 0);
  id v3 = v6;
  if (!v2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v3 = 0;
  }
  if ([v3 BOOLValue]) {
    uint64_t v4 = objc_msgSend(a1, "__is__isSymLink") ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)__is__isSymLink
{
  id v5 = 0;
  int v1 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v5, *MEMORY[0x1E4F1C680], 0);
  id v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v2 = 0;
  }
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (id)__is_volumeURL
{
  id v4 = 0;
  int v1 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v4, *MEMORY[0x1E4F1C960], 0);
  id v2 = v4;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v2 = 0;
  }
  return v2;
}

- (uint64_t)__has_ResourceFork
{
  id v5 = 0;
  int v1 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v5, *MEMORY[0x1E4F1CDD8], 0);
  id v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v2 = 0;
  }
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)__is_isBootVolume
{
  id v5 = 0;
  int v1 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v5, *MEMORY[0x1E4F1C870], 0);
  id v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v2 = 0;
  }
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)__is_isOnBootVolume
{
  int v1 = objc_msgSend(a1, "__is_volumeURL");
  uint64_t v2 = objc_msgSend(v1, "__is_isBootVolume");

  return v2;
}

- (BOOL)__is_hasFileExtension:()UTIAdditions
{
  id v4 = a3;
  id v5 = [a1 pathExtension];
  uint64_t v6 = [v5 caseInsensitiveCompare:v4];

  return v6 == 0;
}

- (uint64_t)__is_isApplication
{
  id v5 = 0;
  int v1 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v5, *MEMORY[0x1E4F1C618], 0);
  id v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v2 = 0;
  }
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)__is_isAppExtension
{
  id v2 = [a1 pathExtension];
  if ([v2 isEqualToString:@"appex"]) {
    uint64_t v3 = objc_msgSend(a1, "__is__isDirectory");
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)__is_isBundleWithUnregisteredPersonality
{
  id v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "_is_unregisteredPersonlityFileExtensions");
  uint64_t v3 = [a1 pathExtension];
  id v4 = [v3 lowercaseString];
  uint64_t v5 = [v2 objectForKey:v4];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = objc_msgSend(a1, "__is__isDirectory");
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (uint64_t)__is_fileExists
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = [a1 path];
  uint64_t v4 = [v2 fileExistsAtPath:v3];

  return v4;
}

- (uint64_t)__is_accessFlags
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F1C6A8];
  v10[0] = *MEMORY[0x1E4F1C668];
  uint64_t v2 = v10[0];
  v10[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v5 = objc_msgSend(a1, "__is_resourceValuesForKeys:error:", v4, 0);

  LODWORD(v2) = objc_msgSend(v5, "_IF_BOOLForKey:", v2);
  int v6 = objc_msgSend(v5, "_IF_BOOLForKey:", v3);
  if (v2) {
    int v7 = 4;
  }
  else {
    int v7 = 0;
  }
  if (v6) {
    int v8 = 2;
  }
  else {
    int v8 = 0;
  }

  return v8 | v7;
}

- (uint64_t)__is_locked
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F1C698];
  v7[0] = *MEMORY[0x1E4F1C688];
  uint64_t v2 = v7[0];
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  uint64_t v5 = objc_msgSend(a1, "__is_resourceValuesForKeys:error:", v4, 0);

  LODWORD(a1) = objc_msgSend(v5, "_IF_BOOLForKey:", v2);
  LODWORD(v2) = objc_msgSend(v5, "_IF_BOOLForKey:", v3);

  return a1 | v2;
}

+ (id)__is_coreTypesURL
{
  if (__is_coreTypesURL_onceToken != -1) {
    dispatch_once(&__is_coreTypesURL_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)__is_coreTypesURL_coreTypesURL;
  return v0;
}

- (id)__is_typeIdentifier
{
  id v5 = 0;
  int v1 = objc_msgSend(a1, "__is__getResourceValue:forKey:error:", &v5, *MEMORY[0x1E4F1C728], 0);
  id v2 = v5;
  if (!v1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v3 = (id)*MEMORY[0x1E4F22590];

    id v2 = v3;
  }
  return v2;
}

- (void)__is_resourceValuesForKeys:()UTIAdditions error:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_1AE771000, log, OS_LOG_TYPE_DEBUG, "Error getting resource properties: %@ error: %@", (uint8_t *)&v4, 0x16u);
}

@end