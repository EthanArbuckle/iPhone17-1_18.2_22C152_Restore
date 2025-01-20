@interface GTMutableShaderProfilerStreamData
+ (id)dataFromArchivedDataURL:(id)a3;
- (BOOL)addAPSCounterData:(id)a3;
- (BOOL)addAPSData:(id)a3;
- (BOOL)addAPSTimelineData:(id)a3;
- (BOOL)addBatchIdFilteredCounterData:(id)a3;
- (BOOL)addGPUTimelineData:(id)a3;
- (BOOL)addShaderProfilerData:(id)a3;
- (GTMutableShaderProfilerStreamData)init;
- (GTMutableShaderProfilerStreamData)initWithNewFileFormatV2Support:(BOOL)a3;
- (id)_copyForAddAPSData:(id)a3 prefix:(id)a4;
- (unint64_t)addString:(id)a3;
- (void)_commonInit;
- (void)addCommandBuffers:(id *)a3 count:(unint64_t)a4;
- (void)addEncoders:(id *)a3 count:(unint64_t)a4;
- (void)addGPUCommands:(id *)a3 count:(unint64_t)a4;
- (void)addPipelineStates:(id *)a3 count:(unint64_t)a4;
- (void)addShaderFunctionInfo:(id *)a3 count:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)removeAPSCounterData;
- (void)removeAPSData;
- (void)removeAPSTimelineData;
- (void)setBatchIdFilterableCounters:(id)a3;
- (void)setDataSourceHasUnusedResources:(BOOL)a3 captureRange:(_NSRange)a4;
- (void)setNumBlitCalls:(unint64_t)a3;
@end

@implementation GTMutableShaderProfilerStreamData

- (void).cxx_destruct
{
}

- (unint64_t)addString:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->super._stringDict objectForKeyedSubscript:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 unsignedIntegerValue];
  }
  else
  {
    id v7 = [(NSMutableArray *)self->super._strings count];
    v8 = +[NSNumber numberWithUnsignedInteger:v7];
    [(NSMutableDictionary *)self->super._stringDict setObject:v8 forKeyedSubscript:v4];

    [(NSMutableArray *)self->super._strings addObject:v4];
  }

  return (unint64_t)v7;
}

- (void)setBatchIdFilterableCounters:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  batchIdFilterableCounters = self->super._batchIdFilterableCounters;
  self->super._batchIdFilterableCounters = v4;
}

- (BOOL)addBatchIdFilteredCounterData:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v9 = 0;
  id v4 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v9];
  id v5 = v9;
  v6 = v5;
  BOOL v7 = v5 == 0;
  if (v5)
  {
    NSLog(@"%@", v5);
  }
  else
  {
    [(NSLock *)self->_addLock lock];
    [(NSMutableArray *)self->super._archivedBatchIdFilteredCounterData addObject:v4];
    [(NSLock *)self->_addLock unlock];
  }

  return v7;
}

- (void)removeAPSCounterData
{
  [(NSLock *)self->_addLock lock];
  [(NSMutableArray *)self->super._archivedAPSCounterData removeAllObjects];
  [(NSMutableArray *)self->super._tempAPSCounterData removeAllObjects];
  addLock = self->_addLock;

  [(NSLock *)addLock unlock];
}

- (void)removeAPSTimelineData
{
  [(NSLock *)self->_addLock lock];
  [(NSMutableArray *)self->super._archivedAPSTimelineData removeAllObjects];
  [(NSMutableArray *)self->super._tempAPSTimelineData removeAllObjects];
  addLock = self->_addLock;

  [(NSLock *)addLock unlock];
}

- (void)removeAPSData
{
  [(NSLock *)self->_addLock lock];
  [(NSMutableArray *)self->super._archivedAPSData removeAllObjects];
  [(NSMutableArray *)self->super._tempAPSData removeAllObjects];
  addLock = self->_addLock;

  [(NSLock *)addLock unlock];
}

- (BOOL)addAPSCounterData:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_addLock lock];
  if (self->super._tempAPSCounterData)
  {
    if (v4) {
      goto LABEL_3;
    }
LABEL_6:
    LOBYTE(v5) = 0;
    goto LABEL_7;
  }
  v6 = (NSMutableArray *)objc_opt_new();
  tempAPSCounterData = self->super._tempAPSCounterData;
  self->super._tempAPSCounterData = v6;

  if (!v4) {
    goto LABEL_6;
  }
LABEL_3:
  id v5 = [(GTMutableShaderProfilerStreamData *)self _copyForAddAPSData:v4 prefix:@"Counters_"];
  if (v5)
  {
    [(NSMutableArray *)self->super._tempAPSCounterData addObject:v5];

    LOBYTE(v5) = 1;
  }
LABEL_7:
  [(NSLock *)self->_addLock unlock];

  return (char)v5;
}

- (BOOL)addAPSTimelineData:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_addLock lock];
  if (self->super._tempAPSTimelineData)
  {
    if (v4) {
      goto LABEL_3;
    }
LABEL_6:
    LOBYTE(v5) = 0;
    goto LABEL_7;
  }
  v6 = (NSMutableArray *)objc_opt_new();
  tempAPSTimelineData = self->super._tempAPSTimelineData;
  self->super._tempAPSTimelineData = v6;

  if (!v4) {
    goto LABEL_6;
  }
LABEL_3:
  id v5 = [(GTMutableShaderProfilerStreamData *)self _copyForAddAPSData:v4 prefix:@"Timeline_"];
  if (v5)
  {
    [(NSMutableArray *)self->super._tempAPSTimelineData addObject:v5];

    LOBYTE(v5) = 1;
  }
LABEL_7:
  [(NSLock *)self->_addLock unlock];

  return (char)v5;
}

- (BOOL)addAPSData:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_addLock lock];
  if (self->super._tempAPSData)
  {
    if (v4) {
      goto LABEL_3;
    }
LABEL_6:
    LOBYTE(v5) = 0;
    goto LABEL_7;
  }
  v6 = (NSMutableArray *)objc_opt_new();
  tempAPSData = self->super._tempAPSData;
  self->super._tempAPSData = v6;

  if (!v4) {
    goto LABEL_6;
  }
LABEL_3:
  id v5 = [(GTMutableShaderProfilerStreamData *)self _copyForAddAPSData:v4 prefix:@"Profiling_"];
  if (v5)
  {
    [(NSMutableArray *)self->super._tempAPSData addObject:v5];

    LOBYTE(v5) = 1;
  }
LABEL_7:
  [(NSLock *)self->_addLock unlock];

  return (char)v5;
}

- (id)_copyForAddAPSData:(id)a3 prefix:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(GTShaderProfilerStreamData *)self _setupDataPath];
  id v9 = [v7 mutableCopy];

  v10 = [v9 objectForKeyedSubscript:@"ShaderProfilerData"];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
    v13 = [NSData dataWithBytes:[v12 bytes] length:[v12 length]];
    [v9 setObject:v13 forKeyedSubscript:@"ShaderProfilerData"];
  }
  v14 = [v9 objectForKeyedSubscript:@"APSTraceDataFile"];
  v15 = v14;
  if (!v14) {
    goto LABEL_10;
  }
  v16 = [v14 lastPathComponent];
  v17 = [v6 stringByAppendingString:v16];

  v18 = [v8 URLByAppendingPathComponent:v17];
  v19 = [v18 path];

  v20 = [(GTShaderProfilerStreamData *)self supportsFileFormatV2] ? v17 : v19;
  [v9 setObject:v20 forKeyedSubscript:@"APSTraceDataFile"];
  v21 = +[NSFileManager defaultManager];
  unsigned int v22 = [v21 fileExistsAtPath:v19];

  if (v22)
  {
    v23 = +[NSFileManager defaultManager];
    [v23 removeItemAtPath:v19 error:0];
  }
  v24 = +[NSFileManager defaultManager];
  uint64_t v28 = 0;
  [v24 copyItemAtPath:v15 toPath:v19 error:&v28];
  uint64_t v25 = v28;

  id v26 = 0;
  if (!v25) {
LABEL_10:
  }
    id v26 = v9;

  return v26;
}

- (BOOL)addGPUTimelineData:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v8 = 0;
  id v4 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v8];
  id v5 = v8;
  BOOL v6 = v5 == 0;
  if (!v5)
  {
    [(NSLock *)self->_addLock lock];
    [(NSMutableArray *)self->super._archivedGPUTimelineData addObject:v4];
    [(NSLock *)self->_addLock unlock];
  }

  return v6;
}

- (BOOL)addShaderProfilerData:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v8 = 0;
  id v4 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v8];
  id v5 = v8;
  BOOL v6 = v5 == 0;
  if (!v5)
  {
    [(NSLock *)self->_addLock lock];
    [(NSMutableArray *)self->super._archivedShaderProfilerData addObject:v4];
    [(NSLock *)self->_addLock unlock];
  }

  return v6;
}

- (void)setDataSourceHasUnusedResources:(BOOL)a3 captureRange:(_NSRange)a4
{
  self->super._dataSourceHasUnusedResources = a3;
  self->super._captureRange = a4;
}

- (void)setNumBlitCalls:(unint64_t)a3
{
  self->super._blitCallCount = a3;
}

- (void)addShaderFunctionInfo:(id *)a3 count:(unint64_t)a4
{
  functionInfoData = self->super._functionInfoData;
  id v5 = +[NSData dataWithBytes:a3 length:48 * a4];
  [(NSMutableData *)functionInfoData appendData:v5];
}

- (void)addCommandBuffers:(id *)a3 count:(unint64_t)a4
{
  commandBufferInfoData = self->super._commandBufferInfoData;
  id v5 = +[NSData dataWithBytes:a3 length:32 * a4];
  [(NSMutableData *)commandBufferInfoData appendData:v5];
}

- (void)addPipelineStates:(id *)a3 count:(unint64_t)a4
{
  pipelineStateInfoData = self->super._pipelineStateInfoData;
  id v5 = +[NSData dataWithBytes:a3 length:40 * a4];
  [(NSMutableData *)pipelineStateInfoData appendData:v5];
}

- (void)addEncoders:(id *)a3 count:(unint64_t)a4
{
  encoderInfoData = self->super._encoderInfoData;
  id v5 = +[NSData dataWithBytes:a3 length:40 * a4];
  [(NSMutableData *)encoderInfoData appendData:v5];
}

- (void)addGPUCommands:(id *)a3 count:(unint64_t)a4
{
  gpuCommandInfoData = self->super._gpuCommandInfoData;
  id v5 = +[NSData dataWithBytes:a3 length:32 * a4];
  [(NSMutableData *)gpuCommandInfoData appendData:v5];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GTMutableShaderProfilerStreamData;
  [(GTShaderProfilerStreamData *)&v3 encodeWithCoder:a3];
}

- (void)_commonInit
{
  objc_super v3 = (NSMutableData *)objc_opt_new();
  gpuCommandInfoData = self->super._gpuCommandInfoData;
  self->super._gpuCommandInfoData = v3;

  id v5 = (NSMutableData *)objc_opt_new();
  encoderInfoData = self->super._encoderInfoData;
  self->super._encoderInfoData = v5;

  id v7 = (NSMutableData *)objc_opt_new();
  pipelineStateInfoData = self->super._pipelineStateInfoData;
  self->super._pipelineStateInfoData = v7;

  id v9 = (NSMutableData *)objc_opt_new();
  commandBufferInfoData = self->super._commandBufferInfoData;
  self->super._commandBufferInfoData = v9;

  v11 = (NSMutableArray *)objc_opt_new();
  archivedShaderProfilerData = self->super._archivedShaderProfilerData;
  self->super._archivedShaderProfilerData = v11;

  v13 = (NSMutableArray *)objc_opt_new();
  archivedGPUTimelineData = self->super._archivedGPUTimelineData;
  self->super._archivedGPUTimelineData = v13;

  v15 = (NSMutableArray *)objc_opt_new();
  archivedBatchIdFilteredCounterData = self->super._archivedBatchIdFilteredCounterData;
  self->super._archivedBatchIdFilteredCounterData = v15;

  v17 = (NSMutableArray *)objc_opt_new();
  archivedAPSData = self->super._archivedAPSData;
  self->super._archivedAPSData = v17;

  v19 = (NSMutableArray *)objc_opt_new();
  archivedAPSCounterData = self->super._archivedAPSCounterData;
  self->super._archivedAPSCounterData = v19;

  v21 = (NSMutableArray *)objc_opt_new();
  archivedAPSTimelineData = self->super._archivedAPSTimelineData;
  self->super._archivedAPSTimelineData = v21;

  v23 = (NSMutableData *)objc_opt_new();
  functionInfoData = self->super._functionInfoData;
  self->super._functionInfoData = v23;

  uint64_t v25 = (NSMutableArray *)objc_opt_new();
  strings = self->super._strings;
  self->super._strings = v25;

  v27 = (NSMutableDictionary *)objc_opt_new();
  stringDict = self->super._stringDict;
  self->super._stringDict = v27;

  v29 = (NSLock *)objc_opt_new();
  addLock = self->_addLock;
  self->_addLock = v29;
}

- (GTMutableShaderProfilerStreamData)initWithNewFileFormatV2Support:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GTMutableShaderProfilerStreamData;
  objc_super v3 = [(GTShaderProfilerStreamData *)&v6 initWithNewFileFormatV2Support:a3];
  id v4 = v3;
  if (v3) {
    [(GTMutableShaderProfilerStreamData *)v3 _commonInit];
  }
  return v4;
}

- (GTMutableShaderProfilerStreamData)init
{
  v5.receiver = self;
  v5.super_class = (Class)GTMutableShaderProfilerStreamData;
  v2 = [(GTShaderProfilerStreamData *)&v5 initWithNewFileFormatV2Support:0];
  objc_super v3 = v2;
  if (v2) {
    [(GTMutableShaderProfilerStreamData *)v2 _commonInit];
  }
  return v3;
}

+ (id)dataFromArchivedDataURL:(id)a3
{
  id v11 = 0;
  objc_super v3 = +[NSData dataWithContentsOfURL:a3 options:0 error:&v11];
  id v4 = v11;
  if (v4)
  {
    id v5 = v4;
    objc_super v6 = 0;
  }
  else
  {
    id v10 = 0;
    objc_super v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v10];
    id v5 = v10;
    uint64_t v7 = objc_opt_new();
    id v8 = (void *)v6[35];
    v6[35] = v7;

    v6[1] = 4;
  }

  return v6;
}

@end