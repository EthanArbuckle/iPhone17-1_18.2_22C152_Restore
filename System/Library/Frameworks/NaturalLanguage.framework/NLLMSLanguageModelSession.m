@interface NLLMSLanguageModelSession
- (BOOL)enumeratePredictionsForContext:maximumPredictions:maximumTokensPerPrediction:withBlock:;
- (NLLMSLanguageModelSession)initWithLanguageModel:(id)a3 options:(id)a4;
- (__n128)enumeratePredictionsForContext:maximumPredictions:maximumTokensPerPrediction:withBlock:;
- (id).cxx_construct;
- (id)conditionalProbabilityForString:(id)a3 context:(id)a4;
- (id)conditionalProbabilityForToken:(id)a3 context:(id)a4;
- (id)description;
- (int64_t)blocklistStatusForString:(id)a3 matchType:(int64_t)a4;
- (uint64_t)enumeratePredictionsForContext:maximumPredictions:maximumTokensPerPrediction:withBlock:;
- (void)adaptToToken:(id)a3 context:(id)a4;
- (void)enumeratePredictionsForContext:(id)a3 maximumPredictions:(unint64_t)a4 maximumTokensPerPrediction:(unint64_t)a5 withBlock:(id)a6;
- (void)enumeratePredictionsForContext:maximumPredictions:maximumTokensPerPrediction:withBlock:;
- (void)reset;
- (void)unadaptToToken:(id)a3 context:(id)a4;
@end

@implementation NLLMSLanguageModelSession

- (NLLMSLanguageModelSession)initWithLanguageModel:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25[0] = 0;
  v25[1] = 0;
  v24 = (uint64_t *)v25;
  v8 = [v7 objectForKey:@"AppContext"];
  v9 = v8;
  if (v8) {
    v10 = (const std::string::value_type *)[v8 UTF8String];
  }
  else {
    v10 = 0;
  }
  v23 = v10;
  int v22 = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)*MEMORY[0x1E4F720C0]);
  v26 = __p;
  v11 = std::__tree<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v24, __p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v26);
  std::variant<language_modeling::v1::SessionType,std::string>::operator=[abi:ne180100]<language_modeling::v1::SessionType,0,language_modeling::v1::SessionType,0ul,0>((_DWORD *)v11 + 14, &v22);
  if (v21 < 0)
  {
    operator delete(__p[0]);
    if (!v10) {
      goto LABEL_10;
    }
  }
  else if (!v10)
  {
    goto LABEL_10;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)*MEMORY[0x1E4F720F8]);
  v26 = __p;
  v12 = std::__tree<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v24, __p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v26);
  std::__variant_detail::__assignment<std::__variant_detail::__traits<language_modeling::v1::SessionType,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>((uint64_t)v12 + 56, (std::string *)((char *)v12 + 56), &v23);
  if (v21 < 0) {
    operator delete(__p[0]);
  }
LABEL_10:
  v19.receiver = self;
  v19.super_class = (Class)NLLMSLanguageModelSession;
  id v13 = [(NLLanguageModelSession *)&v19 initWithLanguageModel:v6 options:v7];
  if (v13)
  {
    [v6 _underlyingModel];
    language_modeling::v1::LanguageModel::makeSession();
    v14 = (language_modeling::v1::LanguageModelSession *)__p[0];
    __p[0] = 0;
    std::unique_ptr<language_modeling::v1::LanguageModelSession>::reset[abi:ne180100]((language_modeling::v1::LanguageModelSession **)v13 + 2, v14);
    v15 = (language_modeling::v1::LanguageModelSession *)__p[0];
    __p[0] = 0;
    if (v15)
    {
      language_modeling::v1::LanguageModelSession::~LanguageModelSession(v15);
      MEMORY[0x1AD0BB590]();
    }
    v16 = [[NLTokenizer alloc] initWithUnit:0];
    v17 = (void *)*((void *)v13 + 3);
    *((void *)v13 + 3) = v16;
  }
  std::__tree<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>>>::destroy((uint64_t)&v24, v25[0]);

  return (NLLMSLanguageModelSession *)v13;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v9.receiver = self;
  v9.super_class = (Class)NLLMSLanguageModelSession;
  v4 = [(NLLMSLanguageModelSession *)&v9 description];
  v5 = [(NLLanguageModelSession *)self languageModel];
  id v6 = [v5 localization];
  id v7 = objc_msgSend(v3, "stringWithFormat:", @"%@(%@"), v4, v6;

  [v7 appendString:@""]);

  return v7;
}

- (id)conditionalProbabilityForToken:(id)a3 context:(id)a4
{
  id v6 = a3;
  wordSequenceForString((NSString *)a4, self->_tokenizer);
  id v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  id v8 = v6;
  objc_super v9 = (char *)[v8 UTF8String];
  if (self->_session.__ptr_.__value_) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 || v7 == 0)
  {
    v12 = [[NLProbabilityInfo alloc] initWithInvalidProbability];
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, v9);
    int v19 = 0;
    makeContext(v7, (language_modeling::v1::LinguisticContext *)v16);
    uint64_t v13 = language_modeling::v1::LanguageModelSession::conditionalProbability();
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)v16);
    if (v18 < 0) {
      operator delete(__p);
    }
    v12 = [[NLProbabilityInfo alloc] initWithLog10Probability:0 flags:*(double *)&v13];
  }
  v14 = v12;

  return v14;
}

- (id)conditionalProbabilityForString:(id)a3 context:(id)a4
{
  id v6 = (NSString *)a3;
  id v7 = wordSequenceForString((NSString *)a4, self->_tokenizer);
  id v8 = wordSequenceForString(v6, self->_tokenizer);
  objc_super v9 = v8;
  if (self->_session.__ptr_.__value_) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v11 = v10 || v8 == 0;
  unint64_t v12 = 0x1E5C53000;
  if (v11)
  {
LABEL_19:
    v20 = (NLProbabilityInfo *)[objc_alloc(*(Class *)(v12 + 688)) initWithInvalidProbability];
    goto LABEL_20;
  }
  unint64_t v13 = [v8 count];
  v14 = [MEMORY[0x1E4F1CA48] arrayWithArray:v7];
  if (v13)
  {
    uint64_t v15 = 0;
    double v16 = 0.0;
    while (1)
    {
      id v17 = [v9 objectAtIndex:v15];
      char v18 = (char *)[v17 UTF8String];
      if (!v18) {
        break;
      }
      std::string::basic_string[abi:ne180100]<0>(&__p, v18);
      int v25 = 0;
      makeContext(v14, (language_modeling::v1::LinguisticContext *)v22);
      double v19 = COERCE_DOUBLE(language_modeling::v1::LanguageModelSession::conditionalProbability());
      language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)v22);
      if (v24 < 0) {
        operator delete(__p);
      }
      [(NSArray *)v14 addObject:v17];
      double v16 = v16 + v19;

      if (++v15 >= v13) {
        goto LABEL_16;
      }
    }

    unint64_t v12 = 0x1E5C53000uLL;
    goto LABEL_19;
  }
  double v16 = 0.0;
LABEL_16:
  unint64_t v12 = 0x1E5C53000uLL;
  v20 = [[NLProbabilityInfo alloc] initWithLog10Probability:0 flags:v16];

  if (!v20) {
    goto LABEL_19;
  }
LABEL_20:

  return v20;
}

- (void)enumeratePredictionsForContext:(id)a3 maximumPredictions:(unint64_t)a4 maximumTokensPerPrediction:(unint64_t)a5 withBlock:(id)a6
{
  v18[4] = *MEMORY[0x1E4F143B8];
  unint64_t v17 = a4;
  id v16 = a6;
  wordSequenceForString((NSString *)a3, self->_tokenizer);
  id v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  objc_super v9 = v8;
  uint64_t v15 = 0;
  if (self->_session.__ptr_.__value_) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    makeContext(v8, (language_modeling::v1::LinguisticContext *)v14);
    std::string::basic_string[abi:ne180100]<0>(&__p, "");
    BOOL v11 = operator new(0x20uLL);
    void *v11 = &unk_1EFB2FFC8;
    v11[1] = &v16;
    v11[2] = &v15;
    v11[3] = &v17;
    v18[3] = v11;
    language_modeling::v1::LanguageModelSession::enumeratePredictions();
    std::__function::__value_func<BOOL ()(language_modeling::v1::Prediction const&)>::~__value_func[abi:ne180100](v18);
    if (v13 < 0) {
      operator delete(__p);
    }
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)v14);
  }
}

- (int64_t)blocklistStatusForString:(id)a3 matchType:(int64_t)a4
{
  wordSequenceForString((NSString *)a3, self->_tokenizer);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    id v6 = [(NLLanguageModelSession *)self languageModel];
    [v6 _underlyingModel];
    makeContext(v5, (language_modeling::v1::LinguisticContext *)v10);
    int v7 = language_modeling::v1::LanguageModel::blocklistStatus();
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)v10);

    int64_t v8 = v7 != 0;
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (void)adaptToToken:(id)a3 context:(id)a4
{
  id v6 = a3;
  wordSequenceForString((NSString *)a4, self->_tokenizer);
  int v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  id v8 = v6;
  objc_super v9 = (char *)[v8 UTF8String];
  if (self->_session.__ptr_.__value_) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && v7 != 0)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, v9);
    int v15 = 0;
    makeContext(v7, (language_modeling::v1::LinguisticContext *)v12);
    language_modeling::v1::LanguageModelSession::adaptToToken();
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)v12);
    if (v14 < 0) {
      operator delete(__p);
    }
  }
}

- (void)unadaptToToken:(id)a3 context:(id)a4
{
  id v6 = a3;
  wordSequenceForString((NSString *)a4, self->_tokenizer);
  int v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  id v8 = v6;
  objc_super v9 = (char *)[v8 UTF8String];
  if (self->_session.__ptr_.__value_) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && v7 != 0)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, v9);
    int v15 = 0;
    makeContext(v7, (language_modeling::v1::LinguisticContext *)v12);
    language_modeling::v1::LanguageModelSession::unAdaptToToken();
    language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)v12);
    if (v14 < 0) {
      operator delete(__p);
    }
  }
}

- (void)reset
{
  id v2 = [(NLLanguageModelSession *)self languageModel];
  language_modeling::v1::LanguageModel::deallocateInternalBuffers((language_modeling::v1::LanguageModel *)[v2 _underlyingModel]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizer, 0);

  std::unique_ptr<language_modeling::v1::LanguageModelSession>::reset[abi:ne180100]((language_modeling::v1::LanguageModelSession **)&self->_session, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

- (void)enumeratePredictionsForContext:maximumPredictions:maximumTokensPerPrediction:withBlock:
{
}

- (__n128)enumeratePredictionsForContext:maximumPredictions:maximumTokensPerPrediction:withBlock:
{
  *(void *)a2 = &unk_1EFB2FFC8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (BOOL)enumeratePredictionsForContext:maximumPredictions:maximumTokensPerPrediction:withBlock:
{
  v4 = NSString;
  language_modeling::v1::Prediction::string((uint64_t *)__p, this);
  if (v14 >= 0) {
    v5 = __p;
  }
  else {
    v5 = (void **)__p[0];
  }
  id v6 = [v4 stringWithUTF8String:v5];
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  int v7 = [[NLProbabilityInfo alloc] initWithLog10Probability:0 flags:COERCE_DOUBLE(language_modeling::v1::Prediction::probability(this))];
  id v8 = [[NLPredictionInfo alloc] initWithPrediction:v6 contextLength:language_modeling::v1::Prediction::contextSize(this) probabilityInfo:v7];
  LOBYTE(__p[0]) = 0;
  (*(void (**)(void))(*a1[1] + 16))();
  objc_super v9 = a1[2];
  unint64_t v10 = *v9 + 1;
  unint64_t *v9 = v10;
  if (LOBYTE(__p[0])) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v10 < *a1[3];
  }

  return v11;
}

- (uint64_t)enumeratePredictionsForContext:maximumPredictions:maximumTokensPerPrediction:withBlock:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

@end