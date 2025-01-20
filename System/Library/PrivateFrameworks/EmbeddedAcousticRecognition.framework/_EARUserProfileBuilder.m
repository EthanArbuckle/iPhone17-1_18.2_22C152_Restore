@interface _EARUserProfileBuilder
+ (BOOL)isEasyToRecognizeWord:(id)a3 forLocale:(id)a4;
+ (void)initialize;
- (BOOL)_writeProfileToStream:(void *)a3;
- (BOOL)writeProfileToFile:(id)a3 protectionClass:(int64_t)a4 coordinated:(BOOL)a5 length:(unint64_t *)a6 error:(id *)a7;
- (BOOL)writeProfileToFile:(id)a3 protectionClass:(int64_t)a4 length:(unint64_t *)a5 error:(id *)a6;
- (NSDictionary)templateToVersion;
- (NSSet)experimentIds;
- (NSString)userId;
- (_EARPeopleSuggesterConfig)peopleSuggesterConfig;
- (_EARUserProfileBuilder)initWithConfiguration:(id)a3 language:(id)a4 overrides:(id)a5 sdapiOverrides:(id)a6 emptyVoc:(id)a7 pgVoc:(id)a8 paramsetHolder:(id)a9;
- (_EARUserProfileBuilder)initWithConfiguration:(id)a3 language:(id)a4 overrides:(id)a5 sdapiOverrides:(id)a6 emptyVoc:(id)a7 pgVoc:(id)a8 paramsetHolder:(id)a9 isJit:(BOOL)a10;
- (_EARUserProfileBuilder)initWithConfiguration:(id)a3 language:(id)a4 overrides:(id)a5 sdapiOverrides:(id)a6 generalVoc:(id)a7 emptyVoc:(id)a8 pgVoc:(id)a9 lexiconEnh:(id)a10 tokenEnh:(id)a11 paramsetHolder:(id)a12;
- (_EARUserProfileBuilder)initWithConfiguration:(id)a3 language:(id)a4 overrides:(id)a5 sdapiOverrides:(id)a6 generalVoc:(id)a7 emptyVoc:(id)a8 pgVoc:(id)a9 lexiconEnh:(id)a10 tokenEnh:(id)a11 paramsetHolder:(id)a12 isJit:(BOOL)a13;
- (_EARUserProfileBuilder)initWithConfiguration:(id)a3 language:(id)a4 overrides:(id)a5 textNormalizationModelRoot:(id)a6 sdapiOverrides:(id)a7 emptyVoc:(id)a8 pgVoc:(id)a9 paramsetHolder:(id)a10 isJit:(BOOL)a11;
- (_EARUserProfileBuilder)initWithConfiguration:(id)a3 language:(id)a4 sdapiOverrides:(id)a5 generalVoc:(id)a6 emptyVoc:(id)a7 pgVoc:(id)a8 lexiconEnh:(id)a9 tokenEnh:(id)a10 paramsetHolder:(id)a11;
- (_EARUserProfileBuilder)initWithConfiguration:(id)a3 withLanguage:(id)a4 withSdapiOverrides:(id)a5 withSdapiConfig:(id)a6;
- (id).cxx_construct;
- (id)createInlineLmeUserDataForContextData:(id)a3 speechProfile:(id)a4;
- (id)dataProfile;
- (id)pronunciationsForOrthography:(id)a3;
- (id)sanitizedStringWithString:(id)a3;
- (void)_embeddingsForOrthography:(const void *)a3 templateName:(const void *)a4 embeddings:(void *)a5 pronRequest:(int)a6;
- (void)_logLmeSlotUpdatedEventsWithLanguage:()basic_string<char numEnumeratedEntries:()std:(std::allocator<char>> *)a3 :char_traits<char>;
- (void)_logSpeechProfileUpdatedEventWithLmeData:(shared_ptr<quasar:(int)a4 :()map<std:()int :()std:(std:(int>>> *)a5 :allocator<std::pair<const)std::string :less<std::string> string LmeData>)a3 sizeInBytes:numEnumeratedEntries:;
- (void)_pronunciationsForOrthography:(const void *)a3 phoneticOrthography:(const void *)a4 templateName:(const void *)a5 pronunciations:(void *)a6 pronRequest:(int)a7 outOrthography:(void *)a8;
- (void)addPersonalizationData:(id)a3;
- (void)addPersonalizationJsonData:(id)a3;
- (void)addWordWithParts:(id)a3 templateName:(id)a4;
- (void)createInlineLmeUserDataForContextStrings:(id)a3;
- (void)readUserProfile:(id)a3;
- (void)readUserProfile:(id)a3 reuseProfile:(BOOL)a4;
- (void)readUserProfileWithPath:(id)a3;
- (void)readUserProfileWithPath:(id)a3 reuseProfile:(BOOL)a4;
- (void)removeAllWords;
- (void)removeLmeDataForTemplateName:(id)a3;
- (void)setExperimentIds:(id)a3;
- (void)setTemplateToVersion:(id)a3;
- (void)setUserId:(id)a3;
- (void)signalEndOfUserData;
- (void)writeOutUserDataToJson:(id)a3 withConfig:(id)a4;
@end

@implementation _EARUserProfileBuilder

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
    +[EARSdapiHelper EnsureSDAPIInitialized];
  }
}

+ (BOOL)isEasyToRecognizeWord:(id)a3 forLocale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  v8 = (quasar *)[v7 UTF8String];
  id v9 = [v6 localeIdentifier];
  v10 = (const char *)[v9 UTF8String];
  LOBYTE(v8) = quasar::wordIsNativeScriptForLocale(v8, v10, v11);

  return (char)v8;
}

- (_EARUserProfileBuilder)initWithConfiguration:(id)a3 withLanguage:(id)a4 withSdapiOverrides:(id)a5 withSdapiConfig:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_EARUserProfileBuilder;
  if ([(_EARUserProfileBuilder *)&v17 init])
  {
    v16.__r_.__value_.__r.__words[0] = [v10 fileSystemRepresentation];
    std::make_unique[abi:ne180100]<quasar::LmeDataFactory,char const*>();
  }
  v14 = (_EARUserProfileBuilder *)0;

  return v14;
}

- (_EARUserProfileBuilder)initWithConfiguration:(id)a3 language:(id)a4 sdapiOverrides:(id)a5 generalVoc:(id)a6 emptyVoc:(id)a7 pgVoc:(id)a8 lexiconEnh:(id)a9 tokenEnh:(id)a10 paramsetHolder:(id)a11
{
  return [(_EARUserProfileBuilder *)self initWithConfiguration:a3 language:a4 overrides:0 sdapiOverrides:a5 generalVoc:a6 emptyVoc:a7 pgVoc:a8 lexiconEnh:a9 tokenEnh:a10 paramsetHolder:a11];
}

- (_EARUserProfileBuilder)initWithConfiguration:(id)a3 language:(id)a4 overrides:(id)a5 sdapiOverrides:(id)a6 generalVoc:(id)a7 emptyVoc:(id)a8 pgVoc:(id)a9 lexiconEnh:(id)a10 tokenEnh:(id)a11 paramsetHolder:(id)a12
{
  LOBYTE(v13) = 0;
  return [(_EARUserProfileBuilder *)self initWithConfiguration:a3 language:a4 overrides:a5 sdapiOverrides:a6 generalVoc:a7 emptyVoc:a8 pgVoc:a9 lexiconEnh:a10 tokenEnh:a11 paramsetHolder:a12 isJit:v13];
}

- (_EARUserProfileBuilder)initWithConfiguration:(id)a3 language:(id)a4 overrides:(id)a5 sdapiOverrides:(id)a6 generalVoc:(id)a7 emptyVoc:(id)a8 pgVoc:(id)a9 lexiconEnh:(id)a10 tokenEnh:(id)a11 paramsetHolder:(id)a12 isJit:(BOOL)a13
{
  id v18 = a3;
  id v19 = a4;
  id v31 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = a12;
  id v27 = +[_EARQuasarTokenizer extractModelRootFromNcsResourcePaths:v21 lexiconEnh:v24 tokenEnh:v25 itnEnh:0];
  LOBYTE(v30) = a13;
  v28 = [(_EARUserProfileBuilder *)self initWithConfiguration:v18 language:v19 overrides:v31 sdapiOverrides:v20 emptyVoc:v22 pgVoc:v23 paramsetHolder:v26 isJit:v30];

  return v28;
}

- (_EARUserProfileBuilder)initWithConfiguration:(id)a3 language:(id)a4 overrides:(id)a5 sdapiOverrides:(id)a6 emptyVoc:(id)a7 pgVoc:(id)a8 paramsetHolder:(id)a9
{
  LOBYTE(v10) = 0;
  return [(_EARUserProfileBuilder *)self initWithConfiguration:a3 language:a4 overrides:a5 sdapiOverrides:a6 emptyVoc:a7 pgVoc:a8 paramsetHolder:a9 isJit:v10];
}

- (_EARUserProfileBuilder)initWithConfiguration:(id)a3 language:(id)a4 overrides:(id)a5 sdapiOverrides:(id)a6 emptyVoc:(id)a7 pgVoc:(id)a8 paramsetHolder:(id)a9 isJit:(BOOL)a10
{
  LOBYTE(v11) = a10;
  return [(_EARUserProfileBuilder *)self initWithConfiguration:a3 language:a4 overrides:a5 textNormalizationModelRoot:0 sdapiOverrides:a6 emptyVoc:a7 pgVoc:a8 paramsetHolder:a9 isJit:v11];
}

- (_EARUserProfileBuilder)initWithConfiguration:(id)a3 language:(id)a4 overrides:(id)a5 textNormalizationModelRoot:(id)a6 sdapiOverrides:(id)a7 emptyVoc:(id)a8 pgVoc:(id)a9 paramsetHolder:(id)a10 isJit:(BOOL)a11
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v17 = a4;
  id v26 = a5;
  id v24 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v28.receiver = self;
  v28.super_class = (Class)_EARUserProfileBuilder;
  id v27 = [(_EARUserProfileBuilder *)&v28 init];

  if (v27)
  {
    [v25 fileSystemRepresentation];
    std::make_unique[abi:ne180100]<quasar::LmeDataFactory,char const*>();
  }
  id v18 = (_EARUserProfileBuilder *)0;

  return v18;
}

- (void)addWordWithParts:(id)a3 templateName:(id)a4
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v72 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
  }
  else
  {
    long long v102 = 0uLL;
    uint64_t v103 = 0;
  }
  quasar::SystemConfig::aceCatToQuasarTemplate((uint64_t)self->_dataFactory.__ptr_ + 192, (uint64_t)&v102, &v101);
  if (!quasar::LmeDataFactory::isSupportedCategory((uint64_t)self->_dataFactory.__ptr_, (uint64_t)&v101, 1)) {
    goto LABEL_109;
  }
  int MaxEntityCountFromQuasarTemplate = quasar::LmeDataFactory::getMaxEntityCountFromQuasarTemplate((uint64_t)self->_dataFactory.__ptr_, (unsigned __int8 *)&v101);
  if ((MaxEntityCountFromQuasarTemplate & 0x80000000) == 0)
  {
    v94 = &v101;
    if (*((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&self->_quasarTemplate2Count, (unsigned __int8 *)&v101, (uint64_t)&std::piecewise_construct, (long long **)&v94)+ 10) >= MaxEntityCountFromQuasarTemplate)goto LABEL_109; {
  }
    }
  unsigned int MaxOrthographyLengthFromQuasarTemplate = quasar::LmeDataFactory::getMaxOrthographyLengthFromQuasarTemplate((uint64_t)self->_dataFactory.__ptr_, (unsigned __int8 *)&v101);
  if ((MaxOrthographyLengthFromQuasarTemplate & 0x80000000) != 0)
  {
LABEL_17:
    BOOL isContactTemplate = quasar::LmeDataFactory::isContactTemplate((uint64_t)self->_dataFactory.__ptr_, (uint64_t)&v101);
    if (!isContactTemplate
      || (unsigned int MaxNumEnumeratedContacts = quasar::LmeDataFactory::getMaxNumEnumeratedContacts((quasar::LmeDataFactory *)self->_dataFactory.__ptr_),
          (MaxNumEnumeratedContacts & 0x80000000) != 0)
      || self->_contactEnumSet.__tree_.__pair3_.__value_ < MaxNumEnumeratedContacts)
    {
      v94 = &v101;
      id v21 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&self->_quasarTemplate2Count, (unsigned __int8 *)&v101, (uint64_t)&std::piecewise_construct, (long long **)&v94);
      ++*((_DWORD *)v21 + 10);
      v94 = 0;
      unint64_t v95 = 0;
      unint64_t v96 = 0;
      v93[0] = 0;
      v93[1] = 0;
      v92 = (long long **)v93;
      quasar::LmeDataFactory::getNameEnumeratorFromAceCategory((uint64_t)self->_dataFactory.__ptr_, (uint64_t)&v102, &lpsrc);
      v71 = v7;
      memset(&v89, 0, sizeof(v89));
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id obj = v72;
      uint64_t v22 = [obj countByEnumeratingWithState:&v85 objects:v106 count:16];
      BOOL v69 = isContactTemplate;
      v70 = self;
      if (!v22)
      {

LABEL_117:
        if (lpsrc) {
          (*(void (**)(void *, std::string **))(*(void *)lpsrc + 32))(lpsrc, &v94);
        }
LABEL_119:
        v82 = 0;
        v83 = 0;
        unint64_t v84 = 0;
        v58 = (long long *)v94;
        unint64_t v57 = v95;
        if (v94 != (std::string *)v95)
        {
          do
          {
            memset(&__p, 0, sizeof(__p));
            uint64_t v59 = std::__tree<std::__value_type<std::string,double>,std::__map_value_compare<std::string,std::__value_type<std::string,double>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,double>>>::find<std::string>((uint64_t)&v92, (const void **)v58);
            if (v93 != (void **)v59) {
              std::string::operator=(&__p, (const std::string *)(v59 + 56));
            }
            memset(&v76, 0, sizeof(v76));
            [(_EARUserProfileBuilder *)v70 _pronunciationsForOrthography:v58 phoneticOrthography:&__p templateName:&v101 pronunciations:(char *)v58 + 56 pronRequest:3 outOrthography:&v76];
            std::string::operator=((std::string *)v58, &v76);
            if (!quasar::LmeDataFactoryBase::PronSet::empty((quasar::LmeDataFactoryBase::PronSet *)((char *)v58 + 56)))
            {
              v60 = v83;
              if ((unint64_t)v83 >= v84)
              {
                v61 = (char *)std::vector<quasar::LmeDataFactoryBase::Word>::__emplace_back_slow_path<std::string &,std::string &,int &,quasar::LmeDataFactoryBase::PronSet &>((uint64_t *)&v82, (uint64_t)v58, (uint64_t)v58 + 24, (unsigned int *)v58 + 12, (uint64_t)v58 + 56);
              }
              else
              {
                std::allocator<quasar::LmeDataFactoryBase::Word>::construct[abi:ne180100]<quasar::LmeDataFactoryBase::Word,std::string &,std::string &,int &,quasar::LmeDataFactoryBase::PronSet &>((uint64_t)&v84, (uint64_t)v83, (uint64_t)v58, (uint64_t)v58 + 24, (unsigned int *)v58 + 12, (uint64_t)v58 + 56);
                v61 = v60 + 80;
              }
              v83 = v61;
            }
            if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v76.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
            v58 += 5;
          }
          while (v58 != (long long *)v57);
        }
        id v7 = v71;
        quasar::LmePackedUserData::addUnpackedEntity((uint64_t **)&v70->_userData, &v102, (const quasar::LmeDataFactoryBase::Word **)&v82);
        ++v70->_wordsAccepted;
        if (v69 && lpsrc && (*(unsigned int (**)(void *))(*(void *)lpsrc + 24))(lpsrc))
        {
          MaxPronLen = (const quasar::LmeDataFactoryBase::Word *)quasar::LmeDataFactory::getMaxPronLen((uint64_t)v70->_dataFactory.__ptr_, (unsigned __int8 *)&v101);
          quasar::LmeDataFactory::encodeAndFilterEntity((std::string **)&v82, MaxPronLen, (uint64_t *)&__p);
          std::string::size_type size = __p.__r_.__value_.__l.__size_;
          if (__p.__r_.__value_.__r.__words[0] != __p.__r_.__value_.__l.__size_)
          {
            std::string::size_type v64 = __p.__r_.__value_.__r.__words[0] + 24;
            do
            {
              int v65 = *(char *)(v64 + 23);
              if (v65 >= 0) {
                v66 = (const std::string::value_type *)v64;
              }
              else {
                v66 = *(const std::string::value_type **)v64;
              }
              if (v65 >= 0) {
                std::string::size_type v67 = *(unsigned __int8 *)(v64 + 23);
              }
              else {
                std::string::size_type v67 = *(void *)(v64 + 8);
              }
              std::string::append((std::string *)(v64 - 24), v66, v67);
              std::string::size_type v68 = v64 + 56;
              v64 += 80;
            }
            while (v68 != size);
          }
          (*(void (**)(void *, std::string *, set<std::vector<std::string>, quasar::NameEnumerator::EnumComparator, std::allocator<std::vector<std::string>>> *))(*(void *)lpsrc + 16))(lpsrc, &__p, &v70->_contactEnumSet);
          v76.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
          std::vector<quasar::LmeDataFactoryBase::Word>::__destroy_vector::operator()[abi:ne180100]((void ***)&v76);
        }
        quasar::LmeDataFactoryBase::PronSet::PronSet(&__p);
        [(_EARUserProfileBuilder *)v70 _embeddingsForOrthography:&v89 templateName:&v101 embeddings:&__p pronRequest:2];
        std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&__p, (char *)__p.__r_.__value_.__l.__size_);
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v82;
        std::vector<quasar::LmeDataFactoryBase::Word>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
        if (SHIBYTE(v89.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v89.__r_.__value_.__l.__data_);
        }
        if (v91) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v91);
        }
        std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v92, v93[0]);
        v92 = (long long **)&v94;
        std::vector<quasar::LmeDataFactoryBase::Word>::__destroy_vector::operator()[abi:ne180100]((void ***)&v92);
        goto LABEL_110;
      }
      uint64_t v74 = *(void *)v86;
      char v23 = 1;
LABEL_22:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v86 != v74) {
          objc_enumerationMutation(obj);
        }
        id v25 = *(void **)(*((void *)&v85 + 1) + 8 * v24);
        v83 = 0;
        unint64_t v84 = 0;
        v82 = &v83;
        id v26 = [v25 pronunciations];
        BOOL v27 = v26 == 0;

        if (!v27)
        {
          long long v80 = 0u;
          long long v81 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          objc_super v28 = [v25 pronunciations];
          uint64_t v29 = [v28 countByEnumeratingWithState:&v78 objects:v105 count:16];
          if (v29)
          {
            uint64_t v30 = *(void *)v79;
            do
            {
              for (uint64_t i = 0; i != v29; ++i)
              {
                if (*(void *)v79 != v30) {
                  objc_enumerationMutation(v28);
                }
                v32 = *(void **)(*((void *)&v78 + 1) + 8 * i);
                if (v32) {
                  objc_msgSend(v32, "ear_toString");
                }
                else {
                  memset(&__p, 0, sizeof(__p));
                }
                std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string>((uint64_t **)&v82, (const void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&__p);
                if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(__p.__r_.__value_.__l.__data_);
                }
              }
              uint64_t v29 = [v28 countByEnumeratingWithState:&v78 objects:v105 count:16];
            }
            while (v29);
          }
        }
        v33 = [v25 tagName];
        v34 = v33;
        if (v33) {
          objc_msgSend(v33, "ear_toString");
        }
        else {
          memset(&__p, 0, sizeof(__p));
        }

        v35 = [v25 orthography];
        v36 = v35;
        if (v35) {
          objc_msgSend(v35, "ear_toString");
        }
        else {
          memset(&v76, 0, sizeof(v76));
        }

        if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::size_type v37 = v76.__r_.__value_.__l.__size_;
          if (!v76.__r_.__value_.__l.__size_)
          {
            char v23 = 0;
LABEL_102:
            operator delete(v76.__r_.__value_.__l.__data_);
            goto LABEL_103;
          }
          v38 = (std::string *)v76.__r_.__value_.__r.__words[0];
        }
        else
        {
          std::string::size_type v37 = HIBYTE(v76.__r_.__value_.__r.__words[2]);
          if (!*((unsigned char *)&v76.__r_.__value_.__s + 23))
          {
            char v23 = 0;
            goto LABEL_103;
          }
          v38 = &v76;
        }
        if ((char *)v38 + v37 != utf8::find_invalid<std::__wrap_iter<char const*>>((char *)v38, (char *)v38 + v37))
        {
          char v23 = 0;
          goto LABEL_101;
        }
        v39 = [v25 phoneticOrthography];
        v40 = v39;
        if (v39) {
          objc_msgSend(v39, "ear_toString");
        }
        else {
          memset(&__str, 0, sizeof(__str));
        }

        if ((SHIBYTE(__str.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          break;
        }
        std::string::size_type v41 = __str.__r_.__value_.__l.__size_;
        if (__str.__r_.__value_.__l.__size_)
        {
          p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
LABEL_62:
          if ((char *)p_str + v41 == utf8::find_invalid<std::__wrap_iter<char const*>>((char *)p_str, (char *)p_str + v41))
          {
            v104 = &v76;
            v43 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v92, (const void **)&v76.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, (long long **)&v104);
            std::string::operator=((std::string *)(v43 + 7), &__str);
          }
          if ((SHIBYTE(__str.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_66;
          }
        }
        operator delete(__str.__r_.__value_.__l.__data_);
LABEL_66:
        if (v84)
        {
          __str.__r_.__value_.__r.__words[0] = [v25 frequency];
          unint64_t v44 = v95;
          if (v95 >= v96)
          {
            uint64_t v45 = std::vector<quasar::LmeDataFactoryBase::Word>::__emplace_back_slow_path<std::string &,std::string &,unsigned long,std::set<std::string> &>((uint64_t *)&v94, (uint64_t)&v76, (uint64_t)&__p, (unsigned int *)&__str, (uint64_t)&v82);
          }
          else
          {
            std::allocator<quasar::LmeDataFactoryBase::Word>::construct[abi:ne180100]<quasar::LmeDataFactoryBase::Word,std::string &,std::string &,unsigned long,std::set<std::string> &>((uint64_t)&v96, v95, (uint64_t)&v76, (uint64_t)&__p, (unsigned int *)&__str, (uint64_t)&v82);
            uint64_t v45 = v44 + 80;
          }
          char v23 = 0;
          unint64_t v95 = v45;
        }
        else
        {
          *(_OWORD *)&__str.__r_.__value_.__r.__words[1] = 0uLL;
          __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&__str.__r_.__value_.__l.__size_;
          if (lpsrc {
            && ((*(uint64_t (**)(void *))(*(void *)lpsrc + 24))(lpsrc) & 1) == 0
          }
            && lpsrc
          {
            v47 = v91;
            if (v91) {
              atomic_fetch_add_explicit(&v91->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            (*(void (**)(void *, std::string *, std::string *))(*(void *)v46 + 40))(v46, &v76, &__str);
            if (v47) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v47);
            }
          }
          else
          {
            std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t **)&__str, (const void **)&v76.__r_.__value_.__l.__data_, (uint64_t)&v76);
          }
          std::string::size_type v48 = __str.__r_.__value_.__r.__words[0];
          if ((std::string::size_type *)__str.__r_.__value_.__l.__data_ != &__str.__r_.__value_.__r.__words[1])
          {
            do
            {
              v104 = (std::string *)[v25 frequency];
              unint64_t v49 = v95;
              if (v95 >= v96)
              {
                uint64_t v50 = std::vector<quasar::LmeDataFactoryBase::Word>::__emplace_back_slow_path<std::string const&,std::string&,unsigned long,std::set<std::string> &>((uint64_t *)&v94, v48 + 32, (uint64_t)&__p, (unsigned int *)&v104, (uint64_t)&v82);
              }
              else
              {
                std::allocator<quasar::LmeDataFactoryBase::Word>::construct[abi:ne180100]<quasar::LmeDataFactoryBase::Word,std::string const&,std::string&,unsigned long,std::set<std::string> &>((uint64_t)&v96, v95, v48 + 32, (uint64_t)&__p, (unsigned int *)&v104, (uint64_t)&v82);
                uint64_t v50 = v49 + 80;
              }
              unint64_t v95 = v50;
              v51 = *(std::string **)(v48 + 8);
              if (v51)
              {
                do
                {
                  v52 = v51;
                  v51 = (std::string *)v51->__r_.__value_.__r.__words[0];
                }
                while (v51);
              }
              else
              {
                do
                {
                  v52 = *(std::string **)(v48 + 16);
                  BOOL v53 = v52->__r_.__value_.__r.__words[0] == v48;
                  std::string::size_type v48 = (std::string::size_type)v52;
                }
                while (!v53);
              }
              std::string::size_type v48 = (std::string::size_type)v52;
            }
            while (v52 != (std::string *)&__str.__r_.__value_.__r.__words[1]);
          }
          std::string::size_type v54 = HIBYTE(v89.__r_.__value_.__r.__words[2]);
          if ((v89.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            std::string::size_type v54 = v89.__r_.__value_.__l.__size_;
          }
          if (v54) {
            std::string::append(&v89, " ");
          }
          if ((v76.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            v55 = &v76;
          }
          else {
            v55 = (std::string *)v76.__r_.__value_.__r.__words[0];
          }
          if ((v76.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type v56 = HIBYTE(v76.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type v56 = v76.__r_.__value_.__l.__size_;
          }
          std::string::append(&v89, (const std::string::value_type *)v55, v56);
          std::__tree<std::string>::destroy((uint64_t)&__str, (char *)__str.__r_.__value_.__l.__size_);
        }
LABEL_101:
        if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0) {
          goto LABEL_102;
        }
LABEL_103:
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        std::__tree<std::string>::destroy((uint64_t)&v82, v83);
        if (++v24 == v22)
        {
          uint64_t v22 = [obj countByEnumeratingWithState:&v85 objects:v106 count:16];
          if (!v22)
          {

            if ((v23 & 1) == 0) {
              goto LABEL_119;
            }
            goto LABEL_117;
          }
          goto LABEL_22;
        }
      }
      std::string::size_type v41 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
      if (!*((unsigned char *)&__str.__r_.__value_.__s + 23)) {
        goto LABEL_66;
      }
      p_str = &__str;
      goto LABEL_62;
    }
LABEL_109:
    ++self->_wordsRejected;
    goto LABEL_110;
  }
  uint64_t v10 = self;
  uint64_t v11 = v7;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v12 = v72;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v97 objects:v107 count:16];
  if (!v13) {
    goto LABEL_16;
  }
  uint64_t v14 = *(void *)v98;
  unint64_t v15 = MaxOrthographyLengthFromQuasarTemplate;
LABEL_10:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v98 != v14) {
      objc_enumerationMutation(v12);
    }
    id v17 = [*(id *)(*((void *)&v97 + 1) + 8 * v16) orthography];
    BOOL v18 = [v17 length] > v15;

    if (v18) {
      break;
    }
    if (v13 == ++v16)
    {
      uint64_t v13 = [v12 countByEnumeratingWithState:&v97 objects:v107 count:16];
      if (!v13)
      {
LABEL_16:

        id v7 = v11;
        self = v10;
        goto LABEL_17;
      }
      goto LABEL_10;
    }
  }
  ++v10->_wordsRejected;

  id v7 = v11;
LABEL_110:
  if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v101.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v103) < 0) {
    operator delete((void *)v102);
  }
}

- (void)removeAllWords
{
}

- (void)removeLmeDataForTemplateName:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    ptr = (uint64_t **)self->_quasarLmeData.__ptr_;
    if (ptr)
    {
      objc_msgSend(v4, "ear_toString");
      quasar::LmeData::removeFstData(ptr, (const void **)&__p);
      if (v8 < 0) {
        operator delete(__p);
      }
    }
  }
}

- (NSDictionary)templateToVersion
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:self->_templateToVersion.__tree_.__pair3_.__value_];
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long long>, void *>>> *)self->_templateToVersion.__tree_.__begin_node_;
  p_pair1 = &self->_templateToVersion.__tree_.__pair1_;
  if (begin_node != &self->_templateToVersion.__tree_.__pair1_)
  {
    do
    {
      id v6 = [NSNumber numberWithLongLong:begin_node[7].__value_.__left_];
      left = begin_node + 4;
      if (SHIBYTE(begin_node[6].__value_.__left_) < 0) {
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long long>, void *>>> *)left->__value_.__left_;
      }
      char v8 = [NSString stringWithUTF8String:left];
      [v3 setValue:v6 forKey:v8];

      id v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long long>, void *>>> *)begin_node[1].__value_.__left_;
      if (v9)
      {
        do
        {
          uint64_t v10 = v9;
          id v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long long>, void *>>> *)v9->__value_.__left_;
        }
        while (v9);
      }
      else
      {
        do
        {
          uint64_t v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, long long>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v11 = v10->__value_.__left_ == begin_node;
          begin_node = v10;
        }
        while (!v11);
      }
      begin_node = v10;
    }
    while (v10 != p_pair1);
  }
  return (NSDictionary *)v3;
}

- (void)setTemplateToVersion:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_templateToVersion = (uint64_t **)&self->_templateToVersion;
  std::__tree<std::string>::destroy((uint64_t)&self->_templateToVersion, (char *)self->_templateToVersion.__tree_.__pair1_.__value_.__left_);
  self->_templateToVersion.__tree_.__pair1_.__value_.__left_ = 0;
  self->_templateToVersion.__tree_.__pair3_.__value_ = 0;
  self->_templateToVersion.__tree_.__begin_node_ = &self->_templateToVersion.__tree_.__pair1_;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if (v10)
        {
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "ear_toString");
        }
        else
        {
          *(_OWORD *)uint64_t v14 = 0uLL;
          uint64_t v15 = 0;
        }
        BOOL v11 = [v6 objectForKeyedSubscript:v10];
        uint64_t v12 = [v11 longLongValue];
        *(_OWORD *)std::string __p = *(_OWORD *)v14;
        uint64_t v13 = v15;
        uint64_t v15 = 0;
        *(_OWORD *)uint64_t v14 = 0uLL;
        uint64_t v17 = v13;
        uint64_t v18 = v12;
        std::__tree<std::__value_type<std::string,long long>,std::__map_value_compare<std::string,std::__value_type<std::string,long long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long long>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,long long>>(p_templateToVersion, (const void **)__p, (uint64_t)__p);
        if (SHIBYTE(v17) < 0) {
          operator delete(__p[0]);
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
}

- (NSSet)experimentIds
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:self->_experimentIds.__tree_.__pair3_.__value_];
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)self->_experimentIds.__tree_.__begin_node_;
  p_pair1 = &self->_experimentIds.__tree_.__pair1_;
  if (begin_node != &self->_experimentIds.__tree_.__pair1_)
  {
    do
    {
      if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
      {
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)begin_node[4].__value_.__left_;
        left_high = begin_node[5].__value_.__left_;
      }
      else
      {
        left = begin_node + 4;
        left_high = (void *)HIBYTE(begin_node[6].__value_.__left_);
      }
      uint64_t v8 = objc_msgSend(NSString, "ear_stringWithStringView:", left, left_high);
      [v3 addObject:v8];

      id v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)begin_node[1].__value_.__left_;
      if (v9)
      {
        do
        {
          uint64_t v10 = v9;
          id v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)v9->__value_.__left_;
        }
        while (v9);
      }
      else
      {
        do
        {
          uint64_t v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v11 = v10->__value_.__left_ == begin_node;
          begin_node = v10;
        }
        while (!v11);
      }
      begin_node = v10;
    }
    while (v10 != p_pair1);
  }
  return (NSSet *)v3;
}

- (void)setExperimentIds:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_experimentIds = (uint64_t **)&self->_experimentIds;
  std::__tree<std::string>::destroy((uint64_t)&self->_experimentIds, (char *)self->_experimentIds.__tree_.__pair1_.__value_.__left_);
  self->_experimentIds.__tree_.__pair1_.__value_.__left_ = 0;
  self->_experimentIds.__tree_.__pair3_.__value_ = 0;
  self->_experimentIds.__tree_.__begin_node_ = &self->_experimentIds.__tree_.__pair1_;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        if (v10)
        {
          objc_msgSend(v10, "ear_toString");
        }
        else
        {
          __p[0] = 0;
          __p[1] = 0;
          uint64_t v12 = 0;
        }
        std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string>(p_experimentIds, (const void **)__p, (uint64_t)__p);
        if (SHIBYTE(v12) < 0) {
          operator delete(__p[0]);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (BOOL)_writeProfileToStream:(void *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (char *)a3 + *(void *)(*(void *)a3 - 24);
  if ((v4[32] & 5) == 0) {
    (*(void (**)(std::string *__return_ptr))(**((void **)v4 + 5) + 32))(&__str);
  }
  if (self->_reuseProfile)
  {
    ptr = self->_quasarLmeData.__ptr_;
    if (ptr)
    {
      cntrl = self->_quasarLmeData.__cntrl_;
      uint64_t v10 = self->_quasarLmeData.__ptr_;
      if (cntrl) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
      }
      if ((map<std::string, long long, std::less<std::string>, std::allocator<std::pair<const std::string, long long>>> *)((char *)ptr + 344) != &self->_templateToVersion)
      {
        std::__tree<std::__value_type<std::string,long long>,std::__map_value_compare<std::string,std::__value_type<std::string,long long>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,long long>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,long long>,std::__tree_node<std::__value_type<std::string,long long>,void *> *,long>>((uint64_t **)ptr + 43, (void *)self->_templateToVersion.__tree_.__begin_node_, &self->_templateToVersion.__tree_.__pair1_.__value_.__left_);
        ptr = v10;
      }
      quasar::SystemConfig::getLmeAssetPath((quasar::SystemConfig *)((char *)self->_dataFactory.__ptr_ + 192), &__str);
      std::string::operator=((std::string *)((char *)ptr + 296), &__str);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      language = self->_language;
      if (language) {
        [(NSString *)language ear_toString];
      }
      else {
        memset(&__str, 0, sizeof(__str));
      }
      std::string::operator=((std::string *)((char *)v10 + 320), &__str);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      uint64_t v8 = v10;
      if ((set<std::string, std::less<std::string>, std::allocator<std::string>> *)((char *)v10 + 368) != &self->_experimentIds)
      {
        std::__tree<std::string>::__assign_multi<std::__tree_const_iterator<std::string,std::__tree_node<std::string,void *> *,long>>((uint64_t **)v10 + 46, (void *)self->_experimentIds.__tree_.__begin_node_, &self->_experimentIds.__tree_.__pair1_.__value_.__left_);
        uint64_t v8 = v10;
      }
      quasar::WordPronCache::removeWordsWithoutTemplates((quasar::WordPronCache *)((char *)v8 + 16));
    }
  }
  _ZNSt3__115allocate_sharedB8ne180100IN6quasar7LmeDataENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_();
}

- (id)dataProfile
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v10);
  if ([(_EARUserProfileBuilder *)self _writeProfileToStream:v11])
  {
    std::stringbuf::str();
    if ((v9 & 0x80u) == 0) {
      v3 = __p;
    }
    else {
      v3 = (void **)__p[0];
    }
    if ((v9 & 0x80u) == 0) {
      unint64_t v4 = v9;
    }
    else {
      unint64_t v4 = (unint64_t)__p[1];
    }
    id v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v3 length:v4];
    if ((char)v9 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    id v5 = 0;
  }
  v10[0] = *MEMORY[0x1E4FBA408];
  uint64_t v6 = *(void *)(MEMORY[0x1E4FBA408] + 72);
  *(void *)((char *)v10 + *(void *)(v10[0] - 24)) = *(void *)(MEMORY[0x1E4FBA408] + 64);
  v11[0] = v6;
  v11[1] = MEMORY[0x1E4FBA470] + 16;
  if (v12 < 0) {
    operator delete((void *)v11[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x1B3EA8520](&v13);
  return v5;
}

- (BOOL)writeProfileToFile:(id)a3 protectionClass:(int64_t)a4 length:(unint64_t *)a5 error:(id *)a6
{
  return [(_EARUserProfileBuilder *)self writeProfileToFile:a3 protectionClass:a4 coordinated:1 length:a5 error:a6];
}

- (BOOL)writeProfileToFile:(id)a3 protectionClass:(int64_t)a4 coordinated:(BOOL)a5 length:(unint64_t *)a6 error:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v13 = v12;
  if (a6) {
    *a6 = 0;
  }
  if ([v12 length])
  {
    *(void *)buf = 0;
    uint64_t v45 = buf;
    uint64_t v46 = 0x14812000000;
    v47 = __Block_byref_object_copy__1;
    std::string::size_type v48 = __Block_byref_object_dispose__1;
    unint64_t v49 = &unk_1B27252DB;
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v50);
    if ([(_EARUserProfileBuilder *)self _writeProfileToStream:v45 + 64])
    {
      uint64_t v40 = 0;
      std::string::size_type v41 = &v40;
      uint64_t v42 = 0x2020000000;
      char v43 = 0;
      if (v13)
      {
        objc_msgSend(v13, "ear_toString");
        if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(v39.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = v39.__r_.__value_.__l.__size_;
        }
      }
      else
      {
        std::string::size_type size = 0;
        memset(&v39, 0, sizeof(v39));
      }
      uint64_t v17 = &v38;
      std::string::basic_string[abi:ne180100]((uint64_t)&v38, size + 4);
      if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        uint64_t v17 = (std::string *)v38.__r_.__value_.__r.__words[0];
      }
      if (size)
      {
        if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v18 = &v39;
        }
        else {
          uint64_t v18 = (std::string *)v39.__r_.__value_.__r.__words[0];
        }
        memmove(v17, v18, size);
      }
      strcpy((char *)v17 + size, ".tmp");
      BOOL is_directory = quasar::filesystem::is_directory((char *)&v39);
      if (is_directory)
      {
        long long v20 = EARLogger::QuasarOSLogger((EARLogger *)is_directory);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)BOOL v53 = 0;
          _os_log_impl(&dword_1B1A86000, v20, OS_LOG_TYPE_INFO, "Cannot write profile: path points to a directory", v53, 2u);
        }

        BOOL v16 = 0;
      }
      else
      {
        quasar::filesystem::remove((char *)&v38);
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3321888768;
        v33[2] = __86___EARUserProfileBuilder_writeProfileToFile_protectionClass_coordinated_length_error___block_invoke;
        v33[3] = &unk_1F0A63C00;
        v33[4] = buf;
        if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&v34, v38.__r_.__value_.__l.__data_, v38.__r_.__value_.__l.__size_);
        }
        else {
          std::string v34 = v38;
        }
        if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&__p, v39.__r_.__value_.__l.__data_, v39.__r_.__value_.__l.__size_);
        }
        else {
          std::string __p = v39;
        }
        int64_t v36 = a4;
        std::string::size_type v37 = a6;
        v33[5] = &v40;
        uint64_t v21 = MEMORY[0x1B3EA9B60](v33);
        long long v22 = (void *)v21;
        if (v9)
        {
          char v23 = [v13 stringByDeletingLastPathComponent];
          uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:0];
          id v25 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v23 isDirectory:1 relativeToURL:0];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __86___EARUserProfileBuilder_writeProfileToFile_protectionClass_coordinated_length_error___block_invoke_97;
          v31[3] = &unk_1E5FFE1E8;
          id v32 = v22;
          [v24 coordinateWritingItemAtURL:v25 options:4 error:a7 byAccessor:v31];
        }
        else
        {
          id v26 = (EARLogger *)(*(uint64_t (**)(uint64_t))(v21 + 16))(v21);
        }
        BOOL v16 = *((unsigned char *)v41 + 24) != 0;
        if (*((unsigned char *)v41 + 24))
        {
          BOOL v27 = EARLogger::QuasarOSLogger(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)BOOL v53 = 138478339;
            std::string::size_type v54 = v13;
            __int16 v55 = 2048;
            int64_t v56 = a4;
            __int16 v57 = 1024;
            LODWORD(v58) = v9;
            _os_log_impl(&dword_1B1A86000, v27, OS_LOG_TYPE_INFO, "Persisted speech profile to path=%{private}@ protectionClass=%ld coordinated=%d", v53, 0x1Cu);
          }
        }
        else
        {
          BOOL v27 = EARLogger::QuasarOSLogger(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            if (a7) {
              id v30 = *a7;
            }
            else {
              id v30 = 0;
            }
            *(_DWORD *)BOOL v53 = 138478595;
            std::string::size_type v54 = v13;
            __int16 v55 = 2114;
            int64_t v56 = (int64_t)v30;
            __int16 v57 = 2048;
            int64_t v58 = a4;
            __int16 v59 = 1024;
            BOOL v60 = v9;
            _os_log_error_impl(&dword_1B1A86000, v27, OS_LOG_TYPE_ERROR, "Persisting speech profile to path=%{private}@ failed with error=%{public}@ protectionClass=%ld coordinated=%d", v53, 0x26u);
          }
        }

        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v34.__r_.__value_.__l.__data_);
        }
      }
      if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v38.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v39.__r_.__value_.__l.__data_);
      }
      _Block_object_dispose(&v40, 8);
    }
    else
    {
      BOOL v16 = 0;
    }
    _Block_object_dispose(buf, 8);
    v50[0] = *MEMORY[0x1E4FBA408];
    uint64_t v28 = *(void *)(MEMORY[0x1E4FBA408] + 72);
    *(void *)((char *)v50 + *(void *)(v50[0] - 24)) = *(void *)(MEMORY[0x1E4FBA408] + 64);
    v50[2] = v28;
    v50[3] = MEMORY[0x1E4FBA470] + 16;
    if (v51 < 0) {
      operator delete((void *)v50[11]);
    }
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x1B3EA8520](&v52);
  }
  else
  {
    long long v15 = EARLogger::QuasarOSLogger(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B1A86000, v15, OS_LOG_TYPE_INFO, "Cannot write profile: path is empty", buf, 2u);
    }

    BOOL v16 = 0;
  }

  return v16;
}

- (void)readUserProfile:(id)a3 reuseProfile:(BOOL)a4
{
  self->_reuseProfile = a4;
  [(_EARUserProfileBuilder *)self readUserProfile:a3];
}

- (void)readUserProfile:(id)a3
{
  unint64_t v4 = (EARHelpers *)a3;
  if (v4)
  {
    std::__tree<std::string>::destroy((uint64_t)&self->_templateToVersion, (char *)self->_templateToVersion.__tree_.__pair1_.__value_.__left_);
    self->_templateToVersion.__tree_.__pair1_.__value_.__left_ = 0;
    self->_templateToVersion.__tree_.__pair3_.__value_ = 0;
    self->_templateToVersion.__tree_.__begin_node_ = &self->_templateToVersion.__tree_.__pair1_;
    std::__tree<std::string>::destroy((uint64_t)&self->_experimentIds, (char *)self->_experimentIds.__tree_.__pair1_.__value_.__left_);
    self->_experimentIds.__tree_.__pair1_.__value_.__left_ = 0;
    self->_experimentIds.__tree_.__pair3_.__value_ = 0;
    self->_experimentIds.__tree_.__begin_node_ = &self->_experimentIds.__tree_.__pair1_;
    EARHelpers::createNSDataInputStream(v4, v5);
  }
}

- (void)readUserProfileWithPath:(id)a3 reuseProfile:(BOOL)a4
{
  self->_reuseProfile = a4;
  [(_EARUserProfileBuilder *)self readUserProfileWithPath:a3];
}

- (void)readUserProfileWithPath:(id)a3
{
  v7[72] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    std::__tree<std::string>::destroy((uint64_t)&self->_templateToVersion, (char *)self->_templateToVersion.__tree_.__pair1_.__value_.__left_);
    self->_templateToVersion.__tree_.__pair1_.__value_.__left_ = 0;
    self->_templateToVersion.__tree_.__pair3_.__value_ = 0;
    self->_templateToVersion.__tree_.__begin_node_ = &self->_templateToVersion.__tree_.__pair1_;
    std::__tree<std::string>::destroy((uint64_t)&self->_experimentIds, (char *)self->_experimentIds.__tree_.__pair1_.__value_.__left_);
    self->_experimentIds.__tree_.__pair1_.__value_.__left_ = 0;
    self->_experimentIds.__tree_.__pair3_.__value_ = 0;
    self->_experimentIds.__tree_.__begin_node_ = &self->_experimentIds.__tree_.__pair1_;
    objc_msgSend(v4, "ear_toString");
    std::ifstream::basic_ifstream(v7);
    if (v6 < 0) {
      operator delete(__p[0]);
    }
    _ZNSt3__115allocate_sharedB8ne180100IN6quasar7LmeDataENS_9allocatorIS2_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_();
  }
}

- (void)addPersonalizationData:(id)a3
{
  id v5 = a3;
  if (self->_personalizationRecipe.__ptr_.__value_)
  {
    if (!self->_tokenizer.__ptr_.__value_)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"EARUserProfileBuilder.mm" lineNumber:922 description:@"Tokenizer is invoked after explicit release!"];
    }
    EARHelpers::QuasarPersonalizedInputFromEARPersonalizedInput(v5, (uint64_t)v18);
    value = self->_personalizationRecipe.__ptr_.__value_;
    std::map<std::string,std::map<std::string,int>>::map[abi:ne180100](v15, v18);
    quasar::PersonalizationRecipe::getPersonalizedData((uint64_t)value, v15, &v16);
    std::__tree<std::__value_type<std::string,std::map<std::string,int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,int>>>>::destroy((uint64_t)v15, (void *)v15[1]);
    uint64_t v7 = v16;
    if (v16 != (long long *)v17)
    {
      p_userData = (uint64_t **)&self->_userData;
      do
      {
        std::pair<std::string const,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>::pair[abi:ne180100](&__p, v7 + 2);
        quasar::LmePackedUserData::addUnpackedEntities(p_userData, (long long *)&__p, v14);
        long long v19 = v14;
        std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v19);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        BOOL v9 = (long long *)*((void *)v7 + 1);
        if (v9)
        {
          do
          {
            uint64_t v10 = v9;
            BOOL v9 = *(long long **)v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            uint64_t v10 = (long long *)*((void *)v7 + 2);
            BOOL v11 = *(void *)v10 == (void)v7;
            uint64_t v7 = v10;
          }
          while (!v11);
        }
        uint64_t v7 = v10;
      }
      while (v10 != (long long *)v17);
    }
    std::__tree<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>>>::destroy((uint64_t)&v16, v17[0]);
    std::__tree<std::__value_type<std::string,std::map<std::string,int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::map<std::string,int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::map<std::string,int>>>>::destroy((uint64_t)v18, v18[1]);
  }
}

- (void)addPersonalizationJsonData:(id)a3
{
  id v5 = a3;
  char v6 = v5;
  if (self->_personalizationRecipe.__ptr_.__value_)
  {
    if (self->_tokenizer.__ptr_.__value_)
    {
      if (!v5) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"EARUserProfileBuilder.mm" lineNumber:939 description:@"Tokenizer is invoked after explicit release!"];

      if (!v6) {
LABEL_6:
      }
        quasar::getInputDataFromJson();
    }
    objc_msgSend(v6, "ear_toString");
    goto LABEL_6;
  }
}

- (void)writeOutUserDataToJson:(id)a3 withConfig:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v13);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 fileSystemRepresentation]);
  memset(v10, 0, sizeof(v10));
  memset(v8, 0, sizeof(v8));
  int v9 = 1065353216;
  quasar::SystemConfig::readJsonFile((uint64_t)v13, (uint64_t)__p, v10, (uint64_t)v8, 0, 0);
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v8);
  *(void *)&v8[0] = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v8);
  if (SHIBYTE(v12) < 0) {
    operator delete(__p[0]);
  }
  quasar::LmePackedUserData::unpacked((quasar::LmePackedUserData *)&self->_userData, (uint64_t)v8);
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v12 = 0;
  }
  quasar::writeUserDataToJsonFile((uint64_t)v13, v8);
}

- (id)pronunciationsForOrthography:(id)a3
{
  id v4 = a3;
  quasar::LmeDataFactoryBase::PronSet::PronSet(v24);
  v22[0] = 0;
  v22[1] = 0;
  uint64_t v23 = 0;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    v20[0] = 0;
    v20[1] = 0;
    uint64_t v21 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(v18, "");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  [(_EARUserProfileBuilder *)self _pronunciationsForOrthography:v20 phoneticOrthography:v18 templateName:__p pronunciations:v24 pronRequest:0 outOrthography:v22];
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  if (v19 < 0) {
    operator delete(v18[0]);
  }
  if (SHIBYTE(v21) < 0) {
    operator delete(v20[0]);
  }
  id v5 = [MEMORY[0x1E4F1CA80] set];
  quasar::Bitmap::~Bitmap((quasar::Bitmap *)v24);
  id v7 = v6 + 1;
  uint64_t v8 = (void *)*v6;
  if ((void *)*v6 != v6 + 1)
  {
    do
    {
      if (*((char *)v8 + 63) < 0)
      {
        int v9 = (void *)v8[5];
        uint64_t v10 = v8[6];
      }
      else
      {
        int v9 = v8 + 5;
        uint64_t v10 = *((unsigned __int8 *)v8 + 63);
      }
      BOOL v11 = objc_msgSend(NSString, "ear_stringWithStringView:", v9, v10);
      [v5 addObject:v11];

      uint64_t v12 = (void *)v8[1];
      if (v12)
      {
        do
        {
          uint64_t v13 = v12;
          uint64_t v12 = (void *)*v12;
        }
        while (v12);
      }
      else
      {
        do
        {
          uint64_t v13 = (void *)v8[2];
          BOOL v14 = *v13 == (void)v8;
          uint64_t v8 = v13;
        }
        while (!v14);
      }
      uint64_t v8 = v13;
    }
    while (v13 != v7);
  }
  if (SHIBYTE(v23) < 0) {
    operator delete(v22[0]);
  }
  std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)v24, (char *)v24[1]);

  return v5;
}

- (void)_pronunciationsForOrthography:(const void *)a3 phoneticOrthography:(const void *)a4 templateName:(const void *)a5 pronunciations:(void *)a6 pronRequest:(int)a7 outOrthography:(void *)a8
{
  std::string::operator=((std::string *)a8, (const std::string *)a3);
  uint64_t v15 = *((unsigned __int8 *)a3 + 23);
  if ((v15 & 0x80u) != 0) {
    uint64_t v15 = *((void *)a3 + 1);
  }
  if (v15)
  {
    v111 = 0;
    v112 = 0;
    unint64_t v113 = 0;
    quasar::Bitmap::~Bitmap((quasar::Bitmap *)a6);
    uint64_t v18 = v16 + 1;
    char v17 = (void *)*v16;
    if ((void *)*v16 != v16 + 1)
    {
      do
      {
        if (*((_DWORD *)v17 + 8) == 1)
        {
          char v19 = (long long *)(v17 + 5);
          long long v20 = v112;
          if ((unint64_t)v112 >= v113)
          {
            long long v22 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v111, v19);
          }
          else
          {
            if (*((char *)v17 + 63) < 0)
            {
              std::string::__init_copy_ctor_external(v112, (const std::string::value_type *)v17[5], v17[6]);
            }
            else
            {
              long long v21 = *v19;
              v112->__r_.__value_.__r.__words[2] = v17[7];
              *(_OWORD *)&v20->__r_.__value_.__l.__data_ = v21;
            }
            long long v22 = v20 + 1;
          }
          v112 = v22;
        }
        uint64_t v23 = (void *)v17[1];
        if (v23)
        {
          do
          {
            uint64_t v24 = v23;
            uint64_t v23 = (void *)*v23;
          }
          while (v23);
        }
        else
        {
          do
          {
            uint64_t v24 = (void *)v17[2];
            BOOL v25 = *v24 == (void)v17;
            char v17 = v24;
          }
          while (!v25);
        }
        char v17 = v24;
      }
      while (v24 != v18);
    }
    if (*((char *)a3 + 23) < 0) {
      std::string::__init_copy_ctor_external(&__str, *(const std::string::value_type **)a3, *((void *)a3 + 1));
    }
    else {
      std::string __str = *(std::string *)a3;
    }
    if (v111 == v112)
    {
      uint64_t v30 = *((unsigned __int8 *)a4 + 23);
      if ((v30 & 0x80u) != 0) {
        uint64_t v30 = *((void *)a4 + 1);
      }
      if (v30)
      {
        std::operator+<char>();
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
        std::string::append(&__str, (const std::string::value_type *)p_p, size);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        std::string::operator=((std::string *)a8, &__str);
      }
    }
    else
    {
      v109.__r_.__value_.__r.__words[0] = (std::string::size_type)"-";
      v109.__r_.__value_.__l.__size_ = 1;
      quasar::join<std::vector<std::string>>((uint64_t *)&v111, (uint64_t *)&v109);
      id v26 = std::string::insert(&v90, 0, "\\\\"");
      long long v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__r.__words[2] = v26->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v27;
      v26->__r_.__value_.__l.__size_ = 0;
      v26->__r_.__value_.__r.__words[2] = 0;
      v26->__r_.__value_.__r.__words[0] = 0;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v28 = &__p;
      }
      else {
        uint64_t v28 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v29 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v29 = __p.__r_.__value_.__l.__size_;
      }
      std::string::append(&__str, (const std::string::value_type *)v28, v29);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v90.__r_.__value_.__l.__data_);
      }
    }
    value = (uint64_t **)self->_outPronCache.__ptr_.__value_;
    if (value)
    {
      quasar::WordPronCache::addTemplateForWord(value, (uint64_t)a5, (uint64_t)&__str, 1);
      quasar::WordPronCache::addTemplateForWord((uint64_t **)self->_outPronCache.__ptr_.__value_, (uint64_t)a5, (uint64_t)a3, 1);
    }
    quasar::LmeDataFactoryBase::PronSet::clear((char **)a6);
    uint64_t v34 = *((unsigned __int8 *)a4 + 23);
    char v35 = v34;
    uint64_t v36 = *((void *)a4 + 1);
    if ((v34 & 0x80u) == 0) {
      uint64_t v37 = *((unsigned __int8 *)a4 + 23);
    }
    else {
      uint64_t v37 = *((void *)a4 + 1);
    }
    if (v37) {
      std::string v38 = (std::string *)a4;
    }
    else {
      std::string v38 = (std::string *)a3;
    }
    if (SHIBYTE(v38->__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&v109, v38->__r_.__value_.__l.__data_, v38->__r_.__value_.__l.__size_);
      uint64_t v34 = *((unsigned __int8 *)a4 + 23);
      uint64_t v36 = *((void *)a4 + 1);
      char v35 = *((unsigned char *)a4 + 23);
    }
    else
    {
      std::string v109 = *v38;
    }
    if (v35 < 0) {
      uint64_t v34 = v36;
    }
    if (v34)
    {
      if (*((char *)a3 + 23) < 0) {
        std::string::__init_copy_ctor_external(&v108, *(const std::string::value_type **)a3, *((void *)a3 + 1));
      }
      else {
        std::string v108 = *(std::string *)a3;
      }
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(&v108, "");
    }
    if (self->_outPronCache.__ptr_.__value_)
    {
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v101, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
      }
      else {
        std::string v101 = __str;
      }
      std::string::basic_string[abi:ne180100]<0>(v99, "");
      quasar::LmeDataFactoryBase::Word::Word(&__p, &v101, v99, 0);
      if (v100 < 0) {
        operator delete(v99[0]);
      }
      if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v101.__r_.__value_.__l.__data_);
      }
      if (quasar::WordPronCache::lookupWord((quasar::WordPronCache *)self->_outPronCache.__ptr_.__value_, (const quasar::LmeDataFactoryBase::Word *)&__p, 1, (char **)a6))
      {
        ++self->_outPronCacheHits;
        quasar::LmeDataFactoryBase::PronSet::toPronChoices((uint64_t)a6, a7, (uint64_t *)&v97);
        quasar::LmeDataFactoryBase::PronSet::PronSet(&v90, &v97);
LABEL_207:
        v73 = (char *)a6 + 8;
        std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)a6, *((char **)a6 + 1));
        std::string::size_type v74 = v90.__r_.__value_.__l.__size_;
        *(void *)a6 = v90.__r_.__value_.__r.__words[0];
        *((void *)a6 + 1) = v74;
        std::string::size_type v75 = v90.__r_.__value_.__r.__words[2];
        *((void *)a6 + 2) = *((void *)&v90.__r_.__value_.__l + 2);
        if (v75)
        {
          *(void *)(v74 + 16) = v73;
          v90.__r_.__value_.__r.__words[0] = (std::string::size_type)&v90.__r_.__value_.__l.__size_;
          *(_OWORD *)&v90.__r_.__value_.__r.__words[1] = 0uLL;
          std::string::size_type v74 = 0;
        }
        else
        {
          *(void *)a6 = v73;
        }
        std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&v90, (char *)v74);
        v114 = &v97;
        std::vector<quasar::PronChoice>::__destroy_vector::operator()[abi:ne180100]((void ***)&v114);
        std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&v106, v107);
        if (v105 < 0) {
          operator delete(v103);
        }
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        goto LABEL_214;
      }
      std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&v106, v107);
      if (v105 < 0) {
        operator delete(v103);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    if (self->_quasarLmeData.__ptr_)
    {
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v96, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
      }
      else {
        std::string v96 = __str;
      }
      std::string::basic_string[abi:ne180100]<0>(v94, "");
      quasar::LmeDataFactoryBase::Word::Word(&__p, &v96, v94, 0);
      if (v95 < 0) {
        operator delete(v94[0]);
      }
      if (SHIBYTE(v96.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v96.__r_.__value_.__l.__data_);
      }
      if (quasar::LmeData::lookupWordPronCache((quasar::LmeData *)self->_quasarLmeData.__ptr_, (const quasar::LmeDataFactoryBase::Word *)&__p, 1, (char **)a6))
      {
        if (a7 != 3) {
          goto LABEL_206;
        }
        std::string v39 = self->_outPronCache.__ptr_.__value_;
        if (!v39) {
          goto LABEL_206;
        }
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&v89, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
        }
        else {
          std::string v89 = __str;
        }
        std::string::basic_string[abi:ne180100]<0>(v87, "");
        quasar::LmeDataFactoryBase::Word::Word(&v90, &v89, v87, 1, a6);
        quasar::WordPronCache::addWord((quasar::WordPronCache *)v39, &v90, 1);
        std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)v93, v93[1]);
        if (v92 < 0) {
          operator delete(v91);
        }
        if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v90.__r_.__value_.__l.__data_);
        }
        if (v88 < 0) {
          operator delete(v87[0]);
        }
        if (SHIBYTE(v89.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v89.__r_.__value_.__l.__data_);
        }
        uint64_t v59 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v60 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v60 = __str.__r_.__value_.__l.__size_;
        }
        uint64_t v61 = *((unsigned __int8 *)a3 + 23);
        int v62 = (char)v61;
        std::string::size_type v63 = *((void *)a3 + 1);
        if ((v61 & 0x80u) != 0) {
          uint64_t v61 = *((void *)a3 + 1);
        }
        if (v60 != v61) {
          goto LABEL_198;
        }
        if (v62 >= 0) {
          std::string::size_type v64 = (unsigned __int8 *)a3;
        }
        else {
          std::string::size_type v64 = *(unsigned __int8 **)a3;
        }
        if ((*((unsigned char *)&__str.__r_.__value_.__s + 23) & 0x80) != 0)
        {
          if (memcmp(__str.__r_.__value_.__l.__data_, v64, __str.__r_.__value_.__l.__size_))
          {
LABEL_198:
            id v72 = self->_outPronCache.__ptr_.__value_;
            if (v62 < 0) {
              std::string::__init_copy_ctor_external(&v86, *(const std::string::value_type **)a3, v63);
            }
            else {
              std::string v86 = *(std::string *)a3;
            }
            std::string::basic_string[abi:ne180100]<0>(v84, "");
            quasar::LmeDataFactoryBase::Word::Word(&v90, &v86, v84, 1, a6);
            quasar::WordPronCache::addWord((quasar::WordPronCache *)v72, &v90, 1);
            quasar::LmeDataFactoryBase::Word::~Word((quasar::LmeDataFactoryBase::Word *)&v90);
            if (v85 < 0) {
              operator delete(v84[0]);
            }
            if (SHIBYTE(v86.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v86.__r_.__value_.__l.__data_);
            }
          }
        }
        else if (*((unsigned char *)&__str.__r_.__value_.__s + 23))
        {
          p_str = &__str;
          while (p_str->__r_.__value_.__s.__data_[0] == *v64)
          {
            p_str = (std::string *)((char *)p_str + 1);
            ++v64;
            if (!--v59) {
              goto LABEL_205;
            }
          }
          goto LABEL_198;
        }
LABEL_205:
        ++self->_outPronCacheHits;
LABEL_206:
        quasar::LmeDataFactoryBase::PronSet::toPronChoices((uint64_t)a6, a7, (uint64_t *)&v97);
        quasar::LmeDataFactoryBase::PronSet::PronSet(&v90, &v97);
        goto LABEL_207;
      }
      std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&v106, v107);
      if (v105 < 0) {
        operator delete(v103);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    if (!self->_tokenizer.__ptr_.__value_)
    {
      std::string v76 = [MEMORY[0x1E4F28B00] currentHandler];
      [v76 handleFailureInMethod:a2 object:self file:@"EARUserProfileBuilder.mm" lineNumber:1070 description:@"Tokenizer is invoked after explicit release!"];
    }
    if (v111 == v112)
    {
      quasar::getPronunciationsFromOrthography((uint64_t)&v109, (uint64_t)&self->_sanitizer, (uint64_t)self->_tokenizer.__ptr_.__value_, self->_g2p.__ptr_.__value_, a7, (quasar::LmeDataFactoryBase::PronSet *)&__p);
      char v43 = (char *)a6 + 8;
      std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)a6, *((char **)a6 + 1));
      std::string::size_type v44 = __p.__r_.__value_.__l.__size_;
      *(void *)a6 = __p.__r_.__value_.__r.__words[0];
      *((void *)a6 + 1) = v44;
      std::string::size_type v45 = __p.__r_.__value_.__r.__words[2];
      *((void *)a6 + 2) = *((void *)&__p.__r_.__value_.__l + 2);
      if (v45)
      {
        *(void *)(v44 + 16) = v43;
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p.__r_.__value_.__l.__size_;
        *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = 0uLL;
        std::string::size_type v44 = 0;
      }
      else
      {
        *(void *)a6 = v43;
      }
      std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&__p, (char *)v44);
      if (!a7) {
        goto LABEL_185;
      }
      uint64_t v47 = HIBYTE(v108.__r_.__value_.__r.__words[2]);
      if ((v108.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v48 = HIBYTE(v108.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v48 = v108.__r_.__value_.__l.__size_;
      }
      if (v48)
      {
        std::string::size_type v49 = HIBYTE(v109.__r_.__value_.__r.__words[2]);
        if ((v109.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          std::string::size_type v49 = v109.__r_.__value_.__l.__size_;
        }
        if (v48 == v49)
        {
          if ((v109.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            uint64_t v50 = &v109;
          }
          else {
            uint64_t v50 = (std::string *)v109.__r_.__value_.__r.__words[0];
          }
          if ((*((unsigned char *)&v108.__r_.__value_.__s + 23) & 0x80) != 0)
          {
            if (!memcmp(v108.__r_.__value_.__l.__data_, v50, v108.__r_.__value_.__l.__size_)) {
              goto LABEL_103;
            }
          }
          else
          {
            if (!*((unsigned char *)&v108.__r_.__value_.__s + 23)) {
              goto LABEL_103;
            }
            char v51 = &v108;
            while (v51->__r_.__value_.__s.__data_[0] == v50->__r_.__value_.__s.__data_[0])
            {
              char v51 = (std::string *)((char *)v51 + 1);
              uint64_t v50 = (std::string *)((char *)v50 + 1);
              if (!--v47) {
                goto LABEL_103;
              }
            }
          }
        }
        quasar::getPronunciationsFromOrthography((uint64_t)&v108, (uint64_t)&self->_sanitizer, (uint64_t)self->_tokenizer.__ptr_.__value_, self->_g2p.__ptr_.__value_, 1, (quasar::LmeDataFactoryBase::PronSet *)&v90);
        quasar::LmeDataFactoryBase::PronSet::toPronChoices((uint64_t)&v90, 1, (uint64_t *)&v97);
        p_data = (void **)&v97->__r_.__value_.__l.__data_;
        v70 = (void **)&v98->__r_.__value_.__l.__data_;
        if (v97 != v98)
        {
          do
          {
            quasar::PronChoice::PronChoice(&__p, (uint64_t)p_data);
            if (LODWORD(__p.__r_.__value_.__l.__data_) == 4) {
              quasar::LmeDataFactoryBase::PronSet::insert((uint64_t **)a6, 4, (uint64_t)&__p.__r_.__value_.__l.__size_, v104);
            }
            if (SHIBYTE(v103) < 0) {
              operator delete((void *)__p.__r_.__value_.__l.__size_);
            }
            p_data += 5;
          }
          while (p_data != v70);
        }
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v97;
        std::vector<quasar::PronChoice>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
        std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&v90, (char *)v90.__r_.__value_.__l.__size_);
      }
    }
    else
    {
      (*(void (**)(std::string *__return_ptr))(*(void *)self->_g2p.__ptr_.__value_ + 32))(&v90);
      quasar::LmeDataFactoryBase::PronSet::PronSet(&__p, &v90);
      uint64_t v40 = (char *)a6 + 8;
      std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)a6, *((char **)a6 + 1));
      std::string::size_type v41 = __p.__r_.__value_.__l.__size_;
      *(void *)a6 = __p.__r_.__value_.__r.__words[0];
      *((void *)a6 + 1) = v41;
      std::string::size_type v42 = __p.__r_.__value_.__r.__words[2];
      *((void *)a6 + 2) = *((void *)&__p.__r_.__value_.__l + 2);
      if (v42)
      {
        *(void *)(v41 + 16) = v40;
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p.__r_.__value_.__l.__size_;
        *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = 0uLL;
        std::string::size_type v41 = 0;
      }
      else
      {
        *(void *)a6 = v40;
      }
      std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&__p, (char *)v41);
      long long v97 = &v90;
      std::vector<quasar::PronChoice>::__destroy_vector::operator()[abi:ne180100]((void ***)&v97);
    }
LABEL_103:
    if (a7 != 3) {
      goto LABEL_185;
    }
    uint64_t v46 = self->_outPronCache.__ptr_.__value_;
    if (!v46) {
      goto LABEL_185;
    }
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v83, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
    }
    else {
      std::string v83 = __str;
    }
    std::string::basic_string[abi:ne180100]<0>(v81, "");
    quasar::LmeDataFactoryBase::Word::Word(&__p, &v83, v81, 1, a6);
    quasar::WordPronCache::addWord((quasar::WordPronCache *)v46, &__p, 1);
    std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&v106, v107);
    if (v105 < 0) {
      operator delete(v103);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v82 < 0) {
      operator delete(v81[0]);
    }
    if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v83.__r_.__value_.__l.__data_);
    }
    uint64_t v52 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v53 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v53 = __str.__r_.__value_.__l.__size_;
    }
    uint64_t v54 = *((unsigned __int8 *)a3 + 23);
    int v55 = (char)v54;
    std::string::size_type v56 = *((void *)a3 + 1);
    if ((v54 & 0x80u) != 0) {
      uint64_t v54 = *((void *)a3 + 1);
    }
    if (v53 == v54)
    {
      if (v55 >= 0) {
        __int16 v57 = (unsigned __int8 *)a3;
      }
      else {
        __int16 v57 = *(unsigned __int8 **)a3;
      }
      if ((*((unsigned char *)&__str.__r_.__value_.__s + 23) & 0x80) == 0)
      {
        if (*((unsigned char *)&__str.__r_.__value_.__s + 23))
        {
          int64_t v58 = &__str;
          while (v58->__r_.__value_.__s.__data_[0] == *v57)
          {
            int64_t v58 = (std::string *)((char *)v58 + 1);
            ++v57;
            if (!--v52) {
              goto LABEL_185;
            }
          }
          goto LABEL_174;
        }
LABEL_185:
        ++self->_outPronCacheMisses;
        quasar::LmeDataFactoryBase::PronSet::toPronChoices((uint64_t)a6, a7, (uint64_t *)&v90);
        quasar::LmeDataFactoryBase::PronSet::PronSet(&__p, &v90);
        std::string::size_type v67 = (char *)a6 + 8;
        std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)a6, *((char **)a6 + 1));
        std::string::size_type v68 = __p.__r_.__value_.__l.__size_;
        *(void *)a6 = __p.__r_.__value_.__r.__words[0];
        *((void *)a6 + 1) = v68;
        std::string::size_type v69 = __p.__r_.__value_.__r.__words[2];
        *((void *)a6 + 2) = *((void *)&__p.__r_.__value_.__l + 2);
        if (v69)
        {
          *(void *)(v68 + 16) = v67;
          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p.__r_.__value_.__l.__size_;
          *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = 0uLL;
          std::string::size_type v68 = 0;
        }
        else
        {
          *(void *)a6 = v67;
        }
        std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&__p, (char *)v68);
        long long v97 = &v90;
        std::vector<quasar::PronChoice>::__destroy_vector::operator()[abi:ne180100]((void ***)&v97);
LABEL_214:
        if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v108.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v109.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v109.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__str.__r_.__value_.__l.__data_);
        }
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v111;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
        return;
      }
      if (!memcmp(__str.__r_.__value_.__l.__data_, v57, __str.__r_.__value_.__l.__size_)) {
        goto LABEL_185;
      }
    }
LABEL_174:
    v66 = self->_outPronCache.__ptr_.__value_;
    if (v55 < 0) {
      std::string::__init_copy_ctor_external(&v80, *(const std::string::value_type **)a3, v56);
    }
    else {
      std::string v80 = *(std::string *)a3;
    }
    std::string::basic_string[abi:ne180100]<0>(v78, "");
    quasar::LmeDataFactoryBase::Word::Word(&__p, &v80, v78, 1, a6);
    quasar::WordPronCache::addWord((quasar::WordPronCache *)v66, &__p, 1);
    std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&v106, v107);
    if (v105 < 0) {
      operator delete(v103);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v79 < 0) {
      operator delete(v78[0]);
    }
    if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v80.__r_.__value_.__l.__data_);
    }
    goto LABEL_185;
  }
}

- (void)_embeddingsForOrthography:(const void *)a3 templateName:(const void *)a4 embeddings:(void *)a5 pronRequest:(int)a6
{
  uint64_t v6 = *((unsigned __int8 *)a3 + 23);
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v6) {
    quasar::TextSanitizer::sanitize((uint64_t)&self->_sanitizer, (uint64_t)a3);
  }
}

- (id)sanitizedStringWithString:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  v12[0] = 0;
  v12[1] = 0;
  uint64_t v13 = 0;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    std::string __p = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  quasar::TextSanitizer::sanitize((uint64_t)&self->_sanitizer, (uint64_t)&__p);
  if (SHIBYTE(v11) < 0) {
    operator delete(__p);
  }
  if (v13 >= 0) {
    uint64_t v6 = v12;
  }
  else {
    uint64_t v6 = (void **)v12[0];
  }
  id v7 = objc_msgSend(NSString, "stringWithUTF8String:", v6, __p, v10, v11);
  if (SHIBYTE(v13) < 0) {
    operator delete(v12[0]);
  }

  return v7;
}

- (void)signalEndOfUserData
{
  value = self->_tokenizer.__ptr_.__value_;
  self->_tokenizer.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (void)createInlineLmeUserDataForContextStrings:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(_EARUserProfileBuilder *)self removeAllWords];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * v7);
        int v9 = [_EARWordPart alloc];
        uint64_t v10 = [MEMORY[0x1E4F1CAD0] set];
        uint64_t v11 = [(_EARWordPart *)v9 initWithOrthography:v8 pronunciations:v10 tag:7];

        char v19 = v11;
        uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
        uint64_t v13 = [NSString stringWithUTF8String:"\\NT-inline"];
        [(_EARUserProfileBuilder *)self addWordWithParts:v12 templateName:v13];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v5);
  }
}

- (id)createInlineLmeUserDataForContextData:(id)a3 speechProfile:(id)a4
{
  id v43 = a3;
  id v42 = a4;
  char v85 = 0;
  uint64_t v86 = 0;
  unint64_t v84 = (uint64_t *)&v85;
  if (self->_g2emb.__ptr_.__value_) {
    operator new();
  }
  if (!v43)
  {
    uint64_t v6 = 0;
    __p[0] = 0;
    __p[1] = 0;
    *(void *)&long long v46 = 0;
    goto LABEL_11;
  }
  [v43 getWords];
  uint64_t v6 = (void **)__p[0];
  if (__p[0] != &__p[1])
  {
    while (1)
    {
LABEL_11:
      if (!self->_tokenizer.__ptr_.__value_)
      {
        id v32 = [MEMORY[0x1E4F28B00] currentHandler];
        [v32 handleFailureInMethod:a2 object:self file:@"EARUserProfileBuilder.mm" lineNumber:1207 description:@"Tokenizer is invoked after explicit release!"];
      }
      quasar::LmeDataFactory::getNameEnumeratorFromAceCategory((uint64_t)self->_dataFactory.__ptr_, (uint64_t)(v6 + 4), &v75);
      uint64_t v10 = (uint64_t *)v6[7];
      int v9 = (uint64_t *)v6[8];
      std::string::size_type v44 = v9;
LABEL_14:
      if (v10 != v9) {
        break;
      }
      if (v76[0]) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v76[0]);
      }
      std::string::size_type v29 = (void **)v6[1];
      if (v29)
      {
        do
        {
          uint64_t v30 = v29;
          std::string::size_type v29 = (void **)*v29;
        }
        while (v29);
      }
      else
      {
        do
        {
          uint64_t v30 = (void **)v6[2];
          BOOL v31 = *v30 == v6;
          uint64_t v6 = v30;
        }
        while (!v31);
      }
      uint64_t v6 = v30;
      if (v30 == &__p[1]) {
        goto LABEL_5;
      }
    }
    unint64_t v78 = 0;
    uint64_t v77 = 0;
    v79[0] = 0;
    memset(v66, 0, 24);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    while (1)
    {
      if (v11 == v12)
      {
        if (v75) {
          (*((void (**)(char **, uint64_t *))*v75 + 4))(v75, &v77);
        }
        long long v72 = 0uLL;
        *(void *)&long long v73 = 0;
        uint64_t v21 = v77;
        unint64_t v22 = v78;
        while (v21 != v22)
        {
          quasar::getPronunciationsFromOrthography(v21, (uint64_t)&self->_sanitizer, (uint64_t)self->_tokenizer.__ptr_.__value_, self->_g2p.__ptr_.__value_, 3, (quasar::LmeDataFactoryBase::PronSet *)&v82);
          if (quasar::LmeDataFactoryBase::PronSet::size((quasar::LmeDataFactoryBase::PronSet *)&v82))
          {
            uint64_t v23 = *((void *)&v72 + 1);
            if (*((void *)&v72 + 1) >= (unint64_t)v73)
            {
              uint64_t v24 = std::vector<quasar::LmeDataFactoryBase::Word>::__emplace_back_slow_path<std::string &,std::string &,int &,quasar::LmeDataFactoryBase::PronSet &>((uint64_t *)&v72, v21, v21 + 24, (unsigned int *)(v21 + 48), (uint64_t)&v82);
            }
            else
            {
              std::allocator<quasar::LmeDataFactoryBase::Word>::construct[abi:ne180100]<quasar::LmeDataFactoryBase::Word,std::string &,std::string &,int &,quasar::LmeDataFactoryBase::PronSet &>((uint64_t)&v73, *((uint64_t *)&v72 + 1), v21, v21 + 24, (unsigned int *)(v21 + 48), (uint64_t)&v82);
              uint64_t v24 = v23 + 80;
            }
            *((void *)&v72 + 1) = v24;
          }
          std::__tree<std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::__map_value_compare<std::pair<quasar::PronType,std::string>,std::__value_type<std::pair<quasar::PronType,std::string>,float>,std::less<std::pair<quasar::PronType,std::string>>,true>,std::allocator<std::__value_type<std::pair<quasar::PronType,std::string>,float>>>::destroy((uint64_t)&v82, v83[0]);
          v21 += 80;
        }
        long long v87 = (long long *)(v6 + 4);
        BOOL v25 = std::__tree<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(&v84, (const void **)v6 + 4, (uint64_t)&std::piecewise_construct, &v87);
        id v26 = v25 + 7;
        unint64_t v27 = v25[8];
        if (v27 >= v25[9])
        {
          uint64_t v28 = std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>::__push_back_slow_path<std::vector<quasar::LmeDataFactoryBase::Word> const&>(v26, (long long **)&v72);
        }
        else
        {
          std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>::__construct_one_at_end[abi:ne180100]<std::vector<quasar::LmeDataFactoryBase::Word> const&>((uint64_t)v26, (long long **)&v72);
          uint64_t v28 = v27 + 24;
        }
        v25[8] = v28;
        char v82 = (char **)&v72;
        std::vector<quasar::LmeDataFactoryBase::Word>::__destroy_vector::operator()[abi:ne180100]((void ***)&v82);
        if ((v66[23] & 0x80000000) != 0) {
          operator delete(*(void **)v66);
        }
        *(void *)v66 = &v77;
        std::vector<quasar::LmeDataFactoryBase::Word>::__destroy_vector::operator()[abi:ne180100]((void ***)v66);
        v10 += 3;
        int v9 = v44;
        goto LABEL_14;
      }
      if (*(char *)(v11 + 23) < 0)
      {
        uint64_t v13 = *(void *)(v11 + 8);
        if (!v13) {
          goto LABEL_37;
        }
        BOOL v14 = *(char **)v11;
      }
      else
      {
        uint64_t v13 = *(unsigned __int8 *)(v11 + 23);
        if (!*(unsigned char *)(v11 + 23)) {
          goto LABEL_37;
        }
        BOOL v14 = (char *)v11;
      }
      if (&v14[v13] == utf8::find_invalid<std::__wrap_iter<char const*>>(v14, &v14[v13]))
      {
        unint64_t v15 = v78;
        if (v78 >= v79[0])
        {
          uint64_t v16 = std::vector<quasar::LmeDataFactoryBase::Word>::__emplace_back_slow_path<std::string const&,std::string const&,int const&>(&v77, v11, v11 + 24, (unsigned int *)(v11 + 48));
        }
        else
        {
          std::allocator<quasar::LmeDataFactoryBase::Word>::construct[abi:ne180100]<quasar::LmeDataFactoryBase::Word,std::string const&,std::string const&,int const&>((uint64_t)v79, v78, v11, v11 + 24, (unsigned int *)(v11 + 48));
          uint64_t v16 = v15 + 80;
        }
        unint64_t v78 = v16;
        uint64_t v17 = v66[23];
        if (v66[23] < 0) {
          uint64_t v17 = *(void *)&v66[8];
        }
        if (v17) {
          std::string::append((std::string *)v66, " ");
        }
        int v18 = *(char *)(v11 + 23);
        if (v18 >= 0) {
          char v19 = (const std::string::value_type *)v11;
        }
        else {
          char v19 = *(const std::string::value_type **)v11;
        }
        if (v18 >= 0) {
          std::string::size_type v20 = *(unsigned __int8 *)(v11 + 23);
        }
        else {
          std::string::size_type v20 = *(void *)(v11 + 8);
        }
        std::string::append((std::string *)v66, v19, v20);
      }
LABEL_37:
      v11 += 80;
    }
  }
LABEL_5:
  std::__tree<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>>>::destroy((uint64_t)__p, (void *)__p[1]);
  if (v86)
  {
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v77);
    v83[0] = 0;
    v83[1] = 0;
    char v82 = v83;
    v76[1] = 0;
    v76[0] = 0;
    std::string::size_type v75 = v76;
    long long v72 = 0u;
    long long v73 = 0u;
    int v74 = 1065353216;
    ptr = self->_dataFactory.__ptr_;
    uint64_t v70 = 0;
    v71 = 0;
    (*(void (**)(LmeDataFactory *, uint64_t *))(*(void *)ptr + 48))(ptr, &v70);
    if (v71) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v71);
    }
    memset(v66, 0, sizeof(v66));
    memset(v68, 0, sizeof(v68));
    int v67 = 1065353216;
    int v69 = 1065353216;
    if (v43)
    {
      uint64_t v8 = v43;
      [v43 getTemplateToAverageCost];
    }
    else
    {
      *(void *)&long long v47 = 0;
      *(_OWORD *)std::string __p = 0uLL;
      long long v46 = 0uLL;
      uint64_t v8 = 0;
    }
    std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__move_assign((uint64_t)v68, (uint64_t *)__p);
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)__p);
    if (v8)
    {
      [v8 getTemplateToDeviationCost];
    }
    else
    {
      *(void *)&long long v47 = 0;
      *(_OWORD *)std::string __p = 0u;
      long long v46 = 0u;
    }
    std::__hash_table<std::__hash_value_type<std::string,double>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,double>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,double>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,double>>>::__move_assign((uint64_t)v66, (uint64_t *)__p);
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)__p);
    uint64_t v34 = self->_dataFactory.__ptr_;
    LODWORD(__p[0]) = 1;
    std::string::size_type v64 = 0;
    uint64_t v65 = 0;
    uint64_t v62 = 0;
    uint64_t v63 = 0;
    int v35 = (*(uint64_t (**)(LmeDataFactory *, uint64_t **, void, void **, unsigned char *, uint64_t *, char ***, char ***, long long *, uint64_t *, uint64_t *, void, uint64_t *))(*(void *)v34 + 56))(v34, &v84, 0, __p, v66, &v77, &v82, &v75, &v72, &v65, &v63, 0, &v62);
    uint64_t v36 = v62;
    uint64_t v62 = 0;
    if (v36) {
      (*(void (**)(uint64_t))(*(void *)v36 + 8))(v36);
    }
    if (v64) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v64);
    }
    uint64_t v37 = v65;
    uint64_t v65 = 0;
    if (v37) {
      (*(void (**)(uint64_t))(*(void *)v37 + 8))(v37);
    }
    if (v35)
    {
      if (quasar::gLogLevel >= 4)
      {
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        *(_OWORD *)std::string __p = 0u;
        kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)__p);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, (uint64_t)"Could not get LME data", 22);
        std::ostream::operator<<();
        quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)__p);
      }
      v33 = 0;
    }
    else
    {
      std::stringbuf::str();
      if ((SBYTE7(v46) & 0x80u) == 0) {
        std::string v38 = __p;
      }
      else {
        std::string v38 = (void **)__p[0];
      }
      if ((SBYTE7(v46) & 0x80u) == 0) {
        std::string v39 = (void *)BYTE7(v46);
      }
      else {
        std::string v39 = __p[1];
      }
      v33 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v38 length:v39];
      if (SBYTE7(v46) < 0) {
        operator delete(__p[0]);
      }
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v68);
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v66);
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&v72);
    std::__tree<std::string>::destroy((uint64_t)&v75, v76[0]);
    std::__tree<std::string>::destroy((uint64_t)&v82, v83[0]);
    uint64_t v77 = *MEMORY[0x1E4FBA418];
    *(uint64_t *)((char *)&v77 + *(void *)(v77 - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
    unint64_t v78 = MEMORY[0x1E4FBA470] + 16;
    if (v80 < 0) {
      operator delete((void *)v79[7]);
    }
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x1B3EA8520](&v81);
  }
  else
  {
    v33 = 0;
  }
  std::__tree<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>>>::destroy((uint64_t)&v84, v85);

  return v33;
}

- (_EARPeopleSuggesterConfig)peopleSuggesterConfig
{
  ptr = self->_dataFactory.__ptr_;
  v3 = [[_EARPeopleSuggesterConfig alloc] initWithContactsCount:*((unsigned int *)ptr + 546) bestContactsCount:*((unsigned int *)ptr + 547) bestContactsBonus:*((unsigned int *)ptr + 548)];
  return v3;
}

- (void)_logSpeechProfileUpdatedEventWithLmeData:(shared_ptr<quasar:(int)a4 :()map<std:()int :()std:(std:(int>>> *)a5 :allocator<std::pair<const)std::string :less<std::string> string LmeData>)a3 sizeInBytes:numEnumeratedEntries:
{
  if (SLODWORD(a3.__cntrl_) < 1) {
    return;
  }
  ptr = a3.__ptr_;
  if (!*(void *)a3.__ptr_) {
    return;
  }
  uint64_t v6 = *(void *)&a4;
  cntrl = a3.__cntrl_;
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  int v9 = [NSNumber numberWithInt:cntrl];
  [v8 setObject:v9 forKeyedSubscript:@"sizeInBytes"];

  uint64_t v10 = *(void *)ptr;
  if (*(char *)(*(void *)ptr + 343) < 0)
  {
    uint64_t v11 = *(void *)(v10 + 320);
    uint64_t v12 = *(void *)(v10 + 328);
  }
  else
  {
    uint64_t v11 = v10 + 320;
    uint64_t v12 = *(unsigned __int8 *)(*(void *)ptr + 343);
  }
  uint64_t v13 = objc_msgSend(NSString, "ear_stringWithStringView:", v11, v12);
  [v8 setObject:v13 forKeyedSubscript:@"language"];

  BOOL v14 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)ptr + 8)];
  [v8 setObject:v14 forKeyedSubscript:@"formatVersion"];

  unint64_t v15 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)ptr + 264)];
  [v8 setObject:v15 forKeyedSubscript:@"g2pModelVersion"];

  uint64_t v16 = [NSNumber numberWithUnsignedLong:*(void *)(*(void *)ptr + 56)];
  [v8 setObject:v16 forKeyedSubscript:@"pronunciationCacheSize"];

  uint64_t v17 = [MEMORY[0x1E4F28F80] processInfo];
  int v18 = [v17 processName];
  [v8 setObject:v18 forKeyedSubscript:@"process"];

  char v19 = [NSNumber numberWithUnsignedLong:*(void *)(v6 + 16)];
  [v8 setObject:v19 forKeyedSubscript:@"numLmeSlotsUpdated"];

  uint64_t v21 = *(quasar::QsrTextSymbolTable **)(*(void *)ptr + 224);
  std::string::size_type v20 = *(std::__shared_weak_count **)(*(void *)ptr + 232);
  if (v20)
  {
    atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    if (v21)
    {
      uint64_t v21 = *(quasar::QsrTextSymbolTable **)(*(void *)ptr + 224);
      unint64_t v22 = *(std::__shared_weak_count **)(*(void *)ptr + 232);
      uint64_t v23 = NSNumber;
      if (v22)
      {
        char v24 = 0;
        atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
        goto LABEL_13;
      }
LABEL_12:
      char v24 = 1;
LABEL_13:
      BOOL v25 = [v23 numberWithUnsignedLong:quasar::QsrTextSymbolTable::NumSymbols(v21)];
      [v8 setObject:v25 forKeyedSubscript:@"totalEntityCount"];

      if ((v24 & 1) == 0) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v22);
      }
    }
  }
  else if (v21)
  {
    unint64_t v22 = 0;
    uint64_t v23 = NSNumber;
    goto LABEL_12;
  }
  uint64_t v34 = MEMORY[0x1E4F143A8];
  uint64_t v35 = 3221225472;
  uint64_t v36 = __100___EARUserProfileBuilder__logSpeechProfileUpdatedEventWithLmeData_sizeInBytes_numEnumeratedEntries___block_invoke;
  uint64_t v37 = &unk_1E5FFE210;
  id v26 = v8;
  id v38 = v26;
  AnalyticsSendEventLazy();
  if (quasar::gLogLevel >= 4)
  {
    memset(v33, 0, sizeof(v33));
    kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)v33);
    unint64_t v27 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, (uint64_t)"Wrote ", 6);
    objc_msgSend(@"com.apple.siri.embeddedspeech.SpeechProfileUpdated", "ear_toString");
    if ((v32 & 0x80u) == 0) {
      uint64_t v28 = __p;
    }
    else {
      uint64_t v28 = (void **)__p[0];
    }
    if ((v32 & 0x80u) == 0) {
      uint64_t v29 = v32;
    }
    else {
      uint64_t v29 = (uint64_t)__p[1];
    }
    uint64_t v30 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)v28, v29);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v30, (uint64_t)" event to CoreAnalytics.", 24);
    if ((char)v32 < 0) {
      operator delete(__p[0]);
    }
    quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)v33);
  }
}

- (void)_logLmeSlotUpdatedEventsWithLanguage:()basic_string<char numEnumeratedEntries:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  char v24 = v3;
  id v4 = v3 + 1;
  uint64_t v5 = (void *)*v3;
  if ((void *)*v3 != v3 + 1)
  {
    do
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (*((char *)v5 + 55) < 0)
      {
        uint64_t v8 = (void *)v5[4];
        uint64_t v9 = v5[5];
      }
      else
      {
        uint64_t v8 = v5 + 4;
        uint64_t v9 = *((unsigned __int8 *)v5 + 55);
      }
      uint64_t v10 = objc_msgSend(NSString, "ear_stringWithStringView:", v8, v9, v24);
      [v7 setObject:v10 forKeyedSubscript:@"lmeSlot"];

      uint64_t v11 = [NSNumber numberWithInt:*((unsigned int *)v5 + 14)];
      [v7 setObject:v11 forKeyedSubscript:@"entityCount"];

      data = a3;
      if (*((char *)&a3->__r_.__value_.var0.var1 + 23) < 0) {
        data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a3->__r_.__value_.var0.var1.__data_;
      }
      uint64_t v13 = [NSString stringWithUTF8String:data];
      [v7 setObject:v13 forKeyedSubscript:@"language"];

      BOOL v14 = [MEMORY[0x1E4F28F80] processInfo];
      unint64_t v15 = [v14 processName];
      [v7 setObject:v15 forKeyedSubscript:@"process"];

      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      uint64_t v30 = __84___EARUserProfileBuilder__logLmeSlotUpdatedEventsWithLanguage_numEnumeratedEntries___block_invoke;
      BOOL v31 = &unk_1E5FFE210;
      id v32 = v7;
      AnalyticsSendEventLazy();

      uint64_t v16 = (void *)v5[1];
      if (v16)
      {
        do
        {
          uint64_t v17 = v16;
          uint64_t v16 = (void *)*v16;
        }
        while (v16);
      }
      else
      {
        do
        {
          uint64_t v17 = (void *)v5[2];
          BOOL v18 = *v17 == (void)v5;
          uint64_t v5 = v17;
        }
        while (!v18);
      }
      uint64_t v5 = v17;
    }
    while (v17 != v4);
  }
  if (quasar::gLogLevel > 3)
  {
    memset(v27, 0, sizeof(v27));
    kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)v27);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"Wrote ", 6);
    char v19 = (void *)std::ostream::operator<<();
    std::string::size_type v20 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)" ", 1);
    objc_msgSend(@"com.apple.siri.embeddedspeech.SpeechProfileLmeSlotUpdated", "ear_toString");
    if ((v26 & 0x80u) == 0) {
      uint64_t v21 = __p;
    }
    else {
      uint64_t v21 = (void **)__p[0];
    }
    if ((v26 & 0x80u) == 0) {
      uint64_t v22 = v26;
    }
    else {
      uint64_t v22 = (uint64_t)__p[1];
    }
    uint64_t v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)v21, v22);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)" events to CoreAnalytics.", 25);
    if ((char)v26 < 0) {
      operator delete(__p[0]);
    }
    quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)v27);
  }
}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  std::__tree<std::string>::destroy((uint64_t)&self->_experimentIds, (char *)self->_experimentIds.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::string>::destroy((uint64_t)&self->_templateToVersion, (char *)self->_templateToVersion.__tree_.__pair1_.__value_.__left_);
  value = self->_outEmbeddingCache.__ptr_.__value_;
  self->_outEmbeddingCache.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(WordPronCache *))(*(void *)value + 8))(value);
  }
  cntrl = self->_embeddingCache.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  std::__tree<std::vector<std::string>,quasar::NameEnumerator::EnumComparator,std::allocator<std::vector<std::string>>>::destroy((uint64_t)&self->_contactEnumSet, (char *)self->_contactEnumSet.__tree_.__pair1_.__value_.__left_);
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&self->_quasarTemplate2Count);
  uint64_t v5 = self->_outPronCache.__ptr_.__value_;
  self->_outPronCache.__ptr_.__value_ = 0;
  if (v5) {
    (*(void (**)(WordPronCache *))(*(void *)v5 + 8))(v5);
  }
  uint64_t v6 = self->_quasarLmeData.__cntrl_;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v6);
  }
  id v7 = self->_personalizationRecipe.__ptr_.__value_;
  self->_personalizationRecipe.__ptr_.__value_ = 0;
  if (v7) {
    std::default_delete<quasar::PersonalizationRecipe>::operator()[abi:ne180100]((uint64_t)&self->_personalizationRecipe, (uint64_t)v7);
  }
  quasar::BasicTextSanitizer::~BasicTextSanitizer((quasar::BasicTextSanitizer *)&self->_sanitizer);
  uint64_t v8 = self->_pronCache.__cntrl_;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v8);
  }
  uint64_t v9 = self->_g2emb.__ptr_.__value_;
  self->_g2emb.__ptr_.__value_ = 0;
  if (v9) {
    (*(void (**)(G2Embedding *))(*(void *)v9 + 8))(v9);
  }
  uint64_t v10 = self->_g2p.__ptr_.__value_;
  self->_g2p.__ptr_.__value_ = 0;
  if (v10) {
    (*(void (**)(G2P *))(*(void *)v10 + 8))(v10);
  }
  uint64_t v11 = self->_tokenizer.__ptr_.__value_;
  self->_tokenizer.__ptr_.__value_ = 0;
  if (v11) {
    (*(void (**)(TextTokenizer *))(*(void *)v11 + 8))(v11);
  }
  uint64_t v12 = self->_dataFactory.__cntrl_;
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v12);
  }
  std::__tree<std::__value_type<std::string,std::vector<std::vector<quasar::LmePackedWord>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::vector<quasar::LmePackedWord>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::vector<quasar::LmePackedWord>>>>>::destroy((uint64_t)&self->_userData.data, (void *)self->_userData.data.__tree_.__pair1_.__value_.__left_);
  fst::SymbolTable::~SymbolTable((fst::SymbolTable *)&self->_userData);
  objc_storeStrong((id *)&self->_language, 0);
}

- (id).cxx_construct
{
}

- (void)initWithConfiguration:withLanguage:withSdapiOverrides:withSdapiConfig:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_1B1A86000, v0, v1, "Can't init factory :(", v2, v3, v4, v5, v6);
}

- (uint64_t)initWithConfiguration:withLanguage:withSdapiOverrides:withSdapiConfig:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

- (uint64_t)initWithConfiguration:language:overrides:textNormalizationModelRoot:sdapiOverrides:emptyVoc:pgVoc:paramsetHolder:isJit:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

- (void)initWithConfiguration:language:overrides:textNormalizationModelRoot:sdapiOverrides:emptyVoc:pgVoc:paramsetHolder:isJit:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_3(&dword_1B1A86000, v1, v2, "Can't init LmeDataFactory: %s", v3, v4, v5, v6, 2u);
}

- (void)initWithConfiguration:language:overrides:textNormalizationModelRoot:sdapiOverrides:emptyVoc:pgVoc:paramsetHolder:isJit:.cold.4()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_1B1A86000, v0, v1, "Can't init LmeDataFactory: (unexpected exception)", v2, v3, v4, v5, v6);
}

- (void)_writeProfileToStream:(void *)a3 .cold.1(std::__shared_weak_count **a1, uint64_t *a2, void **a3, uint64_t a4)
{
  id v7 = *a1;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  uint64_t v8 = *a2;
  *a2 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  std::__tree<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::vector<quasar::LmeDataFactoryBase::Word>>>>>::destroy(a4, *a3);
}

- (uint64_t)_writeProfileToStream:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

- (uint64_t)createInlineLmeUserDataForContextData:(uint64_t)a1 speechProfile:(uint64_t *)a2 .cold.1(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  uint64_t result = *a2;
  *a2 = 0;
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
  }
  return result;
}

@end