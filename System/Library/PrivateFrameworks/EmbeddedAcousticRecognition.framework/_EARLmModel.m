@interface _EARLmModel
+ (void)initialize;
+ (void)removeWithDirectory:(id)a3;
- (BOOL)trainWithData:(id)a3;
- (BOOL)writeToDirectory:(id)a3;
- (_EARLmModel)initWithConfiguration:(id)a3;
- (_EARLmModel)initWithConfiguration:(id)a3 root:(id)a4;
- (double)age;
- (float)weight;
- (id).cxx_construct;
- (id)_initWithModel:(shared_ptr<quasar::LmModel2>)a3;
- (id)deserializeModelData:(id)a3;
- (id)handle;
- (id)initFromDirectory:(id)a3;
- (id)metrics;
- (id)serializedModelWithLanguage:(id)a3 modelData:(id)a4 oovs:(id)a5;
- (shared_ptr<quasar::LmBuildConfig>)buildConfig;
- (shared_ptr<quasar::LmModel2>)model;
- (void)setWeight:(float)a3;
@end

@implementation _EARLmModel

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

- (id)_initWithModel:(shared_ptr<quasar::LmModel2>)a3
{
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)_EARLmModel;
  v4 = [(_EARLmModel *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v7 = *(LmModel2 **)ptr;
    uint64_t v6 = *((void *)ptr + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_model.__cntrl_;
    v5->_model.__ptr_ = v7;
    v5->_model.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
  }
  return v5;
}

- (_EARLmModel)initWithConfiguration:(id)a3 root:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_EARLmModel;
  v8 = [(_EARLmModel *)&v15 init];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v10 = [v9 fileExistsAtPath:v6];

    if (v10)
    {
      if (v6)
      {
        objc_msgSend(v6, "ear_toString");
        if (v7)
        {
LABEL_5:
          objc_msgSend(v7, "ear_toString");
          goto LABEL_11;
        }
      }
      else
      {
        long long buf = 0uLL;
        uint64_t v17 = 0;
        if (v7) {
          goto LABEL_5;
        }
      }
      memset(__p, 0, sizeof(__p));
LABEL_11:
      quasar::makeLmBuildConfig((uint64_t)&buf, (uint64_t)__p);
    }
    v11 = EarLmLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1B1A86000, v11, OS_LOG_TYPE_DEFAULT, "File does not exist %@", (uint8_t *)&buf, 0xCu);
    }

    v12 = 0;
  }
  else
  {
    v12 = (_EARLmModel *)0;
  }

  return v12;
}

- (_EARLmModel)initWithConfiguration:(id)a3
{
  return [(_EARLmModel *)self initWithConfiguration:a3 root:&stru_1F0A64AB0];
}

- (id)initFromDirectory:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_EARLmModel;
  v5 = [(_EARLmModel *)&v15 init];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v7 = [v6 fileExistsAtPath:v4];

    if (v7)
    {
      long long buf = 0uLL;
      uint64_t v17 = 0;
      LOBYTE(v13) = 0;
      char v14 = 0;
      if (v4) {
        objc_msgSend(v4, "ear_toString");
      }
      else {
        memset(v12, 0, sizeof(v12));
      }
      std::string::basic_string[abi:ne180100]<0>(&__p, "");
      quasar::loadLmFromDirectory((uint64_t)v12);
    }
    v8 = EarLmLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1B1A86000, v8, OS_LOG_TYPE_DEFAULT, "File does not exist %@", (uint8_t *)&buf, 0xCu);
    }

    id v9 = 0;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)handle
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_model.__ptr_)
  {
    v3 = [_EARLmHandle alloc];
    ptr = self->_model.__ptr_;
    if (ptr) {
      v5 = (char *)ptr + *(void *)(*(void *)ptr - 24);
    }
    else {
      v5 = 0;
    }
    cntrl = self->_model.__cntrl_;
    id v9 = v5;
    char v10 = cntrl;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    id v7 = [(_EARLmHandle *)v3 _initWithHandle:&v9];
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10);
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (BOOL)trainWithData:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    [v4 data];
    id v6 = v11;
  }
  else
  {
    id v6 = 0;
    v12 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  quasar::buildLm(v6, &self->_buildConfig.__ptr_, &v13);
  shared_ptr<quasar::LmModel2> v7 = v13;
  shared_ptr<quasar::LmModel2> v13 = (shared_ptr<quasar::LmModel2>)0;
  cntrl = self->_model.__cntrl_;
  self->_model = v7;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
    if (v13.__cntrl_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v13.__cntrl_);
    }
  }
  if (v15 < 0) {
    operator delete(__p);
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  BOOL v9 = self->_model.__ptr_ != 0;

  return v9;
}

- (void)setWeight:(float)a3
{
  ptr = self->_model.__ptr_;
  if (ptr) {
    quasar::LmModel2::setWeight((uint64_t)ptr, a3);
  }
}

- (BOOL)writeToDirectory:(id)a3
{
  __p[3] = *(void **)MEMORY[0x1E4F143B8];
  id v4 = a3;
  ptr = self->_model.__ptr_;
  if (ptr)
  {
    if (v4) {
      objc_msgSend(v4, "ear_toString");
    }
    else {
      memset(__p, 0, 24);
    }
    quasar::LmModel2::write(ptr, (uint64_t)__p);
  }

  return 0;
}

+ (void)removeWithDirectory:(id)a3
{
  __p[3] = *(void **)MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3) {
    objc_msgSend(v3, "ear_toString");
  }
  else {
    memset(__p, 0, 24);
  }
  quasar::removeLm((uint64_t)__p);
}

- (id)metrics
{
  v5[9] = *MEMORY[0x1E4F143B8];
  ptr = self->_model.__ptr_;
  if (ptr)
  {
    (*(void (**)(void *__return_ptr))(*(void *)ptr + 16))(v5);
    id v3 = EARHelpers::dictFromPTree((EARHelpers *)v5, (const quasar::PTree *)1);
    quasar::PTree::~PTree((quasar::PTree *)v5);
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (float)weight
{
  ptr = self->_model.__ptr_;
  if (ptr) {
    return quasar::LmModel2::getWeight((quasar::LmModel2 *)ptr);
  }
  else {
    return 0.0;
  }
}

- (double)age
{
  ptr = self->_model.__ptr_;
  if (ptr) {
    return quasar::LmModel2::getAgeSeconds((quasar::LmModel2 *)ptr);
  }
  else {
    return 0.0;
  }
}

- (id)serializedModelWithLanguage:(id)a3 modelData:(id)a4 oovs:(id)a5
{
  v25[5] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

  ptr = self->_buildConfig.__ptr_;
  if (ptr)
  {
    shared_ptr<quasar::LmModel2> v13 = (void *)((char *)ptr + 48);
    if (*((char *)ptr + 71) < 0) {
      shared_ptr<quasar::LmModel2> v13 = (void *)*v13;
    }
    char v14 = [NSString stringWithUTF8String:v13];
    uint64_t v15 = objc_msgSend(v9, "_ear_sha256");
    uint64_t v16 = (void *)v15;
    if (v10 && v11 && v14 && v15)
    {
      v24[0] = @"language";
      v24[1] = @"assetVersion";
      v25[0] = v11;
      v25[1] = v14;
      v24[2] = @"modelTrainingData";
      v24[3] = @"dataHash";
      v25[2] = v9;
      v25[3] = v15;
      v24[4] = @"oovs";
      v25[4] = v10;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:5];
      id v23 = 0;
      uint64_t v18 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v17 format:200 options:0 error:&v23];
      id v19 = v23;
      if (v18)
      {
        id v20 = v18;
      }
      else
      {
        v21 = EarLmLogger();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[_EARLmModel serializedModelWithLanguage:modelData:oovs:]();
        }
      }
    }
    else
    {
      uint64_t v17 = EarLmLogger();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[_EARLmModel serializedModelWithLanguage:modelData:oovs:](v17);
      }
      id v19 = 0;
      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (id)deserializeModelData:(id)a3
{
  id v8 = 0;
  id v3 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:&v8];
  id v4 = v8;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = EarLmLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_EARLmModel deserializeModelData:]();
    }
  }
  return v3;
}

- (shared_ptr<quasar::LmModel2>)model
{
  cntrl = self->_model.__cntrl_;
  *v2 = self->_model.__ptr_;
  v2[1] = (LmModel2 *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (LmModel2 *)self;
  return result;
}

- (shared_ptr<quasar::LmBuildConfig>)buildConfig
{
  cntrl = self->_buildConfig.__cntrl_;
  *v2 = self->_buildConfig.__ptr_;
  v2[1] = (LmBuildConfig *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (LmBuildConfig *)self;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_buildConfig.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  id v4 = self->_model.__cntrl_;
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void)serializedModelWithLanguage:modelData:oovs:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1B1A86000, v0, v1, "Serialization process failed with error: %@", v2, v3, v4, v5, v6);
}

- (void)serializedModelWithLanguage:(os_log_t)log modelData:oovs:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1B1A86000, log, OS_LOG_TYPE_ERROR, "Input data to serialization is nil", v1, 2u);
}

- (void)deserializeModelData:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1B1A86000, v0, v1, "Deserialization process failed with error: %@", v2, v3, v4, v5, v6);
}

@end