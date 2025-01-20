@interface BSUIMappedImageCacheRegistry
- (id)_initWithCachesPath:(id)a1;
- (id)tmpPath;
@end

@implementation BSUIMappedImageCacheRegistry

- (id)_initWithCachesPath:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)BSUIMappedImageCacheRegistry;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)*((void *)a1 + 1);
      *((void *)a1 + 1) = v4;

      v6 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = 0;

      *((_DWORD *)a1 + 8) = 0;
      v7 = (void *)*((void *)a1 + 3);
      *((void *)a1 + 3) = 0;
    }
  }

  return a1;
}

- (id)tmpPath
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    id v3 = *(void **)(a1 + 16);
    if (!v3)
    {
      uint64_t v4 = (void *)MEMORY[0x1A623AD30]();
      v5 = [*(id *)(a1 + 8) URLByAppendingPathComponent:@"MappedImageCache" isDirectory:1];
      v6 = objc_opt_new();
      id v27 = 0;
      char v7 = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v27];
      id v8 = v27;

      if ((v7 & 1) == 0)
      {
        v22 = [NSString stringWithFormat:@"Couldn't create directory at %@ with error %@", v5, v8];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel_tmpPath);
          id v23 = (id)objc_claimAutoreleasedReturnValue();
          v24 = (objc_class *)objc_opt_class();
          v25 = NSStringFromClass(v24);
          *(_DWORD *)v32 = 138544642;
          id v33 = v23;
          __int16 v34 = 2114;
          v35 = v25;
          __int16 v36 = 2048;
          uint64_t v37 = a1;
          __int16 v38 = 2114;
          v39 = @"BSUIMappedImageCache.m";
          __int16 v40 = 1024;
          int v41 = 95;
          __int16 v42 = 2114;
          v43 = v22;
          _os_log_error_impl(&dword_1A2B0C000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v32, 0x3Au);
        }
        [v22 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1A2B15B00);
      }
      id v9 = v5;
      [v9 fileSystemRepresentation];
      uint64_t v10 = _dirhelper_relative();
      if (v10)
      {
        v11 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v10 isDirectory:1 relativeToURL:0];
        v12 = [v11 path];
        uint64_t v13 = [v12 copy];
        v14 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v13;

        v15 = BSLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = *(void *)(a1 + 8);
          *(_DWORD *)buf = 138412546;
          id v29 = v9;
          __int16 v30 = 2112;
          uint64_t v31 = v16;
          _os_log_impl(&dword_1A2B0C000, v15, OS_LOG_TYPE_DEFAULT, "BSUIMappedImageCache found relative tmpDir=%@ for %@", buf, 0x16u);
        }
      }
      else
      {
        v17 = NSTemporaryDirectory();
        uint64_t v18 = [v17 copy];
        v19 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v18;

        v15 = BSLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          uint64_t v26 = *(void *)(a1 + 16);
          *(_DWORD *)buf = 138412546;
          id v29 = v9;
          __int16 v30 = 2112;
          uint64_t v31 = v26;
          _os_log_fault_impl(&dword_1A2B0C000, v15, OS_LOG_TYPE_FAULT, "BSUIMappedImageCache failed to get relative tmpDir from dirhelper for %@ : falling back to NSTemporaryDirectory=%@", buf, 0x16u);
        }
      }

      id v3 = *(void **)(a1 + 16);
    }
    id v20 = v3;
    os_unfair_lock_unlock(v2);
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_tmpPath, 0);

  objc_storeStrong((id *)&self->_cachesPath, 0);
}

@end