@interface EMTCompiler
- (BOOL)compile;
- (BOOL)isCompileRequired;
- (EMTCompiler)initWithModelURLs:(id)a3;
- (id).cxx_construct;
@end

@implementation EMTCompiler

- (EMTCompiler)initWithModelURLs:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  v39.receiver = self;
  v39.super_class = (Class)EMTCompiler;
  v4 = [(EMTCompiler *)&v39 init];
  v17 = v4;
  if (v4)
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x4812000000;
    v35 = __Block_byref_object_copy__0;
    v36 = __Block_byref_object_dispose__0;
    v37 = &unk_1B27252DB;
    memset(v38, 0, sizeof(v38));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v16;
    uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v29 != v6) {
            objc_enumerationMutation(obj);
          }
          v8 = [*(id *)(*((void *)&v28 + 1) + 8 * i) URLByAppendingPathComponent:@"mt-quasar-config.json"];
          quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v27);
          id v9 = v8;
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v9 fileSystemRepresentation]);
          memset(v24, 0, sizeof(v24));
          memset(v22, 0, sizeof(v22));
          int v23 = 1065353216;
          quasar::SystemConfig::readJsonFile((uint64_t)v27, (uint64_t)__p, v24, (uint64_t)v22, 0, 0);
          std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v22);
          *(void *)&v22[0] = v24;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v22);
          if (v26 < 0) {
            operator delete(__p[0]);
          }
          v10 = v33;
          unint64_t v11 = v33[7];
          if (v11 >= v33[8])
          {
            uint64_t v12 = std::vector<quasar::SystemConfig>::__push_back_slow_path<quasar::SystemConfig const&>(v33 + 6, (const quasar::SystemConfig *)v27);
          }
          else
          {
            quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v33[7], (const quasar::SystemConfig *)v27, 1, 1);
            uint64_t v12 = v11 + 1544;
            v10[7] = v11 + 1544;
          }
          v10[7] = v12;
          quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)v27);
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
      }
      while (v5);
    }

    v13 = +[EMTTranslationQueue globalTranslationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__EMTCompiler_initWithModelURLs___block_invoke;
    block[3] = &unk_1E5FFE198;
    v20 = v17;
    v21 = &v32;
    dispatch_sync(v13, block);

    _Block_object_dispose(&v32, 8);
    v27[0] = (void **)v38;
    std::vector<quasar::SystemConfig>::__destroy_vector::operator()[abi:ne180100](v27);
    v4 = v17;
  }
  v14 = v4;

  return v14;
}

void __33__EMTCompiler_initWithModelURLs___block_invoke(uint64_t a1)
{
  std::allocate_shared[abi:ne180100]<quasar::TranslatorCompiler,std::allocator<quasar::TranslatorCompiler>,std::vector<quasar::SystemConfig> &,void>(&v5);
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = v5;
  long long v5 = 0uLL;
  v4 = *(std::__shared_weak_count **)(v2 + 16);
  *(_OWORD *)(v2 + 8) = v3;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  if (*((void *)&v5 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v5 + 1));
  }
}

- (BOOL)compile
{
  return quasar::TranslatorCompiler::compile((quasar::TranslatorCompiler *)self->_translatorCompiler.__ptr_);
}

- (BOOL)isCompileRequired
{
  return quasar::TranslatorCompiler::isCompileRequired((quasar::TranslatorCompiler *)self->_translatorCompiler.__ptr_);
}

- (void).cxx_destruct
{
  cntrl = self->_translatorCompiler.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end