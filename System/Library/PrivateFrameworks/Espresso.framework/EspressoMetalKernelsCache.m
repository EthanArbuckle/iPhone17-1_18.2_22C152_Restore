@interface EspressoMetalKernelsCache
- (BOOL)shouldUseTexArray;
- (BOOL)wasSetup;
- (EspressoMetalKernelsCache)initWithDevice:(id)a3;
- (NSDictionary)m_kernelCache;
- (NSString)kernelPrefix;
- (id).cxx_construct;
- (id)kernelForFunction:(const char *)a3;
- (id)kernelForFunction:(const char *)a3 cacheString:(const char *)a4 withConstants:(id)a5;
- (void)addLibraryAtPath:(id)a3;
- (void)lazySetup;
- (void)loadLibraryNamed:(id)a3;
- (void)setKernelPrefix:(id)a3;
- (void)setM_kernelCache:(id)a3;
@end

@implementation EspressoMetalKernelsCache

- (id).cxx_construct
{
  *((void *)self + 8) = 850045863;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((void *)self + 15) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 17, 0);
  objc_storeStrong((id *)self + 16, 0);
  std::mutex::~mutex((std::mutex *)self + 1);
  objc_storeStrong((id *)self + 7, 0);
  objc_storeStrong((id *)self + 6, 0);
  objc_storeStrong((id *)self + 5, 0);
  objc_storeStrong((id *)self + 3, 0);
  objc_storeStrong((id *)self + 2, 0);

  objc_storeStrong((id *)self + 1, 0);
}

- (void)setKernelPrefix:(id)a3
{
}

- (EspressoMetalKernelsCache)initWithDevice:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EspressoMetalKernelsCache;
  id v6 = [(EspressoMetalKernelsCache *)&v14 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.espresso.EspressoMetalKernelsCache", v7);
    v9 = (void *)*((void *)v6 + 5);
    *((void *)v6 + 5) = v8;

    objc_storeStrong((id *)v6 + 3, a3);
    *((unsigned char *)v6 + 32) = 1;
    v10 = (void *)*((void *)v6 + 16);
    *((void *)v6 + 16) = @"T2D_";

    if (([v6 shouldUseTexArray] & 1) == 0)
    {
      v11 = (void *)*((void *)v6 + 16);
      *((void *)v6 + 16) = @"T3D_";
    }
    id v12 = v6;
  }

  return (EspressoMetalKernelsCache *)v6;
}

- (BOOL)shouldUseTexArray
{
  return *((unsigned char *)self + 32);
}

- (void)setM_kernelCache:(id)a3
{
}

- (NSDictionary)m_kernelCache
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (NSString)kernelPrefix
{
  return (NSString *)*((void *)self + 16);
}

- (id)kernelForFunction:(const char *)a3 cacheString:(const char *)a4 withConstants:(id)a5
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v65 = a5;
  [(EspressoMetalKernelsCache *)self lazySetup];
  v7 = [NSString stringWithFormat:@"%@%s", *((void *)self + 16), a3];
  strncpy(__dst, a3, 0x40uLL);
  id v8 = v7;
  v9 = v8;
  v64 = v8;
  if (!v65)
  {
    v24 = [(EspressoMetalKernelsCache *)self m_kernelCache];
    id v11 = [v24 objectForKeyedSubscript:v9];

    if (v11)
    {
      id v12 = 0;

      goto LABEL_48;
    }
    v87[0] = 1;
    uint64_t v89 = *(void *)__dst;
    uint64_t v90 = v98;
    uint64_t v91 = v99;
    long long v92 = v100;
    long long v93 = v101;
    uint64_t v94 = v102;
    int v88 = 723714064;
    kdebug_trace();
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v25 = *((id *)self + 6);
    uint64_t v26 = [v25 countByEnumeratingWithState:&v70 objects:v95 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v71;
      while (2)
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v71 != v27) {
            objc_enumerationMutation(v25);
          }
          v29 = [*((id *)self + 6) objectForKeyedSubscript:*(void *)(*((void *)&v70 + 1) + 8 * i)];
          v30 = (void *)[v29 newFunctionWithName:v64];
          if (v30)
          {

LABEL_43:
            v32 = v64;
            goto LABEL_44;
          }
          v31 = [NSString stringWithUTF8String:a3];
          v30 = (void *)[v29 newFunctionWithName:v31];

          if (v30) {
            goto LABEL_43;
          }
        }
        uint64_t v26 = [v25 countByEnumeratingWithState:&v70 objects:v95 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }

    v32 = v64;
    v30 = (void *)[*((id *)self + 1) newFunctionWithName:v64];
    if (!v30)
    {
      v33 = (void *)*((void *)self + 1);
      v34 = [NSString stringWithUTF8String:a3];
      v30 = (void *)[v33 newFunctionWithName:v34];

      v32 = v64;
      if (!v30)
      {
        v30 = (void *)[*((id *)self + 2) newFunctionWithName:v64];
        if (!v30)
        {
          v35 = (void *)*((void *)self + 2);
          v36 = [NSString stringWithUTF8String:a3];
          v30 = (void *)[v35 newFunctionWithName:v36];

          v32 = v64;
          if (!v30)
          {
            v37 = [NSString stringWithFormat:@">> ERROR: Failed creating a new function %s %@!", a3, v64];
            NSLog(&stru_1EE39CE70.isa, v37);
            exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            std::runtime_error::runtime_error(exception, (const char *)[v37 UTF8String]);
            __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
          }
        }
      }
    }
LABEL_44:
    v45 = (void *)*((void *)self + 3);
    id v69 = 0;
    v46 = (void *)[v45 newComputePipelineStateWithFunction:v30 error:&v69];
    id v12 = v69;
    if (!v46)
    {
      v53 = [NSString stringWithFormat:@">> ERROR: Failed creating a compute kernel: %@ %s %@", v12, a3, v32];
      v54 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v54, (const char *)[v53 UTF8String]);
      __cxa_throw(v54, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    v47 = *((void *)self + 5);
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __73__EspressoMetalKernelsCache_kernelForFunction_cacheString_withConstants___block_invoke_2;
    v66[3] = &unk_1E5747CF0;
    v66[4] = self;
    id v63 = v32;
    id v67 = v63;
    id v48 = v46;
    id v68 = v48;
    dispatch_sync(v47, v66);
    v49 = v68;
    id v11 = v48;

    goto LABEL_46;
  }
  id v63 = v8;
  if (!a4) {
    goto LABEL_5;
  }
  objc_msgSend(v8, "stringByAppendingFormat:", @"%s", a4);
  id v63 = (id)objc_claimAutoreleasedReturnValue();

  v10 = [(EspressoMetalKernelsCache *)self m_kernelCache];
  id v11 = [v10 objectForKeyedSubscript:v63];

  if (!v11)
  {
LABEL_5:
    v87[0] = 1;
    uint64_t v89 = *(void *)__dst;
    uint64_t v90 = v98;
    uint64_t v91 = v99;
    long long v92 = v100;
    long long v93 = v101;
    uint64_t v94 = v102;
    int v88 = 723714064;
    kdebug_trace();
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id obj = *((id *)self + 6);
    id v13 = 0;
    uint64_t v14 = [obj countByEnumeratingWithState:&v83 objects:v96 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v84;
LABEL_7:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v84 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = [*((id *)self + 6) objectForKeyedSubscript:*(void *)(*((void *)&v83 + 1) + 8 * v16)];
        v18 = [NSString stringWithUTF8String:a3];
        id v82 = v13;
        v19 = (void *)[v17 newFunctionWithName:v18 constantValues:v65 error:&v82];
        id v20 = v82;

        if (v19) {
          break;
        }
        id v81 = v20;
        v19 = (void *)[v17 newFunctionWithName:v64 constantValues:v65 error:&v81];
        id v13 = v81;

        if (v19)
        {
          id v20 = v13;
          goto LABEL_34;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [obj countByEnumeratingWithState:&v83 objects:v96 count:16];
          if (v14) {
            goto LABEL_7;
          }
          goto LABEL_14;
        }
      }

LABEL_34:
      id v23 = 0;
      goto LABEL_35;
    }
LABEL_14:

    v21 = (void *)*((void *)self + 1);
    v22 = [NSString stringWithUTF8String:a3];
    id v80 = 0;
    v19 = (void *)[v21 newFunctionWithName:v22 constantValues:v65 error:&v80];
    id v23 = v80;

    if (v19)
    {
      id v20 = v13;
    }
    else
    {
      v42 = (void *)*((void *)self + 1);
      id v79 = v13;
      v19 = (void *)[v42 newFunctionWithName:v64 constantValues:v65 error:&v79];
      id v20 = v79;

      if (!v19)
      {
        v43 = (void *)*((void *)self + 2);
        v44 = [NSString stringWithUTF8String:a3];
        id v78 = v23;
        v19 = (void *)[v43 newFunctionWithName:v44 constantValues:v65 error:&v78];
        id obja = v78;

        if (!v19)
        {
          v55 = NSString;
          v56 = [v20 localizedDescription];
          v57 = [obja localizedDescription];
          v58 = [v55 stringWithFormat:@">> ERROR: Failed creating a new function w constants %s err=%@ e1=%@!", a3, v56, v57];

          v59 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v59, (const char *)[v58 UTF8String]);
          __cxa_throw(v59, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        id v23 = obja;
      }
    }
LABEL_35:
    v39 = objc_opt_new();
    [v39 setComputeFunction:v19];
    v40 = (void *)*((void *)self + 3);
    id v77 = v20;
    id v11 = (id)[v40 newComputePipelineStateWithDescriptor:v39 options:0 reflection:0 error:&v77];
    id v12 = v77;

    if (!v11)
    {
      v51 = [NSString stringWithFormat:@">> ERROR: Failed creating a compute kernel: %@ %s", v12, a3];
      v52 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v52, (const char *)[v51 UTF8String]);
      __cxa_throw(v52, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    if (a4)
    {
      v41 = *((void *)self + 5);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__EspressoMetalKernelsCache_kernelForFunction_cacheString_withConstants___block_invoke;
      block[3] = &unk_1E5747CF0;
      block[4] = self;
      id v75 = v63;
      id v76 = v11;
      dispatch_sync(v41, block);
    }
LABEL_46:
    Espresso_scoped_signpost::~Espresso_scoped_signpost((Espresso_scoped_signpost *)v87);
    goto LABEL_47;
  }
  id v12 = 0;
LABEL_47:

LABEL_48:

  return v11;
}

void __73__EspressoMetalKernelsCache_kernelForFunction_cacheString_withConstants___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
  id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 56) copy];
  objc_msgSend(*(id *)(a1 + 32), "setM_kernelCache:");
}

uint64_t __73__EspressoMetalKernelsCache_kernelForFunction_cacheString_withConstants___block_invoke_2(void *a1)
{
  [*(id *)(a1[4] + 56) setObject:a1[6] forKeyedSubscript:a1[5]];
  uint64_t v2 = [*(id *)(a1[4] + 56) copy];
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void *)(v3 + 136);
  *(void *)(v3 + 136) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)kernelForFunction:(const char *)a3
{
  return [(EspressoMetalKernelsCache *)self kernelForFunction:a3 cacheString:0 withConstants:0];
}

- (void)addLibraryAtPath:(id)a3
{
  id v4 = a3;
  id v15 = v4;
  if (!*((void *)self + 6))
  {
    uint64_t v5 = objc_opt_new();
    id v6 = (void *)*((void *)self + 6);
    *((void *)self + 6) = v5;

    id v4 = v15;
  }
  v7 = (void *)*((void *)self + 3);
  id v8 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  v9 = (void *)[v7 newLibraryWithURL:v8 error:0];

  if (!v9)
  {
    v10 = (void *)MEMORY[0x1E4F1CB10];
    id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v12 = [v11 bundlePath];
    id v13 = [v12 stringByAppendingPathComponent:v15];
    uint64_t v14 = [v10 URLWithString:v13];

    v9 = (void *)[*((id *)self + 3) newLibraryWithURL:v14 error:0];
  }
  [*((id *)self + 6) setObject:v9 forKeyedSubscript:v15];
}

- (void)loadLibraryNamed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)*((void *)self + 3);
  id v19 = v4;
  id v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
  uint64_t v7 = [v5 newLibraryWithURL:v6 error:0];
  id v8 = (void *)*((void *)self + 1);
  *((void *)self + 1) = v7;

  if (!*((void *)self + 1))
  {
    v9 = (void *)MEMORY[0x1E4F1CB10];
    v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v11 = [v10 bundlePath];
    id v12 = [v11 stringByAppendingPathComponent:v19];
    id v13 = [v9 URLWithString:v12];

    uint64_t v14 = [*((id *)self + 3) newLibraryWithURL:v13 error:0];
    id v15 = (void *)*((void *)self + 1);
    *((void *)self + 1) = v14;

    if (!*((void *)self + 1))
    {
      uint64_t v16 = [*((id *)self + 3) newDefaultLibrary];
      v17 = (void *)*((void *)self + 1);
      *((void *)self + 1) = v16;

      if (!*((void *)self + 1))
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Espresso: Failed creating a default shader library! GPU mode won't work");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
    }
  }
}

- (BOOL)wasSetup
{
  return *((void *)self + 7) != 0;
}

- (void)lazySetup
{
  uint64_t v3 = (std::mutex *)((char *)self + 64);
  std::mutex::lock((std::mutex *)self + 1);
  if (![(EspressoMetalKernelsCache *)self wasSetup])
  {
    id v4 = (void *)*((void *)self + 17);
    *((void *)self + 17) = 0;

    uint64_t v5 = objc_opt_new();
    id v6 = (void *)*((void *)self + 7);
    *((void *)self + 7) = v5;

    uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v8 = [v7 resourcePath];
    v9 = [v8 stringByAppendingString:@"/Frameworks/Espresso.framework/default.metallib"];

    if (v9)
    {
      v10 = (void *)*((void *)self + 3);
      id v11 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
      uint64_t v12 = [v10 newLibraryWithURL:v11 error:0];
      id v13 = (void *)*((void *)self + 1);
      *((void *)self + 1) = v12;
    }
    if (!*((void *)self + 1))
    {
      uint64_t v14 = [v7 resourcePath];
      id v15 = [v14 stringByAppendingString:@"/Frameworks/ExternalLibraryWrapper.framework/default.metallib"];

      if (v15)
      {
        uint64_t v16 = (void *)*((void *)self + 3);
        v17 = [MEMORY[0x1E4F1CB10] URLWithString:v15];
        uint64_t v18 = [v16 newLibraryWithURL:v17 error:0];
        id v19 = (void *)*((void *)self + 1);
        *((void *)self + 1) = v18;
      }
      if (!*((void *)self + 1))
      {
        id v20 = [v7 resourcePath];
        v21 = [v20 stringByAppendingString:@"/Espresso.framework/default.metallib"];

        if (v21)
        {
          v22 = (void *)*((void *)self + 3);
          id v23 = [MEMORY[0x1E4F1CB10] URLWithString:v21];
          uint64_t v24 = [v22 newLibraryWithURL:v23 error:0];
          id v25 = (void *)*((void *)self + 1);
          *((void *)self + 1) = v24;
        }
        if (!*((void *)self + 1))
        {
          uint64_t v26 = [v7 resourcePath];
          uint64_t v27 = [v26 stringByAppendingString:@"/Frameworks/Espresso.framework/default.metallib"];

          if (v27)
          {
            v28 = (void *)*((void *)self + 3);
            v29 = [MEMORY[0x1E4F1CB10] URLWithString:v27];
            uint64_t v30 = [v28 newLibraryWithURL:v29 error:0];
            v31 = (void *)*((void *)self + 1);
            *((void *)self + 1) = v30;
          }
          if (!*((void *)self + 1))
          {
            v32 = [v7 bundlePath];
            v33 = [v32 stringByAppendingString:@"/Contents/Frameworks/Espresso.framework/Versions/Current/Resources/default.metallib"];

            if (v33)
            {
              v34 = (void *)*((void *)self + 3);
              v35 = [MEMORY[0x1E4F1CB10] URLWithString:v33];
              uint64_t v36 = [v34 newLibraryWithURL:v35 error:0];
              v37 = (void *)*((void *)self + 1);
              *((void *)self + 1) = v36;
            }
            if (!*((void *)self + 1))
            {
              v38 = [v7 bundlePath];
              v39 = [v38 stringByAppendingString:@"/Resources/default.metallib"];

              if (v39)
              {
                v40 = (void *)*((void *)self + 3);
                v41 = [MEMORY[0x1E4F1CB10] URLWithString:v39];
                uint64_t v42 = [v40 newLibraryWithURL:v41 error:0];
                v43 = (void *)*((void *)self + 1);
                *((void *)self + 1) = v42;
              }
              if (!*((void *)self + 1))
              {
                v44 = [v7 bundlePath];
                v45 = [v44 stringByAppendingString:@"/default.metallib"];

                if (v45)
                {
                  v46 = (void *)*((void *)self + 3);
                  v47 = [MEMORY[0x1E4F1CB10] URLWithString:v45];
                  uint64_t v48 = [v46 newLibraryWithURL:v47 error:0];
                  v49 = (void *)*((void *)self + 1);
                  *((void *)self + 1) = v48;
                }
                if (!*((void *)self + 1))
                {
                  uint64_t v50 = [*((id *)self + 3) newDefaultLibrary];
                  v51 = (void *)*((void *)self + 1);
                  *((void *)self + 1) = v50;
                }
              }
            }
          }
        }
      }
    }
    uint64_t v52 = [*((id *)self + 3) newDefaultLibrary];
    v53 = (void *)*((void *)self + 2);
    *((void *)self + 2) = v52;

    if (!*((void *)self + 1))
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      v58 = [v7 bundlePath];
      std::string::basic_string[abi:ne180100]<0>(&v61, v58);
      v59 = std::string::insert(&v61, 0, "Espresso: Failed creating a default shader library! GPU mode won't work");
      long long v60 = *(_OWORD *)&v59->__r_.__value_.__l.__data_;
      v62.__r_.__value_.__r.__words[2] = v59->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v62.__r_.__value_.__l.__data_ = v60;
      v59->__r_.__value_.__l.__size_ = 0;
      v59->__r_.__value_.__r.__words[2] = 0;
      v59->__r_.__value_.__r.__words[0] = 0;
      std::runtime_error::runtime_error(exception, &v62);
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    [(EspressoMetalKernelsCache *)self addLibraryAtPath:@"espressotrain.metallib"];
    v54 = [v7 bundlePath];
    v55 = [v54 stringByDeletingLastPathComponent];
    v56 = [v55 stringByAppendingPathComponent:@"espressotrain.metallib"];
    [(EspressoMetalKernelsCache *)self addLibraryAtPath:v56];
  }

  std::mutex::unlock(v3);
}

@end