@interface CIKernelLibrary
+ (id)cache;
+ (id)cachedLibraryWithURL:(id)a3 error:(id *)a4;
+ (id)coreImageDylibWithDevice:(id)a3;
+ (id)internalLibraryWithName:(id)a3 device:(id)a4;
+ (id)libraryWithData:(id)a3 error:(id *)a4;
+ (id)libraryWithSource:(id)a3 error:(id *)a4;
+ (id)libraryWithURL:(id)a3 error:(id *)a4;
+ (void)clearCache;
- (CIKernelLibrary)initWithData:(id)a3 error:(id *)a4;
- (CIKernelLibrary)initWithSource:(id)a3 error:(id *)a4;
- (CIKernelLibrary)initWithURL:(id)a3 error:(id *)a4;
- (NSString)mtl_source;
- (NSURL)url;
- (id)functionNames;
- (id)functionWithName:(id)a3;
- (id)newFunctionWithName:(id)a3;
- (id)newSpecializedFunctionWithDescriptor:(id)a3;
- (id)newSpecializedFunctionWithName:(id)a3 constants:(void *)a4;
- (unint64_t)digest;
- (unint64_t)functionCount;
- (void)dealloc;
- (void)initFunctionNames;
@end

@implementation CIKernelLibrary

+ (id)internalLibraryWithName:(id)a3 device:(id)a4
{
  id result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "URLForResource:withExtension:", a3, @"metallib");
  if (result)
  {
    return (id)[a4 newLibraryWithURL:result error:0];
  }
  return result;
}

+ (id)libraryWithData:(id)a3 error:(id *)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithData:a3 error:a4];

  return v4;
}

+ (id)libraryWithURL:(id)a3 error:(id *)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithURL:a3 error:a4];

  return v4;
}

+ (id)cache
{
  if (+[CIKernelLibrary cache]::onceToken != -1) {
    dispatch_once(&+[CIKernelLibrary cache]::onceToken, &__block_literal_global_88);
  }
  return (id)+[CIKernelLibrary cache]::cache;
}

id __24__CIKernelLibrary_cache__block_invoke()
{
  id result = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  +[CIKernelLibrary cache]::cache = (uint64_t)result;
  return result;
}

+ (void)clearCache
{
  v2 = (void *)[a1 cache];
  objc_sync_enter(v2);
  [v2 removeAllObjects];

  objc_sync_exit(v2);
}

+ (id)cachedLibraryWithURL:(id)a3 error:(id *)a4
{
  v7 = (void *)[a1 cache];
  uint64_t v8 = [a3 absoluteString];
  objc_sync_enter(v7);
  v9 = (void *)[v7 objectForKey:v8];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    v15 = 0;
    id v12 = (id)[objc_alloc((Class)a1) initWithURL:a3 error:&v15];
    if (v12) {
      v10 = v12;
    }
    else {
      v10 = v15;
    }
    if (!v10) {
      v10 = (void *)[MEMORY[0x1E4F1CA98] null];
    }
    [v7 setObject:v10 forKey:v8];
  }
  objc_sync_exit(v7);
  if (v10 == (void *)[MEMORY[0x1E4F1CA98] null]) {
    return 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v10;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id result = 0;
  if (a4)
  {
    if (isKindOfClass)
    {
      id result = 0;
      *a4 = v10;
    }
  }
  return result;
}

+ (id)libraryWithSource:(id)a3 error:(id *)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithSource:a3 error:a4];

  return v4;
}

- (CIKernelLibrary)initWithSource:(id)a3 error:(id *)a4
{
  v31[2] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)CIKernelLibrary;
  v6 = [(CIKernelLibrary *)&v22 init];
  v6->_harvest_for_this_library = 1;
  v6->_mtl_source = (NSString *)a3;
  id v7 = CIMetalCopyDefaultDevice();
  if (CIMetalDeviceIsSupported(v7, v8))
  {
    uint64_t v23 = 0;
    v9 = objc_opt_new();
    [v9 setLibraryType:0];
    [v9 setCompileTimeStatisticsEnabled:1];
    [v9 setLanguageVersion:196608];
    [v9 setAdditionalCompilerArguments:@"-w -D__CIKERNEL_METAL_VERSION__=300 -D_BUILDING_CORE_IMAGE_LIB_ -D__BUILDING_RUNTIME_COMPILE_HEADER__"];
    if (newMTLLibraryWithSource(objc_object  {objcproto9MTLDevice}*,NSString *,NSError **)::onceToken != -1) {
      dispatch_once(&newMTLLibraryWithSource(objc_object  {objcproto9MTLDevice}*,NSString *,NSError **)::onceToken, &__block_literal_global_111);
    }
    v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"\\\\\\n", 0, 0), "stringByReplacingMatchesInString:options:range:withTemplate:", a3, 0, 0, objc_msgSend(a3, "length"), &stru_1EE465CC0);
    uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"#[ \\t]*(include|import)[ \\t]+(<|\")CoreImage/\\w+.h(\"|>)", 0, 0), "stringByReplacingMatchesInString:options:range:withTemplate:", v10, 0, 0, objc_msgSend(v10, "length"), &stru_1EE465CC0);
    uint64_t v12 = objc_msgSend(v7, "newLibraryWithSource:options:error:", objc_msgSend((id)newMTLLibraryWithSource(objc_object  {objcproto9MTLDevice}*,NSString *,NSError **)::_runtime_header, "stringByAppendingString:", v11), v9, &v23);

    if (v12)
    {
      v6->_library = (MTLLibrary *)v12;
      [(CIKernelLibrary *)v6 initFunctionNames];
      goto LABEL_19;
    }
    v14 = (void *)MEMORY[0x1E4F28C58];
    v15 = (uint64_t *)MEMORY[0x1E4F28A50];
    if (v23)
    {
      uint64_t v16 = *MEMORY[0x1E4F28A50];
      v31[0] = @"CINonLocalizedDescriptionKey";
      v31[1] = v16;
      v24[0].i64[0] = @"Failed compiling provided Metal source, could not initialize kernel library";
      v24[0].i64[1] = v23;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v31 count:2];
    }
    else
    {
      v29 = @"CINonLocalizedDescriptionKey";
      v30 = @"Failed compiling provided Metal source, could not initialize kernel library";
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    }
    uint64_t v18 = [v14 errorWithDomain:@"CIKernelLibrary" code:3 userInfo:v17];
    v19 = ci_logger_compile();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = v23;
      _os_log_impl(&dword_193671000, v19, OS_LOG_TYPE_INFO, "Could not initialize kernel library with Metal source: %{public}@", buf, 0xCu);
    }
    v6->_library = 0;
    if (a4 && v18)
    {
      uint64_t v20 = *v15;
      v25[0] = @"CINonLocalizedDescriptionKey";
      v25[1] = v20;
      v26[0] = @"Could not initialize kernel library.";
      v26[1] = v18;
      v13 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CIKernelLibrary", 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v26, v25, 2));
    }
    else
    {
      if (!a4) {
        goto LABEL_19;
      }
      v13 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CIKernelLibrary" code:1 userInfo:&unk_1EE4AB450];
    }
  }
  else
  {
    if (!a4) {
      goto LABEL_19;
    }
    v13 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CIKernelLibrary" code:1 userInfo:&unk_1EE4AB478];
  }
  *a4 = v13;
LABEL_19:

  if (v6->_library)
  {
    XXH64_reset(v24, 0);
    CI::XXHashHelper::addstr((uint64_t)v24, (char *)[a3 UTF8String]);
    v6->_digest = XXH64_digest((uint64_t)v24);
  }
  else
  {

    return 0;
  }
  return v6;
}

- (CIKernelLibrary)initWithData:(id)a3 error:(id *)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)CIKernelLibrary;
  v6 = [(CIKernelLibrary *)&v20 init];
  v6->_harvest_for_this_library = 1;
  id v7 = a3;
  uint64_t v8 = (const void *)[a3 bytes];
  size_t v9 = [a3 length];
  destructor[0] = MEMORY[0x1E4F143A8];
  destructor[1] = 3221225472;
  destructor[2] = __38__CIKernelLibrary_initWithData_error___block_invoke;
  destructor[3] = &unk_1E5771BE8;
  destructor[4] = a3;
  v6->_data = (OS_dispatch_data *)dispatch_data_create(v8, v9, 0, destructor);
  id v10 = CIMetalCopyDefaultDevice();
  if (CIMetalDeviceIsSupported(v10, v11))
  {
    v18[0].i64[0] = 0;
    uint64_t v12 = [v10 newLibraryWithData:v6->_data error:v18];
    v6->_library = (MTLLibrary *)v12;
    if (v12)
    {
      [(CIKernelLibrary *)v6 initFunctionNames];
      goto LABEL_12;
    }
    if (a4 && v18[0].i64[0])
    {
      uint64_t v14 = *MEMORY[0x1E4F28A50];
      v21[0] = @"CINonLocalizedDescriptionKey";
      v21[1] = v14;
      v22[0] = @"Could not initialize kernel library.";
      v22[1] = v18[0].i64[0];
      v13 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CIKernelLibrary", 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
    }
    else
    {
      if (!a4) {
        goto LABEL_12;
      }
      v13 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CIKernelLibrary" code:1 userInfo:&unk_1EE4AB4A0];
    }
  }
  else
  {
    if (!a4) {
      goto LABEL_12;
    }
    v13 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CIKernelLibrary" code:1 userInfo:&unk_1EE4AB4C8];
  }
  *a4 = v13;
LABEL_12:

  if (v6->_library)
  {
    XXH64_reset(v18, 0);
    v15 = (char *)[a3 bytes];
    size_t v16 = [a3 length];
    if (v15 && v16) {
      XXH64_update((uint64_t)v18, v15, v16);
    }
    v6->_digest = XXH64_digest((uint64_t)v18);
  }
  else
  {

    return 0;
  }
  return v6;
}

void __38__CIKernelLibrary_initWithData_error___block_invoke(uint64_t a1)
{
}

- (CIKernelLibrary)initWithURL:(id)a3 error:(id *)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)CIKernelLibrary;
  v6 = [(CIKernelLibrary *)&v17 init];
  v6->_harvest_for_this_library = 1;
  v6->_url = (NSURL *)a3;
  id v7 = CIMetalCopyDefaultDevice();
  if (CIMetalDeviceIsSupported(v7, v8))
  {
    v16[0].i64[0] = 0;
    uint64_t v9 = [v7 newLibraryWithURL:a3 error:v16];
    v6->_library = (MTLLibrary *)v9;
    if (v9)
    {
      [(CIKernelLibrary *)v6 initFunctionNames];
      goto LABEL_12;
    }
    if (a4 && v16[0].i64[0])
    {
      uint64_t v11 = *MEMORY[0x1E4F28A50];
      v18[0] = @"CINonLocalizedDescriptionKey";
      v18[1] = v11;
      v19[0] = @"Could not initialize kernel library.";
      v19[1] = v16[0].i64[0];
      id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CIKernelLibrary", 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
    }
    else
    {
      if (!a4) {
        goto LABEL_12;
      }
      id v10 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CIKernelLibrary" code:1 userInfo:&unk_1EE4AB4F0];
    }
  }
  else
  {
    if (!a4) {
      goto LABEL_12;
    }
    id v10 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CIKernelLibrary" code:1 userInfo:&unk_1EE4AB518];
  }
  *a4 = v10;
LABEL_12:

  if (v6->_library)
  {
    XXH64_reset(v16, 0);
    CI::XXHashHelper::add((CI::XXHashHelper *)v16, (CFStringRef)[a3 absoluteString]);
    v6->_digest = XXH64_digest((uint64_t)v16);
    if (CI_HARVESTING_SPECIFIC_LIBRARY_LIST())
    {
      int v12 = objc_msgSend((id)objc_msgSend(NSString, "stringWithCString:encoding:", CI_HARVESTING_SPECIFIC_LIBRARY_LIST(), 1), "containsString:", -[NSURL lastPathComponent](v6->_url, "lastPathComponent"));
      int v13 = CI_HARVEST_BIN_ARCHIVE_PROGRAM_TYPE() == 3 ? v12 : 1;
      if (v13 != 1 || (CI_HARVEST_BIN_ARCHIVE_PROGRAM_TYPE() == 4 ? (int v14 = v12) : (int v14 = 0), v14 == 1)) {
        v6->_harvest_for_this_library = 0;
      }
    }
  }
  else
  {

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  data = self->_data;
  if (data) {
    dispatch_release(data);
  }
  extern_function_names = self->_extern_function_names;
  if (extern_function_names) {

  }
  stitchable_function_names = self->_stitchable_function_names;
  if (stitchable_function_names) {

  }
  v6.receiver = self;
  v6.super_class = (Class)CIKernelLibrary;
  [(CIKernelLibrary *)&v6 dealloc];
}

- (unint64_t)functionCount
{
  unint64_t result = objc_msgSend((id)-[MTLLibrary externFunctionNames](self->_library, "externFunctionNames"), "count");
  if (!result)
  {
    stitchable_function_names = self->_stitchable_function_names;
    return [(NSSet *)stitchable_function_names count];
  }
  return result;
}

- (id)functionNames
{
  v3 = (void *)[(MTLLibrary *)self->_library externFunctionNames];
  if ([v3 count]) {
    return v3;
  }
  library = self->_library;

  return (id)[(MTLLibrary *)library functionNames];
}

- (id)functionWithName:(id)a3
{
  BOOL v5 = -[NSSet containsObject:](self->_extern_function_names, "containsObject:");
  library = self->_library;
  if (v5) {
    id v7 = (void *)[(MTLLibrary *)library newExternFunctionWithName:a3];
  }
  else {
    id v7 = (void *)[(MTLLibrary *)library newFunctionWithName:a3];
  }

  return v7;
}

- (id)newFunctionWithName:(id)a3
{
  BOOL v5 = -[NSSet containsObject:](self->_extern_function_names, "containsObject:");
  library = self->_library;
  if (v5)
  {
    return (id)[(MTLLibrary *)library newExternFunctionWithName:a3];
  }
  else
  {
    return (id)[(MTLLibrary *)library newFunctionWithName:a3];
  }
}

- (id)newSpecializedFunctionWithDescriptor:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  if (self->_harvest_for_this_library
    && CI_HARVEST_BIN_ARCHIVE() == 1
    && CI_HARVEST_SPECIALIZED_MTL_FUNCTIONS())
  {
    BOOL v5 = CI_HARVEST_PROCESS_NAME_LIST();
    if (!v5) {
      goto LABEL_8;
    }
    *(void *)block = MEMORY[0x1E4F143A8];
    *(void *)&block[8] = 3221225472;
    *(void *)&block[16] = ___ZL26isHarvestingForThisProcessv_block_invoke;
    v21 = &__block_descriptor_40_e5_v8__0l;
    id v22 = v5;
    if (isHarvestingForThisProcess(void)::onceToken != -1) {
      dispatch_once(&isHarvestingForThisProcess(void)::onceToken, block);
    }
    if (isHarvestingForThisProcess(void)::isListed)
    {
LABEL_8:
      library = self->_library;
      id v7 = CIMetalCopyDefaultDevice();
      if ((CIMetalDeviceIsSupported(v7, v8) & 1) == 0) {
        -[CIKernelLibrary newSpecializedFunctionWithDescriptor:]();
      }
      uint64_t v9 = (void *)CIGetHarvestingBinaryArchiveDict((uint64_t)v7);
      uint64_t v10 = [v9 objectForKeyedSubscript:@"bin"];
      uint64_t v11 = [v9 objectForKeyedSubscript:@"queue"];
      *(void *)block = MEMORY[0x1E4F143A8];
      *(void *)&block[8] = 3221225472;
      *(void *)&block[16] = ___ZL37addSpecializedFunctionToBinaryArchiveP21MTLFunctionDescriptorPU21objcproto10MTLLibrary11objc_object_block_invoke;
      v21 = &unk_1E5772728;
      id v22 = a3;
      uint64_t v23 = v10;
      v24 = library;
      dispatch_sync(v11, block);
    }
  }
  if ((CI_LOG_BIN_ARCHIVE_MISS() & 4) != 0)
  {
    objc_msgSend(a3, "setOptions:", 4, 0);
    int v12 = (void *)[(MTLLibrary *)self->_library newFunctionWithDescriptor:a3 error:&v18];
    [a3 setOptions:0];
    if (v12) {
      return v12;
    }
    size_t v16 = ci_logger_compile();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = [a3 name];
      *(_DWORD *)block = 138543362;
      *(void *)&block[4] = v17;
      _os_log_impl(&dword_193671000, v16, OS_LOG_TYPE_INFO, "Failed finding %{public}@ stitchable function in the archive", block, 0xCu);
    }
  }
  int v12 = (void *)[(MTLLibrary *)self->_library newFunctionWithDescriptor:a3 error:&v19];
  if (v19)
  {
    int v13 = ci_logger_compile();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [a3 name];
      *(_DWORD *)block = 138543618;
      *(void *)&block[4] = v14;
      *(_WORD *)&block[12] = 2114;
      *(void *)&block[14] = v19;
      _os_log_impl(&dword_193671000, v13, OS_LOG_TYPE_INFO, "Failed creating %{public}@ function from library %{public}@", block, 0x16u);
    }
  }
  return v12;
}

- (id)newSpecializedFunctionWithName:(id)a3 constants:(void *)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  v4 = (void *)[(MTLLibrary *)self->_library newFunctionWithName:a3 constantValues:a4 error:&v7];
  if (v7)
  {
    BOOL v5 = ci_logger_compile();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_193671000, v5, OS_LOG_TYPE_INFO, "Failed creating function from library %{public}@", buf, 0xCu);
    }
  }
  return v4;
}

- (void)initFunctionNames
{
  self->_extern_function_names = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithArray:", -[MTLLibrary externFunctionNames](self->_library, "externFunctionNames"));
  self->_stitchable_function_names = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithArray:", -[MTLLibrary functionNames](self->_library, "functionNames"));
}

- (unint64_t)digest
{
  return self->_digest;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)mtl_source
{
  return self->_mtl_source;
}

+ (id)coreImageDylibWithDevice:(id)a3
{
  if (![a3 supportsDynamicLibraries]) {
    return 0;
  }
  BOOL v5 = objc_opt_new();
  objc_super v6 = (void *)[v5 temporaryDirectory];
  uint64_t v7 = [v6 URLByAppendingPathComponent:objc_msgSend(NSString, "stringWithFormat:", @"coreimage_%@", objc_msgSend(a3, "name"))];
  if (+[CIKernelLibrary(Internal) coreImageDylibWithDevice:]::once_token != -1) {
    dispatch_once(&+[CIKernelLibrary(Internal) coreImageDylibWithDevice:]::once_token, &__block_literal_global_96_0);
  }
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint64_t v14 = __Block_byref_object_copy__24;
  v15 = __Block_byref_object_dispose__24;
  uint64_t v16 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CIKernelLibrary_Internal__coreImageDylibWithDevice___block_invoke_98;
  block[3] = &unk_1E5774DE0;
  block[4] = v5;
  block[5] = v7;
  block[7] = a1;
  block[8] = &v11;
  block[6] = a3;
  dispatch_sync((dispatch_queue_t)+[CIKernelLibrary(Internal) coreImageDylibWithDevice:]::q, block);

  uint64_t v8 = (void *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

dispatch_queue_t __54__CIKernelLibrary_Internal__coreImageDylibWithDevice___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("CILoadCIDylibQ", v0);
  +[CIKernelLibrary(Internal) coreImageDylibWithDevice:]::q = (uint64_t)result;
  return result;
}

void __54__CIKernelLibrary_Internal__coreImageDylibWithDevice___block_invoke_98(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", objc_msgSend(*(id *)(a1 + 40), "path")))
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [*(id *)(a1 + 48) newDynamicLibraryWithURL:*(void *)(a1 + 40) error:&v9];
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      v2 = ci_logger_compile();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        uint64_t v3 = [*(id *)(a1 + 40) path];
        *(_DWORD *)buf = 138543618;
        uint64_t v11 = v3;
        __int16 v12 = 2114;
        uint64_t v13 = v9;
        _os_log_impl(&dword_193671000, v2, OS_LOG_TYPE_INFO, "Failed loading serialized CoreImage.metallib from %{public}@: %{public}@\n", buf, 0x16u);
      }
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), "URLForResource:withExtension:", @"CoreImage", @"metallib");
    BOOL v5 = (void *)v4;
    if (v4) {
      uint64_t v4 = [*(id *)(a1 + 48) newDynamicLibraryWithURL:v4 error:&v9];
    }
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v4;
    objc_super v6 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (v6)
    {
      [v6 serializeToURL:*(void *)(a1 + 40) error:&v9];
    }
    else
    {
      uint64_t v7 = ci_logger_compile();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = [v5 path];
        *(_DWORD *)buf = 138543618;
        uint64_t v11 = v8;
        __int16 v12 = 2114;
        uint64_t v13 = v9;
        _os_log_impl(&dword_193671000, v7, OS_LOG_TYPE_INFO, "Failed loading CoreImage.metallib from %{public}@: %{public}@\n", buf, 0x16u);
      }
    }
  }
}

- (void)newSpecializedFunctionWithDescriptor:.cold.1()
{
}

@end