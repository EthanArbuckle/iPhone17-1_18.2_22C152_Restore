@interface MCMPlistReadOnly
- (BOOL)_initPropertiesWithPlist:(id)a3 conformingToProtocol:(id)a4 error:(id *)a5;
- (BOOL)_isNonatomicReadonlyBoolPropertyTypeWithAttributes:(const char *)a3;
- (BOOL)keepArtifacts;
- (BOOL)loadWithError:(id *)a3;
- (BOOL)override_initNonBoolPropertiesWithPlist:(id)a3 error:(id *)a4;
- (MCMFileManagerReadsData)fileManager;
- (MCMPlistReadOnly)initWithPreprocessedPlist:(id)a3 conformingToProtocol:(id)a4;
- (MCMPlistReadOnly)initWithRawPlist:(id)a3 preprocessedPlist:(id)a4 pathOrName:(id)a5 protocol:(id)a6 defaultPlistDirectoryURL:(id)a7;
- (NSCountedSet)numIncludes;
- (NSDictionary)preprocessedPlist;
- (NSDictionary)rawPlist;
- (NSString)pathOrName;
- (NSURL)defaultPlistDirectoryURL;
- (NSURL)sourceFileURL;
- (Protocol)protocol;
- (id)_plistByPreprocessingPlist:(id)a3 conformingToProtocol:(id)a4 error:(id *)a5;
- (id)_plistByResolvingFeatureFlagsInMutablePlist:(id)a3 error:(id *)a4;
- (id)_plistByResolvingIncludeInMutablePlist:(id)a3 conformingToProtocol:(id)a4 error:(id *)a5;
- (id)_urlByResolvingConfigName:(id)a3 defaultPlistDirectoryURL:(id)a4 error:(id *)a5;
- (id)descriptionOfBoolPropertiesWithIndentString:(id)a3;
- (id)featureFlagProvider;
- (id)initFromPlist:(id)a3 defaultPlistDirectoryURL:(id)a4 conformingToProtocol:(id)a5;
- (id)initFromPlistAtPathOrName:(id)a3 defaultPlistDirectoryURL:(id)a4 conformingToProtocol:(id)a5;
- (void)_forEachBoolPropertyUsingObjCMagicInProtocol:(id)a3 runBlock:(id)a4;
- (void)_initBoolPropertiesUsingObjCMagicWithPlist:(id)a3 conformingToProtocol:(id)a4;
- (void)_initBoolPropertyWithName:(id)a3 entry:(id)a4;
- (void)setFeatureFlagProvider:(id)a3;
- (void)setFileManager:(id)a3;
- (void)setKeepArtifacts:(BOOL)a3;
- (void)setNumIncludes:(id)a3;
@end

@implementation MCMPlistReadOnly

- (void).cxx_destruct
{
  objc_storeStrong(&self->_featureFlagProvider, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_sourceFileURL, 0);
  objc_storeStrong((id *)&self->_preprocessedPlist, 0);
  objc_storeStrong((id *)&self->_rawPlist, 0);
  objc_storeStrong((id *)&self->_pathOrName, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_defaultPlistDirectoryURL, 0);

  objc_storeStrong((id *)&self->_numIncludes, 0);
}

- (void)setKeepArtifacts:(BOOL)a3
{
  self->_keepArtifacts = a3;
}

- (BOOL)keepArtifacts
{
  return self->_keepArtifacts;
}

- (void)setFeatureFlagProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)featureFlagProvider
{
  return self->_featureFlagProvider;
}

- (void)setFileManager:(id)a3
{
  p_fileManager = &self->_fileManager;

  objc_storeStrong((id *)p_fileManager, a3);
}

- (MCMFileManagerReadsData)fileManager
{
  return self->_fileManager;
}

- (NSURL)sourceFileURL
{
  return self->_sourceFileURL;
}

- (NSDictionary)preprocessedPlist
{
  return self->_preprocessedPlist;
}

- (NSDictionary)rawPlist
{
  return self->_rawPlist;
}

- (NSString)pathOrName
{
  return self->_pathOrName;
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (NSURL)defaultPlistDirectoryURL
{
  return self->_defaultPlistDirectoryURL;
}

- (void)setNumIncludes:(id)a3
{
  p_numIncludes = &self->_numIncludes;

  objc_storeStrong((id *)p_numIncludes, a3);
}

- (NSCountedSet)numIncludes
{
  return self->_numIncludes;
}

- (BOOL)_isNonatomicReadonlyBoolPropertyTypeWithAttributes:(const char *)a3
{
  if (_isNonatomicReadonlyBoolPropertyTypeWithAttributes__onceToken != -1) {
    dispatch_once(&_isNonatomicReadonlyBoolPropertyTypeWithAttributes__onceToken, &__block_literal_global_4695);
  }
  if (!strncmp(_isNonatomicReadonlyBoolPropertyTypeWithAttributes__BOOLType, a3, _isNonatomicReadonlyBoolPropertyTypeWithAttributes__BOOLTypeLen))
  {
    size_t v5 = strnlen(a3, 0x64uLL);
    v4 = strnstr(a3, ",N", v5);
    if (v4) {
      LOBYTE(v4) = strnstr(a3, ",R", v5) != 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

size_t __71__MCMPlistReadOnly__isNonatomicReadonlyBoolPropertyTypeWithAttributes___block_invoke()
{
  snprintf(_isNonatomicReadonlyBoolPropertyTypeWithAttributes__BOOLType, 0x64uLL, "T%s", "B");
  size_t result = strnlen(_isNonatomicReadonlyBoolPropertyTypeWithAttributes__BOOLType, 0x64uLL);
  _isNonatomicReadonlyBoolPropertyTypeWithAttributes__BOOLTypeLen = result;
  return result;
}

- (void)_forEachBoolPropertyUsingObjCMagicInProtocol:(id)a3 runBlock:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, void *))a4;
  unsigned int outCount = 0;
  v7 = protocol_copyPropertyList2((Protocol *)a3, &outCount, 1, 1);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      v9 = v7[i];
      Name = property_getName(v9);
      Attributes = property_getAttributes(v9);
      v12 = [NSString stringWithUTF8String:Name];
      if ([(MCMPlistReadOnly *)self _isNonatomicReadonlyBoolPropertyTypeWithAttributes:Attributes])
      {
        v6[2](v6, v12);
      }
    }
  }
  free(v7);
}

- (id)_urlByResolvingConfigName:(id)a3 defaultPlistDirectoryURL:(id)a4 error:(id *)a5
{
  v18[1] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 hasPrefix:@"/"])
  {
    v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:0];
  }
  else
  {
    if ([v8 hasPrefix:@"./"])
    {
      v11 = [(NSURL *)self->_sourceFileURL URLByDeletingLastPathComponent];
      [v11 URLByAppendingPathComponent:v8 isDirectory:0];
    }
    else
    {
      v11 = [v9 URLByAppendingPathComponent:v8 isDirectory:0];
      [v11 URLByAppendingPathExtension:@"plist"];
    v10 = };
  }
  v12 = [(MCMPlistReadOnly *)self fileManager];
  v18[0] = 0;
  v13 = [v12 realPathForURL:v10 isDirectory:0 error:v18];
  id v14 = v18[0];

  v15 = 0;
  if (!v13)
  {
    v16 = [[MCMError alloc] initWithNSError:v14 url:v10 defaultErrorType:149];
    v15 = v16;
    if (a5)
    {
      v15 = v16;
      *a5 = v15;
    }
  }

  return v13;
}

- (id)_plistByResolvingIncludeInMutablePlist:(id)a3 conformingToProtocol:(id)a4 error:(id *)a5
{
  v34 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v35 = a4;
  id v8 = v7;
  id v9 = 0;
  v10 = 0;
  v36 = v8;
  while (1)
  {
    v11 = objc_msgSend(v8, "objectForKeyedSubscript:", @"#Include", v34);
    objc_opt_class();
    id v12 = v11;
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    if (!v13)
    {
      v25 = v34;
      goto LABEL_25;
    }
    [v8 removeObjectForKey:@"#Include"];
    id v14 = [(MCMPlistReadOnly *)self defaultPlistDirectoryURL];
    v39 = v10;
    v15 = [(MCMPlistReadOnly *)self _urlByResolvingConfigName:v13 defaultPlistDirectoryURL:v14 error:&v39];
    v16 = v39;

    if (!v15)
    {
      p_super = container_log_handle_for_category();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        v30 = [(MCMPlistReadOnly *)self defaultPlistDirectoryURL];
        v31 = [v30 path];
        *(_DWORD *)buf = 138412802;
        id v41 = v13;
        __int16 v42 = 2112;
        uint64_t v43 = (uint64_t)v31;
        __int16 v44 = 2112;
        v45 = v16;
        _os_log_error_impl(&dword_1D7739000, p_super, OS_LOG_TYPE_ERROR, "Could not resolve config file name [%@] using default directory [%@]; error = %@",
          buf,
          0x20u);
      }
      v15 = 0;
      goto LABEL_18;
    }
    v17 = [(MCMPlistReadOnly *)self numIncludes];
    [v17 addObject:v15];

    v18 = [(MCMPlistReadOnly *)self numIncludes];
    unint64_t v19 = [v18 countForObject:v15];

    if (v19 >= 0x1F)
    {
      v27 = container_log_handle_for_category();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v32 = [v15 path];
        *(_DWORD *)buf = 138412546;
        id v41 = v32;
        __int16 v42 = 2048;
        uint64_t v43 = 30;
        _os_log_error_impl(&dword_1D7739000, v27, OS_LOG_TYPE_ERROR, "[%@] exceeded maximum inclusions (%lu), possible recursion", buf, 0x16u);
      }
      p_super = &v16->super;
      v16 = [[MCMError alloc] initWithErrorType:150];
LABEL_18:
      v25 = v34;
      goto LABEL_24;
    }
    v20 = (void *)MEMORY[0x1E4F1C9E8];
    v21 = [(MCMPlistReadOnly *)self fileManager];
    id v38 = 0;
    v22 = objc_msgSend(v20, "MCM_dictionaryWithContentsOfURL:options:fileManager:fsNode:error:", v15, 0, v21, 0, &v38);
    v23 = v38;

    if (!v22)
    {
      v28 = container_log_handle_for_category();
      v25 = v34;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v33 = [v15 path];
        *(_DWORD *)buf = 138412546;
        id v41 = v33;
        __int16 v42 = 2112;
        uint64_t v43 = (uint64_t)v23;
        _os_log_error_impl(&dword_1D7739000, v28, OS_LOG_TYPE_ERROR, "Could not read config file [%@]; error = %@",
          buf,
          0x16u);
      }
      v10 = [[MCMError alloc] initWithNSError:v23 url:v15 defaultErrorType:149];

      v22 = 0;
      goto LABEL_23;
    }
    objc_msgSend(v8, "MCM_overlayDictionary:existingValuesTakePrecedent:", v22, 1);
    v37 = v16;
    uint64_t v24 = [(MCMPlistReadOnly *)self _plistByResolvingFeatureFlagsInMutablePlist:v8 error:&v37];
    v10 = v37;

    if (!v24) {
      break;
    }

    id v9 = v13;
    id v8 = (id)v24;
  }
  id v8 = 0;
  v25 = v34;
LABEL_23:

  p_super = v15;
  v15 = v23;
  v16 = v10;
LABEL_24:

  v10 = v16;
LABEL_25:
  if (v10)
  {

    id v8 = 0;
  }
  if (v25 && !v8) {
    id *v25 = v10;
  }

  return v8;
}

- (id)_plistByResolvingFeatureFlagsInMutablePlist:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(MCMPlistReadOnly *)self featureFlagProvider];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__4718;
  v34 = __Block_byref_object_dispose__4719;
  id v35 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  id v8 = v6;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __70__MCMPlistReadOnly__plistByResolvingFeatureFlagsInMutablePlist_error___block_invoke;
  v21 = &unk_1E6A7FE50;
  uint64_t v24 = &v26;
  id v9 = v7;
  v22 = self;
  id v23 = v9;
  v25 = &v30;
  objc_msgSend(v8, "MCM_replaceDeepDictionariesWithReplaceHandler:", &v18);
  v10 = v8;
  if (*((unsigned char *)v27 + 24))
  {
    if (v31[5]) {
      goto LABEL_6;
    }
    v11 = container_log_handle_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v17 = [(NSURL *)self->_sourceFileURL path];
      *(_DWORD *)buf = 138412290;
      v37 = v17;
      _os_log_error_impl(&dword_1D7739000, v11, OS_LOG_TYPE_ERROR, "Config file invalid [%@]", buf, 0xCu);
    }
    id v12 = [MCMError alloc];
    id v13 = [(NSURL *)self->_sourceFileURL path];
    uint64_t v14 = [(MCMError *)v12 initWithErrorType:149 category:5 path:v13 POSIXerrno:100];
    v15 = (void *)v31[5];
    v31[5] = v14;

    v10 = v8;
    if (*((unsigned char *)v27 + 24))
    {
LABEL_6:
      if (a4) {
        *a4 = (id) v31[5];
      }

      v10 = 0;
    }
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v10;
}

id __70__MCMPlistReadOnly__plistByResolvingFeatureFlagsInMutablePlist_error___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  size_t v5 = a2;
  id v6 = a3;
  id v7 = (void *)[v6 mutableCopy];
  id v8 = @"#IfFeatureFlagEnabled";
  uint64_t v9 = [v6 objectForKeyedSubscript:@"#IfFeatureFlagEnabled"];
  v10 = @"#IfFeatureFlagDisabled";
  uint64_t v11 = [v6 objectForKeyedSubscript:@"#IfFeatureFlagDisabled"];
  id v12 = [v6 objectForKeyedSubscript:@"#Then"];
  v39 = [v6 objectForKeyedSubscript:@"#Else"];

  uint64_t v38 = v5;
  if (v9 | v11)
  {
    if (v9 && v11)
    {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
      id v13 = container_log_handle_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        __int16 v42 = @"#IfFeatureFlagEnabled";
        __int16 v43 = 2112;
        __int16 v44 = @"#IfFeatureFlagDisabled";
        __int16 v45 = 2112;
        uint64_t v46 = v5;
        uint64_t v14 = "Invalid plist; both [%@] and [%@] specified but only one should be at [%@]";
        v15 = v13;
        uint32_t v16 = 32;
LABEL_38:
        _os_log_error_impl(&dword_1D7739000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
      }
    }
    else
    {
      if (v12)
      {
        if (v9) {
          uint64_t v19 = (void *)v9;
        }
        else {
          uint64_t v19 = (void *)v11;
        }
        id v18 = v19;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v18;
          id v13 = [v17 componentsSeparatedByString:@"/"];
          if ([v13 count] == 2)
          {
            uint64_t v20 = a1[5];
            id v21 = [v13 objectAtIndexedSubscript:0];
            if (v20)
            {
              uint64_t v37 = [v21 UTF8String];
              id v22 = [v13 objectAtIndexedSubscript:1];
              int v23 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v20, v37, [v22 UTF8String]);
            }
            else
            {
              [v21 UTF8String];
              id v22 = [v13 objectAtIndexedSubscript:1];
              [v22 UTF8String];
              int v23 = _os_feature_enabled_impl();
            }
            int v31 = v23;

            if (v9 && v31 || (!v11 ? (char v32 = 1) : (char v32 = v31), (v32 & 1) == 0)) {
              id v33 = v12;
            }
            else {
              id v33 = v39;
            }
            id v34 = v33;

            id v18 = v17;
            id v7 = v34;
          }
          else
          {
            *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
            uint64_t v30 = container_log_handle_for_category();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              if (!v9) {
                id v8 = @"#IfFeatureFlagDisabled";
              }
              *(_DWORD *)buf = 138412802;
              __int16 v42 = v8;
              __int16 v43 = 2048;
              __int16 v44 = (__CFString *)[v13 count];
              __int16 v45 = 2112;
              uint64_t v46 = v38;
              _os_log_error_impl(&dword_1D7739000, v30, OS_LOG_TYPE_ERROR, "Invalid plist; value of [%@] should be a feature flag string with two components but has %lu components at [%@]",
                buf,
                0x20u);
            }

            id v18 = v17;
          }
        }
        else
        {
          *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
          id v13 = container_log_handle_for_category();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            if (v9) {
              v10 = @"#IfFeatureFlagEnabled";
            }
            id v35 = (objc_class *)objc_opt_class();
            NSStringFromClass(v35);
            v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            __int16 v42 = v10;
            __int16 v43 = 2112;
            __int16 v44 = v36;
            __int16 v45 = 2112;
            uint64_t v46 = v38;
            _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, "Invalid plist; value of [%@] should be an string but is a [%@] at [%@]",
              buf,
              0x20u);
          }
          id v17 = 0;
        }
        goto LABEL_17;
      }
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
      id v13 = container_log_handle_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        __int16 v42 = @"#Then";
        __int16 v43 = 2112;
        __int16 v44 = v5;
        uint64_t v14 = "Invalid plist; no [%@] specified at [%@]";
        v15 = v13;
        uint32_t v16 = 22;
        goto LABEL_38;
      }
    }
    id v17 = 0;
    id v18 = 0;
LABEL_17:

    goto LABEL_18;
  }
  id v17 = 0;
  id v18 = 0;
LABEL_18:
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v24 = (void *)a1[4];
      v25 = [v24 protocol];
      uint64_t v26 = *(void *)(a1[7] + 8);
      id obj = *(id *)(v26 + 40);
      uint64_t v27 = [v24 _plistByResolvingIncludeInMutablePlist:v7 conformingToProtocol:v25 error:&obj];
      objc_storeStrong((id *)(v26 + 40), obj);

      id v7 = (void *)v27;
      if (!v27) {
        *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
      }
    }
  }
  id v28 = v7;

  return v28;
}

- (id)_plistByPreprocessingPlist:(id)a3 conformingToProtocol:(id)a4 error:(id *)a5
{
  v17[1] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = (void *)[a3 mutableCopy];
  v17[0] = 0;
  v10 = [(MCMPlistReadOnly *)self _plistByResolvingFeatureFlagsInMutablePlist:v9 error:v17];
  id v11 = v17[0];

  if (v10)
  {
    id v16 = v11;
    id v12 = [(MCMPlistReadOnly *)self _plistByResolvingIncludeInMutablePlist:v10 conformingToProtocol:v8 error:&v16];
    id v13 = v16;

    id v11 = v13;
    if (!a5) {
      goto LABEL_7;
    }
  }
  else
  {
    id v12 = 0;
    if (!a5) {
      goto LABEL_7;
    }
  }
  if (!v12) {
    *a5 = v11;
  }
LABEL_7:
  uint64_t v14 = objc_msgSend(v12, "MCM_deepCopy");

  return v14;
}

- (void)_initBoolPropertyWithName:(id)a3 entry:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  id v10 = v6;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = 0;
    goto LABEL_5;
  }
  if (v10)
  {
    uint64_t v8 = [v10 BOOLValue];
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v8 = 0;
LABEL_6:
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", v8, v10);
  [(MCMPlistReadOnly *)self setValue:v9 forKey:v7];
}

- (void)_initBoolPropertiesUsingObjCMagicWithPlist:(id)a3 conformingToProtocol:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__MCMPlistReadOnly__initBoolPropertiesUsingObjCMagicWithPlist_conformingToProtocol___block_invoke;
  v8[3] = &unk_1E6A7FE28;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(MCMPlistReadOnly *)self _forEachBoolPropertyUsingObjCMagicInProtocol:a4 runBlock:v8];
}

void __84__MCMPlistReadOnly__initBoolPropertiesUsingObjCMagicWithPlist_conformingToProtocol___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v4];
  objc_msgSend(v2, "_initBoolPropertyWithName:entry:", v4);
}

- (BOOL)_initPropertiesWithPlist:(id)a3 conformingToProtocol:(id)a4 error:(id *)a5
{
  v13[1] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  [(MCMPlistReadOnly *)self _initBoolPropertiesUsingObjCMagicWithPlist:v8 conformingToProtocol:a4];
  v13[0] = 0;
  BOOL v9 = [(MCMPlistReadOnly *)self override_initNonBoolPropertiesWithPlist:v8 error:v13];

  id v10 = v13[0];
  id v11 = v10;
  if (a5 && !v9) {
    *a5 = v10;
  }

  return v9;
}

- (BOOL)override_initNonBoolPropertiesWithPlist:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)descriptionOfBoolPropertiesWithIndentString:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4718;
  id v16 = __Block_byref_object_dispose__4719;
  id v17 = &stru_1F2EF6598;
  protocol = self->_protocol;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__MCMPlistReadOnly_descriptionOfBoolPropertiesWithIndentString___block_invoke;
  v9[3] = &unk_1E6A7FE00;
  v9[4] = self;
  id v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [(MCMPlistReadOnly *)self _forEachBoolPropertyUsingObjCMagicInProtocol:protocol runBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __64__MCMPlistReadOnly_descriptionOfBoolPropertiesWithIndentString___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 valueForKey:v4];
  int v6 = [v5 BOOLValue];

  id v7 = @"NO";
  if (v6) {
    id v7 = @"YES";
  }
  id v8 = &stru_1F2EF6598;
  if (a1[5]) {
    id v8 = (__CFString *)a1[5];
  }
  uint64_t v9 = [*(id *)(*(void *)(a1[6] + 8) + 40) stringByAppendingFormat:@"%@%@: %@\n", v8, v4, v7];

  uint64_t v10 = *(void *)(a1[6] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

- (BOOL)loadWithError:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1D9478DF0](self, a2);
  if (self->_pathOrName)
  {
    int v6 = [(MCMPlistReadOnly *)self pathOrName];
    id v7 = [(MCMPlistReadOnly *)self defaultPlistDirectoryURL];
    id v35 = 0;
    id v8 = [(MCMPlistReadOnly *)self _urlByResolvingConfigName:v6 defaultPlistDirectoryURL:v7 error:&v35];
    uint64_t v9 = (MCMError *)v35;
    sourceFileURL = self->_sourceFileURL;
    self->_sourceFileURL = v8;

    id v11 = self->_sourceFileURL;
    if (!v11) {
      goto LABEL_20;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F1C9E8];
    id v13 = [(MCMPlistReadOnly *)self fileManager];
    id v34 = 0;
    objc_msgSend(v12, "MCM_dictionaryWithContentsOfURL:options:fileManager:fsNode:error:", v11, 0, v13, 0, &v34);
    uint64_t v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    id v15 = v34;
    rawPlist = self->_rawPlist;
    self->_rawPlist = v14;

    if (!self->_rawPlist)
    {
      id v28 = container_log_handle_for_category();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        int v31 = [(NSURL *)self->_sourceFileURL path];
        *(_DWORD *)buf = 138412546;
        uint64_t v37 = v31;
        __int16 v38 = 2112;
        id v39 = v15;
        _os_log_error_impl(&dword_1D7739000, v28, OS_LOG_TYPE_ERROR, "Failed to read config file [%@]; error = %@",
          buf,
          0x16u);
      }
      char v29 = [[MCMError alloc] initWithNSError:v15 url:self->_sourceFileURL defaultErrorType:149];

      uint64_t v9 = v29;
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v17 = self->_rawPlist;
  if (v17)
  {
    protocol = self->_protocol;
    id v33 = v9;
    uint64_t v19 = [(MCMPlistReadOnly *)self _plistByPreprocessingPlist:v17 conformingToProtocol:protocol error:&v33];
    uint64_t v20 = v33;

    preprocessedPlist = self->_preprocessedPlist;
    self->_preprocessedPlist = v19;

    if (!self->_preprocessedPlist)
    {
      uint64_t v9 = v20;
      goto LABEL_20;
    }
    if (!self->_keepArtifacts)
    {
      id v22 = self->_rawPlist;
      self->_rawPlist = 0;
    }
  }
  else
  {
    uint64_t v20 = v9;
  }
  int v23 = self->_preprocessedPlist;
  if (v23)
  {
    uint64_t v24 = self->_protocol;
    char v32 = v20;
    BOOL v25 = [(MCMPlistReadOnly *)self _initPropertiesWithPlist:v23 conformingToProtocol:v24 error:&v32];
    uint64_t v9 = v32;

    if (v25)
    {
      if (!self->_keepArtifacts)
      {
        uint64_t v26 = self->_preprocessedPlist;
        self->_preprocessedPlist = 0;
      }
      BOOL v27 = 1;
      goto LABEL_23;
    }
LABEL_20:
    if (a3)
    {
      uint64_t v9 = v9;
      BOOL v27 = 0;
      *a3 = v9;
    }
    else
    {
      BOOL v27 = 0;
    }
LABEL_23:

    return v27;
  }
  BOOL result = _os_crash();
  __break(1u);
  return result;
}

- (MCMPlistReadOnly)initWithRawPlist:(id)a3 preprocessedPlist:(id)a4 pathOrName:(id)a5 protocol:(id)a6 defaultPlistDirectoryURL:(id)a7
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v32 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v33.receiver = self;
  v33.super_class = (Class)MCMPlistReadOnly;
  id v17 = [(MCMPlistReadOnly *)&v33 init];
  if (!v17) {
    goto LABEL_9;
  }
  id v31 = v13;
  uint64_t v18 = objc_opt_new();
  numIncludes = v17->_numIncludes;
  v17->_numIncludes = (NSCountedSet *)v18;

  p_rawPlist = &v17->_rawPlist;
  objc_storeStrong((id *)&v17->_rawPlist, a3);
  objc_storeStrong((id *)&v17->_preprocessedPlist, a4);
  p_pathOrName = &v17->_pathOrName;
  objc_storeStrong((id *)&v17->_pathOrName, a5);
  objc_storeStrong((id *)&v17->_protocol, a6);
  p_defaultPlistDirectoryURL = &v17->_defaultPlistDirectoryURL;
  objc_storeStrong((id *)&v17->_defaultPlistDirectoryURL, a7);
  uint64_t v23 = +[MCMFileManager defaultManager];
  fileManager = v17->_fileManager;
  v17->_fileManager = (MCMFileManagerReadsData *)v23;

  id featureFlagProvider = v17->_featureFlagProvider;
  v17->_id featureFlagProvider = 0;

  v17->_keepArtifacts = 0;
  if (([(MCMPlistReadOnly *)v17 conformsToProtocol:v15] & 1) == 0)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v36 = 0u;
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    id v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    id v29 = objc_claimAutoreleasedReturnValue();
    uint64_t v30 = [v29 UTF8String];
    int v34 = 136315138;
    uint64_t v35 = v30;
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
LABEL_11:
    _os_crash();
    __break(1u);
LABEL_12:
    _os_crash();
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v26 = *p_rawPlist;
  if (*p_rawPlist && !*p_defaultPlistDirectoryURL) {
    goto LABEL_11;
  }
  id v13 = v31;
  if (*p_pathOrName && !*p_defaultPlistDirectoryURL) {
    goto LABEL_12;
  }
  if (v26 || *p_pathOrName | (uint64_t)v17->_preprocessedPlist)
  {
LABEL_9:

    return v17;
  }
LABEL_13:
  BOOL result = (MCMPlistReadOnly *)_os_crash();
  __break(1u);
  return result;
}

- (MCMPlistReadOnly)initWithPreprocessedPlist:(id)a3 conformingToProtocol:(id)a4
{
  return [(MCMPlistReadOnly *)self initWithRawPlist:0 preprocessedPlist:a3 pathOrName:0 protocol:a4 defaultPlistDirectoryURL:0];
}

- (id)initFromPlist:(id)a3 defaultPlistDirectoryURL:(id)a4 conformingToProtocol:(id)a5
{
  return [(MCMPlistReadOnly *)self initWithRawPlist:a3 preprocessedPlist:0 pathOrName:0 protocol:a5 defaultPlistDirectoryURL:a4];
}

- (id)initFromPlistAtPathOrName:(id)a3 defaultPlistDirectoryURL:(id)a4 conformingToProtocol:(id)a5
{
  return [(MCMPlistReadOnly *)self initWithRawPlist:0 preprocessedPlist:0 pathOrName:a3 protocol:a5 defaultPlistDirectoryURL:a4];
}

@end