@interface HMDiskCache
- (BOOL)storeCachedObjects:(id)a3 forCacheName:(id)a4;
- (HMDiskCache)initWithCachePath:(id)a3;
- (NSString)cachePath;
- (id)_cachePathForCacheName:(id)a1;
- (id)loadCachedObjectsForCacheWithName:(id)a3;
@end

@implementation HMDiskCache

- (HMDiskCache)initWithCachePath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDiskCache;
  v5 = [(HMDiskCache *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    cachePath = v5->_cachePath;
    v5->_cachePath = (NSString *)v6;
  }
  return v5;
}

- (id)loadCachedObjectsForCacheWithName:(id)a3
{
  v44[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = -[HMDiskCache _cachePathForCacheName:](self, v4);
  unsigned __int8 v37 = 0;
  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v7 = [v6 fileExistsAtPath:v5 isDirectory:&v37];

  if (!v7)
  {
    objc_super v9 = (void *)MEMORY[0x19F3A64A0]();
    v10 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v39 = v13;
      __int16 v40 = 2112;
      v41 = v5;
      v14 = "%{public}@The disk cache location being loaded (%@) does not exist yet";
      v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_INFO;
      goto LABEL_7;
    }
LABEL_8:

    id v17 = (id)MEMORY[0x1E4F1CC08];
    goto LABEL_9;
  }
  int v8 = v37;
  objc_super v9 = (void *)MEMORY[0x19F3A64A0]();
  v10 = self;
  v11 = HMFGetOSLogHandle();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v39 = v13;
      __int16 v40 = 2112;
      v41 = v5;
      v14 = "%{public}@The disk cache location being loaded (%@) is not a file";
      v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
LABEL_7:
      _os_log_impl(&dword_19D1A8000, v15, v16, v14, buf, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v39 = v19;
    __int16 v40 = 2112;
    v41 = v5;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@The disk cache location exists at %@, loading from disk", buf, 0x16u);
  }
  v20 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v5];
  v21 = (void *)MEMORY[0x1E4F1CAD0];
  v44[0] = objc_opt_class();
  v44[1] = objc_opt_class();
  v44[2] = objc_opt_class();
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
  v23 = [v21 setWithArray:v22];

  id v36 = 0;
  v24 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v23 fromData:v20 error:&v36];
  id v25 = v36;
  v26 = v25;
  if (!v24 || v25)
  {
    v32 = (void *)MEMORY[0x19F3A64A0]();
    v33 = v10;
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v39 = v35;
      __int16 v40 = 2112;
      v41 = v5;
      __int16 v42 = 2112;
      v43 = v26;
      _os_log_impl(&dword_19D1A8000, v34, OS_LOG_TYPE_ERROR, "%{public}@The disk cache location being loaded (%@) could not be unarchived: %@", buf, 0x20u);
    }
    id v17 = (id)MEMORY[0x1E4F1CC08];
  }
  else
  {
    id v27 = v24;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      v29 = v27;
    }
    else {
      v29 = 0;
    }
    if (isKindOfClass) {
      v30 = v27;
    }
    else {
      v30 = (void *)MEMORY[0x1E4F1CC08];
    }
    id v31 = v29;

    id v17 = v30;
  }

LABEL_9:

  return v17;
}

- (id)_cachePathForCacheName:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    v3 = NSString;
    id v4 = a2;
    v5 = [v2 cachePath];
    id v2 = [v3 stringWithFormat:@"%@/_HMDiskCache_%@", v5, v4];
  }

  return v2;
}

- (NSString)cachePath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

- (BOOL)storeCachedObjects:(id)a3 forCacheName:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = -[HMDiskCache _cachePathForCacheName:](self, v7);
  char v50 = 0;
  objc_super v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  v10 = [(HMDiskCache *)self cachePath];
  int v11 = [v9 fileExistsAtPath:v10 isDirectory:&v50];

  if (!v11)
  {
    v18 = [MEMORY[0x1E4F28CB8] defaultManager];
    v19 = [(HMDiskCache *)self cachePath];
    id v49 = 0;
    char v20 = [v18 createDirectoryAtPath:v19 withIntermediateDirectories:1 attributes:0 error:&v49];
    id v21 = v49;

    if ((v20 & 1) == 0)
    {
      v22 = (void *)MEMORY[0x19F3A64A0]();
      v23 = self;
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = HMFGetLogIdentifier();
        [(HMDiskCache *)v23 cachePath];
        id v26 = v7;
        v28 = id v27 = v8;
        *(_DWORD *)buf = 138543874;
        v52 = v25;
        __int16 v53 = 2112;
        id v54 = v28;
        __int16 v55 = 2112;
        id v56 = v21;
        _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to make disk cache directory %@ (%@).", buf, 0x20u);

        int v8 = v27;
        id v7 = v26;
      }
    }

LABEL_11:
    id v48 = 0;
    v29 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v48];
    id v30 = v48;
    if (v30 || !v29)
    {
      id v17 = (void *)MEMORY[0x19F3A64A0]();
      __int16 v42 = self;
      v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v52 = v44;
        __int16 v53 = 2112;
        id v54 = v6;
        __int16 v55 = 2112;
        id v56 = v8;
        __int16 v57 = 2112;
        id v58 = v30;
        _os_log_impl(&dword_19D1A8000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode cache object (%@) for disk cache path: %@, error: %@", buf, 0x2Au);
      }
      LOBYTE(v17) = 0;
      goto LABEL_23;
    }
    id v46 = v7;
    id v47 = 0;
    id v31 = v8;
    LODWORD(v17) = [v29 writeToFile:v8 options:1 error:&v47];
    id v32 = v47;
    v33 = (void *)MEMORY[0x19F3A64A0]();
    v34 = self;
    v35 = HMFGetOSLogHandle();
    id v36 = v35;
    if (v17)
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        unsigned __int8 v37 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v52 = v37;
        __int16 v53 = 2112;
        id v54 = v6;
        __int16 v55 = 2112;
        id v56 = v31;
        v38 = "%{public}@Wrote cache object (%@) to disk cache at path: %@";
        v39 = v36;
        os_log_type_t v40 = OS_LOG_TYPE_INFO;
        uint32_t v41 = 32;
LABEL_21:
        _os_log_impl(&dword_19D1A8000, v39, v40, v38, buf, v41);
      }
    }
    else if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v37 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v52 = v37;
      __int16 v53 = 2112;
      id v54 = v6;
      __int16 v55 = 2112;
      id v56 = v31;
      __int16 v57 = 2112;
      id v58 = v32;
      v38 = "%{public}@Failed to cache object (%@) for disk cache path: %@ with error %@";
      v39 = v36;
      os_log_type_t v40 = OS_LOG_TYPE_ERROR;
      uint32_t v41 = 42;
      goto LABEL_21;
    }

    int v8 = v31;
    id v7 = v46;
LABEL_23:

    goto LABEL_24;
  }
  if (v50) {
    goto LABEL_11;
  }
  v12 = (void *)MEMORY[0x19F3A64A0]();
  v13 = self;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = HMFGetLogIdentifier();
    os_log_type_t v16 = [(HMDiskCache *)v13 cachePath];
    *(_DWORD *)buf = 138543618;
    v52 = v15;
    __int16 v53 = 2112;
    id v54 = v16;
    _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@The disk cache location %@ is not a directory", buf, 0x16u);
  }
  LOBYTE(v17) = 0;
LABEL_24:

  return (char)v17;
}

@end