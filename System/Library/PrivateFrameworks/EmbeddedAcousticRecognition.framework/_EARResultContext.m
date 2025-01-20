@interface _EARResultContext
- (BOOL)anyResults;
- (NSDictionary)prevMuxPackages;
- (_EARSpeechRecognitionResultPackage)prevPackage;
- (_EARSpeechRecognitionResultPackage)prevPackageWithoutPersonalization;
- (basic_string<char,)prevBestRecogText;
- (id).cxx_construct;
- (id)description;
- (shared_ptr<EARContinuousListeningResultHelper>)continuousListeningResultHelper;
- (unint64_t)countOfIsFinalFalseAlreadyWritten;
- (unint64_t)partialResultIndexOffset;
- (vector<double,)loggableConcatCosts;
- (vector<std::vector<quasar::Token>,)loggableConcatResult;
- (vector<std::vector<quasar::Token>,)partialResults;
- (void)addPartialResultToContext:(const void *)a3;
- (void)incrementCountOfIsFinalFalseAlreadyWritten;
- (void)resetPartialResultContext;
- (void)setAnyResults:(BOOL)a3;
- (void)setContinuousListeningResultHelper:(shared_ptr<EARContinuousListeningResultHelper>)a3;
- (void)setCountOfIsFinalFalseAlreadyWritten:(unint64_t)a3;
- (void)setLoggableConcatCosts:()vector<double;
- (void)setLoggableConcatResult:()vector<std:(std::allocator<std::vector<quasar::Token>>> *)a3 :vector<quasar::Token>;
- (void)setPrevBestRecogText:()basic_string<char;
- (void)setPrevMuxPackages:(id)a3;
- (void)setPrevPackage:(id)a3;
- (void)setPrevPackageWithoutPersonalization:(id)a3;
- (void)updateLoggableResultWithCurrentResult:(const void *)a3 currentCosts:(const void *)a4 startMilliseconds:(unsigned int)a5;
@end

@implementation _EARResultContext

- (void)incrementCountOfIsFinalFalseAlreadyWritten
{
}

- (void)addPartialResultToContext:(const void *)a3
{
  p_var0 = (uint64_t *)&self->_prevBestRecogText.__r_.var0;
  var0 = (void *)self->_prevBestRecogText.var0;
  if (var0 >= self->_partialResults.__begin_)
  {
    int64_t v7 = std::vector<std::vector<quasar::Token>>::__push_back_slow_path<std::vector<quasar::Token> const&>(p_var0, (uint64_t *)a3);
  }
  else
  {
    std::vector<std::vector<quasar::Token>>::__construct_one_at_end[abi:ne180100]<std::vector<quasar::Token> const&>((uint64_t)p_var0, (uint64_t *)a3);
    int64_t v7 = (int64_t)var0 + 24;
  }
  self->_prevBestRecogText.var0 = v7;
  if (quasar::gLogLevel >= 6)
  {
    memset(v12, 0, sizeof(v12));
    kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)v12);
    v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"[TTAW] partialResult: ", 22);
    quasar::tokens2Str((uint64_t *)a3, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)p_p, size);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    quasar::QuasarTraceMessage::~QuasarTraceMessage((quasar::QuasarTraceMessage *)v12);
  }
}

- (void)resetPartialResultContext
{
  int64_t v3 = *(void *)&self->_prevBestRecogText.__r_.var0;
  var0 = (void **)self->_prevBestRecogText.var0;
  self->_partialResultIndexOffset -= 0x5555555555555555 * (((uint64_t)var0 - v3) >> 3);
  while (var0 != (void **)v3)
  {
    var0 -= 3;
    v5 = var0;
    std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v5);
  }
  self->_prevBestRecogText.var0 = v3;
}

- (id)description
{
  int64_t v3 = NSString;
  v4 = [NSNumber numberWithBool:self->_anyResults];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_countOfIsFinalFalseAlreadyWritten];
  v6 = (void *)v5;
  p_prevBestRecogText = &self->_prevBestRecogText;
  if (*((char *)&self->_prevBestRecogText.__r_.__value_.var0.var1 + 23) < 0) {
    p_prevBestRecogText = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_prevBestRecogText->__r_.__value_.var0.var1.__data_;
  }
  v8 = [v3 stringWithFormat:@"anyResults=%@, countOfIsFinalFalseAlreadyWritten=%@, prevBestRecogText=%s", v4, v5, p_prevBestRecogText];

  return v8;
}

- (void)updateLoggableResultWithCurrentResult:(const void *)a3 currentCosts:(const void *)a4 startMilliseconds:(unsigned int)a5
{
  if (a5 <= 0xEA60)
  {
    uint64_t v22 = 0;
    v23 = 0;
    unint64_t v24 = 0;
    uint64_t v5 = *(const quasar::Token ***)a3;
    v6 = (const quasar::Token **)*((void *)a3 + 1);
    if (*(const quasar::Token ***)a3 != v6)
    {
      char v8 = 0;
      do
      {
        v19 = 0;
        v20 = 0;
        unint64_t v21 = 0;
        v10 = *v5;
        v9 = v5[1];
        if (*v5 != v9)
        {
          v11 = 0;
          do
          {
            if (*((_DWORD *)v10 + 9) + a5 <= 0xEA60)
            {
              if ((unint64_t)v11 >= v21)
              {
                v11 = (std::string *)std::vector<quasar::Token>::__push_back_slow_path<quasar::Token const&>((uint64_t *)&v19, v10);
              }
              else
              {
                quasar::Token::Token(v11, v10);
                v11 = (std::string *)((char *)v11 + 224);
              }
              v20 = v11;
              char v8 = 1;
            }
            v10 = (const quasar::Token *)((char *)v10 + 224);
          }
          while (v10 != v9);
        }
        v12 = v23;
        if ((unint64_t)v23 >= v24)
        {
          uint64_t v13 = std::vector<std::vector<quasar::Token>>::__push_back_slow_path<std::vector<quasar::Token> const&>(&v22, (uint64_t *)&v19);
        }
        else
        {
          void *v23 = 0;
          v12[1] = 0;
          v12[2] = 0;
          std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v12, (uint64_t)v19, (uint64_t)v20, 0x6DB6DB6DB6DB6DB7 * (((char *)v20 - (char *)v19) >> 5));
          uint64_t v13 = (uint64_t)(v12 + 3);
        }
        v23 = (void *)v13;
        v25 = &v19;
        std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v25);
        v5 += 3;
      }
      while (v5 != v6);
      if (v8)
      {
        if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v23 - v22) >> 3) == (uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3)
        {
          quasar::concatNbest((uint64_t *)&self->_partialResults.__end_, (uint64_t)&self->_loggableConcatResult.__end_, &v22, (uint64_t *)a4, a5, 0xAu, v15);
        }
        else
        {
          v16 = EARLogger::QuasarOSLogger(v14);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
            -[_EARResultContext updateLoggableResultWithCurrentResult:currentCosts:startMilliseconds:]();
          }
        }
      }
    }
    v19 = (void **)&v22;
    std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100](&v19);
  }
}

- (basic_string<char,)prevBestRecogText
{
  if (result[2].__r_.__value_.var0.var0.__data_[15] < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)retstr, (const std::string::value_type *)result[1].var0, (std::string::size_type)result[2].__r_.__value_.var0.var1.__data_);
  }
  else
  {
    *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&result[1].var0;
    *((void *)&retstr->__r_.__value_.var0.var1 + 2) = result[2].__r_.__value_.var0.var1.__size_;
  }
  return result;
}

- (void)setPrevBestRecogText:()basic_string<char
{
  std::string::operator=((std::string *)&self->_prevBestRecogText, (const std::string *)a3);
}

- (unint64_t)countOfIsFinalFalseAlreadyWritten
{
  return self->_countOfIsFinalFalseAlreadyWritten;
}

- (void)setCountOfIsFinalFalseAlreadyWritten:(unint64_t)a3
{
  self->_countOfIsFinalFalseAlreadyWritten = a3;
}

- (_EARSpeechRecognitionResultPackage)prevPackage
{
  return self->_prevPackage;
}

- (void)setPrevPackage:(id)a3
{
}

- (NSDictionary)prevMuxPackages
{
  return self->_prevMuxPackages;
}

- (void)setPrevMuxPackages:(id)a3
{
}

- (_EARSpeechRecognitionResultPackage)prevPackageWithoutPersonalization
{
  return self->_prevPackageWithoutPersonalization;
}

- (void)setPrevPackageWithoutPersonalization:(id)a3
{
}

- (BOOL)anyResults
{
  return self->_anyResults;
}

- (void)setAnyResults:(BOOL)a3
{
  self->_anyResults = a3;
}

- (shared_ptr<EARContinuousListeningResultHelper>)continuousListeningResultHelper
{
  cntrl = self->_continuousListeningResultHelper.__cntrl_;
  *v2 = self->_continuousListeningResultHelper.__ptr_;
  v2[1] = (EARContinuousListeningResultHelper *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (EARContinuousListeningResultHelper *)self;
  return result;
}

- (void)setContinuousListeningResultHelper:(shared_ptr<EARContinuousListeningResultHelper>)a3
{
  v4 = *(EARContinuousListeningResultHelper **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_continuousListeningResultHelper.__cntrl_;
  self->_continuousListeningResultHelper.__ptr_ = v4;
  self->_continuousListeningResultHelper.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (vector<std::vector<quasar::Token>,)partialResults
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<std::vector<quasar::Token>, std::allocator<std::vector<quasar::Token>>> *)std::vector<std::vector<quasar::Token>>::__init_with_size[abi:ne180100]<std::vector<quasar::Token>*,std::vector<quasar::Token>*>(retstr, *(uint64_t **)&self->_prevBestRecogText.__r_.var0, (uint64_t *)self->_prevBestRecogText.var0, 0xAAAAAAAAAAAAAAABLL* ((self->_prevBestRecogText.var0- *(void *)&self->_prevBestRecogText.__r_.var0) >> 3));
}

- (unint64_t)partialResultIndexOffset
{
  return self->_partialResultIndexOffset;
}

- (vector<std::vector<quasar::Token>,)loggableConcatResult
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<std::vector<quasar::Token>, std::allocator<std::vector<quasar::Token>>> *)std::vector<std::vector<quasar::Token>>::__init_with_size[abi:ne180100]<std::vector<quasar::Token>*,std::vector<quasar::Token>*>(retstr, (uint64_t *)self->_partialResults.__end_, (uint64_t *)self->_partialResults.__end_cap_.__value_, 0xAAAAAAAAAAAAAAABLL* (((char *)self->_partialResults.__end_cap_.__value_- (char *)self->_partialResults.__end_) >> 3));
}

- (void)setLoggableConcatResult:()vector<std:(std::allocator<std::vector<quasar::Token>>> *)a3 :vector<quasar::Token>
{
  p_end = (vector<std::vector<quasar::Token>, std::allocator<std::vector<quasar::Token>>> *)&self->_partialResults.__end_;
  if (p_end != a3) {
    std::vector<std::vector<quasar::Token>>::__assign_with_size[abi:ne180100]<std::vector<quasar::Token>*,std::vector<quasar::Token>*>((uint64_t)p_end, (uint64_t *)a3->__begin_, (uint64_t *)a3->__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)a3->__end_ - (char *)a3->__begin_) >> 3));
  }
}

- (vector<double,)loggableConcatCosts
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<double, std::allocator<double>> *)std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(retstr, self->_loggableConcatResult.__end_, (uint64_t)self->_loggableConcatResult.__end_cap_.__value_, ((char *)self->_loggableConcatResult.__end_cap_.__value_- (char *)self->_loggableConcatResult.__end_) >> 3);
}

- (void)setLoggableConcatCosts:()vector<double
{
  p_end = (char *)&self->_loggableConcatResult.__end_;
  if (p_end != (char *)a3) {
    std::vector<kaldi::CuWorkspace *>::__assign_with_size[abi:ne180100]<kaldi::CuWorkspace **,kaldi::CuWorkspace **>(p_end, (char *)a3->__begin_, (uint64_t)a3->__end_, a3->__end_ - a3->__begin_);
  }
}

- (void).cxx_destruct
{
  end = self->_loggableConcatResult.__end_;
  if (end)
  {
    self->_loggableConcatResult.__end_cap_.__value_ = end;
    operator delete(end);
  }
  p_end = &self->_partialResults.__end_;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100](&p_end);
  p_end = (void **)&self->_prevBestRecogText.__r_.var0;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100](&p_end);
  if (*((char *)&self->_prevBestRecogText.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(self->_prevBestRecogText.__r_.__value_.var0.var1.__data_);
  }
  cntrl = self->_continuousListeningResultHelper.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_prevPackageWithoutPersonalization, 0);
  objc_storeStrong((id *)&self->_prevMuxPackages, 0);
  objc_storeStrong((id *)&self->_prevPackage, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  return self;
}

- (void)updateLoggableResultWithCurrentResult:currentCosts:startMilliseconds:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_1B1A86000, v0, v1, "Size mismatch. concatNbest would throw. Logging data loss.", v2, v3, v4, v5, v6);
}

@end