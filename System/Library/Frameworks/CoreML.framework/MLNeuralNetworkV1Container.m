@interface MLNeuralNetworkV1Container
+ (id)containerFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
+ (id)readerFromArchive:(void *)a3 error:(id *)a4;
@end

@implementation MLNeuralNetworkV1Container

+ (id)containerFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  uint64_t v237 = *MEMORY[0x1E4F143B8];
  id v170 = a4;
  id v174 = a5;
  id v171 = a6;
  v172 = (_MLModelInputArchiver *)a3;
  v168 = a7;
  v12 = [a1 readerFromArchive:a3 error:a7];
  id v13 = v12;
  v177 = v12;
  if (!v12) {
    goto LABEL_189;
  }
  v169 = [v12 modelPath];
  id v14 = [(id)objc_opt_class() modelName];
  std::string::basic_string[abi:ne180100]<0>(v231, (char *)[v14 UTF8String]);

  v167 = [a1 containerFromCompiledArchiveCommon:a3 filename:v169 modelVersionInfo:v170 compilerVersionInfo:v174 configuration:v171 error:a7];
  if (!*a7)
  {
    uint64_t v230 = 0;
    v229 = 0;
    v228 = &v229;
    v227[1] = 0;
    v227[0] = 0;
    v226 = v227;
    v225[1] = 0;
    v225[0] = 0;
    v224 = v225;
    v223[1] = 0;
    v223[0] = 0;
    v222 = v223;
    v221[1] = 0;
    v221[0] = 0;
    v220 = v221;
    v219[1] = 0;
    v219[0] = 0;
    v218 = v219;
    v217[1] = 0;
    v217[0] = 0;
    v216 = v217;
    v215[1] = 0;
    v215[0] = 0;
    v214 = v215;
    v213[1] = 0;
    v213[0] = 0;
    v212 = v213;
    uint64_t v211 = 0;
    v210 = 0;
    v209 = &v210;
    v15 = +[MLVersionInfo versionInfoWithMajor:1 minor:2 patch:0 variant:&stru_1EF0E81D0];
    char v16 = [v174 olderThan:v15];

    v17 = IArchive::nestedArchive(a3, (uint64_t)v231);
    if (v16)
    {
      v18 = &v209;
    }
    else
    {
      operator>><std::string,float>((uint64_t)v17, (uint64_t)&v228);
      v19 = IArchive::nestedArchive(a3, (uint64_t)v231);
      operator>><std::string,float>((uint64_t)v19, (uint64_t)&v226);
      v20 = IArchive::nestedArchive(a3, (uint64_t)v231);
      operator>><std::string,float>((uint64_t)v20, (uint64_t)&v224);
      v21 = IArchive::nestedArchive(a3, (uint64_t)v231);
      operator>><std::string,float>((uint64_t)v21, (uint64_t)&v222);
      v22 = IArchive::nestedArchive(a3, (uint64_t)v231);
      operator>><std::string,float>((uint64_t)v22, (uint64_t)&v220);
      v23 = IArchive::nestedArchive(a3, (uint64_t)v231);
      operator>><std::string,float>((uint64_t)v23, (uint64_t)&v218);
      v24 = IArchive::nestedArchive(a3, (uint64_t)v231);
      operator>><std::string,float>((uint64_t)v24, (uint64_t)&v216);
      v17 = IArchive::nestedArchive(a3, (uint64_t)v231);
      v18 = &v214;
    }
    operator>><std::string,float>((uint64_t)v17, (uint64_t)v18);
    if (v230)
    {
      v175 = [MEMORY[0x1E4F1CA60] dictionary];
      v25 = v228;
      if (v228 == &v229) {
        goto LABEL_112;
      }
      char v26 = 0;
      do
      {
        if (*((char *)v25 + 55) < 0) {
          std::string::__init_copy_ctor_external(&v199, v25[4], (std::string::size_type)v25[5]);
        }
        else {
          std::string v199 = *(std::string *)(v25 + 4);
        }
        if ((v199.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v27 = &v199;
        }
        else {
          v27 = (std::string *)v199.__r_.__value_.__r.__words[0];
        }
        v28 = [NSString stringWithUTF8String:v27];
        v29 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", MEMORY[0x1E4F1CC28], &unk_1EF11AB38, &unk_1EF11AB38, &unk_1EF11AB38, &unk_1EF11AB38, &unk_1EF11AB48, 0);
        if (v227 != std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v226, &v199))
        {
          v30 = NSNumber;
          LODWORD(v31) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v226, &v199);
          v32 = objc_msgSend(v30, "numberWithBool:", *(float *)&v31 != 0.0, v31);
          [v29 setObject:v32 atIndexedSubscript:0];
        }
        if (v225 != std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v224, &v199))
        {
          v33 = NSNumber;
          LODWORD(v34) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v224, &v199);
          v35 = objc_msgSend(v33, "numberWithBool:", *(float *)&v34 != 0.0, v34);
          [v29 setObject:v35 atIndexedSubscript:1];
        }
        if (v223 != std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v222, &v199))
        {
          v36 = NSNumber;
          LODWORD(v37) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v222, &v199);
          v38 = [v36 numberWithFloat:v37];
          [v29 setObject:v38 atIndexedSubscript:2];
        }
        if (v221 != std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v220, &v199))
        {
          v39 = NSNumber;
          LODWORD(v40) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v220, &v199);
          v41 = [v39 numberWithFloat:v40];
          [v29 setObject:v41 atIndexedSubscript:3];
        }
        if (v219 != std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v218, &v199))
        {
          v42 = NSNumber;
          LODWORD(v43) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v218, &v199);
          v44 = [v42 numberWithFloat:v43];
          [v29 setObject:v44 atIndexedSubscript:4];
        }
        if (v217 != std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v216, &v199))
        {
          v45 = NSNumber;
          LODWORD(v46) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v216, &v199);
          v47 = [v45 numberWithFloat:v46];
          [v29 setObject:v47 atIndexedSubscript:5];
        }
        if (v215 != std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v214, &v199))
        {
          v48 = NSNumber;
          LODWORD(v49) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v214, &v199);
          v50 = [v48 numberWithFloat:v49];
          [v29 setObject:v50 atIndexedSubscript:6];
        }
        v51 = [v29 objectAtIndexedSubscript:1];
        [v51 doubleValue];
        if (fabs(v52) == 1.0)
        {
          v53 = [v29 objectAtIndexedSubscript:2];
          [v53 doubleValue];
          BOOL v55 = 1;
          if (v54 >= 0.0 && v54 <= 0.0)
          {
            v56 = [v29 objectAtIndexedSubscript:3];
            [v56 doubleValue];
            if (v57 >= 0.0 && v57 <= 0.0)
            {
              v58 = [v29 objectAtIndexedSubscript:4];
              [v58 doubleValue];
              if (v59 >= 0.0 && v59 <= 0.0)
              {
                v165 = [v29 objectAtIndexedSubscript:5];
                [v165 doubleValue];
                if (v60 >= 0.0 && v60 <= 0.0)
                {
                  v163 = [v29 objectAtIndexedSubscript:6];
                  [v163 doubleValue];
                  BOOL v55 = v61 != 1.0;
                }
              }
            }
          }
        }
        else
        {
          BOOL v55 = 1;
        }

        v62 = (void *)[v29 copy];
        [v175 setObject:v62 forKeyedSubscript:v28];

        if (SHIBYTE(v199.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v199.__r_.__value_.__l.__data_);
        }
        v63 = v25[1];
        if (v63)
        {
          do
          {
            v64 = (char **)v63;
            v63 = *(char **)v63;
          }
          while (v63);
        }
        else
        {
          do
          {
            v64 = (char **)v25[2];
            BOOL v65 = *v64 == (char *)v25;
            v25 = v64;
          }
          while (!v65);
        }
        v26 |= v55;
        v25 = v64;
      }
      while (v64 != &v229);
      if ((v26 & 1) == 0) {
        goto LABEL_112;
      }
    }
    else
    {
      if (!v211)
      {
        id v100 = 0;
LABEL_113:
        v173 = v100;

        v175 = 0;
LABEL_114:
        uint64_t v208 = 1;
        id v183 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v112 = [v177 transformParams];
        v162 = v112;
        if (v112)
        {
          id v113 = v112;

          v175 = 0;
          v173 = v113;
        }
        v114 = [v167 modelDescription];
        v115 = [v114 inputDescriptionsByName];

        memset(&v207, 0, sizeof(v207));
        uint64_t v206 = 0;
        uint64_t v205 = 0;
        long long v201 = 0u;
        long long v202 = 0u;
        long long v203 = 0u;
        long long v204 = 0u;
        obuint64_t j = v115;
        uint64_t v116 = [obj countByEnumeratingWithState:&v201 objects:v236 count:16];
        if (v116)
        {
          uint64_t v117 = *(void *)v202;
          do
          {
            for (uint64_t i = 0; i != v116; ++i)
            {
              if (*(void *)v202 != v117) {
                objc_enumerationMutation(obj);
              }
              v119 = *(void **)(*((void *)&v201 + 1) + 8 * i);
              v120 = [obj objectForKeyedSubscript:v119];
              int v121 = [v120 isOptional];

              if (v121)
              {
                std::string::basic_string[abi:ne180100]<0>(&v199, (char *)[v119 UTF8String]);
                __p[0] = &v199;
                *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v212, &v199, (_OWORD **)__p)+ 14) = 0;
                if (SHIBYTE(v199.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v199.__r_.__value_.__l.__data_);
                }
              }
            }
            uint64_t v116 = [obj countByEnumeratingWithState:&v201 objects:v236 count:16];
          }
          while (v116);
        }

        std::string::basic_string[abi:ne180100]<0>(&v199, "neural_network_optionals");
        int hasNestedArchive = IArchive::hasNestedArchive(v172, &v199);
        int v123 = hasNestedArchive;
        if (SHIBYTE(v199.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v199.__r_.__value_.__l.__data_);
          if (v123) {
            goto LABEL_128;
          }
        }
        else if (hasNestedArchive)
        {
LABEL_128:
          std::string::basic_string[abi:ne180100]<0>(__p, "neural_network_optionals");
          v124 = (std::string::size_type *)IArchive::nestedArchive(v172, (uint64_t)__p);
          std::string::size_type v125 = v124[1];
          v199.__r_.__value_.__r.__words[0] = *v124;
          v199.__r_.__value_.__l.__size_ = v125;
          if (v125) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v125 + 8), 1uLL, memory_order_relaxed);
          }
          std::map<std::string,IArchive>::map[abi:ne180100]((uint64_t)&v199.__r_.__value_.__r.__words[2], v124 + 2);
          if (v198 < 0) {
            operator delete(__p[0]);
          }
          operator>>((uint64_t)&v199);
          v126 = +[MLVersionInfo versionInfoWithMajor:2 minor:1 patch:0 variant:&stru_1EF0E81D0];
          char v127 = [v174 olderThan:v126];

          if ((v127 & 1) == 0) {
            operator>><std::string>((uint64_t)&v199, &v207);
          }
          v128 = +[MLVersionInfo versionInfoWithMajor:3 minor:0 patch:0 variant:&stru_1EF0E81D0];
          char v129 = [v174 olderThan:v128];

          if ((v129 & 1) == 0)
          {
            operator>>((uint64_t)&v199);
            operator>>((uint64_t)&v199);
          }
          v130 = +[MLVersionInfo versionInfoWithMajor:4 minor:0 patch:0 variant:&stru_1EF0E81D0];
          char v131 = [v174 olderThan:v130];

          if ((v131 & 1) == 0) {
            operator>><std::string,float>((uint64_t)&v199, (uint64_t)&v212);
          }
          std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v200);
          if (v199.__r_.__value_.__l.__size_) {
            std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v199.__r_.__value_.__l.__size_);
          }
LABEL_151:
          id v192 = 0;
          v166 = [v177 loadUpdatableParams:&v192];
          id v164 = v192;
          if (v164)
          {
            +[MLModelErrorUtils updateErrorWithFormat:@"Error in unarchiving updatable params."];
            id v13 = 0;
            id *v168 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v176 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            long long v190 = 0u;
            long long v191 = 0u;
            long long v188 = 0u;
            long long v189 = 0u;
            id v180 = obj;
            uint64_t v136 = [v180 countByEnumeratingWithState:&v188 objects:v234 count:16];
            if (v136)
            {
              char v137 = 0;
              uint64_t v178 = *(void *)v189;
              uint64_t v179 = v136;
              do
              {
                for (uint64_t j = 0; j != v179; ++j)
                {
                  if (*(void *)v189 != v178) {
                    objc_enumerationMutation(v180);
                  }
                  v138 = *(void **)(*((void *)&v188 + 1) + 8 * j);
                  v139 = [v180 objectForKeyedSubscript:v138];
                  int v140 = [v139 isOptional];

                  if (v140)
                  {
                    long long v186 = 0u;
                    long long v187 = 0u;
                    long long v184 = 0u;
                    long long v185 = 0u;
                    v141 = [v177 layerInfos];
                    uint64_t v142 = [v141 countByEnumeratingWithState:&v184 objects:v233 count:16];
                    if (v142)
                    {
                      uint64_t v143 = *(void *)v185;
                      do
                      {
                        for (uint64_t k = 0; k != v142; ++k)
                        {
                          if (*(void *)v185 != v143) {
                            objc_enumerationMutation(v141);
                          }
                          v145 = *(void **)(*((void *)&v184 + 1) + 8 * k);
                          v146 = [v145 concatenatedInputNames];
                          int v147 = [v146 containsString:v138];

                          if (v147)
                          {
                            v148 = [v145 type];
                            int v149 = [v148 isEqualToString:@"sequence_concat"];

                            if (v149)
                            {
                              [v183 setObject:&unk_1EF11A328 forKeyedSubscript:v138];
                              char v137 = 1;
                            }
                            else
                            {
                              [v183 setObject:&unk_1EF11A340 forKeyedSubscript:v138];
                            }
                          }
                        }
                        uint64_t v142 = [v141 countByEnumeratingWithState:&v184 objects:v233 count:16];
                      }
                      while (v142);
                    }

                    v150 = NSNumber;
                    id v151 = v138;
                    std::string::basic_string[abi:ne180100]<0>(&v199, (char *)[v151 UTF8String]);
                    __p[0] = &v199;
                    LODWORD(v152) = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v212, &v199, (_OWORD **)__p)+ 14);
                    v153 = [v150 numberWithFloat:v152];
                    [v176 setObject:v153 forKeyedSubscript:v151];

                    if (SHIBYTE(v199.__r_.__value_.__r.__words[2]) < 0) {
                      operator delete(v199.__r_.__value_.__l.__data_);
                    }
                  }
                }
                uint64_t v179 = [v180 countByEnumeratingWithState:&v188 objects:v234 count:16];
              }
              while (v179);
            }
            else
            {
              char v137 = 0;
            }

            id v154 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            begiuint64_t n = v207.__begin_;
            for (std::vector<std::string>::pointer m = v207.__end_; begin != m; ++begin)
            {
              id v157 = [NSString alloc];
              std::vector<std::string>::pointer v158 = begin;
              if (SHIBYTE(begin->__r_.__value_.__r.__words[2]) < 0) {
                std::vector<std::string>::pointer v158 = (std::vector<std::string>::pointer)begin->__r_.__value_.__r.__words[0];
              }
              v159 = objc_msgSend(v157, "initWithCString:encoding:", v158, objc_msgSend(NSString, "defaultCStringEncoding"));
              [v154 addObject:v159];
            }
            [v167 setHasBidirectionalLayer:v208 != 0];
            [v167 setHasOptionalInputSequenceConcat:v137 & 1];
            [v167 setHasDynamicLayer:v205 != 0];
            [v167 setOptionalInputTypes:v183];
            [v167 setNdArrayInterpretation:v206 != 0];
            [v167 setHasDynamicLayer:v205 != 0];
            [v167 setUpdatableModelCompiledParams:v166];
            if (v175) {
              [v167 setImageParameters:v175];
            }
            if (v173) {
              [v167 setImagePreprocessingParams:v173];
            }
            [v167 setConfigurationList:v154];
            [v167 setOptionalInputDefaultValues:v176];
            [v177 copyLayerShapesToContainer:v167];
            v160 = neuralNetworkOutputFromArchive(v172);
            [v167 setCompilerOutput:v160];

            id v13 = v167;
          }

          v199.__r_.__value_.__r.__words[0] = (std::string::size_type)&v207;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v199);

          std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v210);
          std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v213[0]);
          std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v215[0]);
          std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v217[0]);
          std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v219[0]);
          std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v221[0]);
          std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v223[0]);
          std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v225[0]);
          std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v227[0]);
          std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v229);
          goto LABEL_186;
        }
        uint64_t v208 = 0;
        long long v193 = 0u;
        long long v194 = 0u;
        long long v195 = 0u;
        long long v196 = 0u;
        v132 = [v177 layerInfos];
        uint64_t v133 = [v132 countByEnumeratingWithState:&v193 objects:v235 count:16];
        if (v133)
        {
          uint64_t v134 = *(void *)v194;
          while (2)
          {
            for (uint64_t n = 0; n != v133; ++n)
            {
              if (*(void *)v194 != v134) {
                objc_enumerationMutation(v132);
              }
              if ([*(id *)(*((void *)&v193 + 1) + 8 * n) bidirectional])
              {
                uint64_t v208 = 1;

                goto LABEL_151;
              }
            }
            uint64_t v133 = [v132 countByEnumeratingWithState:&v193 objects:v235 count:16];
            if (v133) {
              continue;
            }
            break;
          }
        }

        goto LABEL_151;
      }
      v175 = [MEMORY[0x1E4F1CA60] dictionary];
      v66 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", MEMORY[0x1E4F1CC28], &unk_1EF11AB38, &unk_1EF11AB38, &unk_1EF11AB38, &unk_1EF11AB38, &unk_1EF11AB48, MEMORY[0x1E4F1CC38], 0);
      std::string::basic_string[abi:ne180100]<0>(&v199, (char *)[@"isOrderedBgr" UTF8String]);
      v67 = (char **)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v209, &v199);
      if (SHIBYTE(v199.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v199.__r_.__value_.__l.__data_);
      }
      if (&v210 != v67)
      {
        v68 = NSNumber;
        std::string::basic_string[abi:ne180100]<0>(&v199, (char *)[@"isOrderedBgr" UTF8String]);
        LODWORD(v69) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v209, &v199);
        v70 = objc_msgSend(v68, "numberWithBool:", *(float *)&v69 != 0.0, v69);
        [v66 setObject:v70 atIndexedSubscript:0];

        if (SHIBYTE(v199.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v199.__r_.__value_.__l.__data_);
        }
      }
      std::string::basic_string[abi:ne180100]<0>(&v199, (char *)[@"isGrayScale" UTF8String]);
      v71 = (char **)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v209, &v199);
      if (SHIBYTE(v199.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v199.__r_.__value_.__l.__data_);
      }
      if (&v210 != v71)
      {
        v72 = NSNumber;
        std::string::basic_string[abi:ne180100]<0>(&v199, (char *)[@"isGrayScale" UTF8String]);
        LODWORD(v73) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v209, &v199);
        v74 = objc_msgSend(v72, "numberWithBool:", *(float *)&v73 != 0.0, v73);
        [v66 setObject:v74 atIndexedSubscript:1];

        if (SHIBYTE(v199.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v199.__r_.__value_.__l.__data_);
        }
      }
      std::string::basic_string[abi:ne180100]<0>(&v199, (char *)[@"blueBias" UTF8String]);
      v75 = (char **)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v209, &v199);
      if (SHIBYTE(v199.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v199.__r_.__value_.__l.__data_);
      }
      if (&v210 != v75)
      {
        v76 = NSNumber;
        std::string::basic_string[abi:ne180100]<0>(&v199, (char *)[@"blueBias" UTF8String]);
        LODWORD(v77) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v209, &v199);
        v78 = [v76 numberWithFloat:v77];
        [v66 setObject:v78 atIndexedSubscript:2];

        if (SHIBYTE(v199.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v199.__r_.__value_.__l.__data_);
        }
      }
      std::string::basic_string[abi:ne180100]<0>(&v199, (char *)[@"greenBias" UTF8String]);
      v79 = (char **)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v209, &v199);
      if (SHIBYTE(v199.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v199.__r_.__value_.__l.__data_);
      }
      if (&v210 != v79)
      {
        v80 = NSNumber;
        std::string::basic_string[abi:ne180100]<0>(&v199, (char *)[@"greenBias" UTF8String]);
        LODWORD(v81) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v209, &v199);
        v82 = [v80 numberWithFloat:v81];
        [v66 setObject:v82 atIndexedSubscript:3];

        if (SHIBYTE(v199.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v199.__r_.__value_.__l.__data_);
        }
      }
      std::string::basic_string[abi:ne180100]<0>(&v199, (char *)[@"redBias" UTF8String]);
      v83 = (char **)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v209, &v199);
      if (SHIBYTE(v199.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v199.__r_.__value_.__l.__data_);
      }
      if (&v210 != v83)
      {
        v84 = NSNumber;
        std::string::basic_string[abi:ne180100]<0>(&v199, (char *)[@"redBias" UTF8String]);
        LODWORD(v85) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v209, &v199);
        v86 = [v84 numberWithFloat:v85];
        [v66 setObject:v86 atIndexedSubscript:4];

        if (SHIBYTE(v199.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v199.__r_.__value_.__l.__data_);
        }
      }
      std::string::basic_string[abi:ne180100]<0>(&v199, (char *)[@"grayBias" UTF8String]);
      v87 = (char **)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v209, &v199);
      if (SHIBYTE(v199.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v199.__r_.__value_.__l.__data_);
      }
      if (&v210 != v87)
      {
        v88 = NSNumber;
        std::string::basic_string[abi:ne180100]<0>(&v199, (char *)[@"grayBias" UTF8String]);
        LODWORD(v89) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v209, &v199);
        v90 = [v88 numberWithFloat:v89];
        [v66 setObject:v90 atIndexedSubscript:5];

        if (SHIBYTE(v199.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v199.__r_.__value_.__l.__data_);
        }
      }
      std::string::basic_string[abi:ne180100]<0>(&v199, (char *)[@"scale" UTF8String]);
      v91 = (char **)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v209, &v199);
      if (SHIBYTE(v199.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v199.__r_.__value_.__l.__data_);
      }
      if (&v210 != v91)
      {
        v92 = NSNumber;
        std::string::basic_string[abi:ne180100]<0>(&v199, (char *)[@"scale" UTF8String]);
        LODWORD(v93) = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v209, &v199);
        v94 = [v92 numberWithFloat:v93];
        [v66 setObject:v94 atIndexedSubscript:6];

        if (SHIBYTE(v199.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v199.__r_.__value_.__l.__data_);
        }
      }
      v95 = [v66 objectAtIndexedSubscript:0];
      [v95 doubleValue];
      if (v96 == 1.0)
      {
        v97 = [v66 objectAtIndexedSubscript:1];
        [v97 doubleValue];
        if (v98 == 1.0)
        {
          v101 = [v66 objectAtIndexedSubscript:2];
          [v101 doubleValue];
          BOOL v99 = 1;
          if (v102 >= 0.0 && v102 <= 0.0)
          {
            v103 = [v66 objectAtIndexedSubscript:3];
            [v103 doubleValue];
            if (v104 >= 0.0 && v104 <= 0.0)
            {
              v105 = [v66 objectAtIndexedSubscript:4];
              [v105 doubleValue];
              if (v106 >= 0.0 && v106 <= 0.0)
              {
                v107 = [v66 objectAtIndexedSubscript:5];
                [v107 doubleValue];
                if (v108 >= 0.0 && v108 <= 0.0)
                {
                  v109 = [v66 objectAtIndexedSubscript:6];
                  [v109 doubleValue];
                  BOOL v99 = v110 != 1.0;
                }
              }
            }
          }
        }
        else
        {
          BOOL v99 = 1;
        }
      }
      else
      {
        BOOL v99 = 1;
      }

      v111 = (void *)[v66 copy];
      [v175 setObject:v111 forKeyedSubscript:@"placeHolderInputName"];

      if (!v99)
      {
LABEL_112:
        id v100 = v175;
        goto LABEL_113;
      }
    }
    v173 = 0;
    goto LABEL_114;
  }
  id v13 = 0;
LABEL_186:

  if (v232 < 0) {
    operator delete(v231[0]);
  }

LABEL_189:

  return v13;
}

+ (id)readerFromArchive:(void *)a3 error:(id *)a4
{
  int v6 = (*(uint64_t (**)(void, SEL))(**(void **)a3 + 56))(*(void *)a3, a2);
  v7 = off_1E59A2F20;
  if (v6 != 1) {
    v7 = &off_1E59A2F38;
  }
  v8 = [(__objc2_class *)*v7 readerFromArchiver:a3 error:a4];

  return v8;
}

@end