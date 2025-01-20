@interface _MTLFunctionInternal
- ($2772B1D07D29A72E8557B2574C0AE5C1)baseFunctionHash;
- (BOOL)needsFunctionConstantValues;
- (BOOL)specializedFunctionHash:(id *)a3 requestData:(id *)a4 airScript:(id *)a5 constants:(id)a6 specializedName:(id)a7 privateFunctions:(id)a8 completionHandler:(id)a9;
- (SpecializedFunctionTrackingData)specializedFunctionTrackingData;
- (_MTLFunctionInternal)initWithName:(id)a3 type:(unint64_t)a4 libraryData:(void *)a5 functionData:(MTLFunctionData *)a6 device:(id)a7;
- (_MTLFunctionInternal)initWithName:(id)a3 type:(unint64_t)a4 libraryData:(void *)a5 functionData:(MTLFunctionData *)a6 inheritedLibraryPath:(id)a7 device:(id)a8;
- (const)bitCodeHash;
- (const)functionData;
- (id).cxx_construct;
- (id)airScript;
- (id)arguments;
- (id)bitcodeDataInternal;
- (id)filePath;
- (id)functionConstants;
- (id)functionConstantsDictionary;
- (id)functionInputs;
- (id)importedLibraries;
- (id)importedSymbols;
- (id)inheritedLibraryPath;
- (id)newFunctionWithPluginData:(id)a3 bitcodeType:(unsigned __int8)a4;
- (id)newSpecializedFunctionWithDescriptor:(id)a3 destinationArchive:(id)a4 functionCache:(id)a5 error:(id *)a6;
- (id)pluginData;
- (id)precompiledOutput;
- (id)reflectionData;
- (id)relocations;
- (id)returnType;
- (id)specializationAirScript;
- (id)stageInputAttributes;
- (id)stitchingAirScript;
- (id)unpackedFilePath;
- (id)vertexAttributes;
- (int64_t)lineNumber;
- (int64_t)patchControlPointCount;
- (unint64_t)bitCodeFileSize;
- (unint64_t)bitCodeOffset;
- (unint64_t)patchType;
- (unint64_t)renderTargetArrayIndexType;
- (unint64_t)sourceArchiveOffset;
- (unsigned)bitcodeType;
- (unsigned)requiredLLVMVersion;
- (void)dealloc;
- (void)initializePrivateMetadata;
- (void)initializePublicMetadata;
- (void)initializeSourceArchive;
- (void)initializeStitchableFunctionMetadata;
- (void)newSpecializedFunctionWithDescriptor:(id)a3 destinationArchive:(id)a4 functionCache:(id)a5 sync:(BOOL)a6 completionHandler:(id)a7;
- (void)programObject;
- (void)setArguments:(id)a3;
- (void)setBitcodeType:(unsigned __int8)a3;
- (void)setFilePath:(id)a3;
- (void)setFunctionConstantSpecializationHash:(id *)a3;
- (void)setFunctionConstants:(id)a3;
- (void)setLineNumber:(int64_t)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPluginData:(id)a3;
- (void)setPrecompiledOutput:(id)a3;
- (void)setRelocations:(id)a3;
- (void)setReturnType:(id)a3;
- (void)setSourceArchiveOffset:(unint64_t)a3;
- (void)setStageInputAttributes:(id)a3;
- (void)setTrackingData:(shared_ptr<TrackingData>)a3;
- (void)setUnpackedFilePath:(id)a3;
- (void)setVertexAttributes:(id)a3;
- (void)stitchedLibraryTrackingData;
- (void)storeTrackingDataWithDescriptor:(id)a3 function:(id)a4 variantHash:(id *)a5;
@end

@implementation _MTLFunctionInternal

- (id)functionInputs
{
  return self->_functionData.functionInputs;
}

- (id)relocations
{
  return self->super._relocations;
}

- (id)functionConstantsDictionary
{
  if (!self->_publicMetadataInitialized) {
    [(_MTLFunctionInternal *)self initializePublicMetadata];
  }
  v3 = (os_unfair_lock_s *)((char *)self->super._libraryData + 84);
  os_unfair_lock_lock(v3);
  functionConstantDictionary = self->super._functionConstantDictionary;
  if (!functionConstantDictionary)
  {
    functionConstants = self->super._functionConstants;
    if (functionConstants)
    {
      [(NSArray *)functionConstants count];
      operator new[]();
    }
    functionConstantDictionary = (NSDictionary *)MEMORY[0x1E4F1CC08];
    self->super._functionConstantDictionary = functionConstantDictionary;
  }
  os_unfair_lock_unlock(v3);
  return functionConstantDictionary;
}

- (id)newSpecializedFunctionWithDescriptor:(id)a3 destinationArchive:(id)a4 functionCache:(id)a5 error:(id *)a6
{
  if (a6) {
    *a6 = 0;
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__10;
  v24 = __Block_byref_object_dispose__10;
  uint64_t v25 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__10;
  v18 = __Block_byref_object_dispose__10;
  uint64_t v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100___MTLFunctionInternal_newSpecializedFunctionWithDescriptor_destinationArchive_functionCache_error___block_invoke;
  v13[3] = &unk_1E5221238;
  v13[4] = &v20;
  v13[5] = &v14;
  [(_MTLFunctionInternal *)self newSpecializedFunctionWithDescriptor:a3 destinationArchive:a4 functionCache:a5 sync:1 completionHandler:v13];
  if ((_MTLFunctionInternal *)v21[5] == self)
  {

    v9 = self;
  }
  else
  {
    v8 = (void *)v15[5];
    if (a6) {
      *a6 = v8;
    }
    else {

    }
    uint64_t v10 = v21[5];
    if (v10)
    {
      *(unsigned char *)(v10 + 296) = self->_functionData.bitcodeType;
      *(void *)(v21[5] + 304) = self->_functionData.pluginData;
      id v11 = *(id *)(v21[5] + 304);
      v9 = (_MTLFunctionInternal *)v21[5];
    }
    else
    {
      v9 = 0;
    }
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v9;
}

- (id).cxx_construct
{
  *((void *)self + 40) = 0;
  *((void *)self + 45) = 0;
  *((void *)self + 52) = 0;
  *((void *)self + 53) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_trackingData.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)storeTrackingDataWithDescriptor:(id)a3 function:(id)a4 variantHash:(id *)a5
{
  if (-[_MTLFunctionInternal storeTrackingDataWithDescriptor:function:variantHash:]::onceToken != -1) {
    dispatch_once(&-[_MTLFunctionInternal storeTrackingDataWithDescriptor:function:variantHash:]::onceToken, &__block_literal_global_1133);
  }
  if (-[_MTLFunctionInternal storeTrackingDataWithDescriptor:function:variantHash:]::enableMetalScriptCollection
    || ([a3 options] & 2) != 0)
  {
    v9 = (std::__shared_weak_count *)operator new(0x30uLL);
    v9->__shared_owners_ = 0;
    v9->__shared_weak_owners_ = 0;
    v9->__vftable = (std::__shared_weak_count_vtbl *)&unk_1ECAC4810;
    v9[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1ECAC43C8;
    v9[1].__shared_owners_ = 0;
    v9[1].__shared_weak_owners_ = 0;
    v9[1].__shared_owners_ = (uint64_t)self;
    uint64_t v10 = (void *)[a3 constantValues];
    shared_weak_owners = (void *)v9[1].__shared_weak_owners_;
    if (shared_weak_owners) {

    }
    v9[1].__shared_weak_owners_ = (uint64_t)v10;
    v12 = v9 + 1;
    v13 = v9;
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    [a4 setTrackingData:&v12];
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  if ([a3 constantValues]) {
    [a4 setFunctionConstantSpecializationHash:a5];
  }
}

- (void)newSpecializedFunctionWithDescriptor:(id)a3 destinationArchive:(id)a4 functionCache:(id)a5 sync:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!self->_publicMetadataInitialized) {
    [(_MTLFunctionInternal *)self initializePublicMetadata];
  }
  if ((![a3 applyFunctionConstants] || !self->super._functionConstants)
    && ![a3 specializedName]
    && (![a3 privateFunctions] || !objc_msgSend((id)objc_msgSend(a3, "privateFunctions"), "count")))
  {
    v24 = (void (*)(id, _MTLFunctionInternal *, void))*((void *)a7 + 2);
    v24(a7, self, 0);
    return;
  }
  HIDWORD(v39) = MTLGetCompilerOptions(self->super._device, [a3 pipelineOptions], objc_msgSend((id)-[MTLDevice compiler](self->super._device, "compiler"), "compilerFlags") & 0x80, 3uLL, 0);
  dispatch_object_t v43 = 0;
  uint64_t v13 = [a3 constantValues];
  dispatch_object_t object = 0;
  uint64_t v14 = [a3 specializedName];
  LODWORD(v39) = v8;
  if ([a3 specializedName]
    && objc_msgSend((id)objc_msgSend(a3, "specializedName"), "isEqualToString:", self->super._name))
  {
    uint64_t v14 = 0;
  }
  if (-[_MTLFunctionInternal specializedFunctionHash:requestData:airScript:constants:specializedName:privateFunctions:completionHandler:](self, "specializedFunctionHash:requestData:airScript:constants:specializedName:privateFunctions:completionHandler:", v45, &v43, &object, v13, v14, [a3 privateFunctions], a7))
  {
    uint64_t v15 = _MTLGetLibrariesCache((_MTLDevice *)self->super._device);
    name = self->super._name;
    if ([a3 specializedName]) {
      name = (NSString *)[a3 specializedName];
    }
    if (([a3 pipelineOptions] & 4) != 0 || (objc_msgSend(a3, "options") & 4) != 0) {
      int v17 = 2;
    }
    else {
      int v17 = ((unint64_t)[a3 pipelineOptions] >> 32) & 4;
    }
    MultiLevelCacheFactory::createFunctionCache((uint64_t)self->super._device, [a3 binaryArchives], (std::__shared_weak_count_vtbl *)a4, a5, *(void *)(v15 + 32), v17, &v40);
    v18 = [(_MTLFunction *)self libraryData];
    uint64_t v19 = (*(uint64_t (**)(void *))(*(void *)v18 + 304))(v18);
    uint64_t v20 = v40;
    __n128 v21 = MTLHashKey::MTLHashKey((uint64_t)&v44, (uint64_t)v45);
    uint64_t v22 = (*(uint64_t (**)(uint64_t, MTLHashKey *, uint64_t, __n128))(*(void *)v20 + 144))(v20, &v44, v19, v21);
    MTLHashKey::~MTLHashKey(&v44);
    if (objc_msgSend((id)objc_msgSend(a3, "binaryArchives"), "count"))
    {
      char v23 = (*(uint64_t (**)(uint64_t))(*(void *)v40 + 120))(v40);
      if (!v22)
      {
        if (v23)
        {
LABEL_33:
          dispatch_release(v43);
          int v25 = (*(uint64_t (**)(uint64_t))(*(void *)v40 + 120))(v40);
          v26 = "FS cache";
          if (v25) {
            v26 = "binary archive";
          }
          uint64_t v27 = [(id)objc_msgSend(NSString stringWithFormat:@"Failed to find specialized function \"%@\" in %s", name, v26, v39), "UTF8String"];
          if (v27)
          {
            v28 = (__CFString *)[NSString stringWithUTF8String:v27];
            if (!v28) {
              v28 = (__CFString *)[NSString stringWithCString:v27 encoding:1];
            }
          }
          else
          {
            v28 = @"empty error message";
          }
          uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v28 forKey:*MEMORY[0x1E4F28568]];
          v36 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLLibraryErrorDomain" code:5 userInfo:v35];
          if (object) {
            dispatch_release(object);
          }
          (*((void (**)(id, void, void *))a7 + 2))(a7, 0, v36);

          goto LABEL_45;
        }
LABEL_31:
        if (((*(uint64_t (**)(uint64_t))(*(void *)v40 + 24))(v40) & 1) == 0
          && !(*(unsigned int (**)(uint64_t))(*(void *)v40 + 32))(v40))
        {
          device = self->super._device;
          uint64_t v38 = _MTLGetMTLCompilerLLVMVersionForDevice(device);
          getCompilerConnectionManager(device, v38);
          operator new();
        }
        goto LABEL_33;
      }
    }
    else if (!v22)
    {
      goto LABEL_31;
    }
    if (*(void *)(v22 + 360))
    {
      if (object) {
        dispatch_release(object);
      }
      if (!a4) {
        goto LABEL_40;
      }
    }
    else
    {
      *(void *)(v22 + 360) = object;
      if (!a4)
      {
LABEL_40:
        [(_MTLFunctionInternal *)self storeTrackingDataWithDescriptor:a3 function:v22 variantHash:v45];
        (*((void (**)(id, uint64_t, void))a7 + 2))(a7, v22, 0);

        dispatch_release(v43);
LABEL_45:
        if (v41) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v41);
        }
        return;
      }
    }
    uint64_t v29 = (*(uint64_t (**)(void))(**(void **)(v22 + 48) + 128))(*(void *)(v22 + 48));
    id v30 = [(_MTLFunction *)self bitcodeData];
    v31 = dispatch_data_create((const void *)[v30 bytes], objc_msgSend(v30, "length"), 0, 0);
    v32 = [[MTLAirEntry alloc] initWithData:v29 bitcode:v31 airScript:*(void *)(v22 + 360)];
    dispatch_release(v31);
    uint64_t v33 = v40;
    __n128 v34 = MTLHashKey::MTLHashKey((uint64_t)&v44, (uint64_t)v45);
    (*(void (**)(uint64_t, MTLHashKey *, MTLAirEntry *, __n128))(*(void *)v33 + 112))(v33, &v44, v32, v34);
    MTLHashKey::~MTLHashKey(&v44);

    goto LABEL_40;
  }
}

- (BOOL)specializedFunctionHash:(id *)a3 requestData:(id *)a4 airScript:(id *)a5 constants:(id)a6 specializedName:(id)a7 privateFunctions:(id)a8 completionHandler:(id)a9
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  size_t size = 0;
  uint64_t v23 = 0;
  if (a6)
  {
    uint64_t v15 = (MTLFunctionConstantValues *)a6;
    id v16 = a6;
  }
  else
  {
    uint64_t v15 = objc_alloc_init(MTLFunctionConstantValues);
  }
  int v17 = (const void *)[(MTLFunctionConstantValues *)v15 serializedConstantDataForFunction:self dataSize:&size errorMessage:&v23];
  if (v17)
  {
    *a5 = (id)[(MTLFunctionConstantValues *)v15 newConstantScriptForFunction:self name:self->super._name specializedName:a7 errorMessage:&v23];

    *a4 = dispatch_data_create(v17, size, 0, (dispatch_block_t)*MEMORY[0x1E4F143F0]);
    createHashForType(15, v17, size, &self->_functionData.bitcodeHash, 0, a7, a8, (unsigned __int8 *)v24);
    long long v18 = v24[1];
    *(_OWORD *)a3->var0 = v24[0];
    *(_OWORD *)&a3->var0[16] = v18;
  }
  else
  {
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v23 forKey:*MEMORY[0x1E4F28568]];
    id v20 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLLibraryErrorDomain" code:3 userInfo:v19];

    (*((void (**)(id, void, id))a9 + 2))(a9, 0, v20);
  }
  return v17 != 0;
}

- (void)setFunctionConstantSpecializationHash:(id *)a3
{
  if (a3)
  {
    long long v3 = *(_OWORD *)&a3->var0[16];
    *(_OWORD *)self->super._functionConstantSpecializationHash.key = *(_OWORD *)a3->var0;
    *(_OWORD *)&self->super._functionConstantSpecializationHash.key[16] = v3;
  }
}

- (void)dealloc
{
  programObject = (MTLProgramObject *)self->_programObject;
  if (programObject)
  {
    MTLProgramObject::~MTLProgramObject(programObject);
    MEMORY[0x18530C140]();
    self->_programObject = 0;
  }

  functionInputs = self->_functionData.functionInputs;
  if (functionInputs) {
    dispatch_release(functionInputs);
  }
  precompiledOutput = self->super._precompiledOutput;
  if (precompiledOutput) {
    dispatch_release(precompiledOutput);
  }

  dispatch_release((dispatch_object_t)self->_functionQueue);
  self->_functionQueue = 0;
  airScript = self->_functionData.airScript;
  if (airScript) {
    dispatch_release(airScript);
  }
  reflectionData = self->super._reflectionData;
  if (reflectionData) {
    dispatch_release(reflectionData);
  }
  inheritedLibraryPath = self->_inheritedLibraryPath;
  if (inheritedLibraryPath) {

  }
  v9.receiver = self;
  v9.super_class = (Class)_MTLFunctionInternal;
  [(_MTLFunction *)&v9 dealloc];
}

- (id)inheritedLibraryPath
{
  return self->_inheritedLibraryPath;
}

- (void)setOptions:(unint64_t)a3
{
  self->super._options = a3;
}

- (id)precompiledOutput
{
  return self->super._precompiledOutput;
}

- (const)functionData
{
  return &self->_functionData;
}

- (unint64_t)patchType
{
  return *((unsigned char *)&self->_functionData + 105) & 3;
}

- (BOOL)needsFunctionConstantValues
{
  return objc_msgSend(-[_MTLFunctionInternal functionConstants](self, "functionConstants"), "count") != 0;
}

- (id)functionConstants
{
  if (!self->_publicMetadataInitialized) {
    [(_MTLFunctionInternal *)self initializePublicMetadata];
  }
  return self->super._functionConstants;
}

- (void)initializePublicMetadata
{
  long long v3 = (os_unfair_lock_s *)((char *)self->super._libraryData + 84);
  os_unfair_lock_lock(v3);
  if (!self->_publicMetadataInitialized)
  {
    (*(void (**)(void *, unint64_t, _MTLFunctionInternal *, uint64_t))(*(void *)self->super._libraryData
                                                                                      + 192))(self->super._libraryData, self->_functionData.publicArgumentsOffset, self, 1);
    self->_publicMetadataInitialized = 1;
  }

  os_unfair_lock_unlock(v3);
}

- (unint64_t)renderTargetArrayIndexType
{
  return self->_functionData.renderTargetArrayIndexType;
}

- (void)setFunctionConstants:(id)a3
{
  functionConstants = self->super._functionConstants;
  if (functionConstants != a3)
  {

    self->super._functionConstants = (NSArray *)a3;
  }
}

- (void)setVertexAttributes:(id)a3
{
  vertexAttributes = self->super._vertexAttributes;
  if (vertexAttributes != a3)
  {

    self->super._vertexAttributes = (NSArray *)a3;
  }
}

- (id)pluginData
{
  return self->_functionData.pluginData;
}

- (unint64_t)bitCodeFileSize
{
  return self->_functionData.bitCodeFileSize;
}

- (unint64_t)bitCodeOffset
{
  return self->_functionData.bitCodeOffset;
}

- (unsigned)bitcodeType
{
  return self->_functionData.bitcodeType;
}

- (id)bitcodeDataInternal
{
  size_t size = 0;
  uint64_t v7 = 0;
  int v3 = (*(uint64_t (**)(void *, unint64_t, unint64_t, uint64_t *, size_t *))(*(void *)self->super._libraryData
                                                                                                  + 200))(self->super._libraryData, [(_MTLFunctionInternal *)self bitCodeOffset], [(_MTLFunctionInternal *)self bitCodeFileSize], &v7, &size);
  id result = 0;
  if (v3)
  {
    v5 = malloc_type_malloc(size, 0xC82732BEuLL);
    (*(void (**)(void *, void *, uint64_t, size_t))(*(void *)self->super._libraryData + 208))(self->super._libraryData, v5, v7, size);
    if (v5) {
      return dispatch_data_create(v5, size, 0, (dispatch_block_t)*MEMORY[0x1E4F143F0]);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (const)bitCodeHash
{
  return (const $2772B1D07D29A72E8557B2574C0AE5C1 *)&self->_functionData.bitcodeHash;
}

- (_MTLFunctionInternal)initWithName:(id)a3 type:(unint64_t)a4 libraryData:(void *)a5 functionData:(MTLFunctionData *)a6 inheritedLibraryPath:(id)a7 device:(id)a8
{
  v19.receiver = self;
  v19.super_class = (Class)_MTLFunctionInternal;
  uint64_t v10 = [(_MTLFunction *)&v19 initWithName:a3 type:a4 libraryData:a5 device:a8];
  v10->_inheritedLibraryPath = (NSString *)[a7 copy];
  v10->_publicMetadataInitialized = 0;
  v10->_privateMetadataInitialized = 0;
  long long v11 = *(_OWORD *)&a6->publicArgumentsOffset;
  *(_OWORD *)&v10->_functionData.bitCodeOffset = *(_OWORD *)&a6->bitCodeOffset;
  *(_OWORD *)&v10->_functionData.publicArgumentsOffset = v11;
  long long v12 = *(_OWORD *)&a6->bitcodeHash.key[24];
  long long v14 = *(_OWORD *)&a6->sourceArchiveOffset;
  long long v13 = *(_OWORD *)&a6->airMajorVersion;
  *(_OWORD *)&v10->_functionData.bitcodeHash.key[8] = *(_OWORD *)&a6->bitcodeHash.key[8];
  *(_OWORD *)&v10->_functionData.bitcodeHash.key[24] = v12;
  *(_OWORD *)&v10->_functionData.sourceArchiveOffset = v14;
  *(_OWORD *)&v10->_functionData.airMajorVersion = v13;
  long long v15 = *(_OWORD *)&a6->baseFunctionHash.key[24];
  long long v17 = *(_OWORD *)&a6->pluginData;
  long long v16 = *(_OWORD *)&a6->functionInputs;
  *(_OWORD *)&v10->_functionData.baseFunctionHash.key[8] = *(_OWORD *)&a6->baseFunctionHash.key[8];
  *(_OWORD *)&v10->_functionData.baseFunctionHash.key[24] = v15;
  *(_OWORD *)&v10->_functionData.pluginData = v17;
  *(_OWORD *)&v10->_functionData.functionInputs = v16;
  v10->_programObject = 0;
  *(_OWORD *)v10->super._functionConstantSpecializationHash.key = 0u;
  *(_OWORD *)&v10->super._functionConstantSpecializationHash.key[16] = 0u;
  v10->_functionQueue = (OS_dispatch_queue *)dispatch_queue_create("function queue", 0);
  return v10;
}

- (_MTLFunctionInternal)initWithName:(id)a3 type:(unint64_t)a4 libraryData:(void *)a5 functionData:(MTLFunctionData *)a6 device:(id)a7
{
  return [(_MTLFunctionInternal *)self initWithName:a3 type:a4 libraryData:a5 functionData:a6 inheritedLibraryPath:0 device:a7];
}

- (id)specializationAirScript
{
  p_functionData = &self->_functionData;
  id result = self->_functionData.airScript;
  if (result)
  {
    size_t v5 = 0;
    buffer_ptr = 0;
    v4 = dispatch_data_create_map((dispatch_data_t)result, (const void **)&buffer_ptr, &v5);
    if (buffer_ptr && !strncmp((const char *)buffer_ptr + 4, "AIRC", 4uLL))
    {
      dispatch_release(v4);
      return p_functionData->airScript;
    }
    else
    {
      dispatch_release(v4);
      return 0;
    }
  }
  return result;
}

- (id)stitchingAirScript
{
  p_functionData = &self->_functionData;
  id result = self->_functionData.airScript;
  if (result)
  {
    size_t v5 = 0;
    buffer_ptr = 0;
    v4 = dispatch_data_create_map((dispatch_data_t)result, (const void **)&buffer_ptr, &v5);
    if (buffer_ptr && !strncmp((const char *)buffer_ptr + 4, "AIRS", 4uLL))
    {
      dispatch_release(v4);
      return p_functionData->airScript;
    }
    else
    {
      dispatch_release(v4);
      return 0;
    }
  }
  return result;
}

- (id)airScript
{
  return self->_functionData.airScript;
}

- (id)reflectionData
{
  id result = self->super._reflectionData;
  if (!result)
  {
    v4 = (os_unfair_lock_s *)((char *)self->super._libraryData + 84);
    os_unfair_lock_lock(v4);
    if (!self->super._reflectionData && self->_functionData.reflectionDataOffset != -1) {
      self->super._reflectionData = (OS_dispatch_data *)(*(uint64_t (**)(void *))(*(void *)self->super._libraryData
    }
                                                                                          + 152))(self->super._libraryData);
    os_unfair_lock_unlock(v4);
    return self->super._reflectionData;
  }
  return result;
}

- ($2772B1D07D29A72E8557B2574C0AE5C1)baseFunctionHash
{
  long long v3 = *(_OWORD *)&self[10].var0[24];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[10].var0[8];
  *(_OWORD *)&retstr->var0[16] = v3;
  return self;
}

- (void)setTrackingData:(shared_ptr<TrackingData>)a3
{
  p_trackingData = &self->_trackingData;
  size_t v5 = *(TrackingData **)a3.__ptr_;
  uint64_t v4 = *((void *)a3.__ptr_ + 1);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_trackingData.__cntrl_;
  p_trackingData->__ptr_ = v5;
  p_trackingData->__cntrl_ = (__shared_weak_count *)v4;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (SpecializedFunctionTrackingData)specializedFunctionTrackingData
{
  id result = [(_MTLFunctionInternal *)self specializationAirScript];
  if (result) {
    return (SpecializedFunctionTrackingData *)self->_trackingData.__ptr_;
  }
  return result;
}

- (void)stitchedLibraryTrackingData
{
  id result = [(_MTLFunctionInternal *)self stitchingAirScript];
  if (result) {
    return self->_trackingData.__ptr_;
  }
  return result;
}

- (void)programObject
{
  if (!self->_programObject) {
    operator new();
  }
  return self->_programObject;
}

- (id)importedSymbols
{
  id result = self->super._libraryData;
  if (result) {
    return (id)(*(uint64_t (**)(void))(*(void *)result + 64))();
  }
  return result;
}

- (id)importedLibraries
{
  id result = self->super._libraryData;
  if (result) {
    return (id)(*(uint64_t (**)(void))(*(void *)result + 72))();
  }
  return result;
}

- (void)setBitcodeType:(unsigned __int8)a3
{
}

- (void)setPluginData:(id)a3
{
}

- (int64_t)patchControlPointCount
{
  unint64_t v2 = *((unsigned __int8 *)&self->_functionData + 105);
  if (v2 > 0x83) {
    return -1;
  }
  else {
    return v2 >> 2;
  }
}

- (void)initializeStitchableFunctionMetadata
{
  functionQueue = self->_functionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60___MTLFunctionInternal_initializeStitchableFunctionMetadata__block_invoke;
  block[3] = &unk_1E521F9E8;
  block[4] = self;
  dispatch_sync(functionQueue, block);
}

- (id)vertexAttributes
{
  if (self->super._functionType != 1) {
    return 0;
  }
  if (!self->_publicMetadataInitialized) {
    [(_MTLFunctionInternal *)self initializePublicMetadata];
  }
  return self->super._vertexAttributes;
}

- (void)setReturnType:(id)a3
{
  MTLType *returnType;

  returnType = self->super._returnType;
  if (returnType != a3)
  {

    self->super._returnType = (MTLType *)a3;
  }
}

- (id)returnType
{
  if ([(_MTLFunction *)self functionType] == 5)
  {
    if (!self->_stitchableFunctionMetadataInitialized) {
      [(_MTLFunctionInternal *)self initializeStitchableFunctionMetadata];
    }
  }
  else if (!self->_publicMetadataInitialized)
  {
    [(_MTLFunctionInternal *)self initializePublicMetadata];
  }
  return self->super._returnType;
}

- (void)setArguments:(id)a3
{
  arguments = self->super._arguments;
  if (arguments != a3)
  {

    self->super._arguments = (NSArray *)a3;
  }
}

- (id)arguments
{
  if ([(_MTLFunction *)self functionType] == 5)
  {
    if (!self->_stitchableFunctionMetadataInitialized) {
      [(_MTLFunctionInternal *)self initializeStitchableFunctionMetadata];
    }
  }
  else if (!self->_publicMetadataInitialized)
  {
    [(_MTLFunctionInternal *)self initializePublicMetadata];
  }
  return self->super._arguments;
}

- (void)setPrecompiledOutput:(id)a3
{
  precompiledOutput = self->super._precompiledOutput;
  if (precompiledOutput) {
    dispatch_release(precompiledOutput);
  }
  self->super._precompiledOutput = (OS_dispatch_data *)a3;
  if (a3)
  {
    dispatch_retain((dispatch_object_t)a3);
  }
}

- (id)stageInputAttributes
{
  if ((self->super._functionType | 2) == 3 && !self->_publicMetadataInitialized) {
    [(_MTLFunctionInternal *)self initializePublicMetadata];
  }
  return self->super._vertexAttributes;
}

- (void)setStageInputAttributes:(id)a3
{
  vertexAttributes = self->super._vertexAttributes;
  if (vertexAttributes != a3)
  {

    self->super._vertexAttributes = (NSArray *)a3;
  }
}

- (unsigned)requiredLLVMVersion
{
  return _MTLGetMTLCompilerLLVMVersionForDevice(self->super._device);
}

- (unint64_t)sourceArchiveOffset
{
  return self->_functionData.sourceArchiveOffset;
}

- (void)setSourceArchiveOffset:(unint64_t)a3
{
  self->_functionData.sourceArchiveOffset = a3;
}

- (id)newFunctionWithPluginData:(id)a3 bitcodeType:(unsigned __int8)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v7 = *(_OWORD *)&self->_functionData.functionInputs;
  long long v18 = *(_OWORD *)&self->_functionData.pluginData;
  long long object = v7;
  long long v8 = *(_OWORD *)&self->_functionData.baseFunctionHash.key[24];
  long long v20 = *(_OWORD *)&self->_functionData.baseFunctionHash.key[8];
  long long v21 = v8;
  long long v9 = *(_OWORD *)&self->_functionData.airMajorVersion;
  v15[2] = *(_OWORD *)&self->_functionData.sourceArchiveOffset;
  v16[0] = v9;
  long long v10 = *(_OWORD *)&self->_functionData.bitcodeHash.key[24];
  v16[1] = *(_OWORD *)&self->_functionData.bitcodeHash.key[8];
  long long v17 = v10;
  long long v11 = *(_OWORD *)&self->_functionData.publicArgumentsOffset;
  v15[0] = *(_OWORD *)&self->_functionData.bitCodeOffset;
  v15[1] = v11;
  if ((void)object) {
    dispatch_retain((dispatch_object_t)object);
  }
  *(void *)&long long v18 = a3;
  BYTE8(v17) = a4;
  CC_SHA256_Init(&c);
  CC_SHA256_Update(&c, (char *)v16 + 8, 0x20u);
  long long v12 = (const void *)[(id)v18 bytes];
  CC_SHA256_Update(&c, v12, [(id)v18 length]);
  CC_SHA256_Final((unsigned __int8 *)v16 + 8, &c);
  return [[_MTLFunctionInternal alloc] initWithName:self->super._name type:self->super._functionType libraryData:self->super._libraryData functionData:v15 device:self->super._device];
}

- (void)initializePrivateMetadata
{
  long long v3 = (os_unfair_lock_s *)((char *)self->super._libraryData + 84);
  os_unfair_lock_lock(v3);
  if (!self->_privateMetadataInitialized)
  {
    (*(void (**)(void *, unint64_t, _MTLFunctionInternal *, void))(*(void *)self->super._libraryData
                                                                                     + 192))(self->super._libraryData, self->_functionData.privateArgumentsOffset, self, 0);
    self->_privateMetadataInitialized = 1;
  }

  os_unfair_lock_unlock(v3);
}

- (void)setFilePath:(id)a3
{
  filePath = self->_filePath;
  if (filePath != a3)
  {

    self->_filePath = (NSString *)[a3 copy];
  }
}

- (id)filePath
{
  if (!self->_privateMetadataInitialized && self->super._libraryData) {
    [(_MTLFunctionInternal *)self initializePrivateMetadata];
  }
  return self->_filePath;
}

- (void)initializeSourceArchive
{
  long long v3 = (os_unfair_lock_s *)((char *)self->super._libraryData + 84);
  os_unfair_lock_lock(v3);
  if (!self->_sourceArchiveMetadataInitialized)
  {
    unint64_t sourceArchiveOffset = self->_functionData.sourceArchiveOffset;
    if (sourceArchiveOffset != -1)
    {
      if (!self->_privateMetadataInitialized)
      {
        (*(void (**)(void *, unint64_t, _MTLFunctionInternal *, void))(*(void *)self->super._libraryData
                                                                                         + 192))(self->super._libraryData, self->_functionData.privateArgumentsOffset, self, 0);
        self->_privateMetadataInitialized = 1;
        unint64_t sourceArchiveOffset = self->_functionData.sourceArchiveOffset;
      }
      (*(void (**)(void *, unint64_t, _MTLFunctionInternal *, uint64_t))(*(void *)self->super._libraryData
                                                                                        + 192))(self->super._libraryData, sourceArchiveOffset, self, 2);
      self->_sourceArchiveMetadataInitialized = 1;
    }
  }

  os_unfair_lock_unlock(v3);
}

- (void)setUnpackedFilePath:(id)a3
{
  unpackedFilePath = self->super._unpackedFilePath;
  if (unpackedFilePath != a3)
  {

    self->super._unpackedFilePath = (NSString *)[a3 copy];
  }
}

- (id)unpackedFilePath
{
  if (!self->_sourceArchiveMetadataInitialized && self->super._libraryData) {
    [(_MTLFunctionInternal *)self initializeSourceArchive];
  }
  return self->super._unpackedFilePath;
}

- (void)setLineNumber:(int64_t)a3
{
  self->_lineNumber = a3;
}

- (int64_t)lineNumber
{
  if (!self->_privateMetadataInitialized && self->super._libraryData) {
    [(_MTLFunctionInternal *)self initializePrivateMetadata];
  }
  return self->_lineNumber;
}

- (void)setRelocations:(id)a3
{
  relocations = self->super._relocations;
  if (relocations != a3)
  {

    self->super._relocations = (NSArray *)[a3 copy];
  }
}

@end