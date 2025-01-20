@interface _ACPluginDBDirectory
+ (BOOL)supportsSecureCoding;
- (BOOL)refreshModificationDate;
- (_ACPluginDBDirectory)initWithCoder:(id)a3;
- (_ACPluginDBDirectory)initWithPath:(id)a3 priority:(int)a4;
- (id)scanBundle:(id)a3 loadable:(BOOL)a4;
- (void)bundlesChanged:(id)a3 shouldRescan:(BOOL)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)eventStreamCallback:(id)a3 flags:(const unsigned int *)a4;
- (void)loadAllComponents:(void *)a3;
- (void)monitorDirectory;
- (void)scanDirectory;
@end

@implementation _ACPluginDBDirectory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mChangedBundlePaths, 0);
  objc_storeStrong((id *)&self->mCarbonComponentHash, 0);
  objc_storeStrong((id *)&self->mBundlesByName, 0);
  objc_storeStrong((id *)&self->mFullPath, 0);
  objc_storeStrong((id *)&self->mDB, 0);
}

- (id)scanBundle:(id)a3 loadable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(NSString *)self->mFullPath stringByAppendingPathComponent:v6];
  v8 = [v7 stringByAppendingPathComponent:@"Info.plist"];
  double v9 = modDate(v8);
  uint64_t v10 = [(NSMutableDictionary *)self->mBundlesByName objectForKeyedSubscript:v6];
  v11 = (_ACPluginDBBundle *)v10;
  if (v10)
  {
    if (*(double *)(v10 + 16) == v9)
    {
      *(void *)(v10 + 24) = 0;
      goto LABEL_9;
    }
    *(double *)(v10 + 16) = v9;
    *(void *)(v10 + 24) = 0;
  }
  else
  {
    v11 = [[_ACPluginDBBundle alloc] initWithPath:v7 infoPlistModDate:v9 rsrcModDate:0.0];
  }
  mDB = self->mDB;
  if (mDB) {
    mDB->mDirty = 1;
  }
  [(_ACPluginDBBundle *)v11 scanWithPriority:self->mPriority loadable:v4 infoPlistPath:v8];
LABEL_9:
  v13 = v11;

  return v13;
}

- (void)scanDirectory
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v16 = (NSMutableDictionary *)objc_opt_new();
  if (!gAudioComponentLogCategory) {
    operator new();
  }
  v3 = *(id *)gAudioComponentLogCategory;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = [(NSString *)self->mFullPath UTF8String];
    *(_DWORD *)buf = 136315650;
    v23 = "AudioComponentPluginScanner.mm";
    __int16 v24 = 1024;
    int v25 = 465;
    __int16 v26 = 2080;
    v27 = v5;
    _os_log_impl(&dword_18FEC0000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d ACPL: Scanning %s", buf, 0x1Cu);
  }

  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  v7 = [v6 contentsOfDirectoryAtPath:self->mFullPath error:0];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v13 = [v12 pathExtension];
        if (([v13 isEqualToString:@"audiocomp"] & 1) != 0
          || [v13 isEqualToString:@"component"])
        {
          v14 = [(_ACPluginDBDirectory *)self scanBundle:v12 loadable:self->mComponentsLoadable];
          [(NSMutableDictionary *)v16 setObject:v14 forKey:v12];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  mBundlesByName = self->mBundlesByName;
  self->mBundlesByName = v16;

  self->mModificationDate = self->mCurrentModificationDate;
}

- (void)loadAllComponents:(void *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v4 = [(NSMutableDictionary *)self->mBundlesByName allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) loadAllComponents:a3];
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)monitorDirectory
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (self->mDB)
  {
    v4.version = 0;
    memset(&v4.retain, 0, 24);
    v4.info = self;
    v5[0] = self->mFullPath;
    v3 = FSEventStreamCreate(0, (FSEventStreamCallback)eventStreamCallback, &v4, (CFArrayRef)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v5, 1, 0, self, 0, 0, 0), 0xFFFFFFFFFFFFFFFFLL, 2.0, 0x15u);
    self->mFSMonitor = v3;
    FSEventStreamSetDispatchQueue(v3, (dispatch_queue_t)self->mDB->mDispatchQueue);
    FSEventStreamStart(self->mFSMonitor);
  }
}

- (void)eventStreamCallback:(id)a3 flags:(const unsigned int *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  self->mNrOfPathsChanged += [v17 count];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v17;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    int v8 = 0;
    uint64_t v9 = *(void *)v22;
    long long v18 = a4;
    while (2)
    {
      uint64_t v10 = 0;
      long long v11 = &a4[v8];
      int v19 = v7 + v8;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        if ((v11[v10] & 0x20) != 0)
        {
          self->mShouldRescan = 1;
          goto LABEL_14;
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
        uint64_t v13 = [v12 pathExtension];
        if (([v13 isEqualToString:@"audiocomp"] & 1) != 0
          || [v13 isEqualToString:@"component"])
        {
          [(NSMutableArray *)self->mChangedBundlePaths addObject:v12];
        }

        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      a4 = v18;
      int v8 = v19;
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  unint64_t mNrOfPathsChanged = self->mNrOfPathsChanged;
  dispatch_time_t v15 = dispatch_time(0, 2000000000);
  mDispatchQueue = self->mDB->mDispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50___ACPluginDBDirectory_eventStreamCallback_flags___block_invoke;
  block[3] = &unk_1E5688908;
  block[4] = self;
  block[5] = mNrOfPathsChanged;
  dispatch_after(v15, mDispatchQueue, block);
}

- (void)bundlesChanged:(id)a3 shouldRescan:(BOOL)a4
{
  BOOL v27 = a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->mDB) {
    __assert_rtn("-[_ACPluginDBDirectory bundlesChanged:shouldRescan:]", "AudioComponentPluginScanner.mm", 324, "mDB != nil");
  }
  memset(&v37, 0, 24);
  v37.mSorted = 1;
  memset(&v36, 0, 24);
  v36.mSorted = 1;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v6)
  {
    uint64_t v29 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v29) {
          objc_enumerationMutation(obj);
        }
        int v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (!gAudioComponentLogCategory) {
          operator new();
        }
        uint64_t v9 = *(id *)gAudioComponentLogCategory;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "AudioComponentPluginScanner.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 328;
          *(_WORD *)&buf[18] = 2112;
          *(void *)&buf[20] = v8;
          _os_log_impl(&dword_18FEC0000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@ changed", buf, 0x1Cu);
        }
        NSUInteger v11 = [(NSString *)self->mFullPath length];
        if (objc_msgSend(v8, "compare:options:range:", self->mFullPath, 0, 0, v11))
        {
          if (!gAudioComponentLogCategory) {
            operator new();
          }
          long long v20 = *(id *)gAudioComponentLogCategory;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            mFullPath = self->mFullPath;
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = "AudioComponentPluginScanner.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 331;
            *(_WORD *)&buf[18] = 2112;
            *(void *)&buf[20] = v8;
            *(_WORD *)&buf[28] = 2112;
            *(void *)&buf[30] = mFullPath;
            _os_log_impl(&dword_18FEC0000, v20, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@ doesn't start with %@", buf, 0x26u);
          }
          continue;
        }
        if ([v8 characterAtIndex:v11] == 47) {
          NSUInteger v12 = v11 + 1;
        }
        else {
          NSUInteger v12 = v11;
        }
        uint64_t v13 = [v8 substringFromIndex:v12];
        v14 = [v13 pathComponents];
        dispatch_time_t v15 = [v14 objectAtIndexedSubscript:0];

        int v16 = access((const char *)[v8 UTF8String], 5);
        uint64_t v17 = [(NSMutableDictionary *)self->mBundlesByName objectForKeyedSubscript:v15];
        long long v18 = (unsigned char *)v17;
        if (v17)
        {
          memset(buf, 0, 24);
          std::vector<std::shared_ptr<APComponent>>::__init_with_size[abi:ne180100]<std::shared_ptr<APComponent>*,std::shared_ptr<APComponent>*>(buf, *(void **)(v17 + 32), *(void **)(v17 + 40), (uint64_t)(*(void *)(v17 + 40) - *(void *)(v17 + 32)) >> 4);
          char v19 = v18[56];
        }
        else
        {
          memset(buf, 0, 32);
          char v19 = 1;
        }
        long long v23 = 0;
        buf[24] = v19;
        memset(&v31, 0, 24);
        v31.mSorted = 1;
        if (v16)
        {
          if (!v18) {
            goto LABEL_31;
          }
        }
        else
        {
          uint64_t v24 = [(_ACPluginDBDirectory *)self scanBundle:v15 loadable:self->mComponentsLoadable];
          int v25 = (BOOL *)v24;
          if (&v31 != (AudioComponentVector *)(v24 + 32)) {
            std::vector<std::shared_ptr<APComponent>>::__assign_with_size[abi:ne180100]<std::shared_ptr<APComponent>*,std::shared_ptr<APComponent>*>((uint64_t *)&v31, *(uint64_t **)(v24 + 32), *(uint64_t **)(v24 + 40), (uint64_t)(*(void *)(v24 + 40) - *(void *)(v24 + 32)) >> 4);
          }
          v31.mSorted = v25[56];
          long long v23 = v25;
          if (!v18) {
            goto LABEL_31;
          }
        }
        AudioComponentVector::subtract(&v30, (AudioComponentVector *)buf, &v31);
        AudioComponentVector::append(&v36, (const AudioComponentVector *)v30.__begin_, (const AudioComponentVector *)v30.__end_);
        v38 = &v30;
        std::vector<std::shared_ptr<CA::ADMPackFormat>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v38);
        AudioComponentVector::showAll(&v36, "removals from prevBundle");
LABEL_31:
        if (v23)
        {
          AudioComponentVector::subtract(&v30, &v31, (AudioComponentVector *)buf);
          AudioComponentVector::append(&v37, (const AudioComponentVector *)v30.__begin_, (const AudioComponentVector *)v30.__end_);
          v38 = &v30;
          std::vector<std::shared_ptr<CA::ADMPackFormat>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v38);
          AudioComponentVector::showAll(&v37, "additions from newBundle");
        }
        [(NSMutableDictionary *)self->mBundlesByName setObject:v23 forKeyedSubscript:v15];
        self->mDB->mDirty = 1;
        v30.__begin_ = &v31;
        std::vector<std::shared_ptr<CA::ADMPackFormat>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v30);
        v31.__begin_ = buf;
        std::vector<std::shared_ptr<CA::ADMPackFormat>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v31);
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v6);
  }

  if (v27)
  {
    memset(buf, 0, 24);
    buf[24] = 1;
    memset(&v31, 0, 24);
    v31.mSorted = 1;
    [(_ACPluginDBDirectory *)self loadAllComponents:buf];
    [(_ACPluginDBDirectory *)self scanDirectory];
    [(_ACPluginDBDirectory *)self loadAllComponents:&v31];
    AudioComponentVector::subtract(&v30, &v31, (AudioComponentVector *)buf);
    std::vector<std::shared_ptr<APComponent>>::__vdeallocate((uint64_t *)&v37);
    AudioComponentVector v37 = v30;
    memset(&v30, 0, 24);
    v38 = &v30;
    std::vector<std::shared_ptr<CA::ADMPackFormat>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v38);
    AudioComponentVector::subtract(&v30, (AudioComponentVector *)buf, &v31);
    std::vector<std::shared_ptr<APComponent>>::__vdeallocate((uint64_t *)&v36);
    AudioComponentVector v36 = v30;
    memset(&v30, 0, 24);
    v38 = &v30;
    std::vector<std::shared_ptr<CA::ADMPackFormat>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v38);
    v30.__begin_ = &v31;
    std::vector<std::shared_ptr<CA::ADMPackFormat>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v30);
    v31.__begin_ = buf;
    std::vector<std::shared_ptr<CA::ADMPackFormat>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v31);
  }
  if ([(_ACPluginDBDirectory *)self refreshModificationDate])
  {
    self->mModificationDate = self->mCurrentModificationDate;
    self->mDB->mDirty = 1;
  }
  if (v37.__begin_ != v37.__end_ || v36.__begin_ != v36.__end_)
  {
    f = self->mDB->mNotificationCallback.__f_.__f_;
    if (!f) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(void *, AudioComponentVector *, AudioComponentVector *))(*(void *)f + 48))(f, &v37, &v36);
  }
  [(_ACPluginDB *)self->mDB writeIfDirty];
  *(void *)buf = &v36;
  std::vector<std::shared_ptr<CA::ADMPackFormat>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  *(void *)buf = &v37;
  std::vector<std::shared_ptr<CA::ADMPackFormat>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
}

- (BOOL)refreshModificationDate
{
  double v3 = modDate(self->mFullPath);
  self->mCurrentModificationDate = v3;
  return self->mModificationDate != v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->mFullPath forKey:@"path"];
  [v4 encodeDouble:@"modDate" forKey:self->mModificationDate];
  [v4 encodeObject:self->mBundlesByName forKey:@"bundles"];
  [v4 encodeInt32:self->mPriority forKey:@"priority"];
}

- (_ACPluginDBDirectory)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
  mFullPath = self->mFullPath;
  self->mFullPath = v5;

  [v4 decodeDoubleForKey:@"modDate"];
  self->mModificationDate = v7;
  int v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  NSUInteger v11 = [v4 decodeObjectOfClasses:v10 forKey:@"bundles"];
  mBundlesByName = self->mBundlesByName;
  self->mBundlesByName = v11;

  self->mPriority = [v4 decodeInt32ForKey:@"priority"];
  uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
  mChangedBundlePaths = self->mChangedBundlePaths;
  self->mChangedBundlePaths = v13;

  self->unint64_t mNrOfPathsChanged = 0;
  self->mShouldRescan = 0;
  [(_ACPluginDBDirectory *)self refreshModificationDate];

  return self;
}

- (_ACPluginDBDirectory)initWithPath:(id)a3 priority:(int)a4
{
  id v7 = a3;
  objc_storeStrong((id *)&self->mFullPath, a3);
  self->mPriority = a4;
  int v8 = (NSMutableDictionary *)objc_opt_new();
  mBundlesByName = self->mBundlesByName;
  self->mBundlesByName = v8;

  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  mChangedBundlePaths = self->mChangedBundlePaths;
  self->mChangedBundlePaths = v10;

  self->unint64_t mNrOfPathsChanged = 0;
  self->mShouldRescan = 0;
  [(_ACPluginDBDirectory *)self refreshModificationDate];

  return self;
}

- (void)dealloc
{
  mFSMonitor = self->mFSMonitor;
  if (mFSMonitor)
  {
    FSEventStreamInvalidate(mFSMonitor);
    CFRelease(self->mFSMonitor);
  }
  v4.receiver = self;
  v4.super_class = (Class)_ACPluginDBDirectory;
  [(_ACPluginDBDirectory *)&v4 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end