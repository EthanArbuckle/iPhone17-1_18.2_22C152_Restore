@interface _EAREuclid
+ (void)initialize;
- (_EAREuclid)initWithConfiguration:(id)a3 euclidEncoderType:(int64_t)a4;
- (_EAREuclid)initWithConfiguration:(id)a3 euclidEncoderType:(int64_t)a4 initFlag:(int64_t)a5;
- (_EAREuclid)initWithConfiguration:(id)a3 euclidEncoderType:(int64_t)a4 initFlag:(int64_t)a5 overrides:(id)a6;
- (id).cxx_construct;
- (id)computeEmbedding:(id)a3;
- (id)computeEmbeddings:(id)a3;
- (id)distanceBetweenSource:(id)a3 target:(id)a4;
- (id)embeddingDim;
- (id)findNearestNeighbors:(id)a3 numberOfNeighbors:(int64_t)a4;
- (id)fullVersion;
- (id)majorVersion;
- (id)maxInputLength;
- (id)minorVersion;
- (id)patchVersion;
@end

@implementation _EAREuclid

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

- (_EAREuclid)initWithConfiguration:(id)a3 euclidEncoderType:(int64_t)a4
{
  return [(_EAREuclid *)self initWithConfiguration:a3 euclidEncoderType:a4 initFlag:0];
}

- (_EAREuclid)initWithConfiguration:(id)a3 euclidEncoderType:(int64_t)a4 initFlag:(int64_t)a5
{
  return [(_EAREuclid *)self initWithConfiguration:a3 euclidEncoderType:a4 initFlag:a5 overrides:0];
}

- (_EAREuclid)initWithConfiguration:(id)a3 euclidEncoderType:(int64_t)a4 initFlag:(int64_t)a5 overrides:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v41);
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x5812000000;
  v36 = __Block_byref_object_copy__5;
  memset(v38, 0, sizeof(v38));
  v37 = __Block_byref_object_dispose__5;
  uint64_t v39 = 0;
  int v40 = 1065353216;
  if (v11)
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __73___EAREuclid_initWithConfiguration_euclidEncoderType_initFlag_overrides___block_invoke;
    v32[3] = &unk_1E5FFEAF0;
    v32[4] = &v33;
    [v11 enumerateKeysAndObjectsUsingBlock:v32];
  }
  if (v10)
  {
    objc_msgSend(v10, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    *(void *)&long long v15 = 0;
  }
  memset(v31, 0, sizeof(v31));
  quasar::SystemConfig::readJsonFile((uint64_t)v41, (uint64_t)__p, v31, (uint64_t)(v34 + 6), 1, 1);
  v42 = (void **)v31;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v42);
  if (SBYTE7(v15) < 0) {
    operator delete(__p[0]);
  }
  if (a5 == 1)
  {
    unsigned int v12 = 1;
    goto LABEL_12;
  }
  if (!a5)
  {
    unsigned int v12 = 0;
LABEL_12:
    if (a4 == 1) {
      quasar::QuasarEuclid::createQuasarEuclid((uint64_t)v41, 1, v12);
    }
    if (!a4) {
      quasar::QuasarEuclid::createQuasarEuclid((uint64_t)v41, 0, v12);
    }
    if (quasar::gLogLevel >= 1)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      *(_OWORD *)__p = 0u;
      kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)__p);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, (uint64_t)"Unrecognized EAREuclidEncoderType: ", 35);
      std::ostream::operator<<();
      quasar::QuasarErrorMessage::~QuasarErrorMessage((quasar::QuasarErrorMessage *)__p);
    }
    goto LABEL_20;
  }
  if (quasar::gLogLevel >= 1)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    *(_OWORD *)__p = 0u;
    kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)__p);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, (uint64_t)"Unrecognized EAREuclidInitFlag: ", 32);
    std::ostream::operator<<();
    quasar::QuasarErrorMessage::~QuasarErrorMessage((quasar::QuasarErrorMessage *)__p);
  }
LABEL_20:
  _Block_object_dispose(&v33, 8);
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)&v38[8]);
  quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)v41);

  return 0;
}

- (id)findNearestNeighbors:(id)a3 numberOfNeighbors:(int64_t)a4
{
  id v6 = a3;
  v7 = v6;
  value = self->_quasarEuclid.__ptr_.__value_;
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
  }
  else
  {
    __p = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
  }
  v9 = (EARLogger *)(*(void *(**)(uint64_t *__return_ptr, QuasarEuclid *, void **, int64_t, void))(*(void *)value + 16))(&v24, value, &__p, a4, 0);
  if (SHIBYTE(v23) < 0) {
    operator delete(__p);
  }
  if (v24 == v25)
  {
    id v10 = EARLogger::QuasarOSLogger(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(__p) = 0;
      _os_log_impl(&dword_1B1A86000, v10, OS_LOG_TYPE_INFO, "No nearest neighbors found", (uint8_t *)&__p, 2u);
    }
  }
  id v11 = objc_opt_new();
  if (v25 != v24)
  {
    uint64_t v12 = 0;
    unint64_t v13 = 0;
    do
    {
      v14 = [_EAREuclidNeighbor alloc];
      long long v15 = objc_msgSend(NSString, "stringWithUTF8String:", __p, v22, v23);
      LODWORD(v16) = *(_DWORD *)(v24 + v12 + 28);
      long long v17 = [NSNumber numberWithFloat:v16];
      long long v18 = [(_EAREuclidNeighbor *)v14 initWithName:v15 distance:v17];

      [v11 addObject:v18];
      ++v13;
      v12 += 32;
    }
    while (v13 < (v25 - v24) >> 5);
  }
  long long v19 = objc_msgSend(v11, "copy", __p);

  __p = &v24;
  std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  return v19;
}

- (id)distanceBetweenSource:(id)a3 target:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  v9 = NSNumber;
  value = self->_quasarEuclid.__ptr_.__value_;
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
    if (v8)
    {
LABEL_3:
      objc_msgSend(v8, "ear_toString");
      goto LABEL_6;
    }
  }
  else
  {
    v16[0] = 0;
    v16[1] = 0;
    uint64_t v17 = 0;
    if (v7) {
      goto LABEL_3;
    }
  }
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v15 = 0;
LABEL_6:
  *(float *)&double v11 = quasar::QuasarEuclid::computeDistance(value, (uint64_t)v16, (uint64_t)__p);
  uint64_t v12 = [v9 numberWithFloat:v11];
  if (SHIBYTE(v15) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v17) < 0) {
    operator delete(v16[0]);
  }

  return v12;
}

- (id)computeEmbedding:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v4 length])
  {
    value = self->_quasarEuclid.__ptr_.__value_;
    if (v4)
    {
      objc_msgSend(v4, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v12 = 0;
    }
    quasar::QuasarEuclid::computeEmbeddingVector(value, (uint64_t)__p, (uint64_t)v13);
    if (SHIBYTE(v12) < 0) {
      operator delete(__p[0]);
    }
    if (v15)
    {
      for (uint64_t i = 0; i < v14; ++i)
      {
        LODWORD(v7) = *(_DWORD *)(v13[1] + 4 * i);
        v9 = [NSNumber numberWithFloat:v7];
        [v5 addObject:v9];

        if (!v15) {
          std::__throw_bad_optional_access[abi:ne180100]();
        }
      }
      kaldi::CuVector<float>::~CuVector(v13);
    }
  }

  return v5;
}

- (id)computeEmbeddings:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __32___EAREuclid_computeEmbeddings___block_invoke;
  v9[3] = &unk_1E5FFEB18;
  id v6 = v5;
  id v10 = v6;
  double v11 = self;
  [v4 enumerateObjectsUsingBlock:v9];
  id v7 = v6;

  return v7;
}

- (id)maxInputLength
{
  v2 = NSNumber;
  uint64_t MaxInputLength = quasar::QuasarEuclid::getMaxInputLength((quasar::TextEmbedder **)self->_quasarEuclid.__ptr_.__value_);
  return (id)[v2 numberWithInt:MaxInputLength];
}

- (id)embeddingDim
{
  v2 = NSNumber;
  uint64_t EmbeddingDim = quasar::QuasarEuclid::getEmbeddingDim((quasar::TextEmbedder **)self->_quasarEuclid.__ptr_.__value_);
  return (id)[v2 numberWithInt:EmbeddingDim];
}

- (id)fullVersion
{
  v2 = NSString;
  quasar::CommandTagging::getCommandId((quasar::CommandTagging *)self->_quasarEuclid.__ptr_.__value_, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  id v4 = [v2 stringWithUTF8String:p_p];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v4;
}

- (id)majorVersion
{
  v2 = NSString;
  quasar::QuasarEuclid::getAssetVersionInVector((long long **)self->_quasarEuclid.__ptr_.__value_, &v5);
  v3 = objc_msgSend(v2, "stringWithUTF8String:");
  id v6 = &v5;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v6);
  return v3;
}

- (id)minorVersion
{
  v2 = NSString;
  quasar::QuasarEuclid::getAssetVersionInVector((long long **)self->_quasarEuclid.__ptr_.__value_, &v6);
  v3 = (void *)(v6.__r_.__value_.__r.__words[0] + 24);
  if (*(char *)(v6.__r_.__value_.__r.__words[0] + 47) < 0) {
    v3 = (void *)*v3;
  }
  id v4 = [v2 stringWithUTF8String:v3];
  id v7 = &v6;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  return v4;
}

- (id)patchVersion
{
  v2 = NSString;
  quasar::QuasarEuclid::getAssetVersionInVector((long long **)self->_quasarEuclid.__ptr_.__value_, &v6);
  v3 = (void *)(v6.__r_.__value_.__r.__words[0] + 48);
  if (*(char *)(v6.__r_.__value_.__r.__words[0] + 71) < 0) {
    v3 = (void *)*v3;
  }
  id v4 = [v2 stringWithUTF8String:v3];
  id v7 = &v6;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  return v4;
}

- (void).cxx_destruct
{
  value = self->_quasarEuclid.__ptr_.__value_;
  self->_quasarEuclid.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end