@interface _ACPluginDB
+ (BOOL)supportsSecureCoding;
+ (id)path;
- (AudioComponentVector)postInit:(SEL)a3;
- (_ACPluginDB)init;
- (_ACPluginDB)initWithCoder:(id)a3;
- (id).cxx_construct;
- (void)encodeWithCoder:(id)a3;
- (void)initialScanDirectory:(id)a3 priority:(int)a4 components:(void *)a5;
@end

@implementation _ACPluginDB

+ (id)path
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 objectAtIndexedSubscript:0];
  v4 = [v3 stringByAppendingPathComponent:@"com.apple.audio.components"];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 11) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCarbonComponentHash, 0);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](self->mScanHashCallback.__f_.__buf_.__lx);
  std::__function::__value_func<void ()(AudioComponentVector &,AudioComponentVector &)>::~__value_func[abi:ne180100](self->mNotificationCallback.__f_.__buf_.__lx);
  objc_storeStrong((id *)&self->mDispatchQueue, 0);
  objc_storeStrong((id *)&self->mSearchDirectories, 0);
}

- (void)initialScanDirectory:(id)a3 priority:(int)a4 components:(void *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (const char *)[v8 UTF8String];
  if (!access(v9, 5))
  {

    uint64_t v10 = [(NSMutableDictionary *)self->mSearchDirectories objectForKeyedSubscript:v8];
    v11 = (double *)v10;
    if (v10)
    {
      objc_storeStrong((id *)(v10 + 8), self);
      if (v11[3] == v11[7])
      {
        [v11 loadAllComponents:a5];
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      v14 = [[_ACPluginDBDirectory alloc] initWithPath:v8 priority:v6];
      objc_storeStrong((id *)&v14->mDB, self);
      [(NSMutableDictionary *)self->mSearchDirectories setObject:v14 forKeyedSubscript:v8];
      self->mDirty = 1;
      v11 = (double *)v14;
    }
    [v11 scanDirectory];
    [v11 loadAllComponents:a5];
    goto LABEL_13;
  }
  if (!gAudioComponentLogCategory) {
    operator new();
  }
  v12 = *(id *)gAudioComponentLogCategory;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 136315650;
    v16 = "AudioComponentPluginScanner.mm";
    __int16 v17 = 1024;
    int v18 = 647;
    __int16 v19 = 2080;
    v20 = v9;
    _os_log_impl(&dword_18FEC0000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d ACPL: can't access %s", (uint8_t *)&v15, 0x1Cu);
  }

LABEL_14:
}

- (AudioComponentVector)postInit:(SEL)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v7 = (OS_dispatch_queue *)dispatch_queue_create("AudioComponentPluginScanner", 0);
  mDispatchQueue = self->mDispatchQueue;
  self->mDispatchQueue = v7;

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->mSorted = 1;
  BOOL v32 = a4;
  if (!a4)
  {
    v9 = getenv("HOME");
    v48[0] = v9;
    v48[1] = "";
    v48[2] = "/AppleInternal";
    v48[3] = 0;
    if (v9)
    {
      uint64_t v10 = 40;
      uint64_t v11 = 1;
      do
      {
        snprintf(__str, 0x400uLL, "%s/Library/Audio/Plug-Ins/Components", v9);
        v12 = [NSString stringWithUTF8String:__str];
        [(_ACPluginDB *)self initialScanDirectory:v12 priority:v10 components:retstr];

        uint64_t v10 = (v10 - 1);
        v9 = (char *)v48[v11++];
      }
      while (v9);
    }
  }
  if (!gAudioComponentLogCategory) {
    operator new();
  }
  v13 = *(id *)gAudioComponentLogCategory;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__str = 136315394;
    v50 = "AudioComponentPluginScanner.mm";
    __int16 v51 = 1024;
    int v52 = 608;
    _os_log_impl(&dword_18FEC0000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d ACPL: loading complete", (uint8_t *)__str, 0x12u);
  }
  int v15 = objc_opt_new();
  v16 = objc_opt_new();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  __int16 v17 = [(NSMutableDictionary *)self->mSearchDirectories allKeys];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v42 != v19) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        v22 = [(NSMutableDictionary *)self->mSearchDirectories objectForKeyedSubscript:v21];
        if (v22[1]) {
          [v16 addObject:v22];
        }
        else {
          [v15 addObject:v21];
        }
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v18);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v23 = v15;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(v23);
        }
        [(NSMutableDictionary *)self->mSearchDirectories removeObjectForKey:*(void *)(*((void *)&v37 + 1) + 8 * j)];
        self->mDirty = 1;
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v24);
  }

  [(_ACPluginDB *)self writeIfDirty];
  if (!v32)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v27 = v16;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v34;
      do
      {
        for (uint64_t k = 0; k != v28; ++k)
        {
          if (*(void *)v34 != v29) {
            objc_enumerationMutation(v27);
          }
          [*(id *)(*((void *)&v33 + 1) + 8 * k) monitorDirectory];
        }
        uint64_t v28 = [v27 countByEnumeratingWithState:&v33 objects:v45 count:16];
      }
      while (v28);
    }
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt32:3 forKey:@"version"];
  [v4 encodeObject:self->mSearchDirectories forKey:@"directories"];
}

- (_ACPluginDB)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeInt32ForKey:@"version"] == 3)
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"directories"];
    mSearchDirectories = self->mSearchDirectories;
    self->mSearchDirectories = v8;
  }
  else
  {
    self = [(_ACPluginDB *)self init];
  }
  uint64_t v10 = self;

  return v10;
}

- (_ACPluginDB)init
{
  v3 = (NSMutableDictionary *)objc_opt_new();
  mSearchDirectories = self->mSearchDirectories;
  self->mSearchDirectories = v3;

  return self;
}

@end