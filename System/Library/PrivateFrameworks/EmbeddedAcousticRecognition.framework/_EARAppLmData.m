@interface _EARAppLmData
+ (void)initialize;
- (BOOL)roundingEnabled;
- (BOOL)setAsrProns:(id)a3 forWord:(id)a4;
- (BOOL)setProns:(id)a3 forWord:(id)a4 pronIsXsampa:(BOOL)a5;
- (BOOL)setXsampaProns:(id)a3 forWord:(id)a4;
- (NSArray)orderedOovs;
- (_EARAppLmData)initWithAppLmData:(shared_ptr<quasar::AppLmData>)a3;
- (_EARAppLmData)initWithConfiguration:(id)a3 ncsRoot:(id)a4 recognizerConfigPath:(id)a5;
- (_EARAppLmData)initWithConfiguration:(id)a3 recognizerConfigPath:(id)a4;
- (id).cxx_construct;
- (id)addOovTokensFromSentence:(id)a3;
- (id)metrics;
- (id)supportedSlots;
- (int64_t)canAddAsrProns:(id)a3 forWord:(id)a4;
- (int64_t)canAddProns:(id)a3 forWord:(id)a4 pronIsXsampa:(BOOL)a5;
- (int64_t)canAddXsampaProns:(id)a3 forWord:(id)a4;
- (int64_t)inputType;
- (int64_t)lmeThreshold;
- (shared_ptr<quasar::AppLmData>)data;
- (void)addLineWithType:(unint64_t)a3 uuid:(id)a4 content:(id)a5;
- (void)addNgramCountWithType:(unint64_t)a3 content:(id)a4;
- (void)addSentenceWithType:(unint64_t)a3 uuid:(id)a4 content:(id)a5;
- (void)addSentenceWithType:(unint64_t)a3 uuid:(id)a4 content:(id)a5 hasWeights:(BOOL)a6;
- (void)generateLmeData:(id)a3;
- (void)setInputFormat:(int64_t)a3;
- (void)setRoundingEnabled:(BOOL)a3;
@end

@implementation _EARAppLmData

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

- (_EARAppLmData)initWithAppLmData:(shared_ptr<quasar::AppLmData>)a3
{
  ptr = a3.__ptr_;
  v11.receiver = self;
  v11.super_class = (Class)_EARAppLmData;
  v4 = [(_EARAppLmData *)&v11 init];
  v5 = v4;
  if (v4)
  {
    p_data = &v4->data;
    v8 = *(AppLmData **)ptr;
    uint64_t v7 = *((void *)ptr + 1);
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->data.__cntrl_;
    p_data->__ptr_ = v8;
    v5->data.__cntrl_ = (__shared_weak_count *)v7;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
  }
  return v5;
}

- (NSArray)orderedOovs
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  quasar::AppLmData::getOrderedOovs((quasar::AppLmData *)self->data.__ptr_, &v9);
  v2 = [MEMORY[0x1E4F1CA48] array];
  v3 = v9;
  for (i = v10; v3 != i; v3 = (long long *)((char *)v3 + 56))
  {
    if (*((char *)v3 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v11, *(const std::string::value_type **)v3, *((void *)v3 + 1));
    }
    else
    {
      long long v5 = *v3;
      v11.__r_.__value_.__r.__words[2] = *((void *)v3 + 2);
      *(_OWORD *)&v11.__r_.__value_.__l.__data_ = v5;
    }
    std::set<std::string>::set[abi:ne180100](v12, (const void ***)v3 + 3);
    int v13 = *((_DWORD *)v3 + 12);
    v6 = _earOovToken((const quasar::AppLmData::Oov *)&v11);
    [v2 addObject:v6];

    std::__tree<std::string>::destroy((uint64_t)v12, (char *)v12[1]);
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v11.__r_.__value_.__l.__data_);
    }
  }
  uint64_t v7 = (void *)[v2 copy];

  v11.__r_.__value_.__r.__words[0] = (std::string::size_type)&v9;
  std::vector<quasar::AppLmData::Oov>::__destroy_vector::operator()[abi:ne180100]((void ***)&v11);
  return (NSArray *)v7;
}

- (_EARAppLmData)initWithConfiguration:(id)a3 recognizerConfigPath:(id)a4
{
  return [(_EARAppLmData *)self initWithConfiguration:a3 ncsRoot:0 recognizerConfigPath:a4];
}

- (_EARAppLmData)initWithConfiguration:(id)a3 ncsRoot:(id)a4 recognizerConfigPath:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)_EARAppLmData;
  std::string v11 = [(_EARAppLmData *)&v30 init];
  if (v11)
  {
    v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v13 = [v12 fileExistsAtPath:v8];

    if (v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v15 = [v14 fileExistsAtPath:v10];

      if (v15)
      {
        uint64_t v29 = 0;
        if (v9) {
          +[_EARQuasarTokenizer tokenizerWithNcsRoot:v9];
        }
        else {
          +[_EARQuasarTokenizer tokenizerWithRecognizerConfigPath:v10];
        }
        uint64_t v17 = buf;
        *(void *)&long long buf = 0;
        uint64_t v29 = v17;
        if (v8)
        {
          objc_msgSend(v8, "ear_toString");
          if (v10)
          {
LABEL_15:
            objc_msgSend(v10, "ear_toString");
            goto LABEL_18;
          }
        }
        else
        {
          long long buf = 0uLL;
          uint64_t v32 = 0;
          if (v10) {
            goto LABEL_15;
          }
        }
        __p[0] = 0;
        __p[1] = 0;
        uint64_t v27 = 0;
LABEL_18:
        std::allocate_shared[abi:ne180100]<quasar::AppLmData,std::allocator<quasar::AppLmData>,std::string,char const(&)[1],std::unique_ptr<quasar::TextTokenizer>,std::string,void>((uint64_t)&buf, "", &v29, (uint64_t)__p, &v28);
        long long v18 = v28;
        long long v28 = 0uLL;
        v19 = (std::__shared_weak_count *)*((void *)v11 + 8);
        *(_OWORD *)(v11 + 56) = v18;
        if (v19)
        {
          std::__shared_weak_count::__release_shared[abi:ne180100](v19);
          if (*((void *)&v28 + 1)) {
            std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v28 + 1));
          }
        }
        if (SHIBYTE(v27) < 0) {
          operator delete(__p[0]);
        }
        if (SHIBYTE(v32) < 0) {
          operator delete((void *)buf);
        }
        v11[40] = 1;
        uint64_t v20 = *(unsigned int *)(*((void *)v11 + 7) + 104);
        if (v20 < 4)
        {
          *((void *)v11 + 6) = v20 + 1;
          uint64_t v21 = v29;
          uint64_t v29 = 0;
          if (v21) {
            (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
          }
          goto LABEL_28;
        }
        *((void *)v11 + 6) = 0;
        v23 = EarLmLogger();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1B1A86000, v23, OS_LOG_TYPE_DEFAULT, "Unsupported input data type", (uint8_t *)&buf, 2u);
        }

        uint64_t v24 = v29;
        uint64_t v29 = 0;
        if (v24) {
          (*(void (**)(uint64_t))(*(void *)v24 + 8))(v24);
        }
LABEL_33:
        v22 = 0;
        goto LABEL_34;
      }
      v16 = EarLmLogger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v10;
        _os_log_impl(&dword_1B1A86000, v16, OS_LOG_TYPE_DEFAULT, "File does not exist %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      v16 = EarLmLogger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_1B1A86000, v16, OS_LOG_TYPE_DEFAULT, "File does not exist %@", (uint8_t *)&buf, 0xCu);
      }
    }

    goto LABEL_33;
  }
LABEL_28:
  v22 = v11;
LABEL_34:

  return v22;
}

- (void)addLineWithType:(unint64_t)a3 uuid:(id)a4 content:(id)a5
{
  int v6 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  ptr = self->data.__ptr_;
  int v14 = v6;
  if (v8)
  {
    objc_msgSend(v8, "ear_toString");
    if (v10)
    {
LABEL_3:
      objc_msgSend(v10, "ear_toString");
      goto LABEL_6;
    }
  }
  else
  {
    v15[0] = 0;
    v15[1] = 0;
    uint64_t v16 = 0;
    if (v9) {
      goto LABEL_3;
    }
  }
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v13 = 0;
LABEL_6:
  quasar::LmData::addLine(ptr, &v14, (uint64_t)v15, (uint64_t)__p);
  if (SHIBYTE(v13) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v16) < 0) {
    operator delete(v15[0]);
  }
}

- (void)addSentenceWithType:(unint64_t)a3 uuid:(id)a4 content:(id)a5 hasWeights:(BOOL)a6
{
  BOOL v6 = a6;
  int v8 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  ptr = self->data.__ptr_;
  int v16 = v8;
  if (v10)
  {
    objc_msgSend(v10, "ear_toString");
    if (v12)
    {
LABEL_3:
      objc_msgSend(v12, "ear_toString");
      goto LABEL_6;
    }
  }
  else
  {
    v17[0] = 0;
    v17[1] = 0;
    uint64_t v18 = 0;
    if (v11) {
      goto LABEL_3;
    }
  }
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v15 = 0;
LABEL_6:
  (*(void (**)(AppLmData *, int *, void **, void **, BOOL, void, void))(*(void *)ptr + 24))(ptr, &v16, v17, __p, v6, 0, 0);
  if (SHIBYTE(v15) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v18) < 0) {
    operator delete(v17[0]);
  }
}

- (void)addSentenceWithType:(unint64_t)a3 uuid:(id)a4 content:(id)a5
{
}

- (void)addNgramCountWithType:(unint64_t)a3 content:(id)a4
{
  int v4 = a3;
  __p[3] = *(void **)MEMORY[0x1E4F143B8];
  id v6 = a4;
  ptr = self->data.__ptr_;
  if (v6) {
    objc_msgSend(v6, "ear_toString");
  }
  else {
    memset(__p, 0, 24);
  }
  quasar::LmData::addNgramCount((uint64_t)ptr, v4, (uint64_t)__p);
}

- (void)setInputFormat:(int64_t)a3
{
  cntrl = self->data.__cntrl_;
  v6[0] = (uint64_t)self->data.__ptr_;
  v6[1] = (uint64_t)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  setInputFormatHelper(v6, a3);
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  self->inputType = a3;
}

- (id)addOovTokensFromSentence:(id)a3
{
  uint64_t v12[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = v4;
  ptr = self->data.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v11 = 0;
  }
  quasar::AppLmData::addOovTokensFromSentence((uint64_t)ptr, (uint64_t)__p, (uint64_t)v12);
  uint64_t v7 = EARHelpers::ContainerToNSSet<std::set<std::string>>(v12);
  std::__tree<std::string>::destroy((uint64_t)v12, (char *)v12[1]);
  if (SHIBYTE(v11) < 0) {
    operator delete(__p[0]);
  }
  int v8 = [v7 allObjects];

  return v8;
}

- (BOOL)setProns:(id)a3 forWord:(id)a4 pronIsXsampa:(BOOL)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  BOOL v24 = a5;
  ptr = self->data.__ptr_;
  if (v9)
  {
    objc_msgSend(v9, "ear_toString");
  }
  else
  {
    v22[0] = 0;
    v22[1] = 0;
    uint64_t v23 = 0;
  }
  id v12 = v8;
  *(_OWORD *)&v21.__r_.__value_.__r.__words[1] = 0uLL;
  v21.__r_.__value_.__r.__words[0] = (std::string::size_type)&v21.__r_.__value_.__l.__size_;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = *(id *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "ear_toString");
        }
        else
        {
          __p[0] = 0;
          __p[1] = 0;
          uint64_t v30 = 0;
        }

        std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string>((uint64_t **)&v21, (const void **)__p, (uint64_t)__p);
        if (SHIBYTE(v30) < 0) {
          operator delete(__p[0]);
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v14);
  }

  char v19 = quasar::AppLmData::setPronsForWord((uint64_t)ptr, v22, &v21, &v24);
  std::__tree<std::string>::destroy((uint64_t)&v21, (char *)v21.__r_.__value_.__l.__size_);
  if (SHIBYTE(v23) < 0) {
    operator delete(v22[0]);
  }

  return v19;
}

- (BOOL)setXsampaProns:(id)a3 forWord:(id)a4
{
  return [(_EARAppLmData *)self setProns:a3 forWord:a4 pronIsXsampa:1];
}

- (BOOL)setAsrProns:(id)a3 forWord:(id)a4
{
  return [(_EARAppLmData *)self setProns:a3 forWord:a4 pronIsXsampa:0];
}

- (int64_t)canAddProns:(id)a3 forWord:(id)a4 pronIsXsampa:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  ptr = self->data.__ptr_;
  if (v9)
  {
    objc_msgSend(v9, "ear_toString");
  }
  else
  {
    v22[0] = 0;
    v22[1] = 0;
    uint64_t v23 = 0;
  }
  id v12 = v8;
  v21[0] = 0;
  v21[1] = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  int64_t v13 = (int64_t)v12;
  uint64_t v14 = objc_msgSend((id)v13, "countByEnumeratingWithState:objects:count:", &v24, v30, 16, v21);
  if (v14)
  {
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation((id)v13);
        }
        id v17 = *(id *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "ear_toString");
        }
        else
        {
          __p[0] = 0;
          __p[1] = 0;
          uint64_t v29 = 0;
        }

        std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string>(&v20, (const void **)__p, (uint64_t)__p);
        if (SHIBYTE(v29) < 0) {
          operator delete(__p[0]);
        }
      }
      uint64_t v14 = [(id)v13 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v14);
  }

  LODWORD(v13) = quasar::AppLmData::canAddProns((uint64_t)ptr, (uint64_t)v22, (uint64_t *)&v20, v5);
  std::__tree<std::string>::destroy((uint64_t)&v20, v21[0]);
  if (SHIBYTE(v23) < 0) {
    operator delete(v22[0]);
  }
  if (v13 >= 4) {
    int64_t v13 = 4;
  }
  else {
    int64_t v13 = v13;
  }

  return v13;
}

- (int64_t)canAddXsampaProns:(id)a3 forWord:(id)a4
{
  return [(_EARAppLmData *)self canAddProns:a3 forWord:a4 pronIsXsampa:1];
}

- (int64_t)canAddAsrProns:(id)a3 forWord:(id)a4
{
  return [(_EARAppLmData *)self canAddProns:a3 forWord:a4 pronIsXsampa:0];
}

- (void)generateLmeData:(id)a3
{
  id v3 = a3;
  if (v3) {
    objc_msgSend(v3, "ear_toString");
  }
  quasar::AppLmData::generateLmeData();
}

- (int64_t)lmeThreshold
{
  return quasar::AppLmData::getLmeThreshold((quasar::AppLmData *)self->data.__ptr_);
}

- (id)supportedSlots
{
  quasar::AppLmData::getSupportedSlots((uint64_t *)self->data.__ptr_, (uint64_t)v5);
  v2 = EARHelpers::ContainerToNSSet<std::set<std::string>>(v5);
  std::__tree<std::string>::destroy((uint64_t)v5, (char *)v5[1]);
  id v3 = [v2 allObjects];

  return v3;
}

- (id)metrics
{
  v4[9] = *MEMORY[0x1E4F143B8];
  quasar::LmData::getMetrics((quasar::LmData *)self->data.__ptr_, self->roundingEnabled, (quasar::PTree *)v4);
  v2 = EARHelpers::dictFromPTree((EARHelpers *)v4, (const quasar::PTree *)1);
  quasar::PTree::~PTree((quasar::PTree *)v4);
  return v2;
}

- (shared_ptr<quasar::AppLmData>)data
{
  cntrl = self->data.__cntrl_;
  void *v2 = self->data.__ptr_;
  v2[1] = (AppLmData *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (AppLmData *)self;
  return result;
}

- (BOOL)roundingEnabled
{
  return self->roundingEnabled;
}

- (void)setRoundingEnabled:(BOOL)a3
{
  self->roundingEnabled = a3;
}

- (int64_t)inputType
{
  return self->inputType;
}

- (void).cxx_destruct
{
  cntrl = self->data.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  return self;
}

@end