@interface HMFCache
+ (HMFCache)defaultCache;
- (BOOL)isExists;
- (HMFCache)init;
- (HMFCache)initWithName:(id)a3;
- (NSURL)URL;
@end

@implementation HMFCache

+ (HMFCache)defaultCache
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__HMFCache_defaultCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB4EED70 != -1) {
    dispatch_once(&qword_1EB4EED70, block);
  }
  v2 = (void *)_MergedGlobals_66;
  return (HMFCache *)v2;
}

void __24__HMFCache_defaultCache__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v2 = [v5 bundleIdentifier];
  uint64_t v3 = [v1 initWithName:v2];
  v4 = (void *)_MergedGlobals_66;
  _MergedGlobals_66 = v3;
}

- (HMFCache)init
{
  uint64_t v3 = [MEMORY[0x1E4F28F80] processInfo];
  v4 = [v3 processName];
  id v5 = [(HMFCache *)self initWithName:v4];

  return v5;
}

- (HMFCache)initWithName:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)HMFCache;
  id v5 = [(HMFCache *)&v35 init];
  if (v5)
  {
    id v34 = v4;
    v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    v7 = [v6 URLsForDirectory:13 inDomains:1];

    id v8 = [v7 firstObject];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      v31 = v8;
      v32 = v5;
      id v33 = v4;
      uint64_t v12 = *(void *)v37;
      do
      {
        v13 = v9;
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v37 != v12) {
            objc_enumerationMutation(v13);
          }
          v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          LOBYTE(buf) = 0;
          v16 = objc_msgSend(v15, "URLByAppendingPathComponent:", v34, v31);
          v17 = [MEMORY[0x1E4F28CB8] defaultManager];
          v18 = [v16 path];
          int v19 = [v17 fileExistsAtPath:v18 isDirectory:&buf];
          int v20 = buf;

          if (v19) {
            BOOL v21 = v20 == 0;
          }
          else {
            BOOL v21 = 1;
          }
          if (!v21)
          {
            id v8 = v15;

            id v5 = v32;
            id v4 = v33;
            id v9 = v13;
            goto LABEL_15;
          }
        }
        id v9 = v13;
        uint64_t v11 = [v13 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v11);
      id v5 = v32;
      id v4 = v33;
      id v8 = v31;
    }
LABEL_15:

    if (!v8)
    {
      v22 = (void *)MEMORY[0x19F3A87A0]();
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = HMFGetLogIdentifier(0);
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v24;
        _os_log_impl(&dword_19D57B000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to determine preferred cache directory", (uint8_t *)&buf, 0xCu);
      }
      v25 = (void *)MEMORY[0x1E4F1CB10];
      v26 = NSHomeDirectory();
      *(void *)&long long buf = v26;
      *((void *)&buf + 1) = @"Library";
      v41 = @"Caches";
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&buf count:3];
      id v8 = [v25 fileURLWithPathComponents:v27];
    }
    uint64_t v28 = [v8 URLByAppendingPathComponent:v34];

    URL = v5->_URL;
    v5->_URL = (NSURL *)v28;
  }
  return v5;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isExists
{
  return self->_exists;
}

- (void).cxx_destruct
{
}

@end