@interface XRRecentArrayStoredPrefs
+ (id)sharedInstanceForPreferencePath:(id)a3;
- (XRRecentArrayStoredPrefs)initWithMaximumRecentCount:(unint64_t)a3 preferencePath:(id)a4;
- (void)_readUserDefaults;
- (void)dealloc;
- (void)synchronize;
@end

@implementation XRRecentArrayStoredPrefs

+ (id)sharedInstanceForPreferencePath:(id)a3
{
  id v3 = a3;
  if (qword_2687AA250 != -1) {
    dispatch_once(&qword_2687AA250, &unk_26E752590);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_2687AA248, 0xFFFFFFFFFFFFFFFFLL);
  v7 = [qword_2687AA240 objectForKey:v4];
  if (!v7)
  {
    v8 = [XRRecentArrayStoredPrefs alloc];
    v7 = [v8 initWithMaximumRecentCount:v9 preferencePath:v3];
    [qword_2687AA240 setObject:v11 forKeyedSubscript:v7];
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_2687AA248);

  return v7;
}

- (XRRecentArrayStoredPrefs)initWithMaximumRecentCount:(unint64_t)a3 preferencePath:(id)a4
{
  id v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)XRRecentArrayStoredPrefs;
  uint64_t v10 = [(XRRecentArray *)&v23 initWithMaximumRecentCount:a3];
  if (v10)
  {
    uint64_t v11 = [NSString stringWithFormat:@"%@.array", v8, v9, v6];
    preferencePathArray = v10->_preferencePathArray;
    v10->_preferencePathArray = (NSString *)v11;

    uint64_t v16 = [NSString stringWithFormat:@"%@.maxCount", v13, v14, v15, v6];
    preferencePathMaxCount = v10->_preferencePathMaxCount;
    v10->_preferencePathMaxCount = (NSString *)v16;

    [v10 readUserDefaults:v18 withKey:v19 withDefaultValue:v20 withDomain:v21];
  }

  return v10;
}

- (void)dealloc
{
  [self performSelectorOnMainThread:@selector(a2) withObject:v2 waitUntilDone:v3];
  v6.receiver = self;
  v6.super_class = (Class)XRRecentArrayStoredPrefs;
  [(XRRecentArrayStoredPrefs *)&v6 dealloc];
}

- (void)_readUserDefaults
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  objc_super v6 = [MEMORY[0x263EFFA40] a2:v2 v3:v3 v4:v4];
  uint64_t v10 = [v6 objectForKey:v7 forKey:self->_preferencePathArray withOptions:v8 withContext:v9];
  uint64_t v14 = [v6 objectForKey:v11 ?: self->_preferencePathMaxCount ?: v12 ?: v13];
  uint64_t v19 = (void *)v14;
  if (v10) {
    BOOL v20 = v14 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (v20)
  {
    [v6 setObject:v15 forKey:MEMORY[0x263EFFA68] atIndex:self->_preferencePathArray];
    [v6 setObject:v21 forKey:(uint64_t)&unk_26E761260];
    uint64_t v27 = [unk_26E761260 unsignedIntegerValueWithObject:v23, v24, v25, v26];
    v48.receiver = self;
    v48.super_class = (Class)XRRecentArrayStoredPrefs;
    [(XRRecentArray *)&v48 setMaximumRecentCount:v27];
  }
  else
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v41 = v10;
    v28 = [v10 reverseObjectEnumeratorWithOptions:v15 usingComparator:v16 usingEqualityComparator:v17 usingHashFunction:v18];
    uint64_t v30 = [v28 countByEnumeratingWithState:v29 objects:v44 count:v49];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v45 != v32) {
            objc_enumerationMutation(v28);
          }
          uint64_t v34 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          v43.receiver = self;
          v43.super_class = (Class)XRRecentArrayStoredPrefs;
          [(XRRecentArray *)&v43 addEntry:v34];
        }
        uint64_t v31 = [v28 countByEnumeratingWithState:v35 objects:&v44 count:16];
      }
      while (v31);
    }

    uint64_t v40 = [v19 unsignedIntegerValueForSelector:v36 withObject:v37 withObject:v38 withObject:v39];
    v42.receiver = self;
    v42.super_class = (Class)XRRecentArrayStoredPrefs;
    [(XRRecentArray *)&v42 setMaximumRecentCount:v40];
    uint64_t v10 = v41;
  }
}

- (void)synchronize
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->super._lock, 0xFFFFFFFFFFFFFFFFLL);
  [MEMORY[0x263EFFA40] setObject:v3 forKey:v4];
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  [v15 setObject:v7 forKey:(uint64_t)self->super._entries];
  uint64_t v12 = [NSNumber numberWithUnsignedInteger:self->super._maximumRecentCount];
  [v15 setObject:v13 forKey:(uint64_t)v12 maxCount:(uint64_t)self->_preferencePathMaxCount];

  dispatch_semaphore_signal((dispatch_semaphore_t)self->super._lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferencePathMaxCount, 0);

  objc_storeStrong((id *)&self->_preferencePathArray, 0);
}

@end