@interface EMDEModelWrapper
- (BOOL)prepareInputsForText:(id)a3 error:(id *)a4;
- (_LXLexicon)lexicon;
- (__CFArray)runEncoderForInput:()vector<float;
- (basic_string<char,)allowedHelperWords;
- (basic_string<char,)inputStringLowercased;
- (basic_string<char,)inputStringLowercasedForTitles;
- (id).cxx_construct;
- (id)runBeamDecodingOnStates:(__CFArray *)a3 startPosition:(int)a4 beamWidth:(int)a5 lengthPenalty:(float)a6 maxDecoderLen:(int)a7 tokenThreshold:(int)a8 allowedWords:()basic_string<char;
- (id)runBeamInferenceForDate;
- (id)runBeamInferenceForTitle;
- (vector<float,)inputTokens;
- (void)dealloc;
- (void)loadConfigFromFile:(id)a3 assetFolderPath:(id)a4 error:(id *)a5;
- (void)setAllowedHelperWords:()basic_string<char;
- (void)setInputStringLowercased:()basic_string<char;
- (void)setInputStringLowercasedForTitles:()basic_string<char;
- (void)setInputTokens:()vector<float;
- (void)setLexicon:(_LXLexicon *)a3;
@end

@implementation EMDEModelWrapper

- (void)loadConfigFromFile:(id)a3 assetFolderPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    +[EMDEUtils loadConfigFromFile:v8 assetFolderPath:v9 error:a5];
    self->_lexicon = 0;
    v11 = +[EMDEUtils config];
    v12 = [v11 objectForKeyedSubscript:@"EMDE_DISABLE_OVS_VALIDATION"];
    if (v12)
    {
      v13 = +[EMDEUtils config];
      v14 = [v13 objectForKeyedSubscript:@"EMDE_DISABLE_OVS_VALIDATION"];

      if (v14) {
        goto LABEL_17;
      }
    }
    else
    {
    }
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryAddValue(Mutable, kLXLexiconLocaleKey, @"en");
    v19 = (_LXLexicon *)LXLexiconCreate();
    self->_lexicon = v19;
    if (!v19)
    {
      CFStringRef v20 = CFErrorCopyDescription(0);
      v21 = extractionLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10008E6A8();
      }

      if (v20) {
        CFRelease(v20);
      }
    }
    CFRelease(Mutable);
  }
  else
  {
    v15 = modelLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10008E624();
    }

    if (a5)
    {
      NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
      v16 = +[NSString stringWithFormat:@"Found nil in input parameters for loadConfigFromFile"];
      v23 = v16;
      v17 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];

      *a5 = +[NSError errorWithDomain:@"com.apple.eventMetaDataExtractor.eventMetaDataExtractorPlugin" code:500 userInfo:v17];
    }
  }
LABEL_17:
}

- (BOOL)prepareInputsForText:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v145 = v6;
  if (!v6)
  {
    v13 = modelLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10008E710(v13, v14, v15, v16, v17, v18, v19, v20);
    }

    if (!a4)
    {
      BOOL v23 = 0;
      goto LABEL_206;
    }
    NSErrorUserInfoKey v194 = NSLocalizedDescriptionKey;
    v21 = +[NSString stringWithFormat:@"Found nil in input parameters for prepareInputsForText", 0];
    v195 = v21;
    NSErrorUserInfoKey v22 = +[NSDictionary dictionaryWithObjects:&v195 forKeys:&v194 count:1];

    +[NSError errorWithDomain:@"com.apple.eventMetaDataExtractor.eventMetaDataExtractorPlugin" code:500 userInfo:v22];
    BOOL v23 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_205;
  }
  v7 = +[EMDEUtils preProcessInputMessage:](EMDEUtils, "preProcessInputMessage:", v6, v6);
  id v153 = [v7 mutableCopy];

  id v8 = +[EMDEUtils config];
  id v9 = [v8 objectForKeyedSubscript:@"EMDE_TOKENISER_VERSION"];
  if (v9)
  {
    v10 = +[EMDEUtils config];
    v11 = [v10 objectForKeyedSubscript:@"EMDE_TOKENISER_VERSION"];
    unsigned int v12 = [v11 intValue];

    if (v12 != 1) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  [v153 insertString:@" " atIndex:0];
LABEL_11:
  +[EMDEUtils tokenizeInputSequence:v153];
  begin = self->_inputTokens.__begin_;
  if (begin)
  {
    self->_inputTokens.__end_ = begin;
    operator delete(begin);
    self->_inputTokens.__begin_ = 0;
    self->_inputTokens.__end_ = 0;
    self->_inputTokens.__end_cap_.__value_ = 0;
  }
  uint64_t v25 = *(void *)buf;
  self->_inputTokens.__begin_ = *(float **)buf;
  uint64_t v26 = *(void *)&buf[8];
  *(_OWORD *)&self->_inputTokens.__end_ = *(_OWORD *)&buf[8];
  if (v26 != v25)
  {
    v27 = +[EMDEUtils config];
    v28 = [v27 objectForKeyedSubscript:@"EMDE_DISABLE_OVS_VALIDATION"];
    v158 = self;
    if (v28)
    {
      v29 = +[EMDEUtils config];
      v30 = [v29 objectForKeyedSubscript:@"EMDE_DISABLE_OVS_VALIDATION"];
      BOOL v31 = v30 == 0;

      if (!v31) {
        goto LABEL_31;
      }
    }
    else
    {
    }
    v41 = +[EMDEUtils profaneRangesForText:v153 usingLexicon:self->_lexicon];
    long long v179 = 0u;
    long long v180 = 0u;
    long long v177 = 0u;
    long long v178 = 0u;
    v42 = [v41 reverseObjectEnumerator];
    id v43 = [v42 countByEnumeratingWithState:&v177 objects:v191 count:16];
    if (v43)
    {
      uint64_t v44 = *(void *)v178;
      do
      {
        for (i = 0; i != v43; i = (char *)i + 1)
        {
          if (*(void *)v178 != v44) {
            objc_enumerationMutation(v42);
          }
          id v46 = [*(id *)(*((void *)&v177 + 1) + 8 * i) rangeValue];
          objc_msgSend(v153, "replaceCharactersInRange:withString:", v46, v47, &stru_1000AF728);
        }
        id v43 = [v42 countByEnumeratingWithState:&v177 objects:v191 count:16];
      }
      while (v43);
    }

    self = v158;
LABEL_31:
    id v48 = [v153 lowercaseString];
    sub_10000A1B4(buf, (char *)[v48 UTF8String]);
    p_inputStringLowercased = &self->_inputStringLowercased;
    if (*((char *)&self->_inputStringLowercased.__r_.__value_.var0.var1 + 23) < 0) {
      operator delete(p_inputStringLowercased->__r_.__value_.var0.var1.__data_);
    }
    *(_OWORD *)p_inputStringLowercased->__r_.__value_.var0.var0.__data_ = *(_OWORD *)buf;
    *((void *)&self->_inputStringLowercased.__r_.__value_.var0.var1 + 2) = *(void *)&buf[16];
    buf[23] = 0;
    buf[0] = 0;

    __s = &self->_inputStringLowercased.__r_.var0;
    std::string::operator=((std::string *)&self->_inputStringLowercased.__r_.var0, (const std::string *)&self->_inputStringLowercased);
    v50 = +[EMDEUtils config];
    v51 = [v50 objectForKeyedSubscript:@"EMDE_DISCARD_TITLE_BEAMS_WITH_DATES"];
    BOOL v52 = v51 == 0;

    if (!v52)
    {
      v150 = objc_alloc_init(DDScannerHelper);
      v53 = +[NSLocale currentLocale];
      id v151 = [(DDScannerHelper *)v150 runDataDetectorsOnBody:v153 locale:v53];

      v54 = [v151 objectForKeyedSubscript:@"error"];
      LODWORD(v53) = v54 == 0;

      if (v53)
      {
        long long v175 = 0u;
        long long v176 = 0u;
        long long v173 = 0u;
        long long v174 = 0u;
        v55 = [v151 objectForKeyedSubscript:@"extractions"];
        id obj = [v55 reverseObjectEnumerator];

        id v56 = [obj countByEnumeratingWithState:&v173 objects:v190 count:16];
        if (v56)
        {
          uint64_t v57 = *(void *)v174;
          do
          {
            for (j = 0; j != v56; j = (char *)j + 1)
            {
              if (*(void *)v174 != v57) {
                objc_enumerationMutation(obj);
              }
              v59 = *(void **)(*((void *)&v173 + 1) + 8 * (void)j);
              v60 = [v59 objectForKeyedSubscript:@"type"];
              if ([v60 isEqualToString:@"NSTextCheckingTypeDate"])
              {
                v61 = [v59 objectForKeyedSubscript:@"containsContextualWords"];
                unsigned __int8 v62 = [v61 BOOLValue];

                if ((v62 & 1) == 0)
                {
                  v63 = modelLogHandle();
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
                  {
                    v64 = [v59 objectForKeyedSubscript:@"text"];
                    *(_DWORD *)buf = 138477827;
                    *(void *)&buf[4] = v64;
                    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "EMDEModelWrapper - Removing date for title validation: %{private}@", buf, 0xCu);
                  }
                  v65 = [v59 objectForKeyedSubscript:@"range"];
                  v66 = [v65 objectForKeyedSubscript:@"start"];
                  signed int v67 = [v66 intValue];

                  v68 = [v59 objectForKeyedSubscript:@"range"];
                  v69 = [v68 objectForKeyedSubscript:@"end"];
                  LODWORD(v65) = [v69 intValue];

                  objc_msgSend(v153, "replaceCharactersInRange:withString:", v67, (int)v65 - v67, &stru_1000AF728);
                }
              }
              else
              {
              }
            }
            id v56 = [obj countByEnumeratingWithState:&v173 objects:v190 count:16];
          }
          while (v56);
        }
      }
      id v70 = [v153 lowercaseString];
      sub_10000A1B4(buf, (char *)[v70 UTF8String]);
      if (self->_inputStringLowercasedForTitles.__r_.__value_.var0.var0.__data_[7] < 0) {
        operator delete(*(void **)__s);
      }
      *(_OWORD *)__s = *(_OWORD *)buf;
      self->_inputStringLowercasedForTitles.__r_.__value_.var0.var1.__data_ = *(char **)&buf[16];
      buf[23] = 0;
      buf[0] = 0;
    }
    memset(&__str, 0, sizeof(__str));
    v169 = 0;
    std::string::size_type v170 = 0;
    uint64_t v171 = 0;
    v71 = +[EMDEUtils config];
    id v72 = [v71 objectForKeyedSubscript:@"EMDE_ALLOWED_KEYWORDS_SINGLE_EVENT"];
    sub_10000A1B4(&__p, (char *)[v72 UTF8String]);
    sub_10000FA68((void (__cdecl ***)(std::istringstream *__hidden))buf, &__p, 8);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }

    while (1)
    {
      v73 = sub_10000FBEC((uint64_t *)buf, (uint64_t)&v169);
      if ((*((unsigned char *)v73 + *(void *)(*v73 - 24) + 32) & 5) != 0) {
        break;
      }
      sub_10000A1B4(&__dst, "");
      memset(&__p, 0, sizeof(__p));
      v183[0] = &__p;
      LOBYTE(v183[1]) = 0;
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x18uLL);
      __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
      __p.__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[0] + 24;
      __p.__r_.__value_.__l.__size_ = (std::string::size_type)sub_10000D248((uint64_t)&__p.__r_.__value_.__r.__words[2], (long long *)&__dst, (long long *)&v186, __p.__r_.__value_.__l.__data_);
      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__dst.__r_.__value_.__l.__data_);
      }
      v74 = +[EMDEUtils config];
      v75 = [v74 objectForKeyedSubscript:@"EMDE_VALIDATE_ONLY_ALLOWED_PREFIX"];
      BOOL v76 = v75 == 0;

      if (!v76)
      {
        +[EMDEUtils allowedPrefixes];
        sub_10000D5A4((uint64_t *)&__p);
        std::string __p = __dst;
        memset(&__dst, 0, sizeof(__dst));
        v183[0] = &__dst;
        sub_10000D388((void ***)v183);
      }
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
      for (std::string::size_type k = __p.__r_.__value_.__r.__words[0]; k != size; k += 24)
      {
        if (*(char *)(k + 23) < 0)
        {
          sub_1000302DC(&__dst, *(void **)k, *(void *)(k + 8));
        }
        else
        {
          long long v79 = *(_OWORD *)k;
          __dst.__r_.__value_.__r.__words[2] = *(void *)(k + 16);
          *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v79;
        }
        sub_10000CC60((const void **)&__dst.__r_.__value_.__l.__data_, (const void **)&v169, (uint64_t)v183);
        if (v158->_inputStringLowercasedForTitles.__r_.__value_.var0.var0.__data_[7] < 0)
        {
          v81 = *(int **)&v158->_inputStringLowercased.__r_.var0;
          int64_t var0 = v158->_inputStringLowercased.var0;
        }
        else
        {
          int64_t var0 = v158->_inputStringLowercasedForTitles.__r_.__value_.var0.var0.__data_[7];
          v81 = __s;
        }
        int v82 = SHIBYTE(v184);
        v83 = v183[0];
        if (v184 >= 0) {
          v84 = v183;
        }
        else {
          v84 = (void **)v183[0];
        }
        if (v184 >= 0) {
          int64_t v85 = HIBYTE(v184);
        }
        else {
          int64_t v85 = (int64_t)v183[1];
        }
        if (!v85)
        {
          uint64_t v88 = 0;
          if ((SHIBYTE(v184) & 0x80000000) == 0) {
            goto LABEL_90;
          }
LABEL_89:
          operator delete(v83);
          goto LABEL_90;
        }
        v86 = (char *)v81 + var0;
        if (var0 >= v85)
        {
          int v89 = *(char *)v84;
          v90 = v81;
          do
          {
            int64_t v91 = var0 - v85;
            if (v91 == -1) {
              break;
            }
            v92 = (char *)memchr(v90, v89, v91 + 1);
            if (!v92) {
              break;
            }
            v87 = v92;
            if (!memcmp(v92, v84, v85)) {
              goto LABEL_85;
            }
            v90 = (int *)(v87 + 1);
            int64_t var0 = v86 - (v87 + 1);
          }
          while (var0 >= v85);
          v87 = v86;
        }
        else
        {
          v87 = (char *)v81 + var0;
        }
LABEL_85:
        if (v87 == v86) {
          uint64_t v88 = -1;
        }
        else {
          uint64_t v88 = v87 - (char *)v81;
        }
        if (v82 < 0) {
          goto LABEL_89;
        }
LABEL_90:
        if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__dst.__r_.__value_.__l.__data_);
        }
        if (v88 != -1) {
          goto LABEL_115;
        }
      }
      if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v93 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v93 = __str.__r_.__value_.__l.__size_;
      }
      sub_10000DC74((uint64_t)&__dst, v93 + 1);
      if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_dst = &__dst;
      }
      else {
        p_dst = (std::string *)__dst.__r_.__value_.__r.__words[0];
      }
      if (v93)
      {
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_str = &__str;
        }
        else {
          p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
        }
        memmove(p_dst, p_str, v93);
      }
      *(_WORD *)((char *)&p_dst->__r_.__value_.__l.__data_ + v93) = 32;
      if (v171 >= 0) {
        v96 = (const std::string::value_type *)&v169;
      }
      else {
        v96 = (const std::string::value_type *)v169;
      }
      if (v171 >= 0) {
        std::string::size_type v97 = HIBYTE(v171);
      }
      else {
        std::string::size_type v97 = v170;
      }
      v98 = std::string::append(&__dst, v96, v97);
      std::string::size_type v99 = v98->__r_.__value_.__r.__words[0];
      v183[0] = (void *)v98->__r_.__value_.__l.__size_;
      *(void **)((char *)v183 + 7) = *(void **)((char *)&v98->__r_.__value_.__r.__words[1] + 7);
      char v100 = HIBYTE(v98->__r_.__value_.__r.__words[2]);
      v98->__r_.__value_.__l.__size_ = 0;
      v98->__r_.__value_.__r.__words[2] = 0;
      v98->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      __str.__r_.__value_.__r.__words[0] = v99;
      __str.__r_.__value_.__l.__size_ = (std::string::size_type)v183[0];
      *(std::string::size_type *)((char *)&__str.__r_.__value_.__r.__words[1] + 7) = *(std::string::size_type *)((char *)v183 + 7);
      *((unsigned char *)&__str.__r_.__value_.__s + 23) = v100;
      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__dst.__r_.__value_.__l.__data_);
      }
LABEL_115:
      __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
      sub_10000D388((void ***)&__dst);
      self = v158;
    }
    p_std::string::size_type size = (std::string *)&self->_inputStringLowercasedForTitles.__r_.__value_.var0.var1.__size_;
    std::string::operator=((std::string *)&self->_inputStringLowercasedForTitles.__r_.__value_.var0.var1.__size_, &__str);
    v101 = +[EMDEUtils config];
    v102 = [v101 objectForKeyedSubscript:@"EMDE_ALLOWED_KEYWORDS_DUAL_EVENT"];
    BOOL v103 = v102 == 0;

    if (!v103)
    {
      sub_10000A1B4(&__dst, " ");
      v104 = +[EMDEUtils config];
      id v105 = [v104 objectForKeyedSubscript:@"EMDE_ALLOWED_KEYWORDS_DUAL_EVENT"];
      v106 = std::string::append(&__dst, (const std::string::value_type *)[v105 UTF8String]);
      long long v107 = *(_OWORD *)&v106->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__r.__words[2] = v106->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v107;
      v106->__r_.__value_.__l.__size_ = 0;
      v106->__r_.__value_.__r.__words[2] = 0;
      v106->__r_.__value_.__r.__words[0] = 0;

      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__dst.__r_.__value_.__l.__data_);
      }
      sub_10000CC60((const void **)&__p.__r_.__value_.__l.__data_, (const void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&__dst);
      if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v108 = &__dst;
      }
      else {
        v108 = (std::string *)__dst.__r_.__value_.__r.__words[0];
      }
      if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v109 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v109 = __dst.__r_.__value_.__l.__size_;
      }
      std::string::append(p_size, (const std::string::value_type *)v108, v109);
      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__dst.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    v110 = +[EMDEUtils config];
    v111 = [v110 objectForKeyedSubscript:@"EMDE_ALLOWED_KEYWORDS_CONDITIONAL"];

    if (v111)
    {
      long long v166 = 0u;
      long long v167 = 0u;
      long long v164 = 0u;
      long long v165 = 0u;
      id v152 = v111;
      id v112 = [v152 countByEnumeratingWithState:&v164 objects:v182 count:16];
      if (!v112) {
        goto LABEL_197;
      }
      uint64_t v148 = *(void *)v165;
      v147 = v111;
      while (1)
      {
        uint64_t v113 = 0;
        id v149 = v112;
        do
        {
          if (*(void *)v165 != v148) {
            objc_enumerationMutation(v152);
          }
          v114 = *(void **)(*((void *)&v164 + 1) + 8 * v113);
          sub_10000A1B4(&__dst, "");
          memset(&__p, 0, sizeof(__p));
          v183[0] = &__p;
          LOBYTE(v183[1]) = 0;
          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x18uLL);
          __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
          __p.__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[0] + 24;
          __p.__r_.__value_.__l.__size_ = (std::string::size_type)sub_10000D248((uint64_t)&__p.__r_.__value_.__r.__words[2], (long long *)&__dst, (long long *)&v186, __p.__r_.__value_.__l.__data_);
          if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__dst.__r_.__value_.__l.__data_);
          }
          v115 = +[EMDEUtils config];
          v116 = [v115 objectForKeyedSubscript:@"EMDE_VALIDATE_ONLY_ALLOWED_PREFIX"];
          uint64_t v154 = v113;
          BOOL v117 = v116 == 0;

          if (!v117)
          {
            +[EMDEUtils allowedPrefixes];
            sub_10000D5A4((uint64_t *)&__p);
            std::string __p = __dst;
            memset(&__dst, 0, sizeof(__dst));
            v183[0] = &__dst;
            sub_10000D388((void ***)v183);
          }
          id v118 = v114;
          sub_10000A1B4(&__dst, (char *)[v118 UTF8String]);
          id obja = v118;
          std::string::size_type v120 = __p.__r_.__value_.__l.__size_;
          for (std::string::size_type m = __p.__r_.__value_.__r.__words[0]; m != v120; m += 24)
          {
            if (*(char *)(m + 23) < 0)
            {
              sub_1000302DC(v183, *(void **)m, *(void *)(m + 8));
            }
            else
            {
              long long v121 = *(_OWORD *)m;
              int64_t v184 = *(void *)(m + 16);
              *(_OWORD *)v183 = v121;
            }
            sub_10000CC60((const void **)v183, (const void **)&__dst.__r_.__value_.__l.__data_, (uint64_t)&v163);
            if (v158->_inputStringLowercasedForTitles.__r_.__value_.var0.var0.__data_[7] < 0)
            {
              v123 = *(int **)&v158->_inputStringLowercased.__r_.var0;
              int64_t v122 = v158->_inputStringLowercased.var0;
            }
            else
            {
              int64_t v122 = v158->_inputStringLowercasedForTitles.__r_.__value_.var0.var0.__data_[7];
              v123 = __s;
            }
            int v124 = SHIBYTE(v163.__r_.__value_.__r.__words[2]);
            long long v125 = *(_OWORD *)&v163.__r_.__value_.__l.__data_;
            if ((v163.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              v126 = &v163;
            }
            else {
              v126 = (std::string *)v163.__r_.__value_.__r.__words[0];
            }
            if ((v163.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              int64_t v127 = HIBYTE(v163.__r_.__value_.__r.__words[2]);
            }
            else {
              int64_t v127 = v163.__r_.__value_.__l.__size_;
            }
            if (!v127)
            {
              uint64_t v130 = 0;
              if ((SHIBYTE(v163.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
                goto LABEL_169;
              }
LABEL_168:
              operator delete((void *)v125);
              goto LABEL_169;
            }
            v128 = (char *)v123 + v122;
            if (v122 >= v127)
            {
              int v131 = v126->__r_.__value_.__s.__data_[0];
              v132 = v123;
              do
              {
                int64_t v133 = v122 - v127;
                if (v133 == -1) {
                  break;
                }
                v134 = (char *)memchr(v132, v131, v133 + 1);
                if (!v134) {
                  break;
                }
                v129 = v134;
                if (!memcmp(v134, v126, v127)) {
                  goto LABEL_164;
                }
                v132 = (int *)(v129 + 1);
                int64_t v122 = v128 - (v129 + 1);
              }
              while (v122 >= v127);
              v129 = v128;
            }
            else
            {
              v129 = (char *)v123 + v122;
            }
LABEL_164:
            if (v129 == v128) {
              uint64_t v130 = -1;
            }
            else {
              uint64_t v130 = v129 - (char *)v123;
            }
            if (v124 < 0) {
              goto LABEL_168;
            }
LABEL_169:
            if (SHIBYTE(v184) < 0) {
              operator delete(v183[0]);
            }
            if (v130 != -1) {
              goto LABEL_193;
            }
          }
          v135 = [v152 objectForKeyedSubscript:obja];
          long long v161 = 0u;
          long long v162 = 0u;
          long long v159 = 0u;
          long long v160 = 0u;
          id v136 = v135;
          id v137 = [v136 countByEnumeratingWithState:&v159 objects:v181 count:16];
          if (v137)
          {
            uint64_t v138 = *(void *)v160;
            while (2)
            {
              for (n = 0; n != v137; n = (char *)n + 1)
              {
                if (*(void *)v160 != v138) {
                  objc_enumerationMutation(v136);
                }
                if ([v153 rangeOfString:*(void *)(*((void *)&v159 + 1) + 8 * (void)n) options:1] != (id)0x7FFFFFFFFFFFFFFFLL)
                {
                  sub_10000A1B4(&v163, (char *)[obja UTF8String]);
                  v140 = std::string::insert(&v163, 0, " ");
                  long long v141 = *(_OWORD *)&v140->__r_.__value_.__l.__data_;
                  int64_t v184 = v140->__r_.__value_.__r.__words[2];
                  *(_OWORD *)v183 = v141;
                  v140->__r_.__value_.__l.__size_ = 0;
                  v140->__r_.__value_.__r.__words[2] = 0;
                  v140->__r_.__value_.__r.__words[0] = 0;
                  if (v184 >= 0) {
                    v142 = v183;
                  }
                  else {
                    v142 = (void **)v183[0];
                  }
                  if (v184 >= 0) {
                    std::string::size_type v143 = HIBYTE(v184);
                  }
                  else {
                    std::string::size_type v143 = (std::string::size_type)v183[1];
                  }
                  std::string::append(p_size, (const std::string::value_type *)v142, v143);
                  if (SHIBYTE(v184) < 0) {
                    operator delete(v183[0]);
                  }
                  if (SHIBYTE(v163.__r_.__value_.__r.__words[2]) < 0) {
                    operator delete(v163.__r_.__value_.__l.__data_);
                  }
                  goto LABEL_192;
                }
              }
              id v137 = [v136 countByEnumeratingWithState:&v159 objects:v181 count:16];
              if (v137) {
                continue;
              }
              break;
            }
          }
LABEL_192:

LABEL_193:
          if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__dst.__r_.__value_.__l.__data_);
          }
          __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
          sub_10000D388((void ***)&__dst);
          uint64_t v113 = v154 + 1;
          v111 = v147;
        }
        while ((id)(v154 + 1) != v149);
        id v112 = [v152 countByEnumeratingWithState:&v164 objects:v182 count:16];
        if (!v112)
        {
LABEL_197:

          break;
        }
      }
    }

    if (v189 < 0) {
      operator delete(v188);
    }
    std::streambuf::~streambuf();
    std::istream::~istream();
    std::ios::~ios();
    NSErrorUserInfoKey v22 = v153;
    if (SHIBYTE(v171) < 0) {
      operator delete(v169);
    }
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__str.__r_.__value_.__l.__data_);
    }
    BOOL v23 = 1;
    goto LABEL_205;
  }
  v32 = modelLogHandle();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    sub_10008E748(v32, v33, v34, v35, v36, v37, v38, v39);
  }

  if (a4)
  {
    NSErrorUserInfoKey v192 = NSLocalizedDescriptionKey;
    CFStringRef v193 = @"Tokenisation failed.";
    v40 = +[NSDictionary dictionaryWithObjects:&v193 forKeys:&v192 count:1];
    *a4 = +[NSError errorWithDomain:@"com.apple.eventMetaDataExtractor.eventMetaDataExtractorPlugin" code:500 userInfo:v40];
  }
  BOOL v23 = 0;
  NSErrorUserInfoKey v22 = v153;
LABEL_205:

LABEL_206:
  return v23;
}

- (id)runBeamInferenceForDate
{
  v3 = modelLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "EMDEModelWrapper - Beginning to run inference for date generation", buf, 2u);
  }

  *(void *)buf = 0;
  v65 = 0;
  uint64_t v66 = 0;
  sub_1000119FC(buf, self->_inputTokens.__begin_, (uint64_t)self->_inputTokens.__end_, self->_inputTokens.__end_ - self->_inputTokens.__begin_);
  v4 = +[EMDEUtils config];
  v5 = [v4 objectForKeyedSubscript:@"EMDE_DATE_TRIGGER_TOKEN_ID"];
  BOOL v6 = v5 == 0;

  if (!v6)
  {
    v7 = +[EMDEUtils config];
    id v8 = [v7 objectForKeyedSubscript:@"EMDE_TOKENISER_VERSION"];
    if (v8)
    {
      id v9 = +[EMDEUtils config];
      v10 = [v9 objectForKeyedSubscript:@"EMDE_TOKENISER_VERSION"];
      BOOL v11 = (int)[v10 intValue] > 1;

      if (v11)
      {
        unsigned int v12 = *(const void **)buf;
        v13 = +[EMDEUtils config];
        uint64_t v14 = [v13 objectForKeyedSubscript:@"EMDE_DATE_TRIGGER_TOKEN_ID"];
        [v14 floatValue];
        LODWORD(__src.__r_.__value_.__l.__data_) = v15;
        sub_100011D38((uint64_t)buf, (uint64_t)v12 + 4, (char *)&__src, &__src.__r_.__value_.__s.__data_[4], 1);

        goto LABEL_9;
      }
    }
    else
    {
    }
    uint64_t v16 = *(const void **)buf;
    uint64_t v17 = +[EMDEUtils config];
    uint64_t v18 = [v17 objectForKeyedSubscript:@"EMDE_DATE_TRIGGER_TOKEN_ID"];
    [v18 floatValue];
    LODWORD(__src.__r_.__value_.__l.__data_) = v19;
    uint64_t v20 = +[EMDEUtils config];
    v21 = [v20 objectForKeyedSubscript:@"EMDE_COLON_TOKEN_ID"];
    [v21 floatValue];
    HIDWORD(__src.__r_.__value_.__r.__words[0]) = v22;
    sub_100011D38((uint64_t)buf, (uint64_t)v16 + 4, (char *)&__src, &__src.__r_.__value_.__s.__data_[8], 2);
  }
LABEL_9:
  BOOL v23 = +[EMDEUtils config];
  v24 = [v23 objectForKeyedSubscript:@"EMDE_MAX_INPUT_LEN"];
  unsigned int v25 = [v24 intValue];
  uint64_t v26 = +[EMDEUtils config];
  v27 = [v26 objectForKeyedSubscript:@"EMDE_DATE_DECODER_LEN"];
  unsigned int v28 = [v27 intValue];

  uint64_t v29 = (uint64_t)v65;
  unint64_t v30 = (uint64_t)&v65[-*(void *)buf] >> 2;
  if (v30 > (int)(v25 - v28) && (unsigned char *)(*(void *)buf + 4 * (int)(v25 - v28)) != v65)
  {
    v65 = (unsigned char *)(*(void *)buf + 4 * (int)(v25 - v28));
    unint64_t v30 = (4 * (int)(v25 - v28)) >> 2;
    uint64_t v29 = (uint64_t)v65;
  }
  std::string __p = 0;
  unsigned __int8 v62 = 0;
  uint64_t v63 = 0;
  sub_1000119FC(&__p, *(const void **)buf, v29, v30);
  BOOL v31 = [(EMDEModelWrapper *)self runEncoderForInput:&__p];
  if (__p)
  {
    unsigned __int8 v62 = __p;
    operator delete(__p);
  }
  if (v31)
  {
    uint64_t v33 = *(unsigned char **)buf;
    v32 = v65;
    v58 = +[EMDEUtils config];
    uint64_t v57 = [v58 objectForKeyedSubscript:@"EMDE_BEAM_WIDTH"];
    id v34 = [v57 intValue];
    v55 = +[EMDEUtils config];
    id v56 = [v55 objectForKeyedSubscript:@"EMDE_DATE_LENGTH_PENALTY"];
    [v56 floatValue];
    int v36 = v35;
    v53 = +[EMDEUtils config];
    [v53 objectForKeyedSubscript:@"EMDE_DATE_DECODER_LEN"];
    v54 = id v37 = v34;
    id v38 = [v54 intValue];
    uint64_t v39 = +[EMDEUtils config];
    v40 = [v39 objectForKeyedSubscript:@"EMDE_DEFAULT_TOKEN_THRESHOLD"];
    [v40 floatValue];
    float v42 = v41;
    if (*((char *)&self->_inputStringLowercasedForTitles.__r_.var1 + 3) >= 0) {
      size_t v43 = *((unsigned __int8 *)&self->_inputStringLowercasedForTitles.__r_.var1 + 3);
    }
    else {
      size_t v43 = *((void *)&self->_inputStringLowercasedForTitles.__r_.__value_.var0.var1 + 2);
    }
    p_src = &__src;
    sub_10000DC74((uint64_t)&__src, v43 + 1);
    if ((__src.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      p_src = (std::string *)__src.__r_.__value_.__r.__words[0];
    }
    if (v43)
    {
      if (*((char *)&self->_inputStringLowercasedForTitles.__r_.var1 + 3) >= 0) {
        p_std::string::size_type size = &self->_inputStringLowercasedForTitles.__r_.__value_.var0.var1.__size_;
      }
      else {
        p_std::string::size_type size = (const void *)self->_inputStringLowercasedForTitles.__r_.__value_.var0.var1.__size_;
      }
      memmove(p_src, p_size, v43);
    }
    *(_WORD *)((char *)&p_src->__r_.__value_.__l.__data_ + v43) = 32;
    int v46 = *((char *)&self->_inputStringLowercased.__r_.__value_.var0.var1 + 23);
    if (v46 >= 0) {
      p_inputStringLowercased = &self->_inputStringLowercased;
    }
    else {
      p_inputStringLowercased = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)self->_inputStringLowercased.__r_.__value_.var0.var1.__data_;
    }
    if (v46 >= 0) {
      std::string::size_type size = *((unsigned __int8 *)&self->_inputStringLowercased.__r_.__value_.var0.var1 + 23);
    }
    else {
      std::string::size_type size = self->_inputStringLowercased.__r_.__value_.var0.var1.__size_;
    }
    v49 = std::string::append(&__src, p_inputStringLowercased->__r_.__value_.var0.var0.__data_, size);
    long long v50 = *(_OWORD *)&v49->__r_.__value_.__l.__data_;
    std::string::size_type v60 = v49->__r_.__value_.__r.__words[2];
    *(_OWORD *)v59 = v50;
    v49->__r_.__value_.__l.__size_ = 0;
    v49->__r_.__value_.__r.__words[2] = 0;
    v49->__r_.__value_.__r.__words[0] = 0;
    LODWORD(v50) = v36;
    v51 = [(EMDEModelWrapper *)self runBeamDecodingOnStates:v31 startPosition:(unint64_t)(v32 - v33) >> 2 beamWidth:v37 lengthPenalty:v38 maxDecoderLen:(int)v42 tokenThreshold:v59 allowedWords:*(double *)&v50];
    if (SHIBYTE(v60) < 0) {
      operator delete(v59[0]);
    }
    if (SHIBYTE(__src.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__src.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    v51 = 0;
  }
  if (*(void *)buf)
  {
    v65 = *(unsigned char **)buf;
    operator delete(*(void **)buf);
  }
  return v51;
}

- (id)runBeamInferenceForTitle
{
  v3 = modelLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "EMDEModelWrapper - Beginning to run inference for title generation", buf, 2u);
  }

  *(void *)buf = 0;
  v73 = 0;
  uint64_t v74 = 0;
  sub_1000119FC(buf, self->_inputTokens.__begin_, (uint64_t)self->_inputTokens.__end_, self->_inputTokens.__end_ - self->_inputTokens.__begin_);
  v4 = +[EMDEUtils config];
  v5 = [v4 objectForKeyedSubscript:@"EMDE_TITLE_TRIGGER_TOKEN_ID"];
  BOOL v6 = v5 == 0;

  if (!v6)
  {
    v7 = +[EMDEUtils config];
    id v8 = [v7 objectForKeyedSubscript:@"EMDE_TOKENISER_VERSION"];
    if (v8)
    {
      id v9 = +[EMDEUtils config];
      v10 = [v9 objectForKeyedSubscript:@"EMDE_TOKENISER_VERSION"];
      BOOL v11 = (int)[v10 intValue] > 1;

      if (v11)
      {
        unsigned int v12 = *(const void **)buf;
        v13 = +[EMDEUtils config];
        uint64_t v14 = [v13 objectForKeyedSubscript:@"EMDE_TITLE_TRIGGER_TOKEN_ID"];
        [v14 floatValue];
        LODWORD(__src.__r_.__value_.__l.__data_) = v15;
        sub_100011D38((uint64_t)buf, (uint64_t)v12 + 4, (char *)&__src, &__src.__r_.__value_.__s.__data_[4], 1);

        goto LABEL_9;
      }
    }
    else
    {
    }
    uint64_t v16 = *(const void **)buf;
    uint64_t v17 = +[EMDEUtils config];
    uint64_t v18 = [v17 objectForKeyedSubscript:@"EMDE_TITLE_TRIGGER_TOKEN_ID"];
    [v18 floatValue];
    LODWORD(__src.__r_.__value_.__l.__data_) = v19;
    uint64_t v20 = +[EMDEUtils config];
    v21 = [v20 objectForKeyedSubscript:@"EMDE_COLON_TOKEN_ID"];
    [v21 floatValue];
    HIDWORD(__src.__r_.__value_.__r.__words[0]) = v22;
    sub_100011D38((uint64_t)buf, (uint64_t)v16 + 4, (char *)&__src, &__src.__r_.__value_.__s.__data_[8], 2);
  }
LABEL_9:
  BOOL v23 = +[EMDEUtils config];
  v24 = [v23 objectForKeyedSubscript:@"EMDE_MAX_INPUT_LEN"];
  unsigned int v25 = [v24 intValue];
  uint64_t v26 = +[EMDEUtils config];
  v27 = [v26 objectForKeyedSubscript:@"EMDE_TITLE_DECODER_LEN"];
  unsigned int v28 = [v27 intValue];

  uint64_t v29 = (uint64_t)v73;
  unint64_t v30 = (uint64_t)&v73[-*(void *)buf] >> 2;
  if (v30 > (int)(v25 - v28) && (unsigned char *)(*(void *)buf + 4 * (int)(v25 - v28)) != v73)
  {
    v73 = (unsigned char *)(*(void *)buf + 4 * (int)(v25 - v28));
    unint64_t v30 = (4 * (int)(v25 - v28)) >> 2;
    uint64_t v29 = (uint64_t)v73;
  }
  std::string __p = 0;
  id v70 = 0;
  uint64_t v71 = 0;
  sub_1000119FC(&__p, *(const void **)buf, v29, v30);
  BOOL v31 = [(EMDEModelWrapper *)self runEncoderForInput:&__p];
  if (__p)
  {
    id v70 = __p;
    operator delete(__p);
  }
  if (v31)
  {
    uint64_t v33 = *(unsigned char **)buf;
    v32 = v73;
    uint64_t v66 = +[EMDEUtils config];
    v65 = [v66 objectForKeyedSubscript:@"EMDE_BEAM_WIDTH"];
    id v34 = [v65 intValue];
    uint64_t v63 = +[EMDEUtils config];
    v64 = [v63 objectForKeyedSubscript:@"EMDE_TITLE_LENGTH_PENALTY"];
    [v64 floatValue];
    int v36 = v35;
    v61 = +[EMDEUtils config];
    [v61 objectForKeyedSubscript:@"EMDE_TITLE_DECODER_LEN"];
    v62 = id v37 = v34;
    id v38 = [v62 intValue];
    uint64_t v39 = +[EMDEUtils config];
    v40 = [v39 objectForKeyedSubscript:@"EMDE_DEFAULT_TOKEN_THRESHOLD"];
    [v40 floatValue];
    float v42 = v41;
    if (*((char *)&self->_inputStringLowercasedForTitles.__r_.var1 + 3) >= 0) {
      size_t v43 = *((unsigned __int8 *)&self->_inputStringLowercasedForTitles.__r_.var1 + 3);
    }
    else {
      size_t v43 = *((void *)&self->_inputStringLowercasedForTitles.__r_.__value_.var0.var1 + 2);
    }
    p_src = &__src;
    sub_10000DC74((uint64_t)&__src, v43 + 1);
    if ((__src.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      p_src = (std::string *)__src.__r_.__value_.__r.__words[0];
    }
    if (v43)
    {
      if (*((char *)&self->_inputStringLowercasedForTitles.__r_.var1 + 3) >= 0) {
        p_std::string::size_type size = &self->_inputStringLowercasedForTitles.__r_.__value_.var0.var1.__size_;
      }
      else {
        p_std::string::size_type size = (const void *)self->_inputStringLowercasedForTitles.__r_.__value_.var0.var1.__size_;
      }
      memmove(p_src, p_size, v43);
    }
    *(_WORD *)((char *)&p_src->__r_.__value_.__l.__data_ + v43) = 32;
    int v46 = self->_inputStringLowercasedForTitles.__r_.__value_.var0.var0.__data_[7];
    if (v46 >= 0) {
      p_std::string::size_type var0 = &self->_inputStringLowercased.__r_.var0;
    }
    else {
      p_std::string::size_type var0 = *(int **)&self->_inputStringLowercased.__r_.var0;
    }
    if (v46 >= 0) {
      std::string::size_type var0 = self->_inputStringLowercasedForTitles.__r_.__value_.var0.var0.__data_[7];
    }
    else {
      std::string::size_type var0 = self->_inputStringLowercased.var0;
    }
    v49 = std::string::append(&__src, (const std::string::value_type *)p_var0, var0);
    long long v50 = *(_OWORD *)&v49->__r_.__value_.__l.__data_;
    std::string::size_type v68 = v49->__r_.__value_.__r.__words[2];
    *(_OWORD *)signed int v67 = v50;
    v49->__r_.__value_.__l.__size_ = 0;
    v49->__r_.__value_.__r.__words[2] = 0;
    v49->__r_.__value_.__r.__words[0] = 0;
    LODWORD(v50) = v36;
    BOOL v31 = [(EMDEModelWrapper *)self runBeamDecodingOnStates:v31 startPosition:(unint64_t)(v32 - v33) >> 2 beamWidth:v37 lengthPenalty:v38 maxDecoderLen:(int)v42 tokenThreshold:v67 allowedWords:*(double *)&v50];
    if (SHIBYTE(v68) < 0) {
      operator delete(v67[0]);
    }
    if (SHIBYTE(__src.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__src.__r_.__value_.__l.__data_);
    }

    v51 = +[EMDEUtils config];
    BOOL v52 = [v51 objectForKeyedSubscript:@"EMDE_DISABLE_OVS_VALIDATION"];
    if (v52)
    {
      v53 = +[EMDEUtils config];
      v54 = [v53 objectForKeyedSubscript:@"EMDE_DISABLE_OVS_VALIDATION"];
      BOOL v55 = v54 == 0;
    }
    else
    {
      BOOL v55 = 1;
    }

    if (v31) {
      BOOL v56 = v55;
    }
    else {
      BOOL v56 = 0;
    }
    if (v56)
    {
      uint64_t v57 = [(__CFArray *)v31 objectForKey:@"prediction"];
      v58 = +[EMDEUtils profaneRangesForText:v57 usingLexicon:self->_lexicon];
      if ([v58 count])
      {
        v59 = extractionLogHandle();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          LOWORD(__src.__r_.__value_.__l.__data_) = 0;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "EMDEEventExtractor - Title predicted contains OVS language. Ignoring prediction.", (uint8_t *)&__src, 2u);
        }

        BOOL v31 = 0;
      }
    }
  }
  if (*(void *)buf)
  {
    v73 = *(unsigned char **)buf;
    operator delete(*(void **)buf);
  }
  return v31;
}

- (__CFArray)runEncoderForInput:()vector<float
{
  id v32 = 0;
  +[EMDEUtils loadExtractionModelWithError:&v32];
  id v4 = v32;
  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = cf == 0;
  }
  if (v5)
  {
    BOOL v6 = modelLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10008E780();
    }

    v7 = 0;
  }
  else
  {
    int64_t v8 = (char *)a3->__end_ - (char *)a3->__begin_;
    LODWORD(__p) = 0;
    sub_100012010(&v30, (int)(v8 >> 2), &__p);
    id v9 = (float *)v30;
    v10 = v31;
    if (v30 != v31)
    {
      int v11 = 0;
      do
      {
        float v12 = (float)v11++;
        *v9++ = v12;
      }
      while (v9 != v10);
    }
    int v27 = 0;
    sub_100012010(&__p, (int)(v8 >> 2), &v27);
    v13 = operator new(4uLL);
    _DWORD *v13 = 1065353216;
    uint64_t v14 = kMRLNeuralNetworkTensorInfoInputDimensionKey;
    v36[0] = kMRLNeuralNetworkTensorInfoInputDimensionKey;
    int v15 = +[NSNumber numberWithInt:1];
    v37[0] = v15;
    uint64_t v16 = kMRLNeuralNetworkTensorInfoSequenceLengthKey;
    v36[1] = kMRLNeuralNetworkTensorInfoSequenceLengthKey;
    uint64_t v17 = +[NSNumber numberWithInt:(unint64_t)v8 >> 2];
    v37[1] = v17;
    uint64_t v18 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];

    v34[0] = v14;
    int v19 = +[NSNumber numberWithInt:1];
    v34[1] = v16;
    v35[0] = v19;
    uint64_t v20 = +[NSNumber numberWithInt:1];
    v35[1] = v20;
    v21 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];

    int v22 = (const void *)MRLNeuralNetworkTensorCreate();
    BOOL v23 = (const void *)MRLNeuralNetworkTensorCreate();
    v24 = (const void *)MRLNeuralNetworkTensorCreate();
    unsigned int v25 = (const void *)MRLNeuralNetworkTensorCreate();
    MRLNeuralNetworkTensorAppendData();
    MRLNeuralNetworkTensorAppendData();
    MRLNeuralNetworkTensorAppendData();
    MRLNeuralNetworkTensorAppendData();
    MRLNeuralNetworkSetInputTensor();
    MRLNeuralNetworkSetInputTensor();
    MRLNeuralNetworkSetInputTensor();
    MRLNeuralNetworkSetInputTensor();
    MRLNeuralNetworkPredict();
    v7 = (__CFArray *)MRLNeuralNetworkCopyStates();
    MRLNeuralNetworkClear();
    CFRelease(v22);
    CFRelease(v23);
    CFRelease(v24);
    CFRelease(v25);
    a3->__end_ = a3->__begin_;
    BOOL v31 = (float *)v30;
    uint64_t v29 = __p;

    operator delete(v13);
    if (__p)
    {
      uint64_t v29 = __p;
      operator delete(__p);
    }
    if (v30)
    {
      BOOL v31 = (float *)v30;
      operator delete(v30);
    }
  }
  if (cf) {
    CFRelease(cf);
  }

  return v7;
}

- (id)runBeamDecodingOnStates:(__CFArray *)a3 startPosition:(int)a4 beamWidth:(int)a5 lengthPenalty:(float)a6 maxDecoderLen:(int)a7 tokenThreshold:(int)a8 allowedWords:()basic_string<char
{
  if (a3)
  {
    uint64_t v11 = *(void *)&a7;
    uint64_t v13 = *(void *)&a5;
    uint64_t v14 = *(void *)&a4;
    id v44 = 0;
    +[EMDEUtils loadExtractionModelWithError:&v44];
    uint64_t v16 = v44;
    if (v16) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = cf == 0;
    }
    if (v17)
    {
      uint64_t v18 = modelLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10008E820();
      }
      int v19 = 0;
    }
    else
    {
      int v27 = [EMDEBeamSearchHandler alloc];
      *(float *)&double v29 = a6;
      *(float *)&double v28 = (float)a8;
      uint64_t v18 = [(EMDEBeamSearchHandler *)v27 initWithModel:&cf beamWidth:v13 timeSteps:v11 lengthPenalty:v29 tokenThreshold:v28];
      if (*((char *)&a9->__r_.__value_.var0.var1 + 23) < 0)
      {
        sub_1000302DC(__p, a9->__r_.__value_.var0.var1.__data_, a9->__r_.__value_.var0.var1.__size_);
      }
      else
      {
        *(_OWORD *)std::string __p = *(_OWORD *)a9->__r_.__value_.var0.var0.__data_;
        uint64_t v43 = *((void *)&a9->__r_.__value_.var0.var1 + 2);
      }
      unint64_t v30 = [v18 getTopBeamWithModelState:a3 startPosition:v14 allowedWords:__p];
      if (SHIBYTE(v43) < 0) {
        operator delete(__p[0]);
      }
      MRLNeuralNetworkClear();
      if (v30)
      {
        [v30 currentPrediction];
        if (v41 >= 0) {
          BOOL v31 = &v39;
        }
        else {
          BOOL v31 = v39;
        }
        id v32 = +[NSString stringWithUTF8String:v31];
        if (v41 < 0) {
          operator delete(v39);
        }
        v47[0] = v32;
        v46[0] = @"prediction";
        v46[1] = @"score";
        [v30 score];
        float v34 = v33;
        [v30 tokens];
        *(float *)&double v35 = v34 / (float)(unint64_t)(((v40 - (unsigned char *)v39) >> 2) - 1);
        int v36 = +[NSNumber numberWithFloat:v35];
        v47[1] = v36;
        v46[2] = @"scoreWithPenalty";
        [v30 averageScore];
        id v37 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        v47[2] = v37;
        int v19 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:3];

        if (v39)
        {
          v40 = v39;
          operator delete(v39);
        }
      }
      else
      {
        id v32 = modelLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          LOWORD(v39) = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "EMDEModelWrapper - No Beam generated.", (uint8_t *)&v39, 2u);
        }
        int v19 = 0;
      }
    }
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    uint64_t v16 = modelLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10008E7E8(v16, v20, v21, v22, v23, v24, v25, v26);
    }
    int v19 = 0;
  }

  return v19;
}

- (void)dealloc
{
  lexicon = self->_lexicon;
  if (lexicon) {
    CFRelease(lexicon);
  }
  v4.receiver = self;
  v4.super_class = (Class)EMDEModelWrapper;
  [(EMDEModelWrapper *)&v4 dealloc];
}

- (vector<float,)inputTokens
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<float, std::allocator<float>> *)sub_1000119FC(retstr, self->_inputTokens.__begin_, (uint64_t)self->_inputTokens.__end_, self->_inputTokens.__end_ - self->_inputTokens.__begin_);
}

- (void)setInputTokens:()vector<float
{
  p_inputTokens = (char *)&self->_inputTokens;
  if (p_inputTokens != (char *)a3) {
    sub_100011A78(p_inputTokens, (char *)a3->__begin_, (uint64_t)a3->__end_, a3->__end_ - a3->__begin_);
  }
}

- (basic_string<char,)inputStringLowercased
{
  if (*((char *)&result[1].__r_.var1 + 3) < 0) {
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_1000302DC(retstr, (void *)result[1].__r_.__value_.var0.var1.__size_, *((void *)&result[1].__r_.__value_.var0.var1+ 2));
  }
  *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&result[1].__r_.__value_.var0.var1.__size_;
  *((void *)&retstr->__r_.__value_.var0.var1 + 2) = *(void *)&result[1].__r_.var0;
  return result;
}

- (void)setInputStringLowercased:()basic_string<char
{
  std::string::operator=((std::string *)&self->_inputStringLowercased, (const std::string *)a3);
}

- (basic_string<char,)inputStringLowercasedForTitles
{
  if (result[2].__r_.__value_.var0.var0.__data_[15] < 0) {
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_1000302DC(retstr, (void *)result[1].var0, (unint64_t)result[2].__r_.__value_.var0.var1.__data_);
  }
  *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&result[1].var0;
  *((void *)&retstr->__r_.__value_.var0.var1 + 2) = result[2].__r_.__value_.var0.var1.__size_;
  return result;
}

- (void)setInputStringLowercasedForTitles:()basic_string<char
{
  std::string::operator=((std::string *)&self->_inputStringLowercased.__r_.var0, (const std::string *)a3);
}

- (basic_string<char,)allowedHelperWords
{
  if (SHIBYTE(result[2].var0) < 0) {
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_1000302DC(retstr, *((void **)&result[2].__r_.__value_.var0.var1+ 2), *(void *)&result[2].__r_.var0);
  }
  *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *((_OWORD *)&result[2].__r_.__value_.var0.var1 + 1);
  *((void *)&retstr->__r_.__value_.var0.var1 + 2) = result[2].var0;
  return result;
}

- (void)setAllowedHelperWords:()basic_string<char
{
  std::string::operator=((std::string *)&self->_inputStringLowercasedForTitles.__r_.__value_.var0.var1.__size_, (const std::string *)a3);
}

- (_LXLexicon)lexicon
{
  return self->_lexicon;
}

- (void)setLexicon:(_LXLexicon *)a3
{
  self->_lexicon = a3;
}

- (void).cxx_destruct
{
  if (*((char *)&self->_inputStringLowercasedForTitles.__r_.var1 + 3) < 0) {
    operator delete((void *)self->_inputStringLowercasedForTitles.__r_.__value_.var0.var1.__size_);
  }
  if (self->_inputStringLowercasedForTitles.__r_.__value_.var0.var0.__data_[7] < 0) {
    operator delete(*(void **)&self->_inputStringLowercased.__r_.var0);
  }
  if (*((char *)&self->_inputStringLowercased.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(self->_inputStringLowercased.__r_.__value_.var0.var1.__data_);
  }
  begin = self->_inputTokens.__begin_;
  if (begin)
  {
    self->_inputTokens.__end_ = begin;
    operator delete(begin);
  }
  sub_10000DB7C((const void **)&self->_model.m_ref, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  return self;
}

@end