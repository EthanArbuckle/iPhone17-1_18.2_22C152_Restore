@interface _EARPronunciationRecognition
- (_EARPronunciationRecognition)initWithConfiguration:(id)a3;
- (__n128)transcribeMultipleFromJsonResultsPath:;
- (id).cxx_construct;
- (id)transcribePronunciation:(id)a3;
- (uint64_t)transcribeMultipleFromJsonResultsPath:;
- (void)transcribeMultipleFromJsonResultsPath:;
- (void)transcribeMultipleFromJsonResultsPath:(id)a3;
@end

@implementation _EARPronunciationRecognition

- (_EARPronunciationRecognition)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_EARPronunciationRecognition;
  if ([(_EARPronunciationRecognition *)&v6 init])
  {
    [v4 fileSystemRepresentation];
    std::make_unique[abi:ne180100]<quasar::SystemConfig,char const*>();
  }

  return 0;
}

- (id)transcribePronunciation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4) {
    objc_msgSend(v4, "ear_toString");
  }
  else {
    memset(&v12, 0, sizeof(v12));
  }
  std::string::basic_string[abi:ne180100]<0>(__p, " ");
  quasar::splitAndTrimNoEmpty(&v12, (char *)__p, v13);
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  quasar::ptt::PronunciationRecognizer::run((uint64_t)self->_recognizer.__ptr_.__value_, v13, 0, (long long *)&v12);
  objc_super v6 = [_EARSpeechRecognition alloc];
  v7 = [MEMORY[0x1E4F1CAD0] set];
  id v8 = [(_EARSpeechRecognition *)v6 _initWithNBestList:&v12 useHatText:0 endsOfSentencePunctuations:v7];

  __p[0] = &v12;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  v12.__r_.__value_.__r.__words[0] = (std::string::size_type)v13;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);

  return v8;
}

- (void)transcribeMultipleFromJsonResultsPath:(id)a3
{
  v5[7] = *MEMORY[0x1E4F143B8];
  std::string::basic_string[abi:ne180100]<0>(v3, (char *)[a3 fileSystemRepresentation]);
  quasar::filesystem::Path::Path(v4, v3);
  v5[0] = 0;
  v5[1] = 0;
  v4[11] = v5;
  quasar::createJSONResultRecognitionResultIterator();
}

- (void).cxx_destruct
{
  std::unique_ptr<quasar::ptt::PronunciationRecognizer>::reset[abi:ne180100]((quasar::ptt::PronunciationRecognizer **)&self->_recognizer, 0);
  value = self->_sysConfig.__ptr_.__value_;
  self->_sysConfig.__ptr_.__value_ = 0;
  if (value)
  {
    id v4 = (void (*)(void))*((void *)value->_vptr$OptionsItf + 7);
    v4();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void)transcribeMultipleFromJsonResultsPath:
{
}

- (__n128)transcribeMultipleFromJsonResultsPath:
{
  *(void *)a2 = &unk_1F0A5A860;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (uint64_t)transcribeMultipleFromJsonResultsPath:
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