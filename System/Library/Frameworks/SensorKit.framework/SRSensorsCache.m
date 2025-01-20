@interface SRSensorsCache
+ (uint64_t)defaultCache;
+ (void)initialize;
+ (void)setDefaultCache:(id)a3;
- (SRSensorDescription)descriptionForSensor:(uint64_t)a1;
- (SRSensorsCache)init;
- (SRSensorsCache)initWithDirectories:(id)a3;
- (void)allSensorDescriptions;
- (void)dealloc;
@end

@implementation SRSensorsCache

- (SRSensorDescription)descriptionForSensor:(uint64_t)a1
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  v4 = objc_msgSend(a2, "sr_sensorByDeletingDeletionRecord");
  char v5 = [v4 isEqualToString:a2];
  v6 = (SRSensorDescription *)[*(id *)(a1 + 8) objectForKey:v4];
  if (!v6)
  {
    char v26 = v5;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v7 = *(void **)(a1 + 16);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v8)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(void *)v29;
      uint64_t v27 = *MEMORY[0x263F07F70];
      *(void *)&long long v9 = 138543362;
      long long v25 = v9;
LABEL_5:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend(v4, "stringByAppendingPathExtension:", @"plist", v25);
        if (!v14) {
          break;
        }
        uint64_t v15 = [NSURL fileURLWithPath:v14 isDirectory:0 relativeToURL:v13];
        v32 = 0;
        uint64_t v16 = [NSDictionary dictionaryWithContentsOfURL:v15 error:&v32];
        if (v16)
        {
          v6 = [[SRSensorDescription alloc] initWithDictionary:v16];
          uint64_t v17 = [(SRSensorDescription *)v6 name];
          [*(id *)(a1 + 8) setObject:v6 forKey:v17];
          if ([(SRSensorDescription *)v6 legacyName]) {
            objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v6, -[SRSensorDescription legacyName](v6, "legacyName"));
          }
          v18 = SRLogSensorsCache;
          if (os_log_type_enabled((os_log_t)SRLogSensorsCache, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v35 = v17;
            __int16 v36 = 2114;
            v37 = v6;
            _os_log_impl(&dword_21FCA3000, v18, OS_LOG_TYPE_INFO, "Cached description for %{public}@, %{public}@", buf, 0x16u);
          }
          if (v6) {
            goto LABEL_27;
          }
        }
        else if (objc_msgSend((id)-[SRSensorDescription domain](v32, "domain"), "isEqualToString:", v27) {
               && [(SRSensorDescription *)v32 code] == 260)
        }
        {
          v19 = SRLogSensorsCache;
          if (os_log_type_enabled((os_log_t)SRLogSensorsCache, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v25;
            uint64_t v35 = v15;
            _os_log_impl(&dword_21FCA3000, v19, OS_LOG_TYPE_INFO, "%{public}@ not found", buf, 0xCu);
          }
        }
        else
        {
          v20 = SRLogSensorsCache;
          if (os_log_type_enabled((os_log_t)SRLogSensorsCache, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v35 = v15;
            __int16 v36 = 2114;
            v37 = v32;
            _os_log_error_impl(&dword_21FCA3000, v20, OS_LOG_TYPE_ERROR, "Failed to parse %{public}@ because %{public}@", buf, 0x16u);
          }
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
          if (v10) {
            goto LABEL_5;
          }
          goto LABEL_24;
        }
      }
    }
    else
    {
LABEL_24:
      v21 = SRLogSensorsCache;
      if (os_log_type_enabled((os_log_t)SRLogSensorsCache, OS_LOG_TYPE_ERROR))
      {
        v24 = *(SRSensorDescription **)(a1 + 16);
        *(_DWORD *)buf = 138543618;
        uint64_t v35 = (uint64_t)v4;
        __int16 v36 = 2114;
        v37 = v24;
        _os_log_error_impl(&dword_21FCA3000, v21, OS_LOG_TYPE_ERROR, "Failed to find description for %{public}@ in %{public}@", buf, 0x16u);
      }
    }
    v6 = 0;
LABEL_27:
    char v5 = v26;
  }
  if (v6) {
    char v22 = v5;
  }
  else {
    char v22 = 1;
  }
  if (v22) {
    return v6;
  }

  return (SRSensorDescription *)+[SRSensorDescription sensorDescriptionForDeletionRecordFromDescription:v6];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogSensorsCache = (uint64_t)os_log_create("com.apple.SensorKit", "SensorsCache");
  }
}

+ (uint64_t)defaultCache
{
  self;
  uint64_t result = _MergedGlobals_1;
  if (!_MergedGlobals_1)
  {
    self;
    if (qword_26AB1A198 != -1) {
      dispatch_once(&qword_26AB1A198, &__block_literal_global_0);
    }
    return qword_26AB1A190;
  }
  return result;
}

+ (void)setDefaultCache:(id)a3
{
  if ((id)_MergedGlobals_1 != a3)
  {

    _MergedGlobals_1 = (uint64_t)a3;
  }
}

SRSensorsCache *__29__SRSensorsCache_sharedCache__block_invoke()
{
  uint64_t result = objc_alloc_init(SRSensorsCache);
  qword_26AB1A190 = (uint64_t)result;
  return result;
}

- (SRSensorsCache)init
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = NSURL;
  Class v4 = NSClassFromString(&cfstr_Srsensorreader.isa);
  if (!v4 || (uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", v4), "bundleURL")) == 0)
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager", 0), "URLForDirectory:inDomain:appropriateForURL:create:error:", 5, 8, 0, 0, &v16);
    if (!v6)
    {
      v7 = SRLogSensorsCache;
      if (os_log_type_enabled((os_log_t)SRLogSensorsCache, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v20 = v16;
        _os_log_fault_impl(&dword_21FCA3000, v7, OS_LOG_TYPE_FAULT, "Failed to locate the /System/Library directory because %{public}@", buf, 0xCu);
      }
      uint64_t v6 = [NSURL fileURLWithPath:@"/System/Library"];
    }
    uint64_t v5 = objc_msgSend(NSURL, "fileURLWithPath:isDirectory:relativeToURL:", objc_msgSend(NSString, "pathWithComponents:", &unk_26D173FD8), 1, v6);
  }
  uint64_t v8 = [v3 fileURLWithPath:@"SensorDescriptions" isDirectory:1 relativeToURL:v5];
  uint64_t v9 = [NSURL fileURLWithPath:@"/var/mobile/Library" isDirectory:1];
  uint64_t v10 = [NSURL fileURLWithPath:@"SensorKit" isDirectory:1 relativeToURL:v9];
  if (v10)
  {
    uint64_t v11 = [NSURL fileURLWithPath:@"SensorDescriptions" isDirectory:1 relativeToURL:v10];
    v18[0] = v8;
    v18[1] = v11;
    uint64_t v12 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v13 = v18;
    uint64_t v14 = 2;
  }
  else
  {
    uint64_t v17 = v8;
    uint64_t v12 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v13 = &v17;
    uint64_t v14 = 1;
  }
  return -[SRSensorsCache initWithDirectories:](self, "initWithDirectories:", [v12 arrayWithObjects:v13 count:v14]);
}

- (SRSensorsCache)initWithDirectories:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SRSensorsCache;
  Class v4 = [(SRSensorsCache *)&v6 init];
  if (v4)
  {
    v4->_sensorsCache = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    v4->_sensorDescriptionsDirs = (NSArray *)a3;
  }
  return v4;
}

- (void)dealloc
{
  self->_sensorDescriptionsDirs = 0;
  self->_sensorsCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)SRSensorsCache;
  [(SRSensorsCache *)&v3 dealloc];
}

- (void)allSensorDescriptions
{
  if (result)
  {
    v1 = result;
    v2 = [SRSensorDescriptionEnumerator alloc];
    if (v2)
    {
      v4.receiver = v2;
      v4.super_class = (Class)SRSensorDescriptionEnumerator;
      objc_super v3 = objc_msgSendSuper2(&v4, sel_init);
      if (v3) {
        v3[1] = v1;
      }
    }
    else
    {
      objc_super v3 = 0;
    }
    return v3;
  }
  return result;
}

@end