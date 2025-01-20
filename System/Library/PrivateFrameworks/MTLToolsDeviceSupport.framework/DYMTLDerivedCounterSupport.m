@interface DYMTLDerivedCounterSupport
+ (void)mergeDictionaries:(id)a3 right:(id)a4;
- (BOOL)addAnalysisWithPrefix:(id)a3 andScriptPrefix:(id)a4;
- (DYMTLDerivedCounterSupport)init;
- (DYMTLDerivedCounterSupport)initWithAcceleratorPort:(unsigned int)a3;
- (DYMTLDerivedCounterSupport)initWithMTLDevice:(id)a3;
- (NSMutableDictionary)configurationVariables;
- (NSMutableDictionary)counterDictionary;
- (NSString)analysisScript;
- (NSString)derivedCounterScript;
- (NSString)metalPluginName;
- (void)_addGPUTimeEntry;
- (void)_loadAnalysis:(id)a3 vendorStringNames:(id)a4 vendorScriptPrefix:(id)a5;
@end

@implementation DYMTLDerivedCounterSupport

+ (void)mergeDictionaries:(id)a3 right:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v17 = a4;
  v6 = [v5 objectForKeyedSubscript:@"Version"];
  if (v6)
  {
    v7 = [v5 objectForKeyedSubscript:@"Version"];
    v8 = [v17 objectForKeyedSubscript:@"Version"];
    char v9 = [v7 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      _DYOLog();
      goto LABEL_21;
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v17;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v11) {
    goto LABEL_19;
  }
  uint64_t v12 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(v10);
      }
      uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
      v15 = [v5 objectForKey:v14];
      v16 = [v10 objectForKey:v14];
      if (!v15)
      {
        [v5 setObject:v16 forKeyedSubscript:v14];
        goto LABEL_17;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_17;
        }
        [v15 addObjectsFromArray:v16];
        goto LABEL_16;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          +[DYMTLDerivedCounterSupport mergeDictionaries:v15 right:v16];
LABEL_16:
        }
      }
LABEL_17:
    }
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v11);
LABEL_19:

LABEL_21:
}

- (BOOL)addAnalysisWithPrefix:(id)a3 andScriptPrefix:(id)a4
{
  id v6 = a4;
  v7 = [a3 stringByAppendingString:@"-counters.plist"];
  id v27 = 0;
  v8 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v7 options:0 error:&v27];
  id v9 = v27;
  if (v8)
  {
    id v26 = 0;
    id v10 = [MEMORY[0x263F08AC0] propertyListWithData:v8 options:1 format:0 error:&v26];
    id v11 = v26;
    if (v11)
    {
      _DYOLog();
    }
    else if (v10)
    {
      +[DYMTLDerivedCounterSupport mergeDictionaries:self->_counterDictionary right:v10];
    }

    uint64_t v12 = [v6 stringByAppendingString:@"-analysis.js"];
    id v25 = 0;
    v13 = (void *)[[NSString alloc] initWithContentsOfFile:v12 encoding:4 error:&v25];
    id v14 = v25;
    if (v14)
    {
      _DYOLog();
      analysisScript = self->_analysisScript;
      self->_analysisScript = (NSString *)&stru_270455188;
    }
    else
    {
      v16 = self->_analysisScript;
      if (v16)
      {
        id v17 = [(NSString *)v16 stringByAppendingString:v13];
      }
      else
      {
        id v17 = v13;
      }
      analysisScript = self->_analysisScript;
      self->_analysisScript = v17;
    }

    long long v18 = [v6 stringByAppendingString:@"-derived.js"];

    id v24 = 0;
    long long v19 = (void *)[[NSString alloc] initWithContentsOfFile:v18 encoding:4 error:&v24];
    id v9 = v24;
    if (v9)
    {
      _DYOLog();
    }
    else
    {
      derivedCounterScript = self->_derivedCounterScript;
      if (derivedCounterScript)
      {
        long long v21 = [(NSString *)derivedCounterScript stringByAppendingString:v19];
      }
      else
      {
        long long v21 = v19;
      }
      v22 = self->_derivedCounterScript;
      self->_derivedCounterScript = v21;
    }
  }

  return v8 != 0;
}

- (void)_loadAnalysis:(id)a3 vendorStringNames:(id)a4 vendorScriptPrefix:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v30 = a3;
  id v24 = a4;
  id v25 = a5;
  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  counterDictionary = self->_counterDictionary;
  v29 = self;
  self->_counterDictionary = v8;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v26 = [&unk_2704585E0 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v26)
  {
    uint64_t v23 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v36 != v23) {
          objc_enumerationMutation(&unk_2704585E0);
        }
        uint64_t v10 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        if (v25
          && (objc_msgSend(NSString, "stringWithFormat:", v10, v30, v25),
              (id v11 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v27 = v11;
          uint64_t v12 = [v11 stringByStandardizingPath];
        }
        else
        {
          uint64_t v12 = 0;
          id v27 = 0;
        }
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v13 = v24;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v32;
LABEL_12:
          uint64_t v16 = 0;
          while (1)
          {
            if (*(void *)v32 != v15) {
              objc_enumerationMutation(v13);
            }
            id v17 = *(void **)(*((void *)&v31 + 1) + 8 * v16);
            if (([v17 containsString:@"autocorr"] & 1) == 0)
            {
              long long v18 = objc_msgSend(NSString, "stringWithFormat:", v10, v30, v17);
              uint64_t v19 = [v18 stringByStandardizingPath];
              long long v20 = (void *)v19;
              long long v21 = v12 ? v12 : (void *)v19;
              BOOL v22 = [(DYMTLDerivedCounterSupport *)v29 addAnalysisWithPrefix:v19 andScriptPrefix:v21];

              if (v22) {
                break;
              }
            }
            if (v14 == ++v16)
            {
              uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
              if (v14) {
                goto LABEL_12;
              }
              break;
            }
          }
        }
      }
      uint64_t v26 = [&unk_2704585E0 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v26);
  }
}

- (void)_addGPUTimeEntry
{
  {
    -[DYMTLDerivedCounterSupport _addGPUTimeEntry]::kGPUTimeCounter = (uint64_t)(id)*MEMORY[0x263F3FBD0];
  }
  id v9 = (id)objc_opt_new();
  v3 = [MEMORY[0x263EFF8C0] arrayWithObject:@"MTLStat_nSec"];
  [v9 setObject:v3 forKeyedSubscript:@"counters"];

  [v9 setObject:@"GPU Time" forKeyedSubscript:@"name"];
  [v9 setObject:@"GPU Time in nSec" forKeyedSubscript:@"description"];
  [v9 setObject:@"Count" forKeyedSubscript:@"type"];
  v4 = [(NSMutableDictionary *)self->_counterDictionary objectForKeyedSubscript:*MEMORY[0x263F3FB50]];
  [v4 setObject:v9 forKeyedSubscript:-[DYMTLDerivedCounterSupport _addGPUTimeEntry]::kGPUTimeCounter];
  derivedCounterScript = self->_derivedCounterScript;
  if (derivedCounterScript)
  {
    id v6 = [NSString stringWithUTF8String:"\nfunction GPUToolsGPUTime()\n{\n   return MTLStat_nSec\n}\n"];
    v7 = [(NSString *)derivedCounterScript stringByAppendingString:v6];

    v8 = self->_derivedCounterScript;
    self->_derivedCounterScript = v7;
  }
}

- (DYMTLDerivedCounterSupport)initWithMTLDevice:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DYMTLDerivedCounterSupport;
  id v5 = [(DYMTLDerivedCounterSupport *)&v9 init];
  if (!v5) {
    goto LABEL_6;
  }
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    uint64_t v6 = [v4 baseObject];

    id v4 = (id)v6;
  }
  if (objc_opt_respondsToSelector())
  {
    id v5 = -[DYMTLDerivedCounterSupport initWithAcceleratorPort:](v5, "initWithAcceleratorPort:", [v4 acceleratorPort]);
    v7 = v5;
  }
  else
  {
LABEL_6:
    v7 = 0;
  }

  return v7;
}

- (DYMTLDerivedCounterSupport)initWithAcceleratorPort:(unsigned int)a3
{
  v23.receiver = self;
  v23.super_class = (Class)DYMTLDerivedCounterSupport;
  id v4 = [(DYMTLDerivedCounterSupport *)&v23 init];
  if (v4)
  {
    CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"MetalPluginName", 0, 0);
    if (CFProperty)
    {
      objc_storeStrong((id *)&v4->_metalPluginName, CFProperty);
      uint64_t v6 = (__CFString *)IORegistryEntryCreateCFProperty(a3, @"MetalStatisticsName", 0, 0);
      if (v6) {
        v7 = v6;
      }
      else {
        v7 = @"MetalStatistics";
      }
      CFTypeID v8 = CFGetTypeID(v7);
      if (v8 == CFStringGetTypeID())
      {
        objc_super v9 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v7, 0);
      }
      else
      {
        CFTypeID v11 = CFGetTypeID(v7);
        CFTypeID TypeID = CFArrayGetTypeID();
        BOOL v13 = v11 == TypeID;
        if (v11 == TypeID) {
          objc_super v9 = v7;
        }
        else {
          objc_super v9 = 0;
        }
        if (v13) {
          v7 = 0;
        }
      }
      id v14 = MTLCreateSystemDefaultDevice();
      uint64_t v15 = [v14 name];
      uint64_t v16 = [v15 compare:@"Unknown Unknown"];

      if (!v16 && [(__CFString *)v9 count])
      {
        id v17 = [(__CFString *)v9 firstObject];
        unint64_t v18 = [v17 rangeOfString:@"AGXMetalStatistics"];
        if ([v17 rangeOfString:@"AGXMetalStatisticsExternal"] == 0x7FFFFFFFFFFFFFFFLL
          && v18 < [v17 length])
        {
          uint64_t v19 = [v17 substringFromIndex:objc_msgSend(@"AGXMetalStatistics", "length")];
          long long v20 = [@"AGXMetalStatisticsExternal" stringByAppendingString:v19];

          [(__CFString *)v9 addObject:v20];
        }
      }
      if (v9)
      {
        [(DYMTLDerivedCounterSupport *)v4 _loadAnalysis:CFProperty vendorStringNames:v9 vendorScriptPrefix:0];
        [(DYMTLDerivedCounterSupport *)v4 _addGPUTimeEntry];
      }
      if (v7) {
        CFRelease(v7);
      }
      CFRelease(CFProperty);
      long long v21 = v4;
    }
    else
    {
      uint64_t v10 = v4;
    }
  }

  return v4;
}

- (DYMTLDerivedCounterSupport)init
{
  v9.receiver = self;
  v9.super_class = (Class)DYMTLDerivedCounterSupport;
  v2 = [(DYMTLDerivedCounterSupport *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    counterDictionary = v2->_counterDictionary;
    v2->_counterDictionary = v3;

    uint64_t v5 = objc_opt_new();
    configurationVariables = v2->_configurationVariables;
    v2->_configurationVariables = (NSMutableDictionary *)v5;

    v7 = v2;
  }

  return v2;
}

- (NSMutableDictionary)counterDictionary
{
  return self->_counterDictionary;
}

- (NSString)derivedCounterScript
{
  return self->_derivedCounterScript;
}

- (NSString)analysisScript
{
  return self->_analysisScript;
}

- (NSMutableDictionary)configurationVariables
{
  return self->_configurationVariables;
}

- (NSString)metalPluginName
{
  return self->_metalPluginName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalPluginName, 0);
  objc_storeStrong((id *)&self->_configurationVariables, 0);
  objc_storeStrong((id *)&self->_analysisScript, 0);
  objc_storeStrong((id *)&self->_derivedCounterScript, 0);
  objc_storeStrong((id *)&self->_counterDictionary, 0);
}

@end