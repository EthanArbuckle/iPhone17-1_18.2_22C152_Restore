@interface _EARLmModel2
+ (id)deserializeModelData:(id)a3;
+ (void)initialize;
- (BOOL)writeToDirectory:(id)a3;
- (double)age;
- (float)weight;
- (id).cxx_construct;
- (id)_initWithModel:(shared_ptr<quasar::LmModel2>)a3;
- (id)metrics;
- (id)serializedModelWithLanguage:(id)a3 modelData:(id)a4 oovs:(id)a5;
- (shared_ptr<quasar::LmModel2>)model;
- (void)setProtectionClass:(id)a3;
- (void)setWeight:(float)a3;
@end

@implementation _EARLmModel2

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
  if (*(void *)a3.__ptr_) {
    uint64_t v4 = *(void *)a3.__ptr_ + *(void *)(**(void **)a3.__ptr_ - 24);
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
  uint64_t v13 = v4;
  v14 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v12.receiver = self;
  v12.super_class = (Class)_EARLmModel2;
  v6 = -[_EARLmHandle _initWithHandle:](&v12, sel__initWithHandle_, &v13, a3.__cntrl_);
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  if (v6)
  {
    uint64_t v7 = *(void *)ptr;
    if (!*(void *)ptr)
    {
      v10 = 0;
      goto LABEL_16;
    }
    uint64_t v8 = *((void *)ptr + 1);
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    v9 = (std::__shared_weak_count *)v6[4];
    v6[3] = v7;
    v6[4] = v8;
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  v10 = v6;
LABEL_16:

  return v10;
}

- (void)setWeight:(float)a3
{
}

- (BOOL)writeToDirectory:(id)a3
{
  __p[3] = *(void **)MEMORY[0x1E4F143B8];
  id v4 = a3;
  ptr = self->_model.__ptr_;
  if (v4) {
    objc_msgSend(v4, "ear_toString");
  }
  else {
    memset(__p, 0, 24);
  }
  quasar::LmModel2::write(ptr, (uint64_t)__p);
}

- (void)setProtectionClass:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if ((id)*MEMORY[0x1E4F28340] == v4)
  {
    ptr = self->_model.__ptr_;
    int v8 = 1;
LABEL_12:
    *((_DWORD *)ptr + 34) = v8;
    goto LABEL_13;
  }
  if ((id)*MEMORY[0x1E4F28348] == v4)
  {
    ptr = self->_model.__ptr_;
    int v8 = 2;
    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E4F28358] == v4)
  {
    ptr = self->_model.__ptr_;
    int v8 = 3;
    goto LABEL_12;
  }
  if ((id)*MEMORY[0x1E4F28378] == v4)
  {
    ptr = self->_model.__ptr_;
    int v8 = 4;
    goto LABEL_12;
  }
  v6 = EarLmLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1B1A86000, v6, OS_LOG_TYPE_DEFAULT, "Unknown protection class: %@", (uint8_t *)&v9, 0xCu);
  }

LABEL_13:
}

- (id)metrics
{
  v4[9] = *MEMORY[0x1E4F143B8];
  (*(void (**)(void *__return_ptr))(*(void *)self->_model.__ptr_ + 16))(v4);
  v2 = EARHelpers::dictFromPTree((EARHelpers *)v4, (const quasar::PTree *)1);
  quasar::PTree::~PTree((quasar::PTree *)v4);
  return v2;
}

- (float)weight
{
  return quasar::LmModel2::getWeight((quasar::LmModel2 *)self->_model.__ptr_);
}

- (double)age
{
  return quasar::LmModel2::getAgeSeconds((quasar::LmModel2 *)self->_model.__ptr_);
}

- (id)serializedModelWithLanguage:(id)a3 modelData:(id)a4 oovs:(id)a5
{
  v26[5] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

  objc_super v12 = NSString;
  kaldi::quasar::Vocab::OOvWord((kaldi::quasar::Vocab *)self->_model.__ptr_, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  v14 = [v12 stringWithUTF8String:p_p];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  uint64_t v15 = objc_msgSend(v9, "_ear_sha256");
  v16 = (void *)v15;
  if (v10 && v11 && v14 && v15)
  {
    v25[0] = @"language";
    v25[1] = @"assetVersion";
    v26[0] = v11;
    v26[1] = v14;
    v25[2] = @"modelTrainingData";
    v25[3] = @"dataHash";
    v26[2] = v9;
    v26[3] = v15;
    v25[4] = @"oovs";
    v26[4] = v10;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:5];
    id v23 = 0;
    v18 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v17 format:200 options:0 error:&v23];
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
    v17 = EarLmLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[_EARLmModel serializedModelWithLanguage:modelData:oovs:](v17);
    }
    id v19 = 0;
    v18 = 0;
  }

  return v18;
}

+ (id)deserializeModelData:(id)a3
{
  id v8 = 0;
  v3 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:&v8];
  id v4 = v8;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = EarLmLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_EARLmModel deserializeModelData:]();
    }
  }
  return v3;
}

- (shared_ptr<quasar::LmModel2>)model
{
  cntrl = self->_model.__cntrl_;
  void *v2 = self->_model.__ptr_;
  v2[1] = (LmModel2 *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (LmModel2 *)self;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_model.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end