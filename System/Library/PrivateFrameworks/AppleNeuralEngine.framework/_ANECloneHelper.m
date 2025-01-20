@interface _ANECloneHelper
+ (BOOL)shouldSkipCloneFor:(id)a3 isEncryptedModel:(BOOL)a4;
+ (id)cloneIfWritable:(id)a3 isEncryptedModel:(BOOL)a4 cloneDirectory:(id)a5;
@end

@implementation _ANECloneHelper

+ (BOOL)shouldSkipCloneFor:(id)a3 isEncryptedModel:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 modelURL];
  id v27 = 0;
  uint64_t v8 = *MEMORY[0x1E4F1C870];
  id v26 = 0;
  int v9 = [v7 getResourceValue:&v27 forKey:v8 error:&v26];
  id v10 = v27;
  id v11 = v26;

  if (v9 && [v10 BOOLValue])
  {
    v12 = +[_ANELog common];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      +[_ANECloneHelper shouldSkipCloneFor:isEncryptedModel:]();
    }
    LOBYTE(v13) = 1;
    BOOL v14 = 1;
    id v15 = v11;
  }
  else
  {
    v16 = [v6 modelURL];
    id v25 = 0;
    uint64_t v17 = *MEMORY[0x1E4F1C860];
    id v24 = 0;
    int v13 = [v16 getResourceValue:&v25 forKey:v17 error:&v24];
    v12 = v25;
    id v15 = v24;

    if (v13 && [v12 BOOLValue])
    {
      v18 = +[_ANELog common];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        +[_ANECloneHelper shouldSkipCloneFor:isEncryptedModel:]();
      }

      BOOL v14 = 1;
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  if (v4)
  {
    v19 = +[_ANELog common];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      +[_ANECloneHelper shouldSkipCloneFor:isEncryptedModel:]();
    }

    BOOL v14 = 1;
  }
  if ((v13 & 1) == 0)
  {
    v20 = +[_ANELog common];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v22 = NSStringFromSelector(a2);
      v23 = [v6 modelURL];
      *(_DWORD *)buf = 138412802;
      v29 = v22;
      __int16 v30 = 2112;
      v31 = v23;
      __int16 v32 = 2112;
      id v33 = v15;
      _os_log_error_impl(&dword_1DB8AB000, v20, OS_LOG_TYPE_ERROR, "%@: modelURL=%@ getResourceValue:forKey:error: FAILED. err=%@", buf, 0x20u);
    }
  }

  return v14;
}

+ (id)cloneIfWritable:(id)a3 isEncryptedModel:(BOOL)a4 cloneDirectory:(id)a5
{
  BOOL v6 = a4;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  int v9 = (char *)a3;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E0193890]();
  v12 = +[_ANELog common];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v52 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v69 = v52;
    __int16 v70 = 2112;
    v71 = v9;
    __int16 v72 = 2112;
    id v73 = v10;
    _os_log_debug_impl(&dword_1DB8AB000, v12, OS_LOG_TYPE_DEBUG, "%@: START: model=%@ : cloneDirectory=%@", buf, 0x20u);
  }
  int v13 = [a1 shouldSkipCloneFor:v9 isEncryptedModel:v6];
  BOOL v14 = +[_ANELog common];
  id v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = NSStringFromSelector(a2);
      uint64_t v17 = [v9 modelURL];
      *(_DWORD *)buf = 138412546;
      v69 = v16;
      __int16 v70 = 2112;
      v71 = v17;
      _os_log_impl(&dword_1DB8AB000, v15, OS_LOG_TYPE_INFO, "%@: modelURL=%@. Skipping copyfile()", buf, 0x16u);
    }
    v18 = [v9 modelURL];
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      +[_ANECloneHelper cloneIfWritable:isEncryptedModel:cloneDirectory:]();
    }

    v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v67 = 0;
    v20 = [v9 modelURL];
    v21 = [v20 path];
    char v22 = [v19 fileExistsAtPath:v21 isDirectory:&v67];

    if (v22)
    {
      aSelector = a2;
      v23 = [v9 modelURL];
      id v24 = [v23 path];

      if (!v67)
      {
        id v25 = [v9 modelURL];
        id v26 = [v25 path];
        uint64_t v27 = [v26 stringByDeletingLastPathComponent];

        id v24 = (void *)v27;
      }
      uint64_t v28 = +[_ANEHashEncoding hexStringForString:v24];
      uint64_t v29 = [v24 lastPathComponent];
      v60 = (void *)v28;
      __int16 v30 = [v10 stringByAppendingPathComponent:v28];
      v62 = (void *)v29;
      v31 = [v30 stringByAppendingPathComponent:v29];
      id v66 = 0;
      LOBYTE(v28) = [v19 removeItemAtPath:v31 error:&v66];
      id v32 = v66;
      v64 = v30;
      if ((v28 & 1) == 0)
      {
        id v33 = +[_ANELog common];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          uint64_t v34 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412802;
          v69 = v34;
          __int16 v70 = 2112;
          v71 = v31;
          __int16 v72 = 2112;
          id v73 = v32;
          _os_log_impl(&dword_1DB8AB000, v33, OS_LOG_TYPE_INFO, "%@: %@ could not be removed err=%@", buf, 0x20u);

          __int16 v30 = v64;
        }
      }
      id v65 = v32;
      char v35 = [v19 createDirectoryAtPath:v30 withIntermediateDirectories:1 attributes:0 error:&v65];
      v36 = v65;

      if ((v35 & 1) == 0)
      {
        v37 = +[_ANELog common];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v38 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412802;
          v69 = v38;
          __int16 v70 = 2112;
          v71 = (const char *)v64;
          __int16 v72 = 2112;
          id v73 = v36;
          _os_log_impl(&dword_1DB8AB000, v37, OS_LOG_TYPE_INFO, "%@: %@ could not be created err=%@", buf, 0x20u);
        }
      }
      v63 = v11;
      id v61 = v24;
      v39 = (const char *)[v61 UTF8String];
      v40 = v31;
      v41 = (const char *)[v40 UTF8String];
      v42 = copyfile_state_alloc();
      v43 = +[_ANELog common];
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        v58 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138413058;
        v69 = v58;
        __int16 v70 = 2080;
        v71 = v39;
        __int16 v72 = 2080;
        id v73 = (id)v41;
        __int16 v74 = 1024;
        int v75 = 819214;
        _os_log_debug_impl(&dword_1DB8AB000, v43, OS_LOG_TYPE_DEBUG, "%@: --> Calling copyfile(src:%s, dst:%s, flags:0x%x)", buf, 0x26u);
      }
      int v44 = copyfile(v39, v41, v42, 0xC800Eu);
      copyfile_state_free(v42);
      if (v44 < 0)
      {
        v45 = +[_ANELog common];
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v54 = NSStringFromSelector(aSelector);
          int v55 = *__error();
          v56 = __error();
          v57 = strerror(*v56);
          *(_DWORD *)buf = 138413570;
          v69 = v54;
          __int16 v70 = 2080;
          v71 = v39;
          __int16 v72 = 2080;
          id v73 = (id)v41;
          __int16 v74 = 1024;
          int v75 = 819214;
          __int16 v76 = 1024;
          int v77 = v55;
          __int16 v78 = 2080;
          v79 = v57;
          _os_log_error_impl(&dword_1DB8AB000, v45, OS_LOG_TYPE_ERROR, "%@: copyfile(%s, %s, %o) FAILED with (%d : %s)", buf, 0x36u);
        }
        v18 = 0;
        id v11 = v63;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28CB8], "ane_addWriteModeForPath:", v40);
        v45 = [v40 copy];
        if (!v67)
        {
          v46 = [v9 modelURL];
          v47 = [v46 path];
          v48 = [v47 lastPathComponent];

          uint64_t v49 = [v40 stringByAppendingPathComponent:v48];

          v45 = v49;
        }
        objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", v45, 0, v58);
        v18 = (char *)objc_claimAutoreleasedReturnValue();
        v50 = +[_ANELog common];
        id v11 = v63;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          v53 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412802;
          v69 = v53;
          __int16 v70 = 2112;
          v71 = v18;
          __int16 v72 = 2112;
          id v73 = v45;
          _os_log_debug_impl(&dword_1DB8AB000, v50, OS_LOG_TYPE_DEBUG, "%@: END: modelURL=%@ : dstNameAfterClone=%@", buf, 0x20u);

          id v11 = v63;
        }
      }
    }
    else
    {
      v36 = +[_ANELog common];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        +[_ANECloneHelper cloneIfWritable:isEncryptedModel:cloneDirectory:]();
      }
      v18 = 0;
    }
  }

  return v18;
}

+ (void)shouldSkipCloneFor:isEncryptedModel:.cold.1()
{
  OUTLINED_FUNCTION_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = [(id)OUTLINED_FUNCTION_4_1() modelURL];
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_0_2(&dword_1DB8AB000, v3, v4, "%@: modelURL=%@ is encrypted. Skipping clone", v5, v6, v7, v8, v9);
}

+ (void)shouldSkipCloneFor:isEncryptedModel:.cold.2()
{
  OUTLINED_FUNCTION_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = [(id)OUTLINED_FUNCTION_4_1() modelURL];
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_0_2(&dword_1DB8AB000, v3, v4, "%@: modelURL=%@ is on root filesystem. Skipping clone", v5, v6, v7, v8, v9);
}

+ (void)shouldSkipCloneFor:isEncryptedModel:.cold.3()
{
  OUTLINED_FUNCTION_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = [(id)OUTLINED_FUNCTION_4_1() modelURL];
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_0_2(&dword_1DB8AB000, v3, v4, "%@: modelURL=%@ is on read-only filesystem. Skipping clone", v5, v6, v7, v8, v9);
}

+ (void)cloneIfWritable:isEncryptedModel:cloneDirectory:.cold.1()
{
  OUTLINED_FUNCTION_2();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  NSStringFromSelector(v2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_4_1() modelURL];
  OUTLINED_FUNCTION_0_10();
  _os_log_error_impl(&dword_1DB8AB000, v0, OS_LOG_TYPE_ERROR, "%@: modelURL=%@ does not exist", v4, 0x16u);
}

+ (void)cloneIfWritable:isEncryptedModel:cloneDirectory:.cold.2()
{
  OUTLINED_FUNCTION_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  SEL v2 = [(id)OUTLINED_FUNCTION_4_1() modelURL];
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_0_2(&dword_1DB8AB000, v3, v4, "%@: modelURL=%@ is writable. Attempting copyfile()", v5, v6, v7, v8, v9);
}

@end