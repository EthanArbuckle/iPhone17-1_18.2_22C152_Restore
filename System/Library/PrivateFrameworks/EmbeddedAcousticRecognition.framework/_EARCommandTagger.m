@interface _EARCommandTagger
+ (void)initialize;
- (BOOL)isCommandPhraseTag:(id)a3;
- (BOOL)isParameterTag:(id)a3;
- (_EARCommandTagger)initWithConfiguration:(id)a3 usage:(int64_t)a4;
- (id).cxx_construct;
- (id)commandPhraseTagForIndex:(int64_t)a3;
- (id)commandTaggingFromRecognitionResult:(id)a3 activeCommands:(id)a4;
- (id)parameterTagForIndex:(int64_t)a3;
@end

@implementation _EARCommandTagger

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

- (_EARCommandTagger)initWithConfiguration:(id)a3 usage:(int64_t)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_EARCommandTagger;
  v7 = [(_EARCommandTagger *)&v18 init];
  if (v7)
  {
    if (!a4)
    {
      quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v17);
      if (v6)
      {
        objc_msgSend(v6, "ear_toString");
      }
      else
      {
        __p[0] = 0;
        __p[1] = 0;
        uint64_t v16 = 0;
      }
      memset(v14, 0, sizeof(v14));
      *(_OWORD *)v11 = 0u;
      long long v12 = 0u;
      int v13 = 1065353216;
      int JsonFile = quasar::SystemConfig::readJsonFile((uint64_t)v17, (uint64_t)__p, v14, (uint64_t)v11, 0, 0);
      std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v11);
      v11[0] = v14;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v11);
      if (SHIBYTE(v16) < 0) {
        operator delete(__p[0]);
      }
      if (JsonFile != 2) {
        operator new();
      }
      quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)v17);
    }
    v9 = 0;
  }
  else
  {
    v9 = (_EARCommandTagger *)0;
  }

  return v9;
}

- (id)commandTaggingFromRecognitionResult:(id)a3 activeCommands:(id)a4
{
  id v6 = a3;
  EARHelpers::StdSetOfStringsFromNSSet((EARHelpers *)a4, (uint64_t)v15);
  long long v12 = 0;
  int v13 = 0;
  uint64_t v14 = 0;
  value = (uint64_t *)self->_tagger.__ptr_.__value_;
  EARHelpers::QuasarPreItnNbestFromEARNBest(v6, (uint64_t *)v11);
  quasar::CommandTagger::run(value, (uint64_t *)v11, (uint64_t *)&v12, (uint64_t)v15);
  v17 = v11;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v17);
  memset(v10, 0, sizeof(v10));
  std::vector<std::vector<quasar::CommandTagging>>::__init_with_size[abi:ne180100]<std::vector<quasar::CommandTagging>*,std::vector<quasar::CommandTagging>*>(v10, v12, v13, 0xAAAAAAAAAAAAAAABLL * (v13 - v12));
  v8 = EARHelpers::EARCommandTaggingResultArrayFromQuasarResults(v10);
  v11[0] = (void **)v10;
  std::vector<std::vector<quasar::CommandTagging>>::__destroy_vector::operator()[abi:ne180100](v11);
  v11[0] = (void **)&v12;
  std::vector<std::vector<quasar::CommandTagging>>::__destroy_vector::operator()[abi:ne180100](v11);
  std::__tree<std::string>::destroy((uint64_t)v15, v16);

  return v8;
}

- (id)parameterTagForIndex:(int64_t)a3
{
  v3 = NSString;
  quasar::CommandTagger::getParameterTag((quasar::CommandTagger *)self->_tagger.__ptr_.__value_);
  if (v8 >= 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
  v5 = [v3 stringWithUTF8String:p_p];
  if (v8 < 0) {
    operator delete(__p);
  }
  return v5;
}

- (id)commandPhraseTagForIndex:(int64_t)a3
{
  v3 = NSString;
  quasar::CommandTagger::getCommandPhraseTag((quasar::CommandTagger *)self->_tagger.__ptr_.__value_);
  if (v8 >= 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
  v5 = [v3 stringWithUTF8String:p_p];
  if (v8 < 0) {
    operator delete(__p);
  }
  return v5;
}

- (BOOL)isParameterTag:(id)a3
{
  id v4 = a3;
  v5 = v4;
  value = self->_tagger.__ptr_.__value_;
  if (v4) {
    objc_msgSend(v4, "ear_toString");
  }
  else {
    memset(&__p, 0, sizeof(__p));
  }
  BOOL isParameterTag = quasar::CommandTagger::isParameterTag((uint64_t)value, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  return isParameterTag;
}

- (BOOL)isCommandPhraseTag:(id)a3
{
  id v4 = a3;
  v5 = v4;
  value = self->_tagger.__ptr_.__value_;
  if (v4) {
    objc_msgSend(v4, "ear_toString");
  }
  else {
    memset(&__p, 0, sizeof(__p));
  }
  BOOL isCommandPhraseTag = quasar::CommandTagger::isCommandPhraseTag((uint64_t)value, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  return isCommandPhraseTag;
}

- (void).cxx_destruct
{
  value = self->_tagger.__ptr_.__value_;
  self->_tagger.__ptr_.__value_ = 0;
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