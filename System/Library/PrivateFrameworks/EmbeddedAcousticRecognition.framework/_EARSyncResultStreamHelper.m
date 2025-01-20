@interface _EARSyncResultStreamHelper
- (NSArray)results;
- (NSError)error;
- (NSMutableArray)taggedResults;
- (_EARSyncResultStreamHelper)init;
- (_EARSyncResultStreamHelper)initWithTagResults:(BOOL)a3;
- (id)addPartialFinalTag:()basic_string<char result:()std:(std::allocator<char>> *)a3 :char_traits<char>;
- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4;
- (void)waitForCompletion;
@end

@implementation _EARSyncResultStreamHelper

- (_EARSyncResultStreamHelper)initWithTagResults:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EARSyncResultStreamHelper;
  v4 = [(_EARSyncResultStreamHelper *)&v10 init];
  if (v4)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    finishSemaphore = v4->_finishSemaphore;
    v4->_finishSemaphore = (OS_dispatch_semaphore *)v5;

    if (v3)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      taggedResults = v4->_taggedResults;
      v4->_taggedResults = v7;
    }
  }
  return v4;
}

- (_EARSyncResultStreamHelper)init
{
  return [(_EARSyncResultStreamHelper *)self initWithTagResults:0];
}

- (void)waitForCompletion
{
}

- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4
{
  id v5 = a4;
  if (self->_taggedResults)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "partial");
    v6 = [(_EARSyncResultStreamHelper *)self addPartialFinalTag:__p result:v5];
    if (v8 < 0) {
      operator delete(__p[0]);
    }
    [(NSMutableArray *)self->_taggedResults addObject:v6];
  }
}

- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4
{
  objc_storeStrong((id *)&self->_error, a4);
  id v6 = a4;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_finishSemaphore);
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4
{
  id v6 = a4;
  objc_storeStrong((id *)&self->_results, a4);
  if (self->_taggedResults)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "final");
    v7 = [v6 firstObject];
    char v8 = [(_EARSyncResultStreamHelper *)self addPartialFinalTag:__p result:v7];

    if (v10 < 0) {
      operator delete(__p[0]);
    }
    [(NSMutableArray *)self->_taggedResults addObject:v8];
  }
}

- (id)addPartialFinalTag:()basic_string<char result:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  id v29 = v3;
  uint64_t v52 = 0;
  unint64_t v53 = 0;
  unint64_t v54 = 0;
  if (*((char *)&a3->__r_.__value_.var0.var1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&value, a3->__r_.__value_.var0.var1.__data_, a3->__r_.__value_.var0.var1.__size_);
  }
  else {
    std::string value = (std::string)a3->__r_.__value_;
  }
  std::string::basic_string[abi:ne180100]<0>(v39, "");
  std::string::basic_string[abi:ne180100]<0>(v37, "");
  memset(v36, 0, sizeof(v36));
  std::string::basic_string[abi:ne180100]<0>(v34, "");
  quasar::Token::Token((std::string *)v42, (long long *)&value, 0, 0, 0, 1, 0, (long long *)v39, 0.0, (long long *)v37, v36, 0, (long long *)v34, 0, 0);
  unint64_t v5 = v53;
  if (v53 >= v54)
  {
    unint64_t v53 = std::vector<quasar::Token>::__push_back_slow_path<quasar::Token>(&v52, (long long *)v42);
    if (SBYTE7(v51[0]) < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    long long v6 = *(_OWORD *)v42;
    *(void *)(v53 + 16) = *(void *)&v43[0];
    *(_OWORD *)unint64_t v5 = v6;
    v42[0] = 0;
    v42[1] = 0;
    uint64_t v7 = *(void *)((char *)&v43[1] + 6);
    *(_OWORD *)(v5 + 24) = *(_OWORD *)((char *)v43 + 8);
    *(void *)(v5 + 38) = v7;
    uint64_t v8 = *(void *)&v45[0];
    *(_OWORD *)(v5 + 48) = *(_OWORD *)v44;
    *(void *)(v5 + 64) = v8;
    *(void *)(v5 + 72) = 0;
    *(void *)&v43[0] = 0;
    v44[0] = 0;
    v44[1] = 0;
    *(void *)(v5 + 80) = 0;
    *(void *)(v5 + 88) = 0;
    *(_OWORD *)(v5 + 72) = *(_OWORD *)((char *)v45 + 8);
    *(void *)(v5 + 88) = *((void *)&v45[1] + 1);
    memset(v45, 0, sizeof(v45));
    long long v9 = *(_OWORD *)v46;
    *(void *)(v5 + 112) = *(void *)&v47[0];
    *(void *)(v5 + 120) = 0;
    *(_OWORD *)(v5 + 96) = v9;
    v46[0] = 0;
    v46[1] = 0;
    *(void *)(v5 + 128) = 0;
    *(void *)(v5 + 136) = 0;
    *(_OWORD *)(v5 + 120) = *(_OWORD *)((char *)v47 + 8);
    *(void *)(v5 + 136) = *((void *)&v47[1] + 1);
    memset(v47, 0, sizeof(v47));
    long long v10 = *(_OWORD *)v48;
    *(void *)(v5 + 160) = v49;
    *(_OWORD *)(v5 + 144) = v10;
    v48[0] = 0;
    v48[1] = 0;
    *(void *)&long long v49 = 0;
    LODWORD(v8) = DWORD2(v49);
    *(_WORD *)(v5 + 172) = WORD6(v49);
    *(_DWORD *)(v5 + 168) = v8;
    long long v11 = *(_OWORD *)__p;
    *(void *)(v5 + 192) = *(void *)&v51[0];
    *(_OWORD *)(v5 + 176) = v11;
    __p[1] = 0;
    *(void *)&v51[0] = 0;
    __p[0] = 0;
    long long v12 = *(_OWORD *)((char *)v51 + 8);
    *(_DWORD *)(v5 + 216) = DWORD2(v51[1]);
    *(_OWORD *)(v5 + 200) = v12;
    unint64_t v53 = v5 + 224;
  }
  if (SBYTE7(v49) < 0) {
    operator delete(v48[0]);
  }
  v55[0] = (void **)v47 + 1;
  std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100](v55);
  if (SBYTE7(v47[0]) < 0) {
    operator delete(v46[0]);
  }
  v55[0] = (void **)v45 + 1;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v55);
  if (SBYTE7(v45[0]) < 0) {
    operator delete(v44[0]);
  }
  if (SBYTE7(v43[0]) < 0) {
    operator delete(v42[0]);
  }
  if (v35 < 0) {
    operator delete(v34[0]);
  }
  v34[0] = v36;
  std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v34);
  if (v38 < 0) {
    operator delete(v37[0]);
  }
  if (v40 < 0) {
    operator delete(v39[0]);
  }
  if (SHIBYTE(value.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(value.__r_.__value_.__l.__data_);
  }
  if (v29)
  {
    v13 = [v29 tokens];
    for (unint64_t i = 0; [v13 count] > i; ++i)
    {
      v15 = [v13 objectAtIndex:i];
      v16 = v15;
      if (v15)
      {
        [v15 quasarToken];
      }
      else
      {
        memset(v51, 0, sizeof(v51));
        long long v49 = 0u;
        *(_OWORD *)__p = 0u;
        *(_OWORD *)v48 = 0u;
        *(_OWORD *)v46 = 0u;
        memset(v47, 0, sizeof(v47));
        memset(v45, 0, sizeof(v45));
        *(_OWORD *)v44 = 0u;
        *(_OWORD *)v42 = 0u;
        memset(v43, 0, sizeof(v43));
      }
      unint64_t v17 = v53;
      if (v53 >= v54)
      {
        unint64_t v53 = std::vector<quasar::Token>::__emplace_back_slow_path<quasar::Token>(&v52, (long long *)v42);
        if (SBYTE7(v51[0]) < 0) {
          operator delete(__p[0]);
        }
      }
      else
      {
        long long v18 = *(_OWORD *)v42;
        *(void *)(v53 + 16) = *(void *)&v43[0];
        *(_OWORD *)unint64_t v17 = v18;
        v42[1] = 0;
        *(void *)&v43[0] = 0;
        v42[0] = 0;
        uint64_t v19 = *(void *)((char *)&v43[1] + 6);
        *(_OWORD *)(v17 + 24) = *(_OWORD *)((char *)v43 + 8);
        *(void *)(v17 + 38) = v19;
        uint64_t v20 = *(void *)&v45[0];
        *(_OWORD *)(v17 + 48) = *(_OWORD *)v44;
        *(void *)(v17 + 64) = v20;
        *(void *)(v17 + 72) = 0;
        v44[1] = 0;
        *(void *)&v45[0] = 0;
        v44[0] = 0;
        *(void *)(v17 + 80) = 0;
        *(void *)(v17 + 88) = 0;
        *(_OWORD *)(v17 + 72) = *(_OWORD *)((char *)v45 + 8);
        *(void *)(v17 + 88) = *((void *)&v45[1] + 1);
        memset((char *)v45 + 8, 0, 24);
        long long v21 = *(_OWORD *)v46;
        *(void *)(v17 + 112) = *(void *)&v47[0];
        *(void *)(v17 + 120) = 0;
        *(_OWORD *)(v17 + 96) = v21;
        v46[1] = 0;
        *(void *)&v47[0] = 0;
        v46[0] = 0;
        *(void *)(v17 + 128) = 0;
        *(void *)(v17 + 136) = 0;
        *(_OWORD *)(v17 + 120) = *(_OWORD *)((char *)v47 + 8);
        *(void *)(v17 + 136) = *((void *)&v47[1] + 1);
        memset((char *)v47 + 8, 0, 24);
        long long v22 = *(_OWORD *)v48;
        *(void *)(v17 + 160) = v49;
        *(_OWORD *)(v17 + 144) = v22;
        v48[1] = 0;
        *(void *)&long long v49 = 0;
        v48[0] = 0;
        LODWORD(v20) = DWORD2(v49);
        *(_WORD *)(v17 + 172) = WORD6(v49);
        *(_DWORD *)(v17 + 168) = v20;
        long long v23 = *(_OWORD *)__p;
        *(void *)(v17 + 192) = *(void *)&v51[0];
        *(_OWORD *)(v17 + 176) = v23;
        __p[1] = 0;
        *(void *)&v51[0] = 0;
        __p[0] = 0;
        long long v24 = *(_OWORD *)((char *)v51 + 8);
        *(_DWORD *)(v17 + 216) = DWORD2(v51[1]);
        *(_OWORD *)(v17 + 200) = v24;
        unint64_t v53 = v17 + 224;
      }
      if (SBYTE7(v49) < 0) {
        operator delete(v48[0]);
      }
      v39[0] = (char *)v47 + 8;
      std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v39);
      if (SBYTE7(v47[0]) < 0) {
        operator delete(v46[0]);
      }
      v39[0] = (char *)v45 + 8;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v39);
      if (SBYTE7(v45[0]) < 0) {
        operator delete(v44[0]);
      }
      if (SBYTE7(v43[0]) < 0) {
        operator delete(v42[0]);
      }
    }
    v25 = [_EARSpeechRecognitionResult alloc];
    memset(v31, 0, sizeof(v31));
    std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v31, v52, v53, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v53 - v52) >> 5));
    memset(v30, 0, sizeof(v30));
    std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v30, v52, v53, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v53 - v52) >> 5));
    id v26 = [(_EARSpeechRecognitionResult *)v25 _initWithTokens:v31 preITNTokens:v30];
    v42[0] = v30;
    std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v42);
    v42[0] = v31;
    std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v42);
  }
  else
  {
    v27 = [_EARSpeechRecognitionResult alloc];
    memset(v33, 0, sizeof(v33));
    std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v33, v52, v53, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v53 - v52) >> 5));
    memset(v32, 0, sizeof(v32));
    std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v32, v52, v53, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v53 - v52) >> 5));
    id v26 = [(_EARSpeechRecognitionResult *)v27 _initWithTokens:v33 preITNTokens:v32];
    v42[0] = v32;
    std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v42);
    v42[0] = v33;
    std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v42);
  }
  v42[0] = &v52;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v42);

  return v26;
}

- (NSError)error
{
  return self->_error;
}

- (NSArray)results
{
  return self->_results;
}

- (NSMutableArray)taggedResults
{
  return self->_taggedResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taggedResults, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_finishSemaphore, 0);
}

@end