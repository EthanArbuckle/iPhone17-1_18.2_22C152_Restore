@interface _EARLmData
+ (void)initialize;
- (BOOL)roomForMoreData;
- (BOOL)roundingEnabled;
- (_EARLmData)initWithConfiguration:(id)a3 ncsRoot:(id)a4 recognizerConfiguration:(id)a5;
- (_EARLmData)initWithConfiguration:(id)a3 recognizerConfiguration:(id)a4;
- (double)maxAge;
- (double)minAge;
- (id).cxx_construct;
- (id)metrics;
- (id)sources;
- (id)wordFrequency;
- (int64_t)inputType;
- (shared_ptr<quasar::PersonalizedLmData>)data;
- (unint64_t)queryLimit;
- (void)addDocumentWithUUID:(id)a3 content:(id)a4;
- (void)addDocumentWithUUID:(id)a3 content:(id)a4 metadata:(id)a5;
- (void)addLineWithType:(unint64_t)a3 uuid:(id)a4 content:(id)a5;
- (void)addNgramCountWithType:(unint64_t)a3 content:(id)a4;
- (void)addSentenceWithType:(unint64_t)a3 uuid:(id)a4 content:(id)a5;
- (void)addSentenceWithType:(unint64_t)a3 uuid:(id)a4 content:(id)a5 hasWeights:(BOOL)a6;
- (void)enumerateSentencesOfType:(unint64_t)a3 block:(id)a4;
- (void)setInputFormat:(int64_t)a3;
- (void)setRoundingEnabled:(BOOL)a3;
@end

@implementation _EARLmData

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

- (_EARLmData)initWithConfiguration:(id)a3 recognizerConfiguration:(id)a4
{
  return [(_EARLmData *)self initWithConfiguration:a3 ncsRoot:0 recognizerConfiguration:a4];
}

- (_EARLmData)initWithConfiguration:(id)a3 ncsRoot:(id)a4 recognizerConfiguration:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)_EARLmData;
  v11 = [(_EARLmData *)&v31 init];
  if (v11)
  {
    v12 = EarLmLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1B1A86000, v12, OS_LOG_TYPE_DEFAULT, "Initializing %@", (uint8_t *)&buf, 0xCu);
    }

    v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v14 = [v13 fileExistsAtPath:v8];

    if ((v14 & 1) == 0)
    {
      v15 = EarLmLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_1B1A86000, v15, OS_LOG_TYPE_DEFAULT, "File does not exist %@", (uint8_t *)&buf, 0xCu);
      }

      goto LABEL_31;
    }
    uint64_t v30 = 0;
    if (v9) {
      +[_EARQuasarTokenizer tokenizerWithNcsRoot:v9];
    }
    else {
      +[_EARQuasarTokenizer tokenizerWithRecognizerConfigPath:v8];
    }
    uint64_t v16 = buf;
    *(void *)&long long buf = 0;
    uint64_t v30 = v16;
    if (v8)
    {
      objc_msgSend(v8, "ear_toString");
      if (v10)
      {
LABEL_13:
        objc_msgSend(v10, "ear_toString");
        goto LABEL_16;
      }
    }
    else
    {
      long long buf = 0uLL;
      uint64_t v33 = 0;
      if (v10) {
        goto LABEL_13;
      }
    }
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v28 = 0;
LABEL_16:
    unsigned __int8 v26 = 1;
    unsigned __int8 v25 = 1;
    std::allocate_shared[abi:ne180100]<quasar::PersonalizedLmData,std::allocator<quasar::PersonalizedLmData>,std::string,char const(&)[1],std::unique_ptr<quasar::TextTokenizer>,std::string,BOOL,BOOL,void>((uint64_t)&buf, "", &v30, (uint64_t)__p, &v26, &v25, &v29);
    long long v17 = v29;
    long long v29 = 0uLL;
    v18 = (std::__shared_weak_count *)*((void *)v11 + 4);
    *(_OWORD *)(v11 + 24) = v17;
    if (v18)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
      if (*((void *)&v29 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v29 + 1));
      }
    }
    if (SHIBYTE(v28) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v33) < 0) {
      operator delete((void *)buf);
    }
    v11[8] = 1;
    uint64_t v19 = *(unsigned int *)(*((void *)v11 + 3) + 104);
    if (v19 < 4)
    {
      *((void *)v11 + 2) = v19 + 1;
      uint64_t v20 = v30;
      uint64_t v30 = 0;
      if (v20) {
        (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
      }
      goto LABEL_26;
    }
    *((void *)v11 + 2) = 0;
    v22 = EarLmLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B1A86000, v22, OS_LOG_TYPE_DEFAULT, "Unsupported input data type", (uint8_t *)&buf, 2u);
    }

    uint64_t v23 = v30;
    uint64_t v30 = 0;
    if (v23) {
      (*(void (**)(uint64_t))(*(void *)v23 + 8))(v23);
    }
LABEL_31:
    v21 = 0;
    goto LABEL_32;
  }
LABEL_26:
  v21 = v11;
LABEL_32:

  return v21;
}

- (void)addDocumentWithUUID:(id)a3 content:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    ptr = self->_data.__ptr_;
    objc_msgSend(v6, "ear_toString");
    objc_msgSend(v8, "ear_toString");
    unsigned int v10 = 0;
    quasar::PersonalizedLmData::addDocument((uint64_t)ptr, (uint64_t)&v13, (uint64_t)&__p, &v10);
    if (v12 < 0) {
      operator delete(__p);
    }
    if (v14 < 0) {
      operator delete(v13);
    }
  }
}

- (void)addDocumentWithUUID:(id)a3 content:(id)a4 metadata:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v8 && v9)
  {
    char v12 = [v10 valueForKey:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [v11 valueForKey:@"type"];

      if (v13)
      {
        ptr = self->_data.__ptr_;
        objc_msgSend(v8, "ear_toString");
        objc_msgSend(v9, "ear_toString");
        unsigned int v16 = [v13 intValue];
        quasar::PersonalizedLmData::addDocument((uint64_t)ptr, (uint64_t)buf, (uint64_t)&__p, &v16);
        if (v18 < 0) {
          operator delete(__p);
        }
        if (v20 < 0) {
          operator delete(*(void **)buf);
        }
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
    }
    uint64_t v15 = EarLmLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B1A86000, v15, OS_LOG_TYPE_DEFAULT, "Document type is not set properly", buf, 2u);
    }

    v13 = 0;
    goto LABEL_13;
  }
LABEL_14:
}

- (void)addLineWithType:(unint64_t)a3 uuid:(id)a4 content:(id)a5
{
  int v6 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v8 && v9)
  {
    ptr = self->_data.__ptr_;
    int v14 = v6;
    objc_msgSend(v8, "ear_toString");
    objc_msgSend(v10, "ear_toString");
    quasar::LmData::addLine(ptr, &v14, (uint64_t)&v15, (uint64_t)&__p);
    if (v13 < 0) {
      operator delete(__p);
    }
    if (v16 < 0) {
      operator delete(v15);
    }
  }
}

- (void)addSentenceWithType:(unint64_t)a3 uuid:(id)a4 content:(id)a5 hasWeights:(BOOL)a6
{
  BOOL v6 = a6;
  int v8 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  char v12 = v11;
  if (v10 && v11)
  {
    ptr = self->_data.__ptr_;
    int v16 = v8;
    objc_msgSend(v10, "ear_toString");
    objc_msgSend(v12, "ear_toString");
    (*(void (**)(PersonalizedLmData *, int *, void **, void **, BOOL, void, void))(*(void *)ptr + 24))(ptr, &v16, &v17, &__p, v6, 0, 0);
    if (v15 < 0) {
      operator delete(__p);
    }
    if (v18 < 0) {
      operator delete(v17);
    }
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
  if (v6)
  {
    ptr = self->_data.__ptr_;
    objc_msgSend(v6, "ear_toString");
    quasar::LmData::addNgramCount((uint64_t)ptr, v4, (uint64_t)__p);
  }
}

- (void)setInputFormat:(int64_t)a3
{
  cntrl = self->_data.__cntrl_;
  v6[0] = (uint64_t)self->_data.__ptr_;
  v6[1] = (uint64_t)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  setInputFormatHelper(v6, a3);
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  self->_inputType = a3;
}

- (void)enumerateSentencesOfType:(unint64_t)a3 block:(id)a4
{
  unsigned int v4 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *, unsigned char *))a4;
  char v17 = 0;
  Sentences = (quasar::lm::TokenStringAndCount **)quasar::LmData::getSentences((uint64_t)self->_data.__ptr_, v4);
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  int v8 = std::vector<quasar::lm::TokenStringAndCount>::__init_with_size[abi:ne180100]<quasar::lm::TokenStringAndCount*,quasar::lm::TokenStringAndCount*>((quasar::lm::TokenStringAndCount *)&v19, *Sentences, Sentences[1], (Sentences[1] - *Sentences) >> 7);
  uint64_t v9 = v19;
  for (uint64_t i = v20; v9 != i; v9 += 128)
  {
    id v11 = (void *)MEMORY[0x1B3EA9930](v8);
    if (!v17)
    {
      char v12 = objc_opt_new();
      int v14 = *(uint64_t **)(v9 + 104);
      char v13 = *(uint64_t **)(v9 + 112);
      while (v14 != v13)
      {
        char v15 = v14;
        if (*((char *)v14 + 23) < 0) {
          char v15 = (uint64_t *)*v14;
        }
        int v16 = [NSString stringWithUTF8String:v15];
        [v12 addObject:v16];

        v14 += 3;
      }
      v6[2](v6, v12, &v17);
    }
  }
  char v18 = (void **)&v19;
  std::vector<quasar::lm::TokenStringAndCount>::__destroy_vector::operator()[abi:ne180100](&v18);
}

- (BOOL)roomForMoreData
{
  return quasar::LmData::hasRoomForMoreData((quasar::LmData *)self->_data.__ptr_);
}

- (id)sources
{
  Sources = (long long **)quasar::LmData::getSources((quasar::LmData *)self->_data.__ptr_);
  return EARHelpers::VectorToArray<std::string>(Sources);
}

- (unint64_t)queryLimit
{
  return quasar::LmData::getQueryLimit((quasar::LmData *)self->_data.__ptr_);
}

- (double)maxAge
{
  return quasar::LmData::getMaxAgeSeconds((quasar::LmData *)self->_data.__ptr_);
}

- (double)minAge
{
  return quasar::LmData::getMinAgeSeconds((quasar::LmData *)self->_data.__ptr_);
}

- (id)metrics
{
  v4[9] = *MEMORY[0x1E4F143B8];
  quasar::LmData::getMetrics((quasar::LmData *)self->_data.__ptr_, self->_roundingEnabled, (quasar::PTree *)v4);
  v2 = EARHelpers::dictFromPTree((EARHelpers *)v4, (const quasar::PTree *)1);
  quasar::PTree::~PTree((quasar::PTree *)v4);
  return v2;
}

- (id)wordFrequency
{
  uint64_t WordFrequency = quasar::LmData::getWordFrequency((quasar::LmData *)self->_data.__ptr_);
  v3 = objc_opt_new();
  for (uint64_t i = *(uint64_t **)(WordFrequency + 16); i; uint64_t i = (uint64_t *)*i)
  {
    v5 = [NSNumber numberWithInt:*((unsigned int *)i + 10)];
    id v6 = i + 2;
    if (*((char *)i + 39) < 0) {
      id v6 = (void *)*v6;
    }
    id v7 = [NSString stringWithUTF8String:v6];
    [v3 setValue:v5 forKey:v7];
  }
  return v3;
}

- (BOOL)roundingEnabled
{
  return self->_roundingEnabled;
}

- (void)setRoundingEnabled:(BOOL)a3
{
  self->_roundingEnabled = a3;
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (shared_ptr<quasar::PersonalizedLmData>)data
{
  cntrl = self->_data.__cntrl_;
  void *v2 = self->_data.__ptr_;
  v2[1] = (PersonalizedLmData *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (PersonalizedLmData *)self;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_data.__cntrl_;
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