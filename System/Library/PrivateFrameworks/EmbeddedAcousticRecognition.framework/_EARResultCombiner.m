@interface _EARResultCombiner
+ (void)initialize;
- (_EARResultCombiner)initWithConfiguration:(id)a3;
- (id).cxx_construct;
- (id)combinedResultWithSystemResults:(id)a3;
@end

@implementation _EARResultCombiner

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

- (_EARResultCombiner)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_EARResultCombiner;
  if ([(_EARResultCombiner *)&v7 init])
  {
    [v4 fileSystemRepresentation];
    operator new();
  }
  v5 = (_EARResultCombiner *)0;

  return v5;
}

- (id)combinedResultWithSystemResults:(id)a3
{
  v182[5] = *MEMORY[0x1E4F143B8];
  memset(v137, 0, sizeof(v137));
  memset(v136, 0, sizeof(v136));
  memset(v135, 0, sizeof(v135));
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  id obj = a3;
  uint64_t v99 = [obj countByEnumeratingWithState:&v131 objects:v155 count:16];
  if (v99)
  {
    uint64_t v102 = *(void *)v132;
    do
    {
      for (uint64_t i = 0; i != v99; ++i)
      {
        if (*(void *)v132 != v102) {
          objc_enumerationMutation(obj);
        }
        v100 = *(void **)(*((void *)&v131 + 1) + 8 * i);
        id v3 = [v100 sausage];
        v129 = 0;
        uint64_t v130 = 0;
        v128 = 0;
        long long v141 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        long long v144 = 0u;
        id v107 = v3;
        uint64_t v103 = [v107 countByEnumeratingWithState:&v141 objects:&v156 count:16];
        if (v103)
        {
          uint64_t v104 = *(void *)v142;
          do
          {
            for (id j = 0; j != (id)v103; id j = (char *)j + 1)
            {
              if (*(void *)v142 != v104) {
                objc_enumerationMutation(v107);
              }
              id v4 = *(id *)(*((void *)&v141 + 1) + 8 * (void)j);
              v139 = 0;
              uint64_t v140 = 0;
              v138 = 0;
              long long v148 = 0u;
              long long v149 = 0u;
              long long v150 = 0u;
              long long v151 = 0u;
              id v110 = v4;
              uint64_t v114 = [v110 countByEnumeratingWithState:&v148 objects:&v160 count:16];
              if (v114)
              {
                uint64_t v112 = *(void *)v149;
                do
                {
                  for (id k = 0; k != (id)v114; id k = (char *)k + 1)
                  {
                    if (*(void *)v149 != v112) {
                      objc_enumerationMutation(v110);
                    }
                    id v5 = *(id *)(*((void *)&v148 + 1) + 8 * (void)k);
                    unint64_t v146 = 0;
                    unint64_t v147 = 0;
                    uint64_t v145 = 0;
                    long long v152 = 0u;
                    memset(v153, 0, 48);
                    id v122 = v5;
                    uint64_t v6 = [v122 countByEnumeratingWithState:&v152 objects:v162 count:16];
                    if (v6)
                    {
                      uint64_t v7 = *(void *)v153[0];
                      do
                      {
                        for (uint64_t m = 0; m != v6; ++m)
                        {
                          if (*(void *)v153[0] != v7) {
                            objc_enumerationMutation(v122);
                          }
                          id v9 = *(id *)(*((void *)&v152 + 1) + 8 * m);
                          v10 = v9;
                          if (v9)
                          {
                            [v9 quasarToken];
                          }
                          else
                          {
                            memset(v182, 0, 32);
                            long long v180 = 0u;
                            long long __p = 0u;
                            long long v179 = 0u;
                            long long v177 = 0u;
                            memset(v178, 0, sizeof(v178));
                            memset(v176, 0, sizeof(v176));
                            long long v175 = 0u;
                            memset(v174, 0, sizeof(v174));
                          }

                          unint64_t v11 = v146;
                          if (v146 >= v147)
                          {
                            unint64_t v146 = std::vector<quasar::Token>::__push_back_slow_path<quasar::Token>(&v145, (long long *)v174);
                            if (SHIBYTE(v182[0]) < 0) {
                              operator delete((void *)__p);
                            }
                          }
                          else
                          {
                            long long v12 = *(_OWORD *)&v174[0].__r_.__value_.__l.__data_;
                            *(void *)(v146 + 16) = *((void *)&v174[0].__r_.__value_.__l + 2);
                            *(_OWORD *)unint64_t v11 = v12;
                            memset(v174, 0, 24);
                            uint64_t v13 = *(std::string::size_type *)((char *)&v174[1].__r_.__value_.__r.__words[1] + 6);
                            *(_OWORD *)(v11 + 24) = *(_OWORD *)&v174[1].__r_.__value_.__l.__data_;
                            *(void *)(v11 + 38) = v13;
                            uint64_t v14 = v176[0];
                            *(_OWORD *)(v11 + 48) = v175;
                            *(void *)(v11 + 64) = v14;
                            *(void *)(v11 + 72) = 0;
                            v176[0] = 0;
                            long long v175 = 0uLL;
                            *(void *)(v11 + 80) = 0;
                            *(void *)(v11 + 88) = 0;
                            *(_OWORD *)(v11 + 72) = *(_OWORD *)&v176[1];
                            *(void *)(v11 + 88) = v176[3];
                            memset(&v176[1], 0, 24);
                            long long v15 = v177;
                            *(void *)(v11 + 112) = v178[0];
                            *(void *)(v11 + 120) = 0;
                            *(_OWORD *)(v11 + 96) = v15;
                            v178[0] = 0;
                            long long v177 = 0uLL;
                            *(void *)(v11 + 128) = 0;
                            *(void *)(v11 + 136) = 0;
                            *(_OWORD *)(v11 + 120) = *(_OWORD *)&v178[1];
                            *(void *)(v11 + 136) = v178[3];
                            memset(&v178[1], 0, 24);
                            long long v16 = v179;
                            *(void *)(v11 + 160) = v180;
                            *(_OWORD *)(v11 + 144) = v16;
                            *(void *)&long long v180 = 0;
                            long long v179 = 0uLL;
                            LODWORD(v14) = DWORD2(v180);
                            *(_WORD *)(v11 + 172) = WORD6(v180);
                            *(_DWORD *)(v11 + 168) = v14;
                            long long v17 = __p;
                            *(void *)(v11 + 192) = v182[0];
                            *(_OWORD *)(v11 + 176) = v17;
                            v182[0] = 0;
                            long long __p = 0uLL;
                            long long v18 = *(_OWORD *)&v182[1];
                            *(_DWORD *)(v11 + 216) = v182[3];
                            *(_OWORD *)(v11 + 200) = v18;
                            unint64_t v146 = v11 + 224;
                          }
                          if (SBYTE7(v180) < 0) {
                            operator delete((void *)v179);
                          }
                          v154 = (void **)&v178[1];
                          std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100](&v154);
                          if (SHIBYTE(v178[0]) < 0) {
                            operator delete((void *)v177);
                          }
                          v154 = (void **)&v176[1];
                          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v154);
                          if (SHIBYTE(v176[0]) < 0) {
                            operator delete((void *)v175);
                          }
                          if (SHIBYTE(v174[0].__r_.__value_.__r.__words[2]) < 0) {
                            operator delete(v174[0].__r_.__value_.__l.__data_);
                          }
                        }
                        uint64_t v6 = [v122 countByEnumeratingWithState:&v152 objects:v162 count:16];
                      }
                      while (v6);
                    }

                    std::vector<std::vector<quasar::Token>>::push_back[abi:ne180100]((uint64_t *)&v138, (uint64_t)&v145);
                    v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v145;
                    std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);
                  }
                  uint64_t v114 = [v110 countByEnumeratingWithState:&v148 objects:&v160 count:16];
                }
                while (v114);
              }

              std::vector<std::vector<std::vector<quasar::Token>>>::push_back[abi:ne180100]((uint64_t *)&v128, (uint64_t)&v138);
              v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v138;
              std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);
            }
            uint64_t v103 = [v107 countByEnumeratingWithState:&v141 objects:&v156 count:16];
          }
          while (v103);
        }

        std::vector<std::vector<std::vector<std::vector<quasar::Token>>>>::push_back[abi:ne180100](v137, (uint64_t)&v128);
        v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v128;
        std::vector<std::vector<std::vector<quasar::Token>>>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);

        id v19 = [v100 nBestIndexes];
        *(void *)&long long v149 = 0;
        long long v148 = 0uLL;
        unsigned long long v156 = 0u;
        long long v157 = 0u;
        long long v158 = 0u;
        long long v159 = 0u;
        id v109 = v19;
        uint64_t v20 = [v109 countByEnumeratingWithState:&v156 objects:v162 count:16];
        if (v20)
        {
          id v111 = *(id *)v157;
          do
          {
            uint64_t v21 = 0;
            uint64_t v113 = v20;
            do
            {
              if (*(id *)v157 != v111) {
                objc_enumerationMutation(v109);
              }
              id v22 = *(id *)(*((void *)&v156 + 1) + 8 * v21);
              v153[0] = 0;
              long long v152 = 0uLL;
              long long v160 = 0u;
              memset(v161, 0, 48);
              id v117 = v22;
              uint64_t v23 = [v117 countByEnumeratingWithState:&v160 objects:v174 count:16];
              uint64_t v115 = v21;
              if (v23)
              {
                id v123 = *(id *)v161[0];
                do
                {
                  for (uint64_t n = 0; n != v23; ++n)
                  {
                    if (*(id *)v161[0] != v123) {
                      objc_enumerationMutation(v117);
                    }
                    id v25 = *(id *)(*((void *)&v160 + 1) + 8 * n);
                    uint64_t v26 = [v25 unsignedLongValue];
                    uint64_t v27 = v26;
                    v28 = (char *)*((void *)&v152 + 1);
                    if (*((void *)&v152 + 1) >= v153[0])
                    {
                      v30 = (char *)v152;
                      uint64_t v31 = (uint64_t)(*((void *)&v152 + 1) - v152) >> 3;
                      unint64_t v32 = v31 + 1;
                      if ((unint64_t)(v31 + 1) >> 61) {
                        std::vector<int>::__throw_length_error[abi:ne180100]();
                      }
                      uint64_t v33 = v153[0] - v152;
                      if ((uint64_t)(v153[0] - v152) >> 2 > v32) {
                        unint64_t v32 = v33 >> 2;
                      }
                      if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8) {
                        unint64_t v34 = 0x1FFFFFFFFFFFFFFFLL;
                      }
                      else {
                        unint64_t v34 = v32;
                      }
                      if (v34)
                      {
                        v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<kaldi::CuWorkspace *>>((uint64_t)v153, v34);
                        v28 = (char *)*((void *)&v152 + 1);
                        v30 = (char *)v152;
                      }
                      else
                      {
                        v35 = 0;
                      }
                      v36 = (uint64_t *)&v35[8 * v31];
                      uint64_t *v36 = v27;
                      v29 = v36 + 1;
                      while (v28 != v30)
                      {
                        uint64_t v37 = *((void *)v28 - 1);
                        v28 -= 8;
                        *--v36 = v37;
                      }
                      *(void *)&long long v152 = v36;
                      *((void *)&v152 + 1) = v29;
                      v153[0] = &v35[8 * v34];
                      if (v30) {
                        operator delete(v30);
                      }
                    }
                    else
                    {
                      **((void **)&v152 + 1) = v26;
                      v29 = v28 + 8;
                    }
                    *((void *)&v152 + 1) = v29;
                  }
                  uint64_t v23 = [v117 countByEnumeratingWithState:&v160 objects:v174 count:16];
                }
                while (v23);
              }

              std::vector<std::vector<unsigned long>>::push_back[abi:ne180100]((uint64_t *)&v148, (uint64_t)&v152);
              if ((void)v152)
              {
                *((void *)&v152 + 1) = v152;
                operator delete((void *)v152);
              }

              uint64_t v21 = v115 + 1;
            }
            while (v115 + 1 != v113);
            uint64_t v20 = [v109 countByEnumeratingWithState:&v156 objects:v162 count:16];
          }
          while (v20);
        }

        std::vector<std::vector<std::vector<unsigned long>>>::push_back[abi:ne180100](v136, (uint64_t)&v148);
        v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v148;
        std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);

        id v38 = [v100 confidences];
        v161[0] = 0;
        long long v160 = 0uLL;
        memset(v162, 0, sizeof(v162));
        long long v163 = 0u;
        long long v164 = 0u;
        id v118 = v38;
        uint64_t v39 = [v118 countByEnumeratingWithState:v162 objects:v174 count:16];
        if (v39)
        {
          id v124 = **(id **)&v162[16];
          do
          {
            for (uint64_t ii = 0; ii != v39; ++ii)
            {
              if (**(id **)&v162[16] != v124) {
                objc_enumerationMutation(v118);
              }
              id v41 = *(id *)(*(void *)&v162[8] + 8 * ii);
              [v41 floatValue];
              int v43 = v42;
              v44 = (char *)*((void *)&v160 + 1);
              if (*((void *)&v160 + 1) >= v161[0])
              {
                v46 = (char *)v160;
                uint64_t v47 = (uint64_t)(*((void *)&v160 + 1) - v160) >> 2;
                unint64_t v48 = v47 + 1;
                if ((unint64_t)(v47 + 1) >> 62) {
                  std::vector<int>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v49 = v161[0] - v160;
                if ((uint64_t)(v161[0] - v160) >> 1 > v48) {
                  unint64_t v48 = v49 >> 1;
                }
                if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v50 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v50 = v48;
                }
                if (v50)
                {
                  v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v161, v50);
                  v44 = (char *)*((void *)&v160 + 1);
                  v46 = (char *)v160;
                }
                else
                {
                  v51 = 0;
                }
                v52 = &v51[4 * v47];
                *(_DWORD *)v52 = v43;
                v45 = v52 + 4;
                while (v44 != v46)
                {
                  int v53 = *((_DWORD *)v44 - 1);
                  v44 -= 4;
                  *((_DWORD *)v52 - 1) = v53;
                  v52 -= 4;
                }
                *(void *)&long long v160 = v52;
                *((void *)&v160 + 1) = v45;
                v161[0] = &v51[4 * v50];
                if (v46) {
                  operator delete(v46);
                }
              }
              else
              {
                **((_DWORD **)&v160 + 1) = v42;
                v45 = v44 + 4;
              }
              *((void *)&v160 + 1) = v45;
            }
            uint64_t v39 = [v118 countByEnumeratingWithState:v162 objects:v174 count:16];
          }
          while (v39);
        }

        std::vector<std::vector<float>>::push_back[abi:ne180100](v135, (uint64_t)&v160);
        if ((void)v160)
        {
          *((void *)&v160 + 1) = v160;
          operator delete((void *)v160);
        }
      }
      uint64_t v99 = [obj countByEnumeratingWithState:&v131 objects:v155 count:16];
    }
    while (v99);
  }

  long long v152 = 0uLL;
  v153[0] = 0;
  long long v148 = 0uLL;
  *(void *)&long long v149 = 0;
  long long v141 = 0uLL;
  *(void *)&long long v142 = 0;
  uint64_t v145 = 0;
  unint64_t v146 = 0;
  unint64_t v147 = 0;
  v138 = 0;
  v139 = 0;
  uint64_t v140 = 0;
  v128 = 0;
  v129 = 0;
  uint64_t v130 = 0;
  (**(void (***)(ResultCombiner *, uint64_t *))self->_combiner.__ptr_.__value_)(self->_combiner.__ptr_.__value_, v137);
  v119 = objc_alloc_init(_EARCombinedResult);
  v121 = [MEMORY[0x1E4F1CA48] array];
  v120 = (uint64_t **)*((void *)&v152 + 1);
  v54 = (uint64_t **)v152;
  if ((void)v152 != *((void *)&v152 + 1))
  {
    do
    {
      unsigned long long v156 = 0uLL;
      *(void *)&long long v157 = 0;
      v125 = v54;
      std::vector<std::vector<quasar::Token>>::__init_with_size[abi:ne180100]<std::vector<quasar::Token>*,std::vector<quasar::Token>*>(&v156, *v54, v54[1], 0xAAAAAAAAAAAAAAABLL * (v54[1] - *v54));
      v127 = [MEMORY[0x1E4F1CA48] array];
      v55 = (uint64_t *)*((void *)&v156 + 1);
      unsigned long long v57 = v156;
      v126 = (uint64_t *)(v57 >> 64);
      for (jid j = (uint64_t *)v57; jj != v55; jj += 3)
      {
        long long v160 = 0uLL;
        v161[0] = 0;
        std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(&v160, *jj, jj[1], 0x6DB6DB6DB6DB6DB7 * ((jj[1] - *jj) >> 5));
        v58 = [MEMORY[0x1E4F1CA48] array];
        v60 = (const quasar::Token *)*((void *)&v160 + 1);
        for (kid k = (const quasar::Token *)v160; kk != v60; kid k = (const quasar::Token *)((char *)kk + 224))
        {
          quasar::Token::Token(v174, kk);
          quasar::Token::Token((std::string *)v162, (const quasar::Token *)v174);
          id v61 = [[_EARSpeechRecognitionToken alloc] _initWithQuasarToken:v162];
          [v58 addObject:v61];

          if (v173 < 0) {
            operator delete(v172);
          }
          if (v171 < 0) {
            operator delete(v170);
          }
          v154 = (void **)&v169;
          std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100](&v154);
          if (v168 < 0) {
            operator delete(v167);
          }
          v154 = (void **)&v166;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v154);
          if (v165 < 0) {
            operator delete((void *)v164);
          }
          if ((v162[23] & 0x80000000) != 0) {
            operator delete(*(void **)v162);
          }
          if (SHIBYTE(v182[0]) < 0) {
            operator delete((void *)__p);
          }
          if (SBYTE7(v180) < 0) {
            operator delete((void *)v179);
          }
          v154 = (void **)&v178[1];
          std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100](&v154);
          if (SHIBYTE(v178[0]) < 0) {
            operator delete((void *)v177);
          }
          v154 = (void **)&v176[1];
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v154);
          if (SHIBYTE(v176[0]) < 0) {
            operator delete((void *)v175);
          }
          if (SHIBYTE(v174[0].__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v174[0].__r_.__value_.__l.__data_);
          }
        }
        v62 = (void *)[v58 copy];

        [v127 addObject:v62];
        v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v160;
        std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);
        v55 = v126;
      }
      v63 = (void *)[v127 copy];

      [v121 addObject:v63];
      v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v156;
      std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);
      v54 = v125 + 3;
    }
    while (v125 + 3 != v120);
  }
  v64 = (void *)[v121 copy];

  [(_EARSystemResult *)v119 setSausage:v64];
  v65 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v67 = *((void *)&v148 + 1);
  for (muint64_t m = v148; mm != v67; mm += 24)
  {
    memset(v174, 0, 24);
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(v174, *(const void **)mm, *(void *)(mm + 8), (uint64_t)(*(void *)(mm + 8) - *(void *)mm) >> 3);
    v68 = [MEMORY[0x1E4F1CA48] array];
    std::string::size_type size = v174[0].__r_.__value_.__l.__size_;
    for (nuint64_t n = (void *)v174[0].__r_.__value_.__r.__words[0]; nn != (void *)size; ++nn)
    {
      v71 = [NSNumber numberWithUnsignedLong:*nn];
      [v68 addObject:v71];
    }
    v72 = (void *)[v68 copy];

    [v65 addObject:v72];
    if (v174[0].__r_.__value_.__r.__words[0])
    {
      v174[0].__r_.__value_.__l.__size_ = v174[0].__r_.__value_.__r.__words[0];
      operator delete(v174[0].__r_.__value_.__l.__data_);
    }
  }
  v73 = (void *)[v65 copy];

  [(_EARSystemResult *)v119 setNBestIndexes:v73];
  v74 = [MEMORY[0x1E4F1CA48] array];
  v77 = (_DWORD *)*((void *)&v141 + 1);
  for (i1 = (_DWORD *)v141; i1 != v77; ++i1)
  {
    LODWORD(v75) = *i1;
    v78 = [NSNumber numberWithFloat:v75];
    [v74 addObject:v78];
  }
  v79 = (void *)[v74 copy];

  [(_EARSystemResult *)v119 setConfidences:v79];
  v80 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v81 = v145;
  for (unint64_t i2 = v146; v81 != i2; v81 += 24)
  {
    if (*(char *)(v81 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v174, *(const std::string::value_type **)v81, *(void *)(v81 + 8));
    }
    else
    {
      long long v83 = *(_OWORD *)v81;
      v174[0].__r_.__value_.__r.__words[2] = *(void *)(v81 + 16);
      *(_OWORD *)&v174[0].__r_.__value_.__l.__data_ = v83;
    }
    if ((v174[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v84 = v174;
    }
    else {
      v84 = (std::string *)v174[0].__r_.__value_.__r.__words[0];
    }
    v85 = [NSString stringWithUTF8String:v84];
    [v80 addObject:v85];

    if (SHIBYTE(v174[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v174[0].__r_.__value_.__l.__data_);
    }
  }
  v86 = (void *)[v80 copy];

  [(_EARCombinedResult *)v119 setNBestStrings:v86];
  v87 = [MEMORY[0x1E4F1CA48] array];
  v88 = v138;
  v89 = v139;
  if (v138 != v139)
  {
    do
    {
      v90 = [NSNumber numberWithUnsignedLong:*v88];
      [v87 addObject:v90];

      ++v88;
    }
    while (v88 != v89);
  }
  v91 = (void *)[v87 copy];

  [(_EARCombinedResult *)v119 setNBestSourceIndexes:v91];
  v92 = [MEMORY[0x1E4F1CA48] array];
  v93 = v128;
  v94 = v129;
  if (v128 != v129)
  {
    do
    {
      v95 = [NSNumber numberWithUnsignedLong:*v93];
      [v92 addObject:v95];

      ++v93;
    }
    while (v93 != v94);
  }
  v96 = (void *)[v92 copy];

  [(_EARCombinedResult *)v119 setOriginalRanks:v96];
  v97 = v119;

  if (v128)
  {
    v129 = v128;
    operator delete(v128);
  }
  if (v138)
  {
    v139 = v138;
    operator delete(v138);
  }
  v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v145;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);
  if ((void)v141)
  {
    *((void *)&v141 + 1) = v141;
    operator delete((void *)v141);
  }
  v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v148;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);
  v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&v152;
  std::vector<std::vector<std::vector<quasar::Token>>>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);
  v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v135;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);
  v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v136;
  std::vector<std::vector<std::vector<unsigned long>>>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);
  v174[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v137;
  std::vector<std::vector<std::vector<std::vector<quasar::Token>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)v174);

  return v97;
}

- (void).cxx_destruct
{
  value = self->_combiner.__ptr_.__value_;
  self->_combiner.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 32))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end