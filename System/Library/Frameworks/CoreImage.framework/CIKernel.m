@interface CIKernel
+ (CIKernel)kernelWithFunctionName:(NSString *)name fromMetalLibraryData:(NSData *)data error:(NSError *)error;
+ (CIKernel)kernelWithFunctionName:(NSString *)name fromMetalLibraryData:(NSData *)data outputPixelFormat:(CIFormat)format error:(NSError *)error;
+ (CIKernel)kernelWithFunctionName:(id)a3 fromCIKernelLibrary:(id)a4 options:(id)a5 error:(id *)a6;
+ (CIKernel)kernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 constants:(id)a5 error:(id *)a6;
+ (CIKernel)kernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 error:(id *)a5;
+ (CIKernel)kernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 options:(id)a5 error:(id *)a6;
+ (CIKernel)kernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 outputPixelFormat:(int)a5 error:(id *)a6;
+ (CIKernel)kernelWithFunctionName:(id)a3 fromMetalLibraryData:(id)a4 constants:(id)a5 error:(id *)a6;
+ (CIKernel)kernelWithFunctionName:(id)a3 fromMetalLibraryData:(id)a4 options:(id)a5 error:(id *)a6;
+ (CIKernel)kernelWithFunctionName:(id)a3 fromMetalLibraryData:(id)a4 outputGroupSize:(CGSize)a5 error:(id *)a6;
+ (CIKernel)kernelWithInternalRepresentation:(const void *)a3;
+ (CIKernel)kernelWithString:(NSString *)string;
+ (CIKernel)kernelWithString:(id)a3 fromMetalLibraryData:(id)a4;
+ (NSArray)kernelNamesFromMetalLibraryData:(NSData *)data;
+ (NSArray)kernelsWithMetalString:(NSString *)source error:(NSError *)error;
+ (NSArray)kernelsWithString:(NSString *)string;
+ (id)SDOFV2MetalKernelNamed:(id)a3;
+ (id)SDOFV3MetalKernelNamed:(id)a3;
+ (id)cache;
+ (id)cacheKeyForFunctionName:(id)a3 fromCIKernelLibrary:(id)a4 options:(id)a5;
+ (id)cachedKernelWithFunctionName:(id)a3 fromCIKernelLibrary:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)cachedKernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 constants:(id)a5 error:(id *)a6;
+ (id)cachedKernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 error:(id *)a5;
+ (id)cachedKernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)cachedKernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 outputPixelFormat:(int)a5 error:(id *)a6;
+ (id)cachedKernelWithString:(id)a3;
+ (id)colorMatrixBiasKernel;
+ (id)internalCachedKernelWithString:(id)a3;
+ (id)kernelNamesFromMetalLibrary:(id)a3;
+ (id)kernelsWithString:(id)a3 andCIKernelLibrary:(id)a4 messageLog:(id)a5;
+ (id)kernelsWithString:(id)a3 fromMetalLibraryData:(id)a4;
+ (id)kernelsWithString:(id)a3 messageLog:(id)a4;
+ (void)clearCache;
- (BOOL)_isValidOutputPixelFormat:(int)a3;
- (BOOL)canReduceOutputChannels;
- (BOOL)perservesAlpha;
- (BOOL)preservesRange;
- (CGSize)outputGroupSize;
- (CIImage)applyWithExtent:(CGRect)extent roiCallback:(CIKernelROICallback)callback arguments:(NSArray *)args;
- (CIKernel)init;
- (CIKernel)initWithString:(id)a3;
- (NSString)name;
- (SEL)ROISelector;
- (id)_initInternalWithString:(id)a3;
- (id)_initWithInternalRepresentation:(void *)a3;
- (id)_initWithReflection:(CIKernelReflection *)a3;
- (id)_initWithReflection:(CIKernelReflection *)a3 constants:(id)a4 constantTypes:(id)a5;
- (id)_initWithString:(id)a3 andCIKernelLibrary:(id)a4 usingCruftCompatibility:(BOOL)a5 isInternal:(BOOL)a6;
- (id)applyWithExtent:(CGRect)a3 roiCallback:(id)a4 arguments:(id)a5 options:(id)a6;
- (id)debugDescription;
- (id)description;
- (id)parameters;
- (int)_outputFormatUsingDictionary:(id)a3 andKernel:(void *)a4;
- (int)outputFormat;
- (void)_internalRepresentation;
- (void)dealloc;
- (void)init;
- (void)setCanReduceOutputChannels:(BOOL)a3;
- (void)setOutputGroupSize:(CGSize)a3;
- (void)setPerservesAlpha:(BOOL)a3;
- (void)setPreservesRange:(BOOL)a3;
- (void)setROISelector:(SEL)method;
@end

@implementation CIKernel

- (int)_outputFormatUsingDictionary:(id)a3 andKernel:(void *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"kCIKernelOutputFormat"), "longValue");
  BOOL v7 = [(CIKernel *)self _isValidOutputPixelFormat:v6];
  int v8 = *((_DWORD *)a4 + 30);
  if (!v7 || v6 == 0)
  {
    if (!v8 || ![(CIKernel *)self _isValidOutputPixelFormat:*((unsigned int *)a4 + 30)]) {
      return 0;
    }
  }
  else
  {
    if (v8)
    {
      if (v8 != v6)
      {
        v11 = ci_logger_api();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = CI::name_for_format(v6);
          v13 = CI::name_for_format(*((_DWORD *)a4 + 30));
          int v14 = 136446466;
          v15 = v12;
          __int16 v16 = 2080;
          v17 = v13;
          _os_log_impl(&dword_193671000, v11, OS_LOG_TYPE_INFO, "Warning: specified a kernel attribute output format of %{public}s and apply option kCIKernelOutputFormat of %s. The former will be used.", (uint8_t *)&v14, 0x16u);
        }
      }
    }
    int v8 = v6;
  }
  if (v8 == 264) {
    return 266;
  }
  else {
    return v8;
  }
}

- (BOOL)_isValidOutputPixelFormat:(int)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = 0;
    while (dword_1939543B8[v4] != a3)
    {
      if (++v4 == 6)
      {
        v5 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:&stru_1EE465CC0];
        for (uint64_t i = 0; i != 6; ++i)
        {
          if (i * 4) {
            BOOL v7 = @", kCIFormat";
          }
          else {
            BOOL v7 = @"kCIFormat";
          }
          [v5 appendString:v7];
          objc_msgSend(v5, "appendString:", objc_msgSend(NSString, "stringWithUTF8String:", CI::name_for_format(dword_1939543B8[i])));
        }
        int v8 = ci_logger_api();
        BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
        if (v9)
        {
          int v11 = 136446466;
          v12 = CI::name_for_format(a3);
          __int16 v13 = 2112;
          int v14 = v5;
          _os_log_impl(&dword_193671000, v8, OS_LOG_TYPE_INFO, "kCIKernelOutputFormat value (%{public}s) is not supported.Use one of these formats instead: %@", (uint8_t *)&v11, 0x16u);
          LOBYTE(v9) = 0;
        }
        return v9;
      }
    }
  }
  LOBYTE(v9) = 1;
  return v9;
}

+ (CIKernel)kernelWithInternalRepresentation:(const void *)a3
{
  if ((*(unsigned int (**)(const void *, SEL))(*(void *)a3 + 16))(a3, a2) == 64)
  {
    int v4 = 1;
  }
  else if ((*(unsigned int (**)(const void *))(*(void *)a3 + 16))(a3) == 62)
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 3;
  }
  v5 = (void *)[KernelKindAlloc(v4) _initWithInternalRepresentation:a3];

  return (CIKernel *)v5;
}

- (id)_initWithInternalRepresentation:(void *)a3
{
  if (a3)
  {
    uint64_t v3 = (uint64_t)a3;
    v6.receiver = self;
    v6.super_class = (Class)CIKernel;
    int v4 = [(CIKernel *)&v6 init];
    if (v4)
    {
      if (*(unsigned char *)(v3 + 12)) {
        uint64_t v3 = CI::Object::ref(v3);
      }
      v4->_priv = (void *)v3;
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  priv = (CI::Object *)self->_priv;
  if (priv)
  {
    if (*((unsigned char *)priv + 12)) {
      CI::Object::unref(priv);
    }
    self->_priv = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CIKernel;
  [(CIKernel *)&v4 dealloc];
}

- (void)_internalRepresentation
{
  return self->_priv;
}

+ (id)cache
{
  if (+[CIKernel cache]::onceToken != -1) {
    dispatch_once(&+[CIKernel cache]::onceToken, &__block_literal_global_127_0);
  }
  return (id)+[CIKernel cache]::cache;
}

id __17__CIKernel_cache__block_invoke()
{
  id result = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  +[CIKernel cache]::cache = (uint64_t)result;
  return result;
}

+ (void)clearCache
{
  v2 = (void *)[a1 cache];
  objc_sync_enter(v2);
  [v2 removeAllObjects];
  objc_sync_exit(v2);

  +[CIKernelLibrary clearCache];
}

+ (id)cachedKernelWithString:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = [a1 description];
    _os_signpost_emit_with_name_impl(&dword_193671000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"cachedKernelWithString\", "%{public}@"", buf, 0xCu);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  int v14 = __35__CIKernel_cachedKernelWithString___block_invoke;
  uint64_t v15 = &unk_1E5771BE8;
  id v16 = a1;
  objc_super v6 = (void *)[a1 cache];
  objc_sync_enter(v6);
  BOOL v7 = (void *)[v6 objectForKey:a3];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v8 = (id)[objc_alloc((Class)a1) initWithString:a3];
    uint64_t v10 = (uint64_t)v8;
    if (!v8) {
      uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
    }
    [v6 setObject:v10 forKey:a3];
  }
  objc_sync_exit(v6);
  if (v8 == (id)[MEMORY[0x1E4F1CA98] null]) {
    int v11 = 0;
  }
  else {
    int v11 = v8;
  }
  v14((uint64_t)v13);
  return v11;
}

void __35__CIKernel_cachedKernelWithString___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = [*(id *)(a1 + 32) description];
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_193671000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"cachedKernelWithString\", "%{public}@"", (uint8_t *)&v4, 0xCu);
  }
}

+ (id)internalCachedKernelWithString:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = [a1 description];
    _os_signpost_emit_with_name_impl(&dword_193671000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"internalCachedKernelWithString\", "%{public}@"", buf, 0xCu);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v12 = __43__CIKernel_internalCachedKernelWithString___block_invoke;
  __int16 v13 = &unk_1E5771BE8;
  id v14 = a1;
  uint64_t v6 = (void *)[a1 cache];
  objc_sync_enter(v6);
  BOOL v7 = (void *)[v6 objectForKey:a3];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v8 = (id)[objc_alloc((Class)a1) _initInternalWithString:a3];
    [v6 setObject:v8 forKey:a3];
  }
  objc_sync_exit(v6);
  v12((uint64_t)v11);
  return v8;
}

void __43__CIKernel_internalCachedKernelWithString___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = [*(id *)(a1 + 32) description];
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_193671000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"internalCachedKernelWithString\", "%{public}@"", (uint8_t *)&v4, 0xCu);
  }
}

+ (id)cacheKeyForFunctionName:(id)a3 fromCIKernelLibrary:(id)a4 options:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  XXH64_reset(v21, 0);
  CI::XXHashHelper::addstr((uint64_t)v21, (char *)[a3 UTF8String]);
  uint64_t __src = [a4 digest];
  XXH64_update((uint64_t)v21, (char *)&__src, 8uLL);
  id v8 = (void *)[a5 objectForKeyedSubscript:@"kCIKernelFunctionConstants"];
  id v9 = objc_msgSend((id)objc_msgSend(v8, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        CFStringRef v13 = *(const __CFString **)(*((void *)&v17 + 1) + 8 * i);
        CI::XXHashHelper::add((CI::XXHashHelper *)v21, v13);
        CFNumberRef v14 = (const __CFNumber *)[v8 valueForKey:v13];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          CI::XXHashHelper::add((CI::XXHashHelper *)v21, v14);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            CI::XXHashHelper::add((CI::XXHashHelper *)v21, v14);
          }
        }
        CFNumberRef v15 = (const __CFNumber *)[v8 valueForKey:v13];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          CI::XXHashHelper::add((CI::XXHashHelper *)v21, v15);
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v10);
  }
  uint64_t __src = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"kCIKernelOutputFormat"), "longLongValue");
  XXH64_update((uint64_t)v21, (char *)&__src, 8uLL);
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%016llX", XXH64_digest((uint64_t)v21));
}

+ (id)cachedKernelWithFunctionName:(id)a3 fromCIKernelLibrary:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = [a1 description];
    _os_signpost_emit_with_name_impl(&dword_193671000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"cachedKernelWithFunctionName\", "%{public}@"", buf, 0xCu);
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  long long v20 = __75__CIKernel_cachedKernelWithFunctionName_fromCIKernelLibrary_options_error___block_invoke;
  v21 = &unk_1E5771BE8;
  id v22 = a1;
  v12 = (void *)[a1 cache];
  uint64_t v13 = [a1 cacheKeyForFunctionName:a3 fromCIKernelLibrary:a4 options:a5];
  objc_sync_enter(v12);
  CFNumberRef v14 = (void *)[v12 objectForKey:v13];
  CFNumberRef v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    *(void *)buf = 0;
    uint64_t v17 = [a1 kernelWithFunctionName:a3 fromCIKernelLibrary:a4 options:a5 error:buf];
    if (v17) {
      CFNumberRef v15 = (void *)v17;
    }
    else {
      CFNumberRef v15 = *(void **)buf;
    }
    if (!v15) {
      CFNumberRef v15 = (void *)[MEMORY[0x1E4F1CA98] null];
    }
    [v12 setObject:v15 forKey:v13];
  }
  objc_sync_exit(v12);
  if (v15 == (void *)[MEMORY[0x1E4F1CA98] null]) {
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (!((a6 == 0) | ((objc_opt_isKindOfClass() & 1) == 0))) {
      *a6 = v15;
    }
LABEL_15:
    CFNumberRef v15 = 0;
  }
  v20((uint64_t)v19);
  return v15;
}

void __75__CIKernel_cachedKernelWithFunctionName_fromCIKernelLibrary_options_error___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = [*(id *)(a1 + 32) description];
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_193671000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"cachedKernelWithFunctionName\", "%{public}@"", (uint8_t *)&v4, 0xCu);
  }
}

- (CIKernel)init
{
  uint64_t v3 = ci_logger_api();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    [(CIKernel *)v3 init];
  }
  return (CIKernel *)[(CIKernel *)self _initWithInternalRepresentation:0];
}

- (id)_initWithString:(id)a3 andCIKernelLibrary:(id)a4 usingCruftCompatibility:(BOOL)a5 isInternal:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  memset(v60, 0, sizeof(v60));
  long long v59 = 0u;
  memset(&v58[8], 0, 32);
  int64x2_t v61 = vdupq_n_s64(1uLL);
  __int16 v62 = 0;
  memset(&v57.var2, 0, 88);
  *(int64x2_t *)&v57.var10 = v61;
  *(_WORD *)&v57.var12 = 0;
  memset(&v56.var2, 0, 88);
  *(int64x2_t *)&v56.var10 = v61;
  *(_WORD *)&v56.var12 = 0;
  uint64_t v11 = newlocale(63, 0, 0);
  v12 = uselocale(v11);
  uint64_t Pool = fosl_filter_kernelpool_createPool();
  fosl_filter_kernelpool_addLibrary(Pool, (uint64_t)aCopyright2022A);
  if ((dyld_program_sdk_at_least() & 1) == 0
    && (dyld_program_sdk_at_least() & 1) == 0
    && !CI_DISABLE_CRUFT_COMPATABILITY()
    && v7)
  {
    a3 = (id)[a3 stringByReplacingOccurrencesOfString:@"__sampler" withString:@"sampler"];
  }
  fosl_filter_kernelpool_addString(Pool, [a3 UTF8String]);
  if (check_and_emit_compile_errors((NSString *)a3, Pool, 0))
  {
    CFNumberRef v14 = ci_logger_compile();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = [(id)objc_opt_class() description];
      -[CIKernel _initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:](v15, (uint8_t *)&buf, v14);
    }
    goto LABEL_18;
  }
  if (!fosl_filter_kernelpool_getNumKernels(Pool))
  {
    long long v18 = ci_logger_compile();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = [(id)objc_opt_class() description];
      -[CIKernel _initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:](v19, (uint8_t *)&buf, v18);
    }
LABEL_18:
    char v20 = 0;
    if (!Pool) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (!CIKernelReflection::reflect(&v57, Pool, 0, 0)) {
    goto LABEL_18;
  }
  if ((dyld_program_sdk_at_least() & 1) != 0 || dyld_program_sdk_at_least())
  {
    int var0 = v57.var0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & (var0 != 3)) == 1)
    {
      uint64_t v17 = ci_logger_compile();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[CIKernel _initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:]();
      }
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & (var0 != 2)) == 1)
    {
      v23 = ci_logger_compile();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[CIKernel _initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:].cold.4();
      }
      goto LABEL_18;
    }
  }
  if (!a4 && !v6)
  {
    if (!can_use_metal() || !CI_USE_MTL_DAG_FOR_CIKL_SRC()) {
      goto LABEL_42;
    }
    CIKLLibraryMaker::CIKLLibraryMaker((CIKLLibraryMaker *)&buf, Pool);
    a4 = *(id *)&buf.var0;
    CIKLLibraryMaker::~CIKLLibraryMaker(v24);
  }
  if (a4 && CIKernelReflection::reflect(&v56, (CIKernelLibrary *)a4, v57.var2, 0))
  {
    int v25 = v56.var0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & (v25 != 2)) == 1)
    {
      v26 = ci_logger_api();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[CIKernel _initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:].cold.6();
      }
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & (v25 != 3)) == 1)
    {
      v39 = ci_logger_api();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        -[CIKernel _initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:].cold.7();
      }
      goto LABEL_18;
    }
    CIKernelReflection::consolidate(&v57, &v56, (uint64_t)&buf);
    CIKernelReflection::operator=((uint64_t)v58, (uint64_t)&buf);
    CIKernelReflection::~CIKernelReflection(&buf);
    goto LABEL_43;
  }
LABEL_42:
  *(_OWORD *)v58 = *(_OWORD *)&v57.var0;
  *(_OWORD *)&v58[16] = *(_OWORD *)&v57.var3;
  std::vector<CI::KernelArgumentType>::__assign_with_size[abi:nn180100]<CI::KernelArgumentType*,CI::KernelArgumentType*>(&v58[32], (char *)v57.var5.var0, (uint64_t)v57.var5.var1, v57.var5.var1 - v57.var5.var0);
  std::vector<std::string>::__assign_with_size[abi:nn180100]<std::string*,std::string*>((std::vector<std::string> *)v60, (std::string *)v57.var6.var0, (long long *)v57.var6.var1, 0xAAAAAAAAAAAAAAABLL * (((char *)v57.var6.var1 - (char *)v57.var6.var0) >> 3));
  *(_OWORD *)&v60[24] = *(_OWORD *)&v57.var7;
  int64x2_t v61 = *(int64x2_t *)&v57.var10;
  __int16 v62 = *(_WORD *)&v57.var12;
LABEL_43:
  int v27 = *v57.var2;
  if (v6)
  {
    if (v27 != 95)
    {
      v28 = ci_logger_api();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[CIKernel _initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:].cold.5();
      }
    }
  }
  else if (v27 == 95)
  {
    v29 = ci_logger_api();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      buf.int var0 = 136446210;
      *(void *)&buf.var1 = v57.var2;
      _os_log_impl(&dword_193671000, v29, OS_LOG_TYPE_INFO, "WARNING: Client CIKL function name %{public}s must not start with '_'\n", (uint8_t *)&buf, 0xCu);
    }
  }
  int v30 = *(_DWORD *)v58;
  if (*(_DWORD *)v58 == 1) {
    goto LABEL_56;
  }
  if (*(_DWORD *)v58 == 2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_56;
    }
    int v30 = *(_DWORD *)v58;
  }
  if (v30 == 3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
LABEL_56:
      v48[0] = *(_OWORD *)v58;
      v48[1] = *(_OWORD *)&v58[16];
      __dst = 0;
      uint64_t v51 = 0;
      v49 = 0;
      v31 = *(const void **)&v58[32];
      int64_t v32 = v59 - *(void *)&v58[32];
      if ((void)v59 != *(void *)&v58[32])
      {
        std::vector<CI::KernelArgumentType>::__vallocate[abi:nn180100](&v49, v32 >> 2);
        v33 = (char *)__dst;
        memmove(__dst, v31, v32);
        __dst = &v33[4 * (v32 >> 2)];
      }
      memset(&v52, 0, sizeof(v52));
      std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(&v52, *(long long **)v60, *(long long **)&v60[8], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&v60[8] - *(void *)v60) >> 3));
      long long v53 = *(_OWORD *)&v60[24];
      int64x2_t v54 = v61;
      __int16 v55 = v62;
      self = [(CIKernel *)self _initWithReflection:v48];
      *(void *)&buf.int var0 = &v52;
      std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&buf);
      v34 = v49;
      if (v49)
      {
        __dst = v49;
LABEL_64:
        operator delete(v34);
        goto LABEL_65;
      }
      goto LABEL_65;
    }
  }

  id v35 = KernelKindAlloc(*(int *)v58);
  v40[0] = *(_OWORD *)v58;
  v40[1] = *(_OWORD *)&v58[16];
  v42 = 0;
  uint64_t v43 = 0;
  v41 = 0;
  v36 = *(const void **)&v58[32];
  int64_t v37 = v59 - *(void *)&v58[32];
  if ((void)v59 != *(void *)&v58[32])
  {
    std::vector<CI::KernelArgumentType>::__vallocate[abi:nn180100](&v41, v37 >> 2);
    v38 = (char *)v42;
    memmove(v42, v36, v37);
    v42 = &v38[4 * (v37 >> 2)];
  }
  memset(&v44, 0, sizeof(v44));
  std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(&v44, *(long long **)v60, *(long long **)&v60[8], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&v60[8] - *(void *)v60) >> 3));
  long long v45 = *(_OWORD *)&v60[24];
  int64x2_t v46 = v61;
  __int16 v47 = v62;
  self = (CIKernel *)[v35 _initWithReflection:v40];
  *(void *)&buf.int var0 = &v44;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&buf);
  v34 = v41;
  if (v41)
  {
    v42 = v41;
    goto LABEL_64;
  }
LABEL_65:
  char v20 = 1;
  if (Pool) {
LABEL_19:
  }
    fosl_filter_kernelpool_destroyPool(Pool);
LABEL_20:
  v21 = uselocale(v12);
  freelocale(v21);
  if ((v20 & 1) == 0)
  {

    self = 0;
  }
  p_var6 = &v56.var6;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&p_var6);
  if (v56.var5.var0)
  {
    v56.var5.var1 = v56.var5.var0;
    operator delete(v56.var5.var0);
  }
  *(void *)&v56.int var0 = &v57.var6;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v56);
  if (v57.var5.var0)
  {
    v57.var5.var1 = v57.var5.var0;
    operator delete(v57.var5.var0);
  }
  *(void *)&v57.int var0 = v60;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v57);
  if (*(void *)&v58[32])
  {
    *(void *)&long long v59 = *(void *)&v58[32];
    operator delete(*(void **)&v58[32]);
  }
  return self;
}

- (id)_initInternalWithString:(id)a3
{
  if (check_cikl_string((NSString *)a3, "-[CIKernel _initInternalWithString:]"))
  {
    return [(CIKernel *)self _initWithString:a3 andCIKernelLibrary:0 usingCruftCompatibility:0 isInternal:1];
  }
  else
  {

    return 0;
  }
}

- (id)_initWithReflection:(CIKernelReflection *)a3 constants:(id)a4 constantTypes:(id)a5
{
}

- (id)_initWithReflection:(CIKernelReflection *)a3
{
  long long v5 = *(_OWORD *)&a3->var3;
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v5;
  std::vector<CI::KernelArgumentType>::vector(__p, (uint64_t)&a3->var5);
  memset(&v11, 0, sizeof(v11));
  std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(&v11, (long long *)a3->var6.var0, (long long *)a3->var6.var1, 0xAAAAAAAAAAAAAAABLL * (((char *)a3->var6.var1 - (char *)a3->var6.var0) >> 3));
  long long v6 = *(_OWORD *)&a3->var10;
  long long v12 = *(_OWORD *)&a3->var7;
  long long v13 = v6;
  __int16 v14 = *(_WORD *)&a3->var12;
  id v7 = [(CIKernel *)self _initWithReflection:v9 constants:0 constantTypes:0];
  uint64_t v15 = &v11;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v15);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v7;
}

+ (id)kernelsWithString:(id)a3 andCIKernelLibrary:(id)a4 messageLog:(id)a5
{
  if (!check_cikl_string((NSString *)a3, "+[CIKernel kernelsWithString:andCIKernelLibrary:messageLog:]")) {
    return 0;
  }
  uint64_t v8 = newlocale(63, 0, 0);
  v38 = uselocale(v8);
  uint64_t Pool = fosl_filter_kernelpool_createPool();
  fosl_filter_kernelpool_addLibrary(Pool, (uint64_t)aCopyright2022A);
  fosl_filter_kernelpool_addString(Pool, [a3 UTF8String]);
  check_and_emit_compile_errors((NSString *)a3, Pool, (NSMutableArray *)a5);
  v42 = (void *)Pool;
  unsigned int NumKernels = fosl_filter_kernelpool_getNumKernels(Pool);
  std::string v11 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:NumKernels];
  if (!a4)
  {
    if (can_use_metal() && CI_USE_MTL_DAG_FOR_CIKL_SRC())
    {
      CIKLLibraryMaker::CIKLLibraryMaker((CIKLLibraryMaker *)&v81, (uint64_t)v42);
      a4 = *(id *)&v81.var0;
      CIKLLibraryMaker::~CIKLLibraryMaker(v12);
    }
    else
    {
      a4 = 0;
    }
  }
  if (NumKernels)
  {
    uint64_t v14 = 0;
    int64x2_t v41 = vdupq_n_s64(1uLL);
    id v39 = a4;
    unsigned int v40 = NumKernels;
    do
    {
      memset(&v81.var2, 0, 88);
      *(int64x2_t *)&v81.var10 = v41;
      *(_WORD *)&v81.var12 = 0;
      if (CIKernelReflection::reflect(&v81, (uint64_t)v42, v14, 0))
      {
        memset(&v80.var2, 0, 88);
        *(int64x2_t *)&v80.var10 = vdupq_n_s64(1uLL);
        *(_WORD *)&v80.var12 = 0;
        if (a4)
        {
          unsigned int NumKernels = v40;
          if (CIKernelReflection::reflect(&v80, (CIKernelLibrary *)a4, v81.var2, 0))
          {
            CIKernelReflection::consolidate(&v81, &v80, (uint64_t)v75);
            *(_OWORD *)&v81.int var0 = *(_OWORD *)v75;
            *(_OWORD *)&v81.var3 = *(_OWORD *)&v75[2];
            if (v81.var5.var0)
            {
              v81.var5.var1 = v81.var5.var0;
              operator delete(v81.var5.var0);
            }
            v81.var5 = *(vector<CI::KernelArgumentType, std::allocator<CI::KernelArgumentType>> *)&v75[4];
            memset(&v75[4], 0, 24);
            std::vector<std::string>::__vdeallocate((std::vector<std::string> *)&v81.var6);
            v81.var6 = v76;
            memset(&v76, 0, sizeof(v76));
            *(_OWORD *)&v81.var7 = v77;
            *(_OWORD *)&v81.var10 = v78;
            *(_WORD *)&v81.var12 = v79;
            v82 = &v76;
            std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v82);
            if (v75[4])
            {
              v75[5] = v75[4];
              operator delete((void *)v75[4]);
            }
          }
        }
        switch(v81.var0)
        {
          case 1:
            uint64_t v15 = [CIKernel alloc];
            v67[0] = *(_OWORD *)&v81.var0;
            v67[1] = *(_OWORD *)&v81.var3;
            __dst = 0;
            uint64_t v70 = 0;
            v68 = 0;
            int var0 = v81.var5.var0;
            int64_t v17 = (char *)v81.var5.var1 - (char *)v81.var5.var0;
            if (v81.var5.var1 != v81.var5.var0)
            {
              std::vector<CI::KernelArgumentType>::__vallocate[abi:nn180100](&v68, v17 >> 2);
              long long v18 = (char *)__dst;
              memmove(__dst, var0, v17);
              uint64_t v19 = &v18[4 * (v17 >> 2)];
              a4 = v39;
              __dst = v19;
            }
            memset(&v71, 0, sizeof(v71));
            std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(&v71, (long long *)v81.var6.var0, (long long *)v81.var6.var1, 0xAAAAAAAAAAAAAAABLL * (((char *)v81.var6.var1 - (char *)v81.var6.var0) >> 3));
            long long v72 = *(_OWORD *)&v81.var7;
            long long v73 = *(_OWORD *)&v81.var10;
            __int16 v74 = *(_WORD *)&v81.var12;
            objc_msgSend(v11, "addObject:", -[CIKernel _initWithReflection:](v15, "_initWithReflection:", v67));
            v75[0] = &v71;
            std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)v75);
            char v20 = v68;
            unsigned int NumKernels = v40;
            if (v68)
            {
              __dst = v68;
              goto LABEL_34;
            }
            break;
          case 2:
            v21 = [CIColorKernel alloc];
            v59[0] = *(_OWORD *)&v81.var0;
            v59[1] = *(_OWORD *)&v81.var3;
            int64x2_t v61 = 0;
            uint64_t v62 = 0;
            v60 = 0;
            id v22 = v81.var5.var0;
            int64_t v23 = (char *)v81.var5.var1 - (char *)v81.var5.var0;
            if (v81.var5.var1 != v81.var5.var0)
            {
              std::vector<CI::KernelArgumentType>::__vallocate[abi:nn180100](&v60, v23 >> 2);
              uint64_t v24 = (char *)v61;
              memmove(v61, v22, v23);
              int v25 = &v24[4 * (v23 >> 2)];
              a4 = v39;
              int64x2_t v61 = v25;
            }
            memset(&v63, 0, sizeof(v63));
            std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(&v63, (long long *)v81.var6.var0, (long long *)v81.var6.var1, 0xAAAAAAAAAAAAAAABLL * (((char *)v81.var6.var1 - (char *)v81.var6.var0) >> 3));
            long long v64 = *(_OWORD *)&v81.var7;
            long long v65 = *(_OWORD *)&v81.var10;
            __int16 v66 = *(_WORD *)&v81.var12;
            objc_msgSend(v11, "addObject:", -[CIKernel _initWithReflection:](v21, "_initWithReflection:", v59));
            v75[0] = &v63;
            std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)v75);
            char v20 = v60;
            unsigned int NumKernels = v40;
            if (v60)
            {
              int64x2_t v61 = v60;
              goto LABEL_34;
            }
            break;
          case 3:
            v26 = [CIWarpKernel alloc];
            v51[0] = *(_OWORD *)&v81.var0;
            v51[1] = *(_OWORD *)&v81.var3;
            long long v53 = 0;
            uint64_t v54 = 0;
            std::string v52 = 0;
            int v27 = v81.var5.var0;
            int64_t v28 = (char *)v81.var5.var1 - (char *)v81.var5.var0;
            if (v81.var5.var1 != v81.var5.var0)
            {
              std::vector<CI::KernelArgumentType>::__vallocate[abi:nn180100](&v52, v28 >> 2);
              v29 = (char *)v53;
              memmove(v53, v27, v28);
              int v30 = &v29[4 * (v28 >> 2)];
              a4 = v39;
              long long v53 = v30;
            }
            memset(&v55, 0, sizeof(v55));
            std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(&v55, (long long *)v81.var6.var0, (long long *)v81.var6.var1, 0xAAAAAAAAAAAAAAABLL * (((char *)v81.var6.var1 - (char *)v81.var6.var0) >> 3));
            long long v56 = *(_OWORD *)&v81.var7;
            long long v57 = *(_OWORD *)&v81.var10;
            __int16 v58 = *(_WORD *)&v81.var12;
            objc_msgSend(v11, "addObject:", -[CIKernel _initWithReflection:](v26, "_initWithReflection:", v51));
            v75[0] = &v55;
            std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)v75);
            char v20 = v52;
            unsigned int NumKernels = v40;
            if (v52)
            {
              long long v53 = v52;
              goto LABEL_34;
            }
            break;
          case 4:
            v31 = [CIBlendKernel alloc];
            v43[0] = *(_OWORD *)&v81.var0;
            v43[1] = *(_OWORD *)&v81.var3;
            long long v45 = 0;
            uint64_t v46 = 0;
            std::string v44 = 0;
            int64_t v32 = v81.var5.var0;
            int64_t v33 = (char *)v81.var5.var1 - (char *)v81.var5.var0;
            if (v81.var5.var1 != v81.var5.var0)
            {
              std::vector<CI::KernelArgumentType>::__vallocate[abi:nn180100](&v44, v33 >> 2);
              v34 = (char *)v45;
              memmove(v45, v32, v33);
              id v35 = &v34[4 * (v33 >> 2)];
              a4 = v39;
              long long v45 = v35;
            }
            memset(&v47, 0, sizeof(v47));
            std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(&v47, (long long *)v81.var6.var0, (long long *)v81.var6.var1, 0xAAAAAAAAAAAAAAABLL * (((char *)v81.var6.var1 - (char *)v81.var6.var0) >> 3));
            long long v48 = *(_OWORD *)&v81.var7;
            long long v49 = *(_OWORD *)&v81.var10;
            __int16 v50 = *(_WORD *)&v81.var12;
            objc_msgSend(v11, "addObject:", -[CIKernel _initWithReflection:](v31, "_initWithReflection:", v43, v38));
            v75[0] = &v47;
            std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)v75);
            char v20 = v44;
            unsigned int NumKernels = v40;
            if (v44)
            {
              long long v45 = v44;
LABEL_34:
              operator delete(v20);
            }
            break;
          default:
            break;
        }
        v75[0] = &v80.var6;
        std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)v75);
        if (v80.var5.var0)
        {
          v80.var5.var1 = v80.var5.var0;
          operator delete(v80.var5.var0);
        }
      }
      *(void *)&v80.int var0 = &v81.var6;
      std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v80);
      if (v81.var5.var0)
      {
        v81.var5.var1 = v81.var5.var0;
        operator delete(v81.var5.var0);
      }
      uint64_t v14 = (v14 + 1);
    }
    while (NumKernels != v14);
  }
  fosl_filter_kernelpool_destroyPool((uint64_t)v42);
  v36 = uselocale(v38);
  freelocale(v36);
  if (a4) {
    int64_t v37 = @"kernelsWithString_andMetalLibrary";
  }
  else {
    int64_t v37 = @"kernelsWithString";
  }
  CoreAnalytics(&cfstr_Cikernel.isa, &v37->isa, NumKernels);
  return v11;
}

+ (id)kernelsWithString:(id)a3 fromMetalLibraryData:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v7))
  {
    *(_DWORD *)CIKernelReflection buf = 138543362;
    uint64_t v15 = [a1 description];
    _os_signpost_emit_with_name_impl(&dword_193671000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelsWithString:fromMetalLibraryData\", "%{public}@"", buf, 0xCu);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  std::string v11 = __51__CIKernel_kernelsWithString_fromMetalLibraryData___block_invoke;
  long long v12 = &unk_1E5771BE8;
  id v13 = a1;
  if (check_cikl_string((NSString *)a3, "+[CIKernel kernelsWithString:fromMetalLibraryData:]")) {
    uint64_t v8 = objc_msgSend((id)objc_opt_class(), "kernelsWithString:andCIKernelLibrary:messageLog:", a3, +[CIKernelLibrary libraryWithData:error:](CIKernelLibrary, "libraryWithData:error:", a4, 0), 0);
  }
  else {
    uint64_t v8 = 0;
  }
  v11((uint64_t)v10);
  return v8;
}

void __51__CIKernel_kernelsWithString_fromMetalLibraryData___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = [*(id *)(a1 + 32) description];
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_193671000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelsWithString:fromMetalLibraryData\", "%{public}@"", (uint8_t *)&v4, 0xCu);
  }
}

+ (id)kernelsWithString:(id)a3 messageLog:(id)a4
{
  if (!check_cikl_string((NSString *)a3, "+[CIKernel kernelsWithString:messageLog:]")) {
    return 0;
  }
  uint64_t v6 = objc_opt_class();

  return (id)[v6 kernelsWithString:a3 andCIKernelLibrary:0 messageLog:a4];
}

+ (NSArray)kernelsWithString:(NSString *)string
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)CIKernelReflection buf = 138543362;
    uint64_t v13 = [a1 description];
    _os_signpost_emit_with_name_impl(&dword_193671000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelsWithString\", "%{public}@"", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  uint64_t v9 = __30__CIKernel_kernelsWithString___block_invoke;
  uint64_t v10 = &unk_1E5771BE8;
  id v11 = a1;
  if (check_cikl_string(string, "+[CIKernel kernelsWithString:]")) {
    uint64_t v6 = (NSArray *)[(id)objc_opt_class() kernelsWithString:string andCIKernelLibrary:0 messageLog:0];
  }
  else {
    uint64_t v6 = 0;
  }
  v9((uint64_t)v8);
  return v6;
}

void __30__CIKernel_kernelsWithString___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = [*(id *)(a1 + 32) description];
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_193671000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelsWithString\", "%{public}@"", (uint8_t *)&v4, 0xCu);
  }
}

+ (NSArray)kernelsWithMetalString:(NSString *)source error:(NSError *)error
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v7))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = [a1 description];
    _os_signpost_emit_with_name_impl(&dword_193671000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelsWithMetalString\", "%{public}@"", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v27 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v29 = __41__CIKernel_kernelsWithMetalString_error___block_invoke;
  int v30 = &unk_1E5771BE8;
  id v31 = a1;
  uint64_t v8 = +[CIKernelLibrary libraryWithSource:source error:&v27];
  uint64_t v9 = v8;
  if (!v8)
  {
    int64_t v17 = @"Cannot initialize a library with the provided Metal source";
    uint64_t v18 = 13;
    if (!error) {
      goto LABEL_25;
    }
LABEL_21:
    if (v27)
    {
      uint64_t v19 = *MEMORY[0x1E4F28A50];
      v33[0] = @"CINonLocalizedDescriptionKey";
      v33[1] = v19;
      *(void *)&long long buf = v17;
      *((void *)&buf + 1) = v27;
      uint64_t v20 = 2;
    }
    else
    {
      v33[0] = @"CINonLocalizedDescriptionKey";
      *(void *)&long long buf = v17;
      uint64_t v20 = 1;
    }
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:v33 count:v20];
    *error = (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CIKernel" code:v18 userInfo:v21];
    goto LABEL_25;
  }
  id v10 = [(CIKernelLibrary *)v8 functionNames];
  uint64_t v11 = [v10 count];
  if (!v11)
  {
    int64_t v17 = @"Cannot find a valid stitchable Metal function in the source";
    uint64_t v18 = 12;
    if (!error) {
      goto LABEL_25;
    }
    goto LABEL_21;
  }
  long long v12 = (NSArray *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v11];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v13 = [v10 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = +[CIKernel kernelWithFunctionName:*(void *)(*((void *)&v23 + 1) + 8 * i) fromCIKernelLibrary:v9 options:0 error:&v27];
        if (v16) {
          [(NSArray *)v12 addObject:v16];
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v13);
  }
  if (![(NSArray *)v12 count])
  {
    int64_t v17 = @"Cannot find a valid Metal function in the source";
    uint64_t v18 = 14;
    if (error) {
      goto LABEL_21;
    }
LABEL_25:
    long long v12 = 0;
    goto LABEL_26;
  }
  CoreAnalytics(&cfstr_Cikernel.isa, &cfstr_Kernelswithmet.isa, v11);
LABEL_26:
  v29((uint64_t)v28);
  return v12;
}

void __41__CIKernel_kernelsWithMetalString_error___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = [*(id *)(a1 + 32) description];
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_193671000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelsWithMetalString\", "%{public}@"", (uint8_t *)&v4, 0xCu);
  }
}

- (CIKernel)initWithString:(id)a3
{
  if (check_cikl_string((NSString *)a3, "-[CIKernel initWithString:]"))
  {
    return (CIKernel *)[(CIKernel *)self _initWithString:a3 andCIKernelLibrary:0 usingCruftCompatibility:1 isInternal:0];
  }
  else
  {

    return 0;
  }
}

+ (CIKernel)kernelWithString:(NSString *)string
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)long long buf = 138543362;
    uint64_t v14 = [a1 description];
    _os_signpost_emit_with_name_impl(&dword_193671000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithString\", "%{public}@"", buf, 0xCu);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  id v10 = __29__CIKernel_kernelWithString___block_invoke;
  uint64_t v11 = &unk_1E5771BE8;
  id v12 = a1;
  if (check_cikl_string(string, "+[CIKernel kernelWithString:]"))
  {
    uint64_t v6 = (CIKernel *)(id)[objc_alloc((Class)a1) initWithString:string];
    if (v6)
    {
      id v7 = (NSString *)[(id)objc_opt_class() description];
      CoreAnalytics(v7, &cfstr_Kernelwithstri.isa, 1);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  v10((uint64_t)v9);
  return v6;
}

void __29__CIKernel_kernelWithString___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = [*(id *)(a1 + 32) description];
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_193671000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithString\", "%{public}@"", (uint8_t *)&v4, 0xCu);
  }
}

+ (CIKernel)kernelWithString:(id)a3 fromMetalLibraryData:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v7))
  {
    *(_DWORD *)long long buf = 138543362;
    uint64_t v16 = [a1 description];
    _os_signpost_emit_with_name_impl(&dword_193671000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithString:fromMetalLibraryData\", "%{public}@"", buf, 0xCu);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v12 = __50__CIKernel_kernelWithString_fromMetalLibraryData___block_invoke;
  uint64_t v13 = &unk_1E5771BE8;
  id v14 = a1;
  if (check_cikl_string((NSString *)a3, "+[CIKernel kernelWithString:fromMetalLibraryData:]"))
  {
    if (a4) {
      uint64_t v8 = (CIKernel *)(id)objc_msgSend(objc_alloc((Class)a1), "_initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:", a3, +[CIKernelLibrary libraryWithData:error:](CIKernelLibrary, "libraryWithData:error:", a4, 0), 0, 0);
    }
    else {
      uint64_t v8 = (CIKernel *)[a1 kernelWithString:a3];
    }
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v12((uint64_t)v11);
  return v9;
}

void __50__CIKernel_kernelWithString_fromMetalLibraryData___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = [*(id *)(a1 + 32) description];
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_193671000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithString:fromMetalLibraryData\", "%{public}@"", (uint8_t *)&v4, 0xCu);
  }
}

+ (CIKernel)kernelWithFunctionName:(NSString *)name fromMetalLibraryData:(NSData *)data error:(NSError *)error
{
  uint64_t v8 = objc_opt_class();

  return (CIKernel *)[v8 kernelWithFunctionName:name fromMetalLibraryData:data options:0 error:error];
}

+ (CIKernel)kernelWithFunctionName:(NSString *)name fromMetalLibraryData:(NSData *)data outputPixelFormat:(CIFormat)format error:(NSError *)error
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = CI::format_modernize(*(uint64_t *)&format, (CI *)"+[CIKernel kernelWithFunctionName:fromMetalLibraryData:outputPixelFormat:error:]", (const char *)name);
  id v10 = objc_opt_class();
  id v12 = @"kCIKernelOutputFormat";
  v13[0] = [NSNumber numberWithInt:v9];
  return (CIKernel *)objc_msgSend(v10, "kernelWithFunctionName:fromMetalLibraryData:options:error:", name, data, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1), error);
}

+ (CIKernel)kernelWithFunctionName:(id)a3 fromMetalLibraryData:(id)a4 outputGroupSize:(CGSize)a5 error:(id *)a6
{
  uint64_t v6 = ci_logger_api();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    +[CIKernel kernelWithFunctionName:fromMetalLibraryData:outputGroupSize:error:](v6, v7, v8, v9, v10, v11, v12, v13);
  }
  return 0;
}

+ (CIKernel)kernelWithFunctionName:(id)a3 fromMetalLibraryData:(id)a4 constants:(id)a5 error:(id *)a6
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = @"kCIKernelFunctionConstants";
  v8[0] = a5;
  return (CIKernel *)objc_msgSend((id)objc_opt_class(), "kernelWithFunctionName:fromMetalLibraryData:options:error:", a3, a4, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1), a6);
}

+ (CIKernel)kernelWithFunctionName:(id)a3 fromMetalLibraryData:(id)a4 options:(id)a5 error:(id *)a6
{
  v35[2] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v11))
  {
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = [a1 description];
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = a3;
    _os_signpost_emit_with_name_impl(&dword_193671000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithFunctionName:fromMetalLibraryData\", "%{public}@ %{public}@"", buf, 0x16u);
  }
  uint64_t v28 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  int v30 = __70__CIKernel_kernelWithFunctionName_fromMetalLibraryData_options_error___block_invoke;
  id v31 = &unk_1E57710E0;
  id v32 = a1;
  id v33 = a3;
  uint64_t v12 = +[CIKernelLibrary libraryWithData:a4 error:&v28];
  if (v12)
  {
    uint64_t v13 = (CIKernel *)[(id)objc_opt_class() kernelWithFunctionName:a3 fromCIKernelLibrary:v12 options:a5 error:a6];
    if (v13)
    {
      char v14 = dyld_program_sdk_at_least();
      if (a6) {
        char v15 = v14;
      }
      else {
        char v15 = 1;
      }
      if ((v15 & 1) == 0) {
        *a6 = 0;
      }
    }
  }
  else
  {
    if (a6)
    {
      if (v28)
      {
        uint64_t v16 = *MEMORY[0x1E4F28A50];
        v35[0] = @"CINonLocalizedDescriptionKey";
        v35[1] = v16;
        *(void *)long long buf = @"Cannot initialize kernel with given library data.";
        *(void *)&buf[8] = v28;
        uint64_t v17 = 2;
      }
      else
      {
        v35[0] = @"CINonLocalizedDescriptionKey";
        *(void *)long long buf = @"Cannot initialize kernel with given library data.";
        uint64_t v17 = 1;
      }
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v35 count:v17];
      *a6 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"CIKernel" code:6 userInfo:v18];
    }
    uint64_t v19 = ci_logger_api();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[CIKernel kernelWithFunctionName:fromMetalLibraryData:options:error:](v19, v20, v21, v22, v23, v24, v25, v26);
    }
    uint64_t v13 = 0;
  }
  v30((uint64_t)v29);
  return v13;
}

void __70__CIKernel_kernelWithFunctionName_fromMetalLibraryData_options_error___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = [*(id *)(a1 + 32) description];
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_signpost_emit_with_name_impl(&dword_193671000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithFunctionName:fromMetalLibraryData\", "%{public}@ %{public}@"", (uint8_t *)&v5, 0x16u);
  }
}

+ (CIKernel)kernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 error:(id *)a5
{
  uint64_t v8 = objc_opt_class();

  return (CIKernel *)[v8 kernelWithFunctionName:a3 fromMetalLibrary:a4 options:0 error:a5];
}

+ (CIKernel)kernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 outputPixelFormat:(int)a5 error:(id *)a6
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = CI::format_modernize(*(uint64_t *)&a5, (CI *)"+[CIKernel kernelWithFunctionName:fromMetalLibrary:outputPixelFormat:error:]", (const char *)a3);
  uint64_t v10 = objc_opt_class();
  uint64_t v12 = @"kCIKernelOutputFormat";
  v13[0] = [NSNumber numberWithInt:v9];
  return (CIKernel *)objc_msgSend(v10, "kernelWithFunctionName:fromMetalLibrary:options:error:", a3, a4, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1), a6);
}

+ (CIKernel)kernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 constants:(id)a5 error:(id *)a6
{
  v8[1] = *MEMORY[0x1E4F143B8];
  __int16 v7 = @"kCIKernelFunctionConstants";
  v8[0] = a5;
  return (CIKernel *)objc_msgSend((id)objc_opt_class(), "kernelWithFunctionName:fromMetalLibrary:options:error:", a3, a4, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1), a6);
}

+ (CIKernel)kernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 options:(id)a5 error:(id *)a6
{
  void v33[2] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v11))
  {
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = [a1 description];
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = a3;
    _os_signpost_emit_with_name_impl(&dword_193671000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithFunctionName:fromMetalLibrary\", "%{public}@ %{public}@"", buf, 0x16u);
  }
  uint64_t v26 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  uint64_t v28 = __66__CIKernel_kernelWithFunctionName_fromMetalLibrary_options_error___block_invoke;
  v29 = &unk_1E57710E0;
  id v30 = a1;
  id v31 = a3;
  uint64_t v12 = +[CIKernelLibrary libraryWithURL:a4 error:&v26];
  if (v12)
  {
    uint64_t v13 = (CIKernel *)[(id)objc_opt_class() kernelWithFunctionName:a3 fromCIKernelLibrary:v12 options:a5 error:a6];
  }
  else
  {
    if (a6)
    {
      if (v26)
      {
        uint64_t v14 = *MEMORY[0x1E4F28A50];
        v33[0] = @"CINonLocalizedDescriptionKey";
        v33[1] = v14;
        *(void *)long long buf = @"Cannot initialize kernel with given library URL.";
        *(void *)&buf[8] = v26;
        uint64_t v15 = 2;
      }
      else
      {
        v33[0] = @"CINonLocalizedDescriptionKey";
        *(void *)long long buf = @"Cannot initialize kernel with given library URL.";
        uint64_t v15 = 1;
      }
      uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v33 count:v15];
      *a6 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"CIKernel" code:6 userInfo:v16];
    }
    uint64_t v17 = ci_logger_api();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[CIKernel kernelWithFunctionName:fromMetalLibrary:options:error:](v17, v18, v19, v20, v21, v22, v23, v24);
    }
    uint64_t v13 = 0;
  }
  v28((uint64_t)v27);
  return v13;
}

void __66__CIKernel_kernelWithFunctionName_fromMetalLibrary_options_error___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = [*(id *)(a1 + 32) description];
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_signpost_emit_with_name_impl(&dword_193671000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithFunctionName:fromMetalLibrary\", "%{public}@ %{public}@"", (uint8_t *)&v5, 0x16u);
  }
}

+ (id)cachedKernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 error:(id *)a5
{
  uint64_t v8 = objc_opt_class();

  return (id)[v8 cachedKernelWithFunctionName:a3 fromMetalLibrary:a4 options:0 error:a5];
}

+ (id)cachedKernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 outputPixelFormat:(int)a5 error:(id *)a6
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = CI::format_modernize(*(uint64_t *)&a5, (CI *)"+[CIKernel cachedKernelWithFunctionName:fromMetalLibrary:outputPixelFormat:error:]", (const char *)a3);
  uint64_t v10 = objc_opt_class();
  uint64_t v12 = @"kCIKernelOutputFormat";
  v13[0] = [NSNumber numberWithInt:v9];
  return (id)objc_msgSend(v10, "cachedKernelWithFunctionName:fromMetalLibrary:options:error:", a3, a4, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1), a6);
}

+ (id)cachedKernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 constants:(id)a5 error:(id *)a6
{
  v8[1] = *MEMORY[0x1E4F143B8];
  __int16 v7 = @"kCIKernelFunctionConstants";
  v8[0] = a5;
  return (id)objc_msgSend((id)objc_opt_class(), "cachedKernelWithFunctionName:fromMetalLibrary:options:error:", a3, a4, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1), a6);
}

+ (id)cachedKernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 options:(id)a5 error:(id *)a6
{
  void v33[2] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v11))
  {
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = [a1 description];
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = a3;
    _os_signpost_emit_with_name_impl(&dword_193671000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithFunctionName:fromMetalLibrary\", "%{public}@ %{public}@"", buf, 0x16u);
  }
  uint64_t v26 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  uint64_t v28 = __72__CIKernel_cachedKernelWithFunctionName_fromMetalLibrary_options_error___block_invoke;
  v29 = &unk_1E57710E0;
  id v30 = a1;
  id v31 = a3;
  id v12 = +[CIKernelLibrary cachedLibraryWithURL:a4 error:&v26];
  if (v12)
  {
    uint64_t v13 = (void *)[(id)objc_opt_class() cachedKernelWithFunctionName:a3 fromCIKernelLibrary:v12 options:a5 error:a6];
  }
  else
  {
    if (a6)
    {
      if (v26)
      {
        uint64_t v14 = *MEMORY[0x1E4F28A50];
        v33[0] = @"CINonLocalizedDescriptionKey";
        v33[1] = v14;
        *(void *)long long buf = @"Cannot initialize kernel with given library URL.";
        *(void *)&buf[8] = v26;
        uint64_t v15 = 2;
      }
      else
      {
        v33[0] = @"CINonLocalizedDescriptionKey";
        *(void *)long long buf = @"Cannot initialize kernel with given library URL.";
        uint64_t v15 = 1;
      }
      uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v33 count:v15];
      *a6 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"CIKernel" code:6 userInfo:v16];
    }
    uint64_t v17 = ci_logger_api();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[CIKernel cachedKernelWithFunctionName:fromMetalLibrary:options:error:](v17, v18, v19, v20, v21, v22, v23, v24);
    }
    uint64_t v13 = 0;
  }
  v28((uint64_t)v27);
  return v13;
}

void __72__CIKernel_cachedKernelWithFunctionName_fromMetalLibrary_options_error___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = [*(id *)(a1 + 32) description];
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_signpost_emit_with_name_impl(&dword_193671000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithFunctionName:fromMetalLibrary\", "%{public}@ %{public}@"", (uint8_t *)&v5, 0x16u);
  }
}

+ (CIKernel)kernelWithFunctionName:(id)a3 fromCIKernelLibrary:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (void *)[a5 objectForKeyedSubscript:@"kCIKernelFunctionConstants"];
  if (CI_ENABLE_METAL_DAG())
  {
    memset(&v129.var2, 0, 88);
    *(int64x2_t *)&v129.var10 = vdupq_n_s64(1uLL);
    *(_WORD *)&v129.var12 = 0;
    if (CIKernelReflection::reflect(&v129, (CIKernelLibrary *)a4, (char *)[a3 UTF8String], (NSError **)a6))
    {
      if (v10) {
        id obj = CIKernelReflection::reflectConstants(&v129);
      }
      else {
        id obj = 0;
      }
      uint64_t v20 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"kCIKernelOutputFormat"), "intValue");
      v129.var9 = CI::format_modernize(v20, (CI *)"+[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:]", v21);
      if (dyld_program_sdk_at_least())
      {
        uint64_t v22 = objc_opt_class();
        if (v22 == objc_opt_class()
          && v129.var0 == 2
          && (int *)((char *)v129.var5.var1 - (char *)v129.var5.var0) == (int *)8)
        {
          if ((int v23 = v129.var5.var0[1], *v129.var5.var0 == 8) && v23 == 8 || *v129.var5.var0 == 15 && v23 == 15) {
            v129.int var0 = 4;
          }
        }
        uint64_t v24 = objc_opt_class();
        if (v24 == objc_opt_class() && v129.var0 == 2)
        {
          CIKernelError(a6, 0xCu, &cfstr_CannotInitiali_3.isa);
          uint64_t v25 = ci_logger_api();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:](v25, v26, v27, v28, v29, v30, v31, v32);
          }
          goto LABEL_82;
        }
        uint64_t v33 = objc_opt_class();
        if (v33 == objc_opt_class() && v129.var0 == 3)
        {
          CIKernelError(a6, 0xDu, &cfstr_CannotInitiali_4.isa);
          v34 = ci_logger_api();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:](v34, v35, v36, v37, v38, v39, v40, v41);
          }
          goto LABEL_82;
        }
        uint64_t v42 = objc_opt_class();
        if (v42 == objc_opt_class() && v129.var0 == 1)
        {
          CIKernelError(a6, 0xEu, &cfstr_CannotInitiali_5.isa);
          uint64_t v43 = ci_logger_api();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
            +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:].cold.4(v43, v44, v45, v46, v47, v48, v49, v50);
          }
          goto LABEL_82;
        }
        uint64_t v51 = objc_opt_class();
        if (v51 == objc_opt_class() && v129.var0 == 1)
        {
          CIKernelError(a6, 0xFu, &cfstr_CannotInitiali_6.isa);
          std::string v52 = ci_logger_api();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
            +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:].cold.5(v52, v53, v54, v55, v56, v57, v58, v59);
          }
          goto LABEL_82;
        }
        uint64_t v60 = objc_opt_class();
        if (v60 == objc_opt_class() && v129.var0 == 1)
        {
          CIKernelError(a6, 0x10u, &cfstr_CannotInitiali_7.isa);
          int64x2_t v61 = ci_logger_api();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
            +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:].cold.6(v61, v62, v63, v64, v65, v66, v67, v68);
          }
          goto LABEL_82;
        }
        uint64_t v69 = objc_opt_class();
        if (v69 == objc_opt_class() && v129.var0 == 2)
        {
          CIKernelError(a6, 0x11u, &cfstr_CannotInitiali_8.isa);
          uint64_t v70 = ci_logger_api();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
            +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:].cold.7(v70, v71, v72, v73, v74, v75, v76, v77);
          }
          goto LABEL_82;
        }
        uint64_t v78 = objc_opt_class();
        if (v78 == objc_opt_class() && v129.var0 == 3)
        {
          CIKernelError(a6, 0x12u, &cfstr_CannotInitiali_9.isa);
          __int16 v79 = ci_logger_api();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
            +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:].cold.8(v79, v80, v81, v82, v83, v84, v85, v86);
          }
          goto LABEL_82;
        }
      }
      long long v127 = 0u;
      long long v128 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      uint64_t v87 = [obj countByEnumeratingWithState:&v125 objects:v132 count:16];
      if (v87)
      {
        uint64_t v88 = *(void *)v126;
        while (2)
        {
          uint64_t v89 = 0;
          do
          {
            if (*(void *)v126 != v88) {
              objc_enumerationMutation(obj);
            }
            uint64_t v90 = *(void *)(*((void *)&v125 + 1) + 8 * v89);
            v91 = (void *)[v10 objectForKey:v90];
            signed int v92 = objc_msgSend((id)objc_msgSend(obj, "objectForKeyedSubscript:", v90), "intValue");
            if (v92 > 0x35 || ((1 << v92) & 0x22222220010008) == 0)
            {
              if ((v92 - 57) <= 0xFFFFFFC9)
              {
                uint64_t v107 = v92;
                CIKernelError(a6, 8u, &cfstr_CannotInitiali_10.isa, v92);
                v108 = ci_logger_api();
                if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR)) {
                  +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:].cold.9(v107, v108, v109);
                }
                goto LABEL_82;
              }
              if (!v91)
              {
LABEL_78:
                CIKernelError(a6, 9u, &cfstr_CannotInitiali_11.isa, v90);
                v103 = ci_logger_api();
                if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR)) {
                  +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:]0();
                }
                goto LABEL_82;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_86;
              }
              long long v123 = 0u;
              long long v124 = 0u;
              long long v121 = 0u;
              long long v122 = 0u;
              uint64_t v94 = [v91 countByEnumeratingWithState:&v121 objects:v131 count:16];
              if (v94)
              {
                uint64_t v110 = v88;
                v111 = a6;
                uint64_t v95 = *(void *)v122;
                char v96 = 1;
                do
                {
                  for (uint64_t i = 0; i != v94; ++i)
                  {
                    if (*(void *)v122 != v95) {
                      objc_enumerationMutation(v91);
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0) {
                      char v96 = 0;
                    }
                  }
                  uint64_t v94 = [v91 countByEnumeratingWithState:&v121 objects:v131 count:16];
                }
                while (v94);
                a6 = v111;
                uint64_t v88 = v110;
                if ((v96 & 1) == 0)
                {
LABEL_86:
                  CIKernelError(a6, 0xBu, &cfstr_CannotInitiali_13.isa, v90);
                  v106 = ci_logger_api();
                  if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR)) {
                    +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:]1();
                  }
                  goto LABEL_82;
                }
              }
            }
            else
            {
              if (!v91) {
                goto LABEL_78;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                CIKernelError(a6, 0xAu, &cfstr_CannotInitiali_12.isa, v90);
                v104 = ci_logger_api();
                if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
                  +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:]2();
                }
                goto LABEL_82;
              }
            }
            ++v89;
          }
          while (v89 != v87);
          uint64_t v98 = [obj countByEnumeratingWithState:&v125 objects:v132 count:16];
          uint64_t v87 = v98;
          if (v98) {
            continue;
          }
          break;
        }
      }
      id v99 = KernelKindAlloc(v129.var0);
      v113[0] = *(_OWORD *)&v129.var0;
      v113[1] = *(_OWORD *)&v129.var3;
      __dst = 0;
      uint64_t v116 = 0;
      __p = 0;
      int var0 = v129.var5.var0;
      int64_t v101 = (char *)v129.var5.var1 - (char *)v129.var5.var0;
      if (v129.var5.var1 != v129.var5.var0)
      {
        std::vector<CI::KernelArgumentType>::__vallocate[abi:nn180100](&__p, v101 >> 2);
        v102 = (char *)__dst;
        memmove(__dst, var0, v101);
        __dst = &v102[4 * (v101 >> 2)];
      }
      memset(&v117, 0, sizeof(v117));
      std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(&v117, (long long *)v129.var6.var0, (long long *)v129.var6.var1, 0xAAAAAAAAAAAAAAABLL * (((char *)v129.var6.var1 - (char *)v129.var6.var0) >> 3));
      long long v118 = *(_OWORD *)&v129.var7;
      long long v119 = *(_OWORD *)&v129.var10;
      __int16 v120 = *(_WORD *)&v129.var12;
      uint64_t v19 = (CIKernel *)(id)[v99 _initWithReflection:v113 constants:v10 constantTypes:obj];
      p_var6 = (vector<std::string, std::allocator<std::string>> *)&v117;
      std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&p_var6);
      if (__p)
      {
        __dst = __p;
        operator delete(__p);
      }
      goto LABEL_83;
    }
LABEL_82:
    uint64_t v19 = 0;
LABEL_83:
    p_var6 = &v129.var6;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&p_var6);
    if (v129.var5.var0)
    {
      v129.var5.var1 = v129.var5.var0;
      operator delete(v129.var5.var0);
    }
    return v19;
  }
  CIKernelError(a6, 7u, &cfstr_CannotInitiali_2.isa);
  uint64_t v11 = ci_logger_api();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:](v11, v12, v13, v14, v15, v16, v17, v18);
  }
  return 0;
}

+ (NSArray)kernelNamesFromMetalLibraryData:(NSData *)data
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193671000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelNamesFromMetalLibraryData\", ", buf, 2u);
  }
  if (!data || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || ![(NSData *)data length])
  {
    __int16 v7 = ci_logger_api();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[CIKernel kernelNamesFromMetalLibraryData:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
    goto LABEL_10;
  }
  uint64_t v18 = 0;
  int v5 = +[CIKernelLibrary libraryWithData:data error:&v18];
  if (!v5)
  {
    uint64_t v16 = ci_logger_api();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      if (v18) {
        uint64_t v17 = (__CFString *)[NSString stringWithFormat:@" = %@", v18];
      }
      else {
        uint64_t v17 = &stru_1EE465CC0;
      }
      +[CIKernel kernelNamesFromMetalLibraryData:]((uint64_t)v17, buf);
    }
LABEL_10:
    uint64_t v6 = (NSArray *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
  uint64_t v6 = [(CIKernelLibrary *)v5 functionNames];
LABEL_11:
  __44__CIKernel_kernelNamesFromMetalLibraryData___block_invoke();
  return v6;
}

void __44__CIKernel_kernelNamesFromMetalLibraryData___block_invoke()
{
  v0 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_193671000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelNamesFromMetalLibraryData\", ", v1, 2u);
  }
}

+ (id)kernelNamesFromMetalLibrary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193671000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelNamesFromMetalLibrary\", ", buf, 2u);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v7 = ci_logger_api();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[CIKernel kernelNamesFromMetalLibrary:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
    goto LABEL_13;
  }
  uint64_t v18 = 0;
  int v5 = +[CIKernelLibrary libraryWithURL:a3 error:&v18];
  if (!v5)
  {
    uint64_t v15 = ci_logger_api();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      if (v18) {
        uint64_t v16 = (__CFString *)[NSString stringWithFormat:@" = %@", v18];
      }
      else {
        uint64_t v16 = &stru_1EE465CC0;
      }
      +[CIKernel kernelNamesFromMetalLibrary:]((uint64_t)v16, buf);
    }
LABEL_13:
    id v6 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_14;
  }
  id v6 = [(CIKernelLibrary *)v5 functionNames];
LABEL_14:
  __40__CIKernel_kernelNamesFromMetalLibrary___block_invoke();
  return v6;
}

void __40__CIKernel_kernelNamesFromMetalLibrary___block_invoke()
{
  v0 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_193671000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelNamesFromMetalLibrary\", ", v1, 2u);
  }
}

- (BOOL)perservesAlpha
{
  priv = (CI::Kernel *)self->_priv;
  return (int)CI::Kernel::num_image_arguments(priv) >= 1 && *((unsigned char *)priv + 162) != 0;
}

- (void)setPerservesAlpha:(BOOL)a3
{
  priv = (CI::Kernel *)self->_priv;
  if ((int)CI::Kernel::num_image_arguments(priv) >= 1)
  {
    CI::Kernel::set_preserves_alpha((uint64_t)priv, a3);
  }
}

- (BOOL)preservesRange
{
  priv = (CI::Kernel *)self->_priv;
  return (int)CI::Kernel::num_image_arguments(priv) >= 1 && *((unsigned char *)priv + 163) != 0;
}

- (void)setPreservesRange:(BOOL)a3
{
  priv = (CI::Kernel *)self->_priv;
  if ((int)CI::Kernel::num_image_arguments(priv) >= 1)
  {
    CI::Kernel::set_preserves_range((uint64_t)priv, a3);
  }
}

- (BOOL)canReduceOutputChannels
{
  priv = (CI::Kernel *)self->_priv;
  return (int)CI::Kernel::num_image_arguments(priv) >= 1 && *((unsigned char *)priv + 160) != 0;
}

- (void)setCanReduceOutputChannels:(BOOL)a3
{
  priv = (CI::Kernel *)self->_priv;
  if ((int)CI::Kernel::num_image_arguments(priv) >= 1)
  {
    CI::Kernel::set_can_reduce_output_channels((uint64_t)priv, a3);
  }
}

- (int)outputFormat
{
  return *((_DWORD *)self->_priv + 30);
}

- (CGSize)outputGroupSize
{
  priv = (unint64_t *)self->_priv;
  double v3 = (double)priv[16];
  double v4 = (double)priv[17];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setOutputGroupSize:(CGSize)a3
{
}

- (NSString)name
{
  priv = self->_priv;
  if (priv) {
    return (NSString *)[NSString stringWithUTF8String:priv[3]];
  }
  else {
    return 0;
  }
}

- (void)setROISelector:(SEL)method
{
  priv = self->_priv;
  double v4 = NSStringFromSelector(method);
  int v5 = &CI::print_graph_recursive<CI::Image,CI::ImageIndex,CI::Image::ImageStats>(__sFILE *,CI::Image const*,int,std::unordered_map<CI::ImageIndex,CI::Image::ImageStats> const&)::indent_str[64];
  {
    uint64_t v10 = v4;
    int v5 = CI::print_graph_recursive<CI::Image,CI::ImageIndex,CI::Image::ImageStats>(__sFILE *,CI::Image const*,int,std::unordered_map<CI::ImageIndex,CI::Image::ImageStats> const&)::indent_str
       + 64;
    int v8 = v7;
    double v4 = v10;
    if (v8)
    {
      uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      -[CIKernel setROISelector:]::queue = (uint64_t)dispatch_queue_create("CI::SetROISelectorQueue", v9);
      int v5 = CI::print_graph_recursive<CI::Image,CI::ImageIndex,CI::Image::ImageStats>(__sFILE *,CI::Image const*,int,std::unordered_map<CI::ImageIndex,CI::Image::ImageStats> const&)::indent_str
         + 64;
      double v4 = v10;
    }
  }
  id v6 = *((void *)v5 + 130);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__CIKernel_setROISelector___block_invoke;
  block[3] = &unk_1E5771C60;
  block[4] = v4;
  block[5] = priv;
  dispatch_sync(v6, block);
}

void __27__CIKernel_setROISelector___block_invoke(uint64_t a1)
{
}

- (SEL)ROISelector
{
  SEL result = (SEL)*((void *)self->_priv + 14);
  if (result) {
    return NSSelectorFromString((NSString *)result);
  }
  return result;
}

- (id)applyWithExtent:(CGRect)a3 roiCallback:(id)a4 arguments:(id)a5 options:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (CGRectIsEmpty(a3))
  {
    return +[CIImage emptyImage];
  }
  else
  {
    priv = self->_priv;
    int v11 = [a5 count];
    if (CI::Kernel::num_apply_arguments((CI::Kernel *)priv) == v11)
    {
      id v18 = a4;
      if (v11 < 1) {
LABEL_24:
      }
        operator new();
      uint64_t v12 = 0;
      while (1)
      {
        if (*((unsigned char *)priv + 12))
        {
          int type = CI::KernelArguments::get_type((CI::KernelArguments *)(priv + 18), v12);
        }
        else if (v12 >= *((int *)priv + 5))
        {
          int type = 0;
        }
        else
        {
          int type = *(_DWORD *)(priv[9] + 4 * v12);
        }
        if ((*(uint64_t (**)(void *))(*priv + 72))(priv)
          && !priv[4]
          && (type == 15 || type == 8)
          && (objc_msgSend(a5, "objectAtIndexedSubscript:", v12, v18),
              objc_opt_class(),
              (objc_opt_isKindOfClass() & 1) != 0))
        {
          CI::Kernel::set_argument_type(priv, v12, 1);
          CI::Kernel::set_half_color_inputs((uint64_t)priv, type == 15);
        }
        else if ((verify_argument_type(objc_msgSend(a5, "objectAtIndexedSubscript:", v12, v18), type, 0) & 1) == 0)
        {
          uint64_t v15 = ci_logger_api();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            uint64_t v16 = priv[3];
            uint64_t v17 = expected_argument_type(type);
            [a5 objectAtIndexedSubscript:v12];
            int __p = 136447234;
            __p_4 = "-[CIKernel applyWithExtent:roiCallback:arguments:options:]";
            __int16 v21 = 2082;
            uint64_t v22 = v16;
            __int16 v23 = 1024;
            int v24 = v12;
            __int16 v25 = 2082;
            uint64_t v26 = v17;
            __int16 v27 = 2114;
            uint64_t v28 = [(id)objc_opt_class() description];
            _os_log_error_impl(&dword_193671000, v15, OS_LOG_TYPE_ERROR, "%{public}s type mismatch for kernel '%{public}s' parameter %d. %{public}sGot %{public}@.", (uint8_t *)&__p, 0x30u);
          }
          return 0;
        }
        if (v11 == ++v12) {
          goto LABEL_24;
        }
      }
    }
    uint64_t v14 = ci_logger_api();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CIKernel applyWithExtent:roiCallback:arguments:options:]((CI::Kernel *)priv);
    }
    return 0;
  }
}

- (CIImage)applyWithExtent:(CGRect)extent roiCallback:(CIKernelROICallback)callback arguments:(NSArray *)args
{
  return (CIImage *)-[CIKernel applyWithExtent:roiCallback:arguments:options:](self, "applyWithExtent:roiCallback:arguments:options:", callback, args, 0, extent.origin.x, extent.origin.y, extent.size.width, extent.size.height);
}

+ (id)colorMatrixBiasKernel
{
  id v2 = [(CIKernel *)[CIColorKernel alloc] _initWithInternalRepresentation:&CI::_ci_colormatrix_canonical];

  return v2;
}

- (id)parameters
{
  v42[2] = *MEMORY[0x1E4F143B8];
  priv = (char *)self->_priv;
  int v3 = CI::Kernel::num_apply_arguments((CI::Kernel *)priv);
  double v4 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v3];
  if (v3 >= 1)
  {
    for (uint64_t i = 0; v3 != i; ++i)
    {
      if (priv[12])
      {
        int type = CI::KernelArguments::get_type((CI::KernelArguments *)(priv + 144), i);
        if (priv[12])
        {
          if (!CI::KernelArguments::get_name((CI::KernelArguments *)(priv + 144), i)) {
            goto LABEL_13;
          }
          goto LABEL_12;
        }
      }
      else if (i >= *((int *)priv + 5))
      {
        int type = 0;
      }
      else
      {
        int type = *(_DWORD *)(*((void *)priv + 9) + 4 * i);
      }
      if (i >= *((int *)priv + 5) || !*(void *)(*((void *)priv + 10) + 8 * i))
      {
LABEL_13:
        uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"_arg%d", i);
        goto LABEL_14;
      }
LABEL_12:
      uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:");
LABEL_14:
      switch(type)
      {
        case 1:
        case 2:
        case 3:
          v41[0] = @"CIAttributeClass";
          v41[1] = @"CIAttributeName";
          v42[0] = @"CISampler";
          v42[1] = v7;
          int v8 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v9 = v42;
          uint64_t v10 = (__CFString **)v41;
          goto LABEL_29;
        case 4:
          v39[0] = @"CIAttributeClass";
          v39[1] = @"CIAttributeName";
          v40[0] = @"Sampler2D";
          v40[1] = v7;
          int v8 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v9 = v40;
          uint64_t v10 = (__CFString **)v39;
          goto LABEL_29;
        case 5:
        case 12:
        case 19:
        case 23:
          v37[0] = @"CIAttributeClass";
          v37[1] = @"CIAttributeName";
          v38[0] = @"NSNumber";
          v38[1] = v7;
          int v8 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v9 = v38;
          uint64_t v10 = (__CFString **)v37;
          goto LABEL_29;
        case 6:
        case 13:
          v35[0] = @"CIAttributeClass";
          v35[1] = @"CIVectorSize";
          v36[0] = @"CIVector";
          v36[1] = &unk_1EE4AAA60;
          v35[2] = @"CIAttributeName";
          v36[2] = v7;
          int v8 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v9 = v36;
          uint64_t v10 = (__CFString **)v35;
          goto LABEL_31;
        case 7:
        case 14:
          v31[0] = @"CIAttributeClass";
          v31[1] = @"CIVectorSize";
          v32[0] = @"CIVector";
          v32[1] = &unk_1EE4AAA78;
          v31[2] = @"CIAttributeName";
          v32[2] = v7;
          int v8 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v9 = v32;
          uint64_t v10 = (__CFString **)v31;
          goto LABEL_31;
        case 8:
        case 15:
          v27[0] = @"CIAttributeClass";
          v27[1] = @"CIVectorSize";
          v28[0] = @"CIVector";
          v28[1] = &unk_1EE4AAA90;
          void v27[2] = @"CIAttributeName";
          void v28[2] = v7;
          int v8 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v9 = v28;
          uint64_t v10 = (__CFString **)v27;
          goto LABEL_31;
        case 9:
        case 16:
          v23[0] = @"CIAttributeClass";
          v23[1] = @"CIVectorSize";
          v24[0] = @"CIVector";
          v24[1] = &unk_1EE4AAA90;
          v23[2] = @"CIAttributeName";
          v24[2] = v7;
          int v8 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v9 = v24;
          uint64_t v10 = (__CFString **)v23;
          goto LABEL_31;
        case 10:
        case 17:
          v21[0] = @"CIAttributeClass";
          v21[1] = @"CIVectorSize";
          v22[0] = @"CIVector";
          v22[1] = &unk_1EE4AAAA8;
          v21[2] = @"CIAttributeName";
          v22[2] = v7;
          int v8 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v9 = v22;
          uint64_t v10 = (__CFString **)v21;
          goto LABEL_31;
        case 11:
        case 18:
          v19[0] = @"CIAttributeClass";
          v19[1] = @"CIVectorSize";
          v20[0] = @"CIVector";
          v20[1] = &unk_1EE4AAAC0;
          void v19[2] = @"CIAttributeName";
          v20[2] = v7;
          int v8 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v9 = v20;
          uint64_t v10 = (__CFString **)v19;
          goto LABEL_31;
        case 20:
        case 24:
          v33[0] = @"CIAttributeClass";
          v33[1] = @"NSArrayCount";
          v34[0] = @"NSArray";
          v34[1] = &unk_1EE4AAA60;
          void v33[2] = @"CIAttributeName";
          v34[2] = v7;
          int v8 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v9 = v34;
          uint64_t v10 = (__CFString **)v33;
          goto LABEL_31;
        case 21:
        case 25:
          v29[0] = @"CIAttributeClass";
          v29[1] = @"NSArrayCount";
          v30[0] = @"NSArray";
          v30[1] = &unk_1EE4AAA78;
          void v29[2] = @"CIAttributeName";
          v30[2] = v7;
          int v8 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v9 = v30;
          uint64_t v10 = (__CFString **)v29;
          goto LABEL_31;
        case 22:
        case 26:
          v25[0] = @"CIAttributeClass";
          v25[1] = @"NSArrayCount";
          v26[0] = @"NSArray";
          v26[1] = &unk_1EE4AAA90;
          v25[2] = @"CIAttributeName";
          v26[2] = v7;
          int v8 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v9 = v26;
          uint64_t v10 = (__CFString **)v25;
          goto LABEL_31;
        case 27:
          v17[0] = @"CIAttributeClass";
          v17[1] = @"CIVectorSize";
          v18[0] = @"CIColor";
          v18[1] = &unk_1EE4AAA90;
          v17[2] = @"CIAttributeName";
          v18[2] = v7;
          int v8 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v9 = v18;
          uint64_t v10 = (__CFString **)v17;
LABEL_31:
          uint64_t v11 = 3;
          break;
        case 28:
        case 29:
          v15[0] = @"CIAttributeClass";
          v15[1] = @"CIAttributeName";
          v16[0] = @"NSData";
          v16[1] = v7;
          int v8 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v9 = v16;
          uint64_t v10 = (__CFString **)v15;
LABEL_29:
          uint64_t v11 = 2;
          break;
        default:
          uint64_t v13 = @"CIAttributeName";
          uint64_t v14 = v7;
          int v8 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v9 = &v14;
          uint64_t v10 = &v13;
          uint64_t v11 = 1;
          break;
      }
      objc_msgSend(v4, "addObject:", objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, v11));
    }
  }
  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %s>", objc_msgSend((id)objc_opt_class(), "description"), *((void *)self->_priv + 3)];
}

- (id)debugDescription
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__CIKernel_debugDescription__block_invoke;
  v3[3] = &unk_1E5771158;
  v3[4] = self;
  return (id)(id)stream_to_string((uint64_t)v3);
}

uint64_t __28__CIKernel_debugDescription__block_invoke(uint64_t a1, FILE *a2)
{
  double v4 = *(unsigned int **)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = (*(uint64_t (**)(unsigned int *))(*(void *)v4 + 72))(v4);
  id v6 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
  fprintf(a2, "<%s: %p>", v6, *(const void **)(a1 + 32));
  if ([*(id *)(a1 + 32) name]) {
    fprintf(a2, "\n    name: %s", (const char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "name"), "UTF8String"));
  }
  if (v5)
  {
    fwrite("\n    metal", 0xAuLL, 1uLL, a2);
    if (*(unsigned char *)(v5 + 48)) {
      fwrite(" stitchable", 0xBuLL, 1uLL, a2);
    }
  }
  if (*((unsigned char *)v4 + 165)) {
    fwrite("\n    positionInvariant", 0x16uLL, 1uLL, a2);
  }
  if ([*(id *)(a1 + 32) preservesRange]) {
    fwrite("\n    preservesRange", 0x13uLL, 1uLL, a2);
  }
  if ([*(id *)(a1 + 32) perservesAlpha]) {
    fwrite("\n    preservesAlpha", 0x13uLL, 1uLL, a2);
  }
  if ([*(id *)(a1 + 32) canReduceOutputChannels]) {
    fwrite("\n    canReduceOutputChannels", 0x1CuLL, 1uLL, a2);
  }
  int v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "parameters"), "count");
  __int16 v25 = v4;
  if (v7)
  {
    fwrite("\n    arguments: (", 0x11uLL, 1uLL, a2);
    if (v7 >= 1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "parameters"), "objectAtIndex:", i);
        uint64_t v10 = (void *)[v9 objectForKeyedSubscript:@"CIAttributeName"];
        uint64_t v11 = (void *)[v9 objectForKeyedSubscript:@"CIAttributeClass"];
        uint64_t v12 = (void *)[v9 objectForKeyedSubscript:@"CIVectorSize"];
        [v11 UTF8String];
        if (v12)
        {
          [v12 intValue];
          [v10 UTF8String];
          fprintf(a2, "%s%s len%d %s");
        }
        else
        {
          [v10 UTF8String];
          fprintf(a2, "%s%s %s");
        }
      }
    }
    fputc(41, a2);
    double v4 = v25;
  }
  uint64_t v13 = (void *)(*(uint64_t (**)(unsigned int *))(*(void *)v4 + 40))(v4);
  if ([v13 count])
  {
    fwrite("\n    constants: (", 0x11uLL, 1uLL, a2);
    uint64_t v14 = (void *)[v13 keysSortedByValueUsingSelector:sel_compare_];
    if ([v13 count])
    {
      unint64_t v15 = 0;
      do
      {
        uint64_t v16 = (void *)[v14 objectAtIndexedSubscript:v15];
        uint64_t v17 = (void *)[v13 objectForKeyedSubscript:v16];
        id v18 = a2;
        if (v15) {
          uint64_t v19 = ", ";
        }
        else {
          uint64_t v19 = "";
        }
        uint64_t v20 = [v16 UTF8String];
        if (v20) {
          __int16 v21 = (const char *)v20;
        }
        else {
          __int16 v21 = "unknown";
        }
        int v24 = v19;
        a2 = v18;
        fprintf(v18, "%s%s = %s", v24, v21, (const char *)objc_msgSend((id)objc_msgSend(v17, "description"), "UTF8String"));
        ++v15;
      }
      while (v15 < [v13 count]);
    }
    fputc(41, a2);
    double v4 = v25;
  }
  uint64_t result = v4[30];
  if (result)
  {
    __int16 v23 = CI::name_for_format(result);
    return fprintf(a2, "\n    output: %s", v23);
  }
  return result;
}

+ (id)SDOFV2MetalKernelNamed:(id)a3
{
  if (SDOFV2MetalLibURL::onceToken != -1) {
    dispatch_once(&SDOFV2MetalLibURL::onceToken, &__block_literal_global_17_1);
  }
  if (!SDOFV2MetalLibURL::url) {
    return 0;
  }

  return +[CIKernel cachedKernelWithFunctionName:fromMetalLibrary:error:](CIKernel, "cachedKernelWithFunctionName:fromMetalLibrary:error:", a3);
}

+ (id)SDOFV3MetalKernelNamed:(id)a3
{
  if (SDOFV3MetalLibURL::onceToken != -1) {
    dispatch_once(&SDOFV3MetalLibURL::onceToken, &__block_literal_global_32);
  }
  if (!SDOFV3MetalLibURL::url) {
    return 0;
  }

  return +[CIKernel cachedKernelWithFunctionName:fromMetalLibrary:error:](CIKernel, "cachedKernelWithFunctionName:fromMetalLibrary:error:", a3);
}

- (void)init
{
}

- (void)_initWithString:(os_log_t)log andCIKernelLibrary:usingCruftCompatibility:isInternal:.cold.1(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_193671000, log, OS_LOG_TYPE_ERROR, "[%{public}@ kernelWithString:] failed due to error parsing kernel source.", buf, 0xCu);
}

- (void)_initWithString:(os_log_t)log andCIKernelLibrary:usingCruftCompatibility:isInternal:.cold.2(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_193671000, log, OS_LOG_TYPE_ERROR, "[%{public}@ kernelWithString:] failed because no valid kernels were in the string.", buf, 0xCu);
}

- (void)_initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:.cold.3()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2(&dword_193671000, v0, v1, "[CIWarpKernel kernelWithString:] failed because '%{public}s', the first kernel in the string, does not conform to the calling convensions of a CIWarpKernel.", v2, v3, v4, v5, v6);
}

- (void)_initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:.cold.4()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2(&dword_193671000, v0, v1, "[CIColorKernel kernelWithString:] failed because '%{public}s', the first kernel in the string, does not conform to the calling convensions of a CIColorKernel.", v2, v3, v4, v5, v6);
}

- (void)_initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:.cold.5()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_1();
  _os_log_debug_impl(&dword_193671000, v0, OS_LOG_TYPE_DEBUG, "WARNING: CoreImage intrenal function name %{public}s must start with '_'\n", v1, 0xCu);
}

- (void)_initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:.cold.6()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2(&dword_193671000, v0, v1, "[CIColorKernel kernelWithString:fromMetalLibraryData:] Function '%{public}s' does not conform to the calling conventions of a CIColorKernel.", v2, v3, v4, v5, v6);
}

- (void)_initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:.cold.7()
{
  OUTLINED_FUNCTION_8_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2(&dword_193671000, v0, v1, "[CIWarpKernel kernelWithString:fromMetalLibraryData:] Function '%{public}s' does not conform to the calling conventions of a CIWarpKernel.", v2, v3, v4, v5, v6);
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromMetalLibraryData:(uint64_t)a4 outputGroupSize:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromMetalLibraryData:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromMetalLibrary:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)cachedKernelWithFunctionName:(uint64_t)a3 fromMetalLibrary:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromCIKernelLibrary:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromCIKernelLibrary:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromCIKernelLibrary:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromCIKernelLibrary:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromCIKernelLibrary:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromCIKernelLibrary:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromCIKernelLibrary:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromCIKernelLibrary:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromCIKernelLibrary:options:error:.cold.9(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 136446466;
  uint64_t v4 = "+[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:]";
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_3_0(&dword_193671000, a2, a3, "%{public}s Cannot initialize kernel because constant MTLDataType %lu is not supported.", (uint8_t *)&v3);
}

+ (void)kernelWithFunctionName:fromCIKernelLibrary:options:error:.cold.10()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_193671000, v0, v1, "%{public}s Cannot initialize kernel because the constant value for %{public}@ was not specified.", (uint8_t *)v2);
}

+ (void)kernelWithFunctionName:fromCIKernelLibrary:options:error:.cold.11()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_193671000, v0, v1, "%{public}s Cannot initialize kernel because %{public}@ requires a constant value to be an NSArray of NSNumbers.", (uint8_t *)v2);
}

+ (void)kernelWithFunctionName:fromCIKernelLibrary:options:error:.cold.12()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_193671000, v0, v1, "%{public}s Cannot initialize kernel because %{public}@ requires a constant value to be an NSNumbers.", (uint8_t *)v2);
}

+ (void)kernelNamesFromMetalLibraryData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)kernelNamesFromMetalLibraryData:(uint64_t)a1 .cold.2(uint64_t a1, _DWORD *a2)
{
  *a2 = 136446466;
  OUTLINED_FUNCTION_10_0(a1, (uint64_t)a2, (uint64_t)"+[CIKernel kernelNamesFromMetalLibraryData:]");
  OUTLINED_FUNCTION_3_0(&dword_193671000, v2, (uint64_t)v2, "%{public}s [CIKernel kernelNamesFromMetalLibraryData:] error creating Metal library for NSData%{public}@", v3);
}

+ (void)kernelNamesFromMetalLibrary:(uint64_t)a1 .cold.1(uint64_t a1, _DWORD *a2)
{
  *a2 = 136446466;
  OUTLINED_FUNCTION_10_0(a1, (uint64_t)a2, (uint64_t)"+[CIKernel kernelNamesFromMetalLibrary:]");
  OUTLINED_FUNCTION_3_0(&dword_193671000, v2, (uint64_t)v2, "%{public}s [CIKernel kernelNamesFromMetalLibraryData:] error creating Metal library for NSData%{public}@", v3);
}

+ (void)kernelNamesFromMetalLibrary:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)applyWithExtent:(uint64_t)a3 roiCallback:(uint64_t)a4 arguments:(uint64_t)a5 options:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)applyWithExtent:(CI::Kernel *)a1 roiCallback:arguments:options:.cold.2(CI::Kernel *a1)
{
  CI::Kernel::num_apply_arguments(a1);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_9_1(&dword_193671000, v1, v2, "%{public}s argument count mismatch for kernel '%{public}s', expected %d but saw %d.", v3, v4, v5, v6, 2u);
}

@end