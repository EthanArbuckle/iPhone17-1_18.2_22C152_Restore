@interface MTLCompiler
- ($2772B1D07D29A72E8557B2574C0AE5C1)getGPUCompilerHashForScript:(SEL)a3 type:(const void *)a4;
- ($2772B1D07D29A72E8557B2574C0AE5C1)hashKeyForLibraryRequest:(SEL)a3;
- ($2772B1D07D29A72E8557B2574C0AE5C1)hashKeyForStatelessCompilationRequest:(SEL)a3;
- ($85CD2974BE96D4886BB301820D1C36C2)libraryCacheStats;
- ($85CD2974BE96D4886BB301820D1C36C2)pipelineCacheStats;
- (BOOL)addComputePipelineStateWithDescriptor:(id)a3 destinationBinaryArchive:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)addMeshRenderPipelineStateWithDescriptor:(id)a3 destinationBinaryArchive:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)addRenderPipelineStateWithDescriptor:(id)a3 destinationBinaryArchive:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)addTileRenderPipelineStateWithDescriptor:(id)a3 destinationBinaryArchive:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)copyShaderCacheToPath:(id)a3;
- (BOOL)downgradeRequest:(MTLCompilerFunctionRequest *)a3 frameworkData:(void *)a4 error:(id *)a5;
- (BOOL)initializeVendorPluginFunctionId:(id)a3 airScript:(const void *)a4 driverCompilerOptions:(id)a5 compiledNextStageVariant:(id)a6 vendorPlugin:(id *)a7;
- (BOOL)validateLanguageAndAIRVersionForFunction:(id)a3 completionHandler:(id)a4;
- (MTLCompiler)initWithTargetData:(id)a3 cacheUUID:(id *)a4 pluginPath:(id)a5 device:(id)a6 compilerFlags:(unint64_t)a7;
- (MTLCompilerConnectionManager)compilerConnectionManager;
- (MTLHashKey)getBuiltInFunctionId:(SEL)a3;
- (MTLHashKey)getFunctionId:(SEL)a3;
- (MTLHashKey)getFunctionId:(SEL)a3 airScript:(id)a4 vendorPluginFunctionId:(const void *)a5;
- (MTLHashKey)getFunctionId:(SEL)a3 airScript:(id)a4 vendorPluginFunctionId:(const void *)a5 bitcodeHashList:(id *)a6;
- (NSString)pluginPath;
- (OS_dispatch_queue)compilerQueue;
- (RequiredFunctionKeys)requiredKeysForFunction:(SEL)a3 variantKey:(id)a4 frameworkData:(const VariantKey *)a5 compilerOptions:(id)a6 driverCompilerOptions:(int)a7 airScript:(id)a8 archives:(const void *)a9 compiledNextStageVariant:(id)a10;
- (VariantEntry)computeVariantEntryWithDescriptor:(id)a3 airDescriptor:(id)a4 options:(unint64_t)a5 serializedComputeDataDescriptor:(id)a6 asyncCompile:(BOOL)a7 pipelineCache:(id)a8 destinationBinaryArchive:(id)a9 computeProgram:(MTLProgramObject *)a10 kernelDriverCompileTimeData:(id *)a11 compileTimeStatistics:(id)a12;
- (VariantEntry)tileVariantEntryWithDescriptor:(id)a3 airDescriptor:(id)a4 options:(unint64_t)a5 serializedTileDataDescriptor:(id)a6 asyncCompile:(BOOL)a7 destinationBinaryArchive:(id)a8 tileProgram:(MTLProgramObject *)a9 kernelDriverCompileTimeData:(id *)a10 compileTimeStatistics:(id)a11;
- (id).cxx_construct;
- (id)compileDynamicLibraryWithDescriptor:(id)a3 computePipelineDescriptor:(id)a4 error:(id *)a5;
- (id)createErrorMessageWithRequest:(id)a3 key:(id)a4 cacheType:(const char *)a5 itemLookedFor:(const char *)a6;
- (id)createMeshStageAndLinkPipelineWithFragment:(void *)a3 fragmentVariant:(id)a4 objectFunction:(id)a5 serializedObjectDescriptor:(id)a6 meshFunction:(id)a7 serializedMeshDescriptor:(id)a8 descriptor:(id)a9 airDescriptor:(id)a10 destinationArchive:(id)a11 options:(unint64_t)a12 reflection:(id *)a13 compileStatistics:(id)a14 fragmentCompileTimeData:(id)a15 pipelineArchiverId:(id)a16 error:(id *)a17 completionHandler:(id)a18;
- (id)createVertexStageAndLinkPipelineWithFragment:(void *)a3 fragmentVariant:(id)a4 vertexFunction:(id)a5 serializedVertexDescriptor:(id)a6 descriptor:(id)a7 airDescriptor:(id)a8 destinationArchive:(id)a9 options:(unint64_t)a10 reflection:(id *)a11 compileStatistics:(id)a12 fragmentCompileTimeData:(id)a13 pipelineArchiverId:(id)a14 error:(id *)a15 completionHandler:(id)a16;
- (id)downgradeFunctionRequest:(const MTLCompilerFunctionRequest *)a3 targetLLVMVersion:(unsigned int)a4 frameworkData:(void *)a5 error:(id *)a6;
- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6 completionHandler:(id)a7;
- (id)newComputePipelineStateWithDescriptorInternal:(id)a3 options:(unint64_t)a4 pipelineCache:(id)a5 destinationBinaryArchive:(id)a6 reflection:(id *)a7 error:(id *)a8 completionHandler:(id)a9;
- (id)newLinkedFunctionsBitcodeFromRequest:(id)a3 hashKey:(void *)a4;
- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6 completionHandler:(id)a7;
- (id)newRenderPipelineStateWithDescriptorInternal:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 destinationBinaryArchive:(id)a6 error:(id *)a7 completionHandler:(id)a8;
- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6 completionHandler:(id)a7;
- (id)newRenderPipelineStateWithTileDescriptorInternal:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 destinationBinaryArchive:(id)a6 error:(id *)a7 completionHandler:(id)a8;
- (id)pipelineStateWithVariant:(VariantEntry *)a3 descriptor:(id)a4 options:(unint64_t)a5 computeProgram:(void *)a6 kernelDriverCompileTimeData:(id)a7 serializedComputeDataDescriptor:(id)a8 compileTimeStatistics:(id)a9 reflection:(id *)a10 error:(id *)a11 completionHandler:(id)a12;
- (id)renderPipelineStateWithTileVariant:(VariantEntry *)a3 descriptor:(id)a4 options:(unint64_t)a5 tileProgram:(void *)a6 kernelDriverCompileTimeData:(id)a7 serializedTileDataDescriptor:(id)a8 compileTimeStatistics:(id)a9 reflection:(id *)a10 error:(id *)a11 completionHandler:(id)a12;
- (unint64_t)compilerFlags;
- (unsigned)compilerId;
- (void)addFunctionKeys:(RequiredFunctionKeys *)a3 function:(id)a4 driverData:(id)a5 frameworkData:(id)a6 compilerOptions:(int)a7;
- (void)addLegacyCompiledOutput:(id)a3 cachedCompiledOutput:(id)a4 importedSymbols:(id)a5 importedLibraries:(id)a6 hashKey:(id)a7 type:(char)a8 functionCache:(shared_ptr<MultiLevelBinaryCache>)a9;
- (void)addLegacyCompiledOutput:(id)a3 importedSymbols:(id)a4 importedLibraries:(id)a5 hashKey:(id)a6 type:(char)a7 functionCache:(shared_ptr<MultiLevelBinaryCache>)a8;
- (void)allowLibrariesFromOtherPlatforms;
- (void)cacheLegacyCompilerData:(void *)a3 cachedData:(void *)a4 hashMap:(void *)a5 libraryData:(void *)a6 functionCache:(shared_ptr<MultiLevelBinaryCache>)a7;
- (void)compileDynamicLibraryWithDescriptor:(id)a3 computePipelineDescriptor:(id)a4 completionHandler:(id)a5;
- (void)compileFunction:(id)a3 frameworkData:(id)a4 driverKeyData:(id)a5 options:(unint64_t)a6 pipelineCache:(id)a7 completionHandler:(id)a8;
- (void)compileFunction:(id)a3 frameworkData:(id)a4 driverKeyData:(id)a5 options:(unint64_t)a6 pipelineCache:(id)a7 sync:(BOOL)a8 completionHandler:(id)a9;
- (void)compileFunction:(id)a3 serializedData:(id)a4 stateData:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7;
- (void)compileFunction:(id)a3 serializedPipelineData:(id)a4 stateData:(id)a5 linkDataSize:(unint64_t)a6 frameworkLinking:(BOOL)a7 options:(unsigned int)a8 pipelineCache:(id)a9 sync:(BOOL)a10 completionHandler:(id)a11;
- (void)compileFunction:(id)a3 serializedPipelineData:(id)a4 stateData:(id)a5 linkDataSize:(unint64_t)a6 frameworkLinking:(BOOL)a7 options:(unsigned int)a8 sync:(BOOL)a9 completionHandler:(id)a10;
- (void)compileFunction:(id)a3 visibleFunctions:(id)a4 privateVisibleFunctions:(id)a5 visibleFunctionGroups:(id)a6 frameworkData:(id)a7 driverKeyData:(id)a8 options:(unint64_t)a9 pipelineCache:(id)a10 sync:(BOOL)a11 completionHandler:(id)a12;
- (void)compileFunction:(id)a3 visibleFunctions:(id)a4 visibleFunctionGroups:(id)a5 frameworkData:(id)a6 driverKeyData:(id)a7 options:(unint64_t)a8 pipelineCache:(id)a9 sync:(BOOL)a10 completionHandler:(id)a11;
- (void)compileFunctionRequest:(id)a3 completionHandler:(id)a4;
- (void)compileFunctionRequestInternal:(id)a3 frameworkLinking:(BOOL)a4 linkDataSize:(unint64_t)a5 reflectionOnly:(BOOL)a6 completionHandler:(id)a7;
- (void)compileLibraryRequest:(MTLCompileLibraryRequestData *)a3 completionHandler:(id)a4;
- (void)compileRequest:(id)a3 binaryArchives:(id)a4 sync:(BOOL)a5 completionHandler:(id)a6;
- (void)compileRequest:(id)a3 completionHandler:(id)a4;
- (void)compileRequest:(id)a3 pipelineCache:(id)a4 completionHandler:(id)a5;
- (void)compileRequest:(id)a3 pipelineCache:(id)a4 sync:(BOOL)a5 completionHandler:(id)a6;
- (void)compileRequestInternal:(id)a3 binaryArchives:(id)a4 failOnBinaryArchiveMiss:(BOOL)a5 pipelineCache:(id)a6 sync:(BOOL)a7 completionHandler:(id)a8;
- (void)compileStatelessFunctionRequest:(id)a3 reflectionOnly:(BOOL)a4 completionHandler:(id)a5;
- (void)createBinaryArchiveAsRecompileTarget:(BOOL)a3 completionHandler:(id)a4;
- (void)createBinaryArchiveWithCompletionHanlder:(id)a3;
- (void)dealloc;
- (void)generateMachOWithID:(const char *)a3 binaryEntries:(shared_ptr<std:(const void *)a5 :(int)a6 vector<machOEntry>>)a4 machOSpecializedData:(id)a7 machOType:(unint64_t)a8 Path:()shared_ptr<std:(NSObject<OS_dispatch_data> *) :()UnorderedContainerHash unordered_map<MTLUINT256_t platform:(UnorderedContainerHash>>)a9 bitcodeList:(id)a10 completionHandler:;
- (void)generateMachOWithID:binaryEntries:machOSpecializedData:machOType:Path:platform:bitcodeList:completionHandler:;
- (void)getDataForScript:(const void *)a3 device:(id)a4 function:(id)a5 functionType:(unint64_t)a6 compilerOptions:(char *)a7 compilerOptionsSize:(unint64_t)a8 compiledNextStageVariant:(id)a9 dataSize:(unint64_t *)a10;
- (void)getFunctionKeyWithRenderPipelineDescriptor:(id)a3 options:(unint64_t)a4 unfilteredOptions:(unint64_t)a5 airScript:(const void *)a6 function:(id)a7 functionType:(unint64_t)a8 compiledNextStageVariant:(id)a9 keySize:(unint64_t *)a10;
- (void)getFunctionKeyWithRenderPipelineDescriptor:(id)a3 options:(unint64_t)a4 unfilteredOptions:(unint64_t)a5 airScript:(const void *)a6 function:(id)a7 functionType:(unint64_t)a8 compiledNextStageVariant:(id)a9 keySize:(unint64_t *)a10 functionDriverData:(void *)a11 functionDriverSize:(unint64_t *)a12;
- (void)getHashForScript:(const void *)a3 device:(id)a4 function:(id)a5 functionType:(unint64_t)a6 compilerOptions:(char *)a7 compilerOptionsSize:(unint64_t)a8 compiledNextStageVariant:(id)a9;
- (void)getProgramObject:(id)a3 destinationArchive:(id)a4 sourceBinaryArchives:(id)a5 variantKey:(const VariantKey *)a6 requiredKeys:(const RequiredFunctionKeys *)a7 failOnMiss:(BOOL)a8;
- (void)getProgramObjectForFunction:(id)a3 variantKey:(const VariantKey *)a4 requiredKeys:(const RequiredFunctionKeys *)a5 sourceBinaryArchives:(id)a6;
- (void)getShaderCacheKeys;
- (void)initializeFunctionRequestScriptAndFunctionId:(id)a3 script:(const void *)a4 driverCompilerOptions:(id)a5 compiledNextStageVariant:(id)a6;
- (void)reflectionWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)reflectionWithFunction:(id)a3 options:(unint64_t)a4 sync:(BOOL)a5 binaryArchives:(id)a6 completionHandler:(id)a7;
- (void)reflectionWithFunction:(id)a3 options:(unint64_t)a4 sync:(BOOL)a5 completionHandler:(id)a6;
- (void)reflectionWithFunction:(id)a3 options:(unint64_t)a4 sync:(BOOL)a5 pipelineLibrary:(id)a6 binaryArchives:(id)a7 completionHandler:(id)a8;
- (void)reflectionWithFunction:(id)a3 options:(unint64_t)a4 sync:(BOOL)a5 pipelineLibrary:(id)a6 completionHandler:(id)a7;
- (void)releaseCompilerOutputBlocks:(void *)a3;
- (void)releaseCompilerOutputBlocks:(void *)a3 hashMap:(void *)a4;
- (void)releaseHashMaps:(void *)a3;
- (void)statelessBackendCompileRequestInternal:(MTLCompilerFunctionRequest *)a3 sync:(BOOL)a4 compilerHash:(id *)a5 reflectionOnly:(BOOL)a6 completionHandler:(id)a7;
- (void)unloadShaderCaches;
@end

@implementation MTLCompiler

- (BOOL)validateLanguageAndAIRVersionForFunction:(id)a3 completionHandler:(id)a4
{
  v7 = (unsigned __int16 *)[a3 functionData];
  int v8 = _MTLGetMTLCompilerLLVMVersionForDevice(self->_device);
  if ((v8 - 32023) >= 2) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = 131079;
  }
  if ((v8 - 32023) >= 2) {
    unsigned int v10 = 0;
  }
  else {
    unsigned int v10 = 196610;
  }
  if (validateLanguageVersion(v7[27] | (v7[26] << 16), v10))
  {
    if (validateAIRVersion(v7[25] | (v7[24] << 16), v9)) {
      return 1;
    }
    uint64_t v12 = [NSString stringWithFormat:@"Function %@ has a deployment target (0x%08X) which is incompatible with this OS (0x%08X).", objc_msgSend(a3, "name"), v7[25] | (v7[24] << 16), v9];
  }
  else
  {
    uint64_t v12 = [NSString stringWithFormat:@"Function %@ is using language version %u.%u which is incompatible with this OS.", objc_msgSend(a3, "name"), v7[26], v7[27]];
  }
  v13[0] = 2;
  v13[1] = v12;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  (*((void (**)(id, void *))a4 + 2))(a4, v13);
  return 0;
}

- (void)releaseHashMaps:(void *)a3
{
  for (i = (void *)*((void *)a3 + 2); i; i = (void *)*i)
  {
    v5 = (void *)i[3];
    if (v5) {
  }
    }

  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(a3);
}

- (unint64_t)compilerFlags
{
  return self->_compilerFlags;
}

- (void)compileFunctionRequestInternal:(id)a3 frameworkLinking:(BOOL)a4 linkDataSize:(unint64_t)a5 reflectionOnly:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a4;
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = [a3 function];
  if (!v12)
  {
    uint64_t v144 = 2;
    v145 = (uint64_t *)@"function is nil";
    long long v146 = 0u;
    long long v147 = 0u;
    memset(&v148, 0, 64);
    (*((void (**)(id, uint64_t *))a7 + 2))(a7, &v144);
    return;
  }
  v13 = (void *)v12;
  v114 = (void (**)(id, void **))a7;
  if (![(MTLCompiler *)self validateLanguageAndAIRVersionForFunction:v12 completionHandler:a7])return; {
  int v14 = [a3 pipelineOptions];
  }
  long long v15 = (void *)[a3 function];
  long long v16 = v15;
  if (v15)
  {
    if ([v15 functionData]) {
      LODWORD(v16) = *(unsigned char *)([v16 functionData] + 88) != 0;
    }
    else {
      LODWORD(v16) = 0;
    }
  }
  uint64_t v17 = [a3 airScript];
  if ((v14 & 0xC1280000) != 0 || v17 == 0) {
    int v19 = 1;
  }
  else {
    int v19 = (int)v16;
  }
  int v109 = v19;
  v20 = (void *)[v13 device];
  unint64_t v21 = [a3 pipelineOptions];
  unint64_t compilerFlags = self->_compilerFlags;
  unint64_t v23 = [v13 functionType] - 1;
  BOOL v105 = v9;
  if (v23 > 7) {
    unint64_t v24 = -1;
  }
  else {
    unint64_t v24 = qword_1828F14D0[v23];
  }
  [v13 functionData];
  int v25 = MTLGetCompilerOptions(v20, v21, compilerFlags, v24, v8);
  if ((v25 & 0x4000) != 0)
  {
    if (_MTLDebugIgnoreFailOnMissFlag()) {
      int v26 = 0;
    }
    else {
      int v26 = 2;
    }
  }
  else
  {
    int v26 = 0;
  }
  uint64_t v27 = objc_msgSend((id)objc_msgSend(a3, "gpuCompilerSPIOptions"), "count");
  uint64_t v100 = [a3 binaryArchives];
  char v28 = (unint64_t)[a3 pipelineOptions] >> 32;
  BOOL v103 = 0;
  int v112 = v25 & 0x102;
  if ((v25 & 2) == 0 && v105) {
    BOOL v103 = (self->_compilerFlags & 0x20) == 0 && [v13 functionType] == 2;
  }
  if ([a3 destinationBinaryArchive]) {
    char v98 = objc_msgSend((id)objc_msgSend(a3, "destinationBinaryArchive"), "supportsAIRNT");
  }
  else {
    char v98 = 1;
  }
  LOBYTE(v29) = 0;
  uint64_t v140 = 0;
  v141 = &v140;
  uint64_t v142 = 0x2020000000;
  char v143 = 0;
  if ((v25 & 2) == 0)
  {
    if ([a3 destinationBinaryArchive]) {
      int v29 = objc_msgSend((id)objc_msgSend(a3, "destinationBinaryArchive"), "supportsAIRNT") & (v109 ^ 1);
    }
    else {
      LOBYTE(v29) = 0;
    }
  }
  char v143 = v29;
  if ([a3 pipelineOptions])
  {
    if (([a3 pipelineOptions] & 0x200008000) != 0) {
      int v30 = 1;
    }
    else {
      int v30 = 5;
    }
  }
  else
  {
    int v30 = 1;
  }
  int v99 = *((unsigned __int8 *)v141 + 24);
  if (*((unsigned char *)v141 + 24)) {
    int v30 = 6;
  }
  unsigned int v102 = v30;
  MultiLevelCacheFactory::createBinaryCache([a3 binaryArchives], objc_msgSend(a3, "destinationBinaryArchive"), objc_msgSend(a3, "pipelineCache"), (uint64_t)self->_shaderCache.__ptr_, v28 & 4 | v26, &v138);
  v31 = (char *)operator new(0x40uLL);
  *((void *)v31 + 1) = 0;
  *((void *)v31 + 2) = 0;
  *(void *)v31 = &unk_1ECAC7690;
  *(_OWORD *)(v31 + 24) = 0u;
  *(_OWORD *)(v31 + 40) = 0u;
  v108 = (std::__shared_weak_count *)v31;
  *((_DWORD *)v31 + 14) = 1065353216;
  v32 = (char *)operator new(0x40uLL);
  *((void *)v32 + 1) = 0;
  *((void *)v32 + 2) = 0;
  *(void *)v32 = &unk_1ECAC7690;
  *(_OWORD *)(v32 + 24) = 0u;
  uint64_t v33 = (uint64_t)(v32 + 24);
  *(_OWORD *)(v32 + 40) = 0u;
  v107 = (std::__shared_weak_count *)v32;
  *((_DWORD *)v32 + 14) = 1065353216;
  v34 = (char *)operator new(0x40uLL);
  *((void *)v34 + 1) = 0;
  *((void *)v34 + 2) = 0;
  *(void *)v34 = &unk_1ECAC7658;
  *(_OWORD *)(v34 + 24) = 0u;
  uint64_t v35 = (uint64_t)(v34 + 24);
  *(_OWORD *)(v34 + 40) = 0u;
  v106 = (std::__shared_weak_count *)v34;
  *((_DWORD *)v34 + 14) = 1065353216;
  uint64_t v144 = 0;
  v145 = &v144;
  *(void *)&long long v146 = 0x8012000000;
  *((void *)&v146 + 1) = __Block_byref_object_copy__1294;
  *(void *)&long long v147 = __Block_byref_object_dispose__1295;
  *((void *)&v147 + 1) = &unk_1828FE28A;
  [(MTLCompiler *)self getFunctionId:a3];
  v36 = [MTLBinaryKey alloc];
  v113 = [(MTLBinaryKey *)v36 initWithHash:v145 + 6];
  FunctionHashFactory::FunctionHashFactory(&v136, v13, [v13 functionData], v25, objc_msgSend(a3, "gpuCompilerSPIOptions"), objc_msgSend(a3, "visibleFunctions"), objc_msgSend(a3, "privateVisibleFunctions"));
  int v104 = v25 & 0x1002;
  if (v104 == 4096)
  {
    v37 = [a3 driverKeyData];
    goto LABEL_45;
  }
  v37 = 0;
  v38 = 0;
  if (v27) {
LABEL_45:
  }
    v38 = [a3 frameworkData];
  Hash = FunctionHashFactory::createHash((uint64_t)&v136, 2, v37, v38);
  LOBYTE(object) = 2;
  buffer_ptr = &object;
  std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v35, (char *)&object, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3] = Hash;
  v110 = FunctionHashFactory::createHash((uint64_t)&v136, 0, (dispatch_data_t)[a3 driverKeyData], objc_msgSend(a3, "frameworkData"));
  LOBYTE(object) = 0;
  buffer_ptr = &object;
  std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v35, (char *)&object, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3] = v110;
  v40 = FunctionHashFactory::createHash((uint64_t)&v136, 1, (dispatch_data_t)[a3 driverKeyData], objc_msgSend(a3, "frameworkData"));
  LOBYTE(object) = 1;
  buffer_ptr = &object;
  std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v35, (char *)&object, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3] = v40;
  uint64_t v41 = FunctionHashFactory::createHash((uint64_t)&v136, 3, 0, 0, 0, 0);
  LOBYTE(object) = 3;
  buffer_ptr = &object;
  std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v35, (char *)&object, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3] = v41;
  v42 = FunctionHashFactory::createHash((uint64_t)&v136, 6, (dispatch_data_t)[a3 driverKeyData], objc_msgSend(a3, "frameworkData"));
  LOBYTE(object) = 6;
  buffer_ptr = &object;
  std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v35, (char *)&object, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3] = v42;
  if (((uint64_t (*)(std::__shared_weak_count *))v138->__vftable[2].~__shared_weak_count_0)(v138))
  {
    v43 = "binary archives";
  }
  else
  {
    int v44 = ((uint64_t (*)(std::__shared_weak_count *))v138->__get_deleter)(v138);
    v43 = "FS cache";
    if (v44) {
      v43 = "pipeline library";
    }
  }
  v101 = v43;
  if (v112 != 256) {
    goto LABEL_62;
  }
  v45 = v138;
  LOBYTE(object) = 3;
  buffer_ptr = &object;
  uint64_t v46 = std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v35, (char *)&object, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3];
  LOBYTE(size_ptr) = 3;
  buffer_ptr = &size_ptr;
  v47 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&size_ptr, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr);
  ((void (*)(std::__shared_weak_count *, uint64_t, void *))v45->__vftable[2].__on_zero_shared_weak)(v45, v46, v47 + 3);
  LOBYTE(object) = 3;
  buffer_ptr = &object;
  if (std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&object, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3])goto LABEL_62; {
  int v48 = ((uint64_t (*)(std::__shared_weak_count *))v138->__vftable[1].~__shared_weak_count)(v138);
  }
  int v49 = v100 ? 0 : v48;
  if (v49 != 1)
  {
LABEL_62:
    if (v104 == 4096)
    {
      v52 = v138;
      LOBYTE(object) = 6;
      buffer_ptr = &object;
      uint64_t v53 = std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v35, (char *)&object, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3];
      LOBYTE(size_ptr) = 6;
      buffer_ptr = &size_ptr;
      v54 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&size_ptr, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr);
      ((void (*)(std::__shared_weak_count *, uint64_t, void *))v52->__vftable[2].__on_zero_shared_weak)(v52, v53, v54 + 3);
      LOBYTE(object) = 6;
      buffer_ptr = &object;
      if (!std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&object, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3])
      {
        int v55 = ((uint64_t (*)(std::__shared_weak_count *))v138->__vftable[1].~__shared_weak_count)(v138);
        int v56 = v100 ? 0 : v55;
        if (v56 == 1)
        {
          [(MTLCompiler *)self releaseCompilerOutputBlocks:v33 hashMap:v35];
          id v57 = [(MTLCompiler *)self createErrorMessageWithRequest:a3 key:v113 cacheType:v101 itemLookedFor:"debug instrumentation data"];

          uint64_t v58 = [NSString stringWithFormat:@"%@", v57];
          buffer_ptr = (void *)2;
          uint64_t v129 = v58;
          long long v130 = 0u;
          long long v131 = 0u;
          long long v132 = 0u;
          long long v133 = 0u;
          long long v134 = 0u;
          long long v135 = 0u;
          v114[2](v114, &buffer_ptr);
          goto LABEL_149;
        }
      }
    }
    dispatch_object_t object = 0;
    dispatch_object_t v127 = 0;
    if ((v109 & 1) == 0)
    {
      if (*((unsigned char *)v141 + 24)
        && (((uint64_t (*)(std::__shared_weak_count *, MTLBinaryKey *, dispatch_object_t *, dispatch_object_t *, void))v138->__vftable[4].~__shared_weak_count)(v138, v113, &object, &v127, v102) & 1) != 0)
      {
        *((unsigned char *)v141 + 24) = 0;
LABEL_69:
        BOOL v59 = 1;
        goto LABEL_71;
      }
      if (((uint64_t (*)(std::__shared_weak_count *, MTLBinaryKey *, dispatch_object_t *, dispatch_object_t *, void))v138->__vftable[2].__on_zero_shared)(v138, v113, &object, &v127, v102))goto LABEL_69; {
    }
      }
    ((void (*)(std::__shared_weak_count *, void *, dispatch_object_t *))v138->__vftable[2].__on_zero_shared_weak)(v138, Hash, &v127);
    BOOL v59 = 0;
LABEL_71:
    dispatch_object_t v60 = v127;
    if (!v127)
    {
      if (((uint64_t (*)(std::__shared_weak_count *))v138->__vftable[1].~__shared_weak_count)(v138))
      {
        id v61 = [(MTLCompiler *)self createErrorMessageWithRequest:a3 key:v113 cacheType:v101 itemLookedFor:0];
        uint64_t v62 = [NSString stringWithFormat:@"%@", v61];
        buffer_ptr = (void *)2;
        uint64_t v129 = v62;
        long long v130 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        long long v133 = 0u;
        long long v134 = 0u;
        long long v135 = 0u;
        [(MTLCompiler *)self releaseCompilerOutputBlocks:v33 hashMap:v35];

        if (object) {
          dispatch_release(object);
        }
        v114[2](v114, &buffer_ptr);
        goto LABEL_149;
      }
      dispatch_object_t v60 = v127;
    }
    LOBYTE(v124) = 2;
    buffer_ptr = &v124;
    std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v124, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3] = v60;
    if ((v25 & 2) != 0 && v127)
    {
      FunctionReplyParameters::FunctionReplyParameters(&buffer_ptr, 0, 0, v33, v35);
      v114[2](v114, &buffer_ptr);
      if (object) {
        dispatch_release(object);
      }
      [(MTLCompiler *)self releaseCompilerOutputBlocks:v33 hashMap:v35];

      goto LABEL_149;
    }
    if (v127) {
      char v63 = v59;
    }
    else {
      char v63 = 1;
    }
    if ((v63 & 1) == 0)
    {
      if (*((unsigned char *)v141 + 24))
      {
        unsigned int v64 = MTLGetReflectionFlags(v127);
        if (v64 > 1)
        {
          BOOL v59 = (~v64 & 6) == 0;
        }
        else
        {
          if (((unsigned int (*)(std::__shared_weak_count *))v138->__vftable[1].~__shared_weak_count)(v138))
          {
            [(MTLCompiler *)self releaseCompilerOutputBlocks:v33 hashMap:v35];
            uint64_t v65 = [NSString stringWithFormat:@"Source and destination are not compatible. The request requires legacy data to be stored on a new binary archive"];

            if (object) {
              dispatch_release(object);
            }
            buffer_ptr = (void *)2;
            uint64_t v129 = v65;
            long long v130 = 0u;
            long long v131 = 0u;
            long long v132 = 0u;
            long long v133 = 0u;
            long long v134 = 0u;
            long long v135 = 0u;
            v114[2](v114, &buffer_ptr);
            goto LABEL_149;
          }
          dispatch_release(v127);
          LOBYTE(v124) = 2;
          dispatch_object_t v127 = 0;
          buffer_ptr = &v124;
          BOOL v59 = 0;
          std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v124, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3] = 0;
        }
      }
      else
      {
        BOOL v59 = 0;
      }
    }
    if ((v25 & 2) == 0
      && !object
      && (((uint64_t (*)(std::__shared_weak_count *, void *, dispatch_object_t *))v138->__vftable[2].__on_zero_shared_weak)(v138, v110, &object) & 1) == 0&& ((unsigned int (*)(std::__shared_weak_count *))v138->__vftable[1].~__shared_weak_count)(v138))
    {
      [(MTLCompiler *)self releaseCompilerOutputBlocks:v33 hashMap:v35];
      id v66 = [(MTLCompiler *)self createErrorMessageWithRequest:a3 key:v113 cacheType:v101 itemLookedFor:0];

      buffer_ptr = (void *)2;
      uint64_t v129 = (uint64_t)v66;
      long long v130 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      long long v134 = 0u;
      long long v135 = 0u;
      v114[2](v114, &buffer_ptr);
      goto LABEL_149;
    }
    dispatch_object_t v67 = object;
    LOBYTE(v124) = 0;
    buffer_ptr = &v124;
    std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v124, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3] = v67;
    if (v103)
    {
      if (object)
      {
        buffer_ptr = 0;
        size_t size_ptr = 0;
        v68 = dispatch_data_create_map(object, (const void **)&buffer_ptr, &size_ptr);
        size_t v123 = 0;
        v124 = 0;
        size_t v121 = 0;
        v122 = 0;
        if (_MTLDecodeLinkingInfo((int *)buffer_ptr, &v124, &v123, &v122, &v121))
        {
          dispatch_data_t subrange = dispatch_data_create_subrange(object, (size_t)v124, v123);
          dispatch_data_t v70 = dispatch_data_create_subrange(object, (size_t)v122, v121);
          dispatch_release(v68);
          dispatch_data_t v111 = subrange;
          if (subrange)
          {
            LOBYTE(v124) = 1;
            buffer_ptr = &v124;
            std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v124, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3] = v70;
            goto LABEL_116;
          }
        }
        else
        {
          dispatch_release(v68);
        }
      }
      v71 = v138;
      LOBYTE(v124) = 1;
      buffer_ptr = &v124;
      uint64_t v72 = std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v35, (char *)&v124, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3];
      LOBYTE(v123) = 1;
      buffer_ptr = &v123;
      v73 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v123, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr);
      ((void (*)(std::__shared_weak_count *, uint64_t, void *))v71->__vftable[2].__on_zero_shared_weak)(v71, v72, v73 + 3);
      LOBYTE(v124) = 1;
      buffer_ptr = &v124;
      if (!std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v124, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3]&& ((unsigned int (*)(std::__shared_weak_count *))v138->__vftable[1].~__shared_weak_count)(v138))
      {
        [(MTLCompiler *)self releaseCompilerOutputBlocks:v33 hashMap:v35];
        id v74 = [(MTLCompiler *)self createErrorMessageWithRequest:a3 key:v113 cacheType:v101 itemLookedFor:"linking data"];

        uint64_t v75 = [NSString stringWithFormat:@"%@", v74];
        buffer_ptr = (void *)2;
        uint64_t v129 = v75;
        long long v130 = 0u;
        long long v131 = 0u;
        long long v132 = 0u;
        long long v133 = 0u;
        long long v134 = 0u;
        long long v135 = 0u;
        v114[2](v114, &buffer_ptr);
        goto LABEL_149;
      }
      LOBYTE(v124) = 1;
      buffer_ptr = &v124;
      v76 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v124, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr);
      dispatch_data_t v111 = 0;
      if (v99)
      {
        if (object)
        {
          v77 = v76[3];
          if (v77)
          {
            v124 = 0;
            size_t size_ptr = 0;
            v78 = dispatch_data_create_map(v77, (const void **)&v124, &size_ptr);
            v122 = 0;
            size_t v123 = 0;
            v79 = dispatch_data_create_map(object, (const void **)&v122, &v123);
            v120 = 0;
            size_t v121 = 0;
            _MTLEncodeLinkingInfo(v122, v123, v124, size_ptr, (uint64_t)&v120, &v121);
            dispatch_release(v78);
            dispatch_release(v79);
            v80 = dispatch_data_create(v120, v121, 0, (dispatch_block_t)*MEMORY[0x1E4F143F0]);
            LOBYTE(v118) = 0;
            buffer_ptr = &v118;
            if (std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v118, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3])
            {
              LOBYTE(v118) = 0;
              buffer_ptr = &v118;
              v81 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v118, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr);
              dispatch_release((dispatch_object_t)v81[3]);
            }
            dispatch_retain(v80);
            LOBYTE(v118) = 0;
            buffer_ptr = &v118;
            std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v118, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3] = v80;
            buffer_ptr = 0;
            uint64_t v118 = 0;
            size_t length = 0;
            uint64_t v117 = 0;
            _MTLDecodeLinkingInfo(v120, &buffer_ptr, &length, &v118, &v117);
            dispatch_data_t v111 = dispatch_data_create_subrange(v80, (size_t)buffer_ptr, length);
            dispatch_release(v80);
          }
        }
      }
    }
    else
    {
      dispatch_data_t v111 = 0;
    }
LABEL_116:
    if (v99 && object && v59)
    {
      v82 = [MTLBinaryEntry alloc];
      LOBYTE(v124) = 0;
      buffer_ptr = &v124;
      uint64_t v83 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v124, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3];
      LOBYTE(v123) = 2;
      buffer_ptr = &v123;
      v84 = -[MTLBinaryEntry initWithData:reflectionBlock:](v82, "initWithData:reflectionBlock:", v83, std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v123, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3]);
      v85 = (void *)[a3 function];
      -[MTLBinaryEntry setAirScript:](v84, "setAirScript:", [a3 airScript]);
      v86 = [v85 bitcodeDataInternal];
      [(MTLBinaryEntry *)v84 setBitcode:v86];
      dispatch_release(v86);
      [(MTLBinaryEntry *)v84 setLinkedBitcodes:[(MTLCompiler *)self newLinkedFunctionsBitcodeFromRequest:a3 hashKey:v145 + 6]];

      uint64_t v87 = ((uint64_t (*)(std::__shared_weak_count *, MTLBinaryKey *, MTLBinaryEntry *, uint64_t, uint64_t))v138->__vftable[3].~__shared_weak_count_0)(v138, v113, v84, [a3 archiverId], objc_msgSend(v85, "functionType"));
      LOBYTE(v124) = 7;
      buffer_ptr = &v124;
      std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v124, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3] = v87;
    }
    if (v111)
    {
      LOBYTE(v124) = 0;
      buffer_ptr = &v124;
      if (std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v124, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3])
      {
        LOBYTE(v124) = 0;
        buffer_ptr = &v124;
        v88 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v124, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr);
        dispatch_release((dispatch_object_t)v88[3]);
      }
      LOBYTE(v124) = 0;
      buffer_ptr = &v124;
      std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v124, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3] = v111;
    }
    LOBYTE(v124) = 0;
    buffer_ptr = &v124;
    if (!std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v124, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3])goto LABEL_139; {
    if (*((unsigned char *)v141 + 24))
    }
      char v89 = 1;
    else {
      char v89 = v98;
    }
    if ((v89 & 1) == 0)
    {
      uint64_t v90 = [v13 libraryData];
      v115 = v138;
      v116 = v139;
      if (v139) {
        atomic_fetch_add_explicit(&v139->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      [(MTLCompiler *)self cacheLegacyCompilerData:v33 cachedData:0 hashMap:v35 libraryData:v90 functionCache:&v115];
      if (v116) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v116);
      }
    }
    LOBYTE(v124) = 2;
    buffer_ptr = &v124;
    v91 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v124, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr);
    if ((v25 & 1) != 0 && !v91[3]) {
      goto LABEL_139;
    }
    if ((LOBYTE(v123) = 3,
          buffer_ptr = &v123,
          v92 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v123, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr), v112 == 256)&& !v92[3]|| (LOBYTE(v122) = 6, buffer_ptr = &v122, v93 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v122, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr), (v25 & 0x1000) != 0)&& !v93[3])
    {
LABEL_139:
      LOBYTE(v124) = 2;
      buffer_ptr = &v124;
      std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v124, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr);
      LOBYTE(v124) = 0;
      buffer_ptr = &v124;
      if (std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v124, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3])
      {
        LOBYTE(v123) = 3;
        buffer_ptr = &v123;
        v94 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v123, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr);
        if (v112 != 256 || v94[3])
        {
          LOBYTE(v122) = 6;
          buffer_ptr = &v122;
          v95 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v122, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr);
          if (v104 != 4096 || v95[3])
          {
            LOBYTE(v121) = 1;
            buffer_ptr = &v121;
            std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v121, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr);
          }
        }
      }
      operator new();
    }
    if (v99)
    {
      v96 = v138;
      LOBYTE(v124) = 7;
      buffer_ptr = &v124;
      uint64_t v97 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v33, (char *)&v124, (uint64_t)&std::piecewise_construct, (unsigned char **)&buffer_ptr)[3];
      ((void (*)(std::__shared_weak_count *, uint64_t, MTLBinaryKey *, uint64_t))v96->__vftable[3].__on_zero_shared)(v96, v97, v113, [v13 functionType]);
    }
    FunctionReplyParameters::FunctionReplyParameters(&buffer_ptr, 0, 0, v33, v35);
    v114[2](v114, &buffer_ptr);
    [(MTLCompiler *)self releaseCompilerOutputBlocks:v33 hashMap:v35];

    goto LABEL_149;
  }
  [(MTLCompiler *)self releaseCompilerOutputBlocks:v33 hashMap:v35];
  id v50 = [(MTLCompiler *)self createErrorMessageWithRequest:a3 key:v113 cacheType:v101 itemLookedFor:"pipeline statistics"];

  uint64_t v51 = [NSString stringWithFormat:@"%@", v50];
  buffer_ptr = (void *)2;
  uint64_t v129 = v51;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  v114[2](v114, &buffer_ptr);
LABEL_149:

  _Block_object_dispose(&v144, 8);
  MTLHashKey::~MTLHashKey(&v148);
  std::__shared_weak_count::__release_shared[abi:ne180100](v106);
  std::__shared_weak_count::__release_shared[abi:ne180100](v107);
  std::__shared_weak_count::__release_shared[abi:ne180100](v108);
  if (v139) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v139);
  }
  _Block_object_dispose(&v140, 8);
}

- (void)releaseCompilerOutputBlocks:(void *)a3
{
  for (i = (void *)*((void *)a3 + 2); i; i = (void *)*i)
  {
    v5 = i[3];
    if (v5) {
      dispatch_release(v5);
    }
  }

  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::clear(a3);
}

- (void)releaseCompilerOutputBlocks:(void *)a3 hashMap:(void *)a4
{
  [(MTLCompiler *)self releaseHashMaps:a4];

  [(MTLCompiler *)self releaseCompilerOutputBlocks:a3];
}

uint64_t __100__MTLCompiler_reflectionWithFunction_options_sync_pipelineLibrary_binaryArchives_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)downgradeRequest:(MTLCompilerFunctionRequest *)a3 frameworkData:(void *)a4 error:(id *)a5
{
  int var1 = self->_compilerConnectionManager->var1;
  if (var1 >= 32023)
  {
    if (a5) {
      *a5 = 0;
    }
    return 1;
  }
  else
  {
    if (a3->var4)
    {
      id v8 = [(MTLCompiler *)self downgradeFunctionRequest:a3 targetLLVMVersion:self->_compilerConnectionManager->var1 frameworkData:a4 error:a5];
      BOOL v9 = v8;
      if (a4 && (a3->var6 & 2) != 0)
      {
        char v14 = 2;
        long long v15 = &v14;
        id v10 = (id)std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)a4, &v14, (uint64_t)&std::piecewise_construct, &v15)[3];
      }
      else
      {
        id var4 = a3->var4;
        id v10 = v8;
        if (var4 != v8)
        {
          if (var4) {

          }
          a3->id var4 = v9;
          id v10 = v9;
        }
      }
    }
    else
    {
      id v10 = (id)MTLLibraryBuilder::newDowngradedLibrary(*(os_unfair_lock_s **)([a3->var5 device] + 424), a3, var1, (NSError **)a5);
      id var5 = a3->var5;
      if (var5 != v10)
      {
        if (var5) {

        }
        a3->id var5 = v10;
      }
    }
    return v10 != 0;
  }
}

- (void)compileRequest:(id)a3 pipelineCache:(id)a4 sync:(BOOL)a5 completionHandler:(id)a6
{
}

- (void)reflectionWithFunction:(id)a3 options:(unint64_t)a4 sync:(BOOL)a5 pipelineLibrary:(id)a6 binaryArchives:(id)a7 completionHandler:(id)a8
{
  BOOL v10 = a5;
  int v11 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = [a6 pipelineCache];
  long long v15 = objc_opt_new();
  [v15 setSync:v10];
  [v15 setFunction:a3];
  [v15 setPipelineOptions:v11 & 0x20200000 | 0x10003];
  [v15 setPipelineCache:v14];
  [v15 setBinaryArchives:a7];
  long long v16 = (_OWORD *)[a3 bitCodeHash];
  if (v16)
  {
    long long v17 = v16[1];
    v22[0] = *v16;
    v22[1] = v17;
    long long v18 = v22;
  }
  else
  {
    memset(v21, 0, sizeof(v21));
    long long v18 = v21;
  }
  [v15 setArchiveHashKey:v18];
  if ([a3 functionType] == 6 || objc_msgSend(a3, "functionType") == 5)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __100__MTLCompiler_reflectionWithFunction_options_sync_pipelineLibrary_binaryArchives_completionHandler___block_invoke;
    v20[3] = &unk_1E52212D8;
    v20[4] = a8;
    [(MTLCompiler *)self compileStatelessFunctionRequest:v15 reflectionOnly:1 completionHandler:v20];
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __100__MTLCompiler_reflectionWithFunction_options_sync_pipelineLibrary_binaryArchives_completionHandler___block_invoke_2;
    v19[3] = &unk_1E52212D8;
    v19[4] = a8;
    [(MTLCompiler *)self compileFunctionRequestInternal:v15 frameworkLinking:0 linkDataSize:0 reflectionOnly:1 completionHandler:v19];
  }
}

- (void)reflectionWithFunction:(id)a3 options:(unint64_t)a4 sync:(BOOL)a5 binaryArchives:(id)a6 completionHandler:(id)a7
{
}

- (MTLHashKey)getFunctionId:(SEL)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if ([a4 airScript])
  {
    long long v58 = 0uLL;
    long long v59 = 0uLL;
    if (a4) {
      [a4 vendorPluginFunctionId];
    }
    buffer_ptr = 0;
    if ([a4 airScript])
    {
      size_t size_ptr = 0;
      dispatch_object_t object = dispatch_data_create_map((dispatch_data_t)[a4 airScript], (const void **)&buffer_ptr, &size_ptr);
    }
    else
    {
      dispatch_object_t object = 0;
    }
    size_t size_ptr = 0;
    uint64_t v53 = 0;
    v54 = 0;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v8 = (void *)[a4 visibleFunctions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v57 count:16];
    uint64_t v41 = self;
    v42 = retstr;
    if (v9)
    {
      uint64_t v10 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v49 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = [*(id *)(*((void *)&v48 + 1) + 8 * i) bitCodeHash];
          uint64_t v13 = v12;
          uint64_t v14 = v53;
          if (v53 >= v54)
          {
            uint64_t v16 = (uint64_t)&v53[-size_ptr] >> 3;
            if ((unint64_t)(v16 + 1) >> 61) {
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v17 = (uint64_t)&v54[-size_ptr] >> 2;
            if (v17 <= v16 + 1) {
              unint64_t v17 = v16 + 1;
            }
            if ((unint64_t)&v54[-size_ptr] >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v18 = v17;
            }
            if (v18) {
              int v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v54, v18);
            }
            else {
              int v19 = 0;
            }
            v20 = (uint64_t *)&v19[8 * v16];
            uint64_t *v20 = v13;
            long long v15 = (char *)(v20 + 1);
            size_t v22 = size_ptr;
            unint64_t v21 = v53;
            if (v53 != (char *)size_ptr)
            {
              do
              {
                uint64_t v23 = *((void *)v21 - 1);
                v21 -= 8;
                *--v20 = v23;
              }
              while (v21 != (char *)v22);
              unint64_t v21 = (char *)size_ptr;
            }
            size_t size_ptr = (size_t)v20;
            uint64_t v53 = v15;
            v54 = &v19[8 * v18];
            if (v21) {
              operator delete(v21);
            }
          }
          else
          {
            *(void *)uint64_t v53 = v12;
            long long v15 = v14 + 8;
          }
          uint64_t v53 = v15;
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v9);
    }
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    unint64_t v24 = (void *)[a4 privateVisibleFunctions];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v56 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v45 != v26) {
            objc_enumerationMutation(v24);
          }
          uint64_t v28 = [*(id *)(*((void *)&v44 + 1) + 8 * j) bitCodeHash];
          uint64_t v29 = v28;
          int v30 = v53;
          if (v53 >= v54)
          {
            uint64_t v32 = (uint64_t)&v53[-size_ptr] >> 3;
            if ((unint64_t)(v32 + 1) >> 61) {
              std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v33 = (uint64_t)&v54[-size_ptr] >> 2;
            if (v33 <= v32 + 1) {
              unint64_t v33 = v32 + 1;
            }
            if ((unint64_t)&v54[-size_ptr] >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v34 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v34 = v33;
            }
            if (v34) {
              uint64_t v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<objc_object  {objcproto18MTLIOScratchBuffer}*>>((uint64_t)&v54, v34);
            }
            else {
              uint64_t v35 = 0;
            }
            v36 = (uint64_t *)&v35[8 * v32];
            uint64_t *v36 = v29;
            v31 = (char *)(v36 + 1);
            size_t v38 = size_ptr;
            v37 = v53;
            if (v53 != (char *)size_ptr)
            {
              do
              {
                uint64_t v39 = *((void *)v37 - 1);
                v37 -= 8;
                *--v36 = v39;
              }
              while (v37 != (char *)v38);
              v37 = (char *)size_ptr;
            }
            size_t size_ptr = (size_t)v36;
            uint64_t v53 = v31;
            v54 = &v35[8 * v34];
            if (v37) {
              operator delete(v37);
            }
          }
          else
          {
            *(void *)uint64_t v53 = v28;
            v31 = v30 + 8;
          }
          uint64_t v53 = v31;
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v56 count:16];
      }
      while (v25);
    }
    uint64_t v40 = [a4 function];
    if (v41)
    {
      [(MTLCompiler *)v41 getFunctionId:v40 airScript:buffer_ptr vendorPluginFunctionId:&v58 bitcodeHashList:&size_ptr];
    }
    else
    {
      *(_OWORD *)&v42->var1.var0[24] = 0u;
      *(_OWORD *)&v42->var2.int var1 = 0u;
      *(_OWORD *)&v42->var0.var2 = 0u;
      *(_OWORD *)&v42->var1.var0[8] = 0u;
      *(_OWORD *)&v42->var0.var0 = 0u;
    }
    dispatch_release(object);
    result = (MTLHashKey *)size_ptr;
    if (size_ptr)
    {
      uint64_t v53 = (char *)size_ptr;
      operator delete((void *)size_ptr);
    }
  }
  else
  {
    long long v58 = 0uLL;
    long long v59 = 0uLL;
    MTLHashKey::MTLHashKey((uint64_t)retstr, (uint64_t)&v58);
  }
  return result;
}

- (MTLHashKey)getFunctionId:(SEL)a3 airScript:(id)a4 vendorPluginFunctionId:(const void *)a5 bitcodeHashList:(id *)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = [a4 functionType];
  if (!strncmp((const char *)a5 + 4, "AIRP", 4uLL))
  {
    PipelineFrameworkHash = _getPipelineFrameworkHash((Air::PipelineScript *)((char *)a5 + *(unsigned int *)a5), v13);
  }
  else
  {
    if (strncmp((const char *)a5 + 4, "AIRF", 4uLL))
    {
      uint64_t v14 = 0;
      goto LABEL_7;
    }
    PipelineFrameworkHash = _getFunctionHash((Air::PipelineScript *)((char *)a5 + *(unsigned int *)a5));
  }
  uint64_t v14 = PipelineFrameworkHash;
LABEL_7:
  if (useRelaxedMath())
  {
    CC_SHA256(v14, 0x20u, md);
    long long v16 = v25;
    *(_OWORD *)uint64_t v14 = *(_OWORD *)md;
    *((_OWORD *)v14 + 1) = v16;
  }
  long long v17 = *((_OWORD *)v14 + 1);
  long long v29 = *(_OWORD *)v14;
  long long v30 = v17;
  *(void *)md = [a4 bitCodeHash];
  *(void *)&md[8] = 0;
  long long v25 = 0uLL;
  std::vector<MTLUINT256_t const*>::__init_with_size[abi:ne180100]<MTLUINT256_t const**,MTLUINT256_t const**>(&md[8], *(const void **)a7, *((void *)a7 + 1), (uint64_t)(*((void *)a7 + 1) - *(void *)a7) >> 3);
  if (self)
  {
    [(MTLCompiler *)self getGPUCompilerHashForScript:a5 type:v13];
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
  }
  __p = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  unint64_t v18 = (char *)operator new(0x6CuLL);
  *(_OWORD *)(v18 + 4) = v22;
  *(_OWORD *)(v18 + 20) = v23;
  long long v19 = *(_OWORD *)&a6->var0[16];
  *(_OWORD *)(v18 + 40) = *(_OWORD *)a6->var0;
  *(_OWORD *)(v18 + 56) = v19;
  long long v20 = v30;
  *(_OWORD *)(v18 + 76) = v29;
  uint64_t v27 = v18 + 108;
  uint64_t v28 = v18 + 108;
  *(_DWORD *)unint64_t v18 = 1026;
  *((_DWORD *)v18 + 9) = 1027;
  *((_DWORD *)v18 + 18) = 1032;
  *(_OWORD *)(v18 + 92) = v20;
  __p = v18;
  free(v14);
  MTLHashKey::MTLHashKey(retstr, (const MTLFunctionToolList *)md);
  if (__p)
  {
    uint64_t v27 = __p;
    operator delete(__p);
  }
  result = *(MTLHashKey **)&md[8];
  if (*(void *)&md[8])
  {
    *(void *)&long long v25 = *(void *)&md[8];
    operator delete(*(void **)&md[8]);
  }
  return result;
}

- ($2772B1D07D29A72E8557B2574C0AE5C1)getGPUCompilerHashForScript:(SEL)a3 type:(const void *)a4
{
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[16] = 0u;
  if (a4)
  {
    switch(a5)
    {
      case 1uLL:
        v7 = (uint64_t (*)(char *, SEL))MEMORY[0x1F4197058];
        if (MEMORY[0x1E4F62BE0]) {
          goto LABEL_5;
        }
        return self;
      case 2uLL:
        v7 = (uint64_t (*)(char *, SEL))MEMORY[0x1F4197040];
        if (MEMORY[0x1E4F62BC8]) {
          goto LABEL_5;
        }
        return self;
      case 3uLL:
        v7 = (uint64_t (*)(char *, SEL))MEMORY[0x1F4197038];
        if (MEMORY[0x1E4F62BC0]) {
          goto LABEL_5;
        }
        return self;
      case 5uLL:
      case 6uLL:
        v6 = (_OWORD *)MTLGPUCompilerHashFunctionScript();
        goto LABEL_6;
      case 7uLL:
        v7 = (uint64_t (*)(char *, SEL))MEMORY[0x1F4197048];
        if (!MEMORY[0x1E4F62BD0]) {
          return self;
        }
        goto LABEL_5;
      case 8uLL:
        v7 = (uint64_t (*)(char *, SEL))MEMORY[0x1F4197050];
        if (!MEMORY[0x1E4F62BD8]) {
          return self;
        }
LABEL_5:
        v6 = (_OWORD *)v7((char *)a4 + *(unsigned int *)a4, a3);
LABEL_6:
        long long v8 = v6[1];
        *(_OWORD *)retstr->var0 = *v6;
        *(_OWORD *)&retstr->var0[16] = v8;
        free(v6);
        break;
      default:
        return self;
    }
  }
  return self;
}

- (void)compileFunctionRequest:(id)a3 completionHandler:(id)a4
{
  v7 = (void *)[a3 function];
  if ([v7 functionType] == 5 || objc_msgSend(v7, "functionType") == 6)
  {
    [(MTLCompiler *)self compileStatelessFunctionRequest:a3 reflectionOnly:0 completionHandler:a4];
  }
  else
  {
    [(MTLCompiler *)self compileFunctionRequestInternal:a3 frameworkLinking:0 linkDataSize:0 reflectionOnly:0 completionHandler:a4];
  }
}

- (void)compileRequestInternal:(id)a3 binaryArchives:(id)a4 failOnBinaryArchiveMiss:(BOOL)a5 pipelineCache:(id)a6 sync:(BOOL)a7 completionHandler:(id)a8
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  dispatch_retain((dispatch_object_t)a3);
  operator new();
}

- (MTLHashKey)getBuiltInFunctionId:(SEL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (-[MTLCompiler getBuiltInFunctionId:]::onceToken != -1) {
    dispatch_once(&-[MTLCompiler getBuiltInFunctionId:]::onceToken, &__block_literal_global_1237);
  }
  v9[0] = -[MTLCompiler getBuiltInFunctionId:]::NullHash;
  v9[1] = unk_1EB226A21;
  long long v6 = *(_OWORD *)&a4->var0[16];
  v9[2] = *(_OWORD *)a4->var0;
  v9[3] = v6;
  uint64_t v8 = 0x40300000000;
  return (MTLHashKey *)MTLHashKey::MTLHashKey(retstr, v9, &v8, 2);
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  return self;
}

void __109__MTLCompiler_compileFunctionRequestInternal_frameworkLinking_linkDataSize_reflectionOnly_completionHandler___block_invoke(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  dispatch_object_t v46 = a3;
  if ([*(id *)(a1 + 32) destinationBinaryArchive]) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "destinationBinaryArchive"), "remoteInsertionEnd");
  }
  if (!a2)
  {
    for (uint64_t i = *(char **)(*(void *)(a1 + 88) + 16); i; uint64_t i = *(char **)i)
    {
      uint64_t v9 = *((void *)i + 3);
      if (v9)
      {
        uint64_t v10 = *(void *)(a1 + 104);
        v40[0] = i + 16;
        std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType const&>,std::tuple<>>(v10, i + 16, (uint64_t)&std::piecewise_construct, v40)[3] = v9;
        dispatch_retain(*((dispatch_object_t *)i + 3));
      }
    }
    int v11 = *(_DWORD *)(a1 + 152);
    if ((v11 & 2) != 0)
    {
      uint64_t v13 = *(void *)(a1 + 104);
      LOBYTE(v40[0]) = 2;
    }
    else
    {
      if (v11)
      {
        v40[0] = 0;
        size_t size_ptr = 0;
        buffer_ptr = 0;
        uint64_t v12 = dispatch_data_create_map(v46, (const void **)&buffer_ptr, &size_ptr);
        deserializeCompilerOutputData(buffer_ptr, size_ptr, (uint64_t *)v40, *(void **)(a1 + 88), *(void *)(a1 + 104));
        dispatch_release(v12);
        goto LABEL_16;
      }
      uint64_t v13 = *(void *)(a1 + 104);
      LOBYTE(v40[0]) = 0;
    }
    std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*&>(v13, (char *)v40, v40, &v46);
    dispatch_retain(v46);
LABEL_16:
    LOBYTE(v14) = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    if ((_BYTE)v14)
    {
      uint64_t v15 = *(void *)(a1 + 104);
      LOBYTE(size_ptr) = 0;
      v40[0] = &size_ptr;
      uint64_t v14 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v15, (char *)&size_ptr, (uint64_t)&std::piecewise_construct, v40)[3];
      if (v14)
      {
        uint64_t v16 = *(void *)(a1 + 104);
        char v43 = 2;
        v40[0] = &v43;
        LOBYTE(v14) = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v16, &v43, (uint64_t)&std::piecewise_construct, v40)[3] != 0;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v14;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      long long v17 = [MTLBinaryEntry alloc];
      uint64_t v18 = *(void *)(a1 + 104);
      LOBYTE(size_ptr) = 0;
      v40[0] = &size_ptr;
      uint64_t v19 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v18, (char *)&size_ptr, (uint64_t)&std::piecewise_construct, v40)[3];
      uint64_t v20 = *(void *)(a1 + 104);
      char v43 = 2;
      v40[0] = &v43;
      unint64_t v21 = -[MTLBinaryEntry initWithData:reflectionBlock:](v17, "initWithData:reflectionBlock:", v19, std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v20, &v43, (uint64_t)&std::piecewise_construct, v40)[3]);
      if ((*(unsigned char *)(a1 + 152) & 2) != 0)
      {
        long long v22 = (void *)[*(id *)(a1 + 32) function];
        -[MTLBinaryEntry setAirScript:](v21, "setAirScript:", [*(id *)(a1 + 32) airScript]);

        long long v23 = [v22 bitcodeDataInternal];
        [(MTLBinaryEntry *)v21 setBitcode:v23];
        -[MTLBinaryEntry setLinkedBitcodes:](v21, "setLinkedBitcodes:", [*(id *)(a1 + 40) newLinkedFunctionsBitcodeFromRequest:*(void *)(a1 + 32) hashKey:*(void *)(*(void *)(a1 + 80) + 8) + 48]);
        dispatch_release(v23);
      }
      if (!*(unsigned char *)(a1 + 156) || (*(unsigned char *)(a1 + 152) & 2) != 0)
      {
        uint64_t v24 = (*(uint64_t (**)(void, void, MTLBinaryEntry *, uint64_t, uint64_t))(**(void **)(a1 + 120)
                                                                                            + 128))(*(void *)(a1 + 120), *(void *)(a1 + 48), v21, [*(id *)(a1 + 32) archiverId], objc_msgSend(*(id *)(a1 + 56), "functionType"));
        uint64_t v25 = *(void *)(a1 + 104);
        LOBYTE(size_ptr) = 7;
        v40[0] = &size_ptr;
        std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v25, (char *)&size_ptr, (uint64_t)&std::piecewise_construct, v40)[3] = v24;
      }
      else
      {
        (*(void (**)(void, void, MTLBinaryEntry *))(**(void **)(a1 + 120) + 144))(*(void *)(a1 + 120), *(void *)(a1 + 48), v21);
      }
      uint64_t v26 = *(void *)(a1 + 120);
      uint64_t v27 = *(void *)(a1 + 104);
      LOBYTE(size_ptr) = 7;
      v40[0] = &size_ptr;
      uint64_t v28 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v27, (char *)&size_ptr, (uint64_t)&std::piecewise_construct, v40)[3];
      (*(void (**)(uint64_t, uint64_t, void, uint64_t))(*(void *)v26 + 136))(v26, v28, *(void *)(a1 + 48), [*(id *)(a1 + 56) functionType]);
    }
    else
    {
      long long v29 = *(void **)(a1 + 40);
      uint64_t v30 = *(void *)(a1 + 104);
      uint64_t v31 = *(void *)(a1 + 88);
      uint64_t v32 = *(void *)(a1 + 136);
      uint64_t v33 = [*(id *)(a1 + 56) libraryData];
      unint64_t v34 = *(std::__shared_weak_count **)(a1 + 128);
      uint64_t v41 = *(void *)(a1 + 120);
      v42 = v34;
      if (v34) {
        atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      [v29 cacheLegacyCompilerData:v30 cachedData:v31 hashMap:v32 libraryData:v33 functionCache:&v41];
      if (v42) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v42);
      }
    }
    if (*(unsigned char *)(a1 + 157))
    {
      uint64_t v35 = *(void *)(a1 + 104);
      LOBYTE(size_ptr) = 3;
      v40[0] = &size_ptr;
      if (!std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v35, (char *)&size_ptr, (uint64_t)&std::piecewise_construct, v40)[3])
      {
        uint64_t v36 = *(void *)(a1 + 88);
        char v43 = 3;
        v40[0] = &v43;
        if (!std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v36, &v43, (uint64_t)&std::piecewise_construct, v40)[3])
        {
          LOBYTE(size_ptr) = 0;
          uint64_t v37 = *(void *)(a1 + 120);
          uint64_t v38 = *(void *)(a1 + 136);
          char v43 = 3;
          v40[0] = &v43;
          uint64_t v39 = std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v38, &v43, (uint64_t)&std::piecewise_construct, v40);
          (*(void (**)(uint64_t, void, size_t *, uint64_t))(*(void *)v37 + 56))(v37, v39[3], &size_ptr, 1);
        }
      }
    }
    goto LABEL_35;
  }
  if (!a4)
  {
LABEL_35:
    uint64_t v7 = 0;
    goto LABEL_36;
  }
  uint64_t v7 = [NSString stringWithUTF8String:a4];
LABEL_36:
  FunctionReplyParameters::FunctionReplyParameters(v40, a2, v7, *(void *)(a1 + 104), *(void *)(a1 + 136));
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

  [*(id *)(a1 + 40) releaseCompilerOutputBlocks:*(void *)(a1 + 88) hashMap:*(void *)(a1 + 136)];
  [*(id *)(a1 + 40) releaseCompilerOutputBlocks:*(void *)(a1 + 104)];
}

- (void)cacheLegacyCompilerData:(void *)a3 cachedData:(void *)a4 hashMap:(void *)a5 libraryData:(void *)a6 functionCache:(shared_ptr<MultiLevelBinaryCache>)a7
{
  uint64_t v7 = (uint64_t *)*((void *)a3 + 2);
  if (v7)
  {
    var0 = a7.var0;
    while (1)
    {
      unsigned __int8 v23 = *((unsigned char *)v7 + 16);
      if (v23 > 7u || ((1 << v23) & 0xB0) == 0) {
        break;
      }
LABEL_7:
      uint64_t v7 = (uint64_t *)*v7;
      if (!v7) {
        return;
      }
    }
    uint64_t v12 = v7[3];
    if (a4)
    {
      uint64_t v24 = &v23;
      uint64_t v13 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType const&>,std::tuple<>>((uint64_t)a4, (char *)&v23, (uint64_t)&std::piecewise_construct, &v24)[3];
      if (v23)
      {
LABEL_11:
        uint64_t v14 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v13 = 0;
      if (v23) {
        goto LABEL_11;
      }
    }
    uint64_t v14 = (*(uint64_t (**)(void *))(*(void *)a6 + 64))(a6);
    if (!v23)
    {
      uint64_t v15 = (*(uint64_t (**)(void *))(*(void *)a6 + 72))(a6);
      goto LABEL_15;
    }
LABEL_14:
    uint64_t v15 = 0;
LABEL_15:
    uint64_t v24 = &v23;
    uint64_t v16 = std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType const&>,std::tuple<>>((uint64_t)a5, (char *)&v23, (uint64_t)&std::piecewise_construct, &v24)[3];
    signed __int8 v17 = v23;
    uint64_t v18 = (std::__shared_weak_count *)*((void *)var0 + 1);
    uint64_t v21 = *(void *)var0;
    long long v22 = v18;
    if (v18) {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(MTLCompiler *)self addLegacyCompiledOutput:v12 cachedCompiledOutput:v13 importedSymbols:v14 importedLibraries:v15 hashKey:v16 type:v17 functionCache:&v21];
    if (v22) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    }
    goto LABEL_7;
  }
}

- (void)addLegacyCompiledOutput:(id)a3 cachedCompiledOutput:(id)a4 importedSymbols:(id)a5 importedLibraries:(id)a6 hashKey:(id)a7 type:(char)a8 functionCache:(shared_ptr<MultiLevelBinaryCache>)a9
{
  if (a3 && a3 != a4)
  {
    uint64_t v10 = [[MTLBinaryEntry alloc] initWithData:a3 importedSymbols:a5 importedLibraries:a6];
    (*(void (**)(void, id, MTLBinaryEntry *))(**(void **)a9.var0 + 144))(*(void *)a9.var0, a7, v10);
  }
}

double __36__MTLCompiler_getBuiltInFunctionId___block_invoke()
{
  double result = *(double *)&AIR_NULL_HASH;
  -[MTLCompiler getBuiltInFunctionId:]::NullHash = AIR_NULL_HASH;
  unk_1EB226A21 = unk_1828F1008;
  return result;
}

void *__197__MTLCompiler_tileVariantEntryWithDescriptor_airDescriptor_options_serializedTileDataDescriptor_asyncCompile_destinationBinaryArchive_tileProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_2(uint64_t a1)
{
  double result = VariantList<4u>::find<VariantKey>(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(void *)(*(void *)(a1 + 72) + 8) + 48);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    double result = VariantList<4u>::newVariantEntry<VariantKey>(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(void *)(*(void *)(a1 + 72) + 8) + 48);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  }
  if (*(void *)(a1 + 32)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  }
  if ((*(unsigned char *)(a1 + 106) & 0x40) != 0)
  {
    unint64_t v3 = *(void *)(a1 + 112);
    int v4 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    v5 = *(void **)(a1 + 40);
    uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "tileFunction"), "name");
    if (v3 <= 8 && ((1 << v3) & 0x186) != 0)
    {
      uint64_t v7 = MTLPipelinePerformanceKeyVertexShader;
      if (v3 != 1) {
        uint64_t v7 = MTLPipelinePerformanceKeyFragmentShader;
      }
      if (v3 == 8) {
        uint64_t v7 = MTLPipelinePerformanceKeyObjectShader;
      }
      if (v3 == 7) {
        uint64_t v7 = MTLPipelinePerformanceKeyMeshShader;
      }
      uint64_t v8 = *v7;
      id v9 = (id)[v5 objectForKey:*v7];
      if (!v9)
      {
        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v5 setObject:v9 forKey:v8];
      }
    }
    else
    {
      id v9 = v5;
    }
    uint64_t v10 = [NSNumber numberWithBool:v4 == 0];
    double result = (void *)[v9 setObject:v10 forKey:MTLCompileTimeStatisticsKeyCachedFunction[0]];
    if (v6) {
      double result = (void *)[v9 setObject:v6 forKey:MTLCompileTimeStatisticsKeyFunctionName[0]];
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
  {
    double result = (void *)[*(id *)(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) + 432) objectForKey:&stru_1ECAC84A8];
    BOOL v11 = result == 0;
  }
  else
  {
    BOOL v11 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v11;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    if (!*(void *)(v12 + 424))
    {
      double result = dispatch_queue_create("reflection Queue", 0);
      *(void *)(v12 + 424) = result;
    }
  }
  return result;
}

- (MTLCompiler)initWithTargetData:(id)a3 cacheUUID:(id *)a4 pluginPath:(id)a5 device:(id)a6 compilerFlags:(unint64_t)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v18 = @"pluginPath is not a NSString.";
    unint64_t v19 = 1;
    uint64_t v20 = 11637;
  }
  else
  {
    uint64_t v18 = @"pluginPath must not be nil.";
    unint64_t v19 = 0;
    uint64_t v20 = 11634;
  }
  MTLReportFailure(v19, "-[MTLCompiler initWithTargetData:cacheUUID:pluginPath:device:compilerFlags:]", v20, (uint64_t)v18, (uint64_t)a5, (uint64_t)a6, a7, v7, v21);
LABEL_3:
  CC_SHA256_Init(&c);
  if (!reuseCacheOnReboot())
  {
    CC_SHA256_Update(&c, "Nov 10 2024", 0xBu);
    CC_SHA256_Update(&c, "03:43:09", 8u);
  }
  CC_SHA256_Update(&c, a4, 0x20u);
  CC_SHA256_Final(md, &c);
  uint64_t v14 = (NSString *)[a5 copy];
  self->_device = (_MTLDevice *)a6;
  self->_pluginPath = v14;
  self->_unint64_t compilerFlags = a7;
  self->_compilerQueue = (OS_dispatch_queue *)dispatch_queue_create("compiler queue", 0);
  uint64_t v15 = _MTLGetMTLCompilerLLVMVersionForDevice(a6);
  self->_compilerConnectionManager = (MTLCompilerConnectionManager *)getCompilerConnectionManager(self->_device, v15);
  self->_compilerId = (*((uint64_t (**)(MTLCompilerConnectionManager *, uint64_t, id))self->_compilerConnectionManager->var0
                       + 2))(self->_compilerConnectionManager, [a5 cStringUsingEncoding:4], a3);
  long long v25 = *(_OWORD *)md;
  long long v26 = v24;
  addOrRemoveShaderFunctionCache(0, &v21);
  cntrl = self->_shaderCache.__cntrl_;
  self->_shaderCache = (shared_ptr<MTLCompilerCache>)v21;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  return self;
}

void __197__MTLCompiler_tileVariantEntryWithDescriptor_airDescriptor_options_serializedTileDataDescriptor_asyncCompile_destinationBinaryArchive_tileProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v5 = *(unsigned int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  uint64_t v6 = *(void *)(a1 + 96);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = [*(id *)(a1 + 56) binaryArchives];
  if (v2) {
    [v2 requiredKeysForFunction:v3 variantKey:v4 + 48 frameworkData:v7 compilerOptions:v5 driverCompilerOptions:0 airScript:v6 archives:v8 compiledNextStageVariant:0];
  }
  else {
    memset(&v9, 0, sizeof(v9));
  }
  *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "getProgramObject:destinationArchive:sourceBinaryArchives:variantKey:requiredKeys:failOnMiss:", *(void *)(a1 + 40), *(void *)(a1 + 64), objc_msgSend(*(id *)(a1 + 56), "binaryArchives"), *(void *)(*(void *)(a1 + 72) + 8) + 48, &v9, *(unsigned __int8 *)(a1 + 104));
  RequiredFunctionKeys::~RequiredFunctionKeys(&v9);
}

- (VariantEntry)tileVariantEntryWithDescriptor:(id)a3 airDescriptor:(id)a4 options:(unint64_t)a5 serializedTileDataDescriptor:(id)a6 asyncCompile:(BOOL)a7 destinationBinaryArchive:(id)a8 tileProgram:(MTLProgramObject *)a9 kernelDriverCompileTimeData:(id *)a10 compileTimeStatistics:(id)a11
{
  BOOL v12 = a7;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  uint64_t v71 = 0;
  uint64_t v64 = 0;
  uint64_t v65 = &v64;
  uint64_t v66 = 0x2020000000;
  uint64_t v67 = 0;
  uint64_t v60 = 0;
  id v61 = &v60;
  uint64_t v62 = 0x2020000000;
  char v63 = 0;
  uint64_t v56 = 0;
  id v57 = &v56;
  uint64_t v58 = 0x2020000000;
  char v59 = 0;
  uint64_t v52 = 0;
  uint64_t v53 = &v52;
  uint64_t v54 = 0x2020000000;
  int v55 = 0;
  int v55 = MTLGetCompilerOptions(self->_device, a5, self->_compilerFlags, 0, 0);
  uint64_t v18 = (void *)[a3 tileFunction];
  uint64_t v32 = [v18 functionType];
  buffer_ptr = 0;
  size_t size_ptr = 0;
  unint64_t v19 = dispatch_data_create_map((dispatch_data_t)a4, (const void **)&buffer_ptr, &size_ptr);
  uint64_t v49 = 0;
  uint64_t v20 = [(_MTLDevice *)self->_device tileFunctionKeyWithTilePipelineDescriptor:a3 options:a5 keySize:&v49];
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x6812000000;
  v45[3] = __Block_byref_object_copy__1350;
  v45[4] = __Block_byref_object_dispose__1351;
  uint64_t v33 = v20;
  v45[6] = v20;
  v45[7] = 0;
  v45[8] = v49;
  v45[9] = 0;
  if (a6)
  {
    long long v21 = dispatch_data_create_map((dispatch_data_t)a6, &v47, &v48);
  }
  else
  {
    long long v21 = 0;
    long long v47 = 0;
    size_t v48 = 0;
  }
  dispatch_object_t object = v21;
  compilerQueue = self->_compilerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __197__MTLCompiler_tileVariantEntryWithDescriptor_airDescriptor_options_serializedTileDataDescriptor_asyncCompile_destinationBinaryArchive_tileProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke;
  block[3] = &unk_1E5221580;
  block[4] = self;
  block[5] = v18;
  uint64_t v31 = v18;
  block[6] = a6;
  block[7] = a3;
  block[9] = v45;
  block[10] = &v52;
  block[11] = &v64;
  block[12] = buffer_ptr;
  block[8] = a8;
  BOOL v44 = (a5 & 4) != 0;
  dispatch_sync(compilerQueue, block);
  uint64_t v23 = v65[3];
  if ((a5 & 4) == 0 || v23)
  {
    long long v25 = *(NSObject **)(v23 + 440);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __197__MTLCompiler_tileVariantEntryWithDescriptor_airDescriptor_options_serializedTileDataDescriptor_asyncCompile_destinationBinaryArchive_tileProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_2;
    v42[3] = &unk_1E5221670;
    v42[8] = &v64;
    v42[9] = v45;
    v42[4] = a8;
    v42[5] = a11;
    v42[13] = a5;
    v42[14] = v32;
    v42[6] = a3;
    v42[7] = &v68;
    v42[10] = &v56;
    v42[11] = &v60;
    v42[12] = &v52;
    dispatch_sync(v25, v42);
    uint64_t v36 = 0;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x3052000000;
    uint64_t v39 = __Block_byref_object_copy__10;
    uint64_t v40 = __Block_byref_object_dispose__10;
    uint64_t v41 = 0;
    if (a8 || (long long v26 = 0, *((unsigned char *)v57 + 24))) {
      long long v26 = dispatch_data_create(*(const void **)v69[3], *(void *)(v69[3] + 16) + *(void *)(v69[3] + 8), 0, 0);
    }
    uint64_t v27 = (MTLCompileFunctionRequestData *)objc_opt_new();
    [(MTLCompileFunctionRequestData *)v27 setSync:!v12];
    [(MTLCompileFunctionRequestData *)v27 setFunction:v31];
    [(MTLCompileFunctionRequestData *)v27 setPipelineOptions:a5];
    [(MTLCompileFunctionRequestData *)v27 setFrameworkData:a6];
    [(MTLCompileFunctionRequestData *)v27 setDriverKeyData:v26];
    [(MTLCompileFunctionRequestData *)v27 setDestinationBinaryArchive:a8];
    -[MTLCompileFunctionRequestData setBinaryArchives:](v27, "setBinaryArchives:", [a3 binaryArchives]);
    -[MTLCompileFunctionRequestData setGpuCompilerSPIOptions:](v27, "setGpuCompilerSPIOptions:", [a3 gpuCompilerSPIOptions]);
    -[MTLCompileFunctionRequestData setMaxAccelerationStructureTraversalDepth:](v27, "setMaxAccelerationStructureTraversalDepth:", [a3 maxAccelerationStructureTraversalDepth]);
    [(MTLCompileFunctionRequestData *)v27 setAirScript:v19];
    setLinkedFunctionsForRequest(v27, (MTLLinkedFunctions *)[a3 linkedFunctions]);
    [(MTLCompiler *)self initializeFunctionRequestScriptAndFunctionId:v27 script:buffer_ptr driverCompilerOptions:0 compiledNextStageVariant:0];
    if (*((unsigned char *)v57 + 24))
    {
      if ((*((unsigned char *)v53 + 25) & 2) != 0) {
        uint64_t v28 = mach_absolute_time();
      }
      else {
        uint64_t v28 = 0;
      }
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __197__MTLCompiler_tileVariantEntryWithDescriptor_airDescriptor_options_serializedTileDataDescriptor_asyncCompile_destinationBinaryArchive_tileProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_3;
      v35[3] = &unk_1E5221698;
      v35[10] = v28;
      v35[11] = v32;
      v35[6] = &v52;
      v35[7] = &v64;
      v35[4] = self;
      v35[5] = a11;
      v35[8] = &v68;
      v35[9] = &v36;
      -[MTLCompiler compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:](self, "compileFunctionRequestInternal:frameworkLinking:linkDataSize:reflectionOnly:completionHandler:", v27, 1, 0, 0, v35, a11);
    }
    else if (*((unsigned char *)v61 + 24))
    {
      dispatch_group_enter(*(dispatch_group_t *)(v69[3] + 40));
      uint64_t v29 = [a3 binaryArchives];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __197__MTLCompiler_tileVariantEntryWithDescriptor_airDescriptor_options_serializedTileDataDescriptor_asyncCompile_destinationBinaryArchive_tileProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_4;
      v34[3] = &unk_1E5221530;
      v34[4] = &v64;
      v34[5] = &v68;
      [(MTLCompiler *)self reflectionWithFunction:v31 options:a5 sync:0 binaryArchives:v29 completionHandler:v34];
    }

    if (v26) {
      dispatch_release(v26);
    }
    dispatch_release(v19);
    [(_MTLDevice *)self->_device freeTileFunctionKey:v33 keySize:v49];
    *a10 = (id)v37[5];
    *a9 = (MTLProgramObject *)v65[3];
    long long v24 = (VariantEntry *)v69[3];
    _Block_object_dispose(&v36, 8);
  }
  else
  {
    [(_MTLDevice *)self->_device freeTileFunctionKey:v33 keySize:v49];
    dispatch_release(v19);
    long long v24 = 0;
  }
  _Block_object_dispose(v45, 8);
  if (object) {
    dispatch_release(object);
  }
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);
  return v24;
}

- (void)reflectionWithFunction:(id)a3 options:(unint64_t)a4 sync:(BOOL)a5 pipelineLibrary:(id)a6 completionHandler:(id)a7
{
}

- (void)reflectionWithFunction:(id)a3 options:(unint64_t)a4 sync:(BOOL)a5 completionHandler:(id)a6
{
}

- (void)unloadShaderCaches
{
  uint64_t v3 = (os_unfair_lock_s *)_MTLGetLibrariesCache(self->_device);
  if (v3)
  {
    uint64_t v4 = v3;
    os_unfair_lock_lock(v3);
    std::__tree<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::__map_value_compare<MTLLibraryIdentifier,std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>,std::less<MTLLibraryIdentifier>,true>,std::allocator<std::__value_type<MTLLibraryIdentifier,MTLLibraryData *>>>::erase((uint64_t **)&v4[2], *(uint64_t **)&v4[2]._os_unfair_lock_opaque, (uint64_t *)&v4[4]);
    os_unfair_lock_unlock(v4);
    (*(void (**)(void))(**(void **)&v4[8]._os_unfair_lock_opaque + 24))(*(void *)&v4[8]._os_unfair_lock_opaque);
  }
  uint64_t v5 = (void (*)(void))*((void *)self->_shaderCache.__ptr_->var0 + 3);

  v5();
}

- (void)getShaderCacheKeys
{
  return (void *)(*((uint64_t (**)(void))self->_shaderCache.__ptr_->var0 + 9))();
}

- (BOOL)copyShaderCacheToPath:(id)a3
{
  uint64_t v5 = _MTLGetLibrariesCache(self->_device);
  if (!v5
    || (uint64_t v6 = *(void *)(v5 + 32)) == 0
    || (int v7 = (*(uint64_t (**)(uint64_t, id))(*(void *)v6 + 64))(v6, a3)) != 0)
  {
    ptr = self->_shaderCache.__ptr_;
    if (ptr)
    {
      RequiredFunctionKeys v9 = (uint64_t (*)(void))*((void *)ptr->var0 + 8);
      LOBYTE(v7) = v9();
    }
    else
    {
      LOBYTE(v7) = 1;
    }
  }
  return v7;
}

- ($85CD2974BE96D4886BB301820D1C36C2)libraryCacheStats
{
  uint64_t v2 = *(void *)(_MTLGetLibrariesCache(self->_device) + 32);
  if (v2) {
    return *($85CD2974BE96D4886BB301820D1C36C2 *)(v2 + 12);
  }
  else {
    return ($85CD2974BE96D4886BB301820D1C36C2)0;
  }
}

- ($85CD2974BE96D4886BB301820D1C36C2)pipelineCacheStats
{
  ptr = self->_shaderCache.__ptr_;
  if (ptr) {
    return *($85CD2974BE96D4886BB301820D1C36C2 *)&ptr->var2;
  }
  else {
    return ($85CD2974BE96D4886BB301820D1C36C2)0;
  }
}

- (void)dealloc
{
  self->_compilerConnectionManager = 0;
  dispatch_release((dispatch_object_t)self->_compilerQueue);
  self->_compilerQueue = 0;
  [(MTLCompiler *)self unloadShaderCaches];
  cntrl = self->_shaderCache.__cntrl_;
  self->_shaderCache.__ptr_ = 0;
  self->_shaderCache.__cntrl_ = 0;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  removeShaderFunctionCache();

  v4.receiver = self;
  v4.super_class = (Class)MTLCompiler;
  [(MTLCompiler *)&v4 dealloc];
}

void __114__MTLCompiler_compileRequestInternal_binaryArchives_failOnBinaryArchiveMiss_pipelineCache_sync_completionHandler___block_invoke(uint64_t a1, void *a2, NSObject *a3, uint64_t a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v8 = *(_OWORD *)(a1 + 72);
  v15[0] = *(_OWORD *)(a1 + 56);
  v15[1] = v8;
  *(void *)&double v9 = MTLHashKey::MTLHashKey((uint64_t)&v14, a1 + 56).n128_u64[0];
  if (!a2 && a3)
  {
    buffer_ptr[0] = 0;
    size_t size_ptr = 0;
    uint64_t v10 = dispatch_data_create_map(a3, (const void **)buffer_ptr, &size_ptr);
    (*(void (**)(void, MTLHashKey *, void *, size_t))(**(void **)(a1 + 40) + 48))(*(void *)(a1 + 40), &v14, buffer_ptr[0], size_ptr);
    dispatch_release(v10);
  }
  if (a4) {
    BOOL v11 = objc_msgSend(NSString, "stringWithUTF8String:", a4, v9);
  }
  else {
    BOOL v11 = 0;
  }
  buffer_ptr[0] = a2;
  buffer_ptr[1] = v11;
  buffer_ptr[2] = v15;
  buffer_ptr[3] = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  MTLHashKey::~MTLHashKey(&v14);
}

- (void)compileRequest:(id)a3 completionHandler:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__MTLCompiler_compileRequest_completionHandler___block_invoke;
  v4[3] = &unk_1E5221260;
  v4[4] = a4;
  [(MTLCompiler *)self compileRequest:a3 pipelineCache:0 completionHandler:v4];
}

uint64_t __48__MTLCompiler_compileRequest_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)compileRequest:(id)a3 pipelineCache:(id)a4 completionHandler:(id)a5
{
}

- (void)compileRequest:(id)a3 binaryArchives:(id)a4 sync:(BOOL)a5 completionHandler:(id)a6
{
}

- (void)generateMachOWithID:(const char *)a3 binaryEntries:(shared_ptr<std:(const void *)a5 :(int)a6 vector<machOEntry>>)a4 machOSpecializedData:(id)a7 machOType:(unint64_t)a8 Path:()shared_ptr<std:(NSObject<OS_dispatch_data> *) :()UnorderedContainerHash unordered_map<MTLUINT256_t platform:(UnorderedContainerHash>>)a9 bitcodeList:(id)a10 completionHandler:
{
  int v11 = (int)a5;
  int var1 = a4.var1;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  var0 = (uint64_t **)a4.var0;
  uint64_t v14 = **(void **)a4.var0;
  uint64_t v13 = *(void *)(*(void *)a4.var0 + 8);
  char v59 = 0;
  uint64_t v60 = 0;
  id v61 = 0;
  *(void *)c.count = &v59;
  LOBYTE(c.hash[0]) = 0;
  uint64_t v52 = v14;
  uint64_t v53 = v13;
  unint64_t v15 = (v13 - v14) / 72;
  if (v13 != v14)
  {
    if (v15 >= 0x2E8BA2E8BA2E8BBLL) {
      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v16 = (char *)operator new(88 * v15);
    char v59 = v16;
    id v61 = &v16[88 * v15];
    bzero(v16, 88 * ((88 * v15 - 88) / 0x58) + 88);
    uint64_t v60 = &v16[88 * ((88 * v15 - 88) / 0x58) + 88];
  }
  signed __int8 v17 = (unint64_t *)malloc_type_malloc(104 * v15 + 136, 0x2C0C59FDuLL);
  bzero(v17, 104 * v15 + 136);
  *signed __int8 v17 = (unint64_t)a7;
  *((_DWORD *)v17 + 31) = dyld_get_active_platform();
  v17[1] = v15;
  *((unsigned char *)v17 + 128) = v11;
  *((_DWORD *)v17 + 30) = [(MTLTargetDeviceArchitecture *)[(_MTLDevice *)self->_device targetDeviceArchitecture] versionCombined];
  v17[5] = 104 * v15 + 136;
  uint64_t v18 = (const char *)[(id)MTLGetGPUArchiverCachePath() UTF8String];
  uint64_t v19 = strlen(v18) + 1;
  *((_DWORD *)v17 + 23) = v19;
  uint64_t v20 = 104 * v15 + v19 + 143;
  unint64_t v21 = v20 & 0xFFFFFFFFFFFFFFF8;
  if (a3)
  {
    uint64_t v22 = strlen(a3) + 1;
    *((_DWORD *)v17 + 22) = v22;
    v17[4] = v21;
    unint64_t v21 = ((v20 | 7) + v22) & 0xFFFFFFFFFFFFFFF8;
  }
  size_t size_ptr = 0;
  buffer_ptr = 0;
  if (v11)
  {
    if (v11 == 1)
    {
      v17[8] = v21;
      uint64_t v23 = strlen(*(const char **)var1) + 1;
      *((_DWORD *)v17 + 28) = v23;
      unint64_t v21 = ((v21 | 7) + v23) & 0xFFFFFFFFFFFFFFF8;
      char v55 = 1;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v24 = *((void *)var1 + 1);
    if (v24)
    {
      v17[7] = v21;
      uint64_t v25 = (40 * v24);
      *((_DWORD *)v17 + 25) = v25;
      v21 += v25;
    }
    long long v26 = *((void *)var1 + 2);
    if (v26 && dispatch_data_create_map(v26, (const void **)&buffer_ptr, &size_ptr))
    {
      char v55 = 0;
      v17[9] = v21;
      size_t v27 = size_ptr;
      *((_DWORD *)v17 + 29) = size_ptr;
      unint64_t v21 = (v21 + v27 + 7) & 0xFFFFFFFFFFFFFFF8;
      goto LABEL_15;
    }
  }
  char v55 = 0;
LABEL_15:
  uint64_t v28 = *(void *)a8;
  if (*(void *)a8)
  {
    v17[10] = v21;
    uint64_t v29 = *(void *)(v28 + 24);
    *((_DWORD *)v17 + 26) = 0;
    *((_DWORD *)v17 + 27) = v29;
    operator new();
  }
  if (v53 != v52)
  {
    uint64_t v30 = 0;
    if (v15 <= 1) {
      uint64_t v31 = 1;
    }
    else {
      uint64_t v31 = v15;
    }
    uint64_t v32 = v17 + 29;
    uint64_t v33 = 32;
    do
    {
      unint64_t v34 = v59;
      *(v32 - 10) = v21;
      uint64_t v35 = **var0;
      uint64_t v36 = *(NSObject **)(v35 + v33 - 16);
      if (v36)
      {
        *(void *)&v34[v30] = dispatch_data_create_map(v36, (const void **)&v34[v30 + 56], v32 - 9);
        unint64_t v21 = (v21 + *(v32 - 9) + 7) & 0xFFFFFFFFFFFFFFF8;
      }
      *(v32 - 8) = v21;
      uint64_t v37 = *(NSObject **)(v35 + v33 - 8);
      if (v37)
      {
        *(void *)&v34[v30 + 8] = dispatch_data_create_map(v37, (const void **)&v34[v30 + 64], v32 - 7);
        unint64_t v21 = (v21 + *(v32 - 7) + 7) & 0xFFFFFFFFFFFFFFF8;
      }
      *(v32 - 6) = v21;
      uint64_t v38 = *(NSObject **)(v35 + v33);
      if (v38)
      {
        *(void *)&v34[v30 + 16] = dispatch_data_create_map(v38, (const void **)&v34[v30 + 72], v32 - 5);
        unint64_t v21 = (v21 + *(v32 - 5) + 7) & 0xFFFFFFFFFFFFFFF8;
      }
      uint64_t v39 = *(void *)(v35 + v33 - 24);
      if (v39)
      {
        uint64_t v39 = (*(void *)(v39 + 64) - *(void *)(v39 + 56)) >> 5;
        uint64_t v40 = v21 + 4 * v39 + 7;
        unint64_t v41 = v40 & 0xFFFFFFFFFFFFFFF8;
        unint64_t v42 = (v40 + 32 * v39) & 0xFFFFFFFFFFFFFFF8;
      }
      else
      {
        unint64_t v41 = v21;
        unint64_t v42 = v21;
      }
      *((_DWORD *)v32 - 24) = v39;
      *(v32 - 4) = v21;
      *(v32 - 3) = v41;
      *(v32 - 2) = v42;
      char v43 = v55;
      if (!*(void *)(v35 + v33 - 24)) {
        char v43 = 1;
      }
      if ((v43 & 1) == 0)
      {
        *(void *)&v34[v30 + 24] = dispatch_data_create_map(*(dispatch_data_t *)(v35 + v33 + 8), (const void **)&v34[v30 + 80], v32 - 1);
        unint64_t v42 = (v42 + *(v32 - 1) + 7) & 0xFFFFFFFFFFFFFFF8;
      }
      uint64_t v44 = v35 + v33;
      long long v47 = *(char **)(v35 + v33 + 16);
      dispatch_object_t v46 = (char *)(v35 + v33 + 16);
      long long v45 = v47;
      uint64_t v48 = *(void *)(v44 + 24);
      uint64_t v49 = v48 - (void)v47;
      if ((char *)v48 != v47)
      {
        long long v50 = &v34[v30 + 32];
        if (v50 != v46)
        {
          std::vector<MTLUINT256_t>::__assign_with_size[abi:ne180100]<MTLUINT256_t*,MTLUINT256_t*>(v50, v45, v48, v49 >> 5);
          uint64_t v49 = *(void *)(v44 + 24) - *(void *)v46;
        }
        *((_DWORD *)v32 - 22) = (unint64_t)v49 >> 5;
        unint64_t *v32 = v42;
        unint64_t v42 = (v42 + v49 + 7) & 0xFFFFFFFFFFFFFFF8;
      }
      v30 += 88;
      v33 += 72;
      v32 += 13;
      unint64_t v21 = v42;
      --v31;
    }
    while (v31);
  }
  operator new();
}

uint64_t __124__MTLCompiler_generateMachOWithID_binaryEntries_machOSpecializedData_machOType_Path_platform_bitcodeList_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    uint64_t v7 = [NSString stringWithUTF8String:a4];
  }
  else {
    uint64_t v7 = 0;
  }
  v9[0] = a2;
  v9[1] = v7;
  v9[2] = a1 + 40;
  v9[3] = a3;
  return (*(uint64_t (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v9, a3, a4);
}

- (void)createBinaryArchiveWithCompletionHanlder:(id)a3
{
}

- (void)createBinaryArchiveAsRecompileTarget:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  operator new();
}

uint64_t __70__MTLCompiler_createBinaryArchiveAsRecompileTarget_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    uint64_t v7 = [NSString stringWithUTF8String:a4];
  }
  else {
    uint64_t v7 = 0;
  }
  v9[0] = a2;
  v9[1] = v7;
  v9[2] = a1 + 40;
  v9[3] = a3;
  return (*(uint64_t (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v9, a3, a4);
}

- ($2772B1D07D29A72E8557B2574C0AE5C1)hashKeyForLibraryRequest:(SEL)a3
{
  CC_SHA256_Init(&c);
  var3 = a4->var3;
  if (var3)
  {
    size_t size_ptr = 0;
    buffer_ptr = 0;
    uint64_t v7 = dispatch_data_create_map(var3, (const void **)&buffer_ptr, &size_ptr);
    CC_SHA256_Update(&c, buffer_ptr, size_ptr);
    dispatch_release(v7);
  }
  id var4 = a4->var4;
  if (var4)
  {
    size_t size_ptr = 0;
    buffer_ptr = 0;
    double v9 = dispatch_data_create_map(var4, (const void **)&buffer_ptr, &size_ptr);
    CC_SHA256_Update(&c, buffer_ptr, size_ptr);
    dispatch_release(v9);
  }
  buffer_ptr = (void *)(a4->var2 & 0xE);
  CC_SHA256_Update(&c, &buffer_ptr, 8u);
  return ($2772B1D07D29A72E8557B2574C0AE5C1 *)CC_SHA256_Final(retstr->var0, &c);
}

- ($2772B1D07D29A72E8557B2574C0AE5C1)hashKeyForStatelessCompilationRequest:(SEL)a3
{
  CC_SHA256_Init(&c);
  uint64_t v6 = [a4 frameworkData];
  if (v6)
  {
    size_t size_ptr = 0;
    buffer_ptr = 0;
    uint64_t v7 = dispatch_data_create_map(v6, (const void **)&buffer_ptr, &size_ptr);
    CC_SHA256_Update(&c, buffer_ptr, size_ptr);
    dispatch_release(v7);
  }
  long long v8 = [a4 driverKeyData];
  if (v8)
  {
    size_t size_ptr = 0;
    buffer_ptr = 0;
    double v9 = dispatch_data_create_map(v8, (const void **)&buffer_ptr, &size_ptr);
    CC_SHA256_Update(&c, buffer_ptr, size_ptr);
    dispatch_release(v9);
  }
  return ($2772B1D07D29A72E8557B2574C0AE5C1 *)CC_SHA256_Final(retstr->var0, &c);
}

- (void)addLegacyCompiledOutput:(id)a3 importedSymbols:(id)a4 importedLibraries:(id)a5 hashKey:(id)a6 type:(char)a7 functionCache:(shared_ptr<MultiLevelBinaryCache>)a8
{
  double v9 = (std::__shared_weak_count *)v8[1];
  uint64_t v10 = *v8;
  int v11 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(MTLCompiler *)self addLegacyCompiledOutput:a3 cachedCompiledOutput:0 importedSymbols:a4 importedLibraries:a5 hashKey:a6 type:a7 functionCache:&v10];
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
}

- (MTLHashKey)getFunctionId:(SEL)a3 airScript:(id)a4 vendorPluginFunctionId:(const void *)a5
{
  __p = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  if (self)
  {
    [(MTLHashKey *)self getFunctionId:a4 airScript:a5 vendorPluginFunctionId:a6 bitcodeHashList:&__p];
    self = (MTLHashKey *)__p;
    if (__p)
    {
      uint64_t v7 = __p;
      operator delete(__p);
    }
  }
  else
  {
    *(_OWORD *)&retstr->var1.var0[24] = 0u;
    *(_OWORD *)&retstr->var2.int var1 = 0u;
    *(_OWORD *)&retstr->var0.var2 = 0u;
    *(_OWORD *)&retstr->var1.var0[8] = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }
  return self;
}

- (BOOL)initializeVendorPluginFunctionId:(id)a3 airScript:(const void *)a4 driverCompilerOptions:(id)a5 compiledNextStageVariant:(id)a6 vendorPlugin:(id *)a7
{
  if (a4)
  {
    uint64_t v18 = 0;
    BOOL v12 = [(_MTLDevice *)self->_device newTranslatedDriverCompilerOptions:a5 compilerOptionsSize:&v18];
    device = self->_device;
    uint64_t v14 = [a3 functionType];
    unint64_t v15 = [(MTLCompiler *)self getHashForScript:a4 device:device function:a3 functionType:v14 compilerOptions:v12 compilerOptionsSize:v18 compiledNextStageVariant:a6];
    if (v15)
    {
      long long v16 = v15[1];
      *(_OWORD *)a7->var0 = *v15;
      *(_OWORD *)&a7->var0[16] = v16;
      free(v15);
    }
    [(_MTLDevice *)self->_device freeTranslatedDriverCompilerOptions:v12 compilerOptionsSize:v18];
  }
  return a4 != 0;
}

- (void)initializeFunctionRequestScriptAndFunctionId:(id)a3 script:(const void *)a4 driverCompilerOptions:(id)a5 compiledNextStageVariant:(id)a6
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  -[MTLCompiler initializeVendorPluginFunctionId:airScript:driverCompilerOptions:compiledNextStageVariant:vendorPlugin:](self, "initializeVendorPluginFunctionId:airScript:driverCompilerOptions:compiledNextStageVariant:vendorPlugin:", [a3 function], a4, a5, a6, &v8);
  v7[0] = v8;
  v7[1] = v9;
  [a3 setVendorPluginFunctionId:v7];
}

- (void)getHashForScript:(const void *)a3 device:(id)a4 function:(id)a5 functionType:(unint64_t)a6 compilerOptions:(char *)a7 compilerOptionsSize:(unint64_t)a8 compiledNextStageVariant:(id)a9
{
  if (!a3) {
    return 0;
  }
  unint64_t v15 = (char *)a3 + 4;
  if (!strncmp((const char *)a3 + 4, "AIRP", 4uLL) || !strncmp(v15, "AIRF", 4uLL)) {
    long long v16 = (char *)a3 + *(unsigned int *)a3;
  }
  else {
    long long v16 = 0;
  }
  switch(a6)
  {
    case 1uLL:
      double result = (void *)[a4 getVertexFunctionId:v16 function:a5 compilerOptions:a7 compilerOptionsSize:a8 compiledFragmentVariant:a9];
      break;
    case 2uLL:
      double result = (void *)[a4 getFragmentFunctionId:v16 compilerOptions:a7 compilerOptionsSize:a8];
      break;
    case 3uLL:
      double result = (void *)[a4 getComputeFunctionId:v16 function:a5 compilerOptions:a7 compilerOptionsSize:a8];
      break;
    case 5uLL:
      double result = (void *)[a4 getVisibleFunctionId:v16 compilerOptions:a7 compilerOptionsSize:a8];
      break;
    case 6uLL:
      double result = (void *)[a4 getIntersectionFunctionId:v16 compilerOptions:a7 compilerOptionsSize:a8];
      break;
    case 7uLL:
      double result = (void *)[a4 getMeshFunctionId:v16 compilerOptions:a7 compilerOptionsSize:a8];
      break;
    case 8uLL:
      double result = (void *)[a4 getObjectFunctionId:v16 compilerOptions:a7 compilerOptionsSize:a8];
      break;
    default:
      return 0;
  }
  return result;
}

- (void)getDataForScript:(const void *)a3 device:(id)a4 function:(id)a5 functionType:(unint64_t)a6 compilerOptions:(char *)a7 compilerOptionsSize:(unint64_t)a8 compiledNextStageVariant:(id)a9 dataSize:(unint64_t *)a10
{
  if (!a3) {
    return 0;
  }
  if (!strncmp((const char *)a3 + 4, "AIRP", 4uLL)) {
    unint64_t v15 = (char *)a3 + *(unsigned int *)a3;
  }
  else {
    unint64_t v15 = 0;
  }
  switch(a6)
  {
    case 8uLL:
      return (void *)[a4 getObjectFunctionDriverData:v15 function:a5 compilerOptions:a7 nextStageVariant:a9 driverDataSize:a10];
    case 7uLL:
      return (void *)[a4 getMeshFunctionDriverData:v15 function:a5 compilerOptions:a7 nextStageVariant:a9 driverDataSize:a10];
    case 1uLL:
      return (void *)[a4 getVertexFunctionDriverData:v15 function:a5 compilerOptions:a7 nextStageVariant:a9 driverDataSize:a10];
    default:
      if (a10) {
        *a10 = 0;
      }
      return 0;
  }
}

- (void)getFunctionKeyWithRenderPipelineDescriptor:(id)a3 options:(unint64_t)a4 unfilteredOptions:(unint64_t)a5 airScript:(const void *)a6 function:(id)a7 functionType:(unint64_t)a8 compiledNextStageVariant:(id)a9 keySize:(unint64_t *)a10 functionDriverData:(void *)a11 functionDriverSize:(unint64_t *)a12
{
  switch(a8)
  {
    case 1uLL:
      double result = -[_MTLDevice vertexFunctionKeyWithRenderPipelineDescriptor:options:nextStageVariant:vertexKeySize:](self->_device, "vertexFunctionKeyWithRenderPipelineDescriptor:options:nextStageVariant:vertexKeySize:", a3, a4, a9, a10, a7);
      break;
    case 2uLL:
      double result = -[_MTLDevice fragmentFunctionKeyWithRenderPipelineDescriptor:options:previousStateVariant:fragmentKeySize:](self->_device, "fragmentFunctionKeyWithRenderPipelineDescriptor:options:previousStateVariant:fragmentKeySize:", a3, a4, 0, a10, a7);
      break;
    case 7uLL:
      double result = -[_MTLDevice meshFunctionKeyWithRenderPipelineDescriptor:options:nextStageVariant:meshKeySize:](self->_device, "meshFunctionKeyWithRenderPipelineDescriptor:options:nextStageVariant:meshKeySize:", a3, a4, a9, a10, a7);
      break;
    case 8uLL:
      double result = -[_MTLDevice objectFunctionKeyWithRenderPipelineDescriptor:options:nextStageVariant:objectKeySize:](self->_device, "objectFunctionKeyWithRenderPipelineDescriptor:options:nextStageVariant:objectKeySize:", a3, a4, a9, a10, a7);
      break;
    default:
      double result = 0;
      break;
  }
  return result;
}

- (void)getFunctionKeyWithRenderPipelineDescriptor:(id)a3 options:(unint64_t)a4 unfilteredOptions:(unint64_t)a5 airScript:(const void *)a6 function:(id)a7 functionType:(unint64_t)a8 compiledNextStageVariant:(id)a9 keySize:(unint64_t *)a10
{
  return [(MTLCompiler *)self getFunctionKeyWithRenderPipelineDescriptor:a3 options:a4 unfilteredOptions:a5 airScript:a6 function:a7 functionType:a8 compiledNextStageVariant:a9 keySize:a10 functionDriverData:0 functionDriverSize:0];
}

- (id)newLinkedFunctionsBitcodeFromRequest:(id)a3 hashKey:(void *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(a3, "visibleFunctions"), "count")
    || objc_msgSend((id)objc_msgSend(a3, "privateVisibleFunctions"), "count"))
  {
    objc_msgSend((id)objc_msgSend(a3, "visibleFunctions"), "count");
    objc_msgSend((id)objc_msgSend(a3, "privateVisibleFunctions"), "count");
    memset(v26, 0, sizeof(v26));
    int v27 = 1065353216;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v5 = (void *)[a3 visibleFunctions];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v5);
          }
          long long v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v10 = [v9 bitcodeDataInternal];
          uint64_t v28 = (unint64_t *)[v9 bitCodeHash];
          std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::tuple<>>((uint64_t)v26, v28, (uint64_t)&std::piecewise_construct, (_OWORD **)&v28)[6] = v10;
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v6);
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    int v11 = (void *)[a3 privateVisibleFunctions];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v11);
          }
          unint64_t v15 = *(void **)(*((void *)&v18 + 1) + 8 * j);
          uint64_t v16 = [v15 bitcodeDataInternal];
          uint64_t v28 = (unint64_t *)[v15 bitCodeHash];
          std::__hash_table<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::__unordered_map_equal<MTLUINT256_t,std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>,UnorderedContainerHash,UnorderedContainerHash,true>,std::allocator<std::__hash_value_type<MTLUINT256_t,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<MTLUINT256_t,std::piecewise_construct_t const&,std::tuple<MTLUINT256_t const&>,std::tuple<>>((uint64_t)v26, v28, (uint64_t)&std::piecewise_construct, (_OWORD **)&v28)[6] = v16;
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v29 count:16];
      }
      while (v12);
    }
    operator new[]();
  }
  return 0;
}

- (id)createErrorMessageWithRequest:(id)a3 key:(id)a4 cacheType:(const char *)a5 itemLookedFor:(const char *)a6
{
  uint64_t v10 = (void *)[a3 function];
  int v11 = [a3 airScript];
  uint64_t v12 = NSString;
  uint64_t v13 = [v10 name];
  if (a6) {
    uint64_t v14 = [v12 stringWithFormat:@"Unable to find %s for function \"%@\"", a6, v13];
  }
  else {
    uint64_t v14 = [v12 stringWithFormat:@"Unable to find function \"%@\"", v13, v26];
  }
  unint64_t v15 = (void *)v14;
  if (v11)
  {
    size_t size_ptr = 0;
    buffer_ptr = 0;
    uint64_t v16 = dispatch_data_create_map(v11, (const void **)&buffer_ptr, &size_ptr);
    signed __int8 v17 = (unsigned int *)buffer_ptr;
    if (!strncmp((const char *)buffer_ptr + 4, "AIRP", 4uLL))
    {
      long long v18 = (int *)((char *)v17 + *v17);
      long long v19 = objc_msgSend(v15, "stringByAppendingFormat:", @" (");
      long long v20 = (unsigned __int16 *)((char *)v18 - *v18);
      if (*v20 >= 9u && (uint64_t v21 = v20[4]) != 0 && (v22 = *((unsigned char *)v18 + v21) - 1, v22 <= 3u)) {
        long long v23 = (__CFString *)*((void *)&off_1E5221740 + (char)v22);
      }
      else {
        long long v23 = @"unknown pipeline type");
      }
      unint64_t v15 = (void *)[v19 stringByAppendingFormat:v23];
    }
    dispatch_release(v16);
  }
  if (a6) {
    long long v24 = @" in (legacy) %s.\n Expected ";
  }
  else {
    long long v24 = @" in %s. \n Expected ";
  }
  return (id)[(id)objc_msgSend(v15 stringByAppendingFormat:v24, a5), "stringByAppendingFormat:", @"%@", objc_msgSend(a4, "description")];
}

- (void)compileStatelessFunctionRequest:(id)a3 reflectionOnly:(BOOL)a4 completionHandler:(id)a5
{
  int v35 = a4;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (([a3 pipelineOptions] & 4) != 0) {
    unsigned int v6 = ~([a3 pipelineOptions] >> 28) & 2;
  }
  else {
    unsigned int v6 = 0;
  }
  MultiLevelCacheFactory::createBinaryCache([a3 binaryArchives], objc_msgSend(a3, "destinationBinaryArchive"), objc_msgSend(a3, "pipelineCache"), (uint64_t)self->_shaderCache.__ptr_, ((unint64_t)objc_msgSend(a3, "pipelineOptions") >> 32) & 4 | v6, &v44);
  uint64_t v7 = (char *)operator new(0x40uLL);
  *((void *)v7 + 1) = 0;
  *((void *)v7 + 2) = 0;
  *(void *)uint64_t v7 = &unk_1ECAC7690;
  *(_OWORD *)(v7 + 24) = 0u;
  uint64_t v8 = (uint64_t)(v7 + 24);
  *(_OWORD *)(v7 + 40) = 0u;
  *((_DWORD *)v7 + 14) = 1065353216;
  long long v9 = (char *)operator new(0x40uLL);
  *((void *)v9 + 1) = 0;
  *((void *)v9 + 2) = 0;
  *(void *)long long v9 = &unk_1ECAC7658;
  *(_OWORD *)(v9 + 24) = 0u;
  uint64_t v33 = (uint64_t)(v9 + 24);
  *(_OWORD *)(v9 + 40) = 0u;
  *((_DWORD *)v9 + 14) = 1065353216;
  unint64_t v42 = 0;
  uint64_t v43 = 0;
  unint64_t v34 = (void *)[a3 function];
  int v10 = MTLGetCompilerOptions((void *)[v34 device], objc_msgSend(a3, "pipelineOptions"), self->_compilerFlags, 2uLL, v35);
  FunctionHashFactory::FunctionHashFactory(&v40, v34, [v34 functionData], v10, objc_msgSend(a3, "gpuCompilerSPIOptions"), objc_msgSend(a3, "visibleFunctions"), objc_msgSend(a3, "privateVisibleFunctions"));
  uint64_t Hash = FunctionHashFactory::createHash((uint64_t)&v40, 2, 0, 0, 0, 0);
  uint64_t v12 = FunctionHashFactory::createHash((uint64_t)&v40, 0, (dispatch_data_t)[a3 driverKeyData], objc_msgSend(a3, "frameworkData"));
  LOBYTE(v54) = 2;
  *(void *)&long long v46 = &v54;
  std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)(v9 + 24), (char *)&v54, (uint64_t)&std::piecewise_construct, (unsigned char **)&v46)[3] = Hash;
  LOBYTE(v54) = 0;
  *(void *)&long long v46 = &v54;
  std::__hash_table<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,MTLBinaryKey *>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)(v9 + 24), (char *)&v54, (uint64_t)&std::piecewise_construct, (unsigned char **)&v46)[3] = v12;
  int v13 = objc_msgSend((id)objc_msgSend(a3, "destinationBinaryArchive"), "supportsAIRNT");
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_object_t object = _MTLCreateFuncionScriptFromFunctionType((MTLFunctionType)objc_msgSend((id)objc_msgSend(a3, "function"), "functionType"));
  uint64_t v14 = dispatch_data_create_map(object, (const void **)&buffer_ptr, &size_ptr);
  long long v54 = 0u;
  long long v55 = 0u;
  if (![(_MTLDevice *)self->_device supportsFamily:1001])
  {
    [(MTLCompiler *)self initializeFunctionRequestScriptAndFunctionId:a3 script:buffer_ptr driverCompilerOptions:0 compiledNextStageVariant:0];
    if (a3)
    {
      [a3 vendorPluginFunctionId];
    }
    else
    {
      long long v46 = 0u;
      long long v47 = 0u;
    }
    long long v54 = v46;
    long long v55 = v47;
  }
  uint64_t v15 = [a3 function];
  [(MTLCompiler *)self getFunctionId:v15 airScript:buffer_ptr vendorPluginFunctionId:&v54];
  dispatch_release(v14);
  if ([a3 pipelineOptions])
  {
    if (([a3 pipelineOptions] & 0x200008000) != 0) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = 5;
    }
  }
  else
  {
    uint64_t v16 = 1;
  }
  uint64_t v32 = [[MTLBinaryKey alloc] initWithHash:&v53];
  int v17 = v13 & (v35 ^ 1);
  if (v17)
  {
    if (((uint64_t (*)(std::__shared_weak_count *, MTLBinaryKey *, uint64_t *, NSObject **, uint64_t))v44->__vftable[4].~__shared_weak_count)(v44, v32, &v43, &v42, 6))
    {
      int v17 = 0;
LABEL_19:
      int v18 = 1;
      goto LABEL_32;
    }
    uint64_t v16 = 6;
  }
  if (((uint64_t (*)(std::__shared_weak_count *, MTLBinaryKey *, uint64_t *, NSObject **, uint64_t))v44->__vftable[2].__on_zero_shared)(v44, v32, &v43, &v42, v16))goto LABEL_19; {
  on_zero_shared_weak = (uint64_t (*)(void))v44->__vftable[2].__on_zero_shared_weak;
  }
  if (!v17)
  {
    int v18 = on_zero_shared_weak();
    int v17 = 0;
    LOBYTE(v35) = (v35 & 1) != 0;
    goto LABEL_32;
  }
  if (!on_zero_shared_weak()) {
    goto LABEL_28;
  }
  if ((~MTLGetReflectionFlags(v42) & 6) != 0)
  {
    if (((unsigned int (*)(std::__shared_weak_count *))v44->__vftable[1].~__shared_weak_count)(v44))
    {
      *(void *)&long long v46 = 1;
      *((void *)&v46 + 1) = @"Fail on cache miss was set and failed to find aint-compatible reflection";
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      (*((void (**)(id, long long *))a5 + 2))(a5, &v46);
      if (object) {
        dispatch_release(object);
      }
    }
LABEL_28:
    int v20 = 0;
    goto LABEL_29;
  }
  int v20 = 1;
LABEL_29:
  int v18 = v20 & ((uint64_t (*)(std::__shared_weak_count *, void *, uint64_t *))v44->__vftable[2].__on_zero_shared_weak)(v44, v12, &v43);
  char v21 = v18 ^ 1;
  if (!v43) {
    char v21 = 0;
  }
  LOBYTE(v35) = v21 | v35;
  int v17 = 1;
LABEL_32:
  unsigned __int8 v22 = v42;
  LOBYTE(v37) = 2;
  *(void *)&long long v46 = &v37;
  std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v8, (char *)&v37, (uint64_t)&std::piecewise_construct, (unsigned char **)&v46)[3] = v22;
  uint64_t v23 = v43;
  LOBYTE(v37) = 0;
  *(void *)&long long v46 = &v37;
  std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v8, (char *)&v37, (uint64_t)&std::piecewise_construct, (unsigned char **)&v46)[3] = v23;
  if (v18)
  {
    if (v17)
    {
      long long v24 = [MTLBinaryEntry alloc];
      long long v25 = [(MTLBinaryEntry *)v24 initWithData:v43 reflectionBlock:v42];
      [(MTLBinaryEntry *)v25 setAirScript:object];
      uint64_t v26 = _MTLNSDataToDispatchData((void *)[v34 bitcodeData], 0);
      [(MTLBinaryEntry *)v25 setBitcode:v26];
      if (v26) {
        dispatch_release(v26);
      }
      ((void (*)(std::__shared_weak_count *, MTLBinaryKey *, MTLBinaryEntry *, void, uint64_t))v44->__vftable[3].~__shared_weak_count_0)(v44, v32, v25, 0, [v34 functionType]);
    }
    FunctionReplyParameters::FunctionReplyParameters(&v46, 0, 0, v8, v33);
    (*((void (**)(id, long long *))a5 + 2))(a5, &v46);
    [(MTLCompiler *)self releaseCompilerOutputBlocks:v8 hashMap:v33];
  }
  else if ((((uint64_t (*)(std::__shared_weak_count *))v44->__vftable[2].~__shared_weak_count_0)(v44) & 1) != 0 {
         || ((unsigned int (*)(std::__shared_weak_count *))v44->__on_zero_shared_weak)(v44))
  }
  {
    int v27 = ((uint64_t (*)(std::__shared_weak_count *))v44->__vftable[2].~__shared_weak_count_0)(v44);
    uint64_t v28 = "FS cache";
    if (v27) {
      uint64_t v28 = "binary archives";
    }
    uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to find compiled function in %s.", v28);
    *(void *)&long long v46 = 1;
    *((void *)&v46 + 1) = v29;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    (*((void (**)(id, long long *))a5 + 2))(a5, &v46);
    [(MTLCompiler *)self releaseCompilerOutputBlocks:v8 hashMap:v33];
  }
  else
  {
    if ((v35 & 1) != 0
      || ([a3 functionOptions] & 1) != 0
      || ([a3 pipelineOptions] & 0x20000000) != 0)
    {
      operator new();
    }
    *(void *)&long long v46 = 4;
    *((void *)&v46 + 1) = @"Empty request.";
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    (*((void (**)(id, long long *))a5 + 2))(a5, &v46);
    [(MTLCompiler *)self releaseCompilerOutputBlocks:v8 hashMap:v33];
  }
  if (object) {
    dispatch_release(object);
  }
  MTLHashKey::~MTLHashKey(&v53);

  std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v9);
  std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v7);
  if (v45) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v45);
  }
}

uint64_t __80__MTLCompiler_compileStatelessFunctionRequest_reflectionOnly_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "destinationBinaryArchive"), "remoteInsertionEnd");
  if (!*a2)
  {
    memset(v22, 0, sizeof(v22));
    int v23 = 1065353216;
    uint64_t v4 = a2[5];
    if (!v4)
    {
      uint64_t v5 = *(void *)(a1 + 80);
      char v21 = 2;
      long long v24 = &v21;
      uint64_t v4 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v5, &v21, (uint64_t)&std::piecewise_construct, &v24)[3];
    }
    char v20 = 2;
    long long v24 = &v20;
    std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)v22, &v20, (uint64_t)&std::piecewise_construct, &v24)[3] = v4;
    uint64_t v6 = a2[3];
    if (!v6)
    {
      uint64_t v7 = *(void *)(a1 + 80);
      char v21 = 0;
      long long v24 = &v21;
      uint64_t v6 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v7, &v21, (uint64_t)&std::piecewise_construct, &v24)[3];
    }
    char v20 = 0;
    long long v24 = &v20;
    std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)v22, &v20, (uint64_t)&std::piecewise_construct, &v24)[3] = v6;
    if (!*(unsigned char *)(a1 + 128)) {
      goto LABEL_11;
    }
    uint64_t v8 = [[MTLBinaryEntry alloc] initWithData:a2[3] reflectionBlock:a2[5]];
    long long v9 = v8;
    if (*(unsigned char *)(a1 + 129))
    {
      (*(void (**)(void, void, MTLBinaryEntry *))(**(void **)(a1 + 96) + 144))(*(void *)(a1 + 96), *(void *)(a1 + 56), v8);
    }
    else
    {
      [(MTLBinaryEntry *)v8 setAirScript:*(void *)(a1 + 40)];

      int v10 = _MTLNSDataToDispatchData((void *)[*(id *)(a1 + 48) bitcodeData], 0);
      [(MTLBinaryEntry *)v9 setBitcode:v10];
      dispatch_release(v10);
      (*(void (**)(void, void, MTLBinaryEntry *, void, uint64_t))(**(void **)(a1 + 96) + 128))(*(void *)(a1 + 96), *(void *)(a1 + 56), v9, 0, [*(id *)(a1 + 48) functionType]);
    }

    if (!*(unsigned char *)(a1 + 128))
    {
LABEL_11:
      int v11 = *(void **)(a1 + 64);
      uint64_t v12 = *(void *)(a1 + 80);
      uint64_t v13 = *(void *)(a1 + 112);
      uint64_t v14 = [*(id *)(a1 + 48) libraryData];
      uint64_t v15 = *(std::__shared_weak_count **)(a1 + 104);
      uint64_t v18 = *(void *)(a1 + 96);
      long long v19 = v15;
      if (v15) {
        atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      [v11 cacheLegacyCompilerData:v22 cachedData:v12 hashMap:v13 libraryData:v14 functionCache:&v18];
      if (v19) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v19);
      }
    }
    std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)v22);
  }
  uint64_t v16 = *(NSObject **)(a1 + 40);
  if (v16) {
    dispatch_release(v16);
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  return [*(id *)(a1 + 64) releaseHashMaps:*(void *)(a1 + 112)];
}

- (void)compileLibraryRequest:(MTLCompileLibraryRequestData *)a3 completionHandler:(id)a4
{
  id var1 = a3->var1;
  uint64_t v7 = objc_msgSend((id)objc_msgSend(var1, "device"), "pluginData");
  if (v7)
  {
    size_t v8 = MTLSerializePluginDataDictionary(objc_msgSend((id)objc_msgSend(var1, "device"), "pluginData"), 0)
       + 44;
    uint64_t v9 = 44;
  }
  else
  {
    uint64_t v9 = 0;
    size_t v8 = 44;
  }
  int v10 = (char *)malloc_type_calloc(v8, 1uLL, 0xB7F9ADE3uLL);
  uint64_t v11 = [var1 cacheEntry];
  long long v12 = *(_OWORD *)(v11 + 28);
  *(_OWORD *)(v10 + 8) = *(_OWORD *)(v11 + 12);
  *(_OWORD *)(v10 + 24) = v12;
  *(_DWORD *)int v10 = v9;
  if (v7) {
    MTLSerializePluginDataDictionary(objc_msgSend((id)objc_msgSend(var1, "device"), "pluginData"), &v10[v9]);
  }
  if ([var1 shaderValidationEnabled]) {
    v10[40] = 1;
  }
  a3->var3 = dispatch_data_create(v10, v8, 0, (dispatch_block_t)*MEMORY[0x1E4F143F0]);
  unint64_t Options = MTLPipelineOptionsFromDynamicLibraryLoadOptions(a3->var2);
  if ([var1 shaderValidationEnabled]) {
    Options |= 0x1000000uLL;
  }
  MTLGetCompilerOptions((void *)[var1 device], Options, self->_compilerFlags, 2uLL, 0);
  operator new();
}

- (id)downgradeFunctionRequest:(const MTLCompilerFunctionRequest *)a3 targetLLVMVersion:(unsigned int)a4 frameworkData:(void *)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a3->var17) {
    unsigned int var6 = 0;
  }
  else {
    unsigned int var6 = a3->var6;
  }
  id var4 = a3->var4;
  dispatch_object_t object = 0;
  downgradeRequestHashAndData(v42, &object, (MTLCompilerFunctionRequest *)a3, a4);
  uint64_t v13 = _MTLGetLibrariesCache(self->_device);
  MultiLevelCacheFactory::createAirCache(0, 0, 0, *(void *)(v13 + 32), 0, &v26);
  uint64_t v14 = [var4 device];
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x3052000000;
  int v23 = __Block_byref_object_copy__10;
  long long v24 = __Block_byref_object_dispose__10;
  uint64_t v25 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3321888768;
  uint64_t v31 = __78__MTLCompiler_downgradeFunctionRequest_targetLLVMVersion_frameworkData_error___block_invoke;
  uint64_t v32 = &unk_1ECAC4A10;
  uint64_t v15 = v26;
  uint64_t v33 = v14;
  uint64_t v35 = v26;
  uint64_t v36 = v27;
  if (v27) {
    atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  long long v40 = v42[0];
  long long v41 = v42[1];
  uint64_t v37 = a6;
  uint64_t v38 = a5;
  unsigned int v39 = var6;
  unint64_t v34 = &v20;
  dispatch_object_t v19 = 0;
  __n128 v16 = MTLHashKey::MTLHashKey((uint64_t)&v29, (uint64_t)v42);
  (*(void (**)(uint64_t, MTLHashKey *, dispatch_object_t *, __n128))(*(void *)v15 + 96))(v15, &v29, &v19, v16);
  MTLHashKey::~MTLHashKey(&v29);
  if (v19)
  {
    dispatch_release(object);
    v31((uint64_t)v30, 0, v19, 0);
    dispatch_release(v19);
  }
  else
  {
    downgradeRequest((uint64_t)a3, v8, (uint64_t)object, (uint64_t)v30);
  }
  int v17 = (void *)v21[5];
  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }
  _Block_object_dispose(&v20, 8);
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
  return v17;
}

void __78__MTLCompiler_downgradeFunctionRequest_targetLLVMVersion_frameworkData_error___block_invoke(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (*(void *)(a1 + 64))
    {
      if (a4)
      {
        uint64_t v6 = (__CFString *)[NSString stringWithUTF8String:a4];
        if (!v6) {
          uint64_t v6 = (__CFString *)[NSString stringWithCString:a4 encoding:1];
        }
      }
      else
      {
        uint64_t v6 = @"empty error message";
      }
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v6 forKey:*MEMORY[0x1E4F28568]];
      **(void **)(a1 + 64) = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLLibraryErrorDomain" code:3 userInfo:v13];
    }
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v10 = *(_MTLDevice **)(a1 + 32);
    uint64_t v11 = *(std::__shared_weak_count **)(a1 + 56);
    v16[0] = *(void *)(a1 + 48);
    v16[1] = v11;
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    MTLHashKey::MTLHashKey((uint64_t)&v17, a1 + 84);
    int v12 = processCompiledLibrary(a3, v10, 7, v16, (uint64_t)&v17, 1, 0, v8, v9, 0, *(uint64_t **)(a1 + 64), *(void *)(a1 + 72), *(_DWORD *)(a1 + 80));
    MTLHashKey::~MTLHashKey(&v17);
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
    if (v12)
    {
      if ((*(unsigned char *)(a1 + 80) & 2) != 0)
      {
        uint64_t v14 = *(void *)(a1 + 72);
        if (v14)
        {
          char v15 = 2;
          v17.var0.var0 = (unint64_t)&v15;
          std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>(v14, &v15, (uint64_t)&std::piecewise_construct, &v17);
        }
      }
      else if ([v8 count] == 1)
      {
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (id)objc_msgSend(v8, "objectForKey:", objc_msgSend((id)objc_msgSend(v8, "allKeys"), "objectAtIndexedSubscript:", 0));
      }
    }
  }
}

- (void)statelessBackendCompileRequestInternal:(MTLCompilerFunctionRequest *)a3 sync:(BOOL)a4 compilerHash:(id *)a5 reflectionOnly:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v10 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  a3->id var1 = 10;
  a3->var18 = [(_MTLDevice *)self->_device llvmVersion];
  id v26 = 0;
  if (a6)
  {
    BOOL v13 = !a3->var17;
    BOOL v14 = !a3->var17;
    long long v23 = 0u;
    long long v24 = 0u;
    if (v13) {
      char v15 = &v23;
    }
    else {
      char v15 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
    char v15 = 0;
    long long v23 = 0u;
    long long v24 = 0u;
  }
  int v25 = 1065353216;
  if ([(MTLCompiler *)self downgradeRequest:a3 frameworkData:v15 error:&v26])
  {
    if (v14)
    {
      LOBYTE(v27) = 2;
      __n128 v16 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::find<CompilerOutputType>(&v23, (char *)&v27);
      uint64_t v34 = 0;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v27 = 0u;
      *((void *)&v29 + 1) = v16[3];
      (*((void (**)(id, long long *))a7 + 2))(a7, &v27);
    }
    else
    {
      if (_MTLCompilePerformanceStatisticsEnabled()) {
        a3->var6 |= 0x200u;
      }
      *(void *)&long long v27 = 0;
      *((void *)&v27 + 1) = &v27;
      *(void *)&long long v28 = 0x5012000000;
      *((void *)&v28 + 1) = __Block_byref_object_copy__1316;
      *(void *)&long long v29 = __Block_byref_object_dispose__1317;
      *((void *)&v29 + 1) = &unk_1828FE28A;
      long long v18 = *(_OWORD *)&a5->var0[16];
      long long v30 = *(_OWORD *)a5->var0;
      long long v31 = v18;
      compilerConnectionManager = self->_compilerConnectionManager;
      uint64_t compilerId = self->_compilerId;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      _OWORD v21[2] = __105__MTLCompiler_statelessBackendCompileRequestInternal_sync_compilerHash_reflectionOnly_completionHandler___block_invoke;
      v21[3] = &unk_1E52212B0;
      BOOL v22 = a6;
      v21[6] = &v27;
      v21[7] = a3;
      v21[4] = self;
      v21[5] = a7;
      (*((void (**)(MTLCompilerConnectionManager *, uint64_t, MTLCompilerFunctionRequest *, BOOL, void *))compilerConnectionManager->var0
       + 3))(compilerConnectionManager, compilerId, a3, v10, v21);
      _Block_object_dispose(&v27, 8);
    }
  }
  else
  {
    uint64_t v17 = [NSString stringWithFormat:@"Downgrade failed with error: %@", objc_msgSend(v26, "localizedDescription")];
    *(void *)&long long v27 = 2;
    *((void *)&v27 + 1) = v17;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    (*((void (**)(id, long long *))a7 + 2))(a7, &v27);
  }
  std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&v23);
}

uint64_t __105__MTLCompiler_statelessBackendCompileRequestInternal_sync_compilerHash_reflectionOnly_completionHandler___block_invoke(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  dispatch_object_t v39 = a3;
  if (a4) {
    uint64_t v7 = [NSString stringWithUTF8String:a4];
  }
  else {
    uint64_t v7 = 0;
  }
  long long v38 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  uint64_t v30 = a2;
  uint64_t v31 = v7;
  uint64_t v32 = *(void *)(*(void *)(a1 + 48) + 8) + 48;
  long long v27 = 0u;
  long long v28 = 0u;
  int v29 = 1065353216;
  if (a2)
  {
    uint64_t v8 = 0;
    id v9 = 0;
  }
  else if (*(unsigned char *)(a1 + 64))
  {
    LOBYTE(v22[0]) = 2;
    std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*&>((uint64_t)&v27, (char *)v22, v22, &v39);
    dispatch_retain(v39);
    uint64_t v8 = 0;
    id v9 = 0;
    *(void *)&long long v34 = v39;
  }
  else
  {
    size_t size_ptr = 0;
    buffer_ptr = 0;
    BOOL v10 = dispatch_data_create_map(a3, (const void **)&buffer_ptr, &size_ptr);
    uint64_t v24 = 0;
    memset(v22, 0, sizeof(v22));
    int v23 = 1065353216;
    deserializeCompilerOutputData(buffer_ptr, size_ptr, &v24, v22, (uint64_t)&v27);
    char v21 = 0;
    long long v40 = &v21;
    *(void *)&long long v33 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)&v27, &v21, (uint64_t)&std::piecewise_construct, &v40)[3];
    char v21 = 3;
    long long v40 = &v21;
    *(void *)&long long v36 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)&v27, &v21, (uint64_t)&std::piecewise_construct, &v40)[3];
    char v21 = 6;
    long long v40 = &v21;
    *(void *)&long long v38 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)&v27, &v21, (uint64_t)&std::piecewise_construct, &v40)[3];
    char v21 = 4;
    long long v40 = &v21;
    uint64_t v8 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)&v27, &v21, (uint64_t)&std::piecewise_construct, &v40)[3];
    *((void *)&v36 + 1) = v8;
    char v21 = 4;
    long long v40 = &v21;
    id v9 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)&v27, &v21, (uint64_t)&std::piecewise_construct, &v40)[3];
    *(void *)&long long v37 = v9;
    char v21 = 2;
    long long v40 = &v21;
    *(void *)&long long v34 = std::__hash_table<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::__unordered_map_hasher<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::hash<CompilerOutputType>,std::equal_to<CompilerOutputType>,true>,std::__unordered_map_equal<CompilerOutputType,std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>,std::equal_to<CompilerOutputType>,std::hash<CompilerOutputType>,true>,std::allocator<std::__hash_value_type<CompilerOutputType,NSObject  {objcproto16OS_dispatch_data}*>>>::__emplace_unique_key_args<CompilerOutputType,std::piecewise_construct_t const&,std::tuple<CompilerOutputType&&>,std::tuple<>>((uint64_t)&v27, &v21, (uint64_t)&std::piecewise_construct, &v40)[3];
    dispatch_release(v10);
    std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)v22);
  }
  if ((*(unsigned char *)(*(void *)(a1 + 56) + 49) & 2) != 0)
  {
    uint64_t v11 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionary];
    int v12 = v11;
    if (v9) {
      _MTLAddCompilerServiceCompileTimeStats(v11, v9);
    }
    if (v8) {
      [*(id *)(*(void *)(a1 + 32) + 8) deserializeCompileTimeStats:v8 addToDictionary:v12];
    }
    uint64_t v13 = *(void *)(a1 + 56);
    BOOL v14 = *(void **)(v13 + 32);
    if (v14)
    {
      uint64_t v15 = [v14 name];
      [(NSDictionary *)v12 setObject:v15 forKey:MTLBinaryFunctionPerformanceKeyFunctionName];
      _MTLAddCompileBinaryFunctionPerformanceStatistics(v12);
    }
    else
    {
      __n128 v16 = *(void **)(v13 + 40);
      if (v16)
      {
        uint64_t v17 = [v16 installName];
        [(NSDictionary *)v12 setObject:v17 forKey:MTLDynamicLibraryPerformanceKeyInstallName];
        _MTLAddCompileDynamicLibraryPerformanceStatistics(v12);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  for (uint64_t i = (void *)v28; i; uint64_t i = (void *)*i)
  {
    dispatch_object_t v19 = i[3];
    if (v19) {
      dispatch_release(v19);
    }
  }
  return std::__hash_table<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,MTLStructTypeInternal *>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,MTLStructTypeInternal *>>>::~__hash_table((uint64_t)&v27);
}

- (void)compileFunction:(id)a3 serializedPipelineData:(id)a4 stateData:(id)a5 linkDataSize:(unint64_t)a6 frameworkLinking:(BOOL)a7 options:(unsigned int)a8 sync:(BOOL)a9 completionHandler:(id)a10
{
  LOBYTE(v10) = a9;
  [(MTLCompiler *)self compileFunction:a3 serializedPipelineData:a4 stateData:a5 linkDataSize:a6 frameworkLinking:a7 options:*(void *)&a8 pipelineCache:0 sync:v10 completionHandler:a10];
}

- (void)compileFunction:(id)a3 serializedPipelineData:(id)a4 stateData:(id)a5 linkDataSize:(unint64_t)a6 frameworkLinking:(BOOL)a7 options:(unsigned int)a8 pipelineCache:(id)a9 sync:(BOOL)a10 completionHandler:(id)a11
{
  BOOL v18 = a7;
  uint64_t v17 = objc_opt_new();
  [v17 setSync:a10];
  [v17 setFunction:a3];
  [v17 setPipelineOptions:a8];
  [v17 setFrameworkData:a4];
  [v17 setDriverKeyData:a5];
  [v17 setPipelineCache:a9];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __139__MTLCompiler_compileFunction_serializedPipelineData_stateData_linkDataSize_frameworkLinking_options_pipelineCache_sync_completionHandler___block_invoke;
  v19[3] = &unk_1E52212D8;
  v19[4] = a11;
  [(MTLCompiler *)self compileFunctionRequestInternal:v17 frameworkLinking:v18 linkDataSize:a6 reflectionOnly:0 completionHandler:v19];
}

uint64_t __139__MTLCompiler_compileFunction_serializedPipelineData_stateData_linkDataSize_frameworkLinking_options_pipelineCache_sync_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *a2);
}

- (void)compileFunction:(id)a3 frameworkData:(id)a4 driverKeyData:(id)a5 options:(unint64_t)a6 pipelineCache:(id)a7 completionHandler:(id)a8
{
  id v15 = (id)objc_opt_new();
  [v15 setSync:0];
  [v15 setFunction:a3];
  [v15 setPipelineOptions:a6];
  [v15 setFrameworkData:a4];
  [v15 setDriverKeyData:a5];
  [v15 setPipelineCache:a7];
  [(MTLCompiler *)self compileFunctionRequestInternal:v15 frameworkLinking:0 linkDataSize:0 reflectionOnly:0 completionHandler:a8];
}

- (void)compileFunction:(id)a3 frameworkData:(id)a4 driverKeyData:(id)a5 options:(unint64_t)a6 pipelineCache:(id)a7 sync:(BOOL)a8 completionHandler:(id)a9
{
  BOOL v9 = a8;
  id v16 = (id)objc_opt_new();
  [v16 setSync:v9];
  [v16 setFunction:a3];
  [v16 setPipelineOptions:a6];
  [v16 setFrameworkData:a4];
  [v16 setDriverKeyData:a5];
  [v16 setPipelineCache:a7];
  [(MTLCompiler *)self compileFunctionRequestInternal:v16 frameworkLinking:0 linkDataSize:0 reflectionOnly:0 completionHandler:a9];
}

- (void)compileFunction:(id)a3 visibleFunctions:(id)a4 privateVisibleFunctions:(id)a5 visibleFunctionGroups:(id)a6 frameworkData:(id)a7 driverKeyData:(id)a8 options:(unint64_t)a9 pipelineCache:(id)a10 sync:(BOOL)a11 completionHandler:(id)a12
{
  id v19 = (id)objc_opt_new();
  [v19 setSync:a11];
  [v19 setFunction:a3];
  [v19 setPipelineOptions:a9];
  [v19 setFrameworkData:a7];
  [v19 setDriverKeyData:a8];
  [v19 setPipelineCache:a10];
  [v19 setVisibleFunctions:a4];
  [v19 setVisibleFunctionGroups:a6];
  [v19 setPrivateVisibleFunctions:a5];
  [(MTLCompiler *)self compileFunctionRequestInternal:v19 frameworkLinking:0 linkDataSize:0 reflectionOnly:0 completionHandler:a12];
}

- (void)compileFunction:(id)a3 visibleFunctions:(id)a4 visibleFunctionGroups:(id)a5 frameworkData:(id)a6 driverKeyData:(id)a7 options:(unint64_t)a8 pipelineCache:(id)a9 sync:(BOOL)a10 completionHandler:(id)a11
{
  LOBYTE(v11) = a10;
  [(MTLCompiler *)self compileFunction:a3 visibleFunctions:a4 privateVisibleFunctions:0 visibleFunctionGroups:a5 frameworkData:a6 driverKeyData:a7 options:a8 pipelineCache:a9 sync:v11 completionHandler:a11];
}

- (void)compileDynamicLibraryWithDescriptor:(id)a3 computePipelineDescriptor:(id)a4 completionHandler:(id)a5
{
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Compiling dynamic libraries is not supported!" forKey:*MEMORY[0x1E4F28568]];
  id v7 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLDynamicLibraryDomain" code:2 userInfo:v6];
  (*((void (**)(id, void, id))a5 + 2))(a5, 0, v7);
}

- (id)compileDynamicLibraryWithDescriptor:(id)a3 computePipelineDescriptor:(id)a4 error:(id *)a5
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3052000000;
  BOOL v18 = __Block_byref_object_copy__10;
  id v19 = __Block_byref_object_dispose__10;
  uint64_t v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  int v12 = __Block_byref_object_copy__10;
  uint64_t v13 = __Block_byref_object_dispose__10;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__MTLCompiler_compileDynamicLibraryWithDescriptor_computePipelineDescriptor_error___block_invoke;
  v8[3] = &unk_1E5221300;
  v8[4] = &v15;
  v8[5] = &v9;
  [(MTLCompiler *)self compileDynamicLibraryWithDescriptor:a3 computePipelineDescriptor:a4 completionHandler:v8];
  if (a5) {
    *a5 = (id)v10[5];
  }
  uint64_t v6 = (void *)v16[5];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);
  return v6;
}

id __83__MTLCompiler_compileDynamicLibraryWithDescriptor_computePipelineDescriptor_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    dispatch_retain(*(dispatch_object_t *)(a2 + 24));
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = *(void *)(a2 + 24);
  }
  id result = a3;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)addComputePipelineStateWithDescriptor:(id)a3 destinationBinaryArchive:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v9 = 0;
  [(MTLCompiler *)self newComputePipelineStateWithDescriptorInternal:a3 options:a5 | 3 pipelineCache:0 destinationBinaryArchive:a4 reflection:0 error:&v9 completionHandler:0];
  id v7 = v9;
  if (a6) {
    *a6 = v9;
  }
  return v7 == 0;
}

- (BOOL)addRenderPipelineStateWithDescriptor:(id)a3 destinationBinaryArchive:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v9 = 0;
  [(MTLCompiler *)self newRenderPipelineStateWithDescriptorInternal:a3 options:a5 | 3 reflection:0 destinationBinaryArchive:a4 error:&v9 completionHandler:0];
  id v7 = v9;
  if (a6) {
    *a6 = v9;
  }
  return v7 == 0;
}

- (BOOL)addTileRenderPipelineStateWithDescriptor:(id)a3 destinationBinaryArchive:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v9 = 0;
  [(MTLCompiler *)self newRenderPipelineStateWithTileDescriptorInternal:a3 options:a5 | 3 reflection:0 destinationBinaryArchive:a4 error:&v9 completionHandler:0];
  id v7 = v9;
  if (a6) {
    *a6 = v9;
  }
  return v7 == 0;
}

- (BOOL)addMeshRenderPipelineStateWithDescriptor:(id)a3 destinationBinaryArchive:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", @"Compiling mesh pipelines for binary archives is not supported!", *MEMORY[0x1E4F28568], a5);
  if (a6) {
    *a6 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLBinaryArchiveDomain" code:3 userInfo:v7];
  }
  return 0;
}

- (void)compileFunction:(id)a3 serializedData:(id)a4 stateData:(id)a5 options:(unint64_t)a6 completionHandler:(id)a7
{
  uint64_t v13 = (void *)[a3 device];
  unint64_t compilerFlags = self->_compilerFlags;
  unint64_t v15 = [a3 functionType] - 1;
  if (v15 > 7) {
    unint64_t v16 = -1;
  }
  else {
    unint64_t v16 = qword_1828F14D0[v15];
  }
  LOBYTE(v17) = 0;
  [(MTLCompiler *)self compileFunction:a3 serializedPipelineData:a4 stateData:a5 linkDataSize:0 frameworkLinking:0 options:MTLGetCompilerOptions(v13, a6, compilerFlags, v16, 0) sync:v17 completionHandler:a7];
}

- (void)reflectionWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
}

uint64_t __100__MTLCompiler_reflectionWithFunction_options_sync_pipelineLibrary_binaryArchives_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (RequiredFunctionKeys)requiredKeysForFunction:(SEL)a3 variantKey:(id)a4 frameworkData:(const VariantKey *)a5 compilerOptions:(id)a6 driverCompilerOptions:(int)a7 airScript:(id)a8 archives:(const void *)a9 compiledNextStageVariant:(id)a10
{
  id result = (RequiredFunctionKeys *)a10;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&retstr->var1[4] = 0u;
  *(_OWORD *)&retstr->var1[6] = 0u;
  *(_OWORD *)retstr->id var1 = 0u;
  *(_OWORD *)&retstr->var1[2] = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  *(_OWORD *)&retstr->var0[6] = 0u;
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[2] = 0u;
  if (a10)
  {
    uint64_t v16 = *(void *)&a7;
    id result = (RequiredFunctionKeys *)[a10 count];
    if (result)
    {
      if (a9)
      {
        memset(v25, 0, sizeof(v25));
        [(MTLCompiler *)self initializeVendorPluginFunctionId:a4 airScript:a9 driverCompilerOptions:a8 compiledNextStageVariant:a11 vendorPlugin:v25];
        if (self) {
          [(MTLCompiler *)self getFunctionId:a4 airScript:a9 vendorPluginFunctionId:v25];
        }
        else {
          memset(&buffer, 0, sizeof(buffer));
        }
        retstr->var1[0] = [[MTLBinaryKey alloc] initWithHash:&buffer];
        MTLHashKey::~MTLHashKey(&buffer);
      }
      memset(&buffer, 0, 36);
      memset(&buffer.var1.var0[16], 0, 40);
      size_t var2 = a5->var2;
      size_t var3 = a5->var3;
      size_t var6 = a5->var6;
      buffer.var0.var0 = (unint64_t)malloc_type_malloc(var6 + var3 + var2, 0xBCECD5BEuLL);
      memcpy((void *)buffer.var0.var0, a5->var0, var2);
      memcpy((void *)(buffer.var0.var0 + var2), a5->var1, var3);
      memcpy((void *)(buffer.var0.var0 + var2 + var3), a5->var5, var6);
      buffer.var0.id var1 = var2;
      *(void *)&buffer.var0.size_t var2 = var3;
      *(void *)buffer.var1.var0 = var6 + var3;
      *(void *)&buffer.var1.var0[16] = dispatch_group_create();
      dispatch_group_enter(*(dispatch_group_t *)&buffer.var1.var0[16]);
      int v23 = dispatch_data_create((const void *)buffer.var0.var0, *(void *)&buffer.var0.var2 + buffer.var0.var1, 0, 0);
      [(MTLCompiler *)self addFunctionKeys:retstr function:a4 driverData:v23 frameworkData:a6 compilerOptions:v16];
      dispatch_release(v23);
      os_unfair_lock_lock((os_unfair_lock_t)&buffer.var1.var0[8]);
      if (!buffer.var2.var0)
      {
        buffer.var2.var0 = 0;

        buffer.var2.id var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)[0 copy];
      }
      dispatch_group_leave(*(dispatch_group_t *)&buffer.var1.var0[16]);
      os_unfair_lock_unlock((os_unfair_lock_t)&buffer.var1.var0[8]);
      VariantEntry::~VariantEntry((VariantEntry *)&buffer);
    }
  }
  return result;
}

- (void)getProgramObjectForFunction:(id)a3 variantKey:(const VariantKey *)a4 requiredKeys:(const RequiredFunctionKeys *)a5 sourceBinaryArchives:(id)a6
{
  id v6 = a6;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v10 = [a6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v10) {
    return 0;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v26;
  id var1 = a5->var1;
  uint64_t v23 = *(void *)v26;
  uint64_t v24 = v6;
  do
  {
    uint64_t v14 = 0;
    while (2)
    {
      if (*(void *)v26 != v12) {
        objc_enumerationMutation(v6);
      }
      unint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * v14);
      id v16 = a3;
      uint64_t v17 = (id *)objc_msgSend(v15, "findProgramObjectForFunction:", objc_msgSend(a3, "bitCodeHash"));
      uint64_t v18 = 0;
      if ([v15 supportsAIRNT]) {
        id v19 = (const RequiredFunctionKeys *)var1;
      }
      else {
        id v19 = a5;
      }
      while (1)
      {
        id v20 = v19->var0[v18];
        if (!v20) {
          goto LABEL_21;
        }
        if (!v17) {
          goto LABEL_20;
        }
        if ((_BYTE)v18) {
          break;
        }
        if (!VariantList<4u>::find<VariantKey>((uint64_t)v17, (uint64_t)a4)) {
          goto LABEL_20;
        }
LABEL_21:
        if (++v18 == 8)
        {
          if (!v17) {
            return objc_msgSend(v15, "programObjectForFunction:", objc_msgSend(v16, "bitCodeHash"));
          }
          return v17;
        }
      }
      if (v18 == 6)
      {
        char v21 = VariantList<4u>::find<VariantKey>((uint64_t)v17, (uint64_t)a4);
        if (v21 && v21[9]) {
          goto LABEL_21;
        }
      }
      else if (v18 == 2 && [v17[54] objectForKey:&stru_1ECAC84A8])
      {
        goto LABEL_21;
      }
LABEL_20:
      if ([v15 getBinaryDataForKey:v20 reflectionType:1]) {
        goto LABEL_21;
      }
      ++v14;
      a3 = v16;
      uint64_t v12 = v23;
      id v6 = v24;
      id var1 = a5->var1;
      if (v14 != v11) {
        continue;
      }
      break;
    }
    uint64_t v11 = [v24 countByEnumeratingWithState:&v25 objects:v29 count:16];
    uint64_t v17 = 0;
  }
  while (v11);
  return v17;
}

- (void)getProgramObject:(id)a3 destinationArchive:(id)a4 sourceBinaryArchives:(id)a5 variantKey:(const VariantKey *)a6 requiredKeys:(const RequiredFunctionKeys *)a7 failOnMiss:(BOOL)a8
{
  if (a4)
  {
    uint64_t v10 = objc_msgSend(a3, "bitCodeHash", a3, a4, a5, a6, a7, a8);
    return (void *)[a4 programObjectForFunction:v10];
  }
  else
  {
    if (a5)
    {
      id result = [(MTLCompiler *)self getProgramObjectForFunction:a3 variantKey:a6 requiredKeys:a7 sourceBinaryArchives:a5];
      if (result) {
        return result;
      }
    }
    else
    {
      id result = 0;
    }
    if (!a8)
    {
      return (void *)[a3 programObject];
    }
  }
  return result;
}

- (id)createMeshStageAndLinkPipelineWithFragment:(void *)a3 fragmentVariant:(id)a4 objectFunction:(id)a5 serializedObjectDescriptor:(id)a6 meshFunction:(id)a7 serializedMeshDescriptor:(id)a8 descriptor:(id)a9 airDescriptor:(id)a10 destinationArchive:(id)a11 options:(unint64_t)a12 reflection:(id *)a13 compileStatistics:(id)a14 fragmentCompileTimeData:(id)a15 pipelineArchiverId:(id)a16 error:(id *)a17 completionHandler:(id)a18
{
  unint64_t v25 = a12;
  long long v26 = a10;
  uint64_t v48 = 0;
  long long v49 = &v48;
  uint64_t v50 = 0x3052000000;
  long long v51 = __Block_byref_object_copy__10;
  long long v52 = __Block_byref_object_dispose__10;
  uint64_t v53 = 0;
  long long v46 = 0;
  size_t size_ptr = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3052000000;
  v43[3] = __Block_byref_object_copy__10;
  v43[4] = __Block_byref_object_dispose__10;
  uint64_t v44 = 0;
  if (a10) {
    long long v26 = dispatch_data_create_map((dispatch_data_t)a10, &v46, &size_ptr);
  }
  uint64_t v44 = v26;
  int v32 = MTLGetCompilerOptions(self->_device, a12, self->_compilerFlags, 0, 0);
  if (a6) {
    dispatch_retain((dispatch_object_t)a6);
  }
  if (a8) {
    dispatch_retain((dispatch_object_t)a8);
  }
  long long v27 = a17;
  id v28 = a11;
  unsigned int v29 = (a12 >> 2) & 1;
  if (a15)
  {
    dispatch_retain((dispatch_object_t)a15);
    id v28 = a11;
    unint64_t v25 = a12;
    long long v27 = a17;
    LOBYTE(v29) = (a12 & 4) != 0;
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  _OWORD v42[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke;
  v42[3] = &unk_1E5221328;
  v42[4] = a6;
  v42[5] = a8;
  v42[6] = a15;
  v42[7] = v43;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_2;
  v41[3] = &unk_1E5221350;
  v41[4] = v28;
  v41[5] = a4;
  v41[6] = self;
  v41[7] = a9;
  v41[12] = a3;
  v41[13] = v25;
  v41[8] = a14;
  v41[9] = a15;
  v41[10] = a18;
  v41[11] = &v48;
  v41[14] = a13;
  v41[15] = v27;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_3;
  v37[3] = &unk_1E5221440;
  v37[4] = self;
  v37[5] = a9;
  v37[6] = a6;
  v37[7] = a5;
  int v38 = a12 & 0x11240000;
  int v39 = v32;
  char v40 = v29;
  v37[10] = v42;
  v37[11] = a18;
  v37[14] = v25;
  v37[15] = v27;
  v37[8] = v28;
  v37[9] = a14;
  v37[12] = v41;
  v37[13] = v45;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_9;
  v33[3] = &unk_1E5221490;
  v33[4] = self;
  v33[5] = a9;
  v33[16] = v45;
  v33[17] = v25;
  v33[6] = a4;
  v33[7] = a8;
  int v34 = a12 & 0x11240000;
  int v35 = v32;
  v33[8] = a7;
  v33[9] = v28;
  char v36 = v29;
  v33[12] = v42;
  v33[13] = a18;
  v33[18] = v27;
  v33[10] = a14;
  v33[11] = a5;
  v33[14] = v37;
  v33[15] = v41;
  __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_9((uint64_t)v33);
  uint64_t v30 = (void *)v49[5];
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);
  _Block_object_dispose(&v48, 8);
  return v30;
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[5];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = a1[6];
  if (v4) {
    dispatch_release(v4);
  }
  uint64_t v5 = *(NSObject **)(*(void *)(a1[7] + 8) + 40);
  if (v5)
  {
    dispatch_release(v5);
  }
}

void *__302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_2(void *result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10)
{
  if (!*((void *)result + 4))
  {
    uint64_t v10 = result;
    id result = newRenderPipeline(*((void *)result + 12), *((void **)result + 5), a2, a3, a8, a9, a10, a5, a6, a7, *(void **)(*((void *)result + 6) + 8), 0, *((void **)v10 + 7), *((void *)v10 + 13), *(void *)(*((void *)result + 6) + 48), *((MTLRenderPipelineReflectionInternal ***)v10 + 14), *((NSMutableDictionary **)v10 + 8), *((void *)v10 + 9), a4,
               *((void *)v10 + 10),
               *((void **)v10 + 15));
    *(void *)(*(void *)(*((void *)v10 + 11) + 8) + 40) = result;
  }
  return result;
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, NSObject *a4)
{
  uint64_t v66 = 0;
  uint64_t v67 = &v66;
  uint64_t v68 = 0x2020000000;
  uint64_t v69 = 0;
  uint64_t v62 = 0;
  uint64_t v63 = &v62;
  uint64_t v64 = 0x2020000000;
  uint64_t v65 = 0;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3052000000;
  v61[3] = __Block_byref_object_copy__10;
  v61[4] = __Block_byref_object_dispose__10;
  v61[5] = 0;
  uint64_t v57 = 0;
  uint64_t v58 = &v57;
  uint64_t v59 = 0x2020000000;
  char v60 = 0;
  uint64_t v53 = 0;
  long long v54 = &v53;
  uint64_t v55 = 0x2020000000;
  char v56 = 0;
  unint64_t v52 = 0;
  long long v51 = 0;
  uint64_t v50 = 0;
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "getFunctionKeyWithRenderPipelineDescriptor:options:unfilteredOptions:airScript:function:functionType:compiledNextStageVariant:keySize:functionDriverData:functionDriverSize:", *(void *)(a1 + 40), *(unsigned int *)(a1 + 128), *(void *)(a1 + 112), *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24), objc_msgSend(*(id *)(a1 + 40), "objectFunction"), 8, a3, &v52, &v51, &v50);
  uint64_t v49 = 0;
  uint64_t v9 = [a3 inputInfoAndSize:&v49];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(NSObject **)(v10 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_4;
  block[3] = &unk_1E5221378;
  block[12] = v52;
  void block[13] = v9;
  block[4] = *(void *)(a1 + 48);
  block[5] = v10;
  int v47 = *(_DWORD *)(a1 + 132);
  uint64_t v13 = *(void *)(a1 + 64);
  block[6] = *(void *)(a1 + 56);
  block[7] = v11;
  block[14] = v49;
  block[15] = 0;
  block[11] = v8;
  block[9] = v13;
  block[10] = &v62;
  block[8] = a3;
  char v48 = *(unsigned char *)(a1 + 136);
  dispatch_sync(v12, block);
  uint64_t v14 = v63[3];
  if (v14)
  {
    unint64_t v15 = *(NSObject **)(v14 + 440);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_5;
    v44[3] = &unk_1E52213A0;
    v44[12] = v52;
    v44[13] = v9;
    v44[8] = &v62;
    v44[9] = &v57;
    uint64_t v16 = *(void *)(a1 + 112);
    v44[14] = v49;
    v44[15] = v16;
    uint64_t v17 = *(void *)(a1 + 72);
    uint64_t v18 = *(void *)(a1 + 40);
    v44[4] = *(void *)(a1 + 48);
    v44[5] = v17;
    v44[6] = v18;
    v44[7] = &v66;
    v44[10] = &v53;
    v44[11] = v8;
    int v45 = *(_DWORD *)(a1 + 132);
    dispatch_sync(v15, v44);
    if (*((unsigned char *)v58 + 24))
    {
      id v19 = VariantEntry::newSerializedKeyWithAdditionalData((VariantEntry *)v67[3], v51, v52);
      uint64_t v20 = v49;
      if ((*(unsigned char *)(a1 + 133) & 2) != 0) {
        uint64_t v21 = mach_absolute_time();
      }
      else {
        uint64_t v21 = 0;
      }
      long long v26 = (MTLCompileFunctionRequestData *)objc_opt_new();
      [(MTLCompileFunctionRequestData *)v26 setSync:*(void *)(a1 + 88) == 0];
      [(MTLCompileFunctionRequestData *)v26 setFunction:*(void *)(a1 + 56)];
      [(MTLCompileFunctionRequestData *)v26 setPipelineOptions:*(void *)(a1 + 112)];
      [(MTLCompileFunctionRequestData *)v26 setFrameworkData:*(void *)(a1 + 48)];
      [(MTLCompileFunctionRequestData *)v26 setDriverKeyData:v19];
      [(MTLCompileFunctionRequestData *)v26 setDestinationBinaryArchive:*(void *)(a1 + 64)];
      -[MTLCompileFunctionRequestData setBinaryArchives:](v26, "setBinaryArchives:", [*(id *)(a1 + 40) binaryArchives]);
      -[MTLCompileFunctionRequestData setGpuCompilerSPIOptions:](v26, "setGpuCompilerSPIOptions:", [*(id *)(a1 + 40) gpuCompilerSPIOptions]);
      -[MTLCompileFunctionRequestData setMaxAccelerationStructureTraversalDepth:](v26, "setMaxAccelerationStructureTraversalDepth:", [*(id *)(a1 + 40) maxAccelerationStructureTraversalDepth]);
      [(MTLCompileFunctionRequestData *)v26 setAirScript:0];
      setLinkedFunctionsForRequest(v26, (MTLLinkedFunctions *)[*(id *)(a1 + 40) objectLinkedFunctions]);
      objc_msgSend(*(id *)(a1 + 32), "initializeFunctionRequestScriptAndFunctionId:script:driverCompilerOptions:compiledNextStageVariant:", v26, 0, objc_msgSend(*(id *)(a1 + 40), "driverCompilerOptions"), a3);
      long long v27 = *(void **)(a1 + 32);
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      _OWORD v42[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_6;
      v42[3] = &unk_1E52213C8;
      int v43 = *(_DWORD *)(a1 + 132);
      uint64_t v28 = *(void *)(a1 + 72);
      v42[4] = v27;
      v42[5] = v28;
      v42[6] = *(void *)(a1 + 40);
      v42[7] = &v62;
      void v42[8] = v61;
      v42[9] = &v66;
      v42[10] = v21;
      [v27 compileFunctionRequestInternal:v26 frameworkLinking:1 linkDataSize:v20 reflectionOnly:0 completionHandler:v42];

      dispatch_release(v19);
    }
    else if (*((unsigned char *)v54 + 24))
    {
      dispatch_group_enter(*(dispatch_group_t *)(v67[3] + 40));
      BOOL v22 = *(void **)(a1 + 32);
      uint64_t v23 = *(void *)(a1 + 40);
      uint64_t v24 = *(void *)(a1 + 56);
      uint64_t v25 = *(void *)(a1 + 112);
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_7;
      v41[3] = &unk_1E52213F0;
      v41[4] = v23;
      v41[5] = &v62;
      v41[6] = &v66;
      [v22 reflectionWithFunction:v24 options:v25 completionHandler:v41];
    }
    [*(id *)(*(void *)(a1 + 32) + 8) freeObjectFunctionDriverData:v51 objectFunctionDriverDataSize:v50];
    [*(id *)(*(void *)(a1 + 32) + 8) freeObjectFunctionKey:v8 objectKeySize:v52];
    if (a4) {
      dispatch_retain(a4);
    }
    uint64_t v29 = v67[3];
    uint64_t v30 = *(void *)(a1 + 88);
    uint64_t v31 = [*(id *)(*(void *)(a1 + 32) + 8) serialQueue];
    v33[0] = (void (*)(dispatch_block_t))MEMORY[0x1E4F143A8];
    v33[1] = (void (*)(dispatch_block_t))3221225472;
    v33[2] = (void (*)(dispatch_block_t))__302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_8;
    v33[3] = (void (*)(dispatch_block_t))&unk_1E5221418;
    long long v34 = *(_OWORD *)(a1 + 80);
    uint64_t v32 = *(void *)(a1 + 120);
    uint64_t v35 = *(void *)(a1 + 96);
    char v36 = &v66;
    long long v37 = &v62;
    int v38 = v61;
    uint64_t v39 = v32;
    uint64_t v40 = a2;
    v33[4] = (void (*)(dispatch_block_t))a3;
    v33[5] = (void (*)(dispatch_block_t))a4;
    VariantEntry::waitOrNotify(v29, v30 != 0, v31, v33);
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 8) freeObjectFunctionDriverData:v51 objectFunctionDriverDataSize:v50];
    [*(id *)(*(void *)(a1 + 32) + 8) freeObjectFunctionKey:v8 objectKeySize:v52];
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    reportErrorMessage((id)1, @"MTLPipelineOptionFailOnBinaryArchiveMiss was set and failed to find compiled pipeline functions in binary archive.", *(void *)(a1 + 88), *(void **)(a1 + 120));
  }
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(v61, 8);
  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v66, 8);
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  uint64_t v3 = *(void *)(a1 + 96);
  uint64_t v4 = *(void *)(a1 + 104);
  uint64_t v5 = *(void *)(a1 + 112);
  id v6 = *(NSObject **)(a1 + 32);
  v15[0] = v2;
  v15[1] = v4;
  _OWORD v15[2] = v3;
  v15[3] = v5;
  if (v6)
  {
    id v6 = dispatch_data_create_map(v6, &v17, &v18);
    uint64_t v7 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v17 = 0;
    size_t v18 = 0;
  }
  dispatch_object_t v16 = v6;
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(unsigned int *)(a1 + 128);
  uint64_t v11 = [*(id *)(a1 + 56) driverCompilerOptions];
  uint64_t v12 = *(void *)(a1 + 120);
  uint64_t v13 = [*(id *)(a1 + 56) binaryArchives];
  if (v8) {
    [v8 requiredKeysForFunction:v9 variantKey:v15 frameworkData:v7 compilerOptions:v10 driverCompilerOptions:v11 airScript:v12 archives:v13 compiledNextStageVariant:*(void *)(a1 + 64)];
  }
  else {
    memset(&v14, 0, sizeof(v14));
  }
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "getProgramObject:destinationArchive:sourceBinaryArchives:variantKey:requiredKeys:failOnMiss:", *(void *)(a1 + 48), *(void *)(a1 + 72), objc_msgSend(*(id *)(a1 + 56), "binaryArchives"), v15, &v14, *(unsigned __int8 *)(a1 + 132));
  RequiredFunctionKeys::~RequiredFunctionKeys(&v14);
  if (v16) {
    dispatch_release(v16);
  }
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  uint64_t v3 = *(void *)(a1 + 96);
  uint64_t v4 = *(void *)(a1 + 104);
  uint64_t v5 = *(void *)(a1 + 112);
  id v6 = *(NSObject **)(a1 + 32);
  v18[0] = v2;
  v18[1] = v4;
  v18[2] = v3;
  v18[3] = v5;
  if (v6)
  {
    id v6 = dispatch_data_create_map(v6, &v20, &v21);
  }
  else
  {
    uint64_t v20 = 0;
    size_t v21 = 0;
  }
  dispatch_object_t object = v6;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = VariantList<4u>::find<VariantKey>(*(void *)(*(void *)(*(void *)(a1 + 64) + 8)+ 24), (uint64_t)v18);
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = VariantList<4u>::newVariantEntry<VariantKey>(*(void *)(*(void *)(*(void *)(a1 + 64) + 8)+ 24), (uint64_t)v18);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  if ((*(unsigned char *)(a1 + 122) & 0x40) != 0)
  {
    int v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectFunction"), "name");
    uint64_t v10 = MTLPipelinePerformanceKeyObjectShader[0];
    id v11 = (id)[v8 objectForKey:MTLPipelinePerformanceKeyObjectShader[0]];
    if (!v11)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v8 setObject:v11 forKey:v10];
    }
    uint64_t v12 = [NSNumber numberWithBool:v7 == 0];
    [v11 setObject:v12 forKey:MTLCompileTimeStatisticsKeyCachedFunction[0]];
    if (v9) {
      [v11 setObject:v9 forKey:MTLCompileTimeStatisticsKeyFunctionName[0]];
    }
  }
  if (*(unsigned char *)(a1 + 128))
  {
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    uint64_t v15 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "gpuCompilerSPIOptions"), "description");
    if (v15) {
      dispatch_object_t v16 = (__CFString *)v15;
    }
    else {
      dispatch_object_t v16 = &stru_1ECAC84A8;
    }
    BOOL v13 = [*(id *)(v14 + 432) objectForKey:v16] == 0;
  }
  else
  {
    BOOL v13 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v13;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    if (!*(void *)(v17 + 424)) {
      *(void *)(v17 + 424) = dispatch_queue_create("reflection Queue", 0);
    }
  }
  if (object) {
    dispatch_release(object);
  }
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_6(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(a1 + 89) & 2) != 0) {
    unint64_t v4 = (unint64_t)(*(double *)&gMachTimeToNS * (double)(mach_absolute_time() - *(void *)(a1 + 80)));
  }
  else {
    unint64_t v4 = 0;
  }
  if (*(void *)a2)
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) newObjectVariantWithCompilerOutput:*(void *)(a2 + 24) pipelineStatisticsOutput:*(void *)(a2 + 72)];
    uint64_t v5 = v6;
    if ((*(unsigned char *)(a1 + 89) & 0x10) != 0) {
      [v6 setDebugInstrumentationData:*(void *)(a2 + 104)];
    }
  }
  int v7 = *(_DWORD *)(a1 + 88);
  if ((v7 & 0x200) != 0)
  {
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(NSObject **)(a2 + 88);
    uint64_t v10 = MTLPipelinePerformanceKeyObjectShader[0];
    id v11 = (id)[v8 objectForKey:MTLPipelinePerformanceKeyObjectShader[0]];
    if (v11)
    {
      if (v9)
      {
LABEL_11:
        _MTLAddCompilerServiceCompileTimeStats(v11, v9);
        uint64_t v12 = [NSNumber numberWithUnsignedLongLong:v4];
        BOOL v13 = MTLCompileTimeStatisticsKeyMTLCompilerService;
LABEL_14:
        [v11 setObject:v12 forKey:*v13];
        int v7 = *(_DWORD *)(a1 + 88);
        goto LABEL_15;
      }
    }
    else
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v8 setObject:v11 forKey:v10];

      if (v9) {
        goto LABEL_11;
      }
    }
    uint64_t v12 = [NSNumber numberWithBool:1];
    BOOL v13 = MTLCompileTimeStatisticsKeyCachedFunction;
    goto LABEL_14;
  }
LABEL_15:
  if (v7)
  {
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v15 = *(void *)(a2 + 40);
    uint64_t v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "gpuCompilerSPIOptions"), "description");
    if (v15)
    {
      uint64_t v17 = *(NSObject **)(v14 + 424);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
      block[3] = &unk_1E521FDD0;
      block[5] = v15;
      block[6] = v14;
      block[4] = v16;
      dispatch_sync(v17, block);
    }
  }
  uint64_t v18 = *(void *)(a2 + 80);
  if (v18)
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v18;
    dispatch_retain(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  }
  VariantEntry::insertVariant(*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), v5, *(void *)a2, *(void **)(a2 + 8), *(NSObject **)(a2 + 104));
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "gpuCompilerSPIOptions"), "description");
  if (a3)
  {
    uint64_t v10 = *(NSObject **)(v8 + 424);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
    block[3] = &unk_1E521FDD0;
    block[5] = a3;
    block[6] = v8;
    block[4] = v9;
    dispatch_sync(v10, block);
  }
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v11 + 32));
  if (!*(void *)(v11 + 56))
  {
    *(void *)(v11 + 56) = a2;

    *(void *)(v11 + 64) = [a4 copy];
  }
  dispatch_group_leave(*(dispatch_group_t *)(v11 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 32));
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_8(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) + 48))
  {
    (*(void (**)(void, void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), 0);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    reportErrorMessage(*(id *)(v2 + 56), *(__CFString **)(v2 + 64), *(void *)(a1 + 56), *(void **)(a1 + 96));
  }
  uint64_t v3 = *(NSObject **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  if (v3) {
    dispatch_release(v3);
  }
  unint64_t v4 = *(NSObject **)(a1 + 40);
  if (v4)
  {
    dispatch_release(v4);
  }
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_9(uint64_t a1)
{
  uint64_t v69 = 0;
  uint64_t v70 = &v69;
  uint64_t v71 = 0x2020000000;
  uint64_t v72 = 0;
  uint64_t v65 = 0;
  uint64_t v66 = &v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3052000000;
  v64[3] = __Block_byref_object_copy__10;
  v64[4] = __Block_byref_object_dispose__10;
  v64[5] = 0;
  uint64_t v60 = 0;
  id v61 = &v60;
  uint64_t v62 = 0x2020000000;
  char v63 = 0;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000;
  char v59 = 0;
  uint64_t v55 = 0;
  long long v54 = 0;
  unint64_t v53 = 0;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "getFunctionKeyWithRenderPipelineDescriptor:options:unfilteredOptions:airScript:function:functionType:compiledNextStageVariant:keySize:functionDriverData:functionDriverSize:", *(void *)(a1 + 40), *(unsigned int *)(a1 + 152), *(void *)(a1 + 136), *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 24), objc_msgSend(*(id *)(a1 + 40), "meshFunction"), 7, *(void *)(a1 + 48), &v55, &v54, &v53);
  uint64_t v52 = 0;
  uint64_t v3 = [*(id *)(a1 + 48) inputInfoAndSize:&v52];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_10;
  block[3] = &unk_1E5221378;
  uint64_t v46 = v55;
  uint64_t v47 = v3;
  uint64_t v48 = v52;
  uint64_t v6 = *(void *)(a1 + 64);
  block[4] = *(void *)(a1 + 56);
  block[5] = v4;
  block[6] = v6;
  int v50 = *(_DWORD *)(a1 + 156);
  uint64_t v49 = 0;
  long long v42 = *(_OWORD *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v44 = &v65;
  uint64_t v45 = v2;
  uint64_t v43 = v7;
  char v51 = *(unsigned char *)(a1 + 160);
  dispatch_sync(v5, block);
  uint64_t v8 = v66[3];
  if (v8)
  {
    uint64_t v9 = *(NSObject **)(v8 + 440);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_11;
    v39[3] = &unk_1E52213A0;
    v39[12] = v55;
    v39[13] = v3;
    uint64_t v10 = *(void *)(a1 + 56);
    v39[8] = &v65;
    v39[9] = &v60;
    uint64_t v11 = *(void *)(a1 + 136);
    v39[14] = v52;
    v39[15] = v11;
    uint64_t v12 = *(void *)(a1 + 80);
    v39[4] = v10;
    v39[5] = v12;
    v39[6] = *(void *)(a1 + 40);
    v39[7] = &v69;
    v39[10] = &v56;
    v39[11] = v2;
    int v40 = *(_DWORD *)(a1 + 156);
    dispatch_sync(v9, v39);
    if (*((unsigned char *)v61 + 24))
    {
      BOOL v13 = VariantEntry::newSerializedKeyWithAdditionalData((VariantEntry *)v70[3], v54, v53);
      uint64_t v14 = v52;
      if ((*(unsigned char *)(a1 + 157) & 2) != 0) {
        uint64_t v15 = mach_absolute_time();
      }
      else {
        uint64_t v15 = 0;
      }
      uint64_t v20 = (MTLCompileFunctionRequestData *)objc_opt_new();
      [(MTLCompileFunctionRequestData *)v20 setSync:*(void *)(a1 + 104) == 0];
      [(MTLCompileFunctionRequestData *)v20 setFunction:*(void *)(a1 + 64)];
      [(MTLCompileFunctionRequestData *)v20 setPipelineOptions:*(void *)(a1 + 136)];
      [(MTLCompileFunctionRequestData *)v20 setFrameworkData:*(void *)(a1 + 56)];
      [(MTLCompileFunctionRequestData *)v20 setDriverKeyData:v13];
      [(MTLCompileFunctionRequestData *)v20 setDestinationBinaryArchive:*(void *)(a1 + 72)];
      -[MTLCompileFunctionRequestData setBinaryArchives:](v20, "setBinaryArchives:", [*(id *)(a1 + 40) binaryArchives]);
      -[MTLCompileFunctionRequestData setGpuCompilerSPIOptions:](v20, "setGpuCompilerSPIOptions:", [*(id *)(a1 + 40) gpuCompilerSPIOptions]);
      -[MTLCompileFunctionRequestData setMaxAccelerationStructureTraversalDepth:](v20, "setMaxAccelerationStructureTraversalDepth:", [*(id *)(a1 + 40) maxAccelerationStructureTraversalDepth]);
      setLinkedFunctionsForRequest(v20, (MTLLinkedFunctions *)[*(id *)(a1 + 40) meshLinkedFunctions]);
      objc_msgSend(*(id *)(a1 + 32), "initializeFunctionRequestScriptAndFunctionId:script:driverCompilerOptions:compiledNextStageVariant:", v20, 0, objc_msgSend(*(id *)(a1 + 40), "driverCompilerOptions"), *(void *)(a1 + 48));
      size_t v21 = *(void **)(a1 + 32);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_12;
      v37[3] = &unk_1E52213C8;
      int v38 = *(_DWORD *)(a1 + 156);
      uint64_t v22 = *(void *)(a1 + 80);
      v37[4] = v21;
      v37[5] = v22;
      v37[6] = *(void *)(a1 + 40);
      v37[7] = &v65;
      v37[8] = v64;
      v37[9] = &v69;
      v37[10] = v15;
      [v21 compileFunctionRequestInternal:v20 frameworkLinking:1 linkDataSize:v14 reflectionOnly:0 completionHandler:v37];

      dispatch_release(v13);
    }
    else if (*((unsigned char *)v57 + 24))
    {
      dispatch_group_enter(*(dispatch_group_t *)(v70[3] + 40));
      uint64_t v16 = *(void **)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = *(void *)(a1 + 64);
      uint64_t v19 = *(void *)(a1 + 136);
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_13;
      v36[3] = &unk_1E52213F0;
      v36[4] = v17;
      v36[5] = &v65;
      v36[6] = &v69;
      [v16 reflectionWithFunction:v18 options:v19 completionHandler:v36];
    }
    [*(id *)(*(void *)(a1 + 32) + 8) freeMeshFunctionDriverData:v54 meshFunctionDriverDataSize:v53];
    [*(id *)(*(void *)(a1 + 32) + 8) freeMeshFunctionKey:v2 meshKeySize:v55];
    uint64_t v23 = v70[3];
    uint64_t v24 = *(void *)(a1 + 104);
    uint64_t v25 = [*(id *)(*(void *)(a1 + 32) + 8) serialQueue];
    v28[0] = (void (*)(dispatch_block_t))MEMORY[0x1E4F143A8];
    v28[1] = (void (*)(dispatch_block_t))3221225472;
    v28[2] = (void (*)(dispatch_block_t))__302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_14;
    v28[3] = (void (*)(dispatch_block_t))&unk_1E5221468;
    uint64_t v26 = *(void *)(a1 + 144);
    long long v27 = *(_OWORD *)(a1 + 104);
    long long v29 = *(_OWORD *)(a1 + 88);
    long long v30 = v27;
    uint64_t v32 = &v69;
    long long v33 = &v65;
    long long v34 = v64;
    uint64_t v35 = v26;
    uint64_t v31 = *(void *)(a1 + 120);
    VariantEntry::waitOrNotify(v23, v24 != 0, v25, v28);
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 8) freeMeshFunctionDriverData:v54 meshFunctionDriverDataSize:v53];
    [*(id *)(*(void *)(a1 + 32) + 8) freeMeshFunctionKey:v2 meshKeySize:v55];
    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
    reportErrorMessage((id)1, @"MTLPipelineOptionFailOnBinaryArchiveMiss was set and failed to find compiled pipeline functions in binary archive.", *(void *)(a1 + 104), *(void **)(a1 + 144));
  }
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(v64, 8);
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_10(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  uint64_t v3 = *(void *)(a1 + 96);
  uint64_t v4 = *(void *)(a1 + 104);
  uint64_t v5 = *(void *)(a1 + 112);
  uint64_t v6 = *(NSObject **)(a1 + 32);
  v15[0] = v2;
  v15[1] = v4;
  _OWORD v15[2] = v3;
  v15[3] = v5;
  if (v6)
  {
    uint64_t v6 = dispatch_data_create_map(v6, &v17, &v18);
    uint64_t v7 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v17 = 0;
    size_t v18 = 0;
  }
  dispatch_object_t v16 = v6;
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(unsigned int *)(a1 + 128);
  uint64_t v11 = [*(id *)(a1 + 56) driverCompilerOptions];
  uint64_t v12 = *(void *)(a1 + 120);
  uint64_t v13 = [*(id *)(a1 + 56) binaryArchives];
  if (v8) {
    [v8 requiredKeysForFunction:v9 variantKey:v15 frameworkData:v7 compilerOptions:v10 driverCompilerOptions:v11 airScript:v12 archives:v13 compiledNextStageVariant:*(void *)(a1 + 64)];
  }
  else {
    memset(&v14, 0, sizeof(v14));
  }
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "getProgramObject:destinationArchive:sourceBinaryArchives:variantKey:requiredKeys:failOnMiss:", *(void *)(a1 + 48), *(void *)(a1 + 72), objc_msgSend(*(id *)(a1 + 56), "binaryArchives"), v15, &v14, *(unsigned __int8 *)(a1 + 132));
  RequiredFunctionKeys::~RequiredFunctionKeys(&v14);
  if (v16) {
    dispatch_release(v16);
  }
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_11(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  uint64_t v3 = *(void *)(a1 + 96);
  uint64_t v4 = *(void *)(a1 + 104);
  uint64_t v5 = *(void *)(a1 + 112);
  uint64_t v6 = *(NSObject **)(a1 + 32);
  v18[0] = v2;
  v18[1] = v4;
  v18[2] = v3;
  v18[3] = v5;
  if (v6)
  {
    uint64_t v6 = dispatch_data_create_map(v6, &v20, &v21);
  }
  else
  {
    uint64_t v20 = 0;
    size_t v21 = 0;
  }
  dispatch_object_t object = v6;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = VariantList<4u>::find<VariantKey>(*(void *)(*(void *)(*(void *)(a1 + 64) + 8)+ 24), (uint64_t)v18);
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = VariantList<4u>::newVariantEntry<VariantKey>(*(void *)(*(void *)(*(void *)(a1 + 64) + 8)+ 24), (uint64_t)v18);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  if ((*(unsigned char *)(a1 + 122) & 0x40) != 0)
  {
    int v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "meshFunction"), "name");
    uint64_t v10 = MTLPipelinePerformanceKeyMeshShader[0];
    id v11 = (id)[v8 objectForKey:MTLPipelinePerformanceKeyMeshShader[0]];
    if (!v11)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v8 setObject:v11 forKey:v10];
    }
    uint64_t v12 = [NSNumber numberWithBool:v7 == 0];
    [v11 setObject:v12 forKey:MTLCompileTimeStatisticsKeyCachedFunction[0]];
    if (v9) {
      [v11 setObject:v9 forKey:MTLCompileTimeStatisticsKeyFunctionName[0]];
    }
  }
  if (*(unsigned char *)(a1 + 128))
  {
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    uint64_t v15 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "gpuCompilerSPIOptions"), "description");
    if (v15) {
      dispatch_object_t v16 = (__CFString *)v15;
    }
    else {
      dispatch_object_t v16 = &stru_1ECAC84A8;
    }
    BOOL v13 = [*(id *)(v14 + 432) objectForKey:v16] == 0;
  }
  else
  {
    BOOL v13 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v13;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    if (!*(void *)(v17 + 424)) {
      *(void *)(v17 + 424) = dispatch_queue_create("reflection Queue", 0);
    }
  }
  if (object) {
    dispatch_release(object);
  }
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_12(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(a1 + 89) & 2) != 0) {
    unint64_t v4 = (unint64_t)(*(double *)&gMachTimeToNS * (double)(mach_absolute_time() - *(void *)(a1 + 80)));
  }
  else {
    unint64_t v4 = 0;
  }
  if (*(void *)a2)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) newMeshVariantWithCompilerOutput:*(void *)(a2 + 24) pipelineStatisticsOutput:*(void *)(a2 + 72)];
    uint64_t v5 = v6;
    if ((*(unsigned char *)(a1 + 89) & 0x10) != 0) {
      [v6 setDebugInstrumentationData:*(void *)(a2 + 104)];
    }
  }
  int v7 = *(_DWORD *)(a1 + 88);
  if ((v7 & 0x200) != 0)
  {
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(NSObject **)(a2 + 88);
    uint64_t v10 = MTLPipelinePerformanceKeyMeshShader[0];
    id v11 = (id)[v8 objectForKey:MTLPipelinePerformanceKeyMeshShader[0]];
    if (v11)
    {
      if (v9)
      {
LABEL_11:
        _MTLAddCompilerServiceCompileTimeStats(v11, v9);
        uint64_t v12 = [NSNumber numberWithUnsignedLongLong:v4];
        BOOL v13 = MTLCompileTimeStatisticsKeyMTLCompilerService;
LABEL_14:
        [v11 setObject:v12 forKey:*v13];
        int v7 = *(_DWORD *)(a1 + 88);
        goto LABEL_15;
      }
    }
    else
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v8 setObject:v11 forKey:v10];

      if (v9) {
        goto LABEL_11;
      }
    }
    uint64_t v12 = [NSNumber numberWithBool:1];
    BOOL v13 = MTLCompileTimeStatisticsKeyCachedFunction;
    goto LABEL_14;
  }
LABEL_15:
  if (v7)
  {
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v15 = *(void *)(a2 + 40);
    uint64_t v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "gpuCompilerSPIOptions"), "description");
    if (v15)
    {
      uint64_t v17 = *(NSObject **)(v14 + 424);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
      block[3] = &unk_1E521FDD0;
      block[5] = v15;
      block[6] = v14;
      block[4] = v16;
      dispatch_sync(v17, block);
    }
  }
  uint64_t v18 = *(void *)(a2 + 80);
  if (v18)
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v18;
    dispatch_retain(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  }
  VariantEntry::insertVariant(*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), v5, *(void *)a2, *(void **)(a2 + 8), *(NSObject **)(a2 + 104));
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "gpuCompilerSPIOptions"), "description");
  if (a3)
  {
    uint64_t v10 = *(NSObject **)(v8 + 424);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
    block[3] = &unk_1E521FDD0;
    block[5] = a3;
    block[6] = v8;
    block[4] = v9;
    dispatch_sync(v10, block);
  }
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v11 + 32));
  if (!*(void *)(v11 + 56))
  {
    *(void *)(v11 + 56) = a2;

    *(void *)(v11 + 64) = [a4 copy];
  }
  dispatch_group_leave(*(dispatch_group_t *)(v11 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 32));
}

void __302__MTLCompiler_createMeshStageAndLinkPipelineWithFragment_fragmentVariant_objectFunction_serializedObjectDescriptor_meshFunction_serializedMeshDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_14(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) + 48))
  {
    if (*(void *)(a1 + 32))
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), 0);
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    reportErrorMessage(*(id *)(v2 + 56), *(__CFString **)(v2 + 64), *(void *)(a1 + 48), *(void **)(a1 + 96));
  }
  uint64_t v3 = *(NSObject **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  if (v3)
  {
    dispatch_release(v3);
  }
}

- (id)createVertexStageAndLinkPipelineWithFragment:(void *)a3 fragmentVariant:(id)a4 vertexFunction:(id)a5 serializedVertexDescriptor:(id)a6 descriptor:(id)a7 airDescriptor:(id)a8 destinationArchive:(id)a9 options:(unint64_t)a10 reflection:(id *)a11 compileStatistics:(id)a12 fragmentCompileTimeData:(id)a13 pipelineArchiverId:(id)a14 error:(id *)a15 completionHandler:(id)a16
{
  uint64_t v74 = 0;
  uint64_t v75 = &v74;
  uint64_t v76 = 0x3052000000;
  v77 = __Block_byref_object_copy__10;
  v78 = __Block_byref_object_dispose__10;
  uint64_t v79 = 0;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x3052000000;
  v73[3] = __Block_byref_object_copy__10;
  v73[4] = __Block_byref_object_dispose__10;
  v73[5] = 0;
  uint64_t v69 = 0;
  uint64_t v70 = &v69;
  uint64_t v71 = 0x2020000000;
  int v72 = 0;
  int v72 = MTLGetCompilerOptions(self->_device, a10, self->_compilerFlags, 0, 0);
  uint64_t v65 = 0;
  uint64_t v66 = &v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 0;
  uint64_t v61 = 0;
  uint64_t v62 = &v61;
  uint64_t v63 = 0x2020000000;
  char v64 = 0;
  uint64_t v57 = 0;
  uint64_t v58 = &v57;
  uint64_t v59 = 0x2020000000;
  char v60 = 0;
  uint64_t v53 = 0;
  long long v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  buffer_ptr = 0;
  size_t size_ptr = 0;
  uint64_t v39 = dispatch_data_create_map((dispatch_data_t)a8, (const void **)&buffer_ptr, &size_ptr);
  uint64_t v50 = 0;
  uint64_t v49 = 0;
  unint64_t v48 = 0;
  uint64_t v22 = -[MTLCompiler getFunctionKeyWithRenderPipelineDescriptor:options:unfilteredOptions:airScript:function:functionType:compiledNextStageVariant:keySize:functionDriverData:functionDriverSize:](self, "getFunctionKeyWithRenderPipelineDescriptor:options:unfilteredOptions:airScript:function:functionType:compiledNextStageVariant:keySize:functionDriverData:functionDriverSize:", a7, a10 & 0x11240000, a10, buffer_ptr, [a7 vertexFunction], 1, a4, &v50, &v49, &v48);
  uint64_t v47 = 0;
  uint64_t v23 = [a4 inputInfoAndSize:&v47];
  uint64_t v24 = (void (*)(dispatch_block_t))a4;
  uint64_t v25 = v23;
  compilerQueue = self->_compilerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __266__MTLCompiler_createVertexStageAndLinkPipelineWithFragment_fragmentVariant_vertexFunction_serializedVertexDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke;
  block[3] = &unk_1E52214B8;
  block[12] = v22;
  void block[13] = v50;
  block[14] = v25;
  block[15] = v47;
  block[4] = a6;
  block[5] = self;
  block[6] = a5;
  void block[7] = a7;
  void block[16] = buffer_ptr;
  block[10] = &v69;
  block[11] = &v53;
  long long v27 = v24;
  block[8] = v24;
  block[9] = a9;
  BOOL v46 = (a10 & 4) != 0;
  dispatch_sync(compilerQueue, block);
  uint64_t v28 = v54[3];
  if (v28)
  {
    long long v29 = *(NSObject **)(v28 + 440);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __266__MTLCompiler_createVertexStageAndLinkPipelineWithFragment_fragmentVariant_vertexFunction_serializedVertexDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_2;
    v44[3] = &unk_1E52214E0;
    v44[14] = v50;
    v44[15] = v25;
    v44[8] = &v65;
    v44[9] = &v53;
    v44[4] = a6;
    v44[5] = a9;
    void v44[16] = v47;
    v44[17] = a10;
    v44[6] = a12;
    v44[7] = a7;
    v44[10] = &v61;
    v44[11] = &v57;
    v44[12] = &v69;
    v44[13] = v22;
    dispatch_sync(v29, v44);
    if (*((unsigned char *)v62 + 24))
    {
      dispatch_object_t object = VariantEntry::newSerializedKeyWithAdditionalData((VariantEntry *)v66[3], v49, v48);
      uint64_t v37 = v47;
      if ((*((unsigned char *)v70 + 25) & 2) != 0) {
        uint64_t v36 = mach_absolute_time();
      }
      else {
        uint64_t v36 = 0;
      }
      uint64_t v32 = (MTLCompileFunctionRequestData *)objc_opt_new();
      [(MTLCompileFunctionRequestData *)v32 setSync:a16 == 0];
      [(MTLCompileFunctionRequestData *)v32 setFunction:a5];
      [(MTLCompileFunctionRequestData *)v32 setPipelineOptions:a10];
      [(MTLCompileFunctionRequestData *)v32 setFrameworkData:a6];
      [(MTLCompileFunctionRequestData *)v32 setDriverKeyData:object];
      [(MTLCompileFunctionRequestData *)v32 setDestinationBinaryArchive:a9];
      -[MTLCompileFunctionRequestData setBinaryArchives:](v32, "setBinaryArchives:", [a7 binaryArchives]);
      [(MTLCompileFunctionRequestData *)v32 setArchiverId:a14];
      -[MTLCompileFunctionRequestData setGpuCompilerSPIOptions:](v32, "setGpuCompilerSPIOptions:", [a7 gpuCompilerSPIOptions]);
      -[MTLCompileFunctionRequestData setMaxAccelerationStructureTraversalDepth:](v32, "setMaxAccelerationStructureTraversalDepth:", [a7 maxAccelerationStructureTraversalDepth]);
      setLinkedFunctionsForRequest(v32, (MTLLinkedFunctions *)[a7 vertexLinkedFunctions]);
      [(MTLCompileFunctionRequestData *)v32 setAirScript:v39];
      -[MTLCompiler initializeFunctionRequestScriptAndFunctionId:script:driverCompilerOptions:compiledNextStageVariant:](self, "initializeFunctionRequestScriptAndFunctionId:script:driverCompilerOptions:compiledNextStageVariant:", v32, buffer_ptr, [a7 driverCompilerOptions], v27);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __266__MTLCompiler_createVertexStageAndLinkPipelineWithFragment_fragmentVariant_vertexFunction_serializedVertexDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_3;
      v43[3] = &unk_1E5221508;
      v43[4] = self;
      void v43[5] = a12;
      v43[6] = &v69;
      v43[7] = &v53;
      v43[8] = v73;
      v43[9] = &v65;
      v43[10] = v36;
      [(MTLCompiler *)self compileFunctionRequestInternal:v32 frameworkLinking:1 linkDataSize:v37 reflectionOnly:0 completionHandler:v43];

      dispatch_release(object);
      uint64_t v31 = v39;
    }
    else
    {
      uint64_t v31 = v39;
      if (*((unsigned char *)v58 + 24))
      {
        dispatch_group_enter(*(dispatch_group_t *)(v66[3] + 40));
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        _OWORD v42[2] = __266__MTLCompiler_createVertexStageAndLinkPipelineWithFragment_fragmentVariant_vertexFunction_serializedVertexDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_4;
        v42[3] = &unk_1E5221530;
        v42[4] = &v53;
        v42[5] = &v65;
        [(MTLCompiler *)self reflectionWithFunction:a5 options:a10 completionHandler:v42];
      }
    }
    [(_MTLDevice *)self->_device freeVertexFunctionDriverData:v49 vertexFunctionDriverDataSize:v48];
    [(_MTLDevice *)self->_device freeVertexFunctionKey:v22 vertexKeySize:v50];
    dispatch_retain((dispatch_object_t)a6);
    uint64_t v33 = v66[3];
    long long v34 = [(_MTLDevice *)self->_device serialQueue];
    v41[0] = (void (*)(dispatch_block_t))MEMORY[0x1E4F143A8];
    v41[1] = (void (*)(dispatch_block_t))3221225472;
    v41[2] = (void (*)(dispatch_block_t))__266__MTLCompiler_createVertexStageAndLinkPipelineWithFragment_fragmentVariant_vertexFunction_serializedVertexDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_5;
    v41[3] = (void (*)(dispatch_block_t))&unk_1E5221558;
    v41[4] = (void (*)(dispatch_block_t))a9;
    v41[5] = v27;
    v41[12] = (void (*)(dispatch_block_t))&v65;
    v41[13] = (void (*)(dispatch_block_t))&v74;
    v41[6] = (void (*)(dispatch_block_t))self;
    void v41[7] = (void (*)(dispatch_block_t))a6;
    void v41[16] = (void (*)(dispatch_block_t))a15;
    v41[17] = (void (*)(dispatch_block_t))a10;
    v41[8] = (void (*)(dispatch_block_t))a7;
    v41[9] = (void (*)(dispatch_block_t))a12;
    v41[14] = (void (*)(dispatch_block_t))&v53;
    v41[15] = (void (*)(dispatch_block_t))v73;
    v41[18] = (void (*)(dispatch_block_t))a11;
    v41[19] = (void (*)(dispatch_block_t))a3;
    v41[10] = (void (*)(dispatch_block_t))a13;
    v41[11] = (void (*)(dispatch_block_t))a16;
    VariantEntry::waitOrNotify(v33, a16 != 0, (dispatch_queue_t)v34, v41);
    dispatch_release(v31);
    long long v30 = (void *)v75[5];
  }
  else
  {
    [(_MTLDevice *)self->_device freeVertexFunctionDriverData:v49 vertexFunctionDriverDataSize:v48];
    [(_MTLDevice *)self->_device freeVertexFunctionKey:v22 vertexKeySize:v50];
    reportErrorMessage((id)1, @"MTLPipelineOptionFailOnBinaryArchiveMiss was set and failed to find compiled pipeline functions in binary archive.", (uint64_t)a16, a15);
    dispatch_release(v39);
    long long v30 = 0;
  }
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(v73, 8);
  _Block_object_dispose(&v74, 8);
  return v30;
}

void __266__MTLCompiler_createVertexStageAndLinkPipelineWithFragment_fragmentVariant_vertexFunction_serializedVertexDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  uint64_t v3 = *(void *)(a1 + 104);
  uint64_t v4 = *(void *)(a1 + 112);
  uint64_t v5 = *(void *)(a1 + 120);
  uint64_t v6 = *(NSObject **)(a1 + 32);
  v15[0] = v2;
  v15[1] = v4;
  _OWORD v15[2] = v3;
  v15[3] = v5;
  if (v6)
  {
    uint64_t v6 = dispatch_data_create_map(v6, &v17, &v18);
    uint64_t v7 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v17 = 0;
    size_t v18 = 0;
  }
  dispatch_object_t v16 = v6;
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(unsigned int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  uint64_t v11 = [*(id *)(a1 + 56) driverCompilerOptions];
  uint64_t v12 = *(void *)(a1 + 128);
  uint64_t v13 = [*(id *)(a1 + 56) binaryArchives];
  if (v8) {
    [v8 requiredKeysForFunction:v9 variantKey:v15 frameworkData:v7 compilerOptions:v10 driverCompilerOptions:v11 airScript:v12 archives:v13 compiledNextStageVariant:*(void *)(a1 + 64)];
  }
  else {
    memset(&v14, 0, sizeof(v14));
  }
  *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "getProgramObject:destinationArchive:sourceBinaryArchives:variantKey:requiredKeys:failOnMiss:", *(void *)(a1 + 48), *(void *)(a1 + 72), objc_msgSend(*(id *)(a1 + 56), "binaryArchives"), v15, &v14, *(unsigned __int8 *)(a1 + 136));
  RequiredFunctionKeys::~RequiredFunctionKeys(&v14);
  if (v16) {
    dispatch_release(v16);
  }
}

void __266__MTLCompiler_createVertexStageAndLinkPipelineWithFragment_fragmentVariant_vertexFunction_serializedVertexDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 104);
  uint64_t v3 = *(void *)(a1 + 112);
  uint64_t v4 = *(void *)(a1 + 120);
  uint64_t v5 = *(void *)(a1 + 128);
  uint64_t v6 = *(NSObject **)(a1 + 32);
  v15[0] = v2;
  v15[1] = v4;
  _OWORD v15[2] = v3;
  v15[3] = v5;
  if (v6)
  {
    uint64_t v6 = dispatch_data_create_map(v6, &v17, &v18);
  }
  else
  {
    uint64_t v17 = 0;
    size_t v18 = 0;
  }
  dispatch_object_t object = v6;
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = VariantList<4u>::find<VariantKey>(*(void *)(*(void *)(*(void *)(a1 + 72) + 8)+ 24), (uint64_t)v15);
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = VariantList<4u>::newVariantEntry<VariantKey>(*(void *)(*(void *)(*(void *)(a1 + 72) + 8)+ 24), (uint64_t)v15);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  }
  if (*(void *)(a1 + 40)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  }
  if ((*(unsigned char *)(a1 + 138) & 0x40) != 0)
  {
    int v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    uint64_t v8 = *(void **)(a1 + 48);
    uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "vertexFunction"), "name");
    uint64_t v10 = MTLPipelinePerformanceKeyVertexShader[0];
    id v11 = (id)[v8 objectForKey:MTLPipelinePerformanceKeyVertexShader[0]];
    if (!v11)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v8 setObject:v11 forKey:v10];
    }
    uint64_t v12 = [NSNumber numberWithBool:v7 == 0];
    [v11 setObject:v12 forKey:MTLCompileTimeStatisticsKeyCachedFunction[0]];
    if (v9) {
      [v11 setObject:v9 forKey:MTLCompileTimeStatisticsKeyFunctionName[0]];
    }
  }
  BOOL v13 = (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) & 1) != 0
     && [*(id *)(*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) + 432) objectForKey:&stru_1ECAC84A8] == 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v13;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    if (!*(void *)(v14 + 424)) {
      *(void *)(v14 + 424) = dispatch_queue_create("reflection Queue", 0);
    }
  }
  if (object) {
    dispatch_release(object);
  }
}

void __266__MTLCompiler_createVertexStageAndLinkPipelineWithFragment_fragmentVariant_vertexFunction_serializedVertexDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_3(void *a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1[6] + 8) + 25) & 2) != 0) {
    unint64_t v4 = (unint64_t)(*(double *)&gMachTimeToNS * (double)(mach_absolute_time() - a1[10]));
  }
  else {
    unint64_t v4 = 0;
  }
  if (*(void *)a2)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = (void *)[*(id *)(a1[4] + 8) newVertexVariantWithCompilerOutput:*(void *)(a2 + 24) pipelineStatisticsOutput:*(void *)(a2 + 72)];
    uint64_t v5 = v6;
    if ((*(unsigned char *)(*(void *)(a1[6] + 8) + 25) & 0x10) != 0) {
      [v6 setDebugInstrumentationData:*(void *)(a2 + 104)];
    }
  }
  int v7 = *(_DWORD *)(*(void *)(a1[6] + 8) + 24);
  if ((v7 & 0x200) != 0)
  {
    uint64_t v8 = (void *)a1[5];
    uint64_t v9 = *(NSObject **)(a2 + 88);
    uint64_t v10 = MTLPipelinePerformanceKeyVertexShader[0];
    id v11 = (id)[v8 objectForKey:MTLPipelinePerformanceKeyVertexShader[0]];
    if (v11)
    {
      if (v9)
      {
LABEL_11:
        _MTLAddCompilerServiceCompileTimeStats(v11, v9);
        uint64_t v12 = [NSNumber numberWithUnsignedLongLong:v4];
        BOOL v13 = MTLCompileTimeStatisticsKeyMTLCompilerService;
LABEL_14:
        [v11 setObject:v12 forKey:*v13];
        int v7 = *(_DWORD *)(*(void *)(a1[6] + 8) + 24);
        goto LABEL_15;
      }
    }
    else
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v8 setObject:v11 forKey:v10];

      if (v9) {
        goto LABEL_11;
      }
    }
    uint64_t v12 = [NSNumber numberWithBool:1];
    BOOL v13 = MTLCompileTimeStatisticsKeyCachedFunction;
    goto LABEL_14;
  }
LABEL_15:
  if (v7)
  {
    uint64_t v14 = *(void *)(a2 + 40);
    if (v14)
    {
      uint64_t v15 = *(void *)(*(void *)(a1[7] + 8) + 24);
      dispatch_object_t v16 = *(NSObject **)(v15 + 424);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
      block[3] = &unk_1E521FDD0;
      block[5] = v14;
      block[6] = v15;
      block[4] = 0;
      dispatch_sync(v16, block);
    }
  }
  uint64_t v17 = *(void *)(a2 + 80);
  if (v17)
  {
    *(void *)(*(void *)(a1[8] + 8) + 40) = v17;
    dispatch_retain(*(dispatch_object_t *)(*(void *)(a1[8] + 8) + 40));
  }
  VariantEntry::insertVariant(*(void *)(*(void *)(a1[9] + 8) + 24), v5, *(void *)a2, *(void **)(a2 + 8), *(NSObject **)(a2 + 104));
}

void __266__MTLCompiler_createVertexStageAndLinkPipelineWithFragment_fragmentVariant_vertexFunction_serializedVertexDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    uint64_t v8 = *(NSObject **)(v7 + 424);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
    block[3] = &unk_1E521FDD0;
    block[5] = a3;
    block[6] = v7;
    block[4] = 0;
    dispatch_sync(v8, block);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v9 + 32));
  if (!*(void *)(v9 + 56))
  {
    *(void *)(v9 + 56) = a2;

    *(void *)(v9 + 64) = [a4 copy];
  }
  dispatch_group_leave(*(dispatch_group_t *)(v9 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 32));
}

void __266__MTLCompiler_createVertexStageAndLinkPipelineWithFragment_fragmentVariant_vertexFunction_serializedVertexDescriptor_descriptor_airDescriptor_destinationArchive_options_reflection_compileStatistics_fragmentCompileTimeData_pipelineArchiverId_error_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
  uint64_t v3 = *(void **)(v2 + 48);
  if (v3)
  {
    if (!*(void *)(a1 + 32))
    {
      unint64_t v4 = *(void **)(a1 + 40);
      if (v4) {
        uint64_t v5 = newRenderPipeline(*(void *)(a1 + 152), v4, *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24), v3, 0, 0, 0, 0, 0, 0, *(void **)(*(void *)(a1 + 48) + 8), *(NSObject **)(a1 + 56), *(void **)(a1 + 64), *(void *)(a1 + 136), *(void *)(*(void *)(a1 + 48) + 48), *(MTLRenderPipelineReflectionInternal ***)(a1 + 144), *(NSMutableDictionary **)(a1 + 72), *(void *)(a1 + 80), *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40),
      }
               *(void *)(a1 + 88),
               *(void **)(a1 + 128));
      else {
        uint64_t v5 = newRenderPipeline(0, 0, *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24), v3, 0, 0, 0, 0, 0, 0, *(void **)(*(void *)(a1 + 48) + 8), *(NSObject **)(a1 + 56), *(void **)(a1 + 64), *(void *)(a1 + 136), *(void *)(*(void *)(a1 + 48) + 48), *(MTLRenderPipelineReflectionInternal ***)(a1 + 144), *(NSMutableDictionary **)(a1 + 72), 0, *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40),
      }
               *(void *)(a1 + 88),
               *(void **)(a1 + 128));
      *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) = v5;
    }
  }
  else
  {
    reportErrorMessage(*(id *)(v2 + 56), *(__CFString **)(v2 + 64), *(void *)(a1 + 88), *(void **)(a1 + 128));
  }
  uint64_t v6 = *(NSObject **)(*(void *)(*(void *)(a1 + 120) + 8) + 40);
  if (v6) {
    dispatch_release(v6);
  }
  uint64_t v7 = *(NSObject **)(a1 + 80);
  if (v7) {
    dispatch_release(v7);
  }
  uint64_t v8 = *(NSObject **)(a1 + 56);

  dispatch_release(v8);
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6 completionHandler:(id)a7
{
  return [(MTLCompiler *)self newRenderPipelineStateWithDescriptorInternal:a3 options:a4 reflection:a5 destinationBinaryArchive:0 error:a6 completionHandler:a7];
}

- (void)addFunctionKeys:(RequiredFunctionKeys *)a3 function:(id)a4 driverData:(id)a5 frameworkData:(id)a6 compilerOptions:(int)a7
{
  __int16 v7 = a7;
  FunctionHashFactory::FunctionHashFactory(&v15, a4, [a4 functionData], a7 & 0xFFFFBFFF, 0, 0, 0);
  if ((v7 & 2) == 0) {
    a3->var0[0] = FunctionHashFactory::createHash((uint64_t)&v15, 0, (dispatch_data_t)a5, a6);
  }
  if (v7)
  {
    if ((v7 & 0x1000) != 0) {
      uint64_t v12 = a5;
    }
    else {
      uint64_t v12 = 0;
    }
    if ((v7 & 0x1000) != 0) {
      BOOL v13 = a6;
    }
    else {
      BOOL v13 = 0;
    }
    a3->var0[2] = FunctionHashFactory::createHash((uint64_t)&v15, 2, v12, v13);
  }
  if ((v7 & 0x100) != 0) {
    a3->var0[3] = (id)FunctionHashFactory::createHash((uint64_t)&v15, 3, 0, 0, 0, 0);
  }
  if ((v7 & 0x1000) != 0) {
    a3->var0[6] = FunctionHashFactory::createHash((uint64_t)&v15, 6, (dispatch_data_t)a5, a6);
  }
  uint64_t v14 = [a4 functionType];
  if ((v7 & 4) != 0 && v14 == 2) {
    a3->var0[1] = FunctionHashFactory::createHash((uint64_t)&v15, 1, (dispatch_data_t)a5, a6);
  }
}

- (id)newRenderPipelineStateWithDescriptorInternal:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 destinationBinaryArchive:(id)a6 error:(id *)a7 completionHandler:(id)a8
{
  if ((a4 & 0x400000) != 0)
  {
    if (initTimebaseInfo(void)::onceToken == -1)
    {
      if (a8) {
        goto LABEL_4;
      }
LABEL_114:
      uint64_t v15 = mach_absolute_time();
      if (!a7) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
    dispatch_once(&initTimebaseInfo(void)::onceToken, &__block_literal_global_1340);
    if (!a8) {
      goto LABEL_114;
    }
  }
LABEL_4:
  uint64_t v15 = 0;
  if (a7) {
LABEL_5:
  }
    *a7 = 0;
LABEL_6:
  if (!self->_device)
  {
    MTLReportFailure(0, "-[MTLCompiler newRenderPipelineStateWithDescriptorInternal:options:reflection:destinationBinaryArchive:error:completionHandler:]", 17728, @"device cannot be null.", (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, v52);
    if (!self->_device) {
      return 0;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a3) {
      goto LABEL_9;
    }
  }
  else
  {
    MTLReportFailure(1uLL, "-[MTLCompiler newRenderPipelineStateWithDescriptorInternal:options:reflection:destinationBinaryArchive:error:completionHandler:]", 17731, @"device is not a MTLDevice.", v16, v17, v18, v19, v52);
    if (a3) {
      goto LABEL_9;
    }
  }
  MTLReportFailure(0, "-[MTLCompiler newRenderPipelineStateWithDescriptorInternal:options:reflection:destinationBinaryArchive:error:completionHandler:]", 17741, @"descriptor cannot be null.", v16, v17, v18, v19, v52);
LABEL_9:
  v110 = 0;
  if ([a3 validateWithDevice:self->_device error:&v110])
  {
    uint64_t v20 = [a3 fragmentFunction];
    uint64_t v63 = (void *)[a3 vertexFunction];
    size_t v21 = [a3 newPipelineScript];
    char v64 = (void (*)(dispatch_block_t))[a3 objectFunction];
    char v60 = (void (*)(dispatch_block_t))[a3 meshFunction];
    uint64_t v61 = a5;
    if (v60)
    {
      uint64_t v22 = (void (*)(dispatch_block_t))a6;
      v77[0] = 0;
      uint64_t v68 = [a3 newSerializedMeshDataWithFlags:self->_compilerFlags options:a4 error:v77];
      if (v68 && v64)
      {
        uint64_t v66 = [a3 newSerializedObjectDataWithFlags:self->_compilerFlags options:a4 error:v77];
        if (!v66) {
          goto LABEL_30;
        }
      }
      else
      {
        if (!v68)
        {
LABEL_30:
          if (a8)
          {
            (*((void (**)(id, void, void, void))a8 + 2))(a8, 0, 0, v77[0]);
            uint64_t v28 = v68;
          }
          else
          {
            uint64_t v28 = v68;
            if (a7) {
              *a7 = (id)v77[0];
            }
          }
          if (v21) {
            dispatch_release(v21);
          }
          if (!v28) {
            return 0;
          }
          unint64_t v48 = v28;
          goto LABEL_106;
        }
        uint64_t v66 = 0;
      }
      uint64_t v65 = 0;
      if (a8) {
        goto LABEL_24;
      }
      goto LABEL_25;
    }
    v77[0] = 0;
    uint64_t v65 = [a3 newSerializedVertexDataWithFlags:self->_compilerFlags options:a4 error:v77];
    if (v65)
    {
      if (v63)
      {
        uint64_t v22 = (void (*)(dispatch_block_t))a6;
        uint64_t v66 = 0;
        uint64_t v68 = 0;
        if (a8) {
LABEL_24:
        }
          a3 = (id)[a3 copy];
LABEL_25:
        if ((a4 & 0x400000) != 0) {
          uint64_t v67 = (void (*)(dispatch_block_t))objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        else {
          uint64_t v67 = 0;
        }
        uint64_t v106 = 0;
        v107 = &v106;
        uint64_t v108 = 0x2020000000;
        uint64_t v109 = 0;
        size_t size_ptr = 0;
        buffer_ptr = 0;
        if (v21) {
          uint64_t v62 = dispatch_data_create_map(v21, (const void **)&buffer_ptr, &size_ptr);
        }
        else {
          uint64_t v62 = 0;
        }
        uint64_t v98 = 0;
        int v99 = &v98;
        uint64_t v100 = 0x3052000000;
        v101 = __Block_byref_object_copy__10;
        unsigned int v102 = __Block_byref_object_dispose__10;
        uint64_t v103 = 0;
        char v29 = [a3 isRasterizationEnabled];
        if (v20) {
          char v30 = v29;
        }
        else {
          char v30 = 0;
        }
        if (v30)
        {
          uint64_t v94 = 0;
          v95 = &v94;
          uint64_t v96 = 0x2020000000;
          char v97 = 0;
          uint64_t v90 = 0;
          v91 = &v90;
          uint64_t v92 = 0x2020000000;
          uint64_t v93 = 0;
          if ([v63 renderTargetArrayIndexType]) {
            BOOL v31 = 1;
          }
          else {
            BOOL v31 = (a4 & 0x200000) == 0;
          }
          if (v31) {
            uint64_t v32 = (void (*)(dispatch_block_t))a4;
          }
          else {
            uint64_t v32 = (void (*)(dispatch_block_t))(a4 | 0x4000000);
          }
          uint64_t v86 = 0;
          uint64_t v87 = &v86;
          uint64_t v88 = 0x2020000000;
          int v89 = 0;
          int v89 = MTLGetCompilerOptions(self->_device, (unint64_t)v32, self->_compilerFlags, 0, 0);
          data = [a3 newSerializedFragmentDataWithFlags:self->_compilerFlags options:v32];
          uint64_t v85 = 0;
          uint64_t v33 = -[MTLCompiler getFunctionKeyWithRenderPipelineDescriptor:options:unfilteredOptions:airScript:function:functionType:compiledNextStageVariant:keySize:](self, "getFunctionKeyWithRenderPipelineDescriptor:options:unfilteredOptions:airScript:function:functionType:compiledNextStageVariant:keySize:", a3, a4 & 0x11240000, v32, buffer_ptr, [a3 fragmentFunction], 2, 0, &v85);
          uint64_t v58 = v21;
          uint64_t v81 = 0;
          v82 = &v81;
          uint64_t v83 = 0x2020000000;
          char v84 = 0;
          v77[0] = 0;
          v77[1] = v77;
          v77[2] = 0x6812000000;
          v77[3] = __Block_byref_object_copy__1350;
          v77[4] = __Block_byref_object_dispose__1351;
          uint64_t v56 = v33;
          uint64_t v57 = v15;
          v77[6] = v33;
          v77[7] = 0;
          v77[8] = v85;
          v77[9] = 0;
          if (data)
          {
            long long v34 = data;
            uint64_t v35 = dispatch_data_create_map(data, &v79, &v80);
            uint64_t v36 = v32;
          }
          else
          {
            uint64_t v35 = 0;
            uint64_t v79 = 0;
            size_t v80 = 0;
            uint64_t v36 = v32;
            long long v34 = 0;
          }
          dispatch_object_t v78 = v35;
          compilerQueue = self->_compilerQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __128__MTLCompiler_newRenderPipelineStateWithDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke;
          block[3] = &unk_1E5221580;
          block[4] = self;
          block[5] = v20;
          block[6] = v34;
          void block[7] = a3;
          block[12] = buffer_ptr;
          block[10] = &v86;
          block[11] = &v106;
          block[9] = v77;
          block[8] = v22;
          BOOL v76 = (v36 & 4) != 0;
          dispatch_sync(compilerQueue, block);
          uint64_t v43 = v107[3];
          uint64_t v55 = v43;
          if (v43)
          {
            uint64_t v44 = *(NSObject **)(v43 + 440);
            v74[0] = MEMORY[0x1E4F143A8];
            v74[1] = 3221225472;
            v74[2] = __128__MTLCompiler_newRenderPipelineStateWithDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke_2;
            v74[3] = &unk_1E52215A8;
            v74[8] = &v106;
            v74[9] = v77;
            long long v54 = v22;
            v74[4] = v22;
            v74[5] = v67;
            v74[7] = &v90;
            v74[6] = a3;
            v74[10] = &v94;
            v74[11] = &v81;
            v74[13] = v36;
            v74[12] = &v86;
            dispatch_sync(v44, v74);
            v73[0] = 0;
            v73[1] = v73;
            v73[2] = 0x3052000000;
            v73[3] = __Block_byref_object_copy__10;
            v73[4] = __Block_byref_object_dispose__10;
            v73[5] = 0;
            v72[0] = 0;
            v72[1] = v72;
            v72[2] = 0x3052000000;
            v72[3] = __Block_byref_object_copy__10;
            v72[4] = __Block_byref_object_dispose__10;
            v72[5] = 0;
            if (*((unsigned char *)v95 + 24))
            {
              dispatch_object_t object = dispatch_data_create(*(const void **)v91[3], *(void *)(v91[3] + 16) + *(void *)(v91[3] + 8), 0, 0);
              uint64_t v45 = 0;
              uint64_t v15 = v57;
              size_t v21 = v58;
              if ((*((unsigned char *)v87 + 25) & 2) != 0) {
                uint64_t v45 = mach_absolute_time();
              }
              BOOL v46 = (MTLCompileFunctionRequestData *)objc_opt_new();
              [(MTLCompileFunctionRequestData *)v46 setSync:a8 == 0];
              [(MTLCompileFunctionRequestData *)v46 setFunction:v20];
              [(MTLCompileFunctionRequestData *)v46 setPipelineOptions:v32];
              [(MTLCompileFunctionRequestData *)v46 setFrameworkData:data];
              [(MTLCompileFunctionRequestData *)v46 setDriverKeyData:object];
              [(MTLCompileFunctionRequestData *)v46 setDestinationBinaryArchive:v54];
              -[MTLCompileFunctionRequestData setBinaryArchives:](v46, "setBinaryArchives:", [a3 binaryArchives]);
              [(MTLCompileFunctionRequestData *)v46 setArchiverId:0];
              -[MTLCompileFunctionRequestData setGpuCompilerSPIOptions:](v46, "setGpuCompilerSPIOptions:", [a3 gpuCompilerSPIOptions]);
              -[MTLCompileFunctionRequestData setMaxAccelerationStructureTraversalDepth:](v46, "setMaxAccelerationStructureTraversalDepth:", [a3 maxAccelerationStructureTraversalDepth]);
              [(MTLCompileFunctionRequestData *)v46 setAirScript:v62];
              setLinkedFunctionsForRequest(v46, (MTLLinkedFunctions *)[a3 fragmentLinkedFunctions]);
              -[MTLCompiler initializeFunctionRequestScriptAndFunctionId:script:driverCompilerOptions:compiledNextStageVariant:](self, "initializeFunctionRequestScriptAndFunctionId:script:driverCompilerOptions:compiledNextStageVariant:", v46, buffer_ptr, [a3 driverCompilerOptions], 0);
              v71[0] = MEMORY[0x1E4F143A8];
              v71[1] = 3221225472;
              v71[2] = __128__MTLCompiler_newRenderPipelineStateWithDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke_3;
              v71[3] = &unk_1E52215D0;
              v71[6] = &v86;
              v71[7] = v72;
              v71[4] = self;
              v71[5] = v67;
              v71[8] = &v106;
              v71[9] = v73;
              v71[11] = v45;
              v71[10] = &v90;
              [(MTLCompiler *)self compileFunctionRequestInternal:v46 frameworkLinking:1 linkDataSize:0 reflectionOnly:0 completionHandler:v71];

              dispatch_release(object);
              uint64_t v47 = (void (*)(dispatch_block_t))v61;
              long long v41 = (void (*)(dispatch_block_t))v62;
            }
            else
            {
              uint64_t v15 = v57;
              size_t v21 = v58;
              uint64_t v47 = (void (*)(dispatch_block_t))v61;
              long long v41 = (void (*)(dispatch_block_t))v62;
              if (*((unsigned char *)v82 + 24))
              {
                dispatch_group_enter(*(dispatch_group_t *)(v91[3] + 40));
                v70[0] = MEMORY[0x1E4F143A8];
                v70[1] = 3221225472;
                v70[2] = __128__MTLCompiler_newRenderPipelineStateWithDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke_4;
                v70[3] = &unk_1E5221530;
                v70[4] = &v106;
                v70[5] = &v90;
                [(MTLCompiler *)self reflectionWithFunction:v20 options:v32 completionHandler:v70];
              }
            }
            dispatch_release(data);
            [(_MTLDevice *)self->_device freeFragmentFunctionKey:v56 fragmentKeySize:v85];
            if (v65) {
              dispatch_retain(v65);
            }
            if (v66) {
              dispatch_retain(v66);
            }
            if (v68) {
              dispatch_retain(v68);
            }
            uint64_t v49 = v91[3];
            uint64_t v50 = [(_MTLDevice *)self->_device concurrentQueue];
            v69[0] = (void (*)(dispatch_block_t))MEMORY[0x1E4F143A8];
            v69[1] = (void (*)(dispatch_block_t))3221225472;
            v69[2] = (void (*)(dispatch_block_t))__128__MTLCompiler_newRenderPipelineStateWithDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke_5;
            v69[3] = (void (*)(dispatch_block_t))&unk_1E52215F8;
            v69[16] = (void (*)(dispatch_block_t))&v90;
            v69[17] = (void (*)(dispatch_block_t))&v98;
            v69[4] = v60;
            v69[5] = (void (*)(dispatch_block_t))self;
            v69[6] = v64;
            v69[7] = (void (*)(dispatch_block_t))v66;
            v69[8] = (void (*)(dispatch_block_t))v68;
            v69[9] = (void (*)(dispatch_block_t))a3;
            v69[10] = v41;
            v69[11] = v54;
            v69[22] = v32;
            v69[23] = v47;
            v69[18] = (void (*)(dispatch_block_t))&v106;
            v69[19] = (void (*)(dispatch_block_t))v73;
            v69[20] = (void (*)(dispatch_block_t))v72;
            v69[21] = (void (*)(dispatch_block_t))a7;
            v69[12] = v67;
            v69[13] = (void (*)(dispatch_block_t))v63;
            v69[14] = (void (*)(dispatch_block_t))v65;
            v69[15] = (void (*)(dispatch_block_t))a8;
            VariantEntry::waitOrNotify(v49, a8 != 0, (dispatch_queue_t)v50, v69);
            _Block_object_dispose(v72, 8);
            _Block_object_dispose(v73, 8);
            int v38 = v68;
            int v40 = v65;
            uint64_t v39 = v66;
          }
          else
          {
            [(_MTLDevice *)self->_device freeFragmentFunctionKey:v56 fragmentKeySize:v85];
            uint64_t v15 = v57;
            size_t v21 = v58;
            int v38 = v68;
            int v40 = v65;
            uint64_t v39 = v66;
            long long v41 = (void (*)(dispatch_block_t))v62;
            if (data) {
              dispatch_release(data);
            }
            if (v65) {
              dispatch_release(v65);
            }
            if (a8) {

            }
            reportErrorMessage((id)1, @"MTLPipelineOptionFailOnBinaryArchiveMiss was set and failed to find compiled pipeline functions in binary archive.", (uint64_t)a8, a7);
            dispatch_release(v62);
            dispatch_release(v58);
          }
          _Block_object_dispose(v77, 8);
          if (v78) {
            dispatch_release(v78);
          }
          _Block_object_dispose(&v81, 8);
          _Block_object_dispose(&v86, 8);
          _Block_object_dispose(&v90, 8);
          _Block_object_dispose(&v94, 8);
          if (!v55)
          {
            uint64_t v23 = 0;
            goto LABEL_100;
          }
        }
        else
        {
          if (v60) {
            id v37 = -[MTLCompiler createMeshStageAndLinkPipelineWithFragment:fragmentVariant:objectFunction:serializedObjectDescriptor:meshFunction:serializedMeshDescriptor:descriptor:airDescriptor:destinationArchive:options:reflection:compileStatistics:fragmentCompileTimeData:pipelineArchiverId:error:completionHandler:](self, "createMeshStageAndLinkPipelineWithFragment:fragmentVariant:objectFunction:serializedObjectDescriptor:meshFunction:serializedMeshDescriptor:descriptor:airDescriptor:destinationArchive:options:reflection:compileStatistics:fragmentCompileTimeData:pipelineArchiverId:error:completionHandler:", 0, 0, v64, v66, v60, v68, a3, v62, v22, a4, v61, v67, 0, 0, a7,
          }
                    a8);
          else {
            id v37 = [(MTLCompiler *)self createVertexStageAndLinkPipelineWithFragment:0 fragmentVariant:0 vertexFunction:v63 serializedVertexDescriptor:v65 descriptor:a3 airDescriptor:v62 destinationArchive:v22 options:a4 reflection:v61 compileStatistics:v67 fragmentCompileTimeData:0 pipelineArchiverId:0 error:a7 completionHandler:a8];
          }
          v99[5] = (uint64_t)v37;
          int v38 = v68;
          int v40 = v65;
          uint64_t v39 = v66;
          long long v41 = (void (*)(dispatch_block_t))v62;
        }
        if (v40) {
          dispatch_release(v40);
        }
        if (v39) {
          dispatch_release(v39);
        }
        if (v38) {
          dispatch_release(v38);
        }
        if (v41) {
          dispatch_release((dispatch_object_t)v41);
        }
        if (v21) {
          dispatch_release(v21);
        }
        if (a8)
        {

          if (!v67) {
            goto LABEL_99;
          }
        }
        else
        {
          if (!v67)
          {
LABEL_99:
            uint64_t v23 = (void *)v99[5];
LABEL_100:
            _Block_object_dispose(&v98, 8);
            _Block_object_dispose(&v106, 8);
            return v23;
          }
          objc_msgSend(v67, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (unint64_t)(*(double *)&gMachTimeToNS * (double)(mach_absolute_time() - v15))), MTLCompileTimeStatisticsKeyPipelineTotal[0]);
        }
        _MTLAddCompilePipelinePerformanceStatistics((NSDictionary *)v67, (uint64_t)MTLCompileTimeStatisticsKeyPipelinesRender);
        goto LABEL_99;
      }
      MTLReportFailure(0, "-[MTLCompiler newRenderPipelineStateWithDescriptorInternal:options:reflection:destinationBinaryArchive:error:completionHandler:]", 17845, @"Vertex function cannot be nil.", v24, v25, v26, v27, v52);
      if (!v21) {
        return 0;
      }
    }
    else if (a8)
    {
      (*((void (**)(id, void, void, void))a8 + 2))(a8, 0, 0, v77[0]);
      if (!v21) {
        return 0;
      }
    }
    else
    {
      if (a7) {
        *a7 = (id)v77[0];
      }
      if (!v21) {
        return 0;
      }
    }
    unint64_t v48 = v21;
LABEL_106:
    dispatch_release(v48);
    return 0;
  }
  if (!a7) {
    return 0;
  }
  uint64_t v23 = 0;
  *a7 = v110;
  return v23;
}

void __128__MTLCompiler_newRenderPipelineStateWithDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v5 = *(unsigned int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = [*(id *)(a1 + 56) driverCompilerOptions];
  uint64_t v8 = *(void *)(a1 + 96);
  uint64_t v9 = [*(id *)(a1 + 56) binaryArchives];
  if (v2) {
    [v2 requiredKeysForFunction:v3 variantKey:v4 + 48 frameworkData:v6 compilerOptions:v5 driverCompilerOptions:v7 airScript:v8 archives:v9 compiledNextStageVariant:0];
  }
  else {
    memset(&v10, 0, sizeof(v10));
  }
  *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "getProgramObject:destinationArchive:sourceBinaryArchives:variantKey:requiredKeys:failOnMiss:", *(void *)(a1 + 40), *(void *)(a1 + 64), objc_msgSend(*(id *)(a1 + 56), "binaryArchives"), *(void *)(*(void *)(a1 + 72) + 8) + 48, &v10, *(unsigned __int8 *)(a1 + 104));
  RequiredFunctionKeys::~RequiredFunctionKeys(&v10);
}

void *__128__MTLCompiler_newRenderPipelineStateWithDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke_2(uint64_t a1)
{
  id result = VariantList<4u>::find<VariantKey>(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(void *)(*(void *)(a1 + 72) + 8) + 48);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id result = VariantList<4u>::newVariantEntry<VariantKey>(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(void *)(*(void *)(a1 + 72) + 8) + 48);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  }
  if (*(void *)(a1 + 32)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  }
  if ((*(unsigned char *)(a1 + 106) & 0x40) != 0)
  {
    int v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "fragmentFunction"), "name");
    uint64_t v6 = MTLPipelinePerformanceKeyFragmentShader[0];
    id v7 = (id)[v4 objectForKey:MTLPipelinePerformanceKeyFragmentShader[0]];
    if (!v7)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v4 setObject:v7 forKey:v6];
    }
    uint64_t v8 = [NSNumber numberWithBool:v3 == 0];
    id result = (void *)[v7 setObject:v8 forKey:MTLCompileTimeStatisticsKeyCachedFunction[0]];
    if (v5) {
      id result = (void *)[v7 setObject:v5 forKey:MTLCompileTimeStatisticsKeyFunctionName[0]];
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
  {
    id result = (void *)[*(id *)(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) + 432) objectForKey:&stru_1ECAC84A8];
    BOOL v9 = result == 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v9;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    if (!*(void *)(v10 + 424))
    {
      id result = dispatch_queue_create("reflection Queue", 0);
      *(void *)(v10 + 424) = result;
    }
  }
  return result;
}

void __128__MTLCompiler_newRenderPipelineStateWithDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke_3(void *a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1[6] + 8) + 25) & 2) != 0) {
    unint64_t v4 = (unint64_t)(*(double *)&gMachTimeToNS * (double)(mach_absolute_time() - a1[11]));
  }
  else {
    unint64_t v4 = 0;
  }
  uint64_t v5 = *(void *)a2;
  uint64_t v6 = *(void **)(a2 + 8);
  if (*(void *)a2)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = (void *)[*(id *)(a1[4] + 8) newFragmentVariantWithCompilerOutput:*(void *)(a2 + 24) pipelineStatisticsOutput:*(void *)(a2 + 72)];
    *(void *)(*(void *)(a1[7] + 8) + 40) = *(void *)(a2 + 112);
    uint64_t v8 = *(NSObject **)(*(void *)(a1[7] + 8) + 40);
    if (v8) {
      dispatch_retain(v8);
    }
    BOOL v9 = *(NSObject **)(a2 + 56);
    if (v9)
    {
      size_t v22 = 0;
      buffer_ptr[0] = 0;
      uint64_t v10 = dispatch_data_create_map(v9, (const void **)buffer_ptr, &v22);
      if (v22) {
        objc_msgSend(v7, "setInputInfo:size:", buffer_ptr[0]);
      }
      dispatch_release(v10);
    }
    if ((*(unsigned char *)(*(void *)(a1[6] + 8) + 25) & 0x10) != 0) {
      [v7 setDebugInstrumentationData:*(void *)(a2 + 104)];
    }
  }
  int v11 = *(_DWORD *)(*(void *)(a1[6] + 8) + 24);
  if ((v11 & 0x200) != 0)
  {
    uint64_t v12 = (void *)a1[5];
    BOOL v13 = *(NSObject **)(a2 + 88);
    uint64_t v14 = MTLPipelinePerformanceKeyFragmentShader[0];
    id v15 = (id)[v12 objectForKey:MTLPipelinePerformanceKeyFragmentShader[0]];
    if (v15)
    {
      if (v13)
      {
LABEL_17:
        _MTLAddCompilerServiceCompileTimeStats(v15, v13);
        uint64_t v16 = [NSNumber numberWithUnsignedLongLong:v4];
        uint64_t v17 = MTLCompileTimeStatisticsKeyMTLCompilerService;
LABEL_20:
        [v15 setObject:v16 forKey:*v17];
        int v11 = *(_DWORD *)(*(void *)(a1[6] + 8) + 24);
        goto LABEL_21;
      }
    }
    else
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v12 setObject:v15 forKey:v14];

      if (v13) {
        goto LABEL_17;
      }
    }
    uint64_t v16 = [NSNumber numberWithBool:1];
    uint64_t v17 = MTLCompileTimeStatisticsKeyCachedFunction;
    goto LABEL_20;
  }
LABEL_21:
  if (v11)
  {
    uint64_t v18 = *(void **)(a2 + 40);
    if (v18)
    {
      uint64_t v19 = *(void **)(*(void *)(a1[8] + 8) + 24);
      uint64_t v20 = v19[53];
      buffer_ptr[0] = (void *)MEMORY[0x1E4F143A8];
      buffer_ptr[1] = (void *)3221225472;
      buffer_ptr[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
      buffer_ptr[3] = &unk_1E521FDD0;
      buffer_ptr[5] = v18;
      buffer_ptr[6] = v19;
      buffer_ptr[4] = 0;
      dispatch_sync(v20, buffer_ptr);
    }
  }
  uint64_t v21 = *(void *)(a2 + 80);
  if (v21)
  {
    *(void *)(*(void *)(a1[9] + 8) + 40) = v21;
    dispatch_retain(*(dispatch_object_t *)(*(void *)(a1[9] + 8) + 40));
  }
  VariantEntry::insertVariant(*(void *)(*(void *)(a1[10] + 8) + 24), v7, v5, v6, *(NSObject **)(a2 + 104));
}

void __128__MTLCompiler_newRenderPipelineStateWithDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    uint64_t v8 = *(NSObject **)(v7 + 424);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
    block[3] = &unk_1E521FDD0;
    block[5] = a3;
    block[6] = v7;
    block[4] = 0;
    dispatch_sync(v8, block);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v9 + 32));
  if (!*(void *)(v9 + 56))
  {
    *(void *)(v9 + 56) = a2;

    *(void *)(v9 + 64) = [a4 copy];
  }
  dispatch_group_leave(*(dispatch_group_t *)(v9 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 32));
}

void __128__MTLCompiler_newRenderPipelineStateWithDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke_5(void *a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1[16] + 8) + 24);
  if (*(void *)(v2 + 48))
  {
    uint64_t v4 = a1[4];
    int v3 = (void *)a1[5];
    uint64_t v5 = *(void *)(*(void *)(a1[18] + 8) + 24);
    if (v4) {
      uint64_t v6 = objc_msgSend(v3, "createMeshStageAndLinkPipelineWithFragment:fragmentVariant:objectFunction:serializedObjectDescriptor:meshFunction:serializedMeshDescriptor:descriptor:airDescriptor:destinationArchive:options:reflection:compileStatistics:fragmentCompileTimeData:pipelineArchiverId:error:completionHandler:", v5, a1[9], a1[10], a1[11], a1[22], a1[23], a1[12], *(void *)(*(void *)(a1[19] + 8) + 40), *(void *)(*(void *)(a1[20] + 8) + 40), a1[21], a1[15]);
    }
    else {
      uint64_t v6 = objc_msgSend(v3, "createVertexStageAndLinkPipelineWithFragment:fragmentVariant:vertexFunction:serializedVertexDescriptor:descriptor:airDescriptor:destinationArchive:options:reflection:compileStatistics:fragmentCompileTimeData:pipelineArchiverId:error:completionHandler:", v5, a1[11], a1[22], a1[23], a1[12], *(void *)(*(void *)(a1[19] + 8) + 40), *(void *)(*(void *)(a1[20] + 8) + 40), a1[21], a1[15]);
    }
    *(void *)(*(void *)(a1[17] + 8) + 40) = v6;
  }
  else
  {
    reportErrorMessage(*(id *)(v2 + 56), *(__CFString **)(v2 + 64), a1[15], (void *)a1[21]);
  }
  uint64_t v7 = *(NSObject **)(*(void *)(a1[20] + 8) + 40);
  if (v7) {
    dispatch_release(v7);
  }
  uint64_t v8 = a1[14];
  if (v8) {
    dispatch_release(v8);
  }
  uint64_t v9 = a1[7];
  if (v9) {
    dispatch_release(v9);
  }
  uint64_t v10 = a1[8];
  if (v10)
  {
    dispatch_release(v10);
  }
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6 completionHandler:(id)a7
{
  if ([a3 pipelineLibrary]) {
    uint64_t v13 = objc_msgSend((id)objc_msgSend(a3, "pipelineLibrary"), "pipelineCache");
  }
  else {
    uint64_t v13 = 0;
  }
  return [(MTLCompiler *)self newComputePipelineStateWithDescriptorInternal:a3 options:a4 pipelineCache:v13 destinationBinaryArchive:0 reflection:a5 error:a6 completionHandler:a7];
}

- (VariantEntry)computeVariantEntryWithDescriptor:(id)a3 airDescriptor:(id)a4 options:(unint64_t)a5 serializedComputeDataDescriptor:(id)a6 asyncCompile:(BOOL)a7 pipelineCache:(id)a8 destinationBinaryArchive:(id)a9 computeProgram:(MTLProgramObject *)a10 kernelDriverCompileTimeData:(id *)a11 compileTimeStatistics:(id)a12
{
  BOOL v13 = a7;
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x2020000000;
  uint64_t v75 = 0;
  uint64_t v68 = 0;
  uint64_t v69 = &v68;
  uint64_t v70 = 0x2020000000;
  uint64_t v71 = 0;
  uint64_t v64 = 0;
  uint64_t v65 = &v64;
  uint64_t v66 = 0x2020000000;
  char v67 = 0;
  uint64_t v60 = 0;
  uint64_t v61 = &v60;
  uint64_t v62 = 0x2020000000;
  char v63 = 0;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2020000000;
  int v59 = 0;
  int v59 = MTLGetCompilerOptions(self->_device, a5, self->_compilerFlags, 1uLL, 0);
  uint64_t v19 = [a3 computeFunction];
  buffer_ptr = 0;
  size_t size_ptr = 0;
  uint64_t v20 = dispatch_data_create_map((dispatch_data_t)a4, (const void **)&buffer_ptr, &size_ptr);
  uint64_t v53 = 0;
  uint64_t v21 = [(_MTLDevice *)self->_device computeFunctionKeyWithComputePipelineDescriptor:a3 options:a5 keySize:&v53];
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x6812000000;
  v49[3] = __Block_byref_object_copy__1350;
  v49[4] = __Block_byref_object_dispose__1351;
  id v37 = v21;
  v49[6] = v21;
  v49[7] = 0;
  v49[8] = v53;
  v49[9] = 0;
  BOOL v36 = v13;
  if (a6)
  {
    size_t v22 = dispatch_data_create_map((dispatch_data_t)a6, &v51, &v52);
  }
  else
  {
    size_t v22 = 0;
    char v51 = 0;
    size_t v52 = 0;
  }
  dispatch_object_t object = v22;
  compilerQueue = self->_compilerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __220__MTLCompiler_computeVariantEntryWithDescriptor_airDescriptor_options_serializedComputeDataDescriptor_asyncCompile_pipelineCache_destinationBinaryArchive_computeProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke;
  block[3] = &unk_1E5221580;
  block[4] = self;
  block[5] = v19;
  block[6] = a6;
  void block[7] = a3;
  block[9] = v49;
  block[10] = &v56;
  block[11] = &v68;
  block[12] = buffer_ptr;
  block[8] = a9;
  BOOL v48 = (a5 & 4) != 0;
  dispatch_sync(compilerQueue, block);
  uint64_t v24 = v69[3];
  if ((a5 & 4) == 0 || v24)
  {
    uint64_t v26 = *(NSObject **)(v24 + 440);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __220__MTLCompiler_computeVariantEntryWithDescriptor_airDescriptor_options_serializedComputeDataDescriptor_asyncCompile_pipelineCache_destinationBinaryArchive_computeProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_2;
    v46[3] = &unk_1E52215A8;
    v46[8] = &v68;
    v46[9] = v49;
    v46[4] = a9;
    v46[5] = a12;
    v46[6] = a3;
    v46[7] = &v72;
    v46[10] = &v60;
    v46[11] = &v64;
    v46[12] = &v56;
    v46[13] = a5;
    dispatch_sync(v26, v46);
    uint64_t v40 = 0;
    long long v41 = &v40;
    uint64_t v42 = 0x3052000000;
    uint64_t v43 = __Block_byref_object_copy__10;
    uint64_t v44 = __Block_byref_object_dispose__10;
    uint64_t v45 = 0;
    if (a9 || (uint64_t v27 = 0, *((unsigned char *)v61 + 24))) {
      uint64_t v27 = dispatch_data_create(*(const void **)v73[3], *(void *)(v73[3] + 16) + *(void *)(v73[3] + 8), 0, 0);
    }
    uint64_t v28 = objc_opt_new();
    [v28 setSync:!v36];
    [v28 setFunction:v19];
    [v28 setPipelineOptions:a5];
    [v28 setFrameworkData:a6];
    [v28 setDriverKeyData:v27];
    [v28 setPipelineCache:a8];
    if ([a3 linkedFunctions]) {
      uint64_t v29 = objc_msgSend((id)objc_msgSend(a3, "linkedFunctions"), "functions");
    }
    else {
      uint64_t v29 = 0;
    }
    objc_msgSend(v28, "setVisibleFunctions:", v29, a12);
    [v28 setDestinationBinaryArchive:a9];
    objc_msgSend(v28, "setBinaryArchives:", objc_msgSend(a3, "binaryArchives"));
    if ([a3 linkedFunctions]) {
      uint64_t v30 = objc_msgSend((id)objc_msgSend(a3, "linkedFunctions"), "privateFunctions");
    }
    else {
      uint64_t v30 = 0;
    }
    [v28 setPrivateVisibleFunctions:v30];
    objc_msgSend(v28, "setGpuCompilerSPIOptions:", objc_msgSend(a3, "gpuCompilerSPIOptions"));
    objc_msgSend(v28, "setMaxAccelerationStructureTraversalDepth:", objc_msgSend(a3, "maxAccelerationStructureTraversalDepth"));
    [v28 setAirScript:v20];
    if ([v28 visibleFunctions]) {
      uint64_t v31 = objc_msgSend((id)objc_msgSend(v28, "visibleFunctions"), "arrayByAddingObjectsFromArray:", objc_msgSend(a3, "functionPointers"));
    }
    else {
      uint64_t v31 = [a3 functionPointers];
    }
    [v28 setVisibleFunctions:v31];
    -[MTLCompiler initializeFunctionRequestScriptAndFunctionId:script:driverCompilerOptions:compiledNextStageVariant:](self, "initializeFunctionRequestScriptAndFunctionId:script:driverCompilerOptions:compiledNextStageVariant:", v28, buffer_ptr, [a3 driverCompilerOptions], 0);
    if (*((unsigned char *)v61 + 24))
    {
      if ((*((unsigned char *)v57 + 25) & 2) != 0) {
        uint64_t v32 = mach_absolute_time();
      }
      else {
        uint64_t v32 = 0;
      }
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __220__MTLCompiler_computeVariantEntryWithDescriptor_airDescriptor_options_serializedComputeDataDescriptor_asyncCompile_pipelineCache_destinationBinaryArchive_computeProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_3;
      v39[3] = &unk_1E5221620;
      v39[6] = &v56;
      v39[7] = &v68;
      v39[4] = self;
      v39[5] = v35;
      v39[8] = &v72;
      v39[9] = &v40;
      v39[10] = v32;
      [(MTLCompiler *)self compileFunctionRequestInternal:v28 frameworkLinking:1 linkDataSize:0 reflectionOnly:0 completionHandler:v39];
    }
    else if (*((unsigned char *)v65 + 24))
    {
      dispatch_group_enter(*(dispatch_group_t *)(v73[3] + 40));
      uint64_t v33 = [a3 binaryArchives];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __220__MTLCompiler_computeVariantEntryWithDescriptor_airDescriptor_options_serializedComputeDataDescriptor_asyncCompile_pipelineCache_destinationBinaryArchive_computeProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_4;
      v38[3] = &unk_1E5221530;
      v38[4] = &v68;
      v38[5] = &v72;
      [(MTLCompiler *)self reflectionWithFunction:v19 options:a5 sync:0 binaryArchives:v33 completionHandler:v38];
    }

    if (v27) {
      dispatch_release(v27);
    }
    dispatch_release(v20);
    [(_MTLDevice *)self->_device freeComputeFunctionKey:v37 keySize:v53];
    *a11 = (id)v41[5];
    *a10 = (MTLProgramObject *)v69[3];
    uint64_t v25 = (VariantEntry *)v73[3];
    _Block_object_dispose(&v40, 8);
  }
  else
  {
    [(_MTLDevice *)self->_device freeComputeFunctionKey:v37 keySize:v53];
    dispatch_release(v20);
    uint64_t v25 = 0;
  }
  _Block_object_dispose(v49, 8);
  if (object) {
    dispatch_release(object);
  }
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);
  return v25;
}

void __220__MTLCompiler_computeVariantEntryWithDescriptor_airDescriptor_options_serializedComputeDataDescriptor_asyncCompile_pipelineCache_destinationBinaryArchive_computeProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v5 = *(unsigned int *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = [*(id *)(a1 + 56) driverCompilerOptions];
  uint64_t v8 = *(void *)(a1 + 96);
  uint64_t v9 = [*(id *)(a1 + 56) binaryArchives];
  if (v2) {
    [v2 requiredKeysForFunction:v3 variantKey:v4 + 48 frameworkData:v6 compilerOptions:v5 driverCompilerOptions:v7 airScript:v8 archives:v9 compiledNextStageVariant:0];
  }
  else {
    memset(&v10, 0, sizeof(v10));
  }
  *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "getProgramObject:destinationArchive:sourceBinaryArchives:variantKey:requiredKeys:failOnMiss:", *(void *)(a1 + 40), *(void *)(a1 + 64), objc_msgSend(*(id *)(a1 + 56), "binaryArchives"), *(void *)(*(void *)(a1 + 72) + 8) + 48, &v10, *(unsigned __int8 *)(a1 + 104));
  RequiredFunctionKeys::~RequiredFunctionKeys(&v10);
}

void *__220__MTLCompiler_computeVariantEntryWithDescriptor_airDescriptor_options_serializedComputeDataDescriptor_asyncCompile_pipelineCache_destinationBinaryArchive_computeProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_2(uint64_t a1)
{
  id result = VariantList<4u>::find<VariantKey>(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(void *)(*(void *)(a1 + 72) + 8) + 48);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id result = VariantList<4u>::newVariantEntry<VariantKey>(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(void *)(*(void *)(a1 + 72) + 8) + 48);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  }
  if (*(void *)(a1 + 32)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  }
  if ((*(unsigned char *)(a1 + 106) & 0x40) != 0)
  {
    BOOL v3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) == 0;
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "computeFunction"), "name");
    uint64_t v6 = [NSNumber numberWithBool:v3];
    id result = (void *)[v4 setObject:v6 forKey:MTLCompileTimeStatisticsKeyCachedFunction[0]];
    if (v5) {
      id result = (void *)[v4 setObject:v5 forKey:MTLCompileTimeStatisticsKeyFunctionName[0]];
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
  {
    id result = (void *)[*(id *)(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) + 432) objectForKey:&stru_1ECAC84A8];
    BOOL v7 = result == 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v7;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    if (!*(void *)(v8 + 424))
    {
      id result = dispatch_queue_create("reflection Queue", 0);
      *(void *)(v8 + 424) = result;
    }
  }
  return result;
}

void __220__MTLCompiler_computeVariantEntryWithDescriptor_airDescriptor_options_serializedComputeDataDescriptor_asyncCompile_pipelineCache_destinationBinaryArchive_computeProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 25) & 2) != 0) {
    unint64_t v4 = (unint64_t)(*(double *)&gMachTimeToNS * (double)(mach_absolute_time() - *(void *)(a1 + 80)));
  }
  else {
    unint64_t v4 = 0;
  }
  if (*(void *)a2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) newComputeVariantWithCompilerOutput:*(void *)(a2 + 24) pipelineStatisticsOutput:*(void *)(a2 + 72)];
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v6 = *(void *)(a2 + 40);
    if (v6)
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      uint64_t v8 = *(NSObject **)(v7 + 424);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
      block[3] = &unk_1E521FDD0;
      block[5] = v6;
      block[6] = v7;
      block[4] = 0;
      dispatch_sync(v8, block);
    }
  }
  VariantEntry::insertVariant(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), v5, *(void *)a2, *(void **)(a2 + 8), *(NSObject **)(a2 + 104));

  if ((*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 25) & 2) != 0)
  {
    uint64_t v9 = *(void **)(a1 + 40);
    RequiredFunctionKeys v10 = *(NSObject **)(a2 + 88);
    if (v10)
    {
      _MTLAddCompilerServiceCompileTimeStats(*(void **)(a1 + 40), v10);
      uint64_t v11 = [NSNumber numberWithUnsignedLongLong:v4];
      uint64_t v12 = MTLCompileTimeStatisticsKeyMTLCompilerService;
    }
    else
    {
      uint64_t v11 = [NSNumber numberWithBool:1];
      uint64_t v12 = MTLCompileTimeStatisticsKeyCachedFunction;
    }
    [v9 setObject:v11 forKey:*v12];
  }
  uint64_t v13 = *(void *)(a2 + 80);
  if (v13)
  {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = v13;
    dispatch_retain(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  }
}

void __220__MTLCompiler_computeVariantEntryWithDescriptor_airDescriptor_options_serializedComputeDataDescriptor_asyncCompile_pipelineCache_destinationBinaryArchive_computeProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    uint64_t v8 = *(NSObject **)(v7 + 424);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
    block[3] = &unk_1E521FDD0;
    block[5] = a3;
    block[6] = v7;
    block[4] = 0;
    dispatch_sync(v8, block);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v9 + 32));
  if (!*(void *)(v9 + 56))
  {
    *(void *)(v9 + 56) = a2;

    *(void *)(v9 + 64) = [a4 copy];
  }
  dispatch_group_leave(*(dispatch_group_t *)(v9 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 32));
}

- (id)pipelineStateWithVariant:(VariantEntry *)a3 descriptor:(id)a4 options:(unint64_t)a5 computeProgram:(void *)a6 kernelDriverCompileTimeData:(id)a7 serializedComputeDataDescriptor:(id)a8 compileTimeStatistics:(id)a9 reflection:(id *)a10 error:(id *)a11 completionHandler:(id)a12
{
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3052000000;
  uint64_t v30 = __Block_byref_object_copy__10;
  uint64_t v31 = __Block_byref_object_dispose__10;
  uint64_t v32 = 0;
  int v19 = MTLGetCompilerOptions(self->_device, a5, self->_compilerFlags, 1uLL, 0);
  v26[0] = 0;
  v26[1] = v26;
  _OWORD v26[2] = 0x3052000000;
  v26[3] = __Block_byref_object_copy__10;
  v26[4] = __Block_byref_object_dispose__10;
  v26[5] = a7;
  uint64_t v20 = [(_MTLDevice *)self->_device serialQueue];
  block[0] = (void (*)(dispatch_block_t))MEMORY[0x1E4F143A8];
  block[1] = (void (*)(dispatch_block_t))3221225472;
  block[2] = (void (*)(dispatch_block_t))__191__MTLCompiler_pipelineStateWithVariant_descriptor_options_computeProgram_kernelDriverCompileTimeData_serializedComputeDataDescriptor_compileTimeStatistics_reflection_error_completionHandler___block_invoke;
  block[3] = (void (*)(dispatch_block_t))&unk_1E5221648;
  block[8] = (void (*)(dispatch_block_t))a12;
  block[9] = (void (*)(dispatch_block_t))&v27;
  block[4] = (void (*)(dispatch_block_t))self;
  block[5] = (void (*)(dispatch_block_t))a4;
  block[12] = (void (*)(dispatch_block_t))a11;
  void block[13] = (void (*)(dispatch_block_t))a5;
  int v24 = v19;
  block[10] = (void (*)(dispatch_block_t))v26;
  block[11] = (void (*)(dispatch_block_t))a3;
  block[6] = (void (*)(dispatch_block_t))a8;
  void block[7] = (void (*)(dispatch_block_t))a9;
  BOOL v25 = a12 != 0;
  block[14] = (void (*)(dispatch_block_t))a6;
  block[15] = (void (*)(dispatch_block_t))a10;
  VariantEntry::waitOrNotify((uint64_t)a3, a12 != 0, (dispatch_queue_t)v20, block);
  uint64_t v21 = (void *)v28[5];
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v27, 8);
  return v21;
}

void __191__MTLCompiler_pipelineStateWithVariant_descriptor_options_computeProgram_kernelDriverCompileTimeData_serializedComputeDataDescriptor_compileTimeStatistics_reflection_error_completionHandler___block_invoke(uint64_t a1)
{
  v32[16] = *(void **)MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 88);
  uint64_t v3 = v2[6];
  if (v3)
  {
    uint64_t v27 = 0;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) newComputePipelineWithDescriptor:*(void *)(a1 + 40) variant:v3 errorMessage:&v27];
    if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      reportErrorMessage((id)2, v27, *(void *)(a1 + 64), *(void **)(a1 + 96));
      return;
    }
    if (!*(void *)(a1 + 104))
    {
      if (!*(unsigned char *)(a1 + 132)) {
        return;
      }
      RequiredFunctionKeys v10 = 0;
      goto LABEL_36;
    }
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) pipelineFlagsWithComputeVariant:v3];
    if (*(unsigned char *)(a1 + 128)) {
      uint64_t v5 = [*(id *)(*(void *)(a1 + 112) + 432) objectForKey:&stru_1ECAC84A8];
    }
    else {
      uint64_t v5 = 0;
    }
    RequiredFunctionKeys v10 = [[MTLComputePipelineReflection alloc] initWithSerializedData:v5 serializedStageInputDescriptor:*(void *)(a1 + 48) device:*(void *)(*(void *)(a1 + 32) + 8) options:*(void *)(a1 + 104) flags:v4];
    uint64_t v11 = *(void *)(a1 + 104);
    if ((v11 & 0x440000) != 0)
    {
      uint64_t v12 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) pipelinePerformanceStatisticsWithComputeVariant:v3 compileTimeOutput:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
      uint64_t v13 = *(NSObject **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      if (v13)
      {
        dispatch_release(v13);
        *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = 0;
      }
      if ((*(unsigned char *)(a1 + 106) & 0x40) != 0)
      {
        uint64_t v14 = *(void **)(a1 + 56);
        if ((objc_msgSend((id)objc_msgSend(v14, "objectForKey:", MTLCompileTimeStatisticsKeyCachedFunction[0]), "BOOLValue") & 1) == 0)
        {
          id v15 = (void *)[v12 objectForKey:MTLPipelinePerformanceKeyCompileTimeStatistics[0]];
          *(_OWORD *)uint64_t v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          uint64_t v16 = [v15 countByEnumeratingWithState:v28 objects:v32 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v29;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v29 != v18) {
                  objc_enumerationMutation(v15);
                }
                objc_msgSend(v14, "setObject:forKey:", objc_msgSend(v15, "objectForKey:", *((void *)v28[1] + i)), *((void *)v28[1] + i));
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:v28 objects:v32 count:16];
            }
            while (v17);
          }
        }
      }
      [(MTLComputePipelineReflection *)v10 setPerformanceStatistics:v12];
      uint64_t v11 = *(void *)(a1 + 104);
    }
    if ((v11 & 0x200000) != 0)
    {
      v32[0] = 0;
      v28[0] = 0;
      unint64_t v26 = 0;
      unsigned int v25 = 0;
      [*(id *)(*(void *)(a1 + 32) + 8) getConstantSamplersBitmasks:v32 uniqueIdentifiers:v28 constantSamplerCount:&v26 stride:&v25 forComputeVariant:v3];
      if (v26)
      {
        -[MTLComputePipelineReflection setConstantSamplerDescriptorsFromBitmasks:stride:count:](v10, "setConstantSamplerDescriptorsFromBitmasks:stride:count:", v32[0], v25);
        id v20 = objc_alloc(MEMORY[0x1E4F1CA48]);
        uint64_t v21 = (void *)[v20 initWithCapacity:v26];
        if (v26)
        {
          for (unint64_t j = 0; j < v26; ++j)
            objc_msgSend(v21, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", *((void *)v28[0] + j)), j);
        }
        [(MTLComputePipelineReflection *)v10 setConstantSamplerUniqueIdentifiers:v21];
      }
      free(v32[0]);
      free(v28[0]);
      uint64_t v11 = *(void *)(a1 + 104);
    }
    if ((v11 & 0x1000000) != 0)
    {
      uint64_t v23 = [[MTLDebugInstrumentationData alloc] initWithData:*(void *)(*(void *)(a1 + 88) + 72)];
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setDebugInstrumentationData:v23];
    }
    if (*(unsigned char *)(a1 + 132))
    {
LABEL_36:
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = 0;
LABEL_37:

      return;
    }
    if (v10)
    {
      if (*(void *)(a1 + 120))
      {
        int v24 = v10;
        **(void **)(a1 + 120) = v10;
        return;
      }
      goto LABEL_37;
    }
  }
  else
  {
    uint64_t v6 = (void *)v2[7];
    uint64_t v7 = (__CFString *)v2[8];
    uint64_t v8 = *(void *)(a1 + 64);
    uint64_t v9 = *(void **)(a1 + 96);
    reportErrorMessage(v6, v7, v8, v9);
  }
}

- (id)newComputePipelineStateWithDescriptorInternal:(id)a3 options:(unint64_t)a4 pipelineCache:(id)a5 destinationBinaryArchive:(id)a6 reflection:(id *)a7 error:(id *)a8 completionHandler:(id)a9
{
  if (_MTLCompilePerformanceStatisticsEnabled()) {
    unint64_t v19 = a4 | 0x400000;
  }
  else {
    unint64_t v19 = a4;
  }
  if ((v19 & 0x400000) != 0)
  {
    if (initTimebaseInfo(void)::onceToken != -1) {
      dispatch_once(&initTimebaseInfo(void)::onceToken, &__block_literal_global_1340);
    }
    id v20 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    _MTLAddCompilePipelinePerformanceStatistics(v20, (uint64_t)MTLCompileTimeStatisticsKeyPipelinesCompute);
    if (!a9)
    {
      uint64_t v21 = mach_absolute_time();
      if (a3) {
        goto LABEL_10;
      }
      goto LABEL_24;
    }
  }
  else
  {
    id v20 = 0;
  }
  uint64_t v21 = 0;
  if (a3) {
    goto LABEL_10;
  }
LABEL_24:
  MTLReportFailure(0, "-[MTLCompiler newComputePipelineStateWithDescriptorInternal:options:pipelineCache:destinationBinaryArchive:reflection:error:completionHandler:]", 18730, @"descriptor cannot be null.", v15, v16, v17, v18, v28);
LABEL_10:
  long long v34 = 0;
  if ([a3 validateWithDevice:self->_device error:&v34])
  {
    if (a8) {
      *a8 = 0;
    }
    uint64_t v29 = v21;
    if (a9) {
      a3 = (id)[a3 copy];
    }
    size_t v22 = [a3 newSerializedComputeDataWithFlags:self->_compilerFlags options:v19];
    uint64_t v33 = 0;
    uint64_t v32 = 0;
    long long v30 = [a3 newPipelineScript];
    uint64_t v23 = -[MTLCompiler computeVariantEntryWithDescriptor:airDescriptor:options:serializedComputeDataDescriptor:asyncCompile:pipelineCache:destinationBinaryArchive:computeProgram:kernelDriverCompileTimeData:compileTimeStatistics:](self, "computeVariantEntryWithDescriptor:airDescriptor:options:serializedComputeDataDescriptor:asyncCompile:pipelineCache:destinationBinaryArchive:computeProgram:kernelDriverCompileTimeData:compileTimeStatistics:", a3, a6, &v32, &v33, v20);
    if (v23)
    {
      int v24 = (void (*)(dispatch_block_t))v23;
      if (!a6)
      {
        id v26 = [(MTLCompiler *)self pipelineStateWithVariant:v23 descriptor:a3 options:v19 computeProgram:v32 kernelDriverCompileTimeData:v33 serializedComputeDataDescriptor:v22 compileTimeStatistics:v20 reflection:a7 error:a8 completionHandler:a9];
LABEL_28:
        if (v22) {
          dispatch_release(v22);
        }
        if (a9)
        {

          if (!v20) {
            goto LABEL_36;
          }
        }
        else
        {
          if (!v20)
          {
LABEL_36:
            dispatch_release(v30);
            return v26;
          }
          -[NSDictionary setObject:forKey:](v20, "setObject:forKey:", [NSNumber numberWithUnsignedLongLong:(unint64_t)(*(double *)&gMachTimeToNS * (double)(mach_absolute_time() - v29))], MTLCompileTimeStatisticsKeyPipelineTotal[0]);
        }
        _MTLAddCompilePipelinePerformanceStatistics(v20, (uint64_t)MTLCompileTimeStatisticsKeyPipelinesCompute);

        goto LABEL_36;
      }
      unsigned int v25 = [(_MTLDevice *)self->_device serialQueue];
      block[0] = (void (*)(dispatch_block_t))MEMORY[0x1E4F143A8];
      block[1] = (void (*)(dispatch_block_t))3221225472;
      block[2] = (void (*)(dispatch_block_t))__143__MTLCompiler_newComputePipelineStateWithDescriptorInternal_options_pipelineCache_destinationBinaryArchive_reflection_error_completionHandler___block_invoke;
      block[3] = (void (*)(dispatch_block_t))&unk_1E5221128;
      block[4] = (void (*)(dispatch_block_t))a9;
      block[5] = v24;
      block[6] = (void (*)(dispatch_block_t))a8;
      VariantEntry::waitOrNotify((uint64_t)v24, a9 != 0, (dispatch_queue_t)v25, block);
    }
    else
    {
      reportErrorMessage((id)1, @"MTLPipelineOptionFailOnBinaryArchiveMiss was set and failed to find compiled pipeline functions in binary archive.", (uint64_t)a9, a8);
    }
    id v26 = 0;
    goto LABEL_28;
  }
  if (a8) {
    *a8 = v34;
  }
  if (v20) {

  }
  return 0;
}

void *__143__MTLCompiler_newComputePipelineStateWithDescriptorInternal_options_pipelineCache_destinationBinaryArchive_reflection_error_completionHandler___block_invoke(void *result)
{
  uint64_t v1 = result[5];
  if (!*(void *)(v1 + 48)) {
    return reportErrorMessage(*(id *)(v1 + 56), *(__CFString **)(v1 + 64), result[4], (void *)result[6]);
  }
  return result;
}

void __197__MTLCompiler_tileVariantEntryWithDescriptor_airDescriptor_options_serializedTileDataDescriptor_asyncCompile_destinationBinaryArchive_tileProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 25) & 2) != 0) {
    unint64_t v4 = (unint64_t)(*(double *)&gMachTimeToNS * (double)(mach_absolute_time() - *(void *)(a1 + 80)));
  }
  else {
    unint64_t v4 = 0;
  }
  if (*(void *)a2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) newTileVariantWithCompilerOutput:*(void *)(a2 + 24) pipelineStatisticsOutput:*(void *)(a2 + 72) functionType:*(void *)(a1 + 88)];
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v6 = *(void *)(a2 + 40);
    if (v6)
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      uint64_t v8 = *(NSObject **)(v7 + 424);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
      block[3] = &unk_1E521FDD0;
      block[5] = v6;
      block[6] = v7;
      block[4] = 0;
      dispatch_sync(v8, block);
    }
  }
  VariantEntry::insertVariant(*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), v5, *(void *)a2, *(void **)(a2 + 8), *(NSObject **)(a2 + 104));

  if ((*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 25) & 2) != 0)
  {
    uint64_t v9 = *(void **)(a1 + 40);
    RequiredFunctionKeys v10 = *(NSObject **)(a2 + 88);
    unint64_t v11 = *(void *)(a1 + 88);
    if (v11 <= 8 && ((1 << v11) & 0x186) != 0)
    {
      uint64_t v12 = MTLPipelinePerformanceKeyVertexShader;
      if (v11 != 1) {
        uint64_t v12 = MTLPipelinePerformanceKeyFragmentShader;
      }
      if (v11 == 8) {
        uint64_t v12 = MTLPipelinePerformanceKeyObjectShader;
      }
      if (v11 == 7) {
        uint64_t v13 = MTLPipelinePerformanceKeyMeshShader;
      }
      else {
        uint64_t v13 = v12;
      }
      uint64_t v14 = *v13;
      id v15 = (id)[*(id *)(a1 + 40) objectForKey:*v13];
      if (!v15)
      {
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v9 setObject:v15 forKey:v14];
      }
      if (v10) {
        goto LABEL_23;
      }
    }
    else
    {
      id v15 = *(id *)(a1 + 40);
      if (v10)
      {
LABEL_23:
        _MTLAddCompilerServiceCompileTimeStats(v15, v10);
        uint64_t v16 = [NSNumber numberWithUnsignedLongLong:v4];
        uint64_t v17 = MTLCompileTimeStatisticsKeyMTLCompilerService;
LABEL_26:
        [v15 setObject:v16 forKey:*v17];
        goto LABEL_27;
      }
    }
    uint64_t v16 = [NSNumber numberWithBool:1];
    uint64_t v17 = MTLCompileTimeStatisticsKeyCachedFunction;
    goto LABEL_26;
  }
LABEL_27:
  uint64_t v18 = *(void *)(a2 + 80);
  if (v18)
  {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = v18;
    dispatch_retain(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  }
}

void __197__MTLCompiler_tileVariantEntryWithDescriptor_airDescriptor_options_serializedTileDataDescriptor_asyncCompile_destinationBinaryArchive_tileProgram_kernelDriverCompileTimeData_compileTimeStatistics___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    uint64_t v8 = *(NSObject **)(v7 + 424);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZN16MTLProgramObject17setReflectionDataEPU27objcproto16OS_dispatch_data8NSObjectP8NSString_block_invoke;
    block[3] = &unk_1E521FDD0;
    block[5] = a3;
    block[6] = v7;
    block[4] = 0;
    dispatch_sync(v8, block);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v9 + 32));
  if (!*(void *)(v9 + 56))
  {
    *(void *)(v9 + 56) = a2;

    *(void *)(v9 + 64) = [a4 copy];
  }
  dispatch_group_leave(*(dispatch_group_t *)(v9 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 32));
}

- (id)renderPipelineStateWithTileVariant:(VariantEntry *)a3 descriptor:(id)a4 options:(unint64_t)a5 tileProgram:(void *)a6 kernelDriverCompileTimeData:(id)a7 serializedTileDataDescriptor:(id)a8 compileTimeStatistics:(id)a9 reflection:(id *)a10 error:(id *)a11 completionHandler:(id)a12
{
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3052000000;
  long long v30 = __Block_byref_object_copy__10;
  long long v31 = __Block_byref_object_dispose__10;
  uint64_t v32 = 0;
  int v18 = MTLGetCompilerOptions(self->_device, a5, self->_compilerFlags, 0, 0);
  v26[0] = 0;
  v26[1] = v26;
  _OWORD v26[2] = 0x3052000000;
  v26[3] = __Block_byref_object_copy__10;
  v26[4] = __Block_byref_object_dispose__10;
  v26[5] = a7;
  unint64_t v19 = (void (*)(dispatch_block_t))objc_msgSend((id)objc_msgSend(a4, "tileFunction"), "functionType");
  id v20 = [(_MTLDevice *)self->_device serialQueue];
  block[0] = (void (*)(dispatch_block_t))MEMORY[0x1E4F143A8];
  block[1] = (void (*)(dispatch_block_t))3221225472;
  block[2] = (void (*)(dispatch_block_t))__195__MTLCompiler_renderPipelineStateWithTileVariant_descriptor_options_tileProgram_kernelDriverCompileTimeData_serializedTileDataDescriptor_compileTimeStatistics_reflection_error_completionHandler___block_invoke;
  block[3] = (void (*)(dispatch_block_t))&unk_1E52216C0;
  block[10] = (void (*)(dispatch_block_t))a3;
  block[11] = (void (*)(dispatch_block_t))a11;
  block[4] = (void (*)(dispatch_block_t))self;
  block[5] = (void (*)(dispatch_block_t))a4;
  int v24 = v18;
  block[12] = (void (*)(dispatch_block_t))a5;
  void block[13] = (void (*)(dispatch_block_t))a6;
  block[8] = (void (*)(dispatch_block_t))&v27;
  block[9] = (void (*)(dispatch_block_t))v26;
  block[6] = (void (*)(dispatch_block_t))a9;
  void block[7] = (void (*)(dispatch_block_t))a12;
  BOOL v25 = a12 != 0;
  block[14] = v19;
  block[15] = (void (*)(dispatch_block_t))a10;
  VariantEntry::waitOrNotify((uint64_t)a3, a12 != 0, (dispatch_queue_t)v20, block);
  uint64_t v21 = (void *)v28[5];
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v27, 8);
  return v21;
}

void __195__MTLCompiler_renderPipelineStateWithTileVariant_descriptor_options_tileProgram_kernelDriverCompileTimeData_serializedTileDataDescriptor_compileTimeStatistics_reflection_error_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 80);
  uint64_t v3 = v2[6];
  if (v3)
  {
    uint64_t v23 = 0;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) newRenderPipelineWithTileDescriptor:*(void *)(a1 + 40) tileVariant:v3 errorMessage:&v23];
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      reportErrorMessage((id)2, v23, *(void *)(a1 + 56), *(void **)(a1 + 88));
      return;
    }
    if (!*(void *)(a1 + 96))
    {
      if (!*(unsigned char *)(a1 + 132)) {
        return;
      }
      RequiredFunctionKeys v10 = 0;
      goto LABEL_29;
    }
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) pipelineFlagsWithTileVariant:v3];
    if (*(unsigned char *)(a1 + 128)) {
      uint64_t v5 = [*(id *)(*(void *)(a1 + 104) + 432) objectForKey:&stru_1ECAC84A8];
    }
    else {
      uint64_t v5 = 0;
    }
    RequiredFunctionKeys v10 = [[MTLRenderPipelineReflectionInternal alloc] initWithTileData:v5 functionType:*(void *)(a1 + 112) device:*(void *)(*(void *)(a1 + 32) + 8) options:*(void *)(a1 + 96) flags:v4];
    uint64_t v11 = *(void *)(a1 + 96);
    if ((v11 & 0x440000) != 0)
    {
      uint64_t v12 = (NSMutableDictionary *)[*(id *)(*(void *)(a1 + 32) + 8) pipelinePerformanceStatisticsWithTileVariant:v3 compileTimeOutput:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
      uint64_t v13 = *(NSObject **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      if (v13)
      {
        dispatch_release(v13);
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = 0;
      }
      if ((*(unsigned char *)(a1 + 98) & 0x40) != 0) {
        addDriverCompilerPerformanceData(*(NSMutableDictionary **)(a1 + 48), v12, *(MTLFunctionType *)(a1 + 112));
      }
      [(MTLRenderPipelineReflectionInternal *)v10 setPerformanceStatistics:v12];
      uint64_t v11 = *(void *)(a1 + 96);
    }
    if ((v11 & 0x200000) != 0)
    {
      uint64_t v21 = 0;
      size_t v22 = 0;
      unint64_t v20 = 0;
      unsigned int v19 = 0;
      [*(id *)(*(void *)(a1 + 32) + 8) getConstantSamplersBitmasks:&v22 uniqueIdentifiers:&v21 constantSamplerCount:&v20 stride:&v19 forTileVariant:v3];
      if (v20)
      {
        -[MTLRenderPipelineReflectionInternal setConstantSamplerDescriptorsFromBitmasks:stride:count:](v10, "setConstantSamplerDescriptorsFromBitmasks:stride:count:", v22, v19);
        id v14 = objc_alloc(MEMORY[0x1E4F1CA48]);
        id v15 = (void *)[v14 initWithCapacity:v20];
        if (v20)
        {
          for (unint64_t i = 0; i < v20; ++i)
            objc_msgSend(v15, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", *((void *)v21 + i)), i);
        }
        [(MTLRenderPipelineReflectionInternal *)v10 setConstantSamplerUniqueIdentifiers:v15];
      }
      free(v22);
      free(v21);
      uint64_t v11 = *(void *)(a1 + 96);
    }
    if ((v11 & 0x1000000) != 0)
    {
      uint64_t v17 = [[MTLDebugInstrumentationData alloc] initWithData:*(void *)(*(void *)(a1 + 80) + 72)];
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setTileDebugInstrumentationData:v17];
    }
    if (*(unsigned char *)(a1 + 132))
    {
LABEL_29:
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = 0;
LABEL_30:

      return;
    }
    if (v10)
    {
      if (*(void *)(a1 + 120))
      {
        int v18 = v10;
        **(void **)(a1 + 120) = v10;
        return;
      }
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v6 = (void *)v2[7];
    uint64_t v7 = (__CFString *)v2[8];
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void **)(a1 + 88);
    reportErrorMessage(v6, v7, v8, v9);
  }
}

- (id)newRenderPipelineStateWithTileDescriptorInternal:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 destinationBinaryArchive:(id)a6 error:(id *)a7 completionHandler:(id)a8
{
  if (_MTLCompilePerformanceStatisticsEnabled()) {
    unint64_t v19 = a4 | 0x400000;
  }
  else {
    unint64_t v19 = a4;
  }
  if ((v19 & 0x400000) != 0)
  {
    if (initTimebaseInfo(void)::onceToken != -1) {
      dispatch_once(&initTimebaseInfo(void)::onceToken, &__block_literal_global_1340);
    }
    unint64_t v20 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    _MTLAddCompilePipelinePerformanceStatistics(v20, (uint64_t)MTLCompileTimeStatisticsKeyPipelinesRender);
    if (!a8)
    {
      uint64_t v21 = mach_absolute_time();
      if (a3) {
        goto LABEL_10;
      }
      goto LABEL_24;
    }
  }
  else
  {
    unint64_t v20 = 0;
  }
  uint64_t v21 = 0;
  if (a3) {
    goto LABEL_10;
  }
LABEL_24:
  MTLReportFailure(0, "-[MTLCompiler newRenderPipelineStateWithTileDescriptorInternal:options:reflection:destinationBinaryArchive:error:completionHandler:]", 19227, @"descriptor cannot be null.", v15, v16, v17, v18, v29);
LABEL_10:
  uint64_t v35 = 0;
  if ([a3 validateWithDevice:self->_device error:&v35])
  {
    if (a7) {
      *a7 = 0;
    }
    long long v30 = a5;
    uint64_t v31 = v21;
    if (a8) {
      a3 = (id)[a3 copy];
    }
    size_t v22 = [a3 newSerializedTileDataWithFlags:self->_compilerFlags options:v19 error:a7];
    uint64_t v34 = 0;
    uint64_t v33 = 0;
    uint64_t v23 = [a3 newPipelineScript];
    int v24 = [(MTLCompiler *)self tileVariantEntryWithDescriptor:a3 airDescriptor:v23 options:v19 serializedTileDataDescriptor:v22 asyncCompile:a8 != 0 destinationBinaryArchive:a6 tileProgram:&v33 kernelDriverCompileTimeData:&v34 compileTimeStatistics:v20];
    if (v24)
    {
      BOOL v25 = (void (*)(dispatch_block_t))v24;
      if (!a6)
      {
        id v27 = [(MTLCompiler *)self renderPipelineStateWithTileVariant:v24 descriptor:a3 options:v19 tileProgram:v33 kernelDriverCompileTimeData:v34 serializedTileDataDescriptor:v22 compileTimeStatistics:v20 reflection:v30 error:a7 completionHandler:a8];
        if (!v22)
        {
LABEL_28:
          if (a8)
          {

            if (!v20) {
              goto LABEL_34;
            }
          }
          else
          {
            if (!v20)
            {
LABEL_34:
              dispatch_release(v23);
              return v27;
            }
            -[NSDictionary setObject:forKey:](v20, "setObject:forKey:", [NSNumber numberWithUnsignedLongLong:(unint64_t)(*(double *)&gMachTimeToNS * (double)(mach_absolute_time() - v31))], MTLCompileTimeStatisticsKeyPipelineTotal[0]);
          }
          _MTLAddCompilePipelinePerformanceStatistics(v20, (uint64_t)MTLCompileTimeStatisticsKeyPipelinesRender);

          goto LABEL_34;
        }
LABEL_27:
        dispatch_release(v22);
        goto LABEL_28;
      }
      id v26 = [(_MTLDevice *)self->_device serialQueue];
      block[0] = (void (*)(dispatch_block_t))MEMORY[0x1E4F143A8];
      block[1] = (void (*)(dispatch_block_t))3221225472;
      block[2] = (void (*)(dispatch_block_t))__132__MTLCompiler_newRenderPipelineStateWithTileDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke;
      block[3] = (void (*)(dispatch_block_t))&unk_1E5221128;
      block[4] = (void (*)(dispatch_block_t))a8;
      block[5] = v25;
      block[6] = (void (*)(dispatch_block_t))a7;
      VariantEntry::waitOrNotify((uint64_t)v25, a8 != 0, (dispatch_queue_t)v26, block);
    }
    else
    {
      reportErrorMessage((id)1, @"MTLPipelineOptionFailOnBinaryArchiveMiss was set and failed to find compiled pipeline functions in binary archive.", (uint64_t)a8, a7);
    }
    id v27 = 0;
    if (!v22) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (a7) {
    *a7 = v35;
  }
  if (v20) {

  }
  return 0;
}

void *__132__MTLCompiler_newRenderPipelineStateWithTileDescriptorInternal_options_reflection_destinationBinaryArchive_error_completionHandler___block_invoke(void *result)
{
  uint64_t v1 = result[5];
  if (!*(void *)(v1 + 48)) {
    return reportErrorMessage(*(id *)(v1 + 56), *(__CFString **)(v1 + 64), result[4], (void *)result[6]);
  }
  return result;
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6 completionHandler:(id)a7
{
  return [(MTLCompiler *)self newRenderPipelineStateWithTileDescriptorInternal:a3 options:a4 reflection:a5 destinationBinaryArchive:0 error:a6 completionHandler:a7];
}

- (void)allowLibrariesFromOtherPlatforms
{
  self->_compilerFlags |= 0x80uLL;
}

- (NSString)pluginPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)compilerQueue
{
  return self->_compilerQueue;
}

- (MTLCompilerConnectionManager)compilerConnectionManager
{
  return self->_compilerConnectionManager;
}

- (unsigned)compilerId
{
  return self->_compilerId;
}

- (void).cxx_destruct
{
  cntrl = self->_shaderCache.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)generateMachOWithID:binaryEntries:machOSpecializedData:machOType:Path:platform:bitcodeList:completionHandler:
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      uint64_t v6 = (char *)v1[1];
      do
      {
        uint64_t v8 = *((void *)v6 - 11);
        v6 -= 88;
        uint64_t v7 = v8;
        if (v8) {
          dispatch_release(v7);
        }
        uint64_t v9 = *((void *)v4 - 10);
        if (v9) {
          dispatch_release(v9);
        }
        RequiredFunctionKeys v10 = *((void *)v4 - 9);
        if (v10) {
          dispatch_release(v10);
        }
        uint64_t v11 = *((void *)v4 - 8);
        if (v11) {
          dispatch_release(v11);
        }
        uint64_t v12 = (void *)*((void *)v4 - 7);
        if (v12)
        {
          *((void *)v4 - 6) = v12;
          operator delete(v12);
        }
        uint64_t v4 = v6;
      }
      while (v6 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

@end