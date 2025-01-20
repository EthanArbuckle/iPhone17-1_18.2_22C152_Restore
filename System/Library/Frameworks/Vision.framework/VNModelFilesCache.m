@interface VNModelFilesCache
+ (BOOL)useFOpenForModelWithPath:(id)a3;
+ (id)sharedInstance;
- (VNModelFilesCache)init;
- (id).cxx_construct;
- (id)load:(id)a3;
- (void)purgeAll;
- (void)unload:(id)a3;
@end

@implementation VNModelFilesCache

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
}

- (void)purgeAll
{
  value = self->m_impl.__ptr_.__value_;
  v3 = (std::mutex *)((char *)value + 40);
  std::mutex::lock((std::mutex *)((char *)value + 40));
  for (i = (int *)*((void *)value + 2); i; i = *(int **)i)
  {
    if (i[14] >= 1) {
      uint64_t v5 = 4;
    }
    else {
      uint64_t v5 = 5;
    }
    (*(void (**)(uint64_t, uint64_t))(**((void **)i + 5) + 24))(*((void *)i + 5), v5);
  }

  std::mutex::unlock(v3);
}

- (void)unload:(id)a3
{
  id v4 = a3;
  value = self->m_impl.__ptr_.__value_;
  id v6 = v4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 UTF8String]);
  v7 = (std::mutex *)((char *)value + 40);
  std::mutex::lock((std::mutex *)((char *)value + 40));
  v8 = std::__hash_table<std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>>>::find<std::string>(value, (unsigned __int8 *)__p);
  if (v8)
  {
    v9 = v8;
    (*(void (**)(void, uint64_t))(**((void **)v8 + 5) + 24))(*((void *)v8 + 5), 4);
    --*((_DWORD *)v9 + 14);
  }
  std::mutex::unlock(v7);
  if (v11 < 0) {
    operator delete(__p[0]);
  }
}

- (id)load:(id)a3
{
  id v5 = a3;
  id v6 = [VNModelFileImpl alloc];
  value = self->m_impl.__ptr_.__value_;
  id v8 = v5;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v8 UTF8String]);
  int v9 = [(id)objc_opt_class() useFOpenForModelWithPath:v8];
  std::mutex::lock((std::mutex *)((char *)value + 40));
  i = std::__hash_table<std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>>>::find<std::string>(value, (unsigned __int8 *)__p);
  if (i) {
    goto LABEL_98;
  }
  v65 = v6;
  int v11 = SHIBYTE(v67);
  v12 = (void **)__p[0];
  if (!v9)
  {
    v13 = (char *)operator new(0x38uLL);
    if (v11 >= 0) {
      v21 = __p;
    }
    else {
      v21 = v12;
    }
    *((void *)v13 + 1) = 0;
    *((void *)v13 + 2) = 0;
    *(void *)v13 = &unk_1EF7533F0;
    v15 = v13 + 24;
    *((void *)v13 + 3) = &unk_1EF751FD8;
    *((void *)v13 + 4) = 0;
    *((_DWORD *)v13 + 10) = -1;
    *((void *)v13 + 6) = 0;
    int v22 = open((const char *)v21, 0);
    *((_DWORD *)v13 + 10) = v22;
    if (v22 == -1)
    {
      int v62 = 166;
      v63 = "::open failed";
      goto LABEL_125;
    }
    memset(&v68, 0, sizeof(v68));
    if (fstat(v22, &v68))
    {
      int v62 = 172;
    }
    else
    {
      off_t st_size = v68.st_size;
      *((void *)v13 + 4) = v68.st_size;
      if (st_size)
      {
        v24 = mmap(0, st_size, 1, 2, *((_DWORD *)v13 + 10), 0);
        *((void *)v13 + 6) = v24;
        if (v24 != (void *)-1) {
          goto LABEL_19;
        }
        int v62 = 184;
        v63 = "mmap MAP_FAILED";
LABEL_125:
        syslog(3, "Error %s when executing %s in file %s:%d\n", v63, "void cvml::util::mapped_model_file_open::open_file(const char *, BOOL)", "/Library/Caches/com.apple.xbs/Sources/Vision/VisionKitFramework/VN/algorithm_util/mapped_model_file.h", v62);
        __assert_rtn("syslog_assert_failed", "common_defines.h", 24, "false");
      }
      int v62 = 178;
    }
    v63 = "fstat failed";
    goto LABEL_125;
  }
  v13 = (char *)operator new(0x30uLL);
  if (v11 >= 0) {
    v14 = __p;
  }
  else {
    v14 = v12;
  }
  *(_OWORD *)(v13 + 8) = 0u;
  *(void *)v13 = &unk_1EF753428;
  v15 = v13 + 24;
  *((_OWORD *)v13 + 2) = 0u;
  *((void *)v13 + 3) = &unk_1EF752020;
  v16 = fopen((const char *)v14, "rb");
  v3 = v16;
  if (!v16)
  {
    int v60 = 273;
    v61 = "fopen failed";
    goto LABEL_123;
  }
  uint64_t v17 = MEMORY[0x1A6256E50](v16);
  if (v17 == -1)
  {
    int v60 = 279;
LABEL_118:
    v61 = "ftell failed";
    goto LABEL_123;
  }
  uint64_t v18 = v17;
  if (fseek(v3, 0, 2))
  {
    int v60 = 285;
LABEL_122:
    v61 = "fseek failed";
LABEL_123:
    syslog(3, "Error %s when executing %s in file %s:%d\n", v61, "void cvml::util::mapped_model_file_fopen::open_file(const char *)", "/Library/Caches/com.apple.xbs/Sources/Vision/VisionKitFramework/VN/algorithm_util/mapped_model_file.h", v60);
    __assert_rtn("syslog_assert_failed", "common_defines.h", 24, "false");
  }
  uint64_t v19 = MEMORY[0x1A6256E50](v3);
  if (v19 == -1)
  {
    int v60 = 291;
    goto LABEL_118;
  }
  uint64_t v20 = v19;
  if (fseek(v3, v18, 0))
  {
    int v60 = 297;
    goto LABEL_122;
  }
  *((void *)v13 + 4) = v20;
  *((void *)v13 + 5) = v3;
LABEL_19:
  *(void *)&long long v25 = v15;
  *((void *)&v25 + 1) = v13;
  long long v64 = v25;
  atomic_fetch_add_explicit((atomic_ullong *volatile)v13 + 1, 1uLL, memory_order_relaxed);
  unint64_t v26 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)__p);
  unint64_t v27 = v26;
  unint64_t v28 = *((void *)value + 1);
  if (v28)
  {
    uint8x8_t v29 = (uint8x8_t)vcnt_s8((int8x8_t)v28);
    v29.i16[0] = vaddlv_u8(v29);
    unint64_t v30 = v29.u32[0];
    if (v29.u32[0] > 1uLL)
    {
      v3 = (FILE *)v26;
      if (v26 >= v28) {
        v3 = (FILE *)(v26 % v28);
      }
    }
    else
    {
      v3 = (FILE *)((v28 - 1) & v26);
    }
    v31 = *(unsigned __int8 ***)(*(void *)value + 8 * (void)v3);
    if (v31)
    {
      for (i = *v31; i; i = *(unsigned __int8 **)i)
      {
        unint64_t v32 = *((void *)i + 1);
        if (v32 == v27)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](i + 16, (unsigned __int8 *)__p))
          {
            id v6 = v65;
            v58 = (std::__shared_weak_count *)*((void *)&v64 + 1);
            goto LABEL_95;
          }
        }
        else
        {
          if (v30 > 1)
          {
            if (v32 >= v28) {
              v32 %= v28;
            }
          }
          else
          {
            v32 &= v28 - 1;
          }
          if ((FILE *)v32 != v3) {
            break;
          }
        }
      }
    }
  }
  v33 = (char *)operator new(0x40uLL);
  v34 = (void *)((char *)value + 16);
  *(void *)&v68.st_dev = v33;
  v68.st_ino = (__darwin_ino64_t)value + 16;
  LOBYTE(v68.st_uid) = 0;
  *(void *)v33 = 0;
  *((void *)v33 + 1) = v27;
  v35 = (std::string *)(v33 + 16);
  if (SHIBYTE(v67) < 0)
  {
    std::string::__init_copy_ctor_external(v35, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
  }
  else
  {
    *(_OWORD *)&v35->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    *((void *)v33 + 4) = v67;
  }
  *(_OWORD *)(v33 + 40) = v64;
  *((_DWORD *)v33 + 14) = 0;
  LOBYTE(v68.st_uid) = 1;
  float v36 = (float)(unint64_t)(*((void *)value + 3) + 1);
  float v37 = *((float *)value + 8);
  if (!v28 || (float)(v37 * (float)v28) < v36)
  {
    BOOL v38 = 1;
    if (v28 >= 3) {
      BOOL v38 = (v28 & (v28 - 1)) != 0;
    }
    unint64_t v39 = v38 | (2 * v28);
    unint64_t v40 = vcvtps_u32_f32(v36 / v37);
    if (v39 <= v40) {
      int8x8_t prime = (int8x8_t)v40;
    }
    else {
      int8x8_t prime = (int8x8_t)v39;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v28 = *((void *)value + 1);
    if (*(void *)&prime > v28) {
      goto LABEL_51;
    }
    if (*(void *)&prime < v28)
    {
      unint64_t v48 = vcvtps_u32_f32((float)*((unint64_t *)value + 3) / *((float *)value + 8));
      if (v28 < 3 || (uint8x8_t v49 = (uint8x8_t)vcnt_s8((int8x8_t)v28), v49.i16[0] = vaddlv_u8(v49), v49.u32[0] > 1uLL))
      {
        unint64_t v48 = std::__next_prime(v48);
      }
      else
      {
        uint64_t v50 = 1 << -(char)__clz(v48 - 1);
        if (v48 >= 2) {
          unint64_t v48 = v50;
        }
      }
      if (*(void *)&prime <= v48) {
        int8x8_t prime = (int8x8_t)v48;
      }
      if (*(void *)&prime >= v28)
      {
        unint64_t v28 = *((void *)value + 1);
      }
      else
      {
        if (prime)
        {
LABEL_51:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v42 = operator new(8 * *(void *)&prime);
          v43 = *(void **)value;
          *(void *)value = v42;
          if (v43) {
            operator delete(v43);
          }
          uint64_t v44 = 0;
          *((int8x8_t *)value + 1) = prime;
          do
            *(void *)(*(void *)value + 8 * v44++) = 0;
          while (*(void *)&prime != v44);
          v45 = (void *)*v34;
          if (*v34)
          {
            unint64_t v46 = v45[1];
            uint8x8_t v47 = (uint8x8_t)vcnt_s8(prime);
            v47.i16[0] = vaddlv_u8(v47);
            if (v47.u32[0] > 1uLL)
            {
              if (v46 >= *(void *)&prime) {
                v46 %= *(void *)&prime;
              }
            }
            else
            {
              v46 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)value + 8 * v46) = v34;
            v51 = (void *)*v45;
            if (*v45)
            {
              do
              {
                unint64_t v52 = v51[1];
                if (v47.u32[0] > 1uLL)
                {
                  if (v52 >= *(void *)&prime) {
                    v52 %= *(void *)&prime;
                  }
                }
                else
                {
                  v52 &= *(void *)&prime - 1;
                }
                if (v52 != v46)
                {
                  if (!*(void *)(*(void *)value + 8 * v52))
                  {
                    *(void *)(*(void *)value + 8 * v52) = v45;
                    goto LABEL_76;
                  }
                  void *v45 = *v51;
                  void *v51 = **(void **)(*(void *)value + 8 * v52);
                  **(void **)(*(void *)value + 8 * v52) = v51;
                  v51 = v45;
                }
                unint64_t v52 = v46;
LABEL_76:
                v45 = v51;
                v51 = (void *)*v51;
                unint64_t v46 = v52;
              }
              while (v51);
            }
          }
          unint64_t v28 = (unint64_t)prime;
          goto LABEL_80;
        }
        v59 = *(void **)value;
        *(void *)value = 0;
        if (v59) {
          operator delete(v59);
        }
        unint64_t v28 = 0;
        *((void *)value + 1) = 0;
      }
    }
LABEL_80:
    if ((v28 & (v28 - 1)) != 0)
    {
      if (v27 >= v28) {
        v3 = (FILE *)(v27 % v28);
      }
      else {
        v3 = (FILE *)v27;
      }
    }
    else
    {
      v3 = (FILE *)((v28 - 1) & v27);
    }
  }
  v53 = *(unsigned __int8 ***)(*(void *)value + 8 * (void)v3);
  i = *(unsigned __int8 **)&v68.st_dev;
  if (v53)
  {
    **(void **)&v68.st_dev = *v53;
    id v6 = v65;
  }
  else
  {
    **(void **)&v68.st_dev = *((void *)value + 2);
    *((void *)value + 2) = i;
    *(void *)(*(void *)value + 8 * (void)v3) = v34;
    id v6 = v65;
    if (!*(void *)i) {
      goto LABEL_94;
    }
    unint64_t v54 = *(void *)(*(void *)i + 8);
    if ((v28 & (v28 - 1)) != 0)
    {
      if (v54 >= v28) {
        v54 %= v28;
      }
    }
    else
    {
      v54 &= v28 - 1;
    }
    v53 = (unsigned __int8 **)(*(void *)value + 8 * v54);
  }
  *v53 = i;
LABEL_94:
  *(void *)&v68.st_dev = 0;
  ++*((void *)value + 3);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::pair<std::shared_ptr<cvml::util::mapped_model_file>,int>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::pair<std::shared_ptr<cvml::util::mapped_model_file>,int>>,void *>>>>::reset[abi:ne180100]((uint64_t)&v68);
  v58 = 0;
LABEL_95:
  if (v58) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v58);
  }
  std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v13);
LABEL_98:
  ++*((_DWORD *)i + 14);
  uint64_t v55 = *((void *)i + 5);
  std::mutex::unlock((std::mutex *)((char *)value + 40));
  v56 = [(VNModelFileImpl *)v6 initWithMappedModel:v55];
  if (SHIBYTE(v67) < 0) {
    operator delete(__p[0]);
  }

  return v56;
}

- (VNModelFilesCache)init
{
  {
    operator new();
  }
  std::unique_ptr<cvml::util::model_file_cache>::reset[abi:ne180100]((uint64_t *)&self->m_impl, cvml::util::model_file_cache::instance(void)::m_cache_);
  return self;
}

+ (BOOL)useFOpenForModelWithPath:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [&unk_1EF7A7E68 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(&unk_1EF7A7E68);
        }
        if ([v3 containsString:*(void *)(*((void *)&v9 + 1) + 8 * i)])
        {
          BOOL v7 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [&unk_1EF7A7E68 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 0;
LABEL_11:

  return v7;
}

+ (id)sharedInstance
{
  if (+[VNModelFilesCache sharedInstance]::onceToken != -1) {
    dispatch_once(&+[VNModelFilesCache sharedInstance]::onceToken, &__block_literal_global_24776);
  }
  v2 = (void *)+[VNModelFilesCache sharedInstance]::cache;

  return v2;
}

uint64_t __35__VNModelFilesCache_sharedInstance__block_invoke()
{
  +[VNModelFilesCache sharedInstance]::cache = objc_alloc_init(VNModelFilesCache);

  return MEMORY[0x1F41817F8]();
}

@end