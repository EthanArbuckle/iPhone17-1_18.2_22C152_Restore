@interface _EARSpeechRecognition
+ (id)reconstructNBestFromSausage:(id)a3 interpretationIndices:(id)a4;
+ (id)tokens:(id)a3 alignedToTokens:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)interpretationIndices;
- (NSArray)nBest;
- (NSArray)tokenSausage;
- (NSSet)endsOfSentencePunctuations;
- (id)_initWithNBestList:(const void *)a3 useHatText:(BOOL)a4 endsOfSentencePunctuations:(id)a5;
- (id)_initWithTokenPhraseChoiceList:(const void *)a3 earNbest:(id)a4 endsOfSentencePunctuations:(id)a5;
- (id)_initWithTokenPhraseChoiceList:(const void *)a3 nBestList:(const void *)a4 endsOfSentencePunctuations:(id)a5;
- (id)_initWithTokenSausage:(id)a3 interpretationIndices:(id)a4 nBest:(id)a5 endsOfSentencePunctuations:(id)a6;
- (id)adjustSpaceForTokens:(id)a3 currTokenIndex:(unint64_t)a4 endsOfSentencePunctuations:(id)a5 isPotentialCommandRecognition:(BOOL)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)granularizedRecognition;
- (id)oneBest;
- (id)oneBestAlignedToTokens:(id)a3;
- (id)potentialCommandRecognition;
- (id)potentialPrecedingRecognition;
- (id)splitRecognitionWithPotentialCommandRecognition:(BOOL)a3;
- (pair<std::vector<std::vector<unsigned)_tokenPhraseChoiceList;
- (unint64_t)hash;
- (void)setTokenSausage:(id)a3;
@end

@implementation _EARSpeechRecognition

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_tokenSausage hash];
  return [(NSArray *)self->_interpretationIndices hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(NSArray *)self->_tokenSausage isEqual:v4[1]]
    && [(NSArray *)self->_interpretationIndices isEqual:v4[2]])
  {
    char v5 = [(NSSet *)self->_endsOfSentencePunctuations isEqual:v4[4]];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)_initWithTokenSausage:(id)a3 interpretationIndices:(id)a4 nBest:(id)a5 endsOfSentencePunctuations:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)_EARSpeechRecognition;
  v14 = [(_EARSpeechRecognition *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    tokenSausage = v14->_tokenSausage;
    v14->_tokenSausage = (NSArray *)v15;

    uint64_t v17 = [v11 copy];
    interpretationIndices = v14->_interpretationIndices;
    v14->_interpretationIndices = (NSArray *)v17;

    uint64_t v19 = [v12 copy];
    nBest = v14->_nBest;
    v14->_nBest = (NSArray *)v19;

    uint64_t v21 = [v13 copy];
    endsOfSentencePunctuations = v14->_endsOfSentencePunctuations;
    v14->_endsOfSentencePunctuations = (NSSet *)v21;
  }
  return v14;
}

- (id)_initWithNBestList:(const void *)a3 useHatText:(BOOL)a4 endsOfSentencePunctuations:(id)a5
{
  id v8 = a5;
  quasar::getTokenizedNBestListForEAR((uint64_t *)a3, a4, v13);
  quasar::getTokenizedTokenPhraseChoiceListForEAR((uint64_t)v13, 0, v11);
  id v9 = [(_EARSpeechRecognition *)self _initWithTokenPhraseChoiceList:v11 nBestList:v13 endsOfSentencePunctuations:v8];
  v14 = (void ***)&v12;
  std::vector<std::vector<std::vector<quasar::Token>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
  v14 = v11;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
  v11[0] = (void **)v13;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100](v11);

  return v9;
}

- (id)_initWithTokenPhraseChoiceList:(const void *)a3 earNbest:(id)a4 endsOfSentencePunctuations:(id)a5
{
  id v29 = a4;
  id v28 = a5;
  v32 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 4) - *((void *)a3 + 3)) >> 3)];
  v7 = (uint64_t **)*((void *)a3 + 3);
  v27 = a3;
  v31 = (uint64_t **)*((void *)a3 + 4);
  if (v7 != v31)
  {
    do
    {
      v48 = 0;
      v49 = 0;
      uint64_t v50 = 0;
      std::vector<std::vector<quasar::Token>>::__init_with_size[abi:ne180100]<std::vector<quasar::Token>*,std::vector<quasar::Token>*>(&v48, *v7, v7[1], 0xAAAAAAAAAAAAAAABLL * (v7[1] - *v7));
      v33 = v7;
      id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
      id v9 = (void *)[v8 initWithCapacity:0xAAAAAAAAAAAAAAABLL * (v49 - v48)];
      id v10 = v48;
      for (i = v49; v10 != i; v10 += 3)
      {
        v45 = 0;
        v46 = 0;
        uint64_t v47 = 0;
        std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(&v45, *v10, v10[1], 0x6DB6DB6DB6DB6DB7 * ((v10[1] - *v10) >> 5));
        id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
        id v13 = (void *)[v12 initWithCapacity:0x6DB6DB6DB6DB6DB7 * ((v46 - v45) >> 5)];
        uint64_t v15 = v45;
        v14 = v46;
        while (v15 != v14)
        {
          quasar::Token::Token(&v34, v15);
          id v16 = [[_EARSpeechRecognitionToken alloc] _initWithQuasarToken:&v34];
          [v13 addObject:v16];

          if (v44 < 0) {
            operator delete(__p);
          }
          if (v42 < 0) {
            operator delete(v41);
          }
          v51[0] = (void **)&v40;
          std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100](v51);
          if (v39 < 0) {
            operator delete(v38);
          }
          v51[0] = (void **)&v37;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v51);
          if (v36 < 0) {
            operator delete(v35);
          }
          if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v34.__r_.__value_.__l.__data_);
          }
          uint64_t v15 = (const quasar::Token *)((char *)v15 + 224);
        }
        [v9 addObject:v13];

        v34.__r_.__value_.__r.__words[0] = (std::string::size_type)&v45;
        std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v34);
      }
      [v32 addObject:v9];

      v34.__r_.__value_.__r.__words[0] = (std::string::size_type)&v48;
      std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v34);
      v7 = v33 + 3;
    }
    while (v33 + 3 != v31);
  }
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3)];
  uint64_t v18 = *(void *)a3;
  uint64_t v19 = v27[1];
  if (*v27 != v19)
  {
    do
    {
      memset(&v34, 0, sizeof(v34));
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v34, *(const void **)v18, *(void *)(v18 + 8), (uint64_t)(*(void *)(v18 + 8) - *(void *)v18) >> 2);
      id v20 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v21 = (void *)[v20 initWithCapacity:(uint64_t)(v34.__r_.__value_.__l.__size_ - v34.__r_.__value_.__r.__words[0]) >> 2];
      std::string::size_type size = v34.__r_.__value_.__l.__size_;
      for (j = (unsigned int *)v34.__r_.__value_.__r.__words[0]; j != (unsigned int *)size; ++j)
      {
        objc_super v24 = [NSNumber numberWithUnsignedInt:*j];
        [v21 addObject:v24];
      }
      [v17 addObject:v21];

      if (v34.__r_.__value_.__r.__words[0])
      {
        v34.__r_.__value_.__l.__size_ = v34.__r_.__value_.__r.__words[0];
        operator delete(v34.__r_.__value_.__l.__data_);
      }
      v18 += 24;
    }
    while (v18 != v19);
  }
  id v25 = [(_EARSpeechRecognition *)self _initWithTokenSausage:v32 interpretationIndices:v17 nBest:v29 endsOfSentencePunctuations:v28];

  return v25;
}

- (id)_initWithTokenPhraseChoiceList:(const void *)a3 nBestList:(const void *)a4 endsOfSentencePunctuations:(id)a5
{
  id v16 = a5;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3)];
  v7 = *(uint64_t **)a4;
  id v8 = (uint64_t *)*((void *)a4 + 1);
  if (*(uint64_t **)a4 != v8)
  {
    do
    {
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0x6DB6DB6DB6DB6DB7 * ((v7[1] - *v7) >> 5)];
      uint64_t v11 = *v7;
      uint64_t v10 = v7[1];
      while (v11 != v10)
      {
        id v12 = [[_EARSpeechRecognitionToken alloc] _initWithQuasarToken:v11];
        [v9 addObject:v12];

        v11 += 224;
      }
      [v6 addObject:v9];

      v7 += 3;
    }
    while (v7 != v8);
  }
  id v13 = [(_EARSpeechRecognition *)self _initWithTokenPhraseChoiceList:a3 earNbest:v6 endsOfSentencePunctuations:v16];

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [_EARSpeechRecognition alloc];
  char v5 = [(_EARSpeechRecognition *)self tokenSausage];
  v6 = [(_EARSpeechRecognition *)self interpretationIndices];
  v7 = [(_EARSpeechRecognition *)self nBest];
  id v8 = [(_EARSpeechRecognition *)self endsOfSentencePunctuations];
  id v9 = [(_EARSpeechRecognition *)v4 _initWithTokenSausage:v5 interpretationIndices:v6 nBest:v7 endsOfSentencePunctuations:v8];

  return v9;
}

- (id)oneBest
{
  if ([(NSArray *)self->_nBest count])
  {
    uint64_t v3 = [(NSArray *)self->_nBest objectAtIndex:0];
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

+ (id)tokens:(id)a3 alignedToTokens:(id)a4
{
  id v5 = a4;
  EARHelpers::QuasarResultFromEARSpeechRecognitionTokens(a3, v11);
  EARHelpers::QuasarResultFromEARSpeechRecognitionTokens(v5, v10);
  quasar::Align::Align(v9, v10, v11, 2);
  DestToks = (const quasar::Token **)quasar::Align::getDestToks((quasar::Align *)v9);
  v7 = EARHelpers::EARSpeechRecognitionTokensFromQuasarTokens(DestToks);
  quasar::Align::~Align(v9);
  v9[0] = v10;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v9);
  v9[0] = v11;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v9);

  return v7;
}

- (id)oneBestAlignedToTokens:(id)a3
{
  id v4 = a3;
  id v5 = [(_EARSpeechRecognition *)self oneBest];
  v6 = +[_EARSpeechRecognition tokens:v5 alignedToTokens:v4];

  return v6;
}

- (pair<std::vector<std::vector<unsigned)_tokenPhraseChoiceList
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&retstr->var0.var2.var0 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  uint64_t v3 = self->_interpretationIndices;
  *(void *)&long long v67 = 0;
  long long v66 = 0uLL;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obuint64_t j = v3;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v73 objects:v91 count:16];
  if (v4)
  {
    uint64_t v52 = *(void *)v74;
    do
    {
      id v5 = 0;
      v53 = (char *)v4;
      do
      {
        if (*(void *)v74 != v52) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(id *)(*((void *)&v73 + 1) + 8 * (void)v5);
        __p[1] = 0;
        *(void *)&v71[0] = 0;
        __p[0] = 0;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v77 objects:v81 count:16];
        v54 = v5;
        if (v8)
        {
          uint64_t v9 = *(void *)v78;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v78 != v9) {
                objc_enumerationMutation(v7);
              }
              id v11 = *(id *)(*((void *)&v77 + 1) + 8 * i);
              int v12 = [v11 unsignedIntValue];
              int v13 = v12;
              v14 = (char *)__p[1];
              if (__p[1] >= (void *)*(void *)&v71[0])
              {
                id v16 = (char *)__p[0];
                int64_t v17 = ((char *)__p[1] - (char *)__p[0]) >> 2;
                unint64_t v18 = v17 + 1;
                if ((unint64_t)(v17 + 1) >> 62) {
                  std::vector<int>::__throw_length_error[abi:ne180100]();
                }
                int64_t v19 = *(void *)&v71[0] - (unint64_t)__p[0];
                if ((uint64_t)(*(void *)&v71[0] - (unint64_t)__p[0]) >> 1 > v18) {
                  unint64_t v18 = v19 >> 1;
                }
                if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v20 = v18;
                }
                if (v20)
                {
                  uint64_t v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v71, v20);
                  id v16 = (char *)__p[0];
                  v14 = (char *)__p[1];
                }
                else
                {
                  uint64_t v21 = 0;
                }
                v22 = &v21[4 * v17];
                *(_DWORD *)v22 = v13;
                uint64_t v15 = v22 + 4;
                while (v14 != v16)
                {
                  int v23 = *((_DWORD *)v14 - 1);
                  v14 -= 4;
                  *((_DWORD *)v22 - 1) = v23;
                  v22 -= 4;
                }
                __p[0] = v22;
                __p[1] = v15;
                *(void *)&v71[0] = &v21[4 * v20];
                if (v16) {
                  operator delete(v16);
                }
              }
              else
              {
                *(_DWORD *)__p[1] = v12;
                uint64_t v15 = v14 + 4;
              }
              __p[1] = v15;
            }
            uint64_t v8 = [v7 countByEnumeratingWithState:&v77 objects:v81 count:16];
          }
          while (v8);
        }

        std::vector<std::vector<unsigned int>>::push_back[abi:ne180100]((uint64_t *)&v66, (uint64_t)__p);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }

        id v5 = v54 + 1;
      }
      while (v54 + 1 != v53);
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v73 objects:v91 count:16];
    }
    while (v4);
  }

  std::vector<std::vector<int>>::__vdeallocate((uint64_t *)retstr);
  *(_OWORD *)&retstr->var0.var0 = v66;
  retstr->var0.var2.var0 = (void *)v67;
  *(void *)&long long v67 = 0;
  long long v66 = 0uLL;
  v81[0] = &v66;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)v81);
  objc_super v24 = self->_tokenSausage;
  v57 = 0;
  long long v56 = 0uLL;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v43 = v24;
  uint64_t v41 = [(NSArray *)v43 countByEnumeratingWithState:&v59 objects:&v73 count:16];
  if (v41)
  {
    uint64_t v42 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v60 != v42) {
          objc_enumerationMutation(v43);
        }
        id v25 = *(id *)(*((void *)&v59 + 1) + 8 * j);
        memset(v58, 0, sizeof(v58));
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v46 = v25;
        uint64_t v48 = [v46 countByEnumeratingWithState:&v66 objects:&v77 count:16];
        if (v48)
        {
          uint64_t v47 = *(void *)v67;
          do
          {
            for (uint64_t k = 0; k != v48; ++k)
            {
              if (*(void *)v67 != v47) {
                objc_enumerationMutation(v46);
              }
              id v26 = *(id *)(*((void *)&v66 + 1) + 8 * k);
              unint64_t v64 = 0;
              unint64_t v65 = 0;
              uint64_t v63 = 0;
              *(_OWORD *)__p = 0u;
              memset(v71, 0, sizeof(v71));
              id v55 = v26;
              uint64_t v27 = [v55 countByEnumeratingWithState:__p objects:v91 count:16];
              if (v27)
              {
                uint64_t v28 = **(void **)&v71[0];
                do
                {
                  for (uint64_t m = 0; m != v27; ++m)
                  {
                    if (**(void **)&v71[0] != v28) {
                      objc_enumerationMutation(v55);
                    }
                    id v30 = *((id *)__p[1] + m);
                    v31 = v30;
                    if (v30)
                    {
                      [v30 quasarToken];
                    }
                    else
                    {
                      memset(v90, 0, sizeof(v90));
                      long long v88 = 0u;
                      *(_OWORD *)v89 = 0u;
                      *(_OWORD *)v87 = 0u;
                      *(_OWORD *)v85 = 0u;
                      memset(v86, 0, sizeof(v86));
                      memset(v84, 0, sizeof(v84));
                      *(_OWORD *)v83 = 0u;
                      *(_OWORD *)v81 = 0u;
                      memset(v82, 0, sizeof(v82));
                    }

                    unint64_t v32 = v64;
                    if (v64 >= v65)
                    {
                      unint64_t v64 = std::vector<quasar::Token>::__push_back_slow_path<quasar::Token>(&v63, (long long *)v81);
                      if (SBYTE7(v90[0]) < 0) {
                        operator delete(v89[0]);
                      }
                    }
                    else
                    {
                      long long v33 = *(_OWORD *)v81;
                      *(void *)(v64 + 16) = *(void *)&v82[0];
                      *(_OWORD *)unint64_t v32 = v33;
                      *(void *)&v82[0] = 0;
                      v81[1] = 0;
                      v81[0] = 0;
                      uint64_t v34 = *(void *)((char *)&v82[1] + 6);
                      *(_OWORD *)(v32 + 24) = *(_OWORD *)((char *)v82 + 8);
                      *(void *)(v32 + 38) = v34;
                      uint64_t v35 = *(void *)&v84[0];
                      *(_OWORD *)(v32 + 48) = *(_OWORD *)v83;
                      *(void *)(v32 + 64) = v35;
                      *(void *)(v32 + 72) = 0;
                      v83[1] = 0;
                      *(void *)&v84[0] = 0;
                      v83[0] = 0;
                      *(void *)(v32 + 80) = 0;
                      *(void *)(v32 + 88) = 0;
                      *(_OWORD *)(v32 + 72) = *(_OWORD *)((char *)v84 + 8);
                      *(void *)(v32 + 88) = *((void *)&v84[1] + 1);
                      memset((char *)v84 + 8, 0, 24);
                      long long v36 = *(_OWORD *)v85;
                      *(void *)(v32 + 112) = *(void *)&v86[0];
                      *(void *)(v32 + 120) = 0;
                      *(_OWORD *)(v32 + 96) = v36;
                      v85[1] = 0;
                      *(void *)&v86[0] = 0;
                      v85[0] = 0;
                      *(void *)(v32 + 128) = 0;
                      *(void *)(v32 + 136) = 0;
                      *(_OWORD *)(v32 + 120) = *(_OWORD *)((char *)v86 + 8);
                      *(void *)(v32 + 136) = *((void *)&v86[1] + 1);
                      memset((char *)v86 + 8, 0, 24);
                      long long v37 = *(_OWORD *)v87;
                      *(void *)(v32 + 160) = v88;
                      *(_OWORD *)(v32 + 144) = v37;
                      v87[1] = 0;
                      *(void *)&long long v88 = 0;
                      v87[0] = 0;
                      LODWORD(v35) = DWORD2(v88);
                      *(_WORD *)(v32 + 172) = WORD6(v88);
                      *(_DWORD *)(v32 + 168) = v35;
                      long long v38 = *(_OWORD *)v89;
                      *(void *)(v32 + 192) = *(void *)&v90[0];
                      *(_OWORD *)(v32 + 176) = v38;
                      v89[1] = 0;
                      *(void *)&v90[0] = 0;
                      v89[0] = 0;
                      long long v39 = *(_OWORD *)((char *)v90 + 8);
                      *(_DWORD *)(v32 + 216) = DWORD2(v90[1]);
                      *(_OWORD *)(v32 + 200) = v39;
                      unint64_t v64 = v32 + 224;
                    }
                    if (SBYTE7(v88) < 0) {
                      operator delete(v87[0]);
                    }
                    v72 = (void **)v86 + 1;
                    std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100](&v72);
                    if (SBYTE7(v86[0]) < 0) {
                      operator delete(v85[0]);
                    }
                    v72 = (void **)v84 + 1;
                    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v72);
                    if (SBYTE7(v84[0]) < 0) {
                      operator delete(v83[0]);
                    }
                    if (SBYTE7(v82[0]) < 0) {
                      operator delete(v81[0]);
                    }
                  }
                  uint64_t v27 = [v55 countByEnumeratingWithState:__p objects:v91 count:16];
                }
                while (v27);
              }

              std::vector<std::vector<quasar::Token>>::push_back[abi:ne180100](v58, (uint64_t)&v63);
              v81[0] = &v63;
              std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v81);
            }
            uint64_t v48 = [v46 countByEnumeratingWithState:&v66 objects:&v77 count:16];
          }
          while (v48);
        }

        std::vector<std::vector<std::vector<quasar::Token>>>::push_back[abi:ne180100]((uint64_t *)&v56, (uint64_t)v58);
        v81[0] = v58;
        std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)v81);
      }
      uint64_t v41 = [(NSArray *)v43 countByEnumeratingWithState:&v59 objects:&v73 count:16];
    }
    while (v41);
  }

  std::vector<std::vector<std::vector<quasar::Token>>>::__vdeallocate((void ***)&retstr->var1);
  *(_OWORD *)&retstr->var1.var0 = v56;
  retstr->var1.var2.var0 = v57;
  v57 = 0;
  long long v56 = 0uLL;
  v81[0] = &v56;
  std::vector<std::vector<std::vector<quasar::Token>>>::__destroy_vector::operator()[abi:ne180100]((void ***)v81);
  return result;
}

- (id)granularizedRecognition
{
  uint64_t v3 = [_EARSpeechRecognition alloc];
  [(_EARSpeechRecognition *)self _tokenPhraseChoiceList];
  quasar::TextProc::GranularizedTokenPhraseChoiceList(v6, (uint64_t)v8);
  id v4 = [(_EARSpeechRecognition *)v3 _initWithTokenPhraseChoiceList:v8 earNbest:self->_nBest endsOfSentencePunctuations:self->_endsOfSentencePunctuations];
  uint64_t v10 = (void **)&v9;
  std::vector<std::vector<std::vector<quasar::Token>>>::__destroy_vector::operator()[abi:ne180100](&v10);
  uint64_t v10 = (void **)v8;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](&v10);
  uint64_t v10 = (void **)&v7;
  std::vector<std::vector<std::vector<quasar::Token>>>::__destroy_vector::operator()[abi:ne180100](&v10);
  uint64_t v10 = (void **)v6;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](&v10);
  return v4;
}

- (id)potentialPrecedingRecognition
{
  return [(_EARSpeechRecognition *)self splitRecognitionWithPotentialCommandRecognition:0];
}

- (id)potentialCommandRecognition
{
  return [(_EARSpeechRecognition *)self splitRecognitionWithPotentialCommandRecognition:1];
}

- (id)adjustSpaceForTokens:(id)a3 currTokenIndex:(unint64_t)a4 endsOfSentencePunctuations:(id)a5 isPotentialCommandRecognition:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v52 = a5;
  uint64_t v10 = [v9 objectAtIndexedSubscript:a4];
  id v11 = (void *)[v10 copy];

  if (a4 + 1 < [v9 count])
  {
    int v12 = [v9 objectAtIndexedSubscript:a4 + 1];
    if ([v12 appendedAutoPunctuation])
    {
      if (v6)
      {
      }
      else
      {
        int v13 = [v9 objectAtIndexedSubscript:a4 + 1];
        v14 = [v13 tokenName];
        char v15 = [v52 containsObject:v14];

        if (v15) {
          goto LABEL_8;
        }
      }
      int v12 = [v9 objectAtIndexedSubscript:a4 + 1];
      v51 = [_EARSpeechRecognitionToken alloc];
      id v16 = [v11 tokenName];
      [v11 start];
      double v18 = v17;
      [v11 end];
      double v20 = v19;
      [v11 silenceStart];
      double v22 = v21;
      [v11 confidence];
      double v24 = v23;
      uint64_t v25 = [v12 hasSpaceAfter];
      uint64_t v26 = [v11 hasSpaceBefore];
      uint64_t v27 = [v11 phoneSequence];
      uint64_t v28 = [v11 ipaPhoneSequence];
      uint64_t v29 = [(_EARSpeechRecognitionToken *)v51 initWithTokenName:v16 start:v25 end:v26 silenceStart:v27 confidence:v28 hasSpaceAfter:v18 hasSpaceBefore:v20 phoneSequence:v22 ipaPhoneSequence:v24];

      id v11 = (void *)v29;
    }
  }
LABEL_8:
  if (!a4) {
    goto LABEL_15;
  }
  unint64_t v30 = a4 - 1;
  v31 = [v9 objectAtIndexedSubscript:a4 - 1];
  if ([v31 prependedAutoPunctuation])
  {
    if (v6)
    {
    }
    else
    {
      unint64_t v32 = [v9 objectAtIndexedSubscript:v30];
      long long v33 = [v32 tokenName];
      int v34 = [v52 containsObject:v33];

      if (v34) {
        goto LABEL_15;
      }
    }
    v31 = [v9 objectAtIndexedSubscript:v30];
    uint64_t v35 = [_EARSpeechRecognitionToken alloc];
    long long v36 = [v11 tokenName];
    [v11 start];
    double v38 = v37;
    [v11 end];
    double v40 = v39;
    [v11 silenceStart];
    double v42 = v41;
    [v11 confidence];
    double v44 = v43;
    uint64_t v45 = [v11 hasSpaceAfter];
    uint64_t v46 = [v31 hasSpaceBefore];
    uint64_t v47 = [v11 phoneSequence];
    uint64_t v48 = [v11 ipaPhoneSequence];
    uint64_t v49 = [(_EARSpeechRecognitionToken *)v35 initWithTokenName:v36 start:v45 end:v46 silenceStart:v47 confidence:v48 hasSpaceAfter:v38 hasSpaceBefore:v40 phoneSequence:v42 ipaPhoneSequence:v44];

    id v11 = (void *)v49;
  }

LABEL_15:
  return v11;
}

- (id)splitRecognitionWithPotentialCommandRecognition:(BOOL)a3
{
  BOOL v36 = a3;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  if (quasar::gLogLevel >= 5)
  {
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v61 = 0u;
    kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)&v61);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v61, (uint64_t)"Voice Command: tokenSausage count:", 34);
    [(NSArray *)self->_tokenSausage count];
    std::ostream::operator<<();
    quasar::QuasarDebugMessage::~QuasarDebugMessage((quasar::QuasarDebugMessage *)&v61);
  }
  int v3 = [(NSArray *)self->_tokenSausage count];
  if (v3 < 2)
  {
LABEL_27:
    if (v36) {
      id v20 = [[_EARSpeechRecognition alloc] _initWithTokenSausage:self->_tokenSausage interpretationIndices:self->_interpretationIndices nBest:self->_nBest endsOfSentencePunctuations:self->_endsOfSentencePunctuations];
    }
    else {
      id v20 = 0;
    }
    goto LABEL_51;
  }
  uint64_t v4 = (v3 - 2);
  while (1)
  {
    id v5 = [(NSArray *)self->_tokenSausage objectAtIndex:v4];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    obuint64_t j = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v57 objects:v81 count:16];
    if (v6) {
      break;
    }

LABEL_25:
    if (v4-- <= 0) {
      goto LABEL_27;
    }
  }
  uint64_t v7 = *(void *)v58;
  uint64_t v8 = -1;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v58 != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v57 + 1) + 8 * i);
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v53 objects:v80 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v54;
        while (2)
        {
          for (uint64_t j = 0; j != v12; ++j)
          {
            if (*(void *)v54 != v13) {
              objc_enumerationMutation(v11);
            }
            char v15 = *(void **)(*((void *)&v53 + 1) + 8 * j);
            [v15 end];
            double v17 = v16;
            [v15 silenceStart];
            if (v17 - v18 >= 1.0)
            {
              uint64_t v8 = v4;
              goto LABEL_20;
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v53 objects:v80 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_20:
    }
    uint64_t v6 = [obj countByEnumeratingWithState:&v57 objects:v81 count:16];
  }
  while (v6);

  if (v8 == -1) {
    goto LABEL_25;
  }
  NSUInteger v21 = v8 + 1;
  if (v36)
  {
    uint64_t v22 = v8 + 1;
    NSUInteger v21 = [(NSArray *)self->_tokenSausage count] + ~v8;
  }
  else
  {
    uint64_t v22 = 0;
  }
  uint64_t v35 = -[NSArray subarrayWithRange:](self->_tokenSausage, "subarrayWithRange:", v22, v21);
  id obja = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  double v38 = self->_interpretationIndices;
  uint64_t v23 = [(NSArray *)v38 countByEnumeratingWithState:&v49 objects:v79 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v50;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v50 != v24) {
          objc_enumerationMutation(v38);
        }
        uint64_t v26 = objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * k), "subarrayWithRange:", v22, v21);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v27 = obja;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v45 objects:v78 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v46;
          while (2)
          {
            for (uint64_t m = 0; m != v28; ++m)
            {
              if (*(void *)v46 != v29) {
                objc_enumerationMutation(v27);
              }
              if ([*(id *)(*((void *)&v45 + 1) + 8 * m) isEqualToArray:v26])
              {

                goto LABEL_48;
              }
            }
            uint64_t v28 = [v27 countByEnumeratingWithState:&v45 objects:v78 count:16];
            if (v28) {
              continue;
            }
            break;
          }
        }

        [v27 addObject:v26];
LABEL_48:
      }
      uint64_t v23 = [(NSArray *)v38 countByEnumeratingWithState:&v49 objects:v79 count:16];
    }
    while (v23);
  }

  *(void *)&long long v61 = 0;
  *((void *)&v61 + 1) = &v61;
  *(void *)&long long v62 = 0x3032000000;
  *((void *)&v62 + 1) = __Block_byref_object_copy__2;
  *(void *)&long long v63 = __Block_byref_object_dispose__2;
  *((void *)&v63 + 1) = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v35, "count"));
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __73___EARSpeechRecognition_splitRecognitionWithPotentialCommandRecognition___block_invoke;
  v41[3] = &unk_1E5FFE300;
  BOOL v44 = v36;
  v41[4] = self;
  id v31 = v35;
  id v42 = v31;
  double v43 = &v61;
  [v31 enumerateObjectsUsingBlock:v41];
  id v32 = *(id *)(*((void *)&v61 + 1) + 40);

  long long v33 = +[_EARSpeechRecognition reconstructNBestFromSausage:v32 interpretationIndices:obja];
  id v20 = [[_EARSpeechRecognition alloc] _initWithTokenSausage:v32 interpretationIndices:obja nBest:v33 endsOfSentencePunctuations:self->_endsOfSentencePunctuations];

  _Block_object_dispose(&v61, 8);
LABEL_51:
  return v20;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<tokenSausage = %@, interpretationIndices = %@>", self->_tokenSausage, self->_interpretationIndices];
}

+ (id)reconstructNBestFromSausage:(id)a3 interpretationIndices:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v16 = a4;
  id v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v16, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = v16;
  uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "count", v16);
        uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
        if (v9)
        {
          for (uint64_t j = 0; j != v9; ++j)
          {
            uint64_t v12 = [v8 objectAtIndex:j];
            uint64_t v13 = [v5 objectAtIndex:j];
            v14 = objc_msgSend(v13, "objectAtIndex:", (int)objc_msgSend(v12, "intValue"));

            [v10 addObjectsFromArray:v14];
          }
        }
        [v19 addObject:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  return v19;
}

- (NSArray)tokenSausage
{
  return self->_tokenSausage;
}

- (void)setTokenSausage:(id)a3
{
}

- (NSArray)interpretationIndices
{
  return self->_interpretationIndices;
}

- (NSArray)nBest
{
  return self->_nBest;
}

- (NSSet)endsOfSentencePunctuations
{
  return self->_endsOfSentencePunctuations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endsOfSentencePunctuations, 0);
  objc_storeStrong((id *)&self->_nBest, 0);
  objc_storeStrong((id *)&self->_interpretationIndices, 0);
  objc_storeStrong((id *)&self->_tokenSausage, 0);
}

@end