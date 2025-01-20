@interface _EARLanguageDetectorRequestContext
+ (id)contextFromLDContext:(const void *)a3;
+ (id)contextFromLDContext:(void *)a1;
- (LDContext)LDContext;
- (NSArray)multilingualKeyboardLanguages;
- (NSArray)recentMessages;
- (NSDictionary)dictationLanguagePriors;
- (NSDictionary)keyboardConvoLanguagePriors;
- (NSDictionary)keyboardGlobalLanguagePriors;
- (NSDictionary)languagePriors;
- (NSNumber)wasLanguageToggled;
- (NSSet)dictationLanguages;
- (NSString)currentDictationLanguage;
- (NSString)globalLastKeyboardUsed;
- (NSString)previousMessageLanguage;
- (id)copyWithZone:(_NSZone *)a3;
- (void)LDContext;
- (void)setCurrentDictationLanguage:(id)a3;
- (void)setDictationLanguagePriors:(id)a3;
- (void)setDictationLanguages:(id)a3;
- (void)setGlobalLastKeyboardUsed:(id)a3;
- (void)setKeyboardConvoLanguagePriors:(id)a3;
- (void)setKeyboardGlobalLanguagePriors:(id)a3;
- (void)setLanguagePriors:(id)a3;
- (void)setMultilingualKeyboardLanguages:(id)a3;
- (void)setPreviousMessageLanguage:(id)a3;
- (void)setRecentMessages:(id)a3;
- (void)setWasLanguageToggled:(id)a3;
@end

@implementation _EARLanguageDetectorRequestContext

- (LDContext)LDContext
{
  v2 = v1;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  quasar::LDContext::LDContext((uint64_t)retstr);
  v4 = [v2 languagePriors];
  EARHelpers::DictionaryToMap<quasar::language_detector::Locale,double,-[_EARLanguageDetectorRequestContext LDContext]::$_0,[(_EARLanguageDetectorRequestContext *)v4 LDContext];
  p_var1 = &retstr->var0.var0.var1;
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)retstr, (void *)retstr->var0.var0.var1.var0.__left_);
  v6 = (void *)*((void *)&v52 + 1);
  retstr->var0.var0.var0 = (void *)v52;
  retstr->var0.var0.var1.var0.__left_ = v6;
  unint64_t v7 = v53;
  retstr->var0.var0.var2.var0 = v53;
  if (v7)
  {
    v6[2] = p_var1;
    *(void *)&long long v52 = (char *)&v52 + 8;
    *((void *)&v52 + 1) = 0;
    unint64_t v53 = 0;
    v6 = 0;
  }
  else
  {
    retstr->var0.var0.var0 = p_var1;
  }
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v52, v6);

  v8 = [v2 dictationLanguages];
  v9 = v8;
  if (v8)
  {
    v40.__end_ = 0;
    v40.__end_cap_.__value_ = 0;
    v40.__begin_ = (std::vector<std::pair<std::string, std::string>>::pointer)&v40.__end_;
    *(_OWORD *)v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:v45 objects:&v52 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v46 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *((id *)v45[1] + i);
          v15 = v14;
          if (v14)
          {
            objc_msgSend(v14, "ear_toString");
          }
          else
          {
            __p = 0;
            uint64_t v50 = 0;
            uint64_t v51 = 0;
          }
          quasar::language_detector::Locale::Locale(v41, &__p);
          if (SHIBYTE(v51) < 0) {
            operator delete(__p);
          }

          std::__tree<quasar::language_detector::Locale>::__emplace_unique_key_args<quasar::language_detector::Locale,quasar::language_detector::Locale>((uint64_t **)&v40, (unsigned __int8 *)v41, (uint64_t)v41);
          if (v44 < 0) {
            operator delete(v43);
          }
          if (v42 < 0) {
            operator delete(v41[0]);
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:v45 objects:&v52 count:16];
      }
      while (v11);
    }

    std::optional<std::set<quasar::language_detector::Locale>>::operator=[abi:ne180100]<std::set<quasar::language_detector::Locale>,void>((uint64_t)&retstr->var1, &v40);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v40, v40.__end_->first.__r_.__value_.__r.__words);
  }

  v16 = [v2 currentDictationLanguage];
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "ear_toString");
    quasar::language_detector::Locale::Locale(&v52, v45);
    if (SBYTE7(v46) < 0) {
      operator delete(v45[0]);
    }
    std::optional<quasar::language_detector::Locale>::operator=[abi:ne180100]<quasar::language_detector::Locale,void>((uint64_t)&retstr->var2, &v52);
    if (v55 < 0) {
      operator delete(v54);
    }
    if (SHIBYTE(v53) < 0) {
      operator delete((void *)v52);
    }
  }

  v18 = [v2 wasLanguageToggled];
  v19 = v18;
  if (v18) {
    *((_WORD *)&retstr->var2.var1.__r_.__value_.var0.var1 + 8) = [v18 BOOLValue] | 0x100;
  }

  v20 = [v2 multilingualKeyboardLanguages];
  v21 = v20;
  if (v20)
  {
    id v22 = v20;
    memset(&v40, 0, sizeof(v40));
    *(_OWORD *)v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:v45 objects:&v52 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v46 != v25) {
            objc_enumerationMutation(v23);
          }
          id v27 = *((id *)v45[1] + j);
          v28 = v27;
          if (v27)
          {
            objc_msgSend(v27, "ear_toString");
          }
          else
          {
            __p = 0;
            uint64_t v50 = 0;
            uint64_t v51 = 0;
          }
          quasar::language_detector::Locale::Locale(v41, &__p);
          if (SHIBYTE(v51) < 0) {
            operator delete(__p);
          }

          std::vector<quasar::language_detector::Locale>::push_back[abi:ne180100]((uint64_t *)&v40, (long long *)v41);
          if (v44 < 0) {
            operator delete(v43);
          }
          if (v42 < 0) {
            operator delete(v41[0]);
          }
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:v45 objects:&v52 count:16];
      }
      while (v24);
    }

    std::optional<std::vector<quasar::language_detector::Locale>>::operator=[abi:ne180100]<std::vector<quasar::language_detector::Locale>,void>((std::vector<std::pair<std::string, std::string>> *)&retstr->var2.var1.__r_.var0, &v40);
    *(void *)&long long v52 = &v40;
    std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v52);
  }

  v29 = [v2 keyboardConvoLanguagePriors];
  v30 = v29;
  if (v29)
  {
    EARHelpers::DictionaryToMap<quasar::language_detector::Locale,double,-[_EARLanguageDetectorRequestContext LDContext]::$_0,[(_EARLanguageDetectorRequestContext *)v29 LDContext];
    std::optional<std::set<quasar::language_detector::Locale>>::operator=[abi:ne180100]<std::set<quasar::language_detector::Locale>,void>((uint64_t)&retstr[1].var0.var0.var2, &v52);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v52, *((void **)&v52 + 1));
  }

  v31 = [v2 keyboardGlobalLanguagePriors];
  v32 = v31;
  if (v31)
  {
    EARHelpers::DictionaryToMap<quasar::language_detector::Locale,double,-[_EARLanguageDetectorRequestContext LDContext]::$_0,[(_EARLanguageDetectorRequestContext *)v31 LDContext];
    std::optional<std::set<quasar::language_detector::Locale>>::operator=[abi:ne180100]<std::set<quasar::language_detector::Locale>,void>((uint64_t)&retstr[1].var1.var1, &v52);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v52, *((void **)&v52 + 1));
  }

  v33 = [v2 previousMessageLanguage];
  v34 = v33;
  if (v33)
  {
    objc_msgSend(v33, "ear_toString");
    quasar::language_detector::Locale::Locale(&v52, v45);
    if (SBYTE7(v46) < 0) {
      operator delete(v45[0]);
    }
    std::optional<quasar::language_detector::Locale>::operator=[abi:ne180100]<quasar::language_detector::Locale,void>((uint64_t)&retstr[1].var2.var0.var1.var0.__r_.var0, &v52);
    if (v55 < 0) {
      operator delete(v54);
    }
    if (SHIBYTE(v53) < 0) {
      operator delete((void *)v52);
    }
  }

  v35 = [v2 globalLastKeyboardUsed];
  v36 = v35;
  if (v35)
  {
    objc_msgSend(v35, "ear_toString");
    quasar::language_detector::Locale::Locale(&v52, v45);
    if (SBYTE7(v46) < 0) {
      operator delete(v45[0]);
    }
    std::optional<quasar::language_detector::Locale>::operator=[abi:ne180100]<quasar::language_detector::Locale,void>((uint64_t)&retstr[2], &v52);
    if (v55 < 0) {
      operator delete(v54);
    }
    if (SHIBYTE(v53) < 0) {
      operator delete((void *)v52);
    }
  }

  v37 = [v2 dictationLanguagePriors];
  v38 = v37;
  if (v37)
  {
    EARHelpers::DictionaryToMap<quasar::language_detector::Locale,double,-[_EARLanguageDetectorRequestContext LDContext]::$_0,[(_EARLanguageDetectorRequestContext *)v37 LDContext];
    std::optional<std::set<quasar::language_detector::Locale>>::operator=[abi:ne180100]<std::set<quasar::language_detector::Locale>,void>((uint64_t)&retstr[2].var2, &v52);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v52, *((void **)&v52 + 1));
  }

  return result;
}

- (void)LDContext
{
  id v3 = a1;
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x4812000000;
  v8 = __Block_byref_object_copy__7;
  v9 = __Block_byref_object_dispose__7;
  id v10 = &unk_1B27252DB;
  v12[0] = 0;
  v12[1] = 0;
  uint64_t v11 = v12;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___ZN10EARHelpers15DictionaryToMapIN6quasar17language_detector6LocaleEdZ47___EARLanguageDetectorRequestContext_LDContext_E3__0Z47___EARLanguageDetectorRequestContext_LDContext_E3__1EENSt3__13mapIT_T0_NS6_4lessIS8_EENS6_9allocatorINS6_4pairIKS8_S9_EEEEEEP12NSDictionaryT1_T2__block_invoke;
  v4[3] = &unk_1E5FFE238;
  v4[4] = &v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
  std::map<quasar::language_detector::Locale,double>::map[abi:ne180100](a2, (uint64_t)(v6 + 6));
  _Block_object_dispose(&v5, 8);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v11, v12[0]);
}

+ (id)contextFromLDContext:(const void *)a3
{
  v4 = objc_alloc_init(_EARLanguageDetectorRequestContext);
  uint64_t v5 = EARHelpers::MapToDictionary<quasar::language_detector::Locale,double,+[_EARLanguageDetectorRequestContext contextFromLDContext:]::$_2,+[_EARLanguageDetectorRequestContext contextFromLDContext:]::$_3>(a3);
  [(_EARLanguageDetectorRequestContext *)v4 setLanguagePriors:v5];

  std::__optional_copy_base<std::set<quasar::language_detector::Locale>,false>::__optional_copy_base[abi:ne180100]((uint64_t)&v45, (uint64_t)a3 + 24);
  if (v46.__r_.__value_.__s.__data_[0])
  {
    v6 = [MEMORY[0x1E4F1CA80] setWithCapacity:v45.__r_.__value_.__r.__words[2]];
    uint64_t v7 = (std::string::__raw *)v45.__r_.__value_.__r.__words[0];
    if ((std::string::size_type *)v45.__r_.__value_.__l.__data_ != &v45.__r_.__value_.__r.__words[1])
    {
      do
      {
        v8 = NSString;
        quasar::language_detector::Locale::getSiriLocaleStr((quasar::language_detector::Locale *)&v7[1].__words[1], &__p);
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
        uint64_t v11 = objc_msgSend(v8, "ear_stringWithStringView:", p_p, size);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        [v6 addObject:v11];

        uint64_t v12 = (std::string *)v7->__words[1];
        if (v12)
        {
          do
          {
            v13 = v12;
            uint64_t v12 = (std::string *)v12->__r_.__value_.__r.__words[0];
          }
          while (v12);
        }
        else
        {
          do
          {
            v13 = (std::string *)v7->__words[2];
            BOOL v14 = v13->__r_.__value_.__r.__words[0] == (void)v7;
            uint64_t v7 = (std::string::__raw *)v13;
          }
          while (!v14);
        }
        uint64_t v7 = (std::string::__raw *)v13;
      }
      while (v13 != (std::string *)&v45.__r_.__value_.__r.__words[1]);
    }
    v15 = (void *)[v6 copy];

    [(_EARLanguageDetectorRequestContext *)v4 setDictationLanguages:v15];
    if (v46.__r_.__value_.__s.__data_[0]) {
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v45, (void *)v45.__r_.__value_.__l.__size_);
    }
  }
  std::__optional_copy_base<quasar::language_detector::Locale,false>::__optional_copy_base[abi:ne180100](&v45, (uint64_t)a3 + 56);
  if (v47)
  {
    v16 = NSString;
    quasar::language_detector::Locale::getSiriLocaleStr((quasar::language_detector::Locale *)&v45, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v17 = &__p;
    }
    else {
      v17 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v18 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v18 = __p.__r_.__value_.__l.__size_;
    }
    v19 = objc_msgSend(v16, "ear_stringWithStringView:", v17, v18);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    [(_EARLanguageDetectorRequestContext *)v4 setCurrentDictationLanguage:v19];
  }
  std::__optional_destruct_base<quasar::language_detector::Locale,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v45);
  if (*((unsigned __int16 *)a3 + 56) >= 0x100u)
  {
    v20 = [NSNumber numberWithBool:*((_WORD *)a3 + 56) != 0];
    [(_EARLanguageDetectorRequestContext *)v4 setWasLanguageToggled:v20];
  }
  std::__optional_copy_base<std::vector<quasar::language_detector::Locale>,false>::__optional_copy_base[abi:ne180100](&__p, (uint64_t)a3 + 120);
  if (v44)
  {
    v21 = [MEMORY[0x1E4F1CA48] array];
    std::string::size_type v23 = __p.__r_.__value_.__l.__size_;
    for (std::string::size_type i = __p.__r_.__value_.__r.__words[0]; i != v23; i += 48)
    {
      if (*(char *)(i + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v45, *(const std::string::value_type **)i, *(void *)(i + 8));
      }
      else
      {
        long long v24 = *(_OWORD *)i;
        v45.__r_.__value_.__r.__words[2] = *(void *)(i + 16);
        *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v24;
      }
      if (*(char *)(i + 47) < 0)
      {
        std::string::__init_copy_ctor_external(&v46, *(const std::string::value_type **)(i + 24), *(void *)(i + 32));
      }
      else
      {
        long long v25 = *(_OWORD *)(i + 24);
        v46.__r_.__value_.__r.__words[2] = *(void *)(i + 40);
        *(_OWORD *)&v46.__r_.__value_.__l.__data_ = v25;
      }
      v26 = NSString;
      quasar::language_detector::Locale::getSiriLocaleStr((quasar::language_detector::Locale *)&v45, &v48);
      if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        id v27 = &v48;
      }
      else {
        id v27 = (std::string *)v48.__r_.__value_.__r.__words[0];
      }
      if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v28 = HIBYTE(v48.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v28 = v48.__r_.__value_.__l.__size_;
      }
      v29 = objc_msgSend(v26, "ear_stringWithStringView:", v27, v28);
      if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v48.__r_.__value_.__l.__data_);
      }
      [v21 addObject:v29];

      if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v46.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v45.__r_.__value_.__l.__data_);
      }
    }
    v30 = (void *)[v21 copy];

    [(_EARLanguageDetectorRequestContext *)v4 setMultilingualKeyboardLanguages:v30];
    if (v44)
    {
      v45.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
      std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v45);
    }
  }
  std::__optional_copy_base<std::map<quasar::language_detector::Locale,double>,false>::__optional_copy_base[abi:ne180100]((uint64_t)&v45, (uint64_t)a3 + 152);
  if (v46.__r_.__value_.__s.__data_[0])
  {
    v31 = EARHelpers::MapToDictionary<quasar::language_detector::Locale,double,+[_EARLanguageDetectorRequestContext contextFromLDContext:]::$_2,+[_EARLanguageDetectorRequestContext contextFromLDContext:]::$_3>(&v45);
    [(_EARLanguageDetectorRequestContext *)v4 setKeyboardConvoLanguagePriors:v31];

    if (v46.__r_.__value_.__s.__data_[0]) {
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v45, (void *)v45.__r_.__value_.__l.__size_);
    }
  }
  std::__optional_copy_base<std::map<quasar::language_detector::Locale,double>,false>::__optional_copy_base[abi:ne180100]((uint64_t)&v45, (uint64_t)a3 + 184);
  if (v46.__r_.__value_.__s.__data_[0])
  {
    v32 = EARHelpers::MapToDictionary<quasar::language_detector::Locale,double,+[_EARLanguageDetectorRequestContext contextFromLDContext:]::$_2,+[_EARLanguageDetectorRequestContext contextFromLDContext:]::$_3>(&v45);
    [(_EARLanguageDetectorRequestContext *)v4 setKeyboardGlobalLanguagePriors:v32];

    if (v46.__r_.__value_.__s.__data_[0]) {
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v45, (void *)v45.__r_.__value_.__l.__size_);
    }
  }
  std::__optional_copy_base<quasar::language_detector::Locale,false>::__optional_copy_base[abi:ne180100](&v45, (uint64_t)a3 + 216);
  if (v47)
  {
    v33 = NSString;
    quasar::language_detector::Locale::getSiriLocaleStr((quasar::language_detector::Locale *)&v45, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v34 = &__p;
    }
    else {
      v34 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v35 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v35 = __p.__r_.__value_.__l.__size_;
    }
    v36 = objc_msgSend(v33, "ear_stringWithStringView:", v34, v35);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    [(_EARLanguageDetectorRequestContext *)v4 setPreviousMessageLanguage:v36];
  }
  std::__optional_destruct_base<quasar::language_detector::Locale,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v45);
  std::__optional_copy_base<quasar::language_detector::Locale,false>::__optional_copy_base[abi:ne180100](&v45, (uint64_t)a3 + 272);
  if (v47)
  {
    v37 = NSString;
    quasar::language_detector::Locale::getSiriLocaleStr((quasar::language_detector::Locale *)&v45, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v38 = &__p;
    }
    else {
      v38 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v39 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v39 = __p.__r_.__value_.__l.__size_;
    }
    std::vector<std::pair<std::string, std::string>> v40 = objc_msgSend(v37, "ear_stringWithStringView:", v38, v39);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    [(_EARLanguageDetectorRequestContext *)v4 setGlobalLastKeyboardUsed:v40];
  }
  std::__optional_destruct_base<quasar::language_detector::Locale,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v45);
  std::__optional_copy_base<std::map<quasar::language_detector::Locale,double>,false>::__optional_copy_base[abi:ne180100]((uint64_t)&v45, (uint64_t)a3 + 328);
  if (v46.__r_.__value_.__s.__data_[0])
  {
    v41 = EARHelpers::MapToDictionary<quasar::language_detector::Locale,double,+[_EARLanguageDetectorRequestContext contextFromLDContext:]::$_2,+[_EARLanguageDetectorRequestContext contextFromLDContext:]::$_3>(&v45);
    [(_EARLanguageDetectorRequestContext *)v4 setDictationLanguagePriors:v41];

    if (v46.__r_.__value_.__s.__data_[0]) {
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v45, (void *)v45.__r_.__value_.__l.__size_);
    }
  }
  return v4;
}

+ (id)contextFromLDContext:(void *)a1
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = (double *)*a1;
  id v3 = (double *)(a1 + 1);
  v4 = v5;
  if (v5 != v3)
  {
    do
    {
      v6 = [NSNumber numberWithDouble:v4[10]];
      uint64_t v7 = NSString;
      quasar::language_detector::Locale::getSiriLocaleStr((quasar::language_detector::Locale *)(v4 + 4), &__p);
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
      id v10 = objc_msgSend(v7, "ear_stringWithStringView:", p_p, size);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      [v2 setObject:v6 forKey:v10];

      uint64_t v11 = (double *)*((void *)v4 + 1);
      if (v11)
      {
        do
        {
          uint64_t v12 = v11;
          uint64_t v11 = *(double **)v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          uint64_t v12 = (double *)*((void *)v4 + 2);
          BOOL v13 = *(void *)v12 == (void)v4;
          v4 = v12;
        }
        while (!v13);
      }
      v4 = v12;
    }
    while (v12 != v3);
  }
  BOOL v14 = (void *)[v2 copy];

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(_EARLanguageDetectorRequestContext *)self languagePriors];
  [v4 setLanguagePriors:v5];

  v6 = [(_EARLanguageDetectorRequestContext *)self dictationLanguages];
  [v4 setDictationLanguages:v6];

  uint64_t v7 = [(_EARLanguageDetectorRequestContext *)self currentDictationLanguage];
  [v4 setCurrentDictationLanguage:v7];

  v8 = [(_EARLanguageDetectorRequestContext *)self wasLanguageToggled];
  [v4 setWasLanguageToggled:v8];

  v9 = [(_EARLanguageDetectorRequestContext *)self multilingualKeyboardLanguages];
  [v4 setMultilingualKeyboardLanguages:v9];

  id v10 = [(_EARLanguageDetectorRequestContext *)self keyboardConvoLanguagePriors];
  [v4 setKeyboardConvoLanguagePriors:v10];

  uint64_t v11 = [(_EARLanguageDetectorRequestContext *)self keyboardGlobalLanguagePriors];
  [v4 setKeyboardGlobalLanguagePriors:v11];

  uint64_t v12 = [(_EARLanguageDetectorRequestContext *)self previousMessageLanguage];
  [v4 setPreviousMessageLanguage:v12];

  BOOL v13 = [(_EARLanguageDetectorRequestContext *)self globalLastKeyboardUsed];
  [v4 setGlobalLastKeyboardUsed:v13];

  BOOL v14 = [(_EARLanguageDetectorRequestContext *)self dictationLanguagePriors];
  [v4 setDictationLanguagePriors:v14];

  v15 = [(_EARLanguageDetectorRequestContext *)self recentMessages];
  [v4 setRecentMessages:v15];

  return v4;
}

- (NSDictionary)languagePriors
{
  return self->_languagePriors;
}

- (void)setLanguagePriors:(id)a3
{
}

- (NSSet)dictationLanguages
{
  return self->_dictationLanguages;
}

- (void)setDictationLanguages:(id)a3
{
}

- (NSString)currentDictationLanguage
{
  return self->_currentDictationLanguage;
}

- (void)setCurrentDictationLanguage:(id)a3
{
}

- (NSNumber)wasLanguageToggled
{
  return self->_wasLanguageToggled;
}

- (void)setWasLanguageToggled:(id)a3
{
}

- (NSArray)multilingualKeyboardLanguages
{
  return self->_multilingualKeyboardLanguages;
}

- (void)setMultilingualKeyboardLanguages:(id)a3
{
}

- (NSDictionary)keyboardConvoLanguagePriors
{
  return self->_keyboardConvoLanguagePriors;
}

- (void)setKeyboardConvoLanguagePriors:(id)a3
{
}

- (NSDictionary)keyboardGlobalLanguagePriors
{
  return self->_keyboardGlobalLanguagePriors;
}

- (void)setKeyboardGlobalLanguagePriors:(id)a3
{
}

- (NSString)previousMessageLanguage
{
  return self->_previousMessageLanguage;
}

- (void)setPreviousMessageLanguage:(id)a3
{
}

- (NSString)globalLastKeyboardUsed
{
  return self->_globalLastKeyboardUsed;
}

- (void)setGlobalLastKeyboardUsed:(id)a3
{
}

- (NSDictionary)dictationLanguagePriors
{
  return self->_dictationLanguagePriors;
}

- (void)setDictationLanguagePriors:(id)a3
{
}

- (NSArray)recentMessages
{
  return self->_recentMessages;
}

- (void)setRecentMessages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentMessages, 0);
  objc_storeStrong((id *)&self->_dictationLanguagePriors, 0);
  objc_storeStrong((id *)&self->_globalLastKeyboardUsed, 0);
  objc_storeStrong((id *)&self->_previousMessageLanguage, 0);
  objc_storeStrong((id *)&self->_keyboardGlobalLanguagePriors, 0);
  objc_storeStrong((id *)&self->_keyboardConvoLanguagePriors, 0);
  objc_storeStrong((id *)&self->_multilingualKeyboardLanguages, 0);
  objc_storeStrong((id *)&self->_wasLanguageToggled, 0);
  objc_storeStrong((id *)&self->_currentDictationLanguage, 0);
  objc_storeStrong((id *)&self->_dictationLanguages, 0);
  objc_storeStrong((id *)&self->_languagePriors, 0);
}

@end