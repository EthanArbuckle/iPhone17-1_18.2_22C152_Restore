@interface MTLCompileFunctionRequestData
+ (id)newVisibleRequestWithFunction:(id)a3 descriptor:(id)a4;
- ($2772B1D07D29A72E8557B2574C0AE5C1)archiveHashKey;
- ($2772B1D07D29A72E8557B2574C0AE5C1)vendorPluginFunctionId;
- (BOOL)sync;
- (MTLBinaryArchive)destinationBinaryArchive;
- (MTLFunction)function;
- (MTLPipelineCache)pipelineCache;
- (NSArray)binaryArchives;
- (NSArray)privateVisibleFunctions;
- (NSArray)visibleFunctions;
- (NSDictionary)gpuCompilerSPIOptions;
- (NSDictionary)visibleFunctionGroups;
- (OS_dispatch_data)airScript;
- (OS_dispatch_data)archiverId;
- (OS_dispatch_data)driverKeyData;
- (OS_dispatch_data)frameworkData;
- (unint64_t)functionOptions;
- (unint64_t)pipelineOptions;
- (unsigned)maxAccelerationStructureTraversalDepth;
- (void)dealloc;
- (void)setAirScript:(id)a3;
- (void)setArchiveHashKey:(id *)a3;
- (void)setArchiverId:(id)a3;
- (void)setBinaryArchives:(id)a3;
- (void)setDestinationBinaryArchive:(id)a3;
- (void)setDriverKeyData:(id)a3;
- (void)setFrameworkData:(id)a3;
- (void)setFunction:(id)a3;
- (void)setFunctionOptions:(unint64_t)a3;
- (void)setGpuCompilerSPIOptions:(id)a3;
- (void)setMaxAccelerationStructureTraversalDepth:(unsigned int)a3;
- (void)setPipelineCache:(id)a3;
- (void)setPipelineOptions:(unint64_t)a3;
- (void)setPrivateVisibleFunctions:(id)a3;
- (void)setSync:(BOOL)a3;
- (void)setVendorPluginFunctionId:(id *)a3;
- (void)setVisibleFunctionGroups:(id)a3;
- (void)setVisibleFunctions:(id)a3;
@end

@implementation MTLCompileFunctionRequestData

- (void)setDestinationBinaryArchive:(id)a3
{
}

- (void)setVisibleFunctions:(id)a3
{
}

- (void)setVisibleFunctionGroups:(id)a3
{
}

- (void)setPrivateVisibleFunctions:(id)a3
{
}

- (void)setGpuCompilerSPIOptions:(id)a3
{
}

- (void)setVendorPluginFunctionId:(id *)a3
{
  long long v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_vendorPluginFunctionId.key[16] = *(_OWORD *)&a3->var0[16];
  *(_OWORD *)self->_vendorPluginFunctionId.key = v3;
}

- (void)setDriverKeyData:(id)a3
{
  driverKeyData = self->_driverKeyData;
  if (driverKeyData) {
    dispatch_release(driverKeyData);
  }
  self->_driverKeyData = (OS_dispatch_data *)a3;
  if (a3)
  {
    dispatch_retain((dispatch_object_t)a3);
  }
}

- (unint64_t)pipelineOptions
{
  return self->_pipelineOptions;
}

- (MTLFunction)function
{
  return self->_function;
}

- (OS_dispatch_data)frameworkData
{
  return self->_frameworkData;
}

- (OS_dispatch_data)driverKeyData
{
  return self->_driverKeyData;
}

- (MTLBinaryArchive)destinationBinaryArchive
{
  return self->_destinationBinaryArchive;
}

- (NSArray)binaryArchives
{
  return self->_binaryArchives;
}

- (NSDictionary)gpuCompilerSPIOptions
{
  return self->_gpuCompilerSPIOptions;
}

- (NSArray)visibleFunctions
{
  return self->_visibleFunctions;
}

- (NSArray)privateVisibleFunctions
{
  return self->_privateVisibleFunctions;
}

- (BOOL)sync
{
  return self->_sync;
}

- (MTLPipelineCache)pipelineCache
{
  return self->_pipelineCache;
}

- (NSDictionary)visibleFunctionGroups
{
  return self->_visibleFunctionGroups;
}

- (unsigned)maxAccelerationStructureTraversalDepth
{
  return self->_maxAccelerationStructureTraversalDepth;
}

- (OS_dispatch_data)archiverId
{
  return self->_archiverId;
}

- (void)setFrameworkData:(id)a3
{
  frameworkData = self->_frameworkData;
  if (frameworkData) {
    dispatch_release(frameworkData);
  }
  self->_frameworkData = (OS_dispatch_data *)a3;
  if (a3)
  {
    dispatch_retain((dispatch_object_t)a3);
  }
}

- (void)setAirScript:(id)a3
{
  airScript = self->_airScript;
  if (airScript) {
    dispatch_release(airScript);
  }
  self->_airScript = (OS_dispatch_data *)a3;
  if (a3)
  {
    dispatch_retain((dispatch_object_t)a3);
  }
}

- (void)setPipelineOptions:(unint64_t)a3
{
  self->_pipelineOptions = a3;
}

- (void)setSync:(BOOL)a3
{
  self->_sync = a3;
}

- (void)setBinaryArchives:(id)a3
{
}

- (void)dealloc
{
  frameworkData = self->_frameworkData;
  if (frameworkData) {
    dispatch_release(frameworkData);
  }
  driverKeyData = self->_driverKeyData;
  if (driverKeyData) {
    dispatch_release(driverKeyData);
  }
  archiverId = self->_archiverId;
  if (archiverId) {
    dispatch_release(archiverId);
  }
  airScript = self->_airScript;
  if (airScript) {
    dispatch_release(airScript);
  }

  v7.receiver = self;
  v7.super_class = (Class)MTLCompileFunctionRequestData;
  [(MTLCompileFunctionRequestData *)&v7 dealloc];
}

- (void)setPipelineCache:(id)a3
{
}

- (void)setFunction:(id)a3
{
}

- (void)setArchiveHashKey:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[16];
  *(_OWORD *)self->_archiveHashKey.key = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_archiveHashKey.key[16] = v3;
}

- (OS_dispatch_data)airScript
{
  return self->_airScript;
}

- ($2772B1D07D29A72E8557B2574C0AE5C1)vendorPluginFunctionId
{
  long long v3 = *(_OWORD *)&self[5].var0[24];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[5].var0[8];
  *(_OWORD *)&retstr->var0[16] = v3;
  return self;
}

- (void)setArchiverId:(id)a3
{
  archiverId = self->_archiverId;
  if (archiverId) {
    dispatch_release(archiverId);
  }
  self->_archiverId = (OS_dispatch_data *)a3;
  if (a3)
  {
    dispatch_retain((dispatch_object_t)a3);
  }
}

+ (id)newVisibleRequestWithFunction:(id)a3 descriptor:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v6 = objc_opt_new();
  [v6 setFunction:a3];
  objc_msgSend(v6, "setFunctionOptions:", objc_msgSend(a4, "options"));
  objc_msgSend(v6, "setPipelineOptions:", objc_msgSend(a4, "pipelineOptions"));
  objc_msgSend(v6, "setBinaryArchives:", objc_msgSend(a4, "binaryArchives"));
  if (objc_msgSend((id)objc_msgSend(a3, "device"), "pluginData")) {
    size_t v7 = MTLSerializePluginDataDictionary(objc_msgSend((id)objc_msgSend(a3, "device"), "pluginData"), 0) + 44;
  }
  else {
    size_t v7 = 44;
  }
  if ([a4 pluginData]) {
    v7 += MTLSerializePluginDataDictionary((void *)[a4 pluginData], 0);
  }
  v8 = (unsigned int *)malloc_type_calloc(v7, 1uLL, 0x43A3D703uLL);
  v9 = (_OWORD *)[a3 bitCodeHash];
  long long v10 = v9[1];
  *(_OWORD *)(v8 + 2) = *v9;
  *(_OWORD *)(v8 + 6) = v10;
  *((unsigned char *)v8 + 40) = ([a4 pipelineOptions] >> 24) & 1;
  int v11 = 44;
  if (objc_msgSend((id)objc_msgSend(a3, "device"), "pluginData"))
  {
    unsigned int *v8 = 44;
    int v11 = MTLSerializePluginDataDictionary(objc_msgSend((id)objc_msgSend(a3, "device"), "pluginData"), (unsigned char *)v8 + *v8)+ 44;
  }
  if ([a4 pluginData])
  {
    v8[1] = v11;
    MTLSerializePluginDataDictionary((void *)[a4 pluginData], (unsigned char *)v8 + v8[1]);
  }
  v12 = dispatch_data_create(v8, v7, 0, (dispatch_block_t)*MEMORY[0x1E4F143F0]);
  [v6 setFrameworkData:v12];
  dispatch_release(v12);
  CC_SHA256_Init(&c);
  memset(data, 0, 32);
  if (a4) {
    [a4 hashStableWithFunction:a3];
  }
  CC_SHA256_Update(&c, v9, 0x20u);
  CC_SHA256_Update(&c, data, 0x20u);
  CC_SHA256_Final(md, &c);
  v15[0] = *(_OWORD *)md;
  v15[1] = v18;
  [v6 setArchiveHashKey:v15];
  return v6;
}

- (unint64_t)functionOptions
{
  return self->_functionOptions;
}

- (void)setFunctionOptions:(unint64_t)a3
{
  self->_functionOptions = a3;
}

- ($2772B1D07D29A72E8557B2574C0AE5C1)archiveHashKey
{
  long long v3 = *(_OWORD *)self[3].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[2].var0[16];
  *(_OWORD *)&retstr->var0[16] = v3;
  return self;
}

- (void)setMaxAccelerationStructureTraversalDepth:(unsigned int)a3
{
  self->_maxAccelerationStructureTraversalDepth = a3;
}

@end