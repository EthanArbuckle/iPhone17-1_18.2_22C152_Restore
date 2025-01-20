@interface _EARUserProfileContainer
+ (void)initialize;
- (NSData)data;
- (NSSet)experimentIds;
- (NSString)userId;
- (_EARUserProfileContainer)initWithPath:(id)a3 error:(id *)a4;
- (_EARUserProfileContainer)initWithPath:(id)a3 userId:(id)a4 error:(id *)a5;
- (_EARUserProfileContainer)initWithPath:(id)a3 userId:(id)a4 recognitionOnly:(BOOL)a5 error:(id *)a6;
- (id).cxx_construct;
- (shared_ptr<const)lmeData;
@end

@implementation _EARUserProfileContainer

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

- (_EARUserProfileContainer)initWithPath:(id)a3 error:(id *)a4
{
  return [(_EARUserProfileContainer *)self initWithPath:a3 userId:0 error:a4];
}

- (_EARUserProfileContainer)initWithPath:(id)a3 userId:(id)a4 recognitionOnly:(BOOL)a5 error:(id *)a6
{
  return [(_EARUserProfileContainer *)self initWithPath:a3 userId:a4 error:a6];
}

- (_EARUserProfileContainer)initWithPath:(id)a3 userId:(id)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_EARUserProfileContainer;
  v9 = [(_EARUserProfileContainer *)&v18 init];
  v10 = v9;
  if (v9)
  {
    if (v7)
    {
      v11 = EARLogger::QuasarOSLogger((EARLogger *)v9);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138477827;
        *(void *)&buf[4] = v7;
        _os_log_impl(&dword_1B1A86000, v11, OS_LOG_TYPE_INFO, "Reading user profile: path %{private}@", buf, 0xCu);
      }

      objc_msgSend(v7, "ear_toString");
      std::allocate_shared[abi:ne180100]<std::ifstream,std::allocator<std::ifstream>,std::string,void>(&v17);
      long long v12 = v17;
      long long v17 = 0uLL;
      v13 = (std::__shared_weak_count *)*((void *)v10 + 2);
      *(_OWORD *)((char *)v10 + 8) = v12;
      if (v13)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v13);
        v13 = (std::__shared_weak_count *)*((void *)&v17 + 1);
        if (*((void *)&v17 + 1)) {
          std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v17 + 1));
        }
      }
      if (v20 < 0) {
        operator delete(*(void **)buf);
      }
      if ((*(unsigned char *)(*((void *)v10 + 1) + *(void *)(**((void **)v10 + 1) - 24) + 32) & 5) == 0) {
        _ZNSt3__115allocate_sharedB8ne180100IN6quasar7LmeDataENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_();
      }
      v14 = EARLogger::QuasarOSLogger((EARLogger *)v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B1A86000, v14, OS_LOG_TYPE_INFO, "Failed to read profile: stream failure", buf, 2u);
      }
    }
    v15 = 0;
  }
  else
  {
    v15 = (_EARUserProfileContainer *)0;
  }

  return v15;
}

- (shared_ptr<const)lmeData
{
  uint64_t v3 = *((void *)self + 12);
  void *v2 = *((void *)self + 11);
  v2[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (LmeData *)self;
  return result;
}

- (NSData)data
{
  if (*((void *)self + 1))
  {
    uint64_t v3 = (std::mutex *)((char *)self + 24);
    std::mutex::lock((std::mutex *)((char *)self + 24));
    std::ios_base::clear((std::ios_base *)(*((void *)self + 1) + *(void *)(**((void **)self + 1) - 24)), 0);
    std::istream::seekg();
    std::istream::tellg();
    std::istream::seekg();
    v4 = malloc_type_malloc(size, 0x47A378C5uLL);
    if (v4)
    {
      std::istream::read();
      v5 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v4 length:size];
    }
    else
    {
      v5 = 0;
    }
    std::mutex::unlock(v3);
  }
  else
  {
    v5 = 0;
  }
  return (NSData *)v5;
}

- (NSSet)experimentIds
{
  if (*((void *)self + 11))
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:*(void *)(*((void *)self + 11) + 384)];
    uint64_t v4 = *((void *)self + 11);
    v5 = *(void **)(v4 + 368);
    v6 = (void *)(v4 + 376);
    if (v5 != (void *)(v4 + 376))
    {
      do
      {
        if (*((char *)v5 + 55) < 0)
        {
          id v7 = (void *)v5[4];
          uint64_t v8 = v5[5];
        }
        else
        {
          id v7 = v5 + 4;
          uint64_t v8 = *((unsigned __int8 *)v5 + 55);
        }
        v9 = objc_msgSend(NSString, "ear_stringWithStringView:", v7, v8);
        [v3 addObject:v9];

        v10 = (void *)v5[1];
        if (v10)
        {
          do
          {
            v11 = v10;
            v10 = (void *)*v10;
          }
          while (v10);
        }
        else
        {
          do
          {
            v11 = (void *)v5[2];
            BOOL v12 = *v11 == (void)v5;
            v5 = v11;
          }
          while (!v12);
        }
        v5 = v11;
      }
      while (v11 != v6);
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSSet *)v3;
}

- (NSString)userId
{
  return (NSString *)*((void *)self + 13);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 13, 0);
  uint64_t v3 = (std::__shared_weak_count *)*((void *)self + 12);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  std::mutex::~mutex((std::mutex *)((char *)self + 24));
  uint64_t v4 = (std::__shared_weak_count *)*((void *)self + 2);
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 850045863;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((void *)self + 12) = 0;
  return self;
}

- (void)initWithPath:userId:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_3(&dword_1B1A86000, v1, v2, "Failed to read profile: Internal C++ exception: %s", v3, v4, v5, v6, 2u);
}

- (void)initWithPath:userId:error:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_1B1A86000, v0, v1, "Failed to read profile: Internal unknown exception", v2, v3, v4, v5, v6);
}

@end