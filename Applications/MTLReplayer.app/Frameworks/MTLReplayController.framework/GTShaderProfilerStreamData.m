@interface GTShaderProfilerStreamData
+ (BOOL)supportsSecureCoding;
+ (id)dataFromArchivedDataURL:(id)a3;
+ (id)steamDataFromData:(id)a3;
+ (id)streamDataClasses;
- (BOOL)dataSourceHasUnusedResources;
- (BOOL)supportsFileFormatV2;
- (GTShaderProfilerStreamData)init;
- (GTShaderProfilerStreamData)initWithCoder:(id)a3;
- (GTShaderProfilerStreamData)initWithNewFileFormatV2Support:(BOOL)a3;
- (NSArray)archivedAPSCounterData;
- (NSArray)archivedAPSData;
- (NSArray)archivedAPSTimelineData;
- (NSArray)archivedBatchIdFilteredCounterData;
- (NSArray)archivedGPUTimelineData;
- (NSArray)archivedShaderProfilerData;
- (NSArray)batchIdFilterableCounters;
- (NSArray)strings;
- (NSArray)unarchivedAPSCounterData;
- (NSArray)unarchivedAPSData;
- (NSArray)unarchivedAPSTimelineData;
- (NSArray)unarchivedBatchIdFilteredCounterData;
- (NSArray)unarchivedGPUTimelineData;
- (NSArray)unarchivedShaderProfilerData;
- (NSData)commandBufferInfoData;
- (NSData)encoderInfoData;
- (NSData)functionInfoData;
- (NSData)gpuCommandInfoData;
- (NSData)pipelineStateInfoData;
- (NSString)metalPluginName;
- (NSString)traceName;
- (_NSRange)dataSourceCaptureRange;
- (const)GPUCommandInfoFromFunctionIndex:(unsigned int)a3 subCommandIndex:(int)a4;
- (const)commandBuffers;
- (const)encoderInfoFromFunctionIndex:(unsigned int)a3;
- (const)encoders;
- (const)functionInfo;
- (const)gpuCommands;
- (const)pipelineStates;
- (id)_setupDataPath;
- (id)_unarchiveAndPatchAPSData:(id)a3 apsData:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encode:(id)a3 error:(id *)a4;
- (id)patchLocalFileData:(id)a3;
- (unint64_t)blitCallCount;
- (unint64_t)commandBufferInfoCount;
- (unint64_t)encoderInfoCount;
- (unint64_t)functionInfoCount;
- (unint64_t)gpuCommandInfoCount;
- (unint64_t)pipelineStateInfoCount;
- (unint64_t)version;
- (unsigned)gpuGeneration;
- (void)cleanupLocalFiles;
- (void)dealloc;
- (void)debugDump:(id)a3;
- (void)encodeAPSArrayForOldHost:(id)a3 array:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateUnarchivedBatchIdFilteredCounterData:(id)a3;
- (void)enumerateUnarchivedGPUTimelineData:(id)a3;
- (void)enumerateUnarchivedShaderProfilerData:(id)a3;
- (void)patchObjectIds:(id)a3;
- (void)setMetalPluginName:(id)a3;
- (void)setSupportsFileFormatV2:(BOOL)a3;
- (void)setTraceName:(id)a3;
- (void)unloadAPSData:(BOOL)a3;
@end

@implementation GTShaderProfilerStreamData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataFileURL, 0);
  objc_storeStrong((id *)&self->_tempAPSCounterData, 0);
  objc_storeStrong((id *)&self->_tempAPSTimelineData, 0);
  objc_storeStrong((id *)&self->_tempAPSData, 0);
  objc_storeStrong((id *)&self->_traceName, 0);
  objc_storeStrong((id *)&self->_metalPluginName, 0);
  objc_storeStrong((id *)&self->_batchIdFilterableCounters, 0);
  objc_storeStrong((id *)&self->_stringDict, 0);
  objc_storeStrong((id *)&self->_strings, 0);
  objc_storeStrong((id *)&self->_unarchivedAPSTimelineData, 0);
  objc_storeStrong((id *)&self->_unarchivedAPSCounterData, 0);
  objc_storeStrong((id *)&self->_unarchivedAPSData, 0);
  objc_storeStrong((id *)&self->_unarchivedBatchIdFilteredCounterData, 0);
  objc_storeStrong((id *)&self->_unarchivedGPUTimelineData, 0);
  objc_storeStrong((id *)&self->_unarchivedShaderProfilerData, 0);
  objc_storeStrong((id *)&self->_archivedAPSCounterData, 0);
  objc_storeStrong((id *)&self->_archivedAPSTimelineData, 0);
  objc_storeStrong((id *)&self->_archivedAPSData, 0);
  objc_storeStrong((id *)&self->_archivedBatchIdFilteredCounterData, 0);
  objc_storeStrong((id *)&self->_archivedGPUTimelineData, 0);
  objc_storeStrong((id *)&self->_archivedShaderProfilerData, 0);
  objc_storeStrong((id *)&self->_functionInfoData, 0);
  objc_storeStrong((id *)&self->_commandBufferInfoData, 0);
  objc_storeStrong((id *)&self->_pipelineStateInfoData, 0);
  objc_storeStrong((id *)&self->_encoderInfoData, 0);

  objc_storeStrong((id *)&self->_gpuCommandInfoData, 0);
}

- (void)setSupportsFileFormatV2:(BOOL)a3
{
  self->_supportsFileFormatV2 = a3;
}

- (BOOL)supportsFileFormatV2
{
  return self->_supportsFileFormatV2;
}

- (void)setTraceName:(id)a3
{
}

- (NSString)traceName
{
  return self->_traceName;
}

- (NSString)metalPluginName
{
  return self->_metalPluginName;
}

- (unsigned)gpuGeneration
{
  return self->_gpuGeneration;
}

- (NSArray)batchIdFilterableCounters
{
  return self->_batchIdFilterableCounters;
}

- (NSArray)archivedBatchIdFilteredCounterData
{
  return &self->_archivedBatchIdFilteredCounterData->super;
}

- (_NSRange)dataSourceCaptureRange
{
  NSUInteger length = self->_captureRange.length;
  NSUInteger location = self->_captureRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)dataSourceHasUnusedResources
{
  return self->_dataSourceHasUnusedResources;
}

- (NSArray)strings
{
  return &self->_strings->super;
}

- (NSData)functionInfoData
{
  return &self->_functionInfoData->super;
}

- (NSArray)archivedAPSCounterData
{
  return &self->_archivedAPSCounterData->super;
}

- (NSArray)archivedAPSTimelineData
{
  return &self->_archivedAPSTimelineData->super;
}

- (NSArray)archivedAPSData
{
  return &self->_archivedAPSData->super;
}

- (NSArray)archivedShaderProfilerData
{
  return &self->_archivedShaderProfilerData->super;
}

- (NSArray)archivedGPUTimelineData
{
  return &self->_archivedGPUTimelineData->super;
}

- (NSData)commandBufferInfoData
{
  return &self->_commandBufferInfoData->super;
}

- (NSData)pipelineStateInfoData
{
  return &self->_pipelineStateInfoData->super;
}

- (NSData)encoderInfoData
{
  return &self->_encoderInfoData->super;
}

- (NSData)gpuCommandInfoData
{
  return &self->_gpuCommandInfoData->super;
}

- (unint64_t)blitCallCount
{
  return self->_blitCallCount;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)dealloc
{
  dataFileURL = self->_dataFileURL;
  if (dataFileURL) {
    [(NSURL *)dataFileURL stopAccessingSecurityScopedResource];
  }
  v4.receiver = self;
  v4.super_class = (Class)GTShaderProfilerStreamData;
  [(GTShaderProfilerStreamData *)&v4 dealloc];
}

- (void)cleanupLocalFiles
{
  if (self->_dataFileURL)
  {
    v3 = +[NSFileManager defaultManager];
    objc_super v4 = [(NSURL *)self->_dataFileURL path];
    [v3 removeItemAtPath:v4 error:0];

    dataFileURL = self->_dataFileURL;
    self->_dataFileURL = 0;
  }
}

- (id)_setupDataPath
{
  dataFileURL = self->_dataFileURL;
  if (dataFileURL)
  {
    v3 = dataFileURL;
  }
  else
  {
    v5 = [(GTShaderProfilerStreamData *)self traceName];
    v6 = [v5 stringByDeletingPathExtension];
    v7 = [v6 stringByAppendingString:@"_stream"];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      v10 = objc_opt_new();
      id v9 = [v10 UUIDString];
    }
    v11 = [@"/tmp/com.apple.gputools.profiling" stringByAppendingPathComponent:v9];
    v12 = [v11 stringByAppendingPathExtension:@"gpuprofiler_raw"];

    v13 = +[NSFileManager defaultManager];
    [v13 removeItemAtPath:v12 error:0];

    v14 = +[NSFileManager defaultManager];
    id v19 = 0;
    [v14 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v19];
    id v15 = v19;

    if (v15)
    {
      [(GTShaderProfilerStreamData *)self setSupportsFileFormatV2:0];
      v3 = 0;
    }
    else
    {
      v16 = +[NSURL fileURLWithPath:v12];
      v17 = self->_dataFileURL;
      self->_dataFileURL = v16;

      v3 = self->_dataFileURL;
    }
  }

  return v3;
}

- (id)encode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v27 = 0;
  v8 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:&v27];
  id v9 = v27;
  if (!v9)
  {
    v12 = [(GTShaderProfilerStreamData *)self _setupDataPath];
    if (v12 && [(GTShaderProfilerStreamData *)self supportsFileFormatV2])
    {
      v13 = [v12 URLByAppendingPathComponent:@"streamData"];
      id v26 = 0;
      [v8 writeToURL:v13 options:0 error:&v26];
      id v10 = v26;

      if (v10)
      {
        if (a4)
        {
LABEL_8:
          id v10 = v10;
          id v11 = 0;
          *a4 = v10;
LABEL_27:

          goto LABEL_28;
        }
LABEL_26:
        id v11 = 0;
        goto LABEL_27;
      }
      if (v6 && ([v6 isEqual:v12] & 1) == 0)
      {
        v21 = +[NSFileManager defaultManager];
        id v25 = 0;
        [v21 copyItemAtURL:v12 toURL:v6 error:&v25];
        id v10 = v25;

        if (v10)
        {
          if (a4) {
            goto LABEL_8;
          }
          goto LABEL_26;
        }
      }
      else
      {
        id v10 = 0;
      }
    }
    else
    {
      if (!v6 || ([v6 isEqual:v12] & 1) != 0)
      {
        v14 = [(GTShaderProfilerStreamData *)self traceName];
        id v15 = [v14 stringByDeletingPathExtension];
        v16 = v15;
        if (v15)
        {
          v17 = [v15 stringByAppendingPathExtension:@"gpuprofiler_raw"];
        }
        else
        {
          v18 = objc_opt_new();
          id v19 = [v18 UUIDString];
          v17 = [v19 stringByAppendingPathExtension:@"gpuprofiler_raw"];
        }
        id v11 = [v12 URLByAppendingPathComponent:v17];
        id v23 = 0;
        [v8 writeToURL:v11 options:1 error:&v23];
        id v10 = v23;

        goto LABEL_27;
      }
      id v24 = 0;
      [v8 writeToURL:v6 options:1 error:&v24];
      id v10 = v24;
    }
    if (v6) {
      v20 = v6;
    }
    else {
      v20 = v12;
    }
    id v11 = v20;
    goto LABEL_27;
  }
  id v10 = v9;
  if (a4)
  {
    id v10 = v9;
    id v11 = 0;
    *a4 = v10;
  }
  else
  {
    id v11 = 0;
  }
LABEL_28:

  return v11;
}

- (const)encoderInfoFromFunctionIndex:(unsigned int)a3
{
  _NSRange result = [(GTShaderProfilerStreamData *)self encoderInfoCount];
  if (result)
  {
    uint64_t v6 = 0;
    for (uint64_t i = 16; ; i += 40)
    {
      v8 = [(GTShaderProfilerStreamData *)self encoders];
      if (*(unint64_t *)((char *)&v8->var0 + i) == a3) {
        break;
      }
      if (++v6 >= [(GTShaderProfilerStreamData *)self encoderInfoCount]) {
        return 0;
      }
    }
    return &v8[v6];
  }
  return result;
}

- (const)GPUCommandInfoFromFunctionIndex:(unsigned int)a3 subCommandIndex:(int)a4
{
  _NSRange result = [(GTShaderProfilerStreamData *)self gpuCommandInfoCount];
  if (result)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    while (1)
    {
      id v10 = [(GTShaderProfilerStreamData *)self gpuCommands];
      if (v10[v8].var4 == a3 && v10[v8].var6 == a4) {
        break;
      }
      ++v9;
      ++v8;
      if (v9 >= [(GTShaderProfilerStreamData *)self gpuCommandInfoCount]) {
        return 0;
      }
    }
    return &v10[v9];
  }
  return result;
}

- (void)setMetalPluginName:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4 || ![v4 hasPrefix:@"AGXMetal"]) {
    goto LABEL_17;
  }
  uint64_t v6 = [v5 substringFromIndex:[@"AGXMetal" length]];
  v7 = v6;
  if (!v6
    || ([v6 hasPrefix:@"G"] & 1) == 0
    && ([v7 hasPrefix:@"A"] & 1) == 0
    && ![v7 hasPrefix:@"1"])
  {

LABEL_17:
    goto LABEL_18;
  }
  id v8 = v7;
  unint64_t v9 = (char *)[v8 UTF8String];
  unint64_t v10 = [v8 hasPrefix:@"1"] ^ 1;
  if ((unint64_t)[v8 length] <= v10)
  {
    int v11 = 0;
  }
  else
  {
    int v11 = 0;
    do
    {
      unsigned int v12 = v9[v10] - 48;
      if (v12 > 9) {
        break;
      }
      int v11 = v12 + 10 * v11;
      ++v10;
    }
    while (v10 < (unint64_t)[v8 length]);
    if (v11 == 15)
    {
      if (v10 < (unint64_t)[v8 length]
        && [v8 characterAtIndex:v10] == 95
        || (id)v10 == [v8 length])
      {
        int v11 = 14;
      }
      else
      {
        int v11 = 15;
      }
    }
  }
  if ([v8 hasPrefix:@"A"]) {
    int v15 = -11;
  }
  else {
    int v15 = -10;
  }
  int v16 = v15 + v11;
  if (v16 < 0) {
    int v17 = -1;
  }
  else {
    int v17 = v16;
  }

  if ((v17 - 0x7FFFFFFF) < 2)
  {
    unsigned int v13 = 0;
    goto LABEL_19;
  }
  if (v17 < 5
    || v17 == 5
    && (([v5 hasSuffix:@"M"] & 1) != 0
     || ([v5 hasSuffix:@"P"] & 1) != 0))
  {
LABEL_18:
    unsigned int v13 = 1;
    goto LABEL_19;
  }
  unsigned int v13 = 2;
LABEL_19:
  self->_gpuGeneration = v13;
  metalPluginName = self->_metalPluginName;
  self->_metalPluginName = (NSString *)v5;
}

- (void)patchObjectIds:(id)a3
{
  id v26 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 BOOLForKey:@"GPUDebugger.ShaderProfiler.DebugObjectIdPatch"];

  if (!self->_dataSourceHasUnusedResources)
  {
    id v5 = [(GTShaderProfilerStreamData *)self encoderInfoCount];
    if (v5 == [v26 encoderInfoCount])
    {
      id v6 = [(GTShaderProfilerStreamData *)self pipelineStateInfoCount];
      if (v6 == [v26 pipelineStateInfoCount])
      {
        id v7 = [(GTShaderProfilerStreamData *)self functionInfoCount];
        if (v7 == [v26 functionInfoCount])
        {
          id v8 = [(GTShaderProfilerStreamData *)self commandBufferInfoCount];
          if (v8 == [v26 commandBufferInfoCount])
          {
            unint64_t v9 = [(GTShaderProfilerStreamData *)self encoders];
            if ([(GTShaderProfilerStreamData *)self encoderInfoCount])
            {
              uint64_t v10 = 0;
              unint64_t v11 = 0;
              do
              {
                unint64_t var2 = v9[v10].var2;
                if (var2 >= *(void *)((char *)[v26 encoders] + v10 * 40 + 16)) {
                  v9[v10].var0 = *(void *)((char *)[v26 encoders] + v10 * 40);
                }
                ++v11;
                ++v10;
              }
              while (v11 < [(GTShaderProfilerStreamData *)self encoderInfoCount]);
            }
            unsigned int v13 = [(GTShaderProfilerStreamData *)self commandBuffers];
            if ([(GTShaderProfilerStreamData *)self commandBufferInfoCount])
            {
              uint64_t v14 = 0;
              unint64_t v15 = 0;
              do
              {
                unint64_t v16 = v13[v14].var2;
                if (v16 == *(void *)((char *)[v26 commandBuffers] + v14 * 32 + 16)) {
                  v13[v14].var0 = *(void *)((char *)[v26 commandBuffers] + v14 * 32);
                }
                ++v15;
                ++v14;
              }
              while (v15 < [(GTShaderProfilerStreamData *)self commandBufferInfoCount]);
            }
            int v17 = [(GTShaderProfilerStreamData *)self pipelineStates];
            if ([(GTShaderProfilerStreamData *)self pipelineStateInfoCount])
            {
              uint64_t v18 = 0;
              unint64_t v19 = 0;
              do
              {
                unint64_t v20 = v17[v18].var2;
                if (v20 == *(void *)((char *)[v26 pipelineStates] + v18 * 40 + 16)) {
                  v17[v18].var0 = *(void *)((char *)[v26 pipelineStates] + v18 * 40);
                }
                ++v19;
                ++v18;
              }
              while (v19 < [(GTShaderProfilerStreamData *)self pipelineStateInfoCount]);
            }
            v21 = [(GTShaderProfilerStreamData *)self functionInfo];
            if ([(GTShaderProfilerStreamData *)self functionInfoCount])
            {
              uint64_t v22 = 0;
              unint64_t v23 = 0;
              do
              {
                id v24 = ($1DCF89E860F11EA061E0D2DB567B39C0 *)&v21[v22];
                unint64_t var1 = v21[v22].var1;
                if (var1 == *(void *)((char *)[v26 functionInfo] + v22 * 48 + 8))
                {
                  v24->var0 = *(void *)((char *)[v26 functionInfo] + v22 * 48);
                  v24->unint64_t var2 = *(void *)((char *)[v26 functionInfo] + v22 * 48 + 16);
                }
                ++v23;
                ++v22;
              }
              while (v23 < [(GTShaderProfilerStreamData *)self functionInfoCount]);
            }
          }
        }
      }
    }
  }
}

- (void)debugDump:(id)a3
{
  id v8 = a3;
  id v4 = objc_opt_new();
  if ([(GTShaderProfilerStreamData *)self gpuCommandInfoCount])
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      id v7 = [(GTShaderProfilerStreamData *)self gpuCommands];
      [v4 appendFormat:@"I: %d, E: %d, P: %d, F: %llu, S: %d, T: %d\n", v7[v5].var0, v7[v5].var1, v7[v5].var3, v7[v5].var4, v7[v5].var6, v7[v5].var5];
      ++v6;
      ++v5;
    }
    while (v6 < [(GTShaderProfilerStreamData *)self gpuCommandInfoCount]);
  }
  [v4 writeToFile:v8 atomically:0 encoding:4 error:0];
}

- (id)_unarchiveAndPatchAPSData:(id)a3 apsData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        unsigned int v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        unsigned int v13 = [v12 objectForKeyedSubscript:@"APSTraceDataFile"];
        uint64_t v14 = [v5 objectForKeyedSubscript:v13];
        unint64_t v15 = [v12 objectForKeyedSubscript:@"Source"];
        if (![v15 isEqualToString:@"APS_USC"]) {
          goto LABEL_10;
        }
        if (v14)
        {
          id v16 = [v12 mutableCopy];
          [v16 setObject:v14 forKeyedSubscript:@"APSTraceData"];
          [v7 addObject:v16];

          goto LABEL_11;
        }
        int v17 = [v12 objectForKeyedSubscript:@"APSTraceData"];

        if (v17) {
LABEL_10:
        }
          [v7 addObject:v12];
LABEL_11:
      }
      id v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  return v7;
}

- (NSArray)unarchivedBatchIdFilteredCounterData
{
  if ([(NSMutableArray *)self->_archivedBatchIdFilteredCounterData count])
  {
    unarchivedBatchIdFilteredCounterData = self->_unarchivedBatchIdFilteredCounterData;
    if (!unarchivedBatchIdFilteredCounterData
      || ![(NSMutableArray *)unarchivedBatchIdFilteredCounterData count])
    {
      id v4 = (NSMutableArray *)objc_opt_new();
      id v5 = self->_unarchivedBatchIdFilteredCounterData;
      self->_unarchivedBatchIdFilteredCounterData = v4;

      id v6 = [(id)objc_opt_class() streamDataClasses];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v7 = self->_archivedBatchIdFilteredCounterData;
      id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          unint64_t v11 = 0;
          do
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v11);
            id v17 = 0;
            unsigned int v13 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v6 fromData:v12 error:&v17];
            id v14 = v17;
            if (v13) {
              [(NSMutableArray *)self->_unarchivedBatchIdFilteredCounterData addObject:v13];
            }

            unint64_t v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v9);
      }
    }
  }
  unint64_t v15 = self->_unarchivedBatchIdFilteredCounterData;

  return (NSArray *)v15;
}

- (void)enumerateUnarchivedBatchIdFilteredCounterData:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if ([(NSMutableArray *)self->_archivedBatchIdFilteredCounterData count])
  {
    unarchivedBatchIdFilteredCounterData = self->_unarchivedBatchIdFilteredCounterData;
    if (!unarchivedBatchIdFilteredCounterData
      || ![(NSMutableArray *)unarchivedBatchIdFilteredCounterData count])
    {
      id v6 = (NSMutableArray *)objc_opt_new();
      id v7 = self->_unarchivedBatchIdFilteredCounterData;
      self->_unarchivedBatchIdFilteredCounterData = v6;

      id v8 = [(id)objc_opt_class() streamDataClasses];
      if ([(NSMutableArray *)self->_archivedBatchIdFilteredCounterData count])
      {
        unint64_t v9 = 0;
        do
        {
          uint64_t v10 = [(NSMutableArray *)self->_archivedBatchIdFilteredCounterData objectAtIndexedSubscript:v9];
          id v13 = 0;
          unint64_t v11 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v8 fromData:v10 error:&v13];
          id v12 = v13;
          if (v11)
          {
            [(NSMutableArray *)self->_unarchivedBatchIdFilteredCounterData addObject:v11];
            v4[2](v4, v11);
          }

          ++v9;
        }
        while (v9 < (unint64_t)[(NSMutableArray *)self->_archivedBatchIdFilteredCounterData count]);
      }
    }
  }
}

- (NSArray)unarchivedAPSTimelineData
{
  if ([(NSMutableArray *)self->_archivedAPSTimelineData count])
  {
    unarchivedAPSTimelineData = self->_unarchivedAPSTimelineData;
    if (!unarchivedAPSTimelineData || ![(NSMutableArray *)unarchivedAPSTimelineData count])
    {
      id v4 = (NSMutableArray *)objc_opt_new();
      id v5 = self->_unarchivedAPSTimelineData;
      self->_unarchivedAPSTimelineData = v4;

      id v6 = [(id)objc_opt_class() streamDataClasses];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id obj = self->_archivedAPSTimelineData;
      id v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v21;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v21 != v9) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v10);
            id v19 = 0;
            id v12 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v6 fromData:v11 error:&v19];
            id v13 = v19;
            if (v12)
            {
              id v14 = self->_unarchivedAPSTimelineData;
              unint64_t v15 = [(GTShaderProfilerStreamData *)self patchLocalFileData:v12];
              [(NSMutableArray *)v14 addObject:v15];
            }
            uint64_t v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          id v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v8);
      }
    }
  }
  id v16 = self->_unarchivedAPSTimelineData;

  return (NSArray *)v16;
}

- (NSArray)unarchivedAPSCounterData
{
  if ([(NSMutableArray *)self->_archivedAPSCounterData count])
  {
    unarchivedAPSCounterData = self->_unarchivedAPSCounterData;
    if (!unarchivedAPSCounterData || ![(NSMutableArray *)unarchivedAPSCounterData count])
    {
      id v4 = (NSMutableArray *)objc_opt_new();
      id v5 = self->_unarchivedAPSCounterData;
      self->_unarchivedAPSCounterData = v4;

      id v6 = [(id)objc_opt_class() streamDataClasses];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id obj = self->_archivedAPSCounterData;
      id v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v21;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v21 != v9) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v10);
            id v19 = 0;
            id v12 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v6 fromData:v11 error:&v19];
            id v13 = v19;
            if (v12)
            {
              id v14 = self->_unarchivedAPSCounterData;
              unint64_t v15 = [(GTShaderProfilerStreamData *)self patchLocalFileData:v12];
              [(NSMutableArray *)v14 addObject:v15];
            }
            uint64_t v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          id v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v8);
      }
    }
  }
  id v16 = self->_unarchivedAPSCounterData;

  return (NSArray *)v16;
}

- (NSArray)unarchivedAPSData
{
  if ([(NSMutableArray *)self->_archivedAPSData count])
  {
    unarchivedAPSData = self->_unarchivedAPSData;
    if (!unarchivedAPSData || ![(NSMutableArray *)unarchivedAPSData count])
    {
      id v4 = (NSMutableArray *)objc_opt_new();
      id v5 = self->_unarchivedAPSData;
      self->_unarchivedAPSData = v4;

      id v6 = [(id)objc_opt_class() streamDataClasses];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id obj = self->_archivedAPSData;
      id v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v21;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v21 != v9) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v10);
            id v19 = 0;
            id v12 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v6 fromData:v11 error:&v19];
            id v13 = v19;
            if (v12)
            {
              id v14 = self->_unarchivedAPSData;
              unint64_t v15 = [(GTShaderProfilerStreamData *)self patchLocalFileData:v12];
              [(NSMutableArray *)v14 addObject:v15];
            }
            uint64_t v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          id v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v8);
      }
    }
  }
  id v16 = self->_unarchivedAPSData;

  return (NSArray *)v16;
}

- (id)patchLocalFileData:(id)a3
{
  id v4 = a3;
  if ([(GTShaderProfilerStreamData *)self supportsFileFormatV2])
  {
    id v5 = [v4 mutableCopy];
    id v6 = [v4 objectForKeyedSubscript:@"APSTraceDataFile"];
    id v7 = [v4 objectForKeyedSubscript:@"Source"];
    if (![v7 isEqualToString:@"APS_USC"])
    {
LABEL_5:
      id v9 = v5;
LABEL_6:

      goto LABEL_8;
    }
    id v8 = [v4 objectForKeyedSubscript:@"APSTraceData"];
    if (v8)
    {
LABEL_4:

      goto LABEL_5;
    }
    uint64_t v11 = [(NSURL *)self->_dataFileURL URLByAppendingPathComponent:v6];
    id v12 = [v11 path];

    id v13 = +[NSFileManager defaultManager];
    unsigned __int8 v14 = [v13 fileExistsAtPath:v12];

    if (v14)
    {
      uint64_t v16 = 0;
      unint64_t v15 = +[NSData dataWithContentsOfFile:v12 options:1 error:&v16];
      if (!v16)
      {
        [v5 setObject:v15 forKeyedSubscript:@"APSTraceData"];

        goto LABEL_4;
      }
      id v9 = v4;
    }
    else
    {
      id v9 = v4;
    }

    goto LABEL_6;
  }
  id v9 = v4;
LABEL_8:

  return v9;
}

- (NSArray)unarchivedGPUTimelineData
{
  if ([(NSMutableArray *)self->_archivedGPUTimelineData count])
  {
    unarchivedGPUTimelineData = self->_unarchivedGPUTimelineData;
    if (!unarchivedGPUTimelineData || ![(NSMutableArray *)unarchivedGPUTimelineData count])
    {
      id v4 = (NSMutableArray *)objc_opt_new();
      id v5 = self->_unarchivedGPUTimelineData;
      self->_unarchivedGPUTimelineData = v4;

      id v6 = [(id)objc_opt_class() streamDataClasses];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v7 = self->_archivedGPUTimelineData;
      id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v11);
            id v17 = 0;
            id v13 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v6 fromData:v12 error:&v17];
            id v14 = v17;
            if (v13) {
              [(NSMutableArray *)self->_unarchivedGPUTimelineData addObject:v13];
            }

            uint64_t v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v9);
      }
    }
  }
  unint64_t v15 = self->_unarchivedGPUTimelineData;

  return (NSArray *)v15;
}

- (void)enumerateUnarchivedGPUTimelineData:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(GTShaderProfilerStreamData *)self unarchivedGPUTimelineData];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSArray)unarchivedShaderProfilerData
{
  if ([(NSMutableArray *)self->_archivedShaderProfilerData count])
  {
    unarchivedShaderProfilerData = self->_unarchivedShaderProfilerData;
    if (!unarchivedShaderProfilerData || ![(NSMutableArray *)unarchivedShaderProfilerData count])
    {
      id v4 = (NSMutableArray *)objc_opt_new();
      id v5 = self->_unarchivedShaderProfilerData;
      self->_unarchivedShaderProfilerData = v4;

      id v6 = [(id)objc_opt_class() streamDataClasses];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v7 = self->_archivedShaderProfilerData;
      id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          long long v11 = 0;
          do
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v11);
            id v17 = 0;
            long long v13 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v6 fromData:v12 error:&v17];
            id v14 = v17;
            if (v13) {
              [(NSMutableArray *)self->_unarchivedShaderProfilerData addObject:v13];
            }

            long long v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v9);
      }
    }
  }
  unint64_t v15 = self->_unarchivedShaderProfilerData;

  return (NSArray *)v15;
}

- (void)enumerateUnarchivedShaderProfilerData:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(GTShaderProfilerStreamData *)self unarchivedShaderProfilerData];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)unloadAPSData:(BOOL)a3
{
  if (a3)
  {
    unarchivedAPSData = self->_unarchivedAPSData;
    if (unarchivedAPSData)
    {
      [(NSMutableArray *)unarchivedAPSData removeAllObjects];
      id v5 = self->_unarchivedAPSData;
      self->_unarchivedAPSData = 0;
    }
    archivedAPSData = self->_archivedAPSData;
    p_archivedAPSData = &self->_archivedAPSData;
    id v6 = archivedAPSData;
    if (archivedAPSData)
    {
LABEL_5:
      [(NSMutableArray *)v6 removeAllObjects];
      id v9 = *p_archivedAPSData;
      *p_archivedAPSData = 0;
    }
  }
  else
  {
    archivedAPSTimelineData = self->_archivedAPSTimelineData;
    if (archivedAPSTimelineData)
    {
      [(NSMutableArray *)archivedAPSTimelineData removeAllObjects];
      long long v11 = self->_archivedAPSTimelineData;
      self->_archivedAPSTimelineData = 0;
    }
    archivedAPSCounterData = self->_archivedAPSCounterData;
    if (archivedAPSCounterData)
    {
      [(NSMutableArray *)archivedAPSCounterData removeAllObjects];
      long long v13 = self->_archivedAPSCounterData;
      self->_archivedAPSCounterData = 0;
    }
    unarchivedAPSTimelineData = self->_unarchivedAPSTimelineData;
    if (unarchivedAPSTimelineData)
    {
      [(NSMutableArray *)unarchivedAPSTimelineData removeAllObjects];
      unint64_t v15 = self->_unarchivedAPSTimelineData;
      self->_unarchivedAPSTimelineData = 0;
    }
    unarchivedAPSCounterData = self->_unarchivedAPSCounterData;
    p_archivedAPSData = &self->_unarchivedAPSCounterData;
    id v6 = unarchivedAPSCounterData;
    if (unarchivedAPSCounterData) {
      goto LABEL_5;
    }
  }
}

- (unint64_t)functionInfoCount
{
  return [(NSMutableData *)self->_functionInfoData length] / 0x30;
}

- (unint64_t)commandBufferInfoCount
{
  return [(NSMutableData *)self->_commandBufferInfoData length] >> 5;
}

- (unint64_t)pipelineStateInfoCount
{
  return [(NSMutableData *)self->_pipelineStateInfoData length] / 0x28;
}

- (unint64_t)encoderInfoCount
{
  return [(NSMutableData *)self->_encoderInfoData length] / 0x28;
}

- (unint64_t)gpuCommandInfoCount
{
  return [(NSMutableData *)self->_gpuCommandInfoData length] >> 5;
}

- (const)functionInfo
{
  return (const $1DCF89E860F11EA061E0D2DB567B39C0 *)[(NSMutableData *)self->_functionInfoData bytes];
}

- (const)commandBuffers
{
  return (const $AE9166C28C07DA0297C1F610906ECF11 *)[(NSMutableData *)self->_commandBufferInfoData bytes];
}

- (const)pipelineStates
{
  return (const $BD801356BB6761D70137205404F699DC *)[(NSMutableData *)self->_pipelineStateInfoData bytes];
}

- (const)encoders
{
  return (const $BD801356BB6761D70137205404F699DC *)[(NSMutableData *)self->_encoderInfoData bytes];
}

- (const)gpuCommands
{
  return (const $D535F67AB11CE01139272ED1408C24C6 *)[(NSMutableData *)self->_gpuCommandInfoData bytes];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v5[1] = [(GTShaderProfilerStreamData *)self version];
  v5[2] = [(GTShaderProfilerStreamData *)self blitCallCount];
  *((unsigned char *)v5 + 272) = [(GTShaderProfilerStreamData *)self supportsFileFormatV2];
  id v6 = [(GTShaderProfilerStreamData *)self gpuCommandInfoData];
  id v7 = [v6 copyWithZone:a3];
  uint64_t v8 = (void *)v5[3];
  v5[3] = v7;

  id v9 = [(GTShaderProfilerStreamData *)self encoderInfoData];
  id v10 = [v9 copyWithZone:a3];
  long long v11 = (void *)v5[4];
  v5[4] = v10;

  long long v12 = [(GTShaderProfilerStreamData *)self pipelineStateInfoData];
  id v13 = [v12 copyWithZone:a3];
  id v14 = (void *)v5[5];
  v5[5] = v13;

  unint64_t v15 = [(GTShaderProfilerStreamData *)self commandBufferInfoData];
  id v16 = [v15 copyWithZone:a3];
  id v17 = (void *)v5[6];
  v5[6] = v16;

  long long v18 = [(GTShaderProfilerStreamData *)self archivedShaderProfilerData];
  id v19 = [v18 copyWithZone:a3];
  long long v20 = (void *)v5[9];
  v5[9] = v19;

  long long v21 = [(GTShaderProfilerStreamData *)self archivedGPUTimelineData];
  id v22 = [v21 copyWithZone:a3];
  long long v23 = (void *)v5[8];
  v5[8] = v22;

  id v24 = [(GTShaderProfilerStreamData *)self archivedBatchIdFilteredCounterData];
  id v25 = [v24 copyWithZone:a3];
  id v26 = (void *)v5[10];
  v5[10] = v25;

  id v27 = [(GTShaderProfilerStreamData *)self archivedAPSData];
  id v28 = [v27 copyWithZone:a3];
  v29 = (void *)v5[11];
  v5[11] = v28;

  v30 = [(GTShaderProfilerStreamData *)self archivedAPSCounterData];
  id v31 = [v30 copyWithZone:a3];
  v32 = (void *)v5[13];
  v5[13] = v31;

  v33 = [(GTShaderProfilerStreamData *)self archivedAPSTimelineData];
  id v34 = [v33 copyWithZone:a3];
  v35 = (void *)v5[12];
  v5[12] = v34;

  v36 = [(GTShaderProfilerStreamData *)self functionInfoData];
  id v37 = [v36 copyWithZone:a3];
  v38 = (void *)v5[7];
  v5[7] = v37;

  v39 = [(GTShaderProfilerStreamData *)self strings];
  id v40 = [v39 copyWithZone:a3];
  v41 = (void *)v5[20];
  v5[20] = v40;

  *((unsigned char *)v5 + 192) = [(GTShaderProfilerStreamData *)self dataSourceHasUnusedResources];
  v42 = [(GTShaderProfilerStreamData *)self batchIdFilterableCounters];
  id v43 = [v42 copyWithZone:a3];
  v44 = (void *)v5[25];
  v5[25] = v43;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t version = self->_version;
  id v18 = a3;
  [v18 encodeInteger:version forKey:@"version"];
  [(GTShaderProfilerStreamData *)self encodeAPSArrayForOldHost:self->_tempAPSData array:self->_archivedAPSData];
  [(GTShaderProfilerStreamData *)self encodeAPSArrayForOldHost:self->_tempAPSTimelineData array:self->_archivedAPSTimelineData];
  [(GTShaderProfilerStreamData *)self encodeAPSArrayForOldHost:self->_tempAPSCounterData array:self->_archivedAPSCounterData];
  [v18 encodeInteger:32 forKey:@"gpuCommandInfoSize"];
  [v18 encodeInteger:40 forKey:@"encoderInfoSize"];
  [v18 encodeInteger:40 forKey:@"pipelineStateInfoSize"];
  [v18 encodeInteger:32 forKey:@"commandBufferInfoSize"];
  [v18 encodeInteger:48 forKey:@"functionInfoSize"];
  [v18 encodeInteger:-[GTShaderProfilerStreamData blitCallCount](self, "blitCallCount") forKey:@"numBlitCalls"];
  [v18 encodeBool:[self supportsFileFormatV2] forKey:@"supportsSeparateAPSData"];
  id v5 = [(GTShaderProfilerStreamData *)self gpuCommandInfoData];
  [v18 encodeObject:v5 forKey:@"gpuCommandInfoData"];

  id v6 = [(GTShaderProfilerStreamData *)self encoderInfoData];
  [v18 encodeObject:v6 forKey:@"encoderInfoData"];

  id v7 = [(GTShaderProfilerStreamData *)self pipelineStateInfoData];
  [v18 encodeObject:v7 forKey:@"pipelineStateInfoData"];

  uint64_t v8 = [(GTShaderProfilerStreamData *)self commandBufferInfoData];
  [v18 encodeObject:v8 forKey:@"commandBufferInfoData"];

  id v9 = [(GTShaderProfilerStreamData *)self functionInfoData];
  [v18 encodeObject:v9 forKey:@"functionInfoData"];

  id v10 = [(GTShaderProfilerStreamData *)self strings];
  [v18 encodeObject:v10 forKey:@"strings"];

  long long v11 = [(GTShaderProfilerStreamData *)self batchIdFilterableCounters];
  [v18 encodeObject:v11 forKey:@"batchIdFiterableCounters"];

  long long v12 = [(GTShaderProfilerStreamData *)self archivedShaderProfilerData];
  [v18 encodeObject:v12 forKey:@"shaderProfilerData"];

  id v13 = [(GTShaderProfilerStreamData *)self archivedGPUTimelineData];
  [v18 encodeObject:v13 forKey:@"gpuTimelineData"];

  id v14 = [(GTShaderProfilerStreamData *)self archivedBatchIdFilteredCounterData];
  [v18 encodeObject:v14 forKey:@"batchIdFilteredCountersData"];

  unint64_t v15 = [(GTShaderProfilerStreamData *)self archivedAPSData];
  [v18 encodeObject:v15 forKey:@"APSData"];

  id v16 = [(GTShaderProfilerStreamData *)self archivedAPSCounterData];
  [v18 encodeObject:v16 forKey:@"APSCounterData"];

  id v17 = [(GTShaderProfilerStreamData *)self archivedAPSTimelineData];
  [v18 encodeObject:v17 forKey:@"APSTimelineData"];

  [v18 encodeBool:self->_dataSourceHasUnusedResources forKey:@"dataSourceHasUnusedResources"];
  [v18 encodeInteger:self->_captureRange.location forKey:@"captureRangeLocation"];
  [v18 encodeInteger:self->_captureRange.length forKey:@"captureRangeLength"];
  [v18 encodeInt32:self->_gpuGeneration forKey:@"gpuGeneration"];
  [v18 encodeObject:self->_metalPluginName forKey:@"metalPluginName"];
  [v18 encodeObject:self->_traceName forKey:@"traceName"];
}

- (void)encodeAPSArrayForOldHost:(id)a3 array:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = v6;
    [v6 removeAllObjects];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v19 = v5;
    id obj = v5;
    id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(obj);
          }
          long long v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v14 = [v12 mutableCopy];
          unint64_t v15 = [v14 objectForKeyedSubscript:@"APSTraceDataFile"];
          if (v15 && !self->_supportsFileFormatV2)
          {
            id v16 = +[NSData dataWithContentsOfFile:v15 options:1 error:0];
            if (v16) {
              [v14 setObject:v16 forKeyedSubscript:@"APSTraceData"];
            }
          }
          id v17 = +[NSKeyedArchiver archivedDataWithRootObject:v14 requiringSecureCoding:1 error:0];
          if (v17) {
            [v7 addObject:v17];
          }

          [v14 removeAllObjects];
          if (v15)
          {
            id v18 = +[NSFileManager defaultManager];
            [v18 removeItemAtPath:v15 error:0];
          }
        }
        id v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    id v5 = v19;
    id v6 = v7;
  }
}

- (GTShaderProfilerStreamData)initWithCoder:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)GTShaderProfilerStreamData;
  id v5 = [(GTShaderProfilerStreamData *)&v47 init];
  if (!v5)
  {
LABEL_15:
    id v8 = v5;
    goto LABEL_16;
  }
  int v6 = [v4 decodeIntForKey:@"version"];
  int v7 = v6;
  v5->_unint64_t version = v6;
  if (v6 > 4)
  {
    id v8 = 0;
    goto LABEL_16;
  }
  if (v6 != 1
    || (id v9 = (segment_command_64 *)[v4 decodeIntegerForKey:@"gpuCommandInfoSize"],
        uint64_t v10 = (char *)[v4 decodeIntegerForKey:@"encoderInfoSize"],
        long long v11 = (char *)[v4 decodeIntegerForKey:@"pipelineStateInfoSize"],
        long long v12 = (segment_command_64 *)[v4 decodeIntegerForKey:@"commandBufferInfoSize"],
        id v13 = (char *)[v4 decodeIntegerForKey:@"functionInfoSize"],
        id v8 = 0,
        v9 == &stru_20)
    && v10 == stru_20.segname
    && v11 == stru_20.segname
    && v12 == &stru_20
    && v13 == &stru_20.segname[8])
  {
    v48[0] = objc_opt_class();
    v48[1] = objc_opt_class();
    id v14 = +[NSArray arrayWithObjects:v48 count:2];
    unint64_t v15 = +[NSSet setWithArray:v14];

    id v16 = [(id)objc_opt_class() streamDataClasses];
    v5->_blitCallCount = (unint64_t)[v4 decodeIntegerForKey:@"numBlitCalls"];
    v5->_supportsFileFormatV2 = [v4 decodeBoolForKey:@"supportsSeparateAPSData"];
    v5->_gpuGeneration = [v4 decodeInt32ForKey:@"gpuGeneration"];
    id v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metalPluginName"];
    [(GTShaderProfilerStreamData *)v5 setMetalPluginName:v17];

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"traceName"];
    traceName = v5->_traceName;
    v5->_traceName = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClasses:v15 forKey:@"gpuCommandInfoData"];
    gpuCommandInfoData = v5->_gpuCommandInfoData;
    v5->_gpuCommandInfoData = (NSMutableData *)v20;

    uint64_t v22 = [v4 decodeObjectOfClasses:v15 forKey:@"encoderInfoData"];
    encoderInfoData = v5->_encoderInfoData;
    v5->_encoderInfoData = (NSMutableData *)v22;

    uint64_t v24 = [v4 decodeObjectOfClasses:v15 forKey:@"pipelineStateInfoData"];
    pipelineStateInfoData = v5->_pipelineStateInfoData;
    v5->_pipelineStateInfoData = (NSMutableData *)v24;

    uint64_t v26 = [v4 decodeObjectOfClasses:v15 forKey:@"commandBufferInfoData"];
    commandBufferInfoData = v5->_commandBufferInfoData;
    v5->_commandBufferInfoData = (NSMutableData *)v26;

    uint64_t v28 = [v4 decodeObjectOfClasses:v15 forKey:@"functionInfoData"];
    functionInfoData = v5->_functionInfoData;
    v5->_functionInfoData = (NSMutableData *)v28;

    uint64_t v30 = [v4 decodeObjectOfClasses:v16 forKey:@"strings"];
    strings = v5->_strings;
    v5->_strings = (NSMutableArray *)v30;

    uint64_t v32 = [v4 decodeObjectOfClasses:v16 forKey:@"batchIdFiterableCounters"];
    batchIdFilterableCounters = v5->_batchIdFilterableCounters;
    v5->_batchIdFilterableCounters = (NSArray *)v32;

    uint64_t v34 = [v4 decodeObjectOfClasses:v16 forKey:@"shaderProfilerData"];
    archivedShaderProfilerData = v5->_archivedShaderProfilerData;
    v5->_archivedShaderProfilerData = (NSMutableArray *)v34;

    uint64_t v36 = [v4 decodeObjectOfClasses:v16 forKey:@"gpuTimelineData"];
    archivedGPUTimelineData = v5->_archivedGPUTimelineData;
    v5->_archivedGPUTimelineData = (NSMutableArray *)v36;

    uint64_t v38 = [v4 decodeObjectOfClasses:v16 forKey:@"batchIdFilteredCountersData"];
    archivedBatchIdFilteredCounterData = v5->_archivedBatchIdFilteredCounterData;
    v5->_archivedBatchIdFilteredCounterData = (NSMutableArray *)v38;

    if (v7 >= 2)
    {
      uint64_t v40 = [v4 decodeObjectOfClasses:v16 forKey:@"APSData"];
      archivedAPSData = v5->_archivedAPSData;
      v5->_archivedAPSData = (NSMutableArray *)v40;

      v5->_gpuGeneration = 2;
      if (v7 != 2)
      {
        uint64_t v42 = [v4 decodeObjectOfClasses:v16 forKey:@"APSCounterData"];
        archivedAPSCounterData = v5->_archivedAPSCounterData;
        v5->_archivedAPSCounterData = (NSMutableArray *)v42;

        if (v7 >= 4)
        {
          uint64_t v44 = [v4 decodeObjectOfClasses:v16 forKey:@"APSTimelineData"];
          archivedAPSTimelineData = v5->_archivedAPSTimelineData;
          v5->_archivedAPSTimelineData = (NSMutableArray *)v44;
        }
      }
    }
    v5->_dataSourceHasUnusedResources = [v4 decodeBoolForKey:@"dataSourceHasUnusedResources"];
    v5->_captureRange.NSUInteger location = (NSUInteger)[v4 decodeIntegerForKey:@"captureRangeLocation"];
    v5->_captureRange.NSUInteger length = (NSUInteger)[v4 decodeIntegerForKey:@"captureRangeLength"];

    goto LABEL_15;
  }
LABEL_16:

  return v8;
}

- (GTShaderProfilerStreamData)initWithNewFileFormatV2Support:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTShaderProfilerStreamData;
  _NSRange result = [(GTShaderProfilerStreamData *)&v5 init];
  if (result)
  {
    result->_supportsFileFormatV2 = a3;
    result->_unint64_t version = 4;
  }
  return result;
}

- (GTShaderProfilerStreamData)init
{
  v3.receiver = self;
  v3.super_class = (Class)GTShaderProfilerStreamData;
  _NSRange result = [(GTShaderProfilerStreamData *)&v3 init];
  if (result)
  {
    result->_supportsFileFormatV2 = 0;
    result->_unint64_t version = 4;
  }
  return result;
}

+ (id)steamDataFromData:(id)a3
{
  id v3 = a3;
  uint64_t v6 = 0;
  id v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v6];

  return v4;
}

+ (id)dataFromArchivedDataURL:(id)a3
{
  id v4 = a3;
  unsigned __int8 v26 = 0;
  objc_super v5 = +[NSFileManager defaultManager];
  uint64_t v6 = [v4 path];
  int v7 = [v6 stringByResolvingSymlinksInPath];
  unsigned int v8 = [v5 fileExistsAtPath:v7 isDirectory:&v26];
  int v9 = v26;

  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    id v23 = 0;
    id v14 = +[NSData dataWithContentsOfURL:v4 options:0 error:&v23];
    id v11 = v23;
    if (!v11)
    {
      id v22 = 0;
      id v19 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v14 error:&v22];
      id v12 = v22;
      goto LABEL_18;
    }
    id v12 = v11;
LABEL_12:
    id v19 = 0;
    goto LABEL_18;
  }
  id v13 = [v4 path];
  id v14 = [v13 stringByAppendingPathComponent:@"streamData"];

  unint64_t v15 = +[NSFileManager defaultManager];
  unsigned int v16 = [v15 fileExistsAtPath:v14];

  if (!v16)
  {
    id v12 = 0;
    goto LABEL_12;
  }
  id v25 = 0;
  id v17 = +[NSData dataWithContentsOfFile:v14 options:0 error:&v25];
  id v18 = v25;
  if (v18)
  {
    id v12 = v18;
    id v19 = 0;
  }
  else
  {
    id v24 = 0;
    uint64_t v20 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v17 error:&v24];
    id v12 = v24;
    id v19 = 0;
    if (!v12)
    {
      objc_storeStrong(v20 + 33, a3);
      id v19 = v20;
    }
  }
LABEL_18:

  return v19;
}

+ (id)streamDataClasses
{
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:&v5 count:9];
  id v3 = +[NSSet setWithArray:](NSSet, "setWithArray:", v2, v5, v6, v7, v8, v9, v10, v11, v12);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end