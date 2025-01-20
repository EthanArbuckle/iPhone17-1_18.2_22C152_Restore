@interface PEPServiceConfiguration
+ (id)sharedInstance;
- (BOOL)registerNetworkDefaultsForAppID:(id)a3;
- (BOOL)registerNetworkDefaultsForAppIDs:(id)a3 forceUpdate:(BOOL)a4;
- (PEPServiceConfiguration)init;
- (void)_postNotification;
- (void)_updateDefaults:(id)a3;
- (void)dealloc;
@end

@implementation PEPServiceConfiguration

+ (id)sharedInstance
{
  id result = (id)_sharedInstance;
  if (!_sharedInstance)
  {
    id result = objc_alloc_init(PEPServiceConfiguration);
    _sharedInstance = (uint64_t)result;
  }
  return result;
}

- (PEPServiceConfiguration)init
{
  v4.receiver = self;
  v4.super_class = (Class)PEPServiceConfiguration;
  v2 = [(PEPServiceConfiguration *)&v4 init];
  if (v2) {
    v2->_cacheFilePath = (NSString *)(id)[@"~/Library/Caches/com.apple.pep.configuration.plist" stringByExpandingTildeInPath];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PEPServiceConfiguration;
  [(PEPServiceConfiguration *)&v3 dealloc];
}

- (void)_postNotification
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = [MEMORY[0x1E4F28EA0] notificationWithName:@"PEPServiceConfigurationRegistrationComplete" object:self];
  [v3 postNotification:v4];
}

- (void)_updateDefaults:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  [MEMORY[0x1E4F29060] setThreadPriority:0.0];
  if (self->_shouldDownloadNetworkConfigFile)
  {
    v5 = (void *)downloadDictionary();
    if (!v5) {
      goto LABEL_24;
    }
    id v6 = v5;
    [v5 writeToFile:self->_cacheFilePath atomically:1];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSinceReferenceDate");
    self->_cachedFileLastModifyDate = v7;
  }
  else
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:self->_cacheFilePath];
    if (!v6) {
      goto LABEL_24;
    }
  }
  id v18 = v4;
  v19 = self;
  value = (void *)[objc_alloc(NSNumber) initWithDouble:self->_cachedFileLastModifyDate];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v24 = [a3 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v24)
  {
    uint64_t v22 = *(void *)v31;
    CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    id v21 = v6;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(a3);
        }
        uint64_t v25 = v10;
        v11 = *(__CFString **)(*((void *)&v30 + 1) + 8 * v10);
        CFPreferencesSetValue(@"AppTimeInterval", value, v11, v8, v9);
        v12 = objc_msgSend(v6, "objectForKey:", -[__CFString lastPathComponent](v11, "lastPathComponent"));
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          v13 = (void *)[v12 allKeys];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v27;
            while (2)
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v27 != v16) {
                  objc_enumerationMutation(v13);
                }
                if ((objc_msgSend((id)(id)CFPreferencesCopyValue(*(CFStringRef *)(*((void *)&v26 + 1) + 8 * i), v11, v8, v9), "isEqual:", objc_msgSend(v12, "objectForKey:", *(void *)(*((void *)&v26 + 1) + 8 * i))) & 1) == 0)
                {
                  CFPreferencesSetMultiple((CFDictionaryRef)v12, 0, v11, v8, v9);
                  CFPreferencesSynchronize(v11, v8, v9);
                  id v6 = v21;
                  goto LABEL_21;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
              id v6 = v21;
              if (v15) {
                continue;
              }
              break;
            }
          }
        }
LABEL_21:
        uint64_t v10 = v25 + 1;
      }
      while (v25 + 1 != v24);
      uint64_t v24 = [a3 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v24);
  }

  id v4 = v18;
  self = v19;
LABEL_24:
  -[PEPServiceConfiguration performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel__postNotification, objc_msgSend(MEMORY[0x1E4F29060], "mainThread", v18), 0, 0);
}

- (BOOL)registerNetworkDefaultsForAppID:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObject:a3];
  return [(PEPServiceConfiguration *)self registerNetworkDefaultsForAppIDs:v4 forceUpdate:0];
}

- (BOOL)registerNetworkDefaultsForAppIDs:(id)a3 forceUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  double v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfItemAtPath:error:", self->_cacheFilePath, 0);
  objc_msgSend((id)objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E4F28310]), "timeIntervalSinceReferenceDate");
  self->_double cachedFileLastModifyDate = v8;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v10 = v9 - self->_cachedFileLastModifyDate;
  if (v4) {
    double v11 = 86400.0;
  }
  else {
    double v11 = 432000.0;
  }
  self->_shouldDownloadNetworkConfigFile = v10 > v11;
  if (v10 > v11)
  {
    BOOL v12 = 0;
LABEL_19:
    uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F29060]) initWithTarget:self selector:sel__updateDefaults_ object:a3];
    [v25 start];

    return self->_shouldDownloadNetworkConfigFile || v12;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v13 = [a3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    CFStringRef v16 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFStringRef v17 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(a3);
        }
        v19 = (void *)CFPreferencesCopyValue(@"AppTimeInterval", *(CFStringRef *)(*((void *)&v26 + 1) + 8 * i), v16, v17);
        [v19 doubleValue];
        double v21 = v20;
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        if (v22 - v21 > 432000.0)
        {

LABEL_18:
          BOOL v12 = 1;
          goto LABEL_19;
        }
        double cachedFileLastModifyDate = self->_cachedFileLastModifyDate;

        if (v21 < cachedFileLastModifyDate) {
          goto LABEL_18;
        }
      }
      uint64_t v14 = [a3 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
  BOOL result = 0;
  if (self->_shouldDownloadNetworkConfigFile) {
    goto LABEL_19;
  }
  return result;
}

@end