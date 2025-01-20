@interface EARKeywordFinder
+ (void)initialize;
- (EARKeywordFinder)initWithConfiguration:(id)a3;
- (id).cxx_construct;
- (id)correctedResultWithKeyword:(id)a3 tokenizedKeyword:(id)a4 preItnSausage:(id)a5 preItnOneBest:(id)a6 preItnOneBestIndices:(id)a7 nbestSize:(int64_t)a8;
@end

@implementation EARKeywordFinder

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

- (EARKeywordFinder)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EARKeywordFinder;
  if ([(EARKeywordFinder *)&v7 init])
  {
    [v4 fileSystemRepresentation];
    operator new();
  }
  v5 = (EARKeywordFinder *)0;

  return v5;
}

- (id)correctedResultWithKeyword:(id)a3 tokenizedKeyword:(id)a4 preItnSausage:(id)a5 preItnOneBest:(id)a6 preItnOneBestIndices:(id)a7 nbestSize:(int64_t)a8
{
  int v8 = a8;
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v57 = a4;
  id v58 = a5;
  id v59 = a6;
  id v56 = a7;
  value = self->_kwf.__ptr_.__value_;
  id v53 = v14;
  if (v14)
  {
    objc_msgSend(v14, "ear_toString", v14);
  }
  else
  {
    v70[0] = 0;
    v70[1] = 0;
    uint64_t v71 = 0;
  }
  v60 = (int *)value;
  id v16 = v57;
  unint64_t v68 = 0;
  unint64_t v69 = 0;
  uint64_t v67 = 0;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  obuint64_t j = v16;
  uint64_t v17 = [obj countByEnumeratingWithState:&v80 objects:&v84 count:16];
  int v55 = v8;
  if (v17)
  {
    uint64_t v18 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v81 != v18) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(id *)(*((void *)&v80 + 1) + 8 * i);
        v21 = v20;
        if (v20)
        {
          [v20 _quasarProns];
        }
        else
        {
          uint64_t v79 = 0;
          long long v78 = 0u;
          *(_OWORD *)__p = 0u;
          memset(v77, 0, sizeof(v77));
        }

        unint64_t v22 = v68;
        if (v68 >= v69)
        {
          uint64_t v24 = std::vector<quasar::G2P::TokenProns>::__push_back_slow_path<quasar::G2P::TokenProns>(&v67, (uint64_t)__p);
        }
        else
        {
          long long v23 = *(_OWORD *)__p;
          *(void *)(v68 + 16) = *(void *)&v77[0];
          *(void *)(v22 + 24) = 0;
          *(_OWORD *)unint64_t v22 = v23;
          __p[1] = 0;
          *(void *)&v77[0] = 0;
          __p[0] = 0;
          *(void *)(v22 + 32) = 0;
          *(void *)(v22 + 40) = 0;
          *(_OWORD *)(v22 + 24) = *(_OWORD *)((char *)v77 + 8);
          *((void *)&v77[0] + 1) = 0;
          *(void *)&v77[1] = 0;
          *(void *)(v22 + 40) = *((void *)&v77[1] + 1);
          *(void *)(v22 + 48) = 0;
          *((void *)&v77[1] + 1) = 0;
          *(void *)(v22 + 56) = 0;
          *(void *)(v22 + 64) = 0;
          *(_OWORD *)(v22 + 48) = v78;
          *(void *)(v22 + 64) = v79;
          long long v78 = 0uLL;
          uint64_t v79 = 0;
          uint64_t v24 = v22 + 72;
        }
        unint64_t v68 = v24;
        v66.__r_.__value_.__r.__words[0] = (std::string::size_type)&v78;
        std::vector<quasar::PronChoice>::__destroy_vector::operator()[abi:ne180100]((void ***)&v66);
        v66.__r_.__value_.__r.__words[0] = (std::string::size_type)v77 + 8;
        std::vector<quasar::PronChoice>::__destroy_vector::operator()[abi:ne180100]((void ***)&v66);
        if (SBYTE7(v77[0]) < 0) {
          operator delete(__p[0]);
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v80 objects:&v84 count:16];
    }
    while (v17);
  }

  EARHelpers::ArrayToVector2<std::vector<quasar::Token>,std::vector<quasar::Token> (*)(NSArray<_EARSpeechRecognitionToken *> *)>(v58, (void (*)(void *__return_ptr))EARHelpers::QuasarResultFromEARSpeechRecognitionTokens, (uint64_t *)&v80);
  EARHelpers::QuasarResultFromEARSpeechRecognitionTokens(v59, (uint64_t *)&v66);
  id v25 = v56;
  v64 = 0;
  v65 = 0;
  v63 = 0;
  *(_OWORD *)__p = 0u;
  memset(v77, 0, sizeof(v77));
  long long v78 = 0u;
  id v26 = v25;
  uint64_t v27 = [v26 countByEnumeratingWithState:__p objects:&v84 count:16];
  if (v27)
  {
    uint64_t v28 = **(void **)&v77[0];
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (**(void **)&v77[0] != v28) {
          objc_enumerationMutation(v26);
        }
        id v30 = *((id *)__p[1] + j);
        int v31 = [v30 intValue];
        int v32 = v31;
        v33 = v64;
        if (v64 >= v65)
        {
          v35 = v63;
          uint64_t v36 = (v64 - v63) >> 2;
          unint64_t v37 = v36 + 1;
          if ((unint64_t)(v36 + 1) >> 62) {
            std::vector<int>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v38 = v65 - v63;
          if ((v65 - v63) >> 1 > v37) {
            unint64_t v37 = v38 >> 1;
          }
          if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v39 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v39 = v37;
          }
          if (v39)
          {
            v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v65, v39);
            v35 = v63;
            v33 = v64;
          }
          else
          {
            v40 = 0;
          }
          v41 = &v40[4 * v36];
          *(_DWORD *)v41 = v32;
          v34 = v41 + 4;
          while (v33 != v35)
          {
            int v42 = *((_DWORD *)v33 - 1);
            v33 -= 4;
            *((_DWORD *)v41 - 1) = v42;
            v41 -= 4;
          }
          v63 = v41;
          v65 = &v40[4 * v39];
          if (v35) {
            operator delete(v35);
          }
        }
        else
        {
          *(_DWORD *)v64 = v31;
          v34 = v64 + 4;
        }
        v64 = v34;
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:__p objects:&v84 count:16];
    }
    while (v27);
  }

  quasar::KeywordFinder::correctResultWithKeyword(v60, (uint64_t)v70, &v67, &v80, &v66, v55, &v72);
  if (v63) {
    operator delete(v63);
  }
  v84.__r_.__value_.__r.__words[0] = (std::string::size_type)&v66;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v84);
  v84.__r_.__value_.__r.__words[0] = (std::string::size_type)&v80;
  std::vector<std::vector<std::vector<quasar::Token>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v84);
  v84.__r_.__value_.__r.__words[0] = (std::string::size_type)&v67;
  std::vector<quasar::G2P::TokenProns>::__destroy_vector::operator()[abi:ne180100]((void ***)&v84);
  if (SHIBYTE(v71) < 0) {
    operator delete(v70[0]);
  }
  v61 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v53);
  v43 = (uint64_t *)v72;
  if ((void)v72 != *((void *)&v72 + 1))
  {
    v44 = (uint64_t *)*((void *)&v72 + 1);
    do
    {
      __p[0] = 0;
      __p[1] = 0;
      *(void *)&v77[0] = 0;
      std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(__p, *v43, v43[1], 0x6DB6DB6DB6DB6DB7 * ((v43[1] - *v43) >> 5));
      v45 = [MEMORY[0x1E4F1CA48] array];
      v47 = (const quasar::Token *)__p[0];
      v46 = (const quasar::Token *)__p[1];
      while (v47 != v46)
      {
        quasar::Token::Token(&v84, v47);
        id v48 = [[_EARSpeechRecognitionToken alloc] _initWithQuasarToken:&v84];
        [v45 addObject:v48];

        if (v94 < 0) {
          operator delete(v93);
        }
        if (v92 < 0) {
          operator delete(v91);
        }
        *(void *)&long long v80 = &v90;
        std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v80);
        if (v89 < 0) {
          operator delete(v88);
        }
        *(void *)&long long v80 = &v87;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v80);
        if (v86 < 0) {
          operator delete(v85);
        }
        if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v84.__r_.__value_.__l.__data_);
        }
        v47 = (const quasar::Token *)((char *)v47 + 224);
      }
      v49 = (void *)[v45 copy];

      [v61 addObject:v49];
      v84.__r_.__value_.__r.__words[0] = (std::string::size_type)__p;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v84);
      v43 += 3;
    }
    while (v43 != v44);
  }
  v50 = (void *)[v61 copy];

  id v51 = [[EARKeywordFinderResult alloc] _initWithCorrectedUtterances:v50];
  v84.__r_.__value_.__r.__words[0] = (std::string::size_type)&v75;
  std::vector<quasar::KeywordFinder::KeywordLocationLoggingStats>::__destroy_vector::operator()[abi:ne180100]((void ***)&v84);
  v84.__r_.__value_.__r.__words[0] = (std::string::size_type)&v74;
  std::vector<quasar::KeywordFinder::KeywordLoggingStats>::__destroy_vector::operator()[abi:ne180100]((void ***)&v84);
  v84.__r_.__value_.__r.__words[0] = (std::string::size_type)&v73;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v84);
  v84.__r_.__value_.__r.__words[0] = (std::string::size_type)&v72;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v84);

  return v51;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end